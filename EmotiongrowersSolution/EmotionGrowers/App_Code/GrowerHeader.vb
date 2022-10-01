Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Xml

Public Class GrowerHeaders


    ''' <summary>
    ''' 30-MAY-2016::Save and update Grower Header
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function SaveGrowerHeader(ByVal ID As String, ByVal HeaderFromDate As String, ByVal HeaderToDate As String, ByVal ReportName As String, ByVal ReportNumber As String,
                                            ByVal UserID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""

                Using cmd As New SqlCommand("[spSaveGrowerHeader]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@ID", ID))
                    cmd.Parameters.Add(New SqlParameter("@HeaderFromDate", HeaderFromDate))
                    cmd.Parameters.Add(New SqlParameter("@HeaderToDate", HeaderToDate))
                    cmd.Parameters.Add(New SqlParameter("@ReportName", ReportName))
                    cmd.Parameters.Add(New SqlParameter("@ReportNumber", ReportNumber))
                    cmd.Parameters.Add(New SqlParameter("@UserID", UserID))
                    cmd.CommandTimeout = 0
                    Dim result As Integer = cmd.ExecuteScalar()
                    'For Update log
                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        If ID = 0 Then
                            Logs.Savelog(UserID, "Grower", "SaveGrowerHeader", "Added New Grower Report - " + ReportName + " [" + ReportNumber + "]", "Report - " + ReportName + " [" + ReportNumber + "]")
                        Else
                            Logs.Savelog(UserID, "Grower", "SaveGrowerHeader", "Modified Grower Report - " + ReportName + " [" + ReportNumber + "]", "Report - " + ReportName + " [" + ReportNumber + "]")
                        End If
                    End If
                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveGrowerHeader")
            Return "error"
        End Try

    End Function


    Public Shared Function SaveGrowerDetailByHeaderID(ByVal HeaderID As String, ByVal UserID As String, ByVal DetailsList As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("[spSaveGrowerDetailByHeaderID]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                    cmd.Parameters.Add(New SqlParameter("@UserID", UserID))
                    cmd.Parameters.Add(New SqlParameter("@DetailsList", DetailsList))
                    Dim result As Integer = cmd.ExecuteScalar()
                    Return result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveGrowerDetailByHeaderID")
            Return "error"
        End Try

    End Function

    Public Shared Function UpdateFBEForGrowerDetails(ByVal HeaderID As String, ByVal Farm As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("[spUpdateFBEForGrowerDetail]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.CommandTimeout = 180
                    cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateFBEForGrowerDetails")
            Return "error"
        End Try

    End Function

    Public Shared Function InsertGrowerNotesFromCredits(ByVal HeaderID As String, ByVal UserID As Integer, ByVal Farm As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("[spInsertGrowerNotesFromCredits]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                    cmd.Parameters.Add(New SqlParameter("@UserID", UserID))
                    cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateFBEForGrowerDetails")
            Return "error"
        End Try
        Return Nothing
    End Function



    ''' <summary>
    ''' MANI::30-MAY-2016::to get the GrowerHeader by ID
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetGrowerHeaderById(ByVal ID As String) As GrowerHeader
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim G As New GrowerHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblGrowerHeader where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@ID", ID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        G.ID = row("ID")
                        G.GrowerFromDate = Convert.ToString(row("GrowerFromDate"))
                        G.GrowerToDate = Convert.ToString(row("GrowerToDate"))
                        G.ReportName = row("ReportName")
                        G.ReportNumber = row("ReportNumber")
                    Next
                End Using

            End Using
            Return G
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetGrowerHeaderById")
            Return Nothing
        End Try
    End Function


    ''' <summary>
    ''' Abinaya::11-JULY-2016::to delete the GrowerHeader by ID
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeleteGrowerHeaderWithDetailsById(ByVal ID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim GrList As GrowerHeader = GrowerHeaders.GetGrowerHeaderById(ID)
            Using con As New SqlConnection(ConStr)
                con.Open()

                Using cmd As New SqlCommand("Update tblGrowerHeader Set IsActive=0 where ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.CommandType = CommandType.Text
                    cmd.ExecuteNonQuery()
                End Using

                'Using cmd As New SqlCommand("spDeleteGrowerHeaderWithDetails", con)
                '    cmd.Parameters.AddWithValue("@ID", ID)
                '    cmd.CommandType = CommandType.StoredProcedure
                '    cmd.ExecuteNonQuery()
                'End Using
                con.Close()
            End Using

            'For Update log
            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                Logs.Savelog(loginuserdetails.ID, "Grower", "DeleteGrowerHeaderWithDetailsById", "Deleted Grower Report . Report#" + GrList.ReportNumber + " ReportName " + GrList.ReportName + "", ID)
                ' End If
            End If

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteGrowerHeaderWithDetailsById")
            Return Nothing
        End Try



    End Function

    Public Shared Function ChangeGrowerLockStatusForUser(ByVal IsLocked As String, ByVal HeaderID As String, ByVal UserID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("[spChangeGrowerLockStatus]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@IsLocked", IsLocked))
                    cmd.Parameters.Add(New SqlParameter("@UserID", UserID))
                    cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Return dt.Rows(0)(0).ToString()
                    End If
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ChangeGrowerLockStatusForUser")
            Return "error"
        End Try
        Return Nothing
    End Function


    Public Shared Function CheckGrowerReportIsAlreadyLocked(ByVal HeaderID As String, ByVal UserID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                Using cmd As New SqlCommand("select isnull(Name,'') from tblGrowerHeader G left join tblusers u on u.ID=G.LockedUserID where G.ID=@HeaderID And G.Islocked=1 And G.LockedUserID <>@UserID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@UserID", UserID))
                    cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Return "This report is locked by <b>" + dt.Rows(0)(0).ToString() + "</b>"
                    End If
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckGrowerReportIsAlreadyLocked")
            Return "error"
        End Try
        Return Nothing
    End Function

    Public Shared Function GetGrowerReportMailContent() As List(Of GrowerHeader)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim GList As New List(Of GrowerHeader)


            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sql As String = ""
                sql = "select * from tblCredentialEmailContent where ContentType='GrowerReportEmailContent'"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim G As New GrowerHeader
                        G.GrowerMailContent = IIf(row("Content") Is DBNull.Value, "", row("Content"))
                        GList.Add(G)
                    Next
                End Using
            End Using

            Return GList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetGrowerReportMailContent")
            Return Nothing
        End Try
    End Function

    Public Class GetGrowerHeaderFgrd

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetGrowerHeaderForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of GrowerHeader)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of GrowerHeader)()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginAdminDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetGrowerHeader]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)

                        For Each row In ds.Tables(0).Rows
                            Dim u As New GrowerHeader()
                            u.ID = row("ID")
                            u.GrowerFromDate = Convert.ToDateTime(row("GrowerFromDate")).ToString("yyyy-MM-dd")
                            u.GrowerToDate = Convert.ToDateTime(row("GrowerToDate")).ToString("yyyy-MM-dd")
                            u.ReportName = Convert.ToString(row("ReportName"))
                            u.ReportNumber = Convert.ToString(row("ReportNumber"))
                            u.IsActive = Convert.ToBoolean(row("IsActive"))
                            u.Islocked = Convert.ToBoolean(row("Islocked"))
                            u.GrowerLockContent = GrowerHeaders.CheckGrowerReportIsAlreadyLocked(u.ID, UserDetails.ID)
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGrowerHeaderForFgrd")
                Throw ex
            End Try
        End Function
    End Class

End Class


Public Class GrowerHeader


    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Private _GrowerFromDate As DateTime
    Public Property GrowerFromDate() As DateTime
        Get
            Return _GrowerFromDate
        End Get
        Set(ByVal value As DateTime)
            _GrowerFromDate = value
        End Set
    End Property

    Private _GrowerToDate As DateTime
    Public Property GrowerToDate() As DateTime
        Get
            Return _GrowerToDate
        End Get
        Set(ByVal value As DateTime)
            _GrowerToDate = value
        End Set
    End Property

    Private _ReportName As String
    Public Property ReportName() As String
        Get
            Return _ReportName
        End Get
        Set(ByVal value As String)
            _ReportName = value
        End Set
    End Property

    Private _ReportNumber As String
    Public Property ReportNumber() As String
        Get
            Return _ReportNumber
        End Get
        Set(ByVal value As String)
            _ReportNumber = value
        End Set
    End Property

    Private _IsActive As Boolean
    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

    Private _Islocked As Boolean
    Public Property Islocked() As Boolean
        Get
            Return _Islocked
        End Get
        Set(ByVal value As Boolean)
            _Islocked = value
        End Set
    End Property



    Private _GrowerMailContent As String
    Public Property GrowerMailContent() As String
        Get
            Return _GrowerMailContent
        End Get
        Set(ByVal value As String)
            _GrowerMailContent = value
        End Set
    End Property

    Private _GrowerLockContent As String
    Public Property GrowerLockContent() As String
        Get
            Return _GrowerLockContent
        End Get
        Set(ByVal value As String)
            _GrowerLockContent = value
        End Set
    End Property

End Class
