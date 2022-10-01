
Partial Class pages_PageOrderDetails
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNo
    Implements ICustomParams_CallHSDate
    Implements ICustomParams_SalesPage
    Implements ICustomParams_SalesFilter
    Implements ICustomParams_SalesOrderNo
    Implements ICustomParams_IsVoided                  ' Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions

    Dim m_CustomerNo As String
    Dim m_CallHSDate As String
    Dim m_SalesPage As String
    Dim m_SalesFilter As String
    Dim m_SalesOrderNo As String
    Dim m_IsVoided As String                            ' Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions

    Public Property CustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_CustomerNo
        End Get
        Set(ByVal value As String)
            m_CustomerNo = value
            DivCustomerNo_OrderDetails.InnerText = m_CustomerNo
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

    Public Property SalesPage As String Implements ICustomParams_SalesPage.SalesPage
        Get
            Return m_SalesPage
        End Get
        Set(ByVal value As String)
            m_SalesPage = value
            DivSalesPage.InnerText = m_SalesPage
        End Set
    End Property

    Public Property SalesOrderNo As String Implements ICustomParams_SalesOrderNo.SalesOrderNo
        Get
            Return m_SalesOrderNo
        End Get
        Set(ByVal value As String)
            m_SalesOrderNo = value
            DivOrderNo.InnerText = m_SalesOrderNo
        End Set
    End Property

    Public Property SalesFilter As String Implements ICustomParams_SalesFilter.SalesFilter
        Get
            Return m_SalesFilter
        End Get
        Set(ByVal value As String)
            m_SalesFilter = value
            DivFilter.InnerText = m_SalesFilter
        End Set
    End Property
    ' Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
    Public Property IsVoided As String Implements ICustomParams_IsVoided.IsVoided
        Get
            Return m_IsVoided
        End Get
        Set(value As String)
            m_IsVoided = value
            DivIsVoidedOrder.InnerText = m_IsVoided
        End Set
    End Property

    Private Sub pages_PageOrderDetails_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            DivSalesManPermissions.InnerText = LoginUserDetails.ORDER

        End If
    End Sub
End Class
