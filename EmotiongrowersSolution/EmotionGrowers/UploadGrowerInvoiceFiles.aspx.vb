Imports System.IO
Partial Class UploadGrowerInvoiceFiles
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim result As String
        Try

            Dim file As HttpPostedFile = Request.Files(0)
            If file IsNot Nothing AndAlso file.ContentLength Then
                Dim fname As String = Path.GetFileName(file.FileName)

                Dim DetailID As String = Request.Form("hdndetailid").ToString()
                Dim MainFolderName = String.Format(ConfigurationManager.AppSettings("UserUploadPath"))
                Dim SubFolderName = String.Format(ConfigurationManager.AppSettings("GrowerReportInvoicePath"), DetailID)
                Dim SysPath As String = HttpContext.Current.Server.MapPath("~/" + MainFolderName + "/" + SubFolderName + "/")

                Dim FileType As String = Path.GetExtension(file.FileName)

                If System.IO.Directory.Exists(SysPath) Then
                    For Each filepath As String In Directory.GetFiles(SysPath)
                        System.IO.File.Delete(filepath)
                    Next
                End If

                If Not System.IO.Directory.Exists(SysPath) Then
                    System.IO.Directory.CreateDirectory(SysPath)
                End If
                'Dim NewFileName As String = fname.Replace(FileTye, "") + "_" + Now.ToString("yyyyMMddHHmmss") + "_" + HeaderId + FileTye
                Dim NewFileName As String = fname.Replace(FileType, "") + "_" + DetailID + FileType
                file.SaveAs(Server.MapPath(Path.Combine("~/" + MainFolderName + "/" + SubFolderName + "", NewFileName)))


                result = "<script language='javascript' type='text/javascript'>window.top.window.stopUploadInvoiceFiles('" + NewFileName + "','" + FileType + "');</script>"

            Else
                result = "<script language='javascript' type='text/javascript'>window.top.window.stopUploadInvoiceFiles('-nil-','');</script>"
            End If
        Catch ex As Exception
            result = "<script language='javascript' type='text/javascript'>window.top.window.stopUploadInvoiceFiles('-nil-'','');</script>"
        End Try
        Threading.Thread.Sleep(1000)
        Response.Write(result)
    End Sub
End Class
