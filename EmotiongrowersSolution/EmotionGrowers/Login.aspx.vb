
Partial Class Login
    Inherits System.Web.UI.Page

    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session.Abandon()
        txtUsername.Text = ""
        txtUsername.Focus()
    End Sub
End Class
