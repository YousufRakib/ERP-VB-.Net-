Imports System.Data.SqlClient
Imports System.Data


Public Class ARINVS


    Public Shared Function PrintInvoiceswithDifferences(ByVal FromDate As String, ToDate As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim Qry As String = ""
                Qry = "spGetInvoiceswithDifferences"
                Using cmd As New SqlCommand(Qry, Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FROMDATE", FromDate)
                    cmd.Parameters.AddWithValue("@TODATE", ToDate)
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryReportByDay")
            Return Nothing
        End Try
    End Function
    Public Shared Function InsertARINVSStatementReportData(ByVal XMLData As String, ByVal UserID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spInsertARINVSStatementReportDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@XMLData", XMLData)
                    cmd.Parameters.AddWithValue("@UserID", UserID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertARINVSStatementReportData")
            Return "error"
        End Try
    End Function

    Public Shared Function GetUnAppliedAmountForCustomer(ByVal Customer As String) As Decimal
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Dim UnappliedAmount As Decimal = 0.00
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetARINVSUnappliedAmountforCustomer", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        UnappliedAmount = row("UnappliedAmount")
                    Next
                End Using
            End Using
            Return UnappliedAmount
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetUnAppliedAmountForCustomer")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' 31-Aug-2018 :: Anitha :: Change open query into sp
    ''' </summary>
    ''' <param name="AsOfDate"></param>
    ''' <returns></returns>
    Public Shared Function GetTotalBalanceOfAR(ByVal AsOfDate As String) As Decimal
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim TotalBalance As Decimal = 0.00
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetBalanceofARINVS", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@AsOfDate", AsOfDate)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        TotalBalance = row("TotalBalance")
                    Next
                End Using
            End Using
            Return TotalBalance.ToString("#,##0.00")
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetTotalBalanceOfAR")
            Throw ex
        End Try
    End Function

    Public Shared Function GetARSummaryDetails(ByVal StartDate As String, ByVal EndDate As String) As ARSummary
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetARSummary]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@StartDate", StartDate)
                    cmd.Parameters.AddWithValue("@EndDate", EndDate)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Dim AR As New ARSummary()
                        AR.TotalSales = dt(0)("TotalSales")
                        AR.TotalVoids = 0
                        AR.TotalPayments = dt(0)("TotalPayments")
                        AR.TotalAdjustments = dt(0)("TotalAdjustment")
                        AR.TotalReturnChecks = dt(0)("TotalReturnChecks")
                        AR.TotalLateCharges = dt(0)("TotalLateCharges")
                        AR.TotalCredits = dt(0)("TotalCredits")
                        AR.TotalUnapplied = dt(0)("TotalUnapplied")
                        AR.TotalDebits = dt(0)("TotalDebits")
                        AR.TotalCreditCardPayments = dt(0)("TotalCreditCardPayments")
                        AR.TotalCalcSales = dt(0)("TotalCalcSales")
                        AR.TotalCalcVoids = 0
                        AR.TotalCalcPayments = dt(0)("TotalCalcPayments")
                        AR.TotalCalcAdjustments = dt(0)("TotalCalcAdjustment")
                        AR.TotalCalcReturnChecks = dt(0)("TotalCalcReturnChecks")
                        AR.TotalCalcLateCharges = dt(0)("TotalCalcLateCharges")
                        AR.TotalCalcCredits = dt(0)("TotalCalcCredits")
                        AR.TotalCalcUnapplied = dt(0)("TotalCalcUnapplied")
                        AR.TotalCalcDebits = dt(0)("TotalCalcDebits")
                        AR.TotalCalcCreditCardPayments = dt(0)("TotalCalcCreditCardPayments")
                        AR.TotalDiffSales = dt(0)("TotalDiffSales")
                        AR.TotalDiffVoids = 0
                        AR.TotalDiffPayments = dt(0)("TotalDiffPayments")
                        AR.TotalDiffAdjustments = dt(0)("TotalDiffAdjustment")
                        AR.TotalDiffReturnChecks = dt(0)("TotalDiffReturnChecks")
                        AR.TotalDiffLateCharges = dt(0)("TotalDiffLateCharges")
                        AR.TotalDiffCredits = dt(0)("TotalDiffCredits")
                        AR.TotalDiffUnapplied = dt(0)("TotalDiffUnapplied")
                        AR.TotalDiffDebits = dt(0)("TotalDiffDebits")
                        AR.TotalDiffCreditCardPayments = dt(0)("TotalDiffCreditCardPayments")
                        Return AR
                    End If
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetARSummaryDetails")
            Throw ex
        End Try
        Return Nothing
    End Function


    Public Shared Function GetDetailedAgeingReportData(ByVal StatementDate As String, ByVal SalesPerson As String, ByVal Customer As String) As DataTable
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetAgeingDetailReportData]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@StatementDate", StatementDate)
                    cmd.Parameters.AddWithValue("@SalesPerson", SalesPerson)
                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return dt
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetDetailedAgeingReportData")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCountForInvoiceListing(ByVal InvoicesFromDate As String, InvoicesToDate As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim RowCount As Integer = 0

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using InvoicesCmd As New SqlCommand("spGetInvoiceswithDifferences", con)
                    InvoicesCmd.CommandType = CommandType.StoredProcedure
                    InvoicesCmd.Parameters.AddWithValue("@FromDate", InvoicesFromDate)
                    InvoicesCmd.Parameters.AddWithValue("@ToDate", InvoicesToDate)
                    Dim InvoiceAdapter As New SqlDataAdapter(InvoicesCmd)
                    Dim InvoiceDT As New DataTable()
                    InvoiceAdapter.Fill(InvoiceDT)
                    RowCount = Convert.ToInt32(InvoiceDT.Rows.Count)
                End Using
                con.Close()
            End Using
            Return RowCount
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCountForInvoiceListing")
            Throw ex
        End Try
    End Function

    Public Shared Function GetNacmReportData(ByVal StatementDate As String) As DataTable
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetNacmReportData", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@StatementDate", StatementDate)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return dt
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetNacmReportData")
            Throw ex
        End Try
    End Function
    Public Class GetARINVSForFgrd

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetARINVSDetailsForStatementReport(ByVal Customer As String, ByVal StatementDate As String) As List(Of ARINVSS)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of ARINVSS)()

                Dim TotalAmount As Decimal = 0.00
                Dim TotalPayment As Decimal = 0.00
                Dim TotalCredits As Decimal = 0.00
                Dim TotalBalance As Decimal = 0.00
                Dim TotalAdjustment As Decimal = 0.00
                Dim AccumulatedBalance As Decimal = 0.00
                Using con As New SqlConnection(ConStr)
                    con.Open()

                    'Get Post Payment Details For the customer (Type 7 is Post payment, it has no invoices)
                    Using cmd As New SqlCommand("spGetARINVSDetailsForStatementReport", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@Customer", Customer)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        For Each row In dt.Rows
                            Dim u As New ARINVSS()
                            u.Invoice = Convert.ToDecimal(row("check")) 'There is no invoice# for type 7, so we are showing it as check no
                            u.Charges = 0.00
                            u.Payments = Convert.ToDecimal(row("Amount"))
                            u.Credits = 0.00
                            u.Adjustment = 0.00
                            u.RecDate = Convert.ToDateTime(Convert.ToDateTime(row.Item("RecDate")).ToString("MM/dd/yy"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                            u.Balance = u.Charges - u.Payments - u.Credits - u.Adjustment
                            AccumulatedBalance += u.Balance
                            u.AccumulatedBalance = AccumulatedBalance
                            TotalBalance += u.Balance
                            u.PO = "UnApplied"
                            u.Shipto = ""
                            u.Carrier = ""
                            u.AWB = ""
                            u.WH = ""
                            u.Shipto = ""
                            u.ShiptoName = ""
                            u.ShiptoAddress1 = ""
                            u.ShiptoAddress2 = ""
                            u.ShiptoCity = ""
                            u.ShiptoState = ""
                            u.ShiptoZip = ""

                            uList.Add(u)
                        Next
                    End Using

                    'Using cmd As New SqlCommand("Select AR.Invoice,AR.Amount,AR.[Type],AR.[Date] " +
                    '                            "from F_ARINVS AR " +
                    '                            "where AR.Customer=@Customer And AR.Customer<>0  And AR.Invoice <>0 And [Date]<= @StatementDate order by Date asc,invoice asc", con)

                    Using cmd As New SqlCommand("spGetDataForStatement", con)
                        '    "select * from " +
                        '    "(Select AR.Invoice,AR.Amount,AR.[Type],AR.[Date],isnull(vet1.PO,'') PO " +
                        '    "from F_ARINVS AR left join VET1_ VET1 on AR.INVOICE= VET1.INVOICE and AR.CUSTOMER=VET1.CUSTOMER where AR.Customer=@Customer And " +
                        '    "AR.Customer <> 0 And AR.Invoice <> 0 And AR.[Date] <= @StatementDate " +
                        '    "union all " +
                        '    "Select AR.Invoice, AR.Amount, AR.[Type], AR.[Date],isnull(vet1.PO,'') PO " +
                        '    "From ARHIST AR left join VET1_ VET1 on AR.INVOICE= VET1.INVOICE and AR.CUSTOMER=VET1.CUSTOMER where AR.Customer=@Customer And " +
                        '    "AR.Customer<>0  And AR.Invoice <>0 And AR.[Date]<= @StatementDate) a " +
                        '    "union all " +
                        '    "select or1.[ORDER] as Invoice, SUM(or2.FOB * or2.UNITS * or2.BOXES + (or2.TAX2 * or2.BOXES)) Amount,1 as Type, OR1.[DATE], " +
                        '    "OR1.PO From F_order1 or1 inner Join F_order2 or2 on or1.[ORDER]=or2.[ORDER] " +
                        '    "where Or1.DATE <= @StatementDate And or1.customer =@Customer and " +
                        '    "or1.hold<>'Y' and or1.void=0 " +
                        '    "Group by or1.[order], OR1.[DATE], OR1.PO " +
                        '    "order by Date asc, invoice asc", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@Customer", Customer)
                        cmd.Parameters.AddWithValue("@StatementDate", StatementDate)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        Dim OldInvoice As String = "0"
                        Dim Amount As Decimal = 0.00
                        Dim Payment As Decimal = 0.00
                        Dim Credits As Decimal = 0.00
                        Dim Adjustment As Decimal = 0.00
                        Dim RecDate As String = ""
                        Dim Type As String = ""

                        Dim dtinvoices As New DataTable
                        If dt.Rows.Count > 0 Then
                            Dim view As New DataView(dt)
                            dtinvoices = view.ToTable(True, "Invoice")
                        End If

                        For Each inv In dtinvoices.Rows
                            Dim dt1 As DataTable = dt.Select("Invoice='" + Convert.ToString(inv("Invoice")) + "'").CopyToDataTable()
                            Dim i = 1

                            Amount = 0.00
                            Payment = 0.00
                            Credits = 0.00
                            Adjustment = 0.00
                            RecDate = ""
                            Type = ""

                            For Each row In dt1.Rows
                                Type = Convert.ToString(row("Type"))

                                Select Case Type
                                    Case "1", "5", "8" 'Charges
                                        Amount += Convert.ToDecimal(row("Amount"))
                                        If Type = "1" Then
                                            RecDate = Convert.ToDateTime(row.Item("Date")).ToString("MM/dd/yy")
                                        End If
                                        If RecDate = "" Then
                                            RecDate = Convert.ToDateTime(row.Item("Date")).ToString("MM/dd/yy")
                                        End If
                                    Case "2", "9"  'Payment
                                        Payment += Convert.ToDecimal(row("Amount"))
                                    Case "B"       'Payment
                                        Payment -= Convert.ToDecimal(row("Amount"))
                                    Case "4", "A"  'Payment
                                        Payment -= Convert.ToDecimal(row("Amount"))
                                    Case "3", "6"       'Credits And Adjustment
                                        If RecDate = "" Then
                                            RecDate = Convert.ToDateTime(row.Item("Date")).ToString("MM/dd/yy")
                                        End If
                                        Credits += Convert.ToDecimal(row("Amount"))
                                    Case "7"
                                        If RecDate = "" Then
                                            RecDate = Convert.ToDateTime(row.Item("Date")).ToString("MM/dd/yy")
                                        End If
                                End Select

                                Dim u As New ARINVSS()
                                If i = dt1.Rows.Count Then
                                    u.Invoice = Convert.ToString(row("Invoice"))
                                    u.Charges = Amount
                                    u.Payments = Payment
                                    u.Credits = Credits
                                    u.Adjustment = Adjustment
                                    u.PO = row("PO")
                                    If RecDate <> "" Then
                                        u.RecDate = Convert.ToDateTime(RecDate, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                                    End If
                                    u.Balance = Amount - Payment - Credits - Adjustment
                                    AccumulatedBalance += u.Balance
                                    u.AccumulatedBalance = AccumulatedBalance
                                    TotalBalance += u.Balance
                                    uList.Add(u)
                                End If
                                i = i + 1
                            Next
                        Next
                    End Using
                End Using
                'If TotalBalance <= 0 Then
                ' Return Nothing
                ' Else
                'Return uList
                'End If
                Return uList

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetARINVSDetailsForStatementReport")
                Throw ex
            End Try
        End Function


        Public Function GetUnAppliedAmountDetailsForCustomer(ByVal Customer As String) As List(Of ARINVSS)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim UList As New List(Of ARINVSS)

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetARINVSUnappliedAmountDetailsforCustomer", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@Customer", Customer)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        For Each row In dt.Rows
                            Dim u As New ARINVSS
                            u.RecDate = Convert.ToString(row("DATE"))
                            If u.RecDate <> "" Then
                                u.RecDate = Convert.ToDateTime(u.RecDate).ToString("MM/dd/yy")
                            End If
                            u.Customer = Convert.ToString(row("Customer"))
                            u.Check = Convert.ToString(row("Check"))
                            u.Charges = Convert.ToDecimal(row("Amount"))
                            UList.Add(u)
                        Next
                    End Using
                End Using
                Return UList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error In GetUnAppliedAmountForCustomer")
                Throw ex
            End Try
        End Function

        Public Function GetARINVSDetailsForCustomer(ByVal Customer As String, ByVal ExcelExport As String, ByVal IsARINVHistory As Boolean) As List(Of ARINVSS)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of ARINVSS)()

                Dim TotalAmount As Decimal = 0.00
                Dim TotalPayment As Decimal = 0.00
                Dim TotalCredits As Decimal = 0.00
                Dim TotalBalance As Decimal = 0.00
                Dim TotalAdjustment As Decimal = 0.00
                Dim AccumulatedBalance As Decimal = 0.00
                Dim TotalAccumulatedBalance As Decimal = 0.00
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetARINVSByCustomer", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@Customer", Customer)
                        cmd.Parameters.AddWithValue("@ExcelExport", ExcelExport)
                        cmd.Parameters.AddWithValue("@IsARINVHistory", IsARINVHistory)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        For Each row In dt.Rows
                            Dim u As New ARINVSS()
                            u.Invoice = Convert.ToString(row("Invoice"))
                            u.Charges = row("Charges")
                            u.Payments = row("Payments")
                            u.Credits = row("Credits")
                            u.Adjustment = row("Adjustments")
                            Try
                                u.RecDate = Convert.ToDateTime(row("StatementDate"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                            Catch ex As Exception
                                u.RecDate = ""
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
                            u.Boxes = Convert.ToInt16(row("Boxes"))
                            u.FBE = Convert.ToDecimal(row("FBE"))
                            u.Cubes = Convert.ToDecimal(row("Cubes"))
                            TotalAmount += u.Charges
                            TotalPayment += u.Payments
                            TotalCredits += u.Credits
                            TotalAdjustment += u.Adjustment
                            TotalBalance += u.Charges - u.Payments - u.Credits - u.Adjustment
                            'TotalAccumulatedBalance += AccumulatedBalance
                            u.SLSMAN = IIf(row("SLSMAN") Is DBNull.Value, Convert.ToInt32(0), Convert.ToInt32(row("SLSMAN")))
                            u.EMAILED = IIf(row("Emailed") Is DBNull.Value, False, row("Emailed"))
                            uList.Add(u)
                        Next

                    End Using



                End Using

                Dim t As New ARINVSS()
                t.Invoice = 0
                t.Customer = 0
                t.Charges = TotalAmount
                t.Payments = TotalPayment
                t.Credits = TotalCredits
                t.Adjustment = TotalAdjustment
                t.Balance = TotalBalance
                t.AccumulatedBalance = TotalBalance
                t.PO = ""
                t.Shipto = ""
                t.RecDate = ""
                t.Carrier = ""
                t.AWB = ""
                t.WH = ""
                t.ShiptoName = ""
                t.ShiptoAddress1 = ""
                t.ShiptoAddress2 = ""
                t.ShiptoCity = ""
                t.ShiptoState = ""
                t.ShiptoZip = ""
                t.SLSMAN = 0
                uList.Add(t)
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetARINVSDetailsForCustomer")
                Throw ex
            End Try
        End Function

        Public Function GetARINVSViewPaymentsHeaderByCustomer(ByVal Customer As String) As List(Of ARINVSS)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of ARINVSS)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    'Type in ('2','7','4','9')  Type for "Payments" is 2,7,4,9
                    'Union to combine the data from f_arinvs and arhist also

                    Using cmd As New SqlCommand("spGetARINVSViewPaymentsHeaderByCustomer", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@Customer", Customer)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        For Each row In dt.Rows
                            Dim u As New ARINVSS()
                            'u.sqlID = Convert.ToString(row("SQLID"))
                            u.Check = Convert.ToString(row("check"))
                            u.PaymentType = Convert.ToString(row("PaymentType"))
                            'u.TypeName = Convert.ToString(row("TypeName"))
                            u.Payments = Convert.ToDecimal(row("Payment"))
                            u.Deposit = Convert.ToString(row("Deposit"))
                            Try
                                u.RecDate = Convert.ToDateTime(row.Item("Date")).ToString("MM/dd/yy")
                            Catch ex As Exception
                                u.RecDate = ""
                            End Try


                            uList.Add(u)
                        Next
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetARINVSViewPaymentsHeaderByCustomer")
                Throw ex
            End Try
        End Function

        Public Function GetARINVSViewPaymentsDetailsByCustomerAndCheck(ByVal Check As String, ByVal Customer As String, ByVal RecDate As String, ByVal Deposit As String) As List(Of ARINVSS)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of ARINVSS)()
                Dim TotalPayments As Decimal = 0.00
                Using con As New SqlConnection(ConStr)
                    con.Open()

                    'Type in ('2','7','4','9')  Type for "Payments" is 2,7,4,9
                    Using cmd As New SqlCommand("SpGetARINVSViewPaymentsDetailsByCustomerandCheck", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@Check", Check)
                        cmd.Parameters.AddWithValue("@Customer", Customer)
                        cmd.Parameters.AddWithValue("@RecDate", RecDate)
                        cmd.Parameters.AddWithValue("@Deposit", Deposit)

                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)

                        For Each row In dt.Rows
                            Dim u As New ARINVSS()
                            u.Invoice = Convert.ToString(row("Invoice"))
                            u.Payments = Convert.ToDecimal(row("Payment"))
                            TotalPayments += u.Payments
                            Try
                                u.RecDate = Convert.ToDateTime(row.Item("DATE")).ToString("MM/dd/yy")
                            Catch ex As Exception
                                u.RecDate = ""
                            End Try
                            u.PO = Convert.ToString(row("PO"))
                            uList.Add(u)
                        Next
                    End Using
                End Using

                Dim t As New ARINVSS()
                t.Invoice = "0_0"
                t.Payments = TotalPayments
                t.RecDate = ""
                t.PO = ""
                uList.Add(t)
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error In GetARINVSViewPaymentsDetailsByCustomer")
                Throw ex
            End Try
        End Function

        Public Function GetARINVTransactionsByInvoice(ByVal Invoice As String, ByVal IsARINVHistory As String) As List(Of ARINVSS)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of ARINVSS)()
                Dim aPaymentTypes() As String = {"Nothing", "Invoice", "Payment", "Adjustment", "Nsf", "LateChg", "Credit", "Unapplied", "Debit", "CreditCard", "StoppedPmt", "Voided", "Debit", "CC.Dispute"}
                Dim TotalAmount As Decimal = 0.00
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim Qry As String = ""
                    Dim cmd1 As CommandType
                    If IsARINVHistory = "0" Then
                        Qry = "Select * from vwGetARINVTransactionsByInvoice where Invoice=@Invoice"
                        cmd1 = CommandType.Text
                    Else
                        Qry = "[spGetARINVSTransactionsByInvoice]"
                        cmd1 = CommandType.StoredProcedure
                    End If
                    Using cmd As New SqlCommand(Qry, con)

                        cmd.CommandType = cmd1
                        cmd.Parameters.AddWithValue("@Invoice", Invoice)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        For Each row In dt.Rows
                            Dim u As New ARINVSS()
                            u.RECNO = row("RECNO")
                            u.Customer = Convert.ToString(row("Customer"))
                            u.Invoice = Convert.ToString(row("Invoice"))
                            u.Reason = Convert.ToString(row("Reason"))
                            u.PaymentType = aPaymentTypes(row("Type"))
                            u.InvDate = Convert.ToString(row("Date"))
                            u.Charges = Convert.ToString(row("Amount"))
                            TotalAmount += u.Charges
                            u.Deposit = Convert.ToString(row("Deposit"))
                            u.Check = Convert.ToString(row("Check"))
                            'u.Reason = ARAdjustment.GetAdjustmentReason(u.Customer, u.Invoice)
                            u.ADDUSER = Convert.ToString(row("ADDUSER"))
                            u.ADDDATE = Convert.ToString(row("ADDDATE"))
                            u.ADDTIME = Convert.ToString(row("ADDTIME"))
                            u.ADDAPP = Convert.ToString(row("ADDAPP"))
                            u.UPDUSER = Convert.ToString(row("UPDUSER"))
                            u.UPDDATE = Convert.ToString(row("UPDDATE"))
                            u.UPDTIME = Convert.ToString(row("UPDTIME"))
                            u.UPDAPP = Convert.ToString(row("UPDAPP"))
                            u.DELUSER = Convert.ToString(row("DELUSER"))
                            u.DELDATE = Convert.ToString(row("DELDATE"))
                            u.DELTIME = Convert.ToString(row("DELTIME"))
                            u.DELAPP = Convert.ToString(row("DELAPP"))
                            u.LOCKUSER = Convert.ToString(row("LOCKUSER"))
                            u.LOCKDATE = Convert.ToString(row("LOCKDATE"))
                            u.LOCKTIME = Convert.ToString(row("LOCKTIME"))
                            u.LOCKAPP = Convert.ToString(row("LOCKAPP"))
                            u.sqlID = Convert.ToString(row("sqlID"))
                            uList.Add(u)
                        Next
                    End Using
                End Using

                'Dim t As New ARINVSS()
                't.RECNO = 0
                't.PaymentType = ""
                't.InvDate = "01/01/1900"
                't.Charges = TotalAmount
                't.Check = ""
                'uList.Add(t)
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetARINVTransactionsByInvoice")
                Throw ex
            End Try
        End Function

        Public Function GetAdjustmentsTotalsForToday() As Double
            Try
                Dim result As Double
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SPAdjustmentsTotalsForToday", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        Double.TryParse(dt.Rows(0).ItemArray(0), result)
                    End Using
                End Using
                Return result
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetAdjustmentsTotalsForToday")
                Throw ex
            End Try
        End Function
        Public Function DeleteAdjustmentbyID(ByVal ID As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spDeleteAdjustmentbyID", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteAdjustmentbyID")
                Return "error"
            End Try
        End Function

    End Class
End Class


Public Class ARSummary

    Private _TotalSales As Decimal
    Public Property TotalSales() As Decimal
        Get
            Return _TotalSales
        End Get
        Set(ByVal value As Decimal)
            _TotalSales = value
        End Set
    End Property

    Private _TotalPayments As Decimal
    Public Property TotalPayments() As Decimal
        Get
            Return _TotalPayments
        End Get
        Set(ByVal value As Decimal)
            _TotalPayments = value
        End Set
    End Property

    Private _TotalVoids As Decimal
    Public Property TotalVoids() As Decimal
        Get
            Return _TotalVoids
        End Get
        Set(ByVal value As Decimal)
            _TotalVoids = value
        End Set
    End Property

    Private _TotalCredits As Decimal
    Public Property TotalCredits() As Decimal
        Get
            Return _TotalCredits
        End Get
        Set(ByVal value As Decimal)
            _TotalCredits = value
        End Set
    End Property

    Private _TotalAdjustments As Decimal
    Public Property TotalAdjustments() As Decimal
        Get
            Return _TotalAdjustments
        End Get
        Set(ByVal value As Decimal)
            _TotalAdjustments = value
        End Set
    End Property

    Private _TotalUnapplied As Decimal
    Public Property TotalUnapplied() As Decimal
        Get
            Return _TotalUnapplied
        End Get
        Set(ByVal value As Decimal)
            _TotalUnapplied = value
        End Set
    End Property

    Private _TotalCreditCardPayments As Decimal
    Public Property TotalCreditCardPayments() As Decimal
        Get
            Return _TotalCreditCardPayments
        End Get
        Set(ByVal value As Decimal)
            _TotalCreditCardPayments = value
        End Set
    End Property

    Private _TotalReturnChecks As Decimal
    Public Property TotalReturnChecks() As Decimal
        Get
            Return _TotalReturnChecks
        End Get
        Set(ByVal value As Decimal)
            _TotalReturnChecks = value
        End Set
    End Property

    Private _TotalLateCharges As Decimal
    Public Property TotalLateCharges() As Decimal
        Get
            Return _TotalLateCharges
        End Get
        Set(ByVal value As Decimal)
            _TotalLateCharges = value
        End Set
    End Property

    Private _TotalDebits As Decimal
    Public Property TotalDebits() As Decimal
        Get
            Return _TotalDebits
        End Get
        Set(ByVal value As Decimal)
            _TotalDebits = value
        End Set
    End Property

    Private _TotalCalcSales As Decimal
    Public Property TotalCalcSales() As Decimal
        Get
            Return _TotalCalcSales
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcSales = value
        End Set
    End Property

    Private _TotalCalcPayments As Decimal
    Public Property TotalCalcPayments() As Decimal
        Get
            Return _TotalCalcPayments
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcPayments = value
        End Set
    End Property

    Private _TotalCalcVoids As Decimal
    Public Property TotalCalcVoids() As Decimal
        Get
            Return _TotalCalcVoids
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcVoids = value
        End Set
    End Property

    Private _TotalCalcCredits As Decimal
    Public Property TotalCalcCredits() As Decimal
        Get
            Return _TotalCalcCredits
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcCredits = value
        End Set
    End Property

    Private _TotalCalcAdjustments As Decimal
    Public Property TotalCalcAdjustments() As Decimal
        Get
            Return _TotalCalcAdjustments
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcAdjustments = value
        End Set
    End Property

    Private _TotalCalcUnapplied As Decimal
    Public Property TotalCalcUnapplied() As Decimal
        Get
            Return _TotalCalcUnapplied
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcUnapplied = value
        End Set
    End Property

    Private _TotalCalcCreditCardPayments As Decimal
    Public Property TotalCalcCreditCardPayments() As Decimal
        Get
            Return _TotalCalcCreditCardPayments
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcCreditCardPayments = value
        End Set
    End Property

    Private _TotalCalcReturnChecks As Decimal
    Public Property TotalCalcReturnChecks() As Decimal
        Get
            Return _TotalCalcReturnChecks
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcReturnChecks = value
        End Set
    End Property

    Private _TotalCalcLateCharges As Decimal
    Public Property TotalCalcLateCharges() As Decimal
        Get
            Return _TotalCalcLateCharges
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcLateCharges = value
        End Set
    End Property

    Private _TotalCalcDebits As Decimal
    Public Property TotalCalcDebits() As Decimal
        Get
            Return _TotalCalcDebits
        End Get
        Set(ByVal value As Decimal)
            _TotalCalcDebits = value
        End Set
    End Property

    Private _TotalDiffSales As Decimal
    Public Property TotalDiffSales() As Decimal
        Get
            Return _TotalDiffSales
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffSales = value
        End Set
    End Property

    Private _TotalDiffPayments As Decimal
    Public Property TotalDiffPayments() As Decimal
        Get
            Return _TotalDiffPayments
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffPayments = value
        End Set
    End Property

    Private _TotalDiffVoids As Decimal
    Public Property TotalDiffVoids() As Decimal
        Get
            Return _TotalDiffVoids
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffVoids = value
        End Set
    End Property

    Private _TotalDiffCredits As Decimal
    Public Property TotalDiffCredits() As Decimal
        Get
            Return _TotalDiffCredits
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffCredits = value
        End Set
    End Property

    Private _TotalDiffAdjustments As Decimal
    Public Property TotalDiffAdjustments() As Decimal
        Get
            Return _TotalDiffAdjustments
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffAdjustments = value
        End Set
    End Property

    Private _TotalDiffUnapplied As Decimal
    Public Property TotalDiffUnapplied() As Decimal
        Get
            Return _TotalDiffUnapplied
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffUnapplied = value
        End Set
    End Property

    Private _TotalDiffCreditCardPayments As Decimal
    Public Property TotalDiffCreditCardPayments() As Decimal
        Get
            Return _TotalDiffCreditCardPayments
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffCreditCardPayments = value
        End Set
    End Property

    Private _TotalDiffReturnChecks As Decimal
    Public Property TotalDiffReturnChecks() As Decimal
        Get
            Return _TotalDiffReturnChecks
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffReturnChecks = value
        End Set
    End Property

    Private _TotalDiffLateCharges As Decimal
    Public Property TotalDiffLateCharges() As Decimal
        Get
            Return _TotalDiffLateCharges
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffLateCharges = value
        End Set
    End Property

    Private _TotalDiffDebits As Decimal
    Public Property TotalDiffDebits() As Decimal
        Get
            Return _TotalDiffDebits
        End Get
        Set(ByVal value As Decimal)
            _TotalDiffDebits = value
        End Set
    End Property

End Class

Public Class ARINVSS

    Private _EMAILED As Boolean
    Public Property EMAILED() As Boolean
        Get
            Return _EMAILED
        End Get
        Set(value As Boolean)
            _EMAILED = value
        End Set
    End Property

    Private _RECNO As Integer
    Public Property RECNO() As Integer
        Get
            Return _RECNO
        End Get
        Set(value As Integer)
            _RECNO = value
        End Set
    End Property

    Private _Invoice As String
    Public Property Invoice() As String
        Get
            Return _Invoice
        End Get
        Set(ByVal value As String)
            _Invoice = value
        End Set
    End Property

    Private _Customer As String
    Public Property Customer() As String
        Get
            Return _Customer
        End Get
        Set(ByVal value As String)
            _Customer = value
        End Set
    End Property

    Private _CustName As String
    Public Property CustName() As String
        Get
            Return _CustName
        End Get
        Set(ByVal value As String)
            _CustName = value
        End Set
    End Property

    Private _Check As String
    Public Property Check() As String
        Get
            Return _Check
        End Get
        Set(ByVal value As String)
            _Check = value
        End Set
    End Property

    Private _Deposit As String
    Public Property Deposit() As String
        Get
            Return _Deposit
        End Get
        Set(ByVal value As String)
            _Deposit = value
        End Set
    End Property

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

    Private _PO As String
    Public Property PO() As String
        Get
            Return _PO
        End Get
        Set(ByVal value As String)
            _PO = value
        End Set
    End Property

    Private _Boxes As Integer
    Public Property Boxes() As Integer
        Get
            Return _Boxes
        End Get
        Set(ByVal value As Integer)
            _Boxes = value
        End Set
    End Property

    Private _FBE As Decimal
    Public Property FBE() As Decimal
        Get
            Return _FBE
        End Get
        Set(ByVal value As Decimal)
            _FBE = value
        End Set
    End Property

    Private _Cubes As Decimal
    Public Property Cubes() As Decimal
        Get
            Return _Cubes
        End Get
        Set(ByVal value As Decimal)
            _Cubes = value
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

    Private _PaymentType As String
    Public Property PaymentType() As String
        Get
            Return _PaymentType
        End Get
        Set(value As String)
            _PaymentType = value
        End Set
    End Property

    Private _TypeName As String
    Public Property TypeName() As String
        Get
            Return _TypeName
        End Get
        Set(value As String)
            _TypeName = value
        End Set
    End Property

    Private _sqlID As Integer
    Public Property sqlID() As Integer
        Get
            Return _sqlID
        End Get
        Set(value As Integer)
            _sqlID = value
        End Set
    End Property

    Private _SLSMAN As Integer
    Public Property SLSMAN() As Integer
        Get
            Return _SLSMAN
        End Get
        Set(ByVal value As Integer)
            _SLSMAN = value
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

    Private _Reason As String
    Public Property Reason() As String
        Get
            Return _Reason
        End Get
        Set(value As String)
            _Reason = value
        End Set
    End Property
    Private _IsARINVHistory As String
    Public Property IsARINVHistory() As String
        Get
            Return _IsARINVHistory
        End Get
        Set(ByVal value As String)
            _IsARINVHistory = value
        End Set
    End Property
End Class

Public Interface ICustomParams_CustomerNumberUnappliedAmount
    Property CustomerNo() As String
End Interface

Public Interface ICustomParams_InvoiceNumber
    Property Invoiceno() As String
End Interface
Public Interface ICustomParams_IsARINVHistory
    Property IsARINVHistory() As String
End Interface
