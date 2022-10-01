Imports System.IO
Imports System.Data
Partial Class pages_PageSetups
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim UserFeatures As List(Of Feature) = Session("LoginUserFeatures")



        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            LoggedInUserID.InnerText = LoginUserDetails.ID
            LoggedInUserType.InnerText = LoginUserDetails.UserType.ToLower()
            If LoggedInUserType.InnerText.ToLower() = "admin" Then
                LoggedInIsSetupsFile.InnerText = "True"
                LoggedInIsSetupsReports.InnerText = "True"
                LoggedInIsSetupsAdmin.InnerText = "True"
                LoggedInIsSetupsImport.InnerText = "True"
            Else
                LoggedInIsSetupsFile.InnerText = LoginUserDetails.IsSetupsFile
                LoggedInIsSetupsReports.InnerText = LoginUserDetails.IsSetupsReports
                LoggedInIsSetupsAdmin.InnerText = LoginUserDetails.IsSetupsAdmin
                LoggedInIsSetupsImport.InnerText = LoginUserDetails.IsSetupsImport
            End If

            If LoginUserDetails.UserType = "Customer" Then

            End If
        End If

    End Sub

End Class
