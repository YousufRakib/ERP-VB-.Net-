Imports System.IO
Partial Class UploadManualPoHeaderFiles
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim result As String
        Try

            Dim file As HttpPostedFile = Request.Files(0)
            If file IsNot Nothing AndAlso file.ContentLength Then
                Dim fname As String = Path.GetFileName(file.FileName)

                Dim HeaderId As String = Request.Form("hdnheaderid").ToString()
                Dim FolderName = String.Format(ConfigurationManager.AppSettings("ManualPoHeaderFilesPath"), HeaderId)
                Dim SysPath As String = HttpContext.Current.Server.MapPath("~/" + FolderName + "/")

                Dim FileTye As String = Path.GetExtension(file.FileName)
                If Not System.IO.Directory.Exists(SysPath) Then
                    System.IO.Directory.CreateDirectory(SysPath)
                End If
                'Dim NewFileName As String = fname.Replace(FileTye, "") + "_" + Now.ToString("yyyyMMddHHmmss") + "_" + HeaderId + FileTye
                Dim NewFileName As String = fname.Replace(FileTye, "") + "_" + HeaderId + FileTye
                file.SaveAs(Server.MapPath(Path.Combine("~/" + FolderName + "", NewFileName)))


                result = "<script language='javascript' type='text/javascript'>window.top.window.stopUploadHeaderFiles('" + NewFileName + "','" + FileTye + "');</script>"

            Else
                result = "<script language='javascript' type='text/javascript'>window.top.window.stopUploadHeaderFiles('-nil-','');</script>"
            End If
        Catch ex As Exception
            result = "<script language='javascript' type='text/javascript'>window.top.window.stopUploadHeaderFiles('-nil-'','');</script>"
        End Try
        Threading.Thread.Sleep(1000)
        Response.Write(result)
    End Sub
End Class
