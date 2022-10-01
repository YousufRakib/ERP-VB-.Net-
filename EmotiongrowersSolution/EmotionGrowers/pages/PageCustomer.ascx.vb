
Partial Class pages_PageCustomer
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNo


    Dim m_CustomerNo As String

    Public Property CustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_CustomerNo
        End Get
        Set(ByVal value As String)
            m_CustomerNo = value
            DivCustomerNo.InnerText = m_CustomerNo
        End Set
    End Property

    Private Sub pages_PageCustomer_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            LoggedInUserType_Customermaintenance.InnerText = LoginUserDetails.UserType.ToLower()
        End If

    End Sub

End Class
