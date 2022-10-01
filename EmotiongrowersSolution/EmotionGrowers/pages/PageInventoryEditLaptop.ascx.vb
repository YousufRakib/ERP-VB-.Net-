
Partial Class pages_PageInventoryPODetails
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_InventId
    Implements ICustomParams_TableName
    Implements ICustomParams_IsFromLookUpForm

    Dim m_InventId As String

    Dim m_tablename As String
    '26 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen
    Dim m_isFromLookup As Boolean



    Public Property InventId As String Implements ICustomParams_InventId.InventID
        Get
            Return m_InventId
        End Get
        Set(ByVal value As String)
            m_InventId = value
            divinventid.InnerText = m_InventId
        End Set
    End Property
    '26 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen
    Public Property IsFromLookUp As Boolean Implements ICustomParams_IsFromLookUpForm.IsFromLookUp
        Get
            Return m_isFromLookup
        End Get
        Set(ByVal value As Boolean)
            m_isFromLookup = value
            divIsFromLookUp.InnerText = m_isFromLookup
        End Set
    End Property

    Public Property TableName As String Implements ICustomParams_TableName.TableName
        Get
            Return m_tablename
        End Get
        Set(ByVal value As String)
            m_tablename = value
            divtablename.InnerText = m_tablename
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim UserFeatures As List(Of Feature) = Session("LoginUserFeatures")
        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            LoggedInUserID_InvenUser.InnerText = LoginUserDetails.ID
        End If
    End Sub
End Class
