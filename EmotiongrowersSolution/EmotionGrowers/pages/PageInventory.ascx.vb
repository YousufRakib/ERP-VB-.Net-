
Partial Class pages_PageInventory
    Inherits System.Web.UI.UserControl
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            DivForInventoryLockRelease.InnerText = LoginUserDetails.ORDER
            DivLoggedInUserType.InnerText = LoginUserDetails.UserType
        End If
    End Sub
End Class
