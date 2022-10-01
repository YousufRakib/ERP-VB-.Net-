Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Xml

Public Class ManualPOHeaders
    Public Class GetPOHeader
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetManualPOHeader(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of ManualPOHeader)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of ManualPOHeader)()
                'Dim erlog As New BloomService

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetManualPOHeader]", con)
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
                            'erlog.AppendLog("Headerid" + row("HeaderId").ToString(), "")

                            u.Header = Convert.ToString(row("Header"))
                            'erlog.AppendLog("Header" + row("Header"), "")

                            u.CreatedUser = Convert.ToString(row("VendorName"))
                            ' erlog.AppendLog("VendorName" + row("VendorName"), "")

                            u.CreatedUserID = row("CreatedUserId")

                            u.FarmCode = row("Farm")
                            ' erlog.AppendLog("Farm" + row("Farm"), "")

                            u.FOB = Convert.ToString(row("fob"))
                            'erlog.AppendLog("fob" + Convert.ToString(row("fob")), "")

                            u.ShippedDate = Convert.ToDateTime(row("shippeddate")).ToString("yyyy-MM-dd")
                            ' erlog.AppendLog("shippeddate" + Convert.ToDateTime(row("shippeddate")).ToString("yyyy-MM-dd"), "")

                            u.Agency = Convert.ToString(row("AgencyCode"))
                            'erlog.AppendLog("AgencyCode" + Convert.ToString(row("AgencyCode")), "")

                            u.AWB = IIf(row("AWB") Is DBNull.Value, "", row("AWB"))
                            'erlog.AppendLog("AWB" + IIf(row("AWB") Is DBNull.Value, "", row("AWB")), "")

                            u.Pieces = row("Pieces")
                            'erlog.AppendLog("Pieces" + row("Pieces").ToString(), "")

                            u.FBE = row("FBE")
                            'erlog.AppendLog("FBE" + row("FBE").ToString(), "")

                            u.TotalUnits = row("TotalUnits")
                            'erlog.AppendLog("TotalUnits" + row("TotalUnits").ToString(), "")
                            u.TotalCost = row("TotalCost")
                            u.Airport = Convert.ToString(row("Airport"))
                            u.PoDetails.Invoice = Convert.ToString(ManualPODetails.GetInvoiceByHeaderID(row("HeaderId")))
                            u.IsXMLDownload = IIf(row("IsXMLDownload") Is DBNull.Value, 0, row("IsXMLDownload"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                'Dim erlog As New BloomService
                'erlog.AppendLog("Error" + ex.Message.ToString(), "")
                ErrorLogs.LogException(ex, "Error in GetManualPOHeader")
                Return Nothing
            End Try
        End Function
    End Class

    ''' <summary>
    ''' STA::31-JUL-2015::to get the POHeader by ID
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetPOHeaderById(ByVal ID As String) As ManualPOHeader
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblPOHeader where HeaderId=@Id", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@Id", ID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows

                        uList.HeaderID = row("HeaderId")
                        uList.Header = Convert.ToString(row("Header"))
                        uList.CreatedUserID = row("CreatedUserId")
                        uList.FarmName = row("FarmName")
                        uList.FarmCode = row("farm")
                        uList.Agency = Convert.ToString(row("AgencyCode"))
                        uList.FBE = IIf(row("FBE") Is DBNull.Value, 0, row("FBE"))
                        uList.AWB = Convert.ToString(IIf(row("AWB") Is DBNull.Value, 0, row("AWB")))
                        uList.Pieces = IIf(row("Pieces") Is DBNull.Value, 0, row("Pieces"))
                        uList.ShippedDate = Convert.ToDateTime(row("shippeddate")).ToString("yyyy-MM-dd")
                        uList.Airport = Convert.ToString(row("AirPort"))
                        uList.Weight = row("Weight")
                        uList.DimensionalWeight = row("DimensionalWeight")
                        uList.MPF = row("MPF")
                        uList.Duties = row("Duties")
                        'uList.ShippedDate = DateTime.Parse(row("shippeddate")).ToString("MM/dd/yyyy")
                    Next
                End Using

            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPOHeaderById")
            Return Nothing
        End Try

    End Function

    Public Shared Function GetAllPOHeader(ByVal WhereCondition As String) As List(Of ManualPOHeader)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of ManualPOHeader)

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim Qry As String = ""
                If (WhereCondition <> "") Then
                    Qry = "select * from tblPOHeader where " + WhereCondition
                Else
                    Qry = "select * from tblPOHeader"
                End If
                Using cmd As New SqlCommand(Qry, con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New ManualPOHeader()
                        u.HeaderID = row("HeaderId")
                        u.Header = Convert.ToString(row("Header"))
                        u.CreatedUserID = row("CreatedUserId")
                        u.FarmName = row("FarmName")
                        u.FarmCode = row("farm")
                        u.Agency = Convert.ToString(row("AgencyCode"))
                        u.FBE = IIf(row("FBE") Is DBNull.Value, 0, row("FBE"))
                        u.AWB = Convert.ToString(row("AWB"))
                        u.Pieces = IIf(row("Pieces") Is DBNull.Value, 0, row("Pieces"))
                        u.ShippedDate = Convert.ToDateTime(row("shippeddate")).ToString("yyyy-MM-dd")
                        u.Airport = Convert.ToString(row("AirPort"))
                        uList.Add(u)
                    Next
                End Using

            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAllPOHeader")
            Return Nothing
        End Try

    End Function

    Public Shared Function UpdateXMLDownloadStatus(ByVal SelectedHeaderIDs As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("update tblPOheader set IsXMLDownload=1,DownloadDateTime=getdate() where HeaderId in (select s from CSV2Table(@SelectedHeaderIDs)) option (maxrecursion 0) ", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@SelectedHeaderIDs", SelectedHeaderIDs)
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                Logs.Savelog(loginuserdetails.ID, "Incoming", "UpdateXMLDownloadStatus", "Download XML from Incoming", SelectedHeaderIDs)
            End If

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateXMLDownloadStatus")
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function GenerateXMLFileforPOHeader(ByVal SelectedHeaderIDs As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader
            Dim POHeaderXML As String = ""
            Dim xml As String = ""
            Dim AWB As String = ""

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select HeaderID,AWB,Farm,ID=stuff((select ', '+cast(ID as varchar(10)) from tblpodetails b where b.HeaderId= a.HeaderId and b.awb=a.awb " +
                                            "for XML path('')),1,2,'') from tblPODetails a where a.HeaderID in (select s from CSV2Table(@SelectedHeaderIDs)) " +
                                            "group by HeaderId,AWB,Farm order by Farm asc option (maxrecursion 0)", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@SelectedHeaderIDs", SelectedHeaderIDs))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        POHeaderXML += CreatePODetailsXMLFileforHeader(row("ID"))
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
            ErrorLogs.LogException(ex, "Error In GenerateXMLFileforPOHeader")
            Return Nothing
        End Try
    End Function

    Public Shared Function CreatePODetailsXMLFileforHeader(ByVal DetailsIDs As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim xml As String = ""
            Dim AWB As String = ""
            Dim FileAWB As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using AWBCmd As New SqlCommand("Select Distinct(AWB) from tblPODetails where id In (Select s from CSV2Table(@DetailsID))Option (maxrecursion 0)", con)
                    AWBCmd.CommandType = CommandType.Text
                    AWBCmd.Parameters.AddWithValue("@DetailsID", DetailsIDs)
                    Dim AWBda As New SqlDataAdapter(AWBCmd)
                    Dim AWBds As New DataTable
                    AWBda.Fill(AWBds)
                    For Each AWBrow In AWBds.Rows
                        AWB = Convert.ToString(AWBrow("AWB"))
                        If (AWB <> "" And AWB <> Nothing) Then
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
                        End If
                    Next
                End Using
            End Using
            Return xml

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CreatePODetailsXMLFileforHeader")
            Return "error"
        End Try
    End Function



    ''' <summary>
    ''' STA::31-JUL-2015::To save/Update the POHeader
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <param name="Header"></param>
    ''' <param name="CreatedUserId"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function SavePOHeader(ByVal ID As String, ByVal Header As String, ByVal CreatedUserId As String,
        ByVal Farm As String, ByVal FarmName As String, ByVal ManufacId As String, ByVal Fob As String,
        ByVal DetailsList As String, ByVal HeaderDate As String, ByVal Agency As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""

                Using cmd As New SqlCommand("spSaveManualPOHeader", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Id", ID))
                    cmd.Parameters.Add(New SqlParameter("@Header", Header))
                    cmd.Parameters.Add(New SqlParameter("@CreatedUserId", CreatedUserId))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.Parameters.Add(New SqlParameter("@FarmName", FarmName))
                    cmd.Parameters.Add(New SqlParameter("@ManuFacId", ManufacId))
                    cmd.Parameters.Add(New SqlParameter("@Fob", Fob))
                    cmd.Parameters.Add(New SqlParameter("@DetailsList", DetailsList))
                    cmd.Parameters.Add(New SqlParameter("@HeaderDate", HeaderDate))
                    cmd.Parameters.Add(New SqlParameter("@Agency", Agency))
                    Dim result As Integer = cmd.ExecuteScalar()
                    'For Update log
                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        If ID = 0 Then
                            Logs.Savelog(loginuserdetails.ID, "Users", "SavePOHeader", "Add New Users - " + Farm + " [" + Header + "]", result)
                        Else
                            Logs.Savelog(loginuserdetails.ID, "Users", "SavePOHeader", "Modified Users - " + Farm + " [" + Header + "]", result)
                        End If
                    End If

                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SavePOHeader")
            Return "error"
        End Try

    End Function

    ''' <summary>
    ''' STA::31-JUL-2015::To delete the POHeader Details
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeletePOHeader(ByVal ID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Dim header As ManualPOHeader
            header = GetPOHeaderById(ID)

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spDeleteManualPOHeaderDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@HeaderId", ID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            'For Update log
            Dim loginuserdetails As New User

            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")

                Logs.Savelog(loginuserdetails.ID, "Users", "DeletePOHeader", "Delete Users - " + header.FarmCode + " [" + header.Header + "]", ID.ToString())
            End If

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeletePOHeader")
            Return "error"
        End Try
    End Function

    Public Shared Function GetVendorListByID() As List(Of User)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of User)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblUsers where UserTypeID=3", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New User
                        u.ID = row("ID")
                        u.Name = row("Name")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetVendorListByID")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' STA::31-OCT-2015::to add/Update the header filename
    ''' </summary>
    ''' <param name="HeaderId"></param>
    ''' <param name="HeaderFileName"></param>
    ''' <param name="fileType"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function SaveHeaderFiles(ByVal HeaderId As String, ByVal HeaderFileName As String, fileType As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString


            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spSaveManualPOHeaderFiles", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@HeaderId", HeaderId))
                    cmd.Parameters.Add(New SqlParameter("@Filename", HeaderFileName))
                    cmd.Parameters.Add(New SqlParameter("@FileType", fileType.ToLower()))
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            'For Update log
            Dim loginuserdetails As New User

            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")

                Logs.Savelog(loginuserdetails.ID, "ManualPo", "SaveHeaderFiles", "Header file Uploaded " + HeaderFileName, HeaderId)
            End If

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveHeaderFiles")
            Return "error"
        End Try
    End Function

    Public Shared Function GetHeaderFiles(ByVal HeaderID As String) As ManualPOHeader
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblPOHeader where HeaderId=@HeaderID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@HeaderID", HeaderID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        If Convert.ToString(row("ImageFileName")) = "" Then
                            uList.ImageFileName = ""
                        Else
                            uList.ImageFileName = Convert.ToString(row("ImageFileName")).Replace("_" + HeaderID.ToString(), "")
                        End If
                        If Convert.ToString(row("PDFFileName")) = "" Then
                            uList.PDFFileName = ""
                        Else
                            uList.PDFFileName = Convert.ToString(row("PDFFileName")).Replace("_" + HeaderID.ToString(), "")
                        End If
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetHeaderFiles")
            Return Nothing
        End Try
    End Function
End Class

Public Class ManualPOHeader
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

    Private _CreatedUserID As String
    Public Property CreatedUserID() As String
        Get
            Return _CreatedUserID
        End Get
        Set(ByVal value As String)
            _CreatedUserID = value
        End Set
    End Property


    Private _CreatedUser As String
    Public Property CreatedUser() As String
        Get
            Return _CreatedUser
        End Get
        Set(ByVal value As String)
            _CreatedUser = value
        End Set
    End Property

    Private _FarmCode As String
    Public Property FarmCode() As String
        Get
            Return _FarmCode
        End Get
        Set(ByVal value As String)
            _FarmCode = value
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


    Private _FOB As String
    Public Property FOB() As String
        Get
            Return _FOB
        End Get
        Set(ByVal value As String)
            _FOB = value
        End Set
    End Property

    Private _Agency As String
    Public Property Agency() As String
        Get
            Return _Agency
        End Get
        Set(ByVal value As String)
            _Agency = value
        End Set
    End Property

    Private _Pieces As Integer
    Public Property Pieces() As Decimal
        Get
            Return _Pieces
        End Get
        Set(ByVal value As Decimal)
            _Pieces = value
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

    Private _FBE As Decimal
    Public Property FBE() As Decimal
        Get
            Return _FBE
        End Get
        Set(ByVal value As Decimal)
            _FBE = value
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

    Private _ShippedDate As DateTime
    Public Property ShippedDate() As DateTime
        Get
            Return _ShippedDate
        End Get
        Set(ByVal value As DateTime)
            _ShippedDate = value
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

    Private _FarmAmount As Decimal
    Public Property FarmAmount() As Decimal
        Get
            Return _FarmAmount
        End Get
        Set(value As Decimal)
            _FarmAmount = value
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


    Private _Airport As String
    Public Property Airport() As String
        Get
            Return _Airport
        End Get
        Set(value As String)
            _Airport = value
        End Set
    End Property

    Private _PoDetails As New ManualPODetail
    Public Property PoDetails() As ManualPODetail
        Get
            Return _PoDetails
        End Get
        Set(value As ManualPODetail)
            _PoDetails = value
        End Set
    End Property

    Private _IsXMLDownload As Boolean
    Public Property IsXMLDownload() As Boolean
        Get
            Return _IsXMLDownload
        End Get
        Set(ByVal value As Boolean)
            _IsXMLDownload = value
        End Set
    End Property

    Private _POSelected As Boolean
    Public Property POSelected() As Boolean
        Get
            Return _POSelected
        End Get
        Set(ByVal value As Boolean)
            _POSelected = value
        End Set
    End Property

    Private _Weight As Decimal
    Public Property Weight() As Decimal
        Get
            Return _Weight
        End Get
        Set(ByVal value As Decimal)
            _Weight = value
        End Set
    End Property

    Private _DimensionalWeight As Decimal
    Public Property DimensionalWeight() As Decimal
        Get
            Return _DimensionalWeight
        End Get
        Set(ByVal value As Decimal)
            _DimensionalWeight = value
        End Set
    End Property

    Private _MPF As Decimal
    Public Property MPF() As Decimal
        Get
            Return _MPF
        End Get
        Set(ByVal value As Decimal)
            _MPF = value
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

    Private _ImageFileName As String
    Public Property ImageFileName() As String
        Get
            Return _ImageFileName
        End Get
        Set(ByVal value As String)
            _ImageFileName = value
        End Set
    End Property

    Private _PDFFileName As String
    Public Property PDFFileName() As String
        Get
            Return _PDFFileName
        End Get
        Set(ByVal value As String)
            _PDFFileName = value
        End Set
    End Property

    Private _PDFFile As String
    Public Property PDFFile() As String
        Get
            Return _PDFFile
        End Get
        Set(ByVal value As String)
            _PDFFile = value
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

    Private _Scanned As Integer
    Public Property Scanned() As Integer
        Get
            Return _Scanned
        End Get
        Set(ByVal value As Integer)
            _Scanned = value
        End Set
    End Property

    Private _Missing As Integer
    Public Property Missing() As Integer
        Get
            Return _Missing
        End Get
        Set(ByVal value As Integer)
            _Missing = value
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

    Private _Credits As Decimal
    Public Property Credits() As Decimal
        Get
            Return _Credits
        End Get
        Set(value As Decimal)
            _Credits = value
        End Set
    End Property

    Private _AmountToPay As Decimal
    Public Property AmountToPay() As Decimal
        Get
            Return _AmountToPay
        End Get
        Set(value As Decimal)
            _AmountToPay = value
        End Set
    End Property

    Private _BuyerApproval As Boolean
    Public Property BuyerApproval() As Boolean
        Get
            Return _BuyerApproval
        End Get
        Set(value As Boolean)
            _BuyerApproval = value
        End Set
    End Property

    Private _DateApproved As DateTime
    Public Property DateApproved() As DateTime
        Get
            Return _DateApproved
        End Get
        Set(ByVal value As DateTime)
            _DateApproved = value
        End Set
    End Property

    Private _Paid As Boolean
    Public Property Paid() As Boolean
        Get
            Return _Paid
        End Get
        Set(value As Boolean)
            _Paid = value
        End Set
    End Property

    Private _DatePayed As DateTime
    Public Property DatePayed() As DateTime
        Get
            Return _DatePayed
        End Get
        Set(ByVal value As DateTime)
            _DatePayed = value
        End Set
    End Property


    Private _PendingPayment As Decimal
    Public Property PendingPayment() As Decimal
        Get
            Return _PendingPayment
        End Get
        Set(ByVal value As Decimal)
            _PendingPayment = value
        End Set
    End Property

    Private _QB As Boolean
    Public Property QB() As Boolean
        Get
            Return _QB
        End Get
        Set(value As Boolean)
            _QB = value
        End Set
    End Property

    Private _DateQB As DateTime
    Public Property DateQB() As DateTime
        Get
            Return _DateQB
        End Get
        Set(ByVal value As DateTime)
            _DateQB = value
        End Set
    End Property

    Private _ItemNotTransfered As Integer
    Public Property ItemNotTransfered() As String
        Get
            Return _ItemNotTransfered
        End Get
        Set(value As String)
            _ItemNotTransfered = value
        End Set
    End Property

End Class

Public Class XMLDetails
    Private _XMLFileName As String
    Public Property XMLFileName() As String
        Get
            Return _XMLFileName
        End Get
        Set(value As String)
            _XMLFileName = value
        End Set
    End Property

    Private _XMLFileContent As String
    Public Property XMLFileContent() As String
        Get
            Return _XMLFileContent
        End Get
        Set(value As String)
            _XMLFileContent = value
        End Set
    End Property

End Class