
Imports System.IO

Partial Class pages_PageDownloadFile
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim filePath As String
        If Not String.IsNullOrEmpty(Request.Params("fileName")) Then
            Dim VendorFileFolderName As String = ConfigurationManager.AppSettings("VendorEmailsFolder")
            Dim ExportFolderName As String = ConfigurationManager.AppSettings("ExportFolder")
            filePath = VendorFileFolderName & ExportFolderName & "\\" & Request.Params("fileName")
            If File.Exists(filePath) Then
                DownloadFileByPath(filePath)

                Return
            End If
        End If
        ''if file path not correct redirect to default page
        Response.Redirect(Request.Url.GetLeftPart(UriPartial.Authority) & "/Default.aspx?Page=Sales")

    End Sub

    Public Sub DownloadFileByPath(filePath As String)
        Dim fileName As String
        fileName = Path.GetFileName(filePath)
        Dim mimeType As String = MimeMapping.GetMimeMapping(fileName)
        HttpContext.Current.Response.Clear()
        HttpContext.Current.Response.ClearHeaders()
        HttpContext.Current.Response.ClearContent()
        HttpContext.Current.Response.AddHeader("Content-Disposition", "inline; filename=" + fileName)
        'HttpContext.Current.Response.AddHeader("Content-Length", File.Length.ToString())
        HttpContext.Current.Response.ContentType = mimeType
        'HttpContext.Current.Response.ContentType = "application/octet-stream"
        'HttpContext.Current.Response.Flush()
        ' HttpContext.Current.Response.WriteFile(filePath)
        'Dim fileData As Byte() = System.IO.File.ReadAllBytes(filePath)
        'HttpContext.Current.Response.OutputStream.Write(fileData, 0, fileData.Length)
        HttpContext.Current.Response.TransmitFile(filepath)

        HttpContext.Current.Response.End()
        'HttpContext.Current.Response.Flush() ' Sends all currently buffered output To the client.
        'HttpContext.Current.Response.SuppressContent = True ' Gets Or sets a value indicating whether To send HTTP content To the client.
        'HttpContext.Current.ApplicationInstance.CompleteRequest()

    End Sub

End Class
