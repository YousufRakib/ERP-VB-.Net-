Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class F_Emails
    Private _TotalRows As Integer
    Public Property TotalRows() As Integer
        Get
            Return _TotalRows
        End Get
        Set(ByVal value As Integer)
            _TotalRows = value
        End Set

    End Property

    Public Shared Function GetEmailsByType(Type As String) As String
        Try
            Dim Emails As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()

                Using EmailCmd As New SqlCommand("spGetEmailsByType", con)
                    EmailCmd.Parameters.AddWithValue("@Type", Type)
                    EmailCmd.CommandType = CommandType.StoredProcedure
                    Dim EmailReader As SqlDataReader = EmailCmd.ExecuteReader()
                    If EmailReader.HasRows Then
                        EmailReader.Read()
                        Emails = EmailReader("Emails").ToString().Trim()
                    End If
                    EmailReader.Close()
                    Return Emails
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetEmailsByType")
            Throw ex
        End Try
    End Function

    Public Function GetF_EmailsListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer) As List(Of BO.F_Emails)

        Dim uList As New List(Of BO.F_Emails)()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetEmails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                    cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                    cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.F_Emails()
                        u.ID = row("SQLID")
                        u.TYPE = row("TYPE")
                        u.EMAILS = row("EMAILS")
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

    Public Shared Function InsertF_Emails(ByVal Type As String, ByVal Email As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim F_EmailsScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_EmailsInsert", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure

            Cmd.Parameters.AddWithValue("@Type", Type)
            Cmd.Parameters.AddWithValue("@Email", Email)
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
                Logs.Savelog(UserDetails.ID, "Users", "InsertEmails", "Added a new Emails <b>" + Type + "</b>", F_EmailsScopeID.ToString())
            End If
            Return F_EmailsScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in InsertEmails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function UpdateF_Emails(ByVal ID As Integer, ByVal Type As String, ByVal Email As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim F_EmailsScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_EmailsUpdate", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@ID", ID)
            Cmd.Parameters.AddWithValue("@Type", Type)
            Cmd.Parameters.AddWithValue("@Email", Email)
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
                Logs.Savelog(UserDetails.ID, "Users", "UpdateF_Emails", "Updated a F_Emails <b>" + ID + "</b>", F_EmailsScopeID.ToString())
            End If
            Return F_EmailsScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in UpdateF_Emails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function DeleteF_EmailsbyID(ByVal ID As String) As String
        Try
            Dim u As New Flower
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("delete from F_Emails where SQLID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteF_EmailsbyID")
            Return "error"
        End Try
    End Function

    Public Shared Function GetF_EmailsByID(ByVal ID As String) As List(Of BO.F_Emails)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim TermsList As New List(Of BO.F_Emails)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sqlQuery As String = ""
                sqlQuery = "SELECT * FROM F_Emails WHERE SQLID=" + ID + " ORDER BY TYPE"
                Using cmd As New SqlCommand(sqlQuery, con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.F_Emails()
                        u.ID = row("SQLID")
                        u.TYPE = row("TYPE")
                        u.EMAILS = row("EMAILS")
                        TermsList.Add(u)
                    Next
                End Using
            End Using
            Return TermsList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetF_EmailsByID")
            Throw ex
        End Try
    End Function

End Class

Namespace BO
    Public Class F_Emails

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

        Private _EMAILS As String
        Public Property EMAILS() As String
            Get
                Return _EMAILS
            End Get
            Set(ByVal value As String)
                _EMAILS = value
            End Set
        End Property

    End Class
End Namespace


