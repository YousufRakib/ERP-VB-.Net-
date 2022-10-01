Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO

Public Class WebPermissions
    Public Class GetWebPermissionDetails
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetWebPermissions(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, _
                                         ByVal numberOfRows As Integer) As List(Of WebPermission)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of WebPermission)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetWebPermissionDetails]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New WebPermission()
                            u.PageID = row("ID")
                            u.Name = row("Name")
                            u.Page = row("Page")
                            u.IsAdmin = row("ISAdmin")
                            u.IsActive = row("ISActive")
                            u.UserTypes = row("UserType")
                            u.UserTypeIDs = row("UserTypeID")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetWebPermissions")
                Return Nothing
            End Try
        End Function
    End Class

    Public Shared Function GetWebPermissionforUserType(ByVal UserType As String) As List(Of WebPermission)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of WebPermission)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim Qry As String = ""
                If UserType = "Admin" Then
                    Qry = "select * from tblWebPermission where  ISAdmin=1 And ISActive=1 And Page not in ('DynamicGrid','WebPermission','Features','')"
                Else
                    Qry = "select * from tblWebPermission where ISAdmin=0 And ISActive=1 And Page not in ('DynamicGrid','WebPermission','Features','')"
                End If
                Using cmd As New SqlCommand(Qry, con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New WebPermission
                        u.PageID = row("ID")
                        u.Name = row("Name")
                        u.Page = row("Page")
                        u.IsAdmin = IIf(row("ISAdmin") Is DBNull.Value, "0", row("ISAdmin"))
                        u.IsActive = IIf(row("ISActive") Is DBNull.Value, "0", row("ISActive"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetWebPermissionforUserType")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetPermissionforUserID(ByVal UserID As Integer) As List(Of WebPermission)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of WebPermission)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblUserPermission where UserID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", UserID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New WebPermission
                        u.PageID = row("PageID")
                        u.UserID = row("UserID")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPermissionforUserID")
            Return Nothing
        End Try
    End Function

    Public Shared Function SaveWebPermissionDetails(ByVal PermissionName As String, ByVal Page As String, ByVal UserTypeList As String, ByVal IsAdmin As Boolean, ByVal IsActive As Boolean) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spSaveWebPermissionDetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Name", PermissionName))
                    cmd.Parameters.Add(New SqlParameter("@Page", Page))
                    cmd.Parameters.Add(New SqlParameter("@UserTypeList", UserTypeList))
                    cmd.Parameters.Add(New SqlParameter("@IsAdmin", IsAdmin))
                    cmd.Parameters.Add(New SqlParameter("@IsActive", IsActive))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveWebPermissionDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function UpdateWebPermissionDetails(ByVal PermissionName As String, ByVal Page As String, ByVal UserTypeList As String, ByVal IsAdmin As Boolean, ByVal IsActive As Boolean, ByVal PageID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spUpdateWebPermissionDetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Name", PermissionName))
                    cmd.Parameters.Add(New SqlParameter("@Page", Page))
                    cmd.Parameters.Add(New SqlParameter("@UserTypeList", UserTypeList))
                    cmd.Parameters.Add(New SqlParameter("@IsAdmin", IsAdmin))
                    cmd.Parameters.Add(New SqlParameter("@IsActive", IsActive))
                    cmd.Parameters.Add(New SqlParameter("@PageID", PageID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateWebPermissionDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function DeleteWebPermissionDetails(ByVal PageID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spDeleteWebPermissionDetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@PageID", PageID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteWebPermissionDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetWebPermissionforPageID(ByVal PageID As Integer) As WebPermission
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New WebPermission
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwGetWebPermissionDetails where ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", PageID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.PageID = row("ID")
                        u.Name = row("Name")
                        u.Page = row("Page")
                        u.IsAdmin = IIf(row("ISAdmin") Is DBNull.Value, "0", row("ISAdmin"))
                        u.IsActive = IIf(row("ISActive") Is DBNull.Value, "0", row("ISActive"))
                        u.UserTypeIDs = row("UserTypeID")
                        u.UserTypes = row("UserType")
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetWebPermissionforPageID")
            Return Nothing
        End Try
    End Function

End Class

Public Class WebPermission

    Private _PageID As Integer
    Public Property PageID() As Integer
        Get
            Return _PageID
        End Get
        Set(ByVal value As Integer)
            _PageID = value
        End Set
    End Property

    Private _UserID As Integer
    Public Property UserID() As Integer
        Get
            Return _UserID
        End Get
        Set(ByVal value As Integer)
            _UserID = value
        End Set
    End Property

    Private _Page As String
    Public Property Page() As String
        Get
            Return _Page
        End Get
        Set(value As String)
            _Page = value
        End Set
    End Property

    Private _Name As String
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(value As String)
            _Name = value
        End Set
    End Property

    Private _IsAdmin As Boolean
    Public Property IsAdmin As Boolean
        Get
            Return _IsAdmin
        End Get
        Set(value As Boolean)
            _IsAdmin = value
        End Set
    End Property

    Private _IsActive As Boolean
    Public Property IsActive As Boolean
        Get
            Return _IsActive
        End Get
        Set(value As Boolean)
            _IsActive = value
        End Set
    End Property

    Private _UserTypes As String
    Public Property UserTypes() As String
        Get
            Return _UserTypes
        End Get
        Set(value As String)
            _UserTypes = value
        End Set
    End Property

    Private _UserTypeIDs As String
    Public Property UserTypeIDs() As String
        Get
            Return _UserTypeIDs
        End Get
        Set(value As String)
            _UserTypeIDs = value
        End Set
    End Property

    Private _UserDetails As New User
    Public Property UserDetails As User
        Get
            Return _UserDetails
        End Get
        Set(value As User)
            _UserDetails = value
        End Set
    End Property

    Private _Landing As String
    Public Property Landing() As String
        Get
            Return _Landing
        End Get
        Set(ByVal value As String)
            _Landing = value
        End Set
    End Property
End Class
