Imports System.Data.SqlClient
Imports System.Data


Public Class F_CALLHS
    Public Shared Function SaveCreditLimitsApprovalToCALLHS(ByVal Customer As String, ByVal Note As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()

                Dim User As New User
                If Not HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                    User = HttpContext.Current.Session("LoginUserDetails")
                ElseIf Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing Then
                    User = HttpContext.Current.Session("LoginAdminDetails")
                End If

                Using cmd As New SqlCommand("insert into F_CALLHS (CUSTOMER,DATE,TIME,NOTE,PURCHASE,PERSON) values(@CUSTOMER,@DATE,@TIME,@NOTE,@PURCHASE,@PERSON)", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    cmd.Parameters.AddWithValue("@DATE", Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"), New System.Globalization.CultureInfo("en-US", True)))
                    cmd.Parameters.AddWithValue("@TIME", System.DateTime.Now.ToString("HH:mm:ss"))
                    cmd.Parameters.AddWithValue("@NOTE", Note)
                    cmd.Parameters.AddWithValue("@PURCHASE", "")
                    cmd.Parameters.AddWithValue("@PERSON", If(User.Name.Length < 20, User.Name, User.Name.Substring(0, 20)))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCreditLimitsApprovalToCALLHS")
            Throw ex
        End Try
    End Function
End Class
