Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Xml
Imports System.Reflection

Public Class Inventory
    Public Shared Function GetInvenID(ByVal Farmno As String, ByVal Boxno As Integer) As BO.Inventory
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uinventno As New BO.Inventory()
            uinventno.ID = "0"
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetInvenIdByfarmno", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Farm", Farmno)
                    cmd.Parameters.AddWithValue("@Boxnum", Boxno)
                    Using rdr As SqlDataReader = cmd.ExecuteReader()
                        While (rdr.Read())
                            uinventno.ID = rdr("Id") 'Muthu Nivetha M :: 11 Mar 19 :: Conversion from string "" to type 'Integer' is not valid
                            uinventno.Farm = rdr("Farm")
                            uinventno.Flower = rdr("Flower")
                            uinventno.InvenTbl = rdr("Tablename")
                        End While
                    End Using
                End Using
            End Using
            Return uinventno

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvenID")
            Throw ex
        End Try
    End Function

    Public Shared Function InsertInventoryDetailsForLabel(ByVal XMLString As String, ByVal UserID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spInsertRptInventoryDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@InventortDetails", XMLString)
                    cmd.Parameters.AddWithValue("@UserID", UserID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertInventoryDetailsForLabel")
            Return "error"
        End Try
    End Function


    Public Shared Function InsertRackDetailsForExcelExport(ByVal XMLString As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spInsertRptRackDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@RackDetails", XMLString)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertInventoryDetailsForLabel")
            Return "error"
        End Try
    End Function

    Public Shared Function ReleaseInventory(ByVal IDs As String, ByVal ReleaseFrom As String, ByVal ReleaseTo As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spReleaseInventory", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IDs", IDs)
                    cmd.Parameters.AddWithValue("@ReleaseFrom", ReleaseFrom)
                    cmd.Parameters.AddWithValue("@ReleaseTo", ReleaseTo)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ReleaseInventory")
            Throw ex
        End Try
    End Function
    'Added by Anubhuti 19/10/2021
    Public Shared Function GetinventoryPricing(ByVal UserID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spinventorypricing", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@UserID", UserID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetinventoryPricing")
            Throw ex
        End Try
    End Function

    Public Shared Function GetSqlData(ByVal table As String, ByVal SelectedColumns As String) As DataTable
        Try


            Dim RunTimeProperties As New Dictionary(Of String, Object)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("select " + SelectedColumns + " from " + table + "", SqlCon)
            Cmd.CommandType = CommandType.Text
            Dim adp As New SqlDataAdapter(Cmd)
            Dim Sqldt As New DataTable
            adp.Fill(Sqldt)
            Return Sqldt

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSqlData1")
            Throw ex
        End Try
    End Function

    Public Shared Function GetSqlData(ByVal table As String, ByVal SelectedColumns As String, ByVal where As String) As DataTable
        Try

            Dim RunTimeProperties As New Dictionary(Of String, Object)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("select " + SelectedColumns + " from " + table + " where " + where + "", SqlCon)
            Cmd.CommandType = CommandType.Text
            Dim adp As New SqlDataAdapter(Cmd)
            Dim Sqldt As New DataTable
            adp.Fill(Sqldt)
            Return Sqldt
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSqlData1")
            Throw ex
        End Try
    End Function


    Public Shared Function GetFeatureDetailsinSQL(ByVal FeatureName As String) As Boolean
        Try
            Dim Resultvalue As Boolean = False
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblFeatures where Name=@Name", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@Name", FeatureName)
                    Dim adp As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    adp.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Resultvalue = dt.Rows(0)("Value")
                    End If
                    Return Resultvalue
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFeatureDetailsinSQL")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetInventoryHeader_FGFromSQL(ByVal whereClause As String, ByVal tableName As String, ByVal ReceivedPiecesOnly As String, ByVal AWBFlag As String) As List(Of BO.Inventory)
        Try
            Dim UserFeatures As List(Of Feature) = HttpContext.Current.Session("LoginUserFeatures")
            Dim CSRECCalculation As Boolean = False
            Try
                For Each i In UserFeatures
                    If i.Name.ToUpper = "CSREC Box Calculation" And i.Value = True Then
                        CSRECCalculation = True
                    End If
                Next
            Catch ex As Exception
                CSRECCalculation = False
            End Try


            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistinven As New List(Of BO.Inventory)
            Dim groupedCustomerList = Nothing
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim sortExp As String = ""
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "LOT"
                End If

                Dim BoxQry As String = ""
                If tableName = "inven" Then
                    If whereClause = Nothing Then
                        whereClause = "BOXES>0 "
                    Else
                        whereClause = whereClause + " and BOXES>0 "
                    End If
                    If ReceivedPiecesOnly = "0" Then
                        If CSRECCalculation Then
                            'BoxQry = "Cast(((CSREC/Units)-(CSSOLD/Units))as float(5,4)) AS BOXES,Cast((((CSREC/Units)-(CSSOLD/Units)) * Units)as float(5,4)) as TotalUnits,Cast(Cost * Cast((((CSREC/Units)-(CSSOLD/Units)) * Units)as float(5,4)) as float(5,4)) as TotalCost"
                            BoxQry = "Cast(((CSREC/Units)-(CSSOLD/Units)-(CSHOLD/Units))as float(5,4)) AS BOXES"
                        Else

                            BoxQry = "(CSREC-CSSOLD-CSHOLD) AS BOXES"
                        End If
                    Else
                        BoxQry = "(CSREC) AS BOXES"
                    End If
                Else
                    BoxQry = "(CSREC) AS BOXES"
                End If
                Dim Qry As String = ""

                'If (whereClause = Nothing) Then
                '    'Muthu Nivetha M :: 08 Mar 19 :: Index (zero based) must be greater than or equal to zero and less than the size of the argument list.
                '    Qry = String.Format("select LOT,DATEREC,sum(BOXES) as BOXES,SUM(FBE) AS FBE,Airport,Status from (select *,(units*Boxes) as TotalUnits,dbo.GETFBE((select cat from F_flower where flower=a.flower),farm,uom) * Boxes as FBE,City As Airport,(CASE WHEN Flag='A' THEN Flag ELSE '' END) AS Status from (select inv.*,cc.Color As FontColor,cc.Bgcolor," + BoxQry + "isnull(F.Grade,'') Grade1,isnull(F.Cat,'') cat1," +
                '                        " isnull(F.Variety,'') variety1,isnull(F.Color,'') color1 from " +
                '                        tableName + " inv inner join tblColorCode cc on cc.Code=inv.ColorCode  left join F_Flower f on LTRIM(RTRIM(f.flower))=LTRIM(RTRIM(inv.flower)) where inv.id<>'' " + IIf(AWBFlag <> "", " And Flag='A'", "") + " ) a ) b group by LOT,DATEREC,Airport,Status order by {0}", sortExp)
                'Else
                '    Qry = String.Format("select LOT,DATEREC,sum(BOXES) as BOXES,SUM(FBE) AS FBE,Airport,Status from (select *,(units*Boxes) as TotalUnits,dbo.GETFBE((select cat from F_flower where flower=a.flower),farm,uom) * Boxes as FBE,City As Airport,(CASE WHEN Flag='A' THEN Flag ELSE '' END) AS Status from (select inv.*,cc.Color As FontColor,cc.Bgcolor," + BoxQry + ",isnull(F.Grade,'') Grade1,isnull(F.Cat,'') cat1," +
                '                        " isnull(F.Variety,'') variety1,isnull(F.Color,'') color1 from " +
                '                        tableName + " inv inner join tblColorCode cc on cc.Code=inv.ColorCode left join F_Flower f on LTRIM(RTRIM(f.flower))=LTRIM(RTRIM(inv.flower)) where inv.id<>'' " + IIf(AWBFlag <> "", " And Flag='A'", "") + " ) a ) b where {0} group by LOT,DATEREC,Airport,Status order by {1}", whereClause, sortExp)
                'End If // Commented by Belal on 16th Sept 2020


                Using cmd As New SqlCommand("spGetInventoryHeader", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@tableName", tableName)
                    cmd.Parameters.AddWithValue("@whereClause", whereClause)
                    cmd.Parameters.AddWithValue("@AWBFlag", AWBFlag)
                    cmd.Parameters.AddWithValue("@BoxQry", BoxQry)
                    cmd.Parameters.AddWithValue("@sortExp", sortExp)

                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1

                    dt.Columns.Add(INCcolumn)
                    da.Fill(dt)

                    Dim TotalCount As Integer = dt.Rows.Count
                    Dim Boxes As Integer = 0
                    Dim TotalFBE As Decimal = 0
                    If (dt.Rows.Count > 0) Then
                        Boxes = dt.Compute("Sum(Boxes)", "")
                    End If

                    Dim PagedDataSet As DataTable = Nothing

                    If TotalCount <> 0 Then


                        For Each row In dt.Rows
                            Dim u As New BO.Inventory
                            u.RowNo = row("RECNO")
                            u.AWB = row("LOT")
                            u.DateRec = row("DATEREC")
                            u.CSREC = row("Boxes")
                            u.TotalRows = TotalCount
                            u.FBE = row("FBE")
                            u.City = row("Airport")
                            u.Flag = row("Status")
                            TotalFBE += u.FBE
                            ulistinven.Add(u)
                        Next
                    End If

                    Dim po As New BO.Inventory()
                    po.RowNo = 0
                    po.AWB = "0"
                    po.UOM = ""
                    po.FBE = TotalFBE
                    po.DateRec = DateTime.Now.ToString()
                    po.CSREC = Boxes
                    po.TotalRows = TotalCount
                    po.Flag = ""
                    po.City = ""
                    ulistinven.Add(po)
                End Using
            End Using
            Return ulistinven
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventoryHeader_FGFromSQL")
            'ErrorLogs.LogException(ex, "Error in GetInventoryGridlistFromSQL")
            Return Nothing
        End Try

    End Function

    ''' <summary>
    ''' MANI::12-27-2017::FOR INVENTORY GRID DETAILS BY FARM
    ''' </summary>
    ''' <param name="whereClause"></param>
    ''' <returns></returns>
    Public Shared Function GetInventoryDetailsGridlistByFarm(ByVal whereClause As String, ByVal TableName As String, ByVal ReceivedPiecesOnly As String, ByVal AWBFlag As String) As List(Of BO.Inventory)
        Try

            Dim UserFeatures As List(Of Feature) = HttpContext.Current.Session("LoginUserFeatures")
            Dim CSRECCalculation As Boolean = False
            Try
                For Each i In UserFeatures
                    If i.Name.ToUpper = "CSREC Box Calculation" And i.Value = True Then
                        CSRECCalculation = True
                    End If
                Next
            Catch ex As Exception
                CSRECCalculation = False
            End Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistinven As New List(Of BO.Inventory)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim sortExp As String = ""
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "Farm asc,Flower asc"
                End If
                ' Dim TotalCount As Integer = GetPOCount(whereClause)
                Dim BoxQry As String = ""
                If TableName = "inven" Then
                    If whereClause = Nothing Then
                        whereClause = "BOXES<>0"
                    Else
                        whereClause = whereClause + " and BOXES<>0"
                    End If
                    If ReceivedPiecesOnly = "0" Then
                        If CSRECCalculation Then
                            'BoxQry = "Cast(((CSREC/Units)-(CSSOLD/Units))as float(5,4)) AS BOXES,Cast((((CSREC/Units)-(CSSOLD/Units)) * Units)as float(5,4)) as TotalUnits,Cast(Cost * Cast((((CSREC/Units)-(CSSOLD/Units)) * Units)as float(5,4)) as float(5,4)) as TotalCost"
                            BoxQry = "Cast(((CSREC/Units)-(CSSOLD/Units)-(CSHOLD/Units))as float(5,4)) AS BOXES"
                        Else

                            BoxQry = "(CSREC-CSSOLD) AS BOXES"
                        End If
                    Else
                        BoxQry = "(CSREC) AS BOXES"
                    End If
                Else
                    BoxQry = "(CSREC) AS BOXES"
                End If
                Dim Qry As String = ""

                'If (whereClause = Nothing) Then
                '    Qry = String.Format("select *,(TotalUnits*Cost) as TotalCost from (select *,(units*Boxes) as TotalUnits,dbo.GETFBE((select cat from F_flower where flower=a.flower),farm,uom) * Boxes as FBE from (select inv.*,cc.Color As FontColor,cc.Bgcolor," + BoxQry + "isnull(F.Grade,'') Grade1,isnull(F.Cat,'') cat1," +
                '                        " isnull(F.Variety,'') variety1,isnull(F.Color,'') color1,ISNULL(cr.ID,0) CredReqID from " +
                '                        TableName + " inv inner join tblColorCode cc on cc.Code=inv.ColorCode left join F_CREREQ cr on cr.IDINVEN=inv.ID left join F_Flower f on LTRIM(RTRIM(f.flower))=LTRIM(RTRIM(inv.flower)) where inv.id<>'' " + IIf(AWBFlag <> "", " And Flag='A'", "") + " ) a ) b order by {1}", sortExp)
                'Else
                '    Qry = String.Format("select *,(TotalUnits*Cost) as TotalCost from (select *,(units*Boxes) as TotalUnits,dbo.GETFBE((select cat from F_flower where flower=a.flower),farm,uom) * Boxes as FBE from (select inv.*,cc.Color As FontColor,cc.Bgcolor," + BoxQry + ",isnull(F.Grade,'') Grade1,isnull(F.Cat,'') cat1," +
                '                        " isnull(F.Variety,'') variety1,isnull(F.Color,'') color1,ISNULL(cr.ID,0) CredReqID from " +
                '                        TableName + " inv inner join tblColorCode cc on cc.Code=inv.ColorCode left join F_CREREQ cr on cr.IDINVEN=inv.ID left join F_Flower f on LTRIM(RTRIM(f.flower))=LTRIM(RTRIM(inv.flower)) where inv.id<>'' " + IIf(AWBFlag <> "", " And Flag='A'", "") + " ) a ) b where {0} order by {1}", whereClause, sortExp)
                'End If


                Using cmd As New SqlCommand("spGetInventoryDetails", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@tableName", TableName)
                    cmd.Parameters.AddWithValue("@whereClause", whereClause)
                    cmd.Parameters.AddWithValue("@AWBFlag", AWBFlag)
                    cmd.Parameters.AddWithValue("@BoxQry", BoxQry)
                    cmd.Parameters.AddWithValue("@sortExp", sortExp)

                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable

                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1

                    ds.Columns.Add(INCcolumn)
                    da.Fill(ds)
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim TotalBoxes As Integer = 0
                    Dim TotalUnits As Integer = 0
                    Dim TotalCost As Decimal = 0
                    Dim TotalFBE As Decimal = 0
                    Dim TotalBoxCount As Integer = 0
                    If (ds.Rows.Count > 0) Then
                        TotalUnits = ds.Compute("Sum(TotalUnits)", "")
                        TotalBoxes = ds.Compute("Sum(BOXES)", "")
                        TotalCost = ds.Compute("Sum(TotalCost)", "")
                    End If

                    'Dim PagedDataSet As DataTable = Nothing

                    If TotalCount > 0 Then


                        For Each row In ds.Rows
                            Dim u As New BO.Inventory
                            If (row("Id") = "") Then
                                u.ID = "0"
                            Else
                                u.ID = row("Id")
                            End If

                            u.RowNo = row("RECNO")
                            u.DateRec = row("DateRec")
                            u.AWB = row("LOT")
                            u.Farm = row("Farm")
                            u.ProductCode = row("Flower")
                            u.ProductName = row("Name")
                            u.CSREC = Convert.ToInt32(row("BOXES"))
                            u.RecQty = Convert.ToInt32(row("CSREC"))
                            u.CSSOLD = Convert.ToInt32(row("CSSOLD"))
                            TotalBoxCount += u.CSREC
                            u.UOM = row("UOM")
                            'u.FBE = CalculateFBE(row("LOT"), row("Farm"), row("Boxnum"), row("DateRec"), TableName, CSRECCalculation, ReceivedPiecesOnly)
                            u.FBE = row("FBE") '* u.CSREC
                            TotalFBE += u.FBE
                            u.TotalUnits = Convert.ToInt32(row("TotalUnits"))
                            u.TotalCost = row("TotalCost")
                            'If ds.Columns.Contains("Category") Then
                            '    u.ProductCategory = row("Category")
                            'ElseIf ds.Columns.Contains("Cat") Then
                            '    u.ProductCategory = Convert.ToString(row("Cat"))
                            'End If
                            u.BoxNumber = Convert.ToInt32(row("Boxnum"))
                            u.CustNum = Convert.ToInt32(row("cust"))
                            u.Invoice = Convert.ToInt32(row("Invoice"))
                            u.PO = row("po")
                            u.FlowerDetails.FontColor = row("FontColor")
                            u.FlowerDetails.BGColor = row("BgColor")
                            u.UnitsBunch = row("UNITSBUNCH")
                            u.Cost = Convert.ToDecimal(row("COST"))
                            u.Type = row("FLAG")
                            u.InvenType = row("INVENTYPE")
                            u.Units = Convert.ToInt32(row("UNITS"))
                            u.Comments = Convert.ToString(row("Comments"))
                            u.ProductCategory = Convert.ToString(row("cat1"))
                            u.Variety = Convert.ToString(row("variety1"))
                            u.Color = Convert.ToString(row("color1"))
                            u.Grade = Convert.ToString(row("Grade1"))
                            u.WH = Convert.ToString(row("wh"))

                            Dim daycount As Integer = DateTime.Now.Date.Subtract(u.DateRec).Days
                            If daycount > 0 Then
                                u.Days = daycount
                            ElseIf daycount = 0 Then
                                u.Days = ""
                            Else
                                u.Days = "+" + ((-1) * daycount).ToString()
                            End If

                            u.TotalRows = TotalCount

                            u.AddDate = Convert.ToString(row("ADDDATE"))
                            u.AddTime = Convert.ToString(row("ADDTIME"))
                            u.AddUser = Convert.ToString(row("ADDUSER"))
                            u.UpdateDate = IIf(IsDBNull(row("UPDDATE")), "01/01/1900", Convert.ToString(row("UPDDATE")))
                            u.UpdateTime = Convert.ToString(row("UPDTIME"))
                            u.UpdateUser = Convert.ToString(row("UPDUSER"))

                            u.DeleteDate = IIf(IsDBNull(row("DELDATE")), "01/01/1900", Convert.ToString(row("DELDATE")))
                            u.DeleteTime = Convert.ToString(row("DELTIME"))
                            u.DeleteUser = Convert.ToString(row("DELUSER"))
                            u.LockDate = IIf(IsDBNull(row("LOCKDATE")), "01/01/1900", Convert.ToString(row("LOCKDATE")))
                            u.LockTime = Convert.ToString(row("LOCKTIME"))
                            u.LockUser = Convert.ToString(row("LOCKUSER"))
                            u.CreReqID = If(row("CredReqID") Is DBNull.Value, 0, row("CredReqID"))
                            ulistinven.Add(u)
                        Next
                    End If

                    Dim inven As New BO.Inventory()
                    inven.RowNo = 0
                    inven.DateRec = DateTime.Now.ToString()
                    inven.AWB = ""
                    inven.Farm = ""
                    inven.ProductCode = ""
                    inven.ProductName = ""
                    If TotalBoxes = TotalBoxCount Then
                        inven.CSREC = TotalBoxes
                    Else
                        inven.CSREC = TotalBoxCount
                    End If
                    inven.UOM = ""
                    inven.FBE = TotalFBE
                    inven.TotalUnits = TotalUnits
                    inven.TotalCost = TotalCost
                    inven.ProductCategory = ""
                    inven.BoxNumber = 0
                    inven.CustNum = 0
                    inven.Invoice = 0
                    inven.PO = ""
                    inven.FlowerDetails.FontColor = ""
                    inven.FlowerDetails.BGColor = ""
                    inven.UnitsBunch = ""
                    inven.Cost = 0
                    inven.InvenType = ""
                    inven.Units = 0
                    inven.Comments = ""
                    inven.Days = ""
                    inven.TotalRows = TotalCount

                    inven.AddDate = "01/01/1900"
                    inven.AddTime = ""
                    inven.AddUser = ""
                    inven.UpdateDate = "01/01/1900"
                    inven.UpdateTime = ""
                    inven.UpdateUser = ""

                    inven.DeleteDate = "01/01/1900"
                    inven.DeleteTime = ""
                    inven.DeleteUser = ""
                    inven.LockDate = "01/01/1900"
                    inven.LockTime = ""
                    inven.LockUser = ""

                    ulistinven.Add(inven)


                End Using
            End Using
            Return ulistinven
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventoryDetailsGridlistByFarm")
            'ErrorLogs.LogException(ex, "Error in GetInventoryGridlistFromSQL")
            Return Nothing
        End Try

    End Function

    Public Shared Function GetInventoryDetailsGridlist(ByVal whereClause As String, ByVal TableName As String, ByVal ReceivedPiecesOnly As String, ByVal AWBFlag As String) As List(Of BO.Inventory)
        Try

            Dim UserFeatures As List(Of Feature) = HttpContext.Current.Session("LoginUserFeatures")

            Dim CSRECCalculation As Boolean = False

            Try
                For Each i In UserFeatures
                    If i.Name.ToUpper = "CSREC Box Calculation" And i.Value = True Then
                        CSRECCalculation = True
                    End If
                Next
            Catch ex As Exception
                CSRECCalculation = False
            End Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistinven As New List(Of BO.Inventory)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim sortExp As String = ""
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "LOT"
                End If
                ' Dim TotalCount As Integer = GetPOCount(whereClause)
                Dim BoxQry As String = ""
                If TableName = "inven" Then
                    If whereClause = Nothing Then
                        whereClause = "BOXES>0"
                    Else
                        whereClause = whereClause + " and BOXES>0 "
                    End If
                    If ReceivedPiecesOnly = "0" Then
                        If CSRECCalculation Then
                            'BoxQry = "Cast(((CSREC/Units)-(CSSOLD/Units))as float(5,4)) AS BOXES,Cast((((CSREC/Units)-(CSSOLD/Units)) * Units)as float(5,4)) as TotalUnits,Cast(Cost * Cast((((CSREC/Units)-(CSSOLD/Units)) * Units)as float(5,4)) as float(5,4)) as TotalCost"
                            BoxQry = "Cast(((CSREC/Units)-(CSSOLD/Units)-(CSHOLD/Units))as float(5,4)) AS BOXES"
                        Else

                            BoxQry = "(CSREC-CSSOLD-CSHOLD) AS BOXES"
                        End If
                    Else
                        BoxQry = "(CSREC) AS BOXES"
                    End If
                Else
                    BoxQry = "(CSREC) AS BOXES"
                End If
                Dim Qry As String = ""

                'If (whereClause = Nothing) Then
                '    Qry = String.Format("select FARM,LOT,DATEREC,sum(BOXES) as BOXES,SUM(FBE) AS FBE from (select *,(units*Boxes) as TotalUnits,dbo.GETFBE((select cat from F_flower where flower=a.flower),farm,uom) * Boxes as FBE from (select inv.*,cc.Color As FontColor,cc.Bgcolor," + BoxQry + "isnull(F.Grade,'') Grade1,isnull(F.Cat,'') cat1," +
                '                        " isnull(F.Variety,'') variety1,isnull(F.Color,'') color1 from " +
                '                        TableName + " inv inner join tblColorCode cc on cc.Code=inv.ColorCode  left join F_Flower f on LTRIM(RTRIM(f.flower))=LTRIM(RTRIM(inv.flower)) where inv.id<>'' " + IIf(AWBFlag <> "", " And Flag='A'", "") + " ) a ) b group by FARM,LOT,DATEREC order by {1}", sortExp)
                'Else
                '    Qry = String.Format("select FARM,LOT,DATEREC,sum(BOXES) as BOXES,SUM(FBE) AS FBE from (select *,(units*Boxes) as TotalUnits,dbo.GETFBE((select cat from F_flower where flower=a.flower),farm,uom) * Boxes as FBE from (select inv.*,cc.Color As FontColor,cc.Bgcolor," + BoxQry + ",isnull(F.Grade,'') Grade1,isnull(F.Cat,'') cat1," +
                '                        " isnull(F.Variety,'') variety1,isnull(F.Color,'') color1 from " +
                '                        TableName + " inv inner join tblColorCode cc on cc.Code=inv.ColorCode left join F_Flower f on LTRIM(RTRIM(f.flower))=LTRIM(RTRIM(inv.flower)) where inv.id<>'' " + IIf(AWBFlag <> "", " And Flag='A'", "") + " ) a ) b where {0} group by FARM,LOT,DATEREC order by {1}", whereClause, sortExp)
                'End If


                Using cmd As New SqlCommand("spGetInventoryDetailList", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@tableName", TableName)
                    cmd.Parameters.AddWithValue("@whereClause", whereClause)
                    cmd.Parameters.AddWithValue("@AWBFlag", AWBFlag)
                    cmd.Parameters.AddWithValue("@BoxQry", BoxQry)
                    cmd.Parameters.AddWithValue("@sortExp", sortExp)

                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable

                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1

                    ds.Columns.Add(INCcolumn)
                    da.Fill(ds)
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim Boxes As Integer = 0
                    Dim TotalFBE As Decimal = 0
                    If (ds.Rows.Count > 0) Then
                        Boxes = ds.Compute("Sum(Boxes)", "")
                    End If

                    ' Dim PagedDataSet As DataTable = Nothing

                    If TotalCount <> 0 Then
                        For Each row In ds.Rows
                            Dim u As New BO.Inventory
                            u.RowNo = row("RECNO")
                            u.Farm = row("Farm")
                            ' u.UOM = row("UOM")
                            ' u.FBE = CalculateFBE(Convert.ToString(row("UOM")).ToLower()) * Convert.ToInt32(row("TotalUnits"))
                            'u.FBE = CalculateFBE(row("LOT"), row("Farm"), row("DATEREC"), TableName, CSRECCalculation, ReceivedPiecesOnly)
                            u.DateRec = row("DATEREC")
                            u.CSREC = row("Boxes")
                            u.AWB = row("LOT")
                            u.TotalRows = TotalCount
                            u.FBE = row("FBE")
                            TotalFBE += u.FBE
                            ulistinven.Add(u)
                        Next
                    End If

                    Dim po As New BO.Inventory()
                    po.RowNo = 0
                    po.Farm = "0"
                    po.UOM = ""
                    po.FBE = TotalFBE
                    po.DateRec = DateTime.Now.ToString()
                    po.CSREC = Boxes
                    po.AWB = "0"
                    po.TotalRows = TotalCount
                    ulistinven.Add(po)


                End Using
            End Using
            Return ulistinven
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventoryDetailsGridlist")
            'Dim uList As New List(Of BO.Inventory)
            'Dim u As New BO.Inventory
            'u.ErrorMessage = "Error in GetInventoryDetailsGridlist:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "GetInventoryDetailsGridlist")
            'uList.Add(u)
            Return Nothing
        End Try

    End Function

    ''' <summary>
    ''' Mani::28-DEC-2017::to delete the Inven/Invhist table details
    ''' Anitha::20-Jul-2018::change to stored procedure
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <param name="TableName"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeleteInventoryDetails(ByVal ID As String, ByVal TableName As String, ByVal UserName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.Inventory
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spDeleteInventoryDetails", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@ID", ID)
                    Cmd.Parameters.AddWithValue("@TableName", TableName)
                    Cmd.Parameters.AddWithValue("@DELUSER", UserName)
                    Cmd.Parameters.AddWithValue("@DELAPP", "WEB")
                    Cmd.ExecuteNonQuery()
                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventoryDetailsGridlist")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' MANI::28-DEC-2017::to get the Inventory details by Id for to edit
    ''' Muthu Nivetha M :: 06Mar2020 :: Modified :: To get columns othercost,handling,duties/andean and landedcost for Edit Inventory email requirements
    ''' </summary>
    Public Shared Function GetInventoryById(ByVal ID As String, ByVal TableName As String) As BO.Inventory
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.Inventory
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                'Dim Qry As String = ""
                'If TableName = "inven" Then
                '    Qry = "spGetInventoryById"
                'Else
                '    Qry = String.Format("select inven.*,(inven.CSREC * inven.Units) as TotalUnits, flr.CAT,flr.ColorCode as 'ccode',ColorCode.FontColor, ColorCode.BgColor from " + TableName + " as inven inner join (select Flower, " +
                '                            "name,CAT,ColorCode  from F_flower where CAT<>'' and Name<>'' Group by Flower,name, " +
                '                            "CAT,ColorCode) as flr on flr.Flower=inven.Flower INNER JOIN ColorCode on ColorCode.Code=flr.ColorCode where inven.Id='{0}'", ID)
                'End If
                Using Cmd As New SqlCommand("spGetInventoryById", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@IDInven", ID)
                    Cmd.Parameters.AddWithValue("@TABLENAME", TableName)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("Id")
                        u.DateRec = row("DateRec")
                        u.AWB = row("LOT")
                        u.Farm = row("Farm")
                        u.ProductCategory = Convert.ToString(row("Cat"))
                        u.ProductCode = row("Flower")
                        u.ProductName = row("Name")
                        u.FlowerDetails.ColorCode = row("ccode")
                        u.CSREC = row("CSREC")
                        u.CSSOLD = row("CSSOLD")
                        u.UOM = row("UOM")
                        u.Units = row("Units")
                        u.TotalUnits = row("TotalUnits")
                        u.ProductCategory = Convert.ToString(row("Cat"))
                        u.BoxNumber = row("Boxnum")
                        u.CustNum = row("cust")
                        u.Invoice = row("Invoice")
                        u.OrderNumber = row("Order")
                        u.PO = row("po")
                        u.FlowerDetails.FontColor = row("FontColor")
                        u.FlowerDetails.BGColor = row("BgColor")
                        u.UnitsBunch = row("UNITSBUNCH")
                        u.Cost = Convert.ToDecimal(row("COST"))
                        u.Type = row("FLAG")
                        u.InvenType = row("INVENTYPE")
                        u.Units = row("UNITS")
                        u.Comments = Convert.ToString(row("Comments"))
                        u.SPORDID = row("SPORDID")
                        u.WH = Convert.ToString(row("WH"))
                        u.DateRecEdit = Convert.ToDateTime(row("DateRec")).ToString("MM/dd/yyyy")
                        u.Message1 = row("Message1")
                        'Commented By Prashant on 11 June 2020 For Getting the Laneded Cost Directly from table field
                        'Dim othrcost As Decimal = 0, handling As Decimal = 0, duties As Decimal = 0, landedcost As Decimal = 0, units As Int32 = 0, cost As Decimal = 0
                        'othrcost = Convert.ToDecimal(row("OTHERCOST"))
                        'handling = Convert.ToDecimal(row("HANDLING"))
                        'duties = Convert.ToDecimal(row("ANDEAN"))
                        'cost = Convert.ToDecimal(row("COST"))
                        'units = Convert.ToInt32(row("Units"))
                        'u.OtherCost = othrcost
                        'u.Handling = handling
                        'u.Andean = duties
                        'u.LandedCost = (cost + (othrcost / units) + handling + duties)
                        u.OtherCost = row("OTHERCOST")
                        u.Handling = row("HANDLING")
                        u.Andean = row("ANDEAN")
                        u.LandedCost = row("LANDEDCOST")
                        u.Price = row("Price")
                        u.BRAND = row("BRAND")
                    Next
                    Return u
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, String.Format("Error in GetInventoryById : ID : {0}, TableName : {1}", ID, TableName))
            'ErrorLogs.LogException(ex, "Error in GetInventoryById")
            Return Nothing
            'Dim u As New BO.Inventory
            'u.ErrorMessage = "Error in GetInventoryById:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "GetInventoryById")
            'Return u
        End Try
    End Function

    ''' <summary>
    ''' MANI::07-JULY-2018::to get the add/Edit user and date time information of the inventory details
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetInventoryAddEditInfo(ByVal ID As String, ByVal TableName As String) As BO.Inventory
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.Inventory
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("Select ADDUSER,ADDDATE,ADDTIME,UPDUSER,UPDDATE,UPDTIME,DELUSER,DELDATE,DELTIME,LOCKUSER,LOCKDATE,LOCKTIME from " + TableName + " where ID='{0}'", ID), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.AddDate = Convert.ToString(row("ADDDATE"))
                        u.AddTime = Convert.ToString(row("ADDTIME"))
                        u.AddUser = Convert.ToString(row("ADDUSER"))
                        u.UpdateDate = Convert.ToString(row("UPDDATE"))
                        u.UpdateTime = Convert.ToString(row("UPDTIME"))
                        u.UpdateUser = Convert.ToString(row("UPDUSER"))

                        u.DeleteDate = Convert.ToString(row("DELDATE"))
                        u.DeleteTime = Convert.ToString(row("DELTIME"))
                        u.DeleteUser = Convert.ToString(row("DELUSER"))
                        u.LockDate = Convert.ToString(row("LOCKDATE"))
                        u.LockTime = Convert.ToString(row("LOCKTIME"))
                        u.LockUser = Convert.ToString(row("LOCKUSER"))

                    Next
                    Return u
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventoryAddEditInfo")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' MANI::28-DEC-2015::to update the inventory details
    ''' Muthu Nivetha M :: 06Mar2020 :: Modified :: To save values of othercost,handling,duties/andean and landedcost for Edit Inventory email requirements
    ''' </summary>
    Public Shared Function UpdateInventoryDetails(ByVal ID As String, ByVal TableName As String, ByVal Flower As String, ByVal FlowerName As String, ByVal FlowerCategory As String, ByVal QtyRec As Integer, ByVal QtySold As Integer, ByVal UOM As String, ByVal UnitsPerBunch As Integer, ByVal Units As Integer, ByVal Cost As Decimal, ByVal InvenType As String, ByVal BoxNum As Integer, ByVal OrderNumber As Integer, ByVal PO As String, ByVal Invoice As Integer, ByVal Cust As Integer, ByVal Comments As String, ByVal ColorCode As String, ByVal Type As String, ByVal UserName As String, ByVal warehouse As String, ByVal AWB As String, ByVal DateRec As String, ByVal Farm As String, ByVal BreakDown As String, ByVal OtherCost As Decimal, ByVal Handling As Decimal, ByVal Duties As Decimal, ByVal LandedCost As Decimal, ByVal SellingPrice As Decimal, ByVal BRAND As String) As String
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.Inventory
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim qry As String = ""
                'If TableName = "inven" Then
                '    qry = String.Format("update " + TableName + " set FLOWER=@Flower,Name=@Name,CSREC=@QtyRec,CSSOLD=@QtySold,UOM=@uom,UNITSBUNCH=@unitsbunch," +
                '                                          "UNITS=@units,COST=@cost,INVENTYPE=@inventype,BOXNUM=@boxnum,[ORDER]=@Order,WH=@warehouse,PO=@PO,INVOICE=@Invoice,CUST=@Cust,COMMENTS=@comments,COLORCODE=@ColorCode,Flag=@Type," +
                '                                          "UPDUSER=@UPDUSER,UPDDATE=@UPDDATE,UPDTIME=@UPDTIME,UPDAPP=@UPDAPP " +
                '                                          "where Id='{0}'", ID)
                'ElseIf TableName = "invhist" Then
                '    qry = String.Format("update " + TableName + " set FLOWER=@Flower,Name=@Name,CSREC=@QtyRec,CSSOLD=@QtySold,UOM=@uom,UNITSBUNCH=@unitsbunch," +
                '                                          "UNITS=@units,COST=@cost,INVENTYPE=@inventype,BOXNUM=@boxnum,[ORDER]=@Order,WH=@warehouse,PO=@PO,INVOICE=@Invoice,CUST=@Cust,COMMENTS=@comments,COLORCODE=@ColorCode,Flag=@Type," +
                '                                          "UPDUSER=@UPDUSER,UPDDATE=@UPDDATE,UPDTIME=@UPDTIME,UPDAPP=@UPDAPP " +
                '                                          "where Id='{0}'", ID)
                'End If

                Using Cmd As New SqlCommand("spUpdateInventoryDetails", Con)
                    'Cmd.CommandType = CommandType.Text
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@Flower", Flower)
                    Cmd.Parameters.AddWithValue("@Name", FlowerName)
                    'Cmd.Parameters.AddWithValue("@Cat", FlowerCategory)
                    Cmd.Parameters.AddWithValue("@QtyRec", QtyRec)
                    Cmd.Parameters.AddWithValue("@QtySold", QtySold)
                    Cmd.Parameters.AddWithValue("@uom", UOM)
                    Cmd.Parameters.AddWithValue("@unitsbunch", UnitsPerBunch)
                    Cmd.Parameters.AddWithValue("@units", Units)
                    Cmd.Parameters.AddWithValue("@cost", Cost)
                    Cmd.Parameters.AddWithValue("@inventype", InvenType)
                    Cmd.Parameters.AddWithValue("@boxnum", BoxNum)
                    Cmd.Parameters.AddWithValue("@Order", OrderNumber)
                    Cmd.Parameters.AddWithValue("@warehouse", warehouse)
                    Cmd.Parameters.AddWithValue("@PO", PO)
                    Cmd.Parameters.AddWithValue("@Invoice", Invoice)
                    Cmd.Parameters.AddWithValue("@Cust", Cust)
                    Cmd.Parameters.AddWithValue("@comments", Comments)
                    Cmd.Parameters.AddWithValue("@ColorCode", Convert.ToInt32(ColorCode))
                    Cmd.Parameters.AddWithValue("@Type", Type)
                    Cmd.Parameters.AddWithValue("@UPDUSER", UserName)
                    Cmd.Parameters.AddWithValue("@UPDAPP", "WEB")
                    Cmd.Parameters.AddWithValue("@ID", ID)
                    Cmd.Parameters.AddWithValue("@TableName", TableName)
                    Cmd.Parameters.AddWithValue("@AWB", AWB)
                    Cmd.Parameters.AddWithValue("@DateRec", DateRec)
                    Cmd.Parameters.AddWithValue("@Farm", Farm)
                    Cmd.Parameters.AddWithValue("@Message1", BreakDown)
                    Cmd.Parameters.AddWithValue("@Othercost", OtherCost)
                    Cmd.Parameters.AddWithValue("@Handling", Handling)
                    Cmd.Parameters.AddWithValue("@Landedcost", LandedCost)
                    Cmd.Parameters.AddWithValue("@Andean", Duties)
                    Cmd.Parameters.AddWithValue("@SellingPrice", SellingPrice)
                    Cmd.Parameters.AddWithValue("@BRAND", BRAND)
                    Cmd.ExecuteNonQuery()
                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateInventoryDetails")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' STA::06-OCT-2015::to get the Inventory details from DBF file by the AWB
    ''' </summary>
    ''' <param name="AWB"></param>
    ''' <param name="Farm"></param>
    ''' <param name="Flower"></param>
    ''' <param name="DateRec"></param>
    ''' <param name="BoxNum"></param>
    ''' <param name="TableName"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetInventoryDetailsByAWB(ByVal AWB As String, ByVal Farm As String, ByVal Flower As String, ByVal DateRec As String,
                                                    ByVal BoxNum As String, ByVal TableName As String, ByVal ReceivedPiecesOnly As String, ByVal AWBFlag As String) As List(Of BO.Inventory)
        Try
            Dim CSRECCalculation As Boolean = GetFeatureDetailsinSQL("CSREC Box Calculation")
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistPOD As New List(Of BO.Inventory)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim whareclause As String = ""
                If AWB <> Nothing And AWB <> "" And AWB <> String.Empty And Farm <> Nothing And Farm <> "" And Farm <> String.Empty And Flower <> Nothing And
                    Flower <> "" And Flower <> String.Empty And DateRec <> Nothing And DateRec <> "" And DateRec <> String.Empty And BoxNum <> "" And BoxNum <> String.Empty Then
                    whareclause = "inv.LOT=" + AWB + " and inv.Farm='" + Farm + "' and inv.Flower='" + Flower + "' and DateRec =" + DateRec + " and BoxNum =" + BoxNum
                ElseIf (AWB <> Nothing And AWB <> "" And AWB <> String.Empty And Farm <> Nothing And Farm <> "" And Farm <> String.Empty And DateRec <> Nothing And
                    DateRec <> "" And DateRec <> String.Empty) And Flower = "" And BoxNum = "" Then
                    whareclause = "inv.LOT=" + AWB + " and inv.Farm='" + Farm + "' and DateRec =" + DateRec + ""
                ElseIf (AWB <> Nothing And AWB <> "" And AWB <> String.Empty And DateRec <> Nothing And DateRec <> "" And DateRec <> String.Empty) And
                    Farm = "" And Flower = "" And BoxNum = "" Then
                    whareclause = "inv.LOT=" + AWB + " and DateRec =" + DateRec + ""
                End If
                If whareclause <> "" Then
                    whareclause = whareclause + IIf(AWBFlag = "1", " And Flag='A'", "")
                End If

                Dim Qry As String = ""
                If TableName.Length = "2" Then
                    Qry = String.Format("Select * from WINVNW as inv left join F_FARM frm on frm.Farm=inv.Farm where UserFileNo='" + TableName + "' And {0}", whareclause)
                Else
                    Qry = String.Format("Select * from " + TableName + " as inv left join F_FARM frm on frm.Farm=inv.Farm where {0}", whareclause)
                End If

                'Using Cmd As New VfpCommand(String.Format("Select inv.*,fl.CAT,fl.Name,F_Farm.MANUFACID from " + TableName + " as inv " +
                '                                " inner join (select Flower,Name,CAT from F_Flower where Flower<>'' and Name<>'' and CAT<>'' group by Flower,Name,CAT) as fl on inv.Flower=fl.Flower " +
                '                                " inner join F_Farm on F_Farm.Farm=inv.Farm " +
                '                                " where {0}", whareclause), Con)
                Using Cmd As New SqlCommand(Qry, Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)


                    For Each row In ds.Rows
                        Dim u As New BO.Inventory
                        u.AWB = row("LOT")
                        u.BoxNumber = row("BOXNUM")
                        u.CustNum = row("CUST")
                        u.Farm = row("FARM")
                        If ds.Columns.Contains("ORDER") Then
                            u.OrderNumber = row("ORDER")
                        End If
                        If ds.Columns.Contains("CAT") Then
                            u.ProductCategory = Convert.ToString(row("CAT"))
                        ElseIf ds.Columns.Contains("Category") Then
                            u.ProductCategory = Convert.ToString(row("Category"))
                        End If
                        u.ProductCode = row("FLOWER")
                        u.ProductName = row("Name")
                        u.UOM = row("UOM")
                        'u.CSREC = row("CSREC")
                        If (Convert.ToString(row("CSREC")) <> "" And Convert.ToString(row("CSSOLD")) <> "" And TableName = "inven" And ReceivedPiecesOnly = "0") Then
                            If CSRECCalculation Then
                                u.CSREC = (Convert.ToInt32(row("CSREC")) / Convert.ToInt32(row("UNITS"))) - (Convert.ToInt32(row("CSSOLD")) / Convert.ToInt32(row("UNITS")))
                            Else
                                u.CSREC = Convert.ToInt32(row("CSREC")) - Convert.ToInt32(row("CSSOLD"))
                            End If

                        Else
                            u.CSREC = Convert.ToInt32(row("CSREC"))
                        End If
                        u.PO = row("PO")
                        u.Comments = row("COMMENTS")
                        u.ManufacID = Convert.ToString(row("MANUFACID"))
                        u.Invoice = row("INVOICE")
                        u.UnitsPerBox = row("UNITS")
                        If ds.Columns.Contains("L") Then
                            u.Length = IIf(row("L") Is DBNull.Value, "0", row("L"))
                        End If
                        If ds.Columns.Contains("H") Then
                            u.Height = IIf(row("H") Is DBNull.Value, "0", row("H"))
                        End If
                        If ds.Columns.Contains("W") Then
                            u.Width = IIf(row("W") Is DBNull.Value, "0", row("W"))
                        End If
                        ulistPOD.Add(u)
                    Next
                    Return ulistPOD
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventoryDetailsByAWB")
            Return Nothing
        End Try
    End Function


    Public Shared Function LoadPricingDetail(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As Tuple(Of DataSet, String)  'List(Of BO.Inventory)
        Try
            Dim uList As New List(Of BO.Inventory)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataSet()
            Dim IsKometRequired As String = ConfigurationManager.AppSettings("IsKometSales").ToString()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim DbfQry As String = ""
                '22March19 :: Abinaya :: Inventory pricing fix-no scrolling, slow response time
                'DbfQry = "select " + IIf(IsKometRequired.ToLower() = "yes", "KOMETID,", "") + " * from vwLoadPricingDetail  order by CustNum, ProductName, ProductCategory,VARIETY,COLOR,GRADE"
                DbfQry = "[spFXGGetPricing]"
                Using Cmd As New SqlCommand(DbfQry, Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@WhereClause", whereClause)
                    Cmd.Parameters.AddWithValue("@SortExpression", sortExp)
                    'Cmd.Parameters.AddWithValue("@RowIndex", startRowIndex)
                    'Cmd.Parameters.AddWithValue("@NoOfRows", numberOfRows)
                    Dim adp As New SqlDataAdapter(Cmd)

                    'Dim INCcolumn As New DataColumn()
                    'INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    'INCcolumn.ColumnName = "RECNO"
                    'INCcolumn.AutoIncrement = True
                    'INCcolumn.AutoIncrementSeed = 1
                    'INCcolumn.AutoIncrementStep = 1

                    'dt.Columns.Add(INCcolumn)
                    adp.Fill(dt)
                End Using
            End Using
            Dim result As New Tuple(Of DataSet, String)(dt, "success")

            Return result

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadPricingDetail")
            'Dim uList As New List(Of BO.Inventory)
            'Dim u As New BO.Inventory
            'u.ErrorMessage = "Error in LoadPricingDetail:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "LoadPricingDetail")
            'uList.Add(u)
            'Return Nothing
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in LoadPricingDetail")
            Return result
        End Try
    End Function
    Public Shared Function LoadPurchasesByFarmByAWB(ByVal FARMCODE As String) As Tuple(Of DataSet, String)  'List(Of BO.Inventory)
        Try
            Dim uList As New List(Of BO.Inventory)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataSet()
            Dim IsKometRequired As String = ConfigurationManager.AppSettings("IsKometSales").ToString()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim DbfQry As String = ""

                DbfQry = "[SPINVHISTLoadPurchasesbyFarm]"
                Using Cmd As New SqlCommand(DbfQry, Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@FARMCODE", FARMCODE)
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt)
                End Using
            End Using
            Dim result As New Tuple(Of DataSet, String)(dt, "success")

            Return result

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadLotWiseAmount")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in LoadLotWiseAmount")
            Return result
        End Try
    End Function
    'Added by Belal on 26 Nov 2020
    Public Shared Function LoadPurchasesByProduct(ByVal FARMCODE As String, ByVal Product As String, ByVal SortExpr As String) As Tuple(Of DataSet, String)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataSet()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim DbfQry As String = ""
                DbfQry = "[SPINVHISTLoadPurchasesByProduct]"
                Using Cmd As New SqlCommand(DbfQry, Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@Farm", FARMCODE)
                    Cmd.Parameters.AddWithValue("@Product", Product)
                    Cmd.Parameters.AddWithValue("@SortExpr", SortExpr)
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt)
                End Using
            End Using
            Dim result As New Tuple(Of DataSet, String)(dt, "success")
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadPurchasesByProduct")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in LoadPurchasesByProduct")
            Return result
        End Try
    End Function

    Public Shared Function RecalculateInventoryPricing() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("SPReCalculateInventory", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.ExecuteNonQuery()
                End Using
                Con.Close()
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in RecalculateInventoryPricing")
            Return ex.Message
        End Try
    End Function

    Public Shared Function GetSqlQtyFromInventoryAtKomet(ByVal ID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim QTY As Integer = 0

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select QTY  from F_InventoryatKomet where ID='" + ID + "'", con)
                    cmd.CommandType = CommandType.Text
                    QTY = cmd.ExecuteScalar()
                End Using
            End Using
            Return QTY
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSqlQtyFromInventoryAtKomet")
            Throw ex
        End Try
    End Function
    ''' <summary>
    ''' Muthu Nivetha M :: 17Mar2020 :: Modified :: Added 'NaN' validation for Price A,B and C while save/update price items
    ''' </summary>
    Public Shared Function UpdateInventoryPricing(ByVal InvPricingDetails As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim UID As String = "", PriceA As String = "", PriceB As String = "", PriceC As String = "", CustNo As String = "", Hold As String = "", Flag As String = ""
            Dim xmlDoc As New XmlDocument
            xmlDoc.LoadXml(InvPricingDetails)
            Dim xDoc As XDocument = XDocument.Parse(xmlDoc.OuterXml)
            Dim PricingDetails = xDoc.Descendants("PDetail")
            For Each objDetails In PricingDetails
                UID = objDetails.Descendants("ID").First().Value.Split("_")(0).ToString()
                PriceA = objDetails.Descendants("PriceA").First().Value.ToString()
                PriceB = objDetails.Descendants("PriceB").First().Value
                PriceC = objDetails.Descendants("PriceC").First().Value
                CustNo = objDetails.Descendants("CustNo").First().Value
                Hold = objDetails.Descendants("Hold").First().Value
                Flag = objDetails.Descendants("Flag").First().Value
                Hold = IIf(Convert.ToString(Hold).Trim() = "", 0, Hold)
                PriceA = IIf(Convert.ToString(PriceA).Trim() = "" OrElse Convert.ToString(PriceA).Trim() = "NaN", 0, PriceA)
                PriceB = IIf(Convert.ToString(PriceB).Trim() = "" OrElse Convert.ToString(PriceB).Trim() = "NaN", 0, PriceB)
                PriceC = IIf(Convert.ToString(PriceC).Trim() = "" OrElse Convert.ToString(PriceC).Trim() = "NaN", 0, PriceC)
                CustNo = IIf(Convert.ToString(CustNo).Trim() = "", 0, CustNo)

                If Convert.ToString(UID).Trim() <> "" Then
                    Dim u As New BO.Inventory
                    Using Con As New SqlConnection(ConStr)
                        Con.Open()
                        Dim qry As String = ""
                        qry = String.Format("update inven set PRICE=" + PriceA.ToString() + " , PRICEB=" + PriceB.ToString() + ", PRICEC=" + PriceC.ToString() + ", CUST=" + CustNo.ToString() + ", CSHOLD=" + Hold.ToString() + " ,FLAG='" + Flag.ToString() + "' where ID ='" + UID.ToString() + "' ")
                        Using Cmd As New SqlCommand(qry, Con)
                            Cmd.CommandType = CommandType.Text
                            Cmd.ExecuteNonQuery()
                        End Using
                        Con.Close()
                    End Using
                End If
            Next
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateInventoryPricing")
            Return ex.Message
        End Try
    End Function


    ''' <summary>
    ''' MANI::Get Inventory consolidated data for Cooler
    ''' </summary>
    ''' <param name="whereClause"></param>
    ''' <param name="sortExp"></param>
    ''' <param name="startRowIndex"></param>
    ''' <param name="numberOfRows"></param>
    ''' <returns></returns>
    Public Shared Function GetConsolidateCoolerGridlist(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                     ByVal numberOfRows As Integer, ByVal ConsolidateType As String) As List(Of BO.Inventory)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BO.Inventory)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "DateRec desc"
                End If
                Dim dtFinal As New DataTable

                Dim INCcolumn As New DataColumn()
                INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                INCcolumn.ColumnName = "RECNO"
                INCcolumn.AutoIncrement = True
                INCcolumn.AutoIncrementSeed = 1
                INCcolumn.AutoIncrementStep = 1
                Dim TotalCount As Integer = 0
                dtFinal.Columns.Add(INCcolumn)



                Dim Qry As String = ""
                If (ConsolidateType.ToUpper() = "USERS" Or ConsolidateType.ToUpper() = "BOTH") Then
                    Qry = String.Format("SELECT * FROM(SELECT WINV.DATEREC,WINV.CAT,WINV.FLOWER,WINV.NAME,WINV.UOM,CUST,WINV.LOT,WINV.FARM,WINV.COMMENTS,(WINV.CSREC-WINV.CSSOLD) AS CSREC, " +
                                    "CC.BGCOLOR,WINV.WH,CC.COLOR AS FontColor,WINV.USERFileNo AS [USERFileNo],WINV.UNITS,WINV.BOXNUM,WINV.COST,WINV.PRICE,WINV.INVENTYPE,WINV.FLAG " +
                                    "FROM WINVNW WINV INNER JOIN tblCOLORCODE CC ON CC.CODE=WINV.COLORCODE WHERE (WINV.CSREC-WINV.CSSOLD)>0) AS WINVEN " +
                                    IIf(whereClause = "", "", " where " + whereClause) + " order by {0}", sortExp)
                    Using cmd As New SqlCommand(Qry, Con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        dtFinal.Merge(dt)
                    End Using
                End If

                If (ConsolidateType.ToUpper() = "COOLER" Or ConsolidateType.ToUpper() = "BOTH") Then
                    Qry = String.Format("SELECT * FROM(SELECT INV.DATEREC,INV.CAT,INV.FLOWER,INV.NAME,INV.UOM,CUST,INV.LOT,INV.FARM,INV.COMMENTS,(INV.CSREC-INV.CSSOLD) AS CSREC, " +
                                    "CC.BGCOLOR,INV.WH,CC.COLOR AS FontColor,'' AS [USERFileNo],INV.UNITS,INV.BOXNUM,INV.COST,INV.PRICE,INV.INVENTYPE,INV.FLAG " +
                                    "FROM INVEN INV INNER JOIN tblCOLORCODE CC ON CC.CODE=INV.COLORCODE WHERE (INV.CSREC-INV.CSSOLD)>0) AS INVEN " +
                                    IIf(whereClause = "", "", " where " + whereClause) + " order by {0}", sortExp)


                    Using cmd As New SqlCommand(Qry, Con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        dtFinal.Merge(dt)
                    End Using
                End If


                Dim dv As DataView = dtFinal.DefaultView
                dv.Sort = sortExp
                Dim sortedDT As DataTable = dv.ToTable()
                TotalCount = dtFinal.Rows.Count
                Dim PagedDataSet As DataTable = Nothing

                If TotalCount <> 0 Then
                    If startRowIndex = 0 Then
                        PagedDataSet = dtFinal
                    Else
                        If (TotalCount <> startRowIndex) Then
                            PagedDataSet = dtFinal.Select("RECNO >= " + startRowIndex.ToString() + " And RECNO <= " + (startRowIndex + numberOfRows).ToString() + "").CopyToDataTable()
                        Else
                            PagedDataSet = dtFinal.Select("RECNO >= " + startRowIndex.ToString() + " And RECNO <= " + startRowIndex.ToString() + "").CopyToDataTable()
                        End If
                    End If
                End If

                If PagedDataSet Is Nothing Then
                    Return Nothing
                End If

                For Each row In PagedDataSet.Rows
                    Dim u As New BO.Inventory
                    u.RowNo = row("RECNO")
                    u.Farm = row("Farm")
                    u.FlowerDetails.CAT = IIf(row("CAT") Is DBNull.Value, "", row("CAT"))
                    u.FlowerDetails.Flower = row("Flower")
                    u.FlowerDetails.Name = row("Name")
                    u.FlowerDetails.BGColor = row("BGCOLOR")
                    u.FlowerDetails.FontColor = row("FONTCOLOR")
                    u.CSREC = row("CSREC")
                    u.DateRec = row("DATEREC")
                    u.UOM = row("UOM")
                    u.AWB = Convert.ToInt64(row("LOT"))
                    u.CustNum = Convert.ToInt32(row("Cust"))
                    u.Comments = row("Comments")
                    u.USERFileNo = row("USERFileNo")
                    u.WH = row("WH")
                    u.Units = row("UNITS")
                    u.BoxNumber = row("BOXNUM")
                    u.InvenType = row("INVENTYPE")
                    u.Type = row("Flag")
                    u.FBE = 0.00
                    u.Cost = row("COST")
                    u.Price = row("PRICE")
                    u.TotalRows = TotalCount
                    ulist.Add(u)
                Next


                'Dim po As New BO.UserDetails
                'po.RowNo = 0
                'po.Farm = ""
                'po.FlowerDetails.Flower = ""
                'po.FlowerDetails.Name = ""
                'po.FlowerDetails.BGColor = ""
                'po.FlowerDetails.FontColor = ""
                'po.CSREC = 0
                'po.DateRec = Date.Now
                'po.UOM = ""
                'po.Lot = 0
                'po.Cust = 0
                'po.Comments = ""
                'po.FileName = ""
                'po.TotalRows = TotalCount
                'ulist.Add(po)
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserConsolidateGridlist")
            Dim uList As New List(Of BO.Inventory)
            Dim u As New BO.Inventory
            'u.ErrorMessage = "Error in GetUserConsolidateGridlist:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "GetUserConsolidateGridlist")
            'uList.Add(u)
            Return uList
        End Try

    End Function

    Public Shared Function GetConsolidatePurchaseGridlist(ByVal FromDate As String) As DataTable
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BO.Inventory)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spGetConsolidatePurchaseData", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    Return ds.Tables(0)
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserConsolidateGridlist")
            Dim dt = New DataTable
            Return dt
        End Try

    End Function

    Public Shared Function GetInventoryUserHeaderGridlist(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                     ByVal numberOfRows As Integer) As List(Of BO.Inventory)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BO.Inventory)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "DateRec desc"
                End If
                Dim dt As New DataTable
                Dim INCcolumn As New DataColumn()
                INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                INCcolumn.ColumnName = "RECNO"
                INCcolumn.AutoIncrement = True
                INCcolumn.AutoIncrementSeed = 1
                INCcolumn.AutoIncrementStep = 1
                Dim TotalCount As Integer = 0
                dt.Columns.Add(INCcolumn)
                Dim Qry As String = ""




                Qry = String.Format("SELECT * FROM (SELECT DATEREC,LOT,SUM(CSREC) as Qty,UserFileNo FROM " +
                                            "WINVNW GROUP BY DATEREC,LOT,UserFileNo) as a " + IIf(whereClause = "", "", " where " + whereClause) + " order by {0}", sortExp)

                Using cmd As New SqlCommand(Qry, Con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)

                    da.Fill(dt)

                End Using


                TotalCount = dt.Rows.Count
                Dim Qty As Integer = 0
                Dim TotalFBE As Decimal = 0
                If (dt.Rows.Count > 0) Then
                    Qty = dt.Compute("Sum(Qty)", "")
                End If
                Dim PagedDataSet As DataTable = Nothing

                If TotalCount <> 0 And startRowIndex <> 0 Then
                    If (TotalCount <> startRowIndex) Then
                        PagedDataSet = dt.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + (startRowIndex + numberOfRows).ToString() + "").CopyToDataTable()
                    Else
                        PagedDataSet = dt.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + startRowIndex.ToString() + "").CopyToDataTable()
                    End If
                    For Each row In dt.Rows
                        Dim u As New BO.Inventory
                        u.RowNo = row("RECNO")
                        u.DateRec = row("DateREC")
                        u.AWB = Convert.ToInt64(row("Lot"))
                        'u.Farm = row("Farm")
                        u.Qty = row("Qty")
                        u.USERFileNo = row("UserFileNo")
                        'u.FBE = Inventory.InventoryGrid.CalculateFBE(row("Lot"), row("DateREC"), row("FileName"), False, 0)
                        u.FBE = 0.00
                        TotalFBE += u.FBE
                        u.TotalRows = TotalCount
                        ulist.Add(u)
                    Next
                End If

                Dim po As New BO.Inventory
                po.DateRec = DateTime.Now
                po.AWB = 0
                po.Farm = ""
                po.Qty = Qty
                po.USERFileNo = ""
                po.FBE = TotalFBE
                po.TotalRows = TotalCount
                ulist.Add(po)
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventoryUserHeaderGridlist")
            Dim uList As New List(Of BO.Inventory)
            Dim u As New BO.Inventory
            u.ErrorMessage = "Error in GetUserHeaderGridlist:: " + ex.Message
            uList.Add(u)
            Return uList
        End Try

    End Function

    Public Shared Function GetInventoryUserFarmGridlist(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                           ByVal numberOfRows As Integer, ByVal tableName As String) As List(Of BO.Inventory)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BO.Inventory)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "LOT"
                End If

                Dim Qry As String = ""

                Qry = String.Format("SELECT FARM,LOT,DATEREC,SUM(CSREC) as Qty FROM WINVNW where USERFileNo='" + tableName + "'" + IIf(whereClause = "", "", " And " + whereClause) + " GROUP BY FARM,LOT,DATEREC  order by {1}", whereClause, sortExp)



                Using cmd As New SqlCommand(Qry, Con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable

                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1

                    ds.Columns.Add(INCcolumn)
                    da.Fill(ds)
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim TotalQty As Integer = 0
                    Dim TotalFBE As Decimal = 0
                    If (ds.Rows.Count > 0) Then
                        TotalQty = ds.Compute("Sum(Qty)", "")
                    End If

                    Dim PagedDataSet As DataTable = Nothing

                    If TotalCount <> 0 And startRowIndex <> 0 Then
                        'If (TotalCount <> startRowIndex) Then
                        '    PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + (startRowIndex + numberOfRows).ToString() + "").CopyToDataTable()
                        'Else
                        '    PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " AND RECNO <= " + startRowIndex.ToString() + "").CopyToDataTable()
                        'End If


                        For Each row In ds.Rows
                            Dim u As New BO.Inventory
                            u.RowNo = row("RECNO")
                            u.Farm = row("Farm")
                            u.AWB = Convert.ToInt64(row("LOT"))
                            u.DateRec = row("DATEREC")
                            'u.FBE = Inventory.InventoryGrid.CalculateFBE(row("LOT"), row("FARM"), row("DATEREC"), tableName, False, 0)
                            TotalFBE += u.FBE
                            u.Qty = row("Qty")
                            u.USERFileNo = tableName
                            u.TotalRows = TotalCount
                            ulist.Add(u)
                        Next
                    End If

                    Dim po As New BO.Inventory()
                    po.Farm = ""
                    po.AWB = 0
                    po.DateRec = DateTime.Now
                    po.Qty = TotalQty
                    po.FBE = TotalFBE
                    po.TotalRows = TotalCount
                    ulist.Add(po)


                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserFarmDetailsGridlist")
            Dim uList As New List(Of BO.Inventory)
            Dim u As New BO.Inventory
            u.ErrorMessage = "Error in GetUserFarmDetailsGridlist:: " + ex.Message
            uList.Add(u)
            Return uList
        End Try
    End Function

    ''' <summary>
    ''' MANI::16-JAN-2018::For Get User Details on Selected Header
    ''' </summary>
    ''' <param name="whereClause"></param>
    ''' <param name="sortExp"></param>
    ''' <param name="startRowIndex"></param>
    ''' <param name="numberOfRows"></param>
    ''' <param name="tableName"></param>
    ''' <returns></returns>
    Public Shared Function GetUserDetailsGridlist(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                     ByVal numberOfRows As Integer, ByVal tableName As String) As List(Of BO.Inventory)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BO.Inventory)
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "LOT"
                End If

                Dim Qry As String = ""


                Qry = String.Format("SELECT WIN.*,(WIN.CSREC*WIN.UNITS) AS TOTALUNITS,((WIN.CSREC*WIN.UNITS)*WIN.COST) AS TOTALCOST," +
                                        "CC.BGCOLOR,CC.COLOR AS FONTCOLOR FROM WINVNW WIN INNER JOIN tblcolorcode CC ON CC.CODE=WIN.COLORCODE " +
                                        "where USERFileNo='" + tableName + "'" + IIf(whereClause = "", "", " And " + whereClause) + " order by {1}", whereClause, sortExp)



                Using cmd As New SqlCommand(Qry, Con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable

                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1

                    ds.Columns.Add(INCcolumn)
                    da.Fill(ds)
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim TotalUnits As Integer = 0
                    Dim TotalBoxes As Integer = 0
                    Dim TotalCost As Decimal = 0
                    Dim TotalFBE As Decimal = 0
                    If (ds.Rows.Count > 0) Then
                        TotalUnits = ds.Compute("Sum(TOTALUNITS)", "")
                        TotalBoxes = ds.Compute("Sum(CSREC)", "")
                        TotalCost = ds.Compute("Sum(TOTALCOST)", "")
                    End If

                    Dim PagedDataSet As DataTable = Nothing
                    Dim UNITSBUNCH As Boolean = ds.Columns.Contains("UNITSBUNCH")
                    If TotalCount <> 0 And startRowIndex <> 0 Then
                        For Each row In ds.Rows
                            Dim u As New BO.Inventory
                            u.RowNo = row("RECNO")
                            u.Farm = row("Farm")
                            u.Flower = row("Flower")
                            u.Name = row("Name")
                            u.FlowerDetails.BGColor = row("BGCOLOR")
                            u.FlowerDetails.FontColor = row("FONTCOLOR")
                            u.CSREC = row("CSREC")
                            u.UOM = row("UOM")
                            'u.FBE = DAO.Inventory.InventoryGrid.CalculateFBE(row("Lot"), row("Farm"), row("Boxnum"), row("DateRec"), tableName, False, 0)
                            'u.FBE = DAO.Inventory.InventoryGrid.CalculateFBE(Convert.ToString(row("UOM")).ToLower()) * Convert.ToInt32(row("CSREC"))
                            TotalFBE += u.FBE
                            If UNITSBUNCH Then
                                u.UnitsBunch = row("UNITSBUNCH")
                            Else
                                u.UnitsBunch = ""
                            End If
                            u.Units = row("Units")
                            u.TotalUnits = row("TotalUnits")
                            u.Cost = row("Cost")
                            u.TotalCost = row("TotalCost")
                            u.InvenType = row("InvenType")
                            u.CustNum = Convert.ToInt32(row("Cust"))
                            u.Comments = row("Comments")
                            u.BoxNumber = row("BoxNum")
                            u.PO = row("PO")
                            u.Invoice = row("Invoice")
                            u.AWB = Convert.ToInt64(row("Lot"))
                            u.DateRec = row("DateRec")
                            u.TotalRows = TotalCount
                            ulist.Add(u)
                        Next
                    End If

                    Dim po As New BO.Inventory()
                    po.Farm = ""
                    po.FlowerDetails.Flower = ""
                    po.FlowerDetails.Name = ""
                    po.Name = ""
                    po.Flower = ""
                    po.FlowerDetails.BGColor = ""
                    po.FlowerDetails.FontColor = ""
                    po.CSREC = TotalBoxes
                    po.UOM = ""
                    po.FBE = TotalFBE
                    po.UnitsBunch = ""
                    po.Units = 0
                    po.TotalUnits = TotalUnits
                    po.Cost = 0
                    po.TotalCost = TotalCost
                    po.InvenType = ""
                    po.CustNum = 0
                    po.Comments = ""
                    po.BoxNumber = 0
                    po.PO = ""
                    po.Invoice = 0
                    po.AWB = 0
                    po.DateRec = DateTime.Now.ToString()
                    po.TotalRows = TotalCount
                    ulist.Add(po)


                End Using
            End Using
            Return ulist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserDetailsGridlist")
            Dim uList As New List(Of BO.Inventory)
            Dim u As New BO.Inventory
            u.ErrorMessage = "Error in GetUserDetailsGridlist::  ::" + ex.Message
            uList.Add(u)
            Return uList
        End Try

    End Function

    ''' <summary>
    ''' MANI::17-JAN-2018::to delete the inventory User Details
    ''' </summary>
    ''' <param name="AWB"></param>
    ''' <param name="TableName"></param>
    ''' <param name="Farm"></param>
    ''' <param name="BoxNumber"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeleteInventoryUserDetails(ByVal TableName As String, ByVal Farm As String, ByVal BoxNumber As Integer, ByVal AWB As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.Inventory
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("delete from WINVNW where UserFileNo='" + TableName + "' And Farm=@farm and BoxNum=@boxnumber and Lot={0}", AWB), Con)
                    Cmd.CommandType = CommandType.Text
                    Cmd.Parameters.AddWithValue("@farm", Farm)
                    Cmd.Parameters.AddWithValue("@boxnumber", BoxNumber)
                    'Cmd.Parameters.AddWithValue("@Awb", Convert.ToInt64(AWB))
                    Cmd.ExecuteNonQuery()
                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteInventoryUserDetails")
            Return "Error"
        End Try
    End Function

    ''' <summary>
    ''' STA::28-OCT-2015::to get the Inventory User details for Edit
    ''' </summary>
    ''' <param name="Lot"></param>
    ''' <param name="Farm"></param>
    ''' <param name="Flower"></param>
    ''' <param name="BoxNumber"></param>
    ''' <param name="tableName"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetUserDetailsForEdit(ByVal Lot As String, ByVal Farm As String, ByVal Flower As String,
                                         ByVal BoxNumber As Integer, ByVal tableName As String) As BO.Inventory
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.Inventory
            Using Con As New SqlConnection(ConStr)
                Con.Open()


                Dim Qry As String = String.Format("SELECT WIN.*,(WIN.CSREC*WIN.UNITS) AS TOTALUNITS,((WIN.CSREC*WIN.UNITS)*WIN.COST) AS TOTALCOST," +
                                    "CC.BGCOLOR,CC.COLOR As FONTCOLOR,flr.ColorCode as 'cccode',flr.CAT as 'FLCAT' FROM WINVNW WIN" +
                                    " inner join F_flower as flr on flr.Flower=WIN.Flower" +
                                    " inner join tblColorCode cc on cc.code=flr.colorcode" +
                                    " where Lot={0} and Farm='{1}' and WIN.Flower='{2}' and BoxNum={3} And WIN.UserFileNo='" + tableName + "'", Convert.ToInt64(Lot), Farm, Flower, BoxNumber, tableName)


                Using cmd As New SqlCommand(Qry, Con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)


                    For Each row In ds.Rows
                        u.Farm = row("Farm")
                        u.FlowerDetails.Flower = row("Flower")
                        u.FlowerDetails.CAT = row("FLCAT")
                        u.FlowerDetails.Name = row("Name")
                        u.FlowerDetails.BGColor = row("BGCOLOR")
                        u.FlowerDetails.FontColor = row("FONTCOLOR")
                        u.FlowerDetails.ColorCode = row("cccode")
                        u.CSREC = row("CSREC")
                        u.CSSOLD = row("CSSOLD")
                        u.UOM = row("UOM")
                        u.UnitsBunch = row("UNITSBUNCH")
                        u.Units = row("Units")
                        u.TotalUnits = row("TotalUnits")
                        u.Cost = row("Cost")
                        u.TotalCost = row("TotalCost")
                        u.InvenType = row("InvenType")
                        u.CustNum = Convert.ToInt32(row("Cust"))
                        u.Comments = row("Comments")
                        u.BoxNumber = row("BoxNum")
                        u.PO = row("PO")
                        u.Invoice = row("Invoice")
                        u.AWB = Convert.ToInt64(row("Lot"))
                        u.DateRec = row("DateRec")
                        u.OrderNumber = row("Invoice")
                    Next

                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserDetailsForEdit")
            Dim u As New BO.Inventory
            u.ErrorMessage = "Error in GetUserDetailsForEdit::" + ex.Message
            Return u
        End Try
    End Function

    Public Shared Function UpdateInventoryUserDetails(ByVal AWB As String, ByVal TableName As String, ByVal Flower As String, ByVal FlowerName As String, ByVal FlowerCategory As String,
                                                  ByVal QtyRec As Integer, ByVal QtySold As Integer, ByVal UOM As String, ByVal UnitsPerBunch As Integer, ByVal Units As Integer, ByVal Cost As Decimal,
                                                  ByVal InvenType As String, ByVal BoxNum As Integer, ByVal OrderNumber As Integer, ByVal PO As String,
                                                  ByVal Invoice As Integer, ByVal Cust As Integer, ByVal Comments As String, ByVal Farm As String, ByVal ColorCode As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.Inventory
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim qry As String = ""

                qry = String.Format("update WINVNW set FLOWER=@Flower,Name=@Name,CSREC=@QtyRec,CSSOLD=@QtySold,UOM=@uom,UNITSBUNCH=@unitsbunch," +
                                                      "UNITS=@units,COST=@cost,INVENTYPE=@inventype,PO=@PO,INVOICE=@Invoice,CUST=@Cust,COMMENTS=@comments,COLORCODE=@ColorCode " +
                                                      "where UserFileNo='" + TableName + "' And Farm=@Farm and BoxNum=@boxnum and Lot={0}", AWB)
                Using Cmd As New SqlCommand(qry, Con)
                    Cmd.CommandType = CommandType.Text
                    Cmd.Parameters.AddWithValue("@Flower", Flower)
                    Cmd.Parameters.AddWithValue("@Name", FlowerName)
                    ' Cmd.Parameters.AddWithValue("@Cat", FlowerCategory)
                    Cmd.Parameters.AddWithValue("@QtyRec", QtyRec)
                    Cmd.Parameters.AddWithValue("@QtySold", QtySold)
                    Cmd.Parameters.AddWithValue("@uom", UOM)
                    Cmd.Parameters.AddWithValue("@unitsbunch", UnitsPerBunch)
                    Cmd.Parameters.AddWithValue("@units", Units)
                    Cmd.Parameters.AddWithValue("@cost", Cost)
                    Cmd.Parameters.AddWithValue("@inventype", InvenType)
                    Cmd.Parameters.AddWithValue("@boxnum", BoxNum)
                    Cmd.Parameters.AddWithValue("@ColorCode", Convert.ToInt32(ColorCode))
                    Cmd.Parameters.AddWithValue("@PO", PO)
                    Cmd.Parameters.AddWithValue("@Invoice", Invoice)
                    Cmd.Parameters.AddWithValue("@Cust", Cust)
                    Cmd.Parameters.AddWithValue("@comments", Comments)
                    Cmd.Parameters.AddWithValue("@Farm", Farm)
                    ''Cmd.Parameters.AddWithValue("@lot", Convert.ToInt64(AWB))
                    Cmd.ExecuteNonQuery()

                    Return "success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateInventoryUserDetails")
            Return "error"
        End Try
    End Function

    ''' <summary>
    '''  ANITHA ::27-FEB-2018::load type to the list
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function GetTypeForInventory() As List(Of BO.Type)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.Type)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("select * from tblTYPE"), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.Type
                        u.ID = row("Id")
                        u.Code = row("Code")
                        u.Name = row("Name")
                        uList.Add(u)
                    Next
                    Return uList
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetTypeForInventory")
            Return Nothing
            'Dim u As New BO.Inventory
            'u.ErrorMessage = "Error in GetInventoryById:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "GetInventoryById")
            'Return u
        End Try
    End Function

    ''' <summary>
    '''  ANITHA ::27-FEB-2018::load Inventype to the list
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function GetInvenTypeForInventory() As List(Of BO.InvenType)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.InvenType)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("select * from tblINVENTYPE"), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.InvenType
                        u.ID = row("Id")
                        u.Code = row("Code")
                        u.Name = row("Name")
                        uList.Add(u)
                    Next
                    Return uList
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvenTypeForInventory")
            Return Nothing
            'Dim u As New BO.Inventory
            'u.ErrorMessage = "Error in GetInventoryById:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "GetInventoryById")
            'Return u
        End Try
    End Function

    ''' <summary>
    ''' MANI::03-21-2018::Inventory details to display when creating a order
    ''' Muthu Nivetha M :: Modified :: Added RowwiseAvailQty column to display tot box qty on grid and merged columns LastPrice and LastPurchaseDate from live database (dflower.net-Emotiongrower_2019)
    ''' </summary>
    ''' <param name="whereClause"></param>
    ''' <returns></returns> 
    Public Shared Function GetInventoryForAddingOrderDetailFgrd(ByVal whereClause As String, ByVal sortExp As String,
                                                                ByVal startRowIndex As Integer,
                                                                ByVal numberOfRows As Integer,
                                                                ByVal Customer As String) As Tuple(Of DataSet, String)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            'Dim invenlist As New List(Of BO.Inventory)
            Dim dtinvenlist As New DataSet()

            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim LoginUserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                Using cmd As New SqlCommand("spInvenGetInventoryforSalesScreen", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@whereclause", whereClause))
                    cmd.Parameters.Add(New SqlParameter("@customer", Customer))
                    cmd.Parameters.Add(New SqlParameter("@loginuserid", LoginUserDetails.ID))
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(dtinvenlist)
                    If dtinvenlist.Tables(0).Rows.Count > 0 Then
                        Dim getresult As String = ""
                        getresult = If(dtinvenlist.Tables(0).Rows(0)(0) Is DBNull.Value, "No Active WH".ToLower(), dtinvenlist.Tables(0).Rows(0)(0).ToString().ToLower())
                        If (getresult = "No Active WH".ToLower()) Then
                            Dim result1 As New Tuple(Of DataSet, String)(dtinvenlist, getresult)
                            Return result1
                        End If
                        Dim R As DataRow = dtinvenlist.Tables(0).NewRow
                        For j As Integer = 0 To dtinvenlist.Tables(0).Columns.Count - 1
                            Dim getdatatype = dtinvenlist.Tables(0).Columns(j).DataType.ToString().ToLower()
                            If getdatatype = "system.int32".ToLower() Then
                                R(j) = Convert.ToInt32(0)
                            ElseIf getdatatype = "system.string".ToLower() Then
                                R(j) = ""
                            ElseIf getdatatype = "system.decimal".ToLower() Then
                                R(j) = Convert.ToDecimal(0.00)
                            ElseIf getdatatype = "system.datetime".ToLower() Then
                                R(j) = DateTime.Now
                            ElseIf getdatatype = "system.Boolean".ToLower() Then
                                R(j) = False
                            End If

                            If (dtinvenlist.Tables(0).Columns(j)).ColumnName = "RECNO" Then
                                R(j) = "0"
                            End If
                            If (dtinvenlist.Tables(0).Columns(j)).ColumnName = "ID" Then
                                R(j) = "0"
                            End If
                        Next
                        dtinvenlist.Tables(0).Rows.Add(R)
                    End If
                End Using
            End Using
            Dim result As New Tuple(Of DataSet, String)(dtinvenlist, "success")
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetInventoryForAddingOrderDetailFgrd")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error In GetInventoryForAddingOrderDetailFgrd")
            Return result
        End Try
    End Function

    Public Shared Function GetInventoryForAddingOrderDetailFgrd_AllocationOrder(ByVal Customer As String,
                                                                ByVal flower As String) As Tuple(Of DataSet, String)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            'Dim invenlist As New List(Of BO.Inventory)
            Dim dtinvenlist As New DataSet()

            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim LoginUserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                Using cmd As New SqlCommand("spInvenGetInventoryByCatVariety", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Customer", Customer))
                    cmd.Parameters.Add(New SqlParameter("@flower", flower))
                    cmd.Parameters.Add(New SqlParameter("@loginuserid", LoginUserDetails.ID))
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(dtinvenlist)
                    If dtinvenlist.Tables(0).Rows.Count > 0 Then
                        Dim getresult As String = ""
                        getresult = If(dtinvenlist.Tables(0).Rows(0)(0) Is DBNull.Value, "No Active WH".ToLower(), dtinvenlist.Tables(0).Rows(0)(0).ToString().ToLower())
                        If (getresult = "No Active WH".ToLower()) Then
                            Dim result1 As New Tuple(Of DataSet, String)(dtinvenlist, getresult)
                            Return result1
                        End If
                        Dim R As DataRow = dtinvenlist.Tables(0).NewRow
                        For j As Integer = 0 To dtinvenlist.Tables(0).Columns.Count - 1
                            Dim getdatatype = dtinvenlist.Tables(0).Columns(j).DataType.ToString().ToLower()
                            If getdatatype = "system.int32".ToLower() Then
                                R(j) = Convert.ToInt32(0)
                            ElseIf getdatatype = "system.string".ToLower() Then
                                R(j) = ""
                            ElseIf getdatatype = "system.decimal".ToLower() Then
                                R(j) = Convert.ToDecimal(0.00)
                            ElseIf getdatatype = "system.datetime".ToLower() Then
                                R(j) = DateTime.Now
                            ElseIf getdatatype = "system.Boolean".ToLower() Then
                                R(j) = False
                            End If

                            If (dtinvenlist.Tables(0).Columns(j)).ColumnName = "RECNO" Then
                                R(j) = "0"
                            End If
                            If (dtinvenlist.Tables(0).Columns(j)).ColumnName = "ID" Then
                                R(j) = "0"
                            End If
                        Next
                        dtinvenlist.Tables(0).Rows.Add(R)
                    End If
                End Using
            End Using
            Dim result As New Tuple(Of DataSet, String)(dtinvenlist, "success")
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetInventoryForAddingOrderDetailFgrd")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error In GetInventoryForAddingOrderDetailFgrd")
            Return result
        End Try
    End Function

    Public Shared Function UpdateQuantityToInventory(ByVal Order As String, ByVal ORDER2SQLID As Integer, ByVal INVENSQLID As Integer, ByVal QTYTOALLOCATE As Integer, ByVal USERNAME As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spAllocateaFutureOrderRow", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@ORDER", Order))
                    cmd.Parameters.Add(New SqlParameter("@ORDER2SQLID", ORDER2SQLID))
                    cmd.Parameters.Add(New SqlParameter("@INVENSQLID", INVENSQLID))
                    cmd.Parameters.Add(New SqlParameter("@QTYTOALLOCATE", QTYTOALLOCATE))
                    cmd.Parameters.Add(New SqlParameter("@USERNAME", USERNAME))
                    cmd.ExecuteNonQuery()

                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateQuantityToInventory")
            Return "error"
        End Try
    End Function

    Public Shared Function round5(x As Double) As Double
        Return (Math.Ceiling(x / 0.005) * 0.005)
    End Function

    Public Shared Function InsertInventoryLock(ByVal InventoryId As String) As String
        Try
            Dim UserId As Integer = 0
            Dim Username As String = ""

            Dim User As New User
            If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                User = System.Web.HttpContext.Current.Session("LoginUserDetails")
            Else
                Return "Logout"
            End If
            UserId = User.ID
            Username = User.UserName
            Dim IsExist As String = ""
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SpInsertInventoryLock", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@InventoryId", InventoryId)
                    cmd.Parameters.AddWithValue("@Username", Username)
                    cmd.Parameters.AddWithValue("@UserID", UserId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    IsExist = Convert.ToString(dt(0)(0)).Trim()
                End Using
            End Using
            Return IsExist
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In InsertInventoryLock")
            Return "Error"
        End Try
    End Function

    Public Shared Function DeleteInventoryLock(ByVal InventoryId As String) As String
        Try
            Dim rows As String = ""

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SpDeleteInventoryLock", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@InventoryId", InventoryId)
                    ' cmd.Parameters.AddWithValue("@UserId", UserId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    rows = Convert.ToString(dt(0)(0)).Trim()
                End Using
            End Using
            Return rows
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In DeleteInventoryLock")
            Return "Error"
        End Try
    End Function

    ''' <summary>
    ''' Get top first Daterec value for the corresponding AWB#. :: Created by Abinaya :: 10Jul2018
    ''' </summary>
    ''' <param name="AWB"></param>
    ''' <returns></returns>
    Public Shared Function GetDateRecDetailsByAWB(ByVal AWB As Int64) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim RecDate As String = ""
            Dim invenDate As String = ""
            Dim invhistDate As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Select top 1 Daterec from inven where Lot=@AWB", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@AWB", AWB)
                    invenDate = cmd.ExecuteScalar()
                    RecDate = invenDate
                End Using

                If (invenDate = "") Then
                    Using cmd As New SqlCommand("Select top 1 Daterec from invhist where Lot=@AWB", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@AWB", AWB)
                        invhistDate = cmd.ExecuteScalar()
                        RecDate = invhistDate
                    End Using
                End If
            End Using

            If (RecDate = "") Then
                Return "Not Exist"
            Else
                Return RecDate
            End If

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetDateRecDetailsByAWB")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Update new AWB details on its corresponding tables :: Created by Abinaya :: 10Jul2018
    ''' </summary>
    ''' <param name="OldAWB"></param>
    ''' <param name="OldWarehouse"></param>
    ''' <param name="OldFarm"></param>
    ''' <param name="OldProduct"></param>
    ''' <param name="OldBoxnum"></param>
    ''' <param name="NewAWB"></param>
    ''' <param name="NewWarehouse"></param>
    ''' <param name="NewFarm"></param>
    ''' <param name="NewRecDate"></param>
    ''' <param name="NewCost"></param>
    ''' <returns></returns>
    Public Shared Function UpdateNewAWBDetails(OldAWB As Int64, OldWarehouse As String, OldFarm As String, OldProduct As String,
                                               OldBoxnum As Int32, NewAWB As Int64, NewWarehouse As String, NewFarm As String, NewRecDate As String,
                                               NewCost As Decimal) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.Inventory
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim qry As String = ""
                Dim whereClause As String = ""
                Dim updatedTables As String() = {"INVHIST", "VET_", "F_ORDER2", "INVEN", "F_CREREQ", "CRE_", "TBLPODETAILS", "TBLPOHEADER"}
                Dim updatedColumns As String = ""
                Dim actualLoopCount As Integer = 0

                For loopCount = 1 To updatedTables.Length
                    actualLoopCount = loopCount - 1
                    'Construct where condition depends upon the input values and tables
                    If updatedTables(actualLoopCount) = "INVHIST" Or updatedTables(actualLoopCount) = "INVEN" Then
                        whereClause = " LOT=@OldAWB "
                    Else
                        whereClause = " AWB=@OldAWB"
                    End If

                    If OldWarehouse <> "" And updatedTables(actualLoopCount) <> "F_CREREQ" And updatedTables(actualLoopCount) <> "CRE_" Then
                        whereClause += " And WH=@OldWarehouse"
                    End If

                    If OldFarm <> "" Then
                        If updatedTables(actualLoopCount) = "F_ORDER2" Then
                            whereClause += " And FARMCODE =@OldFarm"
                        Else
                            whereClause += " And FARM=@OldFarm"
                        End If
                    End If

                    If OldProduct <> "" And updatedTables(actualLoopCount) <> "TBLPODETAILS" And updatedTables(actualLoopCount) <> "TBLPOHEADER" Then
                        whereClause += " And FLOWER=@OldProduct"
                    End If

                    If OldBoxnum <> 0 And updatedTables(actualLoopCount) <> "F_CREREQ" And updatedTables(actualLoopCount) <> "CRE_" And updatedTables(actualLoopCount) <> "tblPODetails" And updatedTables(actualLoopCount) <> "tblPOHeader" Then
                        whereClause += " And BOXNUM=@OldBoxnum"
                    End If

                    'construct columns to update on the following tables
                    If updatedTables(actualLoopCount) = "INVHIST" Then
                        updatedColumns = "LOT=Case When LOT=@NewAWB Or @NewAWB=0 Then LOT Else @NewAWB End, WH =case when WH=@NewWarehouse or @NewWarehouse='' then WH else @NewWarehouse end,FARM=case when FARM=@NewFarm or @NewFarm='' then FARM else @NewFarm end,DATEREC=case when DATEREC=@NewRecDate or @NewRecDate='' then DATEREC else @NewRecDate end,COST= case when COST=@NewCost or @NewCost=0.00 then COST else @NewCost end"
                    End If

                    If updatedTables(actualLoopCount) = "VET_" Then
                        updatedColumns = "AWB=Case When AWB=@NewAWB Or @NewAWB=0 Then AWB Else @NewAWB End, WH=case when WH=@NewWarehouse or @NewWarehouse='' then WH else @NewWarehouse end,FARM=case when FARM=@NewFarm or @NewFarm='' then FARM else @NewFarm end,DATEREC=case when DATEREC=@NewRecDate or @NewRecDate='' then DATEREC else @NewRecDate end,COST= case when COST=@NewCost or @NewCost=0.00 then COST else @NewCost end"
                    End If

                    If updatedTables(actualLoopCount) = "F_ORDER2" Then
                        updatedColumns = "AWB=Case When AWB=@NewAWB Or @NewAWB=0 Then AWB Else @NewAWB End, WH=case when WH=@NewWarehouse or @NewWarehouse='' then WH else @NewWarehouse end,FARMCODE=case when FARMCODE=@NewFarm or @NewFarm='' then FARMCODE else @NewFarm end,DATEREC=case when DATEREC=@NewRecDate or @NewRecDate='' then DATEREC else @NewRecDate end,COST= case when COST=@NewCost or @NewCost=0.00 then COST else @NewCost end"
                    End If

                    If updatedTables(actualLoopCount) = "INVEN" Then
                        updatedColumns = "LOT=Case When LOT=@NewAWB Or @NewAWB=0 Then LOT Else @NewAWB End, WH=case when WH=@NewWarehouse or @NewWarehouse='' then WH else @NewWarehouse end,FARM=case when FARM=@NewFarm or @NewFarm='' then FARM else @NewFarm end,DATEREC=case when DATEREC=@NewRecDate or @NewRecDate='' then DATEREC else @NewRecDate end,COST= case when COST=@NewCost or @NewCost=0.00 then COST else @NewCost end"
                    End If

                    If updatedTables(actualLoopCount) = "F_CREREQ" Then
                        updatedColumns = "AWB=Case When AWB=@NewAWB Or @NewAWB=0 Then AWB Else @NewAWB End,FARM=case when FARM=@NewFarm or @NewFarm='' then FARM else @NewFarm end,DATEREC=case when DATEREC=@NewRecDate or @NewRecDate='' then DATEREC else @NewRecDate end,COST= case when COST=@NewCost or @NewCost=0.00 then COST else @NewCost end"
                    End If

                    If updatedTables(actualLoopCount) = "CRE_" Then
                        updatedColumns = "AWB=Case When AWB=@NewAWB Or @NewAWB=0 Then AWB Else @NewAWB End,FARM=case when FARM=@NewFarm or @NewFarm='' then FARM else @NewFarm end,DATEREC=case when DATEREC=@NewRecDate or @NewRecDate='' then DATEREC else @NewRecDate end"
                    End If

                    If updatedTables(actualLoopCount) = "TBLPODETAILS" Then
                        updatedColumns = "AWB=Case When AWB=@NewAWB Or @NewAWB=0 Then AWB Else @NewAWB End,FARM=case when FARM=@NewFarm or @NewFarm='' then FARM else @NewFarm end"
                    End If

                    If updatedTables(actualLoopCount) = "TBLPOHEADER" Then
                        updatedColumns = "AWB=Case When AWB=@NewAWB Or @NewAWB=0 Then AWB Else @NewAWB End,FARM=case when FARM=@NewFarm or @NewFarm='' then FARM else @NewFarm end"
                    End If

                    'Update query constructed dynamically
                    qry = String.Format("UPDATE " + updatedTables(actualLoopCount) + " Set " + updatedColumns + " WHERE " + whereClause)
                    Using Cmd As New SqlCommand(qry, Con)
                        Cmd.CommandType = CommandType.Text
                        Cmd.Parameters.AddWithValue("@NewAWB", NewAWB)
                        Cmd.Parameters.AddWithValue("@NewWarehouse", NewWarehouse)
                        Cmd.Parameters.AddWithValue("@NewFarm", NewFarm)
                        Cmd.Parameters.AddWithValue("@NewRecDate", NewRecDate)
                        Cmd.Parameters.AddWithValue("@NewCost", NewCost)

                        Cmd.Parameters.AddWithValue("@OldAWB", OldAWB)
                        Cmd.Parameters.AddWithValue("@OldWarehouse", OldWarehouse)
                        Cmd.Parameters.AddWithValue("@OldFarm", OldFarm)
                        Cmd.Parameters.AddWithValue("@OldProduct", OldProduct)
                        Cmd.Parameters.AddWithValue("OldBoxnum", OldBoxnum)
                        Cmd.ExecuteNonQuery()
                    End Using
                Next
                Return "success"

            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateInventoryUserDetails")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 17-JUL-2018 :: [1790] :: Fwd: [Request received] ESPRIT:: Inventory - Print inventory label by farm and boxnumber :: get inventory based on the farm and boxnum
    ''' </summary>
    ''' <param name="FARM"></param>
    ''' <param name="BOXNUM"></param>
    ''' <returns></returns>
    Public Shared Function GetInventorybyFarmAndBOXNUM(ByVal FARM As String, ByVal BOXNUM As String) As BO.Inventory

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim inven As New BO.Inventory
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetInventorybyFarmAndBOXNUM", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("FARM", FARM)
                    Cmd.Parameters.AddWithValue("BOXNUM", BOXNUM)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        inven.AWB = row("LOT")
                        inven.Farm = row("FARM")
                        inven.ProductCode = row("FLOWER")
                        inven.DateRec = row("DATEREC")
                        inven.BoxNumber = row("BOXNUM")
                        inven.TableName = row("TableName")
                        inven.ReceivedPiecesOnly = row("ReceivedPiecesOnly")
                    Next
                    Return inven
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventorybyFarmAndBOXNUM")
            Return Nothing
        End Try

    End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="whereClause"></param>
    ''' <returns></returns>
    Public Shared Function GetViewInventoryTransactionsGrid(ByVal whereClause As String) As List(Of BO.InventoryTrans)
        Try

            Dim UserFeatures As List(Of Feature) = HttpContext.Current.Session("LoginUserFeatures")
            Dim CSRECCalculation As Boolean = False
            Try
                For Each i In UserFeatures
                    If i.Name.ToUpper = "CSREC Box Calculation" And i.Value = True Then
                        CSRECCalculation = True
                    End If
                Next
            Catch ex As Exception
                CSRECCalculation = False
            End Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistinven As New List(Of BO.InventoryTrans)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim sortExp As String = ""
                If sortExp = "" Or sortExp = Nothing Then
                    sortExp = "SQLID DESC"
                End If

                If whereClause = Nothing Then
                    whereClause = "CSREC > 0"
                Else
                    whereClause = whereClause + " and CSREC > 0"
                End If

                Dim Qry As String = ""
                'If (whereClause = Nothing) Then
                '    Qry = String.Format("select top 200 inv.*,cc.Color As FontColor,cc.Bgcolor " +
                '        " From INVTRANS inv inner join tblColorCode cc on cc.Code=inv.ColorCode where inv.id<>'' order by {1}", sortExp)
                'Else
                '    Qry = String.Format("select top 200 inv.*,cc.Color As FontColor,cc.Bgcolor " +
                '        " from INVTRANS inv inner join tblColorCode cc on cc.Code=inv.ColorCode where inv.id<>'' and {0} order by {1}", whereClause, sortExp)
                'End If


                Using cmd As New SqlCommand("spGetViewInventoryTransforGrid", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@WhereClause", whereClause)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable

                    Dim INCcolumn As New DataColumn()
                    INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                    INCcolumn.ColumnName = "RECNO"
                    INCcolumn.AutoIncrement = True
                    INCcolumn.AutoIncrementSeed = 1
                    INCcolumn.AutoIncrementStep = 1

                    ds.Columns.Add(INCcolumn)
                    da.Fill(ds)
                    Dim TotalCount As Integer = ds.Rows.Count
                    Dim TotalBoxes As Integer = 0
                    Dim TotalBoxCount As Integer = 0
                    If (ds.Rows.Count > 0) Then
                        TotalBoxes = ds.Compute("Sum(CSREC)", "")
                    End If

                    If TotalCount <> 0 Then
                        For Each row In ds.Rows
                            Dim u As New BO.InventoryTrans
                            If (row("Id") = "") Then
                                u.ID = "0"
                            Else
                                ''u.ID = Convert.ToInt32(row("Id"))
                                u.ID = row("Id")
                            End If
                            u.SqlID = Convert.ToInt32(row("SQLId"))
                            u.RowNo = row("RECNO")
                            u.TransType = row("TransType")
                            u.DateRec = Convert.ToDateTime(Convert.ToString(row("DateRec")), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy") 'row("DateRec")
                            u.AWB = row("LOT")
                            u.Farm = row("Farm")
                            u.ProductCode = row("Flower")
                            u.ProductName = row("Name")
                            u.CSREC = Convert.ToInt32(row("CSREC"))
                            TotalBoxCount += u.CSREC
                            u.UOM = row("UOM")
                            u.BoxNumber = Convert.ToInt32(row("Boxnum"))
                            u.CustNum = Convert.ToInt32(row("cust"))
                            u.Invoice = Convert.ToInt32(row("Invoice"))
                            u.PO = row("po")
                            u.FlowerDetails.FontColor = row("FontColor")
                            u.FlowerDetails.BGColor = row("BgColor")
                            u.UnitsBunch = row("UNITSBUNCH")
                            u.Cost = Convert.ToDecimal(row("COST"))
                            u.InvenType = row("INVENTYPE")
                            u.Units = Convert.ToInt32(row("UNITS"))
                            u.Comments = Convert.ToString(row("Comments"))
                            u.WH = Convert.ToString(row("wh"))
                            u.Flag = Convert.ToString(row("Flag"))
                            u.TotalRows = TotalCount

                            If Convert.ToString(row("ADDDATE")) <> "" Then
                                u.AddDate = Convert.ToDateTime(Convert.ToString(row("ADDDATE")), New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy hh:mm tt") 'Convert.ToString(row("ADDDATE"))
                            Else
                                u.AddDate = "01/01/1900"
                            End If
                            u.AddUser = Convert.ToString(row("ADDUSER"))
                            u.CSSOLD = Convert.ToInt32(row("CSSOLD"))
                            ulistinven.Add(u)
                        Next
                    End If

                    Dim inven As New BO.InventoryTrans()
                    inven.RowNo = 0
                    inven.DateRec = DateTime.Now.ToString()
                    inven.TransType = ""
                    inven.AWB = "0"
                    inven.Farm = "0"
                    inven.ProductCode = "0"
                    inven.ProductName = ""
                    If TotalBoxes = TotalBoxCount Then
                        inven.CSREC = TotalBoxes
                    Else
                        inven.CSREC = TotalBoxCount
                    End If
                    inven.UOM = ""
                    inven.ProductCategory = ""
                    inven.BoxNumber = 0
                    inven.CustNum = 0
                    inven.Invoice = 0
                    inven.PO = ""
                    inven.FlowerDetails.FontColor = ""
                    inven.FlowerDetails.BGColor = ""
                    inven.UnitsBunch = ""
                    inven.Cost = 0
                    inven.InvenType = ""
                    inven.Units = 0
                    inven.Comments = ""
                    inven.Days = ""
                    inven.Flag = ""
                    inven.WH = ""
                    inven.TotalRows = TotalCount

                    inven.AddDate = "01/01/1900"
                    inven.AddUser = ""
                    ulistinven.Add(inven)


                End Using
            End Using
            Return ulistinven
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetViewInventoryTransactionsGrid") 
            'ErrorLogs.LogException(ex, "Error in GetInventoryGridlistFromSQL")
            Return Nothing
        End Try

    End Function

    ''' <summary>
    ''' ANITHA::24-JULY-2018::to get the add/Edit user and date time information of the inventory trans details
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetInventoryTransInfo(ByVal ID As String) As BO.InventoryTrans
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BO.InventoryTrans
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("Select ADDUSER,ADDDATE,ADDTIME,isnull(UPDUSER,'') as UPDUSER,isnull(UPDDATE,'') as UPDDATE,isnull(UPDTIME,'') as UPDTIME,isnull(DELUSER,'') as DELUSER,isnull(DELDATE,'') as DELDATE,isnull(DELTIME,'') as DELTIME from INVTRANS where ID='{0}'", ID), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.AddDate = Convert.ToString(row("ADDDATE"))
                        u.AddTime = Convert.ToString(row("ADDTIME"))
                        u.AddUser = Convert.ToString(row("ADDUSER"))
                        u.UpdateDate = Convert.ToString(row("UPDDATE"))
                        u.UpdateTime = Convert.ToString(row("UPDTIME"))
                        u.UpdateUser = Convert.ToString(row("UPDUSER"))
                        u.DeleteDate = Convert.ToString(row("DELDATE"))
                        u.DeleteTime = Convert.ToString(row("DELTIME"))
                        u.DeleteUser = Convert.ToString(row("DELUSER"))
                    Next
                    Return u
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventoryTransInfo")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA::24-JULY-2018::to get the search AWB of the inventory trans details
    ''' </summary>
    ''' <param name="SearchText"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetInvenTransAWBForAutoComplete(ByVal SearchText As String) As List(Of BO.InventoryTrans)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.InventoryTrans)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("select distinct top 20 Lot,ID from INVTRANS where ID <> '' and Lot like '%" + SearchText + "%'", Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.InventoryTrans
                        u.AWB = Convert.ToString(row("LOT"))
                        u.ID = Convert.ToString(row("ID"))
                        uList.Add(u)
                    Next
                    Return uList
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvenTransAWBForAutoComplete")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' MANI:17-JULY-2018::to get the search AWB of the inventory trans details
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function LoadMultipleFarmsDropdownWhenSelling(ByVal ID As String) As List(Of BO.Inventory)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of BO.Inventory)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("select Farm,Sum(CSREC-CSSOLD-CSHOLD) Availableboxes,Comments,  " +
"STUFF(((select ',' + a1.ID from (select ID,farm,comments from inven  where id in (" + ID + ")) a1 where " +
"a.farm=a1.farm and a.comments=a1.comments   FOR XML PATH('') )),1,1,'') as invenids  from inven a where id in (" + ID + ") " +
"group by farm,comments order by farm", Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BO.Inventory
                        u.Farm = Convert.ToString(row("Farm"))
                        u.Qty = Convert.ToString(row("Availableboxes"))
                        u.Comments = Convert.ToString(row("Comments"))
                        u.IDs = Convert.ToString(row("invenids"))
                        uList.Add(u)
                    Next
                    Return uList
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadMultipleFarmsDropdownWhenSelling")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Anitha :: 09/05/2018 :: get the inventory customer online buying
    ''' </summary>
    ''' <param name="ShipDate"></param>
    ''' <param name="Cat"></param>
    ''' <param name="Variety"></param>
    ''' <param name="Grade"></param>
    ''' <param name="Color"></param>
    ''' <param name="Customer"></param>
    ''' <returns></returns>
    Public Shared Function LoadInventoryDetailsForCustomerOrder(ShipDate As String, Cat As String, Variety As String, Grade As String, Color As String, Customer As String) As List(Of BO.Inventory)
        Try
            Dim uList As New List(Of BO.Inventory)
            Dim dt As New DataTable()
            Dim markup As Decimal = 0
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()

                Dim whereclause = "inv.csrec-inv.cssold-inv.cshold>0   And inv.price <> 0 "
                If (ShipDate <> Nothing) Then
                    whereclause += " And inv.DATEEXP >=CAST('" + ShipDate + "' as date)"
                    End If

                If (Cat <> Nothing) Then
                    whereclause += " and inv.CAT='" + Cat + "'"
                End If

                If (Grade <> Nothing) Then
                    whereclause += " and inv.GRADE='" + Grade + "'"
                End If

                If (Color <> Nothing) Then
                    whereclause += " and inv.COLOR='" + Color + "'"
                End If

                If (Variety <> Nothing) Then
                    whereclause += " and inv.VARIETY='" + Variety + "'"
                End If

                Using Cmd As New SqlCommand("spGetInventoryforCustomerBuyer", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("WhereClause", whereclause)
                    Dim adp As New SqlDataAdapter(Cmd)
                    adp.Fill(dt)
                End Using
            End Using
            Dim i = 0
            For Each row In dt.Rows
                Dim u As New BO.Inventory()
                Try
                    If (row("IDs") = Nothing) Then
                        Continue For
                    End If

                    Dim FeePerFullbox As Integer = 2
                    Dim category As String = ""
                    Dim FTUnits As Integer = 0
                    u.RowNo = i + 1
                    Dim fbe = row("FBE")
                    u.FBE = fbe
                    u.ForeColor = row("ForeCOLOR")
                    u.BGColor = row("BGCOLOR")
                    u.Fuel = row("Fuel")
                    u.City = row("CITY")
                    u.Country = row("COUNTRY")
                    u.DateRec = row("DateRec")
                    If (ShipDate <> Nothing) Then
                        If (ShipDate < u.DateRec) Then
                            u.Days = u.DateRec.ToString("MM/dd")
                        Else
                            u.Days = ""

                        End If
                    End If
                    u.IDs = row("IDs")
                    u.AWB = row("LOT")
                    u.Farm = row("FARMCODE")
                    u.CustNum = row("cust")
                    u.ProductCategory = row("CAT")
                    u.ProductCode = row("Flower")
                    u.Color = row("COLOR")
                    u.Variety = row("VARIETY")
                    u.Grade = row("GRADE")
                    u.ProductName = row("Name")
                    u.CSREC = row("CSREC")
                    u.CSSOLD = row("CSSOLD")
                    u.CSHOLD = row("CSHOLD")
                    u.UOM = row("UOM")
                    u.Invoice = row("Invoice")
                    'u.PO = row("po")
                    u.Selected = False
                    u.Units = Convert.ToInt32(row("Units"))
                    u.UnitsBunch = Convert.ToInt32(row("UNITSBUNCH"))
                    If (u.UnitsBunch = 0) Then
                        u.Bunches = 0
                    Else
                        u.Bunches = u.Units / u.UnitsBunch
                    End If
                    u.Cost = Convert.ToDecimal(row("COST"))
                    u.OtherCost = Convert.ToDecimal(row("OtherCost"))
                    u.InvenType = row("INVENTYPE")
                    If (row("Soldas").ToString() = "BU") Then
                        u.Soldas = "Bunch"
                    ElseIf (row("Soldas").ToString() = "ST") Then
                        u.Soldas = "Stem"
                    ElseIf (row("Soldas").ToString() = "") Then
                        u.Soldas = ""
                    End If
                    u.Qty = (u.CSREC - (u.CSSOLD + u.CSHOLD))
                    Dim Price = row("Price")
                    u.InvenPrice = Price
                    u.FEE = Math.Round((FeePerFullbox * u.FBE), 2)
                    u.Cost = Math.Round((u.Cost + (u.OtherCost / IIf(Convert.ToDecimal(u.Units) > 0, u.Units, 1))), 3)
                    u.Price = row("Price")
                    Dim finalfob As Decimal = 0
                    Dim fuel As Decimal = 0
                    fuel = Convert.ToDecimal(row("Fuel").ToString())
                    Dim fob As Decimal = Convert.ToDecimal(row("PRICE").ToString())
                    If (Convert.ToDecimal(row("Units").ToString()) > 0) Then
                        Dim fuelperfull As Double = Convert.ToDouble(fuel)
                        fuelperfull = fuelperfull * Convert.ToDouble(fbe)
                        '(inven.price) + fuel/units)* (1+(f_cust.markup/100) )  fob calculation using this                    
                        finalfob = (fob + (Convert.ToDecimal(fuelperfull) / Convert.ToDecimal(row("Units").ToString()))) * (1 + (markup / 100))
                    Else
                        finalfob = fob + (1 + (markup / 100))
                    End If
                    u.FOB = Math.Round(finalfob, 2)
                    u.FOBBOX = u.FOB * u.Units
                    uList.Add(u)
                    i = u.RowNo
                Catch ex As Exception
                    Dim us As New BO.Inventory
                    us.ErrorMessage = "Error in LoadInventoryDetailsForCustomerOrder:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "LoadInventoryDetailsForCustomerOrder")
                    uList.Add(us)
                End Try
            Next
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadInventoryDetailsForCustomerOrder")
            Dim uList As New List(Of BO.Inventory)
            Dim u As New BO.Inventory
            u.ErrorMessage = "Error in LoadInventoryDetailsForCustomerOrder:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "LoadInventoryDetailsForCustomerOrder")
            uList.Add(u)
            Return uList
        End Try
    End Function

    Public Shared Function GetHuntList(ByVal huntawbno As String) As DataTable
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uinventno As New BO.Inventory()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spRptHuntList", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@awbno", huntawbno)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return dt
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetHuntList")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 01-NOV-2018 :: Get Sales by Boxnumber
    ''' </summary>
    ''' <param name="IDINVEN"></param>
    ''' <returns></returns>
    Public Shared Function GetSalesbyIDINVEN(ByVal IDINVEN As String) As DataTable
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uinventno As New BO.Inventory()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SpGetSalesbyIDINVEN", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IDINVEN", IDINVEN)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return dt
                End Using
            End Using
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 12-NOV-2018 :: Get Physical inventory on the cooler report
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function GetPhysicalInventoryReport() As DataTable
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uinventno As New BO.Inventory()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetPhysicalInventoryReport", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return dt
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetPhysicalInventoryReport")
            Throw ex
        End Try
    End Function
    ''' <summary>
    ''' Muthu Nivetha M :: 15 May 2019 :: Deleting a box from the inventory 
    ''' </summary>
    ''' <param name="InventoryId"></param>
    ''' <returns></returns>
    Public Shared Function CheckInvenIDIsExistinVETOrOrder(ByVal InventoryId As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spCheckInvenIDIsExistinVETOrOrder", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@InventoryId", InventoryId)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Return dt(0)(0).ToString()
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CheckInvenIDIsExistinVETOrOrder")
            Throw ex
        End Try
    End Function
Public Shared Function GetInventoryDetailsbyBarCode(ByVal Barcode As String) As List(Of BO.Inventory)
        Try
            Dim uList As New List(Of BO.Inventory)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("SELECT *, LEFT(FARM  +REPLICATE(' ',1),3)+RIGHT(REPLICATE('0',5)+RTRIM(LTRIM(STR(BOXNUM,5,0))),5) as BarCode FROM INVEN WHERE LEFT(FARM  +REPLICATE(' ',1),3)+RIGHT(REPLICATE('0',5)+RTRIM(LTRIM(STR(BOXNUM,5,0))),5) IN (" + Barcode + ")"), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim adp As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable()
                    adp.Fill(dt)
                    Dim Invendt = dt
                    Dim BoxLogdt = BoxLogDetailinSQL(Barcode)

                    Dim query = From inv In Invendt.AsEnumerable()
                                Join boxlog In BoxLogdt.AsEnumerable()
                                    On inv.Field(Of String)("BarCode") Equals
                                    boxlog.Field(Of String)("BarCode")
                                Select New With
                                    {
                                        .ID = boxlog.Field(Of Integer)("ID"),
                                        .DateRec = inv.Field(Of Date)("DateRec"),
                                        .Farm = inv.Field(Of String)("Farm"),
                                        .Cat = inv.Field(Of String)("Cat"),
                                        .Flower = inv.Field(Of String)("Flower"),
                                        .Name = inv.Field(Of String)("Name"),
                                        .CSREC = inv.Field(Of Decimal)("CSREC"),
                                        .CSSOLD = inv.Field(Of Decimal)("CSSOLD"),
                                        .UOM = inv.Field(Of String)("UOM"),
                                        .Units = inv.Field(Of Decimal)("Units"),
                                        .Boxnum = inv.Field(Of Decimal)("Boxnum"),
                                        .cust = inv.Field(Of Decimal)("cust"),
                                        .Invoice = boxlog.Field(Of Decimal)("Invoice"),
                                        .PO = inv.Field(Of String)("PO"),
                                        .UNITSBUNCH = inv.Field(Of Decimal)("UNITSBUNCH"),
                                        .COST = inv.Field(Of Decimal)("COST"),
                                        .INVENTYPE = inv.Field(Of String)("INVENTYPE"),
                                        .Comments = inv.Field(Of String)("Comments"),
                                        .Order = inv.Field(Of Decimal)("Order"),
                                        .LOT = inv.Field(Of Decimal)("LOT"),
                                        .DT = boxlog.Field(Of DateTime)("dt"),
                                        .Sequence = boxlog.Field(Of Integer)("Sequence"),
                                        .Application = boxlog.Field(Of String)("Application"),
                                        .DeviceID = boxlog.Field(Of String)("DeviceID"),
                                        .UserID = boxlog.Field(Of Integer)("UserID"),
                                        .Flag = boxlog.Field(Of Integer)("Flag"),
                                        .UserName = boxlog.Field(Of String)("UserName")
                                    }

                    dt = New DataTable()
                    dt = ToDataTable(query)

                    For Each row In dt.Rows
                        Dim u As New BO.Inventory()
                        u.ID = row("ID")
                        u.DateRec = row("DateRec")
                        u.AWB = row("LOT")
                        u.Farm = row("Farm")
                        u.ProductCategory = row("Cat")
                        u.ProductCode = row("Flower")
                        u.ProductName = row("Name")
                        u.CSREC = row("CSREC")
                        u.CSSOLD = row("CSSOLD")
                        u.UOM = row("UOM")
                        u.Units = row("Units")
                        u.BoxNumber = row("Boxnum")
                        u.CustNum = row("cust")
                        u.Invoice = row("Invoice")
                        u.PO = row("po")
                        u.UnitsBunch = row("UNITSBUNCH")
                        u.Cost = Convert.ToDecimal(row("COST"))
                        u.InvenType = row("INVENTYPE")
                        u.Comments = row("Comments")
                        u.OrderNumber = row("Order")
                        u.Dt = row("dt")
                        u.Sequence = row("Sequence")
                        u.DeviceID = row("DeviceID")
                        u.Application = row("Application")
                        u.UserID = row("UserID")
                        u.Flag = row("Flag")
                        u.UpdateUser = row("UserName")
                        uList.Add(u)
                    Next
                    Dim def As New BO.Inventory()
                    def.ID = 0
                    def.DateRec = DateTime.Now
                    def.AWB = ""
                    def.Farm = ""
                    def.ProductCategory = ""
                    def.ProductCode = ""
                    def.ProductName = ""
                    def.CSREC = 0
                    def.CSSOLD = 0
                    def.UOM = ""
                    def.Units = 0
                    def.BoxNumber = 0
                    def.CustNum = 0
                    def.Invoice = 0
                    def.PO = ""
                    def.UnitsBunch = ""
                    def.Cost = Convert.ToDecimal(0.00)
                    def.InvenType = ""
                    def.Comments = ""
                    def.OrderNumber = 0
                    def.Dt = DateTime.Now
                    def.Sequence = ""
                    def.DeviceID = ""
                    def.Application = ""
                    def.UserID = ""
                    def.Flag = ""
                    def.UpdateUser = ""
                    uList.Add(def)

                    Return uList
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInventoryDetailsbyBarCode")
            Dim uList As New List(Of BO.Inventory)
            Dim u As New BO.Inventory
            u.ErrorMessage = "Error in GetInventoryDetailsbyBarCode:: DFlowerService ::" + ErrorLogs.ExceptionHandling(ex, "GetInventoryDetailsbyBarCode")
            uList.Add(u)
            Return uList
        End Try
    End Function

    Public Shared Function BoxLogDetailinSQL(ByVal BarCode As String) As DataTable
        Try
            Dim uList As New List(Of BO.Flowers)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("select b.*,u.UserName,left(Farm+REPLICATE(' ',1),3)+right(REPLICATE('0',5)+cast(BoxNum as varchar(10)),5) as BarCode,isnull(Invoice,0) as Invoice from tblBoxlog b " +
            "left join tblusers u on u.ID=b.UserID where left(Farm+REPLICATE(' ',1),3)+right(REPLICATE('0',5)+cast(BoxNum as varchar(10)),5) IN (" + BarCode + ")"), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim adp As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    adp.Fill(dt)
                    Return dt
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in BoxLogDetailinSQL")
            Return Nothing
        End Try
    End Function
    Public Shared Function ToDataTable(Of T)(collection As IEnumerable(Of T)) As DataTable
        Try
            Dim dt As New DataTable()
            Dim at As Type = GetType(T)
            Dim pia As PropertyInfo() = at.GetProperties()
            'Create the columns in the DataTable
            For Each pi As PropertyInfo In pia
                dt.Columns.Add(pi.Name, pi.PropertyType)
            Next
            'Populate the table
            For Each item As T In collection
                Dim dr As DataRow = dt.NewRow()
                dr.BeginEdit()
                For Each pi As PropertyInfo In pia
                    dr(pi.Name) = pi.GetValue(item, Nothing)
                Next
                dr.EndEdit()
                dt.Rows.Add(dr)
            Next
            Return dt
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToDataTable::Inventory")
            Throw ex
        End Try
    End Function

    Public Shared Function GetInventoryAWBList(ByVal TableName As String, ByVal fromDate As String, ByVal toDate As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistFarm As String = "", sql As String = "SELECT DISTINCT(LOT) Lot FROM INVEN"

            If TableName = "invhist" And fromDate <> "" And toDate <> "" Then
                sql = "SELECT DISTINCT(LOT) Lot FROM INVHIST WHERE daterec BETWEEN '" + fromDate + "' AND '" + toDate + "'"

            End If

            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(sql, Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        ulistFarm += "<option value=" + Convert.ToString(row("Lot")) + ">" + Convert.ToString(row("Lot")) + "</option>"
                        'ulistFarm.Add(u)
                    Next
                    Return ulistFarm
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetInventoryAWBList")
            Return "Error In GetInventoryAWBList:: Inventory ::" + ErrorLogs.ExceptionHandling(ex, "")
        End Try
    End Function

    Public Shared Function PrintBoxedReceivedToExcel(ByVal FromDate As String, ToDate As String) As DataTable
        Try
            Dim ds As New DataTable
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim Qry As String = ""
                Qry = "spGetBoxesreceivedbyUomlotfarmdaterec"
                Using cmd As New SqlCommand(Qry, Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDt", FromDate)
                    cmd.Parameters.AddWithValue("@UpToDt", ToDate)
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using
            Return ds
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In PrintBoxedReceivedToExcel")
            Return Nothing
        End Try
    End Function

    Public Shared Sub ReceiptsSummaryForQB(ByVal FromDate As String, ToDate As String)
        Try
            Dim User As New User
            If Not System.Web.HttpContext.Current.Session("LoginUserDetails") Is Nothing Then
                User = System.Web.HttpContext.Current.Session("LoginUserDetails")
            ElseIf Not System.Web.HttpContext.Current.Session("LoginAdminDetails") Is Nothing Then
                User = System.Web.HttpContext.Current.Session("LoginAdminDetails")
            End If

            Dim ds As New DataTable
            Dim csvOutput As String
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Dim Qry As String = ""
                Qry = "spReceiptsSummaryforQB"
                Using cmd As New SqlCommand(Qry, Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@DtStart", FromDate)
                    cmd.Parameters.AddWithValue("@DtEnd", ToDate)
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(ds)
                End Using
            End Using

            csvOutput = ""
            For Each clm In ds.Columns
                csvOutput = csvOutput & clm.ColumnName & ","
            Next
            ''add new line
            csvOutput = csvOutput.TrimEnd(",") & vbCr & vbLf

            For Each row In ds.Rows
                For Each clm In ds.Columns
                    csvOutput = csvOutput & Convert.ToString(row(clm.ColumnName)).Replace(",", ";") & ","
                Next
                ''add new line
                csvOutput = csvOutput.TrimEnd(",") & vbCr & vbLf
            Next

            ''write output to file
            Dim emailSubject As String = ""
            Dim emailBody As String = ""
            Dim filename As String = "ReceiptsSummary from " + FromDate.Replace("/", "-") + " to " + ToDate.Replace("/", "-") + " _" + DateTime.Now.ToString("yyMMddhhmmss") + ".csv"
            Dim VendorFileFolderName As String = ConfigurationManager.AppSettings("VendorEmailsFolder")
            Dim LogPath As String = VendorFileFolderName
            If Not Directory.Exists(LogPath) Then
                Directory.CreateDirectory(LogPath)
            End If
            Dim filepath As String = LogPath & filename
            File.WriteAllText(filepath, csvOutput)
            '''''
            emailSubject = "Receipts Summary from " + FromDate.Replace("/", "-") + " to " + ToDate.Replace("/", "-")
            ''emailBody = emailSubject
            ''send the file in an email
            Logs.SendMail(User.Email, User.Email, emailBody, filename, emailSubject)
            '''''
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In ReceiptsSummaryForQB")
        End Try
    End Sub
End Class
