
Partial Class pages_PageConfirmedPOs
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
        '        LoggedUserType.InnerText = LoginUserDetails.UserType
        '        DivConfirmed.InnerText = LoginUserDetails.ConfirmedPOs
        '        DivPending.InnerText = LoginUserDetails.PendingPOs
        '        DivAvailability.InnerText = LoginUserDetails.Availability
        '        DivCredits.InnerText = LoginUserDetails.Credits
        '        DivUsers.InnerText = LoginUserDetails.Users
        '    End If
        'Else
        If (Not Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = Session("LoginUserDetails")
                LoggedUserId.InnerText = LoginUserDetails.ID
                LoggedUserType.InnerText = LoginUserDetails.UserType
                DivConfirmed.InnerText = LoginUserDetails.ConfirmedPOs
                DivPending.InnerText = LoginUserDetails.PendingPOs
                DivAvailability.InnerText = LoginUserDetails.Availability
                DivCredits.InnerText = LoginUserDetails.Credits
                DivUsers.InnerText = LoginUserDetails.Users
            End If
    End Sub
End Class
