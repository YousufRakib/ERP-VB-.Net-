Imports System.IO
Imports System.Web.Services

Partial Class DeleteCreditReq
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try

            Dim VETID As String = Request.Form("ID").ToString()
            Dim IDFrom As String = Request.Form("IDFrom").ToString()
            Dim FileName As String = Request.Form("FileName").ToString()

            Dim MainFolderName = String.Format(ConfigurationManager.AppSettings("CreditRequestPath"), IDFrom, VETID)
            Dim SysPath As String = HttpContext.Current.Server.MapPath("~/" + MainFolderName + "/")

            Dim path As String = SysPath & FileName
            Dim file As New FileInfo(path)
            If file.Exists Then
                file.Delete()
            Else
            End If
        Catch ex As Exception
            Throw ex
        End Try
        Threading.Thread.Sleep(1000)
    End Sub
End Class
