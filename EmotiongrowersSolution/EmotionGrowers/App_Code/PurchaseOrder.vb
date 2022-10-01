Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Xml


Public Class PurchaseOrders

    Public Class GetPurchaseOrderHeader
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

        Private _TotalFBE As Decimal
        Public Property TotalFBE() As Decimal
            Get
                Return _TotalFBE
            End Get
            Set(ByVal value As Decimal)
                _TotalFBE = value
            End Set
        End Property
        Public Function GetPurchaseOrderHeader(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of PurchaseOrder)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of PurchaseOrder)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetPurchaseOrder]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New PurchaseOrder()
                            u.ID = row("ID")
                            u.PONumber = row("PONUM")
                            'u.Farm.Farm = row("Farm")
                            u.FarmCode = row("Farm")
                            'u.Farm.Name = row("FarmName")
                            u.FarmName = row("FarmName")
                            'u.Farm.City = row("CITY")
                            u.FarmCity = row("CITY")
                            u.PODate = row("PODate")
                            u.POStatus = row("POStatus")
                            u.ShipDate = row("ShipDate")
                            u.WH = row("WH")
                            u.CargoDay = row("Cargo Day")
                            u.Boxes = row("Boxes")
                            u.BoxesFBE = row("BoxesFBE")
                            u.TotalUnits = row("TotalUnits")
                            u.POType = row("POType")
                            uList.Add(u)
                        Next
                        If ds.Tables(0).Rows.Count <= 0 Then
                            Me.TotalRows = ds.Tables(1).Rows(0)(0)
                            Me.TotalBoxes = 0
                            Me.TotalFBE = 0
                            Me.TotalUnits = 0
                        Else
                            Me.TotalBoxes = ds.Tables(1).Rows(0)(1)
                            Me.TotalFBE = ds.Tables(1).Rows(0)(2)
                            Me.TotalUnits = ds.Tables(1).Rows(0)(3)
                        End If
                        Dim po As New PurchaseOrder()
                        po.ID = 0
                        po.PONumber = ""
                        'po.Farm.Farm = ""
                        'po.Farm.Name = ""
                        'po.Farm.City = ""

                        po.FarmCode = ""
                        po.FarmName = ""
                        po.FarmCity = ""

                        po.PODate = DateTime.Now.ToString("yyyy/MM/dd")
                        po.POStatus = ""
                        po.ShipDate = DateTime.Now.ToString("yyyy/MM/dd")
                        po.WH = "Total"
                        po.Boxes = TotalBoxes
                        po.BoxesFBE = TotalFBE
                        po.TotalUnits = TotalUnits
                        po.POType = ""
                        uList.Add(po)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetPurchaseOrderHeader")
                Return Nothing
            End Try
        End Function
        Public Function LoadPoDetailsByPoNumber(ByVal PO As String) As DataSet
            'added by Belal 20 Aug 2020
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of PurchaseOrder)()
                Dim ds As New DataSet

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[SPLoadPODetailsByPONumber]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@PO", PO))
                        Dim da As New SqlDataAdapter(cmd)
                        da.Fill(ds)

                    End Using
                End Using

                Return ds
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in LoadPoDetailsByPoNumber")
                Return Nothing
            End Try
        End Function
    End Class

    ''' <summary>
    ''' STA::13-NOV-2015::to delete the PO with Details
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="PONumner"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>

    Public Shared Function Updatepoheaderstatus(ByVal PONumber As String, ByVal Status As String, ByVal totalPieces As Int32) As String
        'added by Belal 19 Sept 2020
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spUpdatePOHstatus]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONumber", PONumber))
                    cmd.Parameters.Add(New SqlParameter("@Status", Status))
                    cmd.Parameters.Add(New SqlParameter("@Pieces", totalPieces))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdatePOHstatus")
            Return "error"
        End Try
    End Function
    Public Shared Function CheckIfPOAlreadyPosted(ByVal PONumber As String) As String
        'added by Belal 18 Nov 2020
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataTable()
            Dim returnMsg As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spCheckIfPOAlreadyPosted]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PONumber", PONumber))
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(dt)
                End Using
            End Using
            If dt.Rows.Count > 0 Then
                returnMsg = "AC POSTED"
            End If
            Return returnMsg
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPOStatus")
            Return ""
        End Try
    End Function

    Public Shared Function CheckPOStatus(ByVal PONum As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim POStatus As String = "error"

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Top 1 POStat from F_POH where PONum=@PONum", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@PONum", PONum)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    If Not ds Is Nothing And ds.Tables(0).Rows.Count > 0 Then
                        POStatus = ds.Tables(0).Rows(0)("POStat")
                    End If
                End Using
            End Using
            Return POStatus
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckPOStatus")
            Return "error"
        End Try
    End Function

    Public Shared Function DeletePurchaseOrder(ByVal HeaderId As String, ByVal PONumner As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spDeletePOdetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.ExecuteNonQuery()
                    'For Update log
                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        'If ID = 0 Then
                        Logs.Savelog(loginuserdetails.ID, "Purchase Order", "DeletePurchaseOrder", "" + PONumner + " was Deleted PO.", "PO# : " + PONumner.ToString() + " , ID : " + HeaderId.ToString())
                        'Else
                        '    Logs.Savelog(loginuserdetails.ID, "PO Order Details", "SavePODetails", "Modified Users - " + Farm + " [" + Header + "]")
                        'End If
                    End If

                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeletePurchaseOrder")
            Return "error"
        End Try

    End Function

    ''' <summary>
    ''' STA::13-NOV-2015::to get Purchase Order Header Details
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetPurchaseOrderHeaderByID(ByVal HeaderId As Integer) As PurchaseOrder
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New PurchaseOrder()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwGetPurchaseOrder where Id=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", HeaderId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.PONumber = row("PONUM")
                        u.Farm.Farm = row("Farm")
                        u.Farm.Name = row("FarmName")
                        u.Farm.City = row("CITY")
                        u.Farm.FOB = row("FOB")
                        u.PODate = row("PODate")
                        u.POStatus = row("POStatus")
                        u.ShipDate = row("ShipDate")
                        u.WH = row("WH")
                        u.CargoDay = row("Cargo Day")
                        u.Boxes = row("Boxes")
                        u.BoxesFBE = row("BoxesFBE")
                        u.TotalUnits = row("TotalUnits")
                        u.Comments = Convert.ToString(row("comment"))
                        u.POType = row("POType")
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPurchaseOrderHeaderByID")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetPurchaseOrderHeaderByPONum(ByVal PONum As String) As PurchaseOrder
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New PurchaseOrder()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwGetPurchaseOrder where PONUM=@PONum", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@PONum", PONum)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.PONumber = row("PONUM")
                        u.Farm.Farm = row("Farm")
                        u.Farm.Name = row("FarmName")
                        u.Farm.City = row("CITY")
                        u.Farm.FOB = row("FOB")
                        u.PODate = row("PODate")
                        u.POStatus = row("POStatus")
                        u.ShipDate = row("ShipDate")
                        u.WH = row("WH")
                        u.CargoDay = row("Cargo Day")
                        u.Boxes = row("Boxes")
                        u.BoxesFBE = row("BoxesFBE")
                        u.TotalUnits = row("TotalUnits")
                        u.Comments = Convert.ToString(row("comment"))
                        u.POType = row("POType")
                        u.PassName = row("PASSNAME")
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPurchaseOrderHeaderByID")
            Return Nothing
        End Try
    End Function
