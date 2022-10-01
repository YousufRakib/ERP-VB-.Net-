
Partial Class pages_PagePOHistory
    Inherits System.Web.UI.UserControl
    Implements IPOParams_PONumber

    Dim m_PONumber As String

    Public Property PONumber As String Implements IPOParams_PONumber.PONumber
        Get
            Return m_PONumber
        End Get
        Set(ByVal value As String)
            m_PONumber = value
            DivPONumber.InnerText = m_PONumber
        End Set
    End Property
End Class
