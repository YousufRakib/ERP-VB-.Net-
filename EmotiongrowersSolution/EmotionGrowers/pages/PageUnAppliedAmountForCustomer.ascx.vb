
Partial Class pages_PageUnAppliedAmountForCustomer
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNumberUnappliedAmount

    Dim m_CustomerNo As String

    Public Property CustomerNo As String Implements ICustomParams_CustomerNumberUnappliedAmount.CustomerNo
        Get
            Return m_CustomerNo
        End Get
        Set(ByVal value As String)
            m_CustomerNo = value
            divCustomerNo_UnAppliedAmount.InnerText = m_CustomerNo
        End Set
    End Property
End Class
