Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO

Public Class AdminSettings

    Public Shared Function GetAdminSettings() As List(Of AdminSetting)
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim UList As New List(Of AdminSetting)
        Using con As New SqlConnection(ConStr)
            con.Open()
            Using cmd As New SqlCommand("select * from tblsettings", con)
                Dim da As New SqlDataAdapter(cmd)
                Dim ds As New DataSet
                da.Fill(ds)
                For Each row In ds.Tables(0).Rows
                    Dim u As New AdminSetting
                    u.ID = row("ID")
                    u.LabelTypeID = row("LabelTypeID")
                    u.ModifiedDate = row("ModifiedDate")
                    u.InvAppEmails = Convert.ToString(row("InvAppEmails"))
                    UList.Add(u)
                Next
            End Using
        End Using
        Return UList
    End Function


    Public Shared Function UpdateAdminSettings(ByVal LabelTypeID As String, ByVal InvAppEmails As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("spUpdateAdminSettings", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@LableTypeID", LabelTypeID)
            Cmd.Parameters.AddWithValue("@InvAppEmails", InvAppEmails)
            Cmd.ExecuteNonQuery()
            Cmd.Dispose()
            SqlCon.Close()
            Dim LoginUserDetails As New User
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Admin", "UpdateAdminSettings", "Updated the adminsettings", LabelTypeID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    ''' <summary>
    ''' STA::24-NOV-2015::to get the Email Credential Contents
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetCredentialEmailContentSettings() As CredentiatlEmailContent
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Try
            Dim u As New CredentiatlEmailContent
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblCredentialEmailContent where ContentType='CredentialEmailContent'", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.Content = row("Content")
                        u.ModifiedDate = Convert.ToString(row("ModifiedDate"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCredentialEmailContentSettings")
            Return Nothing
        End Try
        
    End Function

    Public Shared Function GetGrowerReportEmailContent() As CredentiatlEmailContent
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Try
            Dim u As New CredentiatlEmailContent
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblCredentialEmailContent where ContentType='GrowerReportEmailContent'", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.Content = row("Content")
                        u.ModifiedDate = Convert.ToString(row("ModifiedDate"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCredentialEmailContentSettings")
            Return Nothing
        End Try

    End Function



    Public Shared Function UpdateCredentialEmailContentSettings(ByVal Id As String, ByVal CreatedUserId As Integer, ByVal Content As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("spSaveCredentialEmailContent", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@Id", Id)
            Cmd.Parameters.AddWithValue("@Content", Content)
            Cmd.Parameters.AddWithValue("@ContentType", "CredentialEmailContent")
            Cmd.Parameters.AddWithValue("@CreatedUserid", CreatedUserId)
            Cmd.ExecuteNonQuery()
            Cmd.Dispose()
            SqlCon.Close()
            Dim LoginUserDetails As New User
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Admin", "UpdateCredentialEmailContentSettings", "Updated the adminsettings", Id.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCredentialEmailContentSettings")
            Return "error"
        End Try
    End Function

    Public Shared Function UpdateGrowerReportEmailContent(ByVal Id As String, ByVal CreatedUserId As Integer, ByVal Content As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("spSaveCredentialEmailContent", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@Id", Id)
            Cmd.Parameters.AddWithValue("@Content", Content)
            Cmd.Parameters.AddWithValue("@ContentType", "GrowerReportEmailContent")
            Cmd.Parameters.AddWithValue("@CreatedUserid", CreatedUserId)
            Cmd.ExecuteNonQuery()
            Cmd.Dispose()
            SqlCon.Close()
            Dim LoginUserDetails As New User
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Admin", "UpdateGrowerReportEmailContent", "Updated the adminsettings", Id.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateGrowerReportEmailContent")
            Return "error"
        End Try
    End Function



    ''' <summary>
    ''' VEN::03-DEC-2015::For Update Company Details
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <param name="CompanyName"></param>
    ''' <param name="Address"></param>
    ''' <param name="Phone"></param>
    ''' <param name="Fax"></param>
    ''' <param name="CompanyLogopath"></param>
    ''' <returns></returns>
    Public Shared Function UpdateCompanyDetails(ByVal ID As String, ByVal CompanyName As String, ByVal Address As String, ByVal Phone As String, ByVal Fax As String, ByVal CompanyLogopath As String) As String
        Try
            Dim _tempByte() As Byte = Nothing
            If String.IsNullOrEmpty(CompanyLogopath) <> True Then
                Dim fullpath As String = HttpContext.Current.Server.MapPath(Path.Combine("~/", CompanyLogopath))
                Dim _fileInfo As New IO.FileInfo(fullpath)
                Dim _NumBytes As Long = _fileInfo.Length
                Dim _FStream As New IO.FileStream(fullpath, IO.FileMode.Open, IO.FileAccess.Read)
                Dim _BinaryReader As New IO.BinaryReader(_FStream)
                _tempByte = _BinaryReader.ReadBytes(Convert.ToInt32(_NumBytes))
                _fileInfo = Nothing
                _NumBytes = 0
                _FStream.Close()
                _FStream.Dispose()
                _BinaryReader.Close()
            End If
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("spSaveCompanyDetails", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@Id", ID)
            Cmd.Parameters.AddWithValue("@CompanyName", CompanyName)
            Cmd.Parameters.AddWithValue("@Address", Address)
            Cmd.Parameters.AddWithValue("@Phone", Phone)
            Cmd.Parameters.AddWithValue("@Fax", Fax)
            Cmd.Parameters.AddWithValue("@CompanyLogo", _tempByte)
            Cmd.ExecuteNonQuery()
            Cmd.Dispose()
            SqlCon.Close()
            Dim LoginUserDetails As New User
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Admin", "UpdateCompanyDetails", "Updated the adminsettings", ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCompanyDetails")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' VEN::03-DEC-2015::For Get Company Details
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function GetCompanyDetails() As CompanyDetails
        Try
            Dim u As New CompanyDetails
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("select * from tblCompanyDetails", SqlCon)
            Cmd.CommandType = CommandType.Text
            Dim adp As New SqlDataAdapter(Cmd)
            Dim dt As New DataTable
            adp.Fill(dt)
            For Each row In dt.Rows
                u.ID = row("ID")
                u.CompanyName = Convert.ToString(row("CompanyName"))
                u.Address = Convert.ToString(row("Address"))
                u.Phone = Convert.ToString(row("Phone"))
                u.Fax = Convert.ToString(row("Fax"))
                u.CompanyLogo = "CompanyLogoHandler.ashx?ID=" + row("ID").ToString()
                u.ModifiedDate = Convert.ToString(row("ModifiedDate"))
            Next
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCompanyDetails")
            Return Nothing
        End Try
    End Function

End Class



Public Class AdminSetting


    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(value As Integer)
            _ID = value
        End Set
    End Property

    Private _LabelTypeID As String = "0"
    Public Property LabelTypeID() As String
        Get
            Return _LabelTypeID
        End Get
        Set(value As String)
            _LabelTypeID = value
        End Set
    End Property

    Private _InvAppEmails As String = ""
    Public Property InvAppEmails() As String
        Get
            Return _InvAppEmails
        End Get
        Set(value As String)
            _InvAppEmails = value
        End Set
    End Property


    Private _ModifiedDate As String = ""
    Public Property ModifiedDate() As String
        Get
            Return _ModifiedDate
        End Get
        Set(value As String)
            _ModifiedDate = value
        End Set
    End Property


End Class

Public Class CredentiatlEmailContent
    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(value As Integer)
            _ID = value
        End Set
    End Property

    Private _Content As String = ""
    Public Property Content() As String
        Get
            Return _Content
        End Get
        Set(value As String)
            _Content = value
        End Set
    End Property

    Private _ModifiedDate As String = ""
    Public Property ModifiedDate() As String
        Get
            Return _ModifiedDate
        End Get
        Set(value As String)
            _ModifiedDate = value
        End Set
    End Property
End Class

Public Class CompanyDetails
    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(value As Integer)
            _ID = value
        End Set
    End Property

    Private _CompanyName As String = ""
    Public Property CompanyName() As String
        Get
            Return _CompanyName
        End Get
        Set(value As String)
            _CompanyName = value
        End Set
    End Property

    Private _Phone As String = ""
    Public Property Phone() As String
        Get
            Return _Phone
        End Get
        Set(value As String)
            _Phone = value
        End Set
    End Property

    Private _Address As String = ""
    Public Property Address() As String
        Get
            Return _Address
        End Get
        Set(value As String)
            _Address = value
        End Set
    End Property

    Private _Fax As String = ""
    Public Property Fax() As String
        Get
            Return _Fax
        End Get
        Set(value As String)
            _Fax = value
        End Set
    End Property

    Private _CompanyLogo As String = ""
    Public Property CompanyLogo() As String
        Get
            Return _CompanyLogo
        End Get
        Set(value As String)
            _CompanyLogo = value
        End Set
    End Property

    Private _ModifiedDate As String = ""
    Public Property ModifiedDate() As String
        Get
            Return _ModifiedDate
        End Get
        Set(value As String)
            _ModifiedDate = value
        End Set
    End Property
End Class