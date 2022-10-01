Imports System.Data.SqlClient
Imports System.Data


Public Class GrowerDetails

    Public Class GetGrowerFarmHeaderFgrd
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetGrowerFarmHeaderForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of GrowerDetail)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of GrowerDetail)()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginAdminDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    'Using cmd As New SqlCommand("select ROW_NUMBER() OVER(ORDER BY gd.Farm) 'RECNO',gd.Farm,f.Name as 'FarmName',sum(gd.Boxes) as 'Boxes',sum(gd.FBE*gd.Boxes) as 'FBE',sum(Boxes_rec) as 'Boxes_rec',sum(gd.GROSS) -sum(gd.adjust) as GROSS,f.FOB,gd.HeaderID from tblGrowerDetail gd left join F_FARM f on gd.Farm=f.FARM  where " + whereClause + " group by gd.Farm,f.FOB,f.Name,gd.HeaderID", con)
                    Using cmd As New SqlCommand("select * from vwGetGrowerFarmHeaderDetailWithFileName  where " + whereClause, con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        'Dim INCcolumn As New DataColumn()
                        'INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                        'INCcolumn.ColumnName = "RECNO"
                        'INCcolumn.AutoIncrement = True
                        'INCcolumn.AutoIncrementSeed = 1
                        'INCcolumn.AutoIncrementStep = 1

                        Dim ds As New DataSet
                        ' ds.Tables(0).Columns.Add(INCcolumn)

                        da.Fill(ds)

                        Dim TotalFBE As Decimal = 0
                        Dim TotalFBE_rec As Decimal = 0
                        Dim TotalBoxes As Decimal = 0
                        Dim TotalBoxes_rec As Decimal = 0
                        Dim TotalGross As Decimal = 0
                        For Each row In ds.Tables(0).Rows
                            Dim u As New GrowerDetail()
                            u.RECNO = row("RECNO")
                            u.HeaderID = row("HeaderID")
                            u.Farm = IIf(row("Farm") Is DBNull.Value, "", row("Farm"))
                            u.FarmName = IIf(row("FarmName") Is DBNull.Value, "", row("FarmName"))
                            u.FOB = IIf(row("FOB") Is DBNull.Value, "", row("FOB"))
                            u.Boxes = row("Boxes")
                            TotalBoxes += u.Boxes
                            u.FBE = IIf(row("FBE") Is DBNull.Value, 0.0, row("FBE"))
                            TotalFBE += u.FBE
                            u.Gross = IIf(row("Gross") Is DBNull.Value, 0.0, row("Gross"))
                            TotalGross += u.Gross
                            u.Boxes_rec = Convert.ToInt32(row("Boxes_rec"))
                            TotalBoxes_rec += u.Boxes_rec
                            u.FarmDetailID = IIf(row("FarmDetailID") Is DBNull.Value, 0, row("FarmDetailID"))
                            u.FarmFileName = IIf(row("FarmFileName") Is DBNull.Value, "", row("FarmFileName"))
                            u.FarmAirport = IIf(row("FarmAirport") Is DBNull.Value, "", row("FarmAirport"))
                            u.FarmCountry = IIf(row("FarmCountry") Is DBNull.Value, "", row("FarmCountry"))
                            u.FBE_REC = IIf(row("FBE_rec") Is DBNull.Value, 0.0, row("FBE_rec"))
                            TotalFBE_rec += u.FBE_REC
                            ' u.GrowerLockContent = GrowerHeaders.CheckGrowerReportIsAlreadyLocked(u.HeaderID, UserDetails.ID)
                            uList.Add(u)
                        Next

                        Dim po As New GrowerDetail()
                        po.RECNO = 0
                        po.HeaderID = 0
                        po.Farm = ""
                        po.FarmName = ""
                        po.FOB = ""
                        po.Boxes_rec = TotalBoxes_rec
                        po.FBE_REC = TotalFBE_rec
                        po.Gross = TotalGross
                        uList.Add(po)

                        Me.TotalRows = ds.Tables(0).Rows.Count
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGrowerFarmHeaderForFgrd")
                Throw ex
            End Try
        End Function

        Public Function GetGrowerAWBHeaderForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of GrowerDetail)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of GrowerDetail)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select * from vwGrowerDetailsByAWB where " + whereClause + "", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        'Dim INCcolumn As New DataColumn()
                        'INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                        'INCcolumn.ColumnName = "RECNO"
                        'INCcolumn.AutoIncrement = True
                        'INCcolumn.AutoIncrementSeed = 1
                        'INCcolumn.AutoIncrementStep = 1

                        Dim ds As New DataSet
                        ' ds.Tables(0).Columns.Add(INCcolumn)

                        da.Fill(ds)

                        Dim TotalFBERec As Decimal = 0
                        Dim TotalBoxes As Decimal = 0
                        Dim TotalBoxes_rec As Decimal = 0
                        Dim TotalFBESold As Decimal = 0
                        For Each row In ds.Tables(0).Rows
                            Dim u As New GrowerDetail()
                            u.HeaderID = row("HeaderID")
                            u.RECNO = row("RECNO")
                            u.Awb = IIf(row("Awb") Is DBNull.Value Or row("Awb") = "0", "", row("Awb"))
                            u.ReceivingDate = row("ReceivingDate")
                            u.Boxes = row("Boxes")
                            TotalBoxes += u.Boxes
                            u.Boxes_rec = Convert.ToInt32(row("Boxes_rec"))
                            TotalBoxes_rec += u.Boxes_rec
                            u.FBE_REC = IIf(row("FBE_rec") Is DBNull.Value, 0.0, row("FBE_rec"))
                            TotalFBERec += u.FBE_REC
                            u.FBE_Sold = IIf(row("FBE_Sold") Is DBNull.Value, 0.0, row("FBE_Sold"))
                            TotalFBESold += u.FBE_Sold
                            uList.Add(u)
                        Next

                        Dim po As New GrowerDetail()
                        po.RECNO = 0
                        po.Awb = "0"
                        po.ReceivingDate = DateTime.Now.ToString()
                        po.Boxes_rec = TotalBoxes_rec
                        po.FBE_REC = TotalFBERec
                        po.FBE_Sold = TotalFBESold
                        uList.Add(po)

                        Me.TotalRows = ds.Tables(0).Rows.Count
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGrowerAWBHeaderForFgrd")
                Throw ex
            End Try
        End Function

        Public Function GetGrowerFarmDetailForFgrd(ByVal whereClause As String, ByVal sortExp As String) As List(Of GrowerDetail)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of GrowerDetail)()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginAdminDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGrowerFarmDetail]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.CommandTimeout = 0
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        Dim TotalFBE As Decimal = 0
                        Dim TotalFBE_rec As Decimal = 0
                        Dim TotalBoxes As Decimal = 0
                        Dim TotalBoxes_rec As Decimal = 0
                        Dim TotalOrigross As Decimal = 0
                        Dim Totalgross As Decimal = 0
                        Dim TotalAdjust As Decimal = 0
                        Dim TotalUnits As Decimal = 0
                        Dim TotalCost As Decimal = 0
                        For Each row In ds.Tables(0).Rows
                            Dim u As New GrowerDetail()
                            'u.RECNO = row("RECNO")
                            u.DetailID = row("ID")
                            u.Farm = row("Farm")
                            u.FlowerName = row("FlowerName")
                            'u.FlowerDetails.FontColor = IIf(row("FontColor") Is DBNull.Value, "", row("FontColor"))
                            'u.FlowerDetails.BGColor = IIf(row("BgColor") Is DBNull.Value, "", row("BgColor"))
                            u.Boxes = IIf(row("Boxes") Is DBNull.Value, 0, row("Boxes"))
                            TotalBoxes += u.Boxes
                            u.Units = IIf(row("Units") Is DBNull.Value, 0, row("Units"))
                            u.UOM = row("UOM")
                            u.FBE = IIf(row("FBE") Is DBNull.Value, 0.0, row("FBE")) * u.Boxes
                            TotalFBE += u.FBE

                            u.FarmName = IIf(row("FarmName") Is DBNull.Value, "", row("FarmName"))
                            u.FOB = IIf(row("FOB") Is DBNull.Value, "", row("FOB"))
                            u.ReceivingDate = Convert.ToDateTime(row("ReceivingDate")).ToString("yyyy-MM-dd")
                            u.Awb = IIf(row("Awb") Is DBNull.Value Or row("Awb") = "0", "", row("Awb"))
                            u.Flower = row("Flower")
                            u.Type = row("Type")
                            'u.Origross = IIf(row("Origross") Is DBNull.Value, 0.0, row("Origross"))
                            'TotalOrigross += u.Origross
                            u.Gross = IIf(row("Gross") Is DBNull.Value, 0.0, row("Gross"))
                            Totalgross += u.Gross
                            u.Boxnum = IIf(row("Boxnum") Is DBNull.Value, "0", row("Boxnum"))
                            u.Invoice = IIf(row("Invoice") Is DBNull.Value, "", row("Invoice"))
                            u.Notes = IIf(row("Notes") Is DBNull.Value, "", row("Notes"))
                            u.BoxCharge = IIf(row("BoxCharge") Is DBNull.Value, 0.0, row("BoxCharge"))
                            u.Adjust = IIf(row("Adjust") Is DBNull.Value, 0.0, row("Adjust"))
                            TotalAdjust += u.Adjust
                            u.Freight = IIf(row("Freight") Is DBNull.Value, 0.0, row("Freight"))
                            u.Duties = IIf(row("Duties") Is DBNull.Value, 0.0, row("Duties"))
                            u.Fuel = IIf(row("Fuel") Is DBNull.Value, 0.0, row("Fuel"))
                            u.Fumigation = IIf(row("Fumigation") Is DBNull.Value, 0.0, row("Fumigation"))
                            u.Other = IIf(row("Other") Is DBNull.Value, 0.0, row("Other"))
                            u.Commission = IIf(row("Commission") Is DBNull.Value, 0.0, row("Commission"))
                            u.Packing = IIf(row("Packing") Is DBNull.Value, 0.0, row("Packing"))
                            u.Handling = IIf(row("Handling") Is DBNull.Value, 0.0, row("Handling"))
                            u.Cost = IIf(row("Cost") Is DBNull.Value, 0.0, row("Cost"))
                            u.Tax1 = IIf(row("Tax1") Is DBNull.Value, 0.0, row("Tax1"))
                            u.Tax2 = IIf(row("Tax2") Is DBNull.Value, 0.0, row("Tax2"))
                            u.Tax3 = IIf(row("Tax3") Is DBNull.Value, 0.0, row("Tax3"))
                            u.FuelPaid = IIf(row("FuelPaid") Is DBNull.Value, 0.0, row("FuelPaid"))
                            u.Boxes_rec = IIf(row("Boxes_rec") Is DBNull.Value, 0.0, row("Boxes_rec"))
                            TotalBoxes_rec += Convert.ToInt32(u.Boxes_rec)
                            u.FBE_REC = IIf(row("FBE") Is DBNull.Value, 0.0, row("FBE")) * u.Boxes_rec
                            TotalFBE_rec += u.FBE_REC
                            u.TotalUnits = u.Boxes_rec * u.Units
                            TotalUnits += u.TotalUnits
                            u.NotesCount = IIf(row("GrowerNotesAmount") Is DBNull.Value, "0", "1")
                            u.NotesAmount = IIf(row("GrowerNotesAmount") Is DBNull.Value, 0.0, row("GrowerNotesAmount"))
                            u.Price = IIf(row("Price") Is DBNull.Value, 0.0, row("Price"))
                            u.Customer = IIf(row("Customer") Is DBNull.Value, "", row("Customer"))
                            u.TotalCost = u.Cost * u.Units * u.Boxes_rec
                            TotalCost += u.TotalCost
                            'u.GrowerLockContent = GrowerHeaders.CheckGrowerReportIsAlreadyLocked(row("HeaderID"), UserDetails.ID)
                            uList.Add(u)
                        Next

                        Dim po As New GrowerDetail()
                        po.RECNO = 0
                        po.DetailID = 0
                        po.Farm = ""
                        po.FlowerName = ""
                        'po.FlowerDetails.FontColor = ""
                        'po.FlowerDetails.BGColor = ""
                        po.Boxes = TotalBoxes
                        po.Units = 0
                        po.TotalUnits = TotalUnits
                        po.UOM = ""
                        po.FBE_REC = TotalFBE_rec
                        'po.Origross = 0.0
                        po.Gross = Totalgross
                        po.Boxnum = "0"
                        po.Invoice = ""
                        po.Notes = ""
                        po.FarmName = ""
                        po.FOB = ""
                        po.ReceivingDate = DateTime.Now.ToString()
                        po.Awb = "0"
                        po.Flower = ""
                        po.Type = ""
                        po.BoxCharge = 0.0
                        po.Adjust = TotalAdjust
                        po.Freight = 0.0
                        po.Duties = 0.0
                        po.Fuel = 0.0
                        po.Fumigation = 0.0
                        po.Other = 0.0
                        po.Commission = 0.0
                        po.Packing = 0.0
                        po.Handling = 0.0
                        po.Cost = 0.0
                        po.Tax1 = 0.0
                        po.Tax2 = 0.0
                        po.FuelPaid = 0.0
                        po.Boxes_rec = TotalBoxes_rec
                        po.Price = 0.0
                        po.Customer = ""
                        po.TotalCost = TotalCost

                        uList.Add(po)

                        Me.TotalRows = ds.Tables(0).Rows.Count
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGrowerFarmDetailForFgrd")
                Throw ex
            End Try
        End Function



        Public Function GetGrowerInvoiceDetailsByFarm(ByVal WhereClause As String) As List(Of GrowerDetail)
            ', ByVal HeaderID As String, ByVal Farm As String) As List(Of GrowerDetail)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of GrowerDetail)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    'Using cmd As New SqlCommand("select ROW_NUMBER() OVER(ORDER BY " + sortExp + ") 'RECNO',Farm,AWB, Invoice,ReceivingDate,sum(Gross) as 'Amount'  from tblGrowerDetail  where " + whereClause + " group by Farm,AWB,Invoice,ReceivingDate", con)
                    Using cmd As New SqlCommand("spInsertAndGetGrowerInvoiceDetailsByHeaderIDAndFarm", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", WhereClause))
                        'cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                        'cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        'Dim TotalFBE As Decimal = 0
                        'Dim TotalBoxes As Decimal = 0
                        'Dim TotalOrigross As Decimal = 0
                        Dim Totalamount As Decimal = 0
                        For Each row In ds.Tables(0).Rows
                            Dim u As New GrowerDetail()

                            u.DetailID = row("ID")
                            u.Farm = row("Farm")
                            u.Awb = IIf(row("Awb") Is DBNull.Value Or row("Awb") = "0", "", row("Awb"))
                            u.Invoice = IIf(row("Invoice") Is DBNull.Value, "", row("Invoice"))
                            u.ReceivingDate = Convert.ToDateTime(row("ReceivingDate")).ToString("yyyy-MM-dd")
                            u.InvAmount = IIf(row("Amount") Is DBNull.Value, 0.0, row("Amount"))
                            u.InvoiceVerified = row("IsVerified")
                            u.InvFileName = IIf(row("InvFileName") Is DBNull.Value, "", row("InvFileName"))
                            Totalamount += u.InvAmount
                            uList.Add(u)
                        Next
                        Dim po As New GrowerDetail()
                        po.DetailID = 0
                        po.Farm = ""
                        po.Awb = "0"
                        po.Invoice = ""
                        po.ReceivingDate = DateTime.Now.ToString()
                        po.InvAmount = Totalamount
                        uList.Add(po)

                        Me.TotalRows = ds.Tables(0).Rows.Count
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGrowerInvoiceDetailsByFarm")
                Throw ex
            End Try
        End Function



    End Class

    ''' <summary>
    ''' Abinaya::03-AUGUST-2016::to delete the GrowerDetails by ID
    ''' </summary>
    ''' <param name="ID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeleteGrowerDetailsByID(ByVal ID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()

                Using cmd As New SqlCommand("spDeleteGrowerDetails", con)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.ExecuteNonQuery()
                End Using
                con.Close()
            End Using


            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteGrowerDetailsById")
            Return Nothing
        End Try

    End Function

    Shared Function GetGrowerDetailById(ID As Integer) As GrowerDetail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim G As New GrowerDetail

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from vwGetGrowerDetailById where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@ID", ID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        G.DetailID = row("ID")
                        G.Farm = IIf(row("Farm") Is DBNull.Value, "", row("Farm"))
                        G.Flower = IIf(row("Flower") Is DBNull.Value, "", row("Flower"))
                        G.FlowerName = IIf(row("FlowerName") Is DBNull.Value, "", row("FlowerName"))
                        'G.FlowerDetails.FontColor = IIf(row("FontColor") Is DBNull.Value, "", row("FontColor"))
                        'G.FlowerDetails.BGColor = IIf(row("BgColor") Is DBNull.Value, "", row("BgColor"))
                        'G.FlowerDetails.ColorCode = IIf(row("ColorCode") Is DBNull.Value, "", row("ColorCode"))
                        G.FlowerCategory = IIf(row("FlowerCategory") Is DBNull.Value, "", row("FlowerCategory"))

                        G.Boxes = IIf(row("Boxes") Is DBNull.Value, 0, row("Boxes"))
                        ' TotalBoxes += G.Boxes
                        G.Units = IIf(row("Units") Is DBNull.Value, 0, row("Units"))

                        G.UOM = row("UOM")
                        G.FBE = IIf(row("FBE") Is DBNull.Value, 0.0, row("FBE"))
                        ' TotalFBE += G.FBE
                        G.FarmName = IIf(row("FarmName") Is DBNull.Value, "", row("FarmName"))
                        G.FOB = IIf(row("FOB") Is DBNull.Value, "", row("FOB"))
                        G.ReceivingDate = Convert.ToDateTime(row("ReceivingDate")).ToString("yyyy-MM-dd")
                        G.Awb = IIf(row("Awb") Is DBNull.Value Or row("Awb") = "0", "", row("Awb"))
                        G.Type = row("Type")
                        G.Origross = IIf(row("Origross") Is DBNull.Value, 0.0, row("Origross"))
                        'TotalOrigross += G.Origross
                        G.Gross = IIf(row("Gross") Is DBNull.Value, 0.0, row("Gross"))
                        G.Boxnum = IIf(row("Boxnum") Is DBNull.Value, "0", row("Boxnum"))
                        G.Notes = IIf(row("Notes") Is DBNull.Value, "", row("Notes"))
                        G.BoxCharge = IIf(row("BoxCharge") Is DBNull.Value, 0.0, row("BoxCharge"))
                        G.Adjust = IIf(row("Adjust") Is DBNull.Value, 0.0, row("Adjust"))
                        G.Freight = IIf(row("Freight") Is DBNull.Value, 0.0, row("Freight"))
                        G.Duties = IIf(row("Duties") Is DBNull.Value, 0.0, row("Duties"))
                        G.Fuel = IIf(row("Fuel") Is DBNull.Value, 0.0, row("Fuel"))
                        G.Fumigation = IIf(row("Fumigation") Is DBNull.Value, 0.0, row("Fumigation"))
                        G.Other = IIf(row("Other") Is DBNull.Value, 0.0, row("Other"))
                        G.Commission = IIf(row("Commission") Is DBNull.Value, 0.0, row("Commission"))
                        G.Packing = IIf(row("Packing") Is DBNull.Value, 0.0, row("Packing"))
                        G.Handling = IIf(row("Handling") Is DBNull.Value, 0.0, row("Handling"))
                        G.Cost = IIf(row("Cost") Is DBNull.Value, 0.0, row("Cost"))
                        G.Tax1 = IIf(row("Tax1") Is DBNull.Value, 0.0, row("Tax1"))
                        G.Tax2 = IIf(row("Tax2") Is DBNull.Value, 0.0, row("Tax2"))
                        G.Tax3 = IIf(row("Tax3") Is DBNull.Value, 0.0, row("Tax3"))
                        G.FuelPaid = IIf(row("FuelPaid") Is DBNull.Value, 0.0, row("FuelPaid"))
                        G.Boxes_rec = IIf(row("Boxes_rec") Is DBNull.Value, 0.0, row("Boxes_rec"))
                        G.TotalUnits = G.Boxes_rec * G.Units
                        G.Invoice = IIf(row("Invoice") Is DBNull.Value, "", row("Invoice"))
                        G.Price = IIf(row("Price") Is DBNull.Value, 0.0, row("Price"))
                        'G.Price = IIf(G.TotalUnits = 0, 0.0, G.Gross / G.TotalUnits)
                    Next
                End Using

            End Using
            Return G
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetGrowerDetailById")
            Return Nothing
        End Try
    End Function


    Public Shared Function SaveGrowerDetail(ByVal ID As String, ByVal Flower As String, ByVal FlowerName As String, ByVal Boxes As Integer, ByVal Boxes_rec As Integer,
                                            ByVal FBE As Decimal, ByVal Units As Integer, ByVal UOM As String, ByVal Adjust As Decimal,
                                            ByVal Freight As Decimal, ByVal Duties As Decimal, ByVal Fumigation As Decimal, ByVal Other As Decimal,
                                            ByVal Cost As Decimal, ByVal Price As Decimal,
                                            ByVal Invoice As String, ByVal Type As String, ByVal UserID As String,
                                            ByVal ReceivingDate As String, ByVal Awb As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New ManualPOHeader

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry As String = "update tblGrowerDetail set Boxes=@Boxes,Boxes_rec=@Boxes_rec,FBE=@FBE, Units=@Units, UOM=@UOM," +
                                    "Adjust=@Adjust, Freight=@Freight, Duties=@Duties, Fumigation=@Fumigation, Other=@Other," +
                                    "Cost=@Cost,Price=@Price,Invoice=@Invoice,Type=@Type, UpdatedUserID=@UserID,ReceivingDate=@ReceivingDate, Awb=@Awb where ID= @ID"

                Using cmd As New SqlCommand(qry, con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    'cmd.Parameters.AddWithValue("@Flower", Flower)
                    'cmd.Parameters.AddWithValue("@FlowerName", FlowerName)
                    cmd.Parameters.AddWithValue("@Boxes", Boxes)
                    cmd.Parameters.AddWithValue("@Boxes_rec", Boxes_rec)
                    cmd.Parameters.AddWithValue("@FBE", FBE)
                    cmd.Parameters.AddWithValue("@Units", Units)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    cmd.Parameters.AddWithValue("@Adjust", Adjust)
                    cmd.Parameters.AddWithValue("@Freight", Freight)
                    cmd.Parameters.AddWithValue("@Duties", Duties)
                    cmd.Parameters.AddWithValue("@Fumigation", Fumigation)
                    cmd.Parameters.AddWithValue("@Other", Other)
                    cmd.Parameters.AddWithValue("@Cost", Cost)
                    cmd.Parameters.AddWithValue("@Price", Price)
                    cmd.Parameters.AddWithValue("@Invoice", Invoice)
                    cmd.Parameters.AddWithValue("@Type", Type)
                    cmd.Parameters.AddWithValue("@UserID", UserID)
                    cmd.Parameters.AddWithValue("@ReceivingDate", ReceivingDate)
                    cmd.Parameters.AddWithValue("@Awb", Awb)
                    cmd.ExecuteNonQuery()
                    'Dim result As Integer = cmd.ExecuteScalar()


                    'For Update log
                    Dim loginuserdetails As New User
                    If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                        loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                        'If ID = 0 Then
                        '    Logs.Savelog(UserID, "Grower", "SaveGrowerDetail", "Added New Grower Report - " + ReportName + " [" + ReportNumber + "]", "Report - " + ReportName + " [" + ReportNumber + "]")
                        'Else
                        Logs.Savelog(UserID, "Grower", "SaveGrowerDetail", "Modified Grower Detail Report - " + ID.ToString(), "DetailID -" + ID.ToString())
                        ' End If
                    End If
                    Return "valid"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveGrowerDetail")
            Return "error"
        End Try

    End Function

    Public Shared Function LoadAllFarmByGrowerHeaderID(ByVal HeaderID As String, ByVal WhereCondition As String) As List(Of GrowerDetail)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of GrowerDetail)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Farm from vwGetGrowerFarmHeaderDetailWithFileName where HeaderID=@HeaderID " + WhereCondition, con)
                    cmd.Parameters.AddWithValue("@HeaderID", HeaderID)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New GrowerDetail
                        u.Farm = row("Farm")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadAllFarmByGrowerHeaderID")
            Return Nothing
        End Try
    End Function

    Public Shared Function SaveGrowerCgList(ByVal GrowerCgList As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("SpSaveGrowerCg", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@GrowerCgList", GrowerCgList.ToString())
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCategories")
            Return Nothing
        End Try
        Return ""
    End Function

    Public Shared Function UpdateGrowerDetailAdjustAmount(ByVal DetailID As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("SpUpdateGrowerDetailAdjustAmount", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@DetailID", DetailID)
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateGrowerDetailAdjustAmount")
            Return "error"
        End Try
        Return "success"
    End Function

    Public Shared Function ToggleGrowerInvoiceSelected(ByVal Selected As String, ByVal ID As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("update tblGrowerDetailByInvoice set IsVerified=@selected where ID=@ID", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@Selected", Selected)
                    cmd1.Parameters.AddWithValue("@ID", ID)
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ToggleGrowerInvoiceSelected")
            Return "error"
        End Try
        Return "success"
    End Function

    Public Shared Function SaveInvoiceUploadFiles(ByVal DetailID As String, ByVal InvFileName As String, fileType As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("Update tblGrowerDetailByInvoice set InvFileName=@InvFileName where ID=@DetailID", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@InvFileName", InvFileName)
                    cmd1.Parameters.AddWithValue("@DetailID", DetailID)
                    Dim result1 = cmd1.ExecuteScalar()
                    ' Return result1
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveInvoiceUploadFiles")
            Return "error"
        End Try
        ' Return "success"
    End Function

    Public Shared Function SaveFarmUploadFiles(ByVal HeaderID As String, ByVal Farm As String, ByVal FarmFileName As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("spSaveFarmUploadFiles", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@HeaderID", HeaderID)
                    cmd1.Parameters.AddWithValue("@Farm", Farm)
                    cmd1.Parameters.AddWithValue("@FarmFileName", FarmFileName)
                    Dim result1 As String = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
            'Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveFarmUploadFiles")
            Return "error"
        End Try
        ' Return "success"
    End Function

    ''' <summary>
    ''' Mani::10-OCT-2016
    ''' </summary>
    ''' <param name="HeaderID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeleteGrowerFarmByHeaderID(ByVal HeaderID As String, ByVal Farm As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim GrList As GrowerHeader = GrowerHeaders.GetGrowerHeaderById(HeaderID)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spDeleteGrowerFarmDetails", con)
                    cmd.Parameters.AddWithValue("@HeaderID", HeaderID)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.ExecuteNonQuery()
                End Using
                con.Close()
            End Using

            'For Update log
            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                Logs.Savelog(loginuserdetails.ID, "Grower", "DeleteGrowerFarmByHeaderID", "Deleted Farm " + Farm + " From Grower Report . Report#" + GrList.ReportNumber + " ReportName " + GrList.ReportName + "", HeaderID)
                ' End If
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteGrowerFarmByHeaderID")
            Return Nothing
        End Try

    End Function

    Public Shared Function ClearInvoiceNumberFortheFarmInGrowerReport(ByVal HeaderID As String, ByVal Farm As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Update tblGrowerDetail set Invoice=0 where HeaderID=@HeaderID And Farm=@Farm", con)
                    cmd.Parameters.AddWithValue("@HeaderID", HeaderID)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    cmd.CommandType = CommandType.Text
                    cmd.ExecuteNonQuery()
                End Using
                con.Close()
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in ClearInvoiceNumberFortheFarmInGrowerReport")
            Return Nothing
        End Try
    End Function


    ''' <summary>
    ''' Mani::05-JAN-2017
    ''' </summary>
    ''' <param name="HeaderID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function DeleteGrowerAWBByHeaderID(ByVal HeaderID As String, ByVal AWB As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim GrList As GrowerHeader = GrowerHeaders.GetGrowerHeaderById(HeaderID)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("delete from tblGrowerDetail where HeaderID=@HeaderID and Awb=@Awb", con)
                    cmd.Parameters.AddWithValue("@HeaderID", HeaderID)
                    cmd.Parameters.AddWithValue("@Awb", AWB)
                    cmd.CommandType = CommandType.Text
                    cmd.ExecuteNonQuery()
                End Using
                con.Close()
            End Using

            'For Update log
            Dim loginuserdetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                loginuserdetails = HttpContext.Current.Session("LoginUserDetails")
                Logs.Savelog(loginuserdetails.ID, "Grower", "DeleteGrowerAWBByHeaderID", "Deleted Awb " + AWB + " From Grower Report . Report#" + GrList.ReportNumber + " ReportName " + GrList.ReportName + "", HeaderID)
                ' End If
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteGrowerAWBByHeaderID")
            Return Nothing
        End Try

    End Function
    Public Shared Function GetRecalculateAllExpense() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spRecalculateAllExpense", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetRecalculateAllExpense")
            Throw ex
        End Try
    End Function

End Class

Public Class GrowerDetail

    Private _Farm As String
    Public Property Farm() As String
        Get
            Return _Farm
        End Get
        Set(ByVal value As String)
            _Farm = value
        End Set
    End Property

    Private _FarmName As String
    Public Property FarmName() As String
        Get
            Return _FarmName
        End Get
        Set(ByVal value As String)
            _FarmName = value
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

    Private _ReceivingDate As DateTime
    Public Property ReceivingDate() As DateTime
        Get
            Return _ReceivingDate
        End Get
        Set(value As DateTime)
            _ReceivingDate = value
        End Set
    End Property

    Private _Awb As String
    Public Property Awb() As String
        Get
            Return _Awb
        End Get
        Set(ByVal value As String)
            _Awb = value
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

    Private _FlowerName As String
    Public Property FlowerName() As String
        Get
            Return _FlowerName
        End Get
        Set(ByVal value As String)
            _FlowerName = value
        End Set
    End Property

    Private _Boxes As Integer
    Public Property Boxes() As Integer
        Get
            Return _Boxes
        End Get
        Set(value As Integer)
            _Boxes = value
        End Set
    End Property

    Private _Units As Integer
    Public Property Units() As Integer
        Get
            Return _Units
        End Get
        Set(value As Integer)
            _Units = value
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

    Private _Type As String
    Public Property Type() As String
        Get
            Return _Type
        End Get
        Set(ByVal value As String)
            _Type = value
        End Set
    End Property

    Private _Origross As Decimal
    Public Property Origross() As Decimal
        Get
            Return _Origross
        End Get
        Set(ByVal value As Decimal)
            _Origross = value
        End Set
    End Property

    Private _Gross As Decimal
    Public Property Gross() As Decimal
        Get
            Return _Gross
        End Get
        Set(ByVal value As Decimal)
            _Gross = value
        End Set
    End Property

    Private _BoxCharge As Decimal
    Public Property BoxCharge() As Decimal
        Get
            Return _BoxCharge
        End Get
        Set(ByVal value As Decimal)
            _BoxCharge = value
        End Set
    End Property

    Private _Adjust As Decimal
    Public Property Adjust() As Decimal
        Get
            Return _Adjust
        End Get
        Set(ByVal value As Decimal)
            _Adjust = value
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

    Private _Duties As Decimal
    Public Property Duties() As Decimal
        Get
            Return _Duties
        End Get
        Set(ByVal value As Decimal)
            _Duties = value
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

    Private _Fumigation As Decimal
    Public Property Fumigation() As Decimal
        Get
            Return _Fumigation
        End Get
        Set(ByVal value As Decimal)
            _Fumigation = value
        End Set
    End Property

    Private _Other As Decimal
    Public Property Other() As Decimal
        Get
            Return _Other
        End Get
        Set(ByVal value As Decimal)
            _Other = value
        End Set
    End Property

    Private _Commission As Decimal
    Public Property Commission() As Decimal
        Get
            Return _Commission
        End Get
        Set(ByVal value As Decimal)
            _Commission = value
        End Set
    End Property

    Private _Packing As Decimal
    Public Property Packing() As Decimal
        Get
            Return _Packing
        End Get
        Set(ByVal value As Decimal)
            _Packing = value
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

    Private _Cost As Decimal
    Public Property Cost() As Decimal
        Get
            Return _Cost
        End Get
        Set(ByVal value As Decimal)
            _Cost = value
        End Set
    End Property

    Private _Tax1 As Decimal
    Public Property Tax1() As Decimal
        Get
            Return _Tax1
        End Get
        Set(ByVal value As Decimal)
            _Tax1 = value
        End Set
    End Property

    Private _Tax2 As Decimal
    Public Property Tax2() As Decimal
        Get
            Return _Tax2
        End Get
        Set(ByVal value As Decimal)
            _Tax2 = value
        End Set
    End Property

    Private _Tax3 As Decimal
    Public Property Tax3() As Decimal
        Get
            Return _Tax3
        End Get
        Set(ByVal value As Decimal)
            _Tax3 = value
        End Set
    End Property

    Private _FuelPaid As Decimal
    Public Property FuelPaid() As Decimal
        Get
            Return _FuelPaid
        End Get
        Set(ByVal value As Decimal)
            _FuelPaid = value
        End Set
    End Property

    Private _Boxes_rec As Decimal
    Public Property Boxes_rec() As Decimal
        Get
            Return _Boxes_rec
        End Get
        Set(ByVal value As Decimal)
            _Boxes_rec = value
        End Set
    End Property

    Private _Boxnum As String
    Public Property Boxnum() As String
        Get
            Return _Boxnum
        End Get
        Set(ByVal value As String)
            _Boxnum = value
        End Set
    End Property

    Private _Notes As String
    Public Property Notes() As String
        Get
            Return _Notes
        End Get
        Set(ByVal value As String)
            _Notes = value
        End Set
    End Property

    Private _FBE As Decimal
    Public Property FBE() As Decimal
        Get
            Return _FBE
        End Get
        Set(ByVal value As Decimal)
            _FBE = value
        End Set
    End Property

    Private _FlowerDetails As String
    Public Property FlowerDetails() As String
        Get
            Return _FlowerDetails
        End Get
        Set(ByVal Value As String)
            _FlowerDetails = Value
        End Set
    End Property

    Private _RECNO As Int32
    Public Property RECNO() As Int32
        Get
            Return _RECNO
        End Get
        Set(value As Int32)
            _RECNO = value
        End Set
    End Property

    Private _TotalUnits As Integer
    Public Property TotalUnits() As Integer
        Get
            Return _TotalUnits
        End Get
        Set(value As Integer)
            _TotalUnits = value
        End Set
    End Property

    Private _DetailID As Integer
    Public Property DetailID() As Integer
        Get
            Return _DetailID
        End Get
        Set(value As Integer)
            _DetailID = value
        End Set
    End Property

    Private _Invoice As String
    Public Property Invoice() As String
        Get
            Return _Invoice
        End Get
        Set(value As String)
            _Invoice = value
        End Set
    End Property

    Private _FlowerCategory As String
    Public Property FlowerCategory() As String
        Get
            Return _FlowerCategory
        End Get
        Set(ByVal value As String)
            _FlowerCategory = value
        End Set
    End Property

    Private _NotesCount As String
    Public Property NotesCount() As String
        Get
            Return _NotesCount
        End Get
        Set(ByVal value As String)
            _NotesCount = value
        End Set
    End Property

    Private _NotesAmount As Decimal
    Public Property NotesAmount() As Decimal
        Get
            Return _NotesAmount
        End Get
        Set(ByVal value As Decimal)
            _NotesAmount = value
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

    Private _InvAmount As Decimal
    Public Property InvAmount() As Decimal
        Get
            Return _InvAmount
        End Get
        Set(ByVal value As Decimal)
            _InvAmount = value
        End Set
    End Property

    Private _HeaderID As Integer
    Public Property HeaderID() As Integer
        Get
            Return _HeaderID
        End Get
        Set(value As Integer)
            _HeaderID = value
        End Set
    End Property

    Private _InvoiceVerified As Boolean
    Public Property InvoiceVerified() As Boolean
        Get
            Return _InvoiceVerified
        End Get
        Set(value As Boolean)
            _InvoiceVerified = value
        End Set
    End Property

    Private _InvFileName As String
    Public Property InvFileName() As String
        Get
            Return _InvFileName
        End Get
        Set(value As String)
            _InvFileName = value
        End Set
    End Property

    Private _FarmFileName As String
    Public Property FarmFileName() As String
        Get
            Return _FarmFileName
        End Get
        Set(value As String)
            _FarmFileName = value
        End Set
    End Property

    Private _FarmDetailID As Integer
    Public Property FarmDetailID() As Integer
        Get
            Return _FarmDetailID
        End Get
        Set(value As Integer)
            _FarmDetailID = value
        End Set
    End Property

    Private _FarmAirport As String
    Public Property FarmAirport() As String
        Get
            Return _FarmAirport
        End Get
        Set(value As String)
            _FarmAirport = value
        End Set
    End Property


    Private _FarmCountry As String
    Public Property FarmCountry() As String
        Get
            Return _FarmCountry
        End Get
        Set(value As String)
            _FarmCountry = value
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

    Private _TotalCost As Decimal
    Public Property TotalCost() As Decimal
        Get
            Return _TotalCost
        End Get
        Set(ByVal value As Decimal)
            _TotalCost = value
        End Set
    End Property

    Private _FBE_REC As Decimal
    Public Property FBE_REC() As Decimal
        Get
            Return _FBE_REC
        End Get
        Set(ByVal value As Decimal)
            _FBE_REC = value
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

    Private _GrowerLockContent As String
    Public Property GrowerLockContent() As String
        Get
            Return _GrowerLockContent
        End Get
        Set(ByVal value As String)
            _GrowerLockContent = value
        End Set
    End Property

    Private _FBE_Sold As Decimal
    Public Property FBE_Sold() As Decimal
        Get
            Return _FBE_Sold
        End Get
        Set(ByVal value As Decimal)
            _FBE_Sold = value
        End Set
    End Property

End Class