End Class

Public Class PurchaseOrder
    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Private _Farm As New Farm
    Public Property Farm() As Farm
        Get
            Return _Farm
        End Get
        Set(ByVal value As Farm)
            _Farm = value
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

    Private _PODate As DateTime
    Public Property PODate() As DateTime
        Get
            Return _PODate
        End Get
        Set(ByVal value As DateTime)
            _PODate = value
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

    Private _CargoDay As String
    Public Property CargoDay() As String
        Get
            Return _CargoDay
        End Get
        Set(ByVal value As String)
            _CargoDay = value
        End Set
    End Property

    Private _RecDate As DateTime
    Public Property RecDate() As DateTime
        Get
            Return _RecDate
        End Get
        Set(ByVal value As DateTime)
            _RecDate = value
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

    Private _Carrier As String
    Public Property Carrier() As String
        Get
            Return _Carrier
        End Get
        Set(ByVal value As String)
            _Carrier = value
        End Set
    End Property

    Private _PTERMS As String
    Public Property PTERMS() As String
        Get
            Return _PTERMS
        End Get
        Set(ByVal value As String)
            _PTERMS = value
        End Set
    End Property

    Private _PDISC As Decimal
    Public Property PDISC() As Decimal
        Get
            Return _PDISC
        End Get
        Set(ByVal value As Decimal)
            _PDISC = value
        End Set
    End Property

    Private _PDAYS As Integer
    Public Property PDAYS() As Integer
        Get
            Return _PDAYS
        End Get
        Set(ByVal value As Integer)
            _PDAYS = value
        End Set
    End Property

    Private _POTotal As Decimal
    Public Property POTotal() As Decimal
        Get
            Return _POTotal
        End Get
        Set(ByVal value As Decimal)
            _POTotal = value
        End Set
    End Property

    Private _POStatus As String
    Public Property POStatus() As String
        Get
            Return _POStatus
        End Get
        Set(ByVal value As String)
            _POStatus = value
        End Set
    End Property

    Private _CONFDate As DateTime
    Public Property CONFDate() As DateTime
        Get
            Return _CONFDate
        End Get
        Set(ByVal value As DateTime)
            _CONFDate = value
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

    Private _AIRPORT As String
    Public Property AIRPORT() As String
        Get
            Return _AIRPORT
        End Get
        Set(ByVal value As String)
            _AIRPORT = value
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

    Private _Boxes As Integer
    Public Property Boxes() As Integer
        Get
            Return _Boxes
        End Get
        Set(ByVal value As Integer)
            _Boxes = value
        End Set
    End Property

    Private _BoxesFBE As Decimal
    Public Property BoxesFBE() As Decimal
        Get
            Return _BoxesFBE
        End Get
        Set(ByVal value As Decimal)
            _BoxesFBE = value
        End Set
    End Property

    Private _TotalUnits As Decimal
    Public Property TotalUnits() As Decimal
        Get
            Return _TotalUnits
        End Get
        Set(ByVal value As Decimal)
            _TotalUnits = value
        End Set
    End Property

    Private _TotalVal As Decimal
    Public Property TotalVal() As Decimal
        Get
            Return _TotalVal
        End Get
        Set(ByVal value As Decimal)
            _TotalVal = value
        End Set
    End Property

    Private _Standing As Boolean
    Public Property Standing() As Boolean
        Get
            Return _Standing
        End Get
        Set(ByVal value As Boolean)
            _Standing = value
        End Set
    End Property

    Private _StanDay As String
    Public Property StanDay() As String
        Get
            Return _StanDay
        End Get
        Set(ByVal value As String)
            _StanDay = value
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

    Private _Print As Boolean
    Public Property Print() As Boolean
        Get
            Return _Print
        End Get
        Set(ByVal value As Boolean)
            _Print = value
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

    Private _FarmCode As String
    Public Property FarmCode() As String
        Get
            Return _Comments
        End Get
        Set(ByVal value As String)
            _Comments = value
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

    Private _FarmCity As String
    Public Property FarmCity() As String
        Get
            Return _FarmCity
        End Get
        Set(ByVal value As String)
            _FarmCity = value
        End Set
    End Property

