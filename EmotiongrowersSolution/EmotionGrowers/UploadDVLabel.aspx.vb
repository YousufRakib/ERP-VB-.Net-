Imports System.IO
Partial Class UploadDVLabel
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim result As String
        Try

            Dim file As HttpPostedFile = Request.Files(0)
            If file IsNot Nothing AndAlso file.ContentLength Then
                Dim fname As String = Path.GetFileName(file.FileName)
                Dim SysPath As String = HttpContext.Current.Server.MapPath("~/temp/")


                If Not System.IO.Directory.Exists(SysPath) Then
                    System.IO.Directory.CreateDirectory(SysPath)

                End If

                file.SaveAs(Server.MapPath(Path.Combine("~/temp", fname)))


                result = "<script language='javascript' type='text/javascript'>window.top.window.stopUploadDV('" + fname + "');</script>"

            Else
                result = "<script language='javascript' type='text/javascript'>window.top.window.stopUploadDV('-nil-');</script>"
            End If
        Catch ex As Exception
            result = "<script language='javascript' type='text/javascript'>window.top.window.stopUploadDV('-nil-');</script>"
        End Try
        Threading.Thread.Sleep(1000)
        Response.Write(result)
    End Sub
End Class
