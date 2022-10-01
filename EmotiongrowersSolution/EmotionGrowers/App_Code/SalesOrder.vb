Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization
Imports System.IO
Imports System.Threading.Tasks
Imports Mailjet.Client
Imports Mailjet.Client.Resources
Imports Newtonsoft.Json.Linq
Imports System.Net

Public Class SalesOrder

    Public Shared Function GetOrderUpdatePersonDetails(ByVal OrderNo As String) As BO.SalesHeader
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim U As New BO.SalesHeader()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("select PRINTED,isnull(ADDUSER,'') AS ADDUSER,ADDDATE,ADDTIME,ADDAPP,UPDUSER,UPDDATE,UPDTIME,UPDAPP,DELUSER,DELDATE,DELTIME,DELAPP,LOCKUSER,LOCKDATE,LOCKTIME,LOCKAPP from F_ORDER1 where [order]=" + OrderNo, Con)
                    Cmd.CommandType = CommandType.Text
                    Dim ordReader = Cmd.ExecuteReader()
                    While (ordReader.Read())
                        U.ADDUSER = ordReader("ADDUSER")
                        U.ADDDATE = ordReader("ADDDATE")
                        U.ADDTIME = ordReader("ADDTIME")
                        U.ADDAPP = ordReader("ADDAPP")

                        U.UPDUSER = ordReader("UPDUSER")
                        U.UPDDATE = ordReader("UPDDATE")
                        U.UPDTIME = ordReader("UPDTIME")
                        U.UPDAPP = ordReader("UPDAPP")

                        U.DELUSER = ordReader("DELUSER")
                        U.DELDATE = ordReader("DELDATE")
                        U.DELTIME = ordReader("DELTIME")
                        U.DELAPP = ordReader("DELAPP")

                        U.LOCKUSER = ordReader("LOCKUSER")
                        U.LOCKDATE = ordReader("LOCKDATE")
                        U.LOCKTIME = ordReader("LOCKTIME")
                        U.LOCKAPP = ordReader("LOCKAPP")
                        U.Printed = ordReader("PRINTED")

                    End While
                End Using
            End Using
            Return U
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetOrderUpdatePersonDetails")
            Throw ex
        End Try
    End Function


    Public Shared Function CheckInvoiceExist(ByVal Order As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetCustomerNumberfromF_ORDER1", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("Order", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        result = Convert.ToString(dt(0)(0))
                    End If
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In CheckInvoiceExist")
            Return "error"
        End Try
    End Function


    Public Shared Function CheckOrderCanModified(ByVal Order As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spCheckOrderCanModified", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("order", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Return "0"
                    Else
                        Return "1"
                    End If
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In CheckOrderCanModified")
            Return "1"
        End Try
    End Function

    Public Shared Function CheckIsUnsavedOrderFortheUser(ByVal UserID As String, ByVal CurrentCustomer As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim customer As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                'Using Cmd As New SqlCommand("select top 1 customer from tblunsavedorders where UserID=@UserID And Customer <> @CurrentCustomer", Con) 'Commented by belal on 24 Dec 2020
                Using Cmd As New SqlCommand("spCheckUnsaveOrderForCustomer", Con) 'Added by belal on 24 Dec 2020
                    Cmd.Parameters.AddWithValue("@UserID", UserID) 'Commented by belal on 24 Dec 2020
                    Cmd.Parameters.AddWithValue("@Customer", CurrentCustomer)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        customer = Convert.ToString(dt(0)(0))
                    End If
                End Using
            End Using
            Return customer
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In CheckIsUnsavedOrderFortheUser")
            Return "error"
        End Try
    End Function

    Public Shared Function ReleaseInvoice(ByVal OrderNos As String, ByVal UserName As String) As String
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spReleaseInvoiceHistory", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@OrderNos", OrderNos)
                    Cmd.Parameters.AddWithValue("@UserName", UserName)
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spReleaseInvoice", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@OrderNos", OrderNos)
                    cmd.ExecuteNonQuery()
                    Return "success"
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ReleaseInvoice")
            Throw ex
        End Try
    End Function


    Public Shared Function ActivateScanFlag(ByVal OrderNos As String, ByVal UserName As String) As String
        Try

            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Try
                    Using Cmd As New SqlCommand("spActivateScanFlag", Con)
                        Cmd.CommandType = CommandType.StoredProcedure
                        Cmd.Parameters.AddWithValue("OrderNos", OrderNos)
                        Cmd.Parameters.AddWithValue("UserName", UserName)
                        Cmd.ExecuteNonQuery()
                    End Using
                Catch ex As Exception
                    ErrorLogs.LogException(ex, "Error In ActivateScanFlag::UpdateActivitylog")
                End Try

            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ActivateScanFlag")
            Throw ex
        End Try
    End Function



    Public Shared Function InsertSalesOrderLadingBillDetails(ByVal HeaderXML As String, ByVal DetailsXML As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetRptLadingBillDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderXML", HeaderXML)
                    cmd.Parameters.AddWithValue("@DetailXML", DetailsXML)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertSalesOrderLadingBillDetails")
            Return "Error"
        End Try
    End Function

    Public Shared Function InsertSalesOrderPickListDetails(ByVal HeaderXML As String, ByVal DetailsXML As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetRptPickListDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderXML", HeaderXML)
                    cmd.Parameters.AddWithValue("@DetailXML", DetailsXML)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertSalesOrderPickListDetails")
            Return "Error"
        End Try
    End Function

    Public Shared Function GetCarrierDetails(ByVal Filter As String) As List(Of BO.SalesHeader)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                '' we are converting this one because it is not worth it
                Using Cmd As New SqlCommand(String.Format("Select ca.carrier, ca.name from f_carrie ca " +
                                                          "inner join (Select * from f_order1 where " + Filter + ")As or1 On " +
                                                          "or1.CARRIER=ca.carrier group by ca.carrier, ca.name"), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesHeader
                        u.CarrierCode = row("CARRIER")
                        u.CarrierName = row("Name")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            Dim uList As New List(Of BO.SalesHeader)
            Dim u As New BO.SalesHeader
            ErrorLogs.LogException(ex, "GetCarrierDetails")
            uList.Add(u)
            Return uList
        End Try
    End Function

    Public Shared Function GetImportDBFFileLastUpdatedTime() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("Select iif(DATEDIFF(MINUTE,LastImportDate,GETDATE())>=Duration,'Import','') from tblImportDBFFiles"), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim result = Cmd.ExecuteScalar()
                    Return result
                End Using
            End Using
            Return ""
        Catch ex As Exception
            ErrorLogs.LogException(ex, "GetImportDBFFileLastUpdatedTime")
            Return ex.Message
        End Try
    End Function

    Public Shared Function CheckAccountNoForARShippingLabel(ByVal UserID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spCheckAccountNoForARShippingLabel", Con)
                    Cmd.Parameters.AddWithValue("@UserID", UserID)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Result += "Invoice# <b>" + Convert.ToString(row("OrderNo")) + "</b> for Customer <b>" + Convert.ToString(row("ShiptoName")) + "</b>  no shipper account # </br>"
                    Next
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "GetImportDBFFileLastUpdatedTime")
            Return "error"
        End Try
    End Function

    Public Shared Function GetSalesHeaderForCurrentOrderFromSQL(ByVal Filter As String) As List(Of BO.SalesHeader)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uListCurrentOrder As New List(Of BO.SalesHeader)
            Using coCon As New SqlConnection(ConStr)
                coCon.Open()
                ' Dim sortExp As String = "[" & sortname & "] " & SortOrder
                Dim whereClause = If(Filter <> "", "where " + Filter, "")
                Using coCmd As New SqlCommand("select * from vwGetCurrentOrderHeader " + whereClause, coCon)
                    coCmd.CommandType = CommandType.Text

                    Dim da As New SqlDataAdapter(coCmd)
                    Dim dt As New DataTable
                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1

                    dt.Columns.Add(INCcolumn)
                    da.Fill(dt)

                    Dim TotalCount As Integer = dt.Rows.Count
                    Dim TotalFBE As Decimal = 0
                    Dim TotalUnits As Integer = 0
                    Dim TotalInvAmount As Decimal = 0
                    If dt.Rows.Count > 0 Then
                        TotalUnits = dt.Compute("Sum(BOXES)", "")
                        TotalInvAmount = dt.Compute("Sum(INVAMOUNT)", "")
                    End If
                    For Each row In dt.Rows
                        Dim u As New BO.SalesHeader
                        u.RowNo = row("RECNO")
                        u.Order = If(row("ORDER") Is DBNull.Value, 0, row("ORDER"))
                        u.Customer = If(row("Customer") Is DBNull.Value, 0, row("CUSTOMER"))
                        u.CustomerName = If(row("Name") Is DBNull.Value, "", row("NAME"))
                        u.OrderDate = If(row("OrderDate") Is DBNull.Value, "", row("OrderDate"))
                        u.FontColor = row("FontColor")
                        u.BGColor = row("Bgcolor")
                        u.ColorCode = row("ColorCode")
                        u.Day = IIf(Convert.ToDateTime(u.OrderDate) = DateTime.Now.Date, "Today", row("Day"))
                        u.Carrier = row("CARRIER")
                        u.WH = row("WH")
                        u.Printed = row("PRINTED")
                        u.List = row("LIST")
                        u.Bills = row("BILLS")
                        u.Scanned = row("SCANNED")
                        u.SHIPPED = row("SHIPPED")
                        u.Shipto = If(row("SHIPTO") Is DBNull.Value, "", row("SHIPTO"))
                        u.ShiptoName = If(row("SHIPTONAME") Is DBNull.Value, "", row("SHIPTONAME"))
                        u.ShiptoAddress1 = row("SHIPTOADD1")
                        u.ShiptoAddress2 = row("SHIPTOADD2")
                        u.ShiptoCity = row("SHIPTOCITY")
                        u.ShiptoState = row("SHIPTOST")
                        u.ShiptoZip = row("SHIPTOZIP")
                        u.PO = If(row("PO") Is DBNull.Value, "", row("PO"))
                        u.Cubes = If(row("Cubes") Is DBNull.Value, 0, row("Cubes"))
                        u.DetailsList = GetSalesOrderDetails(u.Order)
                        If u.DetailsList IsNot Nothing Then
                            If u.DetailsList.Count > 0 Then
                                u.cInvenType = If(u.DetailsList.Any(Function(x) x.cInvenType = "P"), "P", If(u.DetailsList.Any(Function(x) x.cInvenType = "A"), "A", ""))
                            Else
                                u.cInvenType = ""
                            End If
                        Else
                            u.cInvenType = ""
                        End If
                        If (Convert.ToString(row("BOXES")) <> "") Then
                            u.Boxes = Convert.ToDecimal(row("BOXES"))
                        Else
                            u.Boxes = 0
                        End If
                        u.FBE = If(row("FBE") Is DBNull.Value, 0, row("FBE"))
                        TotalFBE += u.FBE
                        u.InvAmount = If(row("INVAMOUNT") Is DBNull.Value, 0, row("INVAMOUNT"))
                        u.HOLD = If(row("HOLD") = "Y", True, False)
                        u.SLSMAN = row("SLSMAN")
                        uListCurrentOrder.Add(u)
                    Next

                    Dim po As New BO.SalesHeader
                    po.RowNo = 0
                    po.Order = 0
                    po.OrderDate = DateTime.Now.ToString()
                    po.FontColor = ""
                    po.BGColor = ""
                    po.ColorCode = ""
                    po.Day = ""
                    po.Carrier = ""
                    po.WH = ""
                    po.Printed = False
                    po.List = False
                    po.Scanned = False
                    po.Bills = False
                    po.SHIPPED = False
                    po.Shipto = ""
                    po.ShiptoName = ""
                    po.ShiptoAddress1 = ""
                    po.ShiptoAddress2 = ""
                    po.ShiptoCity = ""
                    po.ShiptoState = ""
                    po.ShiptoZip = ""
                    po.PO = ""
                    po.Boxes = TotalUnits
                    po.cInvenType = ""
                    po.FBE = TotalFBE
                    po.InvAmount = TotalInvAmount
                    po.TotalRows = TotalCount
                    po.HOLD = False
                    po.SLSMAN = 0
                    uListCurrentOrder.Add(po)

                End Using
            End Using
            Return uListCurrentOrder
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesHeaderForCurrentOrderFromSQL")
            Dim uList As New List(Of BO.SalesHeader)
            Dim u As New BO.SalesHeader
            u.ErrorMessage = "Error in GetSalesHeaderForCurrentOrderFromSQL"
            uList.Add(u)
            Return uList
        End Try
    End Function

    Public Shared Function GetSalesOrderDetails(ByVal Order As Integer) As List(Of BO.SalesDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uListCurrentOrder As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetSalesOrderDetails", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@Order", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    'Dim cInvenType As String = ""
                    For Each row In ds.Rows
                        Dim u As New BO.SalesDetail
                        u.FarmDetails.FarmCode = row("FARMCODE")
                        'u.FlowerDetails.Color = IIf(row("COLOR") Is DBNull.Value, "", row("COLOR"))
                        u.Units = row("UNITS")
                        u.Price = row("PRICE")
                        u.Boxes = row("BOXES")
                        u.Packing = row("PACKING")
                        u.Fuel = row("FUEL")
                        u.Tax1 = row("TAX1")
                        u.Tax2 = row("TAX2")
                        u.Cost = row("COST")
                        u.OtherCost = row("OTHERCOST")
                        u.InvenType = row("INVENTYPE")
                        u.CustType = row("CUSTYPE")
                        u.AWB = Convert.ToInt64(row("AWB"))
                        u.Ext_Price = (Math.Round(u.Price * u.Units * u.Boxes, 4)) + (u.Packing * u.Boxes) + (u.Boxes * u.Fuel) + u.Tax1 + (u.Tax2 * u.Boxes)
                        ''u.nCost = u.Cost + IIf(u.Units <> 0 And u.OtherCost <> 0, Math.Round(u.OtherCost / u.Units, 3), 0)
                        If (u.Units <> 0 And u.OtherCost <> 0) Then
                            u.nCost = u.Cost + Math.Round(u.OtherCost / u.Units, 3)
                        End If

                        u.cInvenType = ""
                        If u.InvenType <> "P" Then
                            If u.InvenType = "A" Then
                                u.cInvenType = "A"
                            End If
                            If u.AWB = 0 And Trim(u.FarmDetails.FarmCode) = "ZZ" Then
                                u.cInvenType = "P"
                            End If
                        Else
                            u.cInvenType = "P"
                        End If
                        uListCurrentOrder.Add(u)
                    Next
                End Using
            End Using
            Return uListCurrentOrder
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetSalesOrderDetails")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 06-MAR-2018 :: BLOOM-20545 :: SQL Conversion for Order screen Reports :: Invoice Header data
    ''' 04 Apr 2019 :: Muthu Nivetha M :: SALES-Invoice emailed from Invoice view should not add"printed" checkmark :: Modified
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <returns></returns>
    Public Shared Function GetInvoiceReportHeader(ByVal Order As String, Optional ByVal isPrintForEmail As Boolean = False) As List(Of BO.SalesHeader)
        Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim uList As New List(Of BO.SalesHeader)
        Using Con As New SqlConnection(Constr)
            Try
                Con.Open()
                ' 04 Apr 2019 :: SALES-Invoice emailed from Invoice view should not add"printed" checkmark :: Starts
                Using Cmd As New SqlCommand(String.Format("spGetInvoiceReportHeader"), Con)
                    Cmd.Parameters.AddWithValue("@whereclause", Order)
                    ''Cmd.Parameters.AddWithValue("@mode", 1)
                    Cmd.Parameters.AddWithValue("@mode", IIf(isPrintForEmail, 1, 0))
                    Cmd.CommandType = CommandType.StoredProcedure
                    ' 04 Apr 2019 :: SALES-Invoice emailed from Invoice view should not add"printed" checkmark :: Ends
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesHeader
                        u.Order = Convert.ToInt32(row("Order"))
                        u.Customer = Convert.ToString(row("CUSTOMER"))
                        u.CustomerName = Convert.ToString(row("BILLTO"))
                        u.Address1 = Convert.ToString(row("ADDRESS1"))
                        u.Address2 = Convert.ToString(row("ADDRESS2"))
                        u.Phone = Convert.ToString(row("PHONE"))
                        u.Fax = Convert.ToString(row("FAX"))
                        u.City = Convert.ToString(row("CITY"))
                        u.State = Convert.ToString(row("STATE"))
                        u.Country = Convert.ToString(row("COUNTRY"))
                        u.Zip = Convert.ToString(row("ZIP"))
                        u.Contact = Convert.ToString(row("CONTACT"))
                        u.Shipto = Convert.ToString(row("SHIPTONAME"))
                        u.ShiptoAddress = Convert.ToString(row("SHIPTOADD1")) + " " + Convert.ToString(row("SHIPTOADD2"))
                        u.ShiptoCity = Convert.ToString(row("SHIPTOCity"))
                        u.ShiptoState = Convert.ToString(row("SHIPTOst"))
                        u.ShiptoZip = Convert.ToString(row("SHIPTOzip"))
                        u.Carrier = Convert.ToString(row("CARRIER"))
                        u.SalesManName = Convert.ToString(row("SALESMAN"))
                        u.Terms = Convert.ToString(row("TERMS"))
                        u.ShippingDate = Convert.ToDateTime(IIf(Convert.ToString(row("SHIPDATE")) = "", DateTime.Now, row("SHIPDATE"))).ToString("MM/dd/yyyy")
                        u.PO = Convert.ToString(row("PO"))
                        u.AWB = Convert.ToString(row("AWB"))
                        u.WH = IIf(row("WH") Is DBNull.Value, "", row("WH"))
                        'u.PickRemark = IIf(row("PICKREMARK") Is DBNull.Value, "", row("PICKREMARK"))
                        u.PickRemark = Convert.ToString(row("TEXT1")) + " <br/> " + Convert.ToString(row("TEXT2")) + " <br/> " + Convert.ToString(row("TEXT3")) +
                                " <br/> " + Convert.ToString(row("TEXT4")) + " <br/> " + Convert.ToString(row("TEXT5"))
                        u.VOID = Convert.ToString(row("VOID"))
                        u.Printed = row("PRINTED")
                        uList.Add(u)
                    Next
                End Using
                '' 04 Apr 2019 :: SALES-Invoice emailed from Invoice view should not add"printed" checkmark :: Starts
                'If isPrintForEmail = True Then
                '    Using UpdCmd As New SqlCommand(String.Format("spGetInvoiceReportHeader"), Con)
                '        UpdCmd.Parameters.AddWithValue("@whereclause", Order)
                '        UpdCmd.Parameters.AddWithValue("@mode", 2)
                '        UpdCmd.CommandType = CommandType.StoredProcedure
                '        UpdCmd.ExecuteNonQuery()
                '    End Using
                'End If
                '' 04 Apr 2019 :: SALES-Invoice emailed from Invoice view should not add"printed" checkmark :: Ends
                Con.Close()
                Return uList
            Catch ex As Exception
                Throw ex
            End Try
        End Using

    End Function

    ''' <summary>
    ''' ANITHA :: 06-MAR-2018 :: BLOOM-20545 :: SQL Conversion for Order screen Reports :: Invoice Detail data
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <returns></returns>
    Public Shared Function GetInvoiceReportDetail(ByVal Order As String) As List(Of BO.SalesDetail)
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(Constr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetInvoiceReportDetailbyOrdersonly", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("Orders", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesDetail
                        u.Order = Convert.ToInt32(row("Order"))
                        u.FlowerDetails.Flower = Convert.ToString(row("FLOWER"))
                        u.FlowerDetails.Name = Convert.ToString(row("FLRDESC"))
                        u.FlowerDetails.CAT = Convert.ToString(row("FLRCAT"))
                        u.FOB = Convert.ToString(row("FOB"))
                        If (Convert.ToString(row("BOXES")) <> "") Then
                            u.Boxes1 = Convert.ToDecimal(row("BOXES"))
                        Else
                            u.Boxes1 = 0
                        End If

                        If (Convert.ToString(row("UNITS")) <> "") Then
                            u.Units = Convert.ToDecimal(row("UNITS"))
                        Else
                            u.Units = 0
                        End If

                        If (Convert.ToString(row("UNITS")) <> "") Then
                            u.Price = Convert.ToDecimal(row("UNITS"))
                        Else
                            u.Price = Convert.ToDecimal(row("UNITS"))
                        End If

                        If (Convert.ToString(row("TOTALUNITS")) <> "") Then
                            u.TotalUnits1 = Convert.ToDecimal(row("TOTALUNITS"))
                        Else
                            u.TotalUnits1 = 0
                        End If

                        If (Convert.ToString(row("AMOUNT")) <> "") Then
                            u.Amount = Convert.ToDecimal(row("AMOUNT"))
                        Else
                            u.Amount = 0
                        End If

                        u.UOM = Convert.ToString(row("UOM"))
                        u.FarmDetails.FarmCode = Convert.ToString(row("FarmCode"))

                        If (Convert.ToString(row("TAX1")) <> "") Then
                            u.Tax1 = Convert.ToDecimal(row("TAX1"))
                        Else
                            u.Tax1 = 0
                        End If

                        If (Convert.ToString(row("TAX2")) <> "") Then
                            u.Tax2 = Convert.ToDecimal(row("TAX2"))
                        Else
                            u.Tax2 = 0
                        End If

                        u.BoxLength = Convert.ToInt32(row("L"))
                        u.BoxWidth = Convert.ToInt32(row("W"))
                        u.BoxHeight = Convert.ToInt32(row("H"))
                        u.Boxes = Math.Round(Convert.ToDecimal(row("BOXES")), 0, MidpointRounding.AwayFromZero)
                        u.Cubes = ((u.BoxLength * u.BoxWidth * u.BoxHeight) / 1728) * u.Boxes
                        u.Type = row("Type")
                        'SOFIA: 10/08/2021 - NEW FIELDS IN RPTINVOICE FOR CARRIER CARGO AGENT (ARLINE C)
                        u.UPC = row("UPC")
                        u.DateCode = row("DateCode")
                        u.BoxCode = row("BoxCode")
                        u.Notes = row("Notes")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 06-MAR-2018 :: BLOOM-20545 :: SQL Conversion for Order screen Reports :: Packing List Header data
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <returns></returns>
    Public Shared Function GetPickListHeaderSQL(ByVal Order As String) As List(Of BO.SalesHeader)
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)
            Using Con As New SqlConnection(Constr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetPickListHeader", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("OrderNos", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim u As New BO.SalesHeader
                        u.Order = Convert.ToInt32(row("Order"))
                        u.Customer = Convert.ToString(row("CUSTOMER"))
                        u.CustomerName = Convert.ToString(row("BILLTO"))
                        u.Address1 = Convert.ToString(row("ADDRESS1"))
                        u.Address2 = Convert.ToString(row("ADDRESS2"))
                        u.Phone = Convert.ToString(row("PHONE"))
                        u.Fax = Convert.ToString(row("FAX"))
                        u.City = Convert.ToString(row("CITY"))
                        u.State = Convert.ToString(row("STATE"))
                        u.Country = Convert.ToString(row("COUNTRY"))
                        u.Zip = Convert.ToString(row("ZIP"))
                        u.Contact = Convert.ToString(row("CONTACT"))
                        u.Shipto = Convert.ToString(row("SHIPTONAME"))
                        u.ShiptoAddress = Convert.ToString(row("SHIPTOADD1")) + "  " + vbCrLf + Convert.ToString(row("SHIPTOADD2"))
                        u.ShiptoCity = Convert.ToString(row("SHIPTOCity"))
                        u.ShiptoState = Convert.ToString(row("SHIPTOst"))
                        u.ShiptoZip = Convert.ToString(row("SHIPTOzip"))
                        u.Carrier = Convert.ToString(row("CARRIER"))
                        u.SalesManName = Convert.ToString(row("SALESMAN"))
                        u.Terms = Convert.ToString(row("TERMS"))
                        u.OrderDate = Convert.ToString(row("TRUCKDATE"))
                        u.PO = Convert.ToString(row("PO"))
                        u.AWB = Convert.ToString(row("AWB"))
                        u.WH = IIf(row("WH") Is DBNull.Value, "", row("WH"))
                        u.PickRemark = IIf(row("PICKREMARK") Is DBNull.Value, "", row("PICKREMARK"))
                        u.VOID = Convert.ToString(row("VOID"))
                        u.List = Convert.ToString(row("LIST"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 06-MAR-2018 :: BLOOM-20545 :: SQL Conversion for Order screen Reports :: Packing List Detail data
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <returns></returns>
    Public Shared Function GetPickListDetailSQL(ByVal Order As String) As List(Of BO.SalesDetail)
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(Constr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetPickListDetail", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("OrderNos", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesDetail
                        u.Order = Convert.ToInt32(row("Order"))
                        u.FarmDetails.FarmCode = Convert.ToString(row("GROWER"))
                        u.FlowerDetails.Name = Convert.ToString(row("PRODUCT"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.Units = Convert.ToString(row("UNITS"))
                        u.BoxNum = Convert.ToString(row("BOXNUM"))
                        u.AWB = Convert.ToString(row("AWB"))
                        u.FlowerDetails.CAT = Convert.ToString(row("CAT"))
                        u.BoxLength = Convert.ToInt32(row("L"))
                        u.BoxWidth = Convert.ToInt32(row("W"))
                        u.BoxHeight = Convert.ToInt32(row("H"))
                        u.Armellini = Convert.ToString(row("ARMELLINI"))
                        u.Boxes = Convert.ToInt32(row("BOXES"))
                        u.Cubes = ((u.BoxLength * u.BoxWidth * u.BoxHeight) / 1728)
                        u.PickRemark = Convert.ToString(row("PICKREMARK")) + " <br/> " +
                                Convert.ToString(row("SHIPTEXT1")) + " <br/> " + Convert.ToString(row("SHIPTEXT2")) + " <br/> " + Convert.ToString(row("SHIPTEXT3")) +
                                " <br/> " + Convert.ToString(row("SHIPTEXT4")) + " <br/> " + Convert.ToString(row("SHIPTEXT5"))
                        u.FBE = row("FBE")
                        u.DateRec = row("DATEREC")
                        u.BoxCode = row("BoxCode")
                        u.UPC = row("UPC")
                        uList.Add(u)
                    Next
                End Using

                Using ExsCmd As New SqlCommand("spUpdatePickListDetail", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("orders", Order)
                    ExsCmd.ExecuteNonQuery()
                End Using

            End Using
            Return uList
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 06-MAR-2018 :: BLOOM-20545 :: SQL Conversion for Order screen Reports :: Bill of Lading Header data
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <returns></returns>
    Public Shared Function GetLadingBillHeaderSQL(ByVal Order As String) As List(Of BO.SalesHeader)
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)
            Using Con As New SqlConnection(Constr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetLadingBillHeader", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("OrderNos", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesHeader
                        u.Order = Convert.ToInt32(row("Order"))
                        u.Shipto = Convert.ToString(row("SHIPTONAME"))
                        If u.Shipto.Trim() <> "" Then
                            u.Shipto = Convert.ToString(row("SHIPTONAME"))
                            u.ShiptoAddress1 = Convert.ToString(row("SHIPTOADD1"))
                            u.ShiptoAddress2 = Convert.ToString(row("SHIPTOADD2"))
                            u.ShiptoCity = Convert.ToString(row("shiptocity"))
                            u.ShiptoState = Convert.ToString(row("shiptost"))
                            u.ShiptoZip = Convert.ToString(row("shiptozip"))
                        Else
                            u.Shipto = Convert.ToString(row("CUSTNAME"))
                            u.ShiptoAddress1 = Convert.ToString(row("CUSTADD1"))
                            u.ShiptoAddress2 = Convert.ToString(row("CUSTADD2"))
                            u.ShiptoCity = Convert.ToString(row("CUSTCity"))
                            u.ShiptoState = Convert.ToString(row("CUSTst"))
                            u.ShiptoZip = Convert.ToString(row("CUSTzip"))
                        End If
                        u.Customer = Convert.ToString(row("CUSTOMER"))
                        u.Contact = Convert.ToString(row("CONTACT"))
                        u.Carrier = Convert.ToString(row("CARRIER"))
                        u.DeclaredValue = IIf(row("INVAMOUNT") Is DBNull.Value, 0, row("INVAMOUNT"))
                        u.OrderDate = Convert.ToString(row("TRUCKDATE"))
                        u.PO = Convert.ToString(row("PO"))
                        u.WH = IIf(row("WH") Is DBNull.Value, "", row("WH"))
                        u.AWB = row("AWB")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 06-MAR-2018 :: BLOOM-20545 :: SQL Conversion for Order screen Reports :: Bill of Lading Detail data
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <returns></returns>
    Public Shared Function GetLadingBillDetailSQL(ByVal Order As String) As List(Of BO.SalesDetail)
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(Constr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetLadingBillDetail", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("OrderNos", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesDetail
                        u.Order = Convert.ToInt32(row("Order"))
                        u.FarmDetails.FarmCode = Convert.ToString(row("GROWER"))
                        u.FlowerDetails.Name = Convert.ToString(row("PRODUCT"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.FlowerDetails.CAT = Convert.ToString(row("CAT"))
                        u.BoxLength = Convert.ToInt32(row("L"))
                        u.BoxWidth = Convert.ToInt32(row("W"))
                        u.BoxHeight = Convert.ToInt32(row("H"))
                        u.Boxes = Math.Round(Convert.ToDecimal(row("BOXES")), 0, MidpointRounding.AwayFromZero)
                        u.Cubes = Math.Round(Convert.ToDecimal(((u.BoxLength * u.BoxWidth * u.BoxHeight) / 1728)), 2, MidpointRounding.AwayFromZero)
                        u.BoxCode = Convert.ToString(row("BOXCODE"))
                        uList.Add(u)
                    Next
                End Using

                Using ExsCmd As New SqlCommand("spUpdateLadingBillDetail", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("orders", Order)
                    ExsCmd.ExecuteNonQuery()
                End Using
            End Using
            Return uList
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 06-MAR-2018 :: BLOOM-20545 :: SQL Conversion for Order screen Reports :: CCI Header data
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <returns></returns>
    Public Shared Function GetCustomsInvoiceHeaderSQL(ByVal Order As String) As List(Of BO.SalesHeader)
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)
            Using Con As New SqlConnection(Constr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetCustomsInvoiceHeader", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("Orders", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesHeader
                        u.Order = Convert.ToInt32(row("Order"))
                        u.Shipto = Convert.ToString(row("SHIPTONAME"))
                        If u.Shipto.Trim() <> "" Then
                            u.Shipto = Convert.ToString(row("SHIPTONAME"))
                            u.ShiptoAddress1 = Convert.ToString(row("SHIPTOADD1"))
                            u.ShiptoAddress2 = Convert.ToString(row("SHIPTOADD2"))
                            u.ShiptoCity = Convert.ToString(row("SHIPTOCity"))
                            u.ShiptoState = Convert.ToString(row("SHIPTOst"))
                            u.ShiptoZip = Convert.ToString(row("SHIPTOzip"))
                        Else
                            u.Shipto = Convert.ToString(row("CUSTNAME"))
                            u.ShiptoAddress1 = Convert.ToString(row("CUSTADD1"))
                            u.ShiptoAddress2 = Convert.ToString(row("CUSTADD2"))
                            u.ShiptoCity = Convert.ToString(row("CUSTCity"))
                            u.ShiptoState = Convert.ToString(row("CUSTst"))
                            u.ShiptoZip = Convert.ToString(row("CUSTzip"))
                        End If
                        u.PCOName = Convert.ToString(row("PCONAME"))
                        u.PCOAddress1 = Convert.ToString(row("PCOADD1"))
                        u.PCOAddress2 = Convert.ToString(row("PCOADD2"))
                        u.PCOAddress3 = Convert.ToString(row("PCOADD3"))
                        u.Carrier = Convert.ToString(row("Carrier"))
                        u.CarrierName = Convert.ToString(row("CarrierName"))
                        u.Customer = row("CUSTOMER")
                        u.Terms = row("TERMS")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 06-MAR-2018 :: BLOOM-20545 :: SQL Conversion for Order screen Reports :: CCI Detail data
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <returns></returns>
    Public Shared Function GetCustomsInvoiceDetailSQL(ByVal Order As String) As List(Of BO.SalesDetail)
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(Constr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetCustomsInvoiceDetail", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("Orders", Order)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesDetail
                        u.Order = Convert.ToInt32(row("Order"))
                        u.FlowerDetails.Flower = Convert.ToString(row("FLOWER"))
                        u.FlowerDetails.Name = Convert.ToString(row("FLRDESC"))
                        u.FlowerDetails.CAT = Convert.ToString(row("FLRCAT"))
                        u.FOB = Convert.ToString(row("FOB"))
                        If (Convert.ToString(row("BOXES")) <> "") Then
                            u.Boxes = Convert.ToDecimal(row("BOXES"))
                        Else
                            u.Boxes = 0
                        End If
                        If (Convert.ToString(row("UNITS")) <> "") Then
                            u.Units = Convert.ToDecimal(row("UNITS"))
                        Else
                            u.Units = 0
                        End If
                        If (Convert.ToString(row("AMOUNT")) <> "") Then
                            u.Amount = Convert.ToDecimal(row("AMOUNT"))
                        Else
                            u.Amount = 0
                        End If
                        u.UOM = Convert.ToString(row("UOM"))
                        u.FarmDetails.Country = Convert.ToString(row("COUNTRYNAME"))
                        u.FarmDetails.FarmCode = Convert.ToString(row("FarmCode"))
                        u.CustCode = row("CUSTOMER")
                        u.Weight = row("Weight")

                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function GetShippingLabelDetailsSQL(ByVal Order As String, ByVal UserName As String, Optional ByVal isForLookUp As Boolean = False, Optional ByVal Farm As String = "", Optional ByVal Boxnum As Integer = 0) As List(Of BO.SalesDetail)
        Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim uList As New List(Of BO.SalesDetail)
        Dim EventLogsForRack As String = ""
        '''''
        Using Con As New SqlConnection(Constr)
            Con.Open()
            Using Cmd As New SqlCommand("spGetShippingLabelDetailsSQLAfterRack", Con)
                ''wait 120 seconds before timeout
                Cmd.CommandTimeout = 120
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@OrderNums", Order)
                Cmd.Parameters.AddWithValue("@UserName", UserName)
                Cmd.Parameters.AddWithValue("@isForLookUp", isForLookUp)
                Cmd.Parameters.AddWithValue("@Farm", Farm)
                Cmd.Parameters.AddWithValue("@Boxnum", Boxnum)
                Dim EventLogsForRackParam = New SqlParameter("@EventLogsForRack", SqlDbType.VarChar, -1)
                ''empty output variable before call the sp
                EventLogsForRackParam.Value = ""
                EventLogsForRackParam.Direction = ParameterDirection.Output
                Cmd.Parameters.Add(EventLogsForRackParam)
                '''''
                Dim da As New SqlDataAdapter(Cmd)
                Dim ds As New DataSet
                '''''
                da.Fill(ds)

                '''''
                If Not String.IsNullOrEmpty(EventLogsForRackParam.Value.ToString()) Then
                    AppendLog(EventLogsForRackParam.Value.ToString(), "GetShippingLabelDetails")
                End If

                If ds.Tables(0).Rows.Count <> 0 Then
                    If ds.Tables(0).Rows(0)("ErrorMessage").ToString() <> "" Then
                        Dim EmptyList As New List(Of BO.SalesDetail)
                        Dim E As New BO.SalesDetail
                        E.ErrorMessage = ds.Tables(0).Rows(0)("ErrorMessage").ToString()
                        EmptyList.Add(E)
                        Return EmptyList
                    End If
                End If
                '''''
                Dim lstSO As List(Of BO.SalesDetail) = New List(Of BO.SalesDetail)
                For Each row In ds.Tables(0).AsEnumerable()
                    Dim soObj As BO.SalesDetail = New BO.SalesDetail
                    With soObj
                        .Order = row.Field(Of Integer)("Order")
                        .ShippingDate = row.Field(Of Date)("ShippingDate")
                        .DateCode = row.Field(Of String)("DateCode")
                        .PO = row.Field(Of String)("PO")
                        .Shipto = row.Field(Of String)("SHIPTONAME")
                        .ShiptoAddress1 = row.Field(Of String)("SHIPTOADD1")
                        .ShiptoAddress2 = row.Field(Of String)("SHIPTOADD2")
                        .ShiptoCity = row.Field(Of String)("ShiptoCity")
                        .ShiptoState = row.Field(Of String)("SHIPTOST")
                        .ShiptoZip = row.Field(Of String)("SHIPTOZIP")
                        .BoxNum = row.Field(Of Integer)("Boxnum")
                        .BoxCode = row.Field(Of String)("BoxCode")
                        .Units = row.Field(Of Integer)("Units")
                        .Boxes = row.Field(Of Integer)("Boxes")
                        .UOM = row.Field(Of String)("UOM")
                        .NAME = row.Field(Of String)("Name")
                        .FarmCode = row.Field(Of String)("FarmCode")
                        .CAT = row.Field(Of String)("CAT")
                        .CarrierName = row.Field(Of String)("CarrierName")
                        .Carrier = row.Field(Of String)("Carrier")
                        .Type = row.Field(Of String)("Type")
                        .AWB = row.Field(Of String)("AWB")
                        .BoxSequence = row.Field(Of String)("BoxSequence")
                        .LabelCode = row.Field(Of String)("LabelCode")
                        .ARBoxNo = row.Field(Of String)("ARBoxNo")
                        .Consignee = row.Field(Of String)("Consignee")
                        .ConstantArmellini = row.Field(Of String)("ConstantArmellini")
                        .SLSMANEmail = row.Field(Of String)("SLSMANEmail")
                        .UPC = row.Field(Of String)("UPC")
                        .Prepaid = row.Field(Of Boolean)("Prepaid")
                        .ShippingLabelType = row.Field(Of String)("ShippingLabelType")
                        .PickRemark = row.Field(Of String)("PickRemark")
                        .PrintHeaderReport = row.Field(Of String)("PrintHeaderReport")
                        .Rack = row.Field(Of String)("Rack")

                        .FlowerDetails.Name = row.Field(Of String)("Name")
                        .FarmDetails.FarmCode = row.Field(Of String)("FARMCODE")
                        .FlowerDetails.CAT = row.Field(Of String)("CAT")

                        .Armellini = row.Field(Of String)("Armellini")
                        .BoxLength = row.Field(Of Integer)("BoxLength")
                        .BoxWidth = row.Field(Of Integer)("BoxWidth")
                        .BoxHeight = row.Field(Of Integer)("BoxHeight")

                        .StoreNo = row.Field(Of Integer)("STORE")
                    End With

                    lstSO.Add(soObj)
                Next row
                ''''

                Return lstSO
            End Using
        End Using
    End Function
    ''' <summary>
    '''' ANITHA :: 06-MAR-2018 :: BLOOM-20545 :: SQL Conversion for Order screen Reports :: Shipping Label Details
    '''' Muthu Nivetha M :: 16 Mar 19 :: Print Label on look up by boxnumber results screen
    '''' Muthu Nivetha M :: 10Mar2020 :: Modified :: To generate special reg labels only for Cust  type='T' with recipe details
    '''' </summary>
    'Public Shared Function GetShippingLabelDetailsSQL_Old(ByVal Order As String, ByVal UserName As String, Optional ByVal isForLookUp As Boolean = False, Optional ByVal Farm As String = "", Optional ByVal Boxnum As Integer = 0) As List(Of BO.SalesDetail)
    '    Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
    '    Dim uList As New List(Of BO.SalesDetail)
    '    Dim EventLogsForRack As [String] = ""
    '    Dim Orderno As String()
    '    'Dim TempRackTable As String = "R" + DateTime.Now.ToString("ddMMyyyyHHmm")

    '    Using Con As New SqlConnection(Constr)
    '        Con.Open()
    '        Dim Trans As SqlTransaction = Con.BeginTransaction()
    '        Try
    '            Try
    '                Orderno = Order.Split(",")
    '                ' check if this order has been printed before bu checking boxes racked.  it is was then 
    '                For i = 0 To Orderno.Length - 1
    '                    Using RacksCmd As New SqlCommand("spRackReleaseCheck", Con)
    '                        RacksCmd.CommandType = CommandType.StoredProcedure
    '                        RacksCmd.Parameters.AddWithValue("@OrderNo", Orderno(i))
    '                        RacksCmd.Transaction = Trans
    '                        RacksCmd.ExecuteNonQuery()
    '                    End Using
    '                Next
    '            Catch ex As Exception
    '                EventLogsForRack += "****OrderNo=" + Convert.ToString(Order) + "**** ### "
    '            End Try
    '            Dim WhereClause As String = "OR1.[ORDER] In (select s from dbo.CSV2Table('" + Order + "')) AND OR2.Type <>'K'"
    '            Using Cmd As New SqlCommand(String.Format("spGetShippingLabelDetailsSQL", Order), Con)
    '                Cmd.CommandType = CommandType.StoredProcedure
    '                Cmd.Parameters.AddWithValue("@WhereClause", WhereClause)
    '                ' Muthu Nivetha M :: 16 Mar 19 :: Print Label on look up by boxnumber results screen
    '                If isForLookUp Then
    '                    Cmd.Parameters.AddWithValue("@isForLookUp", isForLookUp)
    '                    Cmd.Parameters.AddWithValue("@Farm", Farm)
    '                    Cmd.Parameters.AddWithValue("@Boxnum", Boxnum.ToString())
    '                End If
    '                Dim da As New SqlDataAdapter(Cmd)
    '                Cmd.Transaction = Trans
    '                Dim ds As New DataSet
    '                da.Fill(ds)
    '                Dim PreviousOrderNo As String = "0"
    '                Dim PickRemarks As String = ""
    '                Dim PrintHeaderReport As String = "0"

    '                Dim AlreadyUpdatedRacks As String = ""
    '                For Each row In ds.Tables(0).Rows
    '                    If row("EmptyConsigneeDetails").ToString() <> "" Then
    '                        Dim EmptyList As New List(Of BO.SalesDetail)
    '                        Dim E As New BO.SalesDetail
    '                        E.ErrorMessage = row("EmptyConsigneeDetails").ToString()
    '                        EmptyList.Add(E)
    '                        Return EmptyList
    '                    End If
    '                    'If Convert.ToString(row("CARRIER")) = "FB" Or Convert.ToString(row("CARRIER")) = "A1" Or Convert.ToString(row("CARRIER")) = "A2" Or Convert.ToString(row("CARRIER")) = "A3" Or Convert.ToString(row("CARRIER")) = "AR" Then
    '                    'carrier check removed on 04-11-2011, all invoices should have dimentions
    '                    If row("L").ToString() = "0" Or row("W").ToString() = "0" Or row("H").ToString() = "0" Then
    '                        Dim EmptyList As New List(Of BO.SalesDetail)
    '                        Dim E As New BO.SalesDetail
    '                        'E.ErrorMessage = row("EmptyConsigneeDetails").ToString()
    '                        E.ErrorMessage = "OrderNo " + row("ORDER").ToString() + " " + "contains 0 dimensions"
    '                        EmptyList.Add(E)
    '                        Return EmptyList
    '                    End If
    '                    'End If

    '                    Dim RackedCount As Integer = Convert.ToInt32(row("RACKED"))
    '                    For i = 1 To Convert.ToInt32(row("BOXES"))
    '                        Dim u As New BO.SalesDetail
    '                        u.Order = Convert.ToInt32(row("ORDER"))
    '                        u.ShippingDate = row("SHIPPINGDATE") 'Inv Date in F_Order1
    '                        u.DateCode = Convert.ToString(row("DATECODE"))
    '                        u.PO = Convert.ToString(row("PO"))
    '                        u.Shipto = Convert.ToString(row("SHIPTONAME"))
    '                        If u.Shipto.Trim() <> "" Then
    '                            u.Shipto = Convert.ToString(row("SHIPTONAME"))
    '                            u.ShiptoAddress1 = Convert.ToString(row("SHIPTOADD1"))
    '                            u.ShiptoAddress2 = Convert.ToString(row("SHIPTOADD2"))
    '                            u.ShiptoCity = Convert.ToString(row("SHIPTOCity"))
    '                            u.ShiptoState = Convert.ToString(row("SHIPTOst"))
    '                            u.ShiptoZip = Convert.ToString(row("SHIPTOzip"))
    '                        Else
    '                            u.Shipto = Convert.ToString(row("CUSTNAME"))
    '                            u.ShiptoAddress1 = Convert.ToString(row("CUSTADD1"))
    '                            u.ShiptoAddress2 = Convert.ToString(row("CUSTADD2"))
    '                            u.ShiptoCity = Convert.ToString(row("CUSTCity"))
    '                            u.ShiptoState = Convert.ToString(row("CUSTst"))
    '                            u.ShiptoZip = Convert.ToString(row("CUSTzip"))
    '                        End If
    '                        u.BoxNum = row("BOXNUM")
    '                        u.BoxCode = Convert.ToString(row("BOXCODE"))
    '                        u.Units = row("Units")
    '                        u.Boxes = Convert.ToInt32(row("BOXES"))
    '                        u.UOM = Convert.ToString(row("UOM"))
    '                        u.FlowerDetails.Name = Convert.ToString(row("PRODUCT"))
    '                        u.FarmDetails.FarmCode = Convert.ToString(row("FARMCODE"))
    '                        u.FlowerDetails.CAT = Convert.ToString(row("CAT"))
    '                        u.CarrierName = Convert.ToString(row("CARRIERNAME"))
    '                        u.Carrier = Convert.ToString(row("CARRIER"))
    '                        u.Type = Convert.ToString(row("Type"))
    '                        u.AWB = row("AWB")
    '                        u.BoxSequence = i
    '                        u.LabelCode = Convert.ToString(row("LABELCODE"))
    '                        u.ARBoxNo = 0
    '                        ''u.Consignee = Convert.ToString(row("CONSIGNEE"))
    '                        If Convert.ToString(row("CONSIGNEE")).Length > 7 Then
    '                            u.Consignee = Convert.ToString(row("CONSIGNEE")).Substring(0, 7)
    '                        Else
    '                            u.Consignee = Convert.ToString(row("CONSIGNEE"))
    '                        End If
    '                        u.ConstantArmellini = Convert.ToString(row("ConstantArmellini"))
    '                        u.SLSMANEmail = row("SLSEMAIL")
    '                        u.UPC = row("UPC")
    '                        u.Prepaid = row("Prepaid")
    '                        u.AWB = row("AWB")
    '                        Dim IsArmellini As Boolean = False
    '                        If (Trim(u.Carrier) <> "A1" And Trim(u.Carrier) <> "A2" And Trim(u.Carrier) <> "A3" And Trim(u.Carrier) <> "AR") Then
    '                            IsArmellini = False
    '                        Else
    '                            IsArmellini = True
    '                        End If

    '                        If u.Type = "W" Then
    '                            u.ShippingLabelType = "WREG" 'Walmart label for customer 'W'
    '                        ElseIf u.Type = "S" And Trim(u.Carrier) = "FB" Then
    '                            u.ShippingLabelType = "FBSM" 'Florida Beauty Supermarket label
    '                        ElseIf u.Type = "S" And IsArmellini Then
    '                            u.ShippingLabelType = "ARSM" 'Armellini Supermarket label
    '                        ElseIf u.Type = "S" And IsArmellini = False Then
    '                            u.ShippingLabelType = "SM" 'SuperMarket Label
    '                        ElseIf u.Type <> "S" And Trim(u.Carrier) = "FB" Then
    '                            u.ShippingLabelType = "FBREG" ' Flora Beauty Label
    '                        ElseIf u.Type <> "S" And IsArmellini = False Then
    '                            u.ShippingLabelType = "REG" 'Regular Label
    '                        ElseIf u.Type <> "S" And IsArmellini Then
    '                            u.ShippingLabelType = "ARREG"  'Armellini Regular label                            
    '                        End If


    '                        If PreviousOrderNo <> u.Order Then
    '                            PickRemarks = ""
    '                            PrintHeaderReport = "0"
    '                            'PrintHeaderReport=1 when F_PICKMES.DBF File has the data For that order, Or TERMSDESC has COD Or PREPAID.
    '                            Using CmdHR As New SqlCommand(String.Format("SELECT PICK.SHIPTEXT1,PICK.SHIPTEXT2,PICK.SHIPTEXT3,PICK.SHIPTEXT4,PICK.SHIPTEXT5 FROM F_PICKMS PICK INNER JOIN " +
    '                                                                           "F_ORDER1 OR1 ON OR1.[ORDER]=PICK.INVOICE WHERE OR1.[ORDER]={0}", u.Order), Con)
    '                                CmdHR.CommandType = CommandType.Text
    '                                CmdHR.Transaction = Trans
    '                                Dim daHR As New SqlDataAdapter(CmdHR)
    '                                Dim dtHR As New DataTable
    '                                daHR.Fill(dtHR)
    '                                If dtHR.Rows.Count > 0 Then
    '                                    For Each rowHR In dtHR.Rows
    '                                        PickRemarks = Convert.ToString(rowHR("SHIPTEXT1")) + " <br/> " + Convert.ToString(rowHR("SHIPTEXT2")) + " <br/> " + Convert.ToString(rowHR("SHIPTEXT3")) +
    '                                         " <br/> " + Convert.ToString(rowHR("SHIPTEXT4")) + " <br/> " + Convert.ToString(rowHR("SHIPTEXT5"))
    '                                        PrintHeaderReport = "1"
    '                                    Next
    '                                Else
    '                                    If row("TERMS").ToString().Contains("COD") Or row("TERMS").ToString().Contains("PREPAID") Then
    '                                        PrintHeaderReport = "1"
    '                                    Else
    '                                        PrintHeaderReport = "0"
    '                                    End If
    '                                End If
    '                            End Using
    '                            PreviousOrderNo = u.Order
    '                        End If

    '                        u.PickRemark = PickRemarks
    '                        u.PrintHeaderReport = PrintHeaderReport

    '                        Dim BarcodeWithoutSeq As String = u.FarmDetails.FarmCode.ToString().PadRight(3).Substring(0, 3) + u.BoxNum.ToString("D5")

    '                        Dim EmptyRacksCount As Integer = 0
    '                        Dim RacksCount As Integer = 0
    '                        If u.FarmDetails.FarmCode.Trim() <> "" And u.BoxNum <> 0 Then

    '                            If i = 1 Then
    '                                EventLogsForRack += "****OrderNo=" + Convert.ToString(u.Order) + "**** ### "
    '                                EventLogsForRack += "Order2 Info: ID = " + Convert.ToString(row("ID")) + ",Boxes=" + Convert.ToString(u.Boxes) + ",FarmCode=" + u.FarmDetails.FarmCode.Trim() + ",BoxNumber=" + Convert.ToString(u.BoxNum) + ", Racked=" + Convert.ToString(row("RACKED")) + " ### "
    '                            End If

    '                            Using CmdRacks As New SqlCommand(String.Format("Select LTRIM(RTRIM(ISNULL(Invoice,''))) As Invoice,ID from F_RACKS WHERE SUBSTRING(BARCODE,1,8)='{0}'", BarcodeWithoutSeq), Con)
    '                                CmdRacks.CommandType = CommandType.Text
    '                                CmdRacks.Transaction = Trans
    '                                Dim daRacks As New SqlDataAdapter(CmdRacks)
    '                                Dim dtRacks As New DataTable
    '                                daRacks.Fill(dtRacks)
    '                                If dtRacks.Rows.Count > 0 Then
    '                                    EmptyRacksCount = Convert.ToInt32(dtRacks.Select("Invoice=''").Count)
    '                                    If (Convert.ToInt32(dtRacks.Select("Invoice<>''").Count > 0)) Then
    '                                        RacksCount = Convert.ToInt32(dtRacks.Select("Invoice<>''").CopyToDataTable().Select("Invoice =" + Convert.ToString(u.Order) + " And ID='" + row("ID") + "' And Invoice<>'' And ID<>''").Count)
    '                                    End If
    '                                End If
    '                            End Using


    '                            EventLogsForRack += "Racks count for (farm + boxnum) and invoice is empty: " + Convert.ToString(EmptyRacksCount) + " ### "
    '                            EventLogsForRack += "Racks count for (farm + boxnum) And invoice=" + Convert.ToString(u.Order) + ": " + Convert.ToString(RacksCount) + " ### "

    '                            If RackedCount <> RacksCount Then
    '                                AppendLog(EventLogsForRack, "GetShippingLabelDetails - Racksmismatch")
    '                                Dim EmptyList As New List(Of BO.SalesDetail)
    '                                Dim E As New BO.SalesDetail
    '                                E.ErrorMessage = "Please release order # " + Convert.ToString(u.Order) + " from racks"
    '                                EmptyList.Add(E)
    '                                Trans.Rollback()
    '                                Con.Close()
    '                                Return EmptyList
    '                            End If

    '                            If u.Boxes > RackedCount Then

    '                                If (u.Boxes - RackedCount) > EmptyRacksCount Then
    '                                    For j = 1 To (u.Boxes - RackedCount)
    '                                        Using ExsCmd As New SqlCommand("insert into F_RACKS (RACK,FARM,BARCODE,ADDUSER,ADDAPP) values(@RACK,@FARM,@BARCODE,@ADDUSER,@ADDAPP)", Con)
    '                                            ExsCmd.CommandType = CommandType.Text
    '                                            ExsCmd.Parameters.AddWithValue("@RACK", "ZZZZ")
    '                                            ExsCmd.Parameters.AddWithValue("@FARM", u.FarmDetails.FarmCode.Trim())
    '                                            ExsCmd.Parameters.AddWithValue("@BARCODE", BarcodeWithoutSeq)
    '                                            ExsCmd.Parameters.AddWithValue("@ADDUSER", UserName)
    '                                            ExsCmd.Parameters.AddWithValue("@ADDAPP", "Salesorder")
    '                                            ExsCmd.Transaction = Trans
    '                                            ExsCmd.ExecuteNonQuery()
    '                                        End Using
    '                                        EventLogsForRack += "Record Inserted For the Barcode " + BarcodeWithoutSeq + " With Rack='ZZZZ' In F_RACKS.DBF ### "
    '                                    Next
    '                                End If
    '                            ElseIf u.Boxes < RackedCount Then
    '                                Using RacksUpdCmd As New SqlCommand("Update f_racks set INVOICE='', Id='' where SQL_ID in (select SQL_ID from (select ROW_NUMBER() Over (Order by sql_id) As [SN], SQL_ID From f_racks Where Invoice = " & u.Order & " And SUBSTRING(BARCODE, 1, 8) = '" & BarcodeWithoutSeq & "') A where SN>" & u.Boxes & ")", Con)
    '                                    RacksUpdCmd.CommandType = CommandType.Text
    '                                    RacksUpdCmd.Transaction = Trans
    '                                    RacksUpdCmd.ExecuteNonQuery()
    '                                End Using

    '                                Using RackedUpdCmd As New SqlCommand(String.Format("UPDATE F_ORDER2 Set RACKED=" & u.Boxes & " WHERE ID='{0}'", Convert.ToString(row("ID")), u.Boxes), Con)
    '                                    RackedUpdCmd.CommandType = CommandType.Text
    '                                    RackedUpdCmd.Transaction = Trans
    '                                    RackedUpdCmd.ExecuteNonQuery()
    '                                End Using

    '                                RackedCount = u.Boxes
    '                                EventLogsForRack += "Order2 boxes>racked count. Extra boxes released ### "

    '                            End If
    '                            u.BoxLength = Convert.ToInt32(row("L"))
    '                            u.BoxWidth = Convert.ToInt32(row("W"))
    '                            u.BoxHeight = Convert.ToInt32(row("H"))

    '                            If IsArmellini Or Trim(u.Carrier) = "FB" Then
    '                                u.Armellini = Convert.ToString(row("ARMELLINI"))
    '                            End If

    '                            'old query
    '                            '"select top 1 RecNo() as RecNo,* from F_RACKS WHERE SUBSTR(BARCODE,1,8)='{0}' And (LTRIM(RTRIM(Invoice))='' OR " +
    '                            '                                               "LTRIM(RTRIM(Invoice))='{1}') And RecNo() not in ({2}) Order by Invoice desc", BarcodeWithoutSeq, u.Order, IIf(AlreadyUpdatedRacks.Trim() = "", 0, AlreadyUpdatedRacks))

    '                            Using CmdRacks As New SqlCommand(String.Format("select top 1 A.* from (select * from F_RACKS WHERE SUBSTRING(BARCODE,1,8)='{0}' And (LTRIM(RTRIM(ISNULL(Invoice,'')))='' OR LTRIM(RTRIM(ISNULL(Invoice,'')))='{1}') ) as A where" +
    '                                                                                " A.SQL_ID not in ({2}) order by A.Invoice desc,SQL_ID", BarcodeWithoutSeq, u.Order, IIf(AlreadyUpdatedRacks.Trim() = "", 0, AlreadyUpdatedRacks)), Con)
    '                                CmdRacks.CommandType = CommandType.Text
    '                                CmdRacks.Transaction = Trans
    '                                Dim daRacks As New SqlDataAdapter(CmdRacks)
    '                                Dim dtRacks As New DataTable
    '                                daRacks.Fill(dtRacks)

    '                                For Each R In dtRacks.Rows
    '                                    'Above code Is replaced instead of following code :: cause of statement too long
    '                                    If AlreadyUpdatedRacks <> "" Then
    '                                        AlreadyUpdatedRacks = AlreadyUpdatedRacks + "," + Convert.ToString(R("SQL_ID"))
    '                                    Else
    '                                        AlreadyUpdatedRacks = Convert.ToString(R("SQL_ID"))
    '                                    End If

    '                                    If Convert.ToString(R("Invoice")) <> "" Then 'if invoice is not empty rack data already updated 

    '                                        'u.ARBoxNo = Convert.ToString(R("ARBOXNO"))
    '                                        'u.Rack = Convert.ToString(R("RACK"))

    '                                        If Convert.ToString(R("ARBOXNO")).Trim() = "" Then 'if arboxno empty refill the all data for that particular record
    '                                            If IsArmellini Or Trim(u.Carrier) = "FB" Then
    '                                                Dim ARBoxNo As String = GetArBoxNo()
    '                                                'Florida beauty
    '                                                'If Trim(u.Carrier) = "FB" Then
    '                                                'Try
    '                                                'ARBoxNo = ARBoxNo.PadLeft(7, "0")
    '                                                'Catch ex As Exception
    '                                                '    ARBoxNo = ARBoxNo
    '                                                'End Try

    '                                                'End If
    '                                                Using ExsCmd As New SqlCommand(String.Format("UPDATE F_RACKS Set Invoice=@Invoice,ID=@ID,Carrier=@Carrier,ARBoxNo=@ARBoxNo," +
    '                                                                            " Product=@Product,BoxSize=@BoxSize,Lenght=@Lenght,Width=@Width,Height=@Height,Consignee=@Consignee, " +
    '                                                                            " CUSTPO=@CUSTPO,UPDUSER=@UPDUSER,UPDAPP=@UPDAPP WHERE SQL_ID={0}", R("SQL_ID")), Con)
    '                                                    ExsCmd.CommandType = CommandType.Text
    '                                                    ExsCmd.Parameters.AddWithValue("@Invoice", u.Order)
    '                                                    ExsCmd.Parameters.AddWithValue("@ID", row("ID"))
    '                                                    ExsCmd.Parameters.AddWithValue("@Carrier", u.Carrier)
    '                                                    ExsCmd.Parameters.AddWithValue("@ARBoxNo", ARBoxNo)
    '                                                    ExsCmd.Parameters.AddWithValue("@Product", u.FlowerDetails.Name.Replace("'", "''"))
    '                                                    ExsCmd.Parameters.AddWithValue("@BoxSize", u.Armellini)
    '                                                    ExsCmd.Parameters.AddWithValue("@Lenght", u.BoxLength)
    '                                                    ExsCmd.Parameters.AddWithValue("@Width", u.BoxWidth)
    '                                                    ExsCmd.Parameters.AddWithValue("@Height", u.BoxHeight)
    '                                                    ExsCmd.Parameters.AddWithValue("@Consignee", u.Consignee)
    '                                                    ExsCmd.Parameters.AddWithValue("@CUSTPO", u.PO)
    '                                                    ExsCmd.Parameters.AddWithValue("@UPDUSER", UserName)
    '                                                    ExsCmd.Parameters.AddWithValue("@UPDAPP", "WEB")
    '                                                    ExsCmd.Transaction = Trans
    '                                                    ExsCmd.ExecuteNonQuery()
    '                                                End Using
    '                                                'u.ARBoxNo = ARBoxNo
    '                                            End If

    '                                        End If

    '                                    ElseIf u.Boxes > RackedCount Then

    '                                        EventLogsForRack += "Rack update process start for SQL_ID:" + Convert.ToString(R("SQL_ID")) + " ### "

    '                                        If IsArmellini Or Trim(u.Carrier) = "FB" Then

    '                                            Dim ARBoxNo As String = GetArBoxNo()


    '                                            Using ExsCmd As New SqlCommand(String.Format("UPDATE F_RACKS Set Invoice=@Invoice,ID=@ID,Carrier=@Carrier,ARBoxNo=@ARBoxNo," +
    '                                                                            " Product=@Product,BoxSize=@BoxSize,Lenght=@Lenght,Width=@Width,Height=@Height,Consignee=@Consignee, " +
    '                                                                            " CUSTPO=@CUSTPO,UPDUSER=@UPDUSER,UPDAPP=@UPDAPP WHERE SQL_ID={0}", R("SQL_ID")), Con)
    '                                                ExsCmd.CommandType = CommandType.Text
    '                                                ExsCmd.Parameters.AddWithValue("@Invoice", u.Order)
    '                                                ExsCmd.Parameters.AddWithValue("@ID", row("ID"))
    '                                                ExsCmd.Parameters.AddWithValue("@Carrier", u.Carrier)
    '                                                ExsCmd.Parameters.AddWithValue("@ARBoxNo", ARBoxNo)
    '                                                ExsCmd.Parameters.AddWithValue("@Product", u.FlowerDetails.Name.Replace("'", "''"))
    '                                                ExsCmd.Parameters.AddWithValue("@BoxSize", u.Armellini)
    '                                                ExsCmd.Parameters.AddWithValue("@Lenght", u.BoxLength)
    '                                                ExsCmd.Parameters.AddWithValue("@Width", u.BoxWidth)
    '                                                ExsCmd.Parameters.AddWithValue("@Height", u.BoxHeight)
    '                                                ExsCmd.Parameters.AddWithValue("@Consignee", u.Consignee)
    '                                                ExsCmd.Parameters.AddWithValue("@CUSTPO", u.PO)
    '                                                ExsCmd.Parameters.AddWithValue("@UPDUSER", UserName)
    '                                                ExsCmd.Parameters.AddWithValue("@UPDAPP", "WEB")
    '                                                ExsCmd.Transaction = Trans
    '                                                ExsCmd.ExecuteNonQuery()
    '                                            End Using

    '                                            EventLogsForRack += "Rack Details Updated For Armelini With ARBOXNO=" + ARBoxNo + " ### "

    '                                        Else
    '                                            Using ExsCmd As New SqlCommand(String.Format("UPDATE F_RACKS Set Invoice=@Invoice,ID=@ID WHERE SQL_ID={0}", R("SQL_ID")), Con)
    '                                                ExsCmd.CommandType = CommandType.Text
    '                                                ExsCmd.Parameters.AddWithValue("@Invoice", u.Order)
    '                                                ExsCmd.Parameters.AddWithValue("@ID", row("ID"))
    '                                                ExsCmd.Transaction = Trans
    '                                                ExsCmd.ExecuteNonQuery()
    '                                            End Using
    '                                            EventLogsForRack += "Rack Details Updated ### "
    '                                        End If

    '                                        Using ExsCmd As New SqlCommand(String.Format("UPDATE F_ORDER2 Set RACKED=RACKED+1 WHERE ID='{0}'", Convert.ToString(row("ID")), u.Boxes), Con)
    '                                            ExsCmd.CommandType = CommandType.Text
    '                                            ExsCmd.Transaction = Trans
    '                                            ExsCmd.ExecuteNonQuery()
    '                                        End Using
    '                                        RackedCount = RackedCount + 1
    '                                        EventLogsForRack += "Order2 Racked field incremented with one ### "

    '                                    End If

    '                                    Using ExsCmd As New SqlCommand(String.Format("select isnull(ARBOXNO,''),Rack from F_RACKS WHERE SQL_ID={0}", R("SQL_ID")), Con)
    '                                        ExsCmd.CommandType = CommandType.Text
    '                                        ExsCmd.Transaction = Trans
    '                                        Dim daRack As New SqlDataAdapter(ExsCmd)
    '                                        Dim dtRack As New DataTable
    '                                        daRack.Fill(dtRack)
    '                                        If dtRack.Rows.Count > 0 Then
    '                                            u.ARBoxNo = Convert.ToString(dtRack.Rows(0)(0).ToString())
    '                                            u.Rack = Convert.ToString(dtRack.Rows(0)(1).ToString())
    '                                        End If
    '                                    End Using
    '                                    EventLogsForRack += "Rack update completed for the SQL_ID " + Convert.ToString(R("SQL_ID")) + " ###"
    '                                    EventLogsForRack += "***--------------------------------*** ### "
    '                                Next
    '                            End Using

    '                        End If
    '                        uList.Add(u)

    '                    Next
    '                Next
    '            End Using

    '            AppendLog(EventLogsForRack, "GetShippingLabelDetails")
    '            Using ExsCmd As New SqlCommand(String.Format("UPDATE F_ORDER1 Set Printed=1, List=1 WHERE [ORDER] In ({0})", Order), Con)
    '                ExsCmd.CommandType = CommandType.Text
    '                ExsCmd.Transaction = Trans
    '                ExsCmd.ExecuteNonQuery()
    '            End Using

    '            Trans.Commit()
    '            Con.Close()
    '            Return uList
    '        Catch ex As Exception
    '            Trans.Rollback()
    '            ErrorLogs.LogException(ex, "Error In GetShippingLabelDetailsSQL")
    '            Dim uList1 As New List(Of BO.SalesDetail)
    '            Dim u As New BO.SalesDetail
    '            u.ErrorMessage = "Error In GetShippingLabelDetailsSQL DFlowerService  " + ErrorLogs.ExceptionHandling(ex, "GetShippingLabelDetailsSQL") + EventLogsForRack
    '            uList1.Add(u)
    '            Return uList1
    '            'Finally
    '            'Try
    '            '    File.Delete(DBFfilepath + "\" + TempRackTable + ".dbf")
    '            'Catch ex As Exception
    '            '    ErrorLogs.LogException(ex, "Error In GetShippingLabelDetails")
    '            'End Try

    '            'Using ConDel As New VfpConnection(DBFfilepath)
    '            '    ConDel.Open()
    '            '    Using TempRdCmd As New VfpCommand("drop table " + TempRackTable + "", ConDel)
    '            '        TempRdCmd.ExecuteNonQuery()
    '            '    End Using
    '            '    ConDel.Close()
    '            'End Using
    '        End Try
    '    End Using
    'End Function

    Public Shared Function CreatetxtShippingLabels(ByVal OrderNo As String, ByVal UserId As String) As String
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(Constr)
                Con.Open()
                Dim Qry As String = ""
                Using cmd As New SqlCommand("spCreatetxtShippingLabels", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ORDERNUM", OrderNo)
                    cmd.Parameters.AddWithValue("@USERID", UserId)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CreatetxtShippingLabels")
            Throw ex
        End Try
    End Function
    ''' <summary>
    ''' MANI::07/24/2018::Method to get the invoice history to show it on the grid
    ''' </summary>
    ''' <param name="OrderNo"></param>
    ''' <returns></returns>
    Public Shared Function GetInvoiceHistory(ByVal OrderNo As String) As List(Of BO.SalesCallHS)
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesCallHS As New List(Of BO.SalesCallHS)
            Using Con As New SqlConnection(Constr)
                Con.Open()



                Dim Qry As String = ""


                'Qry = String.Format("select customer,time,person,note,Date as CallHS_Date from F_IHISTORY where [ORDER]=@ORDER order by CallHS_Date desc,Time desc")

                Using cmd As New SqlCommand("spF_IHISTORYGet", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable

                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1

                    ds.Columns.Add(INCcolumn)
                    da.Fill(ds)
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim PagedDataSet As DataTable = Nothing
                    For Each row In ds.Rows
                        Dim u As New BO.SalesCallHS
                        u.CUSTOMER = row("Customer")
                        u.CallHS_DATE = row("CallHS_Date")
                        u.CallHS_TIME = row("Time")
                        u.PERSON = row("Person")
                        u.NOTE = row("Note")
                        u.TotalRows = TotalCount
                        ulistsalesCallHS.Add(u)
                    Next

                End Using
            End Using
            Return ulistsalesCallHS
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvoiceHistory")
            Throw ex
        End Try

    End Function


    Public Shared Function UpdateActivityLogForOrderReports(ByVal Orders As Object, ByVal UserEmail As String, ByVal UserName As String, ByVal PrintedReports As Object, ByVal IP As String) As String
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            For Each Report In PrintedReports
                For Each Order In Orders
                    Using Con As New SqlConnection(Constr)
                        Con.Open()
                        Dim Customer As Integer = 0
                        Dim PO As String = ""
                        Dim Carrier As String = ""
                        Dim ShipDate As New Date()

                        Using Cmd As New SqlCommand("spGetCustomerfromF_ORDER1", Con)
                            Cmd.CommandType = CommandType.StoredProcedure
                            Cmd.Parameters.AddWithValue("order", Order)
                            Dim da As New SqlDataAdapter(Cmd)
                            Dim dt As New DataTable
                            da.Fill(dt)
                            If dt.Rows.Count > 0 Then
                                Customer = dt.Rows(0)(0)
                                PO = dt.Rows(0)(1)
                                Carrier = dt.Rows(0)(2)
                                ShipDate = dt.Rows(0)(3)
                            End If
                        End Using

                        'Using DBFCmd As New SqlCommand("Insert into F_IHISTORY ([ORDER],CUSTOMER,DATE,TIME,NOTE,PERSON) values (@Order,@CUSTOMER,@DATE,@TIME,@NOTE,@PERSON)", Con)
                        Using DBFcmd As New SqlCommand("SPF_IHISTORYInsert", Con)
                            DBFcmd.CommandType = CommandType.StoredProcedure

                            DBFcmd.Parameters.AddWithValue("@Order", Order)
                            DBFcmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                            DBFcmd.Parameters.AddWithValue("@NOTE", Report + " generated for Invoice# " + Order + IIf(PO = "", "", ", PO# " + PO) + " Carrier: " + Carrier + ", Shipdate " +
                                                                              ShipDate.ToShortDateString() + " , by " + UserEmail + " from " + IP + "")
                            DBFcmd.Parameters.AddWithValue("@PERSON", UserName)
                            DBFcmd.ExecuteNonQuery()
                        End Using

                    End Using

                Next
            Next
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateActivityLogForOrderReports")
            Return Nothing
        End Try
    End Function

    Public Shared Function AppendLog(Message As String, ErrorPage As String) As String
        Try
            Dim LogPath As String = System.Web.HttpContext.Current.Server.MapPath("~/Log/")

            If Not Directory.Exists(LogPath) Then
                Directory.CreateDirectory(LogPath)
            End If

            Dim filename As String = "EventLog_" + DateTime.Now.ToString("dd-MM-yyyy") + ".txt"
            Dim filepath As String = LogPath & filename
            If File.Exists(filepath) Then
                Using writer As New StreamWriter(filepath, True)
                    writer.WriteLine("-------------------START-------------")
                    writer.WriteLine(DateTime.Now)
                    writer.WriteLine("Source :" + ErrorPage)
                    writer.WriteLine("Message :" + Message)
                    writer.WriteLine("-------------------END-------------")
                End Using
            Else
                Dim writer As StreamWriter = File.CreateText(filepath)
                writer.WriteLine("-------------------START-------------")
                writer.WriteLine(DateTime.Now)
                writer.WriteLine("Source :" + ErrorPage)
                writer.WriteLine("Message :" + Message)
                writer.WriteLine("-------------------END-------------")
                writer.Close()
            End If

            Return ""
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Service::AppendLog")
            Return ""
        End Try
    End Function

    Public Shared Function GetArBoxNo() As String
        Try
            Dim uList As New List(Of BO.Flowers)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("SpGetARBoxNoFromArmelliniSeq", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Dim adp As New SqlDataAdapter(Cmd)
            Dim dt As New DataTable
            adp.Fill(dt)
            If dt.Rows.Count > 0 Then
                Return dt.Rows(0)(0)
            End If
            Return 0
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSequenceForArBoxNo")
            Throw ex
        End Try
    End Function

    Public Shared Function GenerateInsertQuery(ByVal TableName As String, Fields As Hashtable) As String
        Try
            Dim DBFfilepath As String = ConfigurationManager.AppSettings("DBFPath").ToString() + ""
            Using Con As New SqlConnection(DBFfilepath)
                Con.Open()
                Using Cmd As New SqlCommand("select * from " + TableName, Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataTable
                    da.FillSchema(ds, SchemaType.Mapped)
                    Dim SelectColumns As String = ""
                    Dim InsertColumns As String = ""
                    Dim Query As String = ""
                    For Each Col As DataColumn In ds.Columns
                        SelectColumns += Col.ColumnName + ", "
                        Dim InsertValue As String = ""
                        Dim datatype As String = Col.DataType.ToString()
                        If datatype = "System.Integer" Then
                            InsertValue = "0"
                        ElseIf datatype = "System.String" Then
                            InsertValue = "''"
                        ElseIf datatype = "System.Decimal" Then
                            InsertValue = "0"
                        ElseIf datatype = "System.Boolean" Then
                            InsertValue = True
                        ElseIf datatype = "System.DateTime" Then
                            'InsertValue = "'Ctod(" + System.DateTime.Now.ToString("MM/dd/yyyy") + ")'"
                            InsertValue = "{'^1900-01-01'}"
                        End If
                        If Fields.Contains(Col.ColumnName.ToUpper()) Then
                            Dim Value As String = Fields.Item(Col.ColumnName.ToUpper())
                            If datatype = "System.String" And (Value.Contains("@") = False) Then
                                Value = "'" + Value + "'"
                            ElseIf datatype = "System.DateTime" And (Value.Contains("@") = False) Then
                                Value = "Ctod('" + Convert.ToDateTime(Value).ToString("MM/dd/yyyy") + "')"
                            End If
                            InsertColumns += Value + ", "
                        Else
                            InsertColumns += InsertValue + ", "
                        End If

                    Next
                    SelectColumns = SelectColumns.Remove(SelectColumns.Length - 2, 1)
                    InsertColumns = InsertColumns.Remove(InsertColumns.Length - 2, 1)
                    Query = "Insert into " + TableName + " (" + SelectColumns + ") values (" + InsertColumns + ")"
                    Return Query
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GenerateInsertQuery")
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function GetScannedDetails_FG(ByVal Invoice As String) As List(Of BO.SalesDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using cmd As New SqlCommand("spGetScannedDetails", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@order", Invoice)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable


                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1
                    dt.Columns.Add(INCcolumn)
                    da.Fill(dt)

                    Dim TotalCount As Integer = dt.Rows.Count
                    Dim TotalBoxes As Integer = 0
                    Dim TotalScanned As Integer = 0
                    Dim TotalMissing As Integer = 0




                    For Each row In dt.Rows
                        Dim u As New BO.SalesDetail
                        u.RowNo = row("RECNO")
                        u.Order = row("ORDER")
                        u.FarmCode = row("FARMCODE")
                        u.Flower = row("FLOWER")
                        u.FlowerDetails.Name = row("NAME")
                        u.FlowerDetails.BGColor = row("BGCOLOR")
                        u.FlowerDetails.FontColor = row("FONTCOLOR")
                        u.Boxes = Convert.ToInt32(row("BOXES"))
                        u.UOM = row("UOM")
                        u.Units = row("Units")
                        u.UnitsBunch = row("UNITSBUNCH")
                        u.BoxNum = row("BOXNUM")
                        Dim count As Integer = 0
                        u.ScannedBox = row("ScannedBox")
                        u.MissingBox = u.Boxes - row("ScannedBox")
                        TotalBoxes += u.Boxes
                        TotalScanned += u.ScannedBox
                        TotalMissing += u.MissingBox
                        ulistsalesDetails.Add(u)
                    Next


                    Dim po As New BO.SalesDetail()
                    po.RowNo = 0
                    po.Order = 0
                    po.FarmCode = ""
                    po.Boxes = TotalBoxes
                    po.Flower = ""
                    po.FlowerDetails.Name = ""
                    po.FlowerDetails.BGColor = ""
                    po.FlowerDetails.FontColor = ""
                    po.UOM = ""
                    po.Units = 0
                    po.UnitsBunch = 0
                    po.ScannedBox = TotalScanned
                    po.MissingBox = TotalMissing
                    ulistsalesDetails.Add(po)

                End Using
            End Using
            Return ulistsalesDetails
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetScannedDetails_FG")
            Throw ex
        End Try

    End Function

    ''' <summary>
    ''' Anitha :: 23-Oct-2018 :: release racks for selected order
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <returns></returns>
    Public Shared Function ReleaseRacksforOrder(ByVal Order As String) As String
        Try
            Dim Constr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(Constr)
                Con.Open()
                Using Cmd As New SqlCommand("spReleaseRacksforOrder", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("Order", Order)
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    ''' <summary>
    ''' Anitha :: 29-Oct-2018 :: Get Order List/Printed/Scanned/Bills for given Order
    ''' </summary>
    ''' <param name="OrderNo"></param>
    ''' <returns></returns>
    Public Shared Function GetOrderflagsbyOrderNo(ByVal OrderNo As Integer) As BO.SalesHeader
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim U As New BO.SalesHeader()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                '' replace with "spGetOrderHeaderInfoByOrderNo"
                Using Cmd As New SqlCommand("spGetOrderHeaderInfoByOrderNo", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("OrderNo", OrderNo)
                    Dim ordReader = Cmd.ExecuteReader()
                    While (ordReader.Read())
                        U.Printed = ordReader("PRINTED")
                        U.Bills = ordReader("Bills")
                        U.Scanned = ordReader("Scanned")
                        U.List = ordReader("List")
                        U.Carrier = ordReader("CARRIER")
                        U.Shipto = ordReader("SHIPTO")
                    End While
                End Using
            End Using
            Return U
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetOrderflagsbyOrderNo")
            Throw ex
        End Try
    End Function
    Public Shared Function GetConsigneebyOrderNo(ByVal OrderNo As Integer, ByVal ShipTo As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim U As New BO.SalesHeader()
            Dim consignee As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetConsignee", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@Order", OrderNo)
                    Cmd.Parameters.AddWithValue("@ShipTo", ShipTo)
                    Dim ordReader = Cmd.ExecuteReader()
                    While (ordReader.Read())
                        consignee = ordReader("ACCOUNT")
                    End While
                End Using
            End Using
            Return consignee
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetConsigneebyOrderNo")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Anitha :: 14-Nov-2018 :: Clear the Scanned Orders
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function ClearGun() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("truncate table tblInvOrderDetails", Con)
                    Cmd.CommandType = CommandType.Text
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ClearGun")
            Throw ex
        End Try
    End Function
    ''' <summary>
    ''' Clear the rows in tblBarcodes
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function CleartblBarcodes() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("truncate table tblBarcodes", Con)
                    Cmd.CommandType = CommandType.Text
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In CleartblBarcodes")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Anitha :: 29-Jan-2019 :: Get message from msg inv
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function GetMessagesfromMsgINV() As BO.F_MsgInv
        Try
            Dim msginv As New BO.F_MsgInv
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("select text1,text2,text3,text4,text5 from f_msginv", Con)
                    Cmd.CommandType = CommandType.Text
                    Dim sdr = Cmd.ExecuteReader()
                    If sdr.HasRows Then
                        While sdr.Read
                            msginv.Text1 = sdr("Text1")
                            msginv.Text2 = sdr("Text2")
                            msginv.Text3 = sdr("Text3")
                            msginv.Text4 = sdr("Text4")
                            msginv.Text5 = sdr("TEXT5")
                        End While
                    End If
                End Using
            End Using
            Return msginv
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetMessagesfromMsgINV")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Abinaya :: 05-Feb-2019 :: Save message from Invoice message maintenance
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function SaveMessagesfromMsgINV(ByVal Text1 As String, ByVal Text2 As String, ByVal Text3 As String, ByVal Text4 As String, ByVal Text5 As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("IF EXISTS (SELECT * FROM f_msginv) update f_msginv set Text1=@Text1,Text2=@Text2,Text3=@Text3,Text4=@Text4,Text5=@Text5  ELSE INSERT INTO f_msginv(Text1,Text2,Text3,Text4,Text5) values(@Text1,@Text2,@Text3,@Text4,@Text5)", Con)
                    Cmd.CommandType = CommandType.Text
                    Cmd.Parameters.AddWithValue("@Text1", Text1)
                    Cmd.Parameters.AddWithValue("@Text2", Text2)
                    Cmd.Parameters.AddWithValue("@Text3", Text3)
                    Cmd.Parameters.AddWithValue("@Text4", Text4)
                    Cmd.Parameters.AddWithValue("@Text5", Text5)
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In SaveMessagesfromMsgINV")
            Throw ex
        End Try
    End Function


    ''' <summary>
    ''' Anitha :: 12-Mar-2019 :: Get Order Date for given Order
    ''' Anubhuti  6-
    ''' </summary>
    ''' <param name="OrderNo"></param>
    ''' <returns></returns>
    Public Shared Function GetOrderDateByrderNo(ByVal OrderNo As String) As BO.SalesHeader
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ShippingDate As New BO.SalesHeader
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetOrderDateByOrderNo", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    Dim ordReader = Cmd.ExecuteReader()
                    While (ordReader.Read())
                        ShippingDate.ShippingDate = If(ordReader("OrderDate") Is DBNull.Value, "01/01/1900", ordReader("OrderDate"))
                        ShippingDate.VOID = If(ordReader("Void") Is DBNull.Value, "", ordReader("Void"))
                    End While
                End Using
            End Using
            Return ShippingDate
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetOrderDateByrderNo")
            Throw ex
        End Try
    End Function
    ' Muthu Nivetha M :: 16 Mar 19 :: Print Label on look up by boxnumber results screen
    Public Shared Function GetOrdersByFarmandBoxnum(ByVal Farm As String, ByVal BoxNum As String) As List(Of BO.SalesDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim salesDetail As New BO.SalesDetail
            Dim salesDetaillist As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetOrdersByFarmandBoxnum", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@Farm", Farm)
                    Cmd.Parameters.AddWithValue("@Boxnum", BoxNum)
                    Dim detOdr = Cmd.ExecuteReader()
                    While (detOdr.Read())
                        salesDetail.FarmCode = Farm
                        salesDetail.BoxNum = BoxNum
                        salesDetail.Order = detOdr("Order")
                        salesDetail.ID = detOdr("ID")
                        salesDetail.ShippingDate = detOdr("DATE")
                        salesDetail.CustCode = detOdr("CUSTOMER")
                        salesDetail.IsVET = detOdr("IsVET")
                        salesDetaillist.Add(salesDetail)
                        'salesDetail.CustName = detOdr("CustName")
                    End While
                End Using
            End Using
            Return salesDetaillist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetOrdersByFarmandBoxnum")
            Throw ex
        End Try
    End Function
    Public Shared Function CheckIsSalesPersonSameForNewOrder(ByVal Customer As String, ByVal userid As Integer) As List(Of String)
        Dim value As New List(Of String)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                'Muthu Nivetha M :: 18 Mar 19 ::  Locks up system :: Sales-Person
                Using cmd As New SqlCommand("spCheckIsSalesPersonSameForNewOrder", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@customer", Customer)
                    cmd.Parameters.AddWithValue("@userid", userid)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    If ds.Rows.Count > 0 Then
                        value.Add(IIf(ds.Rows(0)("UserID") = userid, "1", "0"))
                    Else
                        value.Add("1")
                    End If
                End Using
            End Using
            Return value
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In CheckIsSalesPersonSameForNewOrder")
            value.Add("0")
            'value.Add(IIf(ex.InnerException.ToString() IsNot Nothing, ex.InnerException.ToString(), ex.ToString()))
            If ex.InnerException IsNot Nothing Then
                value.Add(ex.InnerException.ToString())
            Else
                value.Add(ex.ToString())
            End If
            Return value
        End Try
    End Function

    Public Shared Function PrintSalesSummaryReport(ByVal FromDate As String, ToDate As String, ByVal Flower As String, ByVal Category As String, Grade As String, ByVal Variety As String, ByVal Color As String, ByVal Farm As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                'Muthu Nivetha M :: 18 Mar 19 ::  Locks up system :: Sales-Person
                Using cmd As New SqlCommand("spSalesSummaryReport", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate)
                    cmd.Parameters.AddWithValue("@ToDate", ToDate)
                    cmd.Parameters.AddWithValue("@Flower", Flower)
                    cmd.Parameters.AddWithValue("@Category", Category)
                    cmd.Parameters.AddWithValue("@Grade", Grade)
                    cmd.Parameters.AddWithValue("@Variety", Variety)
                    cmd.Parameters.AddWithValue("@Color", Color)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryReport")
            Return Nothing
        End Try
    End Function

    Public Shared Function PrintSalesSummaryBySalesPersonReport(ByVal FromDate As String, ToDate As String, ByVal Farm As String, ByVal SalesPerson As String, ByVal ReportType As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spReportSalesBySalesPersonwise", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate)
                    cmd.Parameters.AddWithValue("@ToDate", ToDate)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.Parameters.AddWithValue("@SalesPerson", SalesPerson)
                    cmd.Parameters.AddWithValue("@ReportType", ReportType)
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryBySalesPersonReport")
            Return Nothing
        End Try
    End Function

    Public Shared Function PrintSalesSummaryReportByDay(ByVal FromDate As String, ToDate As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spGetsalesbyday", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate)
                    cmd.Parameters.AddWithValue("@ToDate", ToDate)
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

    Public Shared Function PrintSalesSummaryReportByState(ByVal FromDate As String, ToDate As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spGetsalesbyState", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate)
                    cmd.Parameters.AddWithValue("@ToDate", ToDate)
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryReportByState")
            Return Nothing
        End Try
    End Function
    Public Shared Function PrintSalesSummaryReportByState(ByVal FromDate As String, ToDate As String, ByVal Farm As String, ByVal SalesPerson As String, ByVal ReportType As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spReportSalesByState", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate)
                    cmd.Parameters.AddWithValue("@ToDate", ToDate)
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryReportByState")
            Return Nothing
        End Try
    End Function
    Public Shared Function PrintGPMCalcToExcel(ByVal FromDate As String, ToDate As String, ByVal SalesPerson As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spGPMCalc", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate)
                    cmd.Parameters.AddWithValue("@ToDate", ToDate)
                    cmd.Parameters.AddWithValue("@SalesMan", Int32.Parse(SalesPerson))
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintGPMCalcToExcel")
            Return Nothing
        End Try
    End Function
    Public Shared Function PrintGPMBouqCalcToExcel(ByVal FromDate As String, ToDate As String, ByVal SalesPerson As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spGPMCalcBouq", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate)
                    cmd.Parameters.AddWithValue("@ToDate", ToDate)
                    cmd.Parameters.AddWithValue("@SalesMan", Int32.Parse(SalesPerson))
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintGPMCalcToExcel")
            Return Nothing
        End Try
    End Function
    Public Shared Function PrintSalesSummaryByCustomer() As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spReportGetCustomerMonthlySales", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryByCustomer")
            Return Nothing
        End Try
    End Function


    Public Shared Function PrintSalesSummaryBySalesManByMonthToExcel() As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spReportGetSalesPersonwiseMonthlySales", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryBySalesManByMonthToExcel")
            Return Nothing
        End Try
    End Function

    Public Shared Function PrintSalesSummaryBySalesManToExcel() As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spReportGetMonthlySalesBySalesManwise", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryBySalesManToExcel")
            Return Nothing
        End Try
    End Function

    Public Shared Function PrintSalesSummaryByCustomerGroup() As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spReportGetMonthlySalesByCustomerGroup", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryByCustomerGroup")
            Return Nothing
        End Try
    End Function
    Public Shared Function PrintSalesSummaryByFarm() As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spReportGetFarmMonthlySales", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryByFarm")
            Return Nothing
        End Try
    End Function
    Public Shared Function PrintSalesSummaryByCategory() As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spReportGetCategoryMonthlySales", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryByCategory")
            Return Nothing
        End Try
    End Function
    Public Shared Function PrintInventoryAvailabilityReportToExcel(ByVal MarketToIgnore As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim Qry As String = ""
                Using cmd As New SqlCommand("spReportAvailableInventory", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@MarketToIgnore", MarketToIgnore)
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                    ds.Columns.RemoveAt(0)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintInventoryAvailabilityReportToExcel")
            Return Nothing
        End Try
    End Function

    Public Shared Function PrintSalesSummaryByProduct() As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spReportGetProductMonthlySales", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintSalesSummaryByProduct")
            Return Nothing
        End Try
    End Function

    Public Shared Function ConfirmInvoiceByPaymentTerms(ByVal InvoiceList As String, ByVal UserName As String) As String
        Try
            Dim hostName As String = System.Net.Dns.GetHostName()
            Dim myIPs As System.Net.IPHostEntry = System.Net.Dns.GetHostEntry(hostName)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spConfirmInvoiceListByPaymentTerms", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@InvoiceList", InvoiceList)
                    Cmd.Parameters.AddWithValue("@USERNAME", UserName)
                    Cmd.Parameters.AddWithValue("@IPAddress", myIPs.AddressList(1).ToString())

                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ConfirmInvoiceByPaymentTerms")
            Throw ex
        End Try
    End Function

    Public Shared Function SavePODFileInformationForInvoice(ByVal Invoice As String, ByVal FilePath As String, ByVal UserName As String) As String
        Try
            Dim hostName As String = System.Net.Dns.GetHostName()
            Dim myIPs As System.Net.IPHostEntry = System.Net.Dns.GetHostEntry(hostName)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spInsertPOD", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@INVOICE", Invoice)
                    Cmd.Parameters.AddWithValue("@FILEPATH", FilePath)
                    Cmd.Parameters.AddWithValue("@ADDUSER", UserName)

                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ConfirmInvoiceByPaymentTerms")
            Throw ex
        End Try
    End Function

    Public Shared Function GetDonotShowCargoDateValueFromConstant() As Boolean
        Try
            Dim ds As New DataSet
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetDoNotShowCargoDateValueFromConstant", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(Cmd)
                    da.Fill(ds)
                End Using
            End Using
            If ds.Tables.Count > 0 Then
                Return ds.Tables(0)(0)("DONOTSHOWCARGODATE")
            Else
                Return False
            End If
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetDonotShowCargoDateValueFromConstant of SalesOrder.vb")
            Return "Error~" + ex.Message.ToString()
        End Try
    End Function

    Public Shared Function GetConstantForShowAwbOnOrderGrid() As Boolean
        Try
            Dim ds As New DataSet
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetShowawbinordergridValueFromConstant", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(Cmd)
                    da.Fill(ds)
                End Using
            End Using
            If ds.Tables.Count > 0 Then
                Return ds.Tables(0)(0)("Showawbinordergrid")
            Else
                Return False
            End If
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetConstantForShowAwbOnOrderGrid of SalesOrder.vb")
            Return "Error~" + ex.Message.ToString()
        End Try
    End Function
    'SOFIA: 02/08/2021 - show / hide buttons when option is selected
    Public Shared Function GetConstantForShowStandingOrderAndAlocation() As Boolean
        Try
            Dim ds As New DataSet
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetSHOWSTANDINGORDERANDALLOCATIONValueFromConstant", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(Cmd)
                    da.Fill(ds)
                End Using
            End Using

            If ds.Tables.Count > 0 Then
                If ds.Tables(0)(0)("SHOWSTANDINGORDERANDALLOCATION").ToString = "1" Or ds.Tables(0)(0)("SHOWSTANDINGORDERANDALLOCATION").ToString().ToLower() = "true" Then
                    Return 1
                Else
                    Return 0
                End If
            Else
                Return 0
            End If

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetConstantForShowStandingOrderAndAlocation of SalesOrder.vb")
            Return "Error~" + ex.Message.ToString()
        End Try
    End Function

    Public Shared Function GeneratePrimeEDIFiles(ByVal Shipdate As String, ByVal Carrier As String) As String
        Try
            Dim ds As New DataSet
            Dim TableCnt As Integer = 0
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("SPGETPRIMEINVOICESBYSHIPDATE_NEW", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@SHIPDATE", Shipdate)
                    Cmd.Parameters.AddWithValue("@CARRIER", Carrier)
                    Dim da As New SqlDataAdapter(Cmd)
                    da.Fill(ds)
                    TableCnt = ds.Tables.Count - 1

                    Dim Str As String = ""
                    For Each row In ds.Tables(TableCnt).Rows()
                        Str += row("TEXTLINE").ToString() + " \n"
                    Next

                    Dim uniEncoding As UnicodeEncoding = New UnicodeEncoding()
                    Using memStream As MemoryStream = New MemoryStream(ASCIIEncoding.Default.GetBytes(Str))
                        Dim request As FtpWebRequest =
                        WebRequest.Create("ftp://ftp.gts.globalec.com/send/commit/PRIMEWEB.TXT")
                        request.Credentials = New NetworkCredential("SWZCP001", "QZ9MC13Z'8")
                        request.Method = WebRequestMethods.Ftp.UploadFile
                        Using ftpStream As Stream = request.GetRequestStream()
                            memStream.CopyTo(ftpStream)
                        End Using
                        Dim strOutput As String = ""
                        strOutput = Encoding.ASCII.GetString(memStream.ToArray())
                        Console.WriteLine(strOutput)
                    End Using

                End Using
            End Using
            Return "Success~File has been uploaded"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ConfirmInvoiceByPaymentTerms")
            Return "Error~" + ex.Message.ToString()
        End Try
    End Function


    Public Class GetSalesOrderHeader
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Private _TotalBoxes As Integer
        Public Property TotalBoxes() As Integer
            Get
                Return _TotalBoxes
            End Get
            Set(ByVal value As Integer)
                _TotalBoxes = value
            End Set
        End Property

        Private _TotalInvAmount As Decimal
        Public Property TotalInvAmount() As Decimal
            Get
                Return _TotalInvAmount
            End Get
            Set(ByVal value As Decimal)
                _TotalInvAmount = value
            End Set
        End Property

        Private _TotalFobAmount As Decimal
        Public Property TotalFobAmount() As Decimal
            Get
                Return _TotalFobAmount
            End Get
            Set(ByVal value As Decimal)
                _TotalFobAmount = value
            End Set
        End Property

        Private _TotalInvCostAmount As Decimal
        Public Property TotalInvCostAmount() As Decimal
            Get
                Return _TotalInvCostAmount
            End Get
            Set(ByVal value As Decimal)
                _TotalInvCostAmount = value
            End Set
        End Property

        Private _TotalInvCost As Decimal
        Public Property TotalInvCost() As Decimal
            Get
                Return _TotalInvCost
            End Get
            Set(ByVal value As Decimal)
                _TotalInvCost = value
            End Set
        End Property

        Private _TotalFBE As Decimal
        Public Property TotalFBE() As Decimal
            Get
                Return _TotalFBE
            End Get
            Set(ByVal value As Decimal)
                _TotalFBE = value
            End Set
        End Property

        Private _TotalUnits As Integer
        Public Property TotalUnits() As Integer
            Get
                Return _TotalUnits
            End Get
            Set(ByVal value As Integer)
                _TotalUnits = value
            End Set
        End Property

        '
        Private _TotalCost As Decimal
        Public Property TotalCost() As Decimal
            Get
                Return _TotalCost
            End Get
            Set(ByVal value As Decimal)
                _TotalCost = value
            End Set
        End Property


        Private _Totalgpm As Decimal
        Public Property Totalgpm() As Decimal
            Get
                Return _Totalgpm
            End Get
            Set(ByVal value As Decimal)
                _Totalgpm = value
            End Set
        End Property

        ''' <summary>
        '''  ANITHA :: 03-MAR-2018 :: BLOOM-20538 :: Order Header Grid move to SQL :: Header Grid from SQL
        '''  Muthu Nivetha M :: 15Feb2020 :: Added Columns L,W,H,Cubes to show Cubes on Order
        '''  Muthu Nivetha M :: 15Feb2020 :: Added Column Weight to display on Order
        ''' </summary>
        ''' <param name="whereClause"></param>
        ''' <param name="sortExp"></param>
        ''' <param name="startRowIndex"></param>
        ''' <param name="numberOfRows"></param>
        ''' <param name="FilterDivision"></param>
        ''' <returns></returns>
        Public Function GetSalesOrderHeaderList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                     ByVal numberOfRows As Integer, ByVal FilterDivision As String, ByVal HistoryRecordsOnly As String, ByVal qsearchFilters As String) As List(Of BO.SalesHeader)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim ulistsalesheader As New List(Of BO.SalesHeader)
                Dim TotalInvAmount As Decimal = 0
                Dim TotalGPM As Decimal = 0
                Dim TotalFOBAmount As Decimal = 0
                Dim TotalInvCost As Decimal = 0
                Dim TotalCubes As Decimal = 0
                Dim TotalWeight As Int32 = 0
                Using Con As New SqlConnection(ConStr)
                    Con.Open()
                    If sortExp = "" Or sortExp = Nothing Then
                        sortExp = "[Order]"
                    End If
                    Using cmd As New SqlCommand("spSalesHeaderListforGrid", Con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@WhereClause", whereClause)
                        cmd.Parameters.AddWithValue("@SortExpression", sortExp)
                        cmd.Parameters.AddWithValue("@HistoryRecordsOnly", HistoryRecordsOnly)
                        cmd.Parameters.AddWithValue("@qsearchFilters", qsearchFilters)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataTable
                        Dim INCcolumn As New DataColumn()
                        INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                        INCcolumn.ColumnName = "RECNO"
                        INCcolumn.AutoIncrement = True
                        INCcolumn.AutoIncrementSeed = 1
                        INCcolumn.AutoIncrementStep = 1
                        ds.Columns.Add(INCcolumn)
                        da.Fill(ds)
                        Dim TotalCount As Integer = ds.Rows.Count
                        Dim TotalUnits As Integer = 0
                        Dim TotalFBE As Decimal = 0
                        If (ds.Rows.Count > 0) Then
                            TotalUnits = ds.Compute("Sum(BOXES)", "")
                            TotalInvAmount = ds.Compute("Sum(INVAMOUNT)", "")
                            TotalFOBAmount = ds.Compute("Sum(FOBAMOUNT)", "")
                            TotalInvCost = ds.Compute("Sum(INVCOST)", "")
                            If (TotalFOBAmount <> 0) Then
                                TotalGPM = ((TotalFOBAmount - TotalInvCost) / TotalFOBAmount) * 100
                            End If
                            TotalCubes = ds.Compute("Sum(Cubes)", "")
                            TotalWeight = ds.Compute("Sum(WEIGHT)", "")
                        End If
                        Dim PagedDataSet As DataTable = Nothing
                        If TotalCount <> 0 And startRowIndex <> 0 Then
                            If (TotalCount <> startRowIndex) Then
                                PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + (startRowIndex + numberOfRows).ToString() + "").CopyToDataTable()
                            Else
                                PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + startRowIndex.ToString() + "").CopyToDataTable()
                            End If
                            For Each row In PagedDataSet.Rows
                                Dim u As New BO.SalesHeader
                                u.RowNo = row("RECNO")
                                u.Order = row("ORDER")
                                u.Customer = Convert.ToString(row("CUSTOMER"))
                                u.CustomerName = Convert.ToString(row("CustomerName"))
                                u.AWB = row("AWB").ToString()
                                u.OrderDate = row("OrderDate")
                                u.Carrier = Convert.ToString(row("CARRIER"))
                                u.State = Convert.ToString(row("STATE"))
                                u.Printed = row("PRINTED")
                                u.List = row("LIST")
                                u.Scanned = row("SCANNED")
                                u.Shipto = Convert.ToString(row("SHIPTONAME"))
                                u.ShiptoAddress1 = Convert.ToString(row("SHIPTOADD1"))
                                u.ShiptoAddress2 = Convert.ToString(row("SHIPTOADD2"))
                                u.ShiptoCity = Convert.ToString(row("SHIPTOCITY"))
                                u.ShiptoState = Convert.ToString(row("SHIPTOST"))
                                u.ShiptoZip = Convert.ToString(row("SHIPTOZIP"))
                                u.PO = row("PO")
                                If (Convert.ToString(row("BOXES")) <> "") Then
                                    u.Boxes = Convert.ToDecimal(row("BOXES"))
                                Else
                                    u.Boxes = 0
                                End If
                                u.FBE = row("FBE")
                                u.SalesManEmail = Convert.ToString(row("SALESMANEMAIL"))
                                u.SalesManName = Convert.ToString(row("SalesManName"))
                                If IsDBNull(row("SCANNEDBOX")) Then
                                    u.ScannedBox = u.Boxes
                                Else
                                    u.ScannedBox = u.Boxes - row("SCANNEDBOX")
                                End If
                                u.SLSMAN = Convert.ToString(row("F1Saleman"))
                                u.Day = IIf(Convert.ToDateTime(u.OrderDate) = DateTime.Now.Date, "Today", Convert.ToDateTime(u.OrderDate).DayOfWeek.ToString())
                                u.FontColor = Convert.ToString(row("FontColor"))
                                u.BGColor = Convert.ToString(row("Bgcolor"))
                                u.ColorCode = Convert.ToString(row("ColorCode"))
                                u.TotalRows = TotalCount
                                TotalFBE += u.FBE
                                If (Convert.ToString(row("INVAMOUNT")) <> "") Then
                                    u.InvAmount = Convert.ToDecimal(row("INVAMOUNT"))
                                Else
                                    u.InvAmount = 0
                                End If
                                If (Convert.ToString(row("GPM")) <> "") Then
                                    u.GPM = Convert.ToDecimal(row("GPM"))
                                End If
                                u.cInvenType = row("cInvenType")
                                u.Confirmed = row("Confirmed")
                                u.VOID = Convert.ToString(row("VOID"))
                                u.Bills = row("Bills")
                                u.SHIPPED = row("SHIPPED")
                                u.WH = Convert.ToString(row("WH"))
                                u.Country = Convert.ToString(row("COUNTRY"))
                                u.InvCost = row("INVCOST")
                                u.FobAmount = row("FOBAMOUNT")
                                u.Terms = Convert.ToString(row("Terms"))
                                u.IsClosedOrder = row("ClosedOrder")
                                u.HOLD = If(row("HOLD") = "Y", True, False)
                                u.ORDERUPDATEFLAG = row("ORDERUPDATEFLAG")
                                'not needed  09/27/2021
                                'u.SalesDet.BoxLength = If(row("L") Is DBNull.Value, 0, row("L"))
                                'u.SalesDet.BoxHeight = If(row("H") Is DBNull.Value, 0, row("H"))
                                'u.SalesDet.BoxWidth = If(row("W") Is DBNull.Value, 0, row("W"))
                                u.Cubes = If(row("Cubes") Is DBNull.Value, 0, row("Cubes"))
                                u.Weight = If(row("WEIGHT") Is DBNull.Value, 0, row("WEIGHT"))
                                u.PODFILE = row("PODFILE")
                                u.Emailed = If(row("Emailed") Is DBNull.Value, "", Convert.ToString(row("Emailed")))
                                ulistsalesheader.Add(u)
                            Next
                        End If
                        Dim sh As New BO.SalesHeader()
                        sh.RowNo = 0
                        sh.Order = 0
                        sh.Customer = 0
                        sh.CustomerName = ""
                        sh.OrderDate = DateTime.Now.ToString()
                        sh.Carrier = ""
                        sh.State = ""
                        sh.Printed = False
                        sh.List = False
                        sh.Scanned = False
                        sh.Bills = False
                        sh.Shipto = ""
                        sh.ShiptoAddress1 = ""
                        sh.ShiptoAddress2 = ""
                        sh.ShiptoCity = ""
                        sh.ShiptoState = ""
                        sh.ShiptoZip = ""
                        sh.PO = ""
                        sh.Boxes = TotalUnits
                        sh.FBE = TotalFBE
                        sh.SalesManEmail = ""
                        sh.SalesManName = ""
                        sh.ScannedBox = 0
                        sh.Day = ""
                        sh.FontColor = ""
                        sh.BGColor = ""
                        sh.ColorCode = ""
                        sh.TotalRows = TotalCount
                        sh.InvAmount = TotalInvAmount
                        sh.GPM = TotalGPM
                        sh.DetailsList = Nothing
                        sh.Confirmed = False
                        sh.VOID = ""
                        sh.Terms = ""
                        sh.Bills = False
                        sh.SHIPPED = False
                        sh.WH = ""
                        sh.Country = ""
                        sh.InvCost = 0
                        sh.FobAmount = 0
                        sh.HOLD = False
                        sh.Cubes = TotalCubes
                        sh.SalesDet.BoxLength = 0
                        sh.SalesDet.BoxWidth = 0
                        sh.SalesDet.BoxHeight = 0
                        sh.Weight = TotalWeight
                        sh.PODFILE = ""
                        ulistsalesheader.Add(sh)
                    End Using
                End Using
                Return ulistsalesheader
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetSalesOrderHeaderList")
                Throw ex
            End Try
        End Function


        Public Function GetSalesOrderForChart(ByVal whereClause As String, ByVal sortExp As String, ByVal HistoryRecordsOnly As String) As DataTable
            Try
                Dim dt As New DataTable
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using Con As New SqlConnection(ConStr)
                    Con.Open()

                    If sortExp = "" Or sortExp = Nothing Then
                        sortExp = "[Order]"
                    End If

                    Using cmd As New SqlCommand("spSalesHeaderListforGrid", Con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@WhereClause", whereClause)
                        cmd.Parameters.AddWithValue("@SortExpression", sortExp)
                        cmd.Parameters.AddWithValue("@HistoryRecordsOnly", HistoryRecordsOnly)
                        cmd.Parameters.AddWithValue("@qsearchFilters", "")
                        cmd.Parameters.AddWithValue("@ChartFlag", "1")
                        Dim da As New SqlDataAdapter(cmd)
                        da.Fill(dt)
                    End Using
                End Using
                Return dt
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetSalesOrderForChart")
                Throw ex
            End Try
        End Function



        Public Shared Function GetSalesOrderDetails(ByVal Order As Integer) As List(Of BO.SalesDetail)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of BO.SalesDetail)
                Using Con As New SqlConnection(ConStr)
                    Con.Open()
                    Using Cmd As New SqlCommand("spGetSalesOrderDetails", Con)
                        Cmd.CommandType = CommandType.StoredProcedure
                        Cmd.Parameters.AddWithValue("@Order", Order)
                        Dim da As New SqlDataAdapter(Cmd)
                        Dim ds As New DataTable
                        da.Fill(ds)
                        For Each row In ds.Rows
                            Dim u As New BO.SalesDetail
                            u.FarmDetails.FarmCode = row("FARMCODE")
                            u.Units = row("UNITS")
                            u.Price = row("PRICE")
                            u.Boxes = row("BOXES")
                            u.Packing = row("PACKING")
                            u.Fuel = row("FUEL")
                            u.Tax1 = row("TAX1")
                            u.Tax2 = row("TAX2")
                            u.Cost = row("COST")
                            u.OtherCost = row("OTHERCOST")
                            u.InvenType = row("INVENTYPE")
                            u.CustType = row("CUSTYPE")
                            u.AWB = Convert.ToInt64(row("AWB"))
                            u.Ext_Price = (Math.Round(u.Price * u.Units * u.Boxes, 4)) + (u.Packing * u.Boxes) + (u.Boxes * u.Fuel) + u.Tax1 + (u.Tax2 * u.Boxes)
                            u.nCost = u.Cost + Math.Round(u.OtherCost / u.Units, 3)
                            u.cInvenType = ""
                            If u.cInvenType <> "P" Then
                                If u.InvenType = "A" Then
                                    u.cInvenType = "A"
                                End If
                                If u.AWB = 0 And Trim(u.FarmDetails.FarmCode) = "ZZ" Then
                                    u.cInvenType = "P"
                                End If
                            End If
                            uList.Add(u)
                        Next
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error In GetSalesOrderDetails")
                Return Nothing
            End Try
        End Function

        Public Shared Function GetFBEforHeader(ByVal Order As Integer) As Decimal
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim TotalFBE As Decimal = 0
                Using Con As New SqlConnection(ConStr)
                    Con.Open()
                    Using Cmd As New SqlCommand(String.Format("select dbo.CalculateFBE(@Order)"), Con)
                        Cmd.CommandType = CommandType.Text
                        Cmd.Parameters.AddWithValue("@order", Order)
                        TotalFBE = IIf(IsDBNull(Cmd.ExecuteScalar()), 0, Cmd.ExecuteScalar())
                        'Dim da As New SqlDataAdapter(Cmd)
                        'Dim ds As New DataSet
                        'da.Fill(ds)
                        'For Each row In ds.Tables(0).Rows
                        '    Dim FBE As Decimal = 0
                        '    'FBE = CalculateFBE(IIf(IsDBNull(row("UOM").ToString().ToLower()), "", row("UOM").ToString().ToLower())) * Convert.ToDecimal(row("Boxes"))

                        '    TotalFBE += FBE
                        'Next
                    End Using
                End Using
                Return TotalFBE
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error In GetFBEforHeader")
                Throw ex
            End Try
        End Function




        Public Shared Function CalculateFBE(ByVal UOM As String) As Decimal
            Try
                Dim FBE As Decimal = 0
                UOM = UOM.ToLower()
                If (UOM = "fb" Or UOM = "bx") Then        'For UOM as FULL BOX
                    FBE = 1
                ElseIf (UOM = "hb" Or UOM = "ha" Or UOM = "wp") Then         'For UOM as HALF BOX
                    FBE = 0.5
                ElseIf (UOM = "qb" Or UOM = "tr") Then         'For UOM as QUATOR BOX
                    FBE = 0.25
                ElseIf (UOM = "sb") Then         'For UOM as QUATOR BOX
                    FBE = 1.6667
                ElseIf (UOM = "h8" Or UOM = "eb") Then
                    FBE = 0.125
                ElseIf (UOM <> "" And UOM <> String.Empty) Then
                    FBE = 1
                Else
                    FBE = 0
                End If

                Return FBE
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in CalculateFBE")
                Return ex.ToString()
            End Try
        End Function

        Public Function GetSalesCallHSList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of BO.SalesCallHS)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesCallHS)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetSalesCallHS]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                    cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                    cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    Dim Totalgpm As Decimal = 0
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesCallHS()
                        u.ID = row("ID")
                        u.CUSTOMER = row("Customer")
                        u.CallHS_DATE = row("CallHS_Date")
                        u.CallHS_TIME = row("Time")
                        u.PERSON = row("Person")
                        u.NOTE = CommonUtilities.ExportToCSV.IsNull(row("Note"), "")
                        uList.Add(u)
                    Next
                    Me.TotalRows = ds.Tables(1).Rows(0)(0)
                End Using
            End Using
            Return uList
        End Function

        Public Function GetDistinctCarrierDetailsForChartbyFBEList(ByVal whereClause As String) As List(Of BO.SalesHeader)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetDistinctCarrierDetailsForChartbyFBE]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesHeader
                        u.CarrierCode = row("CARRIER")
                        u.Order = Convert.ToInt32(row("ORDER"))
                        u.FBE = GetFBEforHeader(u.Order)
                        uList.Add(u)
                    Next
                End Using
            End Using

            Dim groupedCarrierList = uList.GroupBy(Function(d) d.CarrierCode).[Select](Function(g) New With {
                                            Key .CarrierCode = g.Key,
                                            Key .FBE = g.Sum(Function(s) s.FBE)}).ToList()
            'uList = uList.GroupBy(Function(u) u.SalesManName).[Select](Function(grp) grp.ToList()).ToList()
            'Dim sList As List(Of BO.SalesHeader)
            Dim CarrierList = groupedCarrierList.OrderByDescending(Function(item) item.FBE).ToList()
            Dim finalResult As New List(Of BO.SalesHeader)
            For Each objSales In CarrierList
                Dim u As New BO.SalesHeader
                u.CarrierCode = objSales.CarrierCode
                u.FBE = objSales.FBE
                finalResult.Add(u)
            Next
            Return finalResult

            'Return uList
        End Function


        Public Function GetDistinctCarrierDetailsForChartbyPcsList(ByVal whereClause As String) As List(Of BO.SalesHeader)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetDistinctCarrierDetailsForPcs]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    Dim dt As New DataTable
                    If ds.Tables(0).Rows.Count > 0 Then
                        ds.Tables(0).DefaultView.Sort = "BOXES DESC"
                        dt = ds.Tables(0).DefaultView.ToTable()
                    End If
                    For Each row In dt.Rows
                        Dim u As New BO.SalesHeader
                        u.CarrierCode = row("CARRIER")
                        If (Convert.ToString(row("BOXES")) <> "") Then
                            u.Boxes = Convert.ToDecimal(row("BOXES"))
                        Else
                            u.Boxes = 0
                        End If

                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        End Function

        Public Function GetDistinctStateDetailsForChartByBoxesList(ByVal whereClause As String) As List(Of BO.SalesHeader)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetDistinctStateDetailsForChartByBoxes]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    Dim dt As New DataTable
                    If ds.Tables(0).Rows.Count > 0 Then
                        ds.Tables(0).DefaultView.Sort = "BOXES DESC"
                        dt = ds.Tables(0).DefaultView.ToTable()
                    End If
                    For Each row In dt.Rows
                        Dim u As New BO.SalesHeader
                        u.State = row("STATE")
                        If (Convert.ToString(row("BOXES")) <> "") Then
                            u.Boxes = Convert.ToDecimal(row("BOXES"))
                        Else
                            u.Boxes = 0
                        End If
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        End Function

        Public Function GetDistinctStateDetailsForChartBySalesList(ByVal whereClause As String) As List(Of BO.SalesHeader)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetDistinctStateDetailsForChartBySales]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    Dim dt As New DataTable
                    If (ds.Tables(0).Rows.Count > 0) Then
                        ds.Tables(0).DefaultView.Sort = "INVAMOUNT DESC"
                        TotalInvAmount = ds.Tables(0).Compute("Sum(INVAMOUNT)", "")
                        dt = ds.Tables(0).DefaultView.ToTable()
                    End If
                    For Each row In dt.Rows
                        Dim u As New BO.SalesHeader
                        u.State = row("STATE")
                        If (Convert.ToString(row("INVAMOUNT")) <> "" And TotalInvAmount <> 0) Then
                            u.InvAmount = (Convert.ToDecimal(row("INVAMOUNT")) / TotalInvAmount) * 100
                        End If
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        End Function

        Public Function GetDistinctSalesManDetailsForChartList(ByVal whereClause As String) As List(Of BO.SalesHeader)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetDistinctSalesManDetailsForChart]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    Dim dt As New DataTable
                    If (ds.Tables(0).Rows.Count > 0) Then
                        ds.Tables(0).DefaultView.Sort = "INVAMOUNT desc"
                        TotalInvAmount = ds.Tables(0).Compute("Sum(INVAMOUNT)", "")
                        dt = ds.Tables(0).DefaultView.ToTable()
                    End If
                    For Each row In dt.Rows
                        Dim u As New BO.SalesHeader
                        u.SalesManName = row("SalesManName")
                        If (Convert.ToString(row("INVAMOUNT")) <> "" And TotalInvAmount <> 0) Then
                            u.InvAmount = (Convert.ToDecimal(row("INVAMOUNT")) / TotalInvAmount) * 100
                        End If
                        u.SalesManColor = Convert.ToString(row("FONTCOLOR"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        End Function

        Public Function GetDistinctFlowerColorDetailsForChartbyBoxesList(ByVal whereClause As String) As List(Of BO.SalesHeader)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetDistinctFlowerColorDetailsForChartbyBoxes]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    Dim orderdt = ds
                    Dim flowerdt = Flowers.FlowerDetailinSQL()
                    Dim query = From ord In orderdt.AsEnumerable()
                                Join flower In flowerdt.AsEnumerable()
                                On ord.Field(Of String)("flower") Equals
                                flower.Field(Of String)("flower")
                                Select New With
                                {
                                .ColorName = flower.Field(Of String)("ColorName"),
                                .Boxes = Convert.ToInt32(ord.Field(Of Decimal)("Boxes"))
                                }
                    ds = New DataTable()
                    ds = Flowers.ToDataTable(query)
                    If ds.Rows.Count > 0 Then
                        Dim grpquery = From row In ds
                                       Group row By ColorName = row.Field(Of String)("ColorName") Into MonthGroup = Group
                                       Select New With {
                                              Key ColorName,
                                              .BOXCOUNT = MonthGroup.Sum(Function(r) r.Field(Of Int32)("Boxes"))
                                         }

                        ds = New DataTable()
                        ds = Flowers.ToDataTable(grpquery)
                        For Each row In ds.Rows
                            Dim u As New BO.SalesHeader
                            Dim det As New BO.SalesDetail
                            det.FlowerDetails.Color = row("COLORNAME")
                            u.DetailsList.Add(det)
                            u.Boxes = row("BOXCOUNT")
                            uList.Add(u)
                        Next
                    End If
                End Using
            End Using
            Return uList
        End Function

        Public Function GetDistinctFlowerColorDetailsForChartbySalesList(ByVal whereClause As String) As List(Of BO.SalesHeader)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetDistinctFlowerColorDetailsForChartbySales]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    Dim orderdt = ds
                    Dim flowerdt = Flowers.FlowerDetailinSQL()
                    Dim query = From ord In orderdt.AsEnumerable()
                                Join flower In flowerdt.AsEnumerable()
                                On ord.Field(Of String)("flower") Equals
                                flower.Field(Of String)("flower")
                                Select New With
                                {
                                .Color = flower.Field(Of String)("ColorName"),
                                .INVAMOUNT = ord.Field(Of Decimal)("INVAMOUNT")
                                }
                    ds = New DataTable()
                    ds = Flowers.ToDataTable(query)
                    If ds.Rows.Count > 0 Then
                        Dim grpquery = From row In ds
                                       Group row By Color = row.Field(Of String)("Color") Into MonthGroup = Group
                                       Select New With {
                                              Key Color,
                                              .INVAMOUNT = MonthGroup.Sum(Function(r) r.Field(Of Decimal)("INVAMOUNT"))
                                         }

                        ds = New DataTable()
                        ds = Flowers.ToDataTable(grpquery)
                    End If

                    Dim TotalInvAmount As Decimal = 0
                    Dim dt As New DataTable
                    If (ds.Rows.Count > 0) Then
                        ds.DefaultView.Sort = "INVAMOUNT DESC"
                        TotalInvAmount = ds.Compute("Sum(INVAMOUNT)", "")
                        dt = ds.DefaultView.ToTable()

                        For Each row In dt.Rows
                            Dim u As New BO.SalesHeader
                            u.FlowerColor = row("COLOR")
                            If (Convert.ToString(row("INVAMOUNT")) <> "" And TotalInvAmount <> 0) Then
                                u.InvAmount = (Convert.ToDecimal(row("INVAMOUNT")) / TotalInvAmount) * 100
                            End If
                            uList.Add(u)
                        Next
                    End If
                End Using
            End Using
            Return uList
        End Function

        Public Function GetDistinctFlowerCatDetailsForChartList(ByVal whereClause As String) As List(Of BO.SalesHeader)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetDistinctFlowerCatDetailsForChart]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    Dim orderdt = ds
                    Dim flowerdt = Flowers.FlowerDetailinSQL()
                    Dim query = From ord In orderdt.AsEnumerable()
                                Join flower In flowerdt.AsEnumerable()
                                On ord.Field(Of String)("flower") Equals
                                flower.Field(Of String)("flower")
                                Select New With
                                {
                                    .Cat = flower.Field(Of String)("cat")
                                }
                    ds = New DataTable()
                    ds = Flowers.ToDataTable(query)
                    Dim grpquery = From row In ds
                                   Group row By cat = row.Field(Of String)("cat") Into CatGroup = Group
                                   Select New With {
                                          Key cat,
                                          .CATCOUNT = CatGroup.Count()
                                     }

                    ds = New DataTable()
                    ds = Flowers.ToDataTable(grpquery)

                    For Each row In ds.Rows
                        Dim u As New BO.SalesHeader
                        Dim det As New BO.SalesDetail
                        det.FlowerDetails.CAT = row("CAT")
                        u.DetailsList.Add(det)
                        u.FlowerCatCount = row("CATCOUNT")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        End Function

        Public Function GetDistinctFlowerDescDetailsForChartList(ByVal whereClause As String) As List(Of BO.SalesHeader)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesHeader)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetDistinctFlowerDescDetailsForChart]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    Dim orderdt = ds
                    Dim flowerdt = Flowers.FlowerDetailinSQL()
                    Dim query = From ord In orderdt.AsEnumerable()
                                Join flower In flowerdt.AsEnumerable()
                                On ord.Field(Of String)("flower") Equals
                                flower.Field(Of String)("flower")
                                Select New With
                                {
                                    .FLOWERDESC = flower.Field(Of String)("Name")
                                }
                    ds = New DataTable()
                    ds = Flowers.ToDataTable(query)
                    Dim grpquery = From row In ds
                                   Group row By FLOWERDESC = row.Field(Of String)("FLOWERDESC") Into DescGroup = Group
                                   Select New With {
                                          Key FLOWERDESC,
                                          .DescCOUNT = DescGroup.Count()
                                     }

                    ds = New DataTable()
                    ds = Flowers.ToDataTable(grpquery)
                    Dim dt As New DataTable
                    If ds.Rows.Count > 0 Then
                        ds.DefaultView.Sort = "DESCCOUNT DESC"
                        dt = ds.DefaultView.ToTable()
                    End If
                    For Each row In dt.Rows
                        Dim u As New BO.SalesHeader
                        Dim det As New BO.SalesDetail
                        det.FlowerDetails.Name = row("FLOWERDESC")
                        u.DetailsList.Add(det)
                        u.FlowerCount = row("DESCCOUNT")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        End Function
    End Class

    Public Shared Function InsertInvoiceReportData(ByVal HeaderXML As String, ByVal DetailsXML As String, ByVal UserID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spInsertInvoiceReportDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderXML", HeaderXML)
                    cmd.Parameters.AddWithValue("@DetailXML", DetailsXML)
                    cmd.Parameters.AddWithValue("@UserID", UserID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertInvoiceReportData")
            Return "error"
        End Try
    End Function

    Public Shared Function InsertShippingLabelDetails(ByVal ShippingInformation As String, ByVal UserID As Integer, ByVal FloridaBeautyShipper As String, ByVal isFromNewArmelliniXML As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spInsertShippingLabelDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ShippingInfoXML", ShippingInformation)
                    cmd.Parameters.AddWithValue("@UserID", UserID)
                    cmd.Parameters.AddWithValue("@FloridaBeautyShipper", FloridaBeautyShipper)
                    cmd.Parameters.AddWithValue("@isFromNewArmellini", isFromNewArmelliniXML)
                    Dim result = cmd.ExecuteScalar()
                    Return result
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertShippingLabelDetails")
            Return "error"
        End Try
    End Function

    Public Shared Function InsertCustomsInvoiceDetails(ByVal HeaderXML As String, ByVal DetailsXML As String, ByVal UserID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spInsertCustomsInvoicedetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderXML", HeaderXML)
                    cmd.Parameters.AddWithValue("@DetailXML", DetailsXML)
                    cmd.Parameters.AddWithValue("@UserID", UserID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertCustomsInvoiceDetails")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' CREATE/UPDATE ORDER into F_ORDER1 AND F_ORDER2, If flag is 1(Isneworder) it will create new order and if 0 it will update the existing order
    ''' </summary>
    ''' <param name="ISNewOrder"></param>
    ''' <param name="OrderNo"></param>
    ''' <param name="Customer"></param>
    ''' <param name="ShippingDate"></param>
    ''' <param name="Carrier"></param>
    ''' <param name="Cutofftime"></param>
    ''' <param name="AWB"></param>
    ''' <param name="CustPO"></param>
    ''' <param name="CustMsg1"></param>
    ''' <param name="CustMsg2"></param>
    ''' <param name="CustMsg3"></param>
    ''' <param name="CustMsg4"></param>
    ''' <param name="CustMsg5"></param>
    ''' <param name="ShipMsg1"></param>
    ''' <param name="ShipMsg2"></param>
    ''' <param name="ShipMsg3"></param>
    ''' <param name="ShipMsg4"></param>
    ''' <param name="ShipMsg5"></param>
    ''' <param name="UserName"></param>
    ''' <param name="TotalAmout"></param>
    ''' <returns></returns>
    Public Shared Function CreateOrUpdateOrder(ByVal ISNewOrder As String, ByVal OrderNo As String, ByVal Customer As String, ByVal ShippingDate As String, ByVal CargoDate As String, ByVal Carrier As String,
                                          ByVal Cutofftime As String, ByVal AWB As String, ByVal WH As String, ByVal CustPO As String, ByVal SLSMAN As String, ByVal CustMsg1 As String,
                                          ByVal CustMsg2 As String, ByVal CustMsg3 As String, ByVal CustMsg4 As String, ByVal CustMsg5 As String, ByVal ShipMsg1 As String,
                                          ByVal ShipMsg2 As String, ByVal ShipMsg3 As String, ByVal ShipMsg4 As String, ByVal ShipMsg5 As String,
                                          ByVal Shipto As String, ByVal Terms As String, ByVal DroporderDetailIDsToNewOrder As String, ByVal UserName As String,
                                          ByVal UserID As String, ByVal ShipToName As String, ByVal ShipToAddress1 As String, ByVal ShipToAddress2 As String,
                                          ByVal ShipToCity As String, ByVal ShipToState As String, ByVal ShipToZip As String, ByVal ShipToPhone As String,
                                          ByVal ShipToFax As String, ByVal ShipToContact As String, ByVal ShipToCountry As String,
                                          Optional ByVal TotalAmout As String = "", Optional ByVal CustomerEmail As String = "") As DataTable
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If
            Dim dt As New DataTable
            Dim ds As New DataSet
            Dim CompanyName As String = ConfigurationManager.AppSettings("CompanyName").ToString()
            Dim FromEmail As String = ConfigurationManager.AppSettings("VendorFromEmails")
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Try
                    Using F7UpdCmd As New SqlCommand("SPAlterHeaderOrderDetails", Con)
                        F7UpdCmd.CommandType = CommandType.StoredProcedure
                        F7UpdCmd.Parameters.AddWithValue("@Order", OrderNo)
                        F7UpdCmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                        F7UpdCmd.Parameters.AddWithValue("@Shippingdate", ShippingDate)
                        F7UpdCmd.Parameters.AddWithValue("@Carrier", Carrier)
                        F7UpdCmd.Parameters.AddWithValue("@SALESMAN", SLSMAN)
                        F7UpdCmd.Parameters.AddWithValue("@Shipto", Shipto)
                        F7UpdCmd.Parameters.AddWithValue("@USERNAME", UserName)
                        F7UpdCmd.Parameters.AddWithValue("@UserID", UserID)
                        Dim da As New SqlDataAdapter(F7UpdCmd)

                        da.Fill(ds)

                        Dim User As New User
                        If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                            User = System.Web.HttpContext.Current.Session("LoginUserDetails")
                        End If

                        'for shipping date sp return one table for carrier change return one table for both ,it return two tables
                        If ds.Tables.Count >= 1 And CompanyName <> "BloomsUSA" Then
                            Dim Subject As String = ""
                            For i = 0 To ds.Tables.Count - 1
                                'by using for loop, tables are identified using column name because, sp cannot return tablename
                                If ds.Tables(i).Columns(0).ColumnName = "OldShipdate" Then
                                    Subject = "Warning!!!! Invoice# " + OrderNo + " shipping date changed from " + ds.Tables(i).Rows(0)("OldShipdate") + " to " + ds.Tables(i).Rows(0)("NewShipdate") + ""
                                ElseIf ds.Tables(i).Columns(0).ColumnName = "OldCarrier" Then
                                    Subject = "Warning!!!! Invoice# " + OrderNo + " carrier changed from " + ds.Tables(i).Rows(0)("OldCarrier") + " to " + ds.Tables(i).Rows(0)("NewCarrier") + ""
                                End If
                                Dim ToEmail As String = ""
                                Dim BodyMessage As String = ""
                                BodyMessage = "UserName :" + User.Email & vbCrLf &
                                                "Name :" + User.Name & vbCrLf &
                                                "IP :" + BloomService.LocalIPAddress
                                ToEmail = ds.Tables(i).Rows(0)("CustomerSlsmanMail") + "," + ds.Tables(i).Rows(0)("LoggedUserMail")
                                Logs.SendEmail(User.Email, ToEmail, BodyMessage, "", Subject)
                            Next
                        End If
                    End Using

                Catch ex As Exception
                    ErrorLogs.LogException(ex, "Error in CreateNewOrder::Update F7")
                End Try
                Using ExsCmd As New SqlCommand("SPCreateNewOrder", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@IsNewOrder", ISNewOrder)
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    ExsCmd.Parameters.AddWithValue("@Customer", Customer)
                    ExsCmd.Parameters.AddWithValue("@ShippingDate", ShippingDate)
                    ExsCmd.Parameters.AddWithValue("@CargoDate", CargoDate)
                    ExsCmd.Parameters.AddWithValue("@Carrier", Carrier)
                    ExsCmd.Parameters.AddWithValue("@Cutofftime", Cutofftime)
                    ExsCmd.Parameters.AddWithValue("@AWB", AWB)
                    ExsCmd.Parameters.AddWithValue("@WH", WH)
                    ExsCmd.Parameters.AddWithValue("@CustPO", CustPO.ToUpper())
                    ExsCmd.Parameters.AddWithValue("@SALESMAN", SLSMAN)
                    ExsCmd.Parameters.AddWithValue("@text1", CustMsg1)
                    ExsCmd.Parameters.AddWithValue("@text2", CustMsg2)
                    ExsCmd.Parameters.AddWithValue("@text3", CustMsg3)
                    ExsCmd.Parameters.AddWithValue("@text4", CustMsg4)
                    ExsCmd.Parameters.AddWithValue("@text5", CustMsg5)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg1", ShipMsg1)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg2", ShipMsg2)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg3", ShipMsg3)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg4", ShipMsg4)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg5", ShipMsg5)
                    ExsCmd.Parameters.AddWithValue("@Shipto", Shipto)
                    ExsCmd.Parameters.AddWithValue("@SHIPTONAME", ShipToName)
                    ExsCmd.Parameters.AddWithValue("@SHIPTOADD1", ShipToAddress1)
                    ExsCmd.Parameters.AddWithValue("@SHIPTOADD2", ShipToAddress2)
                    ExsCmd.Parameters.AddWithValue("@SHIPTOCITY", ShipToCity)
                    ExsCmd.Parameters.AddWithValue("@SHIPTOST", ShipToState)
                    ExsCmd.Parameters.AddWithValue("@SHIPTOZIP", ShipToZip)
                    ExsCmd.Parameters.AddWithValue("@SHIPTOCTRY", ShipToCountry)
                    ExsCmd.Parameters.AddWithValue("@SHIPTOPHONE", ShipToPhone)
                    ExsCmd.Parameters.AddWithValue("@SHIPTOFAX", ShipToFax)
                    ExsCmd.Parameters.AddWithValue("@SHIPTOCONTACT", ShipToContact)
                    ExsCmd.Parameters.AddWithValue("@Terms", Terms)
                    ExsCmd.Parameters.AddWithValue("@DroporderDetailIDsToNewOrder", DroporderDetailIDsToNewOrder)
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)
                    ExsCmd.Parameters.AddWithValue("@UserID", UserID)
                    Dim da As New SqlDataAdapter(ExsCmd)

                    da.Fill(dt)
                    'ExsCmd.ExecuteNonQuery()

                    If (ISNewOrder = 1) And TotalAmout <> "" Then

                        Try
                            Dim SalesManEmail As String
                            SalesManEmail = 0
                            If (SLSMAN <> Nothing) Then
                                SalesManEmail = GetDflowerSalesManEmail(SLSMAN)
                            End If

                            Dim objeLog As New BO.EmailLog
                            objeLog.CustomerEMail = CustomerEmail
                            objeLog.CustomerName = Customer
                            objeLog.InvoiceNo = OrderNo
                            objeLog.PO = CustPO
                            objeLog.SalesManEmail = SalesManEmail
                            objeLog.TotalAmount = TotalAmout
                            objeLog.Subject = ConfigurationManager.AppSettings("CompanyName").ToString() + "Invoice#: " + OrderNo + " ShipDate: " + Convert.ToDateTime(ShippingDate.ToString()).ToString("MM-dd-yyyy") + " Total: $" + TotalAmout + " PO#: " + CustPO + " Customer: " + Customer + " "
                            objeLog.BodyContent = "Sales from Customer Order for Invoice#: " + OrderNo + " ShipDate: " + Convert.ToDateTime(ShippingDate.ToString()).ToString("MM-dd-yyyy") + "  Total: $" + TotalAmout + " PO#: " + CustPO + " Customer: " + Customer + " "
                            Dim ToEmail = objeLog.CustomerEMail + "," + objeLog.SalesManEmail
                            Logs.SendEmail(objeLog.SalesManEmail, ToEmail, objeLog.BodyContent, "", objeLog.Subject)

                        Catch ex As Exception
                            ErrorLogs.LogException(ex, "Error in CreateNewOrder::Send email for create order")
                        End Try
                    End If

                End Using

            End Using
            Return dt
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CreateNewOrder")
            Throw ex
        End Try
    End Function
    Public Shared Function CreateCustomerOrder(ByVal ISNewOrder As String, ByVal OrderNo As String, ByVal Customer As String, ByVal ShippingDate As String, ByVal CargoDate As String, ByVal Carrier As String,
                                          ByVal Cutofftime As String, ByVal AWB As String, ByVal WH As String, ByVal CustPO As String, ByVal SLSMAN As String, ByVal CustMsg1 As String,
                                          ByVal CustMsg2 As String, ByVal CustMsg3 As String, ByVal CustMsg4 As String, ByVal CustMsg5 As String, ByVal ShipMsg1 As String,
                                          ByVal ShipMsg2 As String, ByVal ShipMsg3 As String, ByVal ShipMsg4 As String, ByVal ShipMsg5 As String,
                                          ByVal Shipto As String, ByVal Terms As String, ByVal DroporderDetailIDsToNewOrder As String, ByVal UserName As String,
                                          ByVal UserID As String, Optional ByVal TotalAmout As String = "", Optional ByVal CustomerEmail As String = "") As DataTable
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If
            Dim dt As New DataTable
            Dim ds As New DataSet
            Dim FromEmail As String = ConfigurationManager.AppSettings("VendorFromEmails")
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using ExsCmd As New SqlCommand("SPCreateNewOrder", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@IsNewOrder", ISNewOrder)
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    ExsCmd.Parameters.AddWithValue("@Customer", Customer)
                    ExsCmd.Parameters.AddWithValue("@ShippingDate", ShippingDate)
                    ExsCmd.Parameters.AddWithValue("@CargoDate", CargoDate)
                    ExsCmd.Parameters.AddWithValue("@Carrier", Carrier)
                    ExsCmd.Parameters.AddWithValue("@Cutofftime", Cutofftime)
                    ExsCmd.Parameters.AddWithValue("@AWB", AWB)
                    ExsCmd.Parameters.AddWithValue("@WH", WH)
                    ExsCmd.Parameters.AddWithValue("@CustPO", CustPO.ToUpper())
                    ExsCmd.Parameters.AddWithValue("@SALESMAN", SLSMAN)
                    ExsCmd.Parameters.AddWithValue("@text1", CustMsg1)
                    ExsCmd.Parameters.AddWithValue("@text2", CustMsg2)
                    ExsCmd.Parameters.AddWithValue("@text3", CustMsg3)
                    ExsCmd.Parameters.AddWithValue("@text4", CustMsg4)
                    ExsCmd.Parameters.AddWithValue("@text5", CustMsg5)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg1", ShipMsg1)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg2", ShipMsg2)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg3", ShipMsg3)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg4", ShipMsg4)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg5", ShipMsg5)
                    ExsCmd.Parameters.AddWithValue("@Shipto", Shipto)
                    ExsCmd.Parameters.AddWithValue("@Terms", Terms)
                    ExsCmd.Parameters.AddWithValue("@DroporderDetailIDsToNewOrder", DroporderDetailIDsToNewOrder)
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)
                    ExsCmd.Parameters.AddWithValue("@UserID", UserID)
                    Dim da As New SqlDataAdapter(ExsCmd)

                    da.Fill(dt)
                    'ExsCmd.ExecuteNonQuery()

                    If (ISNewOrder = 1) And TotalAmout <> "" Then

                        Try
                            Dim SalesManEmail As String
                            SalesManEmail = 0
                            If (SLSMAN <> Nothing) Then
                                SalesManEmail = GetDflowerSalesManEmail(SLSMAN)
                            End If

                            Dim objeLog As New BO.EmailLog
                            objeLog.CustomerEMail = CustomerEmail
                            objeLog.CustomerName = Customer
                            objeLog.InvoiceNo = OrderNo
                            objeLog.PO = CustPO
                            objeLog.SalesManEmail = SalesManEmail
                            objeLog.TotalAmount = TotalAmout
                            objeLog.Subject = ConfigurationManager.AppSettings("CompanyName").ToString() + "Invoice#: " + OrderNo + " ShipDate: " + Convert.ToDateTime(ShippingDate.ToString()).ToString("MM-dd-yyyy") + " Total: $" + TotalAmout + " PO#: " + CustPO + " Customer: " + Customer + " "
                            objeLog.BodyContent = "Sales from Customer Order for Invoice#: " + OrderNo + " ShipDate: " + Convert.ToDateTime(ShippingDate.ToString()).ToString("MM-dd-yyyy") + "  Total: $" + TotalAmout + " PO#: " + CustPO + " Customer: " + Customer + " "
                            Dim ToEmail = objeLog.CustomerEMail + "," + objeLog.SalesManEmail
                            Logs.SendEmail("jose@dflower.com", ToEmail, objeLog.BodyContent, "", objeLog.Subject)

                        Catch ex As Exception
                            ErrorLogs.LogException(ex, "Error in CreateCustomerOrder::Send email for create order")
                        End Try
                    End If

                End Using

            End Using
            Return dt
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CreateCustomerOrder")
            Throw ex
        End Try
    End Function

    Public Shared Function LoadCargoDateForOrderUpdate(ByVal ORDER As String, ByVal CUSTOMER As String) As String
        Try
            Dim result As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("[SPLoadCargoDateForOrderUpdate]", Con)
                    Cmd.Parameters.AddWithValue("@ORDER", ORDER)
                    Cmd.Parameters.AddWithValue("@CUSTOMER", CUSTOMER)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        result = dt.Rows(0)("DATEREC")
                    End If
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In LoadCargoDateForOrderUpdate")
            Return "error"
        End Try
    End Function


    Public Shared Function CheckInvoiceHasNegativeBoxes(ByVal OrderNo As String, ByVal CustomerNo As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim customer As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("[sp_CheckInvoiceHasNegativeBoxes]", Con)
                    Cmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    Cmd.Parameters.AddWithValue("@CustomerNo", CustomerNo)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Dim IsExist = Convert.ToString(dt(0)(0))
                        Return IsExist
                    End If
                End Using
            End Using
            Return ""
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In CheckInvoiceHasNegativeBoxes")
            Return "error"
        End Try
    End Function



    Public Shared Function UpdateCustomerAndShippingMessages(ByVal OrderNo As String, ByVal CustMsg1 As String,
                                          ByVal CustMsg2 As String, ByVal CustMsg3 As String, ByVal CustMsg4 As String, ByVal CustMsg5 As String, ByVal ShipMsg1 As String,
                                          ByVal ShipMsg2 As String, ByVal ShipMsg3 As String, ByVal ShipMsg4 As String, ByVal ShipMsg5 As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPUpdateOrderMessages", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    ExsCmd.Parameters.AddWithValue("@text1", CustMsg1)
                    ExsCmd.Parameters.AddWithValue("@text2", CustMsg2)
                    ExsCmd.Parameters.AddWithValue("@text3", CustMsg3)
                    ExsCmd.Parameters.AddWithValue("@text4", CustMsg4)
                    ExsCmd.Parameters.AddWithValue("@text5", CustMsg5)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg1", ShipMsg1)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg2", ShipMsg2)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg3", ShipMsg3)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg4", ShipMsg4)
                    ExsCmd.Parameters.AddWithValue("@ShipMsg5", ShipMsg5)
                    ExsCmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCustomerAndShippingMessages")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' MANI::17/07/2018::Void an order
    ''' </summary>
    ''' <param name="OrderNo"></param>
    ''' <returns></returns>
    Public Shared Function VoidOrder(ByVal OrderNo As String, ByVal ReasonVoid As String, ByVal UserName As String) As String
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPVoidOrder", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    ExsCmd.Parameters.AddWithValue("@ReasonVoid", ReasonVoid)
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)
                    Dim Result = ExsCmd.ExecuteScalar()
                    Return Result
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in VoidOrder")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' MANI::17/07/2018::Flip an order
    ''' </summary>
    ''' <param name="OrderNo"></param>
    ''' <returns></returns>
    Public Shared Function FlipOrder(ByVal OrderNo As String, ByVal Customer As String, ByVal UserName As String, CalledFromVET As String) As DataTable
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPFlipOrder", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    ExsCmd.Parameters.AddWithValue("@CustomerToFliptheOrder", Customer)
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)
                    ExsCmd.Parameters.AddWithValue("@CalledFromVET", CalledFromVET)
                    Dim da As New SqlDataAdapter(ExsCmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return dt
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in FlipOrder")
            Throw ex
        End Try
    End Function


    ''' Create "Miscellaneous" charge for a order
    Public Shared Function ADDUPDATEMisc(ByVal OrderDetailID As String, ByVal Order As String, ByVal Customer As String, ByVal Code As String,
                                                   ByVal Name As String, ByVal Quantity As Decimal, ByVal Price As Decimal,
                                                   ByVal Cost As Decimal, ByVal UserID As String, CalledFromVET As String) As String
        Try
            Dim InvoiceTotalBeforeUpdate = 0
            Dim InvoiceTotalAfterUpdate = 0
            Dim UserName As String = ""
            Dim User As New User
            If Not HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                User = HttpContext.Current.Session("LoginUserDetails")
                UserName = User.Name
            End If

            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If


            If CalledFromVET = "1" Then
                'removed by JAD on 6/9/2022 not needed, see spADDUPDATEMisc 
                'InvoiceTotalBeforeUpdate = VET.GetInvoiceTotal(Order)
                ''Insert Acticvity log in F_SLSCHG for the particular line
                If OrderDetailID <> "" And OrderDetailID <> "0" Then
                    Try
                        F_CREREQ.InsertintoF_SLSCHG(OrderDetailID, "B", UserName)
                    Catch ex As Exception
                        ErrorLogs.LogException(ex, "Error in Service::InsertintoF_SLSCHG::ADDUPDATEMisc")
                        'Return Nothing
                    End Try
                End If
            End If
            Dim ScopeID = 0
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPADDUPDATEMisc", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@OrderDetailID", OrderDetailID)
                    ExsCmd.Parameters.AddWithValue("@ORDER", Order)
                    ExsCmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    ExsCmd.Parameters.AddWithValue("@FLOWER", Code)
                    ExsCmd.Parameters.AddWithValue("@DESC", Name)
                    ExsCmd.Parameters.AddWithValue("@BOXES", Quantity)
                    ExsCmd.Parameters.AddWithValue("@PRICE", Price)
                    ExsCmd.Parameters.AddWithValue("@COST", Cost)
                    ExsCmd.Parameters.AddWithValue("@USERID", UserID)
                    ExsCmd.Parameters.AddWithValue("@CalledFromVET", CalledFromVET)
                    ScopeID = ExsCmd.ExecuteScalar()
                End Using
            End Using

            If CalledFromVET = "1" Then
                'removed by JAD on 6/9/2022 not needed, see spADDUPDATEMisc 

                'InvoiceTotalAfterUpdate = VET.GetInvoiceTotal(Order)

                'Dim DifferenceAmount = InvoiceTotalBeforeUpdate - InvoiceTotalAfterUpdate

                'Try
                '    Payments.WRTAR(Order, DateTime.Now.ToString("MM/dd/yyyy"), "1", 0, -DifferenceAmount, Customer, 0.00, 0, "", UserName, DateTime.Now.ToString("MM/dd/yyyy"))
                'Catch ex As Exception
                '    ErrorLogs.LogException(ex, "Error in Service::WRTAR::VoidVET")
                '    'Return Nothing
                'End Try


                'For new record in vET it will create a new record on F_SLSCHG with type "C"
                If OrderDetailID = "" Or OrderDetailID = "0" Then
                    Try
                        F_CREREQ.InsertintoF_SLSCHG(ScopeID, "C", UserName)
                    Catch ex As Exception
                        ErrorLogs.LogException(ex, "Error in Service::InsertintoF_SLSCHG::ADDUPDATEMisc")
                        'Return Nothing
                    End Try

                Else
                    ''Insert Acticvity log in F_SLSCHG for the particular line
                    Try
                        F_CREREQ.InsertintoF_SLSCHG(OrderDetailID, "A", UserName)
                    Catch ex As Exception
                        ErrorLogs.LogException(ex, "Error in Service::InsertintoF_SLSCHG::ADDUPDATEMisc")
                        'Return Nothing
                    End Try
                End If

            End If

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ADDUPDATEMisc")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Mani::23/03/2018: ADD/Update Detail for an order
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <param name="Customer"></param>
    ''' <param name="Quantity"></param>
    ''' <param name="Price"></param>
    ''' <param name="UserName"></param>
    ''' <returns></returns>
    ''' Muthu Nivetha M :: 19Feb2020 :: Modified :: To save BoxCode in F_ORDER2.BOXCODE
    Public Shared Function ADDUPDATEOrderDetail(ByVal OrderDetailID As String, ByVal Order As String, ByVal Customer As String, ByVal InventoryIDs As String, ByVal Quantity As Decimal, ByVal Price As Decimal, ByVal Type As String, ByVal UserName As String, Units As String, PlusFuel As String, ByVal UserID As String, BoxCode As String, Optional StoreNo As Integer = 0, Optional UpcCode As String = "", Optional UPCPRICE As String = "", Optional DateCode As String = "", Optional Desc As String = "") As String
        If (UserName.Length < 20) Then
            UserName = UserName
        Else
            UserName = UserName.Substring(0, 20)
        End If
        Dim TotalQuantityRequested As Integer = Quantity
        Dim BalanceQtyToInsert As Integer = Quantity

        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                For Each InvSqlId In InventoryIDs.Split(",")
                    Try
                        Using F7UpdCmd As New SqlCommand("SPUpdateOrderDetailsLogs", Con)
                            F7UpdCmd.CommandType = CommandType.StoredProcedure
                            F7UpdCmd.Transaction = Trans
                            F7UpdCmd.Parameters.AddWithValue("@OrderDetailID", OrderDetailID)
                            F7UpdCmd.Parameters.AddWithValue("@ORDER", Order)
                            F7UpdCmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                            F7UpdCmd.Parameters.AddWithValue("@InvSqlId", InvSqlId)
                            F7UpdCmd.Parameters.AddWithValue("@BalanceQtyToInsert", BalanceQtyToInsert)
                            F7UpdCmd.Parameters.AddWithValue("@PRICE", Price)
                            F7UpdCmd.Parameters.AddWithValue("@SalesType", Type)
                            F7UpdCmd.Parameters.AddWithValue("@Units", Units)
                            F7UpdCmd.Parameters.AddWithValue("@PlusFuel", PlusFuel)
                            F7UpdCmd.Parameters.AddWithValue("@USERNAME", UserName)
                            F7UpdCmd.ExecuteNonQuery()
                            'If Trans IsNot Nothing Then
                            '    Trans.Commit()
                            'End If
                        End Using

                    Catch ex As Exception
                        ErrorLogs.LogException(ex, "Error in ADDUPDATEOrderDetail::Update F7")
                    End Try

                    Using ExsCmd As New SqlCommand("SPADDUPDATEOrderDetail", Con)
                        ExsCmd.CommandType = CommandType.StoredProcedure
                        ExsCmd.Transaction = Trans
                        ExsCmd.Parameters.AddWithValue("@OrderDetailID", OrderDetailID)
                        ExsCmd.Parameters.AddWithValue("@ORDER", Order)
                        ExsCmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                        ExsCmd.Parameters.AddWithValue("@InvSqlId", InvSqlId)
                        ExsCmd.Parameters.AddWithValue("@BalanceQtyToInsert", BalanceQtyToInsert)
                        ExsCmd.Parameters.AddWithValue("@PRICE", Price)
                        ExsCmd.Parameters.AddWithValue("@SalesType", Type)
                        ExsCmd.Parameters.AddWithValue("@Units", Units)
                        ExsCmd.Parameters.AddWithValue("@PlusFuel", PlusFuel)
                        ExsCmd.Parameters.AddWithValue("@USERNAME", UserName)
                        ExsCmd.Parameters.AddWithValue("@UserID", UserID)
                        ExsCmd.Parameters.AddWithValue("@StoreNo", StoreNo)
                        ExsCmd.Parameters.AddWithValue("@BoxCode", BoxCode)
                        ExsCmd.Parameters.AddWithValue("@UPCCode", UpcCode)
                        ExsCmd.Parameters.AddWithValue("@UPCPRICE", UPCPRICE)
                        ExsCmd.Parameters.AddWithValue("@DateCode", DateCode)
                        ExsCmd.Parameters.AddWithValue("@Desc", Desc)
                        BalanceQtyToInsert = ExsCmd.ExecuteScalar()
                        If ExsCmd.Transaction Is Nothing Then
                            Trans = ExsCmd.Transaction
                        End If
                        If BalanceQtyToInsert = 0 Then
                            Exit For
                        End If
                    End Using
                Next

                'Trans.Commit()
                If Trans IsNot Nothing Then
                    Trans.Commit()
                End If

                If BalanceQtyToInsert = 0 Then
                    Return "success"
                ElseIf TotalQuantityRequested = BalanceQtyToInsert Then
                    Return "Insufficient stock"
                Else
                    Return "Insufficient stock Requested Qty:" + Convert.ToString(TotalQuantityRequested) + " Allocated Qty: " + Convert.ToString(TotalQuantityRequested - BalanceQtyToInsert)
                End If
            Catch ex As Exception
                'Trans.Rollback()
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                End If
                ErrorLogs.LogException(ex, "Error in ADDUPDATEOrderDetail")
                Throw ex
            End Try
        End Using
    End Function

    Public Shared Function AddFutureOrderDetail(ByVal OrderDetailID As String, ByVal Order As String, ByVal Customer As String, ByVal Flower As String, ByVal Farm As String, ByVal Quantity As Decimal, ByVal UOM As String,
                                                ByVal Price As Decimal, ByVal Cost As Decimal, ByVal Type As String, ByVal Units As String, ByVal UserName As String, ByVal UserID As String, BoxCode As String, ByVal UPC As String, ByVal UPCPRICE As String, ByVal DateCode As String,
                                                ByVal Notes As String, Optional Desc As String = "", Optional ByVal L As String = "0", Optional ByVal W As String = "0", Optional ByVal H As String = "0") As String
        If (UserName.Length < 20) Then
            UserName = UserName
        Else
            UserName = UserName.Substring(0, 20)
        End If


        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                Using ExsCmd As New SqlCommand("SPAddFutureOrderDetail", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@OrderDetailID", OrderDetailID)
                    ExsCmd.Parameters.AddWithValue("@ORDER", If(String.IsNullOrEmpty(Order) Or Order = "null", "0", Order))
                    ExsCmd.Parameters.AddWithValue("@CUSTOMER", If(String.IsNullOrEmpty(Customer), "0", Customer))
                    ExsCmd.Parameters.AddWithValue("@Flower", Flower)
                    ExsCmd.Parameters.AddWithValue("@Farm", Farm)
                    ExsCmd.Parameters.AddWithValue("@Qty", Quantity)
                    ExsCmd.Parameters.AddWithValue("@UOM", UOM)
                    ExsCmd.Parameters.AddWithValue("@PRICE", Price)
                    ExsCmd.Parameters.AddWithValue("@Cost", Cost)
                    ExsCmd.Parameters.AddWithValue("@SalesType", Type)
                    ExsCmd.Parameters.AddWithValue("@Units", Units)
                    ExsCmd.Parameters.AddWithValue("@USERNAME", UserName)
                    ExsCmd.Parameters.AddWithValue("@UserID", UserID)
                    ExsCmd.Parameters.AddWithValue("@BoxCode", BoxCode)
                    ExsCmd.Parameters.AddWithValue("@UPC", UPC)
                    ExsCmd.Parameters.AddWithValue("@UPCPRICE", UPCPRICE)
                    ExsCmd.Parameters.AddWithValue("@DateCode", DateCode)
                    ExsCmd.Parameters.AddWithValue("@Desc", Desc)
                    ExsCmd.Parameters.AddWithValue("@Notes", Notes)
                    ExsCmd.Parameters.AddWithValue("@L", L)
                    ExsCmd.Parameters.AddWithValue("@W", W)
                    ExsCmd.Parameters.AddWithValue("@H", H)
                    ExsCmd.ExecuteNonQuery()
                    If ExsCmd.Transaction Is Nothing Then
                        Trans = ExsCmd.Transaction
                    End If
                End Using

                If Trans IsNot Nothing Then
                    Trans.Commit()
                End If
                Return "success"
            Catch ex As Exception
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                End If
                ErrorLogs.LogException(ex, "Error in AddFutureOrderDetail")
                Throw ex
            End Try
        End Using
    End Function
    Public Shared Function GenerateStandingInvoiceManual(ByVal Shipdate As String, ByVal IsStanding As String, ByVal IsPreBook As String, ByVal AWB As String, ByVal Warehouse As String, ByVal UserName As String) As String
        If (UserName.Length < 20) Then
            UserName = UserName
        Else
            UserName = UserName.Substring(0, 20)
        End If
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim TotalBoxes As String = 0
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                Using ExsCmd As New SqlCommand("spCreateInvoiceForStandingOrderManual", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@Shipdate", Shipdate)
                    ExsCmd.Parameters.AddWithValue("@IsStanding", IsStanding)
                    ExsCmd.Parameters.AddWithValue("@IsPreBooks", IsPreBook)
                    ExsCmd.Parameters.AddWithValue("@AWB", AWB)
                    ExsCmd.Parameters.AddWithValue("@Warehouse", Warehouse)
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)

                    TotalBoxes = ExsCmd.ExecuteScalar()
                    If ExsCmd.Transaction Is Nothing Then
                        Trans = ExsCmd.Transaction
                    End If
                End Using

                If Trans IsNot Nothing Then
                    Trans.Commit()
                End If
                Return TotalBoxes
            Catch ex As Exception
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                End If
                ErrorLogs.LogException(ex, "Error in GenerateStandingInvoiceManual")
                Throw ex
            End Try
        End Using
    End Function

    Public Shared Function GenerateStandingInvoiceManualFromTemp(ByVal Shipdate As String, ByVal IsStanding As String, ByVal IsPreBook As String, ByVal AWB As String, ByVal Warehouse As String, ByVal Farm As String, ByVal InvenToIgnore As String, ByVal UserName As String, ByVal UserId As String) As String
        If (UserName.Length < 20) Then
            UserName = UserName
        Else
            UserName = UserName.Substring(0, 20)
        End If
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim TotalBoxes As String = 0
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                Using ExsCmd As New SqlCommand("spCreateInvoiceForStandingOrderFromTemp", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@Shipdate", Shipdate)
                    ExsCmd.Parameters.AddWithValue("@IsStanding", IsStanding)
                    ExsCmd.Parameters.AddWithValue("@IsPreBooks", IsPreBook)
                    ExsCmd.Parameters.AddWithValue("@AWB", AWB)
                    ExsCmd.Parameters.AddWithValue("@Warehouse", Warehouse)
                    ExsCmd.Parameters.AddWithValue("@Farm", Farm)
                    ExsCmd.Parameters.AddWithValue("@InvenToIgnore", InvenToIgnore)
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)
                    ExsCmd.Parameters.AddWithValue("@UserId", UserId)
                    TotalBoxes = ExsCmd.ExecuteScalar()
                    If ExsCmd.Transaction Is Nothing Then
                        Trans = ExsCmd.Transaction
                    End If
                End Using

                If Trans IsNot Nothing Then
                    Trans.Commit()
                End If
                Return TotalBoxes
            Catch ex As Exception
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                End If
                ErrorLogs.LogException(ex, "Error in GenerateStandingInvoiceManualFromTemp")
                Return "error"
            End Try
        End Using
    End Function

    Public Shared Function GenerateAllocationForFutureOrdersFromTemp(ByVal Warehouse As String, ByVal InvenToIgnore As String, ByVal UserName As String, ByVal UserId As String) As String
        If (UserName.Length < 20) Then
            UserName = UserName
        Else
            UserName = UserName.Substring(0, 20)
        End If
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim TotalBoxes As String = "0"
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                Using ExsCmd As New SqlCommand("spCreateInvoicesForAllocation", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@Warehouse", Warehouse)
                    ExsCmd.Parameters.AddWithValue("@InvenToIgnore", InvenToIgnore)
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)
                    ExsCmd.Parameters.AddWithValue("@UserId", UserId)
                    TotalBoxes = ExsCmd.ExecuteScalar()
                    If ExsCmd.Transaction Is Nothing Then
                        Trans = ExsCmd.Transaction
                    End If
                End Using

                If Trans IsNot Nothing Then
                    Trans.Commit()
                End If
                Return TotalBoxes
            Catch ex As Exception
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                End If
                ErrorLogs.LogException(ex, "Error in GenerateStandingInvoiceManualFromTemp")
                Return "error"
            End Try
        End Using
    End Function

    Public Shared Function GetSaveOrderWarehouse(ByVal OrderNo As String, ByVal Customer As String) As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim MsgString As String = 0, order As Integer = 0, customerNo As Integer = 0

        Integer.TryParse(OrderNo, order)
        Integer.TryParse(Customer, customerNo)

        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Try
                Using ExsCmd As New SqlCommand("spGetSaveOrderWarehouse", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@OrderNo", order)
                    ExsCmd.Parameters.AddWithValue("@Customer", customerNo)
                    MsgString = ExsCmd.ExecuteScalar()
                    Return MsgString
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetSaveOrderWarehouse")
                Return ""
            End Try
        End Using
    End Function
    Public Shared Function GetSaveOrderWarehouseForVet(ByVal OrderNo As String) As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim MsgString As String = 0
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Try
                Using ExsCmd As New SqlCommand("spGetSaveOrderWarehouseForVet", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    MsgString = ExsCmd.ExecuteScalar()
                    Return MsgString
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetSaveOrderWarehouse")
                Return ""
            End Try
        End Using
    End Function

    Public Shared Function CheckAWBByOrderNo(ByVal OrderNo As String, ByVal Customer As String) As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim MsgString As String = 0
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Try
                Using ExsCmd As New SqlCommand("spCheckAWBByOrderNo", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    ExsCmd.Parameters.AddWithValue("@Customer", Customer)
                    MsgString = ExsCmd.ExecuteScalar()
                    Return MsgString
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in CheckAWBByOrderNo")
                Return ""
            End Try
        End Using
    End Function
    Public Shared Function LoadWareHouseDDLData(UserID As String) As List(Of WareHouseDDLModel)
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim WareHouseList As New List(Of WareHouseDDLModel)
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Try
                Using cmd As New SqlCommand("SP_tblWarehouse_DDL", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@UserID", UserID)
                    Dim dt As New DataTable()
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim w As New WareHouseDDLModel()
                        w.Name = row("Name")
                        w.Code = row("Code")
                        w.IsDefault = row("IsDefault")
                        WareHouseList.Add(w)
                    Next
                    Return WareHouseList
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in LoadWareHouseDDLData")
                Return WareHouseList
            End Try
        End Using
    End Function

    Public Shared Function DeleteTempStandingOrder(ByVal UserId As String) As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim MsgString As String = 0
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                Using ExsCmd As New SqlCommand("spDeleteTempStandingOrder", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@UserId", UserId)
                    MsgString = ExsCmd.ExecuteScalar()
                    If ExsCmd.Transaction Is Nothing Then
                        Trans = ExsCmd.Transaction
                    End If
                End Using
                If Trans IsNot Nothing Then
                    Trans.Commit()
                End If
                Return MsgString
            Catch ex As Exception
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                End If
                ErrorLogs.LogException(ex, "Error in DeleteTempStandingOrder")
                Throw ex
            End Try
        End Using
    End Function
    Public Shared Function ClearStandingOrders() As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Try
                Using ExsCmd As New SqlCommand("SpStandingOrdersClear", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.ExecuteNonQuery()
                    Return "success"
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in ClearStandingOrders")
                Throw ex
                Return "error"
            End Try
        End Using
    End Function

    Public Shared Function ExecuteCloseWeek() As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim MsgString As String = 0
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Try
                Using ExsCmd As New SqlCommand("spF_SPORDCloseWeek", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in ExecuteCloseWeek")
                Return "Error"
            End Try
        End Using
    End Function

    Public Shared Function UpdateQtyTempStandingOrder(ByVal SelectedStr As String) As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim MsgString As String = 0
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                Using ExsCmd As New SqlCommand("spUpdateQtyTempStandingOrder", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@SelectedStr", SelectedStr)
                    MsgString = ExsCmd.ExecuteScalar()
                    If ExsCmd.Transaction Is Nothing Then
                        Trans = ExsCmd.Transaction
                    End If
                End Using
                If Trans IsNot Nothing Then
                    Trans.Commit()
                End If
                Return MsgString
            Catch ex As Exception
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                End If
                ErrorLogs.LogException(ex, "Error in UpdateQtyTempStandingOrder")
                Throw ex
            End Try
        End Using
    End Function
    Public Shared Function DeleteTempSalesOrderAllocation(ByVal UserId As String) As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim MsgString As String = 0
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                Using ExsCmd As New SqlCommand("spDeleteTempSalesOrderAllocation", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@UserId", UserId)
                    MsgString = ExsCmd.ExecuteScalar()
                    If ExsCmd.Transaction Is Nothing Then
                        Trans = ExsCmd.Transaction
                    End If
                End Using
                If Trans IsNot Nothing Then
                    Trans.Commit()
                End If
                Return MsgString
            Catch ex As Exception
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                End If
                ErrorLogs.LogException(ex, "Error in DeleteTempSalesOrderAllocation")
                Throw ex
            End Try
        End Using
    End Function

    Public Shared Function UpdateQtyTempSalesOrderAllocation(ByVal SelectedStr As String) As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim MsgString As String = 0
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                Using ExsCmd As New SqlCommand("spUpdateQtyTempSalesOrderAllocation", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@SelectedStr", SelectedStr)
                    MsgString = ExsCmd.ExecuteScalar()
                    If ExsCmd.Transaction Is Nothing Then
                        Trans = ExsCmd.Transaction
                    End If
                End Using
                If Trans IsNot Nothing Then
                    Trans.Commit()
                End If
                Return MsgString
            Catch ex As Exception
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                End If
                ErrorLogs.LogException(ex, "Error in UpdateQtyTempSalesOrderAllocation")
                Throw ex
            End Try
        End Using
    End Function

    ''' <summary>
    ''' Mani:: Move Orderdetails from one order to anouther order
    ''' </summary>
    ''' <param name="OrderNo"></param>
    ''' <returns></returns>
    Public Shared Function DropOrderRowsIntoAnotherOrder(ByVal OrderNo As String, ByVal OrderDetailIDs As String, ByVal UserName As String, ByVal IsConsol As String) As String
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If


            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using ExsCmd As New SqlCommand("SPDropOrderDetailtoAnotherOrder", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    ExsCmd.Parameters.AddWithValue("@OrderDetailIDs", OrderDetailIDs)
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)
                    ExsCmd.Parameters.AddWithValue("@IsConsol", IsConsol)
                    ExsCmd.ExecuteNonQuery()
                End Using

            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DropOrderRowsIntoAnotherOrder")
            Throw ex
        End Try
    End Function




    Public Shared Function DeleteOrderDetail(ByVal OrderDetailID As String, ByVal UserName As String) As String
        Try

            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            Dim DeleteResult = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPDeleteOrderDetail", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@OrderDetailID", OrderDetailID)
                    ExsCmd.Parameters.AddWithValue("@USERNAME", UserName)
                    Dim da As New SqlDataAdapter(ExsCmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    Try
                        DeleteResult = Convert.ToString(ds.Tables(1)(0)("DeleteResult"))
                    Catch ex As Exception
                        DeleteResult = Convert.ToString(ds.Tables(0)(0)("DeleteResult"))
                    End Try

                End Using
            End Using
            Return DeleteResult

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteOrderDetail")
            Throw ex
        End Try
    End Function

    Public Shared Function DeleteOrderMiscDetail(ByVal OrderDetailID As String, ByVal UserName As String) As String
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            Dim DeleteResult = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPDeleteOrderMiscDetail", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@OrderDetailID", OrderDetailID)
                    ExsCmd.Parameters.AddWithValue("@USERNAME", UserName)
                    DeleteResult = ExsCmd.ExecuteScalar()
                End Using
            End Using
            Return DeleteResult
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteOrderDetail")
            Throw ex
        End Try
    End Function

    Public Shared Function DeleteVetMiscDetail(ByVal ID As String, ByVal UserName As String) As String
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            Dim DeleteResult = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPDeleteVetMiscDetail", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@OrderDetailID", ID)
                    ExsCmd.Parameters.AddWithValue("@USERNAME", UserName)
                    DeleteResult = ExsCmd.ExecuteScalar()
                End Using
            End Using
            Return DeleteResult
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteOrderDetail")
            Throw ex
        End Try
    End Function

    ''' <summary>
    '''MANI:23-FEB-2018 When Edit on "K" In Order Update get the details for the line
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    Public Shared Function GetOrderDetailsForMISC(ByVal ID As String, ByVal ReadFromVET As String) As BO.SalesDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim o As New BO.SalesDetail
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Dim tablename As String = ""
                Dim IdentityColumn As String = ""
                If ReadFromVET = "1" Then
                    tablename = "VET_"
                    IdentityColumn = "ID"
                Else
                    tablename = "F_order2"
                    IdentityColumn = "SQLID"
                End If

                Using Cmd As New SqlCommand("select Flower,BOXES,PRICE,COST,[DESC] AS FlowerName from " + tablename + " where " + IdentityColumn + "=" + ID + "", Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        o.Flower = dt(0)("Flower")
                        o.FuelBoxes = dt(0)("BOXES")
                        o.Price = dt(0)("PRICE")
                        o.Cost = dt(0)("COST")
                        o.NAME = dt(0)("FlowerName")
                    End If
                    Return o
                End Using

            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesDetailsGridlist")
            Throw ex
        End Try
    End Function

    ''' <summary>
    '''MANI:07-APR-2018 When Edit on Order Update get the details for the line
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    Public Shared Function GetOrderDetailsByID(ByVal ID As String) As BO.SalesDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim o As New BO.SalesDetail
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetOrderDetailsByID", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@Order2Id", ID)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        o.Flower = dt(0)("Flower")
                        o.NAME = dt(0)("Desc")
                        o.Boxes = dt(0)("BOXES")
                        o.Price = dt(0)("PRICE")
                        o.Units = dt(0)("Units")
                        o.PlusFuel = dt(0)("PlusFuel")
                        o.FOB = dt(0)("FOB")
                        If o.PlusFuel <= 0 Then
                            If dt(0)("Tax3") <> 0 Then
                                o.PlusFuel = o.Price + (dt(0)("Tax3") / o.Units)
                            Else
                                o.PlusFuel = o.FOB
                            End If
                        End If

                        o.InvenID = dt(0)("IDInven")
                        o.Type = dt(0)("Type")
                        o.AvailableBoxes = dt(0)("AvailableBoxes")
                        o.DateCode = Convert.ToString(dt(0)("DateCode"))
                        o.UPC = Convert.ToString(dt(0)("UPC"))
                        o.UPCPRICE = Convert.ToString(dt(0)("UPCPRICE"))
                        o.BoxCode = Convert.ToString(dt(0)("BoxCode"))
                        o.StoreNo = Convert.ToString(dt(0)("Store"))
                        o.UOM = dt(0)("UOM")
                        o.FarmCode = dt(0)("FARMCODE")
                        o.Cost = dt(0)("LandedCost")
                        o.FBE = dt(0)("FBE")
                        o.Cubes = dt(0)("Cubes")
                        o.BoxLength = dt(0)("L")
                        o.BoxWidth = dt(0)("W")
                        o.BoxHeight = dt(0)("H")
                        o.Dimentions = dt(0)("DIMENSIONS")
                        o.gpm = dt(0)("GPM")

                    End If
                    Return o
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetOrderDetailsByID")
            Throw ex
        End Try
    End Function

    Public Shared Function GetFutureOrderDetailsByID(ByVal ID As String, ByVal ClosedInv As String) As BO.SalesDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim o As New BO.SalesDetail
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetFutureOrderDetailsByID", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@Order2Id", ID)
                    Cmd.Parameters.AddWithValue("@ClosedInv", ClosedInv)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        o.ID = dt(0)("SQLID")
                        o.Flower = dt(0)("Flower")
                        o.NAME = dt(0)("Desc")
                        o.Boxes = dt(0)("BOXES")
                        o.Price = dt(0)("PRICE")
                        o.Cost = dt(0)("Cost")
                        o.Units = dt(0)("Units")
                        o.UOM = Convert.ToString(dt(0)("UOM"))
                        o.BoxCode = Convert.ToString(dt(0)("BOXCODE"))
                        o.FarmCode = dt(0)("FARMCODE")
                        o.Notes = dt(0)("NOTES")
                        o.PODFlower = dt(0)("PONUM")
                        o.ShipDate = dt(0)("SHIPDATE")
                        o.PODate = dt(0)("PODATE")
                        o.POBoxNum = dt(0)("BOXNUM")
                        o.PONotes = dt(0)("Notes")
                        ''2021/08/14
                        o.UPC = dt(0)("UPC")
                        o.UPCPRICE = dt(0)("UPCPRICE")
                        o.DateCode = dt(0)("DateCode")

                    End If
                    Return o
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFutureOrderDetailsByID")
            Throw ex
        End Try
    End Function

    Public Shared Function GetOrderDetailsForPOByID(ByVal ID As String) As BO.SalesDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim o As New BO.SalesDetail
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetOrderDetailForPOByID", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@SQLID", ID)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        o.Flower = dt(0)("FLOWER")
                        o.NAME = dt(0)("FLOWERNAME")
                        o.Boxes = dt(0)("BOXES")
                        o.Price = dt(0)("PRICE")
                        o.Units = dt(0)("UNITS")
                        o.FOB = dt(0)("FOB")
                        'o.InvenID = dt(0)("IDInven")
                        o.Type = dt(0)("TYPE")
                        'o.AvailableBoxes = dt(0)("AvailableBoxes")
                        o.DateCode = Convert.ToString(dt(0)("DateCode"))
                        o.UPC = Convert.ToString(dt(0)("UPC"))
                        ''2021/08/30
                        o.UPCPRICE = Convert.ToString(dt(0)("UPCPRICE"))
                        o.UPCDESC = Convert.ToString(dt(0)("UPCDESC"))

                        o.BoxCode = Convert.ToString(dt(0)("BoxCode"))
                        'o.StoreNo = Convert.ToString(dt(0)("Store"))
                        o.ShipDate = Convert.ToDateTime(dt(0)("SHIPDATE")).ToString("MM/dd/yyyy")
                        o.CargoDate = Convert.ToDateTime(dt(0)("CARGODATE")).ToString("MM/dd/yyyy")
                        o.UOM = dt(0)("UOM")
                        o.FarmCode = dt(0)("FARMCODE")
                        o.Cost = dt(0)("Cost")
                        o.Origin = dt(0)("ORIGIN")
                        o.Notes = dt(0)("COMMENTS")

                        o.wh = dt(0)("WH")
                    End If
                    Return o
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetOrderDetailsByID")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Get Sales Header Details from F_order1
    ''' </summary>
    ''' <param name="OrderNo"></param>
    ''' Muthu Nivetha M :: 06 Mar 19 :: Salesperson number assigned to sale in F_order1 should always be the salesperson number for the account in f_cust :: Modified
    ''' <returns></returns>
    Public Shared Function GetOrderHeaderByOrderNo(ByVal OrderNo As String, ByVal Customer As String) As BO.SalesHeader
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.SalesHeader
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using cmd As New SqlCommand("spGetOrderHeaderByOrderNo", Con)                                   ' Muthu Nivetha M :: 06 Mar 19
                    'Using cmd As New SqlCommand("spGetOrderHeaderByOrderNo_temp", Con)                                    ' Muthu Nivetha M :: 06 Mar 19
                    cmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    'cmd.Parameters.AddWithValue("@Customer", Customer)
                    cmd.CommandType = CommandType.StoredProcedure                                               ' Muthu Nivetha M :: 06 Mar 19
                    Using row As SqlDataReader = cmd.ExecuteReader()
                        While (row.Read())
                            u.Order = row("ORDER")
                            u.Carrier = Convert.ToString(row("Carrier"))
                            u.ShippingDate = Convert.ToDateTime(IIf(Convert.ToString(row("Date")) = "01/01/1900", DateTime.Now, row("Date"))).ToString("MM/dd/yyyy")
                            u.AWB = Convert.ToString(row("AWB"))
                            u.PO = Convert.ToString(row("PO"))

                            u.CutOff = Convert.ToString(row("Cutoff"))
                            u.CustMsg1 = Convert.ToString(row("text1"))
                            u.CustMsg2 = Convert.ToString(row("text2"))
                            u.CustMsg3 = Convert.ToString(row("text3"))
                            u.CustMsg4 = Convert.ToString(row("text4"))
                            u.CustMsg5 = Convert.ToString(row("text5"))

                            u.ShipMsg1 = Convert.ToString(row("SHIPTEXT1"))
                            u.ShipMsg2 = Convert.ToString(row("SHIPTEXT2"))
                            u.ShipMsg3 = Convert.ToString(row("SHIPTEXT3"))
                            u.ShipMsg4 = Convert.ToString(row("SHIPTEXT4"))
                            u.ShipMsg5 = Convert.ToString(row("SHIPTEXT5"))
                            u.Terms = Convert.ToString(row("Terms"))
                            u.Shipto = Convert.ToString(row("shipto"))
                            u.ShiptoName = Convert.ToString(row("SHIPTONAME"))
                            u.ShiptoAddress1 = Convert.ToString(row("SHIPTOADD1"))
                            u.ShiptoAddress2 = Convert.ToString(row("SHIPTOADD2"))
                            u.ShiptoCity = Convert.ToString(row("SHIPTOCITY"))
                            u.ShiptoState = Convert.ToString(row("SHIPTOST"))
                            u.ShiptoZip = Convert.ToString(row("SHIPTOZIP"))
                            u.ShiptoCountry = Convert.ToString(row("SHIPTOCTRY"))
                            u.Phone = Convert.ToString(row("PHONE"))
                            u.Fax = Convert.ToString(row("FAX"))
                            u.Contact = Convert.ToString(row("CONTACT"))
                            ' u.SLSMAN = Convert.ToString(row("CUST_SLSMAN"))                               ' Muthu Nivetha M :: 06 Mar 19
                            u.SLSMAN = If(Convert.ToString(row("SLSMAN")) = "" Or row("SLSMAN") Is DBNull.Value, Convert.ToString(row("CUST_SLSMAN")), Convert.ToString(row("SLSMAN")))                                ' Muthu Nivetha M :: 01 Apr 19

                        End While
                    End Using
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetOrderDetailsByOrderNo")
            Throw ex
        End Try
    End Function

    Public Shared Function GetPoqAwbByOrderDetailId(ByVal OrderDetailId As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim dt As New DataTable()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spGetPoqAwbByOrderDetailId", Con)
                    cmd.Parameters.AddWithValue("@OrderDetailId", OrderDetailId)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                End Using
            End Using
            If (dt.Rows.Count() > 0) Then
                Return dt.Rows(0)("AWB")
            Else
                Return ""
            End If
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPoqAwbByOrderDetailId")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Muthu Nivetha M :: 17Feb2020 :: Modified :: To add Dimentions on Orderdetails grid
    ''' </summary>
    Public Shared Function GetSalesOrderDetailsList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                             ByVal numberOfRows As Integer, Optional ByVal userid As Integer = 0) As List(Of BO.SalesDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = ""
                End If

                Dim Qry As String = ""
                'Muthu Nivetha M :: 14 Mar 19 ::  Locks up system :: Sales-Person
                'If (whereClause = Nothing) Then
                '    If userid = 0 Then
                '        Qry = String.Format("Select * from vwOrderDetailsGrid vw where customer<>0 order by {0}", sortExp)
                '    Else
                '        Qry = String.Format("Select * from vwOrderDetailsGrid vw " +
                '                        "Join tblunsavedorders uso on vw.SQLID=uso.Order2ID and uso.userid=" + userid.ToString() + " where vw.customer<>0 order by {0}", sortExp)
                '    End If

                'Else
                '    If userid = 0 Then
                '        Qry = String.Format("Select * from vwOrderDetailsGrid vw where {0} and customer<>0 order by {1}", whereClause, sortExp)
                '    Else
                '        Qry = String.Format("Select * from vwOrderDetailsGrid vw " +
                '                        "Join tblunsavedorders uso on vw.SQLID=uso.Order2ID and uso.userid=" + userid.ToString() + " where {0} and vw.customer<>0 order by {1}", whereClause, sortExp)
                '    End If

                'End If
                Using cmd As New SqlCommand("spGetSalesOrderDetailsListForOrder", Con)
                    cmd.Parameters.AddWithValue("@whereclause", IIf(whereClause Is Nothing, "", whereClause))
                    cmd.Parameters.AddWithValue("@sortExp", sortExp)
                    cmd.Parameters.AddWithValue("@userid", IIf(userid = 0, "", userid.ToString()))
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    Dim Orderdt = ds
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim TotalUnits As Integer = 0
                    Dim TotalBoxes As Integer = 0
                    Dim TotalCost As Decimal = 0
                    Dim Totalgpm As Decimal = 0
                    Dim TotalInvAmount As Decimal = 0
                    Dim TotalFOBAmount As Decimal = 0
                    Dim TotalInvCost As Decimal = 0
                    Dim TotalFBE As Decimal = 0
                    Dim TotalGrandTotal As Decimal = 0
                    Dim TotalFOB As Decimal = 0
                    Dim TotalLandedCost As Decimal = 0
                    If (ds.Rows.Count > 0) Then
                        If Not ds.Compute("Sum(Boxes)", "Type <> 'K'") Is DBNull.Value Then
                            TotalBoxes = ds.Compute("Sum(Boxes)", "Type <> 'K'")
                            TotalUnits = ds.Compute("Sum(TotalUnits)", "Type <> 'K'")
                            TotalFOB = ds.Compute("Sum(FOB)", "Type <> 'K'")
                            TotalFOBAmount = ds.Compute("Sum(nInvFobAmount)", "Type <> 'K'")
                            TotalLandedCost = ds.Compute("Sum(TotalLandedCost)", "Type <> 'K'")
                        End If

                        TotalInvCost = ds.Compute("Sum(nCost)", "")
                        TotalCost = ds.Compute("Sum(TotalCost)", "")
                        If (TotalFOBAmount <> 0) Then
                            'Totalgpm = ((TotalFOBAmount - TotalInvCost) / TotalFOBAmount) * 100
                            Totalgpm = ((TotalFOBAmount - TotalLandedCost) / TotalFOBAmount) * 100
                        End If

                    End If

                    For Each row In ds.Rows
                        Dim u As New BO.SalesDetail
                        u.ID = row("SQLID")
                        ' u.Order2ID = row("ID")
                        u.Order = row("ORDER")
                        u.CustCode = row("CUSTCODE")
                        u.CustName = Convert.ToString(row("CUSTOMERNAME")).Replace("'", "")
                        u.FarmCode = Convert.ToString(row("FARMCODE"))
                        'u.FarmDetails.FarmCode = row("FARMCODE")
                        'u.FlowerDetails.Flower = row("FLOWER")
                        u.Flower = Convert.ToString(row("FLOWER"))
                        'u.FlowerDetails.Name = row("NAME")
                        u.NAME = Convert.ToString(row("NAME"))
                        u.SLSMAN = Convert.ToString(row("SLSNAME"))
                        u.ShippingDate = Convert.ToDateTime(IIf(Convert.ToString(row("Date")) = "", DateTime.Now, row("Date"))).ToString("yyyy-MM-dd")
                        u.Price = row("Price")
                        u.FOB = If(row("FOB") Is DBNull.Value, 0.00, row("FOB"))
                        u.BGColor = Convert.ToString(row("BGCOLOR"))
                        u.FontColor = Convert.ToString(row("FONTCOLOR"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.Boxes1 = IIf(row("Type") = "K", row("BOXES"), Convert.ToInt32(row("BOXES")))
                        u.FBE = row("TOTALFBE")
                        u.Units = row("Units")
                        u.UnitsBunch = row("UNITSBUNCH")
                        u.TotalUnits1 = IIf(row("Type") = "K", row("TOTALUNITS"), Convert.ToInt32(row("TOTALUNITS")))
                        u.Cost = row("COST")
                        u.OtherCost = row("OtherCost")
                        u.Handling = row("Handling")
                        u.Landedcost = row("Landedcost")
                        u.ANDEAN = row("ANDEAN")
                        u.TotalCost = row("TOTALCOST")
                        u.InvenType = Convert.ToString(row("INVENTYPE"))
                        u.Type = Convert.ToString(row("Type"))
                        u.BoxNum = row("BOXNUM")
                        u.BoxCode = If(row("BOXCODE") Is DBNull.Value Or row("BOXCODE") = "", "", row("BOXCODE").ToString().ToUpper())
                        u.AWB = row("AWB")
                        u.IsVoid = If(row("VOID") Is DBNull.Value, False, row("VOID"))                              'Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
                        If (Convert.ToString(row("gpm")) <> "") Then
                            u.gpm = Convert.ToDecimal(row("gpm"))
                        End If
                        u.TotalRows = TotalCount
                        u.PODFlower = Convert.ToString(row("PODFlower"))
                        u.ShipDate = If(row("ShipDate") Is DBNull.Value, "", row("ShipDate"))
                        u.Status = If(row("POSTAT") Is DBNull.Value, "", row("POSTAT"))
                        u.UPC = Convert.ToString(row("UPC"))
                        u.UPCPRICE = Convert.ToString(row("UPCPRICE"))

                        u.Retail = Convert.ToBoolean(row("RETAIL"))
                        u.TotPerLine = If(Convert.ToBoolean(row("RETAIL")) = False, Convert.ToDecimal(row("BOXES") * row("Units") * If(row("FOB") Is DBNull.Value, 0.00, row("FOB"))), Convert.ToDecimal(row("BOXES") * If(row("FOB") Is DBNull.Value, 0.00, row("FOB")))) '25 Aug 2020:: Belal :: IF Retial=False then use unit otherwise remove unit'
                        TotalGrandTotal += u.TotPerLine
                        TotalFBE += u.FBE
                        u.EXTRAFIELD = IIf(row("EXTRAFIELD") IsNot DBNull.Value, Convert.ToString(row("EXTRAFIELD")), "") '27 Mar 19 :: Muthu Nivetha M ::  On invoice show if line is a substitute 
                        u.InvenID = Convert.ToString(row("IDINVEN"))
                        u.BoxLength = If(row("L") Is DBNull.Value, 0, If(row("L").ToString().Trim() = "", 0, row("L")))
                        u.BoxHeight = If(row("H") Is DBNull.Value, 0, If(row("H").ToString().Trim() = "", 0, row("H")))
                        u.BoxWidth = If(row("W") Is DBNull.Value, 0, If(row("W").ToString().Trim() = "", 0, row("W")))
                        u.Dimentions = If(u.Type <> "K", u.BoxLength.ToString() + "x" + u.BoxWidth.ToString() + "x" + u.BoxHeight.ToString(), "")

                        u.Freightout = If(row("Freightout") Is DBNull.Value, 0.00, row("Freightout"))

                        ulistsalesDetails.Add(u)
                    Next
                    Dim sd As New BO.SalesDetail()
                    sd.ID = 0
                    sd.Order = 0
                    sd.CustCode = 0
                    sd.FarmCode = ""
                    sd.Flower = ""
                    sd.NAME = ""
                    sd.CustName = ""
                    sd.FarmDetails.FarmCode = ""
                    sd.FlowerDetails.Flower = ""
                    sd.FlowerDetails.Name = ""
                    sd.FlowerDetails.BGColor = ""
                    sd.FlowerDetails.FontColor = ""
                    sd.Boxes1 = TotalBoxes
                    sd.UOM = ""
                    sd.FBE = TotalFBE
                    sd.Units = 0
                    sd.UnitsBunch = 0
                    sd.TotalUnits1 = TotalUnits
                    sd.Cost = 0
                    sd.OtherCost = 0
                    sd.Handling = 0
                    sd.ANDEAN = 0
                    sd.Landedcost = 0
                    sd.TotalCost = TotalCost
                    sd.InvenType = ""
                    sd.Type = ""
                    sd.BoxNum = 0
                    sd.BoxCode = ""
                    sd.AWB = 0
                    sd.TotalRows = TotalCount
                    sd.ShippingDate = Convert.ToDateTime("01/01/1900") '.Date
                    sd.Price = 0
                    sd.SLSMAN = ""
                    'sd.gpm = Math.Truncate(Totalgpm * 10) / 10
                    sd.gpm = Totalgpm
                    sd.PODFlower = ""
                    sd.UPC = ""
                    sd.UPCPRICE = ""
                    'sd.FOB = TotalFOB
                    sd.FOB = 0
                    sd.TotPerLine = 0
                    sd.GrandTotal = TotalGrandTotal
                    sd.IsVoid = False   'Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
                    sd.EXTRAFIELD = ""  '27 Mar 19 :: Muthu Nivetha M ::  On invoice show if line is a substitute 
                    sd.InvenID = ""
                    sd.BoxLength = 0
                    sd.BoxWidth = 0
                    sd.BoxHeight = 0
                    sd.Dimentions = ""
                    sd.Freightout = 0
                    ulistsalesDetails.Add(sd)
                End Using
            End Using
            Return ulistsalesDetails
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesOrderDetailsList")
            Throw ex
        End Try
    End Function

    ''' <summary>
    '''  ANITHA :: 03-MAR-2018 :: BLOOM-20538 :: Order Header Grid move to SQL :: Header Grid from SQL
    ''' </summary>
    ''' <param name="whereClause"></param>
    ''' <param name="sortExp"></param>
    ''' <param name="startRowIndex"></param>
    ''' <param name="numberOfRows"></param>
    ''' <param name="FilterDivision"></param>
    ''' <returns></returns>
    Public Shared Function GetSalesOrderSummaryListSQL(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                 ByVal numberOfRows As Integer, ByVal FilterDivision As String) As List(Of BO.SalesSummary)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesSummary As New List(Of BO.SalesSummary)

            Dim TotalInvAmount As Decimal = 0
            Dim TotalGPM As Decimal = 0
            Dim TotalFOBAmount As Decimal = 0
            Dim TotalInvCost As Decimal = 0

            Using Con As New SqlConnection(ConStr)
                Con.Open()

                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "SALESMAN"
                End If

                Using cmd As New SqlCommand("spGetSalesSummaryGridlist", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@WhereClause", whereClause)
                    cmd.Parameters.AddWithValue("@SortExpression", sortExp)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable

                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1

                    ds.Columns.Add(INCcolumn)
                    da.Fill(ds)
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim PagedDataSet As DataTable = Nothing
                    Dim TotalSalesManName As New List(Of String)()
                    Dim TotalSales As Decimal = 0
                    Dim TotalProfit As Decimal = 0
                    Dim TotalBoxes As Integer = 0
                    Dim TotalINV As Decimal = 0
                    Dim TotalFBE As Decimal = 0
                    Dim TotalSalesPeopleFBE As Decimal = 0
                    Dim TotalC As Decimal = 0
                    Dim TotalI As Decimal = 0
                    Dim GPM As Decimal = 0
                    If TotalCount <> 0 And startRowIndex <> 0 Then
                        If (TotalCount <> startRowIndex) Then
                            PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + (startRowIndex + numberOfRows).ToString() + "").CopyToDataTable()
                        Else
                            PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + startRowIndex.ToString() + "").CopyToDataTable()
                        End If


                        For Each row In PagedDataSet.Rows
                            Dim u As New BO.SalesSummary
                            u.RowNo = row("RECNO")
                            u.SALESMAN = row("SALESMAN")
                            u.SalesManName = row("SalesManName")
                            'TotalSalesManName.Add(u.SalesManName)
                            'Dim TotalSalesManNameList = TotalSalesManName.Count
                            u.Boxes = row("BOXES")
                            TotalBoxes += u.Boxes
                            u.SALES = row("SALES")
                            TotalSales += u.SALES
                            u.PROFIT = row("Profit")
                            TotalProfit += u.PROFIT
                            If (Convert.ToString(row("GPM")) <> "") Then
                                'u.gpm = Math.Truncate(row("gpm") * 10) / 10
                                u.gpm = Convert.ToDecimal(row("GPM"))
                            End If
                            GPM += u.gpm
                            u.C = row("C")
                            TotalC += u.C
                            u.I = row("I")
                            TotalI += u.I
                            u.INV = row("INV")
                            TotalINV += u.INV
                            'row("SALES") / row("I")
                            u.FBE = row("FBE")
                            TotalFBE += u.FBE
                            TotalSalesPeopleFBE = TotalFBE / TotalCount
                            'row("SALES") / row("BOXES")
                            u.TotalRows = TotalCount
                            ulistsalesSummary.Add(u)
                        Next
                    End If

                    Dim t As New BO.SalesSummary
                    t.RowNo = 0
                    t.SALESMAN = 0
                    t.SalesManName = ""
                    t.Boxes = TotalBoxes
                    t.SALES = TotalSales
                    t.PROFIT = TotalProfit
                    t.gpm = GPM
                    t.C = TotalC
                    t.I = TotalI
                    t.INV = TotalINV
                    t.FBE = TotalSalesPeopleFBE
                    t.TotalRows = TotalCount
                    ulistsalesSummary.Add(t)
                End Using
            End Using
            Return ulistsalesSummary
        Catch ex As Exception
            Throw ex
        End Try
    End Function


    Public Shared Function InsertOrderLock(ByVal OrderNumber As String) As String


        Try

            Dim UserId As Integer = 0
            Dim Username As String = ""

            Dim User As New User
            If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                User = System.Web.HttpContext.Current.Session("LoginUserDetails")
            Else

                Return "Logout"
            End If
            UserId = User.ID
            Username = User.UserName
            Dim IsExist As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SpInsertOrderLock", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@OrderNumber", OrderNumber)
                    cmd.Parameters.AddWithValue("@Username", Username)
                    cmd.Parameters.AddWithValue("@UserID", UserId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    IsExist = Convert.ToString(dt(0)(0)).Trim()
                End Using
            End Using
            Return IsExist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertOrderLock")
            Return "error"
        End Try
    End Function

    Public Shared Function FuelUpdate(ByVal OrderNumber As String) As String
        Try
            Dim Username As String = ""

            Dim User As New User
            If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                User = System.Web.HttpContext.Current.Session("LoginUserDetails")
            Else
                Return "Logout"
            End If
            Username = User.UserName
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spFuelUpdateOnEscpClose", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@OrderNo", OrderNumber)
                    cmd.Parameters.AddWithValue("@AddUser", Username)
                    cmd.ExecuteNonQuery()
                End Using
                Return "Success"
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In FuelUpdate")
            Return "error"
        End Try
    End Function

    Public Shared Function DeleteOrderLock(ByVal OrderNumber As String) As String
        Try
            Dim rows As String = ""

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SpDeleteOrderLock", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@OrderNumber", OrderNumber)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    rows = Convert.ToString(dt(0)(0)).Trim()
                End Using
            End Using
            Return rows
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In DeleteOrderLock")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' Anitha :: 05/09/2018 :: insert into order tables
    ''' </summary>
    ''' <param name="Header"></param>
    ''' <param name="Detail"></param>
    ''' <param name="UserName"></param>
    ''' <param name="UserID"></param>
    ''' <returns></returns>
    Public Shared Function InsertCustomerSalesOrder(ByVal Header As Object, ByVal Detail As Object, ByVal UserName As String, ByVal UserID As String) As BO.EmailLog
        Try

            Dim objeLog As New BO.EmailLog
            Dim Carrier = Header("CarrierID")
            Dim Customer = Header("Customer")
            Dim PONO = Header("PONo")
            Dim ShipDate = Header("ShipDate")
            Dim ShipTo = Header("ShipTo")
            Dim TotalAmout = Header("TotalAmt")

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Dim Detaillst As New List(Of BO.SalesDetail)
            For Each det In Detail
                If Customer = Nothing Then
                    Continue For
                End If
                If det("ProductCode") = Nothing Then
                    Continue For
                End If
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SPADDUPDATEOrderDetail", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@OrderDetailID", "")
                        cmd.Parameters.AddWithValue("@ORDER", "0")
                        cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                        cmd.Parameters.AddWithValue("@InvSqlId", det("IDINVEN"))
                        cmd.Parameters.AddWithValue("@BalanceQtyToInsert", det("InCart"))
                        cmd.Parameters.AddWithValue("@PRICE", det("Price"))
                        cmd.Parameters.AddWithValue("@SalesType", "I")
                        cmd.Parameters.AddWithValue("@Units", det("Units"))
                        cmd.Parameters.AddWithValue("@PlusFuel", "")
                        cmd.Parameters.AddWithValue("@USERNAME", UserName)
                        cmd.Parameters.AddWithValue("@USERID", UserID)
                        cmd.ExecuteNonQuery()
                    End Using
                End Using
            Next

            Dim CustomerData As DataRow = GetCustomerRecordByID(Customer)
            Dim CustomerEmail = CustomerData("EMAIL") 'getting CustomerEmail  from DBF
            Dim SLSMAN = CustomerData("SALESMAN") 'getting SLSMAN  from DBF
            Dim Terms = CustomerData("TERMS") 'customer Terms 
            Dim SalesManEmail As String
            SalesManEmail = ""
            If (SLSMAN <> Nothing) Then
                SalesManEmail = GetDflowerSalesManEmail(SLSMAN)
            End If

            Dim NextInvoiceNoFromConstant As Integer = 0
            NextInvoiceNoFromConstant = DAO.Constant.GetNextInvoiceNumFromConstant()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SPCreateNewOrder", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IsNewOrder", "1")
                    cmd.Parameters.AddWithValue("@ORDER", NextInvoiceNoFromConstant)
                    cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    cmd.Parameters.AddWithValue("@Shippingdate", ShipDate)
                    cmd.Parameters.AddWithValue("@Carrier", Carrier)
                    cmd.Parameters.AddWithValue("@AWB", "")
                    cmd.Parameters.AddWithValue("@WH", "")
                    cmd.Parameters.AddWithValue("@CUSTPO", PONO)
                    cmd.Parameters.AddWithValue("@SALESMAN", SLSMAN)
                    cmd.Parameters.AddWithValue("@Cutofftime", "")
                    cmd.Parameters.AddWithValue("@text1", "")
                    cmd.Parameters.AddWithValue("@text2", "")
                    cmd.Parameters.AddWithValue("@text3", "")
                    cmd.Parameters.AddWithValue("@text4", "")
                    cmd.Parameters.AddWithValue("@text5", "")
                    cmd.Parameters.AddWithValue("@ShipMsg1", "")
                    cmd.Parameters.AddWithValue("@ShipMsg2", "")
                    cmd.Parameters.AddWithValue("@ShipMsg3", "")
                    cmd.Parameters.AddWithValue("@ShipMsg4", "")
                    cmd.Parameters.AddWithValue("@ShipMsg5", "")
                    cmd.Parameters.AddWithValue("@Shipto", ShipTo)
                    cmd.Parameters.AddWithValue("@Terms", Terms)
                    cmd.Parameters.AddWithValue("@DroporderDetailIDsToNewOrder", "")
                    cmd.Parameters.AddWithValue("@USERNAME", UserName)
                    cmd.Parameters.AddWithValue("@USERID", UserID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            objeLog.CustomerEMail = CustomerEmail
            objeLog.CustomerName = Customer
            objeLog.InvoiceNo = NextInvoiceNoFromConstant
            objeLog.PO = PONO
            objeLog.SalesManEmail = SalesManEmail
            objeLog.TotalAmount = TotalAmout
            objeLog.Subject = ConfigurationManager.AppSettings("CompanyName").ToString() + "Invoice#: " + NextInvoiceNoFromConstant + " ShipDate: " + Convert.ToDateTime(ShipDate.ToString()).ToString("MM-dd-yyyy") + " Total: $" + TotalAmout + " PO#: " + PONO + " Customer: " + Customer + " "
            objeLog.BodyContent = "Invoice#: " + NextInvoiceNoFromConstant + " ShipDate: " + Convert.ToDateTime(ShipDate.ToString()).ToString("MM-dd-yyyy") + "  Total: $" + TotalAmout + " PO#: " + PONO + " Customer: " + Customer + " "
            Dim ToEmail = objeLog.CustomerEMail + "," + objeLog.SalesManEmail
            Logs.SendEmail(objeLog.SalesManEmail, ToEmail, objeLog.BodyContent, "", objeLog.Subject)

            Return objeLog
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertCustomerSalesOrder")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetCustomerRecordByID(ByVal Customer As String) As DataRow
        Dim dtRow As DataRow
        dtRow = Nothing
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dtData As New DataTable
            Using con As New SqlConnection(ConStr)
                con.Open()
                '' spGetCustomerRecordByID
                Using cmd1 As New SqlCommand("spGetCustomerRecordByID", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("Customer", Customer)
                    Dim adp As New SqlDataAdapter(cmd1)
                    adp.Fill(dtData)
                    If (dtData.Rows.Count > 0) Then
                        dtRow = dtData.Rows(0)
                    End If
                End Using
                Return dtRow
            End Using
        Catch ex As Exception
            Return dtRow

        End Try
    End Function

    Public Shared Function GetDflowerSalesManEmail(ByVal SalesMan As String) As String
        Try
            Dim EMAIL As String
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetDflowerSalesManEmail", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("salesMan", SalesMan)
                    Dim sdr As SqlDataReader
                    sdr = Cmd.ExecuteReader()
                    EMAIL = ""
                    While sdr.Read()
                        EMAIL = sdr("EMAIL").ToString()
                        If (EMAIL = Nothing) Then
                            EMAIL = ""
                        End If
                    End While
                    Return EMAIL
                End Using
            End Using
            Return ""
        Catch ex As Exception
            ErrorLogs.LogException(ex, "GetDflowerSalesManEmail")
            Return ex.Message
        End Try
    End Function

    Public Shared Function InsertSalesSummaryReport(ByVal SalesSummaryFromDate As String, ByVal SalesSummaryToDate As String, ByVal UserId As String, ByVal UserType As String, ByVal HistoryRecordsOnly As String, ByVal ds As DataSet, ByVal SalesSummarySelectCarrier As String) As String
        Try
            Dim result As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                ds.DataSetName = "SalesSummaryReport"
                Dim DBFXML = ds.GetXml()

                Using Cmd As New SqlCommand("spGetInvoiceSummaryList", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@FromDate", SalesSummaryFromDate)
                    Cmd.Parameters.AddWithValue("@ToDate", SalesSummaryToDate)
                    Cmd.Parameters.AddWithValue("@UserType", UserType)
                    Cmd.Parameters.AddWithValue("@UserId", UserId)
                    Cmd.Parameters.AddWithValue("@HistoryRecordsOnly", HistoryRecordsOnly)
                    Cmd.Parameters.AddWithValue("@DBFXML", DBFXML)
                    Cmd.Parameters.AddWithValue("@SelectCarrier", SalesSummarySelectCarrier)
                    result = Cmd.ExecuteScalar()
                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "InsertSalesSummaryReport")
            Return ex.Message
        End Try
    End Function

    Public Shared Function CheckSalesSummaryRowCnt(ByVal SalesSummaryFromDate As String, ByVal SalesSummaryToDate As String, ByVal UserId As String, ByVal SalesSummarySelectCarrier As String) As Integer
        Try
            Dim result As Integer
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim WhereClause As String = ""
                WhereClause = "Date>=cast('" + SalesSummaryFromDate + "' as date) And Date<=cast('" + SalesSummaryToDate + "' as date) And UserID=" + UserId + ""
                If SalesSummarySelectCarrier <> "" Then
                    WhereClause = WhereClause + " And Carrier='" + SalesSummarySelectCarrier + "'"
                End If

                Using Cmd As New SqlCommand("select count([ORDER]) from TempSalesSummaryReport where " + WhereClause, Con)
                    Cmd.CommandType = CommandType.Text
                    result = Cmd.ExecuteScalar()
                    Return result
                End Using

            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "CheckSalesSummaryRowCnt")
            Return ex.Message
        End Try
    End Function
    Public Shared Function InsertPrintOrderLog(ByVal OrderNo As String, ByVal PrintInvoice As String, ByVal PrintShippingReport As String,
                                               ByVal PrintPickingList As String, ByVal EmailInvoice As String, ByVal FaxInvoice As String, ByVal Customer As String,
                                               ByVal UserName As String, ByVal ShipDate As String, ByVal UserId As String) As String
        Try
            Dim result As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spInsertOrderPrintLog", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    Cmd.Parameters.AddWithValue("@PrintInvoice", PrintInvoice)
                    Cmd.Parameters.AddWithValue("@PrintShippingReport", PrintShippingReport)
                    Cmd.Parameters.AddWithValue("@PrintPickingList", PrintPickingList)
                    Cmd.Parameters.AddWithValue("@EmailInvoice", EmailInvoice)
                    Cmd.Parameters.AddWithValue("@FaxInvoice", FaxInvoice)
                    Cmd.Parameters.AddWithValue("@Customer", Customer)
                    Cmd.Parameters.AddWithValue("@ADDDATE", Date.Now)
                    Cmd.Parameters.AddWithValue("@ADDTIME", DateTime.Now.ToString("HH:mm:ss"))
                    Cmd.Parameters.AddWithValue("@ADDUSER", UserName)
                    Cmd.Parameters.AddWithValue("@UserId", UserId)
                    Cmd.Parameters.AddWithValue("@ADDAPP", "WEB")
                    Cmd.Parameters.AddWithValue("@ShipDate", ShipDate)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    result = Convert.ToString(dt(0)(0)).Trim() + "~" + Convert.ToString(dt(0)(1)).Trim() + "~" + Convert.ToString(dt(0)(2)).Trim()
                    Return result
                End Using
            End Using
        Catch ex As Exception
            'ErrorLogs.LogException(ex, "InsertPrintOrderLog")
            ErrorLogs.LogException(ex, "InsertPrintOrderLog::" + Convert.ToString(OrderNo) + " Customer: " + Convert.ToString(Customer) + " UserId::" + Convert.ToString(UserId))
            Return ex.Message
        End Try
    End Function

    Public Shared Function ScheduleOrders(ByVal OrderNo As String, ByVal EmailIDs As String, ByVal ShipDate As String, ByVal IsEmailOrFax As String, ByVal Customer As String, ByVal UserId As String) As String
        Try
            Dim result As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spSchedulePrintOrders", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    Cmd.Parameters.AddWithValue("@EmailIds", EmailIDs)
                    Cmd.Parameters.AddWithValue("@Customer", Customer)
                    Cmd.Parameters.AddWithValue("@IsEmailOrFax", IsEmailOrFax)
                    Cmd.Parameters.AddWithValue("@UserId", UserId)
                    Cmd.Parameters.AddWithValue("@ShipDate", ShipDate)
                    Cmd.ExecuteNonQuery()
                    Return "valid"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "ScheduleOrders")
            Return "error" + ex.Message
        End Try
    End Function
    Public Shared Function GetSalesOrderConsolList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                             ByVal numberOfRows As Integer, Optional ByVal userid As Integer = 0) As List(Of BO.SalesDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "[Flower]"
                End If
                Dim Qry As String = ""
                Qry = "spConsolDetailsListSalesOrder"
                Using cmd As New SqlCommand(Qry, Con)
                    cmd.Parameters.AddWithValue("@whereclause", IIf(whereClause Is Nothing, "", whereClause))
                    cmd.Parameters.AddWithValue("@sortExp", sortExp)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    Dim Orderdt = ds
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim TotalUnits As Integer = 0
                    Dim TotalBoxes As Integer = 0
                    Dim TotalCost As Decimal = 0
                    Dim Totalgpm As Decimal = 0
                    Dim TotalInvAmount As Decimal = 0
                    Dim TotalFOBAmount As Decimal = 0
                    Dim TotalInvCost As Decimal = 0
                    Dim TotalFBE As Decimal = 0
                    Dim TotalGrandTotal As Decimal = 0
                    Dim TotalFOB As Decimal = 0
                    Dim TotalCubes As Decimal = 0
                    Dim TotalWeight As Decimal = 0
                    If (ds.Rows.Count > 0) Then
                        If Not ds.Compute("Sum(Boxes)", "Type <> 'K'") Is DBNull.Value Then
                            TotalBoxes = ds.Compute("Sum(Boxes)", "Type <> 'K'")
                            TotalUnits = ds.Compute("Sum(TotalUnits)", "Type <> 'K'")
                            TotalFOB = ds.Compute("Sum(FOB)", "Type <> 'K'")
                            TotalFOBAmount = ds.Compute("Sum(nInvFobAmount)", "Type <> 'K'")
                            TotalWeight = ds.Compute("Sum(WEIGHT)", "Type <> 'K'")
                            TotalCubes = ds.Compute("Sum(Cubes)", "Type <> 'K'")
                        End If
                    End If
                    Dim idval As Integer = 1
                    For Each row In ds.Rows
                        Dim u As New BO.SalesDetail
                        u.Order = row("ORDER")
                        u.FarmCode = Convert.ToString(row("FARMCODE"))
                        u.Flower = Convert.ToString(row("FLOWER"))
                        u.FOB = If(row("FOB") Is DBNull.Value, 0.00, row("FOB"))
                        u.NAME = Convert.ToString(row("DESC"))
                        u.BGColor = Convert.ToString(row("BGCOLOR"))
                        u.FontColor = Convert.ToString(row("FONTCOLOR"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.Boxes1 = IIf(row("Type") = "K", row("BOXES"), Convert.ToInt32(row("BOXES")))
                        u.Units = row("Units")
                        u.TotalUnits1 = IIf(row("Type") = "K", row("TOTALUNITS"), Convert.ToInt32(row("TOTALUNITS")))
                        u.InvenType = Convert.ToString(row("INVENTYPE"))
                        u.TotalRows = TotalCount
                        u.ID = idval
                        idval += 1
                        u.TotPerLine = Convert.ToDecimal(row("BOXES") * row("Units") * If(row("FOB") Is DBNull.Value, 0.00, row("FOB")))
                        TotalGrandTotal += u.TotPerLine
                        TotalFBE += u.FBE
                        u.Boxes = Math.Round(Convert.ToDecimal(row("BOXES")), 0, MidpointRounding.AwayFromZero)
                        u.BoxLength = If(row("L") Is DBNull.Value, 0, row("L"))
                        u.BoxHeight = If(row("H") Is DBNull.Value, 0, row("H"))
                        u.BoxWidth = If(row("W") Is DBNull.Value, 0, row("W"))
                        u.Dimentions = u.BoxLength.ToString() + "x" + u.BoxWidth.ToString() + "x" + u.BoxHeight.ToString()
                        u.Cubes = If(row("Cubes") Is DBNull.Value, 0, row("Cubes"))
                        u.Weight = If(row("WEIGHT") Is DBNull.Value, 0, row("WEIGHT"))
                        u.CAT = If(row("FCAT") Is DBNull.Value, "", row("FCAT"))
                        u.Color = If(row("FColor") Is DBNull.Value, "", row("FColor"))
                        u.VARIETY = If(row("VARIETY") Is DBNull.Value, "", row("VARIETY"))
                        u.GRADE = If(row("GRADE") Is DBNull.Value, "", row("GRADE"))
                        ulistsalesDetails.Add(u)
                    Next
                    Dim po As New BO.SalesDetail()
                    po.ID = 0
                    po.Order = 0
                    po.FarmCode = ""
                    po.Flower = ""
                    po.NAME = ""
                    po.FarmDetails.FarmCode = ""
                    po.FlowerDetails.Flower = ""
                    po.FlowerDetails.Name = ""
                    po.FlowerDetails.BGColor = ""
                    po.FlowerDetails.FontColor = ""
                    po.Boxes1 = TotalBoxes
                    po.UOM = ""
                    po.Units = 0
                    po.TotalUnits1 = TotalUnits
                    po.Cost = 0
                    po.TotalCost = TotalCost
                    po.InvenType = ""
                    po.Type = ""
                    po.TotalRows = TotalCount
                    po.FOB = 0
                    po.TotPerLine = 0
                    po.GrandTotal = TotalGrandTotal
                    po.BoxLength = 0
                    po.BoxHeight = 0
                    po.BoxWidth = 0
                    po.Cubes = TotalCubes
                    po.Weight = Math.Round(TotalWeight)
                    ulistsalesDetails.Add(po)
                End Using
            End Using
            Return ulistsalesDetails
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesOrderConsolList")
            Throw ex
        End Try
    End Function
    Public Shared Function GetSalesOrderDimensionList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                             ByVal numberOfRows As Integer, Optional ByVal userid As Integer = 0) As List(Of BO.SalesDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "[Flower]"
                End If
                Dim Qry As String = ""
                Qry = "spConsolDetailsListSalesOrder"
                Using cmd As New SqlCommand(Qry, Con)
                    cmd.Parameters.AddWithValue("@whereclause", IIf(whereClause Is Nothing, "", whereClause))
                    cmd.Parameters.AddWithValue("@sortExp", sortExp)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    Dim Orderdt = ds
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim TotalUnits As Integer = 0
                    Dim TotalBoxes As Integer = 0
                    Dim TotalCost As Decimal = 0
                    Dim Totalgpm As Decimal = 0
                    Dim TotalInvAmount As Decimal = 0
                    Dim TotalFOBAmount As Decimal = 0
                    Dim TotalInvCost As Decimal = 0
                    Dim TotalFBE As Decimal = 0
                    Dim TotalGrandTotal As Decimal = 0
                    Dim TotalFOB As Decimal = 0
                    Dim TotalCubes As Decimal = 0
                    Dim TotalWeight As Decimal = 0
                    If (ds.Rows.Count > 0) Then
                        If Not ds.Compute("Sum(Boxes)", "Type <> 'K'") Is DBNull.Value Then
                            TotalBoxes = ds.Compute("Sum(Boxes)", "Type <> 'K'")
                            TotalUnits = ds.Compute("Sum(TotalUnits)", "Type <> 'K'")
                            TotalFOB = ds.Compute("Sum(FOB)", "Type <> 'K'")
                            TotalFOBAmount = ds.Compute("Sum(nInvFobAmount)", "Type <> 'K'")
                            TotalWeight = ds.Compute("Sum(WEIGHT)", "Type <> 'K'")
                            TotalCubes = ds.Compute("Sum(Cubes)", "Type <> 'K'")
                        End If
                    End If
                    Dim idval As Integer = 1
                    For Each row In ds.Rows
                        Dim u As New BO.SalesDetail
                        u.SQLID = row("SQLID")
                        u.Order = row("ORDER")
                        u.FarmCode = Convert.ToString(row("FARMCODE"))
                        u.Flower = Convert.ToString(row("FLOWER"))
                        u.FOB = If(row("FOB") Is DBNull.Value, 0.00, row("FOB"))
                        u.NAME = Convert.ToString(row("DESC"))
                        u.BGColor = Convert.ToString(row("BGCOLOR"))
                        u.FontColor = Convert.ToString(row("FONTCOLOR"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.Boxes1 = IIf(row("Type") = "K", row("BOXES"), Convert.ToInt32(row("BOXES")))
                        u.Units = row("Units")
                        u.TotalUnits1 = IIf(row("Type") = "K", row("TOTALUNITS"), Convert.ToInt32(row("TOTALUNITS")))
                        u.InvenType = Convert.ToString(row("INVENTYPE"))
                        u.TotalRows = TotalCount
                        u.ID = idval
                        idval += 1
                        u.TotPerLine = Convert.ToDecimal(row("BOXES") * row("Units") * If(row("FOB") Is DBNull.Value, 0.00, row("FOB")))
                        TotalGrandTotal += u.TotPerLine
                        TotalFBE += u.FBE
                        u.Boxes = Math.Round(Convert.ToDecimal(row("BOXES")), 0, MidpointRounding.AwayFromZero)
                        u.BoxLength = If(row("L") Is DBNull.Value, 0, row("L"))
                        u.BoxHeight = If(row("H") Is DBNull.Value, 0, row("H"))
                        u.BoxWidth = If(row("W") Is DBNull.Value, 0, row("W"))
                        u.Dimentions = u.BoxLength.ToString() + "x" + u.BoxWidth.ToString() + "x" + u.BoxHeight.ToString()
                        u.Cubes = If(row("Cubes") Is DBNull.Value, 0, row("Cubes"))
                        u.Weight = If(row("WEIGHT") Is DBNull.Value, 0, row("WEIGHT"))
                        u.CAT = If(row("FCAT") Is DBNull.Value, "", row("FCAT"))
                        u.Color = If(row("FColor") Is DBNull.Value, "", row("FColor"))
                        u.VARIETY = If(row("VARIETY") Is DBNull.Value, "", row("VARIETY"))
                        u.GRADE = If(row("GRADE") Is DBNull.Value, "", row("GRADE"))
                        ulistsalesDetails.Add(u)
                    Next
                    Dim po As New BO.SalesDetail()
                    po.ID = 0
                    po.Order = 0
                    po.FarmCode = ""
                    po.Flower = ""
                    po.NAME = ""
                    po.FarmDetails.FarmCode = ""
                    po.FlowerDetails.Flower = ""
                    po.FlowerDetails.Name = ""
                    po.FlowerDetails.BGColor = ""
                    po.FlowerDetails.FontColor = ""
                    po.Boxes1 = TotalBoxes
                    po.UOM = ""
                    po.Units = 0
                    po.TotalUnits1 = TotalUnits
                    po.Cost = 0
                    po.TotalCost = TotalCost
                    po.InvenType = ""
                    po.Type = ""
                    po.TotalRows = TotalCount
                    po.FOB = 0
                    po.TotPerLine = 0
                    po.GrandTotal = TotalGrandTotal
                    po.BoxLength = 0
                    po.BoxHeight = 0
                    po.BoxWidth = 0
                    po.Cubes = TotalCubes
                    po.Weight = Math.Round(TotalWeight)
                    ulistsalesDetails.Add(po)
                End Using
            End Using
            Return ulistsalesDetails
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesOrderConsolList")
            Throw ex
        End Try
    End Function
#Region "F3 - New Order"
    ''' <summary>
    ''' Muthu Nivetha M :: 03Mar2020 :: Added :: To Load 13months of sales details for Selected Customer
    ''' </summary>
    Public Shared Function LoadF3SalesDetailsForSelectedCust(ByVal SelectedCust As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As Tuple(Of DataSet, String)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataSet()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spLoadF3SalesDetailsForSelectedCust", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@SelectedCust", SelectedCust)
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt)
                End Using
            End Using
            Dim result As New Tuple(Of DataSet, String)(dt, "success")
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadF3SalesDetailsForSelectedCust")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in LoadF3SalesDetailsForSelectedCust")
            Return result
        End Try
    End Function
    'Added By Belal on 01 Sept 2020 :: For selected flower customer list
    Public Shared Function LoadF3SalesDetailsForSelectedFlower(ByVal SelectedFlower As String) As Tuple(Of DataSet, String)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataSet()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spLoadF3SalesDetailsForSelectedFlower", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@SelectedFlower", SelectedFlower)
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt)
                End Using
            End Using
            Dim result As New Tuple(Of DataSet, String)(dt, "success")
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadF3SalesDetailsForSelectedFlower")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in LoadF3SalesDetailsForSelectedFlower")
            Return result
        End Try
    End Function
    'Added By Belal on 05 Sept 2020 :: For email logs
    Public Shared Function LoadEmailLogs(ByVal FromEmail As String, ByVal EmailType As String, ByVal EmailedDocumentNumber As String) As Tuple(Of DataSet, String)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            'Load current todays mail first :: added By Belal :: 06 Sept 2020
            Dim dt As New DataSet()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("SpEmailLog", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@FROM_MAIL", FromEmail)
                    Cmd.Parameters.AddWithValue("@EMAIL_TYPE", EmailType)
                    Cmd.Parameters.AddWithValue("@EMAIL_DOCUMENT_NUMBER", EmailedDocumentNumber)
                    Cmd.Parameters.AddWithValue("@QueryOption", IIf(EmailType.Equals("") And EmailedDocumentNumber.Equals(""), 3, 5))
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt)
                End Using
            End Using
            For Each row As DataRow In dt.Tables(0).Rows
                Dim ID = ""
                Dim Status = ""
                Dim Email_from = ""
                Dim Email_to = ""
                ID = row("MESSAGE_ID")
                Email_from = row("FROM_MAIL")
                Email_to = row("TO_MAIL")
                Status = row("STATUS")
                If Not ID = "" And Not Status = "error" And Email_from <> Email_to Then
                    'RunAsyncForRetrieveMail(ID).Wait()
                    Dim Res = Task.Run(Function() RunAsyncForRetrieveMail(ID))
                    Res.Wait()
                End If
            Next row

            'Load again after statu update :: added By Belal :: 06 Sept 2020
            Dim dt2 As New DataSet()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("SpEmailLog", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@FROM_MAIL", FromEmail)
                    Cmd.Parameters.AddWithValue("@EMAIL_TYPE", EmailType)
                    Cmd.Parameters.AddWithValue("@EMAIL_DOCUMENT_NUMBER", EmailedDocumentNumber)
                    Cmd.Parameters.AddWithValue("@QueryOption", IIf(EmailType.Equals("") And EmailedDocumentNumber.Equals(""), 2, 5))
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt2)
                End Using
            End Using

            Dim result As New Tuple(Of DataSet, String)(dt2, "success")
            'Dim result As New Tuple(Of DataSet, String)(dt, "success")
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadEmailLogs")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in LoadEmailLogs")
            Return result
        End Try
    End Function
    Private Shared Async Function RunAsyncForRetrieveMail(ID As String) As Task
        Dim client As MailjetClient = New MailjetClient(ConfigurationManager.AppSettings("MailJetEmailAPIpublicKey").ToString(), ConfigurationManager.AppSettings("MailJetEmailAPIprivateKey").ToString())
        Dim request As MailjetRequest = New MailjetRequest With {
                .Resource = Message.Resource,
                .ResourceId = ResourceId.Numeric(ID)
            }
        Dim response As MailjetResponse = Await client.GetAsync(request)
        Dim status = ""
        If response.IsSuccessStatusCode Then
            Dim mailResponseObj As JObject = New JObject From {
               {"data", response.GetData()}
            }
            Dim mailResponseArr As JArray = New JArray()
            mailResponseArr = mailResponseObj("data")
            status = mailResponseArr(0)("Status").ToString()
            UpdateEmailStatus(ID, status)
        Else
            Console.WriteLine(String.Format("StatusCode: {0}" & vbLf, response.StatusCode))
            Console.WriteLine(String.Format("ErrorInfo: {0}" & vbLf, response.GetErrorInfo()))
            Console.WriteLine(response.GetData())
            Console.WriteLine(String.Format("ErrorMessage: {0}" & vbLf, response.GetErrorMessage()))
        End If
    End Function
    'Added By Belal on 06 Sept 2020 :: FOR EMAIL STATUS UPDATE
    Private Shared Function UpdateEmailStatus(ID As String, status As String) As Int32
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As Int32 = 0
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("SpEmailLog", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@MESSAGE_ID", ID)
                    Cmd.Parameters.AddWithValue("@STATUS", status)
                    Cmd.Parameters.AddWithValue("@QueryOption", 4)
                    result = Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateEmailStatus")
            Return 0
        End Try
    End Function

    Public Shared Sub CheckEmailStatusInMailJet()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            'Load current todays mail first :: added By Belal :: 06 Sept 2020
            Dim dt As New DataSet()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("SpEmailLog", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@FROM_MAIL", "")
                    Cmd.Parameters.AddWithValue("@EMAIL_TYPE", "")
                    Cmd.Parameters.AddWithValue("@EMAIL_DOCUMENT_NUMBER", "")
                    Cmd.Parameters.AddWithValue("@QueryOption", 6)
                    Cmd.Parameters.AddWithValue("@STATUS", "'sent','success','opened'")
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt)
                End Using
            End Using
            For Each row As DataRow In dt.Tables(0).Rows
                Dim ID = ""
                Dim Status = ""
                Dim Email_from = ""
                Dim Email_to = ""
                ID = row("MESSAGE_ID")
                Email_from = row("FROM_MAIL")
                Email_to = row("TO_MAIL")
                Status = row("STATUS")
                If Not ID = "" And Not Status = "error" And Email_from <> Email_to Then
                    'RunAsyncForRetrieveMail(ID).Wait()
                    Dim Res = Task.Run(Function() RunAsyncForRetrieveMail(ID))
                    Res.Wait()
                End If
            Next row
            ''''
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckEmailStatusInMailJet")
        End Try
    End Sub

#End Region

    Public Function GetStandingOrderList(ByVal ShipDate As String, ByVal IsStanding As String, ByVal IsPreBook As String, ByVal AWB As String, ByVal Warehouse As String, ByVal Farm As String, ByVal InvenToIgnore As String, ByVal UserId As String) As List(Of BO.StandingOrder)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.StandingOrder)()
            Dim TotalAmt As Decimal = 0
            Dim TotalBoxes As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spStandingOrderRequirement", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Shipdate", ShipDate)
                    cmd.Parameters.AddWithValue("@IsStanding", IsStanding)
                    cmd.Parameters.AddWithValue("@IsPreBooks", IsPreBook)
                    cmd.Parameters.AddWithValue("@AWB", AWB)
                    cmd.Parameters.AddWithValue("@Warehouse", Warehouse)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.Parameters.AddWithValue("@InvenToIgnore", InvenToIgnore)
                    cmd.Parameters.AddWithValue("@UserId", UserId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.StandingOrder()
                        u.SrNo = row("SrNo")
                        u.Flower = row("Flower")
                        u.FlowerName = row("FlowerName")
                        u.InvenQty = row("InvenQty")
                        u.UOM = row("UOM")
                        u.ShipDay = row("ShipDay")
                        u.DiffQty = row("DiffQty")
                        u.OrderedQty = row("OrderQty")
                        TotalBoxes += Convert.ToInt16(u.OrderedQty)
                        u.UnitsPerBox = row("UnitsPerBox")
                        u.TotalAmt = row("TotalAmt")
                        TotalAmt += Convert.ToDecimal(u.TotalAmt)
                        u.ShipDate = row("ShipDate")
                        u.ColorCode = row("ColorCode")
                        u.BGColor = row("BGColor")
                        u.Comments = row("Comments")
                        u.Farm = row("Farm")
                        uList.Add(u)
                    Next
                    Dim uTotal As New BO.StandingOrder()
                    uTotal.SrNo = 0
                    uTotal.Flower = ""
                    uTotal.FlowerName = "Total"
                    uTotal.InvenQty = "0"
                    uTotal.UOM = ""
                    uTotal.ShipDay = ""
                    uTotal.DiffQty = "0"
                    uTotal.OrderedQty = Convert.ToString(TotalBoxes)
                    uTotal.UnitsPerBox = ""
                    uTotal.TotalAmt = TotalAmt.ToString("N", CultureInfo.InvariantCulture)
                    uTotal.ShipDate = ""
                    uTotal.ColorCode = ""
                    uTotal.BGColor = ""
                    uTotal.Comments = ""
                    uTotal.Farm = ""
                    uList.Add(uTotal)
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetStandingOrderList")
            Throw ex
        End Try
    End Function

    Public Function GetStandingOrderCustomerDetails(ByVal FlowerCode As String, ByVal UOM As String,
                  ByVal Unit As String, ByVal Comments As String, ByVal UserId As String) As List(Of BO.StandingOrder)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.StandingOrder)()
            Dim TotalAmt As Decimal = 0
            Dim TotalBoxes As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spStandingOrderCustomerDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FlowerCode", FlowerCode)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    cmd.Parameters.AddWithValue("@Unit", Unit)
                    cmd.Parameters.AddWithValue("@Comments", Comments)
                    cmd.Parameters.AddWithValue("@UserId", UserId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.StandingOrder()
                        u.SrNo = row("SrNo")
                        u.SQLId = row("SQLId")
                        u.Flower = row("Flower")
                        u.FlowerName = row("FlowerName")
                        u.Customer = row("Customer")
                        u.CustomerName = row("CustomerName")
                        u.OrderedQty = row("OrderQty")
                        u.UOM = row("UOM")
                        u.UnitsPerBox = row("UnitsPerBox")
                        u.TotalAmt = row("TotalAmt")
                        TotalAmt += Convert.ToDecimal(u.TotalAmt)
                        u.ShipDate = row("ShipDate")
                        u.ColorCode = row("ColorCode")
                        u.BGColor = row("BGColor")
                        u.CreditHold = row("CREDITHOLD")
                        u.CreditReason = row("REASONHOLD")
                        u.GPM = row("GPM")
                        u.FOB = row("FOB")
                        u.SalesPerson = row("SALESPERSON")
                        uList.Add(u)
                    Next
                    Dim uTotal As New BO.StandingOrder()
                    uTotal.SrNo = 0
                    uTotal.SQLId = 0
                    uTotal.Flower = ""
                    uTotal.FlowerName = ""
                    uTotal.Customer = ""
                    uTotal.CustomerName = ""
                    uTotal.OrderedQty = ""
                    uTotal.UOM = ""
                    uTotal.UnitsPerBox = ""
                    uTotal.TotalAmt = Convert.ToString(TotalAmt)
                    uTotal.ShipDate = ""
                    uTotal.ColorCode = ""
                    uTotal.BGColor = ""
                    uTotal.CreditHold = ""
                    uTotal.CreditReason = ""
                    uTotal.GPM = ""
                    uTotal.SalesPerson = ""
                    uList.Add(uTotal)
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetStandingOrderCustomerDetails")
            Throw ex
        End Try
    End Function

    Public Function GetStandingOrderAllCustomerDetails(ByVal ShipDate As String, ByVal IsStanding As String, ByVal IsPreBook As String, ByVal AWB As String, ByVal Warehouse As String, ByVal Farm As String, ByVal InvenToIgnore As String, ByVal UserId As String) As List(Of BO.StandingOrder)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.StandingOrder)()
            Dim TotalAmt As Decimal = 0
            Dim TotalBoxes As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spStandingOrderAllCustomerDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    'cmd.Parameters.AddWithValue("@Shipdate", ShipDate)
                    'cmd.Parameters.AddWithValue("@IsStanding", IsStanding)
                    'cmd.Parameters.AddWithValue("@IsPreBooks", IsPreBook)
                    'cmd.Parameters.AddWithValue("@AWB", AWB)
                    'cmd.Parameters.AddWithValue("@Warehouse", Warehouse)
                    'cmd.Parameters.AddWithValue("@Farm", Farm)
                    'cmd.Parameters.AddWithValue("@InvenToIgnore", InvenToIgnore)
                    cmd.Parameters.AddWithValue("@UserId", UserId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.StandingOrder()
                        u.SrNo = row("SrNo")
                        u.SQLId = row("SQLId")
                        u.Flower = row("Flower")
                        u.FlowerName = row("FlowerName")
                        u.Customer = row("Customer")
                        u.CustomerName = row("CustomerName")
                        u.OrderedQty = row("OrderQty")
                        u.UOM = row("UOM")
                        u.UnitsPerBox = row("UnitsPerBox")
                        u.TotalAmt = row("TotalAmt")
                        TotalBoxes += Convert.ToInt16(u.OrderedQty)
                        TotalAmt += Convert.ToDecimal(u.TotalAmt)
                        u.ShipDate = row("ShipDate")
                        u.ColorCode = row("ColorCode")
                        u.BGColor = row("BGColor")
                        u.CreditHold = row("CREDITHOLD")
                        u.CreditReason = row("REASONHOLD")
                        u.GPM = row("GPM")
                        u.FOB = row("FOB")
                        u.Carrier = row("Carrier")
                        uList.Add(u)
                    Next
                    Dim uTotal As New BO.StandingOrder()
                    uTotal.SrNo = 0
                    uTotal.SQLId = 0
                    uTotal.Flower = ""
                    uTotal.FlowerName = ""
                    uTotal.Customer = ""
                    uTotal.CustomerName = ""
                    uTotal.OrderedQty = Convert.ToString(TotalBoxes)
                    uTotal.UOM = ""
                    uTotal.UnitsPerBox = ""
                    uTotal.TotalAmt = Convert.ToString(TotalAmt)
                    uTotal.ShipDate = ""
                    uTotal.ColorCode = ""
                    uTotal.BGColor = ""
                    uTotal.CreditHold = ""
                    uTotal.CreditReason = ""
                    uTotal.GPM = ""
                    uTotal.FOB = ""
                    uTotal.Carrier = ""
                    uList.Add(uTotal)
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetStandingOrderAllCustomerDetails")
            Throw ex
        End Try
    End Function

    Public Function GetSalesOrderAllocationList(ByVal CargoDate As String, ByVal MarketToIgnore As String, ByVal UserId As String) As List(Of BO.SalesOrderAllocation)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesOrderAllocation)()
            Dim TotalAmt As Decimal = 0
            Dim TotalBoxes As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spSalesOrderAllocation", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CargoDate", CargoDate)
                    cmd.Parameters.AddWithValue("@MarketToIgnore", MarketToIgnore)
                    cmd.Parameters.AddWithValue("@UserId", UserId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesOrderAllocation()
                        u.SrNo = row("SrNo")
                        u.Flower = row("Flower")
                        u.FlowerName = row("FlowerName")
                        u.InvenQty = row("InvenQty")
                        u.UOM = row("UOM")
                        u.ShipDay = row("ShipDay")
                        u.DiffQty = row("DiffQty")
                        u.OrderedQty = row("OrderQty")
                        TotalBoxes += Convert.ToInt16(u.OrderedQty)
                        u.UnitsPerBox = row("UnitsPerBox")
                        u.TotalAmt = row("TotalAmt")
                        TotalAmt += Convert.ToDecimal(u.TotalAmt)
                        u.ShipDate = row("ShipDate")
                        u.ColorCode = row("ColorCode")
                        u.BGColor = row("BGColor")
                        u.FOB = row("FOB")
                        uList.Add(u)
                    Next
                    Dim uTotal As New BO.SalesOrderAllocation()
                    uTotal.SrNo = 0
                    uTotal.Flower = ""
                    uTotal.FlowerName = "Total"
                    uTotal.InvenQty = "0"
                    uTotal.UOM = ""
                    uTotal.ShipDay = ""
                    uTotal.DiffQty = "0"
                    uTotal.OrderedQty = Convert.ToString(TotalBoxes)
                    uTotal.UnitsPerBox = ""
                    uTotal.TotalAmt = TotalAmt.ToString("N", CultureInfo.InvariantCulture)
                    uTotal.ShipDate = ""
                    uTotal.ColorCode = ""
                    uTotal.BGColor = ""
                    uTotal.Comments = ""
                    uList.Add(uTotal)
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesOrderAllocationList")
            Throw ex
        End Try
    End Function

    Public Function GetSalesOrderAllocationInvoiceDetails(ByVal CargoDate As String, ByVal MarketToIgnore As String, ByVal FlowerCode As String, ByVal Units As Integer, ByVal UserId As String) As List(Of BO.SalesOrderAllocation)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesOrderAllocation)()
            Dim TotalAmt As Decimal = 0
            Dim TotalBoxes As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spSalesOrderAllocationInvoiceDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CargoDate", CargoDate)
                    cmd.Parameters.AddWithValue("@MarketToIgnore", MarketToIgnore)
                    cmd.Parameters.AddWithValue("@FlowerCode", FlowerCode)
                    ''cmd.Parameters.AddWithValue("@UOM", UOM)
                    cmd.Parameters.AddWithValue("@Units", Units)
                    cmd.Parameters.AddWithValue("@UserId", UserId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesOrderAllocation()
                        u.SrNo = row("SrNo")
                        u.SQLId = row("SQLId")
                        u.InvoiceNo = row("ORDER")
                        u.Flower = row("Flower")
                        u.FlowerName = row("DESC")
                        u.Customer = row("Customer")
                        u.CustomerName = row("CustomerName")
                        u.OrderedQty = row("OrderQty")
                        TotalBoxes += Convert.ToInt16(u.OrderedQty)
                        u.UOM = row("UOM")
                        u.UnitsPerBox = row("UNITS")
                        u.TotalAmt = row("TOTALAMOUNT")
                        TotalAmt += Convert.ToDecimal(u.TotalAmt)
                        u.ShipDate = row("ShipDate")
                        u.ColorCode = row("ColorCode")
                        u.BGColor = row("BGColor")
                        u.CreditHold = row("CREDITHOLD")
                        u.CreditReason = row("REASONHOLD")
                        u.GPM = row("GPM")
                        u.Price = row("Price")
                        u.Awb = row("awb")

                        u.LandedCost = row("LandedCost")
                        u.nPer0 = row("nPer0")
                        u.IsPriceCalculated = row("IsPriceCalculated")
                        u.SalesmanEmail = row("SalesmanEmail")
                        u.ShortQty = row("ShortQty")

                        uList.Add(u)
                    Next
                    Dim uTotal As New BO.SalesOrderAllocation()
                    uTotal.SrNo = 0
                    uTotal.SQLId = 0
                    uTotal.InvoiceNo = ""
                    uTotal.Flower = ""
                    uTotal.FlowerName = ""
                    uTotal.Customer = ""
                    uTotal.CustomerName = ""
                    uTotal.OrderedQty = Convert.ToString(TotalBoxes)
                    uTotal.UOM = ""
                    uTotal.UnitsPerBox = ""
                    uTotal.TotalAmt = Convert.ToString(TotalAmt)
                    uTotal.ShipDate = ""
                    uTotal.ColorCode = ""
                    uTotal.BGColor = ""
                    uTotal.CreditHold = ""
                    uTotal.CreditReason = ""
                    uTotal.GPM = ""

                    uList.Add(uTotal)
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesOrderAllocationInvoiceDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function GetUpcFromPricesByFlower(ByVal Customer As String, ByVal FlowerCode As String) As BO.SalesDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim o As New BO.SalesDetail
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("sp_GetFPricesByFlower", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@Customer", Customer)
                    Cmd.Parameters.AddWithValue("@Flower", FlowerCode)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        o.UPC = Convert.ToString(dt(0)("UPC"))
                        o.UPCPRICE = Convert.ToString(dt(0)("UPCPRICE"))
                        o.BoxCode = Convert.ToString(dt(0)("BoxCode"))
                    End If
                    Return o
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUpcFromPrices")
            Return Nothing
        End Try
    End Function
    Public Shared Function UpdateOrderDetailRepeat(ByVal Invoice As String, ByVal StartDate As String, ByVal NoTimesToRepeat As Integer, ByVal Username As String) As String
        Try

            Dim result As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spRepeatOrder", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@StartDate", StartDate)
                    Cmd.Parameters.AddWithValue("@NoTimesToRepeat", NoTimesToRepeat)
                    Cmd.Parameters.AddWithValue("@Invoice", Invoice)
                    Cmd.Parameters.AddWithValue("@UserName", Username)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    result = "success"
                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "UpdateOrderDetailRepeat::")
            Return ex.Message
        End Try
    End Function
    Public Shared Function UpdateDimensionByOrderNo(SQLID As String, L As String, W As String, H As String) As String
        Try

            Dim result As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spUpdateFOrder2Dimension", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@SQLID", SQLID)
                    Cmd.Parameters.AddWithValue("@L", L)
                    Cmd.Parameters.AddWithValue("@W", W)
                    Cmd.Parameters.AddWithValue("@H", H)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    result = "success"
                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "UpdateDimensionByOrderNo::")
            Return ex.Message
        End Try
    End Function
    Public Shared Function UpdateAWBByOrderNo(OrderNo As String, AWB As String) As String
        Try

            Dim result As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spUpdateAWBByOrderNo", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    Cmd.Parameters.AddWithValue("@AWB", AWB)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    result = "success"
                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "UpdateAWBByOrderNo::")
            Return ex.Message
        End Try
    End Function
    Public Shared Function CreateInvoicesForAllocation() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spCreateInvoicesForAllocation", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.ExecuteNonQuery()
                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In CreateInvoicesForAllocation")
            Throw ex
        End Try
    End Function

    Public Shared Function UpdateTempSalesOrderAllocationInvoiceDetailsField(ByVal FieldName As String, ByVal FieldValue As String, ByVal FieldKey As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Update TempSalesOrderAllocationInvoiceDetails Set " +
                                            FieldName + "='" + FieldValue + "' Where SQLId='" + FieldKey + "' ", con)
                    cmd.CommandType = CommandType.Text
                    cmd.ExecuteNonQuery()
                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateTempSalesOrderAllocationInvoiceDetailsField")
            Throw ex
        End Try
    End Function

    Public Shared Function GetDiscountAmount(ByVal discountCode As String, ByVal customerNo As String, ByVal orderNo As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetDiscountAmount", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@discountCode", discountCode)
                    cmd.Parameters.AddWithValue("@customerNo", customerNo)
                    cmd.Parameters.AddWithValue("@orderNo", orderNo)

                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return dt.Rows(0).ItemArray(0)
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateTempSalesOrderAllocationInvoiceDetailsField")
            Throw ex
        End Try
    End Function
    '

    Public Function GetOrderInvoiceDetailsList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                             ByVal numberOfRows As Integer) As List(Of BO.SalesDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "flower"
                End If

                Using cmd As New SqlCommand("spGetOrderInvoiceDetailsList", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("whereClause", whereClause)
                    cmd.Parameters.AddWithValue("sortExp", sortExp)
                    cmd.CommandTimeout = 0
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable

                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1
                    ds.Columns.Add(INCcolumn)
                    da.Fill(ds)

                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim TotalUnits As Integer = 0
                    Dim TotalBoxes As Decimal = 0.00
                    Dim TotalCost As Decimal = 0
                    Dim Totalgpm As Decimal = 0
                    Dim TotalInvAmount As Decimal = 0
                    Dim TotalFOBAmount As Decimal = 0
                    Dim TotalInvCost As Decimal = 0
                    Dim TotalFBE As Decimal = 0
                    Dim TotalGrandTotal As Decimal = 0
                    Dim TotalFOB As Decimal = 0

                    If (ds.Rows.Count > 0) Then
                        If Not ds.Compute("Sum(Boxes)", "Farm <> 'ZZ'") Is DBNull.Value Then
                            TotalBoxes = ds.Compute("Sum(Boxes)", "Farm <> 'ZZ'")
                            TotalUnits = ds.Compute("Sum(TotalUnits)", "Farm <> 'ZZ'")
                            TotalFOB = ds.Compute("Sum(FOB)", "Farm <> 'ZZ'")
                            TotalFOBAmount = ds.Compute("Sum(nInvFobAmount)", "Farm <> 'ZZ'")
                        End If
                        TotalInvCost = ds.Compute("Sum(nCost)", "")
                        'TotalCost = ds.Compute("Sum(TotalCost)", "")
                        If (TotalFOBAmount <> 0) Then
                            Totalgpm = ((TotalFOBAmount - TotalInvCost) / TotalFOBAmount) * 100
                        End If
                    End If

                    Dim PagedDataSet As DataTable = Nothing

                    If TotalCount <> 0 And startRowIndex <> 0 Then
                        If (TotalCount <> startRowIndex) Then
                            PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + (startRowIndex + numberOfRows).ToString() + "").CopyToDataTable()
                        Else
                            PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + startRowIndex.ToString() + "").CopyToDataTable()
                        End If


                        For Each row In PagedDataSet.Rows
                            Dim u As New BO.SalesDetail
                            u.RowNo = row("RECNO")
                            u.ID = row("ID")
                            u.INVOICE = row("Invoice")
                            u.CustCode = IIf(row("Customer") Is DBNull.Value, "", row("Customer"))
                            u.PODFlower = row("FLOWER")
                            u.Flower = row("Desc")
                            u.SLSMAN = IIf(row("Slsname") Is DBNull.Value, "", row("Slsname"))
                            u.FarmCode = IIf(row("Farm") Is DBNull.Value, "", row("Farm"))
                            u.AWB = IIf(row("AWB") Is DBNull.Value, "", row("AWB"))
                            u.Boxes = IIf(row("Farm") = "ZZ", Convert.ToDecimal(row("Boxes")), Convert.ToInt32(row("Boxes")))
                            u.UOM = IIf(row("UOM") Is DBNull.Value, "", row("UOM"))
                            u.Units = IIf(row("Units") Is DBNull.Value, 0, row("Units"))
                            u.TotalUnits = IIf(row("TOTALUNITS") Is DBNull.Value, 0, row("TOTALUNITS"))
                            u.TotalUnits1 = IIf(row("TOTALUNITS") Is DBNull.Value, 0, row("TOTALUNITS"))
                            u.FOB = IIf(row("FOB") Is DBNull.Value, 0.0000, row("FOB"))
                            u.TotPerLine = Convert.ToDecimal(row("BOXES") * row("Units") * row("FOB"))
                            u.Type = IIf(row("Type") Is DBNull.Value, "", row("Type"))
                            If (Convert.ToString(row("gpm")) <> "") Then
                                'u.gpm = Math.Truncate(row("gpm") * 10) / 10
                                u.gpm = Convert.ToDecimal(row("gpm"))
                            End If
                            u.BoxNum = IIf(row("BOXNUM") Is DBNull.Value, 0, row("BOXNUM"))
                            u.BoxCode = IIf(row("BOXCODE") Is DBNull.Value, "", row("BOXCODE"))
                            u.UPC = IIf(row("UPC") Is DBNull.Value, "", row("UPC"))
                            u.PODFlower = IIf(row("PODFlower") Is DBNull.Value, "", row("PODFlower"))
                            u.BGColor = IIf(row("BGCOLOR") Is DBNull.Value, "", row("BGCOLOR"))
                            u.FontColor = IIf(row("FONTCOLOR") Is DBNull.Value, "", row("FONTCOLOR"))
                            u.DateRec = row("DATEREC")
                            u.PODate = row("Date")
                            ''u.FarmCode = row("FarmName")
                            u.PO = IIf(row("PO") Is DBNull.Value Or row("PO") = "", "", row("PO"))
                            u.SLSMAN = IIf(row("Salesman") Is DBNull.Value, "0", row("Salesman"))
                            u.Fuel = IIf(row("Fuel") Is DBNull.Value, "0", row("Fuel"))
                            u.Tax1 = IIf(row("Tax1") Is DBNull.Value, "0", row("Tax1"))
                            u.Tax2 = IIf(row("Tax2") Is DBNull.Value, "0", row("Tax2"))
                            u.ANDEAN = IIf(row("ANDEAN") Is DBNull.Value, "0", row("ANDEAN"))
                            u.TotalRows = TotalCount
                            u.InvenID = row("IDINVEN")
                            u.Cost = IIf(row("COST") Is DBNull.Value, "0", row("COST"))
                            u.Handling = IIf(row("HANDLING") Is DBNull.Value, "0", row("HANDLING"))
                            u.OtherCost = IIf(row("OTHERCOST") Is DBNull.Value, "0", row("OTHERCOST"))
                            u.Landedcost = IIf(row("LANDEDCOST") Is DBNull.Value, "0", row("LANDEDCOST"))
                            u.Landedcost = IIf(row("ActualLandedcost") Is DBNull.Value, "0", row("ActualLandedcost"))
                            u.Freightout = IIf(row("ActualFreight") Is DBNull.Value, "0", row("ActualFreight"))
                            u.Handling = IIf(row("ActualHandling") Is DBNull.Value, "0", row("ActualHandling"))
                            u.OtherCost = IIf(row("ActualOtherCharges") Is DBNull.Value, "0", row("ActualOtherCharges"))
                            u.gpm = IIf(row("EstimatedGPM") Is DBNull.Value, "0", row("EstimatedGPM"))

                            TotalGrandTotal += u.TotPerLine
                            ulistsalesDetails.Add(u)
                        Next
                    End If

                    Dim po As New BO.SalesDetail()
                    po.RowNo = 0
                    po.ID = 0
                    po.INVOICE = ""
                    po.CustCode = 0
                    po.Flower = ""
                    po.Flower = ""
                    po.SLSMAN = ""
                    po.FarmCode = ""
                    po.BGColor = ""
                    po.FontColor = ""
                    po.Boxes = TotalBoxes
                    po.UOM = ""
                    po.Units = 0
                    po.TotalUnits = TotalUnits
                    po.FOB = 0
                    po.TotPerLine = TotalGrandTotal
                    po.Type = ""
                    po.gpm = Totalgpm

                    po.BoxNum = 0
                    po.BoxCode = ""
                    po.TotalRows = TotalCount
                    po.UPC = ""
                    po.PODFlower = ""
                    po.PO = ""
                    ' po.GrandTotal = TotalGrandTotal
                    ulistsalesDetails.Add(po)

                End Using
            End Using
            Return ulistsalesDetails
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetOrderInvoiceDetailsList")
            Throw ex
        End Try

    End Function
