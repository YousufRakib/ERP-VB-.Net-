Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports LumenWorks.Framework.IO.Csv
Imports System.Data.OleDb

Public Class Payments

    Public Shared Function UploadPaymentFileToTempTable(ByVal dt As DataTable, ByVal filePath As String, ByVal Depositno As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("spUploadPaymentData", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@dt", dt))
                    'cmd.Parameters.Add(New SqlParameter("@filepath", filePath))
                    cmd.Parameters.Add(New SqlParameter("@Depositno", Depositno))
                    cmd.ExecuteNonQuery()
                    System.IO.File.Delete(filePath)
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UploadPaymentFileToTempTable")
            Return "error"
        End Try
        Return Nothing
    End Function
    Public Shared Function validatePaymentPO(ByVal po As String) As Boolean
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader
            Dim dt As New DataTable

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("select po from VET1_ where po=@po", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@po", po))
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(dt)
                End Using
            End Using
            If dt.Rows.Count > 0 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in validatePaymentPO")
            Return False
        End Try
        Return Nothing
    End Function
    Public Shared Function CheckDepositHeadertIsAlreadyLocked(ByVal Deposit As String, ByVal [Date] As String, ByVal Bank As String, ByVal UserID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("select isnull(Name,'') from tblDepositHeader D left join tblusers u on u.ID=D.LockedUserID where D.Deposit=@Deposit and D.Date=@Date and D.Bank=@Bank And D.Islocked=1 And D.LockedUserID <>@UserID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@UserID", UserID))
                    cmd.Parameters.Add(New SqlParameter("@Deposit", Deposit))
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

    Public Shared Function GetDepositListByDate(ByVal FromDate As String, ByVal ToDate As String, ByVal IsActive As String) As List(Of Payment)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Payment)
            Dim TotalRowsHeaderAmount As Decimal = 0.00
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using DepositCmd As New SqlCommand("spGetDepositHeaderbydate", con)
                    DepositCmd.CommandType = CommandType.StoredProcedure
                    DepositCmd.Parameters.AddWithValue("@Fromdate", FromDate)
                    DepositCmd.Parameters.AddWithValue("@Todate", ToDate)
                    DepositCmd.Parameters.AddWithValue("@IsActive", IsActive)
                    Dim DepositReader = DepositCmd.ExecuteReader()
                    While (DepositReader.Read())
                        Dim u As New Payment
                        u.PaymentsID = DepositReader("ID")
                        u.Deposit = DepositReader("DEPOSIT")
                        u.DepositDate = Convert.ToDateTime(DepositReader("DATE"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                        'u.DepositDate = DepositReader("DATE")
                        u.Amount = DepositReader("AMOUNT")
                        u.Bank = DepositReader("BANK")
                        u.Islocked = DepositReader("IsLocked")
                        u.LockedUserID = DepositReader("LockedUserID")
                        u.IsActive = Convert.ToBoolean(If(DepositReader("IsActive"), 1, 0))
                        u.DepositLockContent = Payments.CheckDepositHeadertIsAlreadyLocked(u.Deposit, u.DepositDate, u.Bank, UserDetails.ID)
                        TotalRowsHeaderAmount += u.Amount
                        uList.Add(u)
                    End While
                End Using
            End Using

            Dim row As New Payment
            row.PaymentsID = 0
            row.Deposit = 0
            row.DepositDate = Convert.ToDateTime(Date.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
            row.Amount = TotalRowsHeaderAmount
            row.Bank = 0
            uList.Add(row)

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetDepositListByDate")
            Throw ex
        End Try
    End Function

    Public Shared Function GetDepositDetailsList(ByVal FILTERQUERY As String) As List(Of Payment)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Payment)
            Dim TotalRowsAmount As Decimal = 0.00
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim querySplit = FILTERQUERY.Split("_")
                Dim whereClause As String = ""
                If querySplit.Length = 4 Then
                    'whereClause = "WHERE DEPOSIT=" + querySplit(1) + " AND DATE=cast('" + querySplit(2) + "' as date) AND BANK='" + querySplit(3) + "'"
                    whereClause = "WHERE DEPOSIT=" + querySplit(1) + " AND BANK='" + querySplit(3) + "'"
                End If
                If whereClause <> "" Then

                    Using DepositCmd As New SqlCommand("SELECT DEPOSIT,TYPE,SUM(AMOUNT) AMOUNT,[CHECK],CUSTOMER FROM F_CASH  " + whereClause + " GROUP BY DEPOSIT,TYPE,[CHECK],CUSTOMER ", con)
                        DepositCmd.CommandType = CommandType.Text
                        Dim DepositReader = DepositCmd.ExecuteReader()
                        While (DepositReader.Read())
                            Dim u As New Payment
                            u.Deposit = DepositReader("DEPOSIT")
                            u.Type = If(DepositReader("TYPE") = 2, "Check", If(DepositReader("TYPE") = 3, "Cash", ""))
                            u.Amount = DepositReader("AMOUNT")
                            u.Check = DepositReader("CHECK")
                            u.Customer = DepositReader("CUSTOMER")
                            TotalRowsAmount += u.Amount
                            uList.Add(u)
                        End While
                    End Using
                End If
            End Using

            Dim row As New Payment
            row.Customer = 0
            row.Type = ""
            row.Amount = TotalRowsAmount
            row.Check = 0
            row.Customer = 0
            uList.Add(row)

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetDepositListByDate")
            Throw ex
        End Try
    End Function
    'Muthu Nivetha M :: 20 Mar 19 :: Please fix payment posting problem when error is made :: Changed Delete date as deposit date
    Public Shared Function GetCheckDetailsList(ByVal FILTERQUERY As String) As List(Of Payment)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Payment)
            Dim TotalRowsAmount As Decimal = 0.00
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim querySplit = FILTERQUERY.Split("_")
                Dim whereClause As String = ""
                If querySplit.Length = 3 Then
                    whereClause = "WHERE ca.DEPOSIT=" + querySplit(0) + " AND [CHECK]='" + querySplit(1) + "' AND ca.CUSTOMER=" + querySplit(2)
                Else
                    whereClause = "WHERE " + FILTERQUERY
                End If
                Using DepositCmd As New SqlCommand("spGetCheckDetailsList", con)   'Please fix payment posting problem when error is made 
                    DepositCmd.CommandType = CommandType.StoredProcedure
                    DepositCmd.Parameters.AddWithValue("@whereClause", whereClause)
                    Dim DepositReader = DepositCmd.ExecuteReader()
                    While (DepositReader.Read())
                        Dim u As New Payment
                        u.Deposit = Convert.ToInt64(DepositReader("DEPOSIT"))
                        u.Customer = Convert.ToInt64(DepositReader("CUSTOMER"))
                        u.CustName = Convert.ToString(DepositReader("CUSTNAME"))
                        u.Amount = Convert.ToDecimal(DepositReader("AMOUNT"))
                        u.Bank = Convert.ToString(DepositReader("BANK"))    'added on 24jan19 :: insert bank value to new negative entry when Delete
                        u.Check = Convert.ToInt64(DepositReader("CHECK"))
                        u.Invoice = Convert.ToInt64(DepositReader("INVOICE"))
                        u.PO = Convert.ToString(DepositReader("PO"))
                        u.GL = Convert.ToString(DepositReader("GL"))
                        u.CTA = Convert.ToString(DepositReader("CTA"))
                        u.DetailID = Convert.ToInt64(DepositReader("DetailID"))
                        u.ADDUSER = Convert.ToString(DepositReader("ADDUSER"))
                        u.ADDDATE = Convert.ToString(DepositReader("ADDDATE"))
                        u.ADDTIME = Convert.ToString(DepositReader("ADDTIME"))
                        u.ADDAPP = Convert.ToString(DepositReader("ADDAPP"))
                        u.UPDUSER = Convert.ToString(DepositReader("UPDUSER"))
                        u.UPDDATE = Convert.ToString(DepositReader("UPDDATE"))
                        u.UPDTIME = Convert.ToString(DepositReader("UPDTIME"))
                        u.UPDAPP = Convert.ToString(DepositReader("UPDAPP"))
                        u.DELUSER = Convert.ToString(DepositReader("DELUSER"))
                        u.DELDATE = Convert.ToString(DepositReader("DELDATE"))
                        u.DELTIME = Convert.ToString(DepositReader("DELTIME"))
                        u.DELAPP = Convert.ToString(DepositReader("DELAPP"))
                        u.LOCKUSER = Convert.ToString(DepositReader("LOCKUSER"))
                        u.LOCKDATE = Convert.ToString(DepositReader("LOCKDATE"))
                        u.LOCKTIME = Convert.ToString(DepositReader("LOCKTIME"))
                        u.LOCKAPP = Convert.ToString(DepositReader("LOCKAPP"))
                        u.DepositDate = Convert.ToString(DepositReader("DATE1"))
                        TotalRowsAmount += u.Amount
                        uList.Add(u)
                    End While
                End Using
            End Using

            Dim row As New Payment
            row.Deposit = 0
            row.Customer = 0
            row.Amount = TotalRowsAmount
            row.Check = 0
            row.Invoice = 0
            uList.Add(row)

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCheckDetailsList")
            Throw ex
        End Try
    End Function

    Public Shared Function ImportDepositsFromCash() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim RowCount As Integer = 0
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sqlQuery As String = "SELECT  DEPOSIT,DATE,SUM(AMOUNT) TOTALAMOUNT,BANK,@AddUser,'IMPORTDEPOSITS' FROM F_CASH WHERE DEPOSIT<>0 GROUP BY DEPOSIT,DATE,BANK ORDER BY DEPOSIT "
                Using DepositCmd As New SqlCommand("truncate table tblDepositHeader INSERT INTO tblDepositHeader(DEPOSIT,DATE,TOTALAMOUNT,BANK,ADDUSER,ADDAPP) " + sqlQuery, con)
                    DepositCmd.CommandType = CommandType.Text
                    DepositCmd.Parameters.AddWithValue("@AddUser", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
                    DepositCmd.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yy")))
                    DepositCmd.Parameters.AddWithValue("@AddTime", DateTime.Now.ToString("HH:mm:ss"))
                    DepositCmd.ExecuteNonQuery()
                    DepositCmd.Dispose()
                End Using
                Using DepSelectCmd As New SqlCommand(sqlQuery, con)
                    DepSelectCmd.Parameters.AddWithValue("@AddUser", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
                    DepSelectCmd.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yy")))
                    DepSelectCmd.Parameters.AddWithValue("@AddTime", DateTime.Now.ToString("HH:mm:ss"))
                    Dim DepositAdapter As New SqlDataAdapter(DepSelectCmd)
                    Dim DepositDT As New DataTable
                    DepositAdapter.Fill(DepositDT)
                    RowCount = DepositDT.Rows.Count
                End Using
            End Using
            Return RowCount.ToString()
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ImportDepositsFromCash")
            Throw ex
        End Try
    End Function

    Public Shared Function ChangeDepositLockStatusForUser(ByVal IsLocked As Integer, ByVal Deposit As Integer, ByVal [Date] As String, ByVal Bank As String, ByVal UserID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("[spChangeDepositLockStatus]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@IsLocked", IsLocked))
                    cmd.Parameters.Add(New SqlParameter("@UserID", UserID))
                    cmd.Parameters.Add(New SqlParameter("@Deposit", Deposit))
                    cmd.Parameters.Add(New SqlParameter("@Date", [Date]))
                    cmd.Parameters.Add(New SqlParameter("@Bank", Bank))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Return dt.Rows(0)(0).ToString()
                    End If
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ChangeDepositLockStatusForUser")
            Return "error"
        End Try
        Return Nothing
    End Function

    Public Shared Function DeleteDepositHeaderWithDetailsById(ByVal Deposit As String, ByVal [Date] As String, ByVal Bank As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                Using cmd As New SqlCommand("spDeleteDepositHeaderWithDetailsById", con)
                    cmd.Parameters.Add(New SqlParameter("@Deposit", Deposit))
                    cmd.Parameters.Add(New SqlParameter("@Date", [Date]))
                    cmd.Parameters.Add(New SqlParameter("@Bank", Bank))
                    cmd.Parameters.Add(New SqlParameter("@DelUser", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name)))
                    cmd.Parameters.Add(New SqlParameter("@DelDate", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")))
                    cmd.Parameters.Add(New SqlParameter("@DelTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss")))
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.ExecuteNonQuery()
                End Using
                con.Close()
            End Using

            'For Update log
            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                Logs.Savelog(loginuserdetails.ID, "Grower", "DeleteDepositHeaderWithDetailsById", "Deleted Deposit#" + Deposit + " on Date " + [Date] + "", Deposit + "_" + [Date] + "_" + Bank)
                ' End If
            End If

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteDepositHeaderWithDetailsById")
            Return Nothing
        End Try
    End Function


    Public Shared Function DeleteCreditHeaderWithDetailsById(ByVal Type As String, ByVal [Date] As String, ByVal Bank As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                Using cmd As New SqlCommand("Update f_arcard Set IsActive=0,DELUSER=@DelUser,DELDATE=@DelDate,DELTIME=@DelTime,DELAPP='WEB' where Type=@CardType and Date=@Date and Bank=@Bank", con)
                    cmd.Parameters.Add(New SqlParameter("@CardType", Type))
                    cmd.Parameters.Add(New SqlParameter("@Date", [Date]))
                    cmd.Parameters.Add(New SqlParameter("@Bank", Bank))
                    cmd.Parameters.Add(New SqlParameter("@DelUser", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name)))
                    cmd.Parameters.Add(New SqlParameter("@DelDate", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")))
                    cmd.Parameters.Add(New SqlParameter("@DelTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss")))
                    cmd.CommandType = CommandType.Text
                    cmd.ExecuteNonQuery()
                End Using
                con.Close()
            End Using

            'For Update log
            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                Logs.Savelog(loginuserdetails.ID, "Grower", "DeleteCreditHeaderWithDetailsById", "Deleted Credit#" + Type + " on Date " + [Date] + "", Type + "_" + [Date] + "_" + Bank)
                ' End If
            End If

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteCreditHeaderWithDetailsById")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetNextDepositNum() As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim NextDepositNum As Integer = 0

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using DepositCmd As New SqlCommand("SELECT DEPOSIT FROM CONSTANT", con)
                    DepositCmd.CommandType = CommandType.Text
                    NextDepositNum = If(DepositCmd.ExecuteScalar() Is DBNull.Value, 1, DepositCmd.ExecuteScalar())
                End Using
            End Using
            Return NextDepositNum
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetNextDepositNum")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 19-Nov:2018 :: Update deposit # to constant
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function SetNextDepositNum(ByVal NextDepositNum As Integer) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            ' Dim NextDepositNum As Integer = 0

            Using con As New SqlConnection(ConStr)
                con.Open()

                If NextDepositNum <> 0 Then
                    'update next deposit# to constant table
                    Using constCmd As New SqlCommand("UPDATE CONSTANT SET DEPOSIT=@DEPOSIT", con)
                        constCmd.CommandType = CommandType.Text
                        constCmd.Parameters.AddWithValue("@DEPOSIT", NextDepositNum + 1)
                        constCmd.ExecuteNonQuery()
                    End Using
                End If
            End Using
            Return NextDepositNum
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In SetNextDepositNum")
            Throw ex
        End Try
    End Function

    Public Shared Function CheckSameDepositAndDiffBank(ByVal Deposit As Integer, ByVal Bank As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim checkResult As String = ""
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using DepositCmd As New SqlCommand("SELECT COUNT(*) FROM TBLDEPOSITHEADER WHERE DEPOSIT=@DEPOSIT AND BANK=@BANK and ISACTIVE=1", con)
                    DepositCmd.CommandType = CommandType.Text
                    DepositCmd.Parameters.AddWithValue("@DEPOSIT", Deposit)
                    DepositCmd.Parameters.AddWithValue("@Bank", Bank)
                    Dim count As Integer = DepositCmd.ExecuteScalar()
                    If (count < 1) Then
                        checkResult = "success"
                    Else
                        checkResult = "This Deposit # already exists for this bank....."
                    End If
                End Using
            End Using
            Return checkResult
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckSameDepositWithDiffBank")
            Throw ex
        End Try
    End Function

    Public Shared Function SaveNewDeposit(ByVal Deposit As Integer, ByVal [Date] As String, ByVal Amount As Decimal, ByVal Bank As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            SetNextDepositNum(Deposit)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using DepositCmd As New SqlCommand("spInsertIntoDepositHeader", con)
                    DepositCmd.CommandType = CommandType.StoredProcedure
                    DepositCmd.Parameters.AddWithValue("@DEPOSIT", Deposit)
                    DepositCmd.Parameters.AddWithValue("@DATE", [Date])
                    DepositCmd.Parameters.AddWithValue("@AMOUNT", Amount)
                    DepositCmd.Parameters.AddWithValue("@BANK", Bank)
                    DepositCmd.Parameters.AddWithValue("@AddUser", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
                    DepositCmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In SaveNewDeposit")
            Throw ex
        End Try
    End Function

    Public Shared Function ExportExcelDepositDetails(ByVal Deposit As Integer, ByVal [Date] As String, ByVal Bank As String) As DataTable
        Try
            Dim strSql As String = "SELECT HEAD.DEPOSIT,FORMAT(HEAD.DATE,'MM/dd/yy') DATE,CASH.CUSTOMER,ISNULL(CUST.NAME,'') CUSTNAME,HEAD.BANK,CASH.[CHECK],CASH.INVOICE,ISNULL(V1.PO,'') PO,CASH.AMOUNT,TYPE= CASE CASH.TYPE WHEN '2' THEN 'CHECK' WHEN '3' THEN 'CASH' END,CASH.GL,CASH.CTA,HEAD.ISACTIVE,HEAD.ISLOCKED,HEAD.LOCKEDUSERID,ISNULL(HEAD.ADDUSER,'') ADDUSER,ISNULL(HEAD.ADDDATE,'') ADDDATE,ISNULL(HEAD.ADDTIME,'') ADDTIME,ISNULL(HEAD.ADDAPP,'') ADDAPP ,ISNULL(HEAD.UPDUSER,'') UPDUSER,ISNULL(HEAD.UPDDATE,'') UPDDATE,ISNULL(HEAD.UPDTIME,'') UPDTIME,ISNULL(HEAD.UPDAPP,'') UPDAPP,ISNULL(HEAD.DELUSER,'') DELUSER,ISNULL(HEAD.DELDATE,'') DELDATE,ISNULL(HEAD.DELTIME,'') DELTIME,ISNULL(HEAD.DELAPP,'') DELAPP,ISNULL(HEAD.LOCKUSER,'') LOCKUSER,ISNULL(HEAD.LOCKDATE,'') LOCKDATE,ISNULL(HEAD.LOCKTIME,'') LOCKTIME,ISNULL(HEAD.LOCKAPP,'') LOCKAPP    FROM TBLDEPOSITHEADER HEAD LEFT JOIN F_CASH CASH ON HEAD.DEPOSIT=CASH.DEPOSIT LEFT JOIN F_CUST CUST ON CASH.CUSTOMER=CUST.CUSTOMER LEFT JOIN VET1_ V1 on V1.INVOICE= CASH.INVOICE and V1.CUSTOMER=CASH.CUSTOMER WHERE HEAD.DEPOSIT=" + Deposit.ToString() + " and HEAD.DATE='" + [Date] + "' and HEAD.BANK='" + Bank + "' ORDER BY HEAD.DATE,CASH.CUSTOMER"
            Dim DepositDT As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using DepositCon As New SqlConnection(ConStr)
                DepositCon.Open()
                Using DepositAdap As New SqlDataAdapter(strSql, DepositCon)
                    DepositAdap.Fill(DepositDT)
                End Using
                DepositCon.Close()
            End Using
            Return DepositDT
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ExportExcelDepositDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function CheckAndGetInvoiceDetails(ByVal xInvoice As Integer, ByVal xDate As String, ByVal xCustomer As Integer) As List(Of Payment)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim InvResult As String = ""
            Dim uList As New List(Of Payment)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim vetCount As Integer = 0
                Dim ordCount As Integer = 0

                'check invoice at open order with scanned and printed invoice 
                '08April19 :: Abinaya :: Remove Scanned=1 check from invoice at open order
                Using checkCmd As New SqlCommand("select count(*) from f_order1 where [order]=@xInvoice and case when @xCustomer=0 then 0 else Customer end = @xCustomer and PRINTED=1 ", con)
                    'Using checkCmd As New SqlCommand("select count(*) from f_arinvs where Invoice=@xInvoice and Invoice<>0", con)
                    checkCmd.CommandType = CommandType.Text
                    checkCmd.Parameters.AddWithValue("@xInvoice", xInvoice)
                    checkCmd.Parameters.AddWithValue("@xCustomer", xCustomer)
                    ordCount = checkCmd.ExecuteScalar()
                End Using
                'Invoice availed at open ORDER

                If ordCount > 0 Then
                    'calculate sum of all transactions and customer for that invoice
                    Using orderCmd As New SqlCommand("select SUM(ISNULL(CAST(ROUND(ORD2.FOB * ORD2.UNITS * ORD2.BOXES, 2) + (ORD2.TAX2 * ORD2.BOXES) AS NUMERIC(18, 2)), 0.0000)) AS ext_price, ORD1.PO,ORD1.[DATE],ORD1.Customer,Cust.Name from f_order2 ORD2 inner join f_order1 ORD1 on ORD2.[ORDER]=ORD1.[ORDER] inner join F_CUST cust  on cust.customer = ORD1.Customer where ORD1.[order]=@xInvoice group by ORD1.PO,ORD1.[DATE], ORD1.Customer,Cust.Name", con)
                        orderCmd.CommandType = CommandType.Text
                        orderCmd.Parameters.AddWithValue("@xInvoice", xInvoice)
                        Dim u As New Payment()
                        Using row As SqlDataReader = orderCmd.ExecuteReader()
                            While (row.Read())
                                u.Discount = 0.0
                                u.Balance = If(row("ext_price") Is DBNull.Value, 0.0, row("ext_price"))
                                u.PO = Convert.ToString(row("PO"))
                                u.Customer = row("Customer")
                                u.CustName = row("Name")
                                Try
                                    u.InvDate = Convert.ToDateTime(row("DATE"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy")
                                Catch ex As Exception
                                    u.InvDate = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy")
                                End Try

                                u.ErrorMessage = ""
                                uList.Add(u)
                            End While
                        End Using
                    End Using

                    'Invoice not availed at ORDER
                Else
                    'check invoice at VET 
                    Using checkCmd As New SqlCommand("Select count(*) from vet1_ where Invoice=@xInvoice and case when @xCustomer=0 then 0 else Customer end = @xCustomer", con)
                        'Using checkCmd As New SqlCommand("Select count(*) from f_arinvs where Invoice=@xInvoice And Invoice<>0", con)
                        checkCmd.CommandType = CommandType.Text
                        checkCmd.Parameters.AddWithValue("@xInvoice", xInvoice)
                        checkCmd.Parameters.AddWithValue("@xCustomer", xCustomer)
                        vetCount = checkCmd.ExecuteScalar()
                    End Using
                    'Invoice availed at ARINVS
                    If vetCount > 0 Then
                        'calculate sum of all transactions and customer for that invoice
                        'Using arinvCmd As New SqlCommand("Select SUM(Case When Type In(1,5,8) Then Amount Else 0 End) As Charges, SUM(Case When Type In(2,9,4,'A','B') then IIF([Type]=4 or [Type]='A' or [Type]='B',-1*(Amount),Amount) else 0 end) as Payments,	SUM(case when Type in(6) then Amount else 0 end) as Credits, SUM(case when Type in(3) then Amount else 0 end) as Adjustments, customer,F_CUST.name from f_arinvs inner join F_CUST   on F_CUST.customer = f_arinvs.Customer where Invoice=@xInvoice group by CUSTOMER", con)
                        Using arinvCmd As New SqlCommand("Select SUM(Case When f_arinvs.Type In(1,5,8) Then Amount Else 0 End) As Charges, SUM(Case When f_arinvs.Type In(2,9,4,'A','B') then IIF(f_arinvs.Type=4 or f_arinvs.Type='A' or f_arinvs.Type='B',-1*(Amount),Amount) else 0 end) as Payments,	SUM(case when f_arinvs.Type in(6) then Amount else 0 end) as Credits, SUM(case when f_arinvs.Type in(3) then Amount else 0 end) as Adjustments, f_arinvs.customer,F_CUST.name from f_arinvs inner join F_CUST   on F_CUST.customer = f_arinvs.Customer where Invoice=@xInvoice group by f_arinvs.CUSTOMER,F_CUST.name", con)
                            arinvCmd.CommandType = CommandType.Text
                            arinvCmd.Parameters.AddWithValue("@xInvoice", xInvoice)
                            Dim u As New Payment()

                            Using row As SqlDataReader = arinvCmd.ExecuteReader()
                                While (row.Read())
                                    u.Charges = row("Charges")
                                    u.Payments = row("Payments")
                                    u.Credits = row("Credits")
                                    u.Adjustment = row("Adjustments")
                                    u.Balance = u.Charges - u.Payments - u.Credits - u.Adjustment
                                    u.Customer = Convert.ToString(row("customer"))
                                    u.CustName = Convert.ToString(row("Name"))
                                End While
                            End Using

                            'get po and date for the invoice
                            Using vetCmd As New SqlCommand("select po,date from vet1_ where Invoice=@xInvoice", con)
                                vetCmd.Parameters.AddWithValue("@xInvoice", xInvoice)
                                Using vetReader As SqlDataReader = vetCmd.ExecuteReader()
                                    While (vetReader.Read())
                                        u.PO = Convert.ToString(vetReader("PO"))
                                        u.InvDate = vetReader("date")
                                    End While
                                End Using
                            End Using

                            ''get discount and days from terms of the customer
                            'Using termsCmd As New SqlCommand("select Terms,t.Discount,t.ddays from f_cust c left join f_terms t on c.terms=t.code where customer=" + u.Customer.ToString(), con)
                            '    termsCmd.Parameters.AddWithValue("@xInvoice", xInvoice)
                            '    Using termsReader As SqlDataReader = termsCmd.ExecuteReader()
                            '        While (termsReader.Read())
                            '            u.TERMSCODE = Convert.ToString(termsReader("Terms"))
                            '            u.Discount = Convert.ToDecimal(termsReader("Discount"))
                            '            u.DDays = Convert.ToInt16(termsReader("ddays"))
                            '        End While
                            '    End Using
                            'End Using

                            ''calculate difference between vet1_.invoice date and payments date
                            'Dim days As Integer = Convert.ToDateTime(u.InvDate).Subtract(Convert.ToDateTime(xDate)).TotalDays()
                            'If (days <= u.DDays) Then
                            '    Dim InvBalance As Decimal = u.Balance
                            '    Dim Discount As Decimal = u.Discount
                            '    u.Discount = InvBalance * GetDiscountForCustomer(xInvoice, u.Customer, xDate) / 100
                            '    u.Balance = InvBalance - u.Discount
                            'Else
                            '    u.Discount = 0.00
                            'End If

                            Dim InvBalance As Decimal = u.Balance
                            u.Discount = InvBalance * GetDiscountForCustomer(u.InvDate, u.Customer, xDate) / 100
                            u.Balance = InvBalance - u.Discount

                            u.ErrorMessage = ""
                            uList.Add(u)
                        End Using
                    Else
                        Dim t As New Payment()
                        t.ErrorMessage = "Invoice not in the system."
                        uList.Add(t)
                    End If
                End If
                con.Close()
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckAndGetInvoiceDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function GetDiscountForCustomer(ByVal xInvDate As String, ByVal xCustomer As Integer, ByVal xDate As String) As Decimal
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Discount As Decimal = 0.00
            Dim uList As New List(Of Payment)
            Using con As New SqlConnection(ConStr)
                con.Open()
                'get discount and days from terms of the customer
                Using termsCmd As New SqlCommand("select ISNULL(Terms,'') Terms,ISNULL(t.Discount,0) Discount,ISNULL(t.ddays,0) Ddays from f_cust c left join f_terms t on c.terms=t.code where customer=" + xCustomer.ToString(), con)

                    Dim u As New Payment()
                    Using termsReader As SqlDataReader = termsCmd.ExecuteReader()
                        While (termsReader.Read())
                            u.TERMSCODE = Convert.ToString(termsReader("Terms"))
                            u.Discount = Convert.ToDecimal(termsReader("Discount"))
                            u.DDays = Convert.ToInt16(termsReader("Ddays"))
                        End While
                    End Using
                    'calculate difference between vet1_.invoice date and payments date
                    'Dim days As Integer = Convert.ToDateTime(xInvDate).Subtract(Convert.ToDateTime(xDate)).TotalDays()
                    Dim days As Integer = Convert.ToDateTime(xInvDate, New System.Globalization.CultureInfo("en-US", True)).Subtract(Convert.ToDateTime(xDate, New System.Globalization.CultureInfo("en-US", True))).TotalDays()

                    'Convert.ToDateTime(row.RecDate, New System.Globalization.CultureInfo("en-US", True))
                    If (days <= u.DDays) Then
                        Discount = u.Discount
                    Else
                        Discount = 0.00
                    End If
                End Using
                Return Discount
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetDiscountForCustomer")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Anitha :: 19-Oct-2018 :: changed the date value as xDate into CurrentDate for insert into F_ARINVS table 
    ''' </summary>
    ''' <param name="xInvoice"></param>
    ''' <param name="xDate"></param>
    ''' <param name="xType"></param>
    ''' <param name="xCheck"></param>
    ''' <param name="xAmount"></param>
    ''' <param name="xCust"></param>
    ''' <param name="xDiscount"></param>
    ''' <param name="xDep"></param>
    ''' <param name="xRef"></param>
    ''' <param name="User"></param>
    ''' <returns></returns>
    Public Shared Function WRTAR(ByVal xInvoice As Integer, ByVal xDate As String, ByVal xType As String, ByVal xCheck As Integer, ByVal xAmount As Decimal, ByVal xCust As Integer, ByVal xDiscount As Decimal, ByVal xDep As Integer, ByVal xRef As String, ByVal User As String, Optional ByVal Reason As String = "") As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim CurrentDate = DateTime.Now.ToString("MM/dd/yyyy")
                Dim CurrentTime = DateTime.Now.ToString("HH:mm:ss")

                'Dim queryARINVS As String = "INSERT INTO F_ARINVS(INVOICE,DATE,TYPE,[CHECK],AMOUNT,CUSTOMER,DISCOUNT,REFNO,DEPOSIT,ADDUSER,ADDDATE,ADDTIME,ADDAPP,REASON) VALUES(" & xInvoice & ",'" & CurrentDate & "','" & xType & "'," & xCheck & "," & xAmount & "," & xCust & "," & xDiscount & ",'" & xRef & "'," & xDep & ",'" + If(User.Length > 10, User.Substring(0, 10), User) + "','" + CurrentDate + "','" + CurrentTime + "','WEB','" + Reason + "')"
                Dim queryARINVS As String = "INSERT INTO F_ARINVS(INVOICE,DATE,TYPE,[CHECK],AMOUNT,CUSTOMER,DISCOUNT,REFNO,DEPOSIT,ADDUSER,ADDDATE,ADDTIME,ADDAPP,REASON) VALUES(" & xInvoice & ",'" & xDate & "','" & xType & "'," & xCheck & "," & xAmount & "," & xCust & "," & xDiscount & ",'" & xRef & "'," & xDep & ",'" + If(User.Length > 10, User.Substring(0, 10), User) + "','" + CurrentDate + "','" + CurrentTime + "','WEB','" + Reason.Replace("'", "''") + "')"
                Using cmd As New SqlCommand(queryARINVS, con)
                    cmd.ExecuteNonQuery()
                End Using
                If xType = "2" Or xType = "7" Or xType = "4" Or xType = "9" Then
                    Dim whereClause = "CUSTOMER=" & xCust & " AND [CHECK]=" & xCheck & " And DATE='" & xDate & "' And TYPE=" & xType
                    Using cmdARCHKS As New SqlCommand("SELECT COUNT(*) FROM F_ARCHKS WHERE " & whereClause, con)
                        Dim count As Int16 = Convert.ToInt16(cmdARCHKS.ExecuteScalar())
                        Dim queryARCHKS As String = ""
                        If count > 0 Then
                            queryARCHKS = "UPDATE F_ARCHKS SET CUSTOMER=" & xCust & ", [CHECK]=" & xCheck & ",AMOUNT=AMOUNT+(CASE WHEN TYPE=4 THEN  -1*(" & xAmount & ") ELSE " & xAmount & " END), DATE='" & xDate & "', DEPOSIT=" & xDep & ", TYPE=" & xType & " WHERE " & whereClause
                        Else
                            queryARCHKS = "INSERT INTO F_ARCHKS(CUSTOMER,[CHECK],AMOUNT,DATE,DEPOSIT,TYPE) VALUES(" & xCust & "," & xCheck & "," & xAmount & ",'" & xDate & "'," & xDep & "," & xType & ")"
                        End If
                        Using updARCHKS As New SqlCommand(queryARCHKS, con)
                            updARCHKS.ExecuteNonQuery()
                        End Using
                    End Using
                End If

                Select Case xType
                    Case 9
                        Payments.wtreodcash(xAmount, "CREDITCARD")
                    Case 3
                        Payments.wtreodcash(xAmount, "TOTALDISC")
                    Case Else
                        'If xType <> 7 Then
                        Payments.wtreodcash(xAmount, "TOTALDEP")
                        'End If
                End Select

            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in PostingPayments")
            Throw ex
        End Try
    End Function

    Public Shared Function wtrcust(ByVal xAmount As Decimal, ByVal xCust As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()

                Dim queryCust As String = "UPDATE F_CUST SET YTDCRE+=" & xAmount & ", BALANCE-=" & xAmount & " WHERE CUSTOMER=" & xCust & ""
                Using cmd As New SqlCommand(queryCust, con)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Posting Payments to Customer file")
            Throw ex
        End Try
    End Function

    Public Shared Function wtrcash(ByVal xInvoice As Integer, ByVal xDate As String, ByVal xType As String, ByVal xCheck As Integer, ByVal xAmount As Decimal, ByVal xCust As Integer, ByVal xDeposit As Integer, ByVal xBank As String, ByVal xGL As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                Dim CurrentDate = DateTime.Now.ToString("MM/dd/yyyy")
                Dim CurrentTime = DateTime.Now.ToString("HH:mm:ss")
                Dim querycash As String = "INSERT INTO F_CASH(INVOICE,DATE,TYPE,[CHECK],AMOUNT,CUSTOMER,DEPOSIT,BANK,GL,ADDUSER,ADDDATE,ADDTIME,ADDAPP) VALUES(" & xInvoice & ",'" & xDate & "','" & xType & "'," & xCheck & "," & xAmount & "," & xCust & "," & xDeposit & ",'" & xBank & "','" & xGL & "','" & If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name) & "','" & CurrentDate & "','" & CurrentTime & "','WEB')"
                Using cmd As New SqlCommand(querycash, con)
                    cmd.ExecuteNonQuery()
                End Using

            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In Posting Payments To cash file")
            Throw ex
        End Try
    End Function

    Public Shared Function wtradjust(ByVal xInvoice As Integer, ByVal xDate As String, ByVal xAmount As Decimal, ByVal xCust As Integer, ByVal xReason As String, ByVal xGL As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()

                Dim CurrentDate = DateTime.Now.ToString("MM/dd/yyyy")
                Dim CurrentTime = DateTime.Now.ToString("HH:mm:ss")

                Dim queryadjustment As String = "INSERT INTO F_ARADJ(INVOICE,DATE,AMOUNT,CUSTOMER,GL,REASON,ADDUSER,ADDDATE,ADDTIME,ADDAPP) VALUES(" & xInvoice & ",'" & xDate & "'," & xAmount & "," & xCust & ",'" & xGL & "','" & xReason & "','" & If(User.Length > 10, User.Substring(0, 10), User) & "','" & CurrentDate & "','" & CurrentTime & "','WEB')"

                Using cmd As New SqlCommand(queryadjustment, con)
                    cmd.ExecuteNonQuery()
                End Using
                Payments.wtreodcash(xAmount, "TOTALADJ")

            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Posting Payments to adjustment file")
            Throw ex
        End Try
    End Function

    Public Shared Function wtreodcash(ByVal xAmount As Decimal, ByVal FieldName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmdEODCASH As New SqlCommand("SELECT COUNT(*) FROM EODCASH", con)

                    Dim count As Int16 = Convert.ToInt16(cmdEODCASH.ExecuteScalar())
                    Dim queryeodcash As String = ""
                    If count > 0 Then

                        queryeodcash = "UPDATE EODCASH SET " & FieldName & " = isnull(" & FieldName & ",0.00) + " & xAmount
                    Else
                        queryeodcash = "INSERT INTO EODCASH(" & FieldName & ") VALUES(" & xAmount & ")"
                    End If
                    Using updEODCASH As New SqlCommand(queryeodcash, con)
                        updEODCASH.ExecuteNonQuery()
                    End Using
                End Using

            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Posting Payments to eodcash file")
            Throw ex
        End Try
    End Function

    Public Shared Function wtrdepositheader(ByVal xAmount As Decimal, ByVal xDeposit As Integer, ByVal xBank As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                'Dim queryDeposit As String = "UPDATE TBLDEPOSITHEADER SET TOTALAMOUNT=TOTALAMOUNT+" & xAmount & ",UPDUSER=@UpdUser,UPDDATE=@UpdDate,UPDTIME=@UpdTime,UPDAPP='WEB' WHERE DEPOSIT=" & xDeposit & " AND BANK='" & xBank & "'"
                Dim queryDeposit As String = "update dh set TOTALAMOUNT= c.AMOUNT,UPDUSER=@UpdUser,UPDDATE=@UpdDate,UPDTIME=@UpdTime,UPDAPP='WEB' from tblDepositHeader dh " +
                " left join (select SUM(AMOUNT) AMOUNT,DEPOSIT,BANK from f_cash group by DEPOSIT,BANK) c on c.DEPOSIT=dh.DEPOSIT and c.BANK=dh.BANK WHERE dh.DEPOSIT=" & xDeposit & " AND dh.BANK='" & xBank & "'"
                Using cmd As New SqlCommand(queryDeposit, con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@UpdUser", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
                    cmd.Parameters.AddWithValue("@UpdDate", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy"))
                    cmd.Parameters.AddWithValue("@UpdTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd.ExecuteNonQuery()
                End Using

            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Posting Payments to deposit header file")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCustomerListForPostPayments(ByVal Customer As String, ByVal lParentchecked As Boolean, ByVal IsPaymentsWithZeroBalance As String, ByVal IsByViewOpen As Boolean, ByVal viewDate As String) As List(Of Payment)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Payment)()

            Dim TotalAmount As Decimal = 0.00
            Dim TotalPayment As Decimal = 0.00
            Dim TotalCredits As Decimal = 0.00
            Dim TotalBalance As Decimal = 0.00
            Dim TotalAdjustment As Decimal = 0.00
            Dim AccumulatedBalance As Decimal = 0.00
            Dim TotalAccumulatedBalance As Decimal = 0.00
            Using con As New SqlConnection(ConStr)
                con.Open()

                '21 Mar 19 :: Muthu Nivetha M :: Post to an open invoice that has been set to scanned, same day. :: Starts
                'Dim qry = If(IsByViewOpen = False, "[sp_GetPostPaymentByCustomer]", "[Sp_GetPostPaymentByCustomerForViewOpen]")
                Dim qry = "sp_GetPostPaymentByCustomer"
                ' Dim qry = "Sp_GetPostPaymentByCustomerForViewOpen"

                Using cmd As New SqlCommand(qry, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    cmd.Parameters.AddWithValue("@lParentchecked", lParentchecked)
                    cmd.Parameters.AddWithValue("@IsPaymentsWithZeroBalance", IsPaymentsWithZeroBalance)
                    'cmd.Parameters.AddWithValue("@ViewOpendate", If(IsByViewOpen = True, viewDate, ""))
                    'cmd.Parameters.AddWithValue("@IsViewOpen", If(IsByViewOpen = True, 1, 0))
                    '21 Mar 19 :: Muthu Nivetha M :: Post to an open invoice that has been set to scanned, same day. :: Ends

                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim u As New Payment()
                        u.Invoice = If(row("Invoice") Is DBNull.Value, 0, row("Invoice"))

                        u.Customer = If(row("Customer") Is DBNull.Value, 0, row("Customer"))

                        Using custCmd As New SqlCommand("select ISNULL(Name,'') CustName from f_cust where Customer in(" + u.Customer.ToString() + ")", con)
                            custCmd.CommandType = CommandType.Text
                            Using custReader As SqlDataReader = custCmd.ExecuteReader()
                                While custReader.Read()
                                    u.CustName = Convert.ToString(custReader("CustName"))
                                End While
                            End Using
                        End Using

                        u.Charges = If(row("Charges") Is DBNull.Value, 0.00, row("Charges"))
                        u.Payments = If(row("Payments") Is DBNull.Value, 0.00, row("Payments"))
                        u.Credits = If(row("Credits") Is DBNull.Value, 0.00, row("Credits"))
                        u.Adjustment = If(row("Adjustments") Is DBNull.Value, 0.00, row("Adjustments"))
                        Try
                            'u.RecDate = Convert.ToDateTime(row("StatementDate"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                            u.RecDate = Convert.ToDateTime(row("StatementDate"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy")
                            u.InvDate = Convert.ToDateTime(row("INVDATE"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy")
                        Catch ex As Exception
                            u.RecDate = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy")
                            u.InvDate = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy")
                        End Try

                        u.Balance = u.Charges - u.Payments - u.Credits - u.Adjustment
                        AccumulatedBalance += u.Balance
                        u.AccumulatedBalance = AccumulatedBalance

                        u.PO = Convert.ToString(row("PO"))
                        u.Shipto = Convert.ToString(row("Shipto"))
                        u.Carrier = Convert.ToString(row("Carrier"))
                        u.AWB = Convert.ToString(row("AWB"))
                        u.WH = Convert.ToString(row("WH"))
                        u.Shipto = Convert.ToString(row("Shipto"))
                        u.ShiptoName = Convert.ToString(row("SHIPTONAME"))
                        u.ShiptoAddress1 = Convert.ToString(row("SHIPTOADD1"))
                        u.ShiptoAddress2 = Convert.ToString(row("SHIPTOADD2"))
                        u.ShiptoCity = Convert.ToString(row("SHIPTOCITY"))
                        u.ShiptoState = Convert.ToString(row("SHIPTOST"))
                        u.ShiptoZip = Convert.ToString(row("ShiptoZip"))
                        TotalAmount += u.Charges
                        TotalPayment += u.Payments
                        TotalCredits += u.Credits
                        TotalAdjustment += u.Adjustment
                        TotalBalance += u.Charges - u.Payments - u.Credits - u.Adjustment
                        'TotalAccumulatedBalance += AccumulatedBalance

                        uList.Add(u)
                    Next

                End Using
            End Using

            Dim t As New Payment()
            t.Invoice = 0
            t.Customer = 0
            t.CustName = ""
            t.Charges = TotalAmount
            t.Payments = TotalPayment
            t.Credits = TotalCredits
            t.Adjustment = TotalAdjustment
            t.Balance = TotalBalance
            't.AccumulatedBalance = TotalBalance
            t.PO = ""
            t.Shipto = ""
            t.RecDate = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy")
            t.Carrier = ""
            t.AWB = ""
            t.WH = ""
            t.ShiptoName = ""
            t.ShiptoAddress1 = ""
            t.ShiptoAddress2 = ""
            t.ShiptoCity = ""
            t.ShiptoState = ""
            t.ShiptoZip = ""
            t.InvDate = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy")
            uList.Add(t)
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerListForPostPayments")
            Throw ex
        End Try
    End Function

    Public Shared Function CheckAndGetPODetails(ByVal xPO As String, ByVal xDate As String) As List(Of Payment)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim InvResult As String = ""
            Dim uList As New List(Of Payment)
            Using con As New SqlConnection(ConStr)
                con.Open()
                'check PO at VET1_ 
                Using checkCmd As New SqlCommand("select count(*) from VET1_ where PO=@xPO and PO not in('','0')", con)
                    checkCmd.CommandType = CommandType.Text
                    checkCmd.Parameters.AddWithValue("@xPO", xPO)
                    Dim invCount As Integer = checkCmd.ExecuteScalar()
                    'PO availed at VET1_
                    If invCount > 0 Then
                        Dim u As New Payment()
                        'get customer# and invoice for the corresponding PO
                        Using vetCmd As New SqlCommand("select top 1 vet1_.Customer,Invoice,Date from vet1_  inner join F_CUST on F_CUST.customer = vet1_.Customer where PO=@xPO", con)
                            vetCmd.Parameters.AddWithValue("@xPO", xPO)
                            Using vetReader As SqlDataReader = vetCmd.ExecuteReader()
                                While (vetReader.Read())
                                    u.Customer = Convert.ToString(vetReader("Customer"))
                                    u.Invoice = Convert.ToString(vetReader("Invoice"))
                                    u.InvDate = vetReader("Date")
                                End While
                            End Using
                        End Using

                        'calculate sum of all transactions and customer for that PO
                        'Using arinvCmd As New SqlCommand("select SUM(case when Type in(1,5,8) then Amount else 0 end) as Charges, SUM(case when Type in(2,9,4,'A','B') then IIF([Type]=4 or [Type]='A' or [Type]='B',-1*(Amount),Amount) else 0 end) as Payments,	SUM(case when Type in(6) then Amount else 0 end) as Credits, SUM(case when Type in(3) then Amount else 0 end) as Adjustments, customer from f_arinvs where Invoice=@xInvoice group by CUSTOMER", con)
                        Using arinvCmd As New SqlCommand("select SUM(case when f_arinvs.Type in(1,5,8) then Amount else 0 end) as Charges, SUM(case when f_arinvs.Type in(2,9,4,'A','B') then IIF(f_arinvs.Type=4 or f_arinvs.Type='A' or f_arinvs.Type='B',-1*(Amount),Amount) else 0 end) as Payments,	SUM(case when f_arinvs.Type in(6) then Amount else 0 end) as Credits, SUM(case when f_arinvs.Type in(3) then Amount else 0 end) as Adjustments, f_arinvs.customer,F_CUST.name from f_arinvs inner join F_CUST on F_CUST.customer = f_arinvs.Customer where Invoice=@xInvoice group by f_arinvs.CUSTOMER,F_CUST.name", con)
                            arinvCmd.CommandType = CommandType.Text
                            arinvCmd.Parameters.AddWithValue("@xInvoice", u.Invoice)

                            Using row As SqlDataReader = arinvCmd.ExecuteReader()
                                While (row.Read())
                                    u.Charges = row("Charges")
                                    u.Payments = row("Payments")
                                    u.Credits = row("Credits")
                                    u.Adjustment = row("Adjustments")
                                    u.Balance = u.Charges - u.Payments - u.Credits - u.Adjustment
                                    u.Customer = Convert.ToString(row("customer"))
                                    u.CustName = Convert.ToString(row("name"))
                                End While
                            End Using


                            Dim InvBalance As Decimal = u.Balance
                            u.Discount = InvBalance * GetDiscountForCustomer(u.InvDate, u.Customer, xDate) / 100
                            u.Balance = InvBalance - u.Discount

                            u.ErrorMessage = ""
                            uList.Add(u)
                        End Using

                        'Invoice not availed at ARINVS
                    Else
                        Dim t As New Payment()
                        t.ErrorMessage = "PO not in the system."
                        uList.Add(t)
                    End If
                End Using
                con.Close()
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckAndGetPODetails")
            Throw ex
        End Try
    End Function

    Public Shared Function SaveCSVFilesToTemp(ByVal FileName As String, ByVal fileType As String) As Payment
        'FileName = HttpContext.Current.Server.MapPath(Path.Combine("~/App_Data/", FileName))
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim User As New User
        If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
            User = System.Web.HttpContext.Current.Session("LoginUserDetails")
        End If
        Using SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()

            Dim Cmd As SqlCommand = SqlCon.CreateCommand()
            Dim Trans As SqlTransaction = SqlCon.BeginTransaction("MyTrans")
            Cmd.Connection = SqlCon
            Cmd.Transaction = Trans
            Dim ReportExportFolder = ConfigurationManager.AppSettings("ExportFolder").ToString()
            Dim Deposit = FileName.Split("$")(1)

            'Dim FolderName = String.Format(ConfigurationManager.AppSettings("PostAFilePaymentsFilesPath"), Deposit.Split(".")(0))
            'FileName = HttpContext.Current.Server.MapPath("~/" + FolderName + "/" + FileName)
            Dim FilePath As String = ConfigurationManager.AppSettings("VendorEmailsFolder").ToString() + "\" + ReportExportFolder + "\" + FileName


            Try
                'create temp table
                Cmd.CommandText = "create table #TempPostPay(Customer int ,[Check] int,CheckDate date,Invoice int,PO varchar(25) COLLATE database_default,Amount decimal(11,2),Discount decimal(11,2),Credits decimal(11,2),Reason varchar(max) COLLATE database_default)"
                Cmd.ExecuteNonQuery()
                Cmd.Dispose()
                'If CommonUtilities.ExportToCSV.XLSToCSV("[Customer #] As Customer, [Check #] As Check, [Check Date] As CheckDate, [INVOICE #] As Invoice, [PO] As PO," +
                '                       "[Invoice $$$] as Amount, [ Discount] as Discount, [Credits] as Credits, [Reason Discount] As Reason", FileName, True) Then

                '    FileName = FileName + ".converted"
                'Else
                '    Throw New Exception("Unable To read Excel file")

                'End If

                'bulk insert records
                Using file As New StreamReader(FilePath)
                    Dim csv As New CsvReader(file, True)
                    Dim copy As New SqlBulkCopy(SqlCon, SqlBulkCopyOptions.KeepIdentity, Trans)
                    copy.DestinationTableName = "#TempPostPay"
                    copy.WriteToServer(csv)
                    file.Close()
                    file.Dispose()
                End Using




                Cmd.CommandText = "select distinct PO from #TempPostPay where PO not in (select distinct PO from VET1_)"
                Cmd.CommandType = CommandType.Text
                Dim poDA As New SqlDataAdapter(Cmd)
                Dim poDT As New DataTable
                poDA.Fill(poDT)
                Dim mailBody As String = ""
                If (poDT.Rows.Count > 0) Then
                    Dim pay As New Payment()
                    For Each row In poDT.Rows
                        mailBody += row("PO") + Environment.NewLine
                    Next
                    pay.ErrorMessage = "Wrong POs"
                    Logs.SendEmail(User.Email, User.Email + ",msantana@galleriafarms.com,jose@dflower.net", mailBody, ReportExportFolder + "\" + FileName, "RE: Wrong POs found in payment detail file for deposit# " + Deposit)
                    Return pay
                Else

                    Cmd.CommandText = "select * from #TempPostPay"
                    Cmd.CommandType = CommandType.Text
                    Dim sessionTempDA As New SqlDataAdapter(Cmd)
                    Dim sessionTempDT As New DataTable
                    sessionTempDA.Fill(sessionTempDT)
                    HttpContext.Current.Session("TempPostPay") = sessionTempDT
                    Cmd.Dispose()


                    Cmd.CommandText = "select sum(isnull(Amount,0.0))+ sum(isnull(Discount,0.0))+ sum(isnull(Credits,0.0)) TotalAmount,[check] from #TempPostPay  group by [check]"
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim pay As New Payment()
                        If Not IsDBNull(row("Check")) Then
                            pay.Check = If(row("Check") Is DBNull.Value, 0, row("Check"))
                            pay.Amount = If(row("TotalAmount") Is DBNull.Value, 0.00, row("TotalAmount"))
                            Return pay
                        End If
                    Next
                    Cmd.Dispose()

                End If


                Cmd.Dispose()
                Trans.Commit()

            Catch ex As Exception
                Try
                    Trans.Rollback()
                Catch ex2 As Exception
                End Try
                ErrorLogs.LogException(ex, "Error in SaveCSVFilesToTemp")
                'Return "Unable to import the file! " + ex.Message
                Throw ex
            End Try
        End Using
        Return Nothing

    End Function

    Public Shared Function ApplyPaymentsForPostAFile(ByVal Deposit As String, ByVal DepositDate As String, ByVal Bank As String, ByVal Amount As String, ByVal Check As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If

                Dim Cmd As SqlCommand = con.CreateCommand()
                Dim Trans As SqlTransaction = con.BeginTransaction("MyTrans")
                Cmd.Connection = con
                Cmd.Transaction = Trans

                Dim DepositCount As Integer = 0

                Cmd.CommandText = "select count(*) from f_cash where Deposit=@Deposit and Bank=@Bank"
                Cmd.CommandType = CommandType.Text
                Cmd.Parameters.AddWithValue("@Deposit", Deposit)
                Cmd.Parameters.AddWithValue("@Bank", Bank)
                DepositCount = Cmd.ExecuteScalar()

                If DepositCount > 0 Then
                    Return "This deposit number already exists"
                Else
                    Dim sessionTempDT As New DataTable
                    sessionTempDT = HttpContext.Current.Session("TempPostPay")

                    Dim ptype As String = ""
                    Dim nToApply As Decimal = 0.00
                    Dim nCheck As Integer = 0
                    Dim nCustomer As Integer = 0
                    Dim nInvoice As Integer = 0


                    If (sessionTempDT.Rows.Count > 0) Then

                        For Each row In sessionTempDT.Rows

                            'Updating payment details on Customer table
                            If (row("Customer") > 0 And row("Invoice") > 0) Then
                                Cmd.CommandText = "update f_cust set ytdpay=ytdpay+@Amount,lastpayamt= case lastpayamt when @CheckDate then  @Amount + lastpayamt+@Discount else @Amount+@Discount end,lastpay=iif(lastpayamt<>@CheckDate,@CheckDate,lastpay),Balance=Balance - @Amount+@Discount where Customer=@Customer and Invoice=@Invoice"
                                Cmd.CommandType = CommandType.Text
                                Cmd.Parameters.AddWithValue("Amount", row("Amount"))
                                Cmd.Parameters.AddWithValue("ChekDate", row("CheckDate"))
                                Cmd.Parameters.AddWithValue("Discount", row("Discount"))
                                Cmd.Parameters.AddWithValue("Customer", row("Customer"))
                                Cmd.ExecuteNonQuery()
                                Cmd.Dispose()

                                'set type depends on check value
                                If (row("Check") = 0) Then
                                    ptype = "1"
                                Else
                                    ptype = "2"
                                End If

                                'entry and pass values to cash table
                                wtrcash(row("Invoice"), DepositDate, ptype, row("Check"), row("Amount") + row("Discount"), row("Customer"), Deposit, Bank, Space(5))

                                WRTAR(row("Invoice"), DepositDate, "2", row("Check"), row("Amount") + row("Discount"), row("Customer"), row("Discount"), Deposit, "", "")

                                'totDep += Payments -> Amount - (Payments -> discount) * -1

                                If (row("Discount") <> 0) Then
                                    WRTAR(row("Invoice"), DepositDate, "3", row("Check"), row("Discount") * -1, row("Customer"), row("Discount"), Deposit, "", "")

                                    Cmd.CommandText = "update f_aradj set Date=@DepositDate, Amount=(@Discount)*-1,Reason=@Reason,Batch=@Deposit  where Customer=@Customer and Invoice=@Invoice"
                                    Cmd.CommandType = CommandType.Text
                                    Cmd.Parameters.AddWithValue("Invoice", row("Invoice"))
                                    Cmd.Parameters.AddWithValue("Customer", row("Customer"))
                                    Cmd.Parameters.AddWithValue("DepositDate", row("DepositDate"))
                                    Cmd.Parameters.AddWithValue("Discount", row("Discount"))
                                    Cmd.Parameters.AddWithValue("Reason", row("Reason"))
                                    Cmd.Parameters.AddWithValue("Deposit", Deposit)
                                    Cmd.ExecuteNonQuery()
                                    Cmd.Dispose()


                                    Cmd.CommandText = "update eodcash set totaladj=totaladj + (@Discount)*-1 "
                                    Cmd.CommandType = CommandType.Text
                                    Cmd.Parameters.AddWithValue("Discount", row("Discount"))
                                    Cmd.ExecuteNonQuery()
                                    Cmd.Dispose()
                                End If
                            End If     'END customer<>0 and Invoice<>0


                            'Checking if PO not empty
                            If (row("PO") <> "") Then
                                If row("Amount") <> 0 Or row("Discount") <> 0 Or row("Credits") <> 0 Then
                                    nToApply = row("Amount") + row("Discount")
                                    nCheck = row("Check")
                                    nCustomer = 0
                                    nInvoice = 0


                                    Cmd.CommandText = "select Invoice,Customer,PO from vet1_ where PO in(@PO) and void=0"
                                    Cmd.CommandType = CommandType.Text
                                    Cmd.Parameters.AddWithValue("PO", row("PO"))
                                    Dim salesDA As New SqlDataAdapter(Cmd)
                                    Dim salesDT As New DataTable
                                    salesDA.Fill(salesDT)
                                    For Each salesRow In salesDT.Rows
                                        wtrcash(salesRow("Invoice"), DepositDate, "2", row("check"), row("credits"), salesRow("Customer"), Deposit, Bank, Space(5))
                                        WRTAR(salesRow("Invoice"), DepositDate, "2", row("check"), row("credits"), salesRow("Customer"), 0.00, 0, "Credit", "")
                                    Next

                                End If
                            End If

                        Next

                    End If


                    Return ""
                End If

                Cmd.Dispose()
                Trans.Commit()

            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Posting Payments to deposit header file")
            Throw ex
        End Try
    End Function

    Public Shared Function GetSalesSummaryDetails(ByVal SummaryBy As String, ByVal SalesYear As Integer) As List(Of Payment)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim UList As New List(Of Payment)

            Dim Year1TotalSales As Decimal = 0.00
            Dim Year2TotalSales As Decimal = 0.00
            Dim Year3TotalSales As Decimal = 0.00
            Dim Year4TotalSales As Decimal = 0.00
            Dim Year5TotalSales As Decimal = 0.00

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UDP_YearWiseSalesDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@selectedDate", Date.Now)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    Dim summaryDT As New DataTable

                    If (SummaryBy = "CustomerSummary") Then
                        summaryDT = ds.Tables(0)
                    ElseIf (SummaryBy = "SalesPersonSummary") Then
                        summaryDT = ds.Tables(1)
                    Else
                        summaryDT = ds.Tables(2)
                    End If

                    For Each row In summaryDT.Rows
                        Dim u As New Payment

                        If (SummaryBy = "CustomerSummary") Then
                            u.Customer = row("Cust#")
                            u.CustName = row("CustomerName")
                        ElseIf (SummaryBy = "SalesPersonSummary") Then
                            u.SalesmanName = row("SalesmanName")
                        End If
                        u.Salesman = row("Salesman#")
                        u.SalesValue1 = row("" & SalesYear & "")
                        u.SalesValue2 = row("" & SalesYear - 1 & "")
                        u.SalesValue3 = row("" & SalesYear - 2 & "")
                        u.SalesValue4 = row("" & SalesYear - 3 & "")
                        u.SalesValue5 = row("" & SalesYear - 4 & "")

                        Year1TotalSales += u.SalesValue1
                        Year2TotalSales += u.SalesValue2
                        Year3TotalSales += u.SalesValue3
                        Year4TotalSales += u.SalesValue4
                        Year5TotalSales += u.SalesValue5

                        UList.Add(u)
                    Next
                End Using
            End Using

            'Add Total count at last line
            Dim lastRow As New Payment()
            If (SummaryBy = "CustomerSummary") Then
                lastRow.Customer = 0
                lastRow.CustName = ""
            ElseIf (SummaryBy = "SalesPersonSummary") Then
                lastRow.SalesmanName = ""
            End If
            lastRow.Salesman = 0
            lastRow.SalesValue1 = Year1TotalSales
            lastRow.SalesValue2 = Year2TotalSales
            lastRow.SalesValue3 = Year3TotalSales
            lastRow.SalesValue4 = Year4TotalSales
            lastRow.SalesValue5 = Year5TotalSales
            UList.Add(lastRow)

            Return UList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesSummaryDetails")
            Return Nothing
        End Try
    End Function
End Class

Public Class Payment

    Private _RecDate As String
    Public Property RecDate() As String
        Get
            Return _RecDate
        End Get
        Set(ByVal value As String)
            _RecDate = value
        End Set
    End Property

    Private _Charges As Decimal
    Public Property Charges() As Decimal
        Get
            Return _Charges
        End Get
        Set(ByVal value As Decimal)
            _Charges = value
        End Set
    End Property

    Private _Payments As Decimal
    Public Property Payments() As Decimal
        Get
            Return _Payments
        End Get
        Set(ByVal value As Decimal)
            _Payments = value
        End Set
    End Property

    Private _Credits As Decimal
    Public Property Credits() As Decimal
        Get
            Return _Credits
        End Get
        Set(ByVal value As Decimal)
            _Credits = value
        End Set
    End Property

    Private _Balance As Decimal
    Public Property Balance() As Decimal
        Get
            Return _Balance
        End Get
        Set(ByVal value As Decimal)
            _Balance = value
        End Set
    End Property

    Private _AccumulatedBalance As Decimal
    Public Property AccumulatedBalance() As Decimal
        Get
            Return _AccumulatedBalance
        End Get
        Set(ByVal value As Decimal)
            _AccumulatedBalance = value
        End Set
    End Property

    Private _Adjustment As Decimal
    Public Property Adjustment() As Decimal
        Get
            Return _Adjustment
        End Get
        Set(ByVal value As Decimal)
            _Adjustment = value
        End Set
    End Property

    Private _Shipto As String
    Public Property Shipto() As String
        Get
            Return _Shipto
        End Get
        Set(ByVal value As String)
            _Shipto = value
        End Set
    End Property

    Private _Carrier As String
    Public Property Carrier() As String
        Get
            Return _Carrier
        End Get
        Set(ByVal value As String)
            _Carrier = value
        End Set
    End Property

    Private _AWB As String
    Public Property AWB() As String
        Get
            Return _AWB
        End Get
        Set(ByVal value As String)
            _AWB = value
        End Set
    End Property

    Private _WH As String
    Public Property WH() As String
        Get
            Return _WH
        End Get
        Set(ByVal value As String)
            _WH = value
        End Set
    End Property

    Private _Scanned As String
    Public Property Scanned() As String
        Get
            Return _Scanned
        End Get
        Set(ByVal value As String)
            _Scanned = value
        End Set
    End Property

    Private _ARINVSelected As Boolean
    Public Property ARINVSelected() As Boolean
        Get
            Return _ARINVSelected
        End Get
        Set(value As Boolean)
            _ARINVSelected = value
        End Set
    End Property

    Private _ShiptoName As String
    Public Property ShiptoName() As String
        Get
            Return _ShiptoName
        End Get
        Set(ByVal value As String)
            _ShiptoName = value
        End Set
    End Property

    Private _ShiptoAddress1 As String
    Public Property ShiptoAddress1() As String
        Get
            Return _ShiptoAddress1
        End Get
        Set(ByVal value As String)
            _ShiptoAddress1 = value
        End Set
    End Property

    Private _ShiptoAddress2 As String
    Public Property ShiptoAddress2() As String
        Get
            Return _ShiptoAddress2
        End Get
        Set(ByVal value As String)
            _ShiptoAddress2 = value
        End Set
    End Property

    Private _ShiptoCity As String
    Public Property ShiptoCity() As String
        Get
            Return _ShiptoCity
        End Get
        Set(ByVal value As String)
            _ShiptoCity = value
        End Set
    End Property

    Private _ShiptoState As String
    Public Property ShiptoState() As String
        Get
            Return _ShiptoState
        End Get
        Set(ByVal value As String)
            _ShiptoState = value
        End Set
    End Property

    Private _ShiptoZip As String
    Public Property ShiptoZip() As String
        Get
            Return _ShiptoZip
        End Get
        Set(ByVal value As String)
            _ShiptoZip = value
        End Set
    End Property

    Private _TERMSCODE As String
    Public Property TERMSCODE() As String
        Get
            Return _TERMSCODE
        End Get
        Set(ByVal value As String)
            _TERMSCODE = value
        End Set
    End Property

    Private _Discount As Decimal
    Public Property Discount() As Decimal
        Get
            Return _Discount
        End Get
        Set(ByVal value As Decimal)
            _Discount = value
        End Set
    End Property

    Private _DDays As Integer
    Public Property DDays() As Integer
        Get
            Return _DDays
        End Get
        Set(ByVal value As Integer)
            _DDays = value
        End Set
    End Property

    Private _InvDate As String
    Public Property InvDate() As String
        Get
            Return _InvDate
        End Get
        Set(ByVal value As String)
            _InvDate = value
        End Set
    End Property

    Private _ErrorMessage As String
    Public Property ErrorMessage() As String
        Get
            Return _ErrorMessage
        End Get
        Set(value As String)
            _ErrorMessage = value
        End Set
    End Property

    Private _PaymentsID As Integer
    Public Property PaymentsID() As Integer
        Get
            Return _PaymentsID
        End Get
        Set(value As Integer)
            _PaymentsID = value
        End Set
    End Property

    Private _DetailID As Integer
    Public Property DetailID() As Integer
        Get
            Return _DetailID
        End Get
        Set(value As Integer)
            _DetailID = value
        End Set
    End Property

    Private _Deposit As Integer = 0
    Public Property Deposit() As Integer
        Get
            Return _Deposit
        End Get
        Set(ByVal value As Integer)
            _Deposit = value
        End Set
    End Property

    Private _DepositDate As String
    Public Property DepositDate() As String
        Get
            Return _DepositDate
        End Get
        Set(ByVal value As String)
            _DepositDate = value
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

    Private _Amount As Decimal = 0.00
    Public Property Amount() As Decimal
        Get
            Return _Amount
        End Get
        Set(ByVal value As Decimal)
            _Amount = value
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

    Private _Type As String = ""
    Public Property Type() As String
        Get
            Return _Type
        End Get
        Set(value As String)
            _Type = value
        End Set
    End Property

    Private _Check As Integer = 0
    Public Property Check() As Integer
        Get
            Return _Check
        End Get
        Set(value As Integer)
            _Check = value
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

    Private _PO As String = ""
    Public Property PO() As String
        Get
            Return _PO
        End Get
        Set(value As String)
            _PO = value
        End Set
    End Property

    Private _GL As String = ""
    Public Property GL() As String
        Get
            Return _GL
        End Get
        Set(value As String)
            _GL = value
        End Set
    End Property

    Private _CTA As String = ""
    Public Property CTA() As String
        Get
            Return _CTA
        End Get
        Set(value As String)
            _CTA = value
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
    Public Property LockedUserID() As Boolean
        Get
            Return _LockedUserID
        End Get
        Set(ByVal value As Boolean)
            _LockedUserID = value
        End Set
    End Property

    Private _DepositLockContent As String
    Public Property DepositLockContent() As String
        Get
            Return _DepositLockContent
        End Get
        Set(value As String)
            _DepositLockContent = value
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

    Private _ADDUSER As String
    Public Property ADDUSER() As String
        Get
            Return _ADDUSER
        End Get
        Set(ByVal value As String)
            _ADDUSER = value
        End Set
    End Property

    Private _ADDDATE As String
    Public Property ADDDATE() As String
        Get
            Return _ADDDATE
        End Get
        Set(ByVal value As String)
            _ADDDATE = value
        End Set
    End Property

    Private _ADDTIME As String
    Public Property ADDTIME() As String
        Get
            Return _ADDTIME
        End Get
        Set(value As String)
            _ADDTIME = value
        End Set
    End Property

    Private _ADDAPP As String
    Public Property ADDAPP() As String
        Get
            Return _ADDAPP
        End Get
        Set(ByVal value As String)
            _ADDAPP = value
        End Set
    End Property

    Private _UPDUSER As String
    Public Property UPDUSER() As String
        Get
            Return _UPDUSER
        End Get
        Set(ByVal value As String)
            _UPDUSER = value
        End Set
    End Property

    Private _UPDDATE As String
    Public Property UPDDATE() As String
        Get
            Return _UPDDATE
        End Get
        Set(ByVal value As String)
            _UPDDATE = value
        End Set
    End Property

    Private _UPDTIME As String
    Public Property UPDTIME() As String
        Get
            Return _UPDTIME
        End Get
        Set(value As String)
            _UPDTIME = value
        End Set
    End Property

    Private _UPDAPP As String
    Public Property UPDAPP() As String
        Get
            Return _UPDAPP
        End Get
        Set(ByVal value As String)
            _UPDAPP = value
        End Set
    End Property

    Private _DELUSER As String
    Public Property DELUSER() As String
        Get
            Return _DELUSER
        End Get
        Set(ByVal value As String)
            _DELUSER = value
        End Set
    End Property

    Private _DELDATE As String
    Public Property DELDATE() As String
        Get
            Return _DELDATE
        End Get
        Set(ByVal value As String)
            _DELDATE = value
        End Set
    End Property

    Private _DELTIME As String
    Public Property DELTIME() As String
        Get
            Return _DELTIME
        End Get
        Set(ByVal value As String)
            _DELTIME = value
        End Set
    End Property

    Private _DELAPP As String
    Public Property DELAPP() As String
        Get
            Return _DELAPP
        End Get
        Set(ByVal value As String)
            _DELAPP = value
        End Set
    End Property


    Private _LOCKUSER As String
    Public Property LOCKUSER() As String
        Get
            Return _LOCKUSER
        End Get
        Set(ByVal value As String)
            _LOCKUSER = value
        End Set
    End Property

    Private _LOCKDATE As String
    Public Property LOCKDATE() As String
        Get
            Return _LOCKDATE
        End Get
        Set(ByVal value As String)
            _LOCKDATE = value
        End Set
    End Property

    Private _LOCKTIME As String
    Public Property LOCKTIME() As String
        Get
            Return _LOCKTIME
        End Get
        Set(ByVal value As String)
            _LOCKTIME = value
        End Set
    End Property

    Private _LOCKAPP As String
    Public Property LOCKAPP() As String
        Get
            Return _LOCKAPP
        End Get
        Set(ByVal value As String)
            _LOCKAPP = value
        End Set
    End Property


    Private _Salesman As Integer = 0
    Public Property Salesman() As Integer
        Get
            Return _Salesman
        End Get
        Set(value As Integer)
            _Salesman = value
        End Set
    End Property

    Private _SalesmanName As String = ""
    Public Property SalesmanName() As String
        Get
            Return _SalesmanName
        End Get
        Set(value As String)
            _SalesmanName = value
        End Set
    End Property

    Private _SalesValue1 As Decimal = 0.00
    Public Property SalesValue1() As Decimal
        Get
            Return _SalesValue1
        End Get
        Set(value As Decimal)
            _SalesValue1 = value
        End Set
    End Property

    Private _SalesValue2 As Decimal = 0.00
    Public Property SalesValue2() As Decimal
        Get
            Return _SalesValue2
        End Get
        Set(value As Decimal)
            _SalesValue2 = value
        End Set
    End Property

    Private _SalesValue3 As Decimal = 0.00
    Public Property SalesValue3() As Decimal
        Get
            Return _SalesValue3
        End Get
        Set(value As Decimal)
            _SalesValue3 = value
        End Set
    End Property

    Private _SalesValue4 As Decimal = 0.00
    Public Property SalesValue4() As Decimal
        Get
            Return _SalesValue4
        End Get
        Set(value As Decimal)
            _SalesValue4 = value
        End Set
    End Property

    Private _SalesValue5 As Decimal = 0.00
    Public Property SalesValue5() As Decimal
        Get
            Return _SalesValue5
        End Get
        Set(value As Decimal)
            _SalesValue5 = value
        End Set
    End Property

    Private _InvoiceDate As Date
    Public Property InvoiceDate() As Date
        Get
            Return _InvoiceDate
        End Get
        Set(value As Date)
            _InvoiceDate = value
        End Set
    End Property

End Class


