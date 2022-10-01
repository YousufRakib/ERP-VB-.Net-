
Partial Class pages_PageLookupBox
    Inherits System.Web.UI.UserControl

    Implements ICustomParams_LookupOrder
    Implements ICustomParams_LookupBoxnum
    Implements ICustomParams_LookupFarm

    Dim m_LookupOrder As String

    Dim m_LookupBoxnum As String
    Dim m_LookupFarm As String

    Public Property LookupOrder As String Implements ICustomParams_LookupOrder.Order
        Get
            Return m_LookupOrder
        End Get
        Set(ByVal value As String)
            m_LookupOrder = value
            divLookupOrder.InnerText = m_LookupOrder
        End Set
    End Property

    Public Property LookupBoxnum As String Implements ICustomParams_LookupBoxnum.Boxnum
        Get
            Return m_LookupBoxnum
        End Get
        Set(ByVal value As String)
            m_LookupBoxnum = value
            divLookupBoxnum.InnerText = m_LookupBoxnum
        End Set
    End Property

    Public Property LookupFarm As String Implements ICustomParams_LookupFarm.Farm
        Get
            Return m_LookupFarm
        End Get
        Set(ByVal value As String)
            m_LookupFarm = value
            divLookupFarm.InnerText = m_LookupFarm
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            DivForInventoryLockRelease.InnerText = LoginUserDetails.ORDER
            DivLoggedInUserType.InnerText = LoginUserDetails.UserType
        End If
    End Sub
End Class
