
Partial Class pages_PageReports
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim UserFeatures As List(Of Feature) = Session("LoginUserFeatures")

        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            LoggedInUserType_PageSPORD.InnerText = LoginUserDetails.UserType.ToLower()
            LoggedInUserIsAdmin_PageSPORD.InnerText = IIf(LoginUserDetails.Admin, "1", "0")
            LoggedInUserID.InnerText = LoginUserDetails.ID
        End If
    End Sub
End Class
