
Partial Class DashboardUser
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            divLoginUserName.InnerText = LoginUserDetails.Name
            divLoginUserEmail.InnerText = LoginUserDetails.Email
            divUserID.InnerText = LoginUserDetails.ID
            divUserRP.InnerText = LoginUserDetails.RP
            divIsAdmin.InnerText = LoginUserDetails.Admin
            divUserType.InnerText = LoginUserDetails.UserType
        Else
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class

