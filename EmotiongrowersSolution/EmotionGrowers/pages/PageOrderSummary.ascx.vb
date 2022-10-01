
Partial Class pages_PageOrderSummary
    Inherits System.Web.UI.UserControl

    Implements ICustomParams_SalesSummaryFilter

    Dim m_SalesSummaryFilter As String

    Public Property SalesSummaryFilter As String Implements ICustomParams_SalesSummaryFilter.SalesSummaryFilter
        Get
            Return m_SalesSummaryFilter
        End Get
        Set(ByVal value As String)
            m_SalesSummaryFilter = value
            DivFilterSummary.InnerText = m_SalesSummaryFilter
        End Set
    End Property
End Class

