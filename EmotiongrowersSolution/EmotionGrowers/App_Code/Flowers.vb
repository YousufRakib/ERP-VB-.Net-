Imports System.Data.SqlClient
Imports System.Data



Public Class Flowers
    Private _TotalRows As Integer
    Public Property TotalRows() As Integer
        Get
            Return _TotalRows
        End Get
        Set(ByVal value As Integer)
            _TotalRows = value
        End Set
    End Property
    Public Shared Function SaveFlowers(ByVal FlowerList As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("SpSaveFlowers", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@FlowersList", FlowerList.ToString())
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveFlowers")
            Return Nothing
        End Try
        Return ""
    End Function

    Public Shared Function LoadFlowers(ByVal FarmCode As String) As List(Of Flower)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim UList As New List(Of Flower)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("GetFlowerByFarm", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FarmCode", FarmCode.ToString())
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower
                        u.ID = row("ID")
                        u.Flower = row("Flower")
                        u.CAT = row("Cat")
                        u.Name = row("Name")
                        u.ColorCode = row("ColorCode")
                        u.UOM = row("UOM")
                        u.UNITS = row("Units")
                        UList.Add(u)
                    Next
                End Using
            End Using
            Return UList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadFlowers")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFlowerForAutoComplete(ByVal Searchtext As String) As List(Of Flower)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim FList As New List(Of Flower)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetFlowerForAutoComplete", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Searchtext", Searchtext)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower
                        u.Flower = row("Flower")
                        u.Name = row("Name")
                        u.CAT = row("Cat")
                        u.BUNCH = row("Bunch")
                        u.ColorCode = row("Colorcode")
                        u.UnitsPerBunch = row("UNITSPERBU")
                        u.UOM = row("UOM")
                        u.UNITS = row("UNITS")
                        u.ID = row("ID")
                        u.UOMSOLD = row("UOMSOLD")
                        u.PRICE = row("Price")  'Anand :: 13Mar2022 added Sales Price and Brand
                        FList.Add(u)
                    Next
                End Using
            End Using
            Return FList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFlowerForAutoComplete")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFlowerForAutoCompleteFarmWise(ByVal Searchtext As String, ByVal Farmcode As String) As List(Of Flower)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim FList As New List(Of Flower)
            Using con As New SqlConnection(ConStr)
                con.Open()
                'Using cmd As New SqlCommand("select top 20 Flower,Name,Cat,isnull(Bunch,0) Bunch,Colorcode,ISNULL(UNITSPERBU,0) UNITSPERBU,ISNULL(UOM,'') UOM,ISNULL(UNITS,0.00) UNITS from F_flower where deleted=0 and Status='A' and Name <>'' and Flower like '" + Searchtext + "%' or Name like '" + Searchtext + "%' order by flower", con)
                Using cmd As New SqlCommand("GetFlowerForAutoComplete", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@SearchText", Searchtext.ToString())
                    cmd.Parameters.AddWithValue("@FarmCode", Farmcode.ToString())
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower
                        u.Flower = row("Flower")
                        u.Name = row("Name")
                        u.CAT = row("Cat")
                        u.BUNCH = row("Bunch")
                        u.ColorCode = row("Colorcode")
                        u.UnitsPerBunch = row("UNITSPERBU")
                        u.UOM = row("UOM")
                        u.UNITS = row("UNITS")
                        FList.Add(u)
                    Next
                End Using
            End Using
            Return FList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFlowerForAutoCompleteFarmWise")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFlowerWithCatergoryK() As List(Of Flower)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim FList As New List(Of Flower)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetFlowerWithCategory", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Category", "K")
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower
                        u.Flower = row("Flower")
                        u.Name = row("Name")
                        FList.Add(u)
                    Next
                End Using
            End Using
            Return FList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFlowerWithCatergoryK")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetChargeByFlowerCode(ByVal FlowerCode As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataTable
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetChargeByFlowerCode", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FlowerCode", FlowerCode.ToString())
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(dt)
                    result = dt.Rows(0)("PRICE").ToString()
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetChargeByFlowerCode")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetProductDetailsListing() As List(Of Flower)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim UList As New List(Of Flower)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SELECT FLOWER, CAT, NAME,CHARGE,BOXES,UNITS,UNITSPERBU,PRICE,PACKED,UOM,BUNCH,WEIGHT,GROWER,GL," +
                                            "DUTY,GRADE,VARIETY,COLOR,FLOWERTYPE,FLORALSTAT,STATUS,DAYS,BILLCODE,COLORCODE,USERCODE,PIC,SENT,KOMETID," +
                                            "ADDUSER,ADDDATE,ADDTIME,ADDAPP,DELUSER,DELDATE,DELTIME,DELAPP,UPDUSER,UPDDATE,UPDTIME,UPDAPP,LOCKUSER," +
                                            "LOCKDATE,LOCKTIME,LOCKAPP FROM F_FLOWER", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower
                        u.Flower = row("Flower")
                        u.CAT = Convert.ToString(row("Cat"))
                        u.Name = row("Name")
                        u.Charge = If(row("CHARGE") Is DBNull.Value, 0.0, Convert.ToDecimal(row("CHARGE")))
                        u.BOXES = If(row("BOXES") Is DBNull.Value, 0, Convert.ToInt32(row("BOXES")))
                        u.UNITS = If(row("UNITS") Is DBNull.Value, 0, Convert.ToInt32(row("UNITS")))
                        u.UnitsPerBunch = Convert.ToString(row("UNITSPERBU"))
                        u.PRICE = If(row("PRICE") Is DBNull.Value, 0.0, Convert.ToDecimal(row("PRICE")))
                        u.PACKED = Convert.ToString(row("PACKED"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.BUNCH = If(row("BUNCH") Is DBNull.Value, 0, Convert.ToInt32(row("BUNCH")))
                        u.WEIGHT = If(row("WEIGHT") Is DBNull.Value, 0.0, Convert.ToDecimal(row("WEIGHT")))
                        u.GROWER = If(row("GROWER") Is DBNull.Value, 0, Convert.ToInt32(row("GROWER")))
                        u.GL = Convert.ToString(row("GL"))
                        u.DUTY = Convert.ToString(row("DUTY"))
                        u.GRADE = Convert.ToString(row("GRADE"))
                        u.VARIETY = Convert.ToString(row("VARIETY"))
                        u.Color = Convert.ToString(row("COLOR"))
                        u.FLOWERTYPE = Convert.ToString(row("FLOWERTYPE"))
                        u.FLORALSTAT = Convert.ToString(row("FLORALSTAT"))
                        u.STATUS = Convert.ToString(row("STATUS"))
                        u.DAYS = If(row("DAYS") Is DBNull.Value, 0, Convert.ToInt32(row("DAYS")))
                        u.BILLCODE = Convert.ToString(row("BILLCODE"))
                        u.ColorCode = Convert.ToString(row("ColorCode"))
                        u.UserCode = Convert.ToString(row("USERCODE"))
                        u.PIC = Convert.ToString(row("PIC"))
                        u.SENT = Convert.ToString(row("SENT"))
                        u.ADDUSER = Convert.ToString(row("ADDUSER"))
                        u.ADDDATE = Convert.ToDateTime(row("ADDDATE"))
                        u.ADDTIME = Convert.ToString(row("ADDTIME"))
                        u.ADDAPP = Convert.ToString(row("ADDAPP"))
                        u.DELUSER = Convert.ToString(row("DELUSER"))
                        u.DELDATE = Convert.ToDateTime(row("DELDATE"))
                        u.DELTIME = Convert.ToString(row("DELTIME"))
                        u.DELAPP = Convert.ToString(row("DELAPP"))
                        u.UPDUSER = Convert.ToString(row("UPDUSER"))
                        u.UPDDATE = Convert.ToDateTime(row("UPDDATE"))
                        u.UPDTIME = Convert.ToString(row("UPDTIME"))
                        u.UPDAPP = Convert.ToString(row("UPDAPP"))
                        u.LOCKUSER = Convert.ToString(row("LOCKUSER"))
                        u.LOCKDATE = Convert.ToDateTime(row("LOCKDATE"))
                        u.LOCKTIME = Convert.ToString(row("LOCKTIME"))
                        u.LOCKAPP = Convert.ToString(row("LOCKAPP"))
                        UList.Add(u)
                    Next
                End Using
            End Using
            Return UList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetProductDetailsListing")
            Return Nothing
        End Try
    End Function

    Public Class GetFlowerDetails
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetFlowersListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of Flower)
            Dim uList As New List(Of Flower)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetFlowersAll", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Flower()
                            u.ID = row("ID")
                            u.Flower = row("Flower")
                            u.CAT = If(row("Cat") Is DBNull.Value, "", row("Cat"))
                            u.Name = If(row("Name") Is DBNull.Value, "", row("Name"))
                            u.UnitsPerBunch = If(row("UNITSPERBU") Is DBNull.Value, "", row("UNITSPERBU"))
                            u.ColorCode = If(row("ColorCode") Is DBNull.Value, "", row("ColorCode"))
                            u.ForeColor = If(row("FontColor") Is DBNull.Value, "", row("FontColor"))
                            u.BGColor = If(row("BgColor") Is DBNull.Value, "", row("BgColor"))
                            u.Color = If(row("Color") Is DBNull.Value, "", row("Color"))
                            'u.Charge = Convert.ToDecimal(row("CHARGE"))
                            'u.BOXES = Convert.ToInt32(row("BOXES"))
                            'u.BUNCHES = Convert.ToInt32(row("BUNCHES"))
                            u.UNITS = If(row("UNITS") Is DBNull.Value, 0, row("UNITS"))
                            'u.PRICE = Convert.ToDecimal(row("PRICE"))
                            u.UOM = If(row("UOM") Is DBNull.Value, "", row("UOM"))
                            u.BUNCH = If(row("BUNCH") Is DBNull.Value, 0, row("BUNCH"))
                            'u.WEIGHT = Convert.ToDecimal(row("WEIGHT"))
                            'u.GROWER = Convert.ToInt32(row("GROWER"))
                            'u.GL = Convert.ToString(row("GL"))
                            'u.DUTY = Convert.ToString(row("DUTY"))
                            u.GRADE = If(row("GRADE") Is DBNull.Value, "", row("GRADE"))
                            u.VARIETY = If(row("VARIETY") Is DBNull.Value, "", row("VARIETY"))
                            u.UOMSOLD = If(row("UOMSOLD") Is DBNull.Value, "", row("UOMSOLD"))
                            'u.FLOWERTYPE = Convert.ToString(row("FLOWERTYPE"))
                            'u.FLORALSTAT = Convert.ToString(row("FLORALSTAT"))
                            'u.STATUS = Convert.ToString(row("STATUS"))
                            'u.DAYS = Convert.ToInt32(row("DAYS"))
                            'u.BILLCODE = Convert.ToString(row("BILLCODE"))
                            'u.ADDUSER = Convert.ToString(row("ADDUSER"))
                            'u.ADDDATE = Convert.ToDateTime(row("ADDDATE"))
                            'u.ADDTIME = Convert.ToString(row("ADDTIME"))
                            'u.ADDAPP = Convert.ToString(row("ADDAPP"))
                            'u.UPDUSER = Convert.ToString(row("UPDUSER"))
                            'u.UPDDATE = Convert.ToDateTime(row("UPDDATE"))
                            'u.UPDTIME = Convert.ToString(row("UPDTIME"))
                            'u.UPDAPP = Convert.ToString(row("UPDAPP"))
                            'u.DELUSER = Convert.ToString(row("DELUSER"))
                            'u.DELDATE = Convert.ToDateTime(row("DELDATE"))
                            'u.DELTIME = Convert.ToString(row("DELTIME"))
                            'u.DELAPP = Convert.ToString(row("DELAPP"))
                            'u.LOCKUSER = Convert.ToString(row("LOCKUSER"))
                            'u.LOCKDATE = Convert.ToDateTime(row("LOCKDATE"))
                            'u.LOCKTIME = Convert.ToString(row("LOCKTIME"))
                            'u.LOCKAPP = Convert.ToString(row("LOCKAPP"))
                            'u.MST_ID = Convert.ToString(row("MST_ID"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetFlowersListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function
    End Class

    Public Shared Function GetFlowerbyID(ByVal ID As String) As Flower
        Try
            Dim u As New Flower
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                'Using cmd As New SqlCommand("select * from vwGetFlowersAll where ID=@ID ", con)
                Using cmd As New SqlCommand("spF_FlowerGetAll", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.Flower = If(row("Flower") Is DBNull.Value, "", row("Flower"))
                        u.CAT = If(row("CAT") Is DBNull.Value, "", row("CAT"))
                        u.Name = If(row("Name") Is DBNull.Value, "", row("Name"))
                        u.UnitsPerBunch = If(row("BUNCH") Is DBNull.Value, "", row("BUNCH"))
                        u.VARIETY = If(row("VARIETY") Is DBNull.Value, "", row("VARIETY"))
                        u.UNITS = If(row("UNITS") Is DBNull.Value, 0, row("UNITS"))
                        u.UOM = If(row("UOM") Is DBNull.Value, "", row("UOM"))
                        u.UOMSOLD = If(row("UOMSOLD") Is DBNull.Value, "", row("UOMSOLD"))
                        u.GRADE = If(row("GRADE") Is DBNull.Value, "", row("GRADE"))
                        u.ColorCode = If(row("Code") Is DBNull.Value, "", row("Code"))
                        u.Color = If(row("Color") Is DBNull.Value, "", row("Color"))
                        u.DAYS = If(row("Days") Is DBNull.Value, 0, row("Days"))
                        u.GL = If(row("GL") Is DBNull.Value, "", row("GL"))
                        u.UserCode = If(row("UserCode") Is DBNull.Value, "", row("UserCode"))
                        u.STATUS = If(row("STATUS") Is DBNull.Value, "", row("STATUS"))
                        u.PRICE = If(row("PRICE") Is DBNull.Value, 0.000, row("PRICE"))
                        u.WEIGHT = If(row("Weight") Is DBNull.Value, 0.00, row("Weight"))
                        u.AlreadyExist = If(row("AlreadyExist") Is DBNull.Value, 0.00, row("AlreadyExist"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFlowerbyID")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFlowersWithSameVarietyAndCategoryByFlowerCode(ByVal FlowerCode As String) As List(Of Flower)
        Try
            Dim fList As New List(Of Flower)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim Cat As String = ""
                Dim Variety As String = ""
                Using cmd As New SqlCommand("select top 1 isnull(cat,''),isnull(variety,''),flower from F_flower where flower=@FlowerCode and STATUS='A' and deleted=0", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@FlowerCode", FlowerCode)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Cat = dt(0)(0)
                        Variety = dt(0)(1)
                    Else
                        Return fList
                    End If
                End Using
                Dim qry As String = ""

                If Variety.Trim() = "" Then
                    qry = "select * from F_flower where Cat=@Cat and deleted=0"
                Else
                    qry = "select * from F_flower where Cat=@Cat And Variety=@Variety and deleted=0"
                End If
                Using cmd As New SqlCommand(qry, con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@Cat", Cat)
                    cmd.Parameters.AddWithValue("@Variety", Variety)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim f As New Flower
                        f.ID = row("ID")
                        f.Flower = row("Flower").ToString().TrimEnd()
                        f.CAT = row("CAT")
                        f.Name = row("Name").ToString().TrimEnd()
                        f.UnitsPerBunch = row("UNITSPERBU")
                        f.VARIETY = row("VARIETY")
                        f.UNITS = row("UNITS")
                        f.UOM = row("UOM")
                        f.GRADE = row("GRADE")
                        'f.ColorCode = row("Code")
                        f.Color = row("Color")
                        fList.Add(f)
                    Next
                End Using
            End Using
            Return fList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFlowersWithSameVarietyAndCategoryByFlowerCode")
            Return Nothing
        End Try
    End Function

    Public Shared Function UpdateFlowerbyID(ByVal ID As String, ByVal FlowerCode As String, ByVal FlowerName As String, ByVal Cat As String, ByVal ColorCode As Integer) As String
        Try
            Dim u As New Flower
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("update F_flower set Flower=@Flower, CAT=@Cat, NAME=@Name, COLORCODE=@ColorCode where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@Flower", FlowerCode)
                    cmd.Parameters.AddWithValue("@Name", FlowerName)
                    cmd.Parameters.AddWithValue("@Cat", Cat)
                    cmd.Parameters.AddWithValue("@ColorCode", ColorCode)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateFlowerbyID")
            Return "error"
        End Try
    End Function

    Public Shared Function GetColorCodeList() As List(Of Flower)
        Dim uList As New List(Of Flower)()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblColorCode", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower()
                        u.ID = row("ID")
                        u.ColorCode = row("Code")
                        u.ForeColor = row("Color")
                        u.BGColor = row("BgColor")
                        uList.Add(u)
                    Next
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetColorCodeList")
            Return Nothing
        End Try
        Return uList
    End Function

    Public Shared Function FlowerDetailinSQL() As DataTable
        Try
            Dim uList As New List(Of Flower)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("select * from vwFlowersDetails", SqlCon)
            Cmd.CommandType = CommandType.Text
            Dim adp As New SqlDataAdapter(Cmd)
            Dim dt As New DataTable
            adp.Fill(dt)
            Return dt
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in FlowerDetailinSQL")
            Return Nothing
        End Try
    End Function

    Public Shared Function ToDataTable(Of T)(collection As IEnumerable(Of T)) As DataTable
        Try
            Dim dt As New DataTable()
            Dim at As Type = GetType(T)
            Dim pia As System.Reflection.PropertyInfo() = at.GetProperties()
            'Create the columns in the DataTable
            For Each pi As System.Reflection.PropertyInfo In pia
                dt.Columns.Add(pi.Name, pi.PropertyType)
            Next
            'Populate the table
            For Each item As T In collection
                Dim dr As DataRow = dt.NewRow()
                dr.BeginEdit()
                For Each pi As System.Reflection.PropertyInfo In pia
                    dr(pi.Name) = pi.GetValue(item, Nothing)
                Next
                dr.EndEdit()
                dt.Rows.Add(dr)
            Next
            Return dt
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToDataTable")
            Throw ex
        End Try
    End Function

    Public Shared Function GetFlowerDetailsByCode(ByVal Flower As String) As List(Of Flower)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim UList As New List(Of Flower)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select ID,Flower,Cat,Name,ColorCode,ISNULL(UNITSPERBU,'') UNITSPERBU,ISNULL(UOM,'') UOM,ISNULL(UNITS,0.00) UNITS from F_flower where Name <>'' and STATUS='A' and Flower=@Flower and deleted=0", con)
                    cmd.Parameters.AddWithValue("@Flower", Flower)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower
                        u.ID = row("ID")
                        u.Flower = row("Flower")
                        u.CAT = row("Cat")
                        u.Name = row("Name")
                        u.ColorCode = row("ColorCode")
                        u.UnitsPerBunch = row("UNITSPERBU")
                        u.UOM = row("UOM")
                        u.UNITS = row("UNITS")
                        UList.Add(u)
                    Next
                End Using
            End Using
            Return UList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFlowerDetailsByCode")
            Return Nothing
        End Try
    End Function

    Public Shared Function InsertDuplicateRecipe(ByVal PRODUCTID As String, ByVal NewPRODUCTID As String) As String
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
            Dim FlowerScopeID As String = ""
            Dim Cmd As New SqlCommand("spInsertDuplicateRecipe", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@PRODUCTID", PRODUCTID)
            Cmd.Parameters.AddWithValue("@NewPRODUCTID", NewPRODUCTID)
            FlowerScopeID = Cmd.ExecuteScalar()
            Cmd.Dispose()
            SqlCon.Close()
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "InsertDuplicateRecipe", "Insert Duplicate Receipe <b>" + PRODUCTID + "</b>", FlowerScopeID.ToString())
            End If
            Return FlowerScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in InsertDuplicateRecipe")
            End If
            Return ex.Message.ToString()
        End Try
    End Function


    Public Shared Function InsertFlowers(ByVal FlowerCode As String, ByVal Cat As String, ByVal FlowerName As String, ByVal Grade As String, ByVal Color As String,
    ByVal Variety As String, ByVal UnitsPerBox As Integer, ByVal PackedBy As String, ByVal UOMSOLD As String, ByVal WEIGHT As String, ByVal UnitsPerBunch As Integer, ByVal ScreenColor As Integer,
    ByVal DaysInCooler As Integer, ByVal SalesPrice As Decimal, ByVal Status As String, ByVal GL As String, ByVal UserCode As String) As String
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
            Dim FlowerScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_FLOWERInsert", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure

            Cmd.Parameters.AddWithValue("@FLOWER", FlowerCode)
            Cmd.Parameters.AddWithValue("@CAT", Cat)
            Cmd.Parameters.AddWithValue("@NAME", FlowerName)
            Cmd.Parameters.AddWithValue("@UNITS", UnitsPerBox)
            Cmd.Parameters.AddWithValue("@UNITSPERBU", UnitsPerBunch)
            Cmd.Parameters.AddWithValue("@PRICE", SalesPrice)
            Cmd.Parameters.AddWithValue("@UOM", PackedBy)
            Cmd.Parameters.AddWithValue("@UOMSOLD", UOMSOLD)
            Cmd.Parameters.AddWithValue("@WEIGHT", WEIGHT)
            Cmd.Parameters.AddWithValue("@GL", GL)
            Cmd.Parameters.AddWithValue("@GRADE", Grade)
            Cmd.Parameters.AddWithValue("@VARIETY", Variety)
            Cmd.Parameters.AddWithValue("@COLOR", Color)
            Cmd.Parameters.AddWithValue("@STATUS", Status)
            Cmd.Parameters.AddWithValue("@DAYS", DaysInCooler)
            Cmd.Parameters.AddWithValue("@COLORCODE", ScreenColor)
            Cmd.Parameters.AddWithValue("@USERCODE", UserCode)
            Cmd.Parameters.AddWithValue("@ADDUSER", If(UserDetails.UserName.Length < 20, UserDetails.UserName, UserDetails.UserName.Substring(0, 20)))
            FlowerScopeID = Cmd.ExecuteScalar()

            Cmd.Dispose()
            SqlCon.Close()
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "SaveFlowerDetails", "Added a new flower <b>" + FlowerCode + "</b>", FlowerScopeID.ToString())
            End If
            Return FlowerScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in SaveFlowerDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function UpdateFlowers(ByVal ID As Integer, ByVal FlowerCode As String, ByVal Cat As String, ByVal FlowerName As String, ByVal Grade As String, ByVal Color As String,
    ByVal Variety As String, ByVal UnitsPerBox As Integer, ByVal PackedBy As String, ByVal UOMSOLD As String, ByVal WEIGHT As String, ByVal UnitsPerBunch As Integer, ByVal ScreenColor As Integer,
    ByVal DaysInCooler As Integer, ByVal SalesPrice As Decimal, ByVal Status As String, ByVal GL As String, ByVal UserCode As String) As String
        Try
            Dim UserDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                UserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            Dim FlowerScopeID As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()

            Dim Cmd As New SqlCommand("sp_F_FLOWERUpdate", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@ID", ID)
            Cmd.Parameters.AddWithValue("@FLOWER", FlowerCode)
            Cmd.Parameters.AddWithValue("@CAT", Cat)
            Cmd.Parameters.AddWithValue("@NAME", FlowerName)
            Cmd.Parameters.AddWithValue("@UNITS", UnitsPerBox)
            Cmd.Parameters.AddWithValue("@UNITSPERBU", UnitsPerBunch)
            Cmd.Parameters.AddWithValue("@PRICE", SalesPrice)
            Cmd.Parameters.AddWithValue("@UOM", PackedBy)
            Cmd.Parameters.AddWithValue("@UOMSOLD", UOMSOLD)
            Cmd.Parameters.AddWithValue("@WEIGHT", WEIGHT)
            Cmd.Parameters.AddWithValue("@GL", GL)
            Cmd.Parameters.AddWithValue("@GRADE", Grade)
            Cmd.Parameters.AddWithValue("@VARIETY", Variety)
            Cmd.Parameters.AddWithValue("@COLOR", Color)
            Cmd.Parameters.AddWithValue("@STATUS", Status)
            Cmd.Parameters.AddWithValue("@DAYS", DaysInCooler)
            Cmd.Parameters.AddWithValue("@COLORCODE", ScreenColor)
            Cmd.Parameters.AddWithValue("@USERCODE", UserCode)
            Cmd.Parameters.AddWithValue("@UPDUSER", If(UserDetails.UserName.Length < 20, UserDetails.UserName, UserDetails.UserName.Substring(0, 20)))
            FlowerScopeID = Cmd.ExecuteScalar()

            Cmd.Dispose()
            SqlCon.Close()
            If (Not UserDetails Is Nothing) Then
                Logs.Savelog(UserDetails.ID, "Users", "UpdateFlowerDetails", "Updated a new Flower <b>" + FlowerCode + "</b>", ID.ToString())
            End If
            Return FlowerScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in UpdateFlowerDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function
    ''' "UPDATE f_flower SET DELETED=1 WHERE ID=@ID"

    Public Shared Function DeleteFlowerbyID(ByVal ID As String) As String
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
                Using cmd As New SqlCommand("DELETE from f_flower WHERE ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteFlowerbyID")
            Return "error"
        End Try
    End Function
    ''' <summary>
    ''' MUTHU NIVETHA M :: 11FEB2020 :: ALTERED :: TO LOAD SOLD BY FOR SELECTED FLOWER
    ''' </summary>
    Public Shared Function GetFlowerForAutoCompleteInSPORD(ByVal Searchtext As String, ByVal Farm As String) As List(Of Flower)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim FList As New List(Of Flower)
            Dim whereClause As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                'If (SearchBy = "Code") Then
                '    whereClause = " where Status='A' and Name <>'' and Flower like '" + Searchtext + "%'"
                'ElseIf (SearchBy = "Desc") Then
                '    whereClause = " where Status='A' and Name Like '%" + Searchtext + "%'"
                'End If
                'Using cmd As New SqlCommand("select Flower,Name,Cat,isnull(Bunch,0) Bunch,Colorcode,ISNULL(UNITSPERBU,'') UNITSPERBU,ISNULL(UOM,'') UOM,ISNULL(UNITS,0.00) UNITS from F_flower " + whereClause + " order by flower", con)

                Using cmd As New SqlCommand("GetFlowerForAutoCompleteInSPORD", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@SearchText", Searchtext)
                    cmd.Parameters.AddWithValue("@FarmCode", Farm)
                    cmd.Parameters.AddWithValue("@SearchBy", "")
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower
                        u.Flower = row("Flower")
                        u.Name = row("Name")
                        u.CAT = row("Cat")
                        u.BUNCH = row("Bunch")
                        u.ColorCode = row("Colorcode")
                        u.UnitsPerBunch = row("UNITSPERBU")
                        u.UOM = row("UOM")
                        u.UNITS = row("UNITS")
                        u.ID = row("ID")
                        u.FType.SOLDAS = row("SOLDAS")
                        FList.Add(u)
                    Next
                End Using
            End Using
            Return FList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFlowerForAutoCompleteInSPORD")
            Return Nothing
        End Try
    End Function


    Public Shared Function GetFlowerEasyAutocomplete(ByVal Searchtext As String) As List(Of Flower)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim FList As New List(Of Flower)
            Dim whereClause As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("GetFlowerEasyAutocomplete", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@SearchText", Searchtext)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower
                        u.Flower = row("Flower")
                        u.Name = row("Name")
                        u.CAT = row("Cat")
                        u.BUNCH = row("Bunch")
                        u.ColorCode = row("Colorcode")
                        u.UnitsPerBunch = row("UNITSPERBU")
                        u.UOM = row("UOM")
                        u.UNITS = row("UNITS")
                        u.ID = row("ID")
                        u.FType.SOLDAS = row("SOLDAS")
                        FList.Add(u)
                    Next
                End Using
            End Using
            Return FList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFlowerEasyAutocomplete")
            Return Nothing
        End Try
    End Function


#Region "Recipe"
    Public Shared Function InsertRecipeDetails(ByVal RecipeID As String, ByVal ProductID As String, ByVal Product As String, ByVal QTY As Integer, ByVal UOM As String, ByVal Cost As Decimal, ByVal Type As String) As String
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
                Dim sql = "spSubAssemblyInsert"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Clear()
                    cmd.Parameters.AddWithValue("@ProductID", ProductID)
                    cmd.Parameters.AddWithValue("@Code", Product)
                    cmd.Parameters.AddWithValue("@QTY", QTY)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    cmd.Parameters.AddWithValue("@Cost", Cost)
                    cmd.Parameters.AddWithValue("@Type", Type)
                    cmd.Parameters.AddWithValue("@ADDUSER", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
                    cmd.ExecuteNonQuery()
                End Using
                Using cmd As New SqlCommand("select top 1 LTRIM(RTRIM(ID)) from F_SUBASSEMBLY order by id desc", con)
                    cmd.CommandType = CommandType.Text
                    RecipeID = cmd.ExecuteScalar()
                End Using
            End Using
            Return RecipeID
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in InsertRecipeDetails")
            Throw ex
        End Try
    End Function
    Public Shared Function UpdateRecipeDetails(ByVal RecipeID As String, ByVal ProductID As String, ByVal Product As String, ByVal QTY As Integer, ByVal UOM As String, ByVal Cost As Decimal, ByVal Type As String) As String
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
                Dim sql = "[spSubAssemblyUpdate]"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Clear()
                    cmd.Parameters.AddWithValue("@RecipeID", RecipeID)
                    cmd.Parameters.AddWithValue("@ProductID", ProductID)
                    cmd.Parameters.AddWithValue("@Code", Product)
                    cmd.Parameters.AddWithValue("@QTY", QTY)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    cmd.Parameters.AddWithValue("@Cost", Cost)
                    cmd.Parameters.AddWithValue("@Type", Type)
                    cmd.Parameters.AddWithValue("@UPDUSER", If(UserDetails.Name.Length > 20, UserDetails.Name.Substring(0, 20), UserDetails.Name))
                    cmd.ExecuteNonQuery()
                End Using
                Using cmd As New SqlCommand("select top 1 LTRIM(RTRIM(ID)) from F_SUBASSEMBLY order by id desc", con)
                    cmd.CommandType = CommandType.Text
                    RecipeID = cmd.ExecuteScalar()
                End Using
            End Using
            Return RecipeID
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateRecipeDetails")
            Throw ex
        End Try
    End Function
    Public Shared Function GetUOMForRecipe() As List(Of BOProd)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BOProd)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("SELECT DISTINCT UOM FROM F_PROD", Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOProd
                        u.UOM = row("UOM")
                        ulist.Add(u)
                    Next
                    Return ulist
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUOMForRecipe")
            Throw ex
        End Try
    End Function
    Public Shared Function GetRecipeByID(ByVal ID As String) As Recipe
        Try
            Dim u As New Recipe
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from [vwGetRecipeAll] where ID=@ID ", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.Flower = row("Flower")
                        u.Name = row("Name")
                        u.ProductID = row("ProductID")
                        u.Product = Convert.ToString(row("Product"))
                        u.UNITS = If(row("UNITS") Is DBNull.Value, 0, Convert.ToInt32(row("UNITS")))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.Cost = Convert.ToDecimal(IIf(row("Cost") Is DBNull.Value, 0, row("Cost")))
                        u.Type = IIf(row("Type") Is DBNull.Value, "", row("Type"))
                        u.CODE = Convert.ToString(row("CODE"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetRecipeByID")
            Return Nothing
        End Try
    End Function
    Public Shared Function DeleteRECIPEDetails(ByVal ID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sql = "DELETE FROM F_SUBASSEMBLY where ID=@ID"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()

                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteRECIPEDetails")
            Throw ex
        End Try
    End Function
    Public Function GetRecipeForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of Recipe)
        Dim uList As New List(Of Recipe)()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetSubAssembly", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                    cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                    cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Recipe()
                        u.ID = row("ID")
                        u.Flower = row("Flower")
                        u.Name = row("Name")
                        u.ProductID = row("ProductID")
                        u.Product = Convert.ToString(row("Product"))
                        u.BGColor = Convert.ToString(row("BGColor"))
                        u.FontColor = Convert.ToString(row("FontColor"))
                        u.UNITS = If(row("UNITS") Is DBNull.Value, 0, Convert.ToInt32(row("UNITS")))
                        u.UOM = If(row("UOM") Is DBNull.Value, "", Convert.ToString(row("UOM")).ToUpper())
                        u.Cost = Convert.ToDecimal(IIf(row("Cost") Is DBNull.Value, 0, row("Cost")))
                        u.Type = IIf(row("Type") Is DBNull.Value, "", row("Type"))
                        u.ADDUSER = Convert.ToString(row("ADDUSER"))
                        u.ADDDATE = Convert.ToDateTime(row("ADDDATE"))
                        u.ADDTIME = Convert.ToString(row("ADDTIME"))
                        u.ADDAPP = Convert.ToString(row("ADDAPP"))
                        u.UPDUSER = Convert.ToString(row("UPDUSER"))
                        u.UPDDATE = Convert.ToDateTime(row("UPDDATE"))
                        u.UPDTIME = Convert.ToString(row("UPDTIME"))
                        u.UPDAPP = Convert.ToString(row("UPDAPP"))
                        uList.Add(u)
                    Next
                    Me.TotalRows = ds.Tables(1).Rows(0)(0)
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetRecipeForFgrd")
            Return Nothing
        End Try
        Return uList
    End Function

#End Region
End Class


Public Class Flower

    Private _Flower As String
    Public Property Flower() As String
        Get
            Return _Flower
        End Get
        Set(ByVal value As String)
            _Flower = value
        End Set
    End Property

    Private _ID As String
    Public Property ID() As String
        Get
            Return _ID
        End Get
        Set(ByVal value As String)
            _ID = value
        End Set
    End Property

    Private _CAT As String
    Public Property CAT() As String
        Get
            Return _CAT
        End Get
        Set(ByVal value As String)
            _CAT = value
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

    Private _UnitsPerBunch As String
    Public Property UnitsPerBunch() As String
        Get
            Return _UnitsPerBunch
        End Get
        Set(ByVal value As String)
            _UnitsPerBunch = value
        End Set
    End Property

    Private _ColorCode As String
    Public Property ColorCode() As String
        Get
            Return _ColorCode
        End Get
        Set(ByVal value As String)
            _ColorCode = value
        End Set
    End Property

    Private _UserCode As String
    Public Property UserCode() As String
        Get
            Return _UserCode
        End Get
        Set(ByVal value As String)
            _UserCode = value
        End Set
    End Property

    Private _ForeColor As String
    Public Property ForeColor() As String
        Get
            Return _ForeColor
        End Get
        Set(ByVal value As String)
            _ForeColor = value
        End Set
    End Property

    Private _BGColor As String
    Public Property BGColor() As String
        Get
            Return _BGColor
        End Get
        Set(ByVal value As String)
            _BGColor = value
        End Set
    End Property

    Private _FontColor As String
    Public Property FontColor() As String
        Get
            Return _FontColor
        End Get
        Set(ByVal value As String)
            _FontColor = value
        End Set
    End Property

    '------------------
    Private _Charge As Decimal
    Public Property Charge() As Decimal
        Get
            Return _Charge
        End Get
        Set(ByVal value As Decimal)
            _Charge = value
        End Set
    End Property

    Private _BOXES As Integer
    Public Property BOXES() As Integer
        Get
            Return _BOXES
        End Get
        Set(ByVal value As Integer)
            _BOXES = value
        End Set
    End Property

    Private _BUNCHES As Integer
    Public Property BUNCHES() As Integer
        Get
            Return _BUNCHES
        End Get
        Set(ByVal value As Integer)
            _BUNCHES = value
        End Set
    End Property

    Private _UNITS As Integer
    Public Property UNITS() As Integer
        Get
            Return _UNITS
        End Get
        Set(ByVal value As Integer)
            _UNITS = value
        End Set
    End Property

    Private _PRICE As Decimal
    Public Property PRICE() As Decimal
        Get
            Return _PRICE
        End Get
        Set(value As Decimal)
            _PRICE = value
        End Set
    End Property

    Private _PACKED As String
    Public Property PACKED() As String
        Get
            Return _PACKED
        End Get
        Set(value As String)
            _PACKED = value
        End Set
    End Property
    Private _UOMSOLD As String
    Public Property UOMSOLD() As String
        Get
            Return _UOMSOLD
        End Get
        Set(value As String)
            _UOMSOLD = value
        End Set
    End Property

    Private _UOM As String
    Public Property UOM() As String
        Get
            Return _UOM
        End Get
        Set(value As String)
            _UOM = value
        End Set
    End Property

    Private _BUNCH As Integer
    Public Property BUNCH() As Integer
        Get
            Return _BUNCH
        End Get
        Set(value As Integer)
            _BUNCH = value
        End Set
    End Property

    Private _WEIGHT As Decimal
    Public Property WEIGHT() As Decimal
        Get
            Return _WEIGHT
        End Get
        Set(value As Decimal)
            _WEIGHT = value
        End Set
    End Property

    Private _GROWER As Decimal
    Public Property GROWER() As Decimal
        Get
            Return _GROWER
        End Get
        Set(value As Decimal)
            _GROWER = value
        End Set
    End Property

    Private _GL As String
    Public Property GL() As String
        Get
            Return _GL
        End Get
        Set(value As String)
            _GL = value
        End Set
    End Property

    Private _DUTY As String
    Public Property DUTY() As String
        Get
            Return _DUTY
        End Get
        Set(value As String)
            _DUTY = value
        End Set
    End Property

    Private _GRADE As String
    Public Property GRADE() As String
        Get
            Return _GRADE
        End Get
        Set(value As String)
            _GRADE = value
        End Set
    End Property

    Private _FLOWERTYPE As String
    Public Property FLOWERTYPE() As String
        Get
            Return _FLOWERTYPE
        End Get
        Set(value As String)
            _FLOWERTYPE = value
        End Set
    End Property

    Private _FLORALSTAT As String
    Public Property FLORALSTAT() As String
        Get
            Return _FLORALSTAT
        End Get
        Set(value As String)
            _FLORALSTAT = value
        End Set
    End Property

    Private _STATUS As String
    Public Property STATUS() As String
        Get
            Return _STATUS
        End Get
        Set(value As String)
            _STATUS = value
        End Set
    End Property

    Private _DAYS As Integer
    Public Property DAYS() As Integer
        Get
            Return _DAYS
        End Get
        Set(value As Integer)
            _DAYS = value
        End Set
    End Property

    Private _BILLCODE As String
    Public Property BILLCODE() As String
        Get
            Return _BILLCODE
        End Get
        Set(value As String)
            _BILLCODE = value
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


    Private _ADDDATE As DateTime
    Public Property ADDDATE() As DateTime
        Get
            Return _ADDDATE
        End Get
        Set(ByVal value As DateTime)
            _ADDDATE = value
        End Set
    End Property


    Private _ADDTIME As String
    Public Property ADDTIME() As String
        Get
            Return _ADDTIME
        End Get
        Set(ByVal value As String)
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

    Private _UPDUSER As String
    Public Property UPDUSER() As String
        Get
            Return _UPDUSER
        End Get
        Set(ByVal value As String)
            _UPDUSER = value
        End Set
    End Property

    Private _UPDDATE As DateTime
    Public Property UPDDATE() As DateTime
        Get
            Return _UPDDATE
        End Get
        Set(ByVal value As DateTime)
            _UPDDATE = value
        End Set
    End Property

    Private _UPDTIME As String
    Public Property UPDTIME() As String
        Get
            Return _UPDTIME
        End Get
        Set(ByVal value As String)
            _UPDTIME = value
        End Set
    End Property

    Private _UPDAPP As String
    Public Property UPDAPP() As String
        Get
            Return _UPDAPP
        End Get
        Set(ByVal value As String)
            _UPDAPP = value
        End Set
    End Property

    Private _DELUSER As String
    Public Property DELUSER() As String
        Get
            Return _DELUSER
        End Get
        Set(ByVal value As String)
            _DELUSER = value
        End Set
    End Property

    Private _DELDATE As DateTime
    Public Property DELDATE() As DateTime
        Get
            Return _DELDATE
        End Get
        Set(ByVal value As DateTime)
            _DELDATE = value
        End Set
    End Property

    Private _DELTIME As String
    Public Property DELTIME() As String
        Get
            Return _DELTIME
        End Get
        Set(ByVal value As String)
            _DELTIME = value
        End Set
    End Property

    Private _DELAPP As String
    Public Property DELAPP() As String
        Get
            Return _DELAPP
        End Get
        Set(ByVal value As String)
            _DELAPP = value
        End Set
    End Property

    Private _LOCKUSER As String
    Public Property LOCKUSER() As String
        Get
            Return _LOCKUSER
        End Get
        Set(ByVal value As String)
            _LOCKUSER = value
        End Set
    End Property

    Private _LOCKDATE As DateTime
    Public Property LOCKDATE() As DateTime
        Get
            Return _LOCKDATE
        End Get
        Set(ByVal value As DateTime)
            _LOCKDATE = value
        End Set
    End Property

    Private _LOCKTIME As String
    Public Property LOCKTIME() As String
        Get
            Return _LOCKTIME
        End Get
        Set(ByVal value As String)
            _LOCKTIME = value
        End Set
    End Property

    Private _LOCKAPP As String
    Public Property LOCKAPP() As String
        Get
            Return _LOCKAPP
        End Get
        Set(ByVal value As String)
            _LOCKAPP = value
        End Set
    End Property

    Private _MST_ID As String
    Public Property MST_ID() As String
        Get
            Return _MST_ID
        End Get
        Set(ByVal value As String)
            _MST_ID = value
        End Set
    End Property

    Private _VARIETY As String
    Public Property VARIETY() As String
        Get
            Return _VARIETY
        End Get
        Set(ByVal value As String)
            _VARIETY = value
        End Set
    End Property

    Private _Color As String
    Public Property Color() As String
        Get
            Return _Color
        End Get
        Set(value As String)
            _Color = value
        End Set
    End Property

    Private _PIC As String
    Public Property PIC() As String
        Get
            Return _PIC
        End Get
        Set(value As String)
            _PIC = value
        End Set
    End Property

    Private _SENT As String
    Public Property SENT() As String
        Get
            Return _SENT
        End Get
        Set(value As String)
            _SENT = value
        End Set
    End Property

    Private _AlreadyExist As String
    Public Property AlreadyExist() As String
        Get
            Return _AlreadyExist
        End Get
        Set(value As String)
            _AlreadyExist = value
        End Set
    End Property

    Private _FType As New BO.Types
    Public Property FType() As BO.Types
        Get
            Return _FType
        End Get
        Set(value As BO.Types)
            _FType = value
        End Set
    End Property

End Class

Public Class Recipe
    Private _ID As String
    Public Property ID() As String
        Get
            Return _ID
        End Get
        Set(ByVal value As String)
            _ID = value
        End Set
    End Property
    Private _Flower As String
    Public Property Flower() As String
        Get
            Return _Flower
        End Get
        Set(ByVal value As String)
            _Flower = value
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
    Private _ProductID As String
    Public Property ProductID() As String
        Get
            Return _ProductID
        End Get
        Set(ByVal value As String)
            _ProductID = value
        End Set
    End Property
    Private _Product As String
    Public Property Product() As String
        Get
            Return _Product
        End Get
        Set(ByVal value As String)
            _Product = value
        End Set
    End Property
    Private _ColorCode As String
    Public Property ColorCode() As String
        Get
            Return _ColorCode
        End Get
        Set(ByVal value As String)
            _ColorCode = value
        End Set
    End Property

    Private _UserCode As String
    Public Property UserCode() As String
        Get
            Return _UserCode
        End Get
        Set(ByVal value As String)
            _UserCode = value
        End Set
    End Property

    Private _ForeColor As String
    Public Property ForeColor() As String
        Get
            Return _ForeColor
        End Get
        Set(ByVal value As String)
            _ForeColor = value
        End Set
    End Property

    Private _BGColor As String
    Public Property BGColor() As String
        Get
            Return _BGColor
        End Get
        Set(ByVal value As String)
            _BGColor = value
        End Set
    End Property

    Private _FontColor As String
    Public Property FontColor() As String
        Get
            Return _FontColor
        End Get
        Set(ByVal value As String)
            _FontColor = value
        End Set
    End Property
    Private _UOM As String
    Public Property UOM() As String
        Get
            Return _UOM
        End Get
        Set(value As String)
            _UOM = value
        End Set
    End Property

    Private _Cost As String
    Public Property Cost() As String
        Get
            Return _Cost
        End Get
        Set(ByVal value As String)
            _Cost = value
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
    Private _UNITS As Integer
    Public Property UNITS() As Integer
        Get
            Return _UNITS
        End Get
        Set(ByVal value As Integer)
            _UNITS = value
        End Set
    End Property
    Private _CODE As String
    Public Property CODE() As String
        Get
            Return _CODE
        End Get
        Set(ByVal value As String)
            _CODE = value
        End Set
    End Property
    Private _TotalRows As Integer
    Public Property TotalRows() As Integer
        Get
            Return _TotalRows
        End Get
        Set(ByVal value As Integer)
            _TotalRows = value
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


    Private _ADDDATE As DateTime
    Public Property ADDDATE() As DateTime
        Get
            Return _ADDDATE
        End Get
        Set(ByVal value As DateTime)
            _ADDDATE = value
        End Set
    End Property


    Private _ADDTIME As String
    Public Property ADDTIME() As String
        Get
            Return _ADDTIME
        End Get
        Set(ByVal value As String)
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

    Private _UPDUSER As String
    Public Property UPDUSER() As String
        Get
            Return _UPDUSER
        End Get
        Set(ByVal value As String)
            _UPDUSER = value
        End Set
    End Property

    Private _UPDDATE As DateTime
    Public Property UPDDATE() As DateTime
        Get
            Return _UPDDATE
        End Get
        Set(ByVal value As DateTime)
            _UPDDATE = value
        End Set
    End Property

    Private _UPDTIME As String
    Public Property UPDTIME() As String
        Get
            Return _UPDTIME
        End Get
        Set(ByVal value As String)
            _UPDTIME = value
        End Set
    End Property

    Private _UPDAPP As String
    Public Property UPDAPP() As String
        Get
            Return _UPDAPP
        End Get
        Set(ByVal value As String)
            _UPDAPP = value
        End Set
    End Property
End Class