End Class

Public Class PurchaseOrderDetails

    ''' <summary>
    ''' STA::05-NOV-2015::to save the PO details for Header
    ''' </summary>
    ''' <param name="OrderDetails"></param>
    ''' <param name="PONumber"></param>
    ''' <param name="PODate"></param>
    ''' <param name="Farm"></param>
    ''' <param name="ShipDate"></param>
    ''' <param name="RecDate"></param>
    ''' <param name="POType"></param>
    ''' <param name="Carrier"></param>
    ''' <param name="POStatus"></param>
    ''' <param name="ConfDate"></param>
    ''' <param name="Fob"></param>
    ''' <param name="AirPort"></param>
    ''' <param name="WH"></param>
    ''' <param name="CreatedUserId"></param>
    ''' <param name="StartingBoxNo"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function SavePODetails(ByVal OrderDetails As String, ByVal PONumber As String, ByVal PODate As String, ByVal Farm As String,
                                        ByVal ShipDate As String, ByVal RecDate As String, ByVal POType As String,
                                        ByVal Carrier As String, ByVal POStatus As String, ByVal ConfDate As String,
                                        ByVal Fob As String, ByVal AirPort As String,
                                        ByVal WH As String, ByVal CreatedUserId As Integer,
                                        ByVal StartingBoxNo As Integer, ByVal Comments As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spSavePODetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@PODetails", OrderDetails)
                    cmd.Parameters.AddWithValue("@PONumber", PONumber)
                    cmd.Parameters.AddWithValue("@PODate", PODate)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.Parameters.AddWithValue("@ShipDate", ShipDate)
                    cmd.Parameters.AddWithValue("@RecDate", RecDate)
                    cmd.Parameters.AddWithValue("@POType", POType)
                    cmd.Parameters.AddWithValue("@Carrier", Carrier)
                    cmd.Parameters.AddWithValue("@POStatus", POStatus)
                    cmd.Parameters.AddWithValue("@ConfDate", ConfDate)
                    cmd.Parameters.AddWithValue("@FOB", Fob)
                    cmd.Parameters.AddWithValue("@Airport", AirPort)
                    cmd.Parameters.AddWithValue("@WH", WH)
                    cmd.Parameters.AddWithValue("@CreatedUSerId", CreatedUserId)
                    cmd.Parameters.AddWithValue("@StartingBoxNo", StartingBoxNo)
                    cmd.Parameters.AddWithValue("@Comments", Comments)


                    Dim result As Integer = cmd.ExecuteScalar()
                    'For Update log
                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        'If ID = 0 Then
                        Logs.Savelog(loginuserdetails.ID, "PO Order Details", "SavePODetails", "Added PO details,PO# is " + PONumber.ToString() + "", "PO# : " + PONumber.ToString() + " , ID : " + result.ToString())
                        'Else
                        '    Logs.Savelog(loginuserdetails.ID, "PO Order Details", "SavePODetails", "Modified Users - " + Farm + " [" + Header + "]")
                        'End If
                    End If

                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SavePODetails")
            Return "error"
        End Try

    End Function

    ''' <summary>
    ''' STA::10-NOV-2015::to update the PO
    ''' </summary>
    ''' <param name="OrderDetails"></param>
    ''' <param name="POheaderId"></param>
    ''' <param name="PONumber"></param>
    ''' <param name="PODate"></param>
    ''' <param name="Farm"></param>
    ''' <param name="ShipDate"></param>
    ''' <param name="RecDate"></param>
    ''' <param name="POType"></param>
    ''' <param name="Carrier"></param>
    ''' <param name="POStatus"></param>
    ''' <param name="ConfDate"></param>
    ''' <param name="Fob"></param>
    ''' <param name="AirPort"></param>
    ''' <param name="WH"></param>
    ''' <param name="CreatedUserId"></param>
    ''' <param name="Comments"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function UpdatePODetails(ByVal OrderDetails As String, ByVal POheaderId As String, ByVal PONumber As String, ByVal PODate As String, ByVal Farm As String,
                                        ByVal ShipDate As String, ByVal RecDate As String, ByVal POType As String,
                                        ByVal Carrier As String, ByVal POStatus As String, ByVal ConfDate As String,
                                        ByVal Fob As String, ByVal AirPort As String,
                                        ByVal WH As String, ByVal CreatedUserId As Integer, ByVal Comments As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spUpdatePODetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@PODetails", OrderDetails)
                    cmd.Parameters.AddWithValue("@POHeaderid", POheaderId)
                    cmd.Parameters.AddWithValue("@PONumber", PONumber)
                    cmd.Parameters.AddWithValue("@PODate", PODate)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.Parameters.AddWithValue("@ShipDate", ShipDate)
                    cmd.Parameters.AddWithValue("@RecDate", RecDate)
                    cmd.Parameters.AddWithValue("@POType", POType)
                    cmd.Parameters.AddWithValue("@Carrier", Carrier)
                    cmd.Parameters.AddWithValue("@POStatus", POStatus)
                    cmd.Parameters.AddWithValue("@ConfDate", ConfDate)
                    cmd.Parameters.AddWithValue("@FOB", Fob)
                    cmd.Parameters.AddWithValue("@Airport", AirPort)
                    cmd.Parameters.AddWithValue("@WH", WH)
                    cmd.Parameters.AddWithValue("@Comments", Comments)
                    cmd.ExecuteNonQuery()
                    'For Update log
                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        'If ID = 0 Then
                        Logs.Savelog(loginuserdetails.ID, "PO Order Details", "SavePODetails", "Added PO details,PO# is " + PONumber.ToString() + "", "PO# : " + PONumber.ToString() + " , ID : " + POheaderId.ToString())
                        'Else
                        '    Logs.Savelog(loginuserdetails.ID, "PO Order Details", "SavePODetails", "Modified Users - " + Farm + " [" + Header + "]")
                        'End If
                    End If

                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SavePODetails")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' STA::16-NOV-2015::to add new Product for PO
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="Farm"></param>
    ''' <param name="Flower"></param>
    ''' <param name="FlowerName"></param>
    ''' <param name="FlowerCat"></param>    
    ''' <param name="Quantity"></param>
    ''' <param name="UOM"></param>
    ''' <param name="Units"></param>
    ''' <param name="Bunches"></param>
    ''' <param name="BoxNumber"></param>
    ''' <param name="cost"></param>
    ''' <param name="Customer"></param>
    ''' <param name="Comments"></param>
    ''' <param name="Type"></param>
    ''' <param name="Order"></param>
    ''' <param name="Invoice"></param>
    ''' <param name="PONumber"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function AddPOProductDetails(ByVal HeaderId As Integer, ByVal Farm As String, ByVal Flower As String, ByVal FlowerName As String, ByVal FlowerCat As String,
                                                ByVal Quantity As Integer,ByVal UOM As String, ByVal Units As Integer, ByVal Bunches As Integer, ByVal BoxNumber As Integer, ByVal cost As Decimal,
                                               ByVal Customer As Integer, ByVal Comments As String, ByVal Type As String, ByVal Order As String,
                                               ByVal Invoice As Integer, ByVal PONumber As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader
            Dim RecScopeID As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("sp_AddProducts", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.Parameters.AddWithValue("@Flower", Flower)
                    cmd.Parameters.AddWithValue("@Name", FlowerName)
                    cmd.Parameters.AddWithValue("@Cat", FlowerCat)
                    cmd.Parameters.AddWithValue("@Quantity", Quantity)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    cmd.Parameters.AddWithValue("@Units", Units)
                    cmd.Parameters.AddWithValue("@Bunches", Bunches)
                    cmd.Parameters.AddWithValue("@BoxNumber", BoxNumber)
                    cmd.Parameters.AddWithValue("@Cost", cost)
                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    cmd.Parameters.AddWithValue("@Order", Order)
                    cmd.Parameters.AddWithValue("@Type", Type)
                    cmd.Parameters.AddWithValue("@Invoice", Invoice)
                    cmd.Parameters.AddWithValue("@Comment", Comments)

                    RecScopeID = cmd.ExecuteScalar()
                    'For Update log
                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        'If ID = 0 Then
                        Logs.Savelog(loginuserdetails.ID, "PO Order Details", "AddPOProductDetails", "Added Product " + Flower + " for PO# is " + PONumber.ToString() + "", "PO# : " + PONumber.ToString() + " ,RecID : " + RecScopeID.ToString())
                        'Else
                        '    Logs.Savelog(loginuserdetails.ID, "PO Order Details", "SavePODetails", "Modified Users - " + Farm + " [" + Header + "]")
                        'End If
                    End If

                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in AddPOProductDetails")
            Return "error"
        End Try

    End Function

    ''' <summary>
    ''' STA::16-NOV-2015::to update the PO product details
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="Flower"></param>
    ''' <param name="FlowerName"></param>
    ''' <param name="FlowerCat"></param>
    ''' <param name="ColorCode"></param>
    ''' <param name="Quantity"></param>
    ''' <param name="UOM"></param>
    ''' <param name="Units"></param>
    ''' <param name="Bunches"></param>
    ''' <param name="BoxNumber"></param>
    ''' <param name="cost"></param>
    ''' <param name="Customer"></param>
    ''' <param name="Comments"></param>
    ''' <param name="Type"></param>
    ''' <param name="Order"></param>
    ''' <param name="Invoice"></param>
    ''' <param name="PONumber"></param>
    ''' <param name="Recid"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function UpdatePOProductDetails(ByVal HeaderId As Integer, ByVal Flower As String, ByVal FlowerName As String, ByVal FlowerCat As String, ByVal ColorCode As String,
                                                ByVal Quantity As Integer, ByVal UOM As String, ByVal Units As Integer, ByVal Bunches As Integer, ByVal BoxNumber As Integer, ByVal cost As Decimal,
                                               ByVal Customer As Integer, ByVal Comments As String, ByVal Type As String, ByVal Order As String,
                                               ByVal Invoice As Integer, ByVal PONumber As String, Recid As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("sp_UpdateProducts", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.Parameters.AddWithValue("@RecId", Recid)
                    cmd.Parameters.AddWithValue("@Flower", Flower)
                    cmd.Parameters.AddWithValue("@Name", FlowerName)
                    cmd.Parameters.AddWithValue("@Cat", FlowerCat)
                    cmd.Parameters.AddWithValue("@ColorCode", ColorCode)
                    cmd.Parameters.AddWithValue("@Quantity", Quantity)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    cmd.Parameters.AddWithValue("@Units", Units)
                    cmd.Parameters.AddWithValue("@Bunches", Bunches)
                    'cmd.Parameters.AddWithValue("@BoxNumber", BoxNumber)
                    cmd.Parameters.AddWithValue("@Cost", cost)
                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    cmd.Parameters.AddWithValue("@Order", Order)
                    cmd.Parameters.AddWithValue("@Type", Type)
                    cmd.Parameters.AddWithValue("@Invoice", Invoice)
                    cmd.Parameters.AddWithValue("@Comment", Comments)
                    cmd.ExecuteNonQuery()
                    'For Update log
                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        Logs.Savelog(loginuserdetails.ID, "PO Order Details", "UpdatePOProductDetails", "Updated Product " + Flower + " for PO# is " + PONumber.ToString() + "", "PO# : " + PONumber.ToString() + " , ID : " + Recid.ToString())
                    End If
                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdatePOProductDetails")
            Return "error"
        End Try

    End Function

    Public Shared Function DeletePOProductDetails(ByVal HeaderId As Integer, ByVal ID As Integer, PONumber As String, ByVal Product As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("sp_DeleteProduct", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()

                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        Logs.Savelog(loginuserdetails.ID, "PO Order Details", "DeletePOProductDetails", "Product deleted " + Product + ",PO# is " + PONumber.ToString() + "", "PO# : " + PONumber.ToString() + " , ID : " + ID.ToString())
                    End If

                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in AddPOProductDetails")
            Return "error"
        End Try

    End Function

    ''' <summary>
    ''' STA::16-NOV-2015::to get the Product details by Id
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetPOProductDetailsById(ByVal HeaderId As Integer, ByVal ID As Integer) As PurchaseOrderDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New PurchaseOrderDetail

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwPoDetails where HeaderId=@HeaderId and RecId=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.RECID = row("recid")
                        u.Farm = row("Farm")
                        u.Flower.Flower = row("flower")
                        u.Flower.Name = row("FlowerName")
                        u.Flower.CAT = row("Cat")
                        u.Flower.ColorCode = row("colorcode")
                        u.Quantity = row("QtyBox")
                        u.UOM = row("UOM")
                        u.Units = row("units")
                        u.Bunches = row("Bunches")
                        u.Cost = row("cost")
                        u.BoxNumber = IIf(Convert.ToString(row("boxnum")) = "", 0, row("boxnum"))
                        u.Customer = IIf(Convert.ToString(row("customer")) = "", 0, row("customer"))
                        u.Order = Convert.ToString(row("order"))
                        u.Invoice = IIf(Convert.ToString(row("invoice")) = "", 0, row("invoice"))
                        u.Comments = Convert.ToString(row("Commentq"))
                        u.Type = Convert.ToString(row("type"))
                    Next

                    Return u
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPOProductDetailsById")
            Return Nothing
        End Try
    End Function

    Public Class GetPODetails

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

        Private _TotalAmount As Decimal
        Public Property TotalAmount() As Decimal
            Get
                Return _TotalAmount
            End Get
            Set(ByVal value As Decimal)
                _TotalAmount = value
            End Set
        End Property

        ''STA::06-NOV-2015::to get the PO details grid
        Public Function GetPODetails(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of PurchaseOrderDetail)

            Dim uList As New List(Of PurchaseOrderDetail)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetPurchaseOrderDetail]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New PurchaseOrderDetail()
                            u.RECID = row("RECID")
                            u.POHeader.ID = row("HeaderId")
                            u.POHeader.PONumber = row("PONUM")
                            u.Farm = row("Farm")
                            u.Flower.Flower = row("Flower")
                            u.Flower.Name = row("FlowerName")
                            u.Flower.CAT = row("Cat")
                            u.Flower.BGColor = Convert.ToString(row("Bgcolor"))
                            u.Flower.ColorCode = Convert.ToString(row("ColorCode"))
                            u.Flower.ForeColor = Convert.ToString(row("color"))
                            u.Quantity = row("QTYBox")
                            u.UOM = row("UOM")
                            u.Bunches = row("Bunches")
                            u.Stems = 0
                            u.Units = row("Units")
                            u.TotalUnits = row("TotalUnits")
                            u.Cost = row("Cost")
                            u.Total = row("Total")
                            u.BoxNumber = IIf(Convert.ToString(row("BoxNum")) = "", "0", row("BoxNum"))
                            u.Customer = IIf(Convert.ToString(row("Customer")) = "", "0", row("Customer"))
                            u.Type = Convert.ToString(row("Type"))
                            u.Comments = Convert.ToString(row("Commentq"))
                            u.Order = Convert.ToString(row("Order"))
                            u.Invoice = Convert.ToString(row("Invoice"))
                            uList.Add(u)
                        Next
                        If ds.Tables(0).Rows.Count <= 0 Then
                            Me.TotalRows = ds.Tables(1).Rows(0)(0)
                            Me.TotalBoxes = 0
                            Me.TotalCost = 0
                            Me.TotalUnits = 0
                            Me._TotalAmount = 0
                        Else
                            Me.TotalBoxes = ds.Tables(1).Rows(0)(1)
                            Me.TotalUnits = ds.Tables(1).Rows(0)(2)
                            Me.TotalCost = ds.Tables(1).Rows(0)(3)
                            Me.TotalAmount = ds.Tables(1).Rows(0)(4)
                        End If
                        Dim pod As New PurchaseOrderDetail()
                        pod.RECID = 0
                        pod.POHeader.ID = 0
                        pod.POHeader.PONumber = ""
                        pod.Farm = ""
                        pod.Flower.Flower = ""
                        pod.Flower.Name = ""
                        pod.Flower.CAT = ""
                        pod.Flower.BGColor = ""
                        pod.Flower.ColorCode = ""
                        pod.Flower.ForeColor = ""
                        pod.Quantity = TotalBoxes
                        pod.UOM = ""
                        pod.Bunches = 0
                        pod.Stems = 0
                        pod.Units = TotalUnits
                        pod.TotalUnits = 0
                        pod.Cost = TotalCost
                        pod.Total = TotalAmount
                        pod.BoxNumber = 0
                        pod.Customer = 0
                        pod.Type = ""
                        pod.Comments = ""
                        pod.Order = ""
                        pod.Invoice = 0
                        uList.Add(pod)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetFlowersListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function
    End Class
End Class

Public Class PurchaseOrderDetail
    Private _RECID As Integer
    Public Property RECID() As Integer
        Get
            Return _RECID
        End Get
        Set(ByVal value As Integer)
            _RECID = value
        End Set
    End Property

    Private _POHeader As New PurchaseOrder
    Public Property POHeader() As PurchaseOrder
        Get
            Return _POHeader
        End Get
        Set(ByVal value As PurchaseOrder)
            _POHeader = value
        End Set
    End Property

    Private _ORD As Integer
    Public Property ORD() As Integer
        Get
            Return _ORD
        End Get
        Set(ByVal value As Integer)
            _ORD = value
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

    Private _Flower As New Flower
    Public Property Flower() As Flower
        Get
            Return _Flower
        End Get
        Set(ByVal value As Flower)
            _Flower = value
        End Set
    End Property

    Private _Quantity As Integer
    Public Property Quantity() As Integer
        Get
            Return _Quantity
        End Get
        Set(ByVal value As Integer)
            _Quantity = value
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

    Private _Bunches As Integer
    Public Property Bunches() As Integer
        Get
            Return _Bunches
        End Get
        Set(ByVal value As Integer)
            _Bunches = value
        End Set
    End Property

    Private _Stems As Integer
    Public Property Stems() As Integer
        Get
            Return _Stems
        End Get
        Set(ByVal value As Integer)
            _Stems = value
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

    Private _Price As Decimal
    Public Property Price() As Decimal
        Get
            Return _Price
        End Get
        Set(ByVal value As Decimal)
            _Price = value
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

    Private _Total As Decimal
    Public Property Total() As Decimal
        Get
            Return _Total
        End Get
        Set(ByVal value As Decimal)
            _Total = value
        End Set
    End Property

    Private _GM As String
    Public Property GM() As String
        Get
            Return _GM
        End Get
        Set(ByVal value As String)
            _GM = value
        End Set
    End Property

    Private _BoxNumber As Integer
    Public Property BoxNumber() As Integer
        Get
            Return _BoxNumber
        End Get
        Set(ByVal value As Integer)
            _BoxNumber = value
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

    Private _Selected As Boolean
    Public Property Selected() As String
        Get
            Return _Selected
        End Get
        Set(ByVal value As String)
            _Selected = value
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

    Private _Comments As String
    Public Property Comments() As String
        Get
            Return _Comments
        End Get
        Set(ByVal value As String)
            _Comments = value
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

    Private _Invoice As String
    Public Property Invoice() As String
        Get
            Return _Invoice
        End Get
        Set(ByVal value As String)
            _Invoice = value
        End Set
    End Property
End Class
