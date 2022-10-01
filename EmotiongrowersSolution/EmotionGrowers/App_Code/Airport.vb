Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class Airport

    Private _AirportID As Integer
    Public Property AirportID() As Integer
        Get
            Return _AirportID
        End Get
        Set(value As Integer)
            _AirportID = value
        End Set
    End Property

    Private _Airport As String
    Public Property Airport() As String
        Get
            Return _Airport
        End Get
        Set(ByVal value As String)
            _Airport = value
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

    Private _Carrier1 As String
    Public Property Carrier1() As String
        Get
            Return _Carrier1
        End Get
        Set(ByVal value As String)
            _Carrier1 = value
        End Set
    End Property

    Private _Carrier2 As String
    Public Property Carrier2() As String
        Get
            Return _Carrier2
        End Get
        Set(ByVal value As String)
            _Carrier2 = value
        End Set
    End Property

    Private _Carrier3 As String
    Public Property Carrier3() As String
        Get
            Return _Carrier3
        End Get
        Set(ByVal value As String)
            _Carrier3 = value
        End Set
    End Property

    Private _Carrier4 As String
    Public Property Carrier4() As String
        Get
            Return _Carrier4
        End Get
        Set(ByVal value As String)
            _Carrier4 = value
        End Set
    End Property

    Private _Carrier5 As String
    Public Property Carrier5() As String
        Get
            Return _Carrier5
        End Get
        Set(ByVal value As String)
            _Carrier5 = value
        End Set
    End Property

    Private _Country As String
    Public Property Country() As String
        Get
            Return _Country
        End Get
        Set(ByVal value As String)
            _Country = value
        End Set
    End Property

    Private _Freight As Decimal
    Public Property Freight() As Decimal
        Get
            Return _Freight
        End Get
        Set(ByVal value As Decimal)
            _Freight = value
        End Set
    End Property

    Private _Fuel As Decimal
    Public Property Fuel() As Decimal
        Get
            Return _Fuel
        End Get
        Set(ByVal value As Decimal)
            _Fuel = value
        End Set
    End Property

    Private _FreightCre As Decimal
    Public Property FreightCre() As Decimal
        Get
            Return _FreightCre
        End Get
        Set(ByVal value As Decimal)
            _FreightCre = value
        End Set
    End Property

    Private _Monday As String
    Public Property Monday() As String
        Get
            Return _Monday
        End Get
        Set(ByVal value As String)
            _Monday = value
        End Set
    End Property

    Private _Tuesday As String
    Public Property Tuesday() As String
        Get
            Return _Tuesday
        End Get
        Set(ByVal value As String)
            _Tuesday = value
        End Set
    End Property

    Private _Wednesday As String
    Public Property Wednesday() As String
        Get
            Return _Wednesday
        End Get
        Set(ByVal value As String)
            _Wednesday = value
        End Set
    End Property

    Private _ThursDay As String
    Public Property ThursDay() As String
        Get
            Return _ThursDay
        End Get
        Set(ByVal value As String)
            _ThursDay = value
        End Set
    End Property

    Private _Friday As String
    Public Property Friday() As String
        Get
            Return _Friday
        End Get
        Set(ByVal value As String)
            _Friday = value
        End Set
    End Property

    Private _Saturday As String
    Public Property Saturday() As String
        Get
            Return _Saturday
        End Get
        Set(ByVal value As String)
            _Saturday = value
        End Set
    End Property

    Private _Sunday As String
    Public Property Sunday() As String
        Get
            Return _Sunday
        End Get
        Set(ByVal value As String)
            _Sunday = value
        End Set
    End Property

    Private _Type As String
    Public Property Type() As String
        Get
            Return _Type
        End Get
        Set(ByVal value As String)
            _Type = value
        End Set
    End Property

    Private _ADDUSER As String
    Public Property ADDUSER() As String
        Get
            Return _ADDUSER
        End Get
        Set(ByVal value As String)
            _ADDUSER = value
        End Set
    End Property

    Private _ADDDATE As String
    Public Property ADDDATE() As String
        Get
            Return _ADDDATE
        End Get
        Set(ByVal value As String)
            _ADDDATE = value
        End Set
    End Property

    Private _ADDTIME As String
    Public Property ADDTIME() As String
        Get
            Return _ADDTIME
        End Get
        Set(value As String)
            _ADDTIME = value
        End Set
    End Property

    Private _ADDAPP As String
    Public Property ADDAPP() As String
        Get
            Return _ADDAPP
        End Get
        Set(ByVal value As String)
            _ADDAPP = value
        End Set
    End Property

End Class

