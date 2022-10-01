
Partial Class pages_PageOrderSaveProcess
    Inherits System.Web.UI.UserControl
    Implements ICustomParams_CustomerNo
    Implements ICustomParams_SalesOrderNo
    Implements ICustomParams_CalledFromVET
    Implements ICustomParams_IsVoided                                       'Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions

    Dim m_CustomerNo As String
    Dim m_SalesOrderNo As String
    Dim m_CalledFromVET As String
    Dim m_IsVoided As String                                                'Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions

    Public Property CustomerNo As String Implements ICustomParams_CustomerNo.CustomerNo
        Get
            Return m_CustomerNo
        End Get
        Set(ByVal value As String)
            m_CustomerNo = value
            DivCustomerNo_OrderSave.InnerText = m_CustomerNo
        End Set
    End Property


    Public Property SalesOrderNo As String Implements ICustomParams_SalesOrderNo.SalesOrderNo
        Get
            Return m_SalesOrderNo
        End Get
        Set(ByVal value As String)
            m_SalesOrderNo = value
            DivOrderNo_OrderSave.InnerText = m_SalesOrderNo
        End Set
    End Property


    Public Property CalledFromVET As String Implements ICustomParams_CalledFromVET.CalledFromVET
        Get
            Return m_CalledFromVET
        End Get
        Set(ByVal value As String)
            m_CalledFromVET = value
            DivCalledFromVET_OrderSave.InnerText = m_CalledFromVET
        End Set
    End Property
    'Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
    Public Property IsVoided As String Implements ICustomParams_IsVoided.IsVoided
        Get
            Return m_IsVoided
        End Get
        Set(value As String)
            m_IsVoided = value
            DivIsVoidedOrder.InnerText = m_IsVoided
        End Set
    End Property
    ''' <summary>
    ''' Muthu Nivetha M :: 17Mar2020 :: Modified :: To load inventory grid by active WHs based on the settings of logged user
    ''' Muthu Nivetha M :: 19Mar2020 :: Modified :: To load all flags from tblType
    ''' </summary>
    Private Sub pages_PageOrderSaveProcess_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            DivForViewAllColumnsInInvnetory.InnerText = LoginUserDetails.ORDER
            LoggedInUserType_SalesPerson.InnerText = LoginUserDetails.UserType.ToLower()
            DivInventoryAccessTypes.InnerText = LoginUserDetails.InventoryAccesstypes
            DivpgOdrsaveActiveWHs.InnerText = String.Join(",", From wh In LoginUserDetails.WarehouseList
                                                               Select "'" + wh.WH + "'")
            DivWHListCount.InnerText = LoginUserDetails.WarehouseList.Count.ToString()
            Dim invaces = LoginUserDetails.InventoryAccesstypes.Replace(",", "").ToList()
            Dim invflag = (From invflg In LoginUserDetails.InvenFlagTypesList
                           Select invflg.Code).ToList()
            DivpgOdrtbltype.InnerText = (From flg In invflag Where Not invaces.Any(Function(ac) flg = ac) Order By flg Select flg).First()
        End If
    End Sub
End Class
