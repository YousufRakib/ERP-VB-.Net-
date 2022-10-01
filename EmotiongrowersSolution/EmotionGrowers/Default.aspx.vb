
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim LoginUserDetails As New User
        If (Session("LoginAdminDetails") Is Nothing And Session("IsAdmin") Is Nothing) Then
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class
