Imports System.IO
Imports System.Web.Services

Partial Class UploadCreditReq
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim result As String
        Try

            Dim file As HttpPostedFile = Request.Files(0)
            If file IsNot Nothing AndAlso file.ContentLength Then
                Dim fname As String = Path.GetFileName(file.FileName)

                Dim VETID As String = Request.Form("ID").ToString()
                Dim IDFrom As String = Request.Form("IDFrom").ToString()
                Dim MainFolderName = String.Format(ConfigurationManager.AppSettings("CreditRequestPath"), IDFrom, VETID)
                Dim SysPath As String = HttpContext.Current.Server.MapPath("~/" + MainFolderName + "/")

                Dim FileType As String = Path.GetExtension(file.FileName)

                If Not System.IO.Directory.Exists(SysPath) Then
                    System.IO.Directory.CreateDirectory(SysPath)
                End If
                Dim NewFileName As String = fname.Replace(FileType, "") + FileType
                file.SaveAs(Server.MapPath(Path.Combine("~/" + MainFolderName + "", NewFileName)))
                result = NewFileName
            Else
                result = "Nill"
            End If
        Catch ex As Exception
            Throw ex
            result = "Nill"
        End Try
        Threading.Thread.Sleep(1000)
        Response.Write(result)
    End Sub
End Class
