Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient


Public Class CustUser

    Public Shared Function GetAWBNumbersForCustUser(ByVal CustNumber As String) As List(Of CustManualPODetail)
        Try
            Dim uList As New List(Of CustManualPODetail)
            Dim obj As New BloomService
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select distinct awb from tblPODetails where awb <>'' and custnumber=@CustNumber", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@CustNumber", CustNumber)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New CustManualPODetail
                        u.AWB = obj.FormatAWBnumber(row("AWB"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetAWBNumbersForCustUser")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFamrsForCustUser(ByVal CustNumber As String) As List(Of CustManualPODetail)
        Try
            Dim uList As New List(Of CustManualPODetail)
            Dim obj As New BloomService
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select distinct farm from tblPODetails where farm <>'' and custnumber=@CustNumber", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@CustNumber", CustNumber)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New CustManualPODetail
                        u.Farm = row("Farm")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetFamrsForCustUser")
            Return Nothing
        End Try
    End Function

    Public Class GetCustPODetail

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

        'Private _AWB As String
        'Public Property AWB() As String
        '    Get
        '        Return _AWB
        '    End Get
        '    Set(ByVal value As String)
        '        _AWB = value
        '    End Set
        'End Property
        'Private _HAWB As String
        'Public Property HAWB() As String
        '    Get
        '        Return _HAWB
        '    End Get
        '    Set(ByVal value As String)
        '        _HAWB = value
        '    End Set
        'End Property

        'Private _ShipDate As DateTime
        'Public Property ShipDate() As DateTime
        '    Get
        '        Return _ShipDate
        '    End Get
        '    Set(ByVal value As DateTime)
        '        _ShipDate = value
        '    End Set
        'End Property

        'Private _Invoice As String
        'Public Property Invoice() As String
        '    Get
        '        Return _Invoice
        '    End Get
        '    Set(ByVal value As String)
        '        _Invoice = value
        '    End Set
        'End Property

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

        Public Function GetCustManualPODetail(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of CustManualPODetail)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of CustManualPODetail)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetCustManualPODetails]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        If ds.Tables(0).Rows.Count > 0 Then


                            For Each row In ds.Tables(0).Rows
                                Dim u As New CustManualPODetail()
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
                                u.TotalUnits = IIf(row("Units") Is DBNull.Value, "0", row("Units"))
                                u.Comments = Convert.ToString(row("Comments"))
                                u.BreakDown = Convert.ToString(row("BreakDown"))
                                u.Type = IIf(row("Type") Is DBNull.Value, "", row("Type"))
                                u.ShipDate = Convert.ToDateTime(IIf(Convert.ToString(row("shippeddate")) = "", DateTime.Now, row("shippeddate"))).ToString("yyyy-MM-dd")
                                u.BoxCode = Convert.ToString(row("BoxCode"))
                                u.BoxNumber = Convert.ToString(row("BoxNumber"))
                                u.FlowrDetails.ForeColor = Convert.ToString(row("Color"))
                                u.FlowrDetails.BGColor = Convert.ToString(row("BGColor"))
                                u.Scanned = Convert.ToString(row("Scanned"))
                                u.Missing = Convert.ToString(row("Missing"))
                                u.AgencyCode = IIf(IsDBNull(row("AgencyCode")), "", row("AgencyCode"))
                                u.Airport = IIf(IsDBNull(row("Airport")), "", row("Airport"))
                                uList.Add(u)
                            Next
                            If ds.Tables(0).Rows.Count <= 0 Then
                                Me.TotalRows = 0
                                Me.TotalBoxes = 0
                                Me.TotalUnits = 0
                                Me.TotalCost = 0
                                'Me.AWB = ""
                                'Me.HAWB = ""
                                'Me.Invoice = ""
                                'Me.ShipDate = DateTime.Now.ToString("yyyy-MM-dd")
                                Me.TotalScanned = 0
                                Me.TotalMissing = 0
                            Else
                                Me.TotalRows = ds.Tables(1).Rows(0)(0)
                                Me.TotalBoxes = IIf(ds.Tables(1).Rows(0)(1) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(1))
                                Me.TotalUnits = IIf(ds.Tables(1).Rows(0)(2) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(2))
                                Me.TotalCost = IIf(ds.Tables(1).Rows(0)(3) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(3))
                                Me.TotalScanned = IIf(ds.Tables(1).Rows(0)(4) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(4))
                                Me.TotalMissing = IIf(ds.Tables(1).Rows(0)(5) Is DBNull.Value, 0, ds.Tables(1).Rows(0)(5))
                                'If ds.Tables(2).Rows.Count > 0 Then
                                '    Me.AWB = ds.Tables(2).Rows(0)(0)
                                '    Me.HAWB = IIf(ds.Tables(2).Rows(0)(1) Is DBNull.Value, "", ds.Tables(2).Rows(0)(1))
                                '    Me.ShipDate = Convert.ToDateTime(IIf(Convert.ToString(ds.Tables(2).Rows(0)(2)) = "", DateTime.Now, ds.Tables(2).Rows(0)(2))).ToString("yyyy-MM-dd")
                                '    Me.Invoice = IIf(ds.Tables(2).Rows(0)(3) Is DBNull.Value, 0, ds.Tables(2).Rows(0)(3))
                                'Else
                                '    Me.AWB = ""
                                '    Me.HAWB = ""
                                '    Me.Invoice = ""
                                '    Me.ShipDate = DateTime.Now.ToString("yyyy-MM-dd")
                                'End If
                            End If
                            Dim af As New CustManualPODetail()
                            af.DetailID = 0
                            af.HeaderID = 0
                            af.Farm = ""
                            af.Flower = ""
                            af.Description = ""
                            af.AWB = ""
                            af.HAWB = ""
                            af.Boxes = TotalBoxes
                            af.PO = ""
                            af.Invoice = ""
                            af.UOM = ""
                            af.UnitsPerBunch = ""
                            af.CustNumber = ""
                            af.Cost = ""
                            af.TotalCost = TotalCost
                            af.TotalUnits = TotalUnits
                            af.Comments = ""
                            af.BreakDown = ""
                            af.Type = ""
                            af.ShipDate = Convert.ToDateTime("01/01/1900") '.Date
                            af.BoxCode = ""
                            af.BoxNumber = ""
                            af.FlowrDetails.ForeColor = ""
                            af.FlowrDetails.BGColor = ""
                            af.Scanned = TotalScanned
                            af.Missing = TotalMissing
                            af.AgencyCode = ""
                            af.Airport = ""
                            uList.Add(af)

                        End If
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCustManualPODetail")
                Return Nothing
            End Try
        End Function


    End Class


End Class

Public Class CustManualPODetail
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

    Private _DetailID As String
    Public Property DetailID() As String
        Get
            Return _DetailID
        End Get
        Set(ByVal value As String)
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

    Private _AgencyCode As String
    Public Property AgencyCode() As String
        Get
            Return _AgencyCode
        End Get
        Set(ByVal value As String)
            _AgencyCode = value
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

End Class