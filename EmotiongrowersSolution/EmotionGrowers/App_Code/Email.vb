Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO


Public Class Email
    Public Shared Function SaveSystemEmail(ByVal UserEmail As String) As String

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim ScopeID As String = ""
            Dim Cmd As New SqlCommand("insert into tblSysEmail(Email)values(@Email)", SqlCon)
            Cmd.CommandType = CommandType.Text
            Cmd.Parameters.AddWithValue("@Email", UserEmail)
            Cmd.ExecuteNonQuery()
            Cmd.CommandText = String.Format("select IDENT_CURRENT('tblSysEmail') as UserID")
            Cmd.CommandType = CommandType.Text
            Dim da As New SqlDataAdapter(Cmd)
            Dim dt As New DataTable
            da.Fill(dt)
            For Each row1 In dt.Rows
                ScopeID = row1("UserID")
            Next

            Cmd.Dispose()
            SqlCon.Close()
            Dim LoginUserDetails As New User
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "SaveSystemEmail", "Added a new email  <b>" + GetSystemEmailById(ScopeID).Email + "</b>", ScopeID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveSystemEmail")
            Return ex.Message
        End Try
    End Function

    Public Shared Function EditSystemEmail(ByVal UserEmail As String, ByVal OldId As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("update tblSysEmail set Email=@Email,WebLogin=@WebLogin WHERE ID=@OldId", SqlCon)
            Cmd.CommandType = CommandType.Text
            Cmd.Parameters.AddWithValue("@Email", UserEmail)
            Cmd.Parameters.AddWithValue("@OldId", OldId)
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
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "EditSystemEmail", "Updated the email <b>" + GetSystemEmailById(OldId).Email + "</b>", OldId.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in EditSystemEmail")
            Return ex.Message
        End Try
    End Function

    Shared Function DeleteSystemEmail(ID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Elist As Emails = GetSystemEmailById(ID)
            Dim sql As String = "Delete from tblSysEmail where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Dim LoginUserDetails As New User
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "DeleteSystemEmail", "Removed the email <b>" + Elist.Email + "</b>", ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteSystemEmail")
        End Try
        Return "invalid"
    End Function

    Public Shared Function GetSystemEmailById(ID As Integer) As Emails
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New Emails
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblSysEmail where ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.Email = row("Email")
                        u.WebLogin = IIf(row("WebLogin") Is DBNull.Value, False, row("WebLogin"))
                        u.Errors = IIf(row("Errors") Is DBNull.Value, False, row("Errors"))
                        u.LabelNotification = IIf(row("LabelNotification") Is DBNull.Value, False, row("LabelNotification"))
                        u.XmlNotification = IIf(row("XmlNotification") Is DBNull.Value, False, row("XmlNotification"))
                        u.ARXmlNotification = IIf(row("ARXmlNotification") Is DBNull.Value, False, row("ARXmlNotification"))
                        u.ShippingLabelNotification = IIf(row("ShippingLabelNotification") Is DBNull.Value, False, row("ShippingLabelNotification"))
                        u.EodReports = IIf(row("EodReports") Is DBNull.Value, False, row("EodReports"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSystemEmailById")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetAllSystemEmails() As List(Of Emails)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Emails)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblSysEmail", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Emails
                        u.ID = row("ID")
                        u.Email = row("Email")
                        u.WebLogin = row("WebLogin")
                        u.Errors = row("Errors")
                        u.LabelNotification = row("LabelNotification")
                        u.XmlNotification = row("XmlNotification")
                        u.ARXmlNotification = row("ARXmlNotification")
                        u.EodReports = row("EodReports")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAllSystemEmails")
            Return Nothing
        End Try
    End Function

    'Public Shared Function GetWebLoginById(ID As Integer) As Emails
    '    Try
    '        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
    '        Dim u As New Emails
    '        Using con As New SqlConnection(ConStr)
    '            con.Open()
    '            Using cmd As New SqlCommand("select * from tblSysEmail where ID=@ID", con)
    '                cmd.Parameters.AddWithValue("@ID", ID)
    '                Dim da As New SqlDataAdapter(cmd)
    '                Dim ds As New DataSet
    '                da.Fill(ds)
    '                For Each row In ds.Tables(0).Rows
    '                    u.ID = row("ID")
    '                    u.Email = row("Email")
    '                    u.WebLogin = row("WebLogin")
    '                    'u.InvoiceCreate = row("InvoiceCreate")
    '                    u.LabelNotification = row("LabelNotification")
    '                    u.XmlNotification = row("XmlNotification")
    '                    u.Errors = row("Errors")
    '                Next
    '            End Using
    '        End Using
    '        Return u
    '    Catch ex As Exception
    '        ErrorLogs.LogException(ex, "Error in GetWebLoginById")
    '        Return Nothing
    '    End Try
    'End Function

    Shared Function ToggleWebLogin(ID As Integer, IsWebLogin As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblSysEmail set WebLogin=@WebLogin where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@WebLogin", IsWebLogin)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Dim LoginUserDetails As New User
            Dim Action As String
            If (IsWebLogin = True) Then
                Action = "Activated Login Notification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            Else
                Action = "Deactivated Login Notification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            End If
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "ToggleWebLogin", Action, ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleWebLogin")
        End Try
        Return "invalid"
    End Function

    Shared Function ToggleInvoiceCreate(ID As Integer, InvoiceCreate As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblSysEmail set InvoiceCreate=@InvoiceCreate where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                'Cmd.Parameters.AddWithValue("@InvoiceCreate", InvoiceCreate)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            'Dim LoginUserDetails As New User
            'If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
            '    LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            '    Logs.Savelog(LoginUserDetails.ID, "AdminEmail", "ToggleInvoiceCreate", )
            'End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleInvoiceCreate")
        End Try
        Return "invalid"
    End Function

    'Public Shared Function GetErrorsById(ID As Integer) As Emails
    '    Try
    '        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
    '        Dim u As New Emails
    '        Using con As New SqlConnection(ConStr)
    '            con.Open()
    '            Using cmd As New SqlCommand("select * from tblSysEmail where ID=@ID", con)
    '                cmd.Parameters.AddWithValue("@ID", ID)
    '                Dim da As New SqlDataAdapter(cmd)
    '                Dim ds As New DataSet
    '                da.Fill(ds)
    '                For Each row In ds.Tables(0).Rows
    '                    u.ID = row("ID")
    '                    u.Email = row("Email")
    '                    u.WebLogin = row("WebLogin")
    '                    'u.InvoiceCreate = row("InvoiceCreate")
    '                    u.Errors = row("Errors")
    '                    u.LabelNotification = row("LabelNotification")
    '                    u.XmlNotification = row("XmlNotification")
    '                Next
    '            End Using
    '        End Using
    '        Return u
    '    Catch ex As Exception
    '        ErrorLogs.LogException(ex, "Error in GetErrorsById")
    '        Return Nothing
    '    End Try
    'End Function

    Shared Function ToggleErrors(ID As Integer, IsErrors As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblSysEmail set Errors=@Errors where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@Errors", IsErrors)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Dim Action As String
            Dim LoginUserDetails As New User
            If (IsErrors = True) Then
                Action = "Activated Error Notification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            Else
                Action = "Deactivated Error Notification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            End If
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "ToggleErrors", Action, ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleErrors")
        End Try
        Return "invalid"
    End Function

    Shared Function ToggleLabelNotification(ID As Integer, IsLabelNotification As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblSysEmail set LabelNotification=@IsLabelNotification where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@IsLabelNotification", IsLabelNotification)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Dim Action As String
            Dim LoginUserDetails As New User
            If (IsLabelNotification = True) Then
                Action = "Activated LabelNotification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            Else
                Action = "Deactivated LabelNotification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            End If
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "ToggleLabelNotification", Action, ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleLabelNotification")
        End Try
        Return "invalid"
    End Function

    Shared Function ToggleEodReports(ID As Integer, IsEodReports As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblSysEmail set EodReports=@IsEodReports where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@IsEodReports", IsEodReports)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Dim Action As String
            Dim LoginUserDetails As New User
            If (IsEodReports = True) Then
                Action = "Activated End Of Day Reports for <b>" + GetSystemEmailById(ID).Email + "</b>"
            Else
                Action = "Deactivated End Of Day Reports for <b>" + GetSystemEmailById(ID).Email + "</b>"
            End If
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "ToggleEodReports", Action, ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleLabelNotification")
        End Try
        Return "invalid"
    End Function

    Shared Function ToggleXmlNotification(ID As Integer, XmlNotification As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblSysEmail set XmlNotification=@XmlNotification where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@XmlNotification", XmlNotification)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Dim Action As String
            Dim LoginUserDetails As New User
            If (XmlNotification = True) Then
                Action = "Activated XmlNotification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            Else
                Action = "Deactivated XmlNotification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            End If
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "ToggleXmlNotification", Action, ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleXmlNotification")
        End Try
        Return "invalid"
    End Function

    Shared Function ToggleARXmlNotification(ID As Integer, ARXmlNotification As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblSysEmail set ARXmlNotification=@ARXmlNotification where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@ARXmlNotification", ARXmlNotification)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Dim Action As String
            Dim LoginUserDetails As New User
            If (ARXmlNotification = True) Then
                Action = "Activated ARXmlNotification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            Else
                Action = "Deactivated ARXmlNotification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            End If
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "ToggleARXmlNotification", Action, ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleARXmlNotification")
        End Try
        Return "invalid"
    End Function

    Shared Function ToggleShipLabelNotification(ID As Integer, IsShipLabelNotification As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblSysEmail set ShippingLabelNotification=@IsShipLabelNotification where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@IsShipLabelNotification", IsShipLabelNotification)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Dim Action As String
            Dim LoginUserDetails As New User
            If (IsShipLabelNotification = True) Then
                Action = "Activated ShippingLabelNotification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            Else
                Action = "Deactivated ShippingLabelNotification for <b>" + GetSystemEmailById(ID).Email + "</b>"
            End If
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Email Notification", "ToggleShippingLabelNotification", Action, ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleShippingLabelNotification")
        End Try
        Return "invalid"
    End Function

    Public Class GetSystemEmailDetails
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetSystemEmailForUser(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of Emails)

            Dim uList As New List(Of Emails)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetUserEmail", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Emails()
                            u.ID = row("ID")
                            u.Email = row("Email")
                            u.WebLogin = IIf(row("WebLogin") Is DBNull.Value, False, row("WebLogin"))
                            'u.InvoiceCreate = row("InvoiceCreate")
                            u.Errors = IIf(row("Errors") Is DBNull.Value, False, row("Errors"))
                            u.LabelNotification = IIf(row("LabelNotification") Is DBNull.Value, False, row("LabelNotification"))
                            u.XmlNotification = IIf(row("XmlNotification") Is DBNull.Value, False, row("XmlNotification"))
                            u.ARXmlNotification = IIf(row("ARXmlNotification") Is DBNull.Value, False, row("ARXmlNotification"))
                            u.ShippingLabelNotification = IIf(row("ShippingLabelNotification") Is DBNull.Value, False, row("ShippingLabelNotification"))
                            u.EodReports = IIf(row("EodReports") Is DBNull.Value, False, row("EodReports"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using

                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetSystemEmailForUser")
                Return Nothing
            End Try
            Return uList
        End Function
    End Class
End Class


Public Class Emails

    Private _ID As String
    Public Property ID() As String
        Get
            Return _ID
        End Get
        Set(value As String)
            _ID = value

        End Set
    End Property


    Private _Email As String
    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(value As String)
            _Email = value

        End Set
    End Property

    Private _WebLogin As Boolean
    Public Property WebLogin() As Boolean
        Get
            Return _WebLogin
        End Get
        Set(value As Boolean)
            _WebLogin = value

        End Set
    End Property


    Private _InvoiceCreate As Boolean
    Public Property InvoiceCreate() As Boolean
        Get
            Return _InvoiceCreate
        End Get
        Set(value As Boolean)
            _InvoiceCreate = value

        End Set
    End Property


    Private _Errors As Boolean
    Public Property Errors() As Boolean
        Get
            Return _Errors
        End Get
        Set(value As Boolean)
            _Errors = value

        End Set
    End Property

    Private _LabelNotification As Boolean
    Public Property LabelNotification() As Boolean
        Get
            Return _LabelNotification
        End Get
        Set(value As Boolean)
            _LabelNotification = value

        End Set
    End Property


    Private _XmlNotification As Boolean
    Public Property XmlNotification() As Boolean
        Get
            Return _XmlNotification
        End Get
        Set(value As Boolean)
            _XmlNotification = value

        End Set
    End Property


    Private _ARXmlNotification As Boolean
    Public Property ARXmlNotification() As Boolean
        Get
            Return _ARXmlNotification
        End Get
        Set(value As Boolean)
            _ARXmlNotification = value
        End Set
    End Property

    Private _ShippingLabelNotification As Boolean
    Public Property ShippingLabelNotification() As Boolean
        Get
            Return _ShippingLabelNotification
        End Get
        Set(value As Boolean)
            _ShippingLabelNotification = value
        End Set
    End Property

    Private _EodReports As Boolean
    Public Property EodReports() As Boolean
        Get
            Return _EodReports
        End Get
        Set(value As Boolean)
            _EodReports = value
        End Set
    End Property

    Private _EmailIDs As String
    Public Property EmailIDs() As String
        Get
            Return _EmailIDs
        End Get
        Set(value As String)
            _EmailIDs = value
        End Set
    End Property

    Private _CustName As String
    Public Property CustName() As String
        Get
            Return _CustName
        End Get
        Set(value As String)
            _CustName = value
        End Set
    End Property

    Private _UserEmail As String
    Public Property UserEmail() As String
        Get
            Return _UserEmail
        End Get
        Set(value As String)
            _UserEmail = value
        End Set
    End Property

    Private _Subject As String
    Public Property Subject() As String
        Get
            Return _Subject
        End Get
        Set(value As String)
            _Subject = value
        End Set
    End Property

    Private _FileName As String
    Public Property FileName() As String
        Get
            Return _FileName
        End Get
        Set(value As String)
            _FileName = value
        End Set
    End Property

    Private _DocumentType As String
    Public Property DocumentType() As String
        Get
            Return _DocumentType
        End Get
        Set(value As String)
            _DocumentType = value
        End Set
    End Property

    Private _DocumentNum As String
    Public Property DocumentNum() As String
        Get
            Return _DocumentNum
        End Get
        Set(value As String)
            _DocumentNum = value
        End Set
    End Property

    Private _DocumentConsignee As String
    Public Property DocumentConsignee() As String
        Get
            Return _DocumentConsignee
        End Get
        Set(value As String)
            _DocumentConsignee = value
        End Set
    End Property

End Class