End Class

Public Class WareHouseDDLModel
    Private _Name As String
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(value As String)
            _Name = value
        End Set
    End Property
    Private _Code As String
    Public Property Code() As String
        Get
            Return _Code
        End Get
        Set(value As String)
            _Code = value
        End Set
    End Property
    Private _IsDefault As Integer
    Public Property IsDefault() As Integer
        Get
            Return _IsDefault
        End Get
        Set(value As Integer)
            _IsDefault = value
        End Set
    End Property

End Class
Namespace BO

    Public Class F_MsgInv
        Private _Text1 As String
        Public Property Text1() As String
            Get
                Return _Text1
            End Get
            Set(ByVal value As String)
                _Text1 = value
            End Set
        End Property

        Private _Text2 As String
        Public Property Text2() As String
            Get
                Return _Text2
            End Get
            Set(ByVal value As String)
                _Text2 = value
            End Set
        End Property

        Private _Text3 As String
        Public Property Text3() As String
            Get
                Return _Text3
            End Get
            Set(ByVal value As String)
                _Text3 = value
            End Set
        End Property

        Private _Text4 As String
        Public Property Text4() As String
            Get
                Return _Text4
            End Get
            Set(ByVal value As String)
                _Text4 = value
            End Set
        End Property

        Private _Text5 As String
        Public Property Text5() As String
            Get
                Return _Text5
            End Get
            Set(ByVal value As String)
                _Text5 = value
            End Set
        End Property

    End Class

    Public Class SalesHeader

        Private _PODFILE As String
        Public Property PODFILE() As String
            Get
                Return _PODFILE
            End Get
            Set(ByVal value As String)
                _PODFILE = value
            End Set
        End Property

        Private _ID As Integer
        Public Property ID() As Integer
            Get
                Return _ID
            End Get
            Set(ByVal value As Integer)
                _ID = value
            End Set
        End Property

        Private _Order As Integer
        Public Property Order() As Integer
            Get
                Return _Order
            End Get
            Set(ByVal value As Integer)
                _Order = value
            End Set
        End Property

        Private _OrderSelected As Boolean
        Public Property OrderSelected() As Boolean
            Get
                Return _OrderSelected
            End Get
            Set(ByVal value As Boolean)
                _OrderSelected = value
            End Set
        End Property

        Private _Customer As Integer
        Public Property Customer() As Integer
            Get
                Return _Customer
            End Get
            Set(ByVal value As Integer)
                _Customer = value
            End Set
        End Property

        Private _PO As String
        Public Property PO() As String
            Get
                Return _PO
            End Get
            Set(value As String)
                _PO = value
            End Set
        End Property


        Private _Cubes As Decimal = 0.00
        Public Property Cubes() As Decimal
            Get
                Return _Cubes
            End Get
            Set(value As Decimal)
                _Cubes = value
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

        Private _OrderDate As Date
        Public Property OrderDate() As Date
            Get
                Return _OrderDate
            End Get
            Set(ByVal value As Date)
                _OrderDate = value
            End Set
        End Property

        Private _ShippingDate As String = "01/01/1900"
        Public Property ShippingDate() As String
            Get
                Return _ShippingDate
            End Get
            Set(ByVal value As String)
                _ShippingDate = value
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

        Private _WH As String
        Public Property WH() As String
            Get
                Return _WH
            End Get
            Set(value As String)
                _WH = value
            End Set
        End Property

        Private _CustomerName As String
        Public Property CustomerName() As String
            Get
                Return _CustomerName
            End Get
            Set(ByVal value As String)
                _CustomerName = value
            End Set
        End Property

        Private _SalesManName As String
        Public Property SalesManName() As String
            Get
                Return _SalesManName
            End Get
            Set(ByVal value As String)
                _SalesManName = value
            End Set
        End Property

        Private _SalesManEmail As String
        Public Property SalesManEmail() As String
            Get
                Return _SalesManEmail
            End Get
            Set(ByVal value As String)
                _SalesManEmail = value
            End Set
        End Property

        Private _SalesManColor As String
        Public Property SalesManColor() As String
            Get
                Return _SalesManColor
            End Get
            Set(ByVal value As String)
                _SalesManColor = value
            End Set
        End Property

        Private _State As String
        Public Property State() As String
            Get
                Return _State
            End Get
            Set(ByVal value As String)
                _State = value
            End Set
        End Property

        Private _Printed As Boolean
        Public Property Printed() As Boolean
            Get
                Return _Printed
            End Get
            Set(ByVal value As Boolean)
                _Printed = value
            End Set
        End Property

        Private _Confirmed As Boolean
        Public Property Confirmed() As Boolean
            Get
                Return _Confirmed
            End Get
            Set(ByVal value As Boolean)
                _Confirmed = value
            End Set
        End Property

        Private _Cod As String
        Public Property Cod() As String
            Get
                Return _Cod
            End Get
            Set(ByVal value As String)
                _Cod = value
            End Set
        End Property

        Private _VOID As String = ""
        Public Property VOID() As String
            Get
                Return _VOID
            End Get
            Set(ByVal value As String)
                _VOID = value
            End Set
        End Property

        Private _Terms As String
        Public Property Terms() As String
            Get
                Return _Terms
            End Get
            Set(ByVal value As String)
                _Terms = value
            End Set
        End Property

        Private _List As Boolean
        Public Property List() As Boolean
            Get
                Return _List
            End Get
            Set(ByVal value As Boolean)
                _List = value
            End Set
        End Property

        Private _Scanned As Boolean
        Public Property Scanned() As Boolean
            Get
                Return _Scanned
            End Get
            Set(ByVal value As Boolean)
                _Scanned = value
            End Set
        End Property

        Private _ScannedBox As Integer
        Public Property ScannedBox As Integer
            Get
                Return _ScannedBox
            End Get
            Set(value As Integer)
                _ScannedBox = value
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

        Private _ShiptoName As String
        Public Property ShiptoName() As String
            Get
                Return _ShiptoName
            End Get
            Set(ByVal value As String)
                _ShiptoName = value
            End Set
        End Property

        Private _ShiptoAddress As String
        Public Property ShiptoAddress() As String
            Get
                Return _ShiptoAddress
            End Get
            Set(ByVal value As String)
                _ShiptoAddress = value
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
        
        Private _ShiptoCountry As String
        Public Property ShiptoCountry() As String
            Get
                Return _ShiptoCountry
            End Get
            Set(ByVal value As String)
                _ShiptoCountry = value
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

        Private _CarrierCode As String
        Public Property CarrierCode As String
            Get
                Return _CarrierCode
            End Get
            Set(value As String)
                _CarrierCode = value
            End Set
        End Property

        Private _CarrierName As String
        Public Property CarrierName As String
            Get
                Return _CarrierName
            End Get
            Set(value As String)
                _CarrierName = value
            End Set
        End Property

        Private _Day As String
        Public Property Day() As String
            Get
                Return _Day
            End Get
            Set(value As String)
                _Day = value
            End Set
        End Property

        Private _ErrorMessage As String
        Public Property ErrorMessage() As String
            Get
                Return _ErrorMessage
            End Get
            Set(ByVal value As String)
                _ErrorMessage = value
            End Set
        End Property

        Private _FontColor As String = ""
        Public Property FontColor() As String
            Get
                Return _FontColor
            End Get
            Set(value As String)
                _FontColor = value
            End Set
        End Property

        Private _BGColor As String = ""
        Public Property BGColor() As String
            Get
                Return _BGColor
            End Get
            Set(value As String)
                _BGColor = value
            End Set
        End Property

        Private _ColorCode As String = ""
        Public Property ColorCode() As String
            Get
                Return _ColorCode
            End Get
            Set(value As String)
                _ColorCode = value
            End Set
        End Property

        Private _CarrierCount As Integer
        Public Property CarrierCount As Integer
            Get
                Return _CarrierCount
            End Get
            Set(value As Integer)
                _CarrierCount = value
            End Set
        End Property

        Private _StateCount As Integer
        Public Property StateCount As Integer
            Get
                Return _StateCount
            End Get
            Set(value As Integer)
                _StateCount = value
            End Set
        End Property

        Private _SalesManCount As Integer
        Public Property SalesManCount As Integer
            Get
                Return _SalesManCount
            End Get
            Set(value As Integer)
                _SalesManCount = value
            End Set
        End Property

        Private _FlowerColor As String
        Public Property FlowerColor As String
            Get
                Return _FlowerColor
            End Get
            Set(value As String)
                _FlowerColor = value
            End Set
        End Property

        Private _FlowerColorCount As Integer
        Public Property FlowerColorCount As Integer
            Get
                Return _FlowerColorCount
            End Get
            Set(value As Integer)
                _FlowerColorCount = value
            End Set
        End Property

        Private _FlowerCatCount As Integer
        Public Property FlowerCatCount As Integer
            Get
                Return _FlowerCatCount
            End Get
            Set(value As Integer)
                _FlowerCatCount = value
            End Set
        End Property

        Private _FlowerCount As Integer
        Public Property FlowerCount As Integer
            Get
                Return _FlowerCount
            End Get
            Set(value As Integer)
                _FlowerCount = value
            End Set
        End Property

        Private _DetailsList As New List(Of SalesDetail)
        Public Property DetailsList() As List(Of SalesDetail)
            Get
                Return _DetailsList
            End Get
            Set(value As List(Of SalesDetail))
                _DetailsList = value
            End Set
        End Property

        Private _InvAmount As Decimal
        Public Property InvAmount() As Decimal
            Get
                Return _InvAmount
            End Get
            Set(ByVal value As Decimal)
                _InvAmount = value
            End Set
        End Property

        Private _GPM As Decimal
        Public Property GPM() As Decimal
            Get
                Return _GPM
            End Get
            Set(ByVal value As Decimal)
                _GPM = value
            End Set
        End Property

        Private _cInvenType As String
        Public Property cInvenType() As String
            Get
                Return _cInvenType
            End Get
            Set(value As String)
                _cInvenType = value
            End Set
        End Property

        'Customer Details
        Private _Address1 As String
        Public Property Address1() As String
            Get
                Return _Address1
            End Get
            Set(value As String)
                _Address1 = value
            End Set
        End Property

        Private _Address2 As String
        Public Property Address2() As String
            Get
                Return _Address2
            End Get
            Set(value As String)
                _Address2 = value
            End Set
        End Property

        Private _Phone As String
        Public Property Phone() As String
            Get
                Return _Phone
            End Get
            Set(value As String)
                _Phone = value
            End Set
        End Property

        Private _Fax As String
        Public Property Fax() As String
            Get
                Return _Fax
            End Get
            Set(value As String)
                _Fax = value
            End Set
        End Property

        Private _City As String
        Public Property City() As String
            Get
                Return _City
            End Get
            Set(value As String)
                _City = value
            End Set
        End Property

        Private _Country As String
        Public Property Country() As String
            Get
                Return _Country
            End Get
            Set(value As String)
                _Country = value
            End Set
        End Property

        Private _Zip As String
        Public Property Zip() As String
            Get
                Return _Zip
            End Get
            Set(value As String)
                _Zip = value
            End Set
        End Property

        Private _Contact As String
        Public Property Contact() As String
            Get
                Return _Contact
            End Get
            Set(value As String)
                _Contact = value
            End Set
        End Property

        Private _DeclaredValue As String
        Public Property DeclaredValue() As String
            Get
                Return _DeclaredValue
            End Get
            Set(value As String)
                _DeclaredValue = value
            End Set
        End Property

        Private _AWB As String
        Public Property AWB() As String
            Get
                Return _AWB
            End Get
            Set(value As String)
                _AWB = value
            End Set
        End Property


        Private _CutOff As String
        Public Property CutOff() As String
            Get
                Return _CutOff
            End Get
            Set(value As String)
                _CutOff = value
            End Set
        End Property

        Private _CustMsg1 As String
        Public Property CustMsg1() As String
            Get
                Return _CustMsg1
            End Get
            Set(value As String)
                _CustMsg1 = value
            End Set
        End Property

        Private _CustMsg2 As String
        Public Property CustMsg2() As String
            Get
                Return _CustMsg2
            End Get
            Set(value As String)
                _CustMsg2 = value
            End Set
        End Property

        Private _CustMsg3 As String
        Public Property CustMsg3() As String
            Get
                Return _CustMsg3
            End Get
            Set(value As String)
                _CustMsg3 = value
            End Set
        End Property

        Private _CustMsg4 As String
        Public Property CustMsg4() As String
            Get
                Return _CustMsg4
            End Get
            Set(value As String)
                _CustMsg4 = value
            End Set
        End Property

        Private _CustMsg5 As String
        Public Property CustMsg5() As String
            Get
                Return _CustMsg5
            End Get
            Set(value As String)
                _CustMsg5 = value
            End Set
        End Property


        Private _ShipMsg1 As String
        Public Property ShipMsg1() As String
            Get
                Return _ShipMsg1
            End Get
            Set(value As String)
                _ShipMsg1 = value
            End Set
        End Property

        Private _ShipMsg2 As String
        Public Property ShipMsg2() As String
            Get
                Return _ShipMsg2
            End Get
            Set(value As String)
                _ShipMsg2 = value
            End Set
        End Property

        Private _ShipMsg3 As String
        Public Property ShipMsg3() As String
            Get
                Return _ShipMsg3
            End Get
            Set(value As String)
                _ShipMsg3 = value
            End Set
        End Property

        Private _ShipMsg4 As String
        Public Property ShipMsg4() As String
            Get
                Return _ShipMsg4
            End Get
            Set(value As String)
                _ShipMsg4 = value
            End Set
        End Property

        Private _ShipMsg5 As String
        Public Property ShipMsg5() As String
            Get
                Return _ShipMsg5
            End Get
            Set(value As String)
                _ShipMsg5 = value
            End Set
        End Property



        Private _Bills As Boolean
        Public Property Bills() As Boolean
            Get
                Return _Bills
            End Get
            Set(ByVal value As Boolean)
                _Bills = value
            End Set
        End Property

        Private _PickRemark As String
        Public Property PickRemark() As String
            Get
                Return _PickRemark
            End Get
            Set(value As String)
                _PickRemark = value
            End Set
        End Property

        Private _InvCost As Decimal
        Public Property InvCost() As Decimal
            Get
                Return _InvCost
            End Get
            Set(value As Decimal)
                _InvCost = value
            End Set
        End Property

        Private _FobAmount As Decimal
        Public Property FobAmount() As Decimal
            Get
                Return _FobAmount
            End Get
            Set(value As Decimal)
                _FobAmount = value
            End Set
        End Property

        'Private _SalesDetails As New SalesDetail
        'Public Property SalesDetails() As SalesDetail
        '    Get
        '        Return _SalesDetails
        '    End Get
        '    Set(ByVal value As SalesDetail)
        '        _SalesDetails = value
        '    End Set
        'End Property


        Private _SHIPPED As Boolean
        Public Property SHIPPED() As Boolean
            Get
                Return _SHIPPED
            End Get
            Set(ByVal value As Boolean)
                _SHIPPED = value
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

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Private _RowNo As Integer
        Public Property RowNo() As Integer
            Get
                Return _RowNo
            End Get
            Set(ByVal value As Integer)
                _RowNo = value
            End Set
        End Property

        Private _PCOName As String
        Public Property PCOName() As String
            Get
                Return _PCOName
            End Get
            Set(ByVal value As String)
                _PCOName = value
            End Set
        End Property

        Private _PCOAddress1 As String
        Public Property PCOAddress1() As String
            Get
                Return _PCOAddress1
            End Get
            Set(ByVal value As String)
                _PCOAddress1 = value
            End Set
        End Property

        Private _PCOAddress2 As String
        Public Property PCOAddress2() As String
            Get
                Return _PCOAddress2
            End Get
            Set(ByVal value As String)
                _PCOAddress2 = value
            End Set
        End Property

        Private _PCOAddress3 As String
        Public Property PCOAddress3() As String
            Get
                Return _PCOAddress3
            End Get
            Set(ByVal value As String)
                _PCOAddress3 = value
            End Set
        End Property


        Private _IsClosedOrder As String
        Public Property IsClosedOrder() As String
            Get
                Return _IsClosedOrder
            End Get
            Set(ByVal value As String)
                _IsClosedOrder = value
            End Set
        End Property

        Private _HOLD As Boolean
        Public Property HOLD() As Boolean
            Get
                Return _HOLD
            End Get
            Set(ByVal value As Boolean)
                _HOLD = value
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
            Set(value As String)
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
            Set(value As String)
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

        Private _OrderUpdateFlag As Boolean
        Public Property ORDERUPDATEFLAG() As Boolean
            Get
                Return _OrderUpdateFlag
            End Get
            Set(ByVal value As Boolean)
                _OrderUpdateFlag = value
            End Set
        End Property

        'Muthu Nivetha M :: Added :: 15Feb2020 :: To access SalesDetail from SalesHeader
        Private _SalesDet As New SalesDetail
        Public Property SalesDet() As SalesDetail
            Get
                Return _SalesDet
            End Get
            Set(ByVal value As SalesDetail)
                _SalesDet = value
            End Set
        End Property
        'Muthu Nivetha M :: Added :: 17Feb2020 :: To add weight in OrderHeader
        Private _Weight As Decimal
        Public Property Weight() As Decimal
            Get
                Return _Weight
            End Get
            Set(value As Decimal)
                _Weight = value
            End Set
        End Property
        Private _Emailed As String
        Public Property Emailed() As String
            Get
                Return _Emailed
            End Get
            Set(ByVal value As String)
                _Emailed = value
            End Set
        End Property

    End Class

    Public Class SalesDetail
        Private _SQLID As Integer
        Public Property SQLID() As Integer
            Get
                Return _SQLID
            End Get
            Set(ByVal value As Integer)
                _SQLID = value
            End Set
        End Property
        Private _INVOICE As String
        Public Property INVOICE() As String
            Get
                Return _INVOICE
            End Get
            Set(value As String)
                _INVOICE = value
            End Set
        End Property
        Private _ID As Integer
        Public Property ID() As Integer
            Get
                Return _ID
            End Get
            Set(ByVal value As Integer)
                _ID = value
            End Set
        End Property

        Private _Status As String
        Public Property Status() As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Private _RowNo As Integer
        Public Property RowNo() As Integer
            Get
                Return _RowNo
            End Get
            Set(ByVal value As Integer)
                _RowNo = value
            End Set
        End Property

        Private _Fuel As Decimal
        Public Property Fuel() As Decimal
            Get
                Return _Fuel
            End Get
            Set(ByVal value As Decimal)
                _Fuel = value
            End Set
        End Property
        Private _ANDEAN As Decimal
        Public Property ANDEAN() As Decimal
            Get
                Return _ANDEAN
            End Get
            Set(ByVal value As Decimal)
                _ANDEAN = value
            End Set
        End Property
        Private _Handling As Decimal
        Public Property Handling() As Decimal
            Get
                Return _Handling
            End Get
            Set(ByVal value As Decimal)
                _Handling = value
            End Set
        End Property
        Private _Landedcost As Decimal
        Public Property Landedcost() As Decimal
            Get
                Return _Landedcost
            End Get
            Set(ByVal value As Decimal)
                _Landedcost = value
            End Set
        End Property

        Private _Retail As Boolean  'Added by ::Belal 29 Aug 2020
        Public Property Retail() As Boolean
            Get
                Return _Retail
            End Get
            Set(ByVal value As Boolean)
                _Retail = value
            End Set
        End Property

        Private _PlusFuel As Decimal
        Public Property PlusFuel() As Decimal
            Get
                Return _PlusFuel
            End Get
            Set(ByVal value As Decimal)
                _PlusFuel = value
            End Set
        End Property

        Private _Tax1 As Decimal
        Public Property Tax1() As Decimal
            Get
                Return _Tax1
            End Get
            Set(ByVal value As Decimal)
                _Tax1 = value
            End Set
        End Property

        Private _Tax2 As Decimal
        Public Property Tax2() As Decimal
            Get
                Return _Tax2
            End Get
            Set(ByVal value As Decimal)
                _Tax2 = value
            End Set
        End Property

        Private _Order As Integer
        Public Property Order() As Integer
            Get
                Return _Order
            End Get
            Set(value As Integer)
                _Order = value
            End Set
        End Property

        Private _ShippingDate As Date
        Public Property ShippingDate() As Date
            Get
                Return _ShippingDate
            End Get
            Set(ByVal value As Date)
                _ShippingDate = value
            End Set
        End Property

        Private _DateCode As String
        Public Property DateCode() As String
            Get
                Return _DateCode
            End Get
            Set(ByVal value As String)
                _DateCode = value
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

        Private _CustCode As Integer
        Public Property CustCode As Integer
            Get
                Return _CustCode
            End Get
            Set(value As Integer)
                _CustCode = value
            End Set
        End Property

        Private _CustName As String
        Public Property CustName() As String
            Get
                Return _CustName
            End Get
            Set(value As String)
                _CustName = value
            End Set
        End Property

        Private _CustType As String
        Public Property CustType() As String
            Get
                Return _CustType
            End Get
            Set(value As String)
                _CustType = value
            End Set
        End Property

        Private _FarmCode As String
        Public Property FarmCode() As String
            Get
                Return _FarmCode
            End Get
            Set(value As String)
                _FarmCode = value
            End Set
        End Property

        Private _Flower As String
        Public Property Flower() As String
            Get
                Return _Flower
            End Get
            Set(value As String)
                _Flower = value
            End Set
        End Property

        Private _NAME As String
        Public Property NAME() As String
            Get
                Return _NAME
            End Get
            Set(value As String)
                _NAME = value
            End Set
        End Property

        Private _FarmDetails As New Farm
        Public Property FarmDetails() As Farm
            Get
                Return _FarmDetails
            End Get
            Set(ByVal value As Farm)
                _FarmDetails = value
            End Set
        End Property

        Private _FlowerDetails As New Flower
        Public Property FlowerDetails() As Flower
            Get
                Return _FlowerDetails
            End Get
            Set(ByVal value As Flower)
                _FlowerDetails = value
            End Set
        End Property

        'Private _Boxes As Decimal
        'Public Property Boxes() As Decimal
        '    Get
        '        Return _Boxes
        '    End Get
        '    Set(value As Decimal)
        '        _Boxes = value
        '    End Set
        'End Property

        Private _Boxes As Integer
        Public Property Boxes() As Integer
            Get
                Return _Boxes
            End Get
            Set(value As Integer)
                _Boxes = value
            End Set
        End Property

        Private _Boxes1 As Decimal
        Public Property Boxes1() As Decimal
            Get
                Return _Boxes1
            End Get
            Set(value As Decimal)
                _Boxes1 = value
            End Set
        End Property

        Private _FuelBoxes As Decimal
        Public Property FuelBoxes() As Decimal
            Get
                Return _FuelBoxes
            End Get
            Set(value As Decimal)
                _FuelBoxes = value
            End Set
        End Property


        Private _AvailableBoxes As Integer
        Public Property AvailableBoxes() As Integer
            Get
                Return _AvailableBoxes
            End Get
            Set(value As Integer)
                _AvailableBoxes = value
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

        Private _BoxNum As Integer
        Public Property BoxNum() As Integer
            Get
                Return _BoxNum
            End Get
            Set(value As Integer)
                _BoxNum = value
            End Set
        End Property

        Private _BoxCode As String
        Public Property BoxCode() As String
            Get
                Return _BoxCode
            End Get
            Set(value As String)
                _BoxCode = value
            End Set
        End Property

        Private _Notes As String
        Public Property Notes() As String
            Get
                Return _Notes
            End Get
            Set(value As String)
                _Notes = value
            End Set
        End Property

        Private _StoreNo As Integer
        Public Property StoreNo() As Integer
            Get
                Return _StoreNo
            End Get
            Set(value As Integer)
                _StoreNo = value
            End Set
        End Property


        Private _UOM As String
        Public Property UOM As String
            Get
                Return _UOM
            End Get
            Set(value As String)
                _UOM = value
            End Set
        End Property

        Private _Amount As Decimal
        Public Property Amount() As Decimal
            Get
                Return _Amount
            End Get
            Set(value As Decimal)
                _Amount = value
            End Set
        End Property

        Private _Units As Integer
        Public Property Units() As Integer
            Get
                Return _Units
            End Get
            Set(value As Integer)
                _Units = value
            End Set
        End Property

        Private _UnitsBunch As Integer
        Public Property UnitsBunch() As Integer
            Get
                Return _UnitsBunch
            End Get
            Set(value As Integer)
                _UnitsBunch = value
            End Set
        End Property

        Private _TotalUnits As Integer
        Public Property TotalUnits() As Integer
            Get
                Return _TotalUnits
            End Get
            Set(value As Integer)
                _TotalUnits = value
            End Set
        End Property

        Private _TotalUnits1 As Decimal
        Public Property TotalUnits1() As Decimal
            Get
                Return _TotalUnits1
            End Get
            Set(value As Decimal)
                _TotalUnits1 = value
            End Set
        End Property

        Private _Cost As Decimal
        Public Property Cost() As Decimal
            Get
                Return _Cost
            End Get
            Set(value As Decimal)
                _Cost = value
            End Set
        End Property

        Private _OtherCost As Decimal
        Public Property OtherCost() As Decimal
            Get
                Return _OtherCost
            End Get
            Set(value As Decimal)
                _OtherCost = value
            End Set
        End Property

        Private _TotalCost As Decimal
        Public Property TotalCost() As Decimal
            Get
                Return _TotalCost
            End Get
            Set(value As Decimal)
                _TotalCost = value
            End Set
        End Property

        Private _Price As Decimal
        Public Property Price() As Decimal
            Get
                Return _Price
            End Get
            Set(value As Decimal)
                _Price = value
            End Set
        End Property

        Private _marketPrice As Decimal
        Public Property marketPrice() As Decimal
            Get
                Return _marketPrice
            End Get
            Set(value As Decimal)
                _marketPrice = value
            End Set
        End Property

        Private _Packing As Decimal
        Public Property Packing() As Decimal
            Get
                Return _Packing
            End Get
            Set(value As Decimal)
                _Packing = value
            End Set
        End Property

        Private _FOB As Decimal
        Public Property FOB() As Decimal
            Get
                Return _FOB
            End Get
            Set(value As Decimal)
                _FOB = value
            End Set
        End Property

        'Private _AWB As Int64
        'Public Property AWB() As Int64
        '    Get
        '        Return _AWB
        '    End Get
        '    Set(value As Int64)
        '        _AWB = value
        '    End Set
        'End Property

        Private _AWB As String
        Public Property AWB() As String
            Get
                Return _AWB
            End Get
            Set(value As String)
                _AWB = value
            End Set
        End Property

        Private _TotPerLine As Decimal
        Public Property TotPerLine() As Decimal
            Get
                Return _TotPerLine
            End Get
            Set(value As Decimal)
                _TotPerLine = value
            End Set
        End Property

        Private _GrandTotal As Decimal
        Public Property GrandTotal() As Decimal
            Get
                Return _GrandTotal
            End Get
            Set(value As Decimal)
                _GrandTotal = value
            End Set
        End Property

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Private _InvenType As String
        Public Property InvenType As String
            Get
                Return _InvenType
            End Get
            Set(value As String)
                _InvenType = value
            End Set
        End Property

        Private _InvenID As String
        Public Property InvenID As String
            Get
                Return _InvenID
            End Get
            Set(value As String)
                _InvenID = value
            End Set
        End Property

        Private _Type As String
        Public Property Type As String
            Get
                Return _Type
            End Get
            Set(value As String)
                _Type = value
            End Set
        End Property

        Private _PODFlower As String
        Public Property PODFlower As String
            Get
                Return _PODFlower
            End Get
            Set(value As String)
                _PODFlower = value
            End Set
        End Property

        Private _PODate As String
        Public Property PODate As String
            Get
                Return _PODate
            End Get
            Set(value As String)
                _PODate = value
            End Set
        End Property

        Private _POBoxnum As String
        Public Property POBoxNum As String
            Get
                Return _POBoxnum
            End Get
            Set(value As String)
                _POBoxnum = value
            End Set
        End Property

        Private _PONotes As String
        Public Property PONotes As String
            Get
                Return _PONotes
            End Get
            Set(value As String)
                _PONotes = value
            End Set
        End Property

        Private _UPC As String
        Public Property UPC As String
            Get
                Return _UPC
            End Get
            Set(value As String)
                _UPC = value
            End Set
        End Property

        Private _UPCPRICE As String
        Public Property UPCPRICE As String
            Get
                Return _UPCPRICE
            End Get
            Set(value As String)
                _UPCPRICE = value
            End Set
        End Property

        Private _UPCDESC As String
        Public Property UPCDESC As String
            Get
                Return _UPCDESC
            End Get
            Set(value As String)
                _UPCDESC = value
            End Set
        End Property

        'For Calculations
        '====================
        Private _Ext_price As Decimal
        Public Property Ext_Price() As Decimal
            Get
                Return _Ext_price
            End Get
            Set(value As Decimal)
                _Ext_price = value
            End Set
        End Property

        Private _nCost As Decimal
        Public Property nCost() As Decimal
            Get
                Return _nCost
            End Get
            Set(value As Decimal)
                _nCost = value
            End Set
        End Property

        Private _nInvCost As Decimal
        Public Property nInvCost() As Decimal
            Get
                Return _nInvCost
            End Get
            Set(value As Decimal)
                _nInvCost = value
            End Set
        End Property

        Private _nInvAmount As Decimal
        Public Property nInvAmount() As Decimal
            Get
                Return _nInvAmount
            End Get
            Set(value As Decimal)
                _nInvAmount = value
            End Set
        End Property

        Private _nInvFobAmount As Decimal
        Public Property nInvFobAmount() As Decimal
            Get
                Return _nInvFobAmount
            End Get
            Set(value As Decimal)
                _nInvFobAmount = value
            End Set
        End Property

        Private _gpm As Decimal
        Public Property gpm() As Decimal
            Get
                Return _gpm
            End Get
            Set(value As Decimal)
                _gpm = value
            End Set
        End Property

        Private _cInvenType As String
        Public Property cInvenType As String
            Get
                Return _cInvenType
            End Get
            Set(value As String)
                _cInvenType = value
            End Set
        End Property

        Private _BoxHeight As Integer
        Public Property BoxHeight() As Integer
            Get
                Return _BoxHeight
            End Get
            Set(value As Integer)
                _BoxHeight = value
            End Set
        End Property

        Private _BoxWidth As Integer
        Public Property BoxWidth() As Integer
            Get
                Return _BoxWidth
            End Get
            Set(value As Integer)
                _BoxWidth = value
            End Set
        End Property

        Private _BoxLength As Integer
        Public Property BoxLength() As Integer
            Get
                Return _BoxLength
            End Get
            Set(value As Integer)
                _BoxLength = value
            End Set
        End Property

        Private _Cubes As Decimal
        Public Property Cubes() As Decimal
            Get
                Return _Cubes
            End Get
            Set(value As Decimal)
                _Cubes = value
            End Set
        End Property

        Private _wh As String
        Public Property wh() As String
            Get
                Return _wh
            End Get
            Set(value As String)
                _wh = value
            End Set
        End Property

        Private _Armellini As String
        Public Property Armellini() As String
            Get
                Return _Armellini
            End Get
            Set(value As String)
                _Armellini = value
            End Set
        End Property

        Private _PickRemark As String
        Public Property PickRemark() As String
            Get
                Return _PickRemark
            End Get
            Set(value As String)
                _PickRemark = value
            End Set
        End Property

        'For ErrorMessage
        Private _ErrorMessage As String
        Public Property ErrorMessage() As String
            Get
                Return _ErrorMessage
            End Get
            Set(ByVal value As String)
                _ErrorMessage = value
            End Set
        End Property

        Private _Scanned As Boolean
        Public Property Scanned() As Boolean
            Get
                Return _Scanned
            End Get
            Set(ByVal value As Boolean)
                _Scanned = value
            End Set
        End Property

        Private _List As Boolean
        Public Property List() As Boolean
            Get
                Return _List
            End Get
            Set(ByVal value As Boolean)
                _List = value
            End Set
        End Property

        Private _Bills As Boolean
        Public Property Bills() As Boolean
            Get
                Return _Bills
            End Get
            Set(ByVal value As Boolean)
                _Bills = value
            End Set
        End Property

        Private _SLSMAN As String
        Public Property SLSMAN() As String
            Get
                Return _SLSMAN
            End Get
            Set(ByVal value As String)
                _SLSMAN = value
            End Set
        End Property

        Private _DateRec As DateTime
        Public Property DateRec As DateTime
            Get
                Return _DateRec
            End Get
            Set(value As DateTime)
                _DateRec = value
            End Set
        End Property

        Private _CarrierName As String  ''MANI:03-19-2016
        Public Property CarrierName() As String
            Get
                Return _CarrierName
            End Get
            Set(ByVal value As String)
                _CarrierName = value
            End Set
        End Property


        Private _PO As String          ''MANI:03-19-2016
        Public Property PO() As String
            Get
                Return _PO
            End Get
            Set(ByVal value As String)
                _PO = value
            End Set
        End Property


        Private _Shipto As String ''MANI:03-19-2016
        Public Property Shipto() As String
            Get
                Return _Shipto
            End Get
            Set(ByVal value As String)
                _Shipto = value
            End Set
        End Property

        Private _ShiptoAddress1 As String ''MANI:03-19-2016
        Public Property ShiptoAddress1() As String
            Get
                Return _ShiptoAddress1
            End Get
            Set(ByVal value As String)
                _ShiptoAddress1 = value
            End Set
        End Property

        Private _ShiptoAddress2 As String ''MANI:03-19-2016
        Public Property ShiptoAddress2() As String
            Get
                Return _ShiptoAddress2
            End Get
            Set(ByVal value As String)
                _ShiptoAddress2 = value
            End Set
        End Property


        Private _ShiptoCity As String ''MANI:03-19-2016
        Public Property ShiptoCity() As String
            Get
                Return _ShiptoCity
            End Get
            Set(ByVal value As String)
                _ShiptoCity = value
            End Set
        End Property

        Private _ShiptoState As String ''MANI:03-19-2016
        Public Property ShiptoState() As String
            Get
                Return _ShiptoState
            End Get
            Set(ByVal value As String)
                _ShiptoState = value
            End Set
        End Property

        Private _ShiptoZip As String ''MANI:03-19-2016
        Public Property ShiptoZip() As String
            Get
                Return _ShiptoZip
            End Get
            Set(ByVal value As String)
                _ShiptoZip = value
            End Set
        End Property

        Private _BoxSequence As String
        Public Property BoxSequence As String
            Get
                Return _BoxSequence
            End Get
            Set(value As String)
                _BoxSequence = value
            End Set
        End Property

        Private _LabelCode As String
        Public Property LabelCode As String
            Get
                Return _LabelCode
            End Get
            Set(value As String)
                _LabelCode = value
            End Set
        End Property


        Private _ARBoxNo As String
        Public Property ARBoxNo As String
            Get
                Return _ARBoxNo
            End Get
            Set(value As String)
                _ARBoxNo = value
            End Set
        End Property

        Private _Consignee As String
        Public Property Consignee As String
            Get
                Return _Consignee
            End Get
            Set(value As String)
                _Consignee = value
            End Set
        End Property



        Private _ConstantArmellini As String
        Public Property ConstantArmellini As String
            Get
                Return _ConstantArmellini
            End Get
            Set(value As String)
                _ConstantArmellini = value
            End Set
        End Property

        Private _SLSMANEmail As String
        Public Property SLSMANEmail As String
            Get
                Return _SLSMANEmail
            End Get
            Set(value As String)
                _SLSMANEmail = value
            End Set
        End Property

        Private _Prepaid As Boolean
        Public Property Prepaid As Boolean
            Get
                Return _Prepaid
            End Get
            Set(value As Boolean)
                _Prepaid = value
            End Set
        End Property

        Private _ShippingLabelType As String
        Public Property ShippingLabelType As String
            Get
                Return _ShippingLabelType
            End Get
            Set(value As String)
                _ShippingLabelType = value
            End Set
        End Property

        Private _Weight As Decimal
        Public Property Weight() As Decimal
            Get
                Return _Weight
            End Get
            Set(value As Decimal)
                _Weight = value
            End Set
        End Property

        Private _FontColor As String
        Public Property FontColor() As String
            Get
                Return _FontColor
            End Get
            Set(ByVal value As String)
                _FontColor = value
            End Set
        End Property

        Private _BGColor As String
        Public Property BGColor() As String
            Get
                Return _BGColor
            End Get
            Set(ByVal value As String)
                _BGColor = value
            End Set
        End Property

        Private _Account As String
        Public Property Account As String
            Get
                Return _Account
            End Get
            Set(value As String)
                _Account = value
            End Set
        End Property

        Private _Rack As String
        Public Property Rack As String
            Get
                Return _Rack
            End Get
            Set(value As String)
                _Rack = value
            End Set
        End Property

        Private _PrintHeaderReport As String
        Public Property PrintHeaderReport As String
            Get
                Return _PrintHeaderReport
            End Get
            Set(value As String)
                _PrintHeaderReport = value
            End Set
        End Property

        Private _ScannedBox As Integer  ''Abi : 12-May-2017
        Public Property ScannedBox As Integer
            Get
                Return _ScannedBox
            End Get
            Set(value As Integer)
                _ScannedBox = value
            End Set
        End Property

        Private _MissingBox As Integer  ''Abi : 12-May-2017
        Public Property MissingBox As Integer
            Get
                Return _MissingBox
            End Get
            Set(value As Integer)
                _MissingBox = value
            End Set
        End Property

        'Muthu Nivetha M : 13 Mar 19 : For hold tickets restrictions
        Private _IsVoid As Boolean
        Public Property IsVoid() As Boolean
            Get
                Return _IsVoid
            End Get
            Set(ByVal value As Boolean)
                _IsVoid = value
            End Set
        End Property

        'Muthu Nivetha M : 16 Mar 19 : Print Label on look up by boxnumber results screen
        Private _IsVET As Boolean
        Public Property IsVET() As Boolean
            Get
                Return _IsVET
            End Get
            Set(ByVal value As Boolean)
                _IsVET = value
            End Set
        End Property
        '27 Mar 19 :: Muthu Nivetha M ::  On invoice show if line is a substitute
        Private _EXTRAFIELD As String
        Public Property EXTRAFIELD() As String
            Get
                Return _EXTRAFIELD
            End Get
            Set(ByVal value As String)
                _EXTRAFIELD = value
            End Set
        End Property
        Private _CAT As String
        Public Property CAT() As String
            Get
                Return _CAT
            End Get
            Set(ByVal value As String)
                _CAT = value
            End Set
        End Property

        Private _Color As String
        Public Property Color() As String
            Get
                Return _Color
            End Get
            Set(ByVal value As String)
                _Color = value
            End Set
        End Property


        Private _VARIETY As String
        Public Property VARIETY() As String
            Get
                Return _VARIETY
            End Get
            Set(ByVal value As String)
                _VARIETY = value
            End Set
        End Property

        Private _GRADE As String
        Public Property GRADE() As String
            Get
                Return _GRADE
            End Get
            Set(value As String)
                _GRADE = value
            End Set
        End Property
        Private _Dimentions As String
        Public Property Dimentions() As String
            Get
                Return _Dimentions
            End Get
            Set(value As String)
                _Dimentions = value
            End Set
        End Property

        Private _Cargodate As String
        Public Property CargoDate() As String
            Get
                Return _Cargodate
            End Get
            Set(ByVal value As String)
                _Cargodate = value
            End Set
        End Property

        Private _Shipdate As String
        Public Property ShipDate() As String
            Get
                Return _Shipdate
            End Get
            Set(ByVal value As String)
                _Shipdate = value
            End Set
        End Property

        Private _Origin As String
        Public Property Origin() As String
            Get
                Return _Origin
            End Get
            Set(ByVal value As String)
                _Origin = value
            End Set
        End Property

        Private _Freightout As Decimal
        Public Property Freightout() As Decimal
            Get
                Return _Freightout
            End Get
            Set(ByVal value As Decimal)
                _Freightout = value
            End Set
        End Property

    End Class

    Public Class SalesCallHS

        'CUSTOMER int,DATE Date,TIME varchar(20),NOTE varchar(128),PERSON varchar(10)

        Private _ID As Integer
        Public Property ID() As Integer
            Get
                Return _ID
            End Get
            Set(ByVal value As Integer)
                _ID = value
            End Set
        End Property

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Private _CUSTOMER As Integer
        Public Property CUSTOMER() As Integer
            Get
                Return _CUSTOMER
            End Get
            Set(value As Integer)
                _CUSTOMER = value
            End Set
        End Property

        Private _CallHS_DATE As Date
        Public Property CallHS_DATE() As Date
            Get
                Return _CallHS_DATE
            End Get
            Set(value As Date)
                _CallHS_DATE = value
            End Set
        End Property

        Private _CallHS_TIME As String
        Public Property CallHS_TIME() As String
            Get
                Return _CallHS_TIME
            End Get
            Set(value As String)
                _CallHS_TIME = value
            End Set
        End Property

        Private _NOTE As String
        Public Property NOTE() As String
            Get
                Return _NOTE
            End Get
            Set(value As String)
                _NOTE = value
            End Set
        End Property

        Private _PERSON As String
        Public Property PERSON() As String
            Get
                Return _PERSON
            End Get
            Set(value As String)
                _PERSON = value
            End Set
        End Property

        'For ErrorMessage
        Private _ErrorMessage As String
        Public Property ErrorMessage() As String
            Get
                Return _ErrorMessage
            End Get
            Set(ByVal value As String)
                _ErrorMessage = value
            End Set
        End Property

    End Class

    Public Class Chart
        Private _CarrierDetailsByFBE As New List(Of SalesHeader)
        Public Property CarrierDetailsByFBE() As List(Of SalesHeader)
            Get
                Return _CarrierDetailsByFBE
            End Get
            Set(value As List(Of SalesHeader))
                _CarrierDetailsByFBE = value
            End Set
        End Property

        Private _CarrierDetailsByBoxes As New List(Of SalesHeader)
        Public Property CarrierDetailsByBoxes() As List(Of SalesHeader)
            Get
                Return _CarrierDetailsByBoxes
            End Get
            Set(value As List(Of SalesHeader))
                _CarrierDetailsByBoxes = value
            End Set
        End Property

        Private _StateDetailsByBoxes As New List(Of SalesHeader)
        Public Property StateDetailsByBoxes() As List(Of SalesHeader)
            Get
                Return _StateDetailsByBoxes
            End Get
            Set(value As List(Of SalesHeader))
                _StateDetailsByBoxes = value
            End Set
        End Property

        Private _StateDetailsBySales As New List(Of SalesHeader)
        Public Property StateDetailsBySales() As List(Of SalesHeader)
            Get
                Return _StateDetailsBySales
            End Get
            Set(value As List(Of SalesHeader))
                _StateDetailsBySales = value
            End Set
        End Property

        Private _SalesManDetails As New List(Of SalesHeader)
        Public Property SalesManDetails() As List(Of SalesHeader)
            Get
                Return _SalesManDetails
            End Get
            Set(value As List(Of SalesHeader))
                _SalesManDetails = value
            End Set
        End Property

        Private _FlowerColorDetailsByBoxes As New List(Of SalesHeader)
        Public Property FlowerColorDetailsByBoxes() As List(Of SalesHeader)
            Get
                Return _FlowerColorDetailsByBoxes
            End Get
            Set(value As List(Of SalesHeader))
                _FlowerColorDetailsByBoxes = value
            End Set
        End Property

        Private _FlowerColorDetailsBySales As New List(Of SalesHeader)
        Public Property FlowerColorDetailsBySales() As List(Of SalesHeader)
            Get
                Return _FlowerColorDetailsBySales
            End Get
            Set(value As List(Of SalesHeader))
                _FlowerColorDetailsBySales = value
            End Set
        End Property

        Private _FlowerCatDetails As New List(Of SalesHeader)
        Public Property FlowerCatDetails() As List(Of SalesHeader)
            Get
                Return _FlowerCatDetails
            End Get
            Set(value As List(Of SalesHeader))
                _FlowerCatDetails = value
            End Set
        End Property


        Private _FlowerDescDetails As New List(Of SalesHeader)
        Public Property FlowerDescDetails() As List(Of SalesHeader)
            Get
                Return _FlowerDescDetails
            End Get
            Set(value As List(Of SalesHeader))
                _FlowerDescDetails = value
            End Set
        End Property

        Private _ErrorMessage As String
        Public Property ErrorMessage() As String
            Get
                Return _ErrorMessage
            End Get
            Set(ByVal value As String)
                _ErrorMessage = value
            End Set
        End Property
    End Class

    Public Class SalesSummary

        Private _RowNo As Integer
        Public Property RowNo() As Integer
            Get
                Return _RowNo
            End Get
            Set(ByVal value As Integer)
                _RowNo = value
            End Set
        End Property

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property


        Private _SALESMAN As Integer
        Public Property SALESMAN() As Integer
            Get
                Return _SALESMAN
            End Get
            Set(ByVal value As Integer)
                _SALESMAN = value
            End Set
        End Property

        Private _SalesManName As String
        Public Property SalesManName() As String
            Get
                Return _SalesManName
            End Get
            Set(ByVal value As String)
                _SalesManName = value
            End Set
        End Property

        Private _Boxes As Integer
        Public Property Boxes() As Integer
            Get
                Return _Boxes
            End Get
            Set(value As Integer)
                _Boxes = value
            End Set
        End Property


        Private _SALES As Decimal
        Public Property SALES() As Decimal
            Get
                Return _SALES
            End Get
            Set(ByVal value As Decimal)
                _SALES = value
            End Set
        End Property

        Private _PROFIT As Decimal
        Public Property PROFIT() As Decimal
            Get
                Return _PROFIT
            End Get
            Set(ByVal value As Decimal)
                _PROFIT = value
            End Set
        End Property

        Private _gpm As Decimal
        Public Property gpm() As Decimal
            Get
                Return _gpm
            End Get
            Set(value As Decimal)
                _gpm = value
            End Set
        End Property

        Private _C As Decimal
        Public Property C() As Decimal
            Get
                Return _C
            End Get
            Set(ByVal value As Decimal)
                _C = value
            End Set
        End Property

        Private _I As Decimal
        Public Property I() As Decimal
            Get
                Return _I
            End Get
            Set(ByVal value As Decimal)
                _I = value
            End Set
        End Property

        Private _INV As Decimal
        Public Property INV() As Decimal
            Get
                Return _INV
            End Get
            Set(ByVal value As Decimal)
                _INV = value
            End Set
        End Property

        'For ErrorMessage
        Private _ErrorMessage As String
        Public Property ErrorMessage() As String
            Get
                Return _ErrorMessage
            End Get
            Set(ByVal value As String)
                _ErrorMessage = value
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

    End Class

    Public Class EmailLog
        Public Property SalesManEmail() As String
            Get
                Return _SalesManEmail
            End Get
            Set
                _SalesManEmail = Value
            End Set
        End Property
        Private _SalesManEmail As String

        Public Property CustomerEMail() As String
            Get
                Return _CustEMail
            End Get
            Set
                _CustEMail = Value
            End Set
        End Property
        Private _CustEMail As String

        Public Property TotalAmount() As Decimal
            Get
                Return _TotalAmount
            End Get
            Set
                _TotalAmount = Value
            End Set
        End Property
        Private _TotalAmount As Decimal

        Public Property InvoiceNo() As String
            Get
                Return _InvoiceNo
            End Get
            Set
                _InvoiceNo = Value
            End Set
        End Property
        Private _InvoiceNo As String

        Public Property CustomerName() As String
            Get
                Return _CustomerName
            End Get
            Set
                _CustomerName = Value
            End Set
        End Property
        Private _CustomerName As String

        Public Property PO() As String
            Get
                Return _PO
            End Get
            Set
                _PO = Value
            End Set
        End Property
        Private _PO As String

        Public Property BodyContent() As String
            Get
                Return _BodyContent
            End Get
            Set
                _BodyContent = Value
            End Set
        End Property
        Private _BodyContent As String

        Public Property Subject() As String
            Get
                Return _Subject
            End Get
            Set
                _Subject = Value
            End Set
        End Property
        Private _Subject As String

        Public Property ErrorMsg() As String
            Get
                Return _ErrorMsg
            End Get
            Set
                _ErrorMsg = Value
            End Set
        End Property
        Private _ErrorMsg As String

    End Class

    Public Class StandingOrder
        Private _SrNo As String
        Public Property SrNo() As String
            Get
                Return _SrNo
            End Get
            Set
                _SrNo = Value
            End Set
        End Property

        Private _Flower As String
        Public Property Flower() As String
            Get
                Return _Flower
            End Get
            Set
                _Flower = Value
            End Set
        End Property

        Private _FlowerName As String
        Public Property FlowerName() As String
            Get
                Return _FlowerName
            End Get
            Set
                _FlowerName = Value
            End Set
        End Property

        Private _Farm As String
        Public Property Farm() As String
            Get
                Return _Farm
            End Get
            Set
                _Farm = Value
            End Set
        End Property

        Private _InvenQty As String
        Public Property InvenQty() As String
            Get
                Return _InvenQty
            End Get
            Set
                _InvenQty = Value
            End Set
        End Property

        Private _InvenUOM As String
        Public Property InvenUOM() As String
            Get
                Return _InvenUOM
            End Get
            Set
                _InvenUOM = Value
            End Set
        End Property

        Private _Customer As String
        Public Property Customer() As String
            Get
                Return _Customer
            End Get
            Set
                _Customer = Value
            End Set
        End Property

        Private _CustomerName As String
        Public Property CustomerName() As String
            Get
                Return _CustomerName
            End Get
            Set
                _CustomerName = Value
            End Set
        End Property

        Private _Boxes As String
        Public Property Boxes() As String
            Get
                Return _Boxes
            End Get
            Set
                _Boxes = Value
            End Set
        End Property

        Private _UOM As String
        Public Property UOM() As String
            Get
                Return _UOM
            End Get
            Set
                _UOM = Value
            End Set
        End Property

        Private _ShipDay As String
        Public Property ShipDay() As String
            Get
                Return _ShipDay
            End Get
            Set
                _ShipDay = Value
            End Set
        End Property

        Private _DiffQty As String
        Public Property DiffQty() As String
            Get
                Return _DiffQty
            End Get
            Set
                _DiffQty = Value
            End Set
        End Property

        Private _OrderedQty As String
        Public Property OrderedQty() As String
            Get
                Return _OrderedQty
            End Get
            Set
                _OrderedQty = Value
            End Set
        End Property

        Private _UnitsPerBox As String
        Public Property UnitsPerBox() As String
            Get
                Return _UnitsPerBox
            End Get
            Set
                _UnitsPerBox = Value
            End Set
        End Property

        Private _TotalAmt As String
        Public Property TotalAmt() As String
            Get
                Return _TotalAmt
            End Get
            Set
                _TotalAmt = Value
            End Set
        End Property

        Private _Shipdate As String
        Public Property ShipDate() As String
            Get
                Return _Shipdate
            End Get
            Set
                _Shipdate = Value
            End Set
        End Property

        Private _ColorCode As String
        Public Property ColorCode() As String
            Get
                Return _ColorCode
            End Get
            Set
                _ColorCode = Value
            End Set
        End Property

        Private _BGColor As String
        Public Property BGColor() As String
            Get
                Return _BGColor
            End Get
            Set
                _BGColor = Value
            End Set
        End Property

        Private _SQLId As String
        Public Property SQLId() As String
            Get
                Return _SQLId
            End Get
            Set
                _SQLId = Value
            End Set
        End Property
        Private _Comments As String
        Public Property Comments() As String
            Get
                Return _Comments
            End Get
            Set
                _Comments = Value
            End Set
        End Property

        Private _CreditHold As String
        Public Property CreditHold() As String
            Get
                Return _CreditHold
            End Get
            Set
                _CreditHold = Value
            End Set
        End Property

        Private _CreditReason As String
        Public Property CreditReason() As String
            Get
                Return _CreditReason
            End Get
            Set
                _CreditReason = Value
            End Set
        End Property

        Private _GPM As String
        Public Property GPM() As String
            Get
                Return _GPM
            End Get
            Set
                _GPM = Value
            End Set
        End Property

        Private _FOB As String
        Public Property FOB() As String
            Get
                Return _FOB
            End Get
            Set
                _FOB = Value
            End Set
        End Property

        Private _Carrier As String
        Public Property Carrier() As String
            Get
                Return _Carrier
            End Get
            Set
                _Carrier = Value
            End Set
        End Property

        Private _SalesPerson As String
        Public Property SalesPerson() As String
            Get
                Return _SalesPerson
            End Get
            Set
                _SalesPerson = Value
            End Set
        End Property
    End Class

    Public Class SalesOrderAllocation
        Private _SrNo As String
        Public Property SrNo() As String
            Get
                Return _SrNo
            End Get
            Set
                _SrNo = Value
            End Set
        End Property

        Private _Flower As String
        Public Property Flower() As String
            Get
                Return _Flower
            End Get
            Set
                _Flower = Value
            End Set
        End Property

        Private _FlowerName As String
        Public Property FlowerName() As String
            Get
                Return _FlowerName
            End Get
            Set
                _FlowerName = Value
            End Set
        End Property

        Private _Farm As String
        Public Property Farm() As String
            Get
                Return _Farm
            End Get
            Set
                _Farm = Value
            End Set
        End Property

        Private _InvenQty As String
        Public Property InvenQty() As String
            Get
                Return _InvenQty
            End Get
            Set
                _InvenQty = Value
            End Set
        End Property

        Private _InvenUOM As String
        Public Property InvenUOM() As String
            Get
                Return _InvenUOM
            End Get
            Set
                _InvenUOM = Value
            End Set
        End Property

        Private _Customer As String
        Public Property Customer() As String
            Get
                Return _Customer
            End Get
            Set
                _Customer = Value
            End Set
        End Property

        Private _CustomerName As String
        Public Property CustomerName() As String
            Get
                Return _CustomerName
            End Get
            Set
                _CustomerName = Value
            End Set
        End Property

        Private _Boxes As String
        Public Property Boxes() As String
            Get
                Return _Boxes
            End Get
            Set
                _Boxes = Value
            End Set
        End Property

        Private _UOM As String
        Public Property UOM() As String
            Get
                Return _UOM
            End Get
            Set
                _UOM = Value
            End Set
        End Property

        Private _ShipDay As String
        Public Property ShipDay() As String
            Get
                Return _ShipDay
            End Get
            Set
                _ShipDay = Value
            End Set
        End Property

        Private _DiffQty As String
        Public Property DiffQty() As String
            Get
                Return _DiffQty
            End Get
            Set
                _DiffQty = Value
            End Set
        End Property

        Private _OrderedQty As String
        Public Property OrderedQty() As String
            Get
                Return _OrderedQty
            End Get
            Set
                _OrderedQty = Value
            End Set
        End Property

        Private _UnitsPerBox As String
        Public Property UnitsPerBox() As String
            Get
                Return _UnitsPerBox
            End Get
            Set
                _UnitsPerBox = Value
            End Set
        End Property

        Private _TotalAmt As String
        Public Property TotalAmt() As String
            Get
                Return _TotalAmt
            End Get
            Set
                _TotalAmt = Value
            End Set
        End Property

        Private _Shipdate As String
        Public Property ShipDate() As String
            Get
                Return _Shipdate
            End Get
            Set
                _Shipdate = Value
            End Set
        End Property

        Private _ColorCode As String
        Public Property ColorCode() As String
            Get
                Return _ColorCode
            End Get
            Set
                _ColorCode = Value
            End Set
        End Property

        Private _BGColor As String
        Public Property BGColor() As String
            Get
                Return _BGColor
            End Get
            Set
                _BGColor = Value
            End Set
        End Property

        Private _SQLId As String
        Public Property SQLId() As String
            Get
                Return _SQLId
            End Get
            Set
                _SQLId = Value
            End Set
        End Property
        Private _Comments As String
        Public Property Comments() As String
            Get
                Return _Comments
            End Get
            Set
                _Comments = Value
            End Set
        End Property

        Private _CreditHold As String
        Public Property CreditHold() As String
            Get
                Return _CreditHold
            End Get
            Set
                _CreditHold = Value
            End Set
        End Property

        Private _CreditReason As String
        Public Property CreditReason() As String
            Get
                Return _CreditReason
            End Get
            Set
                _CreditReason = Value
            End Set
        End Property

        Private _GPM As String
        Public Property GPM() As String
            Get
                Return _GPM
            End Get
            Set
                _GPM = Value
            End Set
        End Property

        Private _InvoiceNo As String
        Public Property InvoiceNo() As String
            Get
                Return _InvoiceNo
            End Get
            Set
                _InvoiceNo = Value
            End Set
        End Property
        Private _FOB As Decimal
        Public Property FOB() As Decimal
            Get
                Return _FOB
            End Get
            Set
                _FOB = Value
            End Set
        End Property
        Private _Price As Decimal
        Public Property Price() As Decimal
            Get
                Return _Price
            End Get
            Set
                _Price = Value
            End Set
        End Property
        Private _Awb As String
        Public Property Awb() As String
            Get
                Return _Awb
            End Get
            Set
                _Awb = Value
            End Set
        End Property

        Public LandedCost As Decimal
        Public nPer0 As Decimal
        Public IsPriceCalculated As Short
        Public SalesmanEmail As String
        Public ShortQty As Integer
        'Public nPer1 As Decimal
        'Public nPer2 As Decimal
    End Class
End Namespace

Public Interface ICustomParams_CallHSCustomer
    Property CallHSCustomer() As String
End Interface


Public Interface ICustomParams_CallHSDate
    Property CallHSDate() As String
End Interface

Public Interface ICustomParams_SalesPage
    Property SalesPage() As String
End Interface

Public Interface ICustomParams_SalesOrderNo
    Property SalesOrderNo() As String
End Interface

Public Interface ICustomParams_OrderDetailID
    Property OrderDetailID() As String
End Interface


Public Interface ICustomParams_SalesFilter
    Property SalesFilter() As String
End Interface

Public Interface ICustomParams_SalesSummaryFilter
    Property SalesSummaryFilter() As String
End Interface


Public Interface ICustomParams_CalledFromVET
    Property CalledFromVET() As String
End Interface
'Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
Public Interface ICustomParams_IsVoided
    Property IsVoided() As String
End Interface

