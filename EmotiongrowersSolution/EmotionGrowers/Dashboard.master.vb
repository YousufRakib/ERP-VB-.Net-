
Partial Class Dashboard
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim LoginUserDetails As New User
        If (Not Session("LoginAdminDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginAdminDetails")
            divLoginUserName.InnerText = LoginUserDetails.Name
            'divUsers.InnerText = LoginUserDetails.AdminUsers
            'divEmail.InnerText = LoginUserDetails.AdminEmails
            'divAdmin.InnerText = LoginUserDetails.Admin
            divLoginUserEmail.InnerText = LoginUserDetails.Email
            divUserID.InnerText = LoginUserDetails.ID
            divUserRP.InnerText = LoginUserDetails.RP
            divIsAdmin.InnerText = LoginUserDetails.Admin
        ElseIf (Not Session("IsAdmin") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            divLoginUserName.InnerText = LoginUserDetails.Name
            'divUsers.InnerText = LoginUserDetails.AdminUsers
            'divEmail.InnerText = LoginUserDetails.AdminEmails
            'divAdmin.InnerText = LoginUserDetails.Admin
            divLoginUserEmail.InnerText = LoginUserDetails.Email
            divUserID.InnerText = LoginUserDetails.ID
            divUserRP.InnerText = LoginUserDetails.RP
            divIsAdmin.InnerText = LoginUserDetails.Admin
        Else
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class

