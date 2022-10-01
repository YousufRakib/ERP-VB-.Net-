
Partial Class pages_PageGrower
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            If LoginUserDetails.IsGrowerDelete = True Then
                IsGrowerDelete.InnerText = "1"
            Else
                IsGrowerDelete.InnerText = "0"
            End If


        End If

    End Sub
End Class
