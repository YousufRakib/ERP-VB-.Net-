Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Xml


Public Class Incoming
    Public Class BarCode
        Public Property barcode As Integer
        Public Property awb As String
    End Class
    Public Shared Function UploadDVFile(ByVal fname As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("sp_InsertDVLabelData", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FilePath", HttpContext.Current.Server.MapPath("~/temp/") + fname)
                    'cmd.Parameters.AddWithValue("@FilePath", "d\common\Bloom\Bloom\temp\" + fname)
                    cmd.ExecuteNonQuery()
                    System.IO.File.Delete(HttpContext.Current.Server.MapPath("~/temp/") + fname)
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UploadDVFile")
            Return "error"
        End Try
    End Function

    ' ''' <summary>
    ' ''' STA::13-OCT-2015::to update the Weight,Dimensionalweight,MPF and Duties for Incoming 
    ' ''' </summary>
    ' ''' <param name="AWB"></param>
    ' ''' <param name="Farm"></param>
    ' ''' <param name="IncomDate"></param>
    ' ''' <param name="Headerid"></param>
    ' ''' <param name="Weight"></param>
    ' ''' <param name="DimensionalWeight"></param>
    ' ''' <param name="MPF"></param>
    ' ''' <param name="Duties"></param>
    ' ''' <returns></returns>
    ' ''' <remarks></remarks>
    'Public Shared Function UpdateMeasurementDetails(ByVal AWB As String, ByVal Farm As String, ByVal IncomDate As String, ByVal Headerid As Integer, ByVal Weight As Decimal, ByVal DimensionalWeight As Decimal, ByVal MPF As Decimal, ByVal Duties As Decimal) As String
    '    Try
    '        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
    '        Using con As New SqlConnection(ConStr)
    '            con.Open()
    '            Using cmd As New SqlCommand("Update tblPoheader set Weight=@Weight,MPF=@MPF,Duties=@Duties,DimensionalWeight=@DimensionalWeight where HeaderId=@HeaderId", con)
    '                cmd.CommandType = CommandType.Text
    '                cmd.Parameters.AddWithValue("@Weight", Weight)
    '                cmd.Parameters.AddWithValue("@MPF", MPF)
    '                cmd.Parameters.AddWithValue("@Duties", Duties)
    '                cmd.Parameters.AddWithValue("@DimensionalWeight", DimensionalWeight)
    '                cmd.Parameters.AddWithValue("@HeaderId", Headerid)
    '                cmd.ExecuteNonQuery()

    '                Dim loginuserdetails As New User
    '                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
    '                    loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
    '                    Logs.Savelog(loginuserdetails.ID, "Users", "UpdateMeasurementDetails", "Udpate weight,MPF and Duties Detail - " + AWB + ",Farm" + Farm + "," + " Date =" + IncomDate)
    '                End If
    '            End Using
    '        End Using
    '        Return "success"
    '    Catch ex As Exception
    '        ErrorLogs.LogException(ex, "Error In UpdateMeasurementDetails")
    '        Return "error"
    '    End Try
    'End Function

    Public Shared Function GenerateXMLFileforIncoming(ByVal SelectedHeaderIDs As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader
            Dim POHeaderXML As String = ""
            Dim xml As String = ""
            Dim AWB As String = ""

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select hed.HeaderId,hed.awb,hed.Farm,vw.ID from tblPoHeader hed inner join " +
                                            "(select HeaderID,ID=STUFF((select ', '+cast(ID as varchar(MAX)) from vwGetDistinctManualPOAWBDetails b " +
                                            "where b.HeaderID=a.HeaderID for XML path('')),1,2,'') from vwGetDistinctManualPOAWBDetails a where HeaderID in " +
                                            "(select s from CSV2Table(@SelectedHeaderIDs)) group by HeaderID)as vw on vw.HeaderID=hed.HeaderId order by Farm asc " +
                                            "option (maxrecursion 0)", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@SelectedHeaderIDs", SelectedHeaderIDs))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        POHeaderXML += CreatePODetailsXMLFileforIncoming(row("ID"))
                        AWB = Convert.ToString(row("AWB"))
                    Next

                End Using
            End Using
            POHeaderXML = "<Invoices>" + POHeaderXML + "</Invoices>"
            xml = ManualPODetails.PrettyXML(POHeaderXML)
            xml = xml.Replace("*E*", "")

            Dim VendorFileFolderName As String = System.Web.HttpContext.Current.Server.MapPath("temp")
            Dim LogPath As String = VendorFileFolderName

            If Not Directory.Exists(LogPath) Then
                Directory.CreateDirectory(LogPath)
            End If
            If (AWB <> Nothing And AWB <> String.Empty) Then
                AWB = AWB.Substring(AWB.Length - 4, 4)
            Else
                AWB = "Incoming"
            End If

            Dim filename As String = AWB + ".XML"


            Dim filepath As String = LogPath & "\" & filename
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
            Dim xmldetails As XMLDetails = New XMLDetails()
            xmldetails.XMLFileName = filename
            xmldetails.XMLFileContent = "<?xml version='1.0' encoding='UTF-8'?>" + xml
            Return filename
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GenerateXMLFileforIncoming")
            Return Nothing
        End Try
    End Function

    Public Shared Function CreatePODetailsXMLFileforIncoming(ByVal DetailsIDs As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim xml As String = ""
            Dim AWB As String = ""
            Dim FileAWB As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using AWBCmd As New SqlCommand("Select Distinct(AWB) from vwGetIncomingManualPODetailsbyAWB where id=@DetailsID", con)
                    AWBCmd.CommandType = CommandType.Text
                    AWBCmd.Parameters.AddWithValue("@DetailsID", DetailsIDs)
                    Dim AWBda As New SqlDataAdapter(AWBCmd)
                    Dim AWBds As New DataTable
                    AWBda.Fill(AWBds)
                    For Each AWBrow In AWBds.Rows
                        AWB = Convert.ToString(AWBrow("AWB"))
                        If (AWB <> "" And AWB <> Nothing) Then
                            Using cmd As New SqlCommand("[spCreatePODetailsXMLForIncoming]", con)
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
                        End If
                    Next
                End Using
            End Using
            Return xml

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CreatePODetailsXMLFileforIncoming")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' STA::13-OCT-2015::to update the Weight,Dimensionalweight,MPF and Duties for Incoming 
    ''' </summary>
    ''' <param name="Details"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function UpdateIncomingDetails(ByVal Details As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spUpdateIncomingDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ICDetailsList", Details.ToLower())
                    cmd.ExecuteNonQuery()

                    Dim IDs As New XmlDocument()
                    IDs.LoadXml(Details)
                    Dim IDsList As XmlNodeList = IDs.GetElementsByTagName("ID")
                    Dim result As String = ""
                    For Each detail As XmlNode In IDsList
                        result += IIf(result.Length <= 0, "", " , ")
                        result += detail.InnerText
                    Next
                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        Logs.Savelog(loginuserdetails.ID, "Users", "UpdateIncomingDetails", ("Updated incoming details are " + Details.ToLower()), result)
                    End If
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateIncomingDetails")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' SURESH::12/07/2018::to update Po Header Buyer details for Incoming 
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="Credits"></param>
    '''  <param name="AmountToPay"></param>
    '''  <param name="BuyerApproval"></param>
    ''' <param name="DateApproved"></param>
    Public Shared Function UpdateIncomingPoBuyerApprovalDetails(ByVal HeaderId As Integer, Credits As Decimal, AmountToPay As Decimal, BuyerApproval As Boolean, DateApproved As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UDP_UpdatePOBuyer_Details", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.Parameters.AddWithValue("@Credits", Credits)
                    cmd.Parameters.AddWithValue("@AmountToPay", AmountToPay)
                    cmd.Parameters.AddWithValue("@BuyerApproval", BuyerApproval)
                    cmd.Parameters.AddWithValue("@DateApproved", DateApproved)
                    cmd.ExecuteNonQuery()

                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        Logs.Savelog(loginuserdetails.ID, "Users", "UpdateIncomingPoBuyerApprovalDetails", ("Updated HeaderId=" & HeaderId & " Credits =" & Credits & ",AmountToPay=" & AmountToPay & ",BuyerApproval=" & BuyerApproval & ",DateApproved=" & DateApproved & " "), "1 Record")
                    End If
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateIncomingPoBuyerApprovalDetails")
            Return "error"
        End Try
    End Function


    ''' <summary>
    ''' SURESH::12/07/2018::to update Po Header Farm Amount for Incoming 
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="FarmAmount"></param>
    Public Shared Function UpdateIncomingPoFarmAmount(ByVal HeaderId As Integer, FarmAmount As Decimal) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UDP_UpdatePOFarmAmount", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.Parameters.AddWithValue("@FarmAmount", FarmAmount)
                    cmd.ExecuteNonQuery()

                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        Logs.Savelog(loginuserdetails.ID, "Users", "UpdateIncomingPoFarmAmount", ("Updated HeaderId=" & HeaderId & " FarmAmount =" & FarmAmount & ""), "1 Record")
                    End If
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateIncomingPoFarmAmount")
            Return "error"
        End Try
    End Function


    ''' <summary>
    ''' SURESH::12/07/2018::to update Po Header Credit Amount for Incoming 
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="CreditAmount"></param>
    ''' <param name="AmountToPay"></param>
    Public Shared Function UpdateIncomingPoCreditAmount(ByVal HeaderId As Integer, CreditAmount As Decimal, AmountToPay As Decimal) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UDP_UpdatePOCreditAmount", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.Parameters.AddWithValue("@CreditAmount", CreditAmount)
                    cmd.Parameters.AddWithValue("@AmountToPay", AmountToPay)
                    cmd.ExecuteNonQuery()

                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        Logs.Savelog(loginuserdetails.ID, "Users", "UpdateIncomingPoCreditAmount", ("Updated HeaderId=" & HeaderId & " CreditAmount =" & CreditAmount & " AmountToPay =" & AmountToPay & ""), "1 Record")
                    End If
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateIncomingPoFarmAmount")
            Return "error"
        End Try
    End Function


    ''' <summary>
    ''' SURESH::12/07/2018::to update Po Header Payment details for Incoming 
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="Paid"></param>
    '''  <param name="DatePayed"></param>
    '''  <param name="PendingPayment"></param>
    Public Shared Function UpdateIncomingPoPayment_Details(ByVal HeaderId As Integer, Paid As Boolean, DatePayed As String, PendingPayment As Decimal) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UDP_UpdatePOPayment_Details", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.Parameters.AddWithValue("@Paid", Paid)
                    cmd.Parameters.AddWithValue("@DatePayed", DatePayed)
                    cmd.Parameters.AddWithValue("@PendingPayment", PendingPayment)
                    cmd.ExecuteNonQuery()

                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        Logs.Savelog(loginuserdetails.ID, "Users", "UpdateIncomingPoPayment_Details", ("Updated HeaderId=" & HeaderId & " Paid =" & Paid & ",DatePayed=" & DatePayed & ",PendingPayment=" & PendingPayment & " "), "1 Record")
                    End If
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateIncomingPoPayment_Details")
            Return "error"
        End Try
    End Function


    ''' <summary>
    ''' SURESH::12/07/2018::to update Po Header QB details for Incoming 
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="QB"></param>
    '''  <param name="DateQB"></param>
    Public Shared Function UpdateIncomingPoQB_Details(ByVal HeaderId As Integer, QB As Boolean, DateQB As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UDP_UpdatePOQB_Details", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@HeaderId", HeaderId)
                    cmd.Parameters.AddWithValue("@QB", QB)
                    cmd.Parameters.AddWithValue("@DateQB", DateQB)
                    cmd.ExecuteNonQuery()

                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        Logs.Savelog(loginuserdetails.ID, "Users", "UpdateIncomingPoQB_Details", ("Updated HeaderId=" & HeaderId & " QB =" & QB & ",DateQB=" & DateQB & ""), "1 Record")
                    End If
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateIncomingPoQB_Details")
            Return "error"
        End Try
    End Function

    Public Shared Function UpdateIncomingPoQBByHeaderIdList(ByVal HeaderIds As List(Of Integer)) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                For Each id In HeaderIds

                    Using cmd As New SqlCommand("UDP_UpdatePOQB_Details", con)
                        ' TODO: make bulk
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@HeaderId", id)
                        cmd.Parameters.AddWithValue("@QB", 1)
                        cmd.Parameters.AddWithValue("@DateQB", DateTime.Now().ToString("yyyy-MM-dd"))
                        cmd.ExecuteNonQuery()

                        Dim loginuserdetails As New User
                        If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                            loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                            Logs.Savelog(loginuserdetails.ID, "Users", "UpdateIncomingPoQB_Details", ("Updated HeaderId=" & id & " QB = 1" & ",DateQB=" & DateTime.Now().ToString("yyyy-MM-dd") & ""), "1 Record")
                        End If
                    End Using
                Next
                con.Close()
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateIncomingPoQBByHeaderIdList")
            Return "error"
        End Try
    End Function
    Public Shared Function VerifyIncomingDetails(ByVal CreatedUserID As Integer, ByVal DetailsList As String, ByVal HeaderIDs As String, ByVal AWBAndFarmWC As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spVerifyIncomingDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@CreatedUserId", CreatedUserID))
                    cmd.Parameters.Add(New SqlParameter("@DetailsList", DetailsList))
                    cmd.Parameters.Add(New SqlParameter("@HeaderIDs", HeaderIDs))
                    cmd.ExecuteNonQuery()
                End Using
                Logs.Savelog(CreatedUserID, "Incoming", "VerifyIncomingDetails", ("verified incoming details For " + AWBAndFarmWC.ToString() + ""), HeaderIDs)
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in VerifyIncomingDetails")
            Return "error"
        End Try
    End Function


    Public Shared Function UpdateScanningValidationBoxDetails(ByVal CreatedUserID As Integer, ByVal AWB As String, ByVal poqDetailsList As String, ByVal BarcodeListFromService As String,
                                                              ByVal HeaderDate As String, ByVal wc As String, ByVal Agency As String, ByVal UserFile As String, ByVal CargoDate As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim HeaderIDs As String = ""
                Using cmd As New SqlCommand("spUpdateScanningValidationBoxDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@CreatedUserId", CreatedUserID))
                    cmd.Parameters.Add(New SqlParameter("@AWB", AWB))
                    cmd.Parameters.Add(New SqlParameter("@poqDetailsList", poqDetailsList))
                    cmd.Parameters.Add(New SqlParameter("@BarcodeListFromService", BarcodeListFromService))
                    cmd.Parameters.Add(New SqlParameter("@ReceivingDate", HeaderDate))
                    cmd.Parameters.Add(New SqlParameter("@Agency", Agency))
                    cmd.Parameters.Add(New SqlParameter("@CargoDate", CargoDate))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    If ds.Tables(0).Rows.Count > 0 Then
                        For Each r In ds.Tables(0).Rows
                            HeaderIDs += r(0).ToString()
                        Next
                    End If

                    Dim stream As MemoryStream = CSVUtility.GetCSV(ds.Tables(3))
                    Dim path As String = ConfigurationManager.AppSettings("DBFPath")
                    File.WriteAllBytes(path + UserFile + ".csv", stream.ToArray())

                    Dim streamBreakdown As MemoryStream = CSVUtility.GetCSV(ds.Tables(4))
                    File.WriteAllBytes(path + "BD" + UserFile.Substring(UserFile.Length - 2) + ".csv", streamBreakdown.ToArray())

                    Return HeaderIDs
                End Using
                Logs.Savelog(CreatedUserID, "Incoming", "UpdateScanningValidationBoxDetails", ("Scanning validation For " + poqDetailsList.ToString() + ""), wc)
                Return "Success"
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateScanningValidationBoxDetails")
            Return "error"
        End Try
    End Function
    Public Shared Function GetPurchaseOrdersforLastFiveDays(ByVal ShipDate As String) As List(Of NewManualPO)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of NewManualPO)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim HeaderIDs As String = ""
                Using cmd As New SqlCommand("spGetPurchaseOrdersforLastFiveDays", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@ShipDate", ShipDate))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)

                    For Each row In ds.Rows
                        Dim u As New NewManualPO
                        u.Farm = row("FARM").ToString()
                        u.Flower = row("FLOWER").ToString()
                        u.Quantity = Convert.ToInt32(row("qtybox")).ToString()
                        u.UOM = row("UOM").ToString()
                        u.Units = row("qtyxbox").ToString()
                        u.UnitsPerBunch = row("unitsperbunch").ToString()
                        u.CostPerUnits = row("unitcosq").ToString()
                        u.FlowerName = row("prodnamq").ToString()
                        u.FlowerCategory = row("CAT").ToString()
                        u.FOB = "0"
                        u.ShipDate = row("shipdate").ToString()
                        u.BoxNum = row("boxnum").ToString()
                        u.PONumber = row("PONUM").ToString()
                        u.Breakdown = row("COMMENTQ").ToString()
                        u.Cust = row("customer").ToString()
                        u.BoxCode = row("boxcode").ToString()
                        u.AWB = row("AWB").ToString()
                        u.Hawb = row("HAWB").ToString()
                        u.Invoice = row("Invoice").ToString()
                        u.SPORDID = row("SPORDID").ToString()
                        u.ORDER2ID = row("ORDER2ID").ToString()
                        u.WH = row("WH").ToString()
                        uList.Add(u)
                    Next

                End Using

                Return uList
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPurchaseOrdersforLastFiveDays")
            Dim uList As New List(Of NewManualPO)
            Dim u As New NewManualPO
            u.ErrorMessage = "Error in GetPurchaseOrdersforLastFiveDays ::" + ErrorLogs.ExceptionHandling(ex, "GetPurchaseOrdersforLastFiveDays")
            uList.Add(u)
            Return uList
        End Try
    End Function


    Public Shared Function GetFreightByAirportAndHandlingByWarehouse(ByVal Airport As String, ByVal Warehouse As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim ChargeString As String = "0.000~0.000"
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("GetFreightByAirportAndHandlingByWarehouse", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Airport", Airport)
                    cmd.Parameters.AddWithValue("@Warehouse", Warehouse)
                    ChargeString = cmd.ExecuteScalar()
                End Using
            End Using
            Return ChargeString
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In Service :: GetFreightByAirportAndHandlingByWarehouse")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetFreightByFarmAndHandlingByWarehouse(ByVal Farm As String, ByVal Warehouse As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim ChargeString As String = "0.000~0.000"
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("GetFreightByFarmAndHandlingByWarehouse", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.Parameters.AddWithValue("@Warehouse", Warehouse)
                    ChargeString = cmd.ExecuteScalar()
                End Using
            End Using
            Return ChargeString
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In Service :: GetFreightByFarmAndHandlingByWarehouse")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetDutyPerUnit(ByVal Flower As String, ByVal Airport As String, ByVal Cost As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim ChargeString As String = "0.000"
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetDuty", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FLOWER", Flower)
                    cmd.Parameters.AddWithValue("@Airport", Airport)
                    cmd.Parameters.AddWithValue("@COST", Cost)
                    ChargeString = cmd.ExecuteScalar()
                End Using
            End Using
            Return ChargeString
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In Service :: GetDutyPerUnit")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetDutyPerUnitByFarm(ByVal Flower As String, ByVal Farm As String, ByVal Cost As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim ChargeString As String = "0.000"
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetDutyByFarm", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FLOWER", Flower)
                    cmd.Parameters.AddWithValue("@FARM", Farm)
                    cmd.Parameters.AddWithValue("@COST", Cost)
                    ChargeString = cmd.ExecuteScalar()
                End Using
            End Using
            Return ChargeString
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In Service :: GetDutyPerUnit")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetFBE(ByVal Flower As String, ByVal Farm As String, ByVal UOM As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim FBEString As String = "0.000"
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetFBE", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FLOWER", Flower)
                    cmd.Parameters.AddWithValue("@FARM", Farm)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    FBEString = cmd.ExecuteScalar()
                End Using
            End Using
            Return FBEString
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In Service :: GetFBE")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetProductFBEDetails(ByVal Category As String, ByVal Farm As String, ByVal UOM As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim FBEString As String = "0.000~0.00~0.00"
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetProductFBEDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CAT", Category)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    Dim result = cmd.ExecuteScalar()
                    If Not IsDBNull(result) Then
                        FBEString = result
                    End If
                End Using
            End Using
            Return FBEString
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In Service :: GetProductFBEDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function ImportIncomingDetails(ByVal UserFile As String, ByVal SelectedHeaders As String, ByVal ReceivingDate As String, ByVal Freight As String, ByVal Handling As String, ByVal UserID As String, ByVal Warehouse As String, ByVal FBE As String, ByVal TotalBoxes As String, ByVal OtherCharges As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim SQLStr As String
            Dim MsgString(10) As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmdValidate As New SqlCommand("spValidateIncomingTransferDetails", con)
                    cmdValidate.CommandType = CommandType.StoredProcedure
                    cmdValidate.Parameters.AddWithValue("@SelectedHeaders", SelectedHeaders)
                    cmdValidate.Parameters.AddWithValue("@TotalBoxesTransferred", Convert.ToInt32(TotalBoxes))
                    SQLStr = cmdValidate.ExecuteScalar()
                    MsgString = SQLStr.Split("~")
                    If MsgString(0) = "Success" Then
                        Using cmd As New SqlCommand("spTransferIncomingDetails", con)
                            cmd.CommandType = CommandType.StoredProcedure
                            cmd.Parameters.AddWithValue("@UserFile", UserFile)
                            cmd.Parameters.AddWithValue("@SelectedHeaders", SelectedHeaders)
                            cmd.Parameters.AddWithValue("@ReceivingDate", ReceivingDate)
                            cmd.Parameters.AddWithValue("@Freight", Freight)
                            cmd.Parameters.AddWithValue("@Handling", Handling)
                            cmd.Parameters.AddWithValue("@UserID", UserID)
                            cmd.Parameters.AddWithValue("@Warehouse", Warehouse)
                            cmd.Parameters.AddWithValue("@FBE", FBE)
                            cmd.Parameters.AddWithValue("@OtherCharges", OtherCharges)


                            cmd.ExecuteNonQuery()
                        End Using
                    End If
                End Using
            End Using
            Return SQLStr
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In Service :: ImportIncomingDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function ValidateIncomingDetails(ByVal SelectedHeaders As String, ByVal TotalBoxes As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim SQLStr As String
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmdValidate As New SqlCommand("spValidateIncomingTransferDetails", con)
                    cmdValidate.CommandType = CommandType.StoredProcedure
                    cmdValidate.Parameters.AddWithValue("@SelectedHeaders", SelectedHeaders)
                    cmdValidate.Parameters.AddWithValue("@TotalBoxesTransferred", TotalBoxes)
                    SQLStr = cmdValidate.ExecuteScalar()
                End Using
            End Using
            Return SQLStr
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In Service :: ValidateIncomingDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetTransferUserByUserType(ByVal UserId As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim TransferUser As String = "0"
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SELECT SalesPerson FROM tblUsers where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", UserId)
                    TransferUser = cmd.ExecuteScalar()
                    If TransferUser <> "0" Then
                        TransferUser = TransferUser
                    End If
                End Using
            End Using
            Return TransferUser
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetTransferUserByUserType")
            Return "error"
        End Try
    End Function


    Public Class GetIncomingPOHeader
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

        Private _TotalFBE As Decimal
        Public Property TotalFBE() As Decimal
            Get
                Return _TotalFBE
            End Get
            Set(ByVal value As Decimal)
                _TotalFBE = value
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
        Public Property TotalMissing() As Decimal
            Get
                Return _TotalMissing
            End Get
            Set(ByVal value As Decimal)
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
        Public Property TotalMissingAtOrigin() As Decimal
            Get
                Return _TotalMissingAtOrigin
            End Get
            Set(ByVal value As Decimal)
                _TotalMissingAtOrigin = value
            End Set
        End Property

        Private _TotalWeight As Decimal
        Public Property TotalWeight() As Decimal
            Get
                Return _TotalWeight
            End Get
            Set(ByVal value As Decimal)
                _TotalWeight = value
            End Set
        End Property

        Private _TotalDimensionalWeight As Decimal
        Public Property TotalDimensionalWeight() As Decimal
            Get
                Return _TotalDimensionalWeight
            End Get
            Set(ByVal value As Decimal)
                _TotalDimensionalWeight = value
            End Set
        End Property

        Private _TotalMPF As Decimal
        Public Property TotalMPF() As Decimal
            Get
                Return _TotalMPF
            End Get
            Set(ByVal value As Decimal)
                _TotalMPF = value
            End Set
        End Property

        Private _TotalDuties As Decimal
        Public Property TotalDuties() As Decimal
            Get
                Return _TotalDuties
            End Get
            Set(ByVal value As Decimal)
                _TotalDuties = value
            End Set
        End Property

        Private _TotalCredits As Decimal
        Public Property TotalCredits() As Decimal
            Get
                Return _TotalCredits
            End Get
            Set(ByVal value As Decimal)
                _TotalCredits = value
            End Set
        End Property

        Private _TotalAmountToPay As Decimal
        Public Property TotalAmountToPay() As Decimal
            Get
                Return _TotalAmountToPay
            End Get
            Set(ByVal value As Decimal)
                _TotalAmountToPay = value
            End Set
        End Property

        Private _TotalPendingPayment As Decimal
        Public Property TotalPendingPayment() As Decimal
            Get
                Return _TotalPendingPayment
            End Get
            Set(ByVal value As Decimal)
                _TotalPendingPayment = value
            End Set
        End Property
        Public Function RemovePDFFile(ByVal HeaderID As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("UPDATE tblPOHeader SET PDFFileName = NULL WHERE HeaderID = " & HeaderID, con)
                        cmd.CommandType = CommandType.Text
                        cmd.ExecuteNonQuery()
                    End Using
                End Using

                Return "success"
            Catch ex As Exception
                Return ex.Message
            End Try
        End Function

        Public Function GetIncomingPOHeader(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of ManualPOHeader)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of ManualPOHeader)()
                ' Dim erlog As New BloomService

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetIncomingPOHeader]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New ManualPOHeader()
                            u.HeaderID = row("HeaderId")
                            u.Header = Convert.ToString(row("Header"))
                            u.CreatedUser = Convert.ToString(row("VendorName"))
                            u.CreatedUserID = row("CreatedUserId")
                            u.FarmCode = Convert.ToString(row("Farm"))
                            u.FarmName = Convert.ToString(row("FarmName"))
                            u.FOB = Convert.ToString(row("fob"))
                            u.ShippedDate = Convert.ToDateTime(row("shippeddate")).ToString("yyyy/MM/dd")
                            u.Agency = Convert.ToString(row("AgencyCode"))
                            u.AWB = IIf(row("AWB") Is DBNull.Value, "", row("AWB"))
                            u.Pieces = row("Pieces")
                            u.FBE = IIf(row("FBE") Is DBNull.Value, 0, row("FBE"))
                            u.TotalUnits = row("TotalUnits")
                            u.TotalCost = row("TotalCost")
                            u.FarmAmount = row("FarmAmount")
                            u.Airport = Convert.ToString(row("Airport"))
                            u.PoDetails.Invoice = IIf(row("Invoice") Is DBNull.Value, "0", Convert.ToString(row("Invoice"))) ' Convert.ToString(row("Invoice"))
                            u.Invoice = IIf(row("Invoice") Is DBNull.Value, "0", Convert.ToString(row("Invoice"))) 'Convert.ToString(row("Invoice"))
                            u.IsXMLDownload = IIf(row("IsXMLDownload") Is DBNull.Value, 0, row("IsXMLDownload"))
                            u.PoDetails.Scanned = Convert.ToString(row("Scanned"))
                            u.Scanned = Convert.ToString(row("Scanned"))
                            u.PoDetails.Missing = Convert.ToString(row("Missing"))
                            u.PoDetails.ScannedOrigin = Convert.ToString(row("ScannedOrigin"))
                            u.PoDetails.MissingAtOrigin = Convert.ToString(row("MissingAtOrigin"))
                            u.PoDetails.DifferentBoxes = Convert.ToString(row("DifferentBoxes"))
                            u.Weight = row("Weight")
                            u.DimensionalWeight = row("DimensionalWeight")
                            u.MPF = row("MPF")
                            u.Duties = row("Duties")
                            'u.ImageFileName = IIf(IsDBNull(row("ImageFileName")), "", row("ImageFileName").Replace("_" + u.HeaderID.ToString(), ""))
                            'u.PDFFileName = IIf(IsDBNull(row("PDFFileName")), "", row("PDFFileName").Replace("_" + u.HeaderID.ToString(), ""))

                            If Convert.ToString(row("ImageFileName")) = "" Then
                                u.ImageFileName = ""
                            Else
                                u.ImageFileName = Convert.ToString(row("ImageFileName")).Replace("_" + u.HeaderID.ToString(), "")
                            End If
                            If Convert.ToString(row("PDFFileName")) = "" Then
                                u.PDFFileName = ""
                            Else
                                u.PDFFile = Convert.ToString(row("PDFFileName"))
                                u.PDFFileName = Convert.ToString(row("PDFFileName")).Replace("_" + u.HeaderID.ToString(), "")
                            End If
                            u.WH = Convert.ToString(row("WH"))

                            u.ItemNotTransfered = Convert.ToString(row("ItemNotTransfered"))

                            uList.Add(u)
                        Next
                        If ds.Tables(0).Rows.Count <= 0 Then
                            Me.TotalRows = 0
                            Me.TotalBoxes = 0
                            Me.TotalFBE = 0
                            Me.TotalAmount = 0
                            Me.TotalScanned = 0
                            Me.TotalMissing = 0
                            Me.TotalWeight = 0
                            Me.TotalDimensionalWeight = 0
                            Me.TotalMPF = 0
                            Me.TotalDuties = 0
                            Me.TotalScannedOrigin = 0
                            Me.TotalMissingAtOrigin = 0
                        Else
                            Me.TotalRows = ds.Tables(1).Rows(0)(0)
                            Me.TotalBoxes = ds.Tables(1).Rows(0)(1)
                            Me.TotalFBE = ds.Tables(1).Rows(0)(2)
                            Me.TotalAmount = ds.Tables(1).Rows(0)(3)
                            Me.TotalScanned = ds.Tables(1).Rows(0)(4)
                            Me.TotalMissing = ds.Tables(1).Rows(0)(5)
                            Me.TotalWeight = ds.Tables(1).Rows(0)(6)
                            Me.TotalDimensionalWeight = ds.Tables(1).Rows(0)(8)
                            Me.TotalMPF = ds.Tables(1).Rows(0)(9)
                            Me.TotalDuties = ds.Tables(1).Rows(0)(7)
                            Me.TotalScannedOrigin = ds.Tables(1).Rows(0)(10)
                            Me.TotalMissingAtOrigin = ds.Tables(1).Rows(0)(11)
                        End If
                        Dim af As New ManualPOHeader()
                        af.HeaderID = 0
                        af.Header = ""
                        af.CreatedUser = ""
                        af.CreatedUserID = ""
                        af.FarmCode = ""
                        af.FarmName = "Total"
                        af.FOB = ""
                        af.ShippedDate = DateTime.Now.ToString("yyyy/MM/dd")
                        af.Agency = ""
                        af.AWB = ""
                        af.Pieces = TotalBoxes
                        af.FBE = TotalFBE
                        af.TotalUnits = 0
                        af.TotalCost = TotalAmount
                        af.Airport = ""
                        af.PoDetails.Invoice = ""
                        af.IsXMLDownload = 0
                        af.PoDetails.Scanned = TotalScanned
                        af.PoDetails.Missing = TotalMissing
                        af.PoDetails.ScannedOrigin = TotalScannedOrigin
                        af.PoDetails.MissingAtOrigin = TotalMissingAtOrigin
                        af.Weight = TotalWeight
                        af.DimensionalWeight = TotalDimensionalWeight
                        af.MPF = TotalMPF
                        af.Duties = TotalDuties
                        af.TotalCredits = TotalCredits
                        af.TotalPendingPayment = TotalPendingPayment
                        af.TotalAmountToPay = TotalAmountToPay
                        uList.Add(af)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetIncomingPOHeader")
                Return Nothing
            End Try
        End Function

        Public Function GetIncomingPOHeaderPayable(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                      ByVal numberOfRows As Integer) As List(Of ManualPOHeader)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of ManualPOHeader)()
                ' Dim erlog As New BloomService

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetIncomingPOHeaderPayable]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New ManualPOHeader()
                            u.HeaderID = row("HeaderId")
                            u.Header = Convert.ToString(row("Header"))
                            u.CreatedUser = Convert.ToString(row("VendorName"))
                            u.CreatedUserID = row("CreatedUserId")
                            u.FarmCode = Convert.ToString(row("Farm"))
                            u.FarmName = Convert.ToString(row("FarmName"))
                            u.FOB = Convert.ToString(row("fob"))
                            u.ShippedDate = Convert.ToDateTime(row("shippeddate")).ToString("yyyy/MM/dd")
                            u.Agency = Convert.ToString(row("AgencyCode"))
                            u.AWB = IIf(row("AWB") Is DBNull.Value, "", row("AWB"))
                            u.Pieces = row("Pieces")
                            u.FBE = IIf(row("FBE") Is DBNull.Value, 0, row("FBE"))
                            u.TotalUnits = row("TotalUnits")
                            u.TotalCost = row("TotalCost")
                            u.FarmAmount = row("FarmAmount")
                            u.Airport = Convert.ToString(row("Airport"))
                            u.PoDetails.Invoice = IIf(row("Invoice") Is DBNull.Value, "0", Convert.ToString(row("Invoice"))) ' Convert.ToString(row("Invoice"))
                            u.Invoice = IIf(row("Invoice") Is DBNull.Value, "0", Convert.ToString(row("Invoice"))) 'Convert.ToString(row("Invoice"))
                            u.IsXMLDownload = IIf(row("IsXMLDownload") Is DBNull.Value, 0, row("IsXMLDownload"))
                            u.PoDetails.Scanned = Convert.ToString(row("Scanned"))
                            u.Scanned = Convert.ToString(row("Scanned"))
                            u.PoDetails.Missing = Convert.ToString(row("Missing"))
                            u.PoDetails.DifferentBoxes = Convert.ToString(row("DifferentBoxes"))
                            u.Weight = row("Weight")
                            u.DimensionalWeight = row("DimensionalWeight")
                            u.MPF = row("MPF")
                            u.Duties = row("Duties")
                            u.Credits = row("Credits")
                            u.AmountToPay = row("TotalCost") - row("Credits")
                            u.BuyerApproval = row("BuyerApproval")
                            u.DateApproved = Convert.ToDateTime(row("DateApproved")).ToString("yyyy/MM/dd")
                            u.Paid = row("Paid")
                            u.DatePayed = Convert.ToDateTime(row("DatePayed")).ToString("yyyy/MM/dd")
                            u.PendingPayment = row("PendingPayment")
                            u.QB = row("QB")
                            u.DateQB = Convert.ToDateTime(row("DateQB")).ToString("yyyy/MM/dd")
                            'u.ImageFileName = IIf(IsDBNull(row("ImageFileName")), "", row("ImageFileName").Replace("_" + u.HeaderID.ToString(), ""))
                            'u.PDFFileName = IIf(IsDBNull(row("PDFFileName")), "", row("PDFFileName").Replace("_" + u.HeaderID.ToString(), ""))

                            If Convert.ToString(row("ImageFileName")) = "" Then
                                u.ImageFileName = ""
                            Else
                                u.ImageFileName = Convert.ToString(row("ImageFileName")).Replace("_" + u.HeaderID.ToString(), "")
                            End If
                            If Convert.ToString(row("PDFFileName")) = "" Then
                                u.PDFFileName = ""
                            Else
                                u.PDFFile = Convert.ToString(row("PDFFileName"))
                                u.PDFFileName = Convert.ToString(row("PDFFileName")).Replace("_" + u.HeaderID.ToString(), "")
                            End If
                            u.WH = Convert.ToString(row("WH"))

                            uList.Add(u)
                        Next
                        If ds.Tables(0).Rows.Count <= 0 Then
                            Me.TotalRows = 0
                            Me.TotalBoxes = 0
                            Me.TotalFBE = 0
                            Me.TotalAmount = 0
                            Me.TotalScanned = 0
                            Me.TotalMissing = 0
                            Me.TotalWeight = 0
                            Me.TotalDimensionalWeight = 0
                            Me.TotalMPF = 0
                            Me.TotalDuties = 0
                            Me.TotalCredits = 0
                            Me.TotalAmountToPay = 0
                            Me.TotalPendingPayment = 0
                        Else
                            Me.TotalRows = ds.Tables(1).Rows(0)(0)
                            Me.TotalBoxes = ds.Tables(1).Rows(0)(1)
                            Me.TotalFBE = ds.Tables(1).Rows(0)(2)
                            Me.TotalAmount = ds.Tables(1).Rows(0)(3)
                            Me.TotalScanned = ds.Tables(1).Rows(0)(4)
                            Me.TotalMissing = ds.Tables(1).Rows(0)(5)
                            Me.TotalWeight = ds.Tables(1).Rows(0)(6)
                            Me.TotalDimensionalWeight = ds.Tables(1).Rows(0)(8)
                            Me.TotalMPF = ds.Tables(1).Rows(0)(9)
                            Me.TotalDuties = ds.Tables(1).Rows(0)(7)
                            Me.TotalCredits = ds.Tables(1).Rows(0)(10)
                            Me.TotalAmountToPay = ds.Tables(1).Rows(0)(11)
                            Me.TotalPendingPayment = ds.Tables(1).Rows(0)(12)
                        End If
                        Dim af As New ManualPOHeader()
                        af.HeaderID = 0
                        af.Header = ""
                        af.CreatedUser = ""
                        af.CreatedUserID = ""
                        af.FarmCode = ""
                        af.FarmName = "Total"
                        af.FOB = ""
                        af.ShippedDate = DateTime.Now.ToString("yyyy/MM/dd")
                        af.Agency = ""
                        af.AWB = ""
                        af.Pieces = TotalBoxes
                        af.FBE = TotalFBE
                        af.TotalUnits = 0
                        af.TotalCost = TotalAmount
                        af.Airport = ""
                        af.PoDetails.Invoice = ""
                        af.IsXMLDownload = 0
                        af.PoDetails.Scanned = TotalScanned
                        af.PoDetails.Missing = TotalMissing
                        af.Weight = TotalWeight
                        af.DimensionalWeight = TotalDimensionalWeight
                        af.MPF = TotalMPF
                        af.Duties = TotalDuties
                        af.Credits = TotalCredits
                        af.PendingPayment = TotalPendingPayment
                        af.AmountToPay = TotalAmountToPay
                        uList.Add(af)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetIncomingPOHeader")
                Return Nothing
            End Try
        End Function
    End Class

    Public Shared Function UpdateScannedMissingBoxesbyAWB(ByVal AWB As String, ByVal BarCodes As String, ByVal HeaderID As Integer, ByVal UserID As Integer, BarCodeWithSeq As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spUpdateScannedMissingBoxesbyAWB", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@AWB", AWB)
                    cmd.Parameters.AddWithValue("@BarCodes", BarCodes)
                    cmd.Parameters.AddWithValue("@HeaderID", HeaderID)
                    cmd.Parameters.AddWithValue("@UserID", UserID)
                    cmd.Parameters.AddWithValue("@BarCodeWithSeq", BarCodeWithSeq)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateScannedMissingBoxesbyAWB")
            Return "error"
        End Try
    End Function


    Public Shared Function GetAWBNumbersForInComing() As List(Of ManualPOHeader)
        Try
            Dim uList As New List(Of ManualPOHeader)
            Dim obj As New BloomService
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select distinct awb from tblpoheader where awb <>''", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New ManualPOHeader
                        u.AWB = obj.FormatAWBnumber(row("AWB"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetAWBNumbersForInComing")
            Return Nothing
        End Try
    End Function
End Class


Public Class TaskStatus
    Private _Start As Boolean
    Public Property Start() As Boolean
        Get
            Return _Start
        End Get
        Set(value As Boolean)
            _Start = value
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
End Class

Public Class NewManualPO
    Private _Farm As String
    Public Property Farm() As String
        Get
            Return _Farm
        End Get
        Set(value As String)
            _Farm = value
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
    Private _Quantity As String
    Public Property Quantity() As String
        Get
            Return _Quantity
        End Get
        Set(value As String)
            _Quantity = value
        End Set
    End Property
    Private _UOM As String
    Public Property UOM() As String
        Get
            Return _UOM
        End Get
        Set(value As String)
            _UOM = value
        End Set
    End Property
    Private _Units As String
    Public Property Units() As String
        Get
            Return _Units
        End Get
        Set(value As String)
            _Units = value
        End Set
    End Property
    Private _UnitsPerBunch As String
    Public Property UnitsPerBunch() As String
        Get
            Return _UnitsPerBunch
        End Get
        Set(value As String)
            _UnitsPerBunch = value
        End Set
    End Property
    Private _CostPerUnits As String
    Public Property CostPerUnits() As String
        Get
            Return _CostPerUnits
        End Get
        Set(value As String)
            _CostPerUnits = value
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

    Private _FlowerCategory As String
    Public Property FlowerCategory() As String
        Get
            Return _FlowerCategory
        End Get
        Set(value As String)
            _FlowerCategory = value
        End Set
    End Property

    Private _ShipDate As String
    Public Property ShipDate() As String
        Get
            Return _ShipDate
        End Get
        Set(value As String)
            _ShipDate = value
        End Set
    End Property
    Private _BoxNum As String
    Public Property BoxNum() As String
        Get
            Return _BoxNum
        End Get
        Set(value As String)
            _BoxNum = value
        End Set
    End Property
    Private _PONumber As String
    Public Property PONumber() As String
        Get
            Return _PONumber
        End Get
        Set(value As String)
            _PONumber = value
        End Set
    End Property
    Private _Breakdown As String
    Public Property Breakdown() As String
        Get
            Return _Breakdown
        End Get
        Set(value As String)
            _Breakdown = value
        End Set
    End Property
    Private _Cust As String
    Public Property Cust() As String
        Get
            Return _Cust
        End Get
        Set(value As String)
            _Cust = value
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
    Private _AWB As String
    Public Property AWB() As String
        Get
            Return _AWB
        End Get
        Set(value As String)
            _AWB = value
        End Set
    End Property
    Private _Hawb As String
    Public Property Hawb() As String
        Get
            Return _Hawb
        End Get
        Set(value As String)
            _Hawb = value
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
    Private _FOB As String
    Public Property FOB() As String
        Get
            Return _FOB
        End Get
        Set(value As String)
            _FOB = value
        End Set
    End Property
    Private _ErrorMessage As String
    Public Property ErrorMessage() As String
        Get
            Return _ErrorMessage
        End Get
        Set(value As String)
            _ErrorMessage = value
        End Set
    End Property

End Class