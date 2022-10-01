Imports System.Data.SqlClient
Imports System.Data


Public Class ARClosing

    Public Shared Function ar102(dCloseDate As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UDP_YearClosingSalesDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@selectedDate", DateTime.Now.ToString())
                    Dim salesDT As New DataTable
                    Dim salesDA As New SqlDataAdapter(cmd)
                    salesDA.Fill(salesDT)


                    Dim ytdsls As Decimal = 0.00
                    Dim lytdsls As Decimal = 0.00
                    Dim lytdsls2 As Decimal = 0.00
                    Dim lytdsls3 As Decimal = 0.00
                    Dim lytdsls4 As Decimal = 0.00

                    Dim slscretyr As String = ""
                    Dim slscrelyr As String = ""
                    Dim slscrelyr2 As String = ""
                    Dim slscrelyr3 As String = ""
                    Dim slscrelyr4 As String = ""

                    For Each row In salesDT.Rows
                        Dim customer = Convert.ToInt32(row("Customer"))

                        Dim inputYear = DateTime.Now.Year
                        Dim salesYear = Convert.ToInt32(row("SalesYear"))
                        If (salesYear = inputYear) Then
                            ytdsls = Convert.ToDecimal(row("SalesByYear"))
                            slscretyr = Convert.ToString(row("SalesByMonth"))
                        ElseIf (salesYear = inputYear - 1) Then
                            lytdsls = Convert.ToDecimal(row("SalesByYear"))
                            slscrelyr = Convert.ToString(row("SalesByMonth"))
                        ElseIf (salesYear = inputYear - 2) Then
                            lytdsls2 = Convert.ToDecimal(row("SalesByYear"))
                            slscrelyr2 = Convert.ToString(row("SalesByMonth"))
                        ElseIf (salesYear = inputYear - 3) Then
                            lytdsls3 = Convert.ToDecimal(row("SalesByYear"))
                            slscrelyr3 = Convert.ToString(row("SalesByMonth"))
                        ElseIf (salesYear = inputYear - 4) Then
                            lytdsls4 = Convert.ToDecimal(row("SalesByYear"))
                            slscrelyr4 = Convert.ToString(row("SalesByMonth"))
                        End If
                        Using updateCustCMD As New SqlCommand("UPDATE F_CUST SET ytdsls=case when @ytdsls='0.00' then ytdsls else @ytdsls end ,lytdsls=case when @lytdsls='0.00' then lytdsls else @lytdsls end,lytdsls2=case when @lytdsls2='0.00' then lytdsls2 else @lytdsls2 end,lytdsls3=case when @lytdsls3='0.00' then lytdsls3 else @lytdsls3 end,lytdsls4=case when @lytdsls4='0.00' then lytdsls4 else @lytdsls4 end,slscretyr=case when @slscretyr='' then slscretyr else @slscretyr end,slscrelyr=case when @slscrelyr='' then slscrelyr else @slscrelyr end,slscrelyr2=case when @slscrelyr2='' then slscrelyr2 else @slscrelyr2 end,slscrelyr3=case when @slscrelyr3='' then slscrelyr3 else @slscrelyr3 end,slscrelyr4=case when @slscrelyr4='' then slscrelyr4 else @slscrelyr4 end  where Customer=@Customer", con)
                            updateCustCMD.CommandType = CommandType.Text
                            updateCustCMD.Parameters.AddWithValue("@Customer", customer)

                            updateCustCMD.Parameters.AddWithValue("@ytdsls", ytdsls)
                            updateCustCMD.Parameters.AddWithValue("@lytdsls", lytdsls)
                            updateCustCMD.Parameters.AddWithValue("@lytdsls2", lytdsls2)
                            updateCustCMD.Parameters.AddWithValue("@lytdsls3", lytdsls3)
                            updateCustCMD.Parameters.AddWithValue("@lytdsls4", lytdsls4)

                            updateCustCMD.Parameters.AddWithValue("@slscretyr", slscretyr)
                            updateCustCMD.Parameters.AddWithValue("@slscrelyr", slscrelyr)
                            updateCustCMD.Parameters.AddWithValue("@slscrelyr2", slscrelyr2)
                            updateCustCMD.Parameters.AddWithValue("@slscrelyr3", slscrelyr3)
                            updateCustCMD.Parameters.AddWithValue("@slscrelyr4", slscrelyr4)

                            updateCustCMD.ExecuteNonQuery()
                        End Using

                        ytdsls = 0.00
                        lytdsls = 0.00
                        lytdsls2 = 0.00
                        lytdsls3 = 0.00
                        lytdsls4 = 0.00

                        slscretyr = ""
                        slscrelyr = ""
                        slscrelyr2 = ""
                        slscrelyr3 = ""
                        slscrelyr4 = ""


                    Next
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ar102")
            Throw ex
        End Try
    End Function

    Public Shared Function ar103(dCloseDate As String) As String
        Try
            Dim aSales As String() = New String(24) {}
            Dim aLSales As String() = New String(24) {}
            Dim a2Sales As String() = New String(24) {}
            Dim a3Sales As String() = New String(24) {}
            Dim a4Sales As String() = New String(24) {}

            Dim lRetail As Boolean = False
            Dim munt As Integer = 0
            Dim lUpdateF4 As Boolean = True
            Dim lPurge As Boolean = False

            'If lPurge Then
            'If!messyn("WARNING!!!... are you sure you want to clear deposit information?", "No", "Yes") Then
            'lPurge := .F.
            'End If
            'End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select top 1 * from constant", con)
                    cmd.CommandType = CommandType.Text
                    Dim constantDT As New DataTable
                    Dim constantDA As New SqlDataAdapter(cmd)
                    constantDA.Fill(constantDT)

                    For Each Col As DataColumn In constantDT.Columns
                        If Col.Caption = "Retail" Then
                            lRetail = True
                        End If
                        cmd.Dispose()
                    Next

                    If lRetail Then

                    End If
                End Using

                If lUpdateF4 Then
                    Dim lPer As Boolean = False
                    Using custCMD As New SqlCommand("select top 1 * from F_CUST", con)
                        custCMD.CommandType = CommandType.Text
                        Dim custDT As New DataTable
                        Dim custDA As New SqlDataAdapter(custCMD)
                        custDA.Fill(custDT)
                        For Each Col As DataColumn In custDT.Columns
                            If Col.Caption = "PER6090" Then
                                lPer = True
                            End If
                        Next
                        custCMD.Dispose()
                    End Using

                    Using updateCustCMD As New SqlCommand("UPDATE F_CUST SET ytdsls=0.00,ytdpay=0.00,ytdcre =0.00,lytdsls=0.00,lytdpay=0.00,lytdcre=0.00,lytdsls2=0.00,lytdpay2=0.00,lytdcre2=0.00,lytdsls3=0.00,lytdpay3=0.00,lytdcre3=0.00,lytdsls4=0.00,lytdpay4=0.00,lytdcre4=0.00,slscretyr=space(240),slscrelyr=space(240),slscrelyr2=space(240),slscrelyr3=space(240),slscrelyr4=space(240)," + If(lPer, "per0030=0.00,per3060=0.00,per6090=0.00,per90=0.00,", "''") + "lastsale='0001-01-01'", con)
                        updateCustCMD.CommandType = CommandType.Text
                        updateCustCMD.ExecuteNonQuery()
                        updateCustCMD.Dispose()
                    End Using

                    Dim nCust As Integer
                    Dim dDate As String

                    Using salesCMD As New SqlCommand("select vet.* from vet_ vet inner join f_cust cu on vet.customer=cu.customer where year(vet.date1)>=year('" + dCloseDate + "')-3 and void=0", con)
                        salesCMD.CommandTimeout = 0
                        salesCMD.CommandType = CommandType.Text
                        Dim salesDR As SqlDataReader = salesCMD.ExecuteReader()
                        If (salesDR.HasRows) Then
                            While (salesDR.Read())
                                Dim nInv = Convert.ToInt32(salesDR("invoice"))
                                Dim inv_tot = 0
                                Dim nTax1 = 0
                                nCust = Convert.ToInt32(salesDR("CUSTOMER"))

                                Dim nYtdSls As Decimal = 0
                                Dim nLtdSls As Decimal = 0
                                Dim nLtdSls2 As Decimal = 0
                                Dim nLtdSls3 As Decimal = 0
                                Dim nLtdSls4 As Decimal = 0

                                Dim boxes = Convert.ToDecimal(salesDR("boxes"))
                                Dim units = Convert.ToInt32(salesDR("units"))
                                Dim price = Convert.ToDecimal(salesDR("price"))
                                Dim packing = Convert.ToDecimal(salesDR("packing"))
                                Dim fuel = Convert.ToDecimal(salesDR("fuel"))
                                Dim tax1 = Convert.ToDecimal(salesDR("tax1"))

                                If lRetail Then
                                    munt = Convert.ToInt32(Math.Round((boxes / units), 2))
                                    inv_tot = Math.Round(price * boxes, 2) + packing * munt + fuel * munt + tax1
                                Else
                                    inv_tot = Math.Round(price * boxes * units, 2) + packing + fuel + tax1
                                End If
                                dDate = Convert.ToString(salesDR("date1"))

                                Select Case Convert.ToDateTime(salesDR("date1")).Year
                                    Case DateTime.Now().Year
                                        nYtdSls += inv_tot
                                        aSales(Convert.ToDateTime(dDate).Month) += inv_tot
                                    Case DateTime.Now().Year - 1
                                        nLtdSls += inv_tot
                                        aLSales(Convert.ToDateTime(dDate).Month) += inv_tot
                                    Case DateTime.Now().Year - 2
                                        nLtdSls2 += inv_tot
                                        a2Sales(Convert.ToDateTime(dDate).Month) += inv_tot
                                    Case DateTime.Now().Year - 3
                                        nLtdSls3 += inv_tot
                                        a3Sales(Convert.ToDateTime(dDate).Month) += inv_tot
                                    Case DateTime.Now().Year - 4
                                        nLtdSls4 += inv_tot
                                        a4Sales(Convert.ToDateTime(dDate).Month) += inv_tot
                                End Select

                                Dim ytdsls = nYtdSls
                                Dim cSales = ""

                                For j = 1 To 12
                                    cSales = cSales + aSales(j)
                                Next

                                Dim slscretyr = ""
                                Dim slscrelyr = ""
                                Dim slscrelyr2 = ""
                                Dim slscrelyr3 = ""
                                Dim slscrelyr4 = ""

                                slscretyr = cSales + If(slscretyr.Length > 120, slscretyr.Substring(121, 120), slscretyr)

                                Dim lytdsls = nLtdSls
                                Dim lytdsls2 = nLtdSls2
                                Dim lytdsls3 = nLtdSls3
                                Dim lytdsls4 = nLtdSls4
                                cSales = ""

                                For j = 1 To 12
                                    cSales = cSales + aLSales(j)
                                Next

                                slscrelyr = cSales + If(slscrelyr.Length > 120, slscrelyr.Substring(121, 120), slscrelyr)
                                cSales = ""

                                slscrelyr2 = cSales + If(slscrelyr2.Length > 120, slscrelyr2.Substring(121, 120), slscrelyr2)
                                cSales = ""
                                For j = 1 To 12
                                    cSales = cSales + a3Sales(j)
                                Next

                                slscrelyr3 = cSales + If(slscrelyr3.Length > 120, slscrelyr3.Substring(121, 120), slscrelyr3)
                                cSales = ""
                                For j = 1 To 12
                                    cSales = cSales + a4Sales(j)
                                Next

                                slscrelyr4 = cSales + If(slscrelyr4.Length > 120, slscrelyr4.Substring(121, 120), slscrelyr4)
                                nCust = Convert.ToInt32(salesDR("CUSTOMER"))

                                'update vet sales details
                                Using con1 As New SqlConnection(ConStr)
                                    con1.Open()
                                    Using updateSalesCustCMD As New SqlCommand("UPDATE F_CUST SET ytdsls=" + nYtdSls.ToString() + ",slscretyr='" + slscretyr.ToString() + "',lytdsls=" + nLtdSls.ToString() + ",lytdsls2=" + nLtdSls2.ToString() + ",lytdsls3=" + nLtdSls3.ToString() + ",lytdsls4 = " + nLtdSls4.ToString() + ",slscrelyr='" + slscrelyr.ToString() + "',slscrelyr2='" + slscrelyr2.ToString() + "',slscrelyr3='" + slscrelyr3.ToString() + "',slscrelyr4='" + slscrelyr4.ToString() + "',Lastsale=IIF('" + dDate.ToString() + "'>lastsale,'" + dDate.ToString() + "','0001-01-01')  where customer=" + nCust.ToString() + "", con1)
                                        updateSalesCustCMD.CommandType = CommandType.Text
                                        updateSalesCustCMD.ExecuteNonQuery()
                                        updateSalesCustCMD.Dispose()
                                    End Using
                                    con1.Close()
                                End Using



                                nYtdSls = 0
                                nLtdSls = 0
                                nLtdSls2 = 0
                                nLtdSls3 = 0
                                nLtdSls4 = 0

                            End While
                        End If
                        salesDR.Close()
                        salesCMD.Dispose()
                    End Using

                    'ARINVS closing
                    Using arinvsCMD As New SqlCommand("select  ar.* from f_arinvs ar inner join f_cust cu on ar.customer=cu.customer where year(ar.date)>=year('" + dCloseDate + "')-3", con)
                        arinvsCMD.CommandType = CommandType.Text
                        Dim arinvsDR As SqlDataReader = arinvsCMD.ExecuteReader()
                        If (arinvsDR.HasRows) Then
                            While (arinvsDR.Read())
                                Dim ytdpay = 0.00, lytdpay = 0.00, lytdpay2 = 0.00, lytdpay3 = 0.00, lytdpay4 = 0.00
                                Dim ytdcre = 0.00, lytdcre = 0.00, lytdcre2 = 0.00, lytdcre3 = 0.00, lytdcre4 = 0.00
                                Dim custSQL As String = ""

                                Select Case arinvsDR("TYPE")
                                    Case "2" Or "7"
                                        If Convert.ToDouble(arinvsDR("AMOUNT")) <> 0 Then
                                            nCust = Convert.ToInt32(arinvsDR("customer"))
                                            dDate = arinvsDR("date")

                                            Select Case Convert.ToDateTime(dDate).Year
                                                Case DateTime.Now().Year
                                                    ytdpay += Convert.ToDouble(arinvsDR("amount"))
                                                Case DateTime.Now().Year - 1
                                                    lytdpay += Convert.ToDouble(arinvsDR("amount"))
                                                Case DateTime.Now().Year - 2
                                                    lytdpay2 += Convert.ToDouble(arinvsDR("amount"))
                                                Case DateTime.Now().Year - 3
                                                    lytdpay3 += Convert.ToDouble(arinvsDR("amount"))
                                                Case DateTime.Now().Year - 4
                                                    lytdpay4 += Convert.ToDouble(arinvsDR("amount"))
                                            End Select
                                            custSQL = "update f_cust set ytdpay=" + ytdpay.ToString() + ",lytdpay=" + lytdpay.ToString() + ",lytdpay2=" + lytdpay2.ToString() + ",lytdpay3=" + lytdpay3.ToString() + ",lytdpay4=" + lytdpay4.ToString() + " where Customer=" + nCust.ToString() + ""
                                        End If
                                    Case "6"
                                        If Convert.ToDouble(arinvsDR("amount")) <> 0 Then
                                            nCust = Convert.ToInt32(arinvsDR("customer"))
                                            dDate = arinvsDR("date")

                                            Select Case Convert.ToDateTime(dDate).Year
                                                Case DateTime.Now().Year
                                                    ytdcre += Convert.ToDouble(arinvsDR("amount"))
                                                Case DateTime.Now().Year - 1
                                                    lytdcre += Convert.ToDouble(arinvsDR("amount"))
                                                Case DateTime.Now().Year - 2
                                                    lytdcre2 += Convert.ToDouble(arinvsDR("amount"))
                                                Case DateTime.Now().Year - 3
                                                    lytdcre3 += Convert.ToDouble(arinvsDR("amount"))
                                                Case DateTime.Now().Year - 4
                                                    lytdcre4 += Convert.ToDouble(arinvsDR("amount"))
                                            End Select
                                            custSQL = "update f_cust set ytdcre=" + ytdcre.ToString() + ",lytdcre=" + lytdcre.ToString() + ",lytdcre2=" + lytdcre2.ToString() + ",lytdcre3=" + lytdcre3.ToString() + ",lytdcre4=" + lytdcre4.ToString() + " where Customer=" + nCust.ToString() + ""
                                        End If
                                End Select

                                If custSQL <> "" Then
                                    Using custCon As New SqlConnection(ConStr)
                                        custCon.Open()
                                        Using custCMD As New SqlCommand(custSQL, custCon)
                                            custCMD.CommandType = CommandType.Text
                                            custCMD.ExecuteNonQuery()
                                            custCMD.Dispose()
                                        End Using
                                        custCon.Close()
                                    End Using
                                End If
                            End While
                        End If
                        arinvsDR.Close()
                        arinvsCMD.Dispose()
                    End Using

                    'ARHIST closing
                    Using arhistCMD As New SqlCommand("select  ar.* from arhist ar inner join f_cust cu on ar.customer=cu.customer  where year(ar.date)>=year('" + dCloseDate + "')-3", con)
                        arhistCMD.CommandType = CommandType.Text
                        Dim arhistDR As SqlDataReader = arhistCMD.ExecuteReader()
                        If (arhistDR.HasRows) Then
                            While (arhistDR.Read())
                                Dim ytdpay = 0.00, lytdpay = 0.00, lytdpay2 = 0.00, lytdpay3 = 0.00, lytdpay4 = 0.00
                                Dim ytdcre = 0.00, lytdcre = 0.00, lytdcre2 = 0.00, lytdcre3 = 0.00, lytdcre4 = 0.00
                                Dim custSQL As String = ""

                                Select Case arhistDR("TYPE")
                                    Case "2" Or "7"
                                        If Convert.ToDouble(arhistDR("amount")) <> 0 Then
                                            nCust = Convert.ToInt32(arhistDR("customer"))
                                            dDate = arhistDR("date")
                                            Try
                                                Select Case Convert.ToDateTime(dDate).Year
                                                    Case DateTime.Now().Year
                                                        ytdpay += Convert.ToDouble(arhistDR("amount"))
                                                    Case DateTime.Now().Year - 1
                                                        lytdpay += Convert.ToDouble(arhistDR("amount"))
                                                    Case DateTime.Now().Year - 2
                                                        lytdpay2 += Convert.ToDouble(arhistDR("amount"))
                                                    Case DateTime.Now().Year - 3
                                                        lytdpay3 += Convert.ToDouble(arhistDR("amount"))
                                                    Case DateTime.Now().Year - 4
                                                        lytdpay4 += Convert.ToDouble(arhistDR("amount"))
                                                End Select
                                                custSQL = "update f_cust set ytdpay=" + ytdpay.ToString() + ",lytdpay=" + lytdpay.ToString() + ",lytdpay2=" + lytdpay2.ToString() + ",lytdpay3=" + lytdpay3.ToString() + ",lytdpay4=" + lytdpay4.ToString() + " where Customer=" + nCust.ToString() + ""

                                            Catch ex As Exception
                                                Throw ex
                                            End Try
                                        End If
                                    Case "6"
                                        If Convert.ToDouble(arhistDR("amount")) <> 0 Then
                                            nCust = Convert.ToInt32(arhistDR("customer"))
                                            dDate = arhistDR("date")
                                            Try
                                                Select Case Convert.ToDateTime(dDate).Year
                                                    Case DateTime.Now().Year
                                                        ytdcre += Convert.ToDouble(arhistDR("amount"))
                                                    Case DateTime.Now().Year - 1
                                                        lytdcre += Convert.ToDouble(arhistDR("amount"))
                                                    Case DateTime.Now().Year - 2
                                                        lytdcre2 += Convert.ToDouble(arhistDR("amount"))
                                                    Case DateTime.Now().Year - 3
                                                        lytdcre3 += Convert.ToDouble(arhistDR("amount"))
                                                    Case DateTime.Now().Year - 4
                                                        lytdcre4 += Convert.ToDouble(arhistDR("amount"))
                                                End Select
                                                custSQL = "update f_cust set ytdcre=" + ytdcre.ToString() + ",lytdcre=" + lytdcre.ToString() + ",lytdcre2=" + lytdcre2.ToString() + ",lytdcre3=" + lytdcre3.ToString() + ",lytdcre4=" + lytdcre4.ToString() + " where Customer=" + nCust.ToString() + ""
                                            Catch ex As Exception
                                                Throw ex
                                            End Try
                                        End If
                                End Select

                                If custSQL <> "" Then
                                    Try
                                        Using custCon As New SqlConnection(ConStr)
                                            custCon.Open()
                                            Using custCMD As New SqlCommand(custSQL, custCon)
                                                custCMD.CommandType = CommandType.Text
                                                custCMD.ExecuteNonQuery()
                                                custCMD.Dispose()
                                            End Using
                                            custCon.Close()
                                        End Using
                                    Catch ex As Exception
                                        Throw ex
                                    End Try
                                End If
                            End While
                        End If
                        arhistDR.Close()
                        arhistCMD.Dispose()
                    End Using

                End If
                con.Close()
            End Using

            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ar102")
            Throw ex
        End Try

    End Function

    Public Shared Function GetYearWiseSalesDetail(dCloseDate As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                Using salesCMD As New SqlCommand("UDP_YearWiseSalesDetails", con)
                    salesCMD.CommandTimeout = 0
                    salesCMD.CommandType = CommandType.StoredProcedure
                    salesCMD.Parameters.AddWithValue("@selectedDate", dCloseDate)
                    Dim salesDA As New SqlDataAdapter(salesCMD)
                    Dim salesDT As New DataTable
                    salesDA.Fill(salesDT)
                    For Each row In salesDT.Rows
                        Dim u As New Closing
                        For Each Col As DataColumn In salesDT.Columns
                            If Col.Caption = "Retail" Then
                            End If
                        Next

                    Next

                End Using
                con.Close()
            End Using

            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ar102")
            Throw ex
        End Try

    End Function

    Public Shared Function GetInvoiceTotalForDayClosing(ByVal dCloseDate As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim InvoiceTotal As String = ""
            Dim InvoiceHold As String = ""
            Dim TotalCntInvoice As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using closingCMD As New SqlCommand("spGetInvoiceForDayClosing", con)
                    closingCMD.CommandType = CommandType.StoredProcedure
                    closingCMD.Parameters.AddWithValue("@Date", dCloseDate)
                    Dim InvoiceHoldCheckDT As New DataSet()
                    Dim InvoiceHoldCheckDA As New SqlDataAdapter(closingCMD)
                    InvoiceHoldCheckDA.Fill(InvoiceHoldCheckDT)
                    InvoiceTotal = InvoiceHoldCheckDT.Tables(0).Rows(0)("TOTAL")
                    InvoiceTotal = Convert.ToDecimal(InvoiceTotal).ToString("#,##0.00")
                    InvoiceHold = InvoiceHoldCheckDT.Tables(0).Rows(0)("HOLDCOUNT")
                    TotalCntInvoice = InvoiceHoldCheckDT.Tables(0).Rows(0)("TOTALCNTINVOICES")
                End Using
            End Using

            Dim CompanyName As String = ConfigurationManager.AppSettings("CompanyName").ToString()
            Dim FromEmail As String = ConfigurationManager.AppSettings("VendorFromEmails")

            Logs.SendMail(FromEmail, "jose@dflower.com", "", "", CompanyName + " End of day for " + dCloseDate + " Number of invoices to be processed " + TotalCntInvoice)
            Return InvoiceTotal + "-" + InvoiceHold + "-" + TotalCntInvoice
            'Return Convert.ToDecimal(InvoiceTotal).ToString("#,##0.00")
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetInvoiceTotalForDayClosing")
            Throw ex
        End Try
    End Function


    ' <summary>
    ' DAY CLOSING PROCESS - INVOICE BY INVOICE :: Created by Abinaya :: 09Aug2018
    ' ANITHA :: 31-OCT-2018 :: add where condition for scanned is equal to one then take the invoice to post to VET tables
    ' </summary>
    ' <param name="dCloseDate"></param>
    ' <param name="LoggedInUserID"></param>
    ' <param name="LoggedInUserName"></param>
    ' <returns></returns>
    Public Shared Function DayWiseClosing(ByVal dCloseDate As String, ByVal LoggedInUserID As String, ByVal LoggedInUserName As String, ByVal TotalSales As String, ByVal IsSendInvoiceOnEOD As String, ByVal UserEmail As String) As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Using con As New SqlConnection(ConStr)
            con.Open()
            Dim dayCloseTrans As SqlTransaction = con.BeginTransaction()
            Try
                Dim FromDate As String = ""
                Dim Emailorfax As String = ""
                Dim EmailList As New List(Of Emails)
                Dim CompanyName As String = ConfigurationManager.AppSettings("CompanyName").ToString()
                Dim obj As New BloomService

                'select records from f_order1 for the selected date
                Using EODCMD As New SqlCommand("spGetInvoiceForDayClosing", con)
                    EODCMD.CommandType = CommandType.StoredProcedure
                    EODCMD.Transaction = dayCloseTrans
                    EODCMD.Parameters.Clear()
                    EODCMD.Parameters.AddWithValue("@Date", dCloseDate)
                    EODCMD.Parameters.AddWithValue("@SelectFlag", "1")

                    Dim ordSelectDT As New DataTable()
                    Dim ordSelectDA As New SqlDataAdapter(EODCMD)
                    ordSelectDA.Fill(ordSelectDT)

                    If ordSelectDT.Rows.Count > 0 Then

                        'Get From Date
                        FromDate = ordSelectDT.Rows(0)("DATE")

                        'Lock all invoices which are going to closed by day wise
                        EODCMD.CommandText = "INSERT INTO TBLORDERLOCK(ORDERNUMBER,USERID,USERNAME,CREATEDDATE) SELECT ORD1.[ORDER],@USERID,@USERNAME,getdate() FROM F_ORDER1 ORD1 WHERE ((ORD1.VOID=1) or (ORD1.VOID=0 AND (ORD1.PRINTED=1 OR ORD1.SCANNED=1 OR ORD1.CARRIER in('DS','XX')))) and ORD1.DATE<=@Date"
                        EODCMD.CommandType = CommandType.Text
                        EODCMD.Parameters.Clear()
                        EODCMD.Parameters.AddWithValue("@Date", dCloseDate)
                        EODCMD.Parameters.AddWithValue("@USERID", LoggedInUserID)
                        EODCMD.Parameters.AddWithValue("@USERNAME", LoggedInUserName)
                        EODCMD.ExecuteNonQuery()

                        'ANITHA :: 29-NOV-2018 :: Send invoice if the Issendinvoiceoneod bit is true
                        If IsSendInvoiceOnEOD = "1" Then
                            For Each row In ordSelectDT.Rows
                                If Not row("VOID") And SalesOrder.CheckInvoiceHasNegativeBoxes(row("ORDER"), row("CUSTOMER")) = "0" Then

                                    If row("FaxOrEmail") = "E" Or row("FaxOrEmail") = "IE" Then
                                        Emailorfax = "Email"
                                    ElseIf row("FaxOrEmail") = "F" Or row("FaxOrEmail") = "IF" Then
                                        Emailorfax = "Fax"
                                    End If
                                    SalesOrder.ScheduleOrders(row("ORDER"), "", Convert.ToDateTime(row("DATE").ToString()).ToString("yyyy-MM-dd"), Emailorfax, row("CUSTOMER"), LoggedInUserID)
                                End If
                            Next
                        End If

                        EODCMD.CommandText = "spEODBackup"
                        EODCMD.CommandType = CommandType.StoredProcedure
                        EODCMD.Transaction = dayCloseTrans
                        EODCMD.Parameters.Clear()
                        EODCMD.ExecuteNonQuery()

                        For Each row In ordSelectDT.Rows

                            EODCMD.CommandText = "spEODProcess"
                            EODCMD.CommandType = CommandType.StoredProcedure
                            EODCMD.Parameters.Clear()
                            EODCMD.Parameters.AddWithValue("@ORDER", row("ORDER"))
                            EODCMD.Parameters.AddWithValue("@DATE", Convert.ToString(row("DATE")))
                            EODCMD.Parameters.AddWithValue("@CUSTOMER", row("CUSTOMER"))
                            EODCMD.Parameters.AddWithValue("@SLSMAN", Convert.ToString(row("SLSMAN")))
                            EODCMD.Parameters.AddWithValue("@TERMS", Convert.ToString(row("TERMS")))
                            EODCMD.Parameters.AddWithValue("@Void", If(row("VOID") = "False", "0", "1"))
                            EODCMD.Parameters.AddWithValue("@USER", LoggedInUserName)
                            EODCMD.Parameters.AddWithValue("@HOLD", row("HOLD"))
                            EODCMD.ExecuteNonQuery()
                        Next

                        EODCMD.CommandText = "Sp_InsertF_EODHST"
                        EODCMD.CommandType = CommandType.StoredProcedure
                        EODCMD.Parameters.Clear()
                        EODCMD.Parameters.AddWithValue("@EODDate", dCloseDate)
                        EODCMD.Parameters.AddWithValue("@UserName", If(LoggedInUserName.Length > 10, LoggedInUserName.Substring(0, 10), LoggedInUserName))
                        EODCMD.Parameters.AddWithValue("@TotalSales", TotalSales.Replace(",", ""))
                        EODCMD.ExecuteNonQuery()

                        EODCMD.CommandText = "spMoveInventoryToHistory"
                        EODCMD.CommandType = CommandType.StoredProcedure
                        EODCMD.Parameters.Clear()
                        EODCMD.ExecuteNonQuery()

                    End If
                    EODCMD.Dispose()
                End Using

                'If EmailList.Count > 0 Then
                '    obj.SendEmailForInvoice(EmailList)
                'End If

                dayCloseTrans.Commit()
                con.Close()

                Try
                    UpdateYeartoDateSales() '' Update F_CUST table year and month sales column
                Catch ex As Exception
                    ErrorLogs.LogException(ex, "Error In UpdateYeartoDateSales : DayWiseClosing :: ARClosing ")
                End Try

                Return "Success~" + FromDate
            Catch ex As Exception
                dayCloseTrans.Rollback()
                con.Close()

                ErrorLogs.LogException(ex, "Error In DayWiseClosing")
                Throw ex
            End Try
        End Using
    End Function

    ''' <summary>
    ''' Update yeartodate sales details in F_CUST table
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function UpdateYeartoDateSales() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using YTDCMD As New SqlCommand("Sp_YTDDetailsForCurrentYear", con)
                    YTDCMD.CommandType = CommandType.StoredProcedure
                    YTDCMD.CommandTimeout = 180
                    YTDCMD.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateYeartoDateSales")
            Return "error"
        End Try
    End Function


    ' <summary>
    ' Anitha :: 15-Nov-2018 :: insert into table f_EODHST
    ' </summary>
    ' <param name="dCloseDate"></param>
    ' <param name="LoggedInUserName"></param>
    ' <returns></returns>
    'Public Shared Function InsertF_EODHST(ByVal dCloseDate As String, ByVal LoggedInUserName As String, ByVal TotalSales As String) As String
    '    Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
    '    Using con As New SqlConnection(ConStr)
    '        con.Open()
    '        Try
    '            Using cmd As New SqlCommand("Sp_InsertF_EODHST", con)
    '                cmd.CommandType = CommandType.StoredProcedure
    '                cmd.Parameters.AddWithValue("@EODDate", dCloseDate)
    '                cmd.Parameters.AddWithValue("@UserName", LoggedInUserName)
    '                cmd.Parameters.AddWithValue("@TotalSales", TotalSales.Replace(",", ""))
    '                Dim da As New SqlDataAdapter(cmd)
    '                Dim ds As New DataSet()
    '                da.Fill(ds)
    '                con.Close()
    '                Return "valid"
    '            End Using
    '        Catch ex As Exception
    '            ErrorLogs.LogException(ex, "Error In InsertF_EODHST")
    '            Throw ex
    '        End Try
    '    End Using
    'End Function

    ' <summary>
    ' Month Closing :: created by Anitha :: 16-Aug-2018
    ' </summary>
    ' <param name="dCloseDate"></param>
    ' <param name="LoggedInUserName"></param>
    ' <returns></returns>
    Public Shared Function MonthWiseClosing(ByVal dCloseDate As String, ByVal LoggedInUserName As String) As List(Of MonthWiseClosing)
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim LstMonthWiseClosing As New List(Of MonthWiseClosing)
        Using con As New SqlConnection(ConStr)
            con.Open()
            'Dim dayCloseTrans As SqlTransaction = con.BeginTransaction()
            Try
                Using cmd As New SqlCommand("UDP_MonthWiseClosing", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    'cmd.Transaction = dayCloseTrans
                    cmd.Parameters.AddWithValue("@AsOfDate", dCloseDate)
                    cmd.Parameters.AddWithValue("@UserName", LoggedInUserName)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet()
                    da.Fill(ds)

                    Dim TotalBalanceBefore As Decimal = 0.00
                    Dim TotalBalanceAfter As Decimal = 0.00
                    Dim TotalBalanceDiff As Decimal = 0.00
                    TotalBalanceBefore = ds.Tables(0).Rows(0)(0)
                    TotalBalanceAfter = ds.Tables(1).Rows(0)(0)
                    TotalBalanceDiff = TotalBalanceBefore - TotalBalanceAfter
                    Dim u As New MonthWiseClosing()
                    u.Name = "A/R before closing as of " + dCloseDate
                    u.Value = "$" + TotalBalanceBefore.ToString("#,##0.00")
                    LstMonthWiseClosing.Add(u)
                    Dim u1 As New MonthWiseClosing()
                    u1.Name = "A/R after closing"
                    u1.Value = "$" + TotalBalanceAfter.ToString("#,##0.00")
                    LstMonthWiseClosing.Add(u1)
                    Dim u2 As New MonthWiseClosing()
                    u2.Name = "Difference"
                    u2.Value = "$" + TotalBalanceDiff.ToString("#,##0.00")
                    LstMonthWiseClosing.Add(u2)

                    'dayCloseTrans.Commit()
                    con.Close()
                    Return LstMonthWiseClosing
                End Using
            Catch ex As Exception
                'dayCloseTrans.Rollback()
                ErrorLogs.LogException(ex, "Error In MonthWiseClosing")
                Throw ex
            End Try
        End Using

    End Function

End Class

Public Class Closing
    Private Property _Salesman As Integer
    Public Property Salesman() As Integer
        Get
            Return _Salesman
        End Get
        Set(value As Integer)
            _Salesman = value
        End Set
    End Property

    Private Property _Customer As Integer
    Public Property Customer() As Integer
        Get
            Return _Customer
        End Get
        Set(value As Integer)
            _Customer = value
        End Set
    End Property

    Private Property _year1 As Decimal
    Public Property year1() As Decimal
        Get
            Return _year1
        End Get
        Set(value As Decimal)
            _year1 = value
        End Set
    End Property

    Private Property _year2 As Decimal
    Public Property year2() As Decimal
        Get
            Return _year2
        End Get
        Set(value As Decimal)
            _year2 = value
        End Set
    End Property

    Private Property _year3 As Decimal
    Public Property year3() As Decimal
        Get
            Return _year3
        End Get
        Set(value As Decimal)
            _year3 = value
        End Set
    End Property

    Private Property _year4 As Decimal
    Public Property year4() As Decimal
        Get
            Return _year4
        End Get
        Set(value As Decimal)
            _year4 = value
        End Set
    End Property

    Private Property _year5 As Decimal
    Public Property year5() As Decimal
        Get
            Return _year5
        End Get
        Set(value As Decimal)
            _year5 = value
        End Set
    End Property

    Private Property _year6 As Decimal
    Public Property year6() As Decimal
        Get
            Return _year6
        End Get
        Set(value As Decimal)
            _year6 = value
        End Set
    End Property

    Private Property _year7 As Decimal
    Public Property year7() As Decimal
        Get
            Return _year7
        End Get
        Set(value As Decimal)
            _year7 = value
        End Set
    End Property

    Private Property _year8 As Decimal
    Public Property year8() As Decimal
        Get
            Return _year8
        End Get
        Set(value As Decimal)
            _year8 = value
        End Set
    End Property

    Private Property _year9 As Decimal
    Public Property year9() As Decimal
        Get
            Return _year9
        End Get
        Set(value As Decimal)
            _year9 = value
        End Set
    End Property

    Private Property _year10 As Decimal
    Public Property year10() As Decimal
        Get
            Return _year10
        End Get
        Set(value As Decimal)
            _year10 = value
        End Set
    End Property

End Class

Public Class MonthWiseClosing
    Private Property _Name As String
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(value As String)
            _Name = value
        End Set
    End Property

    Private Property _Value As String
    Public Property Value() As String
        Get
            Return _Value
        End Get
        Set(value As String)
            _Value = value
        End Set
    End Property

End Class
