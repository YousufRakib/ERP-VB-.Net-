
Partial Class pages_PageAccounts
    Inherits System.Web.UI.UserControl

    Private Sub pages_PageAccounts_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            LoggedInUserType_Accounts.InnerText = LoginUserDetails.UserType.ToLower()
        End If

    End Sub
End Class
