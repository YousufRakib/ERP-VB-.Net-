Imports System.Data.SqlClient
Imports System.Data



Public Class CreditLimitsApproval

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="Customer"></param>
    ''' <returns></returns>
    Public Shared Function GetCustomerDetailsforCreditLimitsApproval(ByVal Customer As String) As CustomerDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New CustomerDetail()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwCust where CUSTOMER=" + Customer, con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    For Each row In ds.Tables(0).Rows
                        u.Customer = row("Customer")
                        u.Name = row("Name")
                        u.Available = IIf(row("Available") Is DBNull.Value, 0.00, row("Available"))
                        u.ARBALANCE = IIf(row("ARBALANCE") Is DBNull.Value, 0.00, row("ARBALANCE"))
                        u.UNAPPLIED = IIf(row("UNAPPLIED") Is DBNull.Value, 0.00, row("UNAPPLIED"))
                        u.BAL0030 = IIf(row("BAL0030") Is DBNull.Value, 0.00, row("BAL0030"))
                        u.BAL3060 = IIf(row("BAL3060") Is DBNull.Value, 0.00, row("BAL3060"))
                        u.BAL6090 = IIf(row("BAL6090") Is DBNull.Value, 0.00, row("BAL6090"))
                        u.BAL90 = IIf(row("BAL90") Is DBNull.Value, 0.00, row("BAL90"))
                        u.ORDERS = IIf(row("ORDERS") Is DBNull.Value, 0.00, row("ORDERS"))
                        u.LastPayment = Convert.ToDateTime(row("LastPay"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                        u.LastPayAmt = IIf(row("LASTPAYAMT") Is DBNull.Value, 0.00, row("LASTPAYAMT"))
                        u.TERMSCODE = IIf(row("TERMSCODE") Is DBNull.Value, "", row("TERMSCODE"))
                        u.TERMSDESC = IIf(row("TERMSDESC") Is DBNull.Value, "", row("TERMSDESC"))
                        u.EXPDATE = IIf(row("EXPDATE") Is DBNull.Value, System.DateTime.Now.ToString("MM/dd/yyyy"), row("EXPDATE"))
                        u.AMTAPPROV = IIf(row("AMTAPPROV") Is DBNull.Value, 0.00, row("AMTAPPROV"))
                        u.APPROVED = IIf(row("APPROVED") Is DBNull.Value, "N", row("APPROVED"))
                        u.HOLLYDAYAM = IIf(row("HOLLYDAYAM") Is DBNull.Value, 0.00, row("HOLLYDAYAM"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerDetailsforCreditLimitsApproval")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="Customer"></param>
    ''' <param name="AMTAPPROV"></param>
    ''' <param name="APPROVED"></param>
    ''' <param name="HOLLYDAYAM"></param>
    ''' <param name="EXPDATE"></param>
    ''' <returns></returns>
    Public Shared Function SaveCustomerDetailsforCreditLimitsApproval(ByVal Customer As String, ByVal AMTAPPROV As String, ByVal APPROVED As String,
                                                                      ByVal HOLLYDAYAM As String, ByVal EXPDATE As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim User As New User
            If Not HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                User = HttpContext.Current.Session("LoginUserDetails")
            ElseIf Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing Then
                User = HttpContext.Current.Session("LoginAdminDetails")
            End If

            Using con As New SqlConnection(ConStr)
                con.Open()

                Dim nAddAmt As Decimal = 0.00
                Dim nHollAmt As Decimal = 0.00
                Dim dExpDatte As String = ""
                Dim Cust_Name As String = ""
                Dim ARLIMIT As Decimal = 0.00
                Dim BALANCE As Decimal = 0.00
                Dim ToEmails As String = ""
                Dim Subject As String = ""
                Dim Body As String = ""
                Dim orders As Decimal = 0.00
                Dim bal0030 As Decimal = 0.00
                Dim bal3060 As Decimal = 0.00
                Dim bal6090 As Decimal = 0.00
                Dim bal90 As Decimal = 0.00

                Using cmd1 As New SqlCommand("select * from vwCUST where CUSTOMER=@CUSTOMER", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@CUSTOMER", Customer)
                    Dim da As New SqlDataAdapter(cmd1)
                    Dim dt As New DataTable()
                    da.Fill(dt)
                    For Each row In dt.Rows

                        dExpDatte = IIf(row("EXPDATE") Is DBNull.Value, System.DateTime.Now.ToString("MM/dd/yyyy"), row("EXPDATE"))
                        Cust_Name = row("Name")

                        If row("AMTAPPROV") IsNot DBNull.Value Then
                            nAddAmt = Convert.ToDecimal(row("AMTAPPROV"))
                        End If

                        If row("HOLLYDAYAM") IsNot DBNull.Value Then
                            nHollAmt = Convert.ToDecimal(row("HOLLYDAYAM"))
                        End If

                        If row("ARBALANCE") IsNot DBNull.Value Then
                            ARLIMIT = Convert.ToDecimal(row("ARBALANCE"))
                        End If

                        If row("Available") IsNot DBNull.Value Then
                            BALANCE = Convert.ToDecimal(row("Available"))
                        End If

                        If row("orders") IsNot DBNull.Value Then
                            orders = Convert.ToDecimal(row("orders"))
                        End If

                        If row("bal0030") IsNot DBNull.Value Then
                            bal0030 = Convert.ToDecimal(row("bal0030"))
                        End If

                        If row("bal3060") IsNot DBNull.Value Then
                            bal3060 = Convert.ToDecimal(row("bal3060"))
                        End If

                        If row("bal6090") IsNot DBNull.Value Then
                            bal6090 = Convert.ToDecimal(row("bal6090"))
                        End If

                        If row("bal90") IsNot DBNull.Value Then
                            bal90 = Convert.ToDecimal(row("bal90"))
                        End If
                    Next

                    Using cmd As New SqlCommand("update F_CUST set AMTAPPROV=@AMTAPPROV,APPROVED=@APPROVED,HOLLYDAYAM=@HOLLYDAYAM,EXPDATE=@EXPDATE  where CUSTOMER=@CUSTOMER", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                        cmd.Parameters.AddWithValue("@AMTAPPROV", AMTAPPROV)
                        cmd.Parameters.AddWithValue("@APPROVED", APPROVED)
                        cmd.Parameters.AddWithValue("@HOLLYDAYAM", HOLLYDAYAM)
                        cmd.Parameters.AddWithValue("@EXPDATE", EXPDATE)
                        cmd.ExecuteNonQuery()
                    End Using

                    ToEmails = F_Emails.GetEmailsByType("ARLIMITS")

                    If nHollAmt <> HOLLYDAYAM Then  'if the holiday amt get changed then send email
                        If ToEmails <> "" Then
                            Subject = "Credit limit for " + Cust_Name + " has been changed to " + (Convert.ToString(HOLLYDAYAM) + Convert.ToString(ARLIMIT)) + IIf(Convert.ToString(HOLLYDAYAM) > 0, " it expires on " + EXPDATE, "")
                            Logs.SendEmail(User.Email, ToEmails, "", "", Subject)
                        End If
                    End If

                    If APPROVED = "Y" Then
                        If ToEmails <> "" Then
                            If System.DateTime.Now().ToString("MM/dd/yyyy") > EXPDATE Then 'CUSTOMER->expdate
                                If BALANCE + orders - ARLIMIT <= 0 Then
                                    Subject = "Over 60 Approval for " + Customer.ToString().PadLeft(5, "0") + "/" + Cust_Name.Trim() + " approved by " + User.Name + " Amount over(" + (BALANCE + orders - ARLIMIT + nHollAmt).ToString().PadLeft(9, "0") + ") Credit Limit(" + (ARLIMIT + nHollAmt).ToString().PadLeft(9, "0") + ")"
                                Else
                                    Subject = "Credit limit for " + Customer.ToString().PadLeft(5, "0") + "/" + Cust_Name.Trim() + " approved by " + User.Name + " Amount over(" + (BALANCE + orders - ARLIMIT + nHollAmt).ToString().PadLeft(9, "0") + ") Credit Limit(" + (ARLIMIT + nHollAmt).ToString().PadLeft(9, "0") + ")"
                                End If
                            Else
                                If BALANCE + orders - (ARLIMIT + nHollAmt) <= 0 Then
                                    Subject = "Over 60 Approval for " + Customer.ToString().PadLeft(5, "0") + "/" + Cust_Name.Trim() + " approved by " + User.Name + " Amount over(" + (BALANCE + orders - ARLIMIT + nHollAmt).ToString().PadLeft(9, "0") + ") Credit Limit(" + (ARLIMIT + nHollAmt).ToString().PadLeft(9, "0") + ")"
                                Else
                                    Subject = "Credit limit for " + Customer.ToString().PadLeft(5, "0") + "/" + Cust_Name.Trim() + " approved by " + User.Name + " Amount over(" + (BALANCE + orders - ARLIMIT + nHollAmt).ToString().PadLeft(9, "0") + ") Credit Limit(" + (ARLIMIT + nHollAmt).ToString().PadLeft(9, "0") + ")"
                                End If
                            End If

                            Body = "A/R Balance   :" + BALANCE.ToString("#,##0.00") + Environment.NewLine()
                            Body += "Credit Limit  :" + ARLIMIT.ToString("#,##0.00") + Environment.NewLine()

                            If nHollAmt > 0 Then
                                Body += "Additional Hollyday Credit Limit:" + nHollAmt.ToString("#,##0.00") + Environment.NewLine()
                            End If
                            Body += "Current Amount:" + bal0030.ToString("#,##0.00") + Environment.NewLine()
                            Body += "30-60         :" + bal3060.ToString("#,##0.00") + Environment.NewLine()
                            Body += "60-90         :" + bal6090.ToString("#,##0.00") + Environment.NewLine()
                            Body += "over 90       :" + bal90.ToString("#,##0.00") + Environment.NewLine()
                            Logs.SendEmail(User.Email, ToEmails, Body, "", Subject)
                        End If
                    End If
                End Using
            End Using

            F_CALLHS.SaveCreditLimitsApprovalToCALLHS(Customer, IIf(APPROVED = "Y", "Over Credit Limit approved", "Credit Limit denied " + User.Name))
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCustomerDetailsforCreditLimitsApproval")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Check if the customer has approved/not for approval of the over credit limit to the person. If Approved is null or empty considered as NO(N) :: Abinaya :: 15Feb2019
    ''' </summary>
    ''' <param name="Customer"></param>
    ''' <returns></returns>
    Public Shared Function CheckApprovedForCustomer(ByVal Customer As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Approved As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SELECT ISNULL(APPROVED,'N') FROM VWCUST WHERE CUSTOMER=" + Customer, con)
                    cmd.CommandType = CommandType.Text
                    Approved = cmd.ExecuteScalar()
                End Using
            End Using

            If Approved = "Y" Then
                Approved = "YES"
            Else
                Approved = "NO"
            End If
            Return Approved

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckApprovedForCustomer")
            Throw ex
        End Try
    End Function


End Class
