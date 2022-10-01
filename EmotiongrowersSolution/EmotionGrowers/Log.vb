Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Exception
Imports Mailjet.Client
Imports Mailjet.Client.Resources
Imports System
Imports Newtonsoft.Json.Linq
Imports System.Threading.Tasks

Public Class Logs

    Public Shared Function Savelog(ByVal ModifiedBy As String, ByVal ModifiedPage As String, ByVal ModifiedIn As String, ByVal Action As String, ByVal ModifiedRecord As String) As String

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim UserScopeID As String = ""
            Dim Cmd As New SqlCommand("insert into tbllog(ModifiedBy,ModifiedPage,ModifiedIn,Action,ModifiedDateTime,ModifiedRecord,UserName)values(@ModifiedBy,@ModifiedPage,@ModifiedIn,@Action,@ModifiedDateTime,@ModifiedRecord,@UserName)", SqlCon)
            Cmd.CommandType = CommandType.Text
            Cmd.Parameters.AddWithValue("@ModifiedBy", ModifiedBy)
            Cmd.Parameters.AddWithValue("@ModifiedPage", ModifiedPage)
            Cmd.Parameters.AddWithValue("@Action", Action)
            Cmd.Parameters.AddWithValue("@ModifiedIn", ModifiedIn)
            Cmd.Parameters.AddWithValue("@ModifiedDateTime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
            Cmd.Parameters.AddWithValue("@ModifiedRecord", ModifiedRecord)

            Dim LoggedInUserDetails As New User
            If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                LoggedInUserDetails = System.Web.HttpContext.Current.Session("LoginUserDetails")
            ElseIf Not System.Web.HttpContext.Current.Session("LoginAdminDetails") Is Nothing Then
                LoggedInUserDetails = System.Web.HttpContext.Current.Session("LoginAdminDetails")
            End If

            If Not LoggedInUserDetails Is Nothing Then
                Cmd.Parameters.AddWithValue("@UserName", LoggedInUserDetails.Name)
            Else
                Cmd.Parameters.AddWithValue("@UserName", "")
            End If

            Cmd.ExecuteNonQuery()
            Cmd.Dispose()
            SqlCon.Close()
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Savelog")
            Return ex.Message
        End Try
    End Function

    Public Shared Function GetAllLogs() As List(Of Log)

        Dim uList As New List(Of Log)()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwlog", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Log()
                        u.ID = row("ID")
                        u.ModifiedByName = row("ModifiedByName")
                        u.ModifiedDateTime = row("ModifiedDateTime")
                        u.Action = IIf(row("Action") Is DBNull.Value, "", row("Action"))
                        u.ModifiedPage = row("ModifiedPage")
                        uList.Add(u)
                    Next
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAllLogs")
            Return Nothing
        End Try
        Return uList
    End Function

    Public Shared Function DeleteSelectedLogs(ByVal SelectedLogs As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim SqlCmd As New SqlCommand("Delete From tbllog where ID in (" + SelectedLogs + ")", SqlCon)
            SqlCmd.CommandType = CommandType.Text
            SqlCmd.ExecuteNonQuery()
            Return "Valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteSelectedLogs")
            Return Nothing
        End Try
    End Function


    Public Shared Function VendorEmailLogs(User As User, Body As String, AttachmentFilePath As String, Subject As String, ByVal type As String) As String
        Try
            Dim ToEmails As String = ""
            Dim FromEmail As String = User.Email
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SentToLoggedUser As String = ConfigurationManager.AppSettings("SentToLoggedUser").ToString()
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim qry As String = ""
            If (type.ToLower() = "error") Then
                qry = "select * from tblSysEmail where Errors=@LoginId"
                Subject = Subject + " From " + ConfigurationManager.AppSettings("CompanyName").ToString()
            ElseIf (type = "labelnotification") Then
                qry = "select * from tblSysEmail where LabelNotification=@LoginId"
            ElseIf (type = "shippinglabelnotification") Then
                qry = "select * from tblSysEmail where ShippingLabelNotification=@LoginId"
            Else
                qry = "select * from tblSysEmail where WebLogin=@LoginId"
            End If
            Using SqlCmd As New SqlCommand(qry, SqlCon)
                SqlCmd.Parameters.AddWithValue("@LoginId", "1")
                Dim da As New SqlDataAdapter(SqlCmd)
                Dim dt As New DataTable
                Dim ds As New DataSet
                da.Fill(ds)
                Dim i As Integer = 0
                For Each row In ds.Tables(0).Rows
                    If i = 0 Then
                        ToEmails = row("Email")
                    Else
                        ToEmails = ToEmails + "," + row("Email")
                    End If
                    i = i + 1
                Next
            End Using

            If type = "labelnotification" Or type = "shippinglabelnotification" Then
                Dim CurrentPage As String = HttpContext.Current.Request.UrlReferrer.Query.Split("=")(1)
                If CurrentPage.ToLower.Contains("grower") Then
                    If ToEmails = "" Then
                        ToEmails = User.Email
                    Else
                        ToEmails += "," + User.Email
                    End If

                End If

                If CurrentPage.ToLower.Contains("order") Then
                    If SentToLoggedUser = "1" Then
                        If ToEmails = "" Then
                            ToEmails = User.Email
                        Else
                            ToEmails += "," + User.Email
                        End If
                    End If
                End If
            End If

            If ToEmails.Trim() <> "" Then
                Dim VendorFileFolderName As String = ConfigurationManager.AppSettings("VendorEmailsFolder")
                'Dim LogPath As String = System.Web.HttpContext.Current.Server.MapPath("~/" + VendorFileFolderName + "/")
                Dim LogPath As String = VendorFileFolderName + "\\"

                If Not Directory.Exists(LogPath) Then
                    Directory.CreateDirectory(LogPath)
                End If

                Dim VendorFromEmail As String = ConfigurationManager.AppSettings("VendorFromEmails")

                Dim filename As String = GetGlobalNameForEmailFile(FromEmail)
                Dim filepath As String = LogPath & filename

                If type.ToLower() = "error" Then
                    Body = Body + "Logged in User Details" + "###" +
                                            "UserName :" + FromEmail + "###" +
                                            "Name :" + User.Name + "###" +
                                            "IP :" + BloomService.LocalIPAddress
                End If

                If String.IsNullOrEmpty(FromEmail) Then
                    FromEmail = VendorFromEmail
                End If

                'Await Logs.SendMail(FromEmail, ToEmails, Body, AttachmentFilePath, Subject)
                Dim EmailBody() As String = Nothing
                If File.Exists(filepath) Then
                    Using writer As New StreamWriter(filepath, True)
                        writer.WriteLine(ToEmails)
                        writer.WriteLine(Subject)
                        writer.WriteLine(VendorFromEmail)
                        writer.WriteLine(AttachmentFilePath)
                        If (type.ToLower() <> "error") Then
                            writer.WriteLine(Body)
                        Else
                            EmailBody = Body.Split("###")
                            For b As Integer = 0 To EmailBody.Length - 1
                                If (Convert.ToString(EmailBody(b)) <> "") Then
                                    writer.WriteLine(EmailBody(b).ToString())
                                End If
                            Next
                        End If
                    End Using
                Else
                    Dim writer As StreamWriter = File.CreateText(filepath)
                    writer.WriteLine(ToEmails.Replace(vbCr, "").Replace(vbLf, ""))
                    writer.WriteLine(Subject.Replace(vbCr, "").Replace(vbLf, ""))
                    writer.WriteLine(VendorFromEmail)
                    writer.WriteLine(AttachmentFilePath)
                    'End If
                    If (type.ToLower() <> "error") Then
                        writer.WriteLine(Body)
                    Else
                        EmailBody = Body.Split("###")
                        For b As Integer = 0 To EmailBody.Length - 1
                            If (Convert.ToString(EmailBody(b)) <> "") Then
                                writer.WriteLine(EmailBody(b).ToString())
                            End If
                        Next
                    End If
                    writer.Close()
                End If
                RenameEmailFile(filepath, filename)

            End If

            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in VendorEmailLogs")
            Return "error"
        End Try
    End Function

    Public Shared Function SendErrorEmail(User As User, Body As String, AttachmentFilePath As String, Subject As String, ByVal type As String) As String
        Try
            Dim ToEmails As String = ""
            Dim FromEmail As String = User.Email
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim qry As String = ""
            qry = "select * from tblSysEmail where Errors=@LoginId"
            Subject = Subject + " From " + ConfigurationManager.AppSettings("CompanyName").ToString()
            Using SqlCmd As New SqlCommand(qry, SqlCon)
                SqlCmd.Parameters.AddWithValue("@LoginId", "1")
                Dim da As New SqlDataAdapter(SqlCmd)
                Dim dt As New DataTable
                Dim ds As New DataSet
                da.Fill(ds)
                Dim i As Integer = 0
                For Each row In ds.Tables(0).Rows
                    If i = 0 Then
                        ToEmails = row("Email")
                    Else
                        ToEmails = ToEmails + "," + row("Email")
                    End If
                    i = i + 1
                Next
            End Using


            If ToEmails.Trim() <> "" Then
                Dim VendorFileFolderName As String = ConfigurationManager.AppSettings("VendorEmailsFolder")
                Dim LogPath As String = VendorFileFolderName + "\\"

                If Not Directory.Exists(LogPath) Then
                    Directory.CreateDirectory(LogPath)
                End If

                Dim VendorFromEmail As String = ConfigurationManager.AppSettings("VendorFromEmails")

                Dim filename As String = GetGlobalNameForEmailFile(FromEmail)
                Dim filepath As String = LogPath & filename

                If type.ToLower() = "error" Then
                    Body = Body + "Logged in User Details" + "###" +
                                            "UserName :" + FromEmail + "###" +
                                            "Name :" + User.Name + "###" +
                                            "IP :" + BloomService.LocalIPAddress
                End If

                If String.IsNullOrEmpty(FromEmail) Then
                    FromEmail = VendorFromEmail
                End If

                Dim EmailBody() As String = Nothing
                If File.Exists(filepath) Then
                    Using writer As New StreamWriter(filepath, True)
                        writer.WriteLine(ToEmails)
                        writer.WriteLine(Subject)
                        writer.WriteLine(VendorFromEmail)
                        writer.WriteLine(AttachmentFilePath)
                        If (type.ToLower() <> "error") Then
                            writer.WriteLine(Body)
                        Else
                            EmailBody = Body.Split("###")
                            For b As Integer = 0 To EmailBody.Length - 1
                                If (Convert.ToString(EmailBody(b)) <> "") Then
                                    writer.WriteLine(EmailBody(b).ToString())
                                End If
                            Next
                        End If

                    End Using
                Else
                    Dim writer As StreamWriter = File.CreateText(filepath)
                    writer.WriteLine(ToEmails.Replace(vbCr, "").Replace(vbLf, ""))
                    writer.WriteLine(Subject.Replace(vbCr, "").Replace(vbLf, ""))
                    writer.WriteLine(VendorFromEmail)
                    writer.WriteLine(AttachmentFilePath)
                    'End If
                    If (type.ToLower() <> "error") Then
                        writer.WriteLine(Body)
                    Else
                        EmailBody = Body.Split("###")
                        For b As Integer = 0 To EmailBody.Length - 1
                            If (Convert.ToString(EmailBody(b)) <> "") Then
                                writer.WriteLine(EmailBody(b).ToString())
                            End If
                        Next
                    End If
                    writer.Close()
                End If
                RenameEmailFile(filepath, filename)

            End If

            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in VendorEmailLogs")
            Return "error"
        End Try
    End Function

    Public Shared Function SendEmail(FromEmail As String, ToEmails As String, Body As String, AttachmentFilepath As String, Subject As String, Optional ByVal CreditReportEmail As String = "", Optional ByVal RptName As String = "") As String
        Try
            Dim VendorFileFolderName As String = ConfigurationManager.AppSettings("VendorEmailsFolder")

            Dim LogPath As String = VendorFileFolderName + "\\"

            If Not Directory.Exists(LogPath) Then
                Directory.CreateDirectory(LogPath)
            End If
            Dim VendorFromEmail As String = ""
            VendorFromEmail = ConfigurationManager.AppSettings("VendorFromEmails")
            If FromEmail Is Nothing Or FromEmail = "" Then
                FromEmail = VendorFromEmail
            End If
            If ToEmails <> "" Then
                Dim filename As String = GetGlobalNameForEmailFile(VendorFromEmail)
                Dim filepath As String = LogPath & filename

                Dim writer As StreamWriter = File.CreateText(filepath)
                writer.WriteLine(ToEmails.Replace(vbCr, "").Replace(vbLf, ""))

                writer.WriteLine(Subject.Replace(vbCr, "").Replace(vbLf, ""))
                writer.WriteLine(FromEmail)
                If (AttachmentFilepath <> "") Then
                    writer.WriteLine(AttachmentFilepath)
                Else
                    writer.WriteLine("")
                End If
                writer.WriteLine(Body)
                writer.Close()
                RenameEmailFile(filepath, filename)
            End If
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ManualPOEmailLogs")
            Return "Error"
        End Try
    End Function

    Public Shared Async Function SendMail(FromEmail As String, ToEmails As String, Body As String, AttachmentFilepath As String, Subject As String, Optional ByVal DocumentType As String = "", Optional ByVal DocumentNum As String = "", Optional ByVal Recipient As String = "") As Task(Of String)
        Try
            Dim FullFileName As String = ""


            If FromEmail = "" Or ToEmails = "" Or Subject = "" Then
                Return "Error... From Email or To email is empty"
            Else

                ToEmails = ToEmails.Replace(vbCrLf, "").Replace(vbLf, "").Replace(vbCr, "").Replace(" ", "").Replace(";", ",")

                If AttachmentFilepath <> "" Then
                    Dim VendorFileFolderName As String = ConfigurationManager.AppSettings("VendorEmailsFolder")
                    Dim LogPath As String = VendorFileFolderName
                    ' no need to check if folder exists when no attachment is being sent
                    If Not Directory.Exists(LogPath) Then
                        Directory.CreateDirectory(LogPath)
                    End If

                    FullFileName = LogPath & AttachmentFilepath
                End If

                Return Await SendMailRunAsync(FromEmail, ToEmails, Body, FullFileName, Subject, DocumentType, DocumentNum, Recipient)  '//Calling the Async Sending mail funciton 

            End If


        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ManualPOEmailLogs")
            Return "Error"
        End Try
    End Function
    ' Added by Belal on 03 Sept 2020 :: For Sending email through MailJet API
    Private Shared Async Function SendMailRunAsync(FromEmail As String, ToEmails As String, Body As String, AttachmentFilepath As String, Subject As String, ByVal DocumentType As String, ByVal DocumentNum As String, ByVal Recipient As String) As Task(Of String)
        If Body = "" Then
            Body = " "
        End If
        Dim emailReturnMessage As String = ""
        Dim allToEmails As Object = ToEmails.Split(New Char() {","c})
        Dim ToEmailArray As JArray = New JArray()
        Dim mail As String
        For Each mail In allToEmails
            Dim mailObj As JObject = New JObject From {
                 {"Email", mail},
                 {"Name", ""}
            }
            ToEmailArray.Add(mailObj)
        Next
        Dim fileBase64Str As String = "", vFileName As String = ""
        Dim mimeType As String
        Dim jsonObj As JObject
        If AttachmentFilepath <> "" Then
            fileBase64Str = Convert.ToBase64String(System.IO.File.ReadAllBytes(AttachmentFilepath))
            vFileName = Path.GetFileName(AttachmentFilepath)
            mimeType = MimeMapping.GetMimeMapping(vFileName)
            jsonObj = New JObject From {
                    {"From", New JObject From {
                        {"Email", FromEmail},
                        {"Name", ""}
                    }},
                    {"To", ToEmailArray},
                    {"Subject", Subject},
                    {"TextPart", ""},
                    {"HTMLPart", Body},
                    {"Attachments", New JArray From {
                        New JObject From {
                            {"ContentType", mimeType},
                            {"Filename", vFileName},
                            {"Base64Content", fileBase64Str}
                        }
                    }}
                }
        Else
            jsonObj = New JObject From {
                   {"From", New JObject From {
                       {"Email", FromEmail},
                       {"Name", ""}
                   }},
                   {"To", ToEmailArray},
                   {"Subject", Subject},
                   {"TextPart", ""},
                   {"HTMLPart", Body}
               }
        End If


        Dim client As MailjetClient = New MailjetClient(ConfigurationManager.AppSettings("MailJetEmailAPIpublicKey").ToString(), ConfigurationManager.AppSettings("MailJetEmailAPIprivateKey").ToString()) With {
                .Version = ApiVersion.V3_1
            }

        Dim request As MailjetRequest = New MailjetRequest With {
                .Resource = Send.Resource
            }.[Property](Send.Messages, New JArray From {jsonObj})

        'Dim response As MailjetResponse = Await client.PostAsync(request)
        Dim response = Task.Run(Function() client.PostAsync(request))
        response.Wait()

        If response.Result.IsSuccessStatusCode Then
            emailReturnMessage = "success"
            Dim mailResponseObj As JObject = New JObject From {
               {"data", response.Result.GetData()}
            }
            Dim mailResponseArr As JArray = New JArray()
            mailResponseArr = mailResponseObj("data")(0)("To")
            Console.WriteLine(mailResponseArr)
            For Each obj In mailResponseArr
                'Dim result As Int32 = InsertEmailLog(FromEmail, ToEmails, Subject, AttachmentFilepath, obj, "success")
                emailReturnMessage += "-" + obj("MessageID").ToString()
                Dim result As Int32 = InsertEmailLog(FromEmail, ToEmails, Subject, vFileName, obj, "success", DocumentType, DocumentNum, Recipient)
            Next
            Console.WriteLine("test debuging..")
        Else
            Dim mailResponseObjError As JObject = New JObject From {
               {"data", response.Result.GetData()}
            }
            Dim mailResponseErrorArr As JArray = New JArray()
            ''2020/09/23, change the way to read errors
            'mailResponseErrorArr = mailResponseObjError("data")(0)("Errors")
            mailResponseErrorArr = mailResponseObjError("data")

            emailReturnMessage = "error: " + mailResponseErrorArr(0)("Errors")(0)("ErrorMessage").ToString()
            For Each obj In mailResponseErrorArr
                'Dim result As Int32 = InsertEmailLog(FromEmail, ToEmails, Subject, AttachmentFilepath, obj, "error")
                Dim result As Int32 = InsertEmailLog(FromEmail, ToEmails, Subject, vFileName, obj, "error", DocumentType, DocumentNum, Recipient)
            Next

        End If
        Return emailReturnMessage
    End Function
    Public Shared Function InsertEmailLog(ByVal FromMail As String, ByVal ToEmails As String, ByVal Subject As String, ByVal FILENAME As String, ByVal ResponseObj As JObject, ByVal STATUS As String, ByVal DocumentType As String, ByVal DocumentNum As String, ByVal Recipient As String) As Int32
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                'SOFIA: 02/08/2021 - SAVE EMAIL LOG WHEN MORE THAN ONE ROW IS SELECTED
                If DocumentNum.ToString.Trim.Contains(",") = True Then
                    Dim InvoiceNumbers As String() = DocumentNum.Split(New Char() {","c})

                    ' Percorremos as palavras da strings separadas exibindo-as no ListBox
                    Dim InvoiceNumber As String
                    For Each InvoiceNumber In InvoiceNumbers
                        Using cmd As New SqlCommand("SpEmailLog", con)
                            cmd.CommandType = CommandType.StoredProcedure
                            cmd.Parameters.Add(New SqlParameter("@FROM_MAIL", IIf(FromMail Is Nothing, "", FromMail)))
                            cmd.Parameters.Add(New SqlParameter("@SUBJECT", IIf(Subject Is Nothing, "", Subject)))
                            If STATUS = "success" Then
                                cmd.Parameters.Add(New SqlParameter("@TO_MAIL", IIf(ResponseObj Is Nothing, "", ResponseObj("Email").ToString())))
                                cmd.Parameters.Add(New SqlParameter("@MESSAGE_UUID", IIf(ResponseObj Is Nothing, "", ResponseObj("MessageUUID").ToString())))
                                cmd.Parameters.Add(New SqlParameter("@MESSAGE_ID", IIf(ResponseObj Is Nothing, "", ResponseObj("MessageID").ToString())))
                                cmd.Parameters.Add(New SqlParameter("@MESSAGE_HREF", IIf(ResponseObj Is Nothing, "", ResponseObj("MessageHref").ToString())))
                            Else
                                cmd.Parameters.Add(New SqlParameter("@TO_MAIL", IIf(ToEmails Is Nothing, "", ToEmails)))
                                cmd.Parameters.Add(New SqlParameter("@STATUSCODE ", IIf(ResponseObj Is Nothing, "", ResponseObj("Errors")(0)("StatusCode").ToString())))
                                cmd.Parameters.Add(New SqlParameter("@ERRORIDENTIFIER ", IIf(ResponseObj Is Nothing, "", ResponseObj("Errors")(0)("ErrorIdentifier").ToString())))
                                cmd.Parameters.Add(New SqlParameter("@ERRORCODE ", IIf(ResponseObj Is Nothing, "", ResponseObj("Errors")(0)("ErrorCode").ToString())))
                                cmd.Parameters.Add(New SqlParameter("@ERRORMESSAGE ", IIf(ResponseObj Is Nothing, "", ResponseObj("Errors")(0)("ErrorMessage").ToString())))
                            End If

                            cmd.Parameters.Add(New SqlParameter("@FILENAME", IIf(FILENAME Is Nothing, "", FILENAME)))
                            cmd.Parameters.Add(New SqlParameter("@STATUS ", IIf(STATUS Is Nothing, "", STATUS)))
                            cmd.Parameters.Add(New SqlParameter("@QueryOption", 1))
                            cmd.Parameters.Add(New SqlParameter("@EMAIL_TYPE", DocumentType))
                            cmd.Parameters.Add(New SqlParameter("@EMAIL_DOCUMENT_NUMBER", InvoiceNumber))
                            cmd.Parameters.Add(New SqlParameter("@EMAIL_RECIPIENT", Recipient))


                            cmd.ExecuteNonQuery()
                        End Using

                    Next
                    Return InvoiceNumbers.Length()
                Else

                    Using cmd As New SqlCommand("SpEmailLog", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@FROM_MAIL", IIf(FromMail Is Nothing, "", FromMail)))
                        cmd.Parameters.Add(New SqlParameter("@SUBJECT", IIf(Subject Is Nothing, "", Subject)))
                        If STATUS = "success" Then
                            cmd.Parameters.Add(New SqlParameter("@TO_MAIL", IIf(ResponseObj Is Nothing, "", ResponseObj("Email").ToString())))
                            cmd.Parameters.Add(New SqlParameter("@MESSAGE_UUID", IIf(ResponseObj Is Nothing, "", ResponseObj("MessageUUID").ToString())))
                            cmd.Parameters.Add(New SqlParameter("@MESSAGE_ID", IIf(ResponseObj Is Nothing, "", ResponseObj("MessageID").ToString())))
                            cmd.Parameters.Add(New SqlParameter("@MESSAGE_HREF", IIf(ResponseObj Is Nothing, "", ResponseObj("MessageHref").ToString())))
                        Else
                            cmd.Parameters.Add(New SqlParameter("@TO_MAIL", IIf(ToEmails Is Nothing, "", ToEmails)))
                            cmd.Parameters.Add(New SqlParameter("@STATUSCODE ", IIf(ResponseObj Is Nothing, "", ResponseObj("Errors")(0)("StatusCode").ToString())))
                            cmd.Parameters.Add(New SqlParameter("@ERRORIDENTIFIER ", IIf(ResponseObj Is Nothing, "", ResponseObj("Errors")(0)("ErrorIdentifier").ToString())))
                            cmd.Parameters.Add(New SqlParameter("@ERRORCODE ", IIf(ResponseObj Is Nothing, "", ResponseObj("Errors")(0)("ErrorCode").ToString())))
                            cmd.Parameters.Add(New SqlParameter("@ERRORMESSAGE ", IIf(ResponseObj Is Nothing, "", ResponseObj("Errors")(0)("ErrorMessage").ToString())))
                        End If

                        cmd.Parameters.Add(New SqlParameter("@FILENAME", IIf(FILENAME Is Nothing, "", FILENAME)))
                        cmd.Parameters.Add(New SqlParameter("@STATUS ", IIf(STATUS Is Nothing, "", STATUS)))
                        cmd.Parameters.Add(New SqlParameter("@QueryOption", 1))
                        cmd.Parameters.Add(New SqlParameter("@EMAIL_TYPE", DocumentType))
                        cmd.Parameters.Add(New SqlParameter("@EMAIL_DOCUMENT_NUMBER", DocumentNum))
                        cmd.Parameters.Add(New SqlParameter("@EMAIL_RECIPIENT", Recipient))


                        Return cmd.ExecuteNonQuery()
                    End Using
                End If
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertEmailLog")
            Return Nothing
        End Try
        Return 0
    End Function
    Public Shared Function UpdateEmailLog(ByVal MESSAGE_ID As String, ByVal EMAILTYPE As String, ByVal EMAILEDDOCUMENTNUMBER As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spUpdateEmailLog", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@MESSAGE_ID", MESSAGE_ID))
                    cmd.Parameters.Add(New SqlParameter("@EMAILTYPE", EMAILTYPE))
                    cmd.Parameters.Add(New SqlParameter("@EMAILEDDOCUMENTNUMBER", EMAILEDDOCUMENTNUMBER))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateEmailLog")
            Return "error"
        End Try
        Return 0
    End Function


    Public Shared Function ManualPOEmailLogs(FromEmail As String, ToEmails As String, Body As String, AttachmentFile As String, Subject As String) As String
        Try
            Dim VendorFileFolderName As String = ConfigurationManager.AppSettings("VendorEmailsFolder")
            Dim LogPath As String = VendorFileFolderName + "/"

            If Not Directory.Exists(LogPath) Then
                Directory.CreateDirectory(LogPath)
            End If
            Dim VendorFromEmail As String = ConfigurationManager.AppSettings("VendorFromEmails")

            Dim filename As String = GetGlobalNameForEmailFile(FromEmail)
            Dim filepath As String = LogPath & filename

            Dim writer As StreamWriter = File.CreateText(filepath)
            writer.WriteLine(ToEmails)
            writer.WriteLine(Subject)
            writer.WriteLine(VendorFromEmail)
            If (AttachmentFile <> "") Then
                writer.WriteLine("XML\" + AttachmentFile)
            Else
                writer.WriteLine("")
            End If
            writer.WriteLine(Body)
            writer.Close()
            RenameEmailFile(filepath, filename)
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ManualPOEmailLogs")
            Return "Error"
        End Try
    End Function


    Public Shared Function GrowerReportsEmailLogs(FromEmail As String, ToEmails As String, Body As String, AttachmentFile As String, Subject As String) As String
        Try
            Dim VendorFileFolderName As String = ConfigurationManager.AppSettings("VendorEmailsFolder")
            Dim LogPath As String = VendorFileFolderName + "/"

            If Not Directory.Exists(LogPath) Then
                Directory.CreateDirectory(LogPath)
            End If
            Dim VendorFromEmail As String = ConfigurationManager.AppSettings("VendorFromEmails")

            Dim filename As String = GetGlobalNameForEmailFile(FromEmail)
            Dim filepath As String = LogPath & filename

            Dim writer As StreamWriter = File.CreateText(filepath)
            writer.WriteLine(ToEmails)
            writer.WriteLine(Subject)
            writer.WriteLine(VendorFromEmail)
            If (AttachmentFile <> "") Then
                writer.WriteLine(AttachmentFile)
            Else
                writer.WriteLine("")
            End If
            writer.WriteLine(Body)
            writer.Close()
            RenameEmailFile(filepath, filename)
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GrowerReportsEmailLogs")
            Return "Error"
        End Try
    End Function

    'Change By Prashant On 22 June 2020 For Generate the Random Number for Create a Unique ERR File Name For Email
    Public Shared Function GetGlobalNameForEmailFile(FromEmail As String) As String
        Try
            'Dim RandomNumber As Integer = 0
            'Dim random As New Random(1)
            'RandomNumber = random.Next(10000, 100000)
            Dim RandomNumber As String
            RandomNumber = Guid.NewGuid().ToString()
            Return FromEmail.Replace(".", "-").Replace("@", "-") + "_" + DateTime.Now.ToString("yyyy_MM_dd HH_mm_ss_fff") + "_" + RandomNumber.ToString() + ".tmp"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetGlobalNameForEmailFile")
            Return ""
        End Try
    End Function

    Public Shared Function RenameEmailFile(FilePath As String, FileName As String) As String
        Try
            Dim NewFileName = IO.Path.GetFileNameWithoutExtension(FileName) & ".err"
            My.Computer.FileSystem.RenameFile(FilePath, NewFileName)
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In RenameEmailFile")
            Return ""
        End Try
        Return Nothing
    End Function


    Public Class GetLogDetails

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property


        Public Function GetLogsListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of Log)

            Dim uList As New List(Of Log)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetLogs]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Log()
                            u.ID = row("ID")
                            u.ModifiedByName = row("ModifiedByName")
                            u.ModifiedDateTime = row("ModifiedDateTime")
                            u.Action = IIf(row("Action") Is DBNull.Value, "", row("Action"))
                            u.ModifiedPage = row("ModifiedPage")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error In GetLogsListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function
    End Class

    Public Shared Function UsersCredentailEmailLogs(ToEmails As String, Subject As String, BodyContent As String, ByVal UserEmailid As String) As String
        Try
            Dim VendorFileFolderName As String = ConfigurationManager.AppSettings("VendorEmailsFolder")
            Dim LogPath As String = VendorFileFolderName + "/"

            If Not Directory.Exists(LogPath) Then
                Directory.CreateDirectory(LogPath)
            End If
            Dim VendorFromEmail As String = ConfigurationManager.AppSettings("VendorFromEmails")

            Dim filename As String = GetGlobalNameForEmailFile(UserEmailid)
            Dim filepath As String = LogPath & filename

            Dim writer As StreamWriter = File.CreateText(filepath)
            writer.WriteLine(ToEmails)
            writer.WriteLine(Subject)
            writer.WriteLine(VendorFromEmail)
            writer.WriteLine()
            'If (AttachmentFilePath <> Nothing) Then
            'writer.WriteLine(AttachmentFile)
            'End If

            'For Each element As String In Array
            '    Console.Write(element)
            '    Console.Write("... ")
            'Next
            Dim body As String() = BodyContent.Split(New String() {"<br/>"}, StringSplitOptions.None)
            For m As Integer = 0 To body.Length - 1
                writer.WriteLine(body(m))
            Next
            writer.Close()
            RenameEmailFile(filepath, filename)
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UsersCredentailEmailLogs")
            Return "Error"
        End Try

    End Function


    Public Shared Function ExceptionHandling(ex As Exception, Optional Val As String = "") As String

        Try
            Dim ErrorInfo As [String] = ""
            Dim struser As [String] = "-NA-"


            If HttpContext.Current.Session IsNot Nothing Then
            End If

            Dim ip As String = HttpContext.Current.Request.Params("REMOTE_ADDR").ToString()
            Dim str As [String] = ""
            str += "URL: " + HttpContext.Current.Request.Url.AbsoluteUri + "###"
            str += "User: " + struser + "###"
            str += Convert.ToString("Section:") & Val + "###"
            str += "Time: " + DateTime.Now + "###"
            str += (Convert.ToString((Convert.ToString("IP: ") & ip))) + "###"
            str += "Exception: " + ex.Message + "###"
            str += "Source: " + ex.Source + "###"
            str += "StackTrace: " + ex.StackTrace + "###"
            str += "MoreInfo: " + ErrorInfo + "###"
            str += BrowserInfo()

            Return str
        Catch exerr As Exception
            Dim strerr As [String] = exerr.Message + " | " + exerr.StackTrace + "  | ORIGINAL |  " + ex.ToString()
            Return strerr
        End Try
    End Function


    Public Shared Function BrowserInfo() As String
        Dim str As [String] = "Browser Information"
        str += "Browser INFO = " + Convert.ToString(HttpContext.Current.Request.UserAgent) + "###"
        str += "Type = " + Convert.ToString(HttpContext.Current.Request.Browser.Type) + "###"
        str += "Name = " + Convert.ToString(HttpContext.Current.Request.Browser.Browser) + "###"
        str += "Version = " + Convert.ToString(HttpContext.Current.Request.Browser.Version) + "###"
        str += "Major Version = " + Convert.ToString(HttpContext.Current.Request.Browser.MajorVersion) + "###"
        str += "Minor Version = " + Convert.ToString(HttpContext.Current.Request.Browser.MinorVersion) + "###"
        str += "Platform = " + Convert.ToString(HttpContext.Current.Request.Browser.Platform) + "###"
        str += "Is Beta = " + Convert.ToString(HttpContext.Current.Request.Browser.Beta.ToString()) + "###"
        str += "Is Crawler = " + Convert.ToString(HttpContext.Current.Request.Browser.Crawler) + "###"
        str += "Is AOL = " + Convert.ToString(HttpContext.Current.Request.Browser.AOL.ToString()) + "###"
        str += "Is Win16 = " + Convert.ToString(HttpContext.Current.Request.Browser.Win16) + "###"
        str += "Is Win32 = " + Convert.ToString(HttpContext.Current.Request.Browser.Win32) + "###"
        str += "Supports Frames = " + Convert.ToString(HttpContext.Current.Request.Browser.Frames) + "###"
        str += "Supports Tables = " + Convert.ToString(HttpContext.Current.Request.Browser.Tables) + "###"
        str += "Supports Cookies = " + Convert.ToString(HttpContext.Current.Request.Browser.Cookies) + "###"
        str += "Supports VB Script = " + Convert.ToString(HttpContext.Current.Request.Browser.VBScript) + "###"
        'str += "Supports JavaScript[should be > 1] = " + HttpContext.Current.Request.Browser.EcmaScriptVersion 
        str += "Supports Java Applets = " + Convert.ToString(HttpContext.Current.Request.Browser.JavaApplets) + "###"
        str += "CDF = " + Convert.ToString(HttpContext.Current.Request.Browser.CDF) + "###"
        Return str
    End Function

    Public Shared Function getBoxLogDetails(ByVal BarCode As String) As List(Of LabelPrintLog)

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim ulist As New List(Of LabelPrintLog)
            Dim Cmd As New SqlCommand
            Cmd = New SqlCommand("select bl.ID as ID,bl.[Application] as 'ImportedFrom',bl.Sequence,bl.RACK,bl.Dt as 'PrintedDate',bl.DeviceID,bl.UserID as 'PrintedUserID',bl.flag,bl.DeviceID,u.UserName,isnull(bl.Invoice,0) as Invoice from tblBoxlog bl " +
            "left join tblusers u on u.ID=bl.UserID  WHERE LEFT(FARM  +REPLICATE(' ',1),3)+RIGHT(REPLICATE('0',5)+RTRIM(LTRIM(STR(BOXNUM,5,0))),5) IN (" + BarCode + ")", SqlCon)
            Dim da As New SqlDataAdapter(Cmd)
            Dim ds As New DataSet
            da.Fill(ds)
            For Each row In ds.Tables(0).Rows
                Dim u As New LabelPrintLog
                u.LogID = row("ID")
                u.ImportedFrom = row("ImportedFrom")
                u.Sequence = row("Sequence")
                u.PrintedDate = row("PrintedDate")
                u.PrintedUser = IIf(IsDBNull(row("UserName")), row("DeviceID"), row("UserName"))
                u.Rack = IIf(IsDBNull(row("Rack")), "", row("Rack"))
                u.Invoice = row("Invoice")
                ulist.Add(u)
            Next
            Cmd.Dispose()
            SqlCon.Close()
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in getBoxLogDetails")
            Return Nothing
        End Try
    End Function

