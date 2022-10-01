Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Public Class Farms

    ''' <summary>
    ''' STA::09-JUL-2015::to get the farms by userid
    ''' </summary>
    ''' <param name="UserID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetFarmByUserID(UserID As Integer) As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Farm from vwUserAssignedFarms where UserId=@UserId", con)
                    cmd.Parameters.AddWithValue("@UserId", UserID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.Farm = row("Farm")
                        ulist.Add(u)
                    Next
                    HttpContext.Current.Session("UserFarms") = ulist
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmByUserID")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetUserFarmCodeByUserID(ByVal Searchtext As String, ByVal UserID As Integer) As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select distinct Farm,Name,City from vwUserAssignedFarms where UserId=@UserId and Farm like '" + Searchtext + "%' Order By [Farm]", con)
                    cmd.Parameters.AddWithValue("@UserId", UserID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.Farm = row("Farm")
                        u.Name = row("Name")
                        u.City = row("City")
                        ulist.Add(u)
                    Next
                    HttpContext.Current.Session("UserFarms") = ulist
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserFarmCodeByUserID")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetUserFarmCodeByUserIDForManualPO(ByVal FarmCode As String, ByVal UserID As Integer) As Farm
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New Farm
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim Qry As String = ""
                If UserID = 0 Then
                    Qry = "select distinct Farm,Name,City from F_FARM where Farm =@Farm"
                Else
                    Qry = "select distinct Farm,Name,City from vwUserAssignedFarms where UserId=@UserId and Farm =@Farm"
                End If
                Using cmd As New SqlCommand(Qry, con)
                    cmd.Parameters.AddWithValue("@UserId", UserID)
                    cmd.Parameters.AddWithValue("@Farm", FarmCode)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    If ds.Tables(0).Rows.Count > 0 Then
                        For Each row In ds.Tables(0).Rows
                            u.Farm = row("Farm")
                            u.Name = row("Name")
                            u.City = row("City")
                        Next
                    Else
                        Return Nothing
                    End If
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserFarmCodeByUserID")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetUserFarmCodeByUserID(ByVal Searchtext As String) As List(Of Farm)
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim ulist As New List(Of Farm)
        Using con As New SqlConnection(ConStr)
            con.Open()
            Using cmd As New SqlCommand("select distinct Farm,Name,City from F_FARM where Farm like '" + Searchtext + "%' order by Farm asc", con)
                Dim da As New SqlDataAdapter(cmd)
                Dim ds As New DataSet
                da.Fill(ds)
                For Each row In ds.Tables(0).Rows
                    Dim u As New Farm
                    u.Farm = row("Farm")
                    u.Name = row("Name")
                    u.City = row("City")
                    ulist.Add(u)
                Next
                HttpContext.Current.Session("UserFarms") = ulist
            End Using
        End Using
        Return ulist
    End Function

    Public Shared Function GetFarmDetailsByCode(ByVal FarmCode As String) As Farm
        Try
            Dim u As New Farm
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Farm,Name,FOB,MANUFACID,City,Email from F_FARM where Farm=@farm", con)
                    cmd.Parameters.AddWithValue("@farm", FarmCode)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.Farm = row("Farm")
                        u.Name = row("Name")
                        u.FOB = row("FOB")
                        u.Manufacid = row("MANUFACID")
                        u.City = row("City")
                        u.Email = Convert.ToString(row("Email"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmDetailsByCode")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetFarmsForKometpost() As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  ID,Farm,Name,City,Country from F_FARM where   (KOMETID='' or  KOMETID='0' ) ", con) 'fob<>'I' and  (status='A' or status='') and
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.ID = row("ID")
                        u.Farm = row("Farm")
                        u.Name = row("Name")
                        u.City = row("City")
                        u.Country = row("Country")
                        ulist.Add(u)
                    Next
                    HttpContext.Current.Session("UserFarms") = ulist
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmDetailsByCode")
            Return Nothing
        End Try
    End Function


    Public Shared Function GetFarmKometID(ByVal Farm As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim kometid As String

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select KometID from F_FARM where Farm='" + Farm + "'", con)
                    cmd.CommandType = CommandType.Text
                    kometid = cmd.ExecuteScalar()


                End Using
            End Using
            Return kometid
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in IsProductHaveKometID")
            Throw ex
        End Try
    End Function
    Public Shared Function UpdateKometID(ByVal KometID As String, ByVal Code As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("Update F_FARM set KOMETID=@KometID where FARM=@Code ", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@Code", Code.ToString())
                    cmd1.Parameters.AddWithValue("@KometID", KometID.ToString())
                    Dim result1 = cmd1.ExecuteNonQuery()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateKometID")
            Return Nothing
        End Try
        Return ""
    End Function

    Public Shared Function DeleteFarmbyID(ByVal ID As String) As String
        Try
            Dim u As New Flower
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("delete from  F_FARM where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteFarmbyID")
            Return "error"
        End Try
    End Function

    Public Shared Function SaveFarms(ByVal FarmList As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("SpSaveFarms", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@FormsList", FarmList.ToString())
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveFarms")
            Return Nothing
        End Try
        Return ""
    End Function

    Public Shared Function InsertFarms(ByVal FARM As String, ByVal NAME As String,
                                    ByVal VENDOR As Integer, ByVal FOB As String, ByVal PARTNER As Boolean, ByVal COMMISSION As String, ANTIDUMP As Boolean,
                                    ByVal CITY As String, ByVal GL As String,
                                    ByVal COUNTRY As String, ByVal PACKRET As Integer, ByVal MANUFACID As String, ByVal DUMPING As Decimal, ByVal FARMADD1 As String,
                                    ByVal FARMADD2 As String, ByVal OFFICEADD1 As String, ByVal OFFICEADD2 As String,
                                    ByVal OFFICETEL As String, ByVal OFFICEMAN As String, ByVal OFFICESEC As String, ByVal OFFICEFAX As String,
                                    ByVal FARMAGR As String, ByVal PRODUCTS As String, ByVal VARIETIES As String, ByVal AREA As String,
                                    ByVal BANKNAME As String, ByVal BANKADD1 As String, ByVal BANKADD2 As String, ByVal BANKACCOUN As String,
                                    ByVal BANKOFF As String, ByVal FUEL As Decimal, ByVal RETURNFUEL As Boolean, ByVal EMAIL As String,
                                    ByVal CreatedDate As Date, ByVal KOMETID As String, ByVal STATUS As String, ByVal FARMEMAIL As String, ByVal User As String, ByVal SALESPERSON As String, ByVal CELLULAR As String,
                                    ByVal OFFICEMANPHONE As String, ByVal OFFICESECPHONE As String, ByVal OWNER As String, ByVal OWNERPHONE As String, ByVal PostHarvest As String, ByVal PostHarvestPhone As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()

            Dim FarmScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_FarmInsert", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@FARM", FARM)
            Cmd.Parameters.AddWithValue("@NAME", NAME)
            Cmd.Parameters.AddWithValue("@VENDOR", VENDOR)
            Cmd.Parameters.AddWithValue("@FOB", FOB)
            Cmd.Parameters.AddWithValue("@PARTNER", PARTNER)
            Cmd.Parameters.AddWithValue("@COMMISSION", COMMISSION)
            Cmd.Parameters.AddWithValue("@ANTIDUMP", ANTIDUMP)
            Cmd.Parameters.AddWithValue("@CITY", CITY)
            Cmd.Parameters.AddWithValue("@GL", GL)
            Cmd.Parameters.AddWithValue("@COUNTRY", COUNTRY)
            Cmd.Parameters.AddWithValue("@PACKRET", PACKRET)
            Cmd.Parameters.AddWithValue("@MANUFACID", MANUFACID)
            Cmd.Parameters.AddWithValue("@DUMPING", DUMPING)
            Cmd.Parameters.AddWithValue("@FARMADD1", FARMADD1)
            Cmd.Parameters.AddWithValue("@FARMADD2", FARMADD2)
            Cmd.Parameters.AddWithValue("@OFFICEADD1", OFFICEADD1)
            Cmd.Parameters.AddWithValue("@OFFICEADD2", OFFICEADD2)
            Cmd.Parameters.AddWithValue("@OFFICETEL", OFFICETEL)
            Cmd.Parameters.AddWithValue("@OFFICEMAN", OFFICEMAN)
            Cmd.Parameters.AddWithValue("@OFFICESEC", OFFICESEC)
            Cmd.Parameters.AddWithValue("@OFFICEFAX", OFFICEFAX)
            Cmd.Parameters.AddWithValue("@FARMAGR", FARMAGR)
            Cmd.Parameters.AddWithValue("@PRODUCTS", PRODUCTS)
            Cmd.Parameters.AddWithValue("@VARIETIES", VARIETIES)
            Cmd.Parameters.AddWithValue("@AREA", AREA)
            Cmd.Parameters.AddWithValue("@BANKNAME", BANKNAME)
            Cmd.Parameters.AddWithValue("@BANKADD1", BANKADD1)
            Cmd.Parameters.AddWithValue("@BANKADD2", BANKADD2)
            Cmd.Parameters.AddWithValue("@BANKACCOUN", BANKACCOUN)
            Cmd.Parameters.AddWithValue("@BANKOFF", BANKOFF)
            Cmd.Parameters.AddWithValue("@FUEL", FUEL)
            Cmd.Parameters.AddWithValue("@RETURNFUEL", RETURNFUEL)
            Cmd.Parameters.AddWithValue("@CreatedDate", CreatedDate)
            Cmd.Parameters.AddWithValue("@KOMETID", KOMETID)
            Cmd.Parameters.AddWithValue("@STATUS", STATUS)
            Cmd.Parameters.AddWithValue("@FARMEMAIL", IIf(FARMEMAIL = Nothing, "", FARMEMAIL))
            Cmd.Parameters.AddWithValue("@EMAIL", IIf(EMAIL = Nothing, "", EMAIL))
            Cmd.Parameters.AddWithValue("@CreatedUser", If(User.Length > 10, User.Substring(0, 10), User))
            Cmd.Parameters.AddWithValue("@SALESPERSON", SALESPERSON)
            Cmd.Parameters.AddWithValue("@CELLULAR", CELLULAR)

            Cmd.Parameters.AddWithValue("@OFFICEMANPHONE", OFFICEMANPHONE)
            Cmd.Parameters.AddWithValue("@OFFICESECPHONE", OFFICESECPHONE)
            Cmd.Parameters.AddWithValue("@OFFICEOWNER", OWNER)
            Cmd.Parameters.AddWithValue("@OFFICEOWNERPHONE", OWNERPHONE)
            Cmd.Parameters.AddWithValue("@POSTHARVEST", PostHarvest)
            Cmd.Parameters.AddWithValue("@POSTHARVESTPHONE", PostHarvestPhone)
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            Dim FarmDetails As New Farm

            If (Not HttpContext.Current.Session("FarmDetails") Is Nothing) Then
                FarmDetails = HttpContext.Current.Session("FarmDetails")
            ElseIf (Not HttpContext.Current.Session("FarmDetails") Is Nothing) Then
                FarmDetails = HttpContext.Current.Session("FarmDetails")
            End If
            If (Not FarmDetails Is Nothing) Then
                Logs.Savelog(FarmDetails.ID, "Farms", "SaveFarmDetails", "Added a new Farm <b>" + NAME + "</b>", FarmScopeID.ToString())
            End If
            Return FarmScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in SaveFarmDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function UpdateFarms(ByVal ID As Integer, ByVal FARM As String, ByVal NAME As String,
                                    ByVal VENDOR As Integer, ByVal FOB As String, ByVal PARTNER As Boolean, ByVal COMMISSION As String, ANTIDUMP As Boolean,
                                    ByVal CITY As String, ByVal GL As String,
                                    ByVal COUNTRY As String, ByVal PACKRET As Integer, ByVal MANUFACID As String, ByVal DUMPING As Decimal, ByVal FARMADD1 As String,
                                    ByVal FARMADD2 As String, ByVal OFFICEADD1 As String, ByVal OFFICEADD2 As String,
                                    ByVal OFFICETEL As String, ByVal OFFICEMAN As String, ByVal OFFICESEC As String, ByVal OFFICEFAX As String,
                                    ByVal FARMAGR As String, ByVal PRODUCTS As String, ByVal VARIETIES As String, ByVal AREA As String,
                                    ByVal BANKNAME As String, ByVal BANKADD1 As String, ByVal BANKADD2 As String, ByVal BANKACCOUN As String,
                                    ByVal BANKOFF As String, ByVal FUEL As Decimal, ByVal RETURNFUEL As Boolean, ByVal EMAIL As String,
                                    ByVal CreatedDate As Date, ByVal KOMETID As String, ByVal STATUS As String, ByVal FARMEMAIL As String, ByVal User As String, ByVal SALESPERSON As String, ByVal CELLULAR As String,
                                    ByVal OFFICEMANPHONE As String,
                                    ByVal OFFICESECPHONE As String,
                                    ByVal OWNER As String,
                                    ByVal OWNERPHONE As String,
                                    ByVal PostHarvest As String,
                                    ByVal PostHarvestPhone As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim FarmScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_FarmUpdate", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@ID", ID)
            Cmd.Parameters.AddWithValue("@FARM", FARM)
            Cmd.Parameters.AddWithValue("@NAME", NAME)
            Cmd.Parameters.AddWithValue("@VENDOR", VENDOR)
            Cmd.Parameters.AddWithValue("@FOB", FOB)
            Cmd.Parameters.AddWithValue("@PARTNER", PARTNER)
            Cmd.Parameters.AddWithValue("@COMMISSION", COMMISSION)
            Cmd.Parameters.AddWithValue("@ANTIDUMP", ANTIDUMP)
            Cmd.Parameters.AddWithValue("@CITY", CITY)
            Cmd.Parameters.AddWithValue("@GL", GL)
            Cmd.Parameters.AddWithValue("@COUNTRY", COUNTRY)
            Cmd.Parameters.AddWithValue("@PACKRET", PACKRET)
            Cmd.Parameters.AddWithValue("@MANUFACID", MANUFACID)
            Cmd.Parameters.AddWithValue("@DUMPING", DUMPING)
            Cmd.Parameters.AddWithValue("@FARMADD1", FARMADD1)
            Cmd.Parameters.AddWithValue("@FARMADD2", FARMADD2)
            Cmd.Parameters.AddWithValue("@OFFICEADD1", OFFICEADD1)
            Cmd.Parameters.AddWithValue("@OFFICEADD2", OFFICEADD2)
            Cmd.Parameters.AddWithValue("@OFFICETEL", OFFICETEL)
            Cmd.Parameters.AddWithValue("@OFFICEMAN", OFFICEMAN)
            Cmd.Parameters.AddWithValue("@OFFICESEC", OFFICESEC)
            Cmd.Parameters.AddWithValue("@OFFICEFAX", OFFICEFAX)
            Cmd.Parameters.AddWithValue("@FARMAGR", FARMAGR)
            Cmd.Parameters.AddWithValue("@PRODUCTS", PRODUCTS)
            Cmd.Parameters.AddWithValue("@VARIETIES", VARIETIES)
            Cmd.Parameters.AddWithValue("@AREA", AREA)
            Cmd.Parameters.AddWithValue("@BANKNAME", BANKNAME)
            Cmd.Parameters.AddWithValue("@BANKADD1", BANKADD1)
            Cmd.Parameters.AddWithValue("@BANKADD2", BANKADD2)
            Cmd.Parameters.AddWithValue("@BANKACCOUN", BANKACCOUN)
            Cmd.Parameters.AddWithValue("@BANKOFF", BANKOFF)
            Cmd.Parameters.AddWithValue("@FUEL", FUEL)
            Cmd.Parameters.AddWithValue("@RETURNFUEL", RETURNFUEL)
            Cmd.Parameters.AddWithValue("@CreatedDate", CreatedDate.ToString())
            Cmd.Parameters.AddWithValue("@KOMETID", KOMETID)
            Cmd.Parameters.AddWithValue("@STATUS", STATUS)
            Cmd.Parameters.AddWithValue("@FARMEMAIL", IIf(FARMEMAIL = Nothing, "", FARMEMAIL))
            Cmd.Parameters.AddWithValue("@EMAIL", IIf(EMAIL = Nothing, "", EMAIL))
            Cmd.Parameters.AddWithValue("@UpdatedUser", If(User.Length > 10, User.Substring(0, 10), User))
            Cmd.Parameters.AddWithValue("@SALESPERSON", SALESPERSON)
            Cmd.Parameters.AddWithValue("@CELLULAR", CELLULAR)

            Cmd.Parameters.AddWithValue("@OFFICEMANPHONE", OFFICEMANPHONE)
            Cmd.Parameters.AddWithValue("@OFFICESECPHONE", OFFICESECPHONE)
            Cmd.Parameters.AddWithValue("@OFFICEOWNER", OWNER)
            Cmd.Parameters.AddWithValue("@OFFICEOWNERPHONE", OWNERPHONE)
            Cmd.Parameters.AddWithValue("@POSTHARVEST", PostHarvest)
            Cmd.Parameters.AddWithValue("@POSTHARVESTPHONE", PostHarvestPhone)

            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            Dim FarmDetails As New Farm
            If (Not HttpContext.Current.Session("FarmDetails") Is Nothing) Then
                FarmDetails = HttpContext.Current.Session("FarmDetails")
            ElseIf (Not HttpContext.Current.Session("FarmDetails") Is Nothing) Then
                FarmDetails = HttpContext.Current.Session("FarmDetails")
            End If
            If (Not FarmDetails Is Nothing) Then
                Logs.Savelog(FarmDetails.ID, "Farms", "SaveFarmDetails", "Added a new Farm <b>" + NAME + "</b>", FarmScopeID.ToString())
            End If
            Return FarmScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in SaveFarmDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function
	
	Public Shared Function GetFarmComments(ByVal Farm As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using Cmd As New SqlCommand("SELECT ISNULL(COMMENTS,'') COMMENTS FROM F_FARMCOM WHERE FARM=@FARM", con)
                    Cmd.CommandType = CommandType.Text
                    Cmd.Parameters.AddWithValue("@FARM", Farm)
                    Dim Reader As SqlDataReader = Cmd.ExecuteReader()
                    If Reader.HasRows Then
                        Reader.Read()
                        result = Reader(0).ToString.Trim()
                    Else
                        result = ""
                    End If

                End Using
                con.Close()
            End Using
            Return result

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmComments")
            Return ""
        End Try

    End Function

    Public Shared Function SaveFarmComments(ByVal FARM As String, ByVal Comments As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("select count(*) from F_FARMCOM where FARM=@FARM", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@FARM", FARM)
                    Dim res As Integer = cmd1.ExecuteScalar()
                    Dim sqlstr As String = ""
                    If res > 0 Then
                        sqlstr = "Update F_FARMCOM set COMMENTS=@Comments where FARM=@FARM"
                    Else
                        sqlstr = "Insert into F_FARMCOM (FARM,COMMENTS) values (@FARM,@COMMENTS)"
                    End If

                    Using cmdInstr As New SqlCommand(sqlstr, con)
                        cmdInstr.Parameters.AddWithValue("@FARM", FARM)
                        cmdInstr.Parameters.AddWithValue("@Comments", Comments)
                        cmdInstr.CommandType = CommandType.Text
                        cmdInstr.ExecuteNonQuery()
                    End Using
                End Using
                con.Close()
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveFarmComments")
            Return "error"
        End Try
    End Function

    Public Shared Function GetFarmForAutocomplete(Searchtext As String) As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from F_FARM where FARM like '" + Searchtext + "%' order by FARM", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.FarmCode = row("Farm")
                        u.Name = row("Name")
                        u.Vendor = row("Vendor")
                        u.FOB = row("FOB")
                        u.Partner = row("Partner")
                        u.Commission = row("Commission")
                        u.Antidump = row("Antidump")
                        u.City = row("City")
                        u.GL = row("GL")
                        u.Country = row("Country")
                        u.Packret = row("Packret")
                        u.Manufacid = row("Manufacid")
                        u.Dumping = row("Dumping")
                        u.Farmadd1 = row("Farmadd1")
                        u.Farmadd2 = row("Farmadd2")
                        u.Officeadd1 = row("Officeadd1")
                        u.Officeadd2 = row("Officeadd2")
                        u.Officetel = row("Officetel")
                        u.Officeman = row("Officeman")
                        u.Officesec = row("Officesec")
                        u.Officefax = row("Officefax")
                        u.Farmagr = row("Farmagr")
                        u.Products = row("Products")
                        u.Varieties = row("Varieties")
                        u.Area = row("Area")
                        u.BankName = row("BankName")
                        u.BankAdd1 = row("BankAdd1")
                        u.BankAdd2 = row("BankAdd2")
                        u.BankAccoun = row("BankAccoun")
                        u.Bankoff = row("Bankoff")
                        'u.Fuel = row("Fuel")
                        u.Returnfuel = row("Returnfuel")
                        u.Email = row("Email")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmForAutocomplete")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' STA::03-NOV-2015::to get list of Farms by CITY
    ''' </summary>
    ''' <param name="Searchtext"></param>
    ''' <param name="City"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetFarmForAutocompleteByCity(Searchtext As String, ByVal City As String) As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                If City.ToLower() = "all" Then
                    qry = "select  * from F_FARM where FARM like '" + Searchtext + "%' order by FARM"
                Else
                    qry = "select  * from F_FARM where FARM like '" + Searchtext + "%' and City=@City order by FARM"
                End If
                Using cmd As New SqlCommand(qry, con)
                    cmd.Parameters.AddWithValue("@City", City)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.FarmCode = row("Farm")
                        u.Name = row("Name")
                        u.Vendor = row("Vendor")
                        u.FOB = row("FOB")
                        u.Partner = row("Partner")
                        u.Commission = row("Commission")
                        u.Antidump = row("Antidump")
                        u.City = row("City")
                        u.GL = row("GL")
                        u.Country = row("Country")
                        u.Packret = row("Packret")
                        u.Manufacid = row("Manufacid")
                        u.Dumping = row("Dumping")
                        u.Farmadd1 = row("Farmadd1")
                        u.Farmadd2 = row("Farmadd2")
                        u.Officeadd1 = row("Officeadd1")
                        u.Officeadd2 = row("Officeadd2")
                        u.Officetel = row("Officetel")
                        u.Officeman = row("Officeman")
                        u.Officesec = row("Officesec")
                        u.Officefax = row("Officefax")
                        u.Farmagr = row("Farmagr")
                        u.Products = row("Products")
                        u.Varieties = row("Varieties")
                        u.Area = row("Area")
                        u.BankName = row("BankName")
                        u.BankAdd1 = row("BankAdd1")
                        u.BankAdd2 = row("BankAdd2")
                        u.BankAccoun = row("BankAccoun")
                        u.Bankoff = row("Bankoff")
                        'u.Fuel = row("Fuel")
                        u.Returnfuel = row("Returnfuel")
                        u.Email = row("Email")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmForAutocompleteByCity")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' STA::13-NOV-2015::to get Farms by CITY
    ''' </summary>
    ''' <param name="City"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetFarmsByCity(ByVal City As String) As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""
                If City.ToLower() = "all" Then
                    qry = "select  * from F_FARM  order by FARM"
                ElseIf (City <> "") Then
                    qry = "select  * from F_FARM  where City=@City order by FARM"
                End If

                Using cmd As New SqlCommand(qry, con)
                    cmd.Parameters.AddWithValue("@City", City)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.FarmCode = row("Farm")
                        u.Name = row("Name")
                        u.Vendor = row("Vendor")
                        u.FOB = row("FOB")
                        u.Partner = row("Partner")
                        u.Commission = row("Commission")
                        u.Antidump = row("Antidump")
                        u.City = row("City")
                        u.GL = row("GL")
                        u.Country = row("Country")
                        u.Packret = row("Packret")
                        u.Manufacid = row("Manufacid")
                        u.Dumping = row("Dumping")
                        u.Farmadd1 = row("Farmadd1")
                        u.Farmadd2 = row("Farmadd2")
                        u.Officeadd1 = row("Officeadd1")
                        u.Officeadd2 = row("Officeadd2")
                        u.Officetel = row("Officetel")
                        u.Officeman = row("Officeman")
                        u.Officesec = row("Officesec")
                        u.Officefax = row("Officefax")
                        u.Farmagr = row("Farmagr")
                        u.Products = row("Products")
                        u.Varieties = row("Varieties")
                        u.Area = row("Area")
                        u.BankName = row("BankName")
                        u.BankAdd1 = row("BankAdd1")
                        u.BankAdd2 = row("BankAdd2")
                        u.BankAccoun = row("BankAccoun")
                        u.Bankoff = row("Bankoff")
                        'u.Fuel = row("Fuel")
                        u.Returnfuel = row("Returnfuel")
                        u.Email = row("Email")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmsByCity")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' MANI::09-OCT-2017::to get Farms by Main CITY Selection
    ''' </summary>
    ''' <param name="MainCity"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetFarmListFromMainCitySelection(ByVal MainCity As String) As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = ""



                Dim condition As String = ""
                If MainCity = "ALL" Then
                    condition = ""
                ElseIf (MainCity = "BOG") Then
                    condition = "And City in ('BOG','BGT')"
                ElseIf (MainCity = "SJO") Then
                    condition = "And City in ('SAN','SJO','CTR','COS')"
                ElseIf (MainCity = "UIO") Then
                    condition = "And City in ('UIO','QUI')"
                ElseIf (MainCity = "MDE") Then
                    condition = "And City in ('MDE','MED')"
                ElseIf (MainCity = "OTHERS") Then
                    condition = "And City not in ('BOG','BGT','UIO','SJO','MDE','MED','SAN','MIA','CTR','COS','DOM','GUA')"
                ElseIf (MainCity = "MIA") Then
                    condition = "And City='MIA'"
                ElseIf (MainCity = "GUA") Then
                    condition = "And City='GUA'"
                ElseIf (MainCity = "D.R") Then
                    condition = "And City='DOM'"
                End If

                Using cmd As New SqlCommand("select  * from F_FARM where fob <> 'I' AND LTRIM(RTRIM(FARM))<>'' " + condition + " order by farm", con)
                    cmd.Parameters.AddWithValue("@City", MainCity)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.FarmCode = row("Farm")
                        u.Name = row("Name")
                        u.Vendor = row("Vendor")
                        u.FOB = row("FOB")
                        u.Partner = row("Partner")
                        u.Commission = row("Commission")
                        u.Antidump = row("Antidump")
                        u.City = row("City")
                        u.GL = row("GL")
                        u.Country = row("Country")
                        u.Packret = row("Packret")
                        u.Manufacid = row("Manufacid")
                        u.Dumping = row("Dumping")
                        u.Farmadd1 = row("Farmadd1")
                        u.Farmadd2 = row("Farmadd2")
                        u.Officeadd1 = row("Officeadd1")
                        u.Officeadd2 = row("Officeadd2")
                        u.Officetel = row("Officetel")
                        u.Officeman = row("Officeman")
                        u.Officesec = row("Officesec")
                        u.Officefax = row("Officefax")
                        u.Farmagr = row("Farmagr")
                        u.Products = row("Products")
                        u.Varieties = row("Varieties")
                        u.Area = row("Area")
                        u.BankName = row("BankName")
                        u.BankAdd1 = row("BankAdd1")
                        u.BankAdd2 = row("BankAdd2")
                        u.BankAccoun = row("BankAccoun")
                        u.Bankoff = row("Bankoff")
                        'u.Fuel = row("Fuel")
                        u.Returnfuel = row("Returnfuel")
                        u.Email = row("Email")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetFarmsByCity")
            Return Nothing
        End Try
    End Function
   Public Shared Function GetFarmListByFlower(ByVal Flower As String) As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetFarmListByFlower", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Flower", Flower)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.FarmCode = row("Farm")
                        u.Name = row("Name")
                        u.LASTCOST = row("LASTCOST")
                        u.DATELAST = row("DATELAST")
                        u.Price = row("Price")
                        ulist.Add(u)
                    Next
                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetFarmsByCity")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' STA::03-NOV-2015::TO get Farm Cities
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetListOfFarmCity() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim City As String = "ALL, "
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Select  distinct CITY from F_FARM order by CITY", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        City += row("CITY") + ", "
                    Next
                End Using
            End Using
            Return City.Trim(", ")
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetListOfFarmCity")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' VEN::24-NOV-2015::For Load UnassignedFarms
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function GetUnassigndFarms() As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Select Distinct(F.Farm) From F_FARM F WHERE F.FARM NOT IN (select Distinct(UF.Farm) from vwUserAssignedFarms UF)", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.Farm = row("Farm")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUnassigndFarms")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFarmsinUIOCity(ByVal UserID As String, ByVal UserFarmList As List(Of Farm)) As List(Of Farm)
        Try
            'Dim uList As New List(Of Farm)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim Farm As String = ""
                If UserFarmList.Count > 0 Then
                    For Each t In UserFarmList
                        Farm += "'" + t.Farm + "'" + ","
                    Next
                    Farm = Farm.Remove(Farm.Length - 1, 1).ToString()
                Else
                    Farm = "'" + Farm + "'"
                End If
                Using cmd As New SqlCommand(String.Format("select * from F_FARM where city='UIO' and Farm not in ({0})", Farm), con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.Farm = Convert.ToString(row("Farm"))
                        u.City = Convert.ToString(row("City"))
                        u.Name = Convert.ToString(row("Name"))
                        UserFarmList.Add(u)
                    Next
                End Using
            End Using
            Return UserFarmList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmsinUIOCity")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetUserFarmCode(ByVal UserID As Integer) As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim Qry As String = ""
                If UserID = 0 Then
                    Qry = "select distinct Farm,Name,City,FOB from F_FARM ORDER BY Farm ASC"
                Else
                    Qry = "select distinct Farm,Name,City,FOB from vwUserAssignedFarms where UserId=@UserId ORDER BY Farm ASC"
                End If
                Using cmd As New SqlCommand(Qry, con)
                    cmd.Parameters.AddWithValue("@UserId", UserID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    If ds.Tables(0).Rows.Count > 0 Then
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Farm
                            u.Farm = row("Farm")
                            u.Name = row("Name")
                            u.City = row("City")
                            u.FOB = row("FOB")
                            uList.Add(u)
                        Next
                    Else
                        Return Nothing
                    End If
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserFarmCode")
            Return Nothing
        End Try

    End Function

    Public Shared Function LoadFarms() As List(Of Farm)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Farm)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Select Distinct(Farm),Name From F_FARM", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Farm
                        u.Farm = row("Farm")
                        u.Name = row("Name")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadFarms")
            Return Nothing
        End Try
    End Function
    Public Shared Function CheckFarmCodeAlreadyExists(ByVal Farm As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim results As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spCheckFarmCodeALreadyExists", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@FARM", Farm))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    results = dt.Rows.Count
                End Using
            End Using
            Return results
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckFarmCodeAlreadyExists")
            Return Nothing
        End Try
    End Function

    Public Class GetFarmDetails
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetFarmsListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of Farm)

            Dim uList As New List(Of Farm)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetFarms]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Farm()
                            u.ID = row("ID")
                            u.Farm = row("Farm")
                            u.Name = row("Name")
                            u.Vendor = row("Vendor")
                            u.FOB = row("FOB")
                            u.Partner = row("Partner")
                            u.Commission = row("Commission")
                            u.Antidump = row("Antidump")
                            u.City = row("City")
                            u.GL = row("GL")
                            u.Country = row("Country")
                            u.Packret = row("Packret")
                            u.Manufacid = row("Manufacid")
                            u.Dumping = row("Dumping")
                            u.Farmadd1 = row("Farmadd1")
                            u.Farmadd2 = row("Farmadd2")
                            u.Officeadd1 = row("Officeadd1")
                            u.Officeadd2 = row("Officeadd2")
                            u.Officetel = row("Officetel")
                            u.Officeman = row("Officeman")
                            u.Officesec = row("Officesec")
                            u.Officefax = row("Officefax")
                            u.Farmagr = row("Farmagr")
                            u.Products = row("Products")
                            u.Varieties = row("Varieties")
                            u.Area = row("Area")
                            u.BankName = row("BankName")
                            u.BankAdd1 = row("BankAdd1")
                            u.BankAdd2 = row("BankAdd2")
                            u.BankAccoun = row("BankAccoun")
                            u.Bankoff = row("Bankoff")
                            If (row("Fuel").ToString() = Nothing) Then
                                u.Fuel = 0
                            Else
                                u.Fuel = row("Fuel")
                            End If

                            u.Returnfuel = row("Returnfuel")
                            u.Email = row("Email")
                            If (Convert.ToString(row("KOMETID")).ToString() = "0" Or Convert.ToString(row("KOMETID")).ToString() = "") Then
                                u.KometID = ""
                            Else
                                u.KometID = row("KOMETID")
                            End If
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetFarmsListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function


        Public Shared Function GetFarmsbyID(ByVal ID As String) As Farm
            Try
                Dim u As New Farm
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SELECT * FROM F_FARM where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            u.ID = row("ID")
                            u.Farm = row("Farm")
                            u.Name = row("Name")
                            u.Vendor = If(row("Vendor") Is DBNull.Value, 0, row("Vendor"))
                            u.FOB = If(row("FOB") Is DBNull.Value, "", row("FOB"))
                            u.Partner = If(row("Partner") Is DBNull.Value, False, row("Partner"))
                            u.Commission = If(row("Commission") Is DBNull.Value, "", row("Commission"))
                            u.Antidump = If(row("Antidump") Is DBNull.Value, False, row("Antidump"))
                            u.City = If(row("City") Is DBNull.Value, "", row("City"))
                            u.GL = If(row("GL") Is DBNull.Value, "", row("GL"))
                            u.Country = If(row("Country") Is DBNull.Value, "", row("Country"))
                            u.Packret = If(row("Packret") Is DBNull.Value, 0, row("Packret"))
                            u.Manufacid = If(row("Manufacid") Is DBNull.Value, "", row("Manufacid"))
                            u.Dumping = If(row("Dumping") Is DBNull.Value, 0, row("Dumping"))
                            u.Farmadd1 = If(row("Farmadd1") Is DBNull.Value, "", row("Farmadd1"))
                            u.Farmadd2 = If(row("Farmadd2") Is DBNull.Value, "", row("Farmadd2"))
                            u.Officeadd1 = If(row("Officeadd1") Is DBNull.Value, "", row("Officeadd1"))
                            u.Officeadd2 = If(row("Officeadd2") Is DBNull.Value, "", row("Officeadd2"))
                            u.Officetel = If(row("Officetel") Is DBNull.Value, "", row("Officetel"))
                            u.Officeman = If(row("Officeman") Is DBNull.Value, "", row("Officeman"))
                            u.Officesec = If(row("Officesec") Is DBNull.Value, "", row("Officesec"))
                            u.Officefax = If(row("Officefax") Is DBNull.Value, "", row("Officefax"))
                            u.Farmagr = If(row("Farmagr") Is DBNull.Value, "", row("Farmagr"))
                            u.Products = If(row("Products") Is DBNull.Value, "", row("Products"))
                            u.Varieties = If(row("Varieties") Is DBNull.Value, "", row("Varieties"))
                            u.Area = If(row("Area") Is DBNull.Value, "", row("Area"))
                            u.BankName = If(row("BankName") Is DBNull.Value, "", row("BankName"))
                            u.BankAdd1 = If(row("BankAdd1") Is DBNull.Value, "", row("BankAdd1"))
                            u.BankAdd2 = If(row("BankAdd2") Is DBNull.Value, "", row("BankAdd2"))
                            u.BankAccoun = If(row("BankAccoun") Is DBNull.Value, "", row("BankAccoun"))
                            u.Bankoff = If(row("Bankoff") Is DBNull.Value, "", row("Bankoff"))
                            ' u.Fuel = row("Fuel")
                            u.Returnfuel = If(row("Returnfuel") Is DBNull.Value, "", row("Returnfuel"))
                            u.Email = If(row("Email") Is DBNull.Value, "", row("Email"))
                            u.KometID = If(row("KOMETID") Is DBNull.Value, "", row("KOMETID").ToString())
                            u.AddDate = If(row("AddDate") Is DBNull.Value, "", row("AddDate"))
                            u.FARMEMAIL = If(row("FARMEMAIL") Is DBNull.Value, "", row("FARMEMAIL"))
                            u.SALESPERSON = If(row("SALESPERSON") Is DBNull.Value, "", row("SALESPERSON"))
                            u.CELLULAR = If(row("CELLULAR") Is DBNull.Value, "", row("CELLULAR"))

                            u.OFFICEMANPHONE = If(row("OFFICEMANPHONE") Is DBNull.Value, "", row("OFFICEMANPHONE"))
                            u.OFFICESECPHONE = If(row("OFFICESECPHONE") Is DBNull.Value, "", row("OFFICESECPHONE"))
                            u.OWNER = If(row("OFFICEOWNER") Is DBNull.Value, "", row("OFFICEOWNER"))
                            u.OWNERPHONE = If(row("OFFICEOWNERPHONE") Is DBNull.Value, "", row("OFFICEOWNERPHONE"))
                            u.POSTHARVEST = If(row("POSTHARVEST") Is DBNull.Value, "", row("POSTHARVEST"))
                            u.POSTHARVESTPHONE = If(row("POSTHARVESTPHONE") Is DBNull.Value, "", row("POSTHARVESTPHONE"))
                        Next
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetFarmbyID")
                Return Nothing
            End Try
        End Function

        Public Shared Function UpdateFarmbyID(ByVal ID As String, ByVal Farm As String, ByVal FarmName As String, ByVal vendor As String, ByVal FOB As String, ByVal City As String, ByVal Country As String, ByVal Email As String, ByVal Products As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("update F_FARM set Farm=@Farm, CAT=@Cat, NAME=@Name, vendor=@vendor, FOB=@FOB,City=@City,Country=@Country where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@Farm", Farm)
                        cmd.Parameters.AddWithValue("@Name", FarmName)
                        cmd.Parameters.AddWithValue("@vendor", vendor)
                        cmd.Parameters.AddWithValue("@FOB", FOB)
                        cmd.Parameters.AddWithValue("@City", City)
                        cmd.Parameters.AddWithValue("@Country", Country)
                        cmd.Parameters.AddWithValue("@Email", Email)
                        cmd.Parameters.AddWithValue("@Products", Products)
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in UpdateFarmsbyID")
                Return "error"
            End Try
        End Function


    End Class
End Class


Public Class Farm
    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Private _Farm As String
    Public Property Farm() As String
        Get
            Return _Farm
        End Get
        Set(ByVal value As String)
            _Farm = value
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


    Private _SlNo As Integer = -1
    Public Property SlNo() As Integer
        Get
            Return _SlNo
        End Get
        Set(ByVal value As Integer)
            _SlNo = value
        End Set
    End Property



    Private _FarmCode As String
    Public Property FarmCode() As String
        Get
            Return _FarmCode
        End Get
        Set(ByVal value As String)
            _FarmCode = value
        End Set
    End Property

    Private _Vendor As Integer
    Public Property Vendor() As Integer
        Get
            Return _Vendor
        End Get
        Set(ByVal value As Integer)
            _Vendor = value
        End Set
    End Property

    Private _FOB As String
    Public Property FOB() As String
        Get
            Return _FOB
        End Get
        Set(ByVal value As String)
            _FOB = value
        End Set
    End Property

    Private _Partner As Boolean
    Public Property Partner() As Boolean
        Get
            Return _Partner
        End Get
        Set(ByVal value As Boolean)
            _Partner = value
        End Set
    End Property

    Private _Commission As String
    Public Property Commission() As String
        Get
            Return _Commission
        End Get
        Set(ByVal value As String)
            _Commission = value
        End Set
    End Property

    Private _Antidump As Boolean
    Public Property Antidump() As Boolean
        Get
            Return _Antidump
        End Get
        Set(ByVal value As Boolean)
            _Antidump = value
        End Set
    End Property


    Private _GL As String
    Public Property GL() As String
        Get
            Return _GL
        End Get
        Set(ByVal value As String)
            _GL = value
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

    Private _Packret As Integer
    Public Property Packret() As Integer
        Get
            Return _Packret
        End Get
        Set(ByVal value As Integer)
            _Packret = value
        End Set
    End Property

    Private _Manufacid As String
    Public Property Manufacid() As String
        Get
            Return _Manufacid
        End Get
        Set(ByVal value As String)
            _Manufacid = value
        End Set
    End Property

    Private _Dumping As Integer
    Public Property Dumping() As Integer
        Get
            Return _Dumping
        End Get
        Set(ByVal value As Integer)
            _Dumping = value
        End Set
    End Property

    Private _Farmadd1 As String
    Public Property Farmadd1() As String
        Get
            Return _Farmadd1
        End Get
        Set(ByVal value As String)
            _Farmadd1 = value
        End Set
    End Property

    Private _Farmadd2 As String
    Public Property Farmadd2() As String
        Get
            Return _Farmadd2
        End Get
        Set(ByVal value As String)
            _Farmadd2 = value
        End Set
    End Property

    Private _Officeadd1 As String
    Public Property Officeadd1() As String
        Get
            Return _Officeadd1
        End Get
        Set(ByVal value As String)
            _Officeadd1 = value
        End Set
    End Property

    Private _Officeadd2 As String
    Public Property Officeadd2() As String
        Get
            Return _Officeadd2
        End Get
        Set(ByVal value As String)
            _Officeadd2 = value
        End Set
    End Property

    Private _Officetel As String
    Public Property Officetel() As String
        Get
            Return _Officetel
        End Get
        Set(ByVal value As String)
            _Officetel = value
        End Set
    End Property

    Private _Officeman As String
    Public Property Officeman() As String
        Get
            Return _Officeman
        End Get
        Set(ByVal value As String)
            _Officeman = value
        End Set
    End Property

    Private _Officesec As String
    Public Property Officesec() As String
        Get
            Return _Officesec
        End Get
        Set(ByVal value As String)
            _Officesec = value
        End Set
    End Property

    Private _Officefax As String
    Public Property Officefax() As String
        Get
            Return _Officefax
        End Get
        Set(ByVal value As String)
            _Officefax = value
        End Set
    End Property

    Private _Farmagr As String
    Public Property Farmagr() As String
        Get
            Return _Farmagr
        End Get
        Set(ByVal value As String)
            _Farmagr = value
        End Set
    End Property

    Private _Products As String
    Public Property Products() As String
        Get
            Return _Products
        End Get
        Set(ByVal value As String)
            _Products = value
        End Set
    End Property

    Private _Varieties As String
    Public Property Varieties() As String
        Get
            Return _Varieties
        End Get
        Set(ByVal value As String)
            _Varieties = value
        End Set
    End Property

    Private _Area As String
    Public Property Area() As String
        Get
            Return _Area
        End Get
        Set(ByVal value As String)
            _Area = value
        End Set
    End Property

    Private _BankName As String
    Public Property BankName() As String
        Get
            Return _BankName
        End Get
        Set(ByVal value As String)
            _BankName = value
        End Set
    End Property

    Private _BankAdd1 As String
    Public Property BankAdd1() As String
        Get
            Return _BankAdd1
        End Get
        Set(ByVal value As String)
            _BankAdd1 = value
        End Set
    End Property

    Private _BankAdd2 As String
    Public Property BankAdd2() As String
        Get
            Return _BankAdd2
        End Get
        Set(ByVal value As String)
            _BankAdd2 = value
        End Set
    End Property

    Private _BankAccoun As String
    Public Property BankAccoun() As String
        Get
            Return _BankAccoun
        End Get
        Set(ByVal value As String)
            _BankAccoun = value
        End Set
    End Property

    Private _Bankoff As String
    Public Property Bankoff() As String
        Get
            Return _Bankoff
        End Get
        Set(ByVal value As String)
            _Bankoff = value
        End Set
    End Property

    Private _Fuel As Integer
    Public Property Fuel() As Integer
        Get
            Return _Fuel
        End Get
        Set(ByVal value As Integer)
            _Fuel = value
        End Set
    End Property

    Private _Returnfuel As Boolean
    Public Property Returnfuel() As Boolean
        Get
            Return _Returnfuel
        End Get
        Set(ByVal value As Boolean)
            _Returnfuel = value
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
    Private _KometID As String
    Public Property KometID() As String
        Get
            Return _KometID
        End Get
        Set(ByVal value As String)
            _KometID = value
        End Set
    End Property
    Private _STATUS As String
    Public Property STATUS() As String
        Get
            Return _STATUS
        End Get
        Set(ByVal value As String)
            _STATUS = value
        End Set
    End Property

    Private _FARMEMAIL As String
    Public Property FARMEMAIL() As String
        Get
            Return _FARMEMAIL
        End Get
        Set(ByVal value As String)
            _FARMEMAIL = value
        End Set
    End Property

    Private _Selected As Boolean
    Public Property Selected() As String
        Get
            Return _Selected
        End Get
        Set(ByVal value As String)
            _Selected = value
        End Set
    End Property

    Private _AddDate As String
    Public Property AddDate() As String
        Get
            Return _AddDate
        End Get
        Set(ByVal value As String)
            _AddDate = value
        End Set
    End Property


    Private _SALESPERSON As String
    Public Property SALESPERSON() As String
        Get
            Return _SALESPERSON
        End Get
        Set(ByVal value As String)
            _SALESPERSON = value
        End Set
    End Property

    Private _CELLULAR As String
    Public Property CELLULAR() As String
        Get
            Return _CELLULAR
        End Get
        Set(ByVal value As String)
            _CELLULAR = value
        End Set
    End Property

    Private _Owner As String
    Public Property OWNER() As String
        Get
            Return _Owner
        End Get
        Set(ByVal value As String)
            _Owner = value
        End Set
    End Property

    Private _OwnerPhone As String
    Public Property OWNERPHONE() As String
        Get
            Return _OwnerPhone
        End Get
        Set(ByVal value As String)
            _OwnerPhone = value
        End Set
    End Property

    Private _OFFICESECPHONE As String
    Public Property OFFICESECPHONE() As String
        Get
            Return _OFFICESECPHONE
        End Get
        Set(ByVal value As String)
            _OFFICESECPHONE = value
        End Set
    End Property

    Private _ManagerPhone As String
    Public Property OFFICEMANPHONE() As String
        Get
            Return _ManagerPhone
        End Get
        Set(ByVal value As String)
            _ManagerPhone = value
        End Set
    End Property

    Private _PostHarVest As String
    Public Property POSTHARVEST() As String
        Get
            Return _PostHarVest
        End Get
        Set(ByVal value As String)
            _PostHarVest = value
        End Set
    End Property

    Private _PostHarVestPhone As String
    Public Property POSTHARVESTPHONE() As String
        Get
            Return _PostHarVestPhone
        End Get
        Set(ByVal value As String)
            _PostHarVestPhone = value
        End Set
    End Property

    'added by belal for f_farmpr on 03 april 2021

    Private _LASTCOST As Decimal
    Public Property LASTCOST() As Decimal
        Get
            Return _LASTCOST
        End Get
        Set(ByVal value As Decimal)
            _LASTCOST = value
        End Set
    End Property

    Private _DATELAST As String
    Public Property DATELAST() As String
        Get
            Return _DATELAST
        End Get
        Set(ByVal value As String)
            _DATELAST = value
        End Set
    End Property

    Private _Price As Decimal
    Public Property Price() As Decimal
        Get
            Return _Price
        End Get
        Set(ByVal value As Decimal)
            _Price = value
        End Set
    End Property

End Class
