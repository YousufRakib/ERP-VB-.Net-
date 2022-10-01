
Imports System.Data.SqlClient
Imports System.Data


Public Class VET
    Public Function GetVETInvoiceDetailsList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                             ByVal numberOfRows As Integer) As List(Of VET_)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of VET_)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "flower"
                End If

                'Dim Qry As String = ""


                If (whereClause IsNot Nothing And whereClause <> "") Then
                    '    Qry = String.Format("select top 5000  *,IIF(nInvFobAmount <> 0 AND Type <> 'K',Cast(((nInvFobAmount -nCost)/nInvFobAmount * 100) as numeric(18,2)),cast(0 as numeric(18,2))) as GPM from" +
                    '                        "(select Invoice,Customer, VET.Flower, VET.[DESC], cc.Bgcolor, cc.color as Fontcolor, VET.Salesman, Farm, AWB, VET.Boxes, VET.UOM, VET.Units, (VET.Boxes * VET.Units) As TotalUnits," +
                    '                        "FOB,[Type],Boxnum,BoxCode,UPC,PODFlower,sls.Name as slsname,((vet.Boxes*vet.Units*vet.Price) + (Packing *vet.Boxes +fuel*vet.boxes)) as nInvFobAmount," +
                    '                        "(vet.boxes*vet.units*cost + vet.boxes*othercost) as nCost from VET_ vet " +
                    '                        "left join f_slsman sls on vet.Salesman=sls.Salesman left join f_flower flo on vet.flower=flo.flower left join tblcolorcode cc " +
                    '                        "on flo.colorcode=cc.code) as v where Type <> 'K' and FARM<>'ZZ' and Customer<>0 order by " + sortExp)
                    'Else
                    'Qry = String.Format("select *,IIF(nInvFobAmount <> 0 AND Type <> 'K',Cast(((nInvFobAmount -nCost)/nInvFobAmount * 100) as numeric(18,2)),cast(0 as numeric(18,2))) as GPM from" +
                    '                    "(select Invoice,Customer, VET.Flower, VET.[DESC], cc.Bgcolor, cc.color as Fontcolor, VET.Salesman, Farm, AWB, VET.Boxes, VET.UOM, VET.Units, (VET.Boxes * VET.Units) As TotalUnits," +
                    '                    "FOB,[Type],Boxnum,BoxCode,UPC,PODFlower,sls.Name as slsname,((vet.Boxes*vet.Units*vet.Price) + (Packing *vet.Boxes +fuel*vet.boxes)) as nInvFobAmount," +
                    '                    "(vet.boxes*vet.units*cost + vet.boxes*othercost) as nCost from VET_ vet " +
                    '                    "left join f_slsman sls on vet.Salesman=sls.Salesman left join f_flower flo on vet.flower=flo.flower left join tblcolorcode cc " +
                    '                    "on flo.colorcode=cc.code where Type <> 'K' and FARM<>'ZZ' and Customer<>0) as v where " + whereClause + " order by " + sortExp)
                    'Qry = String.Format("select *,IIF(nInvFobAmount <> 0 AND Type <> 'K',Cast(((nInvFobAmount - ISNULL((COST.TOTALEXPENSEPERFBE*dbo.GetFBE(v.FCAT,v.FARM,v.UOM)/UNITS+COST+ANDEAN)*totalunits,nCost))/nInvFobAmount * 100) as numeric(18,2)),cast(0 as numeric(18,2))) as GPM  from vwVETInvoiceDetails v OUTER APPLY [dbo].GetActualExpenseperfbe(v.AWB,v.FARM) COST  where " + whereClause + " order by " + sortExp)
                End If

                Using cmd As New SqlCommand("spGetVETInvoiceDetailsList", Con)
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
                            Dim u As New VET_
                            u.RowNo = row("RECNO")
                            u.ID = row("ID")
                            u.Invoice = row("Invoice")
                            u.Customer = IIf(row("Customer") Is DBNull.Value, "", row("Customer"))
                            u.Flower = row("FLOWER")
                            u.Description = row("Desc")
                            u.Slsname = IIf(row("Slsname") Is DBNull.Value, "", row("Slsname"))
                            u.Farm = IIf(row("Farm") Is DBNull.Value, "", row("Farm"))
                            u.AWB = IIf(row("AWB") Is DBNull.Value, "", row("AWB"))
                            u.Boxes = IIf(row("Farm") = "ZZ", Convert.ToDecimal(row("Boxes")), Convert.ToInt32(row("Boxes")))
                            u.UOM = IIf(row("UOM") Is DBNull.Value, "", row("UOM"))
                            u.Units = IIf(row("Units") Is DBNull.Value, 0, row("Units"))
                            u.TotalUnits = IIf(row("TOTALUNITS") Is DBNull.Value, 0, row("TOTALUNITS"))
                            u.TotalUnits1 = IIf(row("TOTALUNITS") Is DBNull.Value, 0, row("TOTALUNITS"))
                            u.FOB = IIf(row("FOB") Is DBNull.Value, 0.0000, row("FOB"))
                            u.TotPerLine = Convert.ToDecimal(row("nInvFobAmount")) 'Convert.ToDecimal(row("BOXES") * row("Units") * row("FOB"))
                            u.Type = IIf(row("Type") Is DBNull.Value, "", row("Type"))
                            If (Convert.ToString(row("gpm")) <> "") Then
                                'u.gpm = Math.Truncate(row("gpm") * 10) / 10
                                u.GPM = Convert.ToDecimal(row("gpm"))
                            End If
                            u.Boxnum = IIf(row("BOXNUM") Is DBNull.Value, 0, row("BOXNUM"))
                            u.Boxcode = IIf(row("BOXCODE") Is DBNull.Value, "", row("BOXCODE"))
                            u.UPC = IIf(row("UPC") Is DBNull.Value, "", row("UPC"))
                            u.PODFlower = IIf(row("PODFlower") Is DBNull.Value, "", row("PODFlower"))
                            u.Bgcolor = IIf(row("BGCOLOR") Is DBNull.Value, "", row("BGCOLOR"))
                            u.Fontcolor = IIf(row("FONTCOLOR") Is DBNull.Value, "", row("FONTCOLOR"))
                            u.RecDate = row("DATEREC")
                            u.VET1Date = row("Date")
                            u.FarmName = row("FarmName")
                            u.PO = IIf(row("PO") Is DBNull.Value Or row("PO") = "", "", row("PO"))
                            u.Salesman = IIf(row("Salesman") Is DBNull.Value, "0", row("Salesman"))
                            u.Fuel = IIf(row("Fuel") Is DBNull.Value, "0", row("Fuel"))
                            u.Tax1 = IIf(row("Tax1") Is DBNull.Value, "0", row("Tax1"))
                            u.Tax2 = IIf(row("Tax2") Is DBNull.Value, "0", row("Tax2"))
                            u.ANDEAN = IIf(row("ANDEAN") Is DBNull.Value, "0", row("ANDEAN"))
                            u.TotalRows = TotalCount
                            u.InvenID = row("IDINVEN")
                            u.Cost = IIf(row("COST") Is DBNull.Value, "0", row("COST"))
                            u.Handling = IIf(row("HANDLING") Is DBNull.Value, "0", row("HANDLING"))
                            u.Othercost = IIf(row("OTHERCOST") Is DBNull.Value, "0", row("OTHERCOST"))
                            u.Landedcost = IIf(row("LANDEDCOST") Is DBNull.Value, "0", row("LANDEDCOST"))
                            u.ActualLandedcost = IIf(row("ActualLandedcost") Is DBNull.Value, "0", row("ActualLandedcost"))
                            u.ActualFreight = IIf(row("ActualFreight") Is DBNull.Value, "0", row("ActualFreight"))
                            u.ActualHandling = IIf(row("ActualHandling") Is DBNull.Value, "0", row("ActualHandling"))
                            u.ActualOtherCharges = IIf(row("ActualOtherCharges") Is DBNull.Value, "0", row("ActualOtherCharges"))
                            u.EstimatedGPM = IIf(row("EstimatedGPM") Is DBNull.Value, "0", row("EstimatedGPM"))

                            TotalGrandTotal += u.TotPerLine
                            ulistsalesDetails.Add(u)
                        Next
                    End If

                    Dim po As New VET_()
                    po.RowNo = 0
                    po.ID = 0
                    po.Invoice = ""
                    po.Customer = ""
                    po.Flower = ""
                    po.Description = ""
                    po.Slsname = ""
                    po.Farm = ""
                    po.Bgcolor = ""
                    po.Fontcolor = ""
                    po.Boxes = TotalBoxes
                    po.UOM = ""
                    po.Units = 0
                    po.TotalUnits = TotalUnits
                    po.FOB = 0
                    po.TotPerLine = TotalGrandTotal
                    po.Type = ""
                    po.GPM = Totalgpm

                    po.Boxnum = 0
                    po.Boxcode = ""
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
            ErrorLogs.LogException(ex, "Error in GetCustomerDetailsFromSQL")
            Throw ex
        End Try

    End Function

    Public Shared Function CheckInvVET(ByVal Invoice As String) As List(Of VET_)
        Try
            Dim uList As New List(Of VET_)()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetCustomerNumberfromVET1_", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("invoice", Invoice)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    For Each row In ds.Tables(0).Rows
                        Dim u As New VET_()
                        u.Invoice = row("Invoice")
                        u.RecDate = row("Date")
                        u.Customer = row("Customer")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckInvVET")
            Return Nothing
        End Try
    End Function


    Public Shared Function GetPONumberFromVETForAutocomplete(ByVal SearchText As String) As List(Of VET_)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of VET_)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("sp_GetVET1forAutocomplete", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@SearchText", SearchText)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New VET_()
                        u.PO = row("PO")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCancelReason")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetInvoiceNoListFromVETByPONumber(ByVal PONumber As String) As List(Of VET_)
        Try
            Dim uList As New List(Of VET_)()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Top 1 Invoice from VET1_ where PO=@PO", con)
                    cmd.Parameters.AddWithValue("PO", PONumber)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New VET_()
                        u.Invoice = row("Invoice")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvoiceNoListFromVETByPONumber")
            Return Nothing
        End Try
    End Function




    Public Shared Function GetInvoiceReportHeaderFromVET(ByVal Order As String) As List(Of BO.SalesHeader)
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim uList As New List(Of BO.SalesHeader)
        Using Con As New SqlConnection(ConStr)
            Try
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("SELECT VET1.INVOICE,isnull(VET1.PRINTED,0) PRINTED,VET1.VOID,VET1.CUSTOMER,CU.NAME AS 'BILLTO',CU.ADDRESS1,CU.ADDRESS2,CU.PHONE,CU.FAX,CU.CITY,CU.STATE," + "CU.COUNTRY,CU.ZIP,CU.CONTACT,VET1.SHIPTONAME,VET1.SHIPTOADD1,VET1.SHIPTOADD2,VET1.shiptocity,VET1.shiptost,VET1.shiptozip," +
                  "CAR.NAME AS 'CARRIER',SLS.NAME AS 'SALESMAN',CU.PICKREMARK, " +
                  "VET1.TEXT1,VET1.TEXT2,VET1.TEXT3,VET1.TEXT4,VET1.TEXT5, " +
                  "VET1.DATE AS 'SHIPDATE',VET1.PO,VET1.AWB,VET1.WH,VET1.TERMS,TER.TERMSDESC FROM VET1_ VET1 " +
                  "INNER JOIN F_CUST CU ON CU.CUSTOMER=VET1.CUSTOMER LEFT JOIN F_CARRIE CAR ON CAR.CARRIER=VET1.CARRIER " +
                  "INNER JOIN F_SLSMAN SLS ON SLS.SALESMAN=VET1.SLSMAN " +
                  "LEFT JOIN F_TERMS TER ON TER.CODE=VET1.TERMS " +
                  "WHERE VET1.INVOICE IN ({0}) ", Order), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesHeader
                        u.Order = Convert.ToInt32(row("INVOICE"))
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
                        u.Terms = Convert.ToString(row("TERMSDESC"))
                        u.ShippingDate = Convert.ToString(row("SHIPDATE"))
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

                Return uList

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetInvoiceReportHeaderFromVET")
            End Try
        End Using
        Return Nothing
    End Function



    Public Shared Function GetInvoiceReportDetailFromVET(ByVal Order As String) As List(Of BO.SalesDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.SalesDetail)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("SELECT OR2.INVOICE,OR2.UOM,OR2.CAT AS FLRCAT,OR2.[DESC] FLRDESC,OR2.FLOWER,OR2.FARM,sum(OR2.BOXES) BOXES,OR2.UNITS,sum(OR2.BOXES * OR2.UNITS) AS TOTALUNITS,SUM(((OR2.BOXES * OR2.UNITS)*OR2.FOB)) AS AMOUNT,OR2.FOB,OR2.Type,OR2.TAX1,OR2.TAX2,ISNULL(OR2.L,0) L,ISNULL(OR2.W,0) W,ISNULL(OR2.H ,0) H, OR2.UPC, OR2.DATECODE, OR2.BOXCODE FROM VET_ OR2 LEFT JOIN F_FARM FA ON FA.FARM = OR2.FARM WHERE OR2.INVOICE In ({0}) Group by OR2.INVOICE, OR2.UOM, OR2.CAT, OR2.[DESC], OR2.FLOWER, OR2.FARM, OR2.UNITS, OR2.FOB,OR2.Type,OR2.TAX1,OR2.TAX2,ISNULL(OR2.L,0),ISNULL(OR2.W,0),ISNULL(OR2.H ,0), OR2.UPC, OR2.DATECODE, OR2.BOXCODE", Order), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.SalesDetail
                        u.Order = Convert.ToInt32(row("INVOICE"))
                        u.FlowerDetails.Flower = Convert.ToString(row("FLOWER"))
                        u.FlowerDetails.Name = Convert.ToString(row("FLRDESC"))
                        u.FlowerDetails.CAT = Convert.ToString(row("FLRCAT"))
                        u.FOB = Convert.ToString(row("FOB"))
                        If (Convert.ToString(row("BOXES")) <> "") Then
                            u.Boxes1 = Convert.ToDecimal(row("BOXES"))
                        Else
                            u.Boxes1 = 0.00
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
                        u.FarmDetails.FarmCode = Convert.ToString(row("Farm"))

                        Dim Prod As New BOProd
                        Prod = DAOProd.GetProdDetailsByFBECalcMethod(u.FlowerDetails.CAT, u.FarmDetails.FarmCode, u.UOM)
                        u.BoxLength = Convert.ToInt32(Prod.L)
                        u.BoxWidth = Convert.ToInt32(Prod.W)
                        u.BoxHeight = Convert.ToInt32(Prod.H)
                        u.Boxes = Math.Round(Convert.ToDecimal(row("BOXES")), 0, MidpointRounding.AwayFromZero)
                        u.Cubes = ((u.BoxLength * u.BoxWidth * u.BoxHeight) / 1728) * u.Boxes
                        u.Type = row("Type")
                        'SOFIA: 10/08/2021 - NEW FIELDS IN RPTINVOICE FOR CARRIER CARGO AGENT (ARLINE C)
                        u.UPC = row("UPC")
                        u.DateCode = row("DateCode")
                        u.BoxCode = row("BoxCode")

                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvoiceReportDetailFromVET")
            Throw ex
        End Try
    End Function

    Public Shared Function GetVETDate(ByVal Invoice As String) As Date
        Try
            Dim uList As New List(Of VET_)()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ShipDate As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Date from VET1_ where Invoice = '" + Invoice + "'", con)
                    cmd.CommandType = CommandType.Text
                    Using rdr As SqlDataReader = cmd.ExecuteReader()
                        While (rdr.Read())
                            ShipDate = rdr("Date")
                        End While
                    End Using
                End Using
            End Using
            Return ShipDate
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckInvVET")
            Return Nothing
        End Try
    End Function


    ''' <summary>
    ''' MANI :: Delete VET Detail by ID:: 10/22/2018
    ''' </summary>
    ''' <param name="VETDetailID"></param>
    ''' <param name="UserName"></param>
    ''' <returns></returns>
    Public Shared Function DeleteVETDetail(ByVal VETDetailID As String, ByVal UserName As String) As String
        Try

            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If


            ''Insert Acticvity log in F_SLSCHG for the particular line
            Try
                F_CREREQ.InsertintoF_SLSCHG(VETDetailID, "D", UserName)
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in Service::InsertintoF_SLSCHG::DeleteVETDetail")
                'Return Nothing
            End Try

            Dim dt As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPDeleteVETDetail_temp", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@VETDetailID", VETDetailID)
                    ExsCmd.Parameters.AddWithValue("@USERNAME", UserName)
                    Dim da As New SqlDataAdapter(ExsCmd)
                    da.Fill(dt)
                End Using
            End Using

            If dt.Rows.Count > 0 Then
                If dt.Rows(0)(0).ToString() = "Invalid inventory" Then
                    Return dt.Rows(0)(0).ToString()
                End If
            End If
            Dim CurrentDate = DateTime.Now.ToString("MM/dd/yyyy")

            Try
                Payments.WRTAR(dt(0)("Invoice"), CurrentDate, "1", 0, -dt(0)("Amount"), dt(0)("Customer"), 0.00, 0, "Line deleted", UserName)
                'Payments.WRTAR(dt(0)("Invoice"), dt(0)("InvDate"), "1", 0, -dt(0)("Amount"), dt(0)("Customer"), 0.00, 0, "", UserName)
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in Service::WRTAR::DeleteVETDetail")
                'Return Nothing
            End Try

            Return "success"

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteVETDetail")
            Throw ex
        End Try
    End Function

    ''' <summary>
    '''MANI:10/23/2018: When Edit an line on VET detail Get the details for that line
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    Public Shared Function GetVETDetailsByID(ByVal ID As String) As BO.SalesDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim o As New BO.SalesDetail
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("select V.[Desc],V.Units,V.Boxes,V.Price,isnull(V.PlusFuel,0) PlusFuel,FOB,V.Tax3,V.TYPE,V.IDInven, " +
                "V.DateCode,V.UPC,V.BoxCode,V.Store, " +
                "(isnull(inv.CSREC,0)-isnull(inv.CSSOLD,0)-isnull(inv.CSHOLD,0)) AvailableBoxes from VET_ V  " +
                "left join inven inv on inv.ID=V.IDInven where V.ID=" + ID + "", Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
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
                        o.BoxCode = Convert.ToString(dt(0)("BoxCode"))
                        o.StoreNo = Convert.ToString(dt(0)("Store"))
                    End If
                    Return o
                End Using

            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetVETDetailsByID")
            Throw ex
        End Try
    End Function


    ''' <summary>
    ''' Mani::23/03/2018: ADD/Update Detail for an closed order
    ''' </summary>
    ''' <param name="Order"></param>
    ''' <param name="Customer"></param>
    ''' <param name="Quantity"></param>
    ''' <param name="Price"></param>
    ''' <param name="UserName"></param>
    ''' <returns></returns>
    Public Shared Function ADDUPDATEVETDetail(ByVal VETID As String, ByVal Order As String, ByVal Customer As String,
                                                 ByVal InventoryIDs As String, ByVal Quantity As Decimal, ByVal Price As Decimal,
                                                ByVal Type As String,
                                                   ByVal UserName As String, Units As String, PlusFuel As String, ByVal UserID As String, BoxCode As String,
                                                    Optional StoreNo As Integer = 0,
                                         Optional UpcCode As String = "", Optional UpcPrice As String = "",
                                         Optional DateCode As String = "",
                                         Optional Desc As String = "") As String
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            ''Insert Acticvity log in F_SLSCHG for the particular line
            Try
                F_CREREQ.InsertintoF_SLSCHG(VETID, "B", UserName)
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in Service::InsertintoF_SLSCHG::ADDUPDATEVETDetail")
                Return Nothing
            End Try

            Dim InvoiceTotalBeforeUpdate = GetInvoiceTotal(Order)

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim BalanceQtyToInsert As Integer = Quantity
                'For Each InvSqlId In InventoryIDs.Split(",")
                Using ExsCmd As New SqlCommand("SPADDUPDATEVETDetail", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@VETID", VETID)
                    ExsCmd.Parameters.AddWithValue("@ORDER", Order)
                    ExsCmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    'ExsCmd.Parameters.AddWithValue("@InvSqlId", InvSqlId)
                    ExsCmd.Parameters.AddWithValue("@InvSqlId", InventoryIDs)
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
                    ExsCmd.Parameters.AddWithValue("@UPCPrice", UpcPrice)
                    ExsCmd.Parameters.AddWithValue("@DateCode", DateCode)
                    ExsCmd.Parameters.AddWithValue("@Desc", Desc)
                    BalanceQtyToInsert = ExsCmd.ExecuteScalar()
                    'If BalanceQtyToInsert = 0 Then
                    '    Exit For
                    'End If
                End Using
                'Next

            End Using

            Dim InvoiceTotalAfterUpdate = GetInvoiceTotal(Order)

            Dim DifferenceAmount = InvoiceTotalBeforeUpdate - InvoiceTotalAfterUpdate

            Dim InvoiceDate = GetInvoiceDate(Order)
            Dim CurrentDate = DateTime.Now.ToString("MM/dd/yyyy")

            Try
                Payments.WRTAR(Order, CurrentDate, "1", 0, -DifferenceAmount, Customer, 0.00, 0, "", UserName, "Invoice adjusted")
                'Payments.WRTAR(Order, InvoiceDate, "1", 0, -DifferenceAmount, Customer, 0.00, 0, "", UserName)
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in Service::WRTAR::ADDUPDATEVETDetail")
                'Return Nothing
            End Try

            ''Insert Acticvity log in F_SLSCHG for the particular line
            Try
                F_CREREQ.InsertintoF_SLSCHG(VETID, "A", UserName)
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in Service::InsertintoF_SLSCHG::ADDUPDATEVETDetail")
                ' Return Nothing
            End Try

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ADDUPDATEVETDetail")
            Throw ex
        End Try
    End Function



    ''' <summary>
    ''' MANI:11/23/2018:CREATE/UPDATE ORDER into VET_ AND VET1_
    ''' </summary>
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
    ''' <returns></returns>
    Public Shared Function UpdateVET(ByVal OrderNo As String, ByVal Customer As String, ByVal ShippingDate As String, ByVal Carrier As String,
                                          ByVal Cutofftime As String, ByVal AWB As String, ByVal CustPO As String, ByVal SLSMAN As String, ByVal CustMsg1 As String,
                                          ByVal CustMsg2 As String, ByVal CustMsg3 As String, ByVal CustMsg4 As String, ByVal CustMsg5 As String, ByVal ShipMsg1 As String,
                                          ByVal ShipMsg2 As String, ByVal ShipMsg3 As String, ByVal ShipMsg4 As String, ByVal ShipMsg5 As String,
                                          ByVal Shipto As String, ByVal Terms As String, ByVal UserName As String,
                                          ByVal UserID As String, ByVal WH As String) As DataTable
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If
            Dim dt As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPUpdateVET", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    ExsCmd.Parameters.AddWithValue("@Customer", Customer)
                    ExsCmd.Parameters.AddWithValue("@ShippingDate", ShippingDate)
                    ExsCmd.Parameters.AddWithValue("@Carrier", Carrier)
                    ExsCmd.Parameters.AddWithValue("@Cutofftime", Cutofftime)
                    ExsCmd.Parameters.AddWithValue("@AWB", AWB)
                    ExsCmd.Parameters.AddWithValue("@CustPO", CustPO)
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
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)
                    ExsCmd.Parameters.AddWithValue("@UserID", UserID)
                    ExsCmd.Parameters.AddWithValue("@WH", WH)
                    Dim da As New SqlDataAdapter(ExsCmd)

                    da.Fill(dt)
                End Using
            End Using
            Return dt
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateVET")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Mani::Get Closed Order Header Details from VET_
    ''' </summary>
    ''' <param name="OrderNo"></param>
    ''' Muthu Nivetha M :: 06 Mar 19 :: Salesperson number assigned to sale in F_order1 should always be the salesperson number for the account in f_cust :: Modified
    ''' <returns></returns>
    Public Shared Function GetVETHeaderByOrderNo(ByVal OrderNo As String, ByVal Customer As String) As BO.SalesHeader
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.SalesHeader
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using cmd As New SqlCommand("spGetVETHeaderByOrderNo", Con)                             ' Muthu Nivetha M :: 06 Mar 19
                    ' Using cmd As New SqlCommand("spGetVETHeaderByOrderNo_temp", Con)                             ' Muthu Nivetha M :: 06 Mar 19
                    cmd.Parameters.AddWithValue("@OrderNo", OrderNo)
                    'cmd.Parameters.AddWithValue("@Customer", Customer)
                    cmd.CommandType = CommandType.StoredProcedure                                       ' Muthu Nivetha M :: 06 Mar 19
                    Using row As SqlDataReader = cmd.ExecuteReader()
                        While (row.Read())
                            u.Order = row("Invoice")
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
                            '  u.SLSMAN = Convert.ToString(row("CUST_SLSMAN"))                             ' Muthu Nivetha M :: 06 Mar 19
                            u.SLSMAN = If(Convert.ToString(row("SLSMAN")) = "" Or row("SLSMAN") Is DBNull.Value, Convert.ToString(row("CUST_SLSMAN")), Convert.ToString(row("SLSMAN")))                                     ' Muthu Nivetha M :: 01 Apr 19

                        End While
                    End Using
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetVETHeaderByOrderNo")
            Throw ex
        End Try
    End Function

    Public Shared Function GetInvoiceTotal(ByVal OrderNo As String) As Decimal
        Try

            Dim dt As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("select isnull(Sum(FOB * Boxes * Units),0) from VET_ where Invoice=@Order", Con)
                    ExsCmd.CommandType = CommandType.Text
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    Dim da As New SqlDataAdapter(ExsCmd)
                    da.Fill(dt)
                    Return dt(0)(0)
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvoiceTotal")
            Throw ex
        End Try
    End Function


    Public Shared Function GetInvoiceDate(ByVal OrderNo As String) As String
        Try

            Dim dt As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("select [DATE] from VET1_ where Invoice=@Order", Con)
                    ExsCmd.CommandType = CommandType.Text
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    Dim da As New SqlDataAdapter(ExsCmd)
                    da.Fill(dt)
                    Return Convert.ToDateTime(dt(0)(0)).ToString("MM/dd/yyyy")
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvoiceDate")
            Throw ex
        End Try

    End Function

    ''' <summary>
    ''' MANI::17/07/2018::Void an order
    ''' </summary>
    ''' <param name="OrderNo"></param>
    ''' <returns></returns>
    Public Shared Function VoidVET(ByVal OrderNo As String, ByVal ReasonVoid As String, ByVal UserName As String) As String
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If
            Dim dt As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using ExsCmd As New SqlCommand("SPVoidVET_temp", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    ExsCmd.Parameters.AddWithValue("@ReasonVoid", ReasonVoid)
                    ExsCmd.Parameters.AddWithValue("@UserName", UserName)
                    Dim da As New SqlDataAdapter(ExsCmd)
                    da.Fill(dt)

                End Using
            End Using

            Dim CurrentDate = DateTime.Now.ToString("MM/dd/yyyy")

            If dt.Rows.Count > 0 Then
                If (Convert.ToString(dt(0)(0))) = "Order already voided" Then
                    Return "Order already voided"
                Else
                    Try
                        Payments.WRTAR(dt(0)("Invoice"), CurrentDate, "1", 0, -dt(0)("Amount"), dt(0)("Customer"), 0.00, 0, "Voided", UserName, "'Void' - " + ReasonVoid)
                        'Payments.WRTAR(dt(0)("Invoice"), dt(0)("InvDate"), "1", 0, -dt(0)("Amount"), dt(0)("Customer"), 0.00, 0, "", UserName, "'Void' - " + ReasonVoid)
                    Catch ex As Exception
                        ErrorLogs.LogException(ex, "Error in Service::WRTAR::VoidVET")
                        'Return Nothing
                    End Try

                    ''Insert Acticvity log in F_SLSCHG for the particular line
                    Try
                        F_CREREQ.InsertintoF_SLSCHG("", "V", UserName, OrderNo)
                    Catch ex As Exception
                        ErrorLogs.LogException(ex, "Error in Service::InsertintoF_SLSCHG::VoidVET")
                        'Return Nothing
                    End Try
                End If

            End If



            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in VoidOrder")
            Throw ex
        End Try
    End Function
    Public Shared Function GetSaleManbyOrderNo(ByVal OrderNo As String, ByVal isFromVET As Boolean) As String
        Try

            Dim dt As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim qry = IIf(isFromVET, "SELECT ISNULL(SLSMAN,0) SLSMAN FROM VET1_ WHERE INVOICE=@ORDER", "SELECT ISNULL(SLSMAN,0) SLSMAN FROM F_ORDER1 WHERE [ORDER]=@ORDER")
                Using ExsCmd As New SqlCommand(qry, Con)
                    ExsCmd.CommandType = CommandType.Text
                    ExsCmd.Parameters.AddWithValue("@ORDER", OrderNo)
                    Dim da As New SqlDataAdapter(ExsCmd)
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Return dt(0)(0).ToString()
                    Else
                        Return Nothing
                    End If
                End Using
            End Using
            'Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSaleManbyOrderNo")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetVETOrderConsolList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                             ByVal numberOfRows As Integer, Optional ByVal userid As Integer = 0) As List(Of VET_)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of VET_)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "[Flower]"
                End If
                Dim Qry As String = ""
                Qry = "spConsolDetailsListVETOrder"
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
                    Dim TotalBoxes As Decimal = 0.00
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
                        If Not ds.Compute("Sum(Boxes)", "Farm <> 'ZZ'") Is DBNull.Value Then
                            TotalBoxes = ds.Compute("Sum(Boxes)", "Farm <> 'ZZ'")
                            TotalUnits = ds.Compute("Sum(TotalUnits)", "Farm <> 'ZZ'")
                            TotalFOB = ds.Compute("Sum(FOB)", "Farm <> 'ZZ'")
                            TotalFOBAmount = ds.Compute("Sum(nInvFobAmount)", "Farm <> 'ZZ'")
                            TotalWeight = ds.Compute("Sum(WEIGHT)", "Type <> 'K'")
                            TotalCubes = ds.Compute("Sum(Cubes)", "Type <> 'K'")
                        End If
                    End If
                    Dim idval As Integer = 1
                    For Each row In ds.Rows
                        Dim u As New VET_
                        u.ID = idval
                        idval += 1
                        u.Invoice = row("Invoice")
                        u.Farm = Convert.ToString(row("FARM"))
                        u.Flower = Convert.ToString(row("FLOWER"))
                        u.FOB = If(row("FOB") Is DBNull.Value, 0.00, row("FOB"))
                        u.Description = Convert.ToString(row("DESC"))
                        u.Bgcolor = Convert.ToString(row("BGCOLOR"))
                        u.Fontcolor = Convert.ToString(row("FONTCOLOR"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.Boxes = IIf(row("Type") = "K", row("BOXES"), Convert.ToInt32(row("BOXES")))
                        u.Units = row("Units")
                        u.TotalUnits1 = IIf(row("Type") = "K", row("TOTALUNITS"), Convert.ToInt32(row("TOTALUNITS")))
                        u.TotalRows = TotalCount
                        u.TotPerLine = Convert.ToDecimal(row("BOXES") * row("Units") * If(row("FOB") Is DBNull.Value, 0.00, row("FOB")))
                        TotalGrandTotal += u.TotPerLine
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
                    Dim po As New VET_()
                    po.RowNo = 0
                    po.ID = 0
                    po.Invoice = ""
                    po.Flower = ""
                    po.Description = ""
                    po.Farm = ""
                    po.Bgcolor = ""
                    po.Fontcolor = ""
                    po.Boxes = Math.Round(TotalBoxes)
                    po.UOM = ""
                    po.Units = 0
                    po.TotalUnits1 = TotalUnits
                    po.FOB = 0
                    po.TotPerLine = TotalGrandTotal
                    po.Type = ""
                    po.TotalRows = TotalCount
                    po.BoxLength = 0
                    po.BoxHeight = 0
                    po.BoxWidth = 0
                    po.Cubes = TotalCubes
                    po.Weight = TotalWeight
                    ulistsalesDetails.Add(po)
                End Using
            End Using
            Return ulistsalesDetails
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetVETOrderConsolList")
            Throw ex
        End Try
    End Function
    Public Shared Function AddFutureVETDetail(ByVal Invoice As Integer, ByVal Customer As String, ByVal Flower As String, ByVal Farm As String, ByVal Quantity As Decimal, ByVal UOM As String,
                                               ByVal Price As Decimal, ByVal Units As String, ByVal UserName As String, ByVal UserID As String, BoxCode As String, ByVal UPC As String, ByVal UPCPRICE As String, ByVal DateCode As String, ByVal VETId As String, Optional Desc As String = "", Optional ByVal L As String = "0", Optional ByVal W As String = "0", Optional ByVal H As String = "0") As String
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
                Using ExsCmd As New SqlCommand("sp_AddFutureVETDetail", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@ID", VETId)
                    ExsCmd.Parameters.AddWithValue("@INVOICE", Invoice)
                    ExsCmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    ExsCmd.Parameters.AddWithValue("@Flower", Flower)
                    ExsCmd.Parameters.AddWithValue("@Farm", If(Farm = "null", "", Farm))
                    ExsCmd.Parameters.AddWithValue("@BOXES", Quantity)
                    ExsCmd.Parameters.AddWithValue("@UOM", UOM)
                    ExsCmd.Parameters.AddWithValue("@PRICE", Price)
                    ExsCmd.Parameters.AddWithValue("@Units", Units)
                    ExsCmd.Parameters.AddWithValue("@USERNAME", UserName)
                    ExsCmd.Parameters.AddWithValue("@USERID", UserID)
                    ExsCmd.Parameters.AddWithValue("@BoxCode", BoxCode)
                    ExsCmd.Parameters.AddWithValue("@UPC", UPC)
                    ExsCmd.Parameters.AddWithValue("@UPCPRICE", UPCPRICE)
                    ExsCmd.Parameters.AddWithValue("@DateCode", DateCode)
                    ExsCmd.Parameters.AddWithValue("@Desc", Desc)
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
                ErrorLogs.LogException(ex, "Error in AddFutureVETDetail")
                Throw ex
            End Try
        End Using
    End Function

    Public Shared Function DeleteVETFutureOrderDetails(ByVal VETId As String) As String
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Using Con As New SqlConnection(ConStr)
            Con.Open()
            Dim Trans As SqlTransaction = Con.BeginTransaction()
            Try
                Using ExsCmd As New SqlCommand("sp_DeleteFutureVETDetailByID", Con)
                    ExsCmd.CommandType = CommandType.StoredProcedure
                    ExsCmd.Transaction = Trans
                    ExsCmd.Parameters.AddWithValue("@ID", VETId)
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
                ErrorLogs.LogException(ex, "Error in DeleteVETFutureOrderDetails")
                Throw ex
            End Try
        End Using
    End Function
    Public Shared Function GetVETFutureOrderDetailsByID(ByVal ID As String) As BO.SalesDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim o As New BO.SalesDetail
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("sp_GetFutureVETDetailByID", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        o.ID = dt(0)("ID")
                        o.INVOICE = dt(0)("INVOICE")
                        o.NAME = dt(0)("Desc")
                        o.Boxes = dt(0)("BOXES")
                        o.Price = dt(0)("PRICE")
                        o.Units = dt(0)("Units")
                        o.UOM = Convert.ToString(dt(0)("UOM"))
                        o.BoxCode = Convert.ToString(dt(0)("BOXCODE"))
                        o.FarmCode = dt(0)("FARM")
                        o.UPC = dt(0)("UPC")
                        o.UPCPRICE = dt(0)("UPCPRICE")
                        o.DateCode = dt(0)("DateCode")
                        o.Flower = dt(0)("FLOWER")
                    End If
                    Return o
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFutureOrderDetailsByID")
            Throw ex
        End Try
    End Function
End Class

Public Class VET_
    Private _Landedcost As Decimal
    Public Property Landedcost() As Decimal
        Get
            Return _Landedcost
        End Get
        Set(ByVal value As Decimal)
            _Landedcost = value
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

    Private _Othercost As Decimal
    Public Property Othercost() As Decimal
        Get
            Return _Othercost
        End Get
        Set(ByVal value As Decimal)
            _Othercost = value
        End Set
    End Property

    Private _Cost As Decimal
    Public Property Cost() As Decimal
        Get
            Return _Cost
        End Get
        Set(ByVal value As Decimal)
            _Cost = value
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

    Private _Flower As String
    Public Property Flower() As String
        Get
            Return _Flower
        End Get
        Set(ByVal value As String)
            _Flower = value
        End Set
    End Property

    Private _Description As String
    Public Property Description() As String
        Get
            Return _Description
        End Get
        Set(ByVal value As String)
            _Description = value
        End Set
    End Property

    Private _Fontcolor As String
    Public Property Fontcolor() As String
        Get
            Return _Fontcolor
        End Get
        Set(ByVal value As String)
            _Fontcolor = value
        End Set
    End Property

    Private _Bgcolor As String
    Public Property Bgcolor() As String
        Get
            Return _Bgcolor
        End Get
        Set(ByVal value As String)
            _Bgcolor = value
        End Set
    End Property

    Private _Slsname As String
    Public Property Slsname() As String
        Get
            Return _Slsname
        End Get
        Set(ByVal value As String)
            _Slsname = value
        End Set
    End Property

    Private _Farm As String
    Public Property Farm() As String
        Get
            Return _Farm
        End Get
        Set(ByVal value As String)
            _Farm = value
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

    Private _Boxes As Decimal
    Public Property Boxes() As Decimal
        Get
            Return _Boxes
        End Get
        Set(ByVal value As Decimal)
            _Boxes = value
        End Set
    End Property

    Private _UOM As String
    Public Property UOM() As String
        Get
            Return _UOM
        End Get
        Set(ByVal value As String)
            _UOM = value
        End Set
    End Property

    Private _Units As Integer
    Public Property Units() As Integer
        Get
            Return _Units
        End Get
        Set(ByVal value As Integer)
            _Units = value
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

    Private _TotalUnits1 As Decimal
    Public Property TotalUnits1() As Decimal
        Get
            Return _TotalUnits1
        End Get
        Set(ByVal value As Decimal)
            _TotalUnits1 = value
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

    Private _FOB As Decimal
    Public Property FOB() As Decimal
        Get
            Return _FOB
        End Get
        Set(ByVal value As Decimal)
            _FOB = value
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

    Private _Boxnum As Integer
    Public Property Boxnum() As Integer
        Get
            Return _Boxnum
        End Get
        Set(ByVal value As Integer)
            _Boxnum = value
        End Set
    End Property

    Private _Boxcode As String
    Public Property Boxcode() As String
        Get
            Return _Boxcode
        End Get
        Set(ByVal value As String)
            _Boxcode = value
        End Set
    End Property

    Private _UPC As String
    Public Property UPC() As String
        Get
            Return _UPC
        End Get
        Set(ByVal value As String)
            _UPC = value
        End Set
    End Property

    Private _PODFlower As String
    Public Property PODFlower() As String
        Get
            Return _PODFlower
        End Get
        Set(ByVal value As String)
            _PODFlower = value
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
    Private _EstimatedGPM As Decimal
    Public Property EstimatedGPM() As Decimal
        Get
            Return _EstimatedGPM
        End Get
        Set(ByVal value As Decimal)
            _EstimatedGPM = value
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

    Private _ErrorMessage As String
    Public Property ErrorMessage() As String
        Get
            Return _ErrorMessage
        End Get
        Set(ByVal value As String)
            _ErrorMessage = value
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

    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
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

    Private _VET1Date As String
    Public Property VET1Date() As String
        Get
            Return _VET1Date
        End Get
        Set(ByVal value As String)
            _VET1Date = value
        End Set
    End Property

    Private _FarmName As String
    Public Property FarmName() As String
        Get
            Return _FarmName
        End Get
        Set(ByVal value As String)
            _FarmName = value
        End Set
    End Property

    Private _Salesman As String
    Public Property Salesman() As String
        Get
            Return _Salesman
        End Get
        Set(ByVal value As String)
            _Salesman = value
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

    Private _ANDEAN As Decimal
    Public Property ANDEAN() As Decimal
        Get
            Return _ANDEAN
        End Get
        Set(ByVal value As Decimal)
            _ANDEAN = value
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
    Private _Cubes As Decimal
    Public Property Cubes() As Decimal
        Get
            Return _Cubes
        End Get
        Set(value As Decimal)
            _Cubes = value
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
    Private _Dimentions As String
    Public Property Dimentions() As String
        Get
            Return _Dimentions
        End Get
        Set(value As String)
            _Dimentions = value
        End Set
    End Property
    Private _ActualLandedcost As Decimal
    Public Property ActualLandedcost() As Decimal
        Get
            Return _ActualLandedcost
        End Get
        Set(ByVal value As Decimal)
            _ActualLandedcost = value
        End Set
    End Property

    Private _ActualHandling As Decimal
    Public Property ActualHandling() As Decimal
        Get
            Return _ActualHandling
        End Get
        Set(ByVal value As Decimal)
            _ActualHandling = value
        End Set
    End Property

    Private _ActualFreight As Decimal
    Public Property ActualFreight() As Decimal
        Get
            Return _ActualFreight
        End Get
        Set(ByVal value As Decimal)
            _ActualFreight = value
        End Set
    End Property

    Private _ActualOtherCharges As Decimal
    Public Property ActualOtherCharges() As Decimal
        Get
            Return _ActualOtherCharges
        End Get
        Set(ByVal value As Decimal)
            _ActualOtherCharges = value
        End Set
    End Property
End Class

Public Class VET1_

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
    Public Property Invoice() As Integer
        Get
            Return _Invoice
        End Get
        Set(ByVal value As Integer)
            _Invoice = value
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

    Private _OrdDate As Date
    Public Property OrdDate() As Date
        Get
            Return _OrdDate
        End Get
        Set(ByVal value As Date)
            _OrdDate = value
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

    Public Property _Invoice As Integer

End Class

