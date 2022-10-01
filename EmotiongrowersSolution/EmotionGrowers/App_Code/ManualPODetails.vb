Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Xml

Public Class ManualPODetails
    Public Class GetPODetail
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
        Private _TotalUnits As Integer
        Public Property TotalUnits() As Integer
            Get
                Return _TotalUnits
            End Get
            Set(ByVal value As Integer)
                _TotalUnits = value
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

        Private _ShipDate As DateTime
        Public Property ShipDate() As DateTime
            Get
                Return _ShipDate
            End Get
            Set(ByVal value As DateTime)
                _ShipDate = value
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

        Private _TotalScanned As Integer
        Public Property TotalScanned() As Integer
            Get
                Return _TotalScanned
            End Get
            Set(ByVal value As Integer)
                _TotalScanned = value
            End Set
        End Property

        Private _TotalMissing As Decimal
        Public Property TotalMissing() As Integer
            Get
                Return _TotalMissing
            End Get
            Set(ByVal value As Integer)
                _TotalMissing = value
            End Set
        End Property
        Private _TotalScannedOrigin As Integer
        Public Property TotalScannedOrigin() As Integer
            Get
                Return _TotalScannedOrigin
            End Get
            Set(ByVal value As Integer)
                _TotalScannedOrigin = value
            End Set
        End Property

        Private _TotalMissingAtOrigin As Decimal
        Public Property TotalMissingAtOrigin() As Integer
            Get
                Return _TotalMissingAtOrigin
            End Get
            Set(ByVal value As Integer)
                _TotalMissingAtOrigin = value
            End Set
        End Property

        Public Function GetManualPODetail(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of ManualPODetail)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of ManualPODetail)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetManualPODetails]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New ManualPODetail()
                            u.DetailID = row("ID")
                            u.HeaderID = row("HeaderId")
                            u.Farm = row("Farm")
                            u.Flower = row("Flower")
                            u.Description = Convert.ToString(row("FlowerName"))
                            u.AWB = Convert.ToString(row("AWB"))
                            u.HAWB = Convert.ToString(row("HAWB"))
                            u.Boxes = Convert.ToInt32(row("Quantity"))
                            u.PO = Convert.ToString(row("PONumber"))
                            u.Invoice = Convert.ToString(row("Invoice"))
                            u.UOM = Convert.ToString(row("UOM"))
                            u.UnitsPerBunch = Convert.ToInt32(IIf(row("UnitsPerBunch") Is DBNull.Value, 0, row("UnitsPerBunch")))
                            u.UnitsPerBox = Convert.ToInt32(IIf(row("UnitsPerBox") Is DBNull.Value, 0, row("UnitsPerBox")))
                            u.CustNumber = Convert.ToString(row("CustNumber"))
                            u.Cost = Convert.ToDecimal(IIf(row("CostPerUnits") Is DBNull.Value, 0, row("CostPerUnits")))
                            u.TotalCost = Convert.ToDecimal(IIf(row("TotalCost") Is DBNull.Value, 0, row("TotalCost")))
                            u.TotalUnits = IIf(row("Units") Is DBNull.Value, 0, row("Units"))
                            u.Comments = Convert.ToString(row("Comments"))
                            u.BreakDown = Convert.ToString(row("BreakDown"))
                            u.Type = IIf(row("Type") Is DBNull.Value, "", row("Type"))
                            u.ShipDate = Convert.ToDateTime(IIf(Convert.ToString(row("shippeddate")) = "", DateTime.Now, row("shippeddate"))).ToString("yyyy-MM-dd")
                            u.BoxCode = Convert.ToString(row("BoxCode"))
                            u.BoxNumber = Convert.ToString(row("BoxNumber"))
                            u.FlowrDetails.ForeColor = Convert.ToString(row("Color"))
                            u.FlowrDetails.BGColor = Convert.ToString(row("BGColor"))
                            u.Scanned = Convert.ToString(row("Scanned"))
                            u.Missing = Convert.ToString(row("Quantity") - row("Scanned"))
                            u.ScannedOrigin = Convert.ToString(row("ScannedOrigin"))
                            u.MissingAtOrigin = Convert.ToString(row("MissingAtOrigin"))
                            ''2021/08/15
                            u.ItemNotTransfered = Convert.ToString(row("ItemNotTransfered"))

                            uList.Add(u)
                        Next
                        If ds.Tables(0).Rows.Count <= 0 Then
                            Me.TotalRows = 0
                            Me.TotalBoxes = 0
                            Me.TotalUnits = 0
                            Me.TotalCost = 0
                            Me.AWB = ""
                            Me.HAWB = ""
                            Me.Invoice = ""
                            Me.ShipDate = DateTime.Now.ToString("yyyy-MM-dd")
                            Me.TotalScanned = 0
                            Me.TotalMissing = 0
                            Me.TotalScannedOrigin = 0
                            Me.TotalMissingAtOrigin = 0
                        Else
                            Me.TotalRows = ds.Tables(1).Rows(0)(0)
                            Me.TotalBoxes = IIf(ds.Tables(1).Rows(0)(1) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(1))
                            Me.TotalUnits = IIf(ds.Tables(1).Rows(0)(2) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(2))
                            Me.TotalCost = IIf(ds.Tables(1).Rows(0)(3) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(3))
                            Me.TotalScanned = IIf(ds.Tables(1).Rows(0)(4) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(4))
                            Me.TotalMissing = IIf(ds.Tables(1).Rows(0)(5) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(5))
                            Me.TotalScannedOrigin = IIf(ds.Tables(1).Rows(0)(4) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(6))
                            Me.TotalMissingAtOrigin = IIf(ds.Tables(1).Rows(0)(5) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(7))
                            If ds.Tables(2).Rows.Count > 0 Then
                                Me.AWB = ds.Tables(2).Rows(0)(0)
                                Me.HAWB = IIf(ds.Tables(2).Rows(0)(1) Is DBNull.Value, "", ds.Tables(2).Rows(0)(1))
                                Me.ShipDate = Convert.ToDateTime(IIf(Convert.ToString(ds.Tables(2).Rows(0)(2)) = "", DateTime.Now, ds.Tables(2).Rows(0)(2))).ToString("yyyy-MM-dd")
                                Me.Invoice = IIf(ds.Tables(2).Rows(0)(3) Is DBNull.Value, 0, ds.Tables(2).Rows(0)(3))
                            Else
                                Me.AWB = ""
                                Me.HAWB = ""
                                Me.Invoice = ""
                                Me.ShipDate = DateTime.Now.ToString("yyyy-MM-dd")
                            End If
                        End If
                        Dim af As New ManualPODetail()
                        af.DetailID = 0
                        af.HeaderID = 0
                        af.Farm = ""
                        af.Flower = ""
                        af.Description = "Total"
                        af.AWB = AWB
                        af.HAWB = HAWB
                        af.Boxes = TotalBoxes
                        af.PO = ""
                        af.Invoice = Invoice
                        af.UOM = ""
                        af.UnitsPerBunch = ""
                        af.CustNumber = ""
                        af.Cost = ""
                        af.TotalCost = TotalCost
                        af.TotalUnits = TotalUnits
                        af.Comments = ""
                        af.BreakDown = ""
                        af.Type = ""
                        af.ShipDate = ShipDate
                        af.BoxCode = ""
                        af.BoxNumber = ""
                        af.FlowrDetails.ForeColor = ""
                        af.FlowrDetails.BGColor = ""
                        af.Scanned = TotalScanned
                        af.Missing = TotalMissing
                        uList.Add(af)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetManualPODetail")
                Return Nothing
            End Try
        End Function


    End Class

    Public Shared Function GetManualPODetailsByHeaderID(ByVal HeaderID As String) As List(Of ManualPODetail)

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of ManualPODetail)

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwGetManualPODetails where HeaderID=@id", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@id", HeaderID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)

                    For Each row In ds.Rows
                        Dim u As New ManualPODetail()

                        u.DetailID = row("ID")
                        u.HeaderID = row("HeaderId")
                        u.Farm = Convert.ToString(row("Farm"))
                        u.Flower = Convert.ToString(row("Flower"))
                        u.AWB = Convert.ToString(row("AWB"))
                        u.HAWB = Convert.ToString(row("HAWB"))
                        u.Invoice = Convert.ToString(row("Invoice"))
                        u.PO = Convert.ToString(row("PONumber"))
                        u.Boxes = Convert.ToInt32(row("Quantity"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.TotalUnits = Convert.ToInt32(row("Units"))
                        u.UnitsPerBunch = Convert.ToInt32(row("UnitsPerBunch"))
                        u.UnitsPerBox = Convert.ToInt32(row("UnitsPerBox"))
                        u.Cost = Convert.ToDecimal(row("CostPerUnits"))
                        u.Type = Convert.ToString(row("Type"))
                        u.Comments = Convert.ToString(row("Comments"))
                        u.CustNumber = Convert.ToString(row("CustNumber"))
                        u.OrderNumber = Convert.ToString(row("OrderNumber"))
                        u.FobConsig = Convert.ToString(row("FobConsig"))
                        u.Description = Convert.ToString(row("FlowerName"))
                        u.Header = Convert.ToString(row("Header"))
                        u.ColorCode = Convert.ToString(row("COLORCODE"))
                        uList.Add(u)
                    Next

                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetManualPODetailsByHeaderID")
            Return Nothing
        End Try

    End Function

    Public Shared Function GetManualPODetailsByHeaderIDs(ByVal HeaderIDs As String) As List(Of ManualPODetail)

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of ManualPODetail)

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwGetManualPODetails where HeaderID in (select Item from ufn_csv2table(@id,',')) and ISNULL(AWB,'')<>'' and ISNULL(Shipdate,'')<>''", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@id", HeaderIDs))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)

                    For Each row In ds.Rows
                        Dim u As New ManualPODetail()

                        u.DetailID = row("ID")
                        u.HeaderID = row("HeaderId")
                        u.Farm = Convert.ToString(IIf(row("Farm") Is DBNull.Value, "", row("Farm")))
                        u.Flower = Convert.ToString(IIf(row("Flower") Is DBNull.Value, "", row("Flower")))
                        u.Flowername = Convert.ToString(IIf(row("FlowerName") Is DBNull.Value, "", row("FlowerName")))
                        u.FlowerCategory = Convert.ToString(IIf(row("FlowerCategory") Is DBNull.Value, "", row("FlowerCategory")))
                        u.ShipDate = Convert.ToString(IIf(row("ShipDate") Is DBNull.Value, "", row("ShipDate")))
                        u.AWB = Convert.ToString(IIf(row("AWB") Is DBNull.Value, "", row("AWB")))
                        u.HAWB = Convert.ToString(IIf(row("HAWB") Is DBNull.Value, "", row("HAWB")))
                        u.Invoice = Convert.ToString(IIf(row("Invoice") Is DBNull.Value, "", row("Invoice")))
                        u.PO = Convert.ToString(IIf(row("PONumber") Is DBNull.Value, "", row("PONumber")))
                        u.Boxes = Convert.ToInt32(IIf(row("Quantity") Is DBNull.Value, 0, row("Quantity")))
                        u.BoxNumber = Convert.ToString(IIf(row("BoxNumber") Is DBNull.Value, "", row("BoxNumber")))
                        u.UOM = Convert.ToString(IIf(row("UOM") Is DBNull.Value, "", row("UOM")))
                        u.TotalUnits = Convert.ToInt32(IIf(row("Units") Is DBNull.Value, 0, row("Units")))
                        u.UnitsPerBunch = Convert.ToInt32(IIf(row("UnitsPerBunch") Is DBNull.Value, 0, row("UnitsPerBunch")))
                        u.UnitsPerBox = Convert.ToInt32(IIf(row("UnitsPerBox") Is DBNull.Value, 0, row("UnitsPerBox")))
                        u.Cost = Convert.ToDecimal(IIf(row("CostPerUnits") Is DBNull.Value, 0, row("CostPerUnits")))
                        u.Type = Convert.ToString(IIf(row("Type") Is DBNull.Value, "", row("Type")))
                        u.Comments = Convert.ToString(IIf(row("Comments") Is DBNull.Value, "", row("Comments")))
                        u.CustNumber = Convert.ToString(IIf(row("CustNumber") Is DBNull.Value, "", row("CustNumber")))
                        u.OrderNumber = Convert.ToString(IIf(row("OrderNumber") Is DBNull.Value, "", row("OrderNumber")))
                        u.FobConsig = Convert.ToString(IIf(row("FobConsig") Is DBNull.Value, "", row("FobConsig")))
                        u.Description = Convert.ToString(IIf(row("FlowerName") Is DBNull.Value, "", row("FlowerName")))
                        u.Header = Convert.ToString(IIf(row("Header") Is DBNull.Value, "", row("Header")))
                        u.ColorCode = Convert.ToString(IIf(row("COLORCODE") Is DBNull.Value, "", row("COLORCODE")))
                        u.InvenType = Convert.ToString(IIf(row("FOB") Is DBNull.Value, "", row("FOB")))
                        uList.Add(u)
                    Next

                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetManualPODetailsByHeaderIDs")
            Return Nothing
        End Try

    End Function

    'Public Shared Function GetTopManualPODetailsByHeaderID(ByVal HeaderID As String) As ManualPODetail

    '    Try
    '        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
    '        Dim u As New ManualPODetail()

    '        Using con As New SqlConnection(ConStr)
    '            con.Open()
    '            Using cmd As New SqlCommand("select top 1 * from vwGetManualPODetails where HeaderID=@id order by AWB desc", con)
    '                cmd.CommandType = CommandType.Text
    '                cmd.Parameters.Add(New SqlParameter("@id", HeaderID))
    '                Dim da As New SqlDataAdapter(cmd)
    '                Dim ds As New DataTable
    '                da.Fill(ds)
    '                For Each row In ds.Rows
    '                    u.DetailID = row("ID")
    '                    u.HeaderID = row("HeaderId")
    '                    u.Farm = Convert.ToString(row("Farm"))
    '                    u.Flower = Convert.ToString(row("Flower"))
    '                    u.AWB = Convert.ToString(row("AWB"))
    '                    u.HAWB = Convert.ToString(row("HAWB"))
    '                    u.Invoice = Convert.ToString(row("Invoice"))
    '                    u.PO = Convert.ToString(row("PONumber"))
    '                    u.Boxes = Convert.ToInt32(row("Quantity"))
    '                    u.UOM = Convert.ToString(row("UOM"))
    '                    u.TotalUnits = Convert.ToInt32(row("Units"))
    '                    u.UnitsPerBunch = Convert.ToInt32(row("UnitsPerBunch"))
    '                    u.Cost = Convert.ToDecimal(row("CostPerUnits"))
    '                    u.Type = Convert.ToString(row("Type"))
    '                    u.Comments = Convert.ToString(row("Comments"))
    '                    u.CustNumber = Convert.ToString(row("CustNumber"))
    '                    u.OrderNumber = Convert.ToString(row("OrderNumber"))
    '                    u.FobConsig = Convert.ToString(row("FobConsig"))
    '                    u.Description = Convert.ToString(row("FlowerName"))
    '                    u.Header = Convert.ToString(row("Header"))
    '                    u.ShipDate = IIf(Convert.ToString(row("ShipDate")) = "", Convert.ToString(row("ShipDate")), Convert.ToDateTime(row("ShipDate")).ToString("MM/dd/yyyy"))
    '                Next
    '            End Using
    '        End Using
    '        Return u
    '    Catch ex As Exception
    '        ErrorLogs.LogException(ex, "Error in GetManualPODetailsByHeaderID")
    '        Return Nothing
    '    End Try

    'End Function

    ''' <summary>
    ''' STA::01-AUG-2015::to delete the manual PODetails
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeleteManualPODetails(ByVal ID As String, ByVal HeaderId As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim detail As New ManualPODetail
            detail = GetManualPODetailsByID(ID)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("sp_ManualPOdeletedetail", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@id", ID))
                    cmd.Parameters.Add(New SqlParameter("@HeaderId", HeaderId))
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                Logs.Savelog(loginuserdetails.ID, "Users", "DeleteManualPODetails", "Delete Users Detail - " + detail.Flower + "[" + detail.Flowername + "]" + " with Boxes =" + detail.Boxes, ID.ToString())
            End If

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteManualPODetails")
            Return "error"
        End Try
    End Function


    ''' <summary>
    ''' STA::01-AUG-2015::to get the Manual PO Details by ID
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetManualPODetailsByID(ByVal ID As String) As ManualPODetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPODetail

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwGetManualPODetails where Id=@id", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@id", ID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row In ds.Rows
                        uList.DetailID = row("ID")
                        uList.HeaderID = row("HeaderId")
                        uList.Farm = Convert.ToString(row("Farm"))
                        uList.Flower = Convert.ToString(row("Flower"))
                        uList.Flowername = Convert.ToString(row("FlowerName"))
                        uList.AWB = Convert.ToString(row("AWB"))
                        uList.HAWB = Convert.ToString(row("HAWB"))
                        uList.Invoice = Convert.ToString(row("Invoice"))
                        uList.PO = Convert.ToString(row("PONumber"))
                        uList.Boxes = Convert.ToInt32(row("Quantity"))
                        uList.UOM = Convert.ToString(row("UOM"))
                        uList.TotalUnits = Convert.ToInt32(row("Units"))
                        uList.UnitsPerBunch = Convert.ToInt32(row("UnitsPerBunch"))
                        uList.UnitsPerBox = Convert.ToInt32(row("UnitsPerBox"))
                        uList.Cost = Convert.ToDecimal(row("CostPerUnits"))
                        uList.Type = Convert.ToString(row("Type"))
                        uList.Comments = Convert.ToString(row("Comments"))
                        uList.CustNumber = Convert.ToString(row("CustNumber"))
                        uList.OrderNumber = Convert.ToString(row("OrderNumber"))
                        uList.FobConsig = Convert.ToString(row("FobConsig"))
                        uList.Description = Convert.ToString(row("FlowerName"))
                        uList.Header = Convert.ToString(row("Header"))
                        uList.FlowerCategory = Convert.ToString(row("FlowerCategory"))
                        uList.ManufacID = Convert.ToString(row("ManuFacId"))
                        uList.FarmName = Convert.ToString(row("FarmName"))
                        uList.BoxCode = Convert.ToString(row("BoxCode"))
                        uList.BoxNumber = Convert.ToString(row("BoxNumber"))
                        uList.PurchaseType = Convert.ToString(row("PurchaseType"))
                        uList.BreakDown = Convert.ToString(row("BreakDown"))
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetManualPODetailsByID")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' VEN::31-JUL-2015::to save (insert/update) the Manual PO Details 
    ''' </summary>
    ''' <param name="DetailID"></param>
    ''' <param name="HeaderId"></param>
    ''' <param name="Farm"></param>
    ''' <param name="Flower"></param>
    ''' <param name="AWB"></param>
    ''' <param name="HAWB"></param>
    ''' <param name="Invoice"></param>
    ''' <param name="PONumber"></param>
    ''' <param name="Quantity"></param>
    ''' <param name="UOM"></param>
    ''' <param name="Units"></param>
    ''' <param name="UnitsPerBunch"></param>
    ''' <param name="CostPerUnits"></param>
    ''' <param name="Type"></param>
    ''' <param name="Comments"></param>
    ''' <param name="CustNumber"></param>
    ''' <param name="OrderNumber"></param>
    ''' <param name="FobConsig"></param>
    ''' <param name="CreatedUserId"></param>
    ''' <param name="FlowerName"></param>
    ''' <param name="Mode"></param>
    ''' <param name="FlowerCategory"></param>   
    ''' <param name="BoxCode"></param>
    ''' <param name="BoxNumber"></param>
    ''' <param name="PurchaseType"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function SaveManualPODetails(ByVal DetailID As Integer, ByVal HeaderId As Integer, ByVal Farm As String, ByVal Flower As String,
                                               ByVal AWB As String, ByVal HAWB As String, ByVal Invoice As String, ByVal PONumber As String, ByVal Quantity As String,
                                               ByVal UOM As String, ByVal Units As String, ByVal UnitsPerBunch As String, ByVal UnitsPerBox As String, ByVal CostPerUnits As String, ByVal Type As String,
                                               ByVal Comments As String, ByVal CustNumber As String, ByVal OrderNumber As String, ByVal FobConsig As String, ByVal CreatedUserId As String,
                                               ByVal FlowerName As String, ByVal Mode As Integer, ByVal FlowerCategory As String,
                                               ByVal BoxCode As String,
                                               ByVal BoxNumber As String, ByVal PurchaseType As String, ByVal BreakDown As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of ManualPODetail)()
            Dim DetailScopeID As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spSaveManualPODetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@DetailID", DetailID))
                    cmd.Parameters.Add(New SqlParameter("@HeaderId", HeaderId))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@Flower", Flower))
                    cmd.Parameters.Add(New SqlParameter("@AWB", AWB))
                    cmd.Parameters.Add(New SqlParameter("@HAWB", HAWB))
                    cmd.Parameters.Add(New SqlParameter("@Invoice", IIf(Invoice = Nothing Or Invoice = "", "0", Invoice)))
                    cmd.Parameters.Add(New SqlParameter("@PONumber", PONumber))
                    cmd.Parameters.Add(New SqlParameter("@Quantity", Quantity))
                    cmd.Parameters.Add(New SqlParameter("@UOM", UOM))
                    cmd.Parameters.Add(New SqlParameter("@Units", Units))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBunch", UnitsPerBunch))
                    cmd.Parameters.Add(New SqlParameter("@UnitsPerBox", UnitsPerBox))
                    cmd.Parameters.Add(New SqlParameter("@CostPerUnits", CostPerUnits))
                    cmd.Parameters.Add(New SqlParameter("@Type", Type))
                    cmd.Parameters.Add(New SqlParameter("@Comments", Comments))
                    cmd.Parameters.Add(New SqlParameter("@CustNumber", IIf(CustNumber = Nothing Or CustNumber = "", "0", CustNumber)))
                    cmd.Parameters.Add(New SqlParameter("@OrderNumber", OrderNumber))
                    cmd.Parameters.Add(New SqlParameter("@FobConsig", FobConsig))
                    cmd.Parameters.Add(New SqlParameter("@CreatedUserId", CreatedUserId))
                    cmd.Parameters.Add(New SqlParameter("@FlowerName", FlowerName))
                    cmd.Parameters.Add(New SqlParameter("@FlowerCategory", FlowerCategory))
                    cmd.Parameters.Add(New SqlParameter("@BoxCode", BoxCode))
                    cmd.Parameters.Add(New SqlParameter("@BoxNumber", BoxNumber))
                    cmd.Parameters.Add(New SqlParameter("@PurchaseType", PurchaseType))
                    cmd.Parameters.Add(New SqlParameter("@BreakDown", BreakDown))
                    cmd.Parameters.Add(New SqlParameter("@Mode", Mode))

                    DetailScopeID = cmd.ExecuteScalar()
                End Using
            End Using

            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                If DetailID = 0 Then
                    Logs.Savelog(loginuserdetails.ID, "Users", "SaveManualPODetails", "Add New Users Details - " + Flower + "[" + FlowerName + "]" + " with Boxes =" + Quantity, DetailScopeID.ToString())
                Else
                    Logs.Savelog(loginuserdetails.ID, "Users", "SaveManualPODetails", "Modified Users Details - " + Flower + "[" + FlowerName + "]" + " with Boxes =" + Quantity, DetailID.ToString())
                End If
            End If

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveManualPODetails")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' STA::01-AUG-2015::to ship (update awb,hawb) selected manual pos
    ''' </summary>
    ''' <param name="IDs"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function ShipSelectedManualPos(ByVal IDs As String, ByVal awb As String, ByVal hawb As String, ByVal ShipDate As String, ByVal invoice As String,
                                                 ByVal HeaderID As String, ByVal UpdateBoxNoIds As String, ByVal StartingBoxNo As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spShipManualPo", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@ids", IDs))
                    cmd.Parameters.Add(New SqlParameter("@awb", awb))
                    cmd.Parameters.Add(New SqlParameter("@hawb", hawb))
                    cmd.Parameters.Add(New SqlParameter("@ShipDate", ShipDate))
                    cmd.Parameters.Add(New SqlParameter("@Invoice", invoice))
                    cmd.Parameters.Add(New SqlParameter("@HeaderId", HeaderID))
                    cmd.Parameters.Add(New SqlParameter("@BoxNoUpdateIDs", UpdateBoxNoIds))
                    cmd.Parameters.Add(New SqlParameter("@StartingBoxNo", StartingBoxNo))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            Dim erLog As New BloomService
            erLog.AppendLog("IDs--" + IDs, "")
            erLog.AppendLog("awb--" + awb, "")
            erLog.AppendLog("hawb--" + hawb, "")
            erLog.AppendLog("ShipDate--" + ShipDate, "")
            erLog.AppendLog("Invoice--" + invoice, "")
            erLog.AppendLog("HeaderId--" + HeaderID, "")
            erLog.AppendLog("BoxNoUpdateIDs--" + UpdateBoxNoIds, "")
            erLog.AppendLog("StartingBoxNo--" + Convert.ToString(StartingBoxNo), "")
            ErrorLogs.LogException(ex, "Error in ShipSelectedManualPos")
            Return "error"
        End Try
    End Function

    Public Shared Function BoxNumberUpdateIds(ByVal Ids As String, ByVal AWB As String) As List(Of ManualPODetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of ManualPODetail)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select ID from tblPODetails where isnull(AWB,'')<>@AWB and id in(select item from ufn_CSV2Table('" + Ids + "',','))", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@AWB", AWB)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New ManualPODetail()
                        u.DetailID = row("ID")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in BoxNumberUpdateIds")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' VEN::10-08-2015::Bulk Update ManualPO details 
    ''' </summary>
    ''' <param name="Podetails"></param>
    ''' <returns></returns>
    Public Shared Function UpdateManualPODetails(ByVal Podetails As String, ByVal HeaderID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spUpdateManualPODetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PODetailsList", Podetails))
                    cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Dim IDs As New XmlDocument()
            IDs.LoadXml(Podetails)
            Dim IDsList As XmlNodeList = IDs.GetElementsByTagName("DetailsID")
            Dim result As String = ""
            For Each detail As XmlNode In IDsList
                result += IIf(result.Length <= 0, "", " , ")
                result += detail.InnerText
            Next
            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                Logs.Savelog(loginuserdetails.ID, "Users", "UpdateManualPODetails", "Updated Users Details.", result)
            End If

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateManualPODetails")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' STA::12-AUG-2015::to delete zero qty value manu po details
    ''' </summary>
    ''' <param name="HeaderID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeleteZeroValueManualPODetails(ByVal HeaderID As Integer, ByVal SelectedPodetails As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spClearManualPODetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@SelectedDetailsId", SelectedPodetails))
                    cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteZeroValueManualPODetails")
            Return "error"
        End Try
    End Function

    Public Shared Function DuplicateManualPODetailsbyID(ByVal DetailID As Integer, ByVal BoxNumber As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Dim detail As New ManualPODetail
            detail = GetManualPODetailsByID(DetailID)

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spDuplicateManualPODetailbyID]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@DetailsID", DetailID))
                    cmd.Parameters.Add(New SqlParameter("@BoxNumber", BoxNumber))
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                If BoxNumber = "0" Then
                    Logs.Savelog(loginuserdetails.ID, "Users", "DuplicateManualPODetailsbyID", "Duplicate Users Detail with Empty box number of " + detail.Flower + "[" + detail.Flowername + "]", DetailID.ToString())
                Else
                    Logs.Savelog(loginuserdetails.ID, "Users", "DuplicateManualPODetailsbyID", "Duplicate Users Detail of" + detail.Flower + "[" + detail.Flowername + "]" + " with Boxnumber=" + BoxNumber, DetailID.ToString())
                End If


            End If

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DuplicateManualPODetailsbyID")
            Return "error"
        End Try
    End Function

    Public Shared Function CreatePODetailsXMLFile(ByVal DetailsIDs As String, ByVal Farm As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim xml As String = ""
            Dim AWB As String = ""
            Dim FileAWB As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using AWBCmd As New SqlCommand("select Distinct(AWB) from tblPODetails where id in (select s from CSV2Table(@DetailsID))option (maxrecursion 0)", con)
                    AWBCmd.CommandType = CommandType.Text
                    AWBCmd.Parameters.AddWithValue("@DetailsID", DetailsIDs)
                    Dim AWBda As New SqlDataAdapter(AWBCmd)
                    Dim AWBds As New DataTable
                    AWBda.Fill(AWBds)
                    For Each AWBrow In AWBds.Rows
                        AWB = AWBrow("AWB")
                        Using cmd As New SqlCommand("[spCreatePODetailsXML]", con)
                            cmd.CommandType = CommandType.StoredProcedure
                            cmd.Parameters.Add(New SqlParameter("@DetailID", DetailsIDs))
                            cmd.Parameters.Add(New SqlParameter("@AWB", AWB))
                            Dim da As New SqlDataAdapter(cmd)
                            Dim ds As New DataSet
                            da.Fill(ds)
                            Dim dt As New DataTable
                            Dim sw As System.IO.StringWriter
                            dt = ds.Tables(0)

                            For Each row As DataRow In dt.Rows
                                sw = New System.IO.StringWriter
                                For Each col As DataColumn In dt.Columns
                                    sw.Write(row(col).ToString())
                                Next
                                xml += sw.ToString
                            Next
                            FileAWB += ds.Tables(1).Rows(0)(0) + "_"
                        End Using
                    Next
                End Using
            End Using
            'xml = "<Invoices>" + xml + "</Invoices>"
            xml = PrettyXML(xml)
            xml = xml.Replace("*E*", "")
            FileAWB = FileAWB.Remove(FileAWB.Length - 1)
            Dim VendorFileFolderName As String = System.Web.HttpContext.Current.Server.MapPath("temp")
            Dim LogPath As String = VendorFileFolderName + "\"

            If Not Directory.Exists(LogPath) Then
                Directory.CreateDirectory(LogPath)
            End If
            Dim VendorFromEmail As String = ConfigurationManager.AppSettings("VendorFromEmails")
            Dim filename As String = ""
            If FileAWB.Length = 12 Then
                filename = FileAWB.Replace(".", "-").Replace("@", "-").Substring(7, 5) + "" + Farm + ".XML"
            Else
                filename = FileAWB.Replace(".", "-").Replace("@", "-").Substring(6, 5) + "" + Farm + ".XML"
            End If

            Dim filepath As String = LogPath & filename
            If File.Exists(filepath) Then
                File.WriteAllText(filepath, "")
                Using writer As New StreamWriter(filepath, True)
                    writer.WriteLine("<?xml version='1.0' encoding='UTF-8'?>")
                    writer.WriteLine(xml)
                End Using

            Else
                Dim writer As StreamWriter = File.CreateText(filepath)
                writer.WriteLine("<?xml version='1.0' encoding='UTF-8'?>")
                writer.WriteLine(xml)
                writer.Close()
            End If
            Return filename

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CreatePODetailsXMLFile")
            Return "error"
        End Try
    End Function

    Public Shared Function PrettyXML(XMLString As String) As String
        'Dim sw As New StringWriter()
        'Dim xw As New XmlTextWriter(sw)
        'xw.Formatting = Formatting.Indented
        'xw.Indentation = 4
        'Dim doc As New XmlDocument
        'doc.LoadXml(XMLString)
        'doc.Save(xw)

        'Return sw.ToString()

        Dim Result As [String] = ""

        Dim mStream As New MemoryStream()
        Dim writer As New XmlTextWriter(mStream, Encoding.UTF8)
        Dim document As New XmlDocument()

        Try
            ' Create an XML declaration.  
            Dim xmldecl As XmlDeclaration
            xmldecl = document.CreateXmlDeclaration("1.0", Nothing, Nothing)
            xmldecl.Encoding = "UTF-8"
            xmldecl.Standalone = "yes"

            ' Add the new node to the document. 
            Dim root As XmlElement = document.DocumentElement
            document.InsertBefore(xmldecl, root)

            ' Load the XmlDocument with the XML.
            document.LoadXml(XMLString)

            writer.Formatting = Formatting.Indented

            ' Write the XML into a formatting XmlTextWriter
            document.WriteContentTo(writer)
            writer.Flush()
            mStream.Flush()

            ' Have to rewind the MemoryStream in order to read
            ' its contents.
            mStream.Position = 0

            ' Read MemoryStream contents into a StreamReader.
            Dim sReader As New StreamReader(mStream)

            ' Extract the text from the StreamReader.
            Dim FormattedXML As [String] = sReader.ReadToEnd()

            Result = FormattedXML
        Catch generatedExceptionName As XmlException
        End Try

        mStream.Close()
        writer.Close()

        Return Result


    End Function

    Public Shared Function GetInvoiceByHeaderID(ByVal HeaderID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Invoice As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select top 1 invoice from tblPOdetails where HeaderId=@HeaderID ", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@HeaderID", HeaderID)
                    Invoice = Convert.ToString(cmd.ExecuteScalar())
                End Using
            End Using
            Return Invoice
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvoiceByHeaderID")
            Return "error"
        End Try
    End Function

    Public Shared Function GetCurrentDateShippingDetails(ByVal HeaderID As String) As ManualPODetail
        Try
            Dim u As New ManualPODetail
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim qry As String = ""
            'Commented By Prashant on 3 june 2020 For Taking wrong Data for Ship Selected
            'qry = "select top 1 AWB,HAWB,ShipDate from tblPODetails where HeaderId=(select top 1 HeaderID from tblPOHeader where " +
            '      "ShippedDate=(select ShippedDate from tblPOHeader where HeaderId=@HeaderID) and IsShiped<>1 and ISNULL(AWB,'')<>'')"
            qry = "spGetShipmentDetailsForManualShip"
            Dim Cmd As New SqlCommand(qry, SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@HeaderID", HeaderID)
            Dim adp As New SqlDataAdapter(Cmd)
            Dim dt As New DataTable()
            adp.Fill(dt)
            For Each row In dt.Rows
                u.AWB = Convert.ToString(row("AWB"))
                u.HAWB = Convert.ToString(row("HAWB"))
                u.ShipDateString = Convert.ToDateTime(row("ShipDate"))
            Next
            Cmd.Dispose()
            SqlCon.Close()
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCurrentDateShippingDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetManaulPODetailFromFarmPR(ByVal Farm As String) As List(Of ManualPODetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistPOD As New List(Of ManualPODetail)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("SELECT * FROM F_FARMPR PR INNER JOIN vwFlowersDetails F ON " +
                                            "F.FLOWER=PR.FLOWER where FARM='" + Farm + "'", Con)

                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row In ds.Rows
                        Dim u As New ManualPODetail
                        u.Farm = Convert.ToString(row("FARM"))
                        u.Flower = Convert.ToString(row("FLOWER"))
                        u.Boxes = Convert.ToString(row("BOXES"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.UnitsPerBox = Convert.ToString(row("UNITS"))
                        u.UnitsPerBunch = Convert.ToString(row("UNITSBUNCH"))
                        'u.Cost = Convert.ToString(row("PRICE"))
                        u.Cost = Convert.ToString(row("LastCost"))
                        u.Flowername = Convert.ToString(row("NAME"))
                        u.FlowerCategory = Convert.ToString(row("CAT"))
                        ulistPOD.Add(u)
                    Next
                    Return ulistPOD
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCurrentDateShippingDetails")
            Return Nothing
        End Try
    End Function

	Public Shared Function UpdateBlankAWB(ByVal ID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spUpdateBlankAWBPoDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@ID", ID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteManualPODetails")
            Return "error"
        End Try
    End Function
End Class

Public Class ManualPODetail
    'POdetail Informations
    Private _HeaderID As Integer
    Public Property HeaderID() As Integer
        Get
            Return _HeaderID
        End Get
        Set(ByVal value As Integer)
            _HeaderID = value
        End Set
    End Property

    Private _Header As String
    Public Property Header() As String
        Get
            Return _Header
        End Get
        Set(ByVal value As String)
            _Header = value
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

    Private _Boxes As String
    Public Property Boxes() As String
        Get
            Return _Boxes
        End Get
        Set(ByVal value As String)
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

    Private _UnitsPerBunch As String
    Public Property UnitsPerBunch() As String
        Get
            Return _UnitsPerBunch
        End Get
        Set(ByVal value As String)
            _UnitsPerBunch = value
        End Set
    End Property

    Private _UnitsPerBox As String
    Public Property UnitsPerBox() As String
        Get
            Return _UnitsPerBox
        End Get
        Set(ByVal value As String)
            _UnitsPerBox = value
        End Set
    End Property

    Private _TotalUnits As String
    Public Property TotalUnits() As String
        Get
            Return _TotalUnits
        End Get
        Set(ByVal value As String)
            _TotalUnits = value
        End Set
    End Property

    Private _Cost As String
    Public Property Cost() As String
        Get
            Return _Cost
        End Get
        Set(ByVal value As String)
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

    'Private _Brand As String
    'Public Property Brand() As String
    '    Get
    '        Return _Brand
    '    End Get
    '    Set(ByVal value As String)
    '        _Brand = value
    '    End Set
    'End Property

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

    Private _FobConsig As String
    Public Property FobConsig() As String
        Get
            Return _FobConsig
        End Get
        Set(ByVal value As String)
            _FobConsig = value
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

    Private _ShipDate As DateTime
    Public Property ShipDate() As DateTime
        Get
            Return _ShipDate
        End Get
        Set(ByVal value As DateTime)
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

    Private _ScannedOrigin As Integer
    Public Property ScannedOrigin() As Integer
        Get
            Return _ScannedOrigin
        End Get
        Set(ByVal value As Integer)
            _ScannedOrigin = value
        End Set
    End Property

    Private _MissingAtOrigin As Integer
    Public Property MissingAtOrigin() As Integer
        Get
            Return _MissingAtOrigin
        End Get
        Set(ByVal value As Integer)
            _MissingAtOrigin = value
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

    Private _ShipDateString As String
    Public Property ShipDateString() As String
        Get
            Return _ShipDateString
        End Get
        Set(ByVal value As String)
            _ShipDateString = value
        End Set
    End Property

    ''2021/08/15
    Private _ItemNotTransfered As Integer
    Public Property ItemNotTransfered() As Integer
        Get
            Return _ItemNotTransfered
        End Get
        Set(ByVal value As Integer)
            _ItemNotTransfered = value
        End Set
    End Property

End Class


