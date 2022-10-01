Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Text
Imports System.Collections
Imports System.IO
Imports System.Data.SqlClient
Imports System.Data

Public Class SalesmanCode

    Private _TotalRows As Integer
    Public Property TotalRows() As Integer
        Get
            Return _TotalRows
        End Get
        Set(ByVal value As Integer)
            _TotalRows = value
        End Set
    End Property

    Public Function GetSalesmanForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of SalesMan)

        Dim uList As New List(Of SalesMan)()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetSalesman]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                    cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                    cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New SalesMan()
                        u.ID = row("ID")
                        u.SalesMan = row("SALESMAN")
                        u.Name = row("NAME")
                        u.Email = row("EMAIL")
                        u.Selected = False
                        uList.Add(u)
                    Next
                    Me.TotalRows = ds.Tables(1).Rows(0)(0)
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesmanForFgrd")
            Return Nothing
        End Try
        Return uList
    End Function

    Public Shared Function GetSalesManList() As List(Of SalesMan)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of SalesMan)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from F_slsman order by NAME", con)
                    Using SalesManDR As SqlDataReader = cmd.ExecuteReader()
                        If SalesManDR.HasRows Then
                            While SalesManDR.Read
                                Dim u As New SalesMan
                                u.ID = SalesManDR("ID")
                                u.SalesMan = SalesManDR("SALESMAN")
                                u.Name = SalesManDR("NAME")
                                u.ColorCode = SalesManDR("COLORCODE")
                                ulist.Add(u)
                            End While
                        End If
                    End Using
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesManList")
            Return Nothing
        End Try
    End Function
   
    Public Shared Function GetSalesManCodeList() As List(Of SalesMan)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of SalesMan)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  ID, SALESMAN, Name, ColorCode from F_SLSMAN where SALESMAN<>'' order by SALESMAN", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New SalesMan
                        u.ID = row("ID")
                        u.SalesMan = row("SALESMAN")
                        u.Name = row("NAME")
                        u.ColorCode = row("COLORCODE")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesManCodeList")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetSalesManByCode(ByVal SalesMan As String) As SalesMan
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New SalesMan
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from F_slsman where SALESMAN=@SalesMan", con)
                    cmd.Parameters.AddWithValue("@SalesMan", SalesMan)
                    cmd.CommandType = CommandType.Text
                    Using SalesManDR As SqlDataReader = cmd.ExecuteReader()
                        If (SalesManDR.HasRows) Then
                            While (SalesManDR.Read())
                                u.ID = SalesManDR("ID")
                                u.Name = SalesManDR("NAME")
                                u.SalesMan = SalesManDR("SALESMAN")
                                u.ColorCode = SalesManDR("COLORCODE")
                            End While
                        End If
                    End Using
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesManByCode")
            Return Nothing
        End Try
    End Function

    Public Shared Function InsertSalesMan(ByVal SALESMAN As String, ByVal NAME As String, ByVal EMAIL As String, ByVal COLORCODE As Int16, ByVal PRODUCTS As String) As String
        Try
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim SalesManScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_SLSMANInsert", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@SALESMAN", SALESMAN)
            Cmd.Parameters.AddWithValue("@NAME", NAME)
            Cmd.Parameters.AddWithValue("@EMAIL", EMAIL)
            Cmd.Parameters.AddWithValue("@COLORCODE", COLORCODE)
            Cmd.Parameters.AddWithValue("@PRODUCTS", PRODUCTS)
            Cmd.Parameters.AddWithValue("@ADDUSER", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "SaveSalesManDetails", "Added a new SalesMan <b>" + NAME + "</b>", SalesManScopeID.ToString())
            End If
            Return SalesManScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in SaveSalesManDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function GetSalesManByID(ByVal ID As String) As SalesMan
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New SalesMan
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from F_SLSMAN where ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.CommandType = CommandType.Text
                    Using SalesManDR As SqlDataReader = cmd.ExecuteReader()
                        If SalesManDR.HasRows Then
                            While SalesManDR.Read()
                                u.ID = SalesManDR("ID")
                                u.Name = SalesManDR("NAME")
                                u.SalesMan = SalesManDR("SALESMAN")
                                u.ColorCode = SalesManDR("COLORCODE")
                                u.Email = SalesManDR("EMAIL")
                                u.Products = SalesManDR("PRODUCTS").ToString()
                            End While
                        End If
                    End Using
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesManByID")
            Return Nothing
        End Try
    End Function

    Public Shared Function DeleteSalesManbyID(ByVal ID As String) As String
        Try
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UPDATE H SET H.TYPE='Deleted', H.SALESMAN=A.SALESMAN,H.NAME=A.NAME,H.ADDUSER=@AddUser,H.ADDDATE=FORMAT(GETDATE(),'MM/dd/yyyy'),H.ADDTIME=FORMAT(GETDATE(),'HH:mm:ss'),H.ADDAPP='WEB' FROM F_SLSHST H LEFT JOIN F_SLSMAN A ON H.SALESMAN=A.SALESMAN WHERE A.ID=@ID   DELETE FROM F_SLSMAN WHERE ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.Parameters.AddWithValue("@AddUser", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(1, 20), UserDetails.Name))
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteSalesManbyID")
            Return "error"
        End Try
    End Function

    Public Shared Function UpdateSalesMan(ByVal ID As Integer, ByVal SALESMAN As String, ByVal NAME As String, ByVal EMAIL As String, ByVal COLORCODE As Int16, ByVal PRODUCTS As String) As String
        Try
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim SalesManScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_SALESMANUpdate", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@ID", ID)
            Cmd.Parameters.AddWithValue("@SALESMAN", SALESMAN)
            Cmd.Parameters.AddWithValue("@NAME", NAME)
            Cmd.Parameters.AddWithValue("@EMAIL", EMAIL)
            Cmd.Parameters.AddWithValue("@COLORCODE", COLORCODE)
            Cmd.Parameters.AddWithValue("@PRODUCTS", PRODUCTS)
            Cmd.Parameters.AddWithValue("@UPDUSER", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(1, 20), UserDetails.Name))
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "UpdateSalesManDetails", "Added a new SalesMan <b>" + NAME + "</b>", SalesManScopeID.ToString())
            End If
            Return SalesManScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in UpdateSalesManDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function
