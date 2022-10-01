
Partial Class pages_PageManualPO
    Inherits System.Web.UI.UserControl
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim LoginUserDetails As New User
        '=========================================================
        'Commentd by Ven::17-12-2015::For Admin User Profile
        '=========================================================
        'If Not (Session("IsAdmin") Is Nothing) Then
        '    If (Session("IsAdmin") = True) Then
        '        LoggedUserId.InnerText = ""
        '    ElseIf (Session("IsAdmin") = False) Then
        '        LoginUserDetails = Session("LoginUserDetails")
        '        LoggedUserId.InnerText = LoginUserDetails.ID
        '        DivAgencyCode.InnerText = LoginUserDetails.AgencyCode
        '        'txtmanualpoToemails.Value = LoginUserDetails.Email
        '    End If
        'Else
        If (Not Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = Session("LoginUserDetails")
                LoggedUserId.InnerText = LoginUserDetails.ID
            End If

            Dim UserFeatures As List(Of Feature) = Session("LoginUserFeatures")
        DivShipmentStatus.InnerText = "true"
        For Each i In UserFeatures
            If i.Name.ToUpper = "SCANNING VALIDATION" And i.Value = True Then
                DivShipmentStatus.InnerText = ""
            End If
        Next

        'If (ConfigurationManager.AppSettings("ShipmentValidation") = "true") Then
        '    DivShipmentColumnsStatus.InnerText = ""
        'Else
        '    DivShipmentColumnsStatus.InnerText = "true"
        'End If
    End Sub
End Class
