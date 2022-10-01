
Partial Class pages_PageHistory
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNo
    Implements ICustomParams_CallHSDate
    Implements ICustomParams_SalesOrderNo

    Dim m_CustomerNo As String
    Dim m_CallHSDate As String
    Dim m_SalesOrderNo As String

    Public Property SalesOrderNo As String Implements ICustomParams_SalesOrderNo.SalesOrderNo
        Get
            Return m_SalesOrderNo
        End Get
        Set(ByVal value As String)
            m_SalesOrderNo = value
            DivOrderNo.InnerText = m_SalesOrderNo
        End Set
    End Property

    Public Property CallHSDate As String Implements ICustomParams_CallHSDate.CallHSDate
        Get
            Return m_CallHSDate
        End Get
        Set(ByVal value As String)
            m_CallHSDate = value
            DivCallHsDate.InnerText = m_CallHSDate
        End Set
    End Property

    Public Property CustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_CustomerNo
        End Get
        Set(ByVal value As String)
            m_CustomerNo = value
            DivCustomerNo.InnerText = m_CustomerNo
        End Set
    End Property

End Class