End Class

Public Class Log
    Private _ID As String
    Public Property ID() As String
        Get
            Return _ID
        End Get
        Set(value As String)
            _ID = value
        End Set
    End Property

    Private _ModifiedPage As String
    Public Property ModifiedPage() As String
        Get
            Return _ModifiedPage
        End Get
        Set(value As String)
            _ModifiedPage = value
        End Set
    End Property

    Private _ModifiedIn As String
    Public Property ModifiedIn() As String
        Get
            Return _ModifiedIn
        End Get
        Set(value As String)
            _ModifiedIn = value
        End Set
    End Property

    Private _ModifiedByName As String
    Public Property ModifiedByName() As String
        Get
            Return _ModifiedByName
        End Get
        Set(value As String)
            _ModifiedByName = value
        End Set
    End Property

    Private _LogSelected As Boolean
    Public Property LogSelected() As String
        Get
            Return _LogSelected
        End Get
        Set(ByVal value As String)
            _LogSelected = value
        End Set
    End Property

    Private _Action As String
    Public Property Action() As String
        Get
            Return _Action
        End Get
        Set(value As String)
            _Action = value
        End Set
    End Property

    Private _ModifiedDateTime As String
    Public Property ModifiedDateTime() As String
        Get
            Return _ModifiedDateTime
        End Get
        Set(value As String)
            _ModifiedDateTime = value
        End Set
    End Property

    Private _ModifiedRecord As String
    Public Property ModifiedRecord() As String
        Get
            Return _ModifiedRecord
        End Get
        Set(value As String)
            _ModifiedRecord = value
        End Set
    End Property
