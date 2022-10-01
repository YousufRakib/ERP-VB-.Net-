
Partial Class pages_PageADDMISC
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNo
    Implements ICustomParams_SalesOrderNo
    Implements ICustomParams_OrderDetailID
    Implements ICustomParams_CalledFromVET
    Dim m_CustomerNo As String
    Dim m_SalesOrderNo As String
    Dim m_OrderDetailID As String
    Dim m_CalledFromVET As String

    Public Property CustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_CustomerNo
        End Get
        Set(ByVal value As String)
            m_CustomerNo = value
            DivCustomerNo_MISC.InnerText = m_CustomerNo
        End Set
    End Property


    Public Property SalesOrderNo As String Implements ICustomParams_SalesOrderNo.SalesOrderNo
        Get
            Return m_SalesOrderNo
        End Get
        Set(ByVal value As String)
            m_SalesOrderNo = value
            DivOrderNo_MISC.InnerText = m_SalesOrderNo
        End Set
    End Property

    Public Property OrderDetailID As String Implements ICustomParams_OrderDetailID.OrderDetailID
        Get
            Return m_OrderDetailID
        End Get
        Set(ByVal value As String)
            m_OrderDetailID = value
            DivOrderDetailID_MISC.InnerText = m_OrderDetailID
        End Set
    End Property


    Public Property CalledFromVET As String Implements ICustomParams_CalledFromVET.CalledFromVET
        Get
            Return m_CalledFromVET
        End Get
        Set(ByVal value As String)
            m_CalledFromVET = value
            DivCalledFromVET.InnerText = m_CalledFromVET
        End Set
    End Property


End Class
