Imports System.Data.SqlClient
Imports System.Data


Public Class Warehouse

    Private _WarehouseID As Integer
    Public Property WarehouseID() As Integer
        Get
            Return _WarehouseID
        End Get
        Set(ByVal value As Integer)
            _WarehouseID = value
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

    Private _WH As String
    Public Property WH() As String
        Get
            Return _WH
        End Get
        Set(ByVal value As String)
            _WH = value
        End Set
    End Property

    Private _Name As String
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(ByVal value As String)
            _Name = value
        End Set
    End Property

    Private _City As String
    Public Property City() As String
        Get
            Return _City
        End Get
        Set(ByVal value As String)
            _City = value
        End Set
    End Property

    Private _Address As String
    Public Property Address() As String
        Get
            Return _Address
        End Get
        Set(ByVal value As String)
            _Address = value
        End Set
    End Property

    Private _Picking As String
    Public Property Picking() As String
        Get
            Return _Picking
        End Get
        Set(ByVal value As String)
            _Picking = value
        End Set
    End Property

    Private _Invoice As String
    Public Property Invoice() As String
        Get
            Return _Invoice
        End Get
        Set(ByVal value As String)
            _Invoice = value
        End Set
    End Property

    Private _ShipLabel As String
    Public Property ShipLabel() As String
        Get
            Return _ShipLabel
        End Get
        Set(ByVal value As String)
            _ShipLabel = value
        End Set
    End Property

    Private _INVlabel As String
    Public Property INVlabel() As String
        Get
            Return _INVlabel
        End Get
        Set(ByVal value As String)
            _INVlabel = value
        End Set
    End Property


    Private _Default As String
    Public Property WhDefault() As String
        Get
            Return _Default
        End Get
        Set(ByVal value As String)
            _Default = value
        End Set
    End Property

    Private _AWB As String
    Public Property AWB() As String
        Get
            Return _AWB
        End Get
        Set(ByVal value As String)
            _AWB = value
        End Set
    End Property

    Private _ShippingBI As String
    Public Property ShippingBI() As String
        Get
            Return _ShippingBI
        End Get
        Set(ByVal value As String)
            _ShippingBI = value
        End Set
    End Property

    Private _Email As String
    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(ByVal value As String)
            _Email = value
        End Set
    End Property

    Private _Handling As String
    Public Property Handling() As String
        Get
            Return _Handling
        End Get
        Set(ByVal value As String)
            _Handling = value
        End Set
    End Property

    Private _AIRPORT As String
    Public Property AIRPORT() As String
        Get
            Return _AIRPORT
        End Get
        Set(ByVal value As String)
            _AIRPORT = value
        End Set
    End Property

    Private _FREIGHT As Double
    Public Property FREIGHT() As Double
        Get
            Return _FREIGHT
        End Get
        Set(ByVal value As Double)
            _FREIGHT = value
        End Set
    End Property

    Private _ID As Double
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property
End Class

Public Class WarehouseHandling

    Private _WHHandlingChargeId As Integer
    Public Property WHHandlingChargeId() As Integer
        Get
            Return _WHHandlingChargeId
        End Get
        Set(ByVal value As Integer)
            _WHHandlingChargeId = value
        End Set
    End Property
    Private _WarehouseId As String
    Public Property WarehouseId() As String
        Get
            Return _WarehouseId
        End Get
        Set(ByVal value As String)
            _WarehouseId = value
        End Set
    End Property
    Private _Warehouse As String
    Public Property Warehouse() As String
        Get
            Return _Warehouse
        End Get
        Set(ByVal value As String)
            _Warehouse = value
        End Set
    End Property

    Private _UOM As String
    Public Property UOM() As String
        Get
            Return _UOM
        End Get
        Set(ByVal value As String)
            _UOM = value
        End Set
    End Property

    Private _Description As String
    Public Property Description() As String
        Get
            Return _Description
        End Get
        Set(ByVal value As String)
            _Description = value
        End Set
    End Property

    Private _Handling As Decimal
    Public Property Handling() As Decimal
        Get
            Return _Handling
        End Get
        Set(ByVal value As Decimal)
            _Handling = value
        End Set
    End Property
End Class

