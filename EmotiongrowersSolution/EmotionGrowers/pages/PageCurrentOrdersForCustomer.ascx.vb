
Partial Class pages_PageCurrentOrdersForCustomer
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNo

    Dim m_CurrentCustomerNo As String

    Public Property CurrentCustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_CurrentCustomerNo
        End Get
        Set(ByVal value As String)
            m_CurrentCustomerNo = value
            DivCurrentCustomer_CurrentOrders.InnerText = m_CurrentCustomerNo
        End Set
    End Property

End Class
