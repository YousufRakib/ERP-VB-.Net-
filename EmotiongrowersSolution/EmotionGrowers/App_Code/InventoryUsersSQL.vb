
Imports System.Data.SqlClient
Imports System.Data

Namespace DAO

    Public Class InventoryUsersSQL

        Public Shared Function SaveInventoryUsersHeader(ByVal UserNo As String, ByVal AWB As String, ByVal DateRec As String,
        ByVal Handling As String, ByVal FBE As String, ByVal FreightAmount As String, ByVal CreatedUserID As String, ByVal HeaderID As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SPSaveInventoryUsersHeader", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@UserNo", UserNo))
                        cmd.Parameters.Add(New SqlParameter("@AWB", AWB))
                        cmd.Parameters.Add(New SqlParameter("@DateRec", DateRec))
                        cmd.Parameters.Add(New SqlParameter("@Handling", Handling))
                        cmd.Parameters.Add(New SqlParameter("@FBE", FBE))
                        cmd.Parameters.Add(New SqlParameter("@FreightAmount", FreightAmount))
                        cmd.Parameters.Add(New SqlParameter("@CreatedUserID", CreatedUserID))
                        cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                        Dim Result = cmd.ExecuteScalar()
                        Return Result
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in AddInventoryUsersHeader")
                Return "error"
            End Try
        End Function

        ' <summary>
        ' Muthu Nivetha M :: 20Mar2020 :: Modified :: To save values of othercost,handling,duties/andean and landedcost while saving user inventory details
        ' </summary>
        Public Shared Function SaveInventoryUsersDetail(ByVal HeaderID As String, ByVal DetailID As String, ByVal Flower As String, ByVal Farm As String, ByVal UOM As String, ByVal ReceivedBoxes As String, ByVal SoldBoxes As String, ByVal UnitsPerBunch As String, ByVal UnitsPerBox As String, ByVal Cost As String, ByVal InvenType As String, ByVal Order As String, ByVal PO As String, ByVal CustNumber As String, ByVal Comments As String, ByVal BoxNumber As Integer, ByVal CreatedUserID As String, ByVal Type As String, ByVal Warehouse As String, ByVal BreakDown As String, ByVal OtherCost As Decimal, ByVal Handling As Decimal, ByVal Duties As Decimal, ByVal LandedCost As Decimal, Invoice As Integer, ByVal SellingPrice As Decimal, ByVal BRAND As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim ValidateStatus As String = ""
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using CmbValidate As New SqlCommand("spValidateSaveInventoryUser", con)
                        CmbValidate.CommandType = CommandType.StoredProcedure
                        CmbValidate.Parameters.AddWithValue("@HeaderID", HeaderID)
                        CmbValidate.Parameters.AddWithValue("@DetailID", DetailID)
                        CmbValidate.Parameters.AddWithValue("@BoxNumber", BoxNumber)
                        ValidateStatus = CmbValidate.ExecuteScalar()
                    End Using
                    If ValidateStatus = "Success" Then
                        Using cmd As New SqlCommand("SPSaveInventoryUsersDetail", con)
                            cmd.CommandType = CommandType.StoredProcedure
                            cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                            cmd.Parameters.Add(New SqlParameter("@DetailID", DetailID))
                            cmd.Parameters.Add(New SqlParameter("@Flower", Flower))
                            cmd.Parameters.Add(New SqlParameter("@Farm", Farm))
                            cmd.Parameters.Add(New SqlParameter("@UOM", UOM))
                            cmd.Parameters.Add(New SqlParameter("@ReceivedBoxes", ReceivedBoxes))
                            cmd.Parameters.Add(New SqlParameter("@SoldBoxes", SoldBoxes))
                            cmd.Parameters.Add(New SqlParameter("@UnitsPerBunch", UnitsPerBunch))
                            cmd.Parameters.Add(New SqlParameter("@UnitsPerBox", UnitsPerBox))
                            cmd.Parameters.Add(New SqlParameter("@Cost", Cost))
                            cmd.Parameters.Add(New SqlParameter("@InvenType", InvenType))
                            cmd.Parameters.Add(New SqlParameter("@Order", Order))
                            cmd.Parameters.Add(New SqlParameter("@PO", PO))
                            cmd.Parameters.Add(New SqlParameter("@CustNumber", CustNumber))
                            cmd.Parameters.Add(New SqlParameter("@Comments", Comments))
                            cmd.Parameters.Add(New SqlParameter("@CreatedUserID", CreatedUserID))
                            cmd.Parameters.Add(New SqlParameter("@BoxNumber", BoxNumber))
                            cmd.Parameters.Add(New SqlParameter("@Type", Type))
                            cmd.Parameters.Add(New SqlParameter("@Warehouse", Warehouse))
                            cmd.Parameters.Add(New SqlParameter("@Message1", BreakDown))
                            cmd.Parameters.Add(New SqlParameter("@g_Othercost", OtherCost))
                            cmd.Parameters.Add(New SqlParameter("@g_Handling", Handling))
                            cmd.Parameters.Add(New SqlParameter("@g_Landedcost", LandedCost))
                            cmd.Parameters.Add(New SqlParameter("@g_Andean", Duties))
                            cmd.Parameters.Add(New SqlParameter("@Invoice", Invoice))
                            cmd.Parameters.Add(New SqlParameter("@SellingPrice", SellingPrice))
                            cmd.Parameters.Add(New SqlParameter("@BRAND", BRAND))
                            cmd.ExecuteNonQuery()
                        End Using
                    End If
                End Using
                Return ValidateStatus
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in SaveInventoryUsersDetail")
                Return "error"
            End Try
        End Function

        ' <summary>
        ' MANI::01-AUG-2015::to get the InventoryUserHeader When edit
        ' </summary>
        ' <param name="ID"></param>
        ' <returns></returns>
        ' <remarks></remarks>
        Public Shared Function GetInventoryUsersHeaderByID(ByVal ID As String) As BO.InventoryUsersSQL
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim InvU As New BO.InventoryUsersSQL()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select * from tblInventoryUsersHeader where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.Add(New SqlParameter("@ID", ID))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataTable
                        da.Fill(ds)
                        For Each row In ds.Rows
                            InvU.HeaderID = row("ID")
                            InvU.AWB = Convert.ToString(row("AWB"))
                            InvU.DATEREC = Convert.ToDateTime(row("DATEREC")).ToString("MM/dd/yyyy")
                            InvU.UserFileNo = Convert.ToString(row("USERFILENO"))
                            InvU.Handling = Convert.ToDecimal(row("HANDLING"))
                            InvU.FBE = Convert.ToDecimal(row("TotalFBE"))
                            InvU.Freight = Convert.ToDecimal(row("FREIGHT"))
                        Next
                    End Using
                End Using
                Return InvU
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetInventoryUsersHeaderByID")
                Return Nothing
            End Try
        End Function

        ' <summary>
        ' Muthu Nivetha M :: 06Mar2020 :: Modified :: To get columns othercost,handling,duties/andean and landedcost 
        ' </summary>
        Public Shared Function GetInventoryUserDetailByID(ByVal ID As String) As BO.InventoryUsersSQL
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim u As New BO.InventoryUsersSQL
                Using Con As New SqlConnection(ConStr)
                    Con.Open()
                    Using cmd As New SqlCommand("select *,UNITS * CSREC As TotalUnits, (UNITS * CSREC) * COST TotalCOST from tblinventoryusersdetails where SQLID=@ID", Con)
                        cmd.Parameters.AddWithValue("ID", ID)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataTable
                        da.Fill(ds)
                        For Each row In ds.Rows
                            u.Farm = row("Farm")
                            u.Flower = row("Flower")
                            u.CAT = row("CAT")
                            u.FlowerName = row("Name")
                            u.CSREC = row("CSREC")
                            u.CSSOLD = row("CSSOLD")
                            u.UOM = row("UOM")
                            u.UnitsBunch = row("UNITSBUNCH")
                            u.Units = row("Units")
                            u.TotalUnits = row("TotalUnits")
                            u.Cost = row("Cost")
                            u.TotalCost = row("TotalCost")
                            u.Type = row("Flag")
                            u.CustNum = Convert.ToInt32(row("Cust"))
                            u.Comments = row("Comments")
                            u.BoxNumber = row("BoxNum")
                            u.PO = row("PO")
                            u.Invoice = row("Invoice")
                            u.AWB = row("Lot")
                            u.DATEREC = row("DateRec")
                            u.OrderNumber = row("Order")
                            u.InvenType = row("InvenType")
                            u.WH = row("WH")
                            u.BRAND = row("BRAND")
                            u.SellingPrice = IIf(IsDBNull(row("SELLINGPRICE")), 0, row("SELLINGPRICE"))
                            If Not IsDBNull(row("Message1")) Then
                                u.Message1 = row("Message1")
                            Else
                                u.Message1 = ""
                            End If
                            'Commented by Prashant on As 11th June 2020 For using the field of landedcost 
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
                        Next
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetInventoryUserDetailByID")
                Return Nothing
            End Try
        End Function


        ' <summary>
        ' </summary>
        ' <returns></returns>
        ' <remarks></remarks>
        Public Shared Function GetInventoryUserDetailsEitherByHeaderIDAndDetailID(ByVal HeaderID As String, ByVal DetailID As String) As List(Of BO.InventoryUsersSQL)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim IList As New List(Of BO.InventoryUsersSQL)
                Using Con As New SqlConnection(ConStr)
                    Con.Open()
                    Dim wherecondition As String = ""
                    If DetailID = 0 Then
                        wherecondition = " where HeaderID=@HeaderID"
                    Else
                        wherecondition = " where SQLID=@DetailID"
                    End If

                    Using cmd As New SqlCommand("select *,UNITS * CSREC As TotalUnits, (UNITS * CSREC) * COST TotalCOST from tblinventoryusersdetails " + wherecondition + "", Con)
                        cmd.Parameters.AddWithValue("HeaderID", HeaderID)
                        cmd.Parameters.AddWithValue("DetailID", DetailID)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataTable
                        da.Fill(ds)
                        For Each row In ds.Rows
                            Dim I As New BO.InventoryUsersSQL
                            I.Farm = row("Farm")
                            I.Flower = row("Flower")
                            I.CAT = row("CAT")
                            I.FlowerName = row("Name")
                            I.CSREC = row("CSREC")
                            I.CSSOLD = row("CSSOLD")
                            I.UOM = row("UOM")
                            I.UnitsBunch = row("UNITSBUNCH")
                            I.Units = row("Units")
                            I.TotalUnits = row("TotalUnits")
                            I.Cost = row("Cost")
                            I.TotalCost = row("TotalCost")
                            I.InvenType = row("Flag")
                            I.CustNum = Convert.ToInt32(row("Cust"))
                            I.Comments = row("Comments")
                            I.BoxNumber = row("BoxNum")
                            I.PO = row("PO")
                            I.Invoice = row("Invoice")
                            I.AWB = Convert.ToInt64(row("Lot"))
                            I.DATEREC = row("DateRec")
                            I.OrderNumber = row("Invoice")
                            I.Length = row("L")
                            I.Width = row("W")
                            I.Height = row("H")
                            IList.Add(I)
                        Next

                    End Using
                End Using
                Return IList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetInventoryUserDetailByID")
                Return Nothing
            End Try
        End Function



        ''' <summary>
        ''' </summary>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Shared Function GetInventoryUserDetailsByDetailIDs(ByVal IDs As String) As List(Of BO.InventoryUsersSQL)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim IList As New List(Of BO.InventoryUsersSQL)
                Using Con As New SqlConnection(ConStr)
                    Con.Open()


                    Using cmd As New SqlCommand("select *,UNITS * CSREC As TotalUnits, (UNITS * CSREC) * COST TotalCOST from tblinventoryusersdetails where SQLIDs in(@IDs)", Con)
                        cmd.Parameters.AddWithValue("IDs", IDs)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataTable
                        da.Fill(ds)
                        For Each row In ds.Rows
                            Dim I As New BO.InventoryUsersSQL
                            I.Farm = row("Farm")
                            I.Flower = row("Flower")
                            I.CAT = row("CAT")
                            I.FlowerName = row("Name")
                            I.CSREC = row("CSREC")
                            I.CSSOLD = row("CSSOLD")
                            I.UOM = row("UOM")
                            I.UnitsBunch = row("UNITSBUNCH")
                            I.Units = row("Units")
                            I.TotalUnits = row("TotalUnits")
                            I.Cost = row("Cost")
                            I.TotalCost = row("TotalCost")
                            I.InvenType = row("Flag")
                            I.CustNum = Convert.ToInt32(row("Cust"))
                            I.Comments = row("Comments")
                            I.BoxNumber = row("BoxNum")
                            I.PO = row("PO")
                            I.Invoice = row("Invoice")
                            I.AWB = Convert.ToInt64(row("Lot"))
                            I.DATEREC = row("DateRec")
                            I.OrderNumber = row("Invoice")
                            I.Length = row("L")
                            I.Width = row("W")
                            I.Height = row("H")
                            IList.Add(I)
                        Next

                    End Using
                End Using
                Return IList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetInventoryUserDetailsByDetailIDs")
                Return Nothing
            End Try
        End Function

        ''' <summary>
        ''' MANI::01-AUG-2015::Delete Inventory User Header By ID
        ''' </summary>
        ''' <param name="ID"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Shared Function DeleteInventoryUserHeader(ByVal ID As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("sptblinventoryUsersHeaderDelete", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@ID", ID))
                        cmd.ExecuteNonQuery()
                    End Using

                End Using
                Return "success"
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteInventoryUserHeader")
                Return "error"
            End Try
        End Function

        ''' <summary>
        ''' MANI::22-JAN-2018::Delete Inventory User Header By ID
        ''' </summary>
        ''' <param name="ID"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Shared Function DeleteInventoryUserDetail(ByVal ID As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    'Using cmd As New SqlCommand("delete from tblinventoryUsersDetails where SQLID=@ID", con)
                    Using cmd As New SqlCommand("sptblinventoryUsersDetailsDelete", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@ID", ID))
                        cmd.ExecuteNonQuery()
                    End Using
                End Using
                Return "success"
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteInventoryUserHeader")
                Return "error"
            End Try
        End Function


        '''' <summary>
        '''' MANI::30-JAN-2018::Transfer Inventoryuser data to inven files
        '''' </summary>
        '''' <param name="HeaderID"></param>
        '''' <returns></returns>
        '''' <remarks></remarks>
        'Public Shared Function TransferInventoryUserDetails(ByVal HeaderID As String) As String
        '    Try
        '        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        '        Using con As New SqlConnection(ConStr)
        '            con.Open()
        '            Using cmd As New SqlCommand("spTransferInventoryUserDetails", con)
        '                cmd.Parameters.AddWithValue("HeaderID", HeaderID)
        '                cmd.CommandType = CommandType.Text
        '                cmd.ExecuteNonQuery()
        '            End Using
        '        End Using
        '        Return "success"
        '    Catch ex As Exception
        '        ErrorLogs.LogException(ex, "Error in TransferInventoryUserDetails")
        '        Return "error"
        '    End Try
        'End Function

        Public Shared Function GetInventoryUsersHeaderFromSQLForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                 ByVal numberOfRows As Integer) As List(Of BO.InventoryUsersSQL)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of BO.InventoryUsersSQL)()


                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spInventoryUsersHeaderForFgrd]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)

                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.InventoryUsersSQL()
                            u.HeaderID = row("ID")
                            u.AWB = Convert.ToString(row("AWB"))
                            u.DATEREC = Convert.ToDateTime(row("DATEREC")).ToString("MM/dd/yyyy")
                            u.UserFileNo = Convert.ToString(row("USERFILENO"))
                            u.FBE = row("TotalFBE")
                            u.Boxes = row("TotalPieces")
                            uList.Add(u)
                        Next

                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetInventoryUsersHeaderFromSQLForFgrd")
                Return Nothing
            End Try
        End Function

        ''' <summary>
        ''' MANI::16-JAN-2018::For Get Inventory User Details on Selected Header
        ''' </summary>
        ''' <param name="whereClause"></param>
        ''' <param name="sortExp"></param>
        ''' <param name="startRowIndex"></param>
        ''' <param name="numberOfRows"></param>
        ''' <returns></returns>
        Public Shared Function GetInventoryUsersDetailsFromSQLForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                 ByVal numberOfRows As Integer) As List(Of BO.InventoryUsersSQL)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim ulist As New List(Of BO.InventoryUsersSQL)
                Using Con As New SqlConnection(ConStr)
                    Con.Open()

                    Dim Qry As String = ""

                    Using cmd As New SqlCommand("[spInventoryUsersDetailsForFgrd]", Con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataTable
                        da.Fill(ds)
                        Dim TotalCount As Integer = ds.Rows.Count
                        Dim TotalUnits As Integer = 0
                        Dim TotalBoxes As Integer = 0
                        Dim TotalCost As Decimal = 0
                        Dim TotalFBE As Decimal = 0
	            		Dim TotalLandedCost As Decimal = 0

                        If (ds.Rows.Count > 0) Then
                            TotalUnits = ds.Compute("Sum(TOTALUNITS)", "")
                            TotalBoxes = ds.Compute("Sum(CSREC)", "")
                            TotalCost = ds.Compute("Sum(TOTALCOST)", "")
		            	    TotalLandedCost = ds.Compute("Sum(TotalLandedCost)", "")
                        End If

                        Dim PagedDataSet As DataTable = Nothing

                        If TotalCount <> 0 And startRowIndex <> 0 Then
                            For Each row In ds.Rows
                                Dim u As New BO.InventoryUsersSQL
                                u.HeaderID = row("HeaderID")
                                u.DetailID = row("SQLID")
								u.WH = row("WH")
                                u.Farm = row("Farm")
                                u.Flower = row("Flower")
                                u.FlowerName = row("Name")
                                u.BGCOLOR = row("BGCOLOR")
                                u.FONTCOLOR = row("FONTCOLOR")
                                u.CSREC = row("CSREC")
                                u.UOM = row("UOM")
                                u.FBE = row("FBE")
                                TotalFBE += u.FBE
                                u.UnitsBunch = row("UNITSBUNCH")
                                u.Units = row("Units")
                                u.TotalUnits = row("TotalUnits")
                                u.Cost = row("Cost")
                                u.TotalCost = row("TotalCost")
                                u.InvenType = row("Flag")
                                u.CustNum = Convert.ToInt32(row("Cust"))
                                u.Comments = row("Comments")
                                u.BoxNumber = row("BoxNum")
                                u.PO = row("PO")
                                u.Invoice = row("Invoice")
                                u.AWB = row("Lot")
                                u.DATEREC = row("DateRec")
                                u.HeaderID = row("HeaderID")
								u.LandedCost = row("LANDEDCOST")
                                u.TotalLandedCost = row("TotalLandedCost")
                                ' u.TotalRows = TotalCount
                                ulist.Add(u)
                            Next
                        End If

                        Dim u1 As New BO.InventoryUsersSQL()
                        u1.WH = ""
                        u1.Farm = ""
                        u1.Flower = ""
                        u1.FlowerName = ""
                        u1.Flower = ""
                        u1.BGCOLOR = ""
                        u1.FONTCOLOR = ""
                        u1.CSREC = TotalBoxes
                        u1.UOM = ""
                        u1.FBE = TotalFBE
                        u1.UnitsBunch = ""
                        u1.Units = 0
                        u1.TotalUnits = TotalUnits
                        u1.Cost = 0
                        u1.TotalCost = TotalCost
                        u1.LandedCost = 0
                        u1.TotalLandedCost = TotalLandedCost
                        u1.InvenType = ""
                        u1.CustNum = 0
                        u1.Comments = ""
                        u1.BoxNumber = 0
                        u1.PO = ""
                        u1.Invoice = 0
                        u1.AWB = 0
                        u1.DATEREC = DateTime.Now.ToString()
                        'u1.TotalRows = TotalCount
                        ulist.Add(u1)


                    End Using
                End Using
                Return ulist
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetInventoryUsersDetailsFromSQLForFgrd")
                Return Nothing
            End Try

        End Function

        Public Shared Function GetLastInsertedInvoiceByHeaderID(ByVal HeaderID As String) As String
            Try
                Dim dt As New DataTable()
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetLastInsertedInvoiceByHeaderID", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                        Dim da As New SqlDataAdapter(cmd)
                        da.Fill(dt)
                    End Using
                End Using
                If dt.Rows.Count > 0 Then
                    Return dt.Rows(0)("INVOICE").ToString()
                Else
                    Return "0"
                End If
            Catch ex As Exception
                'ErrorLogs.LogException(ex, "Error in TransferInventoryUserDetails")
                'Return "error"
                Throw ex
            End Try
        End Function

        Public Shared Function TransferInventoryUserDetails(ByVal HeaderID As String, ByVal User As User) As DataTable
            Try
                Dim INVHist As String = ConfigurationManager.AppSettings("lTransferToHistory").ToString()
                Dim dt As New DataTable()
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spInvenTransferUserstoCooler", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                        cmd.Parameters.Add(New SqlParameter("@UserName", User.UserName))
                        cmd.Parameters.Add(New SqlParameter("@AddApp", "InventoryUsers"))
                        cmd.Parameters.Add(New SqlParameter("@INVHist", INVHist))
                        cmd.Parameters.Add(New SqlParameter("@UserID", User.ID))
                        Dim da As New SqlDataAdapter(cmd)
                        da.Fill(dt)
                    End Using
                End Using
                Return dt
            Catch ex As Exception
                'ErrorLogs.LogException(ex, "Error in TransferInventoryUserDetails")
                'Return "error"
                Throw ex
            End Try
        End Function

        Public Shared Function ValidateInventoryUserDetailsToTransfer(ByVal SelectedHeaders As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
                Dim SQLStr As String
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmdValidate As New SqlCommand("spValidateInventoryUserTransferDetails", con)
                        cmdValidate.CommandType = CommandType.StoredProcedure
                        cmdValidate.Parameters.AddWithValue("@SelectedHeaders", SelectedHeaders)
                        SQLStr = cmdValidate.ExecuteScalar()
                    End Using
                End Using
                Return SQLStr
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error In Service :: ValidateInventoryUserDetailsToTransfer")
                Return Nothing
            End Try
        End Function

        Public Shared Function RecalculateInventoryCostUserDetails(ByVal HeaderID As String, ByVal User As User) As String
            Try
                Dim INVHist As String = ConfigurationManager.AppSettings("lTransferToHistory").ToString()
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SPReCalculateInventoryCostUsersDetail", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                        cmd.Parameters.Add(New SqlParameter("@UserName", User.UserName))
                        cmd.Parameters.Add(New SqlParameter("@AddApp", "InventoryUsers"))
                        cmd.Parameters.Add(New SqlParameter("@INVHist", INVHist))
                        cmd.Parameters.Add(New SqlParameter("@UserID", User.ID))
                        cmd.ExecuteNonQuery()
                    End Using
                End Using
                Return "Success"
            Catch ex As Exception
                Throw ex
            End Try
        End Function

    End Class

End Namespace

Namespace BO

    Public Class InventoryUsersSQL

        Private _HeaderID As Integer
        Public Property HeaderID() As Integer
            Get
                Return _HeaderID
            End Get
            Set(ByVal value As Integer)
                _HeaderID = value
            End Set
        End Property

        Private _DetailID As Integer
        Public Property DetailID() As Integer
            Get
                Return _DetailID
            End Get
            Set(ByVal value As Integer)
                _DetailID = value
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

        Private _DATEREC As String
        Public Property DATEREC() As String
            Get
                Return _DATEREC
            End Get
            Set(ByVal value As String)
                _DATEREC = value
            End Set
        End Property


        Private _OrderNumber As String
        Public Property OrderNumber() As String
            Get
                Return _OrderNumber
            End Get
            Set(ByVal value As String)
                _OrderNumber = value
            End Set
        End Property



        Private _UserFileNo As String
        Public Property UserFileNo() As String
            Get
                Return _UserFileNo
            End Get
            Set(ByVal value As String)
                _UserFileNo = value
            End Set
        End Property


        Private _Freight As String
        Public Property Freight() As String
            Get
                Return _Freight
            End Get
            Set(ByVal value As String)
                _Freight = value
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

        Private _FBE As String
        Public Property FBE() As String
            Get
                Return _FBE
            End Get
            Set(ByVal value As String)
                _FBE = value
            End Set
        End Property

        Private _Boxes As String
        Public Property Boxes() As String
            Get
                Return _Boxes
            End Get
            Set(ByVal value As String)
                _Boxes = value
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

        Private _Flower As String
        Public Property Flower() As String
            Get
                Return _Flower
            End Get
            Set(ByVal value As String)
                _Flower = value
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

        Private _BGCOLOR As String
        Public Property BGCOLOR() As String
            Get
                Return _BGCOLOR
            End Get
            Set(ByVal value As String)
                _BGCOLOR = value
            End Set
        End Property

        Private _FONTCOLOR As String
        Public Property FONTCOLOR() As String
            Get
                Return _FONTCOLOR
            End Get
            Set(ByVal value As String)
                _FONTCOLOR = value
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

        Private _CSREC As Integer
        Public Property CSREC() As Integer
            Get
                Return _CSREC
            End Get
            Set(ByVal value As Integer)
                _CSREC = value
            End Set
        End Property

        Private _CSSOLD As Integer
        Public Property CSSOLD() As Integer
            Get
                Return _CSSOLD
            End Get
            Set(ByVal value As Integer)
                _CSSOLD = value
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

        Private _UnitsBunch As String
        Public Property UnitsBunch() As String
            Get
                Return _UnitsBunch
            End Get
            Set(ByVal value As String)
                _UnitsBunch = value
            End Set
        End Property

        Private _Units As Integer
        Public Property Units() As Integer
            Get
                Return _Units
            End Get
            Set(ByVal value As Integer)
                _Units = value
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

        Private _Cost As Decimal
        Public Property Cost() As Decimal
            Get
                Return _Cost
            End Get
            Set(ByVal value As Decimal)
                _Cost = value
            End Set
        End Property

        Private _TotalCost As Decimal
        Public Property TotalCost() As Decimal
            Get
                Return _TotalCost
            End Get
            Set(value As Decimal)
                _TotalCost = value
            End Set
        End Property
		
		Private _LandedCost As String
        Public Property LandedCost() As String
            Get
                Return _LandedCost
            End Get
            Set(ByVal value As String)
                _LandedCost = value
            End Set
        End Property

        Private _TotalLandedCost As String
        Public Property TotalLandedCost() As String
            Get
                Return _TotalLandedCost
            End Get
            Set(ByVal value As String)
                _TotalLandedCost = value
            End Set
        End Property

        Private _InvenType As String
        Public Property InvenType() As String
            Get
                Return _InvenType
            End Get
            Set(ByVal value As String)
                _InvenType = value
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


        Private _CustNum As Integer
        Public Property CustNum() As Integer
            Get
                Return _CustNum
            End Get
            Set(ByVal value As Integer)
                _CustNum = value
            End Set
        End Property

        Private _Comments As String
        Public Property Comments() As String
            Get
                Return _Comments
            End Get
            Set(ByVal value As String)
                _Comments = value
            End Set
        End Property

        Private _BoxNumber As Integer
        Public Property BoxNumber() As Integer
            Get
                Return _BoxNumber
            End Get
            Set(ByVal value As Integer)
                _BoxNumber = value
            End Set
        End Property

        Private _PO As String
        Public Property PO() As String
            Get
                Return _PO
            End Get
            Set(ByVal value As String)
                _PO = value
            End Set
        End Property


        Private _Invoice As Integer
        Public Property Invoice() As Integer
            Get
                Return _Invoice
            End Get
            Set(ByVal value As Integer)
                _Invoice = value
            End Set
        End Property

        Private _Length As String
        Public Property Length() As String
            Get
                Return _Length
            End Get
            Set(ByVal value As String)
                _Length = value
            End Set
        End Property

        Private _Width As String
        Public Property Width() As String
            Get
                Return _Width
            End Get
            Set(ByVal value As String)
                _Width = value
            End Set
        End Property

        Private _Height As String
        Public Property Height() As String
            Get
                Return _Height
            End Get
            Set(ByVal value As String)
                _Height = value
            End Set
        End Property

        Private _Message1 As String
        Public Property Message1() As String
            Get
                Return _Message1
            End Get
            Set(ByVal value As String)
                _Message1 = value
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
        Private _OtherCost As Decimal
        Public Property OtherCost() As Decimal
            Get
                Return _OtherCost
            End Get
            Set(ByVal value As Decimal)
                _OtherCost = value
            End Set
        End Property
        Private _Andean As Decimal
        Public Property Andean As Decimal
            Get
                Return _Andean
            End Get
            Set(value As Decimal)
                _Andean = value
            End Set
        End Property

        Private _BRAND As String
        Public Property BRAND() As String
            Get
                Return _BRAND
            End Get
            Set(ByVal value As String)
                _BRAND = value
            End Set
        End Property

        Private _SellingPrice As Decimal
        Public Property SellingPrice As Decimal
            Get
                Return _SellingPrice
            End Get
            Set(value As Decimal)
                _SellingPrice = value
            End Set
        End Property

    End Class

End Namespace