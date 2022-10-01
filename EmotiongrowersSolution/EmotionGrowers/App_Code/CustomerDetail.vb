Imports System.Data.SqlClient
Imports System.Data


Public Class CustomerDetails
    Public Shared Function GetSalesOrderCustDetails(ByVal Customer As String, ByVal UserName As String) As CustomerDetail
        Try
            If Customer.Trim() = "" Or Customer.Trim() = "null" Or String.IsNullOrEmpty(Customer.Trim()) Then
                ErrorLogs.LogException(New Exception(), "Error Null or Empty Customer being passed to GetSalesOrderCustDetails")
                Return Nothing
            ElseIf Customer.Trim() = "0" Then
                ErrorLogs.LogException(New Exception(), "Error customer 0 being passed to GetSalesOrderCustDetails")
                Return Nothing
            Else
                Dim u As New CustomerDetail

                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select top 1 * from vwCust where Customer=@Customer", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("Customer", Customer)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            u.Customer = row("Customer")
                            If UserName Is Nothing Then
                                u.Name = "XXXXXXXXXXXXXXXXXXXXXXXX"
                            Else
                                u.Name = IIf(UserName.ToLower() = "demo", "XXXXXXXXXXXXXXXXXXXXXXXX", IIf(row("Name") = "", "", row("Name")))
                            End If
                            u.ADDRESS1 = IIf(row("ADDRESS1") Is DBNull.Value, "", row("ADDRESS1"))
                            u.ADDRESS2 = IIf(row("ADDRESS2") Is DBNull.Value, "", row("ADDRESS2"))
                            u.CITY = IIf(row("CITY") Is DBNull.Value, "", row("CITY"))
                            u.STATE = IIf(row("STATE") Is DBNull.Value, "", row("STATE"))
                            u.ZIP = IIf(row("ZIP") Is DBNull.Value, "", row("ZIP"))
                            u.PHONE = IIf(row("PhoneNum") Is DBNull.Value, "", row("PhoneNum"))
                            u.ARBALANCE = IIf(row("ARBALANCE") Is DBNull.Value, 0.00, row("ARBALANCE"))
                            u.CREDITLIMIT = IIf(row("CREDITLIMIT") Is DBNull.Value, 0.00, row("CREDITLIMIT"))
                            u.Available = IIf(row("Available") Is DBNull.Value, 0.00, row("Available"))
                            u.TERMSCODE = IIf(row("TERMSCODE") Is DBNull.Value, "", row("TERMSCODE"))
                            u.TERMSDESC = IIf(row("TERMSDESC") Is DBNull.Value, "", row("TERMSDESC"))
                            u.Email = IIf(row("Email") Is DBNull.Value, "", row("Email"))
                            u.Fax = IIf(row("Fax") Is DBNull.Value, "", row("Fax"))
                            u.Fax = u.Fax.Replace("-", "")
                            u.BAL0030 = IIf(row("BAL0030") Is DBNull.Value, 0.00, row("BAL0030"))
                            u.BAL3060 = IIf(row("BAL3060") Is DBNull.Value, 0.00, row("BAL3060"))
                            u.BAL6090 = IIf(row("BAL6090") Is DBNull.Value, 0.00, row("BAL6090"))
                            u.BAL90 = IIf(row("BAL90") Is DBNull.Value, 0.00, row("BAL90"))
                            u.ORDERS = IIf(row("ORDERS") Is DBNull.Value, 0.00, row("ORDERS"))
                            u.APPHONE = IIf(row("APPHONE1") Is DBNull.Value, "", row("APPHONE1"))
                            u.APCONTACT = IIf(row("APCONTACT") Is DBNull.Value, "", row("APCONTACT"))
                            u.Credithold = IIf(row("Credithold") Is DBNull.Value, "", row("Credithold"))
                            u.ReasonHold = IIf(row("ReasonHold") Is DBNull.Value, "", row("ReasonHold"))
                            Dim linefuel As String = Convert.ToString(row("linefuel"))

                            Dim andeantax As String = Convert.ToString(row("andeantax"))
                            If linefuel = "" Then
                                linefuel = "False"
                            End If

                            u.LineFuel = linefuel

                            If andeantax = "" Then
                                andeantax = "False"
                            End If

                            If linefuel.ToLower() = "true" And andeantax.ToLower() = "true" Then
                                u.FuelOrAndeanCaption = "Fuel/Duties"
                            ElseIf linefuel.ToLower() = "true" And andeantax.ToLower() = "false" Then
                                u.FuelOrAndeanCaption = "Fuel/No Duties"
                            ElseIf linefuel.ToLower() = "false" And andeantax.ToLower() = "true" Then
                                u.FuelOrAndeanCaption = "No Fuel/Duties"
                            ElseIf linefuel.ToLower() = "false" And andeantax.ToLower() = "false" Then
                                u.FuelOrAndeanCaption = "No Fuel/No Duties"
                            Else
                                u.FuelOrAndeanCaption = ""
                            End If

                            u.EXPDATE = IIf(row("EXPDATE") Is DBNull.Value, System.DateTime.Now.ToString("MM/dd/yyyy"), row("EXPDATE"))
                            u.AMTAPPROV = IIf(row("AMTAPPROV") Is DBNull.Value, 0.00, row("AMTAPPROV"))
                            u.APPROVED = IIf(row("APPROVED") Is DBNull.Value, "N", row("APPROVED"))
                            u.HOLLYDAYAM = IIf(row("HOLLYDAYAM") Is DBNull.Value, 0.00, row("HOLLYDAYAM"))
                            u.LastPayment = If(row("LastPay") Is DBNull.Value, System.DateTime.Now.ToString("MM/dd/yyyy"), Convert.ToDateTime(row("LastPay"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                            u.LastPayAmt = IIf(row("LASTPAYAMT") Is DBNull.Value, 0.00, row("LASTPAYAMT"))
                            u.ARLimit = IIf(row("ARLimit") Is DBNull.Value, 0.00, row("ARLimit"))
                            u.OpenOrder = Convert.ToDecimal(GetOpenOrderForCustomer(u.Customer))
                            u.SalesMan = Convert.ToString(row("salesman"))
                            u.Type = Convert.ToString(row("Type"))
                        Next
                    End Using
                End Using
                Return u
            End If

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesOrderCustDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetOpenOrderForCustomer(ByVal Customer As String) As String
        Try
            Dim uList As New List(Of CustomerDetail)()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Select isnull(sum(BOXES*Units*FOB),0.00) OpenOrder from vwOrderDetailsGrid where [Order]=0 And CUSTOMER=@CUSTOMER  ", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Return dt.Rows(0)(0).ToString()
                    Else
                        Return "0.00"
                    End If
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetOpenOrderForCustomer")
            Return Nothing
        End Try
    End Function


    Public Shared Function GetFaxOrEmailDetailsForCustomer(ByVal Customer As String) As String
        Try
            Dim uList As New List(Of CustomerDetail)()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Select isnull(FaxOrEmail,'') from F_CUST where CUSTOMER=@CUSTOMER ", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Return Convert.ToString(dt.Rows(0)(0))
                    Else
                        Return ""
                    End If
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFaxOrEmailDetailsForCustomer")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetCustForAutocomplete(ByVal Customer As String) As List(Of CustomerDetail)
        Try
            Dim uList As New List(Of CustomerDetail)()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                '27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number :: Starts
                Using cmd As New SqlCommand("spGetCustForAutocomplete", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    '27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number :: Ends
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New CustomerDetail()
                        u.Customer = row("Customer")
                        u.Name = IIf(row("Name") = "", "", row("Name"))
                        u.SalesMan = IIf(row("SALESMAN") IsNot DBNull.Value, row("SALESMAN"), 0) '27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number 
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustForAutocomplete")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetCustForAutocompleteWithDivision(ByVal Customer As String, ByVal SalesPerson As String, ByVal Division As String) As List(Of CustomerDetail)
        Try
            Dim uList As New List(Of CustomerDetail)()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                '27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number :: Starts
                Using cmd As New SqlCommand("spGetCustForAutocompleteWithDivision", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    cmd.Parameters.AddWithValue("@SalesPerson", SalesPerson)
                    cmd.Parameters.AddWithValue("@Division", Division)
                    '27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number :: Ends
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New CustomerDetail()
                        u.Customer = row("Customer")
                        u.Name = IIf(row("Name") = "", "", row("Name"))
                        u.SalesMan = IIf(row("SALESMAN") IsNot DBNull.Value, row("SALESMAN"), 0) '27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number 
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustForAutocompleteWithDivision")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' Soumya
    ''' </summary>
    ''' <param name="Customer"></param>
    ''' <returns></returns>
    Public Shared Function GetCustForAutocompleteAR(ByVal Customer As String) As List(Of CustomerDetail)
        Try
            Dim uList As New List(Of CustomerDetail)()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Customer,Name from F_CUST where Customer like '" + Customer + "%' or Name like '" + Customer + "%' order by Customer,Name", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New CustomerDetail()
                        u.Customer = row("Customer")
                        u.Name = IIf(row("Name") = "", "", row("Name"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustForAutocompleteAR")
            Return Nothing
        End Try
    End Function

	Public Shared Function DeleteCustomer(ByVal Customer As String) As String
        Try
            Dim ConString As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConString)
                con.Open()
                Using cmd As New SqlCommand("sp_F_CustDeleteByCode", con)
                    cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteCustomer")
            Return Nothing
        End Try
    End Function
	
	 Public Shared Function VerifyCarrierAccount(ByVal Customer As String, ByVal DELLS As String) As String
        Try
            Dim ConString As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim MsgStr As String
            Using con As New SqlConnection(ConString)
                con.Open()
                Using cmd As New SqlCommand("VerifyCarrierAccount", con)
                    cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    cmd.Parameters.AddWithValue("@DELLS", DELLS)
                    cmd.CommandType = CommandType.StoredProcedure
                    MsgStr = cmd.ExecuteScalar()
                End Using
            End Using
            Return MsgStr
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteCustomer")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetCustDetailsByCustomerNo(ByVal CustomerNo As String) As CustomerDetail
        Try
            Dim u As New CustomerDetail()
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select top 1 * from f_cust where Customer=@CustomerNo", con)
                    cmd.Parameters.AddWithValue("@CustomerNo", CustomerNo)
                    cmd.CommandType = CommandType.Text
                    ' cmd.Parameters.AddWithValue("Customer", Customer)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.Customer = row("Customer")
                        u.Name = IIf(row("Name") Is DBNull.Value, "", row("Name"))
                        u.Type = If(row("Type") Is DBNull.Value, "", row("Type"))
                        u.Markup = If(row("Markup") Is DBNull.Value, 0.0000, row("Markup"))
                        u.ADDRESS1 = If(row("ADDRESS1") Is DBNull.Value, "", row("ADDRESS1"))
                        u.ADDRESS2 = IIf(row("ADDRESS2") Is DBNull.Value, "", row("ADDRESS2"))
                        u.CITY = IIf(row("CITY") Is DBNull.Value, "", row("CITY"))
                        u.STATE = IIf(row("STATE") Is DBNull.Value, "", row("STATE"))
                        u.ZIP = IIf(row("ZIP") Is DBNull.Value, "", row("ZIP"))
                        u.COUNTRY = If(row("COUNTRY") Is DBNull.Value, "", row("COUNTRY"))
                        u.Packing = If(row("Packing") Is DBNull.Value, 0.00, row("Packing"))
                        u.PackingHB = If(row("PackingHB") Is DBNull.Value, 0.00, row("PackingHB"))
                        u.PackingQB = If(row("PackingQB") Is DBNull.Value, 0.00, row("PackingQB"))
                        u.PackingTR = If(row("PackingTR") Is DBNull.Value, 0.00, row("PackingTR"))
                        u.Airport = If(row("AIRPORT") Is DBNull.Value, "", row("AIRPORT"))
                        u.Territory = If(row("TERRITORY") Is DBNull.Value, "", row("TERRITORY"))
                        u.Warehouse = If(row("WAREHOUSE") Is DBNull.Value, "", row("WAREHOUSE"))
                        u.Division = If(row("DIVISION") Is DBNull.Value, 0, row("DIVISION"))
                        u.Purchaser = IIf(row("PURCHASER") Is DBNull.Value, "", row("PURCHASER"))
                        u.PHONE = IIf(row("PHONE") Is DBNull.Value, "", row("PHONE"))
                        u.CONTACT = IIf(row("CONTACT") Is DBNull.Value, "", row("CONTACT"))
                        u.APPHONE = IIf(row("APPHONE") Is DBNull.Value, "", row("APPHONE"))
                        u.Title = If(row("TITLE") Is DBNull.Value, "", row("TITLE"))
                        u.Fax = IIf(row("Fax") Is DBNull.Value, "", row("Fax"))
                        u.Fax = u.Fax.Replace("-", "")
                        u.Email = IIf(row("Email") Is DBNull.Value, "", row("Email"))


                        u.SalesMan = If(row("SALESMAN") Is DBNull.Value, "", row("SALESMAN"))
                        u.TERMSCODE = If(row("TERMS") Is DBNull.Value, "", row("TERMS"))
                        u.Prepaid = If(row("PREPAID") Is DBNull.Value, False, row("PREPAID"))
                        u.LineFuel = If(row("LINEFUEL") Is DBNull.Value, False, row("LINEFUEL"))
                        u.Billto = If(row("BILLTO") Is DBNull.Value, 0, row("BILLTO"))
                        u.Parent = If(row("PARENT") Is DBNull.Value, 0, row("PARENT"))
                        u.ARLimit = If(row("ARLIMIT") Is DBNull.Value, 0.00, row("ARLIMIT"))
                        u.Interest = If(row("INTEREST") Is DBNull.Value, 0.00, row("INTEREST"))
                        u.SalesID = If(row("SALESID") Is DBNull.Value, "", row("SALESID"))
                        u.CreditApp = If(row("CREDITAPP") Is DBNull.Value, "", row("CREDITAPP"))
                        u.CreditDate = If(row("CREDITDATE") Is DBNull.Value, DateTime.Now.ToShortDateString(), row("CREDITDATE"))
                        u.Credithold = If(row("CREDITHOLD") Is DBNull.Value, "", row("CREDITHOLD"))
                        u.NACM = If(row("NACM") Is DBNull.Value, "", row("NACM"))
                        u.NACMNUM = If(row("NACMNUM") Is DBNull.Value, "", row("NACMNUM"))
                        u.ReasonHold = If(row("REASONHOLD") Is DBNull.Value, "", row("REASONHOLD"))
                        u.FaxOrEmail = If(row("FAXOREMAIL") Is DBNull.Value, "", row("FAXOREMAIL"))
                        u.Statement = IIf(row("Statement") Is DBNull.Value, False, row("Statement"))
                        u.Collection = If(row("COLLECTION") Is DBNull.Value, False, row("COLLECTION"))

                        u.ShipInstr = If(row("PICKREMARK") Is DBNull.Value, "", row("PICKREMARK"))
                        u.CallDays = If(row("CALLS") Is DBNull.Value, "", row("CALLS"))
                        u.CallTime = If(row("CALLTIME") Is DBNull.Value, "", row("CALLTIME"))
                        u.Carrier = If(row("CARRIER") Is DBNull.Value, "", row("CARRIER"))
                        u.AndeanTax = If(row("ANDEANTAX") Is DBNull.Value, False, row("ANDEANTAX"))
                        u.Armellini2 = If(row("ARMELLINI2") Is DBNull.Value, "", row("ARMELLINI2"))
                        u.DeliveryDays = If(row("DELLS") Is DBNull.Value, "", row("DELLS"))

                        'u.Exclude = If(row("EXCLUDE") Is DBNull.Value, False, row("EXCLUDE"))
                        u.ChargeFuel = If(row("CHARGEFUEL") Is DBNull.Value, False, row("CHARGEFUEL"))
                        u.Ext1 = If(row("EXT1") Is DBNull.Value, "", row("EXT1"))
                        u.Ext2 = If(row("EXT2") Is DBNull.Value, "", row("EXT2"))
                        u.Ext3 = If(row("EXT3") Is DBNull.Value, "", row("EXT3"))
                        u.OktoSell = If(row("OkSell") Is DBNull.Value, "", row("OkSell"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustDetailsByCustomerNo")
            Return Nothing
        End Try
    End Function

    'Add by Prashant For Previous and Next Record for Customer 
    Public Shared Function GetCustDetailsByCustomerNoWithPrevNextCustomer(ByVal CustomerNo As String) As CustomerDetail
        Try
            Dim u As New CustomerDetail()
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("sp_F_CUSTGetCustDetailsByCustomerNo", con)
                    cmd.Parameters.AddWithValue("@CustomerNo", CustomerNo)
                    cmd.CommandType = CommandType.StoredProcedure
                    ' cmd.Parameters.AddWithValue("Customer", Customer)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.Customer = row("Customer")
                        u.Name = IIf(row("Name") Is DBNull.Value, "", row("Name"))
                        u.Type = If(row("Type") Is DBNull.Value, "", row("Type"))
                        u.Markup = If(row("Markup") Is DBNull.Value, 0.0000, row("Markup"))
                        u.ADDRESS1 = If(row("ADDRESS1") Is DBNull.Value, "", row("ADDRESS1"))
                        u.Packing = If(row("Packing") Is DBNull.Value, 0.00, row("Packing"))
                        u.PackingHB = If(row("PackingHB") Is DBNull.Value, 0.00, row("PackingHB"))
                        u.ADDRESS2 = IIf(row("ADDRESS2") Is DBNull.Value, "", row("ADDRESS2"))
                        u.PackingQB = If(row("PackingQB") Is DBNull.Value, 0.00, row("PackingQB"))
                        u.PackingTR = If(row("PackingTR") Is DBNull.Value, 0.00, row("PackingTR"))
                        u.CITY = IIf(row("CITY") Is DBNull.Value, "", row("CITY"))
                        u.COUNTRY = If(row("COUNTRY") Is DBNull.Value, "", row("COUNTRY"))
                        u.STATE = IIf(row("STATE") Is DBNull.Value, "", row("STATE"))
                        u.ZIP = IIf(row("ZIP") Is DBNull.Value, "", row("ZIP"))
                        u.Airport = If(row("AIRPORT") Is DBNull.Value, "", row("AIRPORT"))
                        u.Territory = If(row("TERRITORY") Is DBNull.Value, "", row("TERRITORY"))
                        u.Warehouse = If(row("WAREHOUSE") Is DBNull.Value, "", row("WAREHOUSE"))
                        u.Division = If(row("DIVISION") Is DBNull.Value, 1, row("DIVISION"))

                        u.Purchaser = IIf(row("PURCHASER") Is DBNull.Value, "", row("PURCHASER"))
                        u.PHONE = IIf(row("PHONE") Is DBNull.Value, "", row("PHONE"))
                        u.CONTACT = IIf(row("CONTACT") Is DBNull.Value, "", row("CONTACT"))
                        u.APPHONE = IIf(row("APPHONE") Is DBNull.Value, "", row("APPHONE"))
                        u.Title = If(row("TITLE") Is DBNull.Value, "", row("TITLE"))
                        u.Fax = IIf(row("Fax") Is DBNull.Value, "", row("Fax"))
                        u.Fax = u.Fax.Replace("-", "")
                        u.Email = IIf(row("Email") Is DBNull.Value, "", row("Email"))


                        u.SalesMan = If(row("SALESMAN") Is DBNull.Value, "", row("SALESMAN"))
                        u.TERMSCODE = If(row("TERMS") Is DBNull.Value, "", row("TERMS"))
                        u.Prepaid = If(row("PREPAID") Is DBNull.Value, False, row("PREPAID"))
                        u.LineFuel = If(row("LINEFUEL") Is DBNull.Value, False, row("LINEFUEL"))
                        u.Billto = If(row("BILLTO") Is DBNull.Value, 0, row("BILLTO"))
                        u.Parent = If(row("PARENT") Is DBNull.Value, 0, row("PARENT"))
                        u.ARLimit = If(row("ARLIMIT") Is DBNull.Value, 0.00, row("ARLIMIT"))
                        u.Interest = If(row("INTEREST") Is DBNull.Value, 0.00, row("INTEREST"))
                        u.SalesID = If(row("SALESID") Is DBNull.Value, "", row("SALESID"))
                        u.CreditApp = If(row("CREDITAPP") Is DBNull.Value, "", row("CREDITAPP"))
                        u.CreditDate = If(row("CREDITDATE") Is DBNull.Value, DateTime.Now.ToShortDateString(), row("CREDITDATE"))
                        u.Credithold = If(row("CREDITHOLD") Is DBNull.Value, "", row("CREDITHOLD"))
                        u.NACM = If(row("NACM") Is DBNull.Value, "", row("NACM"))
                        u.NACMNUM = If(row("NACMNUM") Is DBNull.Value, "", row("NACMNUM"))
                        u.ReasonHold = If(row("REASONHOLD") Is DBNull.Value, "", row("REASONHOLD"))
                        u.FaxOrEmail = If(row("FAXOREMAIL") Is DBNull.Value, "", row("FAXOREMAIL"))
                        u.Statement = IIf(row("Statement") Is DBNull.Value, False, row("Statement"))
                        u.Collection = If(row("COLLECTION") Is DBNull.Value, False, row("COLLECTION"))

                        u.ShipInstr = If(row("PICKREMARK") Is DBNull.Value, "", row("PICKREMARK"))
                        u.CallDays = If(row("CALLS") Is DBNull.Value, "", row("CALLS"))
                        u.CallTime = If(row("CALLTIME") Is DBNull.Value, "", row("CALLTIME"))
                        u.Carrier = If(row("CARRIER") Is DBNull.Value, "", row("CARRIER"))
                        u.AndeanTax = If(row("ANDEANTAX") Is DBNull.Value, False, row("ANDEANTAX"))
                        u.Armellini2 = If(row("ARMELLINI2") Is DBNull.Value, "", row("ARMELLINI2"))
                        u.DeliveryDays = If(row("DELLS") Is DBNull.Value, "", row("DELLS"))

                        'u.Exclude = If(row("EXCLUDE") Is DBNull.Value, False, row("EXCLUDE"))
                        u.ChargeFuel = If(row("CHARGEFUEL") Is DBNull.Value, False, row("CHARGEFUEL"))
                        u.Ext1 = If(row("EXT1") Is DBNull.Value, "", row("EXT1"))
                        u.Ext2 = If(row("EXT2") Is DBNull.Value, "", row("EXT2"))
                        u.Ext3 = If(row("EXT3") Is DBNull.Value, "", row("EXT3"))
                        u.OktoSell = If(row("OkSell") Is DBNull.Value, "", row("OkSell"))
                        u.NextCustomer = IIf(row("NextCustomer") Is DBNull.Value, 0, row("NextCustomer"))
                        u.PrevCustomer = IIf(row("PreviousCustomer") Is DBNull.Value, 0, row("PreviousCustomer"))
                        u.Vendor = IIf(row("Vendor") Is DBNull.Value, "", row("Vendor"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustDetailsByCustomerNoWithPrevNextCustomer")
            Return Nothing
        End Try
    End Function
	
	Public Shared Function GetLastCustDetails() As CustomerDetail
        Try
            Dim uList As New CustomerDetail()
            Dim ConString As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConString)
                con.Open()
                Using cmd As New SqlCommand("LastCustomerRecord", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        uList.Type = If(row("Type") Is DBNull.Value, "", row("Type"))
                        uList.SalesMan = If(row("SALESMAN") Is DBNull.Value, "", row("SALESMAN"))
                        uList.TERMSCODE = If(row("TERMS") Is DBNull.Value, "", row("TERMS"))
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetLastCustDetails")
            Return Nothing
        End Try
    End Function
	
    Public Shared Function GetCustomersForKometpost() As List(Of CustomerDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of CustomerDetail)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select top 10 * from F_CUST where  KOMETID='' or  KOMETID='0'  ", con)
                        cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)


                    For Each row In ds.Tables(0).Rows
                        Dim u As New CustomerDetail()
                        u.Customer = row("CUSTOMER")
                        u.Name = row("NAME")
                        u.ADDRESS1 = IIf(row("ADDRESS1") Is DBNull.Value, "", row("ADDRESS1"))
                        u.CITY = IIf(row("CITY") Is DBNull.Value, "", row("CITY"))
                        u.STATE = IIf(row("STATE") Is DBNull.Value, "", row("STATE"))
                        u.COUNTRY = IIf(row("COUNTRY") Is DBNull.Value, "", row("COUNTRY"))
                        u.ZIP = IIf(row("ZIP") Is DBNull.Value, "", row("ZIP"))
                        u.PHONE = IIf(row("PHONE") Is DBNull.Value, "", row("PHONE"))
                        uList.Add(u)
                    Next

                End Using
            End Using
            Return uList


        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerDetailsFromSQL")
            Throw ex
        End Try
    End Function

    Public Shared Function GetSingleCustomerForKometpost(ByVal CUSTOMER As String) As List(Of CustomerDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of CustomerDetail)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from F_CUST where CUSTOMER=@CUSTOMER and  (KOMETID='' or KOMETID='0')  ", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@CUSTOMER", CUSTOMER.ToString())
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    For Each row In ds.Tables(0).Rows
                        Dim u As New CustomerDetail()
                        u.Customer = row("CUSTOMER")
                        u.Name = row("NAME")
                        u.ADDRESS1 = IIf(row("ADDRESS1") Is DBNull.Value, "", row("ADDRESS1"))
                        u.CITY = IIf(row("CITY") Is DBNull.Value, "", row("CITY"))
                        u.STATE = IIf(row("STATE") Is DBNull.Value, "", row("STATE"))
                        u.COUNTRY = IIf(row("COUNTRY") Is DBNull.Value, "", row("COUNTRY"))
                        u.ZIP = IIf(row("ZIP") Is DBNull.Value, "", row("ZIP"))
                        u.PHONE = IIf(row("PHONE") Is DBNull.Value, "", row("PHONE"))
                        u.MARKUPVALUE = IIf(row("Markup") Is DBNull.Value, "", row("Markup"))
                        uList.Add(u)
                    Next

                End Using
            End Using
            Return uList


        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerDetailsFromSQL")
            Throw ex
        End Try
    End Function

    Public Shared Function UpdateKometID(ByVal KometID As String, ByVal CUSTOMER As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("Update F_CUST set KOMETID=@KometID where CUSTOMER=@CUSTOMER ", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@CUSTOMER", CUSTOMER.ToString())
                    cmd1.Parameters.AddWithValue("@KometID", KometID.ToString())
                    Dim result1 = cmd1.ExecuteNonQuery()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCUSTOMERKometID")
            Return Nothing
        End Try
        Return ""
    End Function


    Public Shared Function GetCustomerTruckDays(ByVal CUSTOMER As String) As String
        Try


            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                If String.IsNullOrEmpty(CUSTOMER) Or CUSTOMER.ToUpper().Trim() = "NULL" Then
                    CUSTOMER = ""
                End If
                Using cmd1 As New SqlCommand("SELECT ISNULL(DELLS,'') DELLS FROM F_CUST WHERE CUSTOMER=@CUSTOMER ", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@CUSTOMER", CUSTOMER.ToString())
                    Dim result1 = cmd1.ExecuteScalar
                    Return Convert.ToString(result1)
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerTruckDays")
            Return Nothing
        End Try
        Return ""
    End Function

    Public Shared Function GetCustomerKometID(ByVal CUSTOMER As String) As String
        Try


            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("SELECT KOMETID FROM F_CUST WHERE CUSTOMER=@CUSTOMER ", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@CUSTOMER", CUSTOMER.ToString())
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1.ToString()
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerKometID")
            Return Nothing
        End Try
        Return ""
    End Function

    Public Shared Function GetSalesOrderCustInfo(ByVal Customer As String, ByVal UserName As String) As List(Of CustomerDetail)
        Try
            Dim uList As New List(Of CustomerDetail)()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sqlQuery As String = ""
                If Customer <> "0" Then
                    sqlQuery = "select * from vwCust where Customer=@Customer"
                Else
                    sqlQuery = "select * from vwCust"
                End If

                Using cmd As New SqlCommand(sqlQuery, con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("Customer", Customer)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New CustomerDetail()
                        u.Customer = row("Customer")
                        If UserName Is Nothing Then
                            u.Name = "XXXXXXXXXXXXXXXXXXXXXXXX"
                        Else
                            u.Name = IIf(UserName.ToLower() = "demo", "XXXXXXXXXXXXXXXXXXXXXXXX", IIf(row("Name") = "", "", row("Name")))
                        End If

                        u.PHONE = IIf(row("PhoneNum") Is DBNull.Value, "", row("PhoneNum"))
                        u.Email = IIf(row("Email") Is DBNull.Value, "", row("Email"))
                        u.Fax = IIf(row("FaxNum") Is DBNull.Value, "", row("FaxNum"))
                        'u.Fax = u.Fax.Replace("-", "")
                        u.APPHONE = IIf(row("APPHONENUM") Is DBNull.Value, "", row("APPHONENUM"))
                        u.APCONTACT = IIf(row("APCONTACTNUM") Is DBNull.Value, "", row("APCONTACTNUM"))
                        u.APEmail = IIf(row("APEMAIL") Is DBNull.Value, "", row("APEMAIL"))
                        u.APFax = IIf(row("APFAX") Is DBNull.Value, "", row("APFAX"))
                        u.CustSince = Convert.ToDateTime(row("CustSince"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                        u.LastSale = Convert.ToDateTime(row("LastSale"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                        u.LastPayment = Convert.ToDateTime(row("LastPay"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                        u.LastPayAmt = IIf(row("LastPayAmt") Is DBNull.Value, 0.00, row("LastPayAmt"))
                        u.SalesMan = IIf(row("SalesMan") Is DBNull.Value, 0, row("SalesMan"))
                        u.Purchaser = IIf(row("Purchaser") Is DBNull.Value, "", row("Purchaser"))
                        u.SalesmanName = IIf(row("SalesmanName") Is DBNull.Value, "", row("SalesmanName"))
                        u.CallDays = IIf(row("Calls") Is DBNull.Value, "", row("Calls"))
                        u.CallTime = IIf(row("CallTime") Is DBNull.Value, "", row("CallTime"))
                        u.DeliveryDays = IIf(row("DELLS") Is DBNull.Value, "", row("DELLS"))
                        u.Airport = IIf(row("Airport") Is DBNull.Value, "", row("Airport"))
                        u.Airline = IIf(row("Airline") Is DBNull.Value, "", row("Airline"))
                        u.ShipInstr = IIf(row("PickRemark") Is DBNull.Value, "", row("PickRemark"))
                        u.FaxOrEmail = IIf(row("FaxOrEmail") Is DBNull.Value, "", row("FaxOrEmail"))

                        u.Y1Sales = IIf(row("ytdsls") Is DBNull.Value, 0.00, row("ytdsls"))
                        u.Y2Sales = IIf(row("lytdsls") Is DBNull.Value, 0.00, row("lytdsls"))
                        u.Y3Sales = IIf(row("lytdsls2") Is DBNull.Value, 0.00, row("lytdsls2"))
                        u.Y4Sales = IIf(row("lytdsls3") Is DBNull.Value, 0.00, row("lytdsls3"))
                        u.Y5Sales = IIf(row("lytdsls4") Is DBNull.Value, 0.00, row("lytdsls4"))

                        u.Y1Payment = IIf(row("ytdpay") Is DBNull.Value, 0.00, row("ytdpay"))
                        u.Y2Payment = IIf(row("lytdpay") Is DBNull.Value, 0.00, row("lytdpay"))
                        u.Y3Payment = IIf(row("lytdpay2") Is DBNull.Value, 0.00, row("lytdpay2"))
                        u.Y4Payment = IIf(row("lytdpay3") Is DBNull.Value, 0.00, row("lytdpay3"))
                        u.Y5Payment = IIf(row("lytdpay4") Is DBNull.Value, 0.00, row("lytdpay4"))

                        u.Y1Credits = IIf(row("ytdcre") Is DBNull.Value, 0.00, row("ytdcre"))
                        u.Y2Credits = IIf(row("lytdcre") Is DBNull.Value, 0.00, row("lytdcre"))
                        u.Y3Credits = IIf(row("lytdcre2") Is DBNull.Value, 0.00, row("lytdcre2"))
                        u.Y4Credits = IIf(row("lytdcre3") Is DBNull.Value, 0.00, row("lytdcre3"))
                        u.Y5Credits = IIf(row("lytdcre4") Is DBNull.Value, 0.00, row("lytdcre4"))

                        u.slscretyr = IIf(row("slscretyr") Is DBNull.Value, "0.00", row("slscretyr"))
                        u.slscrelyr = IIf(row("slscrelyr") Is DBNull.Value, "0.00", row("slscrelyr"))
                        u.slscrelyr2 = IIf(row("slscrelyr2") Is DBNull.Value, "0.00", row("slscrelyr2"))
                        u.slscrelyr3 = IIf(row("slscrelyr3") Is DBNull.Value, "0.00", row("slscrelyr3"))
                        u.slscrelyr4 = IIf(row("slscrelyr4") Is DBNull.Value, "0.00", row("slscrelyr4"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesOrderCustInfo")
            Return Nothing
        End Try
    End Function


    Public Shared Function GetNestSalesCalculation(ByVal Customer As String) As DataTable
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sqlQuery As String = ""
                If Customer <> "0" Then
                    sqlQuery = "select ytdsls, lytdsls, lytdsls2, lytdsls3, lytdsls4, ytdpay, lytdpay, lytdpay2, lytdpay3, lytdpay4, ytdcre, lytdcre, lytdcre2, lytdcre3, lytdcre4, slscretyr, slscrelyr, slscrelyr2, slscrelyr3, slscrelyr4 from vwCust where Customer=@Customer"
                Else
                    sqlQuery = "select ytdsls, lytdsls, lytdsls2, lytdsls3, lytdsls4, ytdpay, lytdpay, lytdpay2, lytdpay3, lytdpay4, ytdcre, lytdcre, lytdcre2, lytdcre3, lytdcre4, slscretyr, slscrelyr, slscrelyr2, slscrelyr3, slscrelyr4 from vwCust"
                End If

                Using cmd As New SqlCommand(sqlQuery, con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("Customer", Customer)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return dt
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetNestSalesCalculation")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetTotalCompanySalesCalculation(ByVal Customer As String, ByVal SalesMan As String, ByVal Division As String) As CustomerMaster
        Try
            Dim uList As New List(Of CustomerDetail)()
            Dim ddlList As New List(Of SalesManDDL)()
            Dim mList As New CustomerMaster()
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sqlQuery As String = ""
                sqlQuery = "spCustomerwiseMonthlysalesforgraph"
                Using cmd As New SqlCommand(sqlQuery, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    cmd.Parameters.AddWithValue("@SALESMAN", SalesMan)
                    cmd.Parameters.AddWithValue("@DIVISION", Division)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataSet
                    da.Fill(dt)
                    For Each row In dt.Tables(0).Rows
                        Dim u As New CustomerDetail()
                        u.Name = row("CUSTNAME")
                        u.DivYear1 = IIf(row("DivYear1") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear1"))
                        u.DivYear2 = IIf(row("DivYear2") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear2"))
                        u.DivYear3 = IIf(row("DivYear3") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear3"))
                        u.DivYear4 = IIf(row("DivYear4") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear4"))
                        u.DivYear5 = IIf(row("DivYear5") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear5"))
                        uList.Add(u)
                    Next
                    For Each row In dt.Tables(1).Rows
                        Dim d As New SalesManDDL()
                        d.SALESMAN = row("SALESMAN")
                        d.Name = row("NAME")
                        ddlList.Add(d)
                    Next
                    mList.CustomerList = uList
                    mList.SalesManDDLList = ddlList
                    Return mList
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetTotalCompanySalesCalculation")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetSalesPersonWiseDailyDataForGraphs() As CustomerMaster
        Try
            Dim uList As New List(Of CustomerDetail)()
            Dim PList As New List(Of SalesPersonModel)()
            Dim mList As New CustomerMaster()
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sqlQuery As String = ""
                sqlQuery = "spSalesPersonWiseDailyTotoalSalesGraph"
                Using cmd As New SqlCommand(sqlQuery, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataSet
                    da.Fill(dt)
                    For Each row In dt.Tables(0).Rows
                        Dim u As New CustomerDetail()
                        u.Name = row("CUSTNAME")
                        u.DivYear1 = IIf(row("DivYear1") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear1"))
                        u.DivYear2 = IIf(row("DivYear2") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear2"))
                        u.DivYear3 = IIf(row("DivYear3") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear3"))
                        u.DivYear4 = IIf(row("DivYear4") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear4"))
                        u.DivYear5 = IIf(row("DivYear5") Is DBNull.Value, "0~0~0~0~0~0~0~0~0~0~0~0", row("DivYear5"))
                        uList.Add(u)
                    Next
                    For Each row In dt.Tables(1).Rows
                        Dim d As New SalesPersonModel()
                        d.SLNO = row("SLNO")
                        d.Name = row("NAME")
                        PList.Add(d)
                    Next
                    mList.CustomerList = uList
                    mList.SalesPersonModelList = PList
                    Return mList
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesPersonWiseDailyDataForGraphs")
            Return Nothing
        End Try
    End Function

    'Abi/Nivetha :: 01 Mar 19 :: Need to add three edit fields that are in f_cust :: Modified
    Public Shared Function UpdateCustomerDetailsInfo(ByVal CustNo As String, ByVal Buyer As String, ByVal Phone As String, ByVal Fax As String, ByVal CallTime As String, ByVal CallDays As String, ByVal DelivDays As String, ByVal Airport As String, ByVal Airline As String, ByVal ShipInstrc As String, ByVal Email As String, ByVal FaxOrEmail As String, ByVal APContact As String, ByVal APPhone As String, ByVal APEmail As String, ByVal APFax As String, ByVal CombInv As Boolean, ByVal NoSubs As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("update F_CUST set Purchaser=@Buyer,Apphone=@Phone,Fax=@Fax,CALLTIME=@CallTime,Calls=@CallDays,DELLS=@DelivDays,AIRPORT=@Airport,AIRLINE=@Airline,PickRemark=@ShipInstrc,Email=@Email,FaxOrEmail=@FaxOrEmail ,CombInv=@CombInv,NoSubs=@NoSubs where CUSTOMER=@CustNo", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@Buyer", Buyer)
                    cmd.Parameters.AddWithValue("@Phone", Phone)
                    cmd.Parameters.AddWithValue("@Fax", Fax)
                    cmd.Parameters.AddWithValue("@CallTime", CallTime)
                    cmd.Parameters.AddWithValue("@CallDays", CallDays)
                    cmd.Parameters.AddWithValue("@DelivDays", DelivDays)
                    cmd.Parameters.AddWithValue("@Airline", Airline)
                    cmd.Parameters.AddWithValue("@ShipInstrc", ShipInstrc)
                    cmd.Parameters.AddWithValue("@Email", Email)
                    cmd.Parameters.AddWithValue("@FaxOrEmail", FaxOrEmail)
                    cmd.Parameters.AddWithValue("@CombInv", CombInv)
                    'cmd.Parameters.AddWithValue("@ExcludePrint", ExcludePrint)
                    cmd.Parameters.AddWithValue("@NoSubs", NoSubs)
                    cmd.Parameters.AddWithValue("@Airport", Airport)
                    cmd.Parameters.AddWithValue("@CustNo", CustNo)
                    cmd.ExecuteNonQuery()
                End Using

                Using cmd1 As New SqlCommand("select count(*) from tblAPCONTACT where CUSTOMER=@CustNo", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@CustNo", CustNo)
                    Dim res As Integer = cmd1.ExecuteScalar()
                    Dim sqlstr As String = ""
                    sqlstr = IIf(res > 0, "update tblAPCONTACT set APCONTACT='" + APContact + "',APPHONE='" + APPhone + "',APEmail='" + APEmail + "', Fax='" + APFax + "' where CUSTOMER='" + CustNo + "'", "Insert into tblAPCONTACT(Customer,APCONTACT,APPHONE,APEMAIL,Fax) values('" + CustNo + "','" + APContact + "','" + APPhone + "','" + APEmail + "','" + APFax + "')")

                    Using cmdInstr As New SqlCommand(sqlstr, con)
                        cmdInstr.CommandType = CommandType.Text
                        cmdInstr.ExecuteNonQuery()
                    End Using
                End Using

            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCustomerDetailsInfo")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetCustomerComments(ByVal CUSTOMER As Integer) As String

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using Cmd As New SqlCommand("SELECT ISNULL(COMMENTS,'') COMMENTS FROM F_CSTCOM WHERE CUSTOMER=@CUSTOMER", con)
                    Cmd.CommandType = CommandType.Text
                    Cmd.Parameters.AddWithValue("@CUSTOMER", CUSTOMER)
                    Dim Reader As SqlDataReader = Cmd.ExecuteReader()
                    If Reader.HasRows Then
                        Reader.Read()
                        result = Reader(0).ToString.Trim()
                    Else
                        result = ""
                    End If

                End Using
                con.Close()
            End Using
            Return result

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerComments")
            Return ""
        End Try

    End Function

    Public Shared Function SaveCustomerComments(ByVal CUSTOMER As String, ByVal Comments As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("select count(*) from F_CSTCOM where CUSTOMER=@CUSTOMER", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@CUSTOMER", CUSTOMER)
                    Dim res As Integer = cmd1.ExecuteScalar()
                    Dim sqlstr As String = ""
                    If res > 0 Then
                        sqlstr = "Update F_CSTCOM set COMMENTS=@Comments where Customer=@CUSTOMER"
                    Else
                        sqlstr = "Insert into F_CSTCOM (CUSTOMER,COMMENTS) values (@CUSTOMER,@COMMENTS)"
                    End If

                    Using cmdInstr As New SqlCommand(sqlstr, con)
                        cmdInstr.Parameters.AddWithValue("@CUSTOMER", CUSTOMER)
                        cmdInstr.Parameters.AddWithValue("@Comments", Comments)
                        cmdInstr.CommandType = CommandType.Text
                        cmdInstr.ExecuteNonQuery()
                    End Using
                End Using
                con.Close()
            End Using
            Return "Success"

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerComments")
            Return "error"
        End Try
    End Function



    Public Shared Function InsertCustomerDetails(Customer As String, Name As String, Type As String, Markup As Decimal, Address1 As String, Address2 As String, City As String, Country As String, State As String, Zip As String, Airport As String, Territory As String, Purchaser As String, Phone As String, BuyerExt As String, Contact As String, Apphone As String, ContactExt As String, Title As String, Fax As String, ContactTitleExt As String, Email As String, Salesman As String, SalesmanName As String, Termscode As String, TermsDesc As String, Prepaid As String, LineFuel As String, Billto As Integer, Parent As Integer, ARLimit As Decimal, Interest As Decimal, SalesID As String, CreditApp As String, CreditDate As String, CreditHold As String, NACM As String, NACMNUM As String, ReasonHold As String, ChargeFuel As String, FaxOrEmail As String, Statement As String, Collection As String, OkToSell As String, Service As String, Vendor As String, ShipInstr As String, CallTime As String, Carrier As String, Printnodat As String, AndeanTax As String, Armellini2 As String, Calls As String, DELLS As String, UserName As String, UserEmail As String, WareHouse As String, Division As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()

                Using cmd As New SqlCommand("insert into F_CUST(Customer,Name,Type,Markup,Address1,Address2,City, Country , State , Zip, Airport, Territory, " +
                        "Purchaser, Phone, Contact, Apphone, Title, Fax, Email, Salesman, Terms, Prepaid, LineFuel, Billto, Parent, ARLimit , Interest, SalesID, CreditApp, CreditDate, CreditHold, NACM, NACMNUM, ReasonHold," +
                        "FaxOrEmail, Statement, Collection, PickRemark, Calls, DELLS, CallTime, Carrier, AndeanTax, Armellini2, OkSell,ChargeFuel,Ext1,Ext2,Ext3,WAREHOUSE,Division,Vendor ) " +
                        "values(@Customer,@Name,@Type,@Markup,@Address1,@Address2,@City,@Country,@State ,@Zip,@Airport ,@Territory," +
                        "@Purchaser ,@Phone ,@Contact ,@Apphone ,@Title ,@Fax ,@Email ,@Salesman ,@Termscode ,@Prepaid ,@LineFuel ,@BillTo,@Parent ,@ARLimit ,@Interest ,@SalesID ,@CreditApp ,@CreditDate ,@CreditHold ,@NACM ,@NACMNUM ,@ReasonHold," +
                        "@FaxOrEmail ,@Statement ,@Collection ,@ShipInstr ,@Calls ,@Dells ,@CallTime ,@Carrier ,@AndeanTax,@Armellini2,@OktoSell,@ChargeFuel,@BuyerExt,@ContactExt,@ContactTitleExt,@WAREHOUSE,@Division,@Vendor)", con)
                    cmd.CommandType = CommandType.Text

                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    cmd.Parameters.AddWithValue("@Name", Name.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Type", Type)
                    cmd.Parameters.AddWithValue("@Markup", Markup)
                    cmd.Parameters.AddWithValue("@Address1", Address1.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Address2", Address2.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@City", City.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Country", Country)
                    cmd.Parameters.AddWithValue("@State", State)
                    cmd.Parameters.AddWithValue("@Zip", Zip)
                    cmd.Parameters.AddWithValue("@Airport", Airport.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Territory", Territory)
                    cmd.Parameters.AddWithValue("@WAREHOUSE", WareHouse)
                    cmd.Parameters.AddWithValue("@Division", Division)
                    cmd.Parameters.AddWithValue("@Purchaser", Purchaser.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Phone", Phone)
                    cmd.Parameters.AddWithValue("@Contact", Contact.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Apphone", Apphone)
                    cmd.Parameters.AddWithValue("@Title", Title.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Email", Email)
                    cmd.Parameters.AddWithValue("@Fax", Fax)
                    cmd.Parameters.AddWithValue("@Salesman", Salesman)
                    cmd.Parameters.AddWithValue("@Termscode", Termscode)
                    cmd.Parameters.AddWithValue("@Prepaid", Prepaid)
                    cmd.Parameters.AddWithValue("@LineFuel", LineFuel)
                    cmd.Parameters.AddWithValue("@BillTo", Billto)
                    cmd.Parameters.AddWithValue("@Parent", Parent)

                    cmd.Parameters.AddWithValue("@ARLimit", ARLimit)
                    cmd.Parameters.AddWithValue("@Interest", Interest)
                    cmd.Parameters.AddWithValue("@SalesID", SalesID)
                    cmd.Parameters.AddWithValue("@CreditApp", CreditApp)
                    cmd.Parameters.AddWithValue("@CreditDate", CreditDate)
                    cmd.Parameters.AddWithValue("@CreditHold", CreditHold)
                    cmd.Parameters.AddWithValue("@NACM", NACM)
                    cmd.Parameters.AddWithValue("@NACMNUM", NACMNUM)
                    cmd.Parameters.AddWithValue("@ReasonHold", ReasonHold.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@FaxOrEmail", FaxOrEmail)
                    cmd.Parameters.AddWithValue("@Statement", Statement)

                    cmd.Parameters.AddWithValue("@Collection", Collection)
                    cmd.Parameters.AddWithValue("@ShipInstr", ShipInstr.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@CallTime", CallTime)
                    cmd.Parameters.AddWithValue("@Carrier", Carrier)
                    cmd.Parameters.AddWithValue("@AndeanTax", AndeanTax)
                    cmd.Parameters.AddWithValue("@Armellini2", Armellini2)

                    cmd.Parameters.AddWithValue("@Calls", Calls)
                    cmd.Parameters.AddWithValue("@Dells", DELLS)
                    cmd.Parameters.AddWithValue("@OktoSell", OkToSell)

                    cmd.Parameters.AddWithValue("@ChargeFuel", ChargeFuel)
                    cmd.Parameters.AddWithValue("@BuyerExt", BuyerExt)
                    cmd.Parameters.AddWithValue("@ContactExt", ContactExt)
                    cmd.Parameters.AddWithValue("@ContactTitleExt", ContactTitleExt)
                    cmd.Parameters.AddWithValue("@Vendor", Vendor)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in InsertCustomerDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function UpdateCustomerDetails(Customer As String, Name As String, Type As String, Markup As Decimal, Address1 As String, Address2 As String, City As String, Country As String, State As String, Zip As String, Airport As String, Territory As String, Purchaser As String, Phone As String, BuyerExt As String, Contact As String, Apphone As String, ContactExt As String, Title As String, Fax As String, ContactTitleExt As String, Email As String, Salesman As String, SalesmanName As String, Termscode As String, TermsDesc As String, Prepaid As String, LineFuel As String, Billto As Integer, Parent As Integer, ARLimit As Decimal, Interest As Decimal, SalesID As String, CreditApp As String, CreditDate As String, CreditHold As String, NACM As String, NACMNUM As String, ReasonHold As String, ChargeFuel As String, FaxOrEmail As String, Statement As String, Collection As String, OkToSell As String, Service As String, Vendor As String, ShipInstr As String, CallTime As String, Carrier As String, Printnodat As String, AndeanTax As String, Armellini2 As String, Calls As String, DELLS As String, UserName As String, UserEmail As String, Warehouse As String, Division As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()

                Using custCmd As New SqlCommand("select top 1 term.*,* From f_cust cust left Join f_terms term on cust.terms=term.code Where cust.customer =@Customer", con)
                    custCmd.Parameters.AddWithValue("@Customer", Customer)
                    custCmd.CommandType = CommandType.Text
                    Dim Reader As SqlDataReader = custCmd.ExecuteReader()
                    Dim callhsQuery As String = ""
                    Dim callhsNote As String = ""
                    Dim EmailContent As String = ""
                    Dim EmailSubject As String = ""
                    Dim ARLimits_Emails As String = F_Emails.GetEmailsByType("ARLIMITS")

                    If Reader.HasRows Then
                        While Reader.Read()
                            If (Convert.ToDecimal(Reader("arlimit")) <> ARLimit) Then
                                'Insert new record for callhs if customer limit not same as given
                                callhsNote = "CREDIT LIMIT " + If(Reader("arlimit") < ARLimit, "RAISED", "LOWERED") + " From $" + Convert.ToDecimal(Reader("arlimit")).ToString("#,###.00") + " TO $" + Convert.ToDecimal(ARLimit).ToString("#,###.00") + ""
                                InsertCallHSFromCust(callhsNote, Customer, UserName)

                                If ARLimits_Emails.Trim() <> "" Then
                                    'Send email for ARLIMITS type from F_EMAIL table
                                    EmailContent = Environment.NewLine + callhsNote + Environment.NewLine + "CUSTOMER: " + Reader("Name").ToString().ToUpper() + Environment.NewLine + "      " + Reader("City").ToString().ToUpper() + "," + Reader("State").ToString().ToUpper() + Environment.NewLine + UserName.ToUpper() + Environment.NewLine + "USER :: " + Salesman + "  " + SalesmanName.ToUpper() + Environment.NewLine + "COMPUTER NAME: " + Environment.MachineName.ToUpper() + Environment.NewLine + "COMPUTER USER NAME: " + Environment.UserName.ToUpper()
                                    EmailSubject = Trim(Reader("Name")) + " " + callhsNote
                                    Logs.SendEmail(UserEmail, ARLimits_Emails, EmailContent, "", EmailSubject)
                                End If
                            End If

                            If (Reader("credithold").ToString().Trim() <> CreditHold.Trim()) Then
                                'Insert new record for callhs if credit hold not same as given
                                callhsNote = If(CreditHold = "Y", "ON CREDIT HOLD ", "REMOVED FROM HOLD ") + If(ReasonHold IsNot DBNull.Value, "BECAUSE " + ReasonHold.ToUpper(), "")
                                InsertCallHSFromCust(callhsNote, Customer, UserName)

                                If ARLimits_Emails.Trim() <> "" Then
                                    'Send email for ARHOLD type from F_EMAIL table
                                    EmailContent = Environment.NewLine + callhsNote + Environment.NewLine + "CUSTOMER: " + Reader("Name").ToString().ToUpper() + Environment.NewLine + "      " + Reader("City").ToString().ToUpper() + "," + Reader("State").ToString().ToUpper() + Environment.NewLine + UserName.ToUpper() + Environment.NewLine + "USER :: " + Salesman + "  " + SalesmanName.ToUpper() + Environment.NewLine + "COMPUTER NAME: " + Environment.MachineName.ToUpper() + Environment.NewLine + "COMPUTER USER NAME: " + Environment.UserName.ToUpper()
                                    EmailSubject = Trim(Reader("Name")) + " " + callhsNote
                                    Logs.SendEmail(UserEmail, ARLimits_Emails, EmailContent, "", EmailSubject)
                                End If

                                'Else
                                '    'Send email for ARLIMITS type from F_EMAIL table
                                '    EmailContent = Environment.NewLine + callhsNote + Environment.NewLine + "Customer " + Reader("Name") + Environment.NewLine + Reader("City") + "       " + Reader("State") + Environment.NewLine + UserName + Environment.NewLine + "User# " + Salesman + SalesmanName + Environment.NewLine + "Computer Name " + Environment.MachineName + Environment.NewLine + "Computer User Name " + Environment.UserName
                                '    EmailSubject = Trim(Reader("Name")) + " " + callhsNote
                                '    SendEmailFromCustomerUpdate("ARLIMITS", UserEmail, EmailContent, EmailSubject)
                            End If

                            If (Reader("Type") <> Type And Type.Substring(0, 1) = "T") Then
                                callhsNote = "WARNING CUSTOMER TYPE CHANGED TO TRANSFER ACCOUNT"
                                InsertCallHSFromCust(callhsNote, Customer, UserName)

                                If ARLimits_Emails.Trim() <> "" Then
                                    EmailContent = Environment.NewLine + callhsNote + Environment.NewLine + "CUSTOMER: " + Reader("Name").ToString().ToUpper() + Environment.NewLine + "      " + Reader("City").ToString().ToUpper() + "," + Reader("State").ToString().ToUpper() + Environment.NewLine + UserName.ToUpper() + Environment.NewLine + "USER :: " + Salesman + "  " + SalesmanName.ToUpper() + Environment.NewLine + "COMPUTER NAME: " + Environment.MachineName.ToUpper() + Environment.NewLine + "COMPUTER USER NAME: " + Environment.UserName.ToUpper()
                                    EmailSubject = Trim(Reader("Name")) + " " + callhsNote
                                    Logs.SendEmail(UserEmail, ARLimits_Emails, EmailContent, "", EmailSubject)
                                End If

                            End If

                            If (Reader("Terms") <> Termscode) Then
                                callhsNote = "TERMS CHANGED FROM " + If(Reader("TermsDesc").ToString.Length > 15, Reader("TermsDesc").ToString().Substring(0, 15).ToUpper(), Reader("TermsDesc").ToString().ToUpper()) + " TO " + If(TermsDesc.Length > 15, TermsDesc.Substring(0, 15).ToUpper(), TermsDesc.ToUpper()) + ""
                                InsertCallHSFromCust(callhsNote, Customer, UserName)

                                If ARLimits_Emails.Trim() <> "" Then
                                    EmailContent = Environment.NewLine + callhsNote + Environment.NewLine + "CUSTOMER: " + Reader("Name").ToString().ToUpper() + Environment.NewLine + "      " + Reader("City").ToString().ToUpper() + "," + Reader("State").ToString().ToUpper() + Environment.NewLine + UserName.ToUpper() + Environment.NewLine + "USER :: " + Salesman + "  " + SalesmanName.ToUpper() + Environment.NewLine + "COMPUTER NAME: " + Environment.MachineName.ToUpper() + Environment.NewLine + "COMPUTER USER NAME: " + Environment.UserName.ToUpper()
                                    EmailSubject = Trim(Reader("Name")) + " " + callhsNote
                                    Logs.SendEmail(UserEmail, ARLimits_Emails, EmailContent, "", EmailSubject)
                                End If

                            End If

                            If (Reader("Type").ToString().Substring(0, 1) <> Type.Substring(0, 1) And Reader("Type").ToString().Substring(0, 1) = "T") Then
                                callhsNote = "WARNING.. TRANSFER ACCOUNT CHANGED TO " + Type.ToUpper()
                                InsertCallHSFromCust(callhsNote, Customer, UserName)

                                If ARLimits_Emails.Trim() <> "" Then
                                    EmailContent = Environment.NewLine + callhsNote + Environment.NewLine + "CUSTOMER: " + Reader("Name").ToString().ToUpper() + Environment.NewLine + "      " + Reader("City").ToString().ToUpper() + "," + Reader("State").ToString().ToUpper() + Environment.NewLine + UserName.ToUpper() + Environment.NewLine + "USER :: " + Salesman + "  " + SalesmanName.ToUpper() + Environment.NewLine + "COMPUTER NAME: " + Environment.MachineName.ToUpper() + Environment.NewLine + "COMPUTER USER NAME: " + Environment.UserName.ToUpper()
                                    EmailSubject = Trim(Reader("Name")) + " " + callhsNote
                                    Logs.SendEmail(UserEmail, ARLimits_Emails, EmailContent, "", EmailSubject)
                                End If

                            End If

                            If (Reader("Salesman") IsNot DBNull.Value) Then
                                If (Reader("Salesman") <> Salesman) Then
                                    Dim slsName As String = ""
                                    slsName = SalesPerson.GetSalesmanNameBySalesman(Reader("Salesman").ToString())
                                    callhsNote = "SALES PERSON CHANGED FROM " + slsName + " to " + SalesmanName
                                    InsertCallHSFromCust(callhsNote, Customer, UserName)

                                    If ARLimits_Emails.Trim() <> "" Then
                                        EmailContent = Environment.NewLine + callhsNote + Environment.NewLine + "CUSTOMER: " + Reader("Name").ToString().ToUpper() + Environment.NewLine + "      " + Reader("City").ToString().ToUpper() + "," + Reader("State").ToString().ToUpper() + Environment.NewLine + UserName.ToUpper() + Environment.NewLine + "USER :: " + Salesman + "  " + SalesmanName.ToUpper() + Environment.NewLine + "COMPUTER NAME: " + Environment.MachineName.ToUpper() + Environment.NewLine + "COMPUTER USER NAME: " + Environment.UserName.ToUpper()
                                        EmailSubject = Trim(Reader("Name")) + " " + callhsNote
                                        Logs.SendEmail(UserEmail, ARLimits_Emails, EmailContent, "", EmailSubject)
                                    End If

                                End If
                            End If

                            If (Reader("Oksell") IsNot DBNull.Value) Then
                                If (OkToSell = "Y" And Reader("Oksell") <> OkToSell) Then
                                    callhsNote = "WARNING OK TO SELL == YES..NO PROTECTION AVAILABLE"
                                    InsertCallHSFromCust(callhsNote, Customer, UserName)

                                    If ARLimits_Emails.Trim() <> "" Then
                                        EmailContent = Environment.NewLine + callhsNote + Environment.NewLine + "CUSTOMER: " + Reader("Name").ToString().ToUpper() + Environment.NewLine + "      " + Reader("City").ToString().ToUpper() + "," + Reader("State").ToString().ToUpper() + Environment.NewLine + UserName.ToUpper() + Environment.NewLine + "USER :: " + Salesman + "  " + SalesmanName.ToUpper() + Environment.NewLine + "COMPUTER NAME: " + Environment.MachineName.ToUpper() + Environment.NewLine + "COMPUTER USER NAME: " + Environment.UserName.ToUpper()
                                        EmailSubject = Trim(Reader("Name")) + " " + callhsNote
                                        Logs.SendEmail(UserEmail, ARLimits_Emails, EmailContent, "", EmailSubject)
                                    End If

                                End If
                            End If

                            If (Reader("ReasonHold") IsNot DBNull.Value) Then
                                If (Reader("ReasonHold") <> ReasonHold) Then
                                    callhsNote = "REASON HOLD CHANGED FROM " + Reader("ReasonHold").ToString() + " to " + ReasonHold
                                    InsertCallHSFromCust(callhsNote, Customer, UserName)
                                End If
                            End If

                            If (Reader("Markup") IsNot DBNull.Value) Then
                                If (Reader("Markup") <> Markup) Then
                                    callhsNote = "MARKUP CHANGED FROM " + Reader("Markup").ToString() + " to " + Markup.ToString()
                                    InsertCallHSFromCust(callhsNote, Customer, UserName)
                                End If
                            End If

                            If (Reader("LineFuel") IsNot DBNull.Value) Then
                                If (Reader("LineFuel") <> LineFuel) Then
                                    callhsNote = "LINE FUEL CHANGED FROM " + If(Reader("LineFuel").ToString() = "True", "YES", "NO") + " to " + If(LineFuel = "True", "YES", "NO")
                                    InsertCallHSFromCust(callhsNote, Customer, UserName)
                                End If
                            End If

                            If (Reader("Prepaid") IsNot DBNull.Value) Then
                                If (Reader("Prepaid") <> Prepaid) Then
                                    callhsNote = "PREPAID CHANGED FROM " + If(Reader("Prepaid").ToString() = "True", "YES", "NO") + " to " + If(Prepaid = "True", "YES", "NO")
                                    InsertCallHSFromCust(callhsNote, Customer, UserName)
                                End If
                            End If

                            If (Reader("Statement") IsNot DBNull.Value) Then
                                If (Reader("Statement") <> Statement) Then
                                    callhsNote = "STATEMENT CHANGED FROM " + If(Reader("Statement").ToString() = "True", "YES", "NO") + " to " + If(Statement = "True", "YES", "NO")
                                    InsertCallHSFromCust(callhsNote, Customer, UserName)
                                End If
                            End If

                            If (Reader("Armellini2") IsNot DBNull.Value) Then
                                If (Reader("Armellini2") <> Armellini2) Then
                                    callhsNote = "SHIPPER# CHANGED FROM " + Reader("Armellini2").ToString() + " to " + Armellini2
                                    InsertCallHSFromCust(callhsNote, Customer, UserName)
                                End If
                            End If
                        End While
                    End If

                    Reader.Close()
                    custCmd.Dispose()
                End Using


                Using cmd As New SqlCommand("update F_CUST set Name=@Name,Type=@Type,Markup=@Markup,Address1=@Address1, Address2 =@Address2,City=@City,Country=@Country,State=@State,Zip =@Zip,Airport=@Airport,Territory=@Territory, Purchaser=@Purchaser,Phone=@Phone,Contact=@Contact,Apphone=@Apphone,Title =@Title,Fax=@Fax,Email=@Email,Salesman=@Salesman,Terms=@Termscode,Prepaid=@Prepaid,LineFuel=@LineFuel,BillTo=@BillTo,Parent=@Parent,ARLimit =@ARLimit,Interest =@Interest, SalesID=@SalesID,CreditApp=@CreditApp,CreditDate=@CreditDate,CreditHold=@CreditHold,NACM=@NACM,NACMNUM=@NACMNUM,ReasonHold=@ReasonHold,FaxOrEmail=@FaxOrEmail,Statement=@Statement,Collection =@Collection,PickRemark=@ShipInstr,Calls=@Calls,Dells=@Dells,CALLTIME=@CallTime,Carrier=@Carrier,AndeanTax=@AndeanTax,Armellini2=@Armellini2,OkSell=@OktoSell,ChargeFuel=@ChargeFuel,Ext1=@BuyerExt,Ext2=@ContactExt,Ext3=@ContactTitleExt,WAREHOUSE=@WAREHOUSE,Division=@Division,Vendor=@Vendor where CUSTOMER=@Customer", con)
                    cmd.CommandType = CommandType.Text

                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    cmd.Parameters.AddWithValue("@Name", Name.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Type", Type)
                    cmd.Parameters.AddWithValue("@Markup", Markup)
                    cmd.Parameters.AddWithValue("@Address1", Address1.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Address2", Address2.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@City", City.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Country", Country)
                    cmd.Parameters.AddWithValue("@State", State)
                    cmd.Parameters.AddWithValue("@Zip", Zip)
                    cmd.Parameters.AddWithValue("@Airport", Airport.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Territory", Territory)
                    cmd.Parameters.AddWithValue("@WAREHOUSE", Warehouse)
                    cmd.Parameters.AddWithValue("@Division", Division)
                    cmd.Parameters.AddWithValue("@Purchaser", Purchaser.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Phone", Phone)
                    cmd.Parameters.AddWithValue("@Contact", Contact.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Apphone", Apphone)
                    cmd.Parameters.AddWithValue("@Title", Title.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@Email", Email)
                    cmd.Parameters.AddWithValue("@Fax", Fax)
                    cmd.Parameters.AddWithValue("@Salesman", Salesman)
                    cmd.Parameters.AddWithValue("@Termscode", Termscode)
                    cmd.Parameters.AddWithValue("@Prepaid", Prepaid)
                    cmd.Parameters.AddWithValue("@LineFuel", LineFuel)
                    cmd.Parameters.AddWithValue("@BillTo", Billto)
                    cmd.Parameters.AddWithValue("@Parent", Parent)

                    cmd.Parameters.AddWithValue("@ARLimit", ARLimit)
                    cmd.Parameters.AddWithValue("@Interest", Interest)
                    cmd.Parameters.AddWithValue("@SalesID", SalesID)
                    cmd.Parameters.AddWithValue("@CreditApp", CreditApp)
                    cmd.Parameters.AddWithValue("@CreditDate", CreditDate)
                    cmd.Parameters.AddWithValue("@CreditHold", CreditHold)
                    cmd.Parameters.AddWithValue("@NACM", NACM)
                    cmd.Parameters.AddWithValue("@NACMNUM", NACMNUM)
                    cmd.Parameters.AddWithValue("@ReasonHold", ReasonHold.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@FaxOrEmail", FaxOrEmail)
                    cmd.Parameters.AddWithValue("@Statement", Statement)

                    cmd.Parameters.AddWithValue("@Collection", Collection)
                    cmd.Parameters.AddWithValue("@ShipInstr", ShipInstr.Replace("~", "'"))
                    cmd.Parameters.AddWithValue("@CallTime", CallTime)
                    cmd.Parameters.AddWithValue("@Carrier", Carrier)
                    cmd.Parameters.AddWithValue("@AndeanTax", AndeanTax)
                    cmd.Parameters.AddWithValue("@Armellini2", Armellini2)

                    cmd.Parameters.AddWithValue("@Calls", Calls)
                    cmd.Parameters.AddWithValue("@Dells", DELLS)
                    cmd.Parameters.AddWithValue("@OktoSell", OkToSell)

                    cmd.Parameters.AddWithValue("@ChargeFuel", ChargeFuel)
                    cmd.Parameters.AddWithValue("@BuyerExt", BuyerExt)
                    cmd.Parameters.AddWithValue("@ContactExt", ContactExt)
                    cmd.Parameters.AddWithValue("@ContactTitleExt", ContactTitleExt)
                    cmd.Parameters.AddWithValue("@Vendor", Vendor)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCustomerDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function InsertCallHSFromCust(callhsNote As String, Customer As String, UserName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim callhsQuery As String = ""
                callhsQuery = "INSERT INTO F_CALLHS(CUSTOMER,DATE,TIME,PERSON,NOTE,PURCHASE) VALUES(@Customer,@Date,@Time,@Person,'" + callhsNote + "','')"
                Using callhsInsertCmd As New SqlCommand(callhsQuery, con)
                    callhsInsertCmd.CommandType = CommandType.Text
                    callhsInsertCmd.Parameters.AddWithValue("@Customer", Customer)
                    callhsInsertCmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("MM/dd/yyyy"))
                    callhsInsertCmd.Parameters.AddWithValue("@Time", DateTime.Now.ToString("HH:mm:ss"))
                    callhsInsertCmd.Parameters.AddWithValue("@Person", If(UserName.Length > 10, UserName.Substring(0, 10), UserName))
                    callhsInsertCmd.ExecuteNonQuery()
                    callhsInsertCmd.Dispose()
                End Using

            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in InsertCallHSFromCust")
            Throw ex
        End Try
        Return Nothing
    End Function


    Public Shared Function SendEmailFromCustomerUpdate(Type As String, UserEmail As String, EmailContent As String, EmailSubject As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()

                Using EmailCmd As New SqlCommand("select top 1 * from f_emails where type=@Type", con)
                    EmailCmd.Parameters.AddWithValue("@Type", Type)
                    EmailCmd.CommandType = CommandType.Text
                    Dim EmailReader As SqlDataReader = EmailCmd.ExecuteReader()
                    If EmailReader.HasRows Then
                        EmailReader.Read()
                        If EmailReader("Emails").ToString().Trim() <> "" Then
                            Logs.SendEmail(UserEmail, EmailReader("Emails"), EmailContent, "", EmailSubject)
                        End If

                    End If
                    EmailReader.Close()
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SendEmailFromCustomerUpdate")
            Throw ex
        End Try
        Return Nothing
    End Function

    Public Shared Function GetNextCustomerNoFromConst() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Dim CustomerNo As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using getCustNoCmd As New SqlCommand("SELECT CUSTOMER FROM CONSTANT", con)
                    getCustNoCmd.CommandType = CommandType.Text
                    CustomerNo = getCustNoCmd.ExecuteScalar()
                End Using

                Dim nextCustomerNo As Integer = CustomerNo + 1
                Using updCustNoCmd As New SqlCommand("UPDATE CONSTANT SET CUSTOMER=" + nextCustomerNo.ToString() + "", con)
                    updCustNoCmd.CommandType = CommandType.Text
                    updCustNoCmd.ExecuteNonQuery()
                End Using
                con.Close()
            End Using
            Return CustomerNo.ToString()

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetNextCustomerNoFromConst")
            Throw ex
        End Try
    End Function

    Public Shared Function CheckIsCustomerAlreadyExist(ByVal Customer As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using Cmd As New SqlCommand("SELECT COUNT(CUSTOMER) FROM F_CUST WHERE CUSTOMER=@CUSTOMER", con)
                    Cmd.CommandType = CommandType.Text
                    Cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    Dim count As Integer = Cmd.ExecuteScalar()
                    If count > 0 Then
                        result = "Already Exist"
                    Else
                        result = "Not Exist"
                    End If

                End Using
                con.Close()
            End Using
            Return result

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckIsCustomerAlreadyExist")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' MANI::09/11/2018::Update Current Orders Amount 
    ''' </summary>
    ''' <param name="CUSTOMER"></param>
    ''' <returns></returns>
    Public Shared Function UpdateCustomerOrders(ByVal Customer As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("sp_UpdateCustomerOrders", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@Customer", Customer.ToString())
                    cmd1.ExecuteNonQuery()
                End Using

                Using cmd1 As New SqlCommand("select [ORDERS] from F_CUST where Customer=@Customer", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@Customer", Customer.ToString())
                    Dim da As New SqlDataAdapter(cmd1)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return Convert.ToString(dt(0)(0))
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCustomerOrders")
            Return Nothing
        End Try
        Return ""
    End Function


    Public Class GetCustomerDetailsForFgrd

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetCustomerDetailsFromSQL(ByVal filter As String) As List(Of CustomerDetail)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of CustomerDetail)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select * from vwCust " + filter + " order by NAME asc", con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        Dim ts As TimeSpan

                        For Each row In ds.Tables(0).Rows
                            Dim u As New CustomerDetail()
                            u.Customer = row("Customer")
                            u.Name = row("Name")
                            u.ADDRESS1 = IIf(row("ADDRESS1") Is DBNull.Value, "", row("ADDRESS1"))
                            u.CITY = IIf(row("CITY") Is DBNull.Value, "", row("CITY"))
                            u.STATE = IIf(row("STATE") Is DBNull.Value, "", row("STATE"))
                            u.ZIP = IIf(row("ZIP") Is DBNull.Value, "", row("ZIP"))
                            u.PHONE = IIf(row("PhoneNum") Is DBNull.Value, "", row("PhoneNum"))
                            u.ARBALANCE = IIf(row("ARBALANCE") Is DBNull.Value, 0.00, row("ARBALANCE"))
                            u.CREDITLIMIT = IIf(row("CREDITLIMIT") Is DBNull.Value, 0.00, row("CREDITLIMIT"))
                            u.Available = IIf(row("Available") Is DBNull.Value, 0.00, row("Available"))
                            If (row("LastCalled") Is DBNull.Value) Then
                                u.LastCall = ""
                            Else
                                u.LastCall = Convert.ToDateTime(row("LastCalled"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                            End If

                            If (row("LastSale") Is DBNull.Value) Then
                                u.LastSale = ""
                            Else
                                u.LastSale = Convert.ToDateTime(row("LastSale"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                            End If

                            u.Credithold = IIf(row("Credithold") Is DBNull.Value, "", row("Credithold"))
                            u.SalesMan = IIf(row("SalesMan") Is DBNull.Value, 0, row("SalesMan"))
                            u.Purchaser = IIf(row("Purchaser") Is DBNull.Value, "", row("Purchaser"))
                            u.SalesmanName = IIf(row("SalesmanName") Is DBNull.Value, "", row("SalesmanName"))
                            u.COUNTRY = IIf(row("COUNTRY") Is DBNull.Value, "", row("COUNTRY"))
                            u.ReasonHold = IIf(row("ReasonHold") Is DBNull.Value, "", row("ReasonHold"))
                            If (u.LastSale = "") Then
                                u.Days = ""
                            Else
                                ts = Now.Subtract(Date.Parse(u.LastSale, New System.Globalization.CultureInfo("en-US", True)))
                                u.Days = ts.Days
                            End If

                            uList.Add(u)

                        Next
                        Me.TotalRows = ds.Tables(0).Rows.Count
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCustomerDetailsFromSQL")
                Throw ex
            End Try
        End Function

        Public Function GetCustomerDetailsWithBalance(ByVal filter As String) As List(Of CustomerDetail)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of CustomerDetail)()
                Dim TotalARBALANCE As Decimal = 0.00
                Dim TotalBAL0030 As Decimal = 0.00
                Dim TotalBAL3060 As Decimal = 0.00
                Dim TotalBAL6090 As Decimal = 0.00
                Dim TotalBAL90 As Decimal = 0.00
                Dim TotalBal120 As Decimal = 0.00
                Dim TotalCreditLimit As Decimal = 0.00
                Dim TotalAvailable As Decimal = 0.00
                Dim TotalOrders As Decimal = 0.00
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select * from vwCust " + filter + " order by NAME asc", con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        Dim ts As TimeSpan

                        For Each row In ds.Tables(0).Rows
                            Dim u As New CustomerDetail()
                            u.Customer = row("Customer")
                            u.Name = row("Name")
                            u.ADDRESS1 = IIf(row("ADDRESS1") Is DBNull.Value, "", row("ADDRESS1"))
                            u.CITY = IIf(row("CITY") Is DBNull.Value, "", row("CITY"))
                            u.STATE = IIf(row("STATE") Is DBNull.Value, "", row("STATE"))
                            u.ZIP = IIf(row("ZIP") Is DBNull.Value, "", row("ZIP"))
                            u.PHONE = IIf(row("PhoneNum") Is DBNull.Value, "", row("PhoneNum"))
                            u.APPHONE = IIf(row("APPHONE1") Is DBNull.Value, "", row("APPHONE1"))
                            u.APCONTACT = IIf(row("APCONTACT") Is DBNull.Value, "", row("APCONTACT"))
                            u.ARBALANCE = IIf(row("ARBALANCE") Is DBNull.Value, 0.00, row("ARBALANCE"))
                            TotalARBALANCE += u.ARBALANCE
                            u.CREDITLIMIT = IIf(row("CREDITLIMIT") Is DBNull.Value, 0.00, row("CREDITLIMIT"))
                            TotalCreditLimit += u.CREDITLIMIT
                            u.Available = IIf(row("Available") Is DBNull.Value, 0.00, row("Available"))
                            TotalAvailable += u.Available

                            u.LastCall = Convert.ToDateTime(row("LastCalled"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                            If (row("LastSale") Is DBNull.Value) Then
                                u.LastSale = ""
                            Else
                                u.LastSale = Convert.ToDateTime(row("LastSale"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                            End If

                            If (row("LastPay") Is DBNull.Value) Then
                                u.LastPayment = ""
                            Else
                                u.LastPayment = Convert.ToDateTime(row("LastPay"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy")
                            End If

                            u.Credithold = IIf(row("Credithold") Is DBNull.Value, "", row("Credithold"))
                            u.SalesMan = IIf(row("SalesMan") Is DBNull.Value, 0, row("SalesMan"))
                            u.Purchaser = IIf(row("Purchaser") Is DBNull.Value, "", row("Purchaser"))
                            u.SalesmanName = IIf(row("SalesmanName") Is DBNull.Value, "", row("SalesmanName"))
                            u.COUNTRY = IIf(row("COUNTRY") Is DBNull.Value, "", row("COUNTRY"))
                            u.BAL0030 = IIf(row("BAL0030") Is DBNull.Value, 0.00, row("BAL0030"))
                            u.BAL3060 = IIf(row("BAL3060") Is DBNull.Value, 0.00, row("BAL3060"))
                            u.BAL6090 = IIf(row("BAL6090") Is DBNull.Value, 0.00, row("BAL6090"))
                            u.BAL90 = IIf(row("BAL90") Is DBNull.Value, 0.00, row("BAL90"))
                            u.BAL120 = IIf(row("BAL120") Is DBNull.Value, 0.00, row("BAL120"))
                            u.ORDERS = IIf(row("ORDERS") Is DBNull.Value, 0.00, row("ORDERS"))
                            TotalBAL0030 += u.BAL0030
                            TotalBAL3060 += u.BAL3060
                            TotalBAL6090 += u.BAL6090
                            TotalBAL90 += u.BAL90
                            TotalBAL120 += u.BAL120
                            TotalOrders += u.ORDERS
                            ts = Now.Subtract(Date.Parse(u.LastSale, New System.Globalization.CultureInfo("en-US", True)))
                            u.Days = ts.Days
                            u.CustSince = If(row("CustSince") Is DBNull.Value, "", Convert.ToDateTime(row("CustSince"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                            u.TERMSDESC = IIf(row("TERMSDESC") Is DBNull.Value, "", row("TERMSDESC"))
                            u.ReasonHold = IIf(row("ReasonHold") Is DBNull.Value, "", row("ReasonHold"))
                            u.Statement = IIf(row("Statement") Is DBNull.Value, "0", row("Statement"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(0).Rows.Count
                    End Using
                End Using
                Dim t As New CustomerDetail()
                t.Customer = 0
                t.Name = ""
                t.ADDRESS1 = ""
                t.CITY = ""
                t.STATE = ""
                t.ZIP = ""
                t.PHONE = ""
                t.APPHONE = ""
                t.APCONTACT = ""
                t.ARBALANCE = TotalARBALANCE
                t.CREDITLIMIT = TotalCreditLimit
                t.Available = TotalAvailable
                t.LastCall = ""
                t.LastSale = ""
                t.LastPayment = ""
                t.Credithold = ""
                t.SalesMan = ""
                t.Purchaser = ""
                t.SalesmanName = ""
                t.COUNTRY = ""
                t.BAL0030 = TotalBAL0030
                t.BAL3060 = TotalBAL3060
                t.BAL6090 = TotalBAL6090
                t.BAL90 = TotalBAL90
                t.BAL120 = TotalBal120
                t.Days = ""
                t.CustSince = ""
                t.TERMSDESC = ""
                t.ReasonHold = ""
                t.ORDERS = TotalOrders
                uList.Add(t)

                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCustomerDetailsFromSQL")
                Throw ex
            End Try
        End Function

    End Class

End Class
Public Class CustomerDetail
    Private _Customer As Integer
    Public Property Customer() As Integer
        Get
            Return _Customer
        End Get
        Set(ByVal value As Integer)
            _Customer = value
        End Set
    End Property

    Private _Name As String
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(ByVal value As String)
            _Name = value
        End Set
    End Property

    Private _Type As String
    Public Property Type() As String
        Get
            Return _Type
        End Get
        Set(ByVal value As String)
            _Type = value
        End Set
    End Property

    Private _Markup As Decimal
    Public Property Markup() As Decimal
        Get
            Return _Markup
        End Get
        Set(ByVal value As Decimal)
            _Markup = value
        End Set
    End Property

    Private _ADDRESS1 As String
    Public Property ADDRESS1() As String
        Get
            Return _ADDRESS1
        End Get
        Set(ByVal value As String)
            _ADDRESS1 = value
        End Set
    End Property

    Private _Packing As Decimal
    Public Property Packing() As Decimal
        Get
            Return _Packing
        End Get
        Set(ByVal value As Decimal)
            _Packing = value
        End Set
    End Property

    Private _PackingHB As Decimal
    Public Property PackingHB() As Decimal
        Get
            Return _PackingHB
        End Get
        Set(ByVal value As Decimal)
            _PackingHB = value
        End Set
    End Property

    Private _ADDRESS2 As String
    Public Property ADDRESS2() As String
        Get
            Return _ADDRESS2
        End Get
        Set(ByVal value As String)
            _ADDRESS2 = value
        End Set
    End Property

    Private _PackingQB As Decimal
    Public Property PackingQB() As Decimal
        Get
            Return _PackingQB
        End Get
        Set(ByVal value As Decimal)
            _PackingQB = value
        End Set
    End Property


    Private _PackingTR As Decimal
    Public Property PackingTR() As Decimal
        Get
            Return _PackingTR
        End Get
        Set(ByVal value As Decimal)
            _PackingTR = value
        End Set
    End Property


    Private _CITY As String
    Public Property CITY() As String
        Get
            Return _CITY
        End Get
        Set(ByVal value As String)
            _CITY = value
        End Set
    End Property

    Private _STATE As String
    Public Property STATE() As String
        Get
            Return _STATE
        End Get
        Set(ByVal value As String)
            _STATE = value
        End Set
    End Property

    Private _COUNTRY As String
    Public Property COUNTRY() As String
        Get
            Return _COUNTRY
        End Get
        Set(ByVal value As String)
            _COUNTRY = value
        End Set
    End Property

    Private _ZIP As String
    Public Property ZIP() As String
        Get
            Return _ZIP
        End Get
        Set(ByVal value As String)
            _ZIP = value
        End Set
    End Property

    Private _Airport As String
    Public Property Airport() As String
        Get
            Return _Airport
        End Get
        Set(ByVal value As String)
            _Airport = value
        End Set
    End Property

    Private _Territory As String
    Public Property Territory() As String
        Get
            Return _Territory
        End Get
        Set(ByVal value As String)
            _Territory = value
        End Set
    End Property

    Private _Warehouse As String
    Public Property Warehouse() As String
        Get
            Return _Warehouse
        End Get
        Set(ByVal value As String)
            _Warehouse = value
        End Set
    End Property

    Private _Division As String
    Public Property Division() As String
        Get
            Return _Division
        End Get
        Set(ByVal value As String)
            _Division = value
        End Set
    End Property

    Private _PHONE As String
    Public Property PHONE() As String
        Get
            Return _PHONE
        End Get
        Set(ByVal value As String)
            _PHONE = value
        End Set
    End Property

    Private _CONTACT As String
    Public Property CONTACT() As String
        Get
            Return _CONTACT
        End Get
        Set(ByVal value As String)
            _CONTACT = value
        End Set
    End Property

    Private _APPHONE As String
    Public Property APPHONE() As String
        Get
            Return _APPHONE
        End Get
        Set(ByVal value As String)
            _APPHONE = value
        End Set
    End Property

    Private _Title As String
    Public Property Title() As String
        Get
            Return _Title
        End Get
        Set(ByVal value As String)
            _Title = value
        End Set
    End Property

    Private _APCONTACT As String
    Public Property APCONTACT() As String
        Get
            Return _APCONTACT
        End Get
        Set(ByVal value As String)
            _APCONTACT = value
        End Set
    End Property

    Private _Email As String
    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(ByVal value As String)
            _Email = value
        End Set
    End Property

    Private _Fax As String
    Public Property Fax() As String
        Get
            Return _Fax
        End Get
        Set(ByVal value As String)
            _Fax = value
        End Set
    End Property

    Private _UNAPPLIED As Decimal
    Public Property UNAPPLIED() As Decimal
        Get
            Return _UNAPPLIED
        End Get
        Set(ByVal value As Decimal)
            _UNAPPLIED = value
        End Set
    End Property

    Private _BALANCE As Decimal
    Public Property BALANCE() As Decimal
        Get
            Return _BALANCE
        End Get
        Set(ByVal value As Decimal)
            _BALANCE = value
        End Set
    End Property

    Private _ARBALANCE As Decimal
    Public Property ARBALANCE() As Decimal
        Get
            Return _ARBALANCE
        End Get
        Set(ByVal value As Decimal)
            _ARBALANCE = value
        End Set
    End Property

    Private _CREDITLIMIT As Decimal
    Public Property CREDITLIMIT() As Decimal
        Get
            Return _CREDITLIMIT
        End Get
        Set(ByVal value As Decimal)
            _CREDITLIMIT = value
        End Set
    End Property

    Private _Available As Decimal
    Public Property Available() As Decimal
        Get
            Return _Available
        End Get
        Set(ByVal value As Decimal)
            _Available = value
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

    Private _TERMSDESC As String
    Public Property TERMSDESC() As String
        Get
            Return _TERMSDESC
        End Get
        Set(ByVal value As String)
            _TERMSDESC = value
        End Set
    End Property

    Private _Prepaid As Boolean
    Public Property Prepaid() As Boolean
        Get
            Return _Prepaid
        End Get
        Set(ByVal value As Boolean)
            _Prepaid = value
        End Set
    End Property

    Private _LineFuel As Boolean
    Public Property LineFuel() As Boolean
        Get
            Return _LineFuel
        End Get
        Set(ByVal value As Boolean)
            _LineFuel = value
        End Set
    End Property

    Private _Billto As Integer
    Public Property Billto() As Integer
        Get
            Return _Billto
        End Get
        Set(ByVal value As Integer)
            _Billto = value
        End Set
    End Property

    Private _Parent As Integer
    Public Property Parent() As Integer
        Get
            Return _Parent
        End Get
        Set(ByVal value As Integer)
            _Parent = value
        End Set
    End Property

    Private _ARLimit As Decimal
    Public Property ARLimit() As Decimal
        Get
            Return _ARLimit
        End Get
        Set(ByVal value As Decimal)
            _ARLimit = value
        End Set
    End Property

    Private _Interest As Decimal
    Public Property Interest() As Decimal
        Get
            Return _Interest
        End Get
        Set(ByVal value As Decimal)
            _Interest = value
        End Set
    End Property

    Private _SalesID As String
    Public Property SalesID() As String
        Get
            Return _SalesID
        End Get
        Set(ByVal value As String)
            _SalesID = value
        End Set
    End Property

    Private _CreditApp As String
    Public Property CreditApp() As String
        Get
            Return _CreditApp
        End Get
        Set(ByVal value As String)
            _CreditApp = value
        End Set
    End Property

    Private _CreditDate As String
    Public Property CreditDate() As String
        Get
            Return _CreditDate
        End Get
        Set(ByVal value As String)
            _CreditDate = value
        End Set
    End Property

    Private _Credithold As String
    Public Property Credithold() As String
        Get
            Return _Credithold
        End Get
        Set(ByVal value As String)
            _Credithold = value
        End Set
    End Property

    Private _NACM As String
    Public Property NACM() As String
        Get
            Return _NACM
        End Get
        Set(ByVal value As String)
            _NACM = value
        End Set
    End Property

    Private _NACMNUM As String
    Public Property NACMNUM() As String
        Get
            Return _NACMNUM
        End Get
        Set(ByVal value As String)
            _NACMNUM = value
        End Set
    End Property

    Private _Collection As Boolean
    Public Property Collection() As Boolean
        Get
            Return _Collection
        End Get
        Set(ByVal value As Boolean)
            _Collection = value
        End Set
    End Property

    Private _LastSale As String
    Public Property LastSale() As String
        Get
            Return _LastSale
        End Get
        Set(ByVal value As String)
            _LastSale = value
        End Set
    End Property

    Private _LastPayment As String
    Public Property LastPayment() As String
        Get
            Return _LastPayment
        End Get
        Set(ByVal value As String)
            _LastPayment = value
        End Set
    End Property

    Private _Days As String
    Public Property Days() As String
        Get
            Return _Days
        End Get
        Set(ByVal value As String)
            _Days = value
        End Set
    End Property

    Private _LastCall As String
    Public Property LastCall() As String
        Get
            Return _LastCall
        End Get
        Set(ByVal value As String)
            _LastCall = value
        End Set
    End Property

    Private _SalesMan As String
    Public Property SalesMan() As String
        Get
            Return _SalesMan
        End Get
        Set(ByVal value As String)
            _SalesMan = value
        End Set
    End Property

    Private _Purchaser As String
    Public Property Purchaser() As String
        Get
            Return _Purchaser
        End Get
        Set(ByVal value As String)
            _Purchaser = value
        End Set
    End Property

    Private _SalesmanName As String
    Public Property SalesmanName() As String
        Get
            Return _SalesmanName
        End Get
        Set(ByVal value As String)
            _SalesmanName = value
        End Set
    End Property

    Private _MARKUPVALUE As String
    Public Property MARKUPVALUE() As String
        Get
            Return _MARKUPVALUE
        End Get
        Set(ByVal value As String)
            _MARKUPVALUE = value
        End Set
    End Property

    Private _BAL0030 As Decimal
    Public Property BAL0030() As Decimal
        Get
            Return _BAL0030
        End Get
        Set(ByVal value As Decimal)
            _BAL0030 = value
        End Set
    End Property

    Private _BAL3060 As Decimal
    Public Property BAL3060() As Decimal
        Get
            Return _BAL3060
        End Get
        Set(ByVal value As Decimal)
            _BAL3060 = value
        End Set
    End Property

    Private _BAL6090 As Decimal
    Public Property BAL6090() As Decimal
        Get
            Return _BAL6090
        End Get
        Set(ByVal value As Decimal)
            _BAL6090 = value
        End Set
    End Property

    Private _BAL90 As Decimal
    Public Property BAL90() As Decimal
        Get
            Return _BAL90
        End Get
        Set(ByVal value As Decimal)
            _BAL90 = value
        End Set
    End Property

    Private _BAL120 As Decimal
    Public Property BAL120() As Decimal
        Get
            Return _BAL120
        End Get
        Set(ByVal value As Decimal)
            _BAL120 = value
        End Set
    End Property

    Private _ORDERS As Decimal
    Public Property ORDERS() As Decimal
        Get
            Return _ORDERS
        End Get
        Set(ByVal value As Decimal)
            _ORDERS = value
        End Set
    End Property

    Private _LastPayAmt As Decimal
    Public Property LastPayAmt() As Decimal
        Get
            Return _LastPayAmt
        End Get
        Set(ByVal value As Decimal)
            _LastPayAmt = value
        End Set
    End Property

    Private _OpenOrder As Decimal
    Public Property OpenOrder() As Decimal
        Get
            Return _OpenOrder
        End Get
        Set(ByVal value As Decimal)
            _OpenOrder = value
        End Set
    End Property

    Private _CustSince As String
    Public Property CustSince() As String
        Get
            Return _CustSince
        End Get
        Set(ByVal value As String)
            _CustSince = value
        End Set
    End Property

    Private _CallTime As String
    Public Property CallTime() As String
        Get
            Return _CallTime
        End Get
        Set(ByVal value As String)
            _CallTime = value
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

    Private _DeliveryDays As String
    Public Property DeliveryDays() As String
        Get
            Return _DeliveryDays
        End Get
        Set(ByVal value As String)
            _DeliveryDays = value
        End Set
    End Property


    Private _Airline As String
    Public Property Airline() As String
        Get
            Return _Airline
        End Get
        Set(ByVal value As String)
            _Airline = value
        End Set
    End Property

    Private _CallDays As String
    Public Property CallDays() As String
        Get
            Return _CallDays
        End Get
        Set(ByVal value As String)
            _CallDays = value
        End Set
    End Property

    Private _ShipInstr As String
    Public Property ShipInstr() As String
        Get
            Return _ShipInstr
        End Get
        Set(ByVal value As String)
            _ShipInstr = value
        End Set
    End Property

    Private _Y1Sales As Decimal
    Public Property Y1Sales() As Decimal
        Get
            Return _Y1Sales
        End Get
        Set(ByVal value As Decimal)
            _Y1Sales = value
        End Set
    End Property

    Private _Y2Sales As Decimal
    Public Property Y2Sales() As Decimal
        Get
            Return _Y2Sales
        End Get
        Set(ByVal value As Decimal)
            _Y2Sales = value
        End Set
    End Property

    Private _Y3Sales As Decimal
    Public Property Y3Sales() As Decimal
        Get
            Return _Y3Sales
        End Get
        Set(ByVal value As Decimal)
            _Y3Sales = value
        End Set
    End Property

    Private _Y4Sales As Decimal
    Public Property Y4Sales() As Decimal
        Get
            Return _Y4Sales
        End Get
        Set(ByVal value As Decimal)
            _Y4Sales = value
        End Set
    End Property

    Private _Y5Sales As Decimal
    Public Property Y5Sales() As Decimal
        Get
            Return _Y5Sales
        End Get
        Set(ByVal value As Decimal)
            _Y5Sales = value
        End Set
    End Property

    Private _Y1Payment As Decimal
    Public Property Y1Payment() As Decimal
        Get
            Return _Y1Payment
        End Get
        Set(ByVal value As Decimal)
            _Y1Payment = value
        End Set
    End Property

    Private _Y2Payment As Decimal
    Public Property Y2Payment() As Decimal
        Get
            Return _Y2Payment
        End Get
        Set(ByVal value As Decimal)
            _Y2Payment = value
        End Set
    End Property

    Private _Y3Payment As Decimal
    Public Property Y3Payment() As Decimal
        Get
            Return _Y3Payment
        End Get
        Set(ByVal value As Decimal)
            _Y3Payment = value
        End Set
    End Property

    Private _Y4Payment As Decimal
    Public Property Y4Payment() As Decimal
        Get
            Return _Y4Payment
        End Get
        Set(ByVal value As Decimal)
            _Y4Payment = value
        End Set
    End Property

    Private _Y5Payment As Decimal
    Public Property Y5Payment() As Decimal
        Get
            Return _Y5Payment
        End Get
        Set(ByVal value As Decimal)
            _Y5Payment = value
        End Set
    End Property

    Private _Y1Credits As Decimal
    Public Property Y1Credits() As Decimal
        Get
            Return _Y1Credits
        End Get
        Set(ByVal value As Decimal)
            _Y1Credits = value
        End Set
    End Property

    Private _Y2Credits As Decimal
    Public Property Y2Credits() As Decimal
        Get
            Return _Y2Credits
        End Get
        Set(ByVal value As Decimal)
            _Y2Credits = value
        End Set
    End Property

    Private _Y3Credits As Decimal
    Public Property Y3Credits() As Decimal
        Get
            Return _Y3Credits
        End Get
        Set(ByVal value As Decimal)
            _Y3Credits = value
        End Set
    End Property

    Private _Y4Credits As Decimal
    Public Property Y4Credits() As Decimal
        Get
            Return _Y4Credits
        End Get
        Set(ByVal value As Decimal)
            _Y4Credits = value
        End Set
    End Property

    Private _Y5Credits As Decimal
    Public Property Y5Credits() As Decimal
        Get
            Return _Y5Credits
        End Get
        Set(ByVal value As Decimal)
            _Y5Credits = value
        End Set
    End Property

    Private _slscretyr As String
    Public Property slscretyr() As String
        Get
            Return _slscretyr
        End Get
        Set(ByVal value As String)
            _slscretyr = value
        End Set
    End Property

    Private _slscrelyr As String
    Public Property slscrelyr() As String
        Get
            Return _slscrelyr
        End Get
        Set(ByVal value As String)
            _slscrelyr = value
        End Set
    End Property

    Private _slscrelyr2 As String
    Public Property slscrelyr2() As String
        Get
            Return _slscrelyr2
        End Get
        Set(ByVal value As String)
            _slscrelyr2 = value
        End Set
    End Property

    Private _slscrelyr3 As String
    Public Property slscrelyr3() As String
        Get
            Return _slscrelyr3
        End Get
        Set(ByVal value As String)
            _slscrelyr3 = value
        End Set
    End Property

    Private _slscrelyr4 As String
    Public Property slscrelyr4() As String
        Get
            Return _slscrelyr4
        End Get
        Set(ByVal value As String)
            _slscrelyr4 = value
        End Set
    End Property

    Private _ReasonHold As String
    Public Property ReasonHold() As String
        Get
            Return _ReasonHold
        End Get
        Set(ByVal value As String)
            _ReasonHold = value
        End Set
    End Property

    Private _FuelOrAndeanCaption As String
    Public Property FuelOrAndeanCaption() As String
        Get
            Return _FuelOrAndeanCaption
        End Get
        Set(ByVal value As String)
            _FuelOrAndeanCaption = value
        End Set
    End Property


    Private _Statement As Boolean
    Public Property Statement() As Boolean
        Get
            Return _Statement
        End Get
        Set(ByVal value As Boolean)
            _Statement = value
        End Set
    End Property

    Private _APEmail As String
    Public Property APEmail() As String
        Get
            Return _APEmail
        End Get
        Set(ByVal value As String)
            _APEmail = value
        End Set
    End Property

    Private _FaxOrEmail As String
    Public Property FaxOrEmail() As String
        Get
            Return _FaxOrEmail
        End Get
        Set(ByVal value As String)
            _FaxOrEmail = value
        End Set
    End Property

    Private _APFax As String
    Public Property APFax() As String
        Get
            Return _APFax
        End Get
        Set(ByVal value As String)
            _APFax = value
        End Set
    End Property

    Private _AndeanTax As Boolean
    Public Property AndeanTax() As Boolean
        Get
            Return _AndeanTax
        End Get
        Set(ByVal value As Boolean)
            _AndeanTax = value
        End Set
    End Property

    Private _Armellini2 As String
    Public Property Armellini2() As String
        Get
            Return _Armellini2
        End Get
        Set(ByVal value As String)
            _Armellini2 = value
        End Set
    End Property

    Private _OktoSell As String
    Public Property OktoSell() As String
        Get
            Return _OktoSell
        End Get
        Set(ByVal value As String)
            _OktoSell = value
        End Set
    End Property

    Private _EXPDATE As String
    Public Property EXPDATE() As String
        Get
            Return _EXPDATE
        End Get
        Set(ByVal value As String)
            _EXPDATE = value
        End Set
    End Property

    Private _AMTAPPROV As Decimal
    Public Property AMTAPPROV() As Decimal
        Get
            Return _AMTAPPROV
        End Get
        Set(ByVal value As Decimal)
            _AMTAPPROV = value
        End Set
    End Property

    Private _APPROVED As String
    Public Property APPROVED() As String
        Get
            Return _APPROVED
        End Get
        Set(ByVal value As String)
            _APPROVED = value
        End Set
    End Property

    Private _HOLLYDAYAM As Decimal
    Public Property HOLLYDAYAM() As Decimal
        Get
            Return _HOLLYDAYAM
        End Get
        Set(ByVal value As Decimal)
            _HOLLYDAYAM = value
        End Set
    End Property

    Private _Exclude As Boolean
    Public Property Exclude() As Boolean
        Get
            Return _Exclude
        End Get
        Set(ByVal value As Boolean)
            _Exclude = value
        End Set
    End Property

    Private _ChargeFuel As Boolean
    Public Property ChargeFuel() As Boolean
        Get
            Return _ChargeFuel
        End Get
        Set(ByVal value As Boolean)
            _ChargeFuel = value
        End Set
    End Property

    Private _Ext1 As String
    Public Property Ext1() As String
        Get
            Return _Ext1
        End Get
        Set(ByVal value As String)
            _Ext1 = value
        End Set
    End Property

    Private _Ext2 As String
    Public Property Ext2() As String
        Get
            Return _Ext2
        End Get
        Set(ByVal value As String)
            _Ext2 = value
        End Set
    End Property

    Private _Ext3 As String
    Public Property Ext3() As String
        Get
            Return _Ext3
        End Get
        Set(ByVal value As String)
            _Ext3 = value
        End Set
    End Property

    Private _NextCustomer As Integer
    Public Property NextCustomer() As Integer
        Get
            Return _NextCustomer
        End Get
        Set(ByVal value As Integer)
            _NextCustomer = value
        End Set
    End Property

    Private _PrevCustomer As Integer
    Public Property PrevCustomer() As Integer
        Get
            Return _PrevCustomer
        End Get
        Set(ByVal value As Integer)
            _PrevCustomer = value
        End Set
    End Property

    Private _DivYear1 As String
    Public Property DivYear1() As String
        Get
            Return _DivYear1
        End Get
        Set(ByVal value As String)
            _DivYear1 = value
        End Set
    End Property

    Private _DivYear2 As String
    Public Property DivYear2() As String
        Get
            Return _DivYear2
        End Get
        Set(ByVal value As String)
            _DivYear2 = value
        End Set
    End Property

    Private _DivYear3 As String
    Public Property DivYear3() As String
        Get
            Return _DivYear3
        End Get
        Set(ByVal value As String)
            _DivYear3 = value
        End Set
    End Property

    Private _DivYear4 As String
    Public Property DivYear4() As String
        Get
            Return _DivYear4
        End Get
        Set(ByVal value As String)
            _DivYear4 = value
        End Set
    End Property

    Private _DivYear5 As String
    Public Property DivYear5() As String
        Get
            Return _DivYear5
        End Get
        Set(ByVal value As String)
            _DivYear5 = value
        End Set
    End Property
    Private _Vendor As String
    Public Property Vendor() As String
        Get
            Return _Vendor
        End Get
        Set(ByVal value As String)
            _Vendor = value
        End Set
    End Property

    Friend Shared Function GetCustomerDetailsFromSQL() As List(Of CustomerDetail)
        Throw New NotImplementedException()
    End Function
End Class


Public Class CustomerMaster
    Public CustomerList As List(Of CustomerDetail)
    Public SalesManDDLList As List(Of SalesManDDL)
    Public SalesPersonModelList As List(Of SalesPersonModel)
End Class
Public Class SalesManDDL
    Private _SALESMAN As Integer
    Public Property SALESMAN() As Integer
        Get
            Return _SALESMAN
        End Get
        Set(ByVal value As Integer)
            _SALESMAN = value
        End Set
    End Property

    Private _Name As String
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(value As String)
            _Name = value
        End Set
    End Property
End Class

Public Class SalesPersonModel
    Private _SLNO As Integer
    Public Property SLNO() As Integer
        Get
            Return _SLNO
        End Get
        Set(ByVal value As Integer)
            _SLNO = value
        End Set
    End Property

    Private _Name As String
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(value As String)
            _Name = value
        End Set
    End Property
End Class

Public Interface ICustomParams_CustomerNo
    Property CustomerNo() As String
End Interface