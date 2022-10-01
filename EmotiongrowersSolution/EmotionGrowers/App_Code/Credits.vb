Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Configuration
Imports System.ComponentModel
Imports System.Web

Public Class F_CRCODE
    Public Shared Function LoadCreditCode() As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spSelectFromF_CRCODE", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Credits
                        u.ID = row("ID")
                        u.CODE = row("CODE")
                        u.REASON = row("REASON")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadCreditCode")
            Return Nothing
        End Try
    End Function
End Class

Public Class F_CREREQ
    Public Shared Function GetFarmCreditsFromCredit(ByVal ID As String) As List(Of Credits)
        Try
            'Dim imgAll = F_CREREQ.GetAllImageName()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Dim obj As New BloomService
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetFarmCreditsFromCreditID", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Using row As SqlDataReader = cmd.ExecuteReader()
                        While (row.Read())
                            Dim u As New Credits
                            u.ID = row("ID")
                            u.ORDER = row("Invoice")
                            u.ControlNum = row("Controlnum")
                            u.Farm = row("Farm")
                            u.FarmName = row("FarmName")
                            u.Flower = IIf(IsDBNull(row("Flower")), "", row("Flower"))
                            u.FlowerName = IIf(IsDBNull(row("Desc")), "", row("Desc"))
                            u.AWB = IIf(row("AWB") = "" Or row("AWB") Is DBNull.Value, "", obj.FormatAWBnumber(row("AWB")))
                            u.InvDate = row("Date1")
                            u.DaysFresh = Convert.ToDateTime(row("Date1")).Subtract(Convert.ToDateTime(row("Daterec"))).Days.ToString()
                            u.DaysApplied = Date.Now.Subtract(Convert.ToDateTime(row("Date1"))).Days.ToString()
                            u.Price = Convert.ToDecimal(row("TotalUnits") * row("Price")) + row("Freight") + row("Fuel") + row("Tax1")
                            u.Status = row("Status")
                            u.Applied = IIf(row("Applied") = "0", "N", "A")
                            u.REASON = row("Reason")
                            u.ErrorMessage = "Success"
                            u.VETID = row("VET_ID")
                            u.DateRec = row("Daterec")
                            u.FarmInv = 0
                            u.PO = If(row("PO") Is DBNull.Value, "", row("PO"))
                            u.Boxes = row("Boxes")
                            u.UOM = row("UOM")
                            u.Units = row("Units")
                            u.TotalUnits = row("TotalUnits")
                            u.FOB = row("Price")
                            u.Freight = row("Freight")
                            u.Salesman = row("Salesman")
                            u.Type = row("Type")
                            u.CODE = row("CreditCode")
                            u.CreditDesc = row("CreditDesc")

                            'Dim img = F_CREREQ.GetImageName(u.ID, 0)
                            'Dim imgName As New List(Of String)
                            'For i As Integer = 0 To img.Count - 1
                            '    imgName.Add(img.Item(i).ImageName)
                            'Next
                            'u.ImageName = String.Join(",", imgName)

                            'Dim img = imgAll.Where(Function(s) s.ID = u.ID And s.VETID = 0).ToList()
                            'Dim imgName As New List(Of String)
                            'For i As Integer = 0 To img.Count - 1
                            '    imgName.Add(img.Item(i).ImageName)
                            'Next
                            'u.ImageName = String.Join(",", imgName)
                            u.ImageName = ""

                            u.Tax1 = row("Tax1")
                            u.Fuel = row("Fuel")
                            uList.Add(u)
                        End While
                    End Using
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetFarmCreditsFromCredit")
            Return Nothing
        End Try
    End Function

    Public Shared Function CheckFarmCreditAppliedStatus(ByVal ID As String) As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetCreditRequestByInvenID", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IDINVEN", ID)
                    cmd.CommandTimeout = 0
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)

                    For Each row In ds.Rows
                        Dim u As New Credits
                        u.ID = row("ID")
                        u.ORDER = row("Invoice")
                        u.ControlNum = row("Controlnum")
                        u.Farm = row("Farm")
                        u.Flower = row("Flower")
                        u.FlowerName = row("Desc")
                        u.InvDate = row("Date1")
                        u.DaysFresh = Convert.ToDateTime(row("Date1")).Subtract(Convert.ToDateTime(row("Daterec"))).Days.ToString()
                        u.DaysApplied = Date.Now.Subtract(Convert.ToDateTime(row("Date1"))).Days.ToString()
                        u.TotalUnits = row("TotalUnits")
                        u.Price = Convert.ToDecimal(row("TotalUnits") * row("Price")) + row("Freight") + row("Fuel") + row("Tax1")
                        u.Status = row("Status")
                        u.Applied = IIf(row("Applied") = "0", "N", "A")
                        u.REASON = row("Reason")
                        u.ErrorMessage = "Success"
                        u.VETID = row("VET_ID")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckCreditAppliedStatus")
            Return Nothing
        End Try
    End Function

    Public Shared Function SaveFarmCreditRequestDetails(ID As String, TotalUnits As Integer, Price As Decimal, Freight As Decimal, CreditCode As String, Reason As String, Control As Integer, CreditFileNames As String, User As String, CREREQID As Integer, Fuel As String, Taxes As String, Screen As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of VET_)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim res As Integer
                Using cmd1 As New SqlCommand("spSaveFarmCreditRequestDetails", Con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@InvID", ID)
                    cmd1.Parameters.AddWithValue("@TotalUnits", TotalUnits)
                    cmd1.Parameters.AddWithValue("@Price", Price)
                    cmd1.Parameters.AddWithValue("@Freight", Freight)
                    cmd1.Parameters.AddWithValue("@CreditCode", CreditCode)
                    cmd1.Parameters.AddWithValue("@Reason", Reason)
                    cmd1.Parameters.AddWithValue("@Control", Control)
                    cmd1.Parameters.AddWithValue("@CreditFileNames", CreditFileNames)
                    cmd1.Parameters.AddWithValue("@User", User)
                    cmd1.Parameters.AddWithValue("@TransDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd1.Parameters.AddWithValue("@TransTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd1.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd1.Parameters.AddWithValue("@AddTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd1.Parameters.AddWithValue("@CREREQID", CREREQID)
                    cmd1.Parameters.AddWithValue("@Fuel", Fuel)
                    cmd1.Parameters.AddWithValue("@Taxes", Taxes)
                    cmd1.Parameters.AddWithValue("@Screen", Screen)
                    res = cmd1.ExecuteScalar()
                End Using
                Return res
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCreditRequestDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCreditDetailsForFarm(ByVal ID As String, ByVal Screen As String) As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spInventoryCreditsFromInven", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Id", ID)
                    cmd.Parameters.AddWithValue("@Screen", Screen)
                    Dim da As New SqlDataAdapter(cmd)
                    Using row As SqlDataReader = cmd.ExecuteReader()
                        While (row.Read())
                            Dim u As New Credits
                            u.ID = row("ID")
                            u.Flower = row("Flower")
                            u.FlowerName = row("Description")
                            u.Farm = row("Farm")
                            u.FarmName = row("FarmName")
                            u.AWB = row("LOT")
                            u.DateRec = row("DATEREC")
                            u.FarmInv = 0
                            u.PO = If(row("PO") Is DBNull.Value, "", row("PO"))
                            'u.DaysFresh = Convert.ToDateTime(row.VET1Date).Subtract(Convert.ToDateTime(row.RecDate)).Days.ToString()
                            u.DaysFresh = 0
                            u.Boxes = row("Boxes")
                            u.UOM = row("UOM")
                            u.Units = row("Units")
                            u.TotalUnits = row("TotalUnits")
                            u.FOB = row("COST")
                            u.Freight = row("TotalFreight")
                            u.Salesman = 0
                            u.Type = ""
                            u.Fuel = 0
                            u.Tax1 = row("Tax1")
                            uList.Add(u)
                        End While
                    End Using
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCreditDetailsForFarm")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetCreditDetailsFromVET(ByVal ID As String, ByVal Invoice As String) As List(Of Credits)
        Try
            Dim obj As New VET
            Dim whereclause As String = "ID='" + ID + "' and Invoice=" + Invoice
            Dim dataOrder = obj.GetVETInvoiceDetailsList(whereclause, "Invoice", 1, 30000)
            Dim objBloom As New BloomService

            Dim uList As New List(Of Credits)()
            For Each row In dataOrder
                If dataOrder.IndexOf(row) <> dataOrder.Count - 1 Then
                    Dim u As New Credits
                    u.ID = row.ID
                    u.ORDER = Invoice
                    u.Flower = row.Flower
                    u.FlowerName = row.Description
                    u.Farm = row.Farm
                    u.FarmName = row.FarmName
                    u.AWB = IIf(row.AWB = "" Or row.AWB Is DBNull.Value, "", objBloom.FormatAWBnumber(row.AWB))
                    u.DateRec = row.RecDate
                    u.FarmInv = 0
                    u.PO = row.PO
                    u.DaysFresh = Convert.ToDateTime(row.VET1Date).Subtract(Convert.ToDateTime(row.RecDate)).Days.ToString()
                    u.Boxes = row.Boxes
                    u.UOM = row.UOM
                    u.Units = row.Units
                    u.TotalUnits = row.TotalUnits
                    u.FOB = row.FOB
                    u.Freight = 0.000
                    u.Salesman = row.Salesman
                    u.Type = row.Type
                    u.Fuel = row.Fuel
                    u.Tax1 = row.Tax1 + row.Tax2 + row.ANDEAN
                    uList.Add(u)
                End If
            Next

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditDetailsFromVET")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetCreditDetailsFromFOrder(ByVal ID As String, ByVal Invoice As String) As List(Of Credits)
        Try
            Dim obj As New SalesOrder
            Dim whereclause As String = "ID='" + ID + "' and Invoice=" + Invoice
            Dim dataOrder = obj.GetOrderInvoiceDetailsList(whereclause, "Invoice", 1, 30000)
            Dim objBloom As New BloomService

            Dim uList As New List(Of Credits)()
            For Each row In dataOrder
                If dataOrder.IndexOf(row) <> dataOrder.Count - 1 Then
                    Dim u As New Credits
                    u.ID = row.ID
                    u.ORDER = Invoice
                    u.Flower = row.Flower
                    u.FlowerName = row.Flower
                    u.Farm = row.FarmCode
                    u.FarmName = row.FarmCode
                    u.AWB = IIf(row.AWB = "" Or row.AWB Is DBNull.Value, "", objBloom.FormatAWBnumber(row.AWB))
                    u.DateRec = row.DateRec
                    u.FarmInv = 0
                    u.PO = row.PO
                    u.DaysFresh = Convert.ToDateTime(row.PODate).Subtract(Convert.ToDateTime(row.PODate)).Days.ToString()
                    u.Boxes = row.Boxes
                    u.UOM = row.UOM
                    u.Units = row.Units
                    u.TotalUnits = row.TotalUnits
                    u.FOB = row.FOB
                    u.Freight = 0.000
                    u.Salesman = row.SLSMAN
                    u.Type = row.Type
                    u.Fuel = row.Fuel
                    u.Tax1 = row.Tax1 + row.Tax2 + row.ANDEAN
                    uList.Add(u)
                End If
            Next

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditDetailsFromFOrder")
            Return Nothing
        End Try
    End Function
    Public Shared Function SaveCreditRequestDetails(ID As Integer, TotalUnits As Integer, Price As Decimal, Freight As Decimal, CreditCode As String, Reason As String, Control As Integer, CreditFileNames As String, User As String, CREREQID As Integer, Fuel As String, Taxes As String, ByVal Source As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of VET_)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim res As Integer
                Using cmd1 As New SqlCommand("spSaveCreditRequestDetailsFromVet", Con)
                    If Source = "order" Then
                        cmd1.CommandText = "spSaveCreditRequestDetailsFromOrder"
                    End If
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@ID", ID.ToString())
                    cmd1.Parameters.AddWithValue("@TotalUnits", TotalUnits)
                    cmd1.Parameters.AddWithValue("@Price", Price)
                    cmd1.Parameters.AddWithValue("@Freight", Freight)
                    cmd1.Parameters.AddWithValue("@CreditCode", CreditCode)
                    cmd1.Parameters.AddWithValue("@Reason", Reason)
                    cmd1.Parameters.AddWithValue("@Control", Control)
                    cmd1.Parameters.AddWithValue("@CreditFileNames", CreditFileNames)
                    cmd1.Parameters.AddWithValue("@User", User)
                    cmd1.Parameters.AddWithValue("@TransDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd1.Parameters.AddWithValue("@TransTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd1.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd1.Parameters.AddWithValue("@AddTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd1.Parameters.AddWithValue("@CREREQID", CREREQID)
                    cmd1.Parameters.AddWithValue("@Fuel", Fuel)
                    cmd1.Parameters.AddWithValue("@Taxes", Taxes)
                    res = cmd1.ExecuteScalar()
                End Using
                Return res
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCreditRequestDetails")
            Throw ex
        End Try
    End Function

    Public Function GetCreditRequestInvoiceDetailsList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                 ByVal numberOfRows As Integer) As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of Credits)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "Invoice"
                End If

                Dim Qry As String = ""


                If (whereClause IsNot Nothing And whereClause <> "") Then
                    Qry = String.Format("select cc.Bgcolor, cc.color as Fontcolor,req.* from F_CREREQ req inner join F_flower flo on req.flower=flo.flower inner join dbo.tblcolorcode cc on flo.colorcode=cc.code  where " + whereClause + " order by " + sortExp)
                End If

                Using cmd As New SqlCommand(Qry, Con)
                    cmd.CommandType = CommandType.Text
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
                    Dim TotalAmount As Decimal = 0
                    If TotalCount <> 0 Then

                        TotalUnits = ds.Compute("Sum(TotalUnits)", "Farm <> 'ZZ'")

                        For Each row In ds.Rows
                            Dim u As New Credits
                            u.RowNo = row("RECNO")
                            u.ID = row("ID")
                            u.ORDER = If(row("Invoice") Is DBNull.Value, "", row("Invoice"))
                            u.ControlNum = If(row("Controlnum") Is DBNull.Value, 0, row("Controlnum"))
                            u.Farm = If(row("Farm") Is DBNull.Value, "", row("Farm"))
                            u.InvDate = If(row("Date1") Is DBNull.Value, "", row("Date1"))
                            u.DaysFresh = Convert.ToDateTime(row("Date1")).Subtract(Convert.ToDateTime(row("Daterec"))).Days.ToString()
                            u.DaysApplied = Date.Now.Subtract(Convert.ToDateTime(row("Date1"))).Days.ToString()
                            u.FlowerName = If(row("Desc") Is DBNull.Value, "", row("Desc"))
                            u.TotalUnits = If(row("TotalUnits") Is DBNull.Value, 0, row("TotalUnits"))
                            u.Price = Convert.ToDecimal(row("TotalUnits") * row("Price")) + row("Freight") + row("Fuel") + row("Tax1")
                            u.Status = If(row("Status") Is DBNull.Value, "", row("Status"))
                            u.Applied = IIf(row("Applied") = "0", "N", "A")
                            u.Bgcolor = If(row("Bgcolor") Is DBNull.Value, "", row("Bgcolor"))
                            u.Fontcolor = If(row("FontColor") Is DBNull.Value, "", row("FontColor"))
                            u.TotalRows += TotalCount
                            TotalAmount += u.Price
                            u.REASON = If(row("Reason") Is DBNull.Value, "", row("Reason"))
                            u.VETID = If(row("VET_ID") Is DBNull.Value, 0, row("VET_ID"))
                            u.ADDDATE = IIf(row("ADDDATE") Is DBNull.Value, "", row("ADDDATE"))
                            ulistsalesDetails.Add(u)
                        Next
                    End If

                    Dim po As New Credits()
                    po.RowNo = 0
                    po.ID = 0
                    po.ORDER = ""
                    po.ControlNum = 0
                    po.Farm = ""
                    po.InvDate = ""
                    po.DaysFresh = ""
                    po.DaysApplied = ""
                    po.FlowerName = ""
                    po.TotalUnits = TotalUnits
                    po.Price = TotalAmount
                    po.Status = ""
                    po.Applied = ""
                    po.TotalRows = TotalCount
                    po.VETID = 0
                    ulistsalesDetails.Add(po)
                End Using
            End Using
            Return ulistsalesDetails
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditRequestInvoiceDetailsList")
            Throw ex
        End Try

    End Function

    Public Shared Function CheckCreditAppliedStatus(ByVal ID As Integer, ByVal Order As Integer) As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spCheckCreditAppliedStatusByVetIDAndInvoice", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@VET_ID", ID)
                    cmd.Parameters.AddWithValue("@Invoice", Order)
                    cmd.CommandTimeout = 0
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)

                    For Each row In ds.Rows
                        Dim u As New Credits
                        u.ID = row("ID")
                        u.ORDER = row("Invoice")
                        u.ControlNum = row("Controlnum")
                        u.Farm = row("Farm")
                        u.Flower = row("Flower")
                        u.FlowerName = row("Desc")
                        u.InvDate = row("Date1")
                        u.DaysFresh = Convert.ToDateTime(row("Date1")).Subtract(Convert.ToDateTime(row("Daterec"))).Days.ToString()
                        u.DaysApplied = Date.Now.Subtract(Convert.ToDateTime(row("Date1"))).Days.ToString()
                        u.TotalUnits = row("TotalUnits")
                        u.Price = Convert.ToDecimal(row("TotalUnits") * row("Price")) + row("Freight") + row("Fuel") + row("Tax1")
                        u.Status = row("Status")
                        u.Applied = IIf(row("Applied") = "0", "N", "A")
                        u.REASON = row("Reason")
                        u.ErrorMessage = "Success"
                        u.VETID = row("VET_ID")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckCreditAppliedStatus")
            Return Nothing
        End Try
    End Function

   'Added By: Subhajit On: 06-14-2022
    Public Shared Function CheckCreditAppliedStatus(ByVal ID As Integer, ByVal Order As Integer, ByVal dtAllCredits As DataTable) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Dim result As Integer = 0

            result = dtAllCredits.Select("VET_ID=" + Convert.ToString(ID) + " AND Invoice=" + Convert.ToString(Order)).Length

            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckCreditAppliedStatus")
            Return Nothing
        End Try
    End Function

    'Added By: Subhajit On: 06-14-2022
    Public Shared Function GetAllCreditDetailsByInvoice(ByVal Invoice As String) As DataTable
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Dim result As New DataTable
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetAllCreditDetailsByInvoice", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Invoice", Invoice)
                    cmd.CommandTimeout = 0
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(result)
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAllCreditDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetCreditDetailsFromCREREQ(ByVal ID As String, ByVal VETID As String, ByVal Invoice As String) As List(Of Credits)
        Try
            'Dim imgAll = F_CREREQ.GetAllImageName()

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Dim result As String = ""
            Dim obj As New BloomService
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetCreditDetailsFromCREREQ", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.Parameters.AddWithValue("@VET_ID", VETID)
                    cmd.Parameters.AddWithValue("@Invoice", Invoice)
                    cmd.CommandTimeout = 0
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row In ds.Rows
                        Dim u As New Credits
                        u.ID = row("ID")
                        u.ORDER = row("Invoice")
                        u.ControlNum = row("Controlnum")
                        u.Farm = row("Farm")
                        u.FarmName = row("FarmName")
                        u.Flower = IIf(IsDBNull(row("Flower")), "", row("Flower"))
                        u.FlowerName = IIf(IsDBNull(row("Desc")), "", row("Desc"))
                        u.AWB = IIf(row("AWB") = "" Or row("AWB") Is DBNull.Value, "", obj.FormatAWBnumber(row("AWB")))
                        u.InvDate = row("Date1")
                        u.DaysFresh = Convert.ToDateTime(row("Date1")).Subtract(Convert.ToDateTime(row("Daterec"))).Days.ToString()
                        u.DaysApplied = Date.Now.Subtract(Convert.ToDateTime(row("Date1"))).Days.ToString()
                        u.Price = Convert.ToDecimal(row("TotalUnits") * row("Price")) + row("Freight") + row("Fuel") + row("Tax1")
                        u.Status = row("Status")
                        u.Applied = IIf(row("Applied") = "0", "N", "A")
                        u.REASON = row("Reason")
                        u.ErrorMessage = "Success"
                        u.VETID = row("VET_ID")
                        u.DateRec = row("Daterec")
                        u.FarmInv = 0
                        u.PO = row("PO")
                        u.Boxes = row("Boxes")
                        u.UOM = row("UOM")
                        u.Units = row("Units")
                        u.TotalUnits = row("TotalUnits")
                        u.FOB = row("Price")
                        u.Freight = row("Freight")
                        u.Salesman = row("Salesman")
                        u.Type = row("Type")
                        u.CODE = row("CreditCode")
                        u.CreditDesc = row("CreditDesc")

                        'Dim img = F_CREREQ.GetImageName(ID, VETID)
                        'Dim imgName As New List(Of String)
                        'For i As Integer = 0 To img.Count - 1
                        '    imgName.Add(img.Item(i).ImageName)
                        'Next
                        'u.ImageName = String.Join(",", imgName)

                        'Dim img = imgAll.Where(Function(s) s.ID = ID And s.VETID = VETID).ToList()
                        'Dim imgName As New List(Of String)
                        'For i As Integer = 0 To img.Count - 1
                        '    imgName.Add(img.Item(i).ImageName)
                        'Next
                        'u.ImageName = String.Join(",", imgName)
                        u.ImageName = ""

                        u.Tax1 = row("Tax1")
                        u.Fuel = row("Fuel")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditDetailsFromVET")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetImageName(ByVal ID As String, ByVal VETID As String) As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetImageNameByIDAndVetID", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.Parameters.AddWithValue("@VET_ID", VETID)
                    cmd.CommandTimeout = 0
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row In ds.Rows
                        Dim u As New Credits
                        u.ID = row("ID")
                        u.ImageName = row("ImageName")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditDetailsFromVET")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetAllImageName() As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetAllImageName", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.CommandTimeout = 0
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row In ds.Rows
                        Dim u As New Credits
                        u.ID = row("CREREQ_ID")
                        u.VETID = row("VET_ID")
                        u.ImageName = row("ImageName")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditDetailsFromVET")
            Return Nothing
        End Try
    End Function

    Public Shared Function DeleteCreditRequestDetails(CREREQID As Integer, VETID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of VET_)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using cmd1 As New SqlCommand("spDeleteCreditRequestDetails", Con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@CREREQID", CREREQID)
                    cmd1.Parameters.AddWithValue("@VETID", VETID.ToString())
                    cmd1.ExecuteNonQuery()
                End Using
                Return "Success"
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCreditRequestDetails")
            Throw ex
        End Try
    End Function

    Public Function GetPendingInfoDetailsList(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                 ByVal numberOfRows As Integer) As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of Credits)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "CREREQ_ID"
                End If

                Dim Qry As String = ""
                Dim erLog As New BloomService
                erLog.AppendLog("whereClause: " + whereClause, "GetPendingInfoDetailsList")

                'If (whereClause IsNot Nothing And whereClause <> "") Then
                '    Qry = String.Format("select * from vwPendingInfo cr where " + whereClause + " order by CREREQ_ID")
                'Else
                '    Qry = String.Format("select * from vwPendingInfo cr order by CREREQ_ID")
                'End If

                Using cmd As New SqlCommand("spGetPendingInfoDetailsListByOption", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@WhereCondition", whereClause)
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
                    Dim GrowerAmtTotal As Decimal = 0

                    If TotalCount <> 0 Then
                        TotalUnits = ds.Compute("Sum(Units)", "")
                        GrowerAmtTotal = ds.Compute("Sum(GrowerAmt)", "")

                        For Each row In ds.Rows
                            Dim u As New Credits
                            u.RowNo = row("RECNO")
                            u.ID = row("CREREQ_ID")
                            u.Customer = IIf(row("CUSTOMER") Is DBNull.Value, "", row("CUSTOMER"))
                            u.CustName = IIf(row("CustName") Is DBNull.Value, "", row("CustName"))
                            u.ORDER = row("Invoice")
                            u.InvDate = If(row("InvDate") Is DBNull.Value, "01/01/1900", Convert.ToDateTime(row("InvDate"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy"))
                            u.TransDate = If(row("TransDate") Is DBNull.Value, "01/01/1900", Convert.ToDateTime(row("TransDate"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy"))

                            erLog.AppendLog("InvDate: " + u.InvDate + " TransDate: " + u.TransDate, "GetPendingInfoDetailsList")
                            u.CODE = IIf(row("CreditCode") Is DBNull.Value, "", row("CreditCode"))
                            u.CreditDesc = IIf(row("CREDITDESC") Is DBNull.Value, "", row("CREDITDESC"))
                            u.Salesman = IIf(row("SalesPerson") Is DBNull.Value, "", row("SalesPerson"))
                            u.Farm = IIf(row("Farm") Is DBNull.Value, "", row("Farm"))
                            u.FarmName = IIf(row("FarmName") Is DBNull.Value, "", row("FarmName"))
                            u.Flower = IIf(row("Flower") Is DBNull.Value, "", row("Flower"))
                            u.FlowerName = IIf(row("Desc") Is DBNull.Value, "", row("Desc"))
                            u.Bgcolor = IIf(row("Bgcolor") Is DBNull.Value, "", row("Bgcolor"))
                            u.Fontcolor = IIf(row("FontColor") Is DBNull.Value, "", row("FontColor"))
                            u.AWB = IIf(row("Awb") Is DBNull.Value, "", row("Awb"))

                            u.Boxes = IIf(row("Boxes") Is DBNull.Value, 0, row("Boxes"))
                            u.UOM = IIf(row("UOM") Is DBNull.Value, "", row("UOM"))
                            u.Units = IIf(row("Units") Is DBNull.Value, "0", row("Units"))
                            u.TotalUnits = IIf(row("TotalUnits") Is DBNull.Value, "0", row("TotalUnits"))
                            u.ControlNum = IIf(row("ControlNum") Is DBNull.Value, "", row("ControlNum"))
                            u.REASON = IIf(row("Reason") Is DBNull.Value, "", row("Reason"))
                            u.Status = IIf(row("Status") Is DBNull.Value, "", row("Status"))
                            u.Applied = IIf(row("Applied") Is DBNull.Value, "0", row("Applied"))
                            u.GrowerAmt = IIf(row("GROWERAMT") Is DBNull.Value, 0.00, row("GROWERAMT"))
                            u.GrowerAmtTotal = IIf(row("GROWERAMT") Is DBNull.Value, "0", row("GROWERAMT"))
                            u.DateRec = IIf(row("Daterec") Is DBNull.Value, "", Convert.ToDateTime(row("Daterec"), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yyyy"))
                            erLog.AppendLog("DateRec: " + u.DateRec, "GetPendingInfoDetailsList")
                            'u.DaysFresh = Convert.ToDateTime(u.InvDate).Subtract(Convert.ToDateTime(u.DateRec)).Days.ToString()
                            u.DaysFresh = row("DayFresh").ToString()
                            erLog.AppendLog("DaysFresh: " + u.DaysFresh, "GetPendingInfoDetailsList")
                            u.FarmInv = IIf(row("FarmInv") Is DBNull.Value, "", row("FarmInv"))
                            u.FOB = IIf(row("Price") Is DBNull.Value, "", row("Price"))
                            u.Price = Convert.ToDecimal(row("TotalUnits") * row("Price")) + row("Freight") + row("Fuel") + row("Tax1")
                            u.UnitCost = IIf(row("Cost") Is DBNull.Value, 0.00, row("Cost"))
                            u.Packing = IIf(row("Packing") Is DBNull.Value, 0.00, row("Packing"))
                            u.ImpCost = 0.00
                            u.Freight = IIf(row("Freight") Is DBNull.Value, 0.00, row("Freight"))
                            u.Fumigation = 0.00
                            u.AntiDump = 0.00
                            u.Fuel = IIf(row("Fuel") Is DBNull.Value, 0.00, row("Fuel"))
                            u.ADDUSER = IIf(row("ADDUSER") Is DBNull.Value, "", row("ADDUSER"))
                            u.ADDDATE = If(row("ADDDATE") Is DBNull.Value, "01/01/1900", row("ADDDATE"))

                            erLog.AppendLog("ADDDATE: " + u.ADDDATE, "GetPendingInfoDetailsList")
                            u.ADDTIME = IIf(row("ADDTIME") Is DBNull.Value, "", row("ADDTIME"))
                            u.DENIEDBY = IIf(row("DENIEDBY") Is DBNull.Value, "", row("DENIEDBY"))
                            u.DENIEDDATE = If(row("DENIEDDATE") Is DBNull.Value, "01/01/1900", row("DENIEDDATE"))

                            erLog.AppendLog("DENIEDDATE: " + u.DENIEDDATE, "GetPendingInfoDetailsList")
                            u.DENIEDTIME = IIf(row("DENIEDTIME") Is DBNull.Value, "", row("DENIEDTIME"))
                            u.DENIEDREAS = IIf(row("DENIEDREAS") Is DBNull.Value, "", row("DENIEDREAS"))
                            u.Salesmang = IIf(row("Salesmang") Is DBNull.Value, "", row("Salesmang"))
                            u.SMDATE = If(row("SMDATE") Is DBNull.Value, "01/01/1900", row("SMDATE"))

                            erLog.AppendLog("SMDATE: " + u.SMDATE, "GetPendingInfoDetailsList")
                            u.SMTIME = IIf(row("SMTIME") Is DBNull.Value, "", row("SMTIME"))
                            u.APPROVEDBY = IIf(row("APPROVEDBY") Is DBNull.Value, "", row("APPROVEDBY"))
                            u.APPROVEDDA = If(row("APPROVEDDA") Is DBNull.Value, "01/01/1900", row("APPROVEDDA"))

                            erLog.AppendLog("APPROVEDDA: " + u.APPROVEDDA, "GetPendingInfoDetailsList")
                            u.APPROVEDTI = IIf(row("APPROVEDTI") Is DBNull.Value, "", row("APPROVEDTI"))

                            u.TotalRows += TotalCount
                            ulistsalesDetails.Add(u)
                        Next
                    End If

                    Dim po As New Credits()
                    po.RowNo = 0
                    po.Customer = ""
                    po.CustName = ""
                    po.ORDER = ""
                    po.InvDate = ""
                    po.TransDate = ""
                    po.CODE = ""
                    po.Salesman = ""
                    po.Farm = ""
                    po.FlowerName = ""
                    po.AWB = ""
                    po.GrowerAmt = GrowerAmtTotal
                    'po.GrowerAmtTotal = GrowerAmtTotal
                    po.ID = 0

                    ulistsalesDetails.Add(po)
                End Using
            End Using
            Return ulistsalesDetails
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPendingInfoDetailsList")
            Throw ex
        End Try

    End Function

    Public Shared Function GetCreditDetailsListByOption(ByVal CreditOpt As String, ByVal CREREQID As String) As List(Of Credits)
        Try
            Dim FilterCond As String = ""
            Dim whereCondition As String = ""
            Dim FromDate As String = ""
            Dim ToDate As String = ""
            Dim obj As New BloomService

            'Dim imgAll = F_CREREQ.GetAllImageName()

            If CreditOpt IsNot Nothing And CreditOpt <> "" Then
                Dim FilterSplit = CreditOpt.Split("$")
                If FilterSplit.Length = 3 Then
                    CreditOpt = FilterSplit(0)
                    FromDate = FilterSplit(1)
                    ToDate = FilterSplit(2)
                Else
                    CreditOpt = FilterSplit(0)
                End If

                If CreditOpt = "SalesMgr" Then
                    FilterCond = "cr.status='P' and isnull(cr.salesmang,'')=''"
                ElseIf CreditOpt = "CrMgr" Then
                    FilterCond = "cr.status='P' and isnull(cr.salesmang,'')<>'' and cr.applied=0"
                ElseIf CreditOpt = "Denied" Then
                    FilterCond = "cr.status='D' and cr.applied=0"
                ElseIf CreditOpt = "Approved" Then
                    FilterCond = "cr.status='A' and cr.applied=0"
                ElseIf CreditOpt = "Limbo" Then
                    FilterCond = "cr.status='L' and TransDate between '" + FromDate + "' and '" + ToDate + "'"
                ElseIf CreditOpt = "Every" Then
                    FilterCond = "cr.status<>'L' and cr.status<>'P' and TransDate between '" + FromDate + "' and '" + ToDate + "'"
                ElseIf CreditOpt = "Applied" Then
                    FilterCond = "cr.status<>'L' and cr.applied=1 and TransDate between '" + FromDate + "' and '" + ToDate + "'"
                End If
                'whereCondition = IIf(whereCondition = "", FilterCond, " and " + FilterCond)
            End If

            whereCondition = IIf(CREREQID = "", FilterCond, " cr.CREREQ_ID=" + CREREQID + " and " + FilterCond)

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of Credits)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim Qry As String = ""


                'If (FilterCond IsNot Nothing And FilterCond <> "") Then
                '    Qry = String.Format("select * from vwGetCreditDetailsListByOption cr where " + whereCondition + " order by CREREQ_ID ")
                'Else
                '    Qry = String.Format("select * from vwGetCreditDetailsListByOption cr order by CREREQ_ID ")
                'End If

                Using cmd As New SqlCommand("spGetCreditDetailsListByOption", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@WhereCondition", whereCondition)
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
                    Dim TotalAmount As Decimal = 0
                    If TotalCount <> 0 Then
                        For Each row In ds.Rows
                            Dim u As New Credits
                            u.RowNo = row("RECNO")
                            u.ID = row("CREREQ_ID")
                            u.VETID = IIf(row("VET_ID") Is DBNull.Value, 0, row("VET_ID"))
                            u.Customer = IIf(row("CUSTOMER") Is DBNull.Value, "", row("CUSTOMER"))
                            u.CustName = IIf(row("CustName") Is DBNull.Value, "", row("CustName"))
                            u.ORDER = row("Invoice")
                            u.InvDate = If(row("InvDate") Is DBNull.Value, "01/01/1900", row("InvDate"))
                            u.TransDate = If(row("TransDate") Is DBNull.Value, "01/01/1900", row("TransDate"))
                            u.Salesman = IIf(row("SalesMan") Is DBNull.Value, "", row("SalesMan"))
                            u.SlsName = IIf(row("SlsName") Is DBNull.Value, "", row("SlsName"))
                            u.Flower = IIf(row("Flower") Is DBNull.Value, "", row("Flower"))
                            u.FlowerName = IIf(row("Desc") Is DBNull.Value, "", row("Desc"))
                            u.Bgcolor = IIf(row("Bgcolor") Is DBNull.Value, "", row("Bgcolor"))
                            u.Fontcolor = IIf(row("FontColor") Is DBNull.Value, "", row("FontColor"))
                            u.Boxes = IIf(row("Boxes") Is DBNull.Value, 0, row("Boxes"))
                            u.UOM = IIf(row("UOM") Is DBNull.Value, "", row("UOM"))
                            u.Units = IIf(row("Units") Is DBNull.Value, "0", row("Units"))
                            u.TotalUnits = IIf(row("TotalUnits") Is DBNull.Value, "0", row("TotalUnits"))
                            u.ControlNum = IIf(row("ControlNum") Is DBNull.Value, "", row("ControlNum"))
                            u.CODE = IIf(row("CreditCode") Is DBNull.Value, "", row("CreditCode"))
                            u.REASON = IIf(row("Reason") Is DBNull.Value, "", row("Reason"))
                            u.Status = IIf(row("Status") Is DBNull.Value, "", row("Status"))
                            u.Applied = IIf(row("Applied") Is DBNull.Value, "0", row("Applied"))

                            'Dim img = F_CREREQ.GetImageName(u.ID, u.VETID)
                            'Dim imgName As New List(Of String)
                            'For i As Integer = 0 To img.Count - 1
                            '    imgName.Add(img.Item(i).ImageName)
                            'Next
                            'u.ImageName = String.Join(",", imgName)

                            'Dim img = imgAll.Where(Function(s) s.ID = u.ID And s.VETID = u.VETID).ToList()
                            'Dim imgName As New List(Of String)
                            'For i As Integer = 0 To img.Count - 1
                            '    imgName.Add(img.Item(i).ImageName)
                            'Next
                            'u.ImageName = String.Join(",", imgName)
                            u.ImageName = ""

                            u.GrowerAmt = IIf(row("GROWERAMT") Is DBNull.Value, 0.00, row("GROWERAMT"))
                            u.Farm = IIf(row("Farm") Is DBNull.Value, "", row("Farm"))
                            u.FarmName = IIf(row("FarmName") Is DBNull.Value, "", row("FarmName"))
                            u.DateRec = IIf(row("Daterec") Is DBNull.Value, "", row("Daterec"))
                            u.DaysFresh = Convert.ToDateTime(u.InvDate).Subtract(Convert.ToDateTime(u.DateRec)).Days.ToString()
                            u.AWB = IIf(row("AWB") = "" Or row("AWB") Is DBNull.Value, "", obj.FormatAWBnumber(row("AWB")))
                            u.FarmInv = IIf(row("FarmInv") Is DBNull.Value, "", row("FarmInv"))
                            u.FOB = IIf(row("Price") Is DBNull.Value, "", row("Price"))
                            u.Price = Convert.ToDecimal(row("TotalUnits") * row("Price")) + row("Freight") + row("Fuel") + row("Tax1")
                            u.UnitCost = IIf(row("Cost") Is DBNull.Value, 0.00, row("Cost"))
                            u.Packing = IIf(row("Packing") Is DBNull.Value, 0.00, row("Packing"))
                            u.ImpCost = IIf(row("OtherCost") Is DBNull.Value, 0.00, row("OtherCost"))
                            u.Freight = IIf(row("Freight") Is DBNull.Value, 0.00, row("Freight"))
                            u.Fumigation = IIf(row("Fumigation") Is DBNull.Value, 0.00, row("Fumigation"))
                            u.AntiDump = IIf(row("Tax1") Is DBNull.Value, 0.00, row("Tax1"))
                            u.Fuel = IIf(row("Fuel") Is DBNull.Value, 0.00, row("Fuel"))
                            u.ADDUSER = IIf(row("ADDUSER") Is DBNull.Value, "", row("ADDUSER"))
                            u.ADDDATE = If(row("ADDDATE") Is DBNull.Value, "01/01/1900", row("ADDDATE"))
                            u.ADDTIME = IIf(row("ADDTIME") Is DBNull.Value, "", row("ADDTIME"))
                            u.DENIEDBY = IIf(row("DENIEDBY") Is DBNull.Value, "", row("DENIEDBY"))
                            u.DENIEDDATE = If(row("DENIEDDATE") Is DBNull.Value, "01/01/1900", row("DENIEDDATE"))
                            u.DENIEDTIME = IIf(row("DENIEDTIME") Is DBNull.Value, "", row("DENIEDTIME"))
                            u.DENIEDREAS = IIf(row("DENIEDREAS") Is DBNull.Value, "", row("DENIEDREAS"))
                            u.Salesmang = IIf(row("Salesmang") Is DBNull.Value, "", row("Salesmang"))
                            u.SMDATE = If(row("SMDATE") Is DBNull.Value, "01/01/1900", row("SMDATE"))
                            u.SMTIME = IIf(row("SMTIME") Is DBNull.Value, "", row("SMTIME"))
                            u.APPROVEDBY = IIf(row("APPROVEDBY") Is DBNull.Value, "", row("APPROVEDBY"))
                            u.APPROVEDDA = If(row("APPROVEDDA") Is DBNull.Value, "01/01/1900", row("APPROVEDDA"))
                            u.APPROVEDTI = IIf(row("APPROVEDTI") Is DBNull.Value, "", row("APPROVEDTI"))
                            u.CreditDesc = IIf(row("CreditDesc") Is DBNull.Value, "", row("CreditDesc"))
                            u.TotalRows += TotalCount
                            ulistsalesDetails.Add(u)
                        Next
                    End If
                End Using
            End Using
            Return ulistsalesDetails

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditDetailsListByOption")
            Throw ex
        End Try
    End Function

    'Public Shared Function UpdateCreditStatus(CREREQID As String, Status As String, User As String) As String
    '    Try

    '        If (User.Length < 10) Then
    '            User = User
    '        Else
    '            User = User.Substring(0, 10)
    '        End If

    '        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
    '        Using Con As New SqlConnection(ConStr)
    '            Con.Open()
    '            Dim sql As String = ""
    '            Dim curtime As String = DateTime.Now.ToString("HH:mm:ss")
    '            Dim TransDetails = "TRANSDATE = '" + DateTime.Now.ToString("MM/dd/yy") + "' , TransTime ='" + curtime + "'"

    '            If Status = "P" Then
    '                sql = "update F_CREREQ Set Status='" + Status + "',Salesmang='" + User + "',SMDATE='" + DateTime.Now.ToString("MM/dd/yy") + "',SMTIME='" + curtime + "', " + TransDetails + " where ID=@CREREQID"
    '                'sql = "update F_CREREQ set Status='" + Status + "' where ID=@CREREQID"
    '            ElseIf Status = "A" Then
    '                sql = "update F_CREREQ set Status='" + Status + "',Approved=1,ApprovedBy='" + User + "',APPROVEDDA='" + DateTime.Now.ToString("MM/dd/yy") + "',APPROVEDTI='" + curtime + "', " + TransDetails + " where ID=@CREREQID"
    '                'sql = "update F_CREREQ set Status='" + Status + "' where ID=@CREREQID"
    '            ElseIf Status = "D" Then
    '                sql = "update F_CREREQ set Status='" + Status + "',DeniedBy='" + User + "',DeniedDate='" + DateTime.Now.ToString("MM/dd/yy") + "',DeniedTime='" + curtime + "'," + TransDetails + " where ID=@CREREQID"
    '                'sql = "update F_CREREQ set Status='" + Status + "' where ID=@CREREQID"
    '            Else
    '                'sql = "update F_CREREQ set Status='" + Status + "',UPDUSER='" + User + "',UPDDATE='" + curdate + "',UPDTIME='" + curtime + "',UPDAPP='WEB',Salesmang='" + User + "',SMDATE='" + curdate + "',SMTIME='" + curtime + "' where ID=@CREREQID"
    '                sql = "update F_CREREQ set Status='" + Status + "'," + TransDetails + " where ID=@CREREQID"
    '            End If
    '            Using cmd1 As New SqlCommand(sql, Con)
    '                cmd1.CommandType = CommandType.Text
    '                cmd1.Parameters.AddWithValue("@CREREQID", CREREQID)
    '                'cmd1.Parameters.AddWithValue("@Status", Status)
    '                'cmd1.Parameters.AddWithValue("@UpdDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
    '                'cmd1.Parameters.AddWithValue("@UpdTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
    '                cmd1.ExecuteNonQuery()
    '            End Using
    '            Return "Success"
    '        End Using
    '    Catch ex As Exception
    '        ErrorLogs.LogException(ex, "Error in UpdateCreditStatus")
    '        Throw ex
    '    End Try
    'End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="CREREQID"></param>
    ''' <param name="Status"></param>
    ''' <param name="User"></param>
    ''' <returns></returns>
    Public Shared Function UpdateCreditStatus(CREREQID As String, Status As String, User As String) As String
        Try

            If (User.Length < 20) Then
                User = User
            Else
                User = User.Substring(0, 20)
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd1 As New SqlCommand("spUpdateCreditStatus", Con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@CREREQID", CREREQID)
                    cmd1.Parameters.AddWithValue("@Status", Status)
                    cmd1.Parameters.AddWithValue("@User", User)
                    cmd1.ExecuteNonQuery()
                End Using
                Return "Success"
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCreditStatus")
            Throw ex
        End Try
    End Function


    ''' <summary>
    ''' Anitha :: 19-Oct-2018 :: insert into table F_SLSCHG
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <param name="TypeTrans"></param>
    ''' <param name="User"></param>
    ''' <returns></returns>
    Public Shared Function InsertintoF_SLSCHG(ID As String, TypeTrans As String, User As String, Optional ByVal OrderNo As String = "") As String
        Try

            If (User.Length < 20) Then
                User = User
            Else
                User = User.Substring(0, 20)
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd1 As New SqlCommand("spInsertintoF_SLSCHG", Con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@ID", ID)
                    cmd1.Parameters.AddWithValue("@TYPETRANS", TypeTrans)
                    cmd1.Parameters.AddWithValue("@User", User)
                    cmd1.Parameters.AddWithValue("@OrderNo", OrderNo)
                    cmd1.ExecuteNonQuery()
                End Using
                Return "Success"
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in InsertintoF_SLSCHG")
            Throw ex
        End Try
    End Function

    Public Shared Function DeleteCreditRequest(CREREQID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using cmd As New SqlCommand("spDeleteCreditRequest", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CREREQID", CREREQID)
                    cmd.ExecuteNonQuery()
                End Using
                'Using cmd2 As New SqlCommand("delete from tblCreditImages where CREREQ_ID=@CREREQID", Con)
                '    cmd2.CommandType = CommandType.Text
                '    cmd2.Parameters.AddWithValue("@CREREQID", CREREQID)
                '    cmd2.ExecuteNonQuery()
                'End Using
                Return "Success"
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteCreditRequest")
            Throw ex
        End Try
    End Function

    Public Shared Function UpdateCreditDetails(ID As String, VETID As String, TotalUnits As String, TotalCrReqAmt As String, TotGrowerAmt As String, Price As String, UnitCost As String, Packing As String, ImportCost As String, Freight As String, Fumigation As String, AntiDump As String, Fuel As String, User As String, Reason As String, TabName As String, DeniedReason As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of VET_)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using cmd1 As New SqlCommand("spUpdateCreditDetails", Con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@ID", ID.ToString())
                    cmd1.Parameters.AddWithValue("@VETID", VETID.ToString())
                    cmd1.Parameters.AddWithValue("@TotalUnits", TotalUnits)
                    cmd1.Parameters.AddWithValue("@TotalCrReqAmt", TotalCrReqAmt)
                    cmd1.Parameters.AddWithValue("@TotGrowerAmt", TotGrowerAmt)
                    cmd1.Parameters.AddWithValue("@Price", Price)
                    cmd1.Parameters.AddWithValue("@UnitCost", UnitCost)
                    cmd1.Parameters.AddWithValue("@Packing", Packing)
                    cmd1.Parameters.AddWithValue("@ImportCost", ImportCost)
                    cmd1.Parameters.AddWithValue("@Freight", Freight)
                    cmd1.Parameters.AddWithValue("@Fuel", Fuel)
                    cmd1.Parameters.AddWithValue("@Fumigation", Fumigation)
                    cmd1.Parameters.AddWithValue("@AntiDump", AntiDump)
                    cmd1.Parameters.AddWithValue("@User", User)
                    'cmd1.Parameters.AddWithValue("@TransDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    'cmd1.Parameters.AddWithValue("@TransTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd1.Parameters.AddWithValue("@UpdDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd1.Parameters.AddWithValue("@UpdTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd1.Parameters.AddWithValue("@Reason", Reason)
                    cmd1.Parameters.AddWithValue("@TabName", TabName)
                    cmd1.Parameters.AddWithValue("@DeniedReason", DeniedReason)
                    cmd1.ExecuteNonQuery()
                End Using
                Return "Success"
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCreditDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function UpdateCreditDetailsWithImages(ID As String, VETID As String, TotalUnits As String, TotalCrReqAmt As String, TotGrowerAmt As String, Price As String, UnitCost As String, Packing As String, ImportCost As String, Freight As String, Fumigation As String, AntiDump As String, Fuel As String, User As String, Reason As String, TabName As String, DeniedReason As String, CreditFilenames As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistsalesDetails As New List(Of VET_)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using cmd1 As New SqlCommand("spUpdateCreditDetailsWithImages", Con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@ID", ID.ToString())
                    cmd1.Parameters.AddWithValue("@VETID", VETID.ToString())
                    cmd1.Parameters.AddWithValue("@TotalUnits", TotalUnits)
                    cmd1.Parameters.AddWithValue("@TotalCrReqAmt", TotalCrReqAmt)
                    cmd1.Parameters.AddWithValue("@TotGrowerAmt", TotGrowerAmt)
                    cmd1.Parameters.AddWithValue("@Price", Price)
                    cmd1.Parameters.AddWithValue("@UnitCost", UnitCost)
                    cmd1.Parameters.AddWithValue("@Packing", Packing)
                    cmd1.Parameters.AddWithValue("@ImportCost", ImportCost)
                    cmd1.Parameters.AddWithValue("@Freight", Freight)
                    cmd1.Parameters.AddWithValue("@Fuel", Fuel)
                    cmd1.Parameters.AddWithValue("@Fumigation", Fumigation)
                    cmd1.Parameters.AddWithValue("@AntiDump", AntiDump)
                    cmd1.Parameters.AddWithValue("@User", User)
                    'cmd1.Parameters.AddWithValue("@TransDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    'cmd1.Parameters.AddWithValue("@TransTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd1.Parameters.AddWithValue("@UpdDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd1.Parameters.AddWithValue("@UpdTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd1.Parameters.AddWithValue("@Reason", Reason)
                    cmd1.Parameters.AddWithValue("@TabName", TabName)
                    cmd1.Parameters.AddWithValue("@DeniedReason", DeniedReason)
                    cmd1.Parameters.AddWithValue("@CreditFileNames", CreditFilenames)
                    cmd1.ExecuteNonQuery()
                End Using
                Return "Success"
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCreditDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function RemoveCreditRequestPic(ID As String, VETID As String, FileName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using cmd As New SqlCommand("spRemoveCreditRequestPic", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.Parameters.AddWithValue("@VETID", VETID)
                    cmd.Parameters.AddWithValue("@FileName", FileName)
                    cmd.ExecuteNonQuery()
                End Using
                Return "Success"
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in RemoveCreditRequestPic")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCreditRptEmailSub(ByVal CREREQID As String) As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetCreditRptEmailSub", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CREREQID", CREREQID)
                    cmd.CommandTimeout = 0
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row In ds.Rows
                        Dim u As New Credits
                        u.VETID = IIf(row("VET_ID") Is DBNull.Value, 0, row("VET_ID"))
                        u.Farm = IIf(row("Farm") Is DBNull.Value, "", row("Farm"))
                        u.FarmName = IIf(row("FarmName") Is DBNull.Value, "", row("FarmName"))
                        u.ImageName = IIf(row("ImageName") Is DBNull.Value, "", row("ImageName"))
                        u.ImageName = HttpUtility.UrlPathEncode(u.ImageName)
                        uList.Add(u)
                    Next
                End Using
                'Using cmd As New SqlCommand("select * from tblCreditImages where CREREQ_ID=@ID and VET_ID=@VET_ID", con)
                '    cmd.CommandType = CommandType.Text
                '    cmd.Parameters.AddWithValue("@ID", ID)
                '    cmd.Parameters.AddWithValue("@VET_ID", VETID)
                '    cmd.CommandTimeout = 0
                '    Dim da As New SqlDataAdapter(cmd)
                '    Dim ds As New DataTable
                '    da.Fill(ds)
                '    For Each row In ds.Rows
                '        Dim u As New Credits
                '        u.ID = row("ID")
                '        u.ImageName = row("ImageName")
                '        uList.Add(u)
                '    Next
                'End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditRptEmailSub")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 06-Oct-2018 :: if credits approved then insert to F_SLSCHG table
    ''' </summary>
    ''' <param name="UserName"></param>
    ''' <returns></returns>
    Public Shared Function SaveF_SLSCHG(UserName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Using cmd1 As New SqlCommand("spSaveF_SLSCHG", Con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@ADDUSER", UserName)
                    cmd1.ExecuteNonQuery()
                End Using
                Return "Success"
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveF_SLSCHG")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Anitha :: 22-Oct-2018 :: check COD report have any data to print
    ''' </summary>
    ''' <param name="FromDate"></param>
    ''' <param name="ToDate"></param>
    ''' <returns></returns>
    Public Shared Function CheckCntforCODReport(ByVal FromDate As String, ByVal ToDate As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim dt As New DataTable()
                Using cmd1 As New SqlCommand("spGetCODReportList", Con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@FromDate", FromDate)
                    cmd1.Parameters.AddWithValue("@ToDate", ToDate)
                    Dim sdr = cmd1.ExecuteReader()
                    If sdr.HasRows Then
                        Return "Valid"
                    Else
                        Return "No Data"
                    End If
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckCntforCODReport")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Anitha :: 22-Oct-2018 :: check sales maintenance journal have any data to print
    ''' </summary>
    ''' <param name="FromDate"></param>
    ''' <param name="ToDate"></param>
    ''' <returns></returns>
    Public Shared Function CheckCntforPrintSalesMaintenanceJournal(ByVal FromDate As String, ByVal ToDate As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim dt As New DataTable()
                Using cmd1 As New SqlCommand("SpPrintSalesMaintenanceJournal", Con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@FromDate", FromDate)
                    cmd1.Parameters.AddWithValue("@ToDate", ToDate)
                    Dim sdr = cmd1.ExecuteReader()
                    If sdr.HasRows Then
                        Return "Valid"
                    Else
                        Return "No Data"
                    End If
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckCntforPrintSalesMaintenanceJournal")
            Throw ex
        End Try
    End Function

    Public Shared Function GetInvoicefromCreditRequest(ByVal ID As Integer) As List(Of Credits)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Credits)()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim dt As New DataTable()
                Using cmd As New SqlCommand("spGetCreditRequestInvoice", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CreditId", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row In ds.Rows
                        Dim u As New Credits
                        u.Customer = ds.Rows(0)("CUSTOMER").ToString()
                        u.INVOICE = ds.Rows(0)("INVOICE").ToString()
                        uList.Add(u)
                    Next

                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckCntforPrintSalesMaintenanceJournal")
            Throw ex
        End Try
    End Function

End Class

Public Class Credits
    Private _RowNo As Integer
    Public Property RowNo() As Integer
        Get
            Return _RowNo
        End Get
        Set(ByVal value As Integer)
            _RowNo = value
        End Set
    End Property

    Private _ID As String
    Public Property ID() As String
        Get
            Return _ID
        End Get
        Set(value As String)
            _ID = value
        End Set
    End Property

    Private _CODE As String
    Public Property CODE() As String
        Get
            Return _CODE
        End Get
        Set(value As String)
            _CODE = value
        End Set
    End Property

    Private _CreditDesc As String
    Public Property CreditDesc() As String
        Get
            Return _CreditDesc
        End Get
        Set(value As String)
            _CreditDesc = value
        End Set
    End Property

    Private _REASON As String
    Public Property REASON() As String
        Get
            Return _REASON
        End Get
        Set(value As String)
            _REASON = value
        End Set
    End Property

    Private _ORDER As String
    Public Property ORDER() As String
        Get
            Return _ORDER
        End Get
        Set(value As String)
            _ORDER = value
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

    Private _FlowerName As String
    Public Property FlowerName() As String
        Get
            Return _FlowerName
        End Get
        Set(value As String)
            _FlowerName = value
        End Set
    End Property

    Private _Farm As String
    Public Property Farm() As String
        Get
            Return _Farm
        End Get
        Set(value As String)
            _Farm = value
        End Set
    End Property

    Private _FarmName As String
    Public Property FarmName() As String
        Get
            Return _FarmName
        End Get
        Set(value As String)
            _FarmName = value
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

    Private _DateRec As String
    Public Property DateRec() As String
        Get
            Return _DateRec
        End Get
        Set(value As String)
            _DateRec = value
        End Set
    End Property

    Private _FarmInv As String
    Public Property FarmInv() As String
        Get
            Return _FarmInv
        End Get
        Set(value As String)
            _FarmInv = value
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

    Private _DaysFresh As String
    Public Property DaysFresh() As String
        Get
            Return _DaysFresh
        End Get
        Set(value As String)
            _DaysFresh = value
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

    Private _FOB As Decimal
    Public Property FOB() As Decimal
        Get
            Return _FOB
        End Get
        Set(ByVal value As Decimal)
            _FOB = value
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

    Private _Salesman As String
    Public Property Salesman() As String
        Get
            Return _Salesman
        End Get
        Set(ByVal value As String)
            _Salesman = value
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

    Private _ControlNum As Integer
    Public Property ControlNum() As Integer
        Get
            Return _ControlNum
        End Get
        Set(value As Integer)
            _ControlNum = value
        End Set
    End Property

    Private _DaysApplied As String
    Public Property DaysApplied() As String
        Get
            Return _DaysApplied
        End Get
        Set(value As String)
            _DaysApplied = value
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

    Private _Status As String
    Public Property Status() As String
        Get
            Return _Status
        End Get
        Set(value As String)
            _Status = value
        End Set
    End Property

    Private _Applied As String
    Public Property Applied() As String
        Get
            Return _Applied
        End Get
        Set(value As String)
            _Applied = value
        End Set
    End Property

    Private _InvDate As String
    Public Property InvDate() As String
        Get
            Return _InvDate
        End Get
        Set(value As String)
            _InvDate = value
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

    Private _VETID As Integer
    Public Property VETID() As Integer
        Get
            Return _VETID
        End Get
        Set(value As Integer)
            _VETID = value
        End Set
    End Property

    Private _ImageName As String
    Public Property ImageName() As String
        Get
            Return _ImageName
        End Get
        Set(ByVal value As String)
            _ImageName = value
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

    Private _ADDDATE As String
    Public Property ADDDATE() As String
        Get
            Return _ADDDATE
        End Get
        Set(value As String)
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

    Private _DENIEDBY As String
    Public Property DENIEDBY() As String
        Get
            Return _DENIEDBY
        End Get
        Set(value As String)
            _DENIEDBY = value
        End Set
    End Property

    Private _DENIEDDATE As String
    Public Property DENIEDDATE() As String
        Get
            Return _DENIEDDATE
        End Get
        Set(value As String)
            _DENIEDDATE = value
        End Set
    End Property

    Private _DENIEDTIME As String
    Public Property DENIEDTIME() As String
        Get
            Return _DENIEDTIME
        End Get
        Set(value As String)
            _DENIEDTIME = value
        End Set
    End Property

    Private _DENIEDREAS As String
    Public Property DENIEDREAS() As String
        Get
            Return _DENIEDREAS
        End Get
        Set(value As String)
            _DENIEDREAS = value
        End Set
    End Property

    Private _Customer As String
    Public Property Customer() As String
        Get
            Return _Customer
        End Get
        Set(value As String)
            _Customer = value
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

    Private _TransDate As String
    Public Property TransDate() As String
        Get
            Return _TransDate
        End Get
        Set(value As String)
            _TransDate = value
        End Set
    End Property

    Private _SlsName As String
    Public Property SlsName() As String
        Get
            Return _SlsName
        End Get
        Set(ByVal value As String)
            _SlsName = value
        End Set
    End Property

    Private _GrowerAmt As Decimal
    Public Property GrowerAmt() As Decimal
        Get
            Return _GrowerAmt
        End Get
        Set(ByVal value As Decimal)
            _GrowerAmt = value
        End Set
    End Property

    Private _GrowerAmtTotal As Decimal
    Public Property GrowerAmtTotal() As Decimal
        Get
            Return _GrowerAmtTotal
        End Get
        Set(ByVal value As Decimal)
            _GrowerAmtTotal = value
        End Set
    End Property

    Private _UnitCost As Decimal
    Public Property UnitCost() As Decimal
        Get
            Return _UnitCost
        End Get
        Set(ByVal value As Decimal)
            _UnitCost = value
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

    Private _ImpCost As Decimal
    Public Property ImpCost() As Decimal
        Get
            Return _ImpCost
        End Get
        Set(ByVal value As Decimal)
            _ImpCost = value
        End Set
    End Property

    Private _Fumigation As Decimal
    Public Property Fumigation() As Decimal
        Get
            Return _Fumigation
        End Get
        Set(ByVal value As Decimal)
            _Fumigation = value
        End Set
    End Property

    Private _AntiDump As Decimal
    Public Property AntiDump() As Decimal
        Get
            Return _AntiDump
        End Get
        Set(ByVal value As Decimal)
            _AntiDump = value
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

    Private _Salesmang As String
    Public Property Salesmang() As String
        Get
            Return _Salesmang
        End Get
        Set(value As String)
            _Salesmang = value
        End Set
    End Property

    Private _SMDATE As String
    Public Property SMDATE() As String
        Get
            Return _SMDATE
        End Get
        Set(value As String)
            _SMDATE = value
        End Set
    End Property

    Private _SMTIME As String
    Public Property SMTIME() As String
        Get
            Return _SMTIME
        End Get
        Set(value As String)
            _SMTIME = value
        End Set
    End Property

    Private _APPROVEDBY As String
    Public Property APPROVEDBY() As String
        Get
            Return _APPROVEDBY
        End Get
        Set(value As String)
            _APPROVEDBY = value
        End Set
    End Property

    Private _APPROVEDDA As String
    Public Property APPROVEDDA() As String
        Get
            Return _APPROVEDDA
        End Get
        Set(value As String)
            _APPROVEDDA = value
        End Set
    End Property

    Private _APPROVEDTI As String
    Public Property APPROVEDTI() As String
        Get
            Return _APPROVEDTI
        End Get
        Set(value As String)
            _APPROVEDTI = value
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

    Private _INVOICE As Decimal
    Public Property INVOICE() As Integer
        Get
            Return _INVOICE
        End Get
        Set(ByVal value As Integer)
            _INVOICE = value
        End Set
    End Property

End Class
