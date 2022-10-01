Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Xml
Imports System.Reflection

Public Class DAOPO

    ''' <summary>
    ''' VEN::15-Dec-2015::For add SQL Flower and Farm Details to DBF Results
    ''' STA::19-JAN-2016::to avoid the flower table to join
    ''' MANI::21-AUG-2017::Optimized the code 
    ''' MANI::04-SEP-2017::Changed Method name to GetConfirmedPOListForGrid
    ''' </summary>
    ''' <param name="whereClause"></param>
    ''' <param name="sortExp"></param>
    ''' <param name="startRowIndex"></param>
    ''' <returns></returns>
    Public Shared Function GetConfirmedPOListForGrid(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal FilterFarms As String) As List(Of BOPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            'Comment By PRashant on 02/17/2020 because we are pass this variable from front 
            'Dim PendingPOStatus As String = ConfigurationManager.AppSettings("POPendingStatusCodes").ToString()

            Dim ulistPOD As New List(Of BOPO)
            Using con As New SqlConnection(ConStr)
                con.Open()
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "ponum"
                End If

                Dim Qry As String = ""
                Qry = String.Format("select POQ.POQID AS ID,POH.PASSNAME,F.NAME as FarmName,POH.Airport,POH.ponum,CONVERT(varchar(20),POQ.shipdate,101) as shipdate, " +
                                            "POQ.PROSTATUS,POQ.pokey,POQ.ORD,POQ.farm,POQ.PRODCODQ,POQ.prodnamq, " +
                                            "POQ.qtybox,POQ.qtyxbox, " +
                                            "POQ.unitcosq, " +
                                            "POQ.uom,POQ.qtybconf, POQ.customer,POQ.boxnum,POQ.awb, " +
                                            "POQ.hawb,POQ.COMMENTQ,POQ.boxcode,POQ.upc,POQ.CustomerPO,POQ.CAT,POQ.Invoice, " +
                                            "POQ.Lenght,POQ.Width,POQ.Height,POQ.Market,POQ.Totalrb,POQ.COLORCODE,clr.FontColor,clr.BGColor " +
                                            "From f_poh POH " +
                                            "inner join F_poq POQ on POH.ponum= POQ.ponum " +
                                            "INNER JOIN F_FARM F ON POQ.FARM=F.FARM " +
                                            "inner join ColorCode clr on clr.CODE=POQ.COLORCODE " +
                                            "where {0} AND ISNULL(POQ.FARM,'')<>'' AND POQ.qtybox > 0  order by {1}", whereClause, sortExp)
                Using cmd As New SqlCommand(Qry, con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    Dim dt As New DataTable

                    da.Fill(dt)

                    If dt.Rows.Count > 0 And FilterFarms <> "" Then
                        If (dt.Select(FilterFarms).Count > 0) Then
                            ds.Merge(dt.Select(FilterFarms).CopyToDataTable())
                        Else
                            dt.Clear()
                            ds.Merge(dt)
                        End If
                        'ds.Merge(dt.Select(FilterFarms).CopyToDataTable())
                    Else
                        ds.Merge(dt)
                    End If
                    Dim POQdt = ds

                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim TotalBoxes As Integer = 0
                    Dim TotalConf As Integer = 0
                    Dim TotalCost As Decimal = 0
                    If (ds.Rows.Count > 0) Then
                        TotalBoxes = ds.Compute("Sum(qtybox)", "")
                        TotalConf = ds.Compute("Sum(qtybconf)", "")
                    End If
                    Dim PagedDataSet As DataTable = Nothing
                    'PagedDataSet = ds.Table(0)

                    If TotalCount > 0 And startRowIndex <> 0 Then
                        For Each row In ds.Rows
                            Dim u As New BOPO
                            u.DetailID = row("ID")
                            u.Farm = row("farm")
                            u.AWB = IIf(row("AWB") Is DBNull.Value, "", row("AWB"))
                            u.Ord = row("ORD")
                            u.BoxCode = IIf(row("boxcode") Is DBNull.Value, "", row("boxcode"))
                            u.QTYBOX = row("qtybox")
                            u.BoxNumber = row("boxnum")
                            u.BreakDown = row("commentq")
                            u.PassName = row("passname")
                            u.QtyBConf = row("qtybconf")
                            u.UnitCosq = row("unitcosq")
                            u.CustNumber = row("customer")
                            u.HAWB = IIf(row("hawb") Is DBNull.Value, "", row("hawb"))
                            u.Airport = row("Airport")
                            u.QtyXBox = row("qtyxbox")
                            Try
                                TotalCost += u.UnitCosq * u.QTYBOX * u.QtyXBox
                            Catch ex As Exception
                                TotalCost = 0.00
                            End Try
                            u.PONumber = row("PONUM")
                            u.Flowername = (IIf(Convert.ToString(row("prodnamq") = ""), "-", row("prodnamq")))
                            u.ShipDate = row("Shipdate")
                            u.UOM = row("uom")
                            u.Upc = IIf(row("upc") Is DBNull.Value, "", row("upc"))
                            u.CustomerPO = IIf(row("CustomerPO") Is DBNull.Value, "", row("CustomerPO"))
                            u.Invoice = IIf(row("Invoice") Is DBNull.Value, "", row("Invoice"))
                            u.Length = IIf(row("Lenght") Is DBNull.Value, "", row("Lenght"))
                            u.Width = IIf(row("Width") Is DBNull.Value, "", row("Width"))
                            u.Height = IIf(row("Height") Is DBNull.Value, "", row("Height"))
                            u.ColorCode = row("ColorCode")
                            u.ForeColor = row("FontColor")
                            u.BGColor = row("BGColor")
                            u.Flower = row("prodnamq")
                            u.FlowerCategory = row("CAT")
                            u.TotalRows = TotalCount
                            u.Type = IIf(row("Market") Is DBNull.Value, "", row("Market"))
                            u.FarmName = IIf(row("FarmName") Is DBNull.Value, "", row("FarmName"))
                            u.PROStatus = IIf(row("PROSTATUS") Is DBNull.Value, "", row("PROSTATUS"))
                            u.Totalrb = row("Totalrb")
                            'Commented By Prashant On 05/09/2020 No use of that FlowerFlag
                            'Dim flowercount As String = 0
                            'If flowercount > 0 Then
                            '    u.FlowerFlag = True
                            'Else
                            '    u.FlowerFlag = False
                            'End If
                            u.FlowerFlag = True
                            ulistPOD.Add(u)
                        Next
                    End If

                    Dim po As New BOPO
                    po.DetailID = "0"
                    po.Farm = ""
                    po.AWB = ""
                    po.Ord = ""
                    po.BoxCode = ""
                    po.QTYBOX = TotalBoxes
                    po.BoxNumber = ""
                    po.BreakDown = ""
                    po.PassName = ""
                    po.QtyBConf = TotalConf
                    po.UnitCosq = TotalCost
                    po.CustNumber = ""
                    po.HAWB = ""
                    po.Airport = ""
                    po.QtyXBox = 0
                    po.PONumber = ""
                    po.Flowername = ""
                    po.ShipDate = Date.Now
                    po.UOM = ""
                    po.Upc = ""
                    po.ColorCode = ""
                    po.ForeColor = ""
                    po.BGColor = ""
                    po.Flower = ""
                    po.FlowerCategory = ""
                    po.TotalRows = TotalCount
                    ulistPOD.Add(po)

                End Using
            End Using
            Return ulistPOD
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPurchaseOrderGridlistWithSQL")
            Dim uList As New List(Of BOPO)
            Dim u As New BOPO
            u.ErrorMessage = "Error in GetConfirmedPOListForGrid:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "GetPurchaseOrderGridlistWithSQL")
            uList.Add(u)
            Return uList
        End Try

    End Function

    'Added by belal from DFlowerDBFService.vb
    Private Function BuildWhereCondition(ByVal DataType As Type, ByVal columnName As String, ByVal columnValue As String) As String
        If columnName.ToLower() = "farm" Then
            columnName = columnName.ToUpper()
        End If
        Dim whereCondition As String = ""
        Dim columnInfo As PropertyInfo = DataType.GetProperty(columnName)
        If columnInfo IsNot Nothing Then
            If columnInfo.PropertyType Is GetType(Integer) Then
                whereCondition = columnName & "=" & columnValue ' comment by abinaya On 30/06/2016 For Export all data In doSearch
                'whereCondition = "cast( " & columnName & " as varchar(100)) LIKE '%" & columnValue & "%'"
            ElseIf columnInfo.PropertyType Is GetType([String]) Then
                whereCondition = columnName & " LIKE '%" & columnValue & "%'"
                '                whereCondition = "UPPER(cast( " & columnName & " as varchar(100))) LIKE '%" & columnValue & "%'"
            ElseIf columnInfo.PropertyType Is GetType(DateTime) Then
                whereCondition = columnName & "=ctod('" & columnValue & "')"
                'whereCondition = "cast( " & columnName & " as varchar(100)) LIKE chrtran('%" & columnValue & "%','-','/')"
            ElseIf columnInfo.PropertyType Is GetType(Decimal) Then
                whereCondition = columnName & "=" & columnValue & ""
                'whereCondition = "cast( " & columnName & " as varchar(100)) LIKE '%" & columnValue & "%'"
            ElseIf columnInfo.PropertyType Is GetType(Int64) Then
                whereCondition = columnName & "=" & columnValue
                'whereCondition = "cast( " & columnName & " as varchar(100)) LIKE '%" & columnValue & "%'"
            ElseIf columnInfo.PropertyType Is GetType(Int32) Then
                whereCondition = columnName & "=" & columnValue
                'whereCondition = "cast( " & columnName & " as varchar(100)) LIKE '%" & columnValue & "%'"
            ElseIf columnInfo.PropertyType Is GetType(Int16) Then
                whereCondition = columnName & "=" & columnValue
                'whereCondition = "cast( " & columnName & " as varchar(100)) LIKE '%" & columnValue & "%'"
            ElseIf columnInfo.PropertyType Is GetType(Boolean) Then
                Dim result As Boolean = True
                If columnValue.ToString = "0" Or columnValue.ToString.ToLower = "no" Or columnValue.ToString.ToLower = "false" Then
                    result = False
                End If
                whereCondition = columnName & "=" & IIf(result, 1, 0) & ""
            End If
        Else
            If columnName = "PartID" Then
                'whereCondition = columnName & " = '" & columnValue & "'"
                whereCondition = "cast( " & columnName & " as varchar(100)) LIKE '%" & columnValue & "%'"
            ElseIf columnValue = "n" Or columnValue = "N" Then
                whereCondition = columnName & " LIKE '%0%'"
            ElseIf columnValue = "y" Or columnValue = "Y" Then
                whereCondition = columnName & " LIKE '%1%'"
            ElseIf columnName = "Lot" Then
                'whereCondition = columnName & " = " & columnValue
                whereCondition = "cast( " & columnName & " as varchar(100)) LIKE '%" & columnValue & "%'"
            ElseIf columnName = "BoxNum" Then
                'whereCondition = columnName & " = " & columnValue
                whereCondition = "cast( " & columnName & " as varchar(100)) LIKE '%" & columnValue & "%'"
            ElseIf columnName = "Cust" Then
                'whereCondition = columnName & " = " & columnValue
                whereCondition = "cast( " & columnName & " as varchar(100)) LIKE '%" & columnValue & "%'"
            ElseIf columnName = "Date" Then
                whereCondition = "cast( " & columnName & " as varchar(100)) LIKE chrtran('%" & columnValue & "%','-','/')"
            Else
                'whereCondition = columnName & " LIKE '%" & columnValue & "%'"
                whereCondition = "UPPER(cast( " & columnName & " as varchar(100))) LIKE '%" & columnValue & "%'"
            End If
        End If
        Return whereCondition
    End Function

    ' Added by Belal on 24th April 2021
    Public Function GetConsolidatePODetailsGridlist(ByVal page As Integer, ByVal rp As Integer, ByVal sortname As String, ByVal sortorder As String, ByVal query As String,
                                     ByVal qtype As String, ByVal Filter As String, ByVal CustomFilter As String) As List(Of BOPurchaseOrder)
        Try
            Dim whereCondition As String = ""
            If qtype IsNot Nothing AndAlso query IsNot Nothing AndAlso query <> String.Empty Then
                whereCondition = BuildWhereCondition(GetType(BOPurchaseOrder), qtype, query.Replace("'", "''"))
                If (Filter <> String.Empty And whereCondition <> String.Empty) Then
                    whereCondition = whereCondition + " And " + Filter.Replace("&amp;", "&")
                ElseIf (Filter Is String.Empty And whereCondition <> String.Empty) Then
                    whereCondition = whereCondition
                End If
            Else
                If (Filter <> String.Empty And whereCondition Is String.Empty) Then
                    whereCondition = Filter.Replace("&amp;", "&")
                ElseIf (Filter <> String.Empty And whereCondition IsNot String.Empty) Then
                    whereCondition = whereCondition + " AND " + Filter.Replace("&amp;", "&")
                End If
            End If


            Dim sortExp As String = sortname & " " & sortorder
            Dim start As Integer = ((page - 1) * rp) + 1
            rp = rp - 1

            If (page <= 0) Then
                rp = 0
                start = 0
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistPOD As New List(Of BOPurchaseOrder)
            Using con As New SqlConnection(ConStr)
                con.Open()

                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "pokey"
                End If

                Using cmd As New SqlCommand("spGetConsolidatePODetailsGridlist", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@whereClause", whereCondition)
                    cmd.Parameters.AddWithValue("@sortExp", sortExp)
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
                    Dim TotalBoxes As Integer = 0
                    Dim TotalConf As Integer = 0

                    Dim PagedDataSet As DataTable = Nothing

                    If ds.Rows.Count > 0 And CustomFilter <> "" Then
                        If (ds.Select(CustomFilter).Count > 0) Then
                            PagedDataSet = ds.Select(CustomFilter).CopyToDataTable()
                        End If
                    Else
                        PagedDataSet = ds
                    End If

                    If TotalCount <> 0 And rp <> 0 And Not PagedDataSet Is Nothing Then
                        For Each row In PagedDataSet.Rows
                            Dim u As New BOPurchaseOrder
                            u.RowNo = row("RECNO")
                            u.Farm = row("farm")
                            u.QtyBox = row("qtybox")
                            'u.Breakdown = row("commentq")
                            u.Cust = row("customer")
                            u.Product = row("prodnamq")
                            u.ProductCode = row("PRODCODQ")
                            u.ProductCategory = row("CAT")
                            ' u.ShipDate = row("ShipDate")
                            u.Uom = row("uom")
                            u.WH = row("WH")
                            u.FlowerDetails.ColorCode = row("ColorCode")
                            u.FlowerDetails.FontColor = row("FontColor")
                            u.FlowerDetails.BGColor = row("BGColor")
                            u.Origin = row("Airport")
                            u.Market = row("Market")
                            u.Qtyunit = row("Qtyunit")
                            u.ShipDatesAndItsBoxes = row("ShipDatesAndItsBoxes")
                            u.TotalRows = TotalCount
                            ulistPOD.Add(u)
                        Next
                    End If



                End Using
            End Using
            Return ulistPOD
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetConsolidatePODetailsGridlist")
            Dim uList As New List(Of BOPurchaseOrder)
            Dim u As New BOPurchaseOrder
            u.ErrorMessage = "Error In GetConsolidatePODetailsGridlist ::" + ErrorLogs.ExceptionHandling(ex, "GetConsolidatePODetailsGridlist")
            uList.Add(u)
            Return uList
        End Try

    End Function

    'Added By Belal on 12 Sept 2020
    Public Shared Function LoadPODetailsFromPOQ(ByVal POQId As String) As BOPurchaseOrder
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BOPurchaseOrder
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spLoadPoDetailsFromPOQ", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@POQId", POQId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        u.CUSTOMERPO = row("CUSTOMERPO").ToString()
                        u.AWB = row("AWB").ToString()
                        u.Invoice = row("invoice").ToString()
                        u.BoxCode = row("boxcode").ToString()
                        u.QtyBox = Convert.ToInt32(row("qtybox"))
                        u.BoxNum = row("boxnum").ToString()
                        u.Breakdown = row("commentq").ToString()
                        u.QtyBConf = Convert.ToInt32(row("qtybconf"))
                        u.UnitCosq = Convert.ToDecimal(row("unitcosq"))
                        u.Cust = row("customer").ToString()
                        u.Hawb = row("hawb").ToString()
                        u.Origin = row("city").ToString()
                        u.QtyXbox = Convert.ToInt32(row("qtyxbox"))
                        u.POKEY = POQId 'Convert.ToInt32(row("POKEY"))
                        u.PONumber = row("PONUM").ToString()
                        u.ProductCode = row("prodcodq").ToString()
                        u.Product = row("prodnamq").ToString()
                        u.ProductCategory = row("CAT").ToString()
                        u.ShipDate = row("Shipdate")
                        u.Uom = row("uom").ToString()
                        u.Upc = row("upc").ToString()
                        u.ORD = row("ORD").ToString()
                        u.Farm = row("farm").ToString()
                        u.FarmName = row("Name").ToString()
                        u.TotalVaq = row("totalvaq").ToString()
                        u.RecDate = row("recdate").ToString()
                        u.BoxCode = row("boxcode").ToString()
                        u.UPCDesc = row("UPCDESC").ToString()
                        u.UPCPrice = row("UPCPrice").ToString()
                        u.DateCode = row("DateCode").ToString()
                        u.VendorName = row("VENNAME").ToString()
                        u.ManuFacID = row("manufacId").ToString()
                        u.Length = row("Lenght").ToString()
                        u.Height = row("Height").ToString()
                        u.Width = row("Width").ToString()
                    Next

                    Return u
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadPODetailsFromPOQ")
            Dim u As New BOPurchaseOrder
            u.ErrorMessage = "Error in LoadPODetailsFromPOQ:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "LoadPODetailsFromPOQ")
            Return u
        End Try
    End Function

    Public Shared Function GetDistinctMAWBListForPO(ByVal Filter As String, ByVal FilterFarms As String) As List(Of BOPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistPOD As New List(Of BOPO)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand(String.Format("select * from (select p.hawb,p.Farm,p.Prostatus,p.shipdate,p.AWB from f_poq p " +
                                                              "where p.awb<>'' group by p.hawb,p.farm,p.Prostatus,p.shipdate,p.AWB ) a where {0} ", Filter.ToUpper()), con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOPO
                        u.AWB = row("AWB")
                        ulistPOD.Add(u)
                    Next
                    Return ulistPOD
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetDistinctMAWBListForPO")
            Dim uList As New List(Of BOPO)
            Dim u As New BOPO
            u.ErrorMessage = "Error in GetDistinctMAWBListForPO:: " + ErrorLogs.ExceptionHandling(ex, "GetDistinctMAWBListForPO")
            uList.Add(u)
            Return uList
        End Try
    End Function

    Public Shared Function PrintHoldStandingOrderList() As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim Qry As String = ""
                Qry = "spReportStandingOrderOnHold"
                Using cmd As New SqlCommand(Qry, Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintHoldStandingOrderList")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetDistinctHAWBListForPO(ByVal Filter As String, ByVal FilterFarms As String) As List(Of BOPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistPOD As New List(Of BOPO)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand(String.Format("select * from (select p.hawb,p.Farm,p.Prostatus,p.shipdate,p.AWB from f_poq p " +
                                                              "where p.awb<>'' group by p.hawb,p.farm,p.Prostatus,p.shipdate,p.AWB ) a where {0} ", Filter.ToUpper()), con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOPO
                        u.HAWB = row("hawb")
                        ulistPOD.Add(u)
                    Next
                    Return ulistPOD
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetDistinctHAWBListForPO")
            Dim uList As New List(Of BOPO)
            Dim u As New BOPO
            u.ErrorMessage = "Error in GetDistinctHAWBListForPO:: " + ErrorLogs.ExceptionHandling(ex, "GetDistinctHAWBListForPO")
            uList.Add(u)
            Return uList
        End Try
    End Function

    Public Shared Function GetDistinctFARMListForPO(ByVal ProStatus As String) As List(Of BOPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistPOD As New List(Of BOPO)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand(String.Format("select distinct FARM as 'FARM' from f_poq where FARM<>'' and ProStatus in '{0}'", ProStatus.ToUpper()), con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOPO
                        u.Farm = row("FARM")
                        ulistPOD.Add(u)
                    Next
                    Return ulistPOD
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetDistinctFARMListForPO")
            Dim uList As New List(Of BOPO)
            Dim u As New BOPO
            u.ErrorMessage = "Error in GetDistinctFARMListForPO:: " + ErrorLogs.ExceptionHandling(ex, "GetDistinctFARMListForPO")
            uList.Add(u)
            Return uList
        End Try
    End Function

    Public Shared Function UpdateConfirmedPOdetails(ByVal POKEY As Integer, ByVal BreakDownText As String, ByVal Conf As Decimal, ByVal Length As Decimal, ByVal Height As Decimal,
                                                    ByVal Width As Decimal, ByVal Invoice As Integer, ByVal UserName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim Cmd As New SqlCommand("spUpdatePendingPOStatus", con)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@POQId", POKEY)
                Cmd.Parameters.AddWithValue("@COMMENTQ", BreakDownText)
                Cmd.Parameters.AddWithValue("@ConfirmQty", Conf)
                Cmd.Parameters.AddWithValue("@Length", Length)
                Cmd.Parameters.AddWithValue("@Height", Height)
                Cmd.Parameters.AddWithValue("@width", Width)
                Cmd.Parameters.AddWithValue("@Invoice", Invoice)
                Cmd.Parameters.AddWithValue("@UserName", UserName)
                Cmd.ExecuteNonQuery()
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateConfirmedPOdetails")
            Return "Error in UpdateConfirmedPOdetails:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "UpdateConfirmedPOdetails")
        End Try
    End Function

    Public Shared Function UpdateMAWBAndHAWB(ByVal MAWB As String, ByVal HAWB As String, ByVal SelectedPOs As String, ByVal Invoice As String) As String
        Try
            If Not SelectedPOs Is Nothing And SelectedPOs <> "" Then
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim Id As String = ""
                    'Dim elements = XElement.Parse(POKEYAndORD)
                    'Dim rows = elements.Elements("PO")
                    'Dim list = New List(Of DAOPO)()
                    Dim arr As String()
                    arr = SelectedPOs.Split(",")
                    For Each row In arr
                        'Id = row.Element("Id").Value
                        Id = row
                        Dim Cmd As New SqlCommand("UPDATE F_POQ SET AWB=@MAWB,HAWB=@HAWB,Invoice=@Invoice WHERE POQId=@POQId", con)
                        Cmd.Parameters.AddWithValue("@MAWB", MAWB)
                        Cmd.Parameters.AddWithValue("@HAWB", HAWB)
                        Cmd.Parameters.AddWithValue("@POQId", Id)
                        Cmd.Parameters.AddWithValue("@Invoice", Convert.ToInt32(Invoice))
                        Cmd.CommandType = CommandType.Text
                        Cmd.ExecuteNonQuery()
                    Next
                End Using
                Return "valid"
            End If
            Return "not_valid selected POs is empty"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateMAWBAndHAWB")
            Return "Error in UpdateMAWBAndHAWB"
        End Try
    End Function

    Public Shared Function RemoveMAWBAndHAWB(ByVal POKEYAndORD As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim POQId As String = ""
                Dim elements = XElement.Parse(POKEYAndORD)
                Dim rows = elements.Elements("PO")
                Dim list = New List(Of DAOPO)()
                For Each row In rows
                    POQId = row.Element("POQId").Value
                    ''2021/08/17, Also delete PODetails for POQ ids
                    'Dim Cmd As New SqlCommand("UPDATE F_POQ SET AWB='',HAWB='',Invoice=0 WHERE POQId=@POQId;", con)
                    Dim Cmd As New SqlCommand("UPDATE F_POQ SET AWB='',HAWB='',Invoice=0 WHERE POQId=@POQId; DELETE FROM [tblPODetails] WHERE POQId=@POQId; ", con)
                    Cmd.Parameters.AddWithValue("@POQId", POQId)
                    Cmd.CommandType = CommandType.Text
                    Cmd.ExecuteNonQuery()
                Next
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in RemoveMAWBAndHAWB")
            Return "Error in RemoveMAWBAndHAWB:: "
        End Try
    End Function

    Public Shared Function GetPurchaseOrderDetailsBySelectedPokey(ByVal SelectedPOs As String) As List(Of BOPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BOPO)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim POKEY As Integer = 0
                Dim PONUM As String = ""
                Dim ORD As Integer = 0
                'Dim elements = XElement.Parse(POKEYandOrd)
                'Dim rows = elements.Elements("PO")
                Dim whereCondition As String = ""
                'Dim j As Integer = 0
                'If rows.Count = 0 Then
                '    Return uList
                'End If
                'Dim cnt As Integer = rows.Count / 40
                'If (rows.Count / 40).ToString().Contains(".") Then
                '    cnt = cnt + 1
                'End If
                'If rows.Count > 40 Then
                '    For i = 1 To cnt
                '        For j = j + 1 To (i * 40)
                '            If j < rows.Count - 1 Then
                '                whereCondition += IIf(whereCondition.Length <= 0, "", " OR ")
                '                whereCondition += "(POQId='" + rows(j).Element("POQId").Value + "')"
                '            Else
                '                Exit For
                '            End If
                '        Next
                '        Using Cmd As New SqlCommand("select * from (Select A.POQID, A.POKEY, A.ORD, A.farm, A.PONUM, A.shipdate, A.CAT,A.PRODCODQ as FLOWER, A.prodnamq, A.qtybox, " +
                '                                "A.qtyxbox, (CASE WHEN ISNULL(A.UNITCOSQ,0)=0 THEN 0.000 ELSE CAST(A.unitcosq as numeric(18,4)) END)as unitcosq, " +
                '                                "A.uom,A.qtybconf, A.customer, A.boxnum, A.awb, A.hawb, A.COMMENTQ, A.boxcode, A.upc, A.PROSTATUS, C.FOB,B.PASSNAME,A.PRODCODQ,A.SPORDID,A.ORDER2ID, B.WH " +
                '                                "From F_POQ A inner join F_POH B on A.PONUM=B.PONUM inner join F_FARM C ON B.FARM=C.FARM ) PODET " + IIf(whereCondition <> "", " where " + whereCondition.ToString(), "") + " Order by POQID ", Con)
                '            Dim da As New SqlDataAdapter(Cmd)
                '            Dim ds As New DataTable
                '            Dim dt As New DataTable
                '            da.Fill(ds)
                '            Dim POQdt = ds
                '            For Each row In ds.Rows
                '                Dim u As New BOPO
                '                u.Farm = row("FARM")
                '                u.Flower = row("FLOWER")
                '                u.QTYBOX = Convert.ToInt32(row("qtybox")).ToString()
                '                u.UOM = row("UOM")
                '                u.QtyXBox = row("qtyxbox")
                '                u.UnitsPerBunch = "0"
                '                u.UnitCosq = row("unitcosq")
                '                u.Flowername = row("prodnamq")
                '                u.FlowerCategory = row("CAT")
                '                u.FOB = row("FOB")
                '                u.ShipDate = row("shipdate")
                '                u.BoxNumber = row("BOXNUM")
                '                u.PONumber = row("PONUM")
                '                u.BreakDown = row("COMMENTQ")
                '                u.CustNumber = row("customer")
                '                u.AWB = row("AWB")
                '                u.BoxCode = row("boxcode")
                '                u.SPORDID = row("SPORDID")
                '                u.ORDER2ID = row("ORDER2ID")
                '                u.WH = row("WH")
                '                u.DetailID = row("POQId")
                '                uList.Add(u)
                '            Next
                '        End Using
                '        whereCondition = ""
                '    Next
                'Else
                'For Each row In rows
                '    whereCondition += IIf(whereCondition.Length <= 0, "", " OR ")
                '    whereCondition += "(POQId='" + row.Element("POQId").Value + "')"
                'Next

                whereCondition += "(POQId in (" + SelectedPOs + "))"
                Using Cmd As New SqlCommand("select * from (Select A.POQID, A.POKEY, A.ORD, A.farm, A.PONUM, A.shipdate, A.CAT,A.PRODCODQ as FLOWER, A.prodnamq, A.qtybox, A.stemxbun, " +
                                                "A.qtyxbox, (CASE WHEN ISNULL(A.UNITCOSQ,0)=0 THEN 0.000 ELSE CAST(A.unitcosq as numeric(18,4)) END)as unitcosq, " +
                                                "A.uom,A.qtybconf, A.customer, A.boxnum, A.awb, A.hawb, A.COMMENTQ, A.boxcode, A.upc, A.PROSTATUS, C.FOB,B.PASSNAME,A.PRODCODQ,A.SPORDID,A.ORDER2ID, B.WH " +
                                                "From F_POQ A inner join F_POH B on A.PONUM=B.PONUM inner join F_FARM C ON B.FARM=C.FARM ) PODET " + IIf(whereCondition <> "", " where " + whereCondition.ToString(), "") + " Order by POQID ", Con)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataTable
                    Dim dt As New DataTable
                    da.Fill(ds)
                    Dim POQdt = ds
                    For Each row In ds.Rows
                        Dim u As New BOPO
                        u.Farm = row("FARM")
                        u.Flower = row("FLOWER")
                        u.QTYBOX = Convert.ToInt32(row("qtybox")).ToString()
                        u.QtyBConf = row("qtybconf")
                        u.UOM = row("UOM")
                        u.QtyXBox = row("qtyxbox")
                        u.UnitsPerBunch = row("stemxbun")
                        u.UnitCosq = row("unitcosq")
                        u.Flowername = row("prodnamq")
                        u.FlowerCategory = row("CAT")
                        u.FarmDetails.FOB = row("FOB")
                        u.ShipDate = row("shipdate")
                        u.BoxNumber = row("BOXNUM")
                        u.PONumber = row("PONUM")
                        u.BreakDown = row("COMMENTQ")
                        u.AWB = row("AWB")
                        u.CustNumber = row("customer")
                        u.BoxCode = row("boxcode")
                        u.SPORDID = row("SPORDID")
                        u.ORDER2ID = row("ORDER2ID")
                        u.WH = row("WH")
                        u.DetailID = row("POQId")
                        uList.Add(u)
                    Next
                End Using
                whereCondition = ""
                ' End If
                Return uList
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPurchaseOrderDetailsBySelectedPokey")
            Dim uList As New List(Of BOPO)
            Dim u As New BOPO
            u.ErrorMessage = "Error in GetPurchaseOrderDetailsBySelectedPokey"
            uList.Add(u)
            Return uList
        End Try
    End Function

    ''' MANI::31-JUL-2015::To save/Update the PurchaseListtoTemp
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function SavePurchaseListToTemp(ByVal Farm As String, ByVal DetailsList As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spSavePurchaseListToTemp", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@DetailsList", DetailsList))
                    Dim result As Integer = cmd.ExecuteScalar()
                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in spSavePurchaseListToTemp")
            Return "error"
        End Try

    End Function

    ''' <summary>
    ''' MANI::10-31-2017::Update Inline Edited Details from temp grid
    ''' </summary>
    ''' <param name="Details"></param>
    ''' <returns></returns>
    Public Shared Function UpdateInlineEditDetailsTempPurchaseDetails(ByVal Details As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[UpdateInlineEditDetailsTempPurchaseDetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Details", Details))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateInlineEditDetailsTempPurchaseDetails")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' MANI::31-OCT-2017::to delete zero qty value manu po details
    ''' </summary>
    ''' <param name="TempPOID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeleteZeroValueInTempPO(ByVal TempPOID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("delete from TEMPPOQ where TEMPPOHID=@TEMPPOHID And Boxes=0", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@TEMPPOHID", TempPOID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteZeroValueInTempPO")
            Return "error"
        End Try
    End Function

    Public Shared Function CancelPurchaseOrder(ByVal POList As String, ByVal Reason As String, ByVal Comment As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spCancelPurchaseOrder", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@POList", POList))
                    cmd.Parameters.Add(New SqlParameter("@Reason", Reason))
                    cmd.Parameters.Add(New SqlParameter("@Comment", Comment))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CancelPurchaseOrder")
            Return "error"
        End Try
    End Function

    Public Shared Function ConfirmPurchaseOrderPO(ByVal XMLString As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spConfirmPurchaseOrderPO", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@XMLString", XMLString))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ConfirmPurchaseOrderPO")
            Return "error"
        End Try
    End Function

    Public Shared Function VoidPurchaseOrder(ByVal POList As String, ByVal Reason As String, ByVal Comment As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spVoidPurchaseOrder", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@POList", POList))
                    cmd.Parameters.Add(New SqlParameter("@Reason", Reason))
                    cmd.Parameters.Add(New SqlParameter("@Comment", Comment))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in VoidPurchaseOrder")
            Return "error"
        End Try
    End Function

    Public Shared Function ValidateBeforeDuplicate(ByVal PONUM As String) As String
        Try
            Dim Msgstr As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("ValidateBeforeDuplicate", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONUM", PONUM))
                    Msgstr = cmd.ExecuteScalar()
                End Using
            End Using
            Return Msgstr
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ValidateBeforeDuplicate")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' MANI::03-NOV-2017::to delete zero qty value manu po details
    ''' </summary>
    ''' <param name="TempPOID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function ClearTempPOInformation(ByVal TempPOID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("delete from TEMPPOQ where TEMPPOHID=@TEMPPOHID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@TEMPPOHID", TempPOID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ClearTempPOInformation")
            Return "error"
        End Try
    End Function

    Public Shared Function GetPurchaseOrderDetailsByPOQId(ByVal POQId As Integer) As BOPO
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BOPO
            Using Con As New SqlConnection(ConStr)

                Con.Open()
                Using Cmd As New SqlCommand("Select Distinct f_poq.POQId, f_poq.pokey, f_poq.ORD, f_poq.farm, f_poq.PONUM, f_poq.shipdate, f_poq.prodcodq, " +
                                                "f_poq.prodnamq, f_poq.CAT, f_poq.qtybox, f_poq.qtyxbox, (CASE WHEN ISNULL(f_poq.unitcosq,0)=0 THEN 0.000 ELSE CAST(f_poq.unitcosq as numeric(18,2)) END) as unitcosq, f_poq.uom, f_poq.qtybconf, " +
                                                "f_poq.totalvaq, f_poq.recdate, f_poq.boxcode, f_poq.customer, f_poq.boxnum, f_poq.awb, " +
                                                "f_poq.hawb, f_poq.invoice, f_poq.COMMENTQ, f_poq.boxcode, f_poq.upc, f_poq.UPCDESC, f_poq.Upcprice, " +
                                                "f_poq.DateCode, f_poq.Lenght, f_poq.Height, f_poq.Width, frm.City, frm.Name, frm.Manufacid " +
                                                "From f_poq inner join f_poh On f_poh.Pokey=f_poq.Pokey " +
                                                "inner join F_Farm frm on frm.Farm=f_poq.Farm where f_poq.POQId=@POQId ", Con)
                    Cmd.Parameters.AddWithValue("@POQId", POQId)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataTable
                    Dim dt As New DataTable
                    da.Fill(ds)
                    For Each row In ds.Rows
                        u.DetailID = row("POQId")
                        u.AWB = row("AWB")
                        u.Invoice = row("invoice")
                        u.BoxCode = row("boxcode")
                        u.QTYBOX = row("qtybox")
                        u.BoxNumber = row("boxnum")
                        u.BreakDown = row("commentq")
                        u.QtyBConf = row("qtybconf")
                        u.UnitCosq = row("unitcosq")
                        u.CustNumber = row("customer")
                        u.HAWB = row("hawb")
                        u.Airport = row("city")
                        u.QtyXBox = row("qtyxbox")
                        u.PONumber = row("PONUM")
                        u.ProdCodeq = row("prodcodq")
                        u.ProdNameq = row("prodnamq")
                        u.FlowerCategory = row("CAT")
                        u.ShipDate = row("Shipdate")
                        u.UOM = row("uom")
                        u.Upc = row("upc")
                        u.Ord = row("ORD")
                        u.Farm = row("farm")
                        u.FarmName = row("Name")
                        u.TOTALVALUE = row("totalvaq")
                        u.BoxCode = row("boxcode")
                        u.UpcDesc = row("UPCDESC")
                        u.UpcPrice = row("UPCPrice")
                        u.DateCode = row("DateCode")
                        u.ManufacID = row("manufacId")
                        u.Length = row("Lenght")
                        u.Height = row("Height")
                        u.Width = row("Width")
                        u.ErrorMessage = ""
                    Next
                    Return u
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPurchaseOrderDetailsByPOQId")
            Dim u As New BOPO
            u.ErrorMessage = "Error in GetPurchaseOrderDetailsByPOQId:: " + ErrorLogs.ExceptionHandling(ex, "GetPurchaseOrderDetailsByPOQId")
            Return u
        End Try
    End Function

    Public Shared Function AddEditTempPODetails(ByVal TempPOHeaderID As String, ByVal Farm As String, ByVal Flower As String,
        ByVal Boxes As String, ByVal UOM As String, ByVal UnitsPerBunch As String, ByVal UnitsPerBox As String,
        ByVal CostPerUnits As String, ByVal Type As String, ByVal Comments As String, ByVal CustNumber As String,
         ByVal BoxCode As String, ByVal UPC As String, ByVal UPCDesc As String, ByVal UPCPrice As String, ByVal DateCode As String, ByVal BreakDown As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim DetailScopeID As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spAddEditTempPODetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@TempPOHeaderID", TempPOHeaderID))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@Flower", Flower))
                    cmd.Parameters.Add(New SqlParameter("@Boxes", Boxes))
                    cmd.Parameters.Add(New SqlParameter("@UOM", UOM))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBunch", UnitsPerBunch))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBox", UnitsPerBox))
                    cmd.Parameters.Add(New SqlParameter("@CostPerUnits", CostPerUnits))
                    cmd.Parameters.Add(New SqlParameter("@Type", Type))
                    cmd.Parameters.Add(New SqlParameter("@Comments", Comments))
                    cmd.Parameters.Add(New SqlParameter("@CustNumber", IIf(CustNumber = Nothing Or CustNumber = "", "0", CustNumber)))
                    cmd.Parameters.Add(New SqlParameter("@BoxCode", BoxCode))
                    cmd.Parameters.Add(New SqlParameter("@UPC", UPC))
                    cmd.Parameters.Add(New SqlParameter("@UPCDesc", UPCDesc))
                    cmd.Parameters.Add(New SqlParameter("@UPCPrice", UPCPrice))
                    cmd.Parameters.Add(New SqlParameter("@DateCode", DateCode))
                    cmd.Parameters.Add(New SqlParameter("@BreakDown", BreakDown))
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in AddEditTempPODetails")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' MANI::01-NOV-2017::CREATEPO:: Move TempPO to originalPO table
    ''' </summary>
    ''' <param name="TempPOID"></param>
    ''' <param name="ShipDate"></param>
    ''' <param name="Farm"></param>
    ''' <param name="PONumber"></param>
    ''' <param name="SalesPerson"></param>
    ''' <param name="AWB"></param>
    ''' <param name="Invoice"></param>
    ''' <returns></returns>
    Public Shared Function CREATEPO(ByVal TempPOID As Integer, ByVal ShipDate As String, ByVal Farm As String, ByVal PONumber As String, ByVal startingBoxNo As Integer, ByVal User As Integer, ByVal Status As String, ByVal AWB As String, ByVal Invoice As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spCreateNewPOinPOlist", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@TEMPPOHID", TempPOID))
                    cmd.Parameters.Add(New SqlParameter("@ShipDate", ShipDate))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@PONumber", PONumber))
                    cmd.Parameters.Add(New SqlParameter("@StartingBoxNo", startingBoxNo))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.Parameters.Add(New SqlParameter("@Status", Status))
                    cmd.Parameters.Add(New SqlParameter("@AWB", AWB))
                    cmd.Parameters.Add(New SqlParameter("@Invoice", Invoice))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CREATEPO")
            Return "error"
        End Try
    End Function

    Public Shared Function UPDATEPO(ByVal PONUMBER As String, ByVal Farm As String, ByVal Warehouse As String, ByVal ShipDate As String, ByVal Type As String, ByVal POStatus As String, ByVal Agency As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spUpdatePOHeader", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONUMBER", PONUMBER))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@Warehouse", Warehouse))
                    cmd.Parameters.Add(New SqlParameter("@ShipDate", ShipDate))
                    cmd.Parameters.Add(New SqlParameter("@Type", Type))
                    cmd.Parameters.Add(New SqlParameter("@POStatus", POStatus))
                    cmd.Parameters.Add(New SqlParameter("@Agency", Agency))
                    cmd.Parameters.Add(New SqlParameter("@UpdateUser", User))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UPDATEPO")
            Return "error"
        End Try
    End Function

    Public Shared Function GenerateStandingPurchaseOrders(ByVal Shipdate As String, ByVal AllWeek As String, ByVal Repeat As String, ByVal FARM As String, ByVal Customer As String, ByVal IgnoreCustomer As String, ByVal UserName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGenerateStandingPurchaseOrdersAllWeek", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Shipdate", Shipdate))
                    cmd.Parameters.Add(New SqlParameter("@AllWeek", AllWeek))
                    cmd.Parameters.Add(New SqlParameter("@RepeatProcess", Repeat))
                    cmd.Parameters.Add(New SqlParameter("@FARM", FARM))
                    cmd.Parameters.Add(New SqlParameter("@Customer", Customer))
                    cmd.Parameters.Add(New SqlParameter("@IgnoreCustomer", IgnoreCustomer))
                    cmd.Parameters.Add(New SqlParameter("@UserName", UserName))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CREATEPO")
            Return "error"
        End Try
    End Function

    Public Shared Function UPDATECOMMENT(ByVal PONUMBER As String, ByVal COMMENT As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UpdatePOComment", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONUMBER", PONUMBER))
                    cmd.Parameters.Add(New SqlParameter("@COMMENT", COMMENT))
                    cmd.Parameters.Add(New SqlParameter("@UpdateUser", User))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UPDATECOMMENT")
            Return "error"
        End Try
    End Function
    Public Shared Function GetCommentByPONumber(ByVal PONUMBER As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetPOComment", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONUMBER", PONUMBER))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCommentByPONumber")
            Return "error"
        End Try
    End Function

    Public Shared Function DuplicatePO(ByVal PONUMBER As String, ByVal NewPONUM As String, ByVal ShipDate As String, ByVal BoxNum As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spDuplicatePO", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@OldPONum", PONUMBER))
                    cmd.Parameters.Add(New SqlParameter("@PONumber", NewPONUM))
                    cmd.Parameters.Add(New SqlParameter("@ShipDate", ShipDate))
                    cmd.Parameters.Add(New SqlParameter("@StartingBoxNo", BoxNum))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.Parameters.Add(New SqlParameter("@Status", "CONFIRMED"))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DuplicatePO")
            Return "error"
        End Try
    End Function

    Public Shared Function DELETEPODetail(PONUMBER As String, User As String, POQId As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spDeletePODetail", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONUMBER", PONUMBER))
                    'cmd.Parameters.Add(New SqlParameter("@ORD", ORD))
                    cmd.Parameters.Add(New SqlParameter("@POQId", POQId))
                    cmd.Parameters.Add(New SqlParameter("@UpdateUser", User))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DELETEPODetail")
            Return "error"
        End Try
    End Function

    Public Shared Function ADDPODetailToPOQ(ByVal PONumber As String, ByVal Farm As String, ByVal Flower As String, ByVal Boxes As String, ByVal UOM As String, ByVal UnitsPerBunch As String, ByVal UnitsPerBox As String,
                                            ByVal CostPerUnits As String, ByVal Type As String, ByVal Comments As String, ByVal CustNumber As String, ByVal BoxCode As String, ByVal BreakDown As String, ByVal User As String,
                                            ByVal UPC As String, ByVal UPCDesc As String, ByVal UPCPrice As String, ByVal DateCode As String, ByVal FoodDesc As String, ByVal PickDesc As String, ByVal SleeveDesc As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spAddPODetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONumber", PONumber))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@Flower", Flower))
                    cmd.Parameters.Add(New SqlParameter("@Boxes", Boxes))
                    cmd.Parameters.Add(New SqlParameter("@UOM", UOM))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBunch", UnitsPerBunch))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBox", UnitsPerBox))
                    cmd.Parameters.Add(New SqlParameter("@CostPerUnits", CostPerUnits))
                    cmd.Parameters.Add(New SqlParameter("@Type", Type))
                    cmd.Parameters.Add(New SqlParameter("@Comments", Comments))
                    cmd.Parameters.Add(New SqlParameter("@CustNumber", CustNumber))
                    cmd.Parameters.Add(New SqlParameter("@BoxCode", BoxCode))
                    cmd.Parameters.Add(New SqlParameter("@BreakDown", BreakDown))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.Parameters.Add(New SqlParameter("@UPC", UPC))
                    cmd.Parameters.Add(New SqlParameter("@UPCDesc", UPCDesc))
                    cmd.Parameters.Add(New SqlParameter("@UPCPrice", UPCPrice))
                    cmd.Parameters.Add(New SqlParameter("@DateCode", DateCode))
                    cmd.Parameters.Add(New SqlParameter("@FoodDesc", FoodDesc))
                    cmd.Parameters.Add(New SqlParameter("@PickDesc", PickDesc))
                    cmd.Parameters.Add(New SqlParameter("@SleeveDesc", SleeveDesc))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ADDPODetailToPOQ")
            Return "error"
        End Try
    End Function

    Public Shared Function UPDATEPODetailToPOQ(ByVal PONumber As String, ByVal Farm As String, ByVal Flower As String, ByVal Boxes As String, ByVal UOM As String, ByVal UnitsPerBunch As String, ByVal UnitsPerBox As String,
                                     ByVal CostPerUnits As String, ByVal Type As String, ByVal Comments As String, ByVal CustNumber As String, ByVal BoxCode As String, ByVal BreakDown As String, ByVal User As String, ByVal ORD As String, ByVal POQId As String,
                                     ByVal UPC As String, ByVal UPCDesc As String, ByVal UPCPrice As String, ByVal DateCode As String, ByVal FoodDesc As String, ByVal PickDesc As String, ByVal SleeveDesc As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spUpdatePOQDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONumber", PONumber))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@Flower", Flower))
                    cmd.Parameters.Add(New SqlParameter("@Boxes", Boxes))
                    cmd.Parameters.Add(New SqlParameter("@UOM", UOM))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBunch", UnitsPerBunch))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBox", UnitsPerBox))
                    cmd.Parameters.Add(New SqlParameter("@CostPerUnits", CostPerUnits))
                    cmd.Parameters.Add(New SqlParameter("@Type", Type))
                    cmd.Parameters.Add(New SqlParameter("@Comments", Comments))
                    cmd.Parameters.Add(New SqlParameter("@CustNumber", CustNumber))
                    cmd.Parameters.Add(New SqlParameter("@BoxCode", BoxCode))
                    cmd.Parameters.Add(New SqlParameter("@BreakDown", BreakDown))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.Parameters.Add(New SqlParameter("@ORD", ORD))
                    cmd.Parameters.Add(New SqlParameter("@POQId", POQId))
                    cmd.Parameters.Add(New SqlParameter("@UPC", UPC))
                    cmd.Parameters.Add(New SqlParameter("@UPCDesc", UPCDesc))
                    cmd.Parameters.Add(New SqlParameter("@UPCPrice", UPCPrice))
                    cmd.Parameters.Add(New SqlParameter("@DateCode", DateCode))
                    cmd.Parameters.Add(New SqlParameter("@FoodDesc", FoodDesc))
                    cmd.Parameters.Add(New SqlParameter("@PickDesc", PickDesc))
                    cmd.Parameters.Add(New SqlParameter("@SleeveDesc", SleeveDesc))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CREATEPO")
            Return "error"
        End Try
    End Function


    ''' <summary>
    ''' MANI::get GetPOHeaderDataByPONumber For POHeaderEdit 
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetPOHeaderDataByPONumber(ByVal PONumber As String) As BOPO
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BOPO
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select PONUM,A.FARM,B.NAME AS FARMNAME,SHIPDATE,WH,POTYPE,POSTAT,CARRIER,PASSNAME,AIRPORT from F_POH A LEFT OUTER JOIN F_FARM B ON A.FARM=B.FARM where PONUM=@PONUM", con)
                    cmd.Parameters.AddWithValue("PONUM", PONumber)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.PONumber = Convert.ToString(row("PONUM"))
                        u.Farm = Convert.ToString(row("Farm"))
                        u.ShipDate = DateTime.Parse(IIf(row("ShipDate") Is DBNull.Value, "01/01/1900", row("ShipDate"))).ToString("MM/dd/yyyy")
                        u.Warehouse = Convert.ToString(row("WH"))
                        u.POType = Convert.ToString(row("POType"))
                        u.PoStatus = Convert.ToString(row("POSTAT"))
                        u.Carrier = Convert.ToString(row("Carrier"))
                        u.PassName = Convert.ToString(row("PassName"))
                        u.Airport = Convert.ToString(row("Airport"))
                        u.FarmName = Convert.ToString(row("FARMNAME"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPOHeaderDataByPONumber")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetPOQDetailForUpdate(ByVal PONumber As String, ByVal ORD As String, ByVal POQId As String) As BOPO
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BOPO
            Using con As New SqlConnection(ConStr)
                con.Open()
                '' edited by Anubhuti 08-06-2021
                Using cmd As New SqlCommand("SELECT po.*,bouquetImagePath,FoodImagePath,SleeveImagePath,PickImagePath,ImgbouquetName,ImgFoodName,ImgSleeveName,ImgPickName FROM F_POQ po LEFT JOIN tblBouquetImages bq ON po.POQID=bq.POQID where po.PONUM=@PONUM and po.POQId=@POQId", con)
                    ''
                    cmd.Parameters.AddWithValue("@PONUM", PONumber)
                    cmd.Parameters.AddWithValue("@ORD", ORD)
                    cmd.Parameters.AddWithValue("@POQId", POQId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.PONumber = Convert.ToString(row("PONUM"))
                        u.Farm = Convert.ToString(row("Farm"))
                        u.Flower = Convert.ToString(row("PRODCODQ"))
                        u.Flowername = Convert.ToString(row("PRODNAMQ"))
                        u.QTYBOX = Convert.ToString(row("QTYBOX"))
                        u.QtyUnit = Convert.ToString(row("QTYUNIT"))
                        u.QtyXBox = Convert.ToString(row("QTYXBOX"))
                        u.UnitsPerBunch = Convert.ToString(row("STEMXBUN"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.UnitCosq = Convert.ToString(row("UNITCOSQ"))
                        u.CustNumber = Convert.ToString(row("customer"))
                        u.Comments = Convert.ToString(row("commentq"))
                        u.Type = Convert.ToString(row("market"))
                        u.BoxNumber = Convert.ToString(row("BOXNUM"))
                        u.BoxCode = Convert.ToString(row("BOXCODE"))
                        u.FoodDesc = Convert.ToString(row("FOODDESC"))
                        u.PickDesc = Convert.ToString(row("PICKDESC"))
                        u.SleeveDesc = Convert.ToString(row("SLEEVEDESC"))
                        u.Upc = Convert.ToString(row("UPC"))
                        u.UpcDesc = Convert.ToString(row("UPCDesc"))
                        u.UpcPrice = Convert.ToString(row("UpcPrice"))
                        u.DateCode = Convert.ToString(row("DateCode"))
                        '' edited by Anubhuti 08-06-2021
                        u.bouquetImagePath = Convert.ToString(row("bouquetImagePath"))
                        u.FoodImagePath = Convert.ToString(row("FoodImagePath"))
                        u.SleeveImagePath = Convert.ToString(row("SleeveImagePath"))
                        u.PickImagePath = Convert.ToString(row("PickImagePath"))
                        u.ImgbouquetName = Convert.ToString(row("ImgbouquetName"))
                        u.ImgFoodName = Convert.ToString(row("ImgFoodName"))
                        u.ImgSleeveName = Convert.ToString(row("ImgSleeveName"))
                        u.ImgPickName = Convert.ToString(row("ImgPickName"))
                        ''
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPOQDetailForUpdate")
            Return Nothing
        End Try
    End Function


    'Update by Yousuf Rakib. Date: 28-05-2021
    Public Shared Function GetPOQDetailForUpdatePart2(ByVal POQId As String) As BOPO
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BOPO
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SELECT * FROM F_POQ where PONUM=@PONUM AND ORD=@ORD AND POQId=@POQId", con)
                    cmd.Parameters.AddWithValue("@POQId", POQId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.FoodDesc = Convert.ToString(row("FOODDESC"))
                        u.PickDesc = Convert.ToString(row("PICKDESC"))
                        u.SleeveDesc = Convert.ToString(row("SLEEVEDESC"))
                        u.Upc = Convert.ToString(row("UPC"))
                        u.UpcDesc = Convert.ToString(row("UPCDesc"))
                        u.UpcPrice = Convert.ToString(row("UpcPrice"))
                        u.DateCode = Convert.ToString(row("DateCode"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPOQDetailForUpdate")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' MANI::get po status for dropdown loading
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetPOStatus() As List(Of BOPO)

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BOPO)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from f_postatus", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOPO
                        u.PoStatus = row("STATUS")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPOStatus")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetCancelReason() As List(Of BOPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BOPO)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spCancelReason", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOPO
                        u.CancelVoidReason = row("Reason")
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
    Public Shared Function GetVoidReason() As List(Of BOPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BOPO)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spVoidReason", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOPO
                        u.CancelVoidReason = row("Reason")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetVoidReason")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetBoxNumberFromConstant() As String
        Try
            Dim BoxNumber As String = ""
            Dim SQLConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dtSQL As New DataTable
            Using SQLCon As New SqlConnection(SQLConStr)
                SQLCon.Open()
                Using SQLcmd As New SqlCommand("GetBoxNumerFromConstant", SQLCon)
                    SQLcmd.CommandType = CommandType.StoredProcedure
                    Dim daSQL As New SqlDataAdapter(SQLcmd)
                    daSQL.Fill(dtSQL)
                    If (dtSQL.Rows.Count > 0) Then
                        For Each SQLrow In dtSQL.Rows
                            BoxNumber = Convert.ToString(SQLrow("BOXNUM").ToString())
                        Next
                    Else
                        BoxNumber = "error"
                    End If
                End Using
            End Using
            Return BoxNumber
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetBoxNumerFromConstant")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetBoxNumberFromConstant(ByVal TotalRows As Integer) As String
        Try
            Dim BoxNumber As String = ""
            Dim SQLConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dtSQL As New DataTable
            Using SQLCon As New SqlConnection(SQLConStr)
                SQLCon.Open()
                Using SQLcmd As New SqlCommand("GetBoxNumerFromConstantMultipleLines", SQLCon)
                    SQLcmd.CommandType = CommandType.StoredProcedure
                    SQLcmd.Parameters.AddWithValue("@NoOfRecords", TotalRows)
                    Dim daSQL As New SqlDataAdapter(SQLcmd)
                    daSQL.Fill(dtSQL)
                    If (dtSQL.Rows.Count > 0) Then
                        For Each SQLrow In dtSQL.Rows
                            BoxNumber = Convert.ToString(SQLrow("BOXNUM").ToString())
                        Next
                    Else
                        BoxNumber = "error"
                    End If
                End Using
            End Using
            Return BoxNumber
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetBoxNumerFromConstant")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetPONumberFromSalesMan(ByVal SalesmanId As Integer) As String
        Try
            Dim PONumber As String = ""
            Dim SQLConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            If SalesmanId <> 0 Then
                Dim dtSQL As New DataTable
                Using SQLCon As New SqlConnection(SQLConStr)
                    SQLCon.Open()
                    Dim SQLQry As String = "GetPONumberFromSalesman"
                    Using SQLcmd As New SqlCommand(SQLQry, SQLCon)
                        SQLcmd.CommandType = CommandType.StoredProcedure
                        SQLcmd.Parameters.AddWithValue("@SalesPerson", SalesmanId)
                        Dim daSQL As New SqlDataAdapter(SQLcmd)
                        daSQL.Fill(dtSQL)
                        If (dtSQL.Rows.Count > 0) Then
                            For Each SQLrow In dtSQL.Rows
                                PONumber = Convert.ToString(SQLrow("PONumber").ToString())
                            Next
                        Else
                            PONumber = "Sorry.... you must be set up as a sales person in the system"
                        End If
                    End Using
                End Using
            Else
                PONumber = "Sorry.... you must be set up as a sales person in the system"
            End If
            Return PONumber
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPONumberFromSalesMan")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetPurchaseOrderHeaderGridForFgrd(ByVal SQLFilterCondition As String) As List(Of BOPO)
        Try
            Dim SQLConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim POHList As New List(Of BOPO)
            Dim dtSQL As New DataTable
            Using SQLCon As New SqlConnection(SQLConStr)
                SQLCon.Open()
                Dim SQLQry As String = ""
                SQLQry = "spPurchaseOrderHeaderForGrid"
                Using SQLcmd As New SqlCommand(SQLQry, SQLCon)
                    SQLcmd.CommandType = CommandType.StoredProcedure
                    SQLcmd.Parameters.AddWithValue("@WhereClause", SQLFilterCondition)
                    Dim daSQL As New SqlDataAdapter(SQLcmd)
                    daSQL.Fill(dtSQL)
                End Using
            End Using
            Dim TotalFBE As Double = 0
            Dim TotalUnit As Integer = 0
            Dim TotalPieces As Integer = 0
            Dim TotalAmounts As Double = 0
            For Each SQLrow In dtSQL.Rows
                Dim u As New BOPO
                u.Emailed = Convert.ToBoolean(SQLrow("EMAILED"))
                u.PONumber = Convert.ToString(SQLrow("PONUM"))
                u.Farm = Convert.ToString(SQLrow("Farm"))
                u.FarmName = Convert.ToString(SQLrow("FARMNAME"))
                u.PODate = Convert.ToDateTime(SQLrow("PODate"))
                u.PROStatus = Convert.ToString(SQLrow("POSTAT"))
                u.ShipDate = Convert.ToDateTime(SQLrow("SHIPDATE"))
                u.Airport = Convert.ToString(SQLrow("AIRPORT"))
                u.WH = Convert.ToString(SQLrow("WH"))
                u.Carrier = Convert.ToString(SQLrow("CARRIER"))
                u.BOXESFBE = Convert.ToDecimal(SQLrow("BOXESFBE"))
                TotalFBE = TotalFBE + u.BOXESFBE
                u.Boxes = Convert.ToInt32(SQLrow("BOXES"))
                TotalPieces = TotalPieces + u.Boxes
                u.TotalUnits = Convert.ToInt32(SQLrow("TOTUNITS"))
                TotalUnit = TotalUnit + u.TotalUnits
                u.RECEIVEDBOXES = Convert.ToInt32(SQLrow("RECEIB"))
                u.TOTALVALUE = Convert.ToDecimal(SQLrow("TOTVAL"))
                u.POTOTAL = Convert.ToDecimal(SQLrow("POTOTAL"))
                u.AWB = Convert.ToString(SQLrow("AWB"))
                u.SALESVALUE = Convert.ToDecimal(SQLrow("SALESVALUE"))
                u.TotalCost = Convert.ToDecimal(SQLrow("TOTALCOST"))
                TotalAmounts = TotalAmounts + u.TotalCost
                u.ADDUSER = Convert.ToString(SQLrow("ADDUSER"))
                u.ADDDATE = Convert.ToString(SQLrow("ADDDATE"))
                u.ADDTIME = Convert.ToString(SQLrow("ADDTIME"))
                u.ADDAPP = Convert.ToString(SQLrow("ADDAPP"))
                u.UPDUSER = Convert.ToString(SQLrow("UPDUSER"))
                u.UPDDATE = Convert.ToString(SQLrow("UPDDATE"))
                u.UPDTIME = Convert.ToString(SQLrow("UPDTIME"))
                u.UPDAPP = Convert.ToString(SQLrow("UPDAPP"))
                u.IsDiffQty = Convert.ToInt32(SQLrow("IsDiffQty"))

                If u.SALESVALUE > 0 And u.POTOTAL > 0 Then
                    u.GPM = (u.SALESVALUE - u.POTOTAL) * 100 / u.SALESVALUE
                Else
                    u.GPM = 0
                End If
                u.ISDBFDATA = Convert.ToString(SQLrow("ISDBFDATA"))
                u.Comments = Convert.ToString(SQLrow("COMMENT"))
                POHList.Add(u)
            Next
            If dtSQL.Rows.Count > 0 Then
                Dim u2 As New BOPO
                u2.Emailed = False
                u2.PONumber = ""
                u2.Farm = ""
                u2.FarmName = ""
                u2.PODate = Date.Now.ToString()
                u2.PROStatus = ""
                u2.ShipDate = Date.Now.ToString()
                u2.Airport = ""
                u2.WH = ""
                u2.Carrier = ""
                u2.BOXESFBE = Convert.ToDecimal(TotalFBE)
                u2.Boxes = Convert.ToInt32(TotalPieces)
                u2.TotalUnits = TotalUnit
                u2.RECEIVEDBOXES = 0
                u2.TOTALVALUE = 0
                u2.POTOTAL = 0
                u2.AWB = ""
                u2.SALESVALUE = 0
                u2.TotalCost = Convert.ToDecimal(TotalAmounts)
                u2.ADDUSER = ""
                u2.ADDDATE = Date.Now()
                u2.ADDTIME = ""
                u2.ADDAPP = ""
                u2.UPDUSER = ""
                u2.UPDDATE = Date.Now()
                u2.UPDTIME = ""
                u2.UPDAPP = ""
                u2.GPM = 0
                u2.ISDBFDATA = ""
                u2.Comments = ""
                u2.IsDiffQty = 0
                POHList.Add(u2)
            End If
            Return POHList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPurchaseOrderHeaderGridForFgrd")
            Return Nothing
        End Try
    End Function

    Public Shared Function ValidatePOEmailExist(ByVal POList As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("ValidatePOEmailExist", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@POList", POList))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ValidatePOEmailExist")
            Return "error"
        End Try
    End Function

    Public Shared Function DenyStandingOrder(ByVal SpordSqlId As String, ByVal Comment As String, ByVal UserID As String, ByVal UserName As String, ByVal SalesType As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spDenyStandingOrder", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@SpordSqlId", SpordSqlId))
                    cmd.Parameters.Add(New SqlParameter("@Comment", Comment))
                    cmd.Parameters.Add(New SqlParameter("@UserID", UserID))
                    cmd.Parameters.Add(New SqlParameter("@UserName", UserName))
                    cmd.Parameters.Add(New SqlParameter("@SalesType", SalesType))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DenyStandingOrder")
            Return "error"
        End Try
    End Function
    Public Shared Function GetFarmEmailList(ByVal PONUM As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetFarmEmail", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONUM", PONUM))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmEmailList")
            Return "error"
        End Try
    End Function

    Public Shared Function DropItemFromPO(ByVal PONUMBER As String, ByVal NewPONUM As String, ByVal ShipDate As String, ByVal BoxNum As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spDropItemFromPO", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@OldPONum", PONUMBER))
                    cmd.Parameters.Add(New SqlParameter("@PONumber", NewPONUM))
                    cmd.Parameters.Add(New SqlParameter("@ShipDate", ShipDate))
                    cmd.Parameters.Add(New SqlParameter("@StartingBoxNo", BoxNum))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.Parameters.Add(New SqlParameter("@Status", "CONFIRMED"))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DropItemFromPO")
            Return "error"
        End Try
    End Function

    Public Shared Function DropItemToNewPO(ByVal OLDPONUMBER As String, ByVal NEWPONUMER As String, ByVal Username As String, ByVal User As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spDropItemToNewPO", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@OldPONum", OLDPONUMBER))
                    cmd.Parameters.Add(New SqlParameter("@PONumber", NEWPONUMER))
                    cmd.Parameters.Add(New SqlParameter("@Username", Username))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DropItemToNewPO")
            Return "error"
        End Try
    End Function
    '' Added By Anubhuti 04-06-2021
    Public Shared Function SaveBouquetImages(ByVal POQID As Integer, ByVal Prodcode As String, ByVal bouquetImagePath As String, ByVal FoodImagePath As String, ByVal SleeveImagePath As String, ByVal PickImagePath As String, ByVal ImgbouquetName As String, ByVal ImgFoodName As String, ByVal ImgSleeveName As String, ByVal ImgPickName As String) As String
        Try
            Dim hostName As String = System.Net.Dns.GetHostName()
            Dim myIPs As System.Net.IPHostEntry = System.Net.Dns.GetHostEntry(hostName)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spInsertBouquetImages", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@POQID", POQID)
                    Cmd.Parameters.AddWithValue("@Prodcode", Prodcode)
                    Cmd.Parameters.AddWithValue("@bouquetImagePath", bouquetImagePath)
                    Cmd.Parameters.AddWithValue("@FoodImagePath", FoodImagePath)
                    Cmd.Parameters.AddWithValue("@SleeveImagePath", SleeveImagePath)
                    Cmd.Parameters.AddWithValue("@PickImagePath", PickImagePath)
                    Cmd.Parameters.AddWithValue("@ImgbouquetName", ImgbouquetName)
                    Cmd.Parameters.AddWithValue("@ImgFoodName", ImgFoodName)
                    Cmd.Parameters.AddWithValue("@ImgSleeveName", ImgSleeveName)
                    Cmd.Parameters.AddWithValue("@ImgPickName", ImgPickName)
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In SaveBouquetImages")
            Throw ex
        End Try
    End Function

    Public Shared Function DeleteBouquetImages(ByVal POQID As Integer, ByVal Prodcode As String, ByVal ImgType As String) As String
        Try
            Dim hostName As String = System.Net.Dns.GetHostName()
            Dim myIPs As System.Net.IPHostEntry = System.Net.Dns.GetHostEntry(hostName)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spDeleteBouquetImages", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@POQID", POQID)
                    Cmd.Parameters.AddWithValue("@Prodcode", Prodcode)
                    Cmd.Parameters.AddWithValue("@ImgType", ImgType)
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In SaveBouquetImages")
            Throw ex
        End Try
    End Function

    Public Shared Function GetImageByProdCode(ByVal Prodcode As String) As BOPO
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BOPO
            Using con As New SqlConnection(ConStr)
                con.Open()
                '' edited by Anubhuti 08-06-2021
                Using cmd As New SqlCommand("SELECT bouquetImagePath,FoodImagePath,SleeveImagePath,PickImagePath,ImgbouquetName,ImgFoodName,ImgSleeveName,ImgPickName FROM tblBouquetImages bq where bq.Prodcode=@Prodcode", con)
                    ''
                    cmd.Parameters.AddWithValue("@Prodcode", Prodcode)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.bouquetImagePath = Convert.ToString(row("bouquetImagePath"))
                        u.FoodImagePath = Convert.ToString(row("FoodImagePath"))
                        u.SleeveImagePath = Convert.ToString(row("SleeveImagePath"))
                        u.PickImagePath = Convert.ToString(row("PickImagePath"))
                        u.ImgbouquetName = Convert.ToString(row("ImgbouquetName"))
                        u.ImgFoodName = Convert.ToString(row("ImgFoodName"))
                        u.ImgSleeveName = Convert.ToString(row("ImgSleeveName"))
                        u.ImgPickName = Convert.ToString(row("ImgPickName"))
                        ''
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetImageByProdCode")
            Return Nothing
        End Try
    End Function


    Public Shared Function UpdateFinalPOHeader() As String
        Try
            Dim hostName As String = System.Net.Dns.GetHostName()
            Dim myIPs As System.Net.IPHostEntry = System.Net.Dns.GetHostEntry(hostName)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spUpdatefixallPOHeaders", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateFinalPOHeader")
            Throw ex
        End Try
    End Function


    '' Ended
    Public Class PurchaseList

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetPurchaseListDetailsFromTempByPOID(ByVal TempPOID As Integer) As List(Of BOPO)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of BOPO)()
                Dim TotalUnitsPerBox As Integer = 0
                Dim TotalBoxes As Integer = 0
                Dim TotalUnits As Integer = 0
                Dim TotalCost As Decimal = 0.00
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select * from TEMPPOQ where TEMPPOHID=@TempPOID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.Add(New SqlParameter("@TempPOID", TempPOID))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BOPO()

                            u.HeaderID = row("TEMPPOHID")
                            u.DetailID = row("ID")
                            u.Farm = row("Farm")
                            u.Flower = row("Flower")
                            u.Flowername = Convert.ToString(row("FlowerName"))
                            u.Boxes = Convert.ToInt32(row("Boxes"))
                            TotalBoxes += u.Boxes
                            u.UOM = Convert.ToString(row("UOM"))
                            u.UnitsPerBunch = Convert.ToInt32(IIf(row("UNITSBUNCH") Is DBNull.Value, 0, row("UNITSBUNCH")))
                            u.UnitsPerBox = Convert.ToInt32(IIf(row("UNITS") Is DBNull.Value, 0, row("UNITS")))
                            TotalUnitsPerBox += u.UnitsPerBox
                            u.CustNumber = Convert.ToString(row("customer"))
                            u.Cost = Convert.ToDecimal(IIf(row("Cost") Is DBNull.Value, 0, row("Cost")))
                            'u.TotalCost = u.Cost * u.Boxes * u.TotalCost
                            'TotalCost += u.TotalCost
                            u.TotalUnits = u.UnitsPerBox * u.Boxes
                            TotalUnits += u.TotalUnits
                            u.TotalCost = u.Cost * u.TotalUnits
                            TotalCost += u.TotalCost
                            u.Comments = Convert.ToString(row("Comments"))
                            u.BreakDown = Convert.ToString(row("BreakDown"))
                            u.Type = IIf(row("Type") Is DBNull.Value, "", row("Type"))
                            u.BoxCode = Convert.ToString(row("BoxCode"))
                            u.ForeColor = Convert.ToString(row("Color"))
                            u.BGColor = Convert.ToString(row("BGColor"))

                            uList.Add(u)
                        Next

                        Dim af As New BOPO()
                        af.HeaderID = 0
                        af.DetailID = 0
                        af.Farm = ""
                        af.Flower = ""
                        af.Flowername = "Total"
                        af.Boxes = TotalBoxes
                        af.UOM = ""
                        af.UnitsPerBunch = 0
                        af.UnitsPerBox = 0
                        af.TotalCost = TotalCost
                        af.TotalUnits = TotalUnits
                        af.CustNumber = ""
                        af.Cost = TotalCost
                        af.UnitsPerBox = 0
                        af.Comments = ""
                        af.BreakDown = ""
                        af.Type = ""
                        af.BoxCode = ""
                        af.ForeColor = ""
                        af.BGColor = ""
                        uList.Add(af)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetManualPODetail")
                Return Nothing
            End Try
        End Function
        Public Function DeletePOTempdetail(ByVal Id As Integer) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spDeleteFromManualPoAndF_Farmpr", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@ID", Id))
                        cmd.ExecuteNonQuery()
                    End Using
                End Using
                Return "success"
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteTempPoqById")
                Return "error"
            End Try
        End Function


    End Class

    Public Class PODetails

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetPODetailsByPONumberFromSQL(ByVal PONUMBER As String) As List(Of BOPO)
            Try
                Dim TotalQty As Integer = 0
                Dim TotalPrice As Double = 0
                Dim TotalUnits As Integer = 0
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of BOPO)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    'Using cmd As New SqlCommand("select POQ.*,cc.Color As ForeColor,cc.BGColor,ISNULL(DATEDIFF(DAY,SHIpDATE,CustSHDate),0) AS Days," +
                    '        "CONVERT(NUMERIC(10,1),(CASE WHEN UNITSALQ>0 AND QTYXBOX>0 THEN CONVERT(NUMERIC(10,3),(UNITSALQ - CONVERT(NUMERIC(10,3),UNITCOSQ+ (ISNULL(FREIGHT,0)/QTYXBOX)+ (ISNULL(handling,0)/QTYXBOX)+ (ISNULL(DUTIES,0)/QTYXBOX)))/UNITSALQ) ELSE 0 END)*100) AS GPM" +
                    '        " from F_POQ POQ inner join tblColorCode cc on cc.Code=POQ.COLORCODE where PONUM=@PONUMBER ORDER BY POQ.ORD", con)
                    '    cmd.CommandType = CommandType.Text
                    Using cmd As New SqlCommand("spGetPODetailsForConfirm", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@PONUMBER", PONUMBER))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BOPO()
                            u.DetailID = Convert.ToString(row("POQId"))
                            u.Ord = Convert.ToString(row("Ord"))
                            u.Farm = Convert.ToString(row("Farm"))
                            u.ProdCodeq = Convert.ToString(row("ProdCodq"))
                            u.ProdNameq = Convert.ToString(row("ProdNamq"))
                            u.BoxNumber = Convert.ToString(row("Boxnum"))
                            u.QTYBOX = Convert.ToInt32(IIf(row("QTYBOX") Is DBNull.Value, 0, row("QTYBOX")))
                            TotalQty += u.QTYBOX
                            u.UOM = Convert.ToString(row("UOM"))
                            u.BunXBox = Convert.ToInt32(IIf(row("BunXBox") Is DBNull.Value, 0, row("BunXBox")))
                            u.StemXBun = Convert.ToInt32(IIf(row("StemXBun") Is DBNull.Value, 0, row("StemXBun")))
                            u.QtyXBox = Convert.ToInt32(IIf(row("QtyXBox") Is DBNull.Value, 0, row("QtyXBox")))
                            u.QtyUnit = Convert.ToInt32(IIf(row("QtyUnit") Is DBNull.Value, 0, row("QtyUnit")))
                            u.UnitSalq = Convert.ToDecimal(IIf(row("UnitSalq") Is DBNull.Value, 0, row("UnitSalq")))
                            u.UnitCosq = Convert.ToDecimal(IIf(row("UnitCosq") Is DBNull.Value, 0, row("UnitCosq")))
                            u.TotalCost = (u.QtyUnit * u.UnitCosq)
                            TotalPrice += (u.QtyUnit * u.UnitCosq)
                            TotalUnits += u.QtyUnit
                            u.CustNumber = Convert.ToString(row("Customer"))
                            u.ShipDate = Convert.ToDateTime(IIf(row("ShipDate") Is DBNull.Value, "", row("ShipDate"))).ToString("MM/dd/yyyy")
                            u.CustSHDate = IIf(row("CustSHDate").ToString().Contains("1900"), "", Convert.ToDateTime(row("CustSHDate")).ToString("MM/dd/yyyy"))
                            u.Day = IIf(row("CustSHDate").ToString().Contains("1900"), "", Convert.ToDateTime(row("CustSHDate")).DayOfWeek.ToString())
                            u.Days = IIf(row("CustSHDate").ToString().Contains("1900"), "", Convert.ToString(row("Days")))
                            u.Order = Convert.ToString(row("Order"))
                            u.Brand = Convert.ToString(row("Brand"))
                            u.BoxCode = Convert.ToString(row("BoxCode"))
                            u.Upc = Convert.ToString(row("UPC"))
                            u.UpcDesc = Convert.ToString(row("UPCDesc"))
                            u.DateCode = Convert.ToString(row("DateCode"))
                            u.UpcPrice = Convert.ToString(row("UpcPrice"))
                            u.Freight = Convert.ToDecimal(IIf(row("Freight") Is DBNull.Value, 0, row("Freight")))
                            u.Duties = Convert.ToDecimal(IIf(row("Duties") Is DBNull.Value, 0, row("Duties")))
                            u.Comments = Convert.ToString(row("CommentQ"))
                            u.CommentA = Convert.ToString(row("Comment1"))
                            u.CommentB = Convert.ToString(row("Comment2"))
                            u.CommentC = Convert.ToString(row("Comment3"))
                            u.PoStatus = Convert.ToString(row("ProStatus"))
                            u.PONumber = Convert.ToString(row("PONum"))
                            u.BGColor = Convert.ToString(row("BGColor"))
                            u.ForeColor = Convert.ToString(row("ForeColor"))
                            u.SPORDID = Convert.ToString(row("SPORDID"))
                            u.ORDER2ID = Convert.ToString(row("ORDER2ID"))
                            u.GPM = Convert.ToString(row("GPM"))
                            u.Type = Convert.ToString(row("Market"))
                            uList.Add(u)
                        Next
                        Dim uTotal As New BOPO()
                        uTotal.DetailID = Convert.ToString("0")
                        uTotal.Ord = Convert.ToString("0")
                        uTotal.Farm = Convert.ToString("")
                        uTotal.ProdCodeq = Convert.ToString("")
                        uTotal.ProdNameq = Convert.ToString("")
                        uTotal.BoxNumber = Convert.ToString("0")
                        uTotal.QTYBOX = Convert.ToInt32(TotalQty)
                        uTotal.UOM = Convert.ToString("")
                        uTotal.BunXBox = Convert.ToInt32("0")
                        uTotal.StemXBun = Convert.ToInt32("0")
                        uTotal.QtyXBox = Convert.ToInt32("0")
                        uTotal.QtyUnit = Convert.ToInt32(TotalUnits)
                        uTotal.UnitSalq = Convert.ToInt32("0")
                        uTotal.UnitCosq = Convert.ToInt32("0")
                        ' Modified by: Subhajit On: 06-17-2022 totalprice was converted to int , decimales lost
                        uTotal.TotalCost = Convert.ToDecimal(TotalPrice)
                        uTotal.CustNumber = Convert.ToString("")
                        uTotal.ShipDate = Convert.ToDateTime("01/01/1900").ToString("MM/dd/yyyy")
                        uTotal.CustSHDate = Convert.ToDateTime("01/01/1900").ToString("MM/dd/yyyy")
                        uTotal.Days = Convert.ToString("0")
                        uTotal.Order = Convert.ToString("0")
                        uTotal.Brand = Convert.ToString("0")
                        uTotal.BoxCode = Convert.ToString("0")
                        uTotal.Upc = Convert.ToString("")
                        uTotal.UpcDesc = Convert.ToString("")
                        uTotal.DateCode = Convert.ToString("")
                        uTotal.UpcPrice = Convert.ToString("0")
                        uTotal.Freight = Convert.ToDecimal("0")
                        uTotal.Duties = Convert.ToDecimal("0")
                        uTotal.Comments = Convert.ToString("")
                        uTotal.CommentA = Convert.ToString("")
                        uTotal.CommentB = Convert.ToString("")
                        uTotal.CommentC = Convert.ToString("")
                        uTotal.PoStatus = Convert.ToString("")
                        uTotal.PONumber = Convert.ToString("")
                        uTotal.BGColor = Convert.ToString("")
                        uTotal.ForeColor = Convert.ToString("")
                        uTotal.SPORDID = Convert.ToString("")
                        uTotal.ORDER2ID = Convert.ToString("")
                        uTotal.GPM = Convert.ToString("0")
                        uTotal.Type = Convert.ToString("")
                        uList.Add(uTotal)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetPODetailsByPONumberFromSQL")
                Return Nothing
            End Try
        End Function

        Public Function GetPODetailsForConfirm(ByVal PONUMBER As String) As List(Of BOPO)
            Try
                Dim TotalQty As Integer = 0
                Dim TotalPrice As Double = 0
                Dim TotalUnits As Integer = 0
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of BOPO)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetPODetailsForConfirm", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@PONUMBER", PONUMBER))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BOPO()
                            u.DetailID = Convert.ToString(row("POQId"))
                            u.Farm = Convert.ToString(row("Farm"))
                            u.ProdCodeq = Convert.ToString(row("ProdCodq"))
                            u.ProdNameq = Convert.ToString(row("ProdNamq"))
                            u.BoxNumber = Convert.ToString(row("Boxnum"))
                            u.QTYBOX = Convert.ToInt32(IIf(row("QTYBOX") Is DBNull.Value, 0, row("QTYBOX")))
                            TotalQty += u.QTYBOX
                            u.UOM = Convert.ToString(row("UOM"))
                            u.QtyXBox = Convert.ToInt32(IIf(row("QtyXBox") Is DBNull.Value, 0, row("QtyXBox")))
                            u.QtyBConf = Convert.ToInt32(IIf(row("QTYBCONF") Is DBNull.Value, 0, row("QTYBCONF")))
                            u.QtyUnit = Convert.ToInt32(IIf(row("QtyUnit") Is DBNull.Value, 0, row("QtyUnit")))
                            u.UnitCosq = Convert.ToDecimal(IIf(row("UnitCosq") Is DBNull.Value, 0, row("UnitCosq")))
                            TotalPrice += (u.QtyUnit * u.UnitCosq)
                            TotalUnits += u.QtyUnit
                            u.CustNumber = Convert.ToString(row("Customer"))
                            u.PoStatus = Convert.ToString(row("ProStatus"))
                            u.PONumber = Convert.ToString(row("PONum"))
                            u.BGColor = Convert.ToString(row("BGColor"))
                            u.ForeColor = Convert.ToString(row("ForeColor"))
                            u.SPORDID = Convert.ToString(row("SPORDID"))
                            u.ORDER2ID = Convert.ToString(row("ORDER2ID"))
                            uList.Add(u)
                        Next
                        Dim uTotal As New BOPO()
                        uTotal.DetailID = Convert.ToString(0)
                        uTotal.Farm = Convert.ToString("")
                        uTotal.ProdCodeq = Convert.ToString("")
                        uTotal.ProdNameq = Convert.ToString("")
                        uTotal.BoxNumber = Convert.ToString("0")
                        uTotal.QTYBOX = Convert.ToInt32(TotalQty)
                        uTotal.UOM = Convert.ToString("")
                        uTotal.QtyXBox = Convert.ToInt32("0")
                        uTotal.QtyUnit = Convert.ToInt32(TotalUnits)
                        uTotal.UnitCosq = Convert.ToInt32("0")
                        uTotal.TotalCost = Convert.ToInt32(TotalPrice)
                        uTotal.CustNumber = Convert.ToString("")
                        uTotal.Order = Convert.ToString("0")
                        uTotal.PoStatus = Convert.ToString("")
                        uTotal.PONumber = Convert.ToString("")
                        uTotal.BGColor = Convert.ToString("")
                        uTotal.ForeColor = Convert.ToString("")
                        uTotal.SPORDID = Convert.ToString("")
                        uTotal.ORDER2ID = Convert.ToString("")
                        uList.Add(uTotal)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetPODetailsForConfirm")
                Return Nothing
            End Try
        End Function

        Public Function POListForDrop(ByVal Farm As String, ByVal PONUM As String) As List(Of BOPO)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of BOPO)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spPOListForDrop", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                        cmd.Parameters.Add(New SqlParameter("@PONUM", PONUM))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BOPO()
                            u.HeaderID = Convert.ToString(row("ID"))
                            u.PONumber = Convert.ToString(row("PONUM"))
                            u.ShipDate = Convert.ToString(row("Shipdate"))
                            u.TOTALVALUE = Convert.ToString(row("TOTVAL"))
                            uList.Add(u)
                        Next
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetPODetailsForConfirm")
                Return Nothing
            End Try
        End Function
    End Class

    Public Shared Function GetPOHistoryList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of BOPO.POHistory)
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim uList As New List(Of BOPO.POHistory)()
        Using con As New SqlConnection(ConStr)
            con.Open()
            Using cmd As New SqlCommand("[spGetPOHistory]", con)
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
                    Dim u As New BOPO.POHistory()
                    u.PONUM = row("PONUM")
                    u.LOGTEXT = "<div contenteditable='true' style='margin: 0px; width: 650px; min-height: 25px;'>" & row("LOGTEXT").ToString() & "</div>"
                    u.ADDDATE = row("ADDDATE")
                    u.ADDTIME = row("ADDTIME")
                    u.ADDUSER = row("ADDUSER")
                    u.ADDAPP = row("ADDAPP")
                    uList.Add(u)
                Next
            End Using
        End Using
        Return uList
    End Function

    Public Shared Function InsertPOHistoryLog(ByVal PONUM As String, ByVal LOGTEXT As String, ByVal ADDUSER As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spInsertPOHistory]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONUM", PONUM))
                    cmd.Parameters.Add(New SqlParameter("@LOGTEXT", LOGTEXT))
                    cmd.Parameters.Add(New SqlParameter("@ADDUSER", ADDUSER))
                    cmd.ExecuteNonQuery()
                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in InsertPOHistoryLog")
            Return "error"
        End Try
    End Function
#Region "All Purchase"
    Public Shared Function LoadAllFiltersDataForAllPurchase(ByVal Fromdate As String, ByVal Todate As String, ByVal isCargo As Boolean, ByVal Buyer As String, ByVal Farm As String, ByVal Origin As String, ByVal Status As String, ByVal Prod As String, ByVal Uom As String, ByVal Cust As String) As List(Of BOPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim polst As New List(Of BOPO)

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spLoadAllFiltersDataForAllPurchase", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Fromdate", Fromdate)
                    cmd.Parameters.AddWithValue("@Todate", Todate)
                    cmd.Parameters.AddWithValue("@IsCargo", isCargo)
                    cmd.Parameters.AddWithValue("@Buyer", Buyer)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.Parameters.AddWithValue("@Origin", Origin)
                    cmd.Parameters.AddWithValue("@Status", Status)
                    cmd.Parameters.AddWithValue("@Prod", Prod)
                    cmd.Parameters.AddWithValue("@Uom", Uom)
                    cmd.Parameters.AddWithValue("@Cust", Cust)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOPO()

                        u.PONumber = row("PONumber")
                        u.Farm = row("FARM")
                        u.FarmName = row("FARMNAME")
                        u.FarmDetails.City = row("ORIGEN")
                        u.Airport = row("AIRPORT")
                        u.CustSHDate = row("TRUCKDATE")
                        u.ShipDate = row("SHIPDATE")
                        u.PassName = row("PASSNAME")
                        u.PROStatus = row("POSTAT")
                        u.ProdCodeq = row("PRODCODQ")
                        u.ProdNameq = row("PRODNAMQ")
                        u.UOM = row("UOM")
                        u.CustNumber = row("CUSTOMER")
                        'u.Custname = row("CUSTNAME")
                        polst.Add(u)
                    Next
                End Using
            End Using
            Return polst
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadAllFiltersDataForAllPurchase")
            Return Nothing
        End Try
    End Function

    Public Shared Function LoadAllFiltersDataForPOList(ByVal Fromdate As String, ByVal Todate As String, ByVal Buyer As String, ByVal Farm As String, ByVal Origin As String, ByVal Status As String, ByVal isCargo As String) As List(Of BOPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim polst As New List(Of BOPO)

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spLoadAllFiltersDataForPOList", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Fromdate", Fromdate)
                    cmd.Parameters.AddWithValue("@Todate", Todate)
                    cmd.Parameters.AddWithValue("@Buyer", Buyer)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.Parameters.AddWithValue("@Origin", Origin)
                    cmd.Parameters.AddWithValue("@Status", Status)
                    cmd.Parameters.AddWithValue("@IsCargo", isCargo)

                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOPO()

                        u.PONumber = row("PONumber")
                        u.Farm = row("FARM")
                        u.FarmName = row("FARMNAME")
                        u.FarmDetails.City = row("ORIGEN")
                        u.Airport = row("AIRPORT")
                        u.CustSHDate = row("TRUCKDATE")
                        u.ShipDate = row("SHIPDATE")
                        u.PassName = row("PASSNAME")
                        u.PROStatus = row("POSTAT")
                        u.ProdCodeq = row("PRODCODQ")
                        u.ProdNameq = row("PRODNAMQ")
                        u.UOM = row("UOM")
                        u.CustNumber = row("CUSTOMER")
                        polst.Add(u)
                    Next
                End Using
            End Using
            Return polst
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadAllFiltersDataForPOList")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetAllPurchasesGrid(ByVal Fromdate As String, ByVal Todate As String, ByVal isCargo As Boolean, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer, ByVal Buyer As String, ByVal Farm As String, ByVal Origin As String, ByVal Status As String, ByVal Prod As String, ByVal Uom As String, ByVal Cust As String) As Tuple(Of DataSet, String)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataSet()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim DbfQry As String = ""
                DbfQry = "spLoadDataForAllPurchases"
                Using Cmd As New SqlCommand(DbfQry, Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@Fromdate", Fromdate)
                    Cmd.Parameters.AddWithValue("@Todate", Todate)
                    Cmd.Parameters.AddWithValue("@IsCargo", isCargo)
                    Cmd.Parameters.AddWithValue("@Buyer", Buyer)
                    Cmd.Parameters.AddWithValue("@Farm", Farm)
                    Cmd.Parameters.AddWithValue("@Origin", Origin)
                    Cmd.Parameters.AddWithValue("@Status", Status)
                    Cmd.Parameters.AddWithValue("@Prod", Prod)
                    Cmd.Parameters.AddWithValue("@Uom", Uom)
                    Cmd.Parameters.AddWithValue("@Cust", Cust)
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt)
                    If dt.Tables(0).Rows.Count > 0 Then
                        Dim R As DataRow = dt.Tables(0).NewRow
                        For j As Integer = 0 To dt.Tables(0).Columns.Count - 1
                            Dim getdatatype = dt.Tables(0).Columns(j).DataType.ToString().ToLower()
                            If getdatatype = "system.int32".ToLower() Then
                                R(j) = Convert.ToInt32(0)
                            ElseIf getdatatype = "system.string".ToLower() Then
                                R(j) = ""
                            ElseIf getdatatype = "system.decimal".ToLower() Then
                                R(j) = Convert.ToDecimal(0.00)
                            ElseIf getdatatype = "system.datetime".ToLower() Then
                                R(j) = DateTime.Now
                            ElseIf getdatatype = "system.Boolean".ToLower() Then
                                R(j) = False
                            End If

                            If (dt.Tables(0).Columns(j)).ColumnName = "PONumber" Then
                                R(j) = "0"
                            End If
                        Next
                        dt.Tables(0).Rows.Add(R)
                    End If
                End Using
            End Using
            Dim result As New Tuple(Of DataSet, String)(dt, "success")
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAllPurchasesGrid")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in GetAllPurchasesGrid")
            Return result
        End Try
    End Function
#End Region

#Region "Create PO"
    Public Shared Function LoadDataForCreatePOGrid(ByVal SalesPerson As String) As Tuple(Of DataSet, String)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataSet()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim DbfQry As String = ""
                DbfQry = "spLoadDataForCreatePO"
                Using Cmd As New SqlCommand(DbfQry, Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.Add(New SqlParameter("@SALESMAN", SalesPerson))
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt)
                    If dt.Tables(0).Rows.Count > 0 Then
                        Dim R As DataRow = dt.Tables(0).NewRow
                        For j As Integer = 0 To dt.Tables(0).Columns.Count - 1
                            Dim getdatatype = dt.Tables(0).Columns(j).DataType.ToString().ToLower()
                            If getdatatype = "system.int32".ToLower() Then
                                R(j) = Convert.ToInt32(0)
                            ElseIf getdatatype = "system.string".ToLower() Then
                                R(j) = ""
                            ElseIf getdatatype = "system.decimal".ToLower() Then
                                R(j) = Convert.ToDecimal(0.00)
                            ElseIf getdatatype = "system.datetime".ToLower() Then
                                R(j) = DateTime.Now
                            ElseIf getdatatype = "system.Boolean".ToLower() Then
                                R(j) = False
                            End If

                            If (dt.Tables(0).Columns(j)).ColumnName = "ID" Then
                                R(j) = "0"
                            End If
                        Next
                        dt.Tables(0).Rows.Add(R)
                    End If
                End Using
            End Using
            Dim result As New Tuple(Of DataSet, String)(dt, "success")
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadDataForCreatePOGrid")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in LoadDataForCreatePOGrid")
            Return result
        End Try
    End Function
    Public Shared Function LoadCreatePODropdowns(ByVal sqlId As Integer, ByVal mode As Integer, ByVal origin As String, ByVal SaveFlag As String) As List(Of SPORDD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim f8lst As New List(Of SPORDD)

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spLoadCreatePODropdowns", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter()
                    Dim ds As New DataSet
                    ''pass sql id for all mode cases
                    cmd.Parameters.AddWithValue("@sqlId", sqlId)
                    If mode = 1 Then
                        cmd.Parameters.AddWithValue("@mode", mode)
                        cmd.Parameters.AddWithValue("@SaveFlag", SaveFlag)
                        da = New SqlDataAdapter(cmd)
                        ds = New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New SPORDD()
                            'u.SpordID = row("ID")
                            'u.Farm = row("FARM")
                            u.UOM = row("UOM")
                            u.UOMSize = row("Size")
                            'u.CargoDate = row("CargoDate")
                            'u.Carrier = row("CARRIER")
                            'u.Agency = row("AGENCY")
                            u.WH = row("WH")
                            'u.FarmDetails.City = row("ORIGIN")
                            f8lst.Add(u)
                        Next
                    ElseIf mode = 2 Then
                        cmd.Parameters.AddWithValue("@mode", mode)
                        da = New SqlDataAdapter(cmd)
                        ds = New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New SPORDD()
                            u.AirportDetails.AirportID = row("AIRPORTID")
                            u.AirportDetails.Airport = row("AIRPORT")
                            u.AirportDetails.Name = row("AIRPORTNAME")

                            If (row("COUNTRY") = "" Or row("COUNTRY") Is DBNull.Value) Then
                                u.AirportDetails.Country = "**"
                            Else
                                u.AirportDetails.Country = row("COUNTRY")
                            End If
                            f8lst.Add(u)
                        Next
                    ElseIf mode = 3 Then
                        cmd.Parameters.AddWithValue("@mode", mode)
                        cmd.Parameters.AddWithValue("@origin", origin)
                        da = New SqlDataAdapter(cmd)
                        ds = New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New SPORDD()
                            u.FarmDetails.ID = row("FARMID")
                            u.FarmDetails.Farm = row("FARM")
                            u.FarmDetails.City = row("CITY")
                            u.FarmDetails.Name = row("FARMNAME")
                            f8lst.Add(u)
                        Next
                    ElseIf mode = 4 Then
                        cmd.Parameters.AddWithValue("@mode", mode)
                        da = New SqlDataAdapter(cmd)
                        ds = New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New SPORDD()
                            u.CarrierDetails.ID = row("ID")
                            u.CarrierDetails.Carrier = row("CARRIER")
                            u.CarrierDetails.Name = row("CARRIERNAME")
                            f8lst.Add(u)
                        Next
                    End If
                End Using
            End Using
            Return f8lst
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadCreatePODropdowns")
            Return Nothing
        End Try
    End Function

    Public Shared Function CreatePOPurchase(ByVal SPORDID As String, ByVal Farm As String, ByVal Flower As String, ByVal Boxes As String, ByVal UOM As String, ByVal UnitsPerBunch As String, ByVal UnitsPerBox As String,
                                     ByVal CostPerUnits As String, ByVal Type As String, ByVal BoxCode As String, ByVal FarmComm1 As String, ByVal FarmComm2 As String,
                                     ByVal InternalComment As String, ByVal UPC As String, ByVal Description As String, ByVal DateCode As String, ByVal UPCPrice As String, ByVal User As String, ByVal PONumber As String,
                                     ByVal SalesValue As String, ByVal Carrier As String, ByVal ShipDate As String, ByVal Status As String, ByVal Airport As String, ByVal WH As String,
                                     ByVal Freight As String, ByVal Handling As String, ByVal Andean As String, ByVal Price As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spCreatePOPurchase", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@SPORDID", SPORDID))
                    cmd.Parameters.Add(New SqlParameter("@PONumber", PONumber))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@Flower", Flower))
                    cmd.Parameters.Add(New SqlParameter("@Boxes", Boxes))
                    cmd.Parameters.Add(New SqlParameter("@UOM", UOM))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBunch", UnitsPerBunch))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBox", UnitsPerBox))
                    cmd.Parameters.Add(New SqlParameter("@CostPerUnits", CostPerUnits))
                    cmd.Parameters.Add(New SqlParameter("@Type", Type))
                    cmd.Parameters.Add(New SqlParameter("@FarmComm1", FarmComm1))
                    cmd.Parameters.Add(New SqlParameter("@FarmComm2", FarmComm2))
                    cmd.Parameters.Add(New SqlParameter("@InternalComment", InternalComment))
                    cmd.Parameters.Add(New SqlParameter("@UPC", UPC))
                    cmd.Parameters.Add(New SqlParameter("@Description", Description))
                    cmd.Parameters.Add(New SqlParameter("@DateCode", DateCode))
                    cmd.Parameters.Add(New SqlParameter("@UPCPrice", UPCPrice))
                    cmd.Parameters.Add(New SqlParameter("@BoxCode", BoxCode))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.Parameters.Add(New SqlParameter("@Status", Status))
                    cmd.Parameters.Add(New SqlParameter("@ShipDate", ShipDate))
                    cmd.Parameters.Add(New SqlParameter("@SalesValue", SalesValue))
                    cmd.Parameters.Add(New SqlParameter("@Carrier", Carrier))
                    cmd.Parameters.Add(New SqlParameter("@Airport", Airport))
                    cmd.Parameters.Add(New SqlParameter("@Warehouse", WH))
                    cmd.Parameters.Add(New SqlParameter("@Freight", Freight))
                    cmd.Parameters.Add(New SqlParameter("@Handling", Handling))
                    cmd.Parameters.Add(New SqlParameter("@Andean", Andean))
                    cmd.Parameters.Add(New SqlParameter("@Price", Price))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CreatePOPurchase")
            Return "error"
        End Try
    End Function

    Public Shared Function CreatePOPurchaseForOrder(ByVal SQLId As String, ByVal Farm As String, ByVal Flower As String, ByVal Boxes As String, ByVal UOM As String, ByVal UnitsPerBunch As String, ByVal UnitsPerBox As String,
                                     ByVal CostPerUnits As String, ByVal Type As String, ByVal BoxCode As String, ByVal FarmComm1 As String, ByVal FarmComm2 As String,
                                     ByVal InternalComment As String, ByVal UPC As String, ByVal Description As String, ByVal DateCode As String, ByVal UPCPrice As String, ByVal User As String, ByVal PONumber As String,
                                     ByVal SalesValue As String, ByVal Carrier As String, ByVal ShipDate As String, ByVal Status As String, ByVal Airport As String, ByVal WH As String,
                                     ByVal Freight As String, ByVal Handling As String, ByVal Andean As String, ByVal Price As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spCreatePOPurchaseFromOrder", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@OrDetId", SQLId))
                    cmd.Parameters.Add(New SqlParameter("@PONumber", PONumber))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@Flower", Flower))
                    cmd.Parameters.Add(New SqlParameter("@Boxes", Boxes))
                    cmd.Parameters.Add(New SqlParameter("@UOM", UOM))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBunch", UnitsPerBunch))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBox", UnitsPerBox))
                    cmd.Parameters.Add(New SqlParameter("@CostPerUnits", CostPerUnits))
                    cmd.Parameters.Add(New SqlParameter("@Type", Type))
                    cmd.Parameters.Add(New SqlParameter("@FarmComm1", FarmComm1))
                    cmd.Parameters.Add(New SqlParameter("@FarmComm2", FarmComm2))
                    cmd.Parameters.Add(New SqlParameter("@InternalComment", InternalComment))
                    cmd.Parameters.Add(New SqlParameter("@UPC", UPC))
                    cmd.Parameters.Add(New SqlParameter("@Description", Description))
                    cmd.Parameters.Add(New SqlParameter("@DateCode", DateCode))
                    cmd.Parameters.Add(New SqlParameter("@UPCPrice", UPCPrice))
                    cmd.Parameters.Add(New SqlParameter("@BoxCode", BoxCode))
                    cmd.Parameters.Add(New SqlParameter("@User", User))
                    cmd.Parameters.Add(New SqlParameter("@Status", Status))
                    cmd.Parameters.Add(New SqlParameter("@ShipDate", ShipDate))
                    cmd.Parameters.Add(New SqlParameter("@SalesValue", SalesValue))
                    cmd.Parameters.Add(New SqlParameter("@Carrier", Carrier))
                    cmd.Parameters.Add(New SqlParameter("@Airport", Airport))
                    cmd.Parameters.Add(New SqlParameter("@Warehouse", WH))
                    cmd.Parameters.Add(New SqlParameter("@Freight", Freight))
                    cmd.Parameters.Add(New SqlParameter("@Handling", Handling))
                    cmd.Parameters.Add(New SqlParameter("@Andean", Andean))
                    cmd.Parameters.Add(New SqlParameter("@Price", Price))
                    Result = cmd.ExecuteScalar()
                End Using
            End Using
            Return Result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CreatePOPurchase")
            Return "error"
        End Try
    End Function

    '''' <summary>
    '''' Fitri (20190516): Gets the new PONUM to insert in F_POH and F_POQ for Split PO.
    '''' It checks and modifies data in table tblPONUMSplit in SQL Server.
    '''' </summary>
    '''' <param name="ponum">Original PONUM</param>
    '''' <returns>New PONUM based on the values in the table</returns>
    'Private Shared Function GetNewPONUMForSplit(ponum As String) As String
    '    Try
    '        Dim ponumOri As String = ponum.Split("*")(0)
    '        Dim ponumNew As String = ""
    '        Dim sqlConStr As String = ConfigurationManager.ConnectionStrings.Item("DFlowerConnectionString").ToString
    '        Dim dt As New DataTable

    '        Using sqlCon As New SqlConnection(sqlConStr)
    '            sqlCon.Open()

    '            Using sqlCmd As New SqlCommand("[sp_GetNewPONUMForSplit]", sqlCon)
    '                sqlCmd.CommandType = CommandType.StoredProcedure
    '                sqlCmd.Parameters.Add(New SqlParameter("@PONUM", ponumOri))

    '                Dim dr As SqlDataReader = sqlCmd.ExecuteReader()

    '                dt.Load(dr)

    '            End Using
    '        End Using

    '        ponumNew = dt.Rows(0)(2).ToString()

    '        Return ponumNew

    '    Catch ex As Exception
    '        Throw ex
    '    End Try
    'End Function

    ''' <summary>
    ''' STA::To Split the POD details
    ''' Last updated by Fitri: May 16, 2019
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function SplitPurchaseOrder(ByVal POQId As Integer, ByVal TotBoxes As Integer, SplittingBox As Integer, ByVal QTYXBOX As String,
                                             ByVal ProductCode As String, ByVal ProductName As String, ByVal BreakDownText As String,
                                              ByVal Farm As String, ByVal ShipDate As String, ByVal UserName As String) As String

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            ''Dim Result As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spSplitPurchaseOrder", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@POQId", POQId))
                    cmd.Parameters.Add(New SqlParameter("@TotBoxes", TotBoxes))
                    cmd.Parameters.Add(New SqlParameter("@SplittingBox", SplittingBox))
                    cmd.Parameters.Add(New SqlParameter("@QTYXBOX", QTYXBOX))
                    cmd.Parameters.Add(New SqlParameter("@ProductCode", ProductCode))
                    cmd.Parameters.Add(New SqlParameter("@ProductName", ProductName))
                    cmd.Parameters.Add(New SqlParameter("@BreakDownText", BreakDownText))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@ShipDate", ShipDate))
                    cmd.Parameters.Add(New SqlParameter("@UserName", UserName))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SplitPurchaseOrder")
            Return "error"
        End Try
    End Function
#End Region
End Class


Public Class BOPO
    Private _Emailed As Boolean
    Public Property Emailed() As Boolean
        Get
            Return _Emailed
        End Get
        Set(ByVal value As Boolean)
            _Emailed = value
        End Set
    End Property
    Private _IsDiffQty As Boolean
    Public Property IsDiffQty() As Integer
        Get
            Return _IsDiffQty
        End Get
        Set(ByVal value As Integer)
            _IsDiffQty = value
        End Set
    End Property
    Private _Totalrb As Integer
    Public Property Totalrb() As Integer
        Get
            Return _Totalrb
        End Get
        Set(ByVal value As Integer)
            _Totalrb = value
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

    Private _TotalRows As Integer
    Public Property TotalRows() As Integer
        Get
            Return _TotalRows
        End Get
        Set(ByVal value As Integer)
            _TotalRows = value
        End Set
    End Property

    Private _QtyConfBox As Integer
    Public Property QtyConfBox() As Integer
        Get
            Return _QtyConfBox
        End Get
        Set(ByVal value As Integer)
            _QtyConfBox = value
        End Set
    End Property

    Private _QtyBConf As Integer
    Public Property QtyBConf() As Integer
        Get
            Return _QtyBConf
        End Get
        Set(ByVal value As Integer)
            _QtyBConf = value
        End Set
    End Property

    Private _Length As String
    Public Property Length() As String
        Get
            Return _Length
        End Get
        Set(ByVal value As String)
            _Length = value
        End Set
    End Property

    Private _Height As String
    Public Property Height() As String
        Get
            Return _Height
        End Get
        Set(ByVal value As String)
            _Height = value
        End Set
    End Property

    Private _Width As String
    Public Property Width() As String
        Get
            Return _Width
        End Get
        Set(ByVal value As String)
            _Width = value
        End Set
    End Property

    Private _FlowerFlag As Boolean
    Public Property FlowerFlag() As Boolean
        Get
            Return _FlowerFlag
        End Get
        Set(ByVal value As Boolean)
            _FlowerFlag = value
        End Set
    End Property

    Private _HeaderID As Integer
    Public Property HeaderID() As Integer
        Get
            Return _HeaderID
        End Get
        Set(ByVal value As Integer)
            _HeaderID = value
        End Set
    End Property

    Private _DetailID As Integer
    Public Property DetailID() As Integer
        Get
            Return _DetailID
        End Get
        Set(ByVal value As Integer)
            _DetailID = value
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

    Private _Flower As String
    Public Property Flower() As String
        Get
            Return _Flower
        End Get
        Set(ByVal value As String)
            _Flower = value
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

    Private _Description As String
    Public Property Description() As String
        Get
            Return _Description
        End Get
        Set(ByVal value As String)
            _Description = value
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

    Private _UOM As String
    Public Property UOM() As String
        Get
            Return _UOM
        End Get
        Set(ByVal value As String)
            _UOM = value
        End Set
    End Property

    Private _Bunches As String
    Public Property Bunches() As String
        Get
            Return _Bunches
        End Get
        Set(ByVal value As String)
            _Bunches = value
        End Set
    End Property

    Private _UnitsPerBunch As Integer
    Public Property UnitsPerBunch() As Integer
        Get
            Return _UnitsPerBunch
        End Get
        Set(ByVal value As Integer)
            _UnitsPerBunch = value
        End Set
    End Property

    Private _UnitsPerBox As Integer
    Public Property UnitsPerBox() As Integer
        Get
            Return _UnitsPerBox
        End Get
        Set(ByVal value As Integer)
            _UnitsPerBox = value
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

    Private _TotalUnitsPerBox As Integer
    Public Property TotalUnitsPerBox() As Integer
        Get
            Return _TotalUnitsPerBox
        End Get
        Set(ByVal value As Integer)
            _TotalUnitsPerBox = value
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

    Private _TotalCost As Decimal
    Public Property TotalCost() As Decimal
        Get
            Return _TotalCost
        End Get
        Set(ByVal value As Decimal)
            _TotalCost = value
        End Set
    End Property

    Private _Comments As String
    Public Property Comments() As String
        Get
            Return _Comments
        End Get
        Set(ByVal value As String)
            _Comments = value
        End Set
    End Property

    Private _CustNumber As String
    Public Property CustNumber() As String
        Get
            Return _CustNumber
        End Get
        Set(ByVal value As String)
            _CustNumber = value
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

    Private _CustomerPO As String
    Public Property CustomerPO() As String
        Get
            Return _CustomerPO
        End Get
        Set(ByVal value As String)
            _CustomerPO = value
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

    Private _HAWB As String
    Public Property HAWB() As String
        Get
            Return _HAWB
        End Get
        Set(ByVal value As String)
            _HAWB = value
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

    Private _OrderNumber As String
    Public Property OrderNumber() As String
        Get
            Return _OrderNumber
        End Get
        Set(ByVal value As String)
            _OrderNumber = value
        End Set
    End Property


    Private _Flowername As String
    Public Property Flowername() As String
        Get
            Return _Flowername
        End Get
        Set(ByVal value As String)
            _Flowername = value
        End Set
    End Property

    Private _ColorCode As String
    Public Property ColorCode() As String
        Get
            Return _ColorCode
        End Get
        Set(ByVal value As String)
            _ColorCode = value
        End Set
    End Property

    Private _POSelected As Boolean
    Public Property POSelected() As String
        Get
            Return _POSelected
        End Get
        Set(ByVal value As String)
            _POSelected = value
        End Set
    End Property

    Private _FlowerCategory As String
    Public Property FlowerCategory() As String
        Get
            Return _FlowerCategory
        End Get
        Set(ByVal value As String)
            _FlowerCategory = value
        End Set
    End Property

    Private _ManufacID As String
    Public Property ManufacID() As String
        Get
            Return _ManufacID
        End Get
        Set(ByVal value As String)
            _ManufacID = value
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

    Private _BoxCode As String
    Public Property BoxCode() As String
        Get
            Return _BoxCode
        End Get
        Set(ByVal value As String)
            _BoxCode = value
        End Set
    End Property

    Private _BoxNumber As String
    Public Property BoxNumber() As String
        Get
            Return _BoxNumber
        End Get
        Set(ByVal value As String)
            _BoxNumber = value
        End Set
    End Property

    Private _PurchaseType As String
    Public Property PurchaseType() As String
        Get
            Return _PurchaseType
        End Get
        Set(ByVal value As String)
            _PurchaseType = value
        End Set
    End Property

    Private _ShipDate As String
    Public Property ShipDate() As String
        Get
            Return _ShipDate
        End Get
        Set(ByVal value As String)
            _ShipDate = value
        End Set
    End Property

    Private _BreakDown As String
    Public Property BreakDown() As String
        Get
            Return _BreakDown
        End Get
        Set(ByVal value As String)
            _BreakDown = value
        End Set
    End Property

    Private _FlowrDetails As New Flower
    Public Property FlowrDetails() As Flower
        Get
            Return _FlowrDetails
        End Get
        Set(value As Flower)
            _FlowrDetails = value
        End Set
    End Property

    Private _Scanned As Integer
    Public Property Scanned As Integer
        Get
            Return _Scanned
        End Get
        Set(value As Integer)
            _Scanned = value
        End Set
    End Property

    Property _Missing As Integer
    Public Property Missing As Integer
        Get
            Return _Missing
        End Get
        Set(value As Integer)
            _Missing = value
        End Set
    End Property

    Property _DifferentBoxes As Integer
    Public Property DifferentBoxes As Integer
        Get
            Return _DifferentBoxes
        End Get
        Set(value As Integer)
            _DifferentBoxes = value
        End Set
    End Property

    Private _InvenType As String
    Public Property InvenType() As String
        Get
            Return _InvenType
        End Get
        Set(ByVal value As String)
            _InvenType = value
        End Set
    End Property

    Private _ForeColor As String
    Public Property ForeColor() As String
        Get
            Return _ForeColor
        End Get
        Set(ByVal value As String)
            _ForeColor = value
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

    Private _PoStatus As String
    Public Property PoStatus() As String
        Get
            Return _PoStatus
        End Get
        Set(ByVal value As String)
            _PoStatus = value
        End Set
    End Property

    Private _CancelVoidReason As String
    Public Property CancelVoidReason() As String
        Get
            Return _CancelVoidReason
        End Get
        Set(ByVal value As String)
            _CancelVoidReason = value
        End Set
    End Property

    Private _Ord As String
    Public Property Ord() As String
        Get
            Return _Ord
        End Get
        Set(ByVal value As String)
            _Ord = value
        End Set
    End Property

    Private _ProdCodeq As String
    Public Property ProdCodeq() As String
        Get
            Return _ProdCodeq
        End Get
        Set(ByVal value As String)
            _ProdCodeq = value
        End Set
    End Property

    Private _ProdNameq As String
    Public Property ProdNameq() As String
        Get
            Return _ProdNameq
        End Get
        Set(ByVal value As String)
            _ProdNameq = value
        End Set
    End Property

    Private _QTYBOX As Integer
    Public Property QTYBOX() As Integer
        Get
            Return _QTYBOX
        End Get
        Set(ByVal value As Integer)
            _QTYBOX = value
        End Set
    End Property

    Private _QtyXBox As Integer
    Public Property QtyXBox() As Integer
        Get
            Return _QtyXBox
        End Get
        Set(ByVal value As Integer)
            _QtyXBox = value
        End Set
    End Property

    Private _QtyUnit As Integer
    Public Property QtyUnit() As Integer
        Get
            Return _QtyUnit
        End Get
        Set(ByVal value As Integer)
            _QtyUnit = value
        End Set
    End Property

    Private _UnitSalq As Decimal
    Public Property UnitSalq() As Decimal
        Get
            Return _UnitSalq
        End Get
        Set(ByVal value As Decimal)
            _UnitSalq = value
        End Set
    End Property

    Private _UnitCosq As Decimal
    Public Property UnitCosq() As Decimal
        Get
            Return _UnitCosq
        End Get
        Set(ByVal value As Decimal)
            _UnitCosq = value
        End Set
    End Property

    Private _StemXBun As Integer
    Public Property StemXBun() As Integer
        Get
            Return _StemXBun
        End Get
        Set(ByVal value As Integer)
            _StemXBun = value
        End Set
    End Property

    Private _BunXBox As Integer
    Public Property BunXBox() As Integer
        Get
            Return _BunXBox
        End Get
        Set(ByVal value As Integer)
            _BunXBox = value
        End Set
    End Property



    Private _CustSHDate As String
    Public Property CustSHDate() As String
        Get
            Return _CustSHDate
        End Get
        Set(ByVal value As String)
            _CustSHDate = value
        End Set
    End Property

    Private _Day As String
    Public Property Day() As String
        Get
            Return _Day
        End Get
        Set(ByVal value As String)
            _Day = value
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

    Private _Order As String
    Public Property Order() As String
        Get
            Return _Order
        End Get
        Set(ByVal value As String)
            _Order = value
        End Set
    End Property

    Private _Brand As String
    Public Property Brand() As String
        Get
            Return _Brand
        End Get
        Set(ByVal value As String)
            _Brand = value
        End Set
    End Property

    Private _Upc As String
    Public Property Upc() As String
        Get
            Return _Upc
        End Get
        Set(ByVal value As String)
            _Upc = value
        End Set
    End Property

    Private _UpcDesc As String
    Public Property UpcDesc() As String
        Get
            Return _UpcDesc
        End Get
        Set(ByVal value As String)
            _UpcDesc = value
        End Set
    End Property

    Private _FoodDesc As String
    Public Property FoodDesc() As String
        Get
            Return _FoodDesc
        End Get
        Set(ByVal value As String)
            _FoodDesc = value
        End Set
    End Property

    Private _PickDesc As String
    Public Property PickDesc() As String
        Get
            Return _PickDesc
        End Get
        Set(ByVal value As String)
            _PickDesc = value
        End Set
    End Property

    Private _SleeveDesc As String
    Public Property SleeveDesc() As String
        Get
            Return _SleeveDesc
        End Get
        Set(ByVal value As String)
            _SleeveDesc = value
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

    Private _UpcPrice As String
    Public Property UpcPrice() As String
        Get
            Return _UpcPrice
        End Get
        Set(ByVal value As String)
            _UpcPrice = value
        End Set
    End Property

    Private _Freight As Decimal
    Public Property Freight() As Decimal
        Get
            Return _Freight
        End Get
        Set(ByVal value As Decimal)
            _Freight = value
        End Set
    End Property


    Private _Duties As Decimal
    Public Property Duties() As Decimal
        Get
            Return _Duties
        End Get
        Set(ByVal value As Decimal)
            _Duties = value
        End Set
    End Property

    Private _CommentA As String
    Public Property CommentA() As String
        Get
            Return _CommentA
        End Get
        Set(ByVal value As String)
            _CommentA = value
        End Set
    End Property

    Private _CommentB As String
    Public Property CommentB() As String
        Get
            Return _CommentB
        End Get
        Set(ByVal value As String)
            _CommentB = value
        End Set
    End Property

    Private _CommentC As String
    Public Property CommentC() As String
        Get
            Return _CommentC
        End Get
        Set(ByVal value As String)
            _CommentC = value
        End Set
    End Property

    Private _PONumber As String
    Public Property PONumber() As String
        Get
            Return _PONumber
        End Get
        Set(ByVal value As String)
            _PONumber = value
        End Set
    End Property


    Private _POType As String
    Public Property POType() As String
        Get
            Return _POType
        End Get
        Set(ByVal value As String)
            _POType = value
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

    Private _Carrier As String
    Public Property Carrier() As String
        Get
            Return _Carrier
        End Get
        Set(ByVal value As String)
            _Carrier = value
        End Set
    End Property


    Private _PassName As String
    Public Property PassName() As String
        Get
            Return _PassName
        End Get
        Set(ByVal value As String)
            _PassName = value
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


    Private _GPM As Decimal
    Public Property GPM() As Decimal
        Get
            Return _GPM
        End Get
        Set(ByVal value As Decimal)
            _GPM = value
        End Set
    End Property


    Private _PODate As String
    Public Property PODate() As String
        Get
            Return _PODate
        End Get
        Set(ByVal value As String)
            _PODate = value
        End Set
    End Property

    Private _PROStatus As String
    Public Property PROStatus() As String
        Get
            Return _PROStatus
        End Get
        Set(ByVal value As String)
            _PROStatus = value
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

    Private _BOXESFBE As Decimal
    Public Property BOXESFBE() As Decimal
        Get
            Return _BOXESFBE
        End Get
        Set(value As Decimal)
            _BOXESFBE = value
        End Set
    End Property

    Private _RECEIVEDBOXES As Integer
    Public Property RECEIVEDBOXES() As Integer
        Get
            Return _RECEIVEDBOXES
        End Get
        Set(value As Integer)
            _RECEIVEDBOXES = value
        End Set
    End Property

    Private _TOTALVALUE As Decimal
    Public Property TOTALVALUE() As Decimal
        Get
            Return _TOTALVALUE
        End Get
        Set(value As Decimal)
            _TOTALVALUE = value
        End Set
    End Property

    Private _SALESVALUE As Decimal
    Public Property SALESVALUE() As Decimal
        Get
            Return _SALESVALUE
        End Get
        Set(value As Decimal)
            _SALESVALUE = value
        End Set
    End Property

    Private _POTOTAL As Decimal
    Public Property POTOTAL() As Decimal
        Get
            Return _POTOTAL
        End Get
        Set(value As Decimal)
            _POTOTAL = value
        End Set
    End Property

    Private _ISDBFDATA As String
    Public Property ISDBFDATA() As String
        Get
            Return _ISDBFDATA
        End Get
        Set(value As String)
            _ISDBFDATA = value
        End Set
    End Property

    Private _ADDDATE As Date
    Public Property ADDDATE() As Date
        Get
            Return _ADDDATE
        End Get
        Set(value As Date)
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
        Set(value As String)
            _ADDAPP = value
        End Set
    End Property

    Private _ADDUSER As String
    Public Property ADDUSER() As String
        Get
            Return _ADDUSER
        End Get
        Set(value As String)
            _ADDUSER = value
        End Set
    End Property
    Private _UPDDATE As Date
    Public Property UPDDATE() As Date
        Get
            Return _UPDDATE
        End Get
        Set(value As Date)
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
        Set(value As String)
            _UPDAPP = value
        End Set
    End Property

    Private _UPDUSER As String
    Public Property UPDUSER() As String
        Get
            Return _UPDUSER
        End Get
        Set(value As String)
            _UPDUSER = value
        End Set
    End Property
    Private _FarmDetails As New Farm
    Public Property FarmDetails() As Farm
        Get
            Return _FarmDetails
        End Get
        Set(value As Farm)
            _FarmDetails = value
        End Set
    End Property

    Private _SPORDID As String
    Public Property SPORDID() As String
        Get
            Return _SPORDID
        End Get
        Set(ByVal value As String)
            _SPORDID = value
        End Set
    End Property

    Private _ORDER2ID As String
    Public Property ORDER2ID() As String
        Get
            Return _ORDER2ID
        End Get
        Set(ByVal value As String)
            _ORDER2ID = value
        End Set
    End Property

    Private _FOB As String
    Public Property FOB() As String
        Get
            Return _FOB
        End Get
        Set(ByVal value As String)
            _FOB = value
        End Set
    End Property

    '' Added by Anubhuti
    Private _bouquetImagePath As String
    Public Property bouquetImagePath() As String
        Get
            Return _bouquetImagePath
        End Get
        Set(ByVal value As String)
            _bouquetImagePath = value
        End Set
    End Property
    Private _FoodImagePath As String
    Public Property FoodImagePath() As String
        Get
            Return _FoodImagePath
        End Get
        Set(ByVal value As String)
            _FoodImagePath = value
        End Set
    End Property
    Private _SleeveImagePath As String
    Public Property SleeveImagePath() As String
        Get
            Return _SleeveImagePath
        End Get
        Set(ByVal value As String)
            _SleeveImagePath = value
        End Set
    End Property
    Private _PickImagePath As String
    Public Property PickImagePath() As String
        Get
            Return _PickImagePath
        End Get
        Set(ByVal value As String)
            _PickImagePath = value
        End Set
    End Property
    ''Name Img

    Private _ImgbouquetName As String
    Public Property ImgbouquetName() As String
        Get
            Return _ImgbouquetName
        End Get
        Set(ByVal value As String)
            _ImgbouquetName = value
        End Set
    End Property
    Private _ImgFoodName As String
    Public Property ImgFoodName() As String
        Get
            Return _ImgFoodName
        End Get
        Set(ByVal value As String)
            _ImgFoodName = value
        End Set
    End Property
    Private _ImgSleeveName As String
    Public Property ImgSleeveName() As String
        Get
            Return _ImgSleeveName
        End Get
        Set(ByVal value As String)
            _ImgSleeveName = value
        End Set
    End Property
    Private _ImgPickName As String
    Public Property ImgPickName() As String
        Get
            Return _ImgPickName
        End Get
        Set(ByVal value As String)
            _ImgPickName = value
        End Set
    End Property
    ''

    Public Class POHistory

        'CUSTOMER int,DATE Date,TIME varchar(20),NOTE varchar(128),PERSON varchar(10)

        Private _PONUM As String
        Public Property PONUM() As String
            Get
                Return _PONUM
            End Get
            Set(ByVal value As String)
                _PONUM = value
            End Set
        End Property

        Private _LogText As String
        Public Property LOGTEXT() As String
            Get
                Return _LogText
            End Get
            Set(value As String)
                _LogText = value
            End Set
        End Property

        Private _ADDDATE As Date
        Public Property ADDDATE() As Date
            Get
                Return _ADDDATE
            End Get
            Set(value As Date)
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
            Set(value As String)
                _ADDAPP = value
            End Set
        End Property

        Private _ADDUSER As String
        Public Property ADDUSER() As String
            Get
                Return _ADDUSER
            End Get
            Set(value As String)
                _ADDUSER = value
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

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

    End Class


End Class

Public Class BOPurchaseOrder

    Private _CUSTOMERPO As String
    Public Property CUSTOMERPO() As String
        Get
            Return _CUSTOMERPO
        End Get
        Set(ByVal value As String)
            _CUSTOMERPO = value
        End Set
    End Property

    Private _PROStatus As String
    Public Property PROStatus() As String
        Get
            Return _PROStatus
        End Get
        Set(ByVal value As String)
            _PROStatus = value
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

    Private _POKEY As Integer
    Public Property POKEY() As Integer
        Get
            Return _POKEY
        End Get
        Set(ByVal value As Integer)
            _POKEY = value
        End Set
    End Property

    Private _PONumber As String
    Public Property PONumber() As String
        Get
            Return _PONumber
        End Get
        Set(ByVal value As String)
            _PONumber = value
        End Set
    End Property

    Private _ORD As String
    Public Property ORD() As String
        Get
            Return _ORD
        End Get
        Set(ByVal value As String)
            _ORD = value
        End Set
    End Property

    Private _ShipDate As DateTime
    Public Property ShipDate() As DateTime
        Get
            Return _ShipDate
        End Get
        Set(ByVal value As DateTime)
            _ShipDate = value
        End Set
    End Property


    Private _ShipDatesAndItsBoxes As String
    Public Property ShipDatesAndItsBoxes() As String
        Get
            Return _ShipDatesAndItsBoxes
        End Get
        Set(ByVal value As String)
            _ShipDatesAndItsBoxes = value
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

    Private _ProductCode As String
    Public Property ProductCode() As String
        Get
            Return _ProductCode
        End Get
        Set(ByVal value As String)
            _ProductCode = value
        End Set
    End Property

    Private _Product As String
    Public Property Product() As String
        Get
            Return _Product
        End Get
        Set(ByVal value As String)
            _Product = value
        End Set
    End Property

    Private _ProductCategory As String
    Public Property ProductCategory() As String
        Get
            Return _ProductCategory
        End Get
        Set(ByVal value As String)
            _ProductCategory = value
        End Set
    End Property

    Private _QtyBox As Integer
    Public Property QtyBox() As Integer
        Get
            Return _QtyBox
        End Get
        Set(ByVal value As Integer)
            _QtyBox = value
        End Set
    End Property

    Private _QtyXbox As Integer
    Public Property QtyXbox() As Integer
        Get
            Return _QtyXbox
        End Get
        Set(ByVal value As Integer)
            _QtyXbox = value
        End Set
    End Property

    Private _UnitCosq As Decimal
    Public Property UnitCosq() As Decimal
        Get
            Return _UnitCosq
        End Get
        Set(ByVal value As Decimal)
            _UnitCosq = value
        End Set
    End Property

    Private _Uom As String
    Public Property Uom() As String
        Get
            Return _Uom
        End Get
        Set(ByVal value As String)
            _Uom = value
        End Set
    End Property

    'Private _QtyBConf As Decimal
    'Public Property QtyBConf() As Decimal
    '    Get
    '        Return _QtyBConf
    '    End Get
    '    Set(ByVal value As Decimal)
    '        _QtyBConf = value
    '    End Set
    'End Property

    Private _QtyBConf As Integer
    Public Property QtyBConf() As Integer
        Get
            Return _QtyBConf
        End Get
        Set(ByVal value As Integer)
            _QtyBConf = value
        End Set
    End Property

    Private _Cust As String
    Public Property Cust() As String
        Get
            Return _Cust
        End Get
        Set(ByVal value As String)
            _Cust = value
        End Set
    End Property

    Private _BoxNum As String
    Public Property BoxNum() As String
        Get
            Return _BoxNum
        End Get
        Set(ByVal value As String)
            _BoxNum = value
        End Set
    End Property

    Private _Buyer As String
    Public Property Buyer() As String
        Get
            Return _Buyer
        End Get
        Set(ByVal value As String)
            _Buyer = value
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

    Private _Hawb As String
    Public Property Hawb() As String
        Get
            Return _Hawb
        End Get
        Set(ByVal value As String)
            _Hawb = value
        End Set
    End Property

    Private _Breakdown As String
    Public Property Breakdown() As String
        Get
            Return _Breakdown
        End Get
        Set(ByVal value As String)
            _Breakdown = value
        End Set
    End Property

    Private _BoxCode As String
    Public Property BoxCode() As String
        Get
            Return _BoxCode
        End Get
        Set(ByVal value As String)
            _BoxCode = value
        End Set
    End Property

    Private _Upc As String
    Public Property Upc() As String
        Get
            Return _Upc
        End Get
        Set(ByVal value As String)
            _Upc = value
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

    Private _FarmName As String
    Public Property FarmName() As String
        Get
            Return _FarmName
        End Get
        Set(ByVal value As String)
            _FarmName = value
        End Set
    End Property

    Private _TotalVaq As String
    Public Property TotalVaq() As String
        Get
            Return _TotalVaq
        End Get
        Set(ByVal value As String)
            _TotalVaq = value
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

    Private _UPCDesc As String
    Public Property UPCDesc() As String
        Get
            Return _UPCDesc
        End Get
        Set(ByVal value As String)
            _UPCDesc = value
        End Set
    End Property

    Private _UPCPrice As String
    Public Property UPCPrice() As String
        Get
            Return _UPCPrice
        End Get
        Set(ByVal value As String)
            _UPCPrice = value
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


    Private _Selected As Boolean = False
    Public Property Selected() As Boolean
        Get
            Return _Selected
        End Get
        Set(ByVal value As Boolean)
            _Selected = value
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

    Private _VendorName As String
    Public Property VendorName() As String
        Get
            Return _VendorName
        End Get
        Set(ByVal value As String)
            _VendorName = value
        End Set
    End Property

    Private _ManuFacID As String
    Public Property ManuFacID() As String
        Get
            Return _ManuFacID
        End Get
        Set(ByVal value As String)
            _ManuFacID = value
        End Set
    End Property

    Private _FlowerDetails As New BO.Flowers
    Public Property FlowerDetails As BO.Flowers
        Get
            Return _FlowerDetails
        End Get
        Set(value As BO.Flowers)
            _FlowerDetails = value
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

    Private _Invoice As String
    Public Property Invoice() As String
        Get
            Return _Invoice
        End Get
        Set(value As String)
            _Invoice = value
        End Set
    End Property

    Private _Length As String
    Public Property Length() As String
        Get
            Return _Length
        End Get
        Set(value As String)
            _Length = value
        End Set
    End Property

    Private _Height As String
    Public Property Height() As String
        Get
            Return _Height
        End Get
        Set(value As String)
            _Height = value
        End Set
    End Property

    Private _Width As String
    Public Property Width() As String
        Get
            Return _Width
        End Get
        Set(value As String)
            _Width = value
        End Set
    End Property

    Private _Market As String
    Public Property Market() As String
        Get
            Return _Market
        End Get
        Set(value As String)
            _Market = value
        End Set
    End Property


    Private _Totalrb As Integer
    Public Property Totalrb() As Integer
        Get
            Return _Totalrb
        End Get
        Set(value As Integer)
            _Totalrb = value
        End Set
    End Property

    Private _FlowerFlag As Integer
    Public Property FlowerFlag() As Integer
        Get
            Return _FlowerFlag
        End Get
        Set(value As Integer)
            _FlowerFlag = value
        End Set
    End Property

    Private _SPORDID As String
    Public Property SPORDID() As String
        Get
            Return _SPORDID
        End Get
        Set(value As String)
            _SPORDID = value
        End Set
    End Property

    Private _ORDER2ID As String
    Public Property ORDER2ID() As String
        Get
            Return _ORDER2ID
        End Get
        Set(value As String)
            _ORDER2ID = value
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

    Private _Qtyunit As Integer
    Public Property Qtyunit() As Integer
        Get
            Return _Qtyunit
        End Get
        Set(ByVal value As Integer)
            _Qtyunit = value
        End Set
    End Property

End Class

Public Interface IPOParams_PONumber
    Property PONumber() As String
End Interface

Public Class XmlPODetail
    Private _ConfirmID As String
    Public Property ConfirmID() As String
        Get
            Return _ConfirmID
        End Get
        Set
            _ConfirmID = Value
        End Set
    End Property

    Private _PONUM As String
    Public Property PONUM() As String
        Get
            Return _PONUM
        End Get
        Set
            _PONUM = Value
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

    Private _conf As String
    Public Property conf() As String
        Get
            Return _conf
        End Get
        Set
            _conf = Value
        End Set
    End Property


End Class