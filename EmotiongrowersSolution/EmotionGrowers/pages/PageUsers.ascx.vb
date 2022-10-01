
Partial Class pages_Pagecargo
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim LoginUserDetails As New User
        If Not Session("LoginUserDetails") Is Nothing Then
            LoginUserDetails = Session("LoginUserDetails")
            divLoggedInUserEmail.InnerHtml = LoginUserDetails.Email
        ElseIf Not Session("LoginAdminDetails") Is Nothing Then
            LoginUserDetails = Session("LoginAdminDetails")
            divLoggedInUserEmail.InnerHtml = LoginUserDetails.Email
        End If

    End Sub
End Class
