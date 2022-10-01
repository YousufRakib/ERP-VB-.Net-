
Partial Class pages_PageSpordTrans
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNo
    Implements ICustomParams_isTransviewForSingleF8
    Implements ICustomParams_SpordSqlIdForTrans
    Implements ICustomParams_isTranscalledbyF8

    Dim m_F8TransCurrentCustNo As String
    Dim m_isTransviewForSingleF8 As Boolean
    Dim m_SpordSqlIdForTrans As String
    Dim m_isTranscalledbyF8 As Boolean
    Public Property CustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_F8TransCurrentCustNo
        End Get
        Set(ByVal value As String)
            m_F8TransCurrentCustNo = value
            DivCurrentCustomer_F8Trans.InnerText = m_F8TransCurrentCustNo
        End Set
    End Property

    Public Property isTransviewForSingleF8 As Boolean Implements ICustomParams_isTransviewForSingleF8.isTransviewForSingleF8
        Get
            Return m_isTransviewForSingleF8
        End Get
        Set(ByVal value As Boolean)
            m_isTransviewForSingleF8 = value
            DivViewTransForSingleF8.InnerText = If(m_isTransviewForSingleF8 = False, "false", "true")
        End Set
    End Property

    Public Property SpordSqlIdForTrans As String Implements ICustomParams_SpordSqlIdForTrans.SpordSqlIdForTrans
        Get
            Return m_SpordSqlIdForTrans
        End Get
        Set(ByVal value As String)
            m_SpordSqlIdForTrans = value
            DivSpordSqlIdForTrans.InnerText = m_SpordSqlIdForTrans
        End Set
    End Property

    Public Property isTranscallesbyF8 As Boolean Implements ICustomParams_isTranscalledbyF8.isTranscalledbyF8
        Get
            Return m_isTranscalledbyF8
        End Get
        Set(ByVal value As Boolean)
            m_isTranscalledbyF8 = value
            DivTransCalledFromF8.InnerText = If(m_isTranscalledbyF8 = False, "false", "true")
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim UserFeatures As List(Of Feature) = Session("LoginUserFeatures")
        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            LoggedInUserType_PageF8Trans.InnerText = LoginUserDetails.UserType.ToLower()
            LoggedInUserIsAdmin_PageF8Trans.InnerText = IIf(LoginUserDetails.Admin, "1", "0")
        End If
    End Sub
End Class
