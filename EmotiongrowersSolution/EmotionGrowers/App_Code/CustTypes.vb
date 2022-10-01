Imports System.Data.SqlClient
Imports System.Data


Namespace DAO
    Public Class CustTypes

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Function GetCustTypesListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer) As List(Of BO.CustTypes)

            Dim uList As New List(Of BO.CustTypes)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetCustTypes]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.CustTypes()
                            u.ID = row("ID")
                            u.TYPE = row("TYPE")
                            u.NAME = row("NAME")
                            u.PRICELEVEL = If(row("PRICELEVEL") Is DBNull.Value, "", row("PRICELEVEL"))
                            u.FOB = If(row("FOB") Is DBNull.Value, "", row("FOB"))
                            u.ADA = If(row("ADA") Is DBNull.Value, "", row("ADA"))
                            u.ADAROSES = If(row("ADAROSES") Is DBNull.Value, "", row("ADAROSES"))
                            u.ITIMIZE = If(row("ITIMIZE") Is DBNull.Value, "", row("ITIMIZE"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCustTypesListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function GetCustTypesDetailByID(ByVal ID As String) As List(Of BO.CustTypes)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim TermsList As New List(Of BO.CustTypes)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim sqlQuery As String = ""
                    sqlQuery = "SELECT ID,TYPE,NAME,PRICELEVEL,FOB,ADA,ADAROSES,ITIMIZE FROM F_CTYPES WHERE ID=" + ID + " ORDER BY TYPE"
                    Using cmd As New SqlCommand(sqlQuery, con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.CustTypes()
                            u.ID = row("ID")
                            u.TYPE = row("TYPE")
                            u.NAME = row("NAME")
                            u.PRICELEVEL = If(row("PRICELEVEL") Is DBNull.Value, "", row("PRICELEVEL"))
                            u.FOB = If(row("FOB") Is DBNull.Value, "", row("FOB"))
                            u.ADA = If(row("ADA") Is DBNull.Value, "", row("ADA"))
                            u.ADAROSES = If(row("ADAROSES") Is DBNull.Value, "", row("ADAROSES"))
                            u.ITIMIZE = If(row("ITIMIZE") Is DBNull.Value, "", row("ITIMIZE"))
                            TermsList.Add(u)
                        Next
                    End Using
                End Using
                Return TermsList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCustTypesDetailsForFgrd")
                Throw ex
            End Try
        End Function

        Public Shared Function InsertCustTypes(ByVal CustTypesType As String, ByVal CustTypesName As String, ByVal PriceLevel As String, ByVal Fob As String,
    ByVal Itimize As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim CustTypesScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_CTYPESInsert", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure

                Cmd.Parameters.AddWithValue("@CustTypesType", CustTypesType)
                Cmd.Parameters.AddWithValue("@CustTypesName", CustTypesName)
                Cmd.Parameters.AddWithValue("@PriceLevel", PriceLevel)
                Cmd.Parameters.AddWithValue("@Fob", Fob)
                Cmd.Parameters.AddWithValue("@Itimize", Itimize)
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
                    Logs.Savelog(UserDetails.ID, "Users", "InsertCustTypes", "Added a new Customer Type <b>" + CustTypesName + "</b>", CustTypesScopeID.ToString())
                End If
                Return CustTypesScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertCustTypes")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function UpdateCustTypes(ByVal ID As Integer, ByVal CustTypesType As String, ByVal CustTypesName As String, ByVal PriceLevel As String, ByVal Fob As String,
    ByVal Itimize As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim CustTypesScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_CTYPESUpdate", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@CustTypesType", CustTypesType)
                Cmd.Parameters.AddWithValue("@CustTypesName", CustTypesName)
                Cmd.Parameters.AddWithValue("@PriceLevel", PriceLevel)
                Cmd.Parameters.AddWithValue("@Fob", Fob)
                Cmd.Parameters.AddWithValue("@Itimize", Itimize)
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
                    Logs.Savelog(UserDetails.ID, "Users", "UpdateCustTypes", "Updated a Customer Type <b>" + CustTypesName + "</b>", CustTypesScopeID.ToString())
                End If
                Return CustTypesScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in UpdateCustTypes")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteCustTypesbyID(ByVal ID As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("delete from  F_CTYPES where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteCustTypesbyID")
                Return "error"
            End Try
        End Function

        Public Shared Function LoadCustomerTypes() As List(Of BO.CustTypes)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of BO.CustTypes)
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("Select [TYPE], NAME From F_CTYPES ORDER BY [TYPE]", con)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.CustTypes
                            u.TYPE = row("TYPE")
                            u.NAME = row("NAME")
                            uList.Add(u)
                        Next
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in LoadCustTypes")
                Return Nothing
            End Try
        End Function

    End Class
End Namespace

Namespace BO
    Public Class CustTypes

        Private _ID As Integer
        Public Property ID As Integer
            Get
                Return _ID
            End Get
            Set(value As Integer)
                _ID = value
            End Set
        End Property

        Private _TYPE As String
        Public Property TYPE() As String
            Get
                Return _TYPE
            End Get
            Set(ByVal value As String)
                _TYPE = value
            End Set
        End Property

        Private _NAME As String
        Public Property NAME() As String
            Get
                Return _NAME
            End Get
            Set(ByVal value As String)
                _NAME = value
            End Set
        End Property

        Private _PRICELEVEL As String
        Public Property PRICELEVEL() As String
            Get
                Return _PRICELEVEL
            End Get
            Set(ByVal value As String)
                _PRICELEVEL = value
            End Set
        End Property

        Private _FOB As String
        Public Property FOB() As String
            Get
                Return _FOB
            End Get
            Set(ByVal value As String)
                _FOB = value
            End Set
        End Property

        Private _ADA As String
        Public Property ADA() As String
            Get
                Return _ADA
            End Get
            Set(ByVal value As String)
                _ADA = value
            End Set
        End Property

        Private _ADAROSES As String
        Public Property ADAROSES() As String
            Get
                Return _ADAROSES
            End Get
            Set(ByVal value As String)
                _ADAROSES = value
            End Set
        End Property

        Private _ITIMIZE As String
        Public Property ITIMIZE() As String
            Get
                Return _ITIMIZE
            End Get
            Set(ByVal value As String)
                _ITIMIZE = value
            End Set
        End Property

    End Class
End Namespace


