
Partial Class pages_PageOrderAll
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNo

    Dim m_CustomerNo As String
    Public Property CustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_CustomerNo
        End Get
        Set(ByVal value As String)
            m_CustomerNo = value
            DivCustomerNo_OrderSave.InnerText = m_CustomerNo
        End Set
    End Property
End Class
