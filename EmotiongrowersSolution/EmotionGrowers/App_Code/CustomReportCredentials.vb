Imports System.Net
Public Class CustomReportCredentials
    Implements Microsoft.Reporting.WebForms.IReportServerCredentials

    ' local variable for network credential
    Private strUserName As String
    Private strPassWord As String
    Private strDomainName As String
    Public Sub New(ByVal UserName As String, ByVal PassWord As String, ByVal DomainName As String)
        strUserName = UserName
        strPassWord = PassWord
        strDomainName = DomainName
    End Sub
    Public ReadOnly Property ImpersonationUser() As System.Security.Principal.WindowsIdentity Implements Microsoft.Reporting.WebForms.IReportServerCredentials.ImpersonationUser
        Get
            ' not use ImpersonationUser
            Return Nothing
        End Get
    End Property
    Public ReadOnly Property NetworkCredentials() As System.Net.ICredentials Implements Microsoft.Reporting.WebForms.IReportServerCredentials.NetworkCredentials
        Get
            ' use NetworkCredentials
            Return New NetworkCredential(strUserName, strPassWord, strDomainName)
        End Get
    End Property
    Public Function GetFormsCredentials(ByRef authCookie As System.Net.Cookie, ByRef userName As String, ByRef password As String, ByRef authority As String) As Boolean Implements Microsoft.Reporting.WebForms.IReportServerCredentials.GetFormsCredentials
        ' not use FormsCredentials unless you have implements a custom autentication.
        authCookie = Nothing
        password = authority = Nothing
        Return False
    End Function
End Class