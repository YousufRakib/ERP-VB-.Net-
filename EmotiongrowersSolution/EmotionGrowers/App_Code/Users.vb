Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO

Public Class Users

    Public Shared SITE As String = System.Configuration.ConfigurationManager.AppSettings("SiteURL")

    Public Shared Function GetUserTypeAccessRightsDetails(ByVal ID As Integer, ByVal OrderRightsPosition As Integer) As String
        Try


            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim UserTypeAcess As String
            Using cmd As New SqlCommand("select substring([Order]," + OrderRightsPosition.ToString() + ",1) as OrderRights from tblusers where ID=@Id", SqlCon)
                cmd.Parameters.AddWithValue("@Id", ID)
                cmd.CommandType = CommandType.Text
                UserTypeAcess = cmd.ExecuteScalar()
                'Dim da As New SqlDataAdapter(cmd)
                'Dim dt As New DataTable
                'da.Fill(dt)
                'For Each row In dt.Rows
                '    UserTypeAcess = row("Column1")
                'Next
            End Using
            Return UserTypeAcess
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetUserTypeAccessRightsDetails")
            Return ex.Message
        End Try
    End Function
    ''' <summary>
    ''' Muthu Nivetha M :: 16Mar2020 :: :: Modified :: To save value for column Inventoryaccesstypes in tblusers
    ''' </summary>
    Public Shared Function SaveOrUpdateUserDetails(ByVal Name As String, ByVal Email As String, ByVal UserName As String, ByVal Password As String, ByVal IsActive As String, Landing As String, ByVal UserType As String, ByVal OldUserID As Integer, ByVal FarmList As List(Of Farm), ByVal Permissions As String, ByVal AgencyCode As String, ByVal WarehouseId As String, ByVal IsAdmin As String, ByVal CustomerNo As String, ByVal Division As String, ByVal SalesPerson As String, ByVal IsGrowerDelete As String, ByVal IsGrowerlock As String, ByVal IsSetupsFile As String, ByVal IsSetupsReports As String, ByVal IsSetupsAdmin As String, ByVal IsSetupsImport As String, ByVal ORDER As String, ByVal InventoryAccesstypes As String, ByVal isDuplicateBoxMaintance As Boolean) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim UserScopeID As String = ""
            Dim Cmd As New SqlCommand(IIf(OldUserID = 0 Or isDuplicateBoxMaintance, "spSaveUserDetails", "spUpdateUserDetails"), SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@Email", Email)
            Cmd.Parameters.AddWithValue("@Name", Name)
            Cmd.Parameters.AddWithValue("@UserName", UserName)
            Cmd.Parameters.AddWithValue("@Password", Password)
            Cmd.Parameters.AddWithValue("@IsActive", IsActive)
            Cmd.Parameters.AddWithValue("@Permissions", Permissions)
            Cmd.Parameters.AddWithValue("@Landing", Landing)
            Cmd.Parameters.AddWithValue("@AgencyCode", AgencyCode)
            Cmd.Parameters.AddWithValue("@UserTypeID", UserType)
            Cmd.Parameters.AddWithValue("@Warehouse", WarehouseId)
            Cmd.Parameters.AddWithValue("@IsAdmin", IsAdmin)
            Cmd.Parameters.AddWithValue("@CustomerNo", IIf(CustomerNo = "", 0, CustomerNo))
            Cmd.Parameters.AddWithValue("@Division", IIf(Division = "", 0, Division))
            Cmd.Parameters.AddWithValue("@SalesPerson", SalesPerson)
            Cmd.Parameters.AddWithValue("@IsGrowerDelete", IsGrowerDelete)
            Cmd.Parameters.AddWithValue("@IsGrowerlock", IsGrowerlock)
            Cmd.Parameters.AddWithValue("@IsSetupsFile", IsSetupsFile)
            Cmd.Parameters.AddWithValue("@IsSetupsReports", IsSetupsReports)
            Cmd.Parameters.AddWithValue("@IsSetupsAdmin", IsSetupsAdmin)
            Cmd.Parameters.AddWithValue("@IsSetupsImport", IsSetupsImport)
            Cmd.Parameters.AddWithValue("@ORDER", ORDER)
            Cmd.Parameters.AddWithValue("@Inventoryaccesstypes", InventoryAccesstypes)
            If (OldUserID <> 0 And isDuplicateBoxMaintance = False) Then
                Cmd.Parameters.AddWithValue("@UserID", OldUserID)
                Cmd.ExecuteNonQuery()
                UserScopeID = OldUserID.ToString()

                Cmd.CommandText = "delete from tblUserFarm where UserID=@UserID"
                Cmd.CommandType = CommandType.Text
                Cmd.Parameters.Clear()
                Cmd.Parameters.AddWithValue("@UserID", UserScopeID)
                Cmd.ExecuteNonQuery()
            Else
                UserScopeID = Cmd.ExecuteScalar()
            End If

            For Each ObjFarm In FarmList
                Cmd.CommandText = "insert into tblUserFarm(UserID, Farm,Name,City)values(@UserID, @Farm,@Name,@City)"
                Cmd.CommandType = CommandType.Text
                Cmd.Parameters.Clear()
                Cmd.Parameters.AddWithValue("@UserID", UserScopeID)
                Cmd.Parameters.AddWithValue("@Farm", ObjFarm.Farm)
                Cmd.Parameters.AddWithValue("@Name", ObjFarm.Name)
                Cmd.Parameters.AddWithValue("@City", ObjFarm.City)
                Cmd.ExecuteNonQuery()
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
                Logs.Savelog(LoginUserDetails.ID, "Users", IIf(OldUserID = 0, "SaveUserDetails", "UpdateUserDetails"), IIf(OldUserID = 0, "Added new user <b>" + GetUserByID(UserScopeID).Name + "</b>", "Updated user <b>"), UserScopeID.ToString())
            End If
            Return IIf(OldUserID = 0, UserScopeID, "valid")
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, IIf(OldUserID = 0, "Error in SaveUserDetails", "Error in UpdateUserDetails"))
            End If
            Return ex.Message
        End Try
    End Function
    ''' <summary>
    ''' Muthu Nivetha M :: 16Mar2020 :: :: Modified :: To get value for column Inventoryaccesstypes in tblusers
    ''' </summary>
    Public Shared Function GetUserByID(ID As Integer) As User
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New User
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwusers where ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.Name = row("Name")
                        u.Email = row("Email")
                        u.UserName = row("UserName")
                        u.Password = Decrypt(row("Password"))
                        u.Landing = row("Landing")
                        u.PendingPOs = row("PendingPOs")
                        u.ConfirmedPOs = row("ConfirmedPOs")
                        u.ShippedPOs = row("ShippedPOs")
                        u.Users = IIf(row("Users") Is DBNull.Value, "0", row("Users"))
                        u.Availability = IIf(row("Availability") Is DBNull.Value, "0", row("Availability"))
                        u.Credits = IIf(row("Credits") Is DBNull.Value, "0", row("Credits"))
                        u.UserTypeID = row("UserTypeID")
                        u.AdminUsers = row("AdminUsers")
                        u.AdminEmails = row("AdminEmails")
                        u.IsActive = IIf(row("IsActive") Is DBNull.Value, "0", row("IsActive"))
                        u.Admin = row("Admin")
                        u.AgencyCode = Convert.ToString(row("AgencyCode"))
                        u.Warehouse.WarehouseID = Convert.ToString(row("Warehouse"))
                        u.Warehouse.Name = Convert.ToString(row("WHName"))
                        u.Warehouse.City = Convert.ToString(row("WHCity"))
                        u.CustomerNo = IIf(row("CustomerNo") Is DBNull.Value, "0", row("CustomerNo"))
                        u.Division = IIf(row("Division") Is DBNull.Value, "0", row("Division"))
                        u.SalesPerson = IIf(row("SalesPerson") Is DBNull.Value, "", row("SalesPerson"))
                        u.IsGrowerDelete = row("IsGrowerDelete")
                        u.IsGrowerlock = IIf(row("IsGrowerlock") Is DBNull.Value, False, row("IsGrowerlock"))
                        u.LastLogin = IIf(row("LastLogin") Is DBNull.Value, "", row("LastLogin"))
                        u.IsSetupsFile = IIf(row("IsSetupsFile") Is DBNull.Value, False, row("IsSetupsFile"))
                        u.IsSetupsReports = IIf(row("IsSetupsReports") Is DBNull.Value, False, row("IsSetupsReports"))
                        u.IsSetupsAdmin = IIf(row("IsSetupsAdmin") Is DBNull.Value, False, row("IsSetupsAdmin"))
                        u.IsSetupsImport = IIf(row("IsSetupsImport") Is DBNull.Value, "", row("IsSetupsImport"))
                        u.ORDER = IIf(row("ORDER") Is DBNull.Value, "", row("ORDER"))
                        u.InventoryAccesstypes = IIf(row("INVENTORYACCESSTYPES") Is DBNull.Value, "", row("INVENTORYACCESSTYPES"))
                        u.InvenFlagTypesList = Inventory.GetTypeForInventory()
                    Next
                End Using

                Using cmd As New SqlCommand("select * from vwUserAssignedFarms where UserID=@Id order by Farm", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@Id", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row As DataRow In ds.Rows
                        Dim Farm As New Farm
                        Farm.SlNo = u.NextFarmListSlno
                        Farm.Farm = IIf(row("Farm") Is DBNull.Value, "", row("Farm"))
                        Farm.Name = IIf(row("Name") Is DBNull.Value, "", row("Name"))
                        Farm.City = IIf(row("City") Is DBNull.Value, "", row("City"))
                        u.FarmList.Add(Farm)
                    Next
                End Using


                Using cmd As New SqlCommand("select * from tblUserPermission where UserID=@Id", con)
                    cmd.Parameters.AddWithValue("@Id", ID)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row As DataRow In ds.Rows
                        Dim webper As New WebPermission
                        webper.PageID = row("PageID")
                        webper.UserID = row("UserID")
                        u.WebPermissions.Add(webper)
                    Next
                End Using

                Using cmd As New SqlCommand("select * from tblUserWarehouse where UserID=@Id", con)
                    cmd.Parameters.AddWithValue("@Id", ID)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row As DataRow In ds.Rows
                        Dim warehouse As New Warehouse
                        warehouse.WarehouseID = row("WarehouseID")
                        warehouse.UserID = row("UserID")
                        u.WarehouseList.Add(warehouse)
                    Next
                End Using

            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserByID")
            Return Nothing
        End Try

    End Function

    Shared Function ToggleUsersIsActive(ID As Integer, IsActive As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblusers set IsActive=@IsActive where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@IsActive", IsActive)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Dim LoginUserDetails As New User
            Dim Action As String = ""
            If (IsActive = True) Then
                Action = "Activated the user <b>" + GetUserByID(ID).Name + "</b>"
            Else
                Action = "Deactivated the user <b>" + GetUserByID(ID).Name + "</b>"
            End If

            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Users", "ToggleUsersIsActive", Action, ID.ToString())
            End If

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleUsersIsActive")
        End Try
        Return "invalid"
    End Function


    Public Shared Function GetNameAuto(ByVal Name As String) As List(Of User)
        Try
            Dim uname As New List(Of User)

            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "select Name from tblUsers where " & "(Name like @SearchText + '%')"
                    cmd.Parameters.AddWithValue("@SearchText", Name)
                    cmd.Connection = conn
                    conn.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()
                            Dim c As New User()
                            c.Name = sdr("Name")
                            uname.Add(c)
                        End While
                    End Using
                    conn.Close()
                End Using
            End Using
            Return uname
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetNameAuto")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetUserNameAuto(ByVal UserName As String) As List(Of User)
        Try
            Dim uname As New List(Of User)

            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "select UserName from tblUsers where " & "(UserName like @SearchText + '%')"
                    cmd.Parameters.AddWithValue("@SearchText", UserName)
                    cmd.Connection = conn
                    conn.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()
                            Dim c As New User()
                            c.UserName = sdr("UserName")
                            uname.Add(c)
                        End While
                    End Using
                    conn.Close()
                End Using
            End Using
            Return uname
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserNameAuto")
            Return Nothing
        End Try
    End Function


    Public Shared Function GetLandingAuto(ByVal Landing As String) As List(Of User)
        Try
            Dim uname As New List(Of User)

            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "select distinct Landing from tblUsers where " & "(Landing like @SearchText + '%')"
                    cmd.Parameters.AddWithValue("@SearchText", Landing)
                    cmd.Connection = conn
                    conn.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()
                            Dim c As New User()
                            c.Landing = sdr("Landing")
                            uname.Add(c)
                        End While
                    End Using
                    conn.Close()
                End Using
            End Using
            Return uname
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetLandingAuto")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' VEN::10-JUL-2015::to encrypt the user password
    ''' </summary>
    ''' <param name="OriginalText"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function Encrypt(OriginalText As String) As String
        Try
            Dim EncryptionKey As String = "MAKV2SPBNI99212"
            Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(OriginalText)
            Using encryptor As Aes = Aes.Create()
                Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D,
                 &H65, &H64, &H76, &H65, &H64, &H65,
                 &H76})
                encryptor.Key = pdb.GetBytes(32)
                encryptor.IV = pdb.GetBytes(16)
                Using ms As New MemoryStream()
                    Using cs As New CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)
                        cs.Write(clearBytes, 0, clearBytes.Length)
                        cs.Close()
                    End Using
                    OriginalText = Convert.ToBase64String(ms.ToArray())
                End Using
            End Using
            Return OriginalText
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Encrypt")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' VEN::10-JUL-2015::to decrypt the user password
    ''' </summary>
    ''' <param name="cipherText"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function Decrypt(cipherText As String) As String
        Try
            Dim EncryptionKey As String = "MAKV2SPBNI99212"
            Dim cipherBytes As Byte() = Convert.FromBase64String(cipherText)
            Using encryptor As Aes = Aes.Create()
                Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D,
                 &H65, &H64, &H76, &H65, &H64, &H65,
                 &H76})
                encryptor.Key = pdb.GetBytes(32)
                encryptor.IV = pdb.GetBytes(16)
                Using ms As New MemoryStream()
                    Using cs As New CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write)
                        cs.Write(cipherBytes, 0, cipherBytes.Length)
                        cs.Close()
                    End Using
                    cipherText = Encoding.Unicode.GetString(ms.ToArray())
                End Using
            End Using
            Return cipherText
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Decrypt")
            Return "error"
        End Try
    End Function

    Shared Function SendUserCredentials(ByVal UserID As String) As User
        Try
            Dim u As New User
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "select * from vwUserDetails where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@ID", UserID)
                Dim da As New SqlDataAdapter(Cmd)
                Dim dt As New DataTable
                da.Fill(dt)
                For Each row In dt.Rows
                    u.Email = row("Email")
                    u.UserName = row("UserName")
                    u.Password = Decrypt(row("Password"))
                Next
            End Using
            SqlCon.Close()

            'Return Logs.UsersCredentailEmailLogs(u.Email, u.UserName, Decrypt(u.Password), "", "Your credentials for " + ConfigurationManager.AppSettings("CompanyNameForLabel") + " web site")
            Return u


        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SendUserCredentials")
        End Try
        Return Nothing
    End Function

    Public Shared Function GetAllUsers() As List(Of User)
        Try
            Dim uname As New List(Of User)

            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "select * from vwUserDetails"
                    cmd.Connection = conn
                    conn.Open()
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim u As New User()
                        u.ID = row("ID")
                        u.Name = row("Name")
                        u.Email = row("Email")
                        u.UserName = row("UserName")
                        u.Password = row("Password")
                        u.Landing = row("Landing")
                        u.PendingPOs = row("PendingPOs")
                        u.ConfirmedPOs = row("ConfirmedPOs")
                        u.ShippedPOs = row("ShippedPOs")
                        u.Users = row("Users")
                        u.Availability = row("Availability")
                        u.Credits = row("Credits")
                        u.UserTypeID = row("UserTypeID")
                        u.AdminUsers = row("AdminUsers")
                        u.AdminEmails = row("AdminEmails")
                        u.Admin = row("Admin")
                        uname.Add(u)
                    Next
                End Using
                conn.Close()

            End Using
            Return uname
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAllUsers")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' Muthu Nivetha M :: 16Mar2020 :: :: Modified :: To get value for column Inventoryaccesstypes in tblusers
    ''' </summary>
    Public Shared Function ValidateLogin(ByVal Username As String, ByVal Password As String) As User
        Try
            Dim u As New User
            Dim ConString As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using SqlCon As New SqlConnection(ConString)
                SqlCon.Open()
                Using SqlCmd As New SqlCommand("select * from vwUserDetails where UserName=@username and Password=@password", SqlCon)
                    SqlCmd.Parameters.AddWithValue("@username", Username)
                    SqlCmd.Parameters.AddWithValue("@password", Encrypt(Password))
                    Dim da As New SqlDataAdapter(SqlCmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        u.ID = row("ID")
                        u.Name = row("Name")
                        u.Email = row("Email")
                        u.UserName = row("UserName")
                        u.Password = row("Password")
                        u.Landing = row("Landing")
                        u.PendingPOs = row("PendingPOs")
                        u.ConfirmedPOs = row("ConfirmedPOs")
                        u.ShippedPOs = row("ShippedPOs")
                        u.Users = row("Users")
                        u.Availability = row("Availability")
                        u.Credits = row("Credits")
                        u.UserTypeID = row("UserTypeID")
                        u.AdminUsers = row("AdminUsers")
                        u.AdminEmails = row("AdminEmails")
                        u.Admin = row("Admin")
                        u.UserType = row("UserType")
                        'Dim fm As New Farm
                        'fm.Farm = IIf(row("FARM") Is DBNull.Value, "", row("FARM"))
                        'u.FarmList.Add(fm)
                        'u.FarmList = IIf(row("FARMNAME") Is DBNull.Value, "", row("FARMNAME"))
                        u.Farms = IIf(row("FARM") Is DBNull.Value, "", row("FARM"))
                        'u.Citys = IIf(row("City") Is DBNull.Value, "", row("City"))
                        'u.FarmList = Farms.GetFarmByUserID(row("ID"))
                        u.RP = Convert.ToString(row("RP"))
                        u.AgencyCode = Convert.ToString(row("AgencyCode"))
                        u.CustomerNo = IIf(row("CustomerNo") Is DBNull.Value, "0", row("CustomerNo"))
                        u.Division = IIf(row("Division") Is DBNull.Value, "0", row("Division"))
                        u.SalesPerson = IIf(row("SalesPerson") Is DBNull.Value, "", row("SalesPerson"))
                        u.IsGrowerDelete = row("IsGrowerDelete")
                        u.IsGrowerlock = IIf(row("IsGrowerlock") Is DBNull.Value, False, row("IsGrowerlock"))
                        'u.Warehouse.WH = Convert.ToString(row("Wh"))
                        'u.Warehouse.Name = Convert.ToString(row("whName"))
                        'u.Warehouse.City = Convert.ToString(row("whCity"))
                        u.WarehouseList = Getwarehouseforuser(row("ID"))
                        u.IsActive = IIf(row("IsActive") Is DBNull.Value, False, row("IsActive"))
                        u.ORDER = IIf(row("ORDER") Is DBNull.Value, "", row("ORDER"))
                        u.IsSetupsFile = IIf(row("IsSetupsFile") Is DBNull.Value, False, row("IsSetupsFile"))
                        u.IsSetupsReports = IIf(row("IsSetupsReports") Is DBNull.Value, False, row("IsSetupsReports"))
                        u.IsSetupsAdmin = IIf(row("IsSetupsAdmin") Is DBNull.Value, False, row("IsSetupsAdmin"))
                        u.IsSetupsImport = IIf(row("IsSetupsImport") Is DBNull.Value, "", row("IsSetupsImport"))
                        u.InventoryAccesstypes = IIf(row("InventoryAccesstypes") Is DBNull.Value, "", row("InventoryAccesstypes"))
                        u.InvenFlagTypesList = Inventory.GetTypeForInventory()
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ValidateLogin")
            Return Nothing
        End Try
    End Function

    Public Shared Function Getwarehouseforuser(ByVal UserID As String) As List(Of Warehouse)
        Try
            Dim uList As New List(Of Warehouse)
            Dim ConString As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using SqlCon As New SqlConnection(ConString)
                SqlCon.Open()
                Using SqlCmd As New SqlCommand("select * from tblUserWarehouse uwh inner join tblWarehouse wh on wh.ID=uwh.WarehouseID where uwh.UserID=@UserID", SqlCon)
                    SqlCmd.Parameters.AddWithValue("@UserID", UserID)
                    Dim da As New SqlDataAdapter(SqlCmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim u As New Warehouse
                        u.WarehouseID = row("WarehouseID")
                        u.UserID = row("UserID")
                        u.WH = row("WH")
                        u.Name = row("Name")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Getwarehouseforuser")
            Return Nothing
        End Try
    End Function



    Public Shared Function ReadFiles(Filename As String) As String
        Dim body As String = ""
        If System.IO.File.Exists(HttpContext.Current.Request.MapPath("~/EmailTemplates/" + Filename + "")) Then
            body = System.IO.File.ReadAllText(HttpContext.Current.Request.MapPath("~/EmailTemplates/" + Filename + ""))
        End If
        Return body
    End Function




    Public Shared Function LoginNotificationEmails(ByVal LoggedUserName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim UserScopeID As String = ""
            Dim EmailIds As String = ""

            Using SqlCmd As New SqlCommand("select * from tblSysEmail where WebLogin=@LoginId", SqlCon)
                SqlCmd.Parameters.AddWithValue("@LoginId", "1")
                Dim da As New SqlDataAdapter(SqlCmd)
                Dim dt As New DataTable
                Dim ds As New DataSet
                da.Fill(ds)
                Dim i As Integer = 0
                For Each row In ds.Tables(0).Rows
                    If i = 0 Then
                        EmailIds = row("Email")
                    Else
                        EmailIds = EmailIds + "," + row("Email")
                    End If
                    i = i + 1
                Next
            End Using

            Dim body As String = ReadFiles("LoginNotification.html")
            body = body.Replace("~~~", LoggedUserName)
            '' body = System.IO.File.ReadAllText(HttpContext.Current.Request.MapPath("~/EmailTemplates/Temp1.html"))

            Dim Cmd As New SqlCommand("insert into tblemail(Priority,EmailIDs,Subject,Body,NoOfAttempt,ScheduleDT,IsSent) values " +
                                      "(@Priority,@EmailIDs,@Subject,@Body,@NoOfAttempt,@ScheduleDT,@IsSent)", SqlCon)
            Cmd.CommandType = CommandType.Text
            Cmd.Parameters.AddWithValue("@Priority", "1")
            Cmd.Parameters.AddWithValue("@EmailIDs", EmailIds)
            Cmd.Parameters.AddWithValue("@Subject", "User Login")
            Cmd.Parameters.AddWithValue("@Body", body)
            Cmd.Parameters.AddWithValue("@NoOfAttempt", "0")
            Cmd.Parameters.AddWithValue("@ScheduleDT", DateAndTime.Now)
            Cmd.Parameters.AddWithValue("@IsSent", "0")

            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()

            Return "Valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoginNotificationEmails")
            Return ex.Message
        End Try
    End Function

    Shared Function UpdateLastLoggedIn(ID As Integer, LastLogin As DateTime) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "UPDATE tblusers set LastLogin=@LastLogin where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@LastLogin", LastLogin)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            'Dim LoginUserDetails As New User

            'If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
            '    LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            'ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
            '    LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            'End If
            'If (Not LoginUserDetails Is Nothing) Then
            '    Logs.Savelog(LoginUserDetails.ID, "Users", "UpdateLastLoggedIn", Action, ID.ToString())
            'End If

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateLastLoggedIn")
        End Try
        Return "invalid"
    End Function

    Public Class GetUsersDetails
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetUsers(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of User)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of User)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetUsers", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New User()
                            u.ID = row("ID")
                            u.Name = row("Name")
                            u.Email = row("Email")
                            u.UserName = row("UserName")
                            u.Password = row("Password")
                            u.Landing = row("Landing")
                            u.PendingPOs = row("PendingPOs")
                            u.ConfirmedPOs = row("ConfirmedPOs")
                            u.ShippedPOs = row("ShippedPOs")
                            u.UserType = row("UserType")
                            u.UserTypeID = row("UserTypeID")
                            u.AdminUsers = row("AdminUsers")
                            u.AdminEmails = row("AdminEmails")
                            u.Admin = row("Admin")
                            u.IsActive = IIf(row("IsActive") Is DBNull.Value, "0", row("IsActive"))
                            u.FarmCode = IIf(row("FarmCode") Is DBNull.Value, "", row("FarmCode"))
                            u.LastLogin = IIf(row("LastLogin") Is DBNull.Value, "", row("LastLogin"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetUsers")
                Return Nothing
            End Try
        End Function
    End Class

    Public Shared Function DeleteUser(ID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim UList As User = GetUserByID(ID)
            Dim sql As String = "Delete from tblUsers where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using

            ''to delete the assigned farms
            Using Cmd As New SqlCommand("delete from tbluserfarm where userid=@id", SqlCon)
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
                Logs.Savelog(LoginUserDetails.ID, "Users", "DeleteUser", "Removed the user <b>" + UList.Name + "</b>", ID.ToString())
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteUser")
        End Try
        Return "invalid"
    End Function

    ''' <summary>
    ''' STA::22-JUL-2015::to get the Users form rights
    ''' </summary>
    ''' <param name="UserId"></param>
    ''' <param name="Form"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetUserFormRights(UserId As Integer, ByVal Form As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "select w.*,ut.UserType,u.UserTypeID from tblWebPermission w " +
                                " left join tblUserTypePermission u on w.ID=u.PageID " +
                                " left join tblUserPermission up on up.PageID=w.ID " +
                                " left join tblUserType ut on ut.ID=u.UserTypeID " +
                                " where up.UserID=@UserId and [Page]=@Form "
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@UserId", UserId)
                Cmd.Parameters.AddWithValue("@Form", Form)
                Cmd.CommandType = CommandType.Text
                Dim da As New SqlDataAdapter
                da = New SqlDataAdapter(Cmd)
                Dim dt As New DataTable
                da.Fill(dt)
                If (dt.Rows.Count > 0) Then
                    Return dt.Rows(0)("Page").ToString()
                Else
                    Return ""
                End If
            End Using
            SqlCon.Close()
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserFormRights")
            Return "error"
        End Try
    End Function

    Public Shared Function UpdateRPforUser(UserId As Integer, ByVal RP As String, ByVal UserName As String, Password As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "update tblUsers set RP=@RP where ID=@UserID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@UserId", UserId)
                Cmd.Parameters.AddWithValue("@RP", RP)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()

                Dim UserDetails As User = Users.ValidateLogin(UserName, Password)
                If UserDetails.UserName <> Nothing Or UserDetails.UserName <> "" Then

                    If UserDetails.UserTypeID = "1" Then
                        System.Web.HttpContext.Current.Session("IsAdmin") = True
                        'System.Web.HttpContext.Current.Session("LoginAdminDetails") = UserDetails
                        System.Web.HttpContext.Current.Session("LoginUserDetails") = UserDetails
                    Else
                        System.Web.HttpContext.Current.Session("IsAdmin") = False
                        System.Web.HttpContext.Current.Session("LoginUserDetails") = UserDetails
                    End If
                End If

                Return "valid"
            End Using
            SqlCon.Close()
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateRPforUser")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' VEN::12-Nov-2015::For update user password
    ''' </summary>
    ''' <param name="UserID"></param>
    ''' <param name="Password"></param>
    ''' <returns></returns>
    Public Shared Function UpdateUserPassword(ByVal UserID As Integer, ByVal Password As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "update tblUsers set Password=@password where ID=@UserID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@UserId", UserID)
                Cmd.Parameters.AddWithValue("@password", Encrypt(Password))
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
                Return "success"
            End Using
            SqlCon.Close()
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateUserPassword")
            Return "error"
        End Try
    End Function

    Public Shared Function GetUserPageList(ByVal UserID As Integer) As User
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New User
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            'Dim sql As String = "select * from vwGetUserPageDetails where UserID=@UserId order by SortOrder asc"
            Dim sql As String = ""
            Dim LoginUserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If LoginUserDetails.UserType.ToLower() = "admin" Then
                sql = "select distinct *,'' Landing from tblWebPermission where IsAdmin=0 and ISActive=1 and Page not in ('DynamicGrid','WebPermission','Features','') order by SortOrder asc"
            Else
                sql = "select vw.*,isnull(u.Landing,'') Landing from vwGetUserPageDetails vw left join tblUsers u  on vw.UserID=u.ID and vw.Page=u.Landing where UserID=@UserID order by SortOrder asc"
            End If
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@UserId", UserID)
                Cmd.CommandType = CommandType.Text
                Dim da As New SqlDataAdapter(Cmd)
                Dim ds As New DataSet
                da.Fill(ds)
                Dim wpList As New List(Of WebPermission)
                For Each row In ds.Tables(0).Rows
                    Dim wp As New WebPermission
                    wp.PageID = row("ID")
                    wp.Page = row("Page")
                    wp.Name = row("Name")
                    wp.Landing = row("Landing")
                    wpList.Add(wp)
                Next
                u.WebPermissions = wpList
            End Using
            SqlCon.Close()
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserPageList")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="UserName"></param>
    ''' <returns></returns>
    Public Shared Function ResetPassword(ByVal UserName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Using Cmd As New SqlCommand(String.Format("select Email,UserName,Password from tblUsers where UserName='{0}'", UserName), SqlCon)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim tbl As New DataTable
                    da.Fill(tbl)
                    Cmd.Dispose()
                    SqlCon.Close()
                    If tbl.Rows.Count > 0 Then
                        Dim EmailId As String = tbl.Rows(0)(0).ToString()
                        Dim Body As String = "Username :" + tbl.Rows(0)(1).ToString() + "\n Password :" + Decrypt(tbl.Rows(0)(2).ToString())
                        Dim Subject As String = "Your credentials for " + ConfigurationManager.AppSettings("CompanyName").ToString() + " web site"
                        Try
                            Logs.SendEmail("", EmailId, Body, "", Subject)
                            Return "valid"
                        Catch
                        End Try
                    End If
                End Using
            End Using
        Catch
        End Try
        Return "invalid"
    End Function

    Public Shared Function GetUserEmailBySalesPerson(ByVal SalesPerson As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dsSalesman As New DataSet()
            Using sqlCon As New SqlConnection(ConStr)
                sqlCon.Open()
                Dim qry = "SELECT SALESPERSON, EMAIL FROM tblUsers WHERE SALESPERSON = '" + SalesPerson + "'"

                Using sqlCmd As New SqlCommand(qry, sqlCon)
                    Dim da As New SqlDataAdapter(sqlCmd)
                    da.Fill(dsSalesman)
                End Using
            End Using

            Dim salesEmail As String = ""
            If dsSalesman.Tables(0).Rows.Count > 0 Then
                salesEmail = dsSalesman.Tables(0).Rows(0)("EMAIL").ToString()
            End If

            Return salesEmail
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserEmailBySalesPerson")
            Return Nothing
        End Try
    End Function

End Class

Public Class User

    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property



    Private _UserTypeID As Integer
    Public Property UserTypeID() As Integer
        Get
            Return _UserTypeID
        End Get
        Set(ByVal value As Integer)
            _UserTypeID = value
        End Set
    End Property




    Private _UserType As String
    Public Property UserType() As String
        Get
            Return _UserType
        End Get
        Set(ByVal value As String)
            _UserType = value
        End Set
    End Property

    Private _AgencyCode As String
    Public Property AgencyCode() As String
        Get
            Return _AgencyCode
        End Get
        Set(ByVal value As String)
            _AgencyCode = value
        End Set
    End Property

    Private _WarehouseIDList As String
    Public Property WarehouseIDList() As String
        Get
            Return _WarehouseIDList
        End Get
        Set(ByVal value As String)
            _WarehouseIDList = value
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

    Private _Email As String
    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(ByVal value As String)
            _Email = value
        End Set
    End Property

    Private _UserName As String
    Public Property UserName() As String
        Get
            Return _UserName
        End Get
        Set(ByVal value As String)
            _UserName = value
        End Set
    End Property

    Private _Password As String
    Public Property Password() As String
        Get
            Return _Password
        End Get
        Set(ByVal value As String)
            _Password = value
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

    Private _PendingPOs As Boolean
    Public Property PendingPOs() As Boolean
        Get
            Return _PendingPOs
        End Get
        Set(ByVal value As Boolean)
            _PendingPOs = value
        End Set
    End Property

    Private _ConfirmedPOs As Boolean
    Public Property ConfirmedPOs() As Boolean
        Get
            Return _ConfirmedPOs
        End Get
        Set(ByVal value As Boolean)
            _ConfirmedPOs = value
        End Set
    End Property

    Private _ShippedPOs As Boolean
    Public Property ShippedPOs() As Boolean
        Get
            Return _ShippedPOs
        End Get
        Set(ByVal value As Boolean)
            _ShippedPOs = value
        End Set
    End Property

    Private _Users As Boolean
    Public Property Users() As Boolean
        Get
            Return _Users
        End Get
        Set(ByVal value As Boolean)
            _Users = value
        End Set
    End Property

    Private _Availability As Boolean
    Public Property Availability() As Boolean
        Get
            Return _Availability
        End Get
        Set(ByVal value As Boolean)
            _Availability = value
        End Set
    End Property


    Private _Credits As Boolean
    Public Property Credits() As Boolean
        Get
            Return _Credits
        End Get
        Set(ByVal value As Boolean)
            _Credits = value
        End Set
    End Property

    Private _AdminUsers As Boolean
    Public Property AdminUsers() As Boolean
        Get
            Return _AdminUsers
        End Get
        Set(ByVal value As Boolean)
            _AdminUsers = value
        End Set
    End Property

    Private _AdminEmails As Boolean
    Public Property AdminEmails() As Boolean
        Get
            Return _AdminEmails
        End Get
        Set(ByVal value As Boolean)
            _AdminEmails = value
        End Set
    End Property

    Private _Admin As Boolean
    Public Property Admin() As Boolean
        Get
            Return _Admin
        End Get
        Set(ByVal value As Boolean)
            _Admin = value
        End Set
    End Property


    Private _IsActive As Boolean
    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(value As Boolean)
            _IsActive = value

        End Set
    End Property

    Private _Farms As String
    Public Property Farms() As String
        Get
            Return _Farms
        End Get
        Set(ByVal value As String)
            _Farms = value
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


    'Private _FarmNames As String
    'Public Property FarmNames() As String
    '    Get
    '        Return _FarmNames
    '    End Get
    '    Set(ByVal value As String)
    '        _FarmNames = value
    '    End Set
    'End Property

    'Private _Citys As String
    'Public Property Citys() As String
    '    Get
    '        Return _Citys
    '    End Get
    '    Set(ByVal value As String)
    '        _Citys = value
    '    End Set
    'End Property


    Private _FarmList As New List(Of Farm)
    Public Property FarmList() As List(Of Farm)
        Get
            Return _FarmList
        End Get
        Set(ByVal value As List(Of Farm))
            _FarmList = value
        End Set
    End Property


    Public ReadOnly Property NextFarmListSlno As Integer
        Get
            If _FarmList.Count = 0 Then
                Return 1
            Else
                Return _FarmList.Max(Function(i) i.SlNo) + 1
            End If
        End Get
    End Property

    Private _WebPermissions As New List(Of WebPermission)
    Public Property WebPermissions() As List(Of WebPermission)
        Get
            Return _WebPermissions
        End Get
        Set(value As List(Of WebPermission))
            _WebPermissions = value
        End Set
    End Property

    Private _RP As String
    Public Property RP() As String
        Get
            Return _RP
        End Get
        Set(value As String)
            _RP = value
        End Set
    End Property

    Private _SelectedUsers As Boolean
    Public Property SelectedUsers() As Boolean
        Get
            Return _SelectedUsers
        End Get
        Set(ByVal value As Boolean)
            _SelectedUsers = value
        End Set
    End Property

    Private _Warehouse As New Warehouse
    Public Property Warehouse() As Warehouse
        Get
            Return _Warehouse
        End Get
        Set(ByVal value As Warehouse)
            _Warehouse = value
        End Set
    End Property

    Private _WarehouseList As New List(Of Warehouse)
    Public Property WarehouseList() As List(Of Warehouse)
        Get
            Return _WarehouseList
        End Get
        Set(ByVal value As List(Of Warehouse))
            _WarehouseList = value
        End Set
    End Property

    'Public ReadOnly Property NextWarehouseListSlno As Integer
    '    Get
    '        If _WarehouseList.Count = 0 Then
    '            Return 1
    '        Else
    '            Return _WarehouseList.Max(Function(i) i.SlNo) + 1
    '        End If
    '    End Get
    'End Property

    Private _ErrorMessage As String
    Public Property ErrorMessage() As String
        Get
            Return _ErrorMessage
        End Get
        Set(value As String)
            _ErrorMessage = value
        End Set
    End Property

    Private _CustomerNo As String
    Public Property CustomerNo() As String
        Get
            Return _CustomerNo
        End Get
        Set(value As String)
            _CustomerNo = value
        End Set
    End Property

    Private _Division As String
    Public Property Division() As String
        Get
            Return _Division
        End Get
        Set(value As String)
            _Division = value
        End Set
    End Property

    Private _SalesPerson As String
    Public Property SalesPerson() As String
        Get
            Return _SalesPerson
        End Get
        Set(value As String)
            _SalesPerson = value
        End Set
    End Property

    Private _Customer As String
    Public Property Customer() As String
        Get
            Return _Customer
        End Get
        Set(value As String)
            _Customer = value
        End Set
    End Property

    Private _IsGrowerDelete As Boolean
    Public Property IsGrowerDelete() As Boolean
        Get
            Return _IsGrowerDelete
        End Get
        Set(value As Boolean)
            _IsGrowerDelete = value

        End Set
    End Property

    Private _IsGrowerlock As Boolean
    Public Property IsGrowerlock() As Boolean
        Get
            Return _IsGrowerlock
        End Get
        Set(value As Boolean)
            _IsGrowerlock = value

        End Set
    End Property

    Private _LastLogin As String
    Public Property LastLogin() As String
        Get
            Return _LastLogin
        End Get
        Set(value As String)
            _LastLogin = value
        End Set
    End Property

    Private _IsSetupsFile As Boolean
    Public Property IsSetupsFile() As Boolean
        Get
            Return _IsSetupsFile
        End Get
        Set(value As Boolean)
            _IsSetupsFile = value

        End Set
    End Property

    Private _IsSetupsReports As Boolean
    Public Property IsSetupsReports() As Boolean
        Get
            Return _IsSetupsReports
        End Get
        Set(value As Boolean)
            _IsSetupsReports = value

        End Set
    End Property

    Private _IsSetupsAdmin As Boolean
    Public Property IsSetupsAdmin() As Boolean
        Get
            Return _IsSetupsAdmin
        End Get
        Set(value As Boolean)
            _IsSetupsAdmin = value

        End Set
    End Property

    Private _IsSetupsImport As Boolean
    Public Property IsSetupsImport() As Boolean
        Get
            Return _IsSetupsImport
        End Get
        Set(value As Boolean)
            _IsSetupsImport = value

        End Set
    End Property

    Private _ORDER As String
    Public Property ORDER() As String
        Get
            Return _ORDER
        End Get
        Set(value As String)
            _ORDER = value

        End Set
    End Property
    ''' Muthu Nivetha M :: 16Mar2020 :: :: Added :: To get/set value for column Inventoryaccesstypes in tblusers
    Private _InventoryAccesstypes As String
    Public Property InventoryAccesstypes() As String
        Get
            Return _InventoryAccesstypes
        End Get
        Set(value As String)
            _InventoryAccesstypes = value

        End Set
    End Property
    ''' Muthu Nivetha M :: 19Mar2020 :: :: Added :: To get/set value for inven flags
    Private _InvenFlagTypesList As New List(Of BO.Type)
    Public Property InvenFlagTypesList() As List(Of BO.Type)
        Get
            Return _InvenFlagTypesList
        End Get
        Set(ByVal value As List(Of BO.Type))
            _InvenFlagTypesList = value
        End Set
    End Property

End Class
