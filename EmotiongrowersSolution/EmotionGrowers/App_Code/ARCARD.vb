Imports System.Data.SqlClient
Imports System.Data

Public Class ARCARD
    Public Shared Function GetCountForPayments(ByVal PaymentsFromDate As String, PaymentsToDate As String, ByVal SpName As String, ByVal PaymentsDateType As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim RowCount As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using PaymentsCmd As New SqlCommand(SpName, con)
                    PaymentsCmd.CommandType = CommandType.StoredProcedure
                    PaymentsCmd.Parameters.AddWithValue("@FromDate", PaymentsFromDate)
                    PaymentsCmd.Parameters.AddWithValue("@ToDate", PaymentsToDate)
                    PaymentsCmd.Parameters.AddWithValue("@PaymentsDateType", PaymentsDateType)
                    Dim PaymentsReader As SqlDataReader = PaymentsCmd.ExecuteReader()
                    If PaymentsReader.NextResult() Then
                        While PaymentsReader.Read()
                            RowCount = PaymentsReader(0)
                        End While
                    End If
                End Using
                con.Close()
            End Using
            Return RowCount
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCountForPayments")
            Throw ex
        End Try
    End Function

    Public Shared Function CheckCreditCardHeadertIsAlreadyLocked(ByVal CreditCardType As String, ByVal [Date] As String, ByVal Bank As String, ByVal UserID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("select isnull(Name,'') from f_arcard D left join tblusers u on u.ID=D.LockedUserID where D.TYPE=@Type and D.Date=@Date and D.Bank=@Bank And D.Islocked=1 And D.LockedUserID <>@UserID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@UserID", UserID))
                    cmd.Parameters.Add(New SqlParameter("@Type", CreditCardType))
                    cmd.Parameters.Add(New SqlParameter("@Date", [Date]))
                    cmd.Parameters.Add(New SqlParameter("@Bank", Bank))

                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Return "This report is locked by <b>" + dt.Rows(0)(0).ToString() + "</b>"
                    End If
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckDepositHeaderIsAlreadyLocked")
            Return "error"
        End Try
        Return Nothing
    End Function

    ''' <summary>
    ''' Load Credit card details in grid :: Created by Abinaya :: 17Aug2018 
    ''' </summary>
    ''' <param name="FromDate"></param>
    ''' <param name="ToDate"></param>
    ''' <param name="IsActive"></param>
    ''' <returns></returns>
    Public Shared Function GetCreditCardListByDate(ByVal FromDate As String, ByVal ToDate As String, ByVal IsActive As String) As List(Of F_ARCARD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of F_ARCARD)
            Dim TotalRowsHeaderAmount As Decimal = 0.00
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using CreditCardCmd As New SqlCommand("SELECT [DATE],TYPE,SUM(AMOUNT) TOTALAMOUNT,BANK FROM F_ARCARD WHERE Isactive=1 and [DATE] BETWEEN '" + FromDate + "' AND '" + ToDate + "' GROUP BY [DATE],TYPE,BANK ORDER BY [DATE] DESC,TYPE DESC,BANK DESC", con)
                    CreditCardCmd.CommandType = CommandType.Text
                    Dim CreditCardReader = CreditCardCmd.ExecuteReader()
                    While (CreditCardReader.Read())
                        Dim u As New F_ARCARD
                        'u.CreditCardID = CreditCardReader("ID")
                        u.CreditCardType = CreditCardReader("TYPE")
                        u.CreditCardDate = If(CreditCardReader("DATE") Is DBNull.Value, Date.Now.ToString("MM/dd/yy"), Convert.ToDateTime(CreditCardReader("DATE"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                        u.TotalAmount = If(CreditCardReader("TOTALAMOUNT") Is DBNull.Value, 0.00, CreditCardReader("TOTALAMOUNT"))
                        u.Bank = If(CreditCardReader("BANK") Is DBNull.Value, "0", CreditCardReader("BANK"))
                        'u.Islocked = CreditCardReader("IsLocked")
                        'u.LockedUserID = CreditCardReader("LockedUserID")
                        'u.IsActive = Convert.ToBoolean(If(CreditCardReader("IsActive"), 1, 0))
                        'u.CreditCardLockContent = ARCARD.CheckCreditCardHeadertIsAlreadyLocked(u.CreditCardType, u.CreditCardDate, u.Bank, UserDetails.ID)
                        TotalRowsHeaderAmount += u.TotalAmount
                        uList.Add(u)
                    End While
                End Using
            End Using

            Dim row As New F_ARCARD
            'row.CreditCardID = 0
            row.CreditCardType = "0"
            row.CreditCardDate = Date.Now.ToString("MM/dd/yy")
            row.TotalAmount = TotalRowsHeaderAmount
            row.Bank = 0
            'row.Islocked = False
            'row.LockedUserID = 0
            'row.IsActive = False
            'row.CreditCardLockContent = ""
            uList.Add(row)

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCreditCardListByDate")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Check if same credit card type and bank already exist on the table :: Created by Abinaya :: 17Aug2018
    ''' </summary>
    ''' <param name="CreditCardType"></param>
    ''' <param name="Bank"></param>
    ''' <returns></returns>
    Public Shared Function CheckSameCreditCardTypeAndDiffBank(ByVal CreditCardType As String, ByVal [Date] As String, ByVal ApprovalCode As String, ByVal Bank As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim checkResult As String = ""
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using DepositCmd As New SqlCommand("SELECT COUNT(*) FROM TBLCREDITCARDHEADER WHERE TYPE=@TYPE AND [DATE]=@DATE AND APPROVALCODE=@APPROVALCODE AND BANK=@BANK and ISACTIVE=1", con)
                    DepositCmd.CommandType = CommandType.Text
                    DepositCmd.Parameters.AddWithValue("@TYPE", CreditCardType)
                    DepositCmd.Parameters.AddWithValue("@DATE", [Date])
                    DepositCmd.Parameters.AddWithValue("@APPROVALCODE", ApprovalCode)
                    DepositCmd.Parameters.AddWithValue("@Bank", Bank)
                    Dim count As Integer = Convert.ToInt32(DepositCmd.ExecuteScalar())
                    If (count < 1) Then
                        checkResult = "success"
                    Else
                        checkResult = "Same Credit card type and bank already exists."
                    End If
                End Using
            End Using
            Return checkResult
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckSameCreditCardWithDiffBank")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Save new credit card details :: Created by Abinaya :: 17Aug2018
    ''' </summary>
    ''' <param name="CreditCardType"></param>
    ''' <param name="CreditCardDate"></param>
    ''' <param name="TotalAmount"></param>
    ''' <param name="Bank"></param>
    ''' <returns></returns>
    Public Shared Function SaveNewCreditCardDetails(ByVal Customer As Integer, ByVal Invoice As Integer, ByVal TotalAmount As Decimal, ByVal CreditCardType As String, ByVal CreditCardDate As String, ByVal CreditCardApprovalCode As String, ByVal Bank As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            Dim scopeID As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()

                Using DepositCmd As New SqlCommand("INSERT INTO F_ARCARD(CUSTOMER,INVOICE,AMOUNT,TYPE,DATE,APPROVAL,BANK,ADDUSER,ADDDATE,ADDTIME,ADDAPP,IsActive) VALUES(@CUSTOMER,@INVOICE,@AMOUNT,@TYPE,@DATE,@CREDITCARDAPPROVALCODE,@BANK,@AddUser,@AddDate,@AddTime,'WEB','1')  Select Scope_Identity()", con)
                    DepositCmd.CommandType = CommandType.Text
                    DepositCmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    DepositCmd.Parameters.AddWithValue("@INVOICE", Invoice)
                    DepositCmd.Parameters.AddWithValue("@AMOUNT", TotalAmount)
                    DepositCmd.Parameters.AddWithValue("@TYPE", CreditCardType)
                    DepositCmd.Parameters.AddWithValue("@DATE", CreditCardDate)
                    DepositCmd.Parameters.AddWithValue("CREDITCARDAPPROVALCODE", CreditCardApprovalCode)
                    DepositCmd.Parameters.AddWithValue("@BANK", Bank)
                    DepositCmd.Parameters.AddWithValue("@AddUser", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
                    DepositCmd.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    DepositCmd.Parameters.AddWithValue("@AddTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    scopeID = DepositCmd.ExecuteScalar()
                End Using
            End Using
            Return scopeID
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In SaveNewCreditCardDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function DeleteCreditHeaderWithDetailsById(ByVal CardType As String, ByVal [Date] As String, ByVal Bank As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If

                Using cmd As New SqlCommand("delete from f_arcard where Type=@Type and Date=@Date and Bank=@Bank", con)
                    cmd.Parameters.Add(New SqlParameter("@Type", CardType))
                    cmd.Parameters.Add(New SqlParameter("@Date", [Date]))
                    cmd.Parameters.Add(New SqlParameter("@Bank", Bank))
                    cmd.CommandType = CommandType.Text
                    cmd.ExecuteNonQuery()
                End Using
                con.Close()
            End Using

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteDepositHeaderWithDetailsById")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetCreditCardDetailsListByCustomer(ByVal FILTERQUERY As String) As List(Of F_ARCARD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of F_ARCARD)
            Dim TotalRowsAmount As Decimal = 0.00
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim querySplit = FILTERQUERY.Split("_")
                Dim whereClause As String = ""
                If querySplit.Length = 3 Then
                    'whereClause = "WHERE DEPOSIT=" + querySplit(1) + " AND DATE=cast('" + querySplit(2) + "' as date) AND BANK='" + querySplit(3) + "'"
                    whereClause = "WHERE AR.TYPE='" + querySplit(0) + "' AND AR.DATE='" + querySplit(1) + "' AND AR.BANK='" + querySplit(2) + "'"
                End If
                Using CreditCardCmd As New SqlCommand("SELECT AR.TYPE,AR.CUSTOMER,CU.NAME AS CUSTNAME,SUM(AR.AMOUNT) AMOUNT,AR.APPROVAL  FROM F_ARCARD AR LEFT JOIN F_CUST CU ON AR.CUSTOMER=CU.CUSTOMER  " + whereClause + " GROUP BY AR.CUSTOMER,CU.NAME,AR.APPROVAL ,AR.TYPE ORDER BY AR.CUSTOMER,CU.NAME,AR.TYPE ", con)
                    CreditCardCmd.CommandType = CommandType.Text
                    Dim CreditCardReader = CreditCardCmd.ExecuteReader()
                    While (CreditCardReader.Read())
                        Dim u As New F_ARCARD
                        u.CreditCardType = If(CreditCardReader("TYPE") Is DBNull.Value, 0, CreditCardReader("TYPE"))
                        u.Customer = If(CreditCardReader("CUSTOMER") Is DBNull.Value, 0, CreditCardReader("CUSTOMER"))
                        u.CustName = If(CreditCardReader("CUSTNAME") Is DBNull.Value, "", CreditCardReader("CUSTNAME"))
                        u.TotalAmount = If(CreditCardReader("AMOUNT") Is DBNull.Value, 0.00, CreditCardReader("AMOUNT"))
                        u.ApprovalCode = If(CreditCardReader("APPROVAL") Is DBNull.Value, "", CreditCardReader("APPROVAL"))

                        TotalRowsAmount += u.TotalAmount
                        uList.Add(u)
                    End While
                End Using
            End Using

            Dim row As New F_ARCARD
            row.CreditCardType = "0"
            row.Customer = 0
            row.CustName = ""
            row.TotalAmount = TotalRowsAmount
            row.ApprovalCode = ""
            uList.Add(row)

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCreditCardDetailsList")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCreditCardDetailsListByInvoice(ByVal FILTERQUERY As String) As List(Of F_ARCARD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of F_ARCARD)
            Dim TotalRowsAmount As Decimal = 0.00
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim querySplit = FILTERQUERY.Split("_")
                Dim whereClause As String = ""
                If querySplit.Length = 3 Then
                    'whereClause = "WHERE DEPOSIT=" + querySplit(1) + " AND DATE=cast('" + querySplit(2) + "' as date) AND BANK='" + querySplit(3) + "'"
                    whereClause = "WHERE TYPE='" + querySplit(0) + "' AND CUSTOMER='" + querySplit(1) + "' AND APPROVAL='" + querySplit(2) + "'"
                End If
                Using CreditCardCmd As New SqlCommand("SELECT ID AS CREDITCARDID,INVOICE,DATE,AMOUNT  FROM F_ARCARD  " + whereClause + " ORDER BY INVOICE,APPROVAL ", con)
                    CreditCardCmd.CommandType = CommandType.Text
                    Dim CreditCardReader = CreditCardCmd.ExecuteReader()
                    While (CreditCardReader.Read())
                        Dim u As New F_ARCARD
                        u.CreditCardID = CreditCardReader("CREDITCARDID")
                        u.Invoice = If(CreditCardReader("INVOICE") Is DBNull.Value, 0, CreditCardReader("INVOICE"))
                        u.CreditCardDate = If(CreditCardReader("DATE") Is DBNull.Value, Date.Now.ToString("MM/dd/yy"), Convert.ToDateTime(CreditCardReader("DATE")).ToString("MM/dd/yy"))
                        u.TotalAmount = If(CreditCardReader("AMOUNT") Is DBNull.Value, 0.00, CreditCardReader("AMOUNT"))

                        TotalRowsAmount += u.TotalAmount
                        uList.Add(u)
                    End While
                End Using
            End Using

            Dim row As New F_ARCARD
            row.CreditCardID = 0
            row.Invoice = 0
            row.CreditCardDate = ""
            row.TotalAmount = TotalRowsAmount

            uList.Add(row)

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCreditCardDetailsListByInvoice")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCreditCardDetailsByID(ByVal ID As Integer) As F_ARCARD
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()

                Using CreditCardCmd As New SqlCommand("SELECT * FROM F_ARCARD WHERE ID=@ID", con)
                    CreditCardCmd.CommandType = CommandType.Text
                    CreditCardCmd.Parameters.AddWithValue("@ID", ID)
                    Dim CreditCardReader = CreditCardCmd.ExecuteReader()
                    While (CreditCardReader.Read())
                        Dim u As New F_ARCARD()
                        u.CreditCardID = CreditCardReader("ID")
                        u.CreditCardType = CreditCardReader("TYPE")
                        u.CreditCardDate = If(CreditCardReader("DATE") Is DBNull.Value, Date.Now.ToString("MM/dd/yy"), CreditCardReader("DATE"))
                        u.TotalAmount = If(CreditCardReader("AMOUNT") Is DBNull.Value, 0.00, CreditCardReader("AMOUNT"))
                        u.Bank = If(CreditCardReader("BANK") Is DBNull.Value, "0", CreditCardReader("BANK"))
                        u.ApprovalCode = CreditCardReader("APPROVAL")
                        Return u
                    End While
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCreditCardDetailsByID")
            Throw ex
        End Try
        Return Nothing
    End Function

End Class

Public Class F_ARCARD

    Private _ErrorMessage As String
    Public Property ErrorMessage() As String
        Get
            Return _ErrorMessage
        End Get
        Set(value As String)
            _ErrorMessage = value
        End Set
    End Property

    Private _CreditCardID As Integer
    Public Property CreditCardID() As Integer
        Get
            Return _CreditCardID
        End Get
        Set(value As Integer)
            _CreditCardID = value
        End Set
    End Property

    Private _CreditCardType As String
    Public Property CreditCardType As String
        Get
            Return _CreditCardType
        End Get
        Set(value As String)
            _CreditCardType = value
        End Set
    End Property

    Private _CreditCardDate As String
    Public Property CreditCardDate() As String
        Get
            Return _CreditCardDate
        End Get
        Set(ByVal value As String)
            _CreditCardDate = value
        End Set
    End Property

    Private _Bank As String = ""
    Public Property Bank() As String
        Get
            Return _Bank
        End Get
        Set(ByVal value As String)
            _Bank = value
        End Set
    End Property

    Private _TotalAmount As Decimal = 0.00
    Public Property TotalAmount() As Decimal
        Get
            Return _TotalAmount
        End Get
        Set(ByVal value As Decimal)
            _TotalAmount = value
        End Set
    End Property

    Private _Islocked As Boolean
    Public Property Islocked() As Boolean
        Get
            Return _Islocked
        End Get
        Set(ByVal value As Boolean)
            _Islocked = value
        End Set
    End Property

    Private _LockedUserID As Integer
    Public Property LockedUserID() As Integer
        Get
            Return _LockedUserID
        End Get
        Set(ByVal value As Integer)
            _LockedUserID = value
        End Set
    End Property

    Private _CreditCardLockContent As String
    Public Property CreditCardLockContent() As String
        Get
            Return _CreditCardLockContent
        End Get
        Set(value As String)
            _CreditCardLockContent = value
        End Set
    End Property

    Private _IsActive As Boolean
    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

    Private _Customer As Integer = 0
    Public Property Customer() As Integer
        Get
            Return _Customer
        End Get
        Set(value As Integer)
            _Customer = value
        End Set
    End Property

    Private _CustName As String = ""
    Public Property CustName() As String
        Get
            Return _CustName
        End Get
        Set(value As String)
            _CustName = value
        End Set
    End Property

    Private _ApprovalCode As String = ""
    Public Property ApprovalCode() As String
        Get
            Return _ApprovalCode
        End Get
        Set(value As String)
            _ApprovalCode = value
        End Set
    End Property

    Private _Invoice As Integer = 0
    Public Property Invoice() As Integer
        Get
            Return _Invoice
        End Get
        Set(value As Integer)
            _Invoice = value
        End Set
    End Property

End Class