Public Class Airports
    ''' <summary>
    ''' VEN::04-Nov-2015::To get airport lists
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function GetAirportList() As List(Of Airport)

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Airport)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from F_AIRPOT order by Airport", con)
                    Using AirportDR As SqlDataReader = cmd.ExecuteReader()
                        If AirportDR.HasRows Then
                            While AirportDR.Read
                                Dim u As New Airport
                                u.AirportID = AirportDR("ID")
                                u.Name = AirportDR("Name")
								u.Airport = AirportDR("AIRPORT")
                                u.Freight = AirportDR("Freight")
                                ulist.Add(u)
                            End While
                        End If
                    End Using
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAirportList")
            Return Nothing
        End Try
    End Function



    ''' <summary>
    ''' STA::05-NOV-2015::to get Airport by Code
    ''' </summary>
    ''' <param name="Airport"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetAirportByCode(ByVal Airport As String) As Airport

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New Airport
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from F_AIRPOT where Airport=@Airport", con)
                    cmd.Parameters.AddWithValue("@Airport", Airport)
                    cmd.CommandType = CommandType.Text
                    Using AirportDR As SqlDataReader = cmd.ExecuteReader()
                        If (AirportDR.HasRows) Then
                            While (AirportDR.Read())
                                u.AirportID = AirportDR("ID")
                                u.Name = AirportDR("Name")
                                u.Airport = AirportDR("Airport")
                            End While
                        End If
                    End Using
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAirportByCode")
            Return Nothing
        End Try
    End Function

    Public Shared Function InsertAirport(ByVal AIRPORT As String, ByVal NAME As String, ByVal FREIGHT As Decimal, ByVal FUEL As Decimal, ByVal MONDAY As String,
    ByVal TUESDAY As String, ByVal WEDNESDAY As String, ByVal THURSDAY As String, ByVal FRIDAY As String, ByVal SATURDAY As String, ByVal SUNDAY As String) As String
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
            Dim AirportScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_AIRPOTInsert", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure

            Cmd.Parameters.AddWithValue("@AIRPORT", AIRPORT)
            Cmd.Parameters.AddWithValue("@NAME", NAME)
            Cmd.Parameters.AddWithValue("@FREIGHT", FREIGHT)
            Cmd.Parameters.AddWithValue("@FUEL", FUEL)
            Cmd.Parameters.AddWithValue("@MONDAY", MONDAY)
            Cmd.Parameters.AddWithValue("@TUESDAY", TUESDAY)
            Cmd.Parameters.AddWithValue("@WEDNESDAY", WEDNESDAY)
            Cmd.Parameters.AddWithValue("@THURSDAY", THURSDAY)
            Cmd.Parameters.AddWithValue("@FRIDAY", FRIDAY)
            Cmd.Parameters.AddWithValue("@SATURDAY", SATURDAY)
            Cmd.Parameters.AddWithValue("@SUNDAY", SUNDAY)
            Cmd.Parameters.AddWithValue("@ADDUSER", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "SaveAirportDetails", "Added a new Airport <b>" + NAME + "</b>", AirportScopeID.ToString())
            End If
            Return AirportScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in SaveAirportDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function UpdateAirport(ByVal ID As Integer, ByVal AIRPORT As String, ByVal NAME As String, ByVal FREIGHT As Decimal, ByVal FUEL As Decimal, ByVal MONDAY As String,
    ByVal TUESDAY As String, ByVal WEDNESDAY As String, ByVal THURSDAY As String, ByVal FRIDAY As String, ByVal SATURDAY As String, ByVal SUNDAY As String) As String
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
            Dim AirportScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_AIRPOTUpdate", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@ID", ID)
            Cmd.Parameters.AddWithValue("@AIRPORT", AIRPORT)
            Cmd.Parameters.AddWithValue("@NAME", NAME)
            Cmd.Parameters.AddWithValue("@FREIGHT", FREIGHT)
            Cmd.Parameters.AddWithValue("@FUEL", FUEL)
            Cmd.Parameters.AddWithValue("@MONDAY", MONDAY)
            Cmd.Parameters.AddWithValue("@TUESDAY", TUESDAY)
            Cmd.Parameters.AddWithValue("@WEDNESDAY", WEDNESDAY)
            Cmd.Parameters.AddWithValue("@THURSDAY", THURSDAY)
            Cmd.Parameters.AddWithValue("@FRIDAY", FRIDAY)
            Cmd.Parameters.AddWithValue("@SATURDAY", SATURDAY)
            Cmd.Parameters.AddWithValue("@SUNDAY", SUNDAY)
            Cmd.Parameters.AddWithValue("@UPDUSER", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(1, 20), UserDetails.Name))
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "UpdateAirportDetails", "Added a new Airport <b>" + NAME + "</b>", AirportScopeID.ToString())
            End If
            Return AirportScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in UpdateAirportDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function GetAirportDetailByID(ByVal ID As String) As Airport
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New Airport
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from F_AIRPOT where ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.CommandType = CommandType.Text
                    Using AirportDR As SqlDataReader = cmd.ExecuteReader()
                        If AirportDR.HasRows Then
                            While AirportDR.Read()
                                u.AirportID = AirportDR("ID")
                                u.Name = AirportDR("Name")
                                u.Airport = AirportDR("Airport")
                                u.Freight = AirportDR("Freight")
                                u.Fuel = AirportDR("Fuel")
                                u.Monday = AirportDR("Monday")
                                u.Tuesday = AirportDR("Tuesday")
                                u.Wednesday = AirportDR("Wednesday")
                                u.ThursDay = AirportDR("ThursDay")
                                u.Friday = AirportDR("Friday")
                                u.Saturday = AirportDR("Saturday")
                                u.Sunday = AirportDR("Sunday")
                            End While
                        End If
                    End Using
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAirportDetailByID")
            Return Nothing
        End Try
    End Function

    Public Shared Function DeleteAirportbyID(ByVal ID As String) As String
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
                Using cmd As New SqlCommand("UPDATE  H SET H.TYPE='Deleted', H.FREIGHT=A.FREIGHT,H.FUEL=A.FUEL,H.ADDUSER=@AddUser,H.ADDDATE=FORMAT(GETDATE(),'MM/dd/yyyy'),H.ADDTIME=FORMAT(GETDATE(),'HH:mm:ss'),H.ADDAPP='WEB' FROM F_AIRHST H LEFT JOIN F_AIRPOT A ON H.AIRPORT=A.AIRPORT WHERE A.ID=@ID  DELETE FROM  F_AIRPOT WHERE ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.Parameters.AddWithValue("@AddUser", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(1, 20), UserDetails.Name))
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteAirportbyID")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' ABI::28-Apr-2018::To get airport code lists
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function GetAirportCodeList() As List(Of Airport)

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Airport)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  ID,Airport,Name from F_AIRPOT where Airport<>'' order by Airport", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Airport
                        u.AirportID = row("ID")
                        u.Airport = row("Airport")
                        u.Name = row("Name")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAirportCodeList")
            Return Nothing
        End Try
    End Function

    Public Class GetAirportDetails

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
        ''' VEN::05-NOV-2015::get Airport list for grid
        ''' </summary>
        ''' <param name="whereClause"></param>
        ''' <param name="sortExp"></param>
        ''' <param name="startRowIndex"></param>
        ''' <param name="numberOfRows"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Function GetAirportListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer) As List(Of Airport)

            Dim uList As New List(Of Airport)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetAirport]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Airport()
                            u.AirportID = row("ID")
                            u.Airport = row("Airport")
                            u.Name = row("Name")
                            u.Carrier1 = If(row("Carrier1") Is DBNull.Value, "", row("Carrier1"))
                            u.Carrier2 = If(row("Carrier2") Is DBNull.Value, "", row("Carrier2"))
                            u.Carrier3 = If(row("Carrier3") Is DBNull.Value, "", row("Carrier3"))
                            u.Carrier4 = If(row("Carrier4") Is DBNull.Value, "", row("Carrier4"))
                            u.Carrier5 = If(row("Carrier5") Is DBNull.Value, "", row("Carrier5"))
                            u.Freight = If(row("Freight") Is DBNull.Value, 0.00, row("Freight"))
                            u.Fuel = If(row("Fuel") Is DBNull.Value, 0.00, row("Fuel"))
                            u.FreightCre = If(row("FreightCre") Is DBNull.Value, 0.00, row("FreightCre"))
                            u.Monday = row("Monday")
                            u.Tuesday = row("Tuesday")
                            u.Wednesday = row("Wednesday")
                            u.ThursDay = row("ThursDay")
                            u.Friday = row("Friday")
                            u.Saturday = row("Saturday")
                            u.Sunday = row("Sunday")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetAirportListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Function GetAirportHistListForFgrd() As List(Of Airport)

            Dim uList As New List(Of Airport)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select * from f_airhst order by [type]", con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Airport()
                            u.AirportID = row("ID")
                            u.Airport = row("Airport")
                            u.Type = row("Type")
                            u.Freight = If(row("Freight") Is DBNull.Value, 0.00, row("Freight"))
                            u.Fuel = If(row("Fuel") Is DBNull.Value, 0.00, row("Fuel"))
                            u.ADDUSER = If(row("ADDUSER") Is DBNull.Value, "", row("ADDUSER"))
                            u.ADDDATE = If(row("ADDDATE") Is DBNull.Value, "", row("ADDDATE"))
                            u.ADDTIME = If(row("ADDTIME") Is DBNull.Value, "", row("ADDTIME"))
                            u.ADDAPP = If(row("ADDAPP") Is DBNull.Value, "", row("ADDAPP"))
                            uList.Add(u)
                        Next
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetAirportHistListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

    End Class
End Class

