
Partial Class pages_PageCarrierCode
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNo
    Implements ICustomParams_ShiptoID

    Dim m_CustomerNo As String
    Dim m_ShiptoID As String

    Public Property CustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_CustomerNo
        End Get
        Set(ByVal value As String)
            m_CustomerNo = value
            DivCustomerNo.InnerText = m_CustomerNo
        End Set
    End Property


    Public Property ShiptoID As String Implements ICustomParams_ShiptoID.ShiptoID
        Get
            Return m_ShiptoID
        End Get
        Set(ByVal value As String)
            m_ShiptoID = value
            DivShiptoID.InnerText = m_ShiptoID
        End Set
    End Property

End Class
