
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Text
Imports System.Collections
Imports System.IO
Imports System.Data.SqlClient
Imports System.Data
''' <summary>
''' Class for Loging events in sites
''' </summary>
Public Class ErrorLogs

    ''' <summary>
    ''' Returns generated path to logfile
    ''' </summary>
    ''' <returns></returns>
    Protected Shared Function GetFileName(info As Boolean) As String
        Dim folder As String = If(info, GetInfoFolder(), GetErrorFolder())
        If folder Is Nothing Then
            Return Nothing
        End If
        Dim stb As New StringBuilder()
        stb.AppendFormat("{0}\ErrorLog_{1}{2}{3}.txt", folder, DateTime.Now.ToString("MM"), DateTime.Now.ToString("dd"), DateTime.Now.ToString("yyyy"))
        Return stb.ToString()
    End Function

    ''' <summary>
    ''' Gets the enable loging
    ''' </summary>
    ''' <returns></returns>
    Protected Shared Function GetEnableLogging() As Boolean
        Dim dic As IDictionary = TryCast(System.Configuration.ConfigurationManager.GetSection("ErrorHandling"), IDictionary)
        Dim enableLogging As Boolean = False
        If dic IsNot Nothing OrElse dic("EnableLogging") IsNot Nothing Then
            [Boolean].TryParse(dic("EnableLogging").ToString().Trim(), enableLogging)
        End If
        Return enableLogging
    End Function

    ''' <summary>
    ''' Gets the name of error loging folder
    ''' </summary>
    ''' <returns></returns>
    Protected Shared Function GetErrorFolder() As String
        Dim dic As IDictionary = TryCast(System.Configuration.ConfigurationManager.GetSection("ErrorHandling"), IDictionary)
        Dim folder As String = If(dic Is Nothing OrElse dic("ErrorLogFilesDir") Is Nothing, "", dic("ErrorLogFilesDir").ToString().Trim())
        folder = HttpContext.Current.Server.MapPath(folder)
        If Not Directory.Exists(folder) Then
            Directory.CreateDirectory(folder)
            Return folder
        Else
            Return folder
        End If
    End Function

    ''' <summary>
    ''' Gets the name of info loging folder
    ''' </summary>
    ''' <returns></returns>
    Protected Shared Function GetInfoFolder() As String
        Dim dic As IDictionary = TryCast(System.Configuration.ConfigurationManager.GetSection("ErrorHandling"), IDictionary)
        Dim folder As String = If(dic Is Nothing OrElse dic("AppLogFilesDir") Is Nothing, "", dic("AppLogFilesDir").ToString().Trim())
        folder = HttpContext.Current.Server.MapPath(folder)
        If Not Directory.Exists(folder) Then
            Return Nothing
        Else
            Return folder
        End If
    End Function

    ''' <summary>
    ''' An internal method for writing data to file
    ''' </summary>
    ''' <param name="stb">
    ''' Data to be written
    ''' </param>
    ''' <param name="info">
    ''' If true, writes to info log folder
    ''' </param>
    Protected Shared Sub WriteToFile(stb As StringBuilder, info As Boolean)
        If GetEnableLogging() Then
            Dim path As String = GetFileName(info)
            If path IsNot Nothing Then
                Using sw As StreamWriter = File.AppendText(path)
                    sw.Write(stb.ToString())
                    sw.Close()
                End Using
            End If
        End If
    End Sub

    ''' <summary>
    ''' Logs any information to some text logfile in specific format
    ''' </summary>
    ''' <param name="info">
    ''' String containing information to be loged
    ''' </param>
    Public Shared Sub LogInfo(info As String)
        LogInfo(info, False)
    End Sub

    ''' <summary>
    ''' Logs any information to some text logfile in specific format
    ''' </summary>
    ''' <param name="info">
    ''' String containing information to be loged
    ''' </param>
    ''' /// <param name="includeAdditionalInfo">
    ''' In true, additional info about request, session etc. will be included into log record
    ''' </param>
    Public Shared Sub LogInfo(info As String, includeAdditionalInfo As Boolean)
        If HttpContext.Current IsNot Nothing AndAlso HttpContext.Current.Request IsNot Nothing Then
            Dim stb As New StringBuilder()
            stb.Append("<Activity>")
            stb.AppendLine()
            stb.AppendFormat("<DateTime>{0}</DateTime>", DateTime.Now)
            stb.AppendLine()
            stb.AppendFormat("<SessionID>{0}</SessionID>", HttpContext.Current.Session.SessionID)
            stb.AppendLine()
            stb.AppendFormat("<Summary>Some info was loged on {0} {1}</Summary>", DateTime.Now.ToLongDateString(), DateTime.Now.ToLongTimeString())
            stb.AppendLine()
            stb.AppendFormat("<Page>{0}</Page>", HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Url.PathAndQuery)
            stb.AppendLine()
            stb.AppendLine()
            stb.AppendFormat("<Message>{0}</Message>", info)
            stb.AppendLine()
            stb.AppendLine()
            If includeAdditionalInfo Then
                stb.Append("<Info>")
                stb.AppendLine()
                stb.AppendFormat("<Verb>{0}</Verb>", HttpContext.Current.Request.RequestType)
                stb.AppendLine()
                stb.AppendFormat("<URL>{0}</URL>", HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Url.PathAndQuery)
                stb.AppendLine()
                stb.AppendFormat("<HostIP>{0}</HostIP>", HttpContext.Current.Request.UserHostAddress, HttpContext.Current.Request.UserHostName)
                stb.AppendLine()
                If HttpContext.Current.Request.UrlReferrer IsNot Nothing Then
                    stb.AppendFormat("<ReffererURL>{0}</ReffererURL>", HttpContext.Current.Request.UrlReferrer.Host + HttpContext.Current.Request.UrlReferrer.PathAndQuery)
                    stb.AppendLine()
                End If
                stb.Append("</Info>")
                stb.AppendLine()
                If HttpContext.Current.Request.Browser IsNot Nothing Then
                    stb.Append("<Browser>")
                    stb.AppendLine()
                    stb.AppendFormat("<Name>{0}</Name>", HttpContext.Current.Request.Browser.Browser)
                    stb.AppendLine()
                    stb.AppendFormat("<Version>{0}</Version>", HttpContext.Current.Request.Browser.Version)
                    stb.AppendLine()
                    stb.AppendFormat("<CookieSupport>{0}</CookieSupport>", HttpContext.Current.Request.Browser.Cookies)
                    stb.AppendLine()
                    stb.AppendFormat("<JSSupport>{0}</JSSupport>", HttpContext.Current.Request.Browser.EcmaScriptVersion.Major > 0)
                    stb.AppendLine()
                    stb.AppendFormat("<Platform>{0}</Platform>", HttpContext.Current.Request.Browser.Platform)
                    stb.AppendLine()
                    stb.Append("</Browser>")
                    stb.AppendLine()
                End If

                If HttpContext.Current.Session("UserID") IsNot Nothing AndAlso Convert.ToString(HttpContext.Current.Session("UserID")) <> String.Empty Then
                    stb.AppendFormat("<User type=""User"">{0}</User>", HttpContext.Current.Session("UserID").ToString())
                ElseIf HttpContext.Current.Session("AdminUserID") IsNot Nothing AndAlso Convert.ToString(HttpContext.Current.Session("AdminUserID")) <> String.Empty Then
                    stb.AppendFormat("<User type=""Admin"">{0}</User>", HttpContext.Current.Session("AdminUserID").ToString())
                Else
                    stb.AppendFormat("<User type=""Guest"">{0}</User>", "Guest")
                End If

                stb.AppendLine()
                stb.AppendLine()
                stb.AppendFormat("<ElementsInSession>{0}</ElementsInSession>", HttpContext.Current.Session.Count)
                stb.AppendLine()
                stb.AppendFormat("<ElementsInCache>{0}</ElementsInCache>", HttpContext.Current.Cache.Count)
                stb.AppendLine()
            End If
            stb.AppendLine()
            stb.AppendLine()
            stb.Append("</Activity>")
            stb.AppendLine()
            stb.AppendLine()
            SyncLock GetType(ErrorLogs)
                'WriteToFile(stb, false);
                WriteToFile(stb, True)
            End SyncLock
        End If
    End Sub


    ''' <summary>
    ''' Logs as exception pointed to some text logfile in specific format
    ''' </summary>
    ''' <param name="er">
    ''' Exception to be loged
    ''' </param>
    Public Shared Sub LogException(er As Exception)
        LogException(er, String.Empty, ErrorLevel.[ERROR])

        Dim User As New User
        If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
            User = System.Web.HttpContext.Current.Session("LoginUserDetails")
        ElseIf Not System.Web.HttpContext.Current.Session("LoginAdminDetails") Is Nothing Then
            User = System.Web.HttpContext.Current.Session("LoginAdminDetails")
        End If

        Dim BodyMessage As String = er.Message.ToString() + "</br>" + " on " + Now.ToString("yyyy_MM_dd HH_mm_ss") + "</b>"

        Logs.VendorEmailLogs(User, BodyMessage, "", "Error Notification", "error")
        'InsertErrorNotificationEmail(er.Message.ToString(), "Application Error")
    End Sub

    'Private Shared Function InsertErrorNotificationEmail(ByVal Body As String, ByVal Subject As String) As String

    '    Try
    '        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
    '        Dim SqlCon As New SqlConnection(ConStr)
    '        SqlCon.Open()
    '        Dim UserScopeID As String = ""
    '        Dim Cmd As New SqlCommand("spInsertErrorNotification", SqlCon)
    '        Cmd.CommandType = CommandType.StoredProcedure
    '        Cmd.Parameters.AddWithValue("@Body", Body)
    '        Cmd.Parameters.AddWithValue("@Subject", Subject)
    '        Cmd.ExecuteNonQuery()
    '        Cmd.Dispose()
    '        SqlCon.Close()
    '        Return "valid"
    '    Catch ex As Exception
    '        Return ex.Message
    '    End Try
    'End Function

    ''' <summary>
    ''' Logs as exception pointed to some text logfile in specific format
    ''' </summary>
    ''' <param name="er">
    ''' Exception to be loged
    ''' </param>
    ''' <param name="strMessage">
    ''' custom message to be loged
    ''' </param>
    Public Shared Sub LogException(er As Exception, strMessage As String)
        Dim User As New User
        If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
            User = System.Web.HttpContext.Current.Session("LoginUserDetails")
        ElseIf Not System.Web.HttpContext.Current.Session("LoginAdminDetails") Is Nothing Then
            User = System.Web.HttpContext.Current.Session("LoginAdminDetails")
        End If
        If (User.Email <> "" And User.Email <> String.Empty) Then
            Dim bodyMessage As String = Logs.ExceptionHandling(er, strMessage) + "<Table><tr><td>UserName :" + User.Email + "</td></tr>" +
                                        "<tr><td>Name :" + User.Name + "</td></tr>" +
                                        "<tr><td>IP :" + BloomService.LocalIPAddress + "</td></tr>" +
                                        "</Table>"
            Logs.VendorEmailLogs(User, strMessage + "::" + Logs.ExceptionHandling(er, strMessage), "", "Error Notification", "error")
        End If

        If er.Message.Contains("There was no endpoint listening at") = True Or er.Message.Contains("System.OutOfMemoryException") = True Then
            Throw er
        Else

            LogException(er, strMessage, ErrorLevel.[ERROR])
        End If
    End Sub

    ''' <summary>
    ''' Logs as exception pointed to some text logfile in specific format
    ''' </summary>
    ''' <param name="er">
    ''' Exception to be loged
    ''' </param>
    ''' <param name="strMessage">
    ''' custom message to be loged
    ''' </param>
    ''' <param name="errLevel">
    ''' error level
    ''' </param>
    Public Shared Sub LogException(er As Exception, strMessage As String, errLevel As ErrorLevel)

        If HttpContext.Current IsNot Nothing AndAlso HttpContext.Current.Request IsNot Nothing AndAlso er IsNot Nothing AndAlso Not (TypeOf er Is System.Threading.ThreadAbortException) Then
            Try
                Dim stb As New StringBuilder()
                stb.Append("<Exception>")
                stb.AppendLine()
                stb.AppendFormat("<DateTime>{0}</DateTime>", DateTime.Now)
                stb.AppendLine()
                stb.AppendFormat("<SessionID>{0}</SessionID>", HttpContext.Current.Session.SessionID)
                stb.AppendLine()
                stb.Append("<Summary>An unhandled exception occured</Summary>")
                stb.AppendLine()
                If strMessage <> String.Empty Then
                    stb.AppendFormat("<CustomMessage>{0}</CustomMessage>", strMessage)
                    stb.AppendLine()
                End If
                stb.Append("<Info>")
                stb.AppendLine()
                stb.AppendFormat("<URL>{0}</URL>", HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Url.PathAndQuery)
                stb.AppendLine()
                stb.AppendFormat("<HostIP>{0}</HostIP>", HttpContext.Current.Request.UserHostAddress, HttpContext.Current.Request.UserHostName)
                stb.AppendLine()
                If HttpContext.Current.Request.UrlReferrer IsNot Nothing Then
                    stb.AppendFormat("<ReffererURL>{0}</ReffererURL>", HttpContext.Current.Request.UrlReferrer.Host + HttpContext.Current.Request.UrlReferrer.PathAndQuery)
                    stb.AppendLine()
                End If
                stb.Append("</Info>")
                stb.AppendLine()
                If HttpContext.Current.Session("UserId") IsNot Nothing AndAlso Convert.ToString(HttpContext.Current.Session("UserId")) <> String.Empty Then
                    stb.AppendFormat("<User type=""User"">{0}</User>", HttpContext.Current.Session("UserID").ToString())
                ElseIf HttpContext.Current.Session("IsSuperAdmin") IsNot Nothing Then
                    stb.AppendFormat("<User type=""Admin"">{0}</User>", "SuperAdmin")
                Else
                    stb.AppendFormat("<User>{0}</User>", "Guest")
                End If

                stb.AppendLine()

                stb.AppendFormat("<ErrorMessage>{0}</ErrorMessage>", er.Message.ToString())

                If er.InnerException IsNot Nothing Then
                    stb.AppendLine()
                    stb.AppendFormat("<InnerException>{0}</InnerException>", er.InnerException.ToString())
                End If
                stb.AppendLine()
                stb.Append("</Exception>")
                stb.AppendLine()
                stb.AppendLine()
                SyncLock GetType(ErrorLogs)
                    'WriteToFile(stb, false);
                    WriteToFile(stb, False)
                End SyncLock

                'Send Email to admin code
                If errLevel = ErrorLevel.FATAL_ERROR Then
                End If
                'do nothing for now
            Catch generatedExceptionName As Exception
            End Try
        End If
    End Sub

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

End Class

''' <summary>
''' Level of error
''' </summary>
Public Enum ErrorLevel As Integer
    FATAL_ERROR = 3
    [ERROR] = 2
    WARNING = 1
End Enum



