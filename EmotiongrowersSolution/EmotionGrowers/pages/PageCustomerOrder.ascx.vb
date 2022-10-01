
Partial Class pages_PageCustomerOrder
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim UserFeatures As List(Of Feature) = Session("LoginUserFeatures")



        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            LoggedInUserID.InnerText = LoginUserDetails.ID
            LoggedInUserType.InnerText = LoginUserDetails.UserType.ToLower()
            If LoginUserDetails.UserType = "Customer" Then

            End If
        End If

    End Sub

End Class