End Class

Public Class LabelPrintLogs
    Public Shared Function SaveLabelPrintLog(ByVal TotalLabels As Integer, ByVal UserID As Integer, ByVal wharecondition As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand
            Cmd = New SqlCommand("spLabelPrintLog", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@TotalLabels", TotalLabels)
            Cmd.Parameters.AddWithValue("@UserID", UserID)
            Cmd.Parameters.AddWithValue("@WhareCondition", wharecondition)
            Cmd.ExecuteNonQuery()
            Cmd.Dispose()
            SqlCon.Close()
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveLabelPrintLog")
            Return ex.Message
        End Try
    End Function



    Public Class GetLabelPrintLogDetails

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property


        Public Function GetLabelPrintLogsListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of LabelPrintLog)

            Dim uList As New List(Of LabelPrintLog)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetLabelPrintLogs]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New LabelPrintLog()
                            u.LogID = IIf(row("ID") Is DBNull.Value, 0, row("ID"))
                            u.PODetails.Farm = IIf(row("Farm") Is DBNull.Value, "", row("Farm"))
                            u.PODetails.Flower = IIf(row("Flower") Is DBNull.Value, "", row("Flower"))
                            u.PODetails.BoxNumber = IIf(row("BoxNum") Is DBNull.Value, "", row("BoxNum"))
                            u.PODetails.UOM = IIf(row("UOM") Is DBNull.Value, "", row("UOM"))
                            u.PODetails.Flowername = IIf(row("FlowerName") Is DBNull.Value, "", row("FlowerName"))
                            u.PODetails.FlowerCategory = IIf(row("Category") Is DBNull.Value, "", row("Category"))
                            u.PODetails.PO = IIf(row("PONum") Is DBNull.Value, "", row("PONum"))
                            u.PODetails.CustNumber = IIf(row("cust") Is DBNull.Value, "", row("cust"))
                            u.PODetails.Invoice = IIf(row("invoice") Is DBNull.Value, "", row("invoice"))
                            u.PODetails.HAWB = IIf(row("hawb") Is DBNull.Value, "", row("hawb"))
                            u.PODetails.AWB = IIf(row("mawb") Is DBNull.Value, "", row("mawb"))
                            u.PODetails.UnitsPerBox = IIf(row("units") Is DBNull.Value, "", row("units"))
                            u.PODetails.Cost = IIf(row("cost") Is DBNull.Value, "", row("cost"))
                            u.PODetails.BreakDown = IIf(row("breakdown") Is DBNull.Value, "", row("breakdown"))
                            u.PODetails.Boxes = IIf(row("boxes") Is DBNull.Value, "", row("boxes"))
                            u.PODetails.BoxCode = IIf(row("boxcode") Is DBNull.Value, "", row("boxcode"))
                            u.ImportedFrom = IIf(row("ImportedFrom") Is DBNull.Value, "", row("ImportedFrom"))
                            u.Sequence = IIf(row("Sequence") Is DBNull.Value, 0, row("Sequence"))
                            'u.TotalLabels = IIf(row("TotalLabels") Is DBNull.Value, 0, row("TotalLabels"))
                            u.PrintedDate = row("PrintedDate")
                            u.PrintedUser = IIf(row("UserName") Is DBNull.Value, 0, row("UserName"))
                            u.Rack = IIf(row("Rack") Is DBNull.Value, 0, row("Rack"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetLabelPrintLogsListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function
    End Class
End Class

Public Class LabelPrintLog
    Private _LogID As Integer
    Public Property LogID As Integer
        Get
            Return _LogID
        End Get
        Set(value As Integer)
            _LogID = value
        End Set
    End Property

    Private _PODetails As New ManualPODetail
    Public Property PODetails() As ManualPODetail
        Get
            Return _PODetails
        End Get
        Set(value As ManualPODetail)
            _PODetails = value
        End Set
    End Property

    Private _ImportedFrom As String
    Public Property ImportedFrom As String
        Get
            Return _ImportedFrom
        End Get
        Set(value As String)
            _ImportedFrom = value
        End Set
    End Property

    Private _Sequence As Integer
    Public Property Sequence As Integer
        Get
            Return _Sequence
        End Get
        Set(value As Integer)
            _Sequence = value
        End Set
    End Property

    Private _TotalLabels As Integer
    Public Property TotalLabels As Integer
        Get
            Return _TotalLabels
        End Get
        Set(value As Integer)
            _TotalLabels = value
        End Set
    End Property

    Private _PrintedDate As DateTime
    Public Property PrintedDate As DateTime
        Get
            Return _PrintedDate
        End Get
        Set(value As DateTime)
            _PrintedDate = value
        End Set
    End Property

    Private _PrintedUser As String
    Public Property PrintedUser As String
        Get
            Return _PrintedUser
        End Get
        Set(value As String)
            _PrintedUser = value
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


    Private _Invoice As String
    Public Property Invoice As String
        Get
            Return _Invoice
        End Get
        Set(value As String)
            _Invoice = value
        End Set
    End Property

End Class


