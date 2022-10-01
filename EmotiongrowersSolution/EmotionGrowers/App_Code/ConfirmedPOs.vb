Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO


Public Class ConfirmedPOs
   

    Public Shared Function InsertPODetailsForReportExport(ByVal Pokey As Integer, ByVal Ponum As String, ByVal ORD As Integer, ByVal Farm As String,
                                                          ByVal ProductCategory As String, ByVal QtyXbox As Integer, ByVal UOM As String,
                                                          ByVal ProductName As String, ByVal BoxNumber As String, ByVal BoxCode As String,
                                                          ByVal Commentq As String, ByVal AWB As String, ByVal HAWB As String,
                                                          ByVal Cust As Integer, ByVal ProductCode As String, ByVal FarmName As String,
                                                          ByVal ManuFacId As String, ByVal UnitsPerBox As Integer, ByVal ImportedFrom As String,
                                                          ByVal InvoiceNum As String, ByVal Length As String, ByVal Height As String, ByVal Width As String, ByVal Cost As Decimal) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand
            Dim UserScopeID As String = ""

            Cmd = New SqlCommand("spTblRptPODetails", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@Pokey", Pokey)
            Cmd.Parameters.AddWithValue("@Ponum", Ponum)
            Cmd.Parameters.AddWithValue("@Ord", ORD)
            Cmd.Parameters.AddWithValue("@Farm", Farm)
            Cmd.Parameters.AddWithValue("@ProductCategory", ProductCategory)
            Cmd.Parameters.AddWithValue("@QtyXbox", QtyXbox)
            Cmd.Parameters.AddWithValue("@UOM", UOM)
            Cmd.Parameters.AddWithValue("@ProductName", ProductName)
            Cmd.Parameters.AddWithValue("@BoxNumber", BoxNumber)
            Cmd.Parameters.AddWithValue("@BoxCode", BoxCode)
            Cmd.Parameters.AddWithValue("@Commentq", Commentq)
            Cmd.Parameters.AddWithValue("@AWB", AWB)
            Cmd.Parameters.AddWithValue("@HAWB", HAWB)
            Cmd.Parameters.AddWithValue("@Cust", Cust)
            Cmd.Parameters.AddWithValue("@ProductCode", ProductCode)
            Cmd.Parameters.AddWithValue("@FarmName", FarmName)
            Cmd.Parameters.AddWithValue("@ManuFacId", ManuFacId)
            Cmd.Parameters.AddWithValue("@UnitsPerBox", UnitsPerBox)
            Cmd.Parameters.AddWithValue("@ImportedFrom", ImportedFrom)
            Cmd.Parameters.AddWithValue("@InvoiceNum", InvoiceNum)
            Cmd.Parameters.AddWithValue("@Length", Length)
            Cmd.Parameters.AddWithValue("@Width", Width)
            Cmd.Parameters.AddWithValue("@Height", Height)
            Cmd.Parameters.AddWithValue("@Cost", Cost)
            Dim result As Integer = Cmd.ExecuteScalar()
            Cmd.Dispose()
            SqlCon.Close()

            Return result
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    Public Class GetConfirmedPO
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

        Private _TotalConf As Integer
        Public Property TotalConf() As Integer
            Get
                Return _TotalConf
            End Get
            Set(ByVal value As Integer)
                _TotalConf = value
            End Set
        End Property

        Public Function GetConfirmedPOs(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of ConfirmedPO)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of ConfirmedPO)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetPurchaseOrderList", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                    cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                    cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        'POQID,pokey,ORD,Farm,PONUM,shipdate,city,prodnamq,qtybox,qtyxbox,unitcosq,uom,qtybconf,customer,boxnum,awb,hawb,COMMENTQ,boxcode,upc,PASSNAME,
                        'PROSTATUS,COLORCODE,CAT,FontColor,BGColor,Invoice,Lenght,Width,Height,Market

                        Dim u As New ConfirmedPO()
                        u.ID = row("POQID")
                        u.Farm = row("farm")
                        u.AWB = row("AWB")
                        u.ORD = row("ORD")
                        u.BoxCode = row("boxcode")
                        u.QtyBox = row("qtybox")
                        u.BoxNum = row("boxnum")
                        u.Breakdown = row("commentq")
                        u.Buyer = row("passname")
                        u.QtyBConf = row("qtybconf")
                        u.UnitCosq = row("unitcosq")
                        u.Cust = row("customer")
                        u.Hawb = row("hawb")
                        u.Origin = row("city")
                        u.QtyXbox = row("qtyxbox")
                        u.POKEY = row("POKEY")
                        u.PONumber = row("PONUM")
                        u.Product = (IIf(Convert.ToString(row("prodnamq") = ""), "-", row("prodnamq")))
                        u.ShipDate = row("Shipdate")
                        u.Uom = row("uom")
                        u.Upc = row("upc")
                        u.Invoice = row("Invoice")
                        u.Length = Convert.ToInt32(row("Lenght")).ToString()
                        u.Width = Convert.ToInt32(row("Width")).ToString()
                        u.Height = Convert.ToInt32(row("Height")).ToString()
                        u.FlowerDetails.ColorCode = row("ColorCode")
                        u.FlowerDetails.ForeColor = row("FontColor")
                        u.FlowerDetails.BGColor = row("BGColor")
                        u.FlowerDetails.Flower = row("prodnamq")
                        u.FlowerDetails.CAT = row("CAT")
                        u.Market = IIf(row("Market") Is DBNull.Value, "", row("Market"))
                        u.PROStatus = IIf(row("PROSTATUS") Is DBNull.Value, "", row("PROSTATUS"))
                        uList.Add(u)
                    Next
                    Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    Me.TotalBoxes = ds.Tables(1).Rows(0)(1)
                    Me.TotalConf = ds.Tables(1).Rows(0)(2)

                    Dim po As New ConfirmedPO()
                    po.RowNo = "0"
                    po.Farm = ""
                    po.AWB = ""
                    po.ORD = ""
                    po.BoxCode = ""
                    po.QtyBox = TotalBoxes
                    po.BoxNum = ""
                    po.Breakdown = ""
                    po.Buyer = ""
                    po.QtyBConf = TotalConf
                    po.UnitCosq = 0
                    po.Cust = ""
                    po.Hawb = ""
                    po.Origin = ""
                    po.QtyXbox = 0
                    po.POKEY = 0
                    po.PONumber = ""
                    po.Product = ""
                    po.ShipDate = Date.Now
                    po.Uom = ""
                    po.Upc = ""
                    po.FlowerDetails.ColorCode = ""
                    po.FlowerDetails.ForeColor = ""
                    po.FlowerDetails.BGColor = ""
                    po.FlowerDetails.Flower = ""
                    po.FlowerDetails.CAT = ""
                    uList.Add(po)
                End Using
            End Using
            Return uList
        End Function

    End Class

    Public Function RptGetConfirmedPOs(ByVal Pokey As String, ByVal ORD As String) As DataTable
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim uList As New List(Of ConfirmedPO)()
        Using con As New SqlConnection(ConStr)
            con.Open()
            Using cmd As New SqlCommand("SpGetRptPODetails", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New SqlParameter("@Pokey", Pokey))
                cmd.Parameters.Add(New SqlParameter("@ORD", ORD))
                Dim da As New SqlDataAdapter(cmd)
                Dim ds As New DataSet
                da.Fill(ds)

                Return ds.Tables(0)
            End Using
        End Using

    End Function

    Public Shared Function ExportConfirmedPOtoManualPO(ByVal CreatedUserID As Integer, ByVal AWB As String, ByVal DetailsList As String, ByVal POKeys As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""

                Using cmd As New SqlCommand("spExportConfirmedPOtoManualPO", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@CreatedUserId", CreatedUserID))
                    cmd.Parameters.Add(New SqlParameter("@AWB", AWB))
                    cmd.Parameters.Add(New SqlParameter("@DetailsList", DetailsList))
                    Dim result As String = cmd.ExecuteScalar()
                    'For Update log
                    If (result <> "MoreFarms") Then
                        Logs.Savelog(CreatedUserID, "Confirmed PO", "ExportConfirmedPOtoManualPO", "Export Data from Confirmed Po to Users - " + result, POKeys)
                    End If
                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ExportConfirmedPOtoManualPO")
            Return "error"
        End Try
    End Function

    Public Shared Function RemoveExportedRecordFromManualPO(ByVal CreatedUserID As Integer, ByVal DetailsList As String, ByVal POKeys As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""

                Using cmd As New SqlCommand("spRemoveExportedRecordsFromManualPO", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@List", DetailsList))
                    Dim result As String = cmd.ExecuteScalar()
                    'For Update log
                    'If (result <> "MoreFarms") Then
                    '    'Logs.Savelog(CreatedUserID, "Confirmed PO", "RemoveExportedRecordFromManualPO", "Remove E- " + result, POKeys)
                    'End If
                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ExportConfirmedPOtoManualPO")
            Return "error"
        End Try
    End Function

    Public Shared Function GetFarmAssignedUserName(ByVal FarmCode As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""

                Using cmd As New SqlCommand("select  (SELECT  STUFF((SELECT ',' + CAST(u.UserName AS VARCHAR(MAX)) FROM tblUsers u " +
                " inner join  tblUserFarm uf on u.ID=uf.UserID where uf.Farm=@FarmCode group by u.UserName FOR XML PATH('')),1,1,''))", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@FarmCode", FarmCode))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    Dim UserName As String = ds.Tables(0).Rows(0)(0).ToString()
                    Return UserName
                End Using
            End Using
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function
End Class


Public Class ConfirmedPO


    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
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

    Private _FlowerDetails As New Flower
    Public Property FlowerDetails As Flower
        Get
            Return _FlowerDetails
        End Get
        Set(value As Flower)
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

End Class