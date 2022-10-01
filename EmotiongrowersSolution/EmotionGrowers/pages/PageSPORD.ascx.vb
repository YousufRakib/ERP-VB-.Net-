
Partial Class pages_PageSPORD

    Inherits System.Web.UI.UserControl

    Implements ICustomParams_CustomerNo

    Dim m_CurrentCustomerNo As String

    Public Property CurrentCustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_CurrentCustomerNo
        End Get
        Set(ByVal value As String)
            m_CurrentCustomerNo = value
            DivCurrentCustomer_SPORD.InnerText = m_CurrentCustomerNo
        End Set
    End Property
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim UserFeatures As List(Of Feature) = Session("LoginUserFeatures")

        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            LoggedInUserType_PageSPORD.InnerText = LoginUserDetails.UserType.ToLower()
            LoggedInUserIsAdmin_PageSPORD.InnerText = IIf(LoginUserDetails.Admin, "1", "0")
        End If

    End Sub
End Class
