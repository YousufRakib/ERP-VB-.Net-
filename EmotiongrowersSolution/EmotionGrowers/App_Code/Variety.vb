Imports System.Data.SqlClient
Imports System.Data


Namespace DAO
    Public Class Variety
        Public Shared Function LoadVariety(ByVal Category As String) As List(Of BO.Variety)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim UList As New List(Of BO.Variety)
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim qry As String = ""

                    If Category <> "" Then
                        qry = "SELECT ID,Variety FROM F_Variet where Category='" + Category + "' order by Variety asc"
                    Else
                        qry = "SELECT ID,Variety FROM F_Variet order by Variety asc"
                    End If

                    Using cmd As New SqlCommand(qry, con)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Variety
                            u.ID = row("ID")
                            u.Variety = IIf(row("Variety") Is DBNull.Value, "", row("Variety"))
                            UList.Add(u)
                        Next
                    End Using
                End Using
                Return UList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in LoadVariety")
                Return Nothing
            End Try
        End Function

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Function GetVarietiesListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer) As List(Of BO.Variety)

            Dim uList As New List(Of BO.Variety)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetVarieties]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Variety()
                            u.ID = row("ID")
                            u.Category = If(row("Category") Is DBNull.Value, "", row("Category"))
                            u.Variety = If(row("Variety") Is DBNull.Value, "", row("Variety"))
                            u.Code = If(row("Code") Is DBNull.Value, "", row("Code"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetVarietiesListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function AddEditDetleteSelectVarieties(ByVal ID As String, ByVal Category As String, ByVal Variety As String, ByVal ShortCode As String, ByVal Mode As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim VarietiesScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_VARIET", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@Category", Category)
                Cmd.Parameters.AddWithValue("@Variety", Variety)
                Cmd.Parameters.AddWithValue("@Code", ShortCode)
                Cmd.Parameters.AddWithValue("@Mode", Mode)
                VarietiesScopeID = Cmd.ExecuteScalar()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "AddEditDetleteSelectVarieties", IIf(ID = "0", "Added a new Variety <b>" + Variety + "</b>", "Updated a Variety <b>" + Variety + "</b>"), VarietiesScopeID.ToString())
                End If
                Return VarietiesScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in AddEditDetleteSelectVarieties")
                End If
                Return ex.Message()
            End Try
        End Function

        Public Shared Function GetVarietiesByID(ByVal ID As String) As BO.Variety
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim u As New BO.Variety()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SELECT * FROM F_VARIET WHERE ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            u.ID = row("ID")
                            u.Category = If(row("Category") Is DBNull.Value, "", row("Category"))
                            u.Variety = If(row("Variety") Is DBNull.Value, "", row("Variety"))
                            u.Code = If(row("Code") Is DBNull.Value, "", row("Code"))
                        Next
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetVarietiesByID")
                Throw ex
            End Try
        End Function

    End Class
End Namespace

Namespace BO
    Public Class Variety
        Private _ID As String
        Public Property ID() As String
            Get
                Return _ID
            End Get
            Set(ByVal value As String)
                _ID = value
            End Set
        End Property

        Private _Category As String
        Public Property Category() As String
            Get
                Return _Category
            End Get
            Set(ByVal value As String)
                _Category = value
            End Set
        End Property

        Private _Variety As String
        Public Property Variety() As String
            Get
                Return _Variety
            End Get
            Set(ByVal value As String)
                _Variety = value
            End Set
        End Property

        Private _Code As String
        Public Property Code() As String
            Get
                Return _Code
            End Get
            Set(ByVal value As String)
                _Code = value
            End Set
        End Property

        Private _Photo As String
        Public Property Photo() As String
            Get
                Return _Photo
            End Get
            Set(ByVal value As String)
                _Photo = value
            End Set
        End Property

    End Class
End Namespace
