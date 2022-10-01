Imports System.Data.SqlClient
Imports System.Data

Public Class CrCode
    Private _TotalRows As Integer
    Public Property TotalRows() As Integer
        Get
            Return _TotalRows
        End Get
        Set(ByVal value As Integer)
            _TotalRows = value
        End Set

    End Property

    Public Function GetCreditCodeListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer) As List(Of BO.CrCode)

        Dim uList As New List(Of BO.CrCode)()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetCreditCode]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                    cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                    cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.CrCode()
                        u.ID = row("ID")
                        u.CODE = row("CODE")
                        u.REASON = row("REASON")
                        u.CHARGEGROW = row("CHARGEGROW")
                        u.RETURNINV = If(row("RETURNINV") Is DBNull.Value, "", row("RETURNINV"))
                        u.GLACCOUNT = If(row("GLACCOUNT") Is DBNull.Value, "", row("GLACCOUNT"))
                        uList.Add(u)
                    Next
                    Me.TotalRows = ds.Tables(1).Rows(0)(0)
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditCodeListForFgrd")
            Return Nothing
        End Try
        Return uList
    End Function

    Public Shared Function InsertCreditCode(ByVal Code As String, ByVal Reason As String, ByVal ChargeRow As String, ByVal ReturnInv As String,
    ByVal GlaAccount As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim CreditCodeScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_CRCODEInsert", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure

            Cmd.Parameters.AddWithValue("@Code", Code)
            Cmd.Parameters.AddWithValue("@Reason", Reason)
            Cmd.Parameters.AddWithValue("@ChargeRow", ChargeRow)
            Cmd.Parameters.AddWithValue("@ReturnInv", ReturnInv)
            Cmd.Parameters.AddWithValue("@GlaAccount", GlaAccount)
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "InsertCreditCode", "Added a new Credit Code <b>" + Code + "</b>", CreditCodeScopeID.ToString())
            End If
            Return CreditCodeScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in InsertCreditCode")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function GetCreditCodeByID(ByVal ID As String) As List(Of BO.CrCode)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim TermsList As New List(Of BO.CrCode)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sqlQuery As String = ""
                sqlQuery = "SELECT ID, Code,Reason,CHARGEGROW,RETURNINV,GLACCOUNT FROM F_CRCODE WHERE ID=" + ID + " ORDER BY Code"
                Using cmd As New SqlCommand(sqlQuery, con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.CrCode()
                        u.ID = row("ID")
                        u.CODE = row("CODE")
                        u.REASON = row("REASON")
                        u.CHARGEGROW = row("CHARGEGROW")
                        u.RETURNINV = If(row("RETURNINV") Is DBNull.Value, "", row("RETURNINV"))
                        u.GLACCOUNT = If(row("GLACCOUNT") Is DBNull.Value, "", row("GLACCOUNT"))
                        TermsList.Add(u)
                    Next
                End Using
            End Using
            Return TermsList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditCodeByID")
            Throw ex
        End Try
    End Function

    Public Shared Function UpdateCreditCode(ByVal ID As Integer, ByVal Code As String, ByVal Reason As String, ByVal ChargeRow As String, ByVal ReturnInv As String,
    ByVal GlaAccount As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim CreditCodeScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_CRCODEUpdate", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@ID", ID)
            Cmd.Parameters.AddWithValue("@Code", Code)
            Cmd.Parameters.AddWithValue("@Reason", Reason)
            Cmd.Parameters.AddWithValue("@ChargeRow", ChargeRow)
            Cmd.Parameters.AddWithValue("@ReturnInv", ReturnInv)
            Cmd.Parameters.AddWithValue("@GlaAccount", GlaAccount)
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "UpdateCreditCode", "Updated a Credit Code <b>" + Code + "</b>", CreditCodeScopeID.ToString())
            End If
            Return CreditCodeScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in UpdateCreditCode")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function DeleteCreditCodebyID(ByVal ID As String) As String
        Try
            Dim u As New Flower
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("delete from F_CRCODE where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteCreditCodebyID")
            Return "error"
        End Try
    End Function

End Class

Namespace BO
    Public Class CrCode

        Private _ID As Integer
        Public Property ID As Integer
            Get
                Return _ID
            End Get
            Set(value As Integer)
                _ID = value
            End Set
        End Property

        Private _CODE As String
        Public Property CODE() As String
            Get
                Return _CODE
            End Get
            Set(ByVal value As String)
                _CODE = value
            End Set
        End Property

        Private _REASON As String
        Public Property REASON() As String
            Get
                Return _REASON
            End Get
            Set(ByVal value As String)
                _REASON = value
            End Set
        End Property

        Private _CHARGEGROW As String
        Public Property CHARGEGROW() As String
            Get
                Return _CHARGEGROW
            End Get
            Set(ByVal value As String)
                _CHARGEGROW = value
            End Set
        End Property

        Private _RETURNINV As String
        Public Property RETURNINV() As String
            Get
                Return _RETURNINV
            End Get
            Set(ByVal value As String)
                _RETURNINV = value
            End Set
        End Property

        Private _GLACCOUNT As String
        Public Property GLACCOUNT() As String
            Get
                Return _GLACCOUNT
            End Get
            Set(ByVal value As String)
                _GLACCOUNT = value
            End Set
        End Property
    End Class
End Namespace

