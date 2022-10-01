Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO



Namespace DAO


    Public Class Lock

        Public Shared Function InsertLock(ByVal LockRecord As String, ByVal Page As String, ByVal Functionality As String) As String
            Try

                Dim UserId As Integer = 0
                Dim Username As String = ""

                Dim User As New User
                If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                    User = System.Web.HttpContext.Current.Session("LoginUserDetails")
                Else
                    Return "Logout"
                End If
                UserId = User.ID
                Username = User.UserName
                Dim IsExist As String = ""
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SpInsertLock_temp", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@LockRecord", LockRecord)
                        cmd.Parameters.AddWithValue("@Username", Username)
                        cmd.Parameters.AddWithValue("@UserID", UserId)
                        cmd.Parameters.AddWithValue("@Page", Page)
                        cmd.Parameters.AddWithValue("@Functionality", Functionality)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        IsExist = Convert.ToString(dt(0)(0)).Trim()
                    End Using
                End Using
                Return IsExist
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error In InsertLock")
                Return "error"
            End Try
        End Function


        Public Shared Function DeleteLock(ByVal LockRecord As String, ByVal Page As String, ByVal Functionality As String) As String
            Try
                Dim rows As String = ""
                Dim UserId As Integer = 0
                Dim Username As String = ""

                Dim User As New User
                If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                    User = System.Web.HttpContext.Current.Session("LoginUserDetails")
                Else
                    Return "Logout"
                End If
                UserId = User.ID
                Username = User.UserName
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SpDeleteLock_temp", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@LockRecord", LockRecord)
                        cmd.Parameters.AddWithValue("@Page", Page)
                        cmd.Parameters.AddWithValue("@Functionality", Functionality)
                        cmd.Parameters.AddWithValue("@UserID", UserId)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        rows = Convert.ToString(dt(0)(0)).Trim()
                    End Using
                End Using
                Return rows
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error In DeleteLock")
                Return "error"
            End Try
        End Function

    End Class

End Namespace

