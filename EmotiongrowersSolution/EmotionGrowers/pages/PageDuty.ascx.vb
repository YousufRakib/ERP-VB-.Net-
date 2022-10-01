
Partial Class pages_PageDuty
    Inherits System.Web.UI.UserControl

    Implements ICustomParams_DutyTable
    Dim m_DutyTable As String

    Public Property DutyTable As String Implements ICustomParams_DutyTable.DutyTable
        Get
            Return m_DutyTable
        End Get
        Set(ByVal value As String)
            m_DutyTable = value
            divDutyTable.InnerText = m_DutyTable
        End Set
    End Property

End Class