Public Class Warehouses
    ''' <summary>
    ''' STA::23-OCT-2015::to get the list of warehouse 
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetWarehouseList() As List(Of Warehouse)

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Warehouse)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from tblWarehouse order by Name", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Warehouse
                        u.WarehouseID = row("id")
                        u.WH = row("WH")
                        u.Name = row("Name")
                        u.City = Convert.ToString(row("city"))
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetWarehouseList")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetWarehouseListByUser(ByVal UserId As Integer) As List(Of Warehouse)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Warehouse)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetUserwiseWarehouse", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@UserID", UserId.ToString())
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Warehouse
                        u.WarehouseID = row("id")
                        u.WH = row("WH")
                        u.Name = row("Name")
                        u.City = Convert.ToString(row("city"))
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetWarehouseListByUser")
            Return Nothing
        End Try
    End Function

    ' <summary>
    'STA::24-OCT-2015::to import the warehouse from dbf file
    ' </summary>
    ' <param name="WHlist"></param>
    ' <returns></returns>
    ' <remarks></remarks>
    Public Shared Function ImportWarehouse(ByVal WHlist As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("SpImportWarehouseFarms", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@WarehouseList", WHlist.ToString())
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ImportWarehouse")
            Return Nothing
        End Try
        Return ""
    End Function


    Public Shared Function InsertWarehouse(ByVal WH As String, ByVal Name As String, ByVal Address As String, ByVal City As String, ByVal Picking As String,
    ByVal Invoice As String, ByVal ShipLabel As String, ByVal INVLabel As String, ByVal Email As String, ByVal Handling As String) As String
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

            Dim ValidateWHCode As Integer = 0
            Dim CmdValidate As New SqlCommand("sp_validateWarehousecode", SqlCon)
            CmdValidate.CommandType = CommandType.StoredProcedure
            CmdValidate.Parameters.AddWithValue("@WH", WH)
            ValidateWHCode = CmdValidate.ExecuteScalar()
            If ValidateWHCode > 0 Then
                CmdValidate.Dispose()
                SqlCon.Close()
                SqlCon.Dispose()
                Return "UNIQUE KEY constraint".ToString()
            End If

            Dim WarehouseScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_tblWarehouseInsert", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure

            Cmd.Parameters.AddWithValue("@WH", WH)
            Cmd.Parameters.AddWithValue("@Name", Name)
            Cmd.Parameters.AddWithValue("@Address", Address)
            Cmd.Parameters.AddWithValue("@City", City)
            Cmd.Parameters.AddWithValue("@Picking", Picking)
            Cmd.Parameters.AddWithValue("@Invoice", Invoice)
            Cmd.Parameters.AddWithValue("@ShipLabel", ShipLabel)
            Cmd.Parameters.AddWithValue("@INVLabel", INVLabel)
            Cmd.Parameters.AddWithValue("@Email", Email)
            Cmd.Parameters.AddWithValue("@Handling", Handling)
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "SaveWarehouseDetails", "Added a new Warehouse <b>" + Name + "</b>", WarehouseScopeID.ToString())
            End If
            Return WarehouseScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in SaveWarehouseDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function UpdateWarehouse(ByVal ID As Integer, ByVal WH As String, ByVal Name As String, ByVal Address As String, ByVal City As String, ByVal Picking As String,
    ByVal Invoice As String, ByVal ShipLabel As String, ByVal INVLabel As String, ByVal Email As String, ByVal Handling As String) As String
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

            Dim ValidateWHCode As Integer = 0
            Dim CmdValidate As New SqlCommand("sp_validateWarehousecodeUpdate", SqlCon)
            CmdValidate.CommandType = CommandType.StoredProcedure
            CmdValidate.Parameters.AddWithValue("@ID", ID)
            CmdValidate.Parameters.AddWithValue("@WH", WH)
            ValidateWHCode = CmdValidate.ExecuteScalar()
            If ValidateWHCode > 0 Then
                CmdValidate.Dispose()
                SqlCon.Close()
                SqlCon.Dispose()
                Return "UNIQUE KEY constraint".ToString()
            End If

            Dim WarehouseScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_tblWarehouseUpdate", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@ID", ID)
            Cmd.Parameters.AddWithValue("@WH", WH)
            Cmd.Parameters.AddWithValue("@Name", Name)
            Cmd.Parameters.AddWithValue("@Address", Address)
            Cmd.Parameters.AddWithValue("@City", City)
            Cmd.Parameters.AddWithValue("@Picking", Picking)
            Cmd.Parameters.AddWithValue("@Invoice", Invoice)
            Cmd.Parameters.AddWithValue("@ShipLabel", ShipLabel)
            Cmd.Parameters.AddWithValue("@INVLabel", INVLabel)
            Cmd.Parameters.AddWithValue("@Email", Email)
            Cmd.Parameters.AddWithValue("@Handling", Handling)
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "UpdateWarehouseDetails", "Added a new Warehouse <b>" + Name + "</b>", WarehouseScopeID.ToString())
            End If
            Return WarehouseScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in UpdateWarehouseDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function GetWarehouseDetailByID(ByVal ID As String) As Warehouse

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New Warehouse
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from tblWarehouse where ID=@ID order by Name", con)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.WarehouseID = row("ID")
                        u.WH = row("WH")
                        u.Name = row("Name")
                        u.Address = Convert.ToString(row("Address"))
                        u.AWB = Convert.ToString(row("AWB"))
                        u.City = Convert.ToString(row("City"))
                        u.Picking = Convert.ToString(row("PICKING"))
                        u.Invoice = Convert.ToString(row("INVOICE"))
                        u.ShipLabel = Convert.ToString(row("ShipLabel"))
                        u.INVlabel = Convert.ToString(row("INVlabel"))
                        u.WhDefault = Convert.ToString(row("Default"))
                        u.ShippingBI = Convert.ToString(row("ShippingBI"))
                        u.Email = Convert.ToString(row("Email"))
                        u.Handling = Convert.ToString(row("handling"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetWarehouseDetailByID")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetWarehouseDetailByWarehouse(ByVal Warehouse As String) As Warehouse

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New Warehouse
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from tblWarehouse where WH=@Warehouse order by Name", con)
                    cmd.Parameters.AddWithValue("@Warehouse", Warehouse)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.WarehouseID = row("ID")
                        u.WH = row("WH")
                        u.Name = row("Name")
                        u.Address = Convert.ToString(row("Address"))
                        u.AWB = Convert.ToString(row("AWB"))
                        u.City = Convert.ToString(row("City"))
                        u.Picking = Convert.ToString(row("PICKING"))
                        u.Invoice = Convert.ToString(row("INVOICE"))
                        u.ShipLabel = Convert.ToString(row("ShipLabel"))
                        u.INVlabel = Convert.ToString(row("INVlabel"))
                        u.WhDefault = Convert.ToString(row("Default"))
                        u.ShippingBI = Convert.ToString(row("ShippingBI"))
                        u.Email = Convert.ToString(row("Email"))
                        u.Handling = Convert.ToString(row("handling"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetWarehouseDetailByID")
            Return Nothing
        End Try
    End Function

    Public Shared Function DeleteWarehousebyID(ByVal ID As String) As String
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
                Using cmd As New SqlCommand("DELETE FROM  tblWarehouse WHERE ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteWarehousebyID")
            Return "error"
        End Try
    End Function

    Public Class GetWarehouseDetails

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        ''' <summary>
        ''' STA::24-OCT-2015::get warehouse list for grid
        ''' </summary>
        ''' <param name="whereClause"></param>
        ''' <param name="sortExp"></param>
        ''' <param name="startRowIndex"></param>
        ''' <param name="numberOfRows"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Function GetWarehouseListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of Warehouse)

            Dim uList As New List(Of Warehouse)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetWarehouse]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Warehouse()
                            u.WarehouseID = row("ID")
                            u.WH = row("WH")
                            u.Name = row("Name")
                            u.Address = Convert.ToString(row("Address"))
                            u.AWB = Convert.ToString(row("AWB"))
                            u.City = Convert.ToString(row("CITY"))
                            u.Picking = Convert.ToString(row("PICKING"))
                            u.Invoice = Convert.ToString(row("INVOICE"))
                            u.ShipLabel = Convert.ToString(row("ShipLabel"))
                            u.INVlabel = Convert.ToString(row("INVlabel"))
                            u.WhDefault = Convert.ToString(row("Default"))
                            u.ShippingBI = Convert.ToString(row("ShippingBI"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetWarehouseListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function
    End Class
	
	Public Class WarehouseFreight

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property
        Public Function GetWarehouseFreightForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of Warehouse)
            Dim uList As New List(Of Warehouse)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spWarehouseFreight]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Warehouse()
                            u.ID = row("ID")
                            u.WH = row("WH")
                            u.AIRPORT = row("AIRPORT")
                            u.FREIGHT = row("FREIGHT")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetWarehouseFreightForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function
        Public Shared Function GetWarehouseFreightByID(ByVal ID As Integer) As Warehouse
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim u As New Warehouse
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SELECT  * FROM F_WAREHOUSEFREIGHT WHERE ID=@ID", con)
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.CommandType = CommandType.Text
                        Using WHDR As SqlDataReader = cmd.ExecuteReader()
                            If WHDR.HasRows Then
                                While WHDR.Read()
                                    u.ID = WHDR("ID")
                                    u.WH = WHDR("WH")
                                    u.AIRPORT = WHDR("AIRPORT")
                                    u.FREIGHT = WHDR("freight")
                                End While
                            End If
                        End Using
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetWarehouseByID")
                Return Nothing
            End Try
        End Function
        Public Shared Function InsertWarehouseFreight(ByVal WH As String, ByVal AIRPORT As String, ByVal FREIGHT As Double) As String
            Try
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim MsgStr As String = ""
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim Cmd As New SqlCommand("spInsertWarehouseFreight", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@WH", WH)
                Cmd.Parameters.AddWithValue("@AIRPORT", AIRPORT)
                Cmd.Parameters.AddWithValue("@FREIGHT", FREIGHT)
                Cmd.Parameters.AddWithValue("@ADDUSER", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
                MsgStr = Cmd.ExecuteScalar()
                Cmd.Dispose()
                SqlCon.Close()
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "SaveWarehouseFreightDetails", "Added a new Warehouse Freight <b>" + WH + " - " + AIRPORT + "</b>", WH + " - " + AIRPORT)
                End If
                Return MsgStr
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertWarehouseFreight")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function UpdateWarehouseFreight(ByVal ID As String, ByVal WH As String, ByVal AIRPORT As String, ByVal FREIGHT As Double) As String
            Try
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim MsgStr As String = ""
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim Cmd As New SqlCommand("spUpdateWarehouseFreight", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@WH", WH)
                Cmd.Parameters.AddWithValue("@AIRPORT", AIRPORT)
                Cmd.Parameters.AddWithValue("@FREIGHT", FREIGHT)
                Cmd.Parameters.AddWithValue("@ADDUSER", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
                MsgStr = Cmd.ExecuteScalar()
                Cmd.Dispose()
                SqlCon.Close()
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "UpdateWarehouseFreightDetails", "Update Warehouse Freight <b>" + WH + " - " + AIRPORT + "</b>", WH + " - " + AIRPORT)
                End If
                Return MsgStr
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in UpdateWarehouseFreight")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteWarehouseFreightByID(ByVal ID As String) As String
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
                    Using cmd As New SqlCommand("DeleteWarehouseFreight", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.Parameters.AddWithValue("@ADDUSER", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(1, 20), UserDetails.Name))
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteWarehouseFreightByID")
                Return "error"
            End Try
        End Function

    End Class

#Region "Warehouse Handling"
    Public Class WarehouseHandlings
        Public Function GetWHHandlingForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As Tuple(Of DataSet, String)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim ds As New DataSet()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetWarehouseHandling]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        da.Fill(ds)
                    End Using
                End Using
                Dim result As New Tuple(Of DataSet, String)(ds, "success")
                Return result
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetWHHandlingForFgrd")
                Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in GetWHHandlingForFgrd")
                Return result
            End Try
        End Function
        Public Shared Function InsertUpdateWarehouseHandling(ByVal Id As String, ByVal WarehouseId As String, ByVal UOM As String, ByVal Desc As String, ByVal Handling As String, ByVal ToInsert As Boolean) As String
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

                Dim WarehouseHandlingScopeID As String = ""
                Dim Cmd As New SqlCommand("spInsertUpdatewarehousehandlingcharges", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure

                Cmd.Parameters.AddWithValue("@WH_HandlingId", Id)
                Cmd.Parameters.AddWithValue("@Warehouse", WarehouseId)
                Cmd.Parameters.AddWithValue("@UOM", UOM)
                Cmd.Parameters.AddWithValue("@Description", Desc)
                Cmd.Parameters.AddWithValue("@Handling", Handling)
                Cmd.Parameters.AddWithValue("@ToInsert", ToInsert)
                WarehouseHandlingScopeID=Cmd.ExecuteScalar()

                Cmd.Dispose()
                SqlCon.Close()
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", If(ToInsert, "SaveWarehouseHandling", "UpdateWarehouseHandling"), If(ToInsert, "Added a new WarehouseHandling <b>" + Desc + "</b>", "Updated a WarehouseHandling <b>" + Desc + "</b>"), WarehouseHandlingScopeID.ToString())
                End If
                Return WarehouseHandlingScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UOM EXIST ALREADY")) Then
                    ErrorLogs.LogException(ex, "Error in InsertUpdateWarehouseHandling")
                End If
                Return ex.Message.ToString()
            End Try
        End Function
        Public Shared Function GetWHHandlingDetailByID(ByVal ID As String) As WarehouseHandling
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim u As New WarehouseHandling
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetWHHandlingDetailByID", con)
                        cmd.Parameters.AddWithValue("@WHHandlingChargeId", ID)
                        cmd.CommandType = CommandType.StoredProcedure
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            u.WHHandlingChargeId = row("WHHandlingChargeId")
                            u.WarehouseId = row("WHId")
                            u.Warehouse = row("Warehouse")
                            u.UOM = row("UOM")
                            u.Description = Convert.ToString(row("Description"))
                            u.Handling = Convert.ToDecimal(row("Handling"))
                        Next
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetWHHandlingDetailByID")
                Return Nothing
            End Try
        End Function
        Public Shared Function DeleteWHHandlingByID(ByVal ID As String) As String
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
                    Using cmd As New SqlCommand("DELETE FROM  f_warehousehandlingcharges WHERE WHHandlingChargeId=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteWHHandlingByID")
                Return "error"
            End Try
        End Function
    End Class
#End Region
End Class