#Region "Standing/Prebooks Reports ( Reports for F8 )"
    Public Shared Function GetSalesManListAutoComplete(ByVal Slsman As String) As List(Of SalesMan)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of SalesMan)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetSalesManListAutoComplete", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Slsman", Slsman)
                    Using SalesManDR As SqlDataReader = cmd.ExecuteReader()
                        If SalesManDR.HasRows Then
                            While SalesManDR.Read
                                Dim u As New SalesMan
                                u.ID = SalesManDR("ID")
                                u.SalesMan = SalesManDR("SALESMAN")
                                u.Name = SalesManDR("NAME")
                                u.ColorCode = SalesManDR("COLORCODE")
                                ulist.Add(u)
                            End While
                        End If
                    End Using
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesManListAutoComplete")
            Return Nothing
        End Try
    End Function
#End Region
End Class


Public Class SalesMan
    Private _ID As String
    Public Property ID() As String
        Get
            Return _ID
        End Get
        Set(value As String)
            _ID = value
        End Set
    End Property

    Private _SalesMan As String
    Public Property SalesMan() As String
        Get
            Return _SalesMan
        End Get
        Set(value As String)
            _SalesMan = value
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

    Private _Email As String
    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(value As String)
            _Email = value
        End Set
    End Property

    Private _Products As String
    Public Property Products() As String
        Get
            Return _Products
        End Get
        Set(value As String)
            _Products = value
        End Set
    End Property

    Private _ColorCode As String
    Public Property ColorCode() As String
        Get
            Return _ColorCode
        End Get
        Set(value As String)
            _ColorCode = value
        End Set
    End Property

    Private _Selected As String
    Public Property Selected() As String
        Get
            Return _Selected
        End Get
        Set(ByVal value As String)
            _Selected = value
        End Set
    End Property
End Class

