Imports System.Data.SqlClient
Imports System.Data


Public Class SPORD

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
    ''' Muthu Nivetha M :: 11Feb2020 :: Modified :: To show the red icon is there is a hold,  (if hold > 0 ) no matter of the date of the hold
    ''' </summary>
    Public Function GetARINVSpordDetailsForCustomer(ByVal Customer As String, ByVal SPORDID As String, ByVal whereCondition As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal NumberofRows As Integer, ByVal Type As String) As List(Of SPORDD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SPORDD)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim SortByDatetime As String = "adddate desc,addtime desc"
                Using cmd As New SqlCommand("UDP_GETSPORDDetailsForCust", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    cmd.Parameters.AddWithValue("@SPORDID", SPORDID)
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereCondition))
                    cmd.Parameters.Add(New SqlParameter("@SortExpression", SortByDatetime))
                    cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                    cmd.Parameters.Add(New SqlParameter("@NoOfRows", NumberofRows))
                    cmd.Parameters.Add(New SqlParameter("@Type", If(Type = "", Type, If(Type.ToLower() = "U".ToLower(), "", Type))))
                    cmd.CommandTimeout = 1200

                    Using rdr As SqlDataReader = cmd.ExecuteReader()
                        While (rdr.Read())
                            Dim u As New SPORDD()
                            u.SpordID = rdr("SpordID")
                            u.Farm = IIf(rdr("Farm") Is DBNull.Value, "", rdr("Farm"))
                            u.Flower = IIf(rdr("Flower") Is DBNull.Value, "", rdr("Flower"))
                            u.FlowerName = IIf(rdr("FlowerName") Is DBNull.Value, "", rdr("FlowerName"))
                            u.Bgcolor = IIf(rdr("Bgcolor") Is DBNull.Value, "", rdr("Bgcolor"))
                            u.Fontcolor = IIf(rdr("Fontcolor") Is DBNull.Value, "", rdr("Fontcolor"))
                            u.Type = IIf(rdr("Type") Is DBNull.Value, "", rdr("Type"))
                            u.Status = IIf(rdr("Status") Is DBNull.Value, "", rdr("Status"))

                            'Set Day when Type of Repeat is Yes else Set Date
                            Dim isRepeatType = False
                            isRepeatType = IIf(rdr("Repeat") Is DBNull.Value, False, rdr("Repeat"))
                            'Shipdate
                            Dim dateExpiredDay = SetDateOrDayByOrderType(rdr("ShipDate"), rdr("ENDDATE"))
                            Dim dateExpiredDate = Convert.ToDateTime(rdr("ShipDate"), New System.Globalization.CultureInfo("en-US", True))
                            u.ShipDate = IIf(isRepeatType, dateExpiredDay, dateExpiredDate)
                            'CargoDate
                            dateExpiredDay = SetDateOrDayByOrderType(rdr("CargoDate"), rdr("ENDDATE"))
                            dateExpiredDate = Convert.ToDateTime(rdr("CargoDate"), New System.Globalization.CultureInfo("en-US", True))
                            u.CargoDate = IIf(isRepeatType, dateExpiredDay, dateExpiredDate)

                            u.DaysDiff = Convert.ToDateTime(rdr("ShipDate")).Subtract(rdr("CargoDate")).days.ToString()
                            u.Boxes = IIf(rdr("Boxes") Is DBNull.Value, "", rdr("Boxes"))
                            u.UOM = IIf(rdr("UOM") Is DBNull.Value, "", rdr("UOM"))
                            u.Units = IIf(rdr("UNITS") Is DBNull.Value, "", rdr("UNITS"))
                            u.Fob = IIf(rdr("Fob") Is DBNull.Value, 0.00, rdr("Fob"))
                            u.Cost = IIf(rdr("Cost") Is DBNull.Value, 0.00, rdr("Cost"))
                            u.WH = IIf(rdr("WH") Is DBNull.Value, "", rdr("WH"))
                            u.Carrier = IIf(rdr("Carrier") Is DBNull.Value, "", rdr("Carrier"))
                            u.Shipto = rdr("Shipto")
                            u.ShiptoName = IIf(rdr("SHIPTONAME") Is DBNull.Value, "", rdr("SHIPTONAME"))
                            u.ShipToAddress1 = IIf(rdr("SHIPTOADDRESS1") Is DBNull.Value, "", rdr("SHIPTOADDRESS1"))
                            u.ShipToCity = IIf(rdr("SHIPTOCITY") Is DBNull.Value, "", rdr("SHIPTOCITY"))
                            u.ShipToPhone = IIf(rdr("SHIPTOPHONE") Is DBNull.Value, "", rdr("SHIPTOPHONE"))
                            u.PO = rdr("PO")
                            u.BoxCode = IIf(rdr("BoxCode") Is DBNull.Value, "", rdr("BoxCode"))
                            u.UPC = IIf(rdr("UPC") Is DBNull.Value, "", rdr("UPC"))
                            u.DateCode = IIf(rdr("DateCode") Is DBNull.Value, "", rdr("DateCode"))
                            u.Carrier2 = IIf(rdr("Carrier2") Is DBNull.Value, "", rdr("Carrier2"))
                            u.SOLDAS = IIf(rdr("SOLDAS") Is DBNull.Value, "", rdr("SOLDAS"))
                            u.Shipped = IIf(rdr("Shipped") Is DBNull.Value, "", rdr("Shipped"))
                            u.Hold = IIf(rdr("Hold") Is DBNull.Value, 0, rdr("Hold"))

                            u.ADDUSER = IIf(rdr("ADDUSER") Is DBNull.Value, "", rdr("ADDUSER"))
                            If rdr("ADDDATE") Is DBNull.Value Then
                                u.ADDDATE = ""
                            Else
                                u.ADDDATE = Convert.ToDateTime(rdr("ADDDATE")).ToString("MM/dd/yyyy")
                            End If
                            u.ADDTIME = IIf(rdr("ADDTIME") Is DBNull.Value, "", rdr("ADDTIME"))
                            u.ADDAPP = IIf(rdr("ADDAPP") Is DBNull.Value, "", rdr("ADDAPP"))
                            u.UPDUSER = IIf(rdr("UPDUSER") Is DBNull.Value, "", rdr("UPDUSER"))
                            If rdr("UPDDATE") Is DBNull.Value Then
                                u.UPDDATE = ""
                            Else
                                u.UPDDATE = Convert.ToDateTime(rdr("UPDDATE")).ToString("MM/dd/yyyy")
                            End If
                            u.UPDTIME = IIf(rdr("UPDTIME") Is DBNull.Value, "", rdr("UPDTIME"))
                            u.UPDAPP = IIf(rdr("UPDAPP") Is DBNull.Value, "", rdr("UPDAPP"))
                            u.LOCKUSER = IIf(rdr("LOCKUSER") Is DBNull.Value, "", rdr("LOCKUSER"))
                            If rdr("LOCKDATE") Is DBNull.Value Then
                                u.LOCKDATE = ""
                            Else
                                u.LOCKDATE = Convert.ToDateTime(rdr("LOCKDATE")).ToString("MM/dd/yyyy")
                            End If
                            u.LOCKTIME = IIf(rdr("LOCKTIME") Is DBNull.Value, "", rdr("LOCKTIME"))
                            u.LOCKAPP = IIf(rdr("LOCKAPP") Is DBNull.Value, "", rdr("LOCKAPP"))

                            u.Order = IIf(rdr("Order") Is DBNull.Value, "", rdr("Order"))

                            If rdr("HoldFrom") Is DBNull.Value And rdr("HoldTo") Is DBNull.Value Then
                                u.HoldStatus = ""
                            Else
                                'Dim currentDate, HoldFromDate, HoldEnddate As New DateTime
                                ''currentDate = DateTime.Parse(Date.Now.ToString("MM/dd/yyyy"))
                                ''HoldFromDate = DateTime.Parse(rdr("HoldFrom")).ToString("MM/dd/yyyy")
                                ''HoldEnddate = DateTime.Parse(rdr("HoldTo")).ToString("MM/dd/yyyy")

                                'currentDate = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"), New System.Globalization.CultureInfo("en-US", True))
                                'HoldFromDate = Convert.ToDateTime(rdr("HoldFrom"))
                                'HoldEnddate = Convert.ToDateTime(rdr("HoldTo"))
                                'If (currentDate >= HoldFromDate And currentDate <= HoldEnddate) Then
                                '    u.HoldStatus = "Hold"
                                'Else
                                '    u.HoldStatus = "UnHold"
                                'End If
                                u.HoldStatus = "Hold"
                            End If
                            u.OrderTypes.Repeat = IIf(rdr("Repeat") Is DBNull.Value, False, rdr("Repeat"))
                            u.Agency = IIf(rdr("AGENCY") Is DBNull.Value, "", rdr("AGENCY"))
                            u.PODFlower = IIf(rdr("PODFlower") Is DBNull.Value, "", rdr("PODFlower"))
                            u.SPORDSqlId = IIf(rdr("SPORDSqlId") Is DBNull.Value, 0, rdr("SPORDSqlId"))
                            uList.Add(u)
                        End While
                        If rdr.NextResult() Then
                            While rdr.Read()
                                Me.TotalRows = rdr(0)
                            End While
                        End If
                    End Using
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetARINVSpordDetailsForCustomer")
            Throw ex
        End Try
    End Function

    Public Function GetPoqHistoryForF8(ByVal SPORDID As String) As List(Of SPORDD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SPORDD)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim SortByDatetime As String = "adddate desc,addtime desc"
                Using cmd As New SqlCommand("spGetPoqHistoryForF8", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@SPORDID", SPORDID)
                    Dim dr As SqlDataReader = cmd.ExecuteReader()
                    While (dr.Read())
                        Dim u As New SPORDD
                        u.Farm = dr("FARM")
                        u.PO = dr("PONUM")
                        u.ProdNameQ = dr("PRODNAMQ")
                        u.ColorCode = dr("COLORCODE")
                        u.ShipDate = dr("ShipDate")
                        u.Boxes = dr("QTYBOX")
                        u.UOM = dr("UOM")
                        u.QtyXBox = dr("QTYXBOX")
                        u.BoxNum = dr("BOXNUM")
                        u.QtyRecB = dr("QTYRECB")
                        u.UnitCosq = dr("UNITCOSQ")
                        u.UnitSalq = dr("UNITSALQ")
                        u.Customer = dr("CUSTOMER")
                        u.QtyBconf = dr("QTYBCONF")
                        u.Order2Id = dr("ORDER2ID")
                        u.SpordID = dr("SPORDID")
                        u.Id = dr("ID")
                        u.CommentQ = dr("COMMENTQ")
                        u.ProStatus = dr("PROSTATUS")
                        u.Market = dr("MARKET")
                        u.CustShDate = dr("CUSTSHDATE")
                        u.Awb = dr("AWB")
                        u.Order = dr("INVOICE")
                        uList.Add(u)
                    End While
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetPoqHistoryForF8")
            Throw ex
        End Try
    End Function

    Private Function SetDateOrDayByOrderType(ByVal shipdate As String, ByVal enddate As String) As String
        Dim getenddate = Convert.ToDateTime(enddate), currdate = Convert.ToDateTime(Now()), dateExpiredDay = "", result As Int16 = 0
        Dim firstDate As DateTime = New DateTime(getenddate.Year, getenddate.Month, getenddate.Day)
        Dim secondDate As DateTime = New DateTime(currdate.Year, currdate.Month, currdate.Day)
        result = DateTime.Compare(firstDate, secondDate)
        dateExpiredDay = If(result < 0, "EXPIRED", DateTime.Parse(shipdate).DayOfWeek.ToString())
        Return dateExpiredDay
    End Function

    Public Shared Function GetSPORDUserDetails(ByVal SpordID As String) As List(Of SPORDD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SPORDD)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Select ADDUSER,ADDDATE, ADDTIME, ADDAPP, UPDUSER, UPDDATE, UPDTIME, UPDAPP,LOCKUSER,LOCKDATE, LOCKTIME, LOCKAPP from F_SPORD where ID=@SpordID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@SpordID", SpordID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)

                    Using rdr As SqlDataReader = cmd.ExecuteReader()
                        While (rdr.Read())
                            Dim u As New SPORDD()
                            u.ADDUSER = IIf(rdr("ADDUSER") Is DBNull.Value, "", rdr("ADDUSER"))
                            If rdr("ADDDATE") Is DBNull.Value Then
                                u.ADDDATE = ""
                            Else
                                u.ADDDATE = Convert.ToDateTime(rdr("ADDDATE")).ToString("MM/dd/yyyy")
                            End If
                            u.ADDTIME = IIf(rdr("ADDTIME") Is DBNull.Value, "", rdr("ADDTIME"))
                            u.ADDAPP = IIf(rdr("ADDAPP") Is DBNull.Value, "", rdr("ADDAPP"))
                            u.UPDUSER = IIf(rdr("UPDUSER") Is DBNull.Value, "", rdr("UPDUSER"))
                            If rdr("UPDDATE") Is DBNull.Value Then
                                u.UPDDATE = ""
                            Else
                                u.UPDDATE = Convert.ToDateTime(rdr("UPDDATE")).ToString("MM/dd/yyyy")
                            End If
                            u.UPDTIME = IIf(rdr("UPDTIME") Is DBNull.Value, "", rdr("UPDTIME"))
                            u.UPDAPP = IIf(rdr("UPDAPP") Is DBNull.Value, "", rdr("UPDAPP"))
                            u.LOCKUSER = IIf(rdr("LOCKUSER") Is DBNull.Value, "", rdr("LOCKUSER"))
                            If rdr("LOCKDATE") Is DBNull.Value Then
                                u.LOCKDATE = ""
                            Else
                                u.LOCKDATE = Convert.ToDateTime(rdr("LOCKDATE")).ToString("MM/dd/yyyy")
                            End If
                            u.LOCKTIME = IIf(rdr("LOCKTIME") Is DBNull.Value, "", rdr("LOCKTIME"))
                            u.LOCKAPP = IIf(rdr("LOCKAPP") Is DBNull.Value, "", rdr("LOCKAPP"))

                            uList.Add(u)
                        End While
                    End Using
                End Using
            End Using

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetSPORDUserDetails")
            Throw ex
        End Try
    End Function
    ''' <summary>
    ''' Muthu Nivetha M :: 11Feb2020 :: Modified :: Changed loading F8Hold by F_SPORD.SqlId instead F_SPORD.Id due to empty in ID
    ''' </summary>
    Public Shared Function GetSPORDHoldDetails(ByVal SpordSqlID As String) As List(Of SPORDD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SPORDD)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UDP_GETSPORDHOLDDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@SpordSqlID", SpordSqlID)

                    Using rdr As SqlDataReader = cmd.ExecuteReader()
                        While (rdr.Read())
                            Dim u As New SPORDD()
                            u.Farm = IIf(rdr("Farm") Is DBNull.Value, "", rdr("Farm"))
                            u.Flower = IIf(rdr("Flower") Is DBNull.Value, "", rdr("Flower"))
                            u.Boxes = IIf(rdr("Boxes") Is DBNull.Value, "", rdr("Boxes"))
                            u.UOM = IIf(rdr("UOM") Is DBNull.Value, "", rdr("UOM"))
                            u.Units = IIf(rdr("Units") Is DBNull.Value, "", rdr("Units"))
                            u.UnitsBunch = IIf(rdr("UnitsBunch") Is DBNull.Value, 0, rdr("UnitsBunch"))
                            u.Fob = IIf(rdr("Fob") Is DBNull.Value, 0.00, rdr("Fob"))
                            If (rdr("FuelInclud") Is DBNull.Value) Then
                                u.FuelInclud = ""
                            Else
                                If (Convert.ToString(rdr("FuelInclud")) = "True") Then
                                    u.FuelInclud = "Y"
                                Else
                                    u.FuelInclud = "N"
                                End If
                            End If
                            'u.FuelInclud = IIf(rdr("FuelInclud") Is DBNull.Value, "", IIf(rdr("FuelInclud") = True, "Y", "N"))
                            u.Type = IIf(rdr("Type") Is DBNull.Value, "", rdr("Type"))
                            u.Status = IIf(rdr("Status") Is DBNull.Value, "", rdr("Status"))
                            u.Order = IIf(rdr("Order") Is DBNull.Value, "", rdr("Order"))

                            If rdr("ShipDate") Is DBNull.Value Then
                                u.ShipDate = ""
                            Else
                                u.ShipDate = Convert.ToDateTime(rdr("ShipDate")).ToString("MM/dd/yyyy")
                            End If

                            If rdr("Enddate") Is DBNull.Value Then
                                u.EndShipDate = ""
                            Else
                                u.EndShipDate = Convert.ToDateTime(rdr("Enddate")).ToString("MM/dd/yyyy")
                            End If

                            If rdr("Shipbogota") Is DBNull.Value Then
                                u.CargoDate = ""
                            Else
                                u.CargoDate = Convert.ToDateTime(rdr("Shipbogota")).ToString("MM/dd/yyyy")
                            End If

                            If rdr("Endshipbog") Is DBNull.Value Then
                                u.EndCargoDate = ""
                            Else
                                u.EndCargoDate = Convert.ToDateTime(rdr("Endshipbog")).ToString("MM/dd/yyyy")
                            End If

                            u.PO = IIf(rdr("PO") Is DBNull.Value, "", rdr("PO"))
                            u.BoxCode = IIf(rdr("BoxCode") Is DBNull.Value, "", rdr("BoxCode"))
                            u.Cost = IIf(rdr("Cost") Is DBNull.Value, 0.00, rdr("Cost"))
                            u.Carrier = IIf(rdr("Carrier") Is DBNull.Value, "", rdr("Carrier"))
                            u.Shipto = IIf(rdr("Shipto") Is DBNull.Value, "", rdr("Shipto"))
                            u.Hold = IIf(rdr("Hold") Is DBNull.Value, 0, rdr("Hold"))


                            If rdr("HoldFrom") Is DBNull.Value Then
                                u.HoldFrom = ""
                            Else
                                u.HoldFrom = Convert.ToDateTime(rdr("HoldFrom")).ToString("MM/dd/yyyy")
                            End If

                            If rdr("HoldTo") Is DBNull.Value Then
                                u.HoldTo = ""
                            Else
                                u.HoldTo = Convert.ToDateTime(rdr("HoldTo")).ToString("MM/dd/yyyy")
                            End If

                            If rdr("CargoHoldf") Is DBNull.Value Then
                                u.CargoHoldf = ""
                            Else
                                u.CargoHoldf = Convert.ToDateTime(rdr("CargoHoldf")).ToString("MM/dd/yyyy")
                            End If

                            If rdr("CargoHoldt") Is DBNull.Value Then
                                u.CargoHoldt = ""
                            Else
                                u.CargoHoldt = Convert.ToDateTime(rdr("CargoHoldt")).ToString("MM/dd/yyyy")
                            End If
                            u.FlowerName = IIf(rdr("FlowerName") Is DBNull.Value, 0, rdr("FlowerName"))
                            uList.Add(u)
                        End While
                    End Using
                End Using
            End Using

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetSPORDHoldDetails")
            Throw ex
        End Try
    End Function
    ''' <summary>
    ''' Muthu Nivetha M :: 11Feb2020 :: Modified :: Changed saving F8Hold by F_SPORD.SqlId instead F_SPORD.Id due to empty in ID
    ''' </summary>
    Public Shared Function SaveHoldDetails(ByVal BoxesHold As String, ByVal HoldFrom As String, ByVal HoldTo As String, ByVal CargoHoldf As String, ByVal CargoHoldt As String, ByVal SpordSqlID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UPDATE F_SPORD Set HOLD=@BoxesHold, HOLDFROM=@HoldFrom, HOLDTO=@HoldTo, CARGOHOLDF=@CargoHoldf, CARGOHOLDT=@CargoHoldt where SQLId=@SpordSqlID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@BoxesHold", BoxesHold)
                    cmd.Parameters.AddWithValue("@HoldFrom", HoldFrom)
                    cmd.Parameters.AddWithValue("@HoldTo", HoldTo)
                    cmd.Parameters.AddWithValue("@CargoHoldf", CargoHoldf)
                    cmd.Parameters.AddWithValue("@CargoHoldt", CargoHoldt)
                    cmd.Parameters.AddWithValue("@SpordSqlID", SpordSqlID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In SaveHoldDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCarrierDetails() As List(Of SPORDD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SPORDD)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("Select carrier, name from f_carrie where AIRLINE in ('A','T')  order by carrier"), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim dr As SqlDataReader = Cmd.ExecuteReader()
                    While (dr.Read())
                        Dim u As New SPORDD
                        u.CarrierCode = dr("CARRIER")
                        u.CarrierName = dr("Name")
                        uList.Add(u)
                    End While
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCarrierDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetStatusDetails() As List(Of SPORDD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SPORDD)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("Select status,[desc] from f_spstat order by status"), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim dr As SqlDataReader = Cmd.ExecuteReader()
                    While (dr.Read())
                        Dim u As New SPORDD
                        u.Status = dr("status")
                        u.StatusDesc = dr("desc")
                        uList.Add(u)
                    End While
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetStatusDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetShiptoDetails(ByVal Customer As String) As List(Of SPORDD)
        Try
            If (Customer = Nothing) Then
                Return Nothing
            End If
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SPORDD)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("Select shipto,Name from f_shipto where Customer='" + Customer + "' order by shipto"), Con)
                    Cmd.CommandType = CommandType.Text
                    Dim dr As SqlDataReader = Cmd.ExecuteReader()
                    While (dr.Read())
                        Dim u As New SPORDD
                        u.Shipto = dr("shipto")
                        u.ShiptoName = dr("Name")
                        uList.Add(u)
                    End While
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetShiptoDetails")
            Return Nothing
        End Try
    End Function


    ''' <summary>
    ''' ANITHA :: 05-FEB-2019 :: CHANGE THE OPEN QUERY INTO SP AND ADD TO SPORDTRANS TABLE
    ''' Muthu Nivetha M :: 11Feb2020 :: Modified :: Changed adding F8 by F_SPORD.SqlId instead F_SPORD.Id due to empty in ID
    ''' Muthu Nivetha M :: 11Feb2020 :: Modified :: To display desc 'Duplicate' when the F8 data gets duplicates
    ''' </summary>
    Public Shared Function SaveSPORDDetails(ByVal Customer As Integer, ByVal Farm As String, ByVal Flower As String, ByVal FlowerName As String, ByVal BreakDown As String, ByVal Qty As Integer, ByVal UOM As String, ByVal Units As Integer, ByVal Bunch As Integer, ByVal FOB As Decimal, ByVal Type As String, ByVal Status As String, ByVal Order As Integer, ByVal ShipDate As String, ByVal EndDate As String, ByVal GrowerDate As String, ByVal EndGrowerDate As String, ByVal CustPO As String, ByVal BoxCode As String, ByVal Cost As Decimal, ByVal PODFlower As String, ByVal Carrier As String, ByVal Shipto As Integer, ByVal CargoAgency As String, ByVal CommentsG As String, ByVal Comments As String, ByVal UPC As String, ByVal DateCode As String, ByVal UPCPrice As String, ByVal UPCDesc As String, ByVal Sleeve As String, ByVal SleeveDesc As String, ByVal Food As String, ByVal FoodDesc As String, ByVal Pick As String, ByVal PickDesc As String, ByVal Warehouse As String, ByVal Username As String, ByVal SoldAs As String, ByVal F8TransAllowView As Boolean, ByVal F8TransSlsman As String, ByVal CreateDuplicateRecord As Boolean) As String
        Try
            If (Username.Length < 20) Then
                Username = Username
            Else
                Username = Username.Substring(0, 20)
            End If

            Dim SpordSqlId As String = "0"
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sql = "[SPINSERTSPORDDETAILS]"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Clear()
                    cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    cmd.Parameters.AddWithValue("@FARM", Farm)
                    cmd.Parameters.AddWithValue("@FLOWER", Flower)
                    cmd.Parameters.AddWithValue("@BOXES", Qty)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    cmd.Parameters.AddWithValue("@UNITS", Units)
                    cmd.Parameters.AddWithValue("@UNITSBUNCH", Bunch)
                    cmd.Parameters.AddWithValue("@FOB", FOB)
                    cmd.Parameters.AddWithValue("@TYPE", IIf(Type = "", "P", Type))
                    cmd.Parameters.AddWithValue("@STATUS", IIf(Status = "", "Pe", Status))
                    cmd.Parameters.AddWithValue("@Order", Order)
                    cmd.Parameters.AddWithValue("@SHIPDATE", ShipDate)
                    cmd.Parameters.AddWithValue("@ENDDATE", EndDate)
                    cmd.Parameters.AddWithValue("@SHIPBOGOTA", GrowerDate)
                    cmd.Parameters.AddWithValue("@ENDSHIPBOG", EndGrowerDate)
                    cmd.Parameters.AddWithValue("@PO", CustPO)
                    cmd.Parameters.AddWithValue("@BOXCODE", BoxCode)
                    cmd.Parameters.AddWithValue("@COST", Cost)
                    cmd.Parameters.AddWithValue("@PODFlower", PODFlower)
                    cmd.Parameters.AddWithValue("@CARRIER", Carrier)
                    cmd.Parameters.AddWithValue("@SHIPTO", Shipto)
                    cmd.Parameters.AddWithValue("@AGENCY", CargoAgency)
                    cmd.Parameters.AddWithValue("@COMMENTS", CommentsG)
                    cmd.Parameters.AddWithValue("@COMMENSINT", Comments)
                    cmd.Parameters.AddWithValue("@UPC", UPC)
                    cmd.Parameters.AddWithValue("@DATECODE", DateCode)
                    cmd.Parameters.AddWithValue("@UPCPrice", UPCPrice)
                    cmd.Parameters.AddWithValue("@UPCDESC", UPCDesc)
                    cmd.Parameters.AddWithValue("@SLEEVE", Sleeve)
                    cmd.Parameters.AddWithValue("@SLEEVEDESC", SleeveDesc)
                    cmd.Parameters.AddWithValue("@FOOD", Food)
                    cmd.Parameters.AddWithValue("@FOODDESC", FoodDesc)
                    cmd.Parameters.AddWithValue("@PICK", Pick)
                    cmd.Parameters.AddWithValue("@PICKDESC", PickDesc)
                    cmd.Parameters.AddWithValue("@WH", Warehouse)
                    cmd.Parameters.AddWithValue("@ADDUSER", Username)
                    cmd.Parameters.AddWithValue("@ADDDATE", DateTime.Now.ToString("MM/dd/yy"))
                    cmd.Parameters.AddWithValue("@ADDTIME", DateTime.Now.ToString("HH:mm:ss"))
                    cmd.Parameters.AddWithValue("@ADDAPP", "SPINSERTSPORDDETAILS")
                    cmd.Parameters.AddWithValue("@MESSAGE1", BreakDown)
                    cmd.Parameters.AddWithValue("@SoldAs", SoldAs)
                    cmd.Parameters.AddWithValue("@Allowview", F8TransAllowView)
                    cmd.Parameters.AddWithValue("@slsman", F8TransSlsman)
                    cmd.Parameters.AddWithValue("@IsDuplicate", CreateDuplicateRecord)
                    SpordSqlId = cmd.ExecuteScalar()
                End Using
            End Using
            Return SpordSqlId
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveSPORDDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function GetMaxSPORDId() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim res As String
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("Select max(ltrim(rtrim(ID))) ID from F_SPORD"), Con)
                    Cmd.CommandType = CommandType.Text
                    res = Cmd.ExecuteScalar()
                End Using
            End Using
            Return res
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetMaxSPORDId")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetSPORDEditDetails(ByVal SpordID As String) As List(Of SPORDD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SPORDD)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetSPORDEditDetails", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@SpordID", SpordID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)

                    Using rdr As SqlDataReader = cmd.ExecuteReader()
                        While (rdr.Read())
                            Dim u As New SPORDD()
                            u.Farm = IIf(rdr("Farm") Is DBNull.Value, "", rdr("Farm"))
                            u.Flower = IIf(rdr("Flower") Is DBNull.Value, "", rdr("Flower"))
                            u.FlowerName = IIf(rdr("NAME") Is DBNull.Value, "", rdr("NAME"))
                            u.Boxes = IIf(rdr("Boxes") Is DBNull.Value, "", rdr("Boxes"))
                            u.UOM = IIf(rdr("UOM") Is DBNull.Value, "", rdr("UOM"))
                            u.Units = IIf(rdr("Units") Is DBNull.Value, "", rdr("Units"))
                            u.UnitsBunch = IIf(rdr("UnitsBunch") Is DBNull.Value, 0, rdr("UnitsBunch"))
                            u.Fob = IIf(rdr("Fob") Is DBNull.Value, 0.00, rdr("Fob"))
                            u.Type = IIf(rdr("Type") Is DBNull.Value, "", rdr("Type"))
                            u.Status = IIf(rdr("Status") Is DBNull.Value, "", rdr("Status"))
                            u.Order = IIf(rdr("Order") Is DBNull.Value, "", rdr("Order"))

                            If rdr("ShipDate") Is DBNull.Value Then
                                u.ShipDate = ""
                            Else
                                u.ShipDate = Convert.ToDateTime(rdr("ShipDate")).ToString("MM/dd/yyyy")
                            End If

                            If rdr("Enddate") Is DBNull.Value Then
                                u.EndShipDate = ""
                            Else
                                u.EndShipDate = Convert.ToDateTime(rdr("Enddate")).ToString("MM/dd/yyyy")
                            End If

                            If rdr("Shipbogota") Is DBNull.Value Then
                                u.CargoDate = ""
                            Else
                                u.CargoDate = Convert.ToDateTime(rdr("Shipbogota")).ToString("MM/dd/yyyy")
                            End If

                            If rdr("Endshipbog") Is DBNull.Value Then
                                u.EndCargoDate = ""
                            Else
                                u.EndCargoDate = Convert.ToDateTime(rdr("Endshipbog")).ToString("MM/dd/yyyy")
                            End If

                            u.PO = IIf(rdr("PO") Is DBNull.Value, "", rdr("PO"))
                            u.BoxCode = IIf(rdr("BoxCode") Is DBNull.Value, "", rdr("BoxCode"))
                            u.Cost = IIf(rdr("Cost") Is DBNull.Value, 0.00, rdr("Cost"))
                            u.PODFlower = IIf(rdr("PODFlower") Is DBNull.Value, "", rdr("PODFlower"))
                            u.Carrier = IIf(rdr("Carrier") Is DBNull.Value, "", rdr("Carrier"))
                            u.Shipto = IIf(rdr("Shipto") Is DBNull.Value, "", rdr("Shipto"))
                            u.Agency = IIf(rdr("AGENCY") Is DBNull.Value, "", rdr("AGENCY"))
                            u.COMMENTS = IIf(rdr("COMMENTS") Is DBNull.Value, "", rdr("COMMENTS"))
                            u.COMMENSINT = IIf(rdr("COMMENSINT") Is DBNull.Value, "", rdr("COMMENSINT"))
                            u.UPC = IIf(rdr("UPC") Is DBNull.Value, "", rdr("UPC"))
                            u.DateCode = IIf(rdr("DATECODE") Is DBNull.Value, "", rdr("DATECODE"))
                            'u.PRICE = IIf(rdr("PRICE") Is DBNull.Value, 0.00, rdr("PRICE"))
                            u.UPCPrice = IIf(rdr("UPCPrice") Is DBNull.Value, 0.00, rdr("UPCPrice"))
                            u.UPCDESC = IIf(rdr("UPCDESC") Is DBNull.Value, "", rdr("UPCDESC"))
                            u.SLEEVE = IIf(rdr("SLEEVE") Is DBNull.Value, "", rdr("SLEEVE"))
                            u.SLEEVEDESC = IIf(rdr("SLEEVEDESC") Is DBNull.Value, "", rdr("SLEEVEDESC"))
                            u.FOOD = IIf(rdr("FOOD") Is DBNull.Value, "", rdr("FOOD"))
                            u.FOODDESC = IIf(rdr("FOODDESC") Is DBNull.Value, "", rdr("FOODDESC"))
                            u.PICK = IIf(rdr("PICK") Is DBNull.Value, "", rdr("PICK"))
                            u.PICKDESC = IIf(rdr("PICKDESC") Is DBNull.Value, "", rdr("PICKDESC"))
                            u.WH = IIf(rdr("WH") Is DBNull.Value, "", rdr("WH"))
                            u.Message1 = IIf(rdr("Message1") Is DBNull.Value, "", rdr("Message1"))
                            u.COMMENTS2 = IIf(rdr("COMMENTS2") Is DBNull.Value, "", rdr("COMMENTS2"))
                            u.ORIGIN = IIf(rdr("CITY") Is DBNull.Value, "", rdr("CITY"))
                            u.FREIGHT = IIf(rdr("FREIGHT") Is DBNull.Value, "0.00", rdr("FREIGHT"))
                            u.HANDLING = IIf(rdr("HANDLING") Is DBNull.Value, "0.00", rdr("HANDLING"))
                            u.FBE = IIf(rdr("FBE") Is DBNull.Value, "0.00", rdr("FBE"))
                            u.SOLDAS = IIf(rdr("SOLDAS") Is DBNull.Value, "", rdr("SOLDAS"))
                            uList.Add(u)
                        End While
                    End Using
                End Using
            End Using

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSPORDEditDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function MoveSPORDDetailToAnoutherCustomer() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim res As String
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand(String.Format("Select max(ltrim(rtrim(ID))) ID from F_SPORD"), Con)
                    Cmd.CommandType = CommandType.Text
                    res = Cmd.ExecuteScalar()
                End Using
            End Using
            Return res
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetShiptoDetails")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 05-FEB-2019 :: CHANGE THE OPEN QUERY INTO SP AND ADD TO SPORDTRANS TABLE
    ''' Muthu Nivetha M :: 11Feb2020 :: Modified :: Changed updating F8 by F_SPORD.SqlId instead F_SPORD.Id due to empty in ID
    ''' </summary>
    Public Shared Function UpdateSPORDDetails(ByVal SpordSqlId As String, ByVal Customer As Integer, ByVal Farm As String, ByVal Flower As String, ByVal FlowerName As String, ByVal BreakDown As String, ByVal Qty As Integer, ByVal UOM As String, ByVal Units As Integer, ByVal Bunch As Integer, ByVal FOB As Decimal, ByVal Type As String, ByVal Status As String, ByVal Order As Integer, ByVal ShipDate As String, ByVal EndDate As String, ByVal GrowerDate As String, ByVal EndGrowerDate As String, ByVal CustPO As String, ByVal BoxCode As String, ByVal Cost As Decimal, ByVal PODFlower As String, ByVal Carrier As String, ByVal Shipto As Integer, ByVal CargoAgency As String, ByVal CommentsG As String, ByVal Comments As String, ByVal UPC As String, ByVal DateCode As String, ByVal UPCPrice As String, ByVal UPCDesc As String, ByVal Sleeve As String, ByVal SleeveDesc As String, ByVal Food As String, ByVal FoodDesc As String, ByVal Pick As String, ByVal PickDesc As String, ByVal Warehouse As String, ByVal Username As String, ByVal bitNewShip As Boolean, ByVal SoldAs As String, ByVal F8TransAllowView As Boolean, ByVal F8TransSlsman As String, ByVal F_SpordId As String) As String
        Try
            If (Username.Length < 20) Then
                Username = Username
            Else
                Username = Username.Substring(0, 20)
            End If
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sql = "[SPUPDATESPORDDETAILS]"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ID", F_SpordId)
                    cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    cmd.Parameters.AddWithValue("@FARM", Farm)
                    cmd.Parameters.AddWithValue("@FLOWER", Flower)
                    cmd.Parameters.AddWithValue("@BOXES", Qty)
                    cmd.Parameters.AddWithValue("@UOM", UOM)
                    cmd.Parameters.AddWithValue("@UNITS", Units)
                    cmd.Parameters.AddWithValue("@UNITSBUNCH", Bunch)
                    cmd.Parameters.AddWithValue("@FOB", FOB)
                    cmd.Parameters.AddWithValue("@TYPE", Type)
                    cmd.Parameters.AddWithValue("@STATUS", Status)
                    cmd.Parameters.AddWithValue("@Order", Order)
                    cmd.Parameters.AddWithValue("@SHIPDATE", ShipDate)
                    cmd.Parameters.AddWithValue("@ENDDATE", EndDate)
                    cmd.Parameters.AddWithValue("@SHIPBOGOTA", GrowerDate)
                    cmd.Parameters.AddWithValue("@ENDSHIPBOG", EndGrowerDate)
                    cmd.Parameters.AddWithValue("@PO", CustPO)
                    cmd.Parameters.AddWithValue("@BOXCODE", BoxCode)
                    cmd.Parameters.AddWithValue("@COST", Cost)
                    cmd.Parameters.AddWithValue("@PODFlower", PODFlower)
                    cmd.Parameters.AddWithValue("@CARRIER", Carrier)
                    cmd.Parameters.AddWithValue("@SHIPTO", Shipto)
                    cmd.Parameters.AddWithValue("@AGENCY", CargoAgency)
                    cmd.Parameters.AddWithValue("@COMMENTS", CommentsG)
                    cmd.Parameters.AddWithValue("@COMMENSINT", Comments)
                    cmd.Parameters.AddWithValue("@UPC", UPC)
                    cmd.Parameters.AddWithValue("@DATECODE", DateCode)
                    cmd.Parameters.AddWithValue("@UPCPrice", UPCPrice)
                    cmd.Parameters.AddWithValue("@UPCDESC", UPCDesc)
                    cmd.Parameters.AddWithValue("@SLEEVE", Sleeve)
                    cmd.Parameters.AddWithValue("@SLEEVEDESC", SleeveDesc)
                    cmd.Parameters.AddWithValue("@FOOD", Food)
                    cmd.Parameters.AddWithValue("@FOODDESC", FoodDesc)
                    cmd.Parameters.AddWithValue("@PICK", Pick)
                    cmd.Parameters.AddWithValue("@PICKDESC", PickDesc)
                    cmd.Parameters.AddWithValue("@WH", Warehouse)
                    cmd.Parameters.AddWithValue("@UPDUSER", Username)
                    cmd.Parameters.AddWithValue("@UPDDATE", DateTime.Now.ToString("MM/dd/yy"))
                    cmd.Parameters.AddWithValue("@UPDTIME", DateTime.Now.ToString("HH:mm:ss"))
                    cmd.Parameters.AddWithValue("@UPDAPP", "UPDATE_SPORD")
                    cmd.Parameters.AddWithValue("@MESSAGE1", BreakDown)
                    cmd.Parameters.AddWithValue("@SoldAs", SoldAs)
                    cmd.Parameters.AddWithValue("@Allowview", F8TransAllowView)
                    cmd.Parameters.AddWithValue("@slsman", F8TransSlsman)
                    cmd.Parameters.AddWithValue("@SpordSqlId", SpordSqlId)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return SpordSqlId
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateSPORDDetails")
            Throw ex
        End Try
    End Function
    ''' <summary>
    ''' Muthu Nivetha M :: 11Feb2020 :: Modified :: Changed deleting F8 by F_SPORD.SqlId instead F_SPORD.Id due to empty in ID
    ''' </summary>
    Public Shared Function DeleteSPORDDetails(ByVal SpordSqlID As String, ByVal Type As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sql = "DELETE FROM F_SPORD where SQLId=@SpordSqlID"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@SpordSqlID", SpordSqlID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteSPORDDetails")
            Throw ex
        End Try
    End Function



    Public Shared Function GetSPORDSODetailsForExcel() As List(Of SPORDD)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SPORDD)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SELECT FARM,DATENAME(DW, SHIPBOGOTA) SHIPBOGOTA,FLOWER, BOXES,ISNULL(UOM,'') UOM,UNITS, COST,ISNULL(UNITSBUNCH,0) UNITSBUNCH,ISNULL(PO,'') PO,ISNULL(CARRIER2,'') CARRIER2,ISNULL(COMMENTS,'') COMMENTS,ISNULL(PODFLOWER,'') PODFLOWER,ISNULL(ADDUSER,'') ADDUSER,ISNULL(FORMAT(ADDDATE,'MM/dd/yyyy'),'') ADDDATE,ISNULL(ADDTIME,'') ADDTIME FROM F_SPORD WHERE TYPE='S' ORDER BY FARM", con)
                    cmd.CommandType = CommandType.Text
                    Using rdr As SqlDataReader = cmd.ExecuteReader()
                        While (rdr.Read())
                            Dim u As New SPORDD()
                            u.Farm = IIf(rdr("Farm") Is DBNull.Value, "", rdr("Farm"))
                            u.CargoDay = rdr("SHIPBOGOTA")
                            u.Flower = IIf(rdr("Flower") Is DBNull.Value, "", rdr("Flower"))
                            u.Boxes = IIf(rdr("Boxes") Is DBNull.Value, "", rdr("Boxes"))
                            u.UOM = IIf(rdr("UOM") Is DBNull.Value, "", rdr("UOM"))
                            u.Units = IIf(rdr("Units") Is DBNull.Value, "", rdr("Units"))
                            u.Cost = IIf(rdr("Cost") Is DBNull.Value, 0.00, rdr("Cost"))
                            u.UnitsBunch = IIf(rdr("UnitsBunch") Is DBNull.Value, 0, rdr("UnitsBunch"))
                            u.PO = IIf(rdr("PO") Is DBNull.Value, "", rdr("PO"))
                            u.Carrier2 = IIf(rdr("Carrier2") Is DBNull.Value, "", rdr("Carrier2"))
                            u.COMMENTS = IIf(rdr("COMMENTS") Is DBNull.Value, "", rdr("COMMENTS"))
                            u.PODFlower = IIf(rdr("PODFlower") Is DBNull.Value, "", rdr("PODFlower"))
                            u.ADDUSER = rdr("ADDUSER")
                            u.ADDDATE = rdr("ADDDATE")
                            u.ADDTIME = rdr("ADDTIME")
                            uList.Add(u)
                        End While
                    End Using
                End Using
            End Using

            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSPORDSODetailsForExcel")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ANITHA :: 02-FEB-2019 :: VIEW SPORD TRANSACTION
    ''' </summary>
    ''' <returns></returns>
    Public Shared Function GetViewSPORDTransactionsGrid(ByVal customer As String, ByVal SpordSqlid As String, ByVal isfromf8 As String, ByVal slsman As String) As List(Of SPORDTRANS)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistspord As New List(Of SPORDTRANS)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spGetViewSPORDTransforGrid", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@customer", customer)
                    cmd.Parameters.AddWithValue("@SpordSqlid", SpordSqlid)
                    cmd.Parameters.AddWithValue("@isfromf8", isfromf8)
                    cmd.Parameters.AddWithValue("@slsman", slsman)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    Dim TotalCount As Integer = ds.Rows.Count
                    If TotalCount <> 0 Then
                        For Each row In ds.Rows
                            Dim u As New SPORDTRANS
                            u.ID = Convert.ToInt32(row("ID"))
                            u.TransType = row("TRANSTYPE")
                            u.CUSTOMER = Convert.ToInt32(row("CUSTOMER"))
                            u.SHIPDATE = Convert.ToDateTime(Convert.ToString(row("SHIPDATE")), New System.Globalization.CultureInfo("EN-US", True)).ToString("MM/dd/yyyy") 'Convert.ToString(row("SHIPDATE"))
                            u.ENDDATE = Convert.ToDateTime(Convert.ToString(row("ENDDATE")), New System.Globalization.CultureInfo("EN-US", True)).ToString("MM/dd/yyyy") 'Convert.ToString(row("ENDDATE"))
                            u.SHIPBOGOTA = Convert.ToDateTime(Convert.ToString(row("SHIPBOGOTA")), New System.Globalization.CultureInfo("EN-US", True)).ToString("MM/dd/yyyy") 'Convert.ToString(row("SHIPBOGOTA"))
                            u.ENDSHIPBOG = Convert.ToDateTime(Convert.ToString(row("ENDSHIPBOG")), New System.Globalization.CultureInfo("EN-US", True)).ToString("MM/dd/yyyy") 'Convert.ToString(row("ENDSHIPBOG"))
                            u.FARM = row("FARM")
                            u.FLOWER = row("FLOWER")
                            u.ProductName = row("PRODUCTNAME")
                            u.ORDER = row("ORDER")
                            u.BOXES = row("BOXES")
                            u.UNITS = Convert.ToInt32(row("UNITS"))
                            u.UOM = row("UOM")
                            u.STATUS = row("STATUS")
                            u.TYPE = row("TYPE")
                            u.COST = Convert.ToDecimal(row("COST"))
                            u.CARRIER = row("CARRIER")
                            If Convert.ToString(row("ADDDATE")) <> "" Then
                                u.ADDDATE = Convert.ToDateTime(Convert.ToString(row("ADDDATE")), New System.Globalization.CultureInfo("EN-US", True)).ToString("MM/dd/yyyy") 'CONVERT.TOSTRING(ROW("ADDDATE"))
                            Else
                                u.ADDDATE = "01/01/1900"
                            End If
                            u.ADDTIME = Convert.ToString(row("ADDTIME"))
                            u.ADDUSER = Convert.ToString(row("ADDUSER"))
                            u.ADDAPP = Convert.ToString(row("ADDAPP"))
                            u.FlowerDetails.FontColor = row("FontColor")
                            u.FlowerDetails.BGColor = row("BgColor")
                            u.PRICES = If(row("PRICE") Is DBNull.Value, Convert.ToDecimal(0.00), Convert.ToDecimal(row("PRICE")))
                            u.PO = If(row("PO") Is DBNull.Value, "", Convert.ToString(row("PO")))
                            u.BoxCode = If(row("BOXCODE") Is DBNull.Value, "", Convert.ToString(row("BOXCODE")))
                            u.UPC = If(row("UPC") Is DBNull.Value, "", Convert.ToString(row("UPC")))
                            u.DateCode = If(row("DATECODE") Is DBNull.Value, "", Convert.ToString(row("DATECODE")))
                            u.WH = If(row("WH") Is DBNull.Value, "", Convert.ToString(row("WH")))
                            u.Agency = If(row("AGENCY") Is DBNull.Value, "", Convert.ToString(row("AGENCY")))
                            u.Comments = If(row("COMMENTS") Is DBNull.Value, "", Convert.ToString(row("COMMENTS")))
                            u.Commensint = If(row("COMMENSINT") Is DBNull.Value, "", Convert.ToString(row("COMMENSINT")))
                            ulistspord.Add(u)
                        Next
                    End If
                End Using
            End Using
            Return ulistspord
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetViewSPORDTransactionsGrid")
            Return Nothing
        End Try
    End Function

    Public Shared Function FarmShipDateFromCustomerDate(ByVal ShippingDateToCustomer As String, ByVal FarmCode As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("spFarmShipDateFromCustomerDate", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@ShipdateToCustomer", Convert.ToDateTime(ShippingDateToCustomer).ToString("MM/dd/yyyy"))
                    cmd1.Parameters.AddWithValue("@Farmcode", FarmCode)
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in FarmShipDateFromCustomerDate")
            Return Nothing
        End Try
        Return ""
    End Function

#Region "SPORD PRICE"

    Public Shared Function GetViewSPORDByPriceGrid(ByVal customer As String) As List(Of SPORDPRICE)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistspord As New List(Of SPORDPRICE)()

            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spGetViewSPORDByPriceforGrid", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Customer", customer)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    Dim TotalCount As Integer = ds.Rows.Count
                    If TotalCount <> 0 Then
                        For Each row In ds.Rows
                            Dim u As New SPORDPRICE
                            u.ID = IIf(row("ID") Is DBNull.Value, 0, row("ID"))
                            u.CUSTOMER = IIf(row("CUSTOMER") Is DBNull.Value, 0, row("CUSTOMER"))
                            u.idproduct = IIf(row("idproduct") Is DBNull.Value, 0, row("idproduct"))
                            u.Quantity = IIf(row("Quantity") Is DBNull.Value, 0, row("Quantity"))
                            u.Uom = IIf(row("Uom") Is DBNull.Value, "", row("Uom"))
                            u.units = IIf(row("units") Is DBNull.Value, 0, row("units"))
                            u.unitsperbunch = IIf(row("unitsperbunch") Is DBNull.Value, "", row("unitsperbunch"))
                            u.Price = IIf(row("Price") Is DBNull.Value, 0.00, row("Price"))
                            u.soldas = IIf(row("soldas") Is DBNull.Value, "", row("soldas"))
                            u.UPC = IIf(row("UPC") Is DBNull.Value, "", row("UPC"))
                            u.BoxCode = IIf(row("BoxCode") Is DBNull.Value, "", row("BoxCode"))
                            u.GTIN = IIf(row("GTIN") Is DBNull.Value, "", row("GTIN"))
                            u.FlowerDetails.Flower = IIf(row("Code") Is DBNull.Value, "", row("Code"))
                            u.FlowerDetails.Name = IIf(row("desc") Is DBNull.Value, "", row("desc"))
                            u.FlowerDetails.BGColor = IIf(row("Bgcolor") Is DBNull.Value, "", row("Bgcolor"))
                            u.FlowerDetails.FontColor = IIf(row("Fontcolor") Is DBNull.Value, "", row("Fontcolor"))
                            ulistspord.Add(u)
                        Next
                    End If
                End Using
            End Using
            Return ulistspord
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetViewSPORDByPriceGrid")
            Return Nothing
        End Try
    End Function
    Public Shared Function SaveSPORDPRICEDetails(ByVal PCustomer As Integer, ByVal PFlower As Integer, ByVal PQTY As Integer, ByVal PUOM As String, ByVal PUnits As Integer, ByVal PBunch As Integer, ByVal PSoldas As String, ByVal PPrice As Decimal, ByVal PUPC As String, ByVal PBoxcode As String, ByVal PGTIN As String) As String
        Try
            Dim SPORID As String = "0"
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sql = "[SPINSERTSPORDPRICEDETAILS]"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Clear()
                    cmd.Parameters.AddWithValue("@CUSTOMER", PCustomer)
                    cmd.Parameters.AddWithValue("@FLOWERID", PFlower)
                    cmd.Parameters.AddWithValue("@QTY", PQTY)
                    cmd.Parameters.AddWithValue("@UOM", PUOM)
                    cmd.Parameters.AddWithValue("@UNITS", PUnits)
                    cmd.Parameters.AddWithValue("@UNITSBUNCH", PBunch)
                    cmd.Parameters.AddWithValue("@SOLDAS", PSoldas)
                    cmd.Parameters.AddWithValue("@PRICE", PPrice)
                    cmd.Parameters.AddWithValue("@UPC", PUPC)
                    cmd.Parameters.AddWithValue("@BOXCODE", PBoxcode)
                    cmd.Parameters.AddWithValue("@GTIN", PGTIN)
                    cmd.ExecuteNonQuery()
                End Using
                Using cmd As New SqlCommand("select top 1 LTRIM(RTRIM(ID)) from F_PRICES order by id desc", con)
                    cmd.CommandType = CommandType.Text
                    SPORID = cmd.ExecuteScalar()
                End Using
            End Using
            Return SPORID
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveSPORDPRICEDetails")
            Throw ex
        End Try
    End Function
    Public Shared Function UpdateSPORDPRICEDetails(ByVal SpordPriceID As String, ByVal PCustomer As Integer, ByVal PFlower As Integer, ByVal PQTY As Integer, ByVal PUOM As String, ByVal PUnits As Integer, ByVal PBunch As Integer, ByVal PSoldas As String, ByVal PPrice As Decimal, ByVal PUPC As String, ByVal PBoxcode As String, ByVal PGTIN As String) As String
        Try
            Dim SPORID As String = "0"
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sql = "[SPUPDATESPORDPRICEDETAILS]"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Clear()
                    cmd.Parameters.AddWithValue("@ID", SpordPriceID)
                    cmd.Parameters.AddWithValue("@CUSTOMER", PCustomer)
                    cmd.Parameters.AddWithValue("@FLOWERID", PFlower)
                    cmd.Parameters.AddWithValue("@QTY", PQTY)
                    cmd.Parameters.AddWithValue("@UOM", PUOM)
                    cmd.Parameters.AddWithValue("@UNITS", PUnits)
                    cmd.Parameters.AddWithValue("@UNITSBUNCH", PBunch)
                    cmd.Parameters.AddWithValue("@SOLDAS", PSoldas)
                    cmd.Parameters.AddWithValue("@PRICE", PPrice)
                    cmd.Parameters.AddWithValue("@UPC", PUPC)
                    cmd.Parameters.AddWithValue("@BOXCODE", PBoxcode)
                    cmd.Parameters.AddWithValue("@GTIN", PGTIN)
                    cmd.ExecuteNonQuery()
                End Using
                Using cmd As New SqlCommand("select top 1 LTRIM(RTRIM(ID)) from F_PRICES order by id desc", con)
                    cmd.CommandType = CommandType.Text
                    SPORID = cmd.ExecuteScalar()
                End Using
            End Using
            Return SPORID
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveSPORDPRICEDetails")
            Throw ex
        End Try
    End Function

    Public Shared Function GetSPORDEditPriceDetails(ByVal SpordID As String) As List(Of SPORDPRICE)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistspord As New List(Of SPORDPRICE)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SELECT f8price.*,FLOWER.FLOWER Code,FLOWER.NAME [desc] from F_PRICES  f8price LEFT JOIN F_FLOWER AS FLOWER ON FLOWER.FLOWER=f8price.Product where f8price.ID=@SpordID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@SpordID", SpordID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    Using rdr As SqlDataReader = cmd.ExecuteReader()
                        While (rdr.Read())
                            Dim u As New SPORDPRICE()
                            u.ID = IIf(rdr("ID") Is DBNull.Value, 0, rdr("ID"))
                            u.CUSTOMER = IIf(rdr("CUSTOMER") Is DBNull.Value, 0, rdr("CUSTOMER"))
                            u.idproduct = IIf(rdr("idproduct") Is DBNull.Value, 0, rdr("idproduct"))
                            u.Quantity = IIf(rdr("Quantity") Is DBNull.Value, 0, rdr("Quantity"))
                            u.Uom = IIf(rdr("Uom") Is DBNull.Value, "", rdr("Uom"))
                            u.units = IIf(rdr("units") Is DBNull.Value, 0, rdr("units"))
                            u.unitsperbunch = IIf(rdr("unitsperbunch") Is DBNull.Value, "", rdr("unitsperbunch"))
                            u.Price = IIf(rdr("Price") Is DBNull.Value, 0, rdr("Price"))
                            u.soldas = IIf(rdr("soldas") Is DBNull.Value, "", rdr("soldas"))
                            u.UPC = IIf(rdr("UPC") Is DBNull.Value, "", rdr("UPC"))
                            u.BoxCode = IIf(rdr("BoxCode") Is DBNull.Value, "", rdr("BoxCode"))
                            u.GTIN = IIf(rdr("GTIN") Is DBNull.Value, "", rdr("GTIN"))
                            u.FlowerDetails.Flower = IIf(rdr("Code") Is DBNull.Value, "", rdr("Code"))
                            u.FlowerDetails.Name = IIf(rdr("desc") Is DBNull.Value, "", rdr("desc"))
                            ulistspord.Add(u)
                        End While
                    End Using
                End Using
            End Using
            Return ulistspord
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSPORDEditPriceDetails")
            Throw ex
        End Try
    End Function
    Public Shared Function DeleteSPORDPRICEDetails(ByVal SpordID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sql = "DELETE FROM F_PRICES where ID=@SpordID"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@SpordID", SpordID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteSPORDPRICEDetails")
            Throw ex
        End Try
    End Function
    Public Shared Function LoadPricingDetailsForSelectedCust(ByVal SelectedCust As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim sql = "spLoadPricingDetailsForSelectedCust"
                Using cmd As New SqlCommand(sql, con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Clear()
                    cmd.Parameters.AddWithValue("@SelectedCust", SelectedCust)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadF3SalesDetailsForSelectedCust")
            Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in LoadF3SalesDetailsForSelectedCust")
            Return ""
        End Try
    End Function
#End Region
#Region "SPORD DOUBLES - CHECK"
    Public Shared Function CreateDoubleForF8(ByVal SPORDSqlIds As String, ByVal ShippingDate As String, ByVal Username As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("spCreateDoubleForF8", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@SpordSqlIds", SPORDSqlIds)
                    cmd1.Parameters.AddWithValue("@shippingDate", Convert.ToDateTime(ShippingDate).ToString("MM/dd/yyyy"))
                    cmd1.Parameters.AddWithValue("@User", Username)
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in CreateDoubleForF8")
            Return "error"
        End Try
    End Function
#End Region
End Class

Public Class SPORDD
    Private _ProdNameQ As String
    Public Property ProdNameQ() As String
        Get
            Return _ProdNameQ
        End Get
        Set(ByVal value As String)
            _ProdNameQ = value
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

    Private _CustShDate As String
    Public Property CustShDate() As String
        Get
            Return _CustShDate
        End Get
        Set(ByVal value As String)
            _CustShDate = value
        End Set
    End Property

    Private _Market As String
    Public Property Market() As String
        Get
            Return _Market
        End Get
        Set(ByVal value As String)
            _Market = value
        End Set
    End Property

    Private _ProStatus As String
    Public Property ProStatus() As String
        Get
            Return _ProStatus
        End Get
        Set(ByVal value As String)
            _ProStatus = value
        End Set
    End Property

    Private _CommentQ As String
    Public Property CommentQ() As String
        Get
            Return _CommentQ
        End Get
        Set(ByVal value As String)
            _CommentQ = value
        End Set
    End Property

    Private _Id As String
    Public Property Id() As String
        Get
            Return _Id
        End Get
        Set(ByVal value As String)
            _Id = value
        End Set
    End Property

    Private _Order2Id As String
    Public Property Order2Id() As String
        Get
            Return _Order2Id
        End Get
        Set(ByVal value As String)
            _Order2Id = value
        End Set
    End Property

    Private _QtyBconf As Integer
    Public Property QtyBconf() As Integer
        Get
            Return _QtyBconf
        End Get
        Set(ByVal value As Integer)
            _QtyBconf = value
        End Set
    End Property

    Private _Customer As String
    Public Property Customer() As String
        Get
            Return _Customer
        End Get
        Set(ByVal value As String)
            _Customer = value
        End Set
    End Property

    Private _UnitSalq As Decimal
    Public Property UnitSalq() As Decimal
        Get
            Return _UnitSalq
        End Get
        Set(ByVal value As Decimal)
            _UnitSalq = value
        End Set
    End Property

    Private _UnitCosq As Decimal
    Public Property UnitCosq() As Decimal
        Get
            Return _UnitCosq
        End Get
        Set(ByVal value As Decimal)
            _UnitCosq = value
        End Set
    End Property

    Private _QtyRecB As Integer
    Public Property QtyRecB() As Integer
        Get
            Return _QtyRecB
        End Get
        Set(ByVal value As Integer)
            _QtyRecB = value
        End Set
    End Property

    Private _BoxNum As String
    Public Property BoxNum() As String
        Get
            Return _BoxNum
        End Get
        Set(ByVal value As String)
            _BoxNum = value
        End Set
    End Property

    Private _QtyXBox As Integer
    Public Property QtyXBox() As Integer
        Get
            Return _QtyXBox
        End Get
        Set(ByVal value As Integer)
            _QtyXBox = value
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

    Private _PoDate As String
    Public Property PoDate() As String
        Get
            Return _PoDate
        End Get
        Set(ByVal value As String)
            _PoDate = value
        End Set
    End Property
    Private _SpordID As String
    Public Property SpordID() As String
        Get
            Return _SpordID
        End Get
        Set(ByVal value As String)
            _SpordID = value
        End Set
    End Property

    Private _SpordSqlId As Integer
    Public Property SPORDSqlId() As Integer
        Get
            Return _SpordSqlId
        End Get
        Set(ByVal value As Integer)
            _SpordSqlId = value
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

    Private _FlowerName As String
    Public Property FlowerName() As String
        Get
            Return _FlowerName
        End Get
        Set(ByVal value As String)
            _FlowerName = value
        End Set
    End Property

    Private _Fontcolor As String
    Public Property Fontcolor() As String
        Get
            Return _Fontcolor
        End Get
        Set(ByVal value As String)
            _Fontcolor = value
        End Set
    End Property

    Private _Bgcolor As String
    Public Property Bgcolor() As String
        Get
            Return _Bgcolor
        End Get
        Set(ByVal value As String)
            _Bgcolor = value
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

    Private _Status As String
    Public Property Status() As String
        Get
            Return _Status
        End Get
        Set(ByVal value As String)
            _Status = value
        End Set
    End Property

    Private _Order As String
    Public Property Order() As String
        Get
            Return _Order
        End Get
        Set(ByVal value As String)
            _Order = value
        End Set
    End Property

    Private _ShipDate As String
    Public Property ShipDate() As String
        Get
            Return _ShipDate
        End Get
        Set(ByVal value As String)
            _ShipDate = value
        End Set
    End Property

    Private _EndShipDate As String
    Public Property EndShipDate() As String
        Get
            Return _EndShipDate
        End Get
        Set(ByVal value As String)
            _EndShipDate = value
        End Set
    End Property

    Private _CargoDate As String
    Public Property CargoDate() As String
        Get
            Return _CargoDate
        End Get
        Set(ByVal value As String)
            _CargoDate = value
        End Set
    End Property

    Private _EndCargoDate As String
    Public Property EndCargoDate() As String
        Get
            Return _EndCargoDate
        End Get
        Set(ByVal value As String)
            _EndCargoDate = value
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

    Private _UOM As String
    Public Property UOM() As String
        Get
            Return _UOM
        End Get
        Set(ByVal value As String)
            _UOM = value
        End Set
    End Property

    Private _Units As String
    Public Property Units() As String
        Get
            Return _Units
        End Get
        Set(ByVal value As String)
            _Units = value
        End Set
    End Property

    Private _UnitsBunch As Integer
    Public Property UnitsBunch() As Integer
        Get
            Return _UnitsBunch
        End Get
        Set(ByVal value As Integer)
            _UnitsBunch = value
        End Set
    End Property

    Private _Fob As Decimal
    Public Property Fob() As Decimal
        Get
            Return _Fob
        End Get
        Set(ByVal value As Decimal)
            _Fob = value
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

    Private _BoxCode As String
    Public Property BoxCode() As String
        Get
            Return _BoxCode
        End Get
        Set(ByVal value As String)
            _BoxCode = value
        End Set
    End Property

    Private _UPC As String
    Public Property UPC() As String
        Get
            Return _UPC
        End Get
        Set(ByVal value As String)
            _UPC = value
        End Set
    End Property

    Private _DateCode As String
    Public Property DateCode() As String
        Get
            Return _DateCode
        End Get
        Set(ByVal value As String)
            _DateCode = value
        End Set
    End Property

    Private _Shipped As String
    Public Property Shipped() As String
        Get
            Return _Shipped
        End Get
        Set(ByVal value As String)
            _Shipped = value
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

    Private _WH As String
    Public Property WH() As String
        Get
            Return _WH
        End Get
        Set(ByVal value As String)
            _WH = value
        End Set
    End Property

    Private _Carrier As String
    Public Property Carrier() As String
        Get
            Return _Carrier
        End Get
        Set(ByVal value As String)
            _Carrier = value
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

    Private _SOLDAS As String
    Public Property SOLDAS() As String
        Get
            Return _SOLDAS
        End Get
        Set(ByVal value As String)
            _SOLDAS = value
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

    Private _UPDUSER As String
    Public Property UPDUSER() As String
        Get
            Return _UPDUSER
        End Get
        Set(ByVal value As String)
            _UPDUSER = value
        End Set
    End Property

    Private _UPDDATE As String
    Public Property UPDDATE() As String
        Get
            Return _UPDDATE
        End Get
        Set(ByVal value As String)
            _UPDDATE = value
        End Set
    End Property

    Private _UPDTIME As String
    Public Property UPDTIME() As String
        Get
            Return _UPDTIME
        End Get
        Set(value As String)
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

    Private _LOCKUSER As String
    Public Property LOCKUSER() As String
        Get
            Return _LOCKUSER
        End Get
        Set(ByVal value As String)
            _LOCKUSER = value
        End Set
    End Property

    Private _LOCKDATE As String
    Public Property LOCKDATE() As String
        Get
            Return _LOCKDATE
        End Get
        Set(ByVal value As String)
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

    Private _DaysDiff As String
    Public Property DaysDiff() As String
        Get
            Return _DaysDiff
        End Get
        Set(ByVal value As String)
            _DaysDiff = value
        End Set
    End Property

    Private _OrderTypes As New BO.OrderType
    Public Property OrderTypes() As BO.OrderType
        Get
            Return _OrderTypes
        End Get
        Set(ByVal value As BO.OrderType)
            _OrderTypes = value
        End Set
    End Property

    Default Public Property Item(propertyName As String) As Object
        Get
            Return Me.[GetType]().GetProperty(propertyName).GetValue(Me, Nothing)
        End Get
        Set
            Me.[GetType]().GetProperty(propertyName).SetValue(Me, Value, Nothing)
        End Set
    End Property

    Private _Hold As Integer
    Public Property Hold() As Integer
        Get
            Return _Hold
        End Get
        Set(value As Integer)
            _Hold = value
        End Set
    End Property

    Private _FuelInclud As String
    Public Property FuelInclud() As String
        Get
            Return _FuelInclud
        End Get
        Set(ByVal value As String)
            _FuelInclud = value
        End Set
    End Property

    Private _HoldFrom As String
    Public Property HoldFrom() As String
        Get
            Return _HoldFrom
        End Get
        Set(ByVal value As String)
            _HoldFrom = value
        End Set
    End Property

    Private _HoldTo As String
    Public Property HoldTo() As String
        Get
            Return _HoldTo
        End Get
        Set(ByVal value As String)
            _HoldTo = value
        End Set
    End Property

    Private _CargoHoldf As String
    Public Property CargoHoldf() As String
        Get
            Return _CargoHoldf
        End Get
        Set(ByVal value As String)
            _CargoHoldf = value
        End Set
    End Property

    Private _CargoHoldt As String
    Public Property CargoHoldt() As String
        Get
            Return _CargoHoldt
        End Get
        Set(ByVal value As String)
            _CargoHoldt = value
        End Set
    End Property

    Private _Shipto As String
    Public Property Shipto() As String
        Get
            Return _Shipto
        End Get
        Set(ByVal value As String)
            _Shipto = value
        End Set
    End Property

    Private _CarrierCode As String
    Public Property CarrierCode As String
        Get
            Return _CarrierCode
        End Get
        Set(value As String)
            _CarrierCode = value
        End Set
    End Property

    Private _CarrierName As String
    Public Property CarrierName As String
        Get
            Return _CarrierName
        End Get
        Set(value As String)
            _CarrierName = value
        End Set
    End Property

    Private _StatusDesc As String
    Public Property StatusDesc As String
        Get
            Return _StatusDesc
        End Get
        Set(value As String)
            _StatusDesc = value
        End Set
    End Property

    Private _PODFlower As String
    Public Property PODFlower As String
        Get
            Return _PODFlower
        End Get
        Set(value As String)
            _PODFlower = value
        End Set
    End Property

    Private _Agency As String
    Public Property Agency As String
        Get
            Return _Agency
        End Get
        Set(value As String)
            _Agency = value
        End Set
    End Property

    Private _COMMENTS As String
    Public Property COMMENTS As String
        Get
            Return _COMMENTS
        End Get
        Set(value As String)
            _COMMENTS = value
        End Set
    End Property

    Private _COMMENSINT As String
    Public Property COMMENSINT As String
        Get
            Return _COMMENSINT
        End Get
        Set(value As String)
            _COMMENSINT = value
        End Set
    End Property

    Private _PRICE As Decimal
    Public Property PRICE As Decimal
        Get
            Return _PRICE
        End Get
        Set(value As Decimal)
            _PRICE = value
        End Set
    End Property

    Private _UPCPrice As String
    Public Property UPCPrice As String
        Get
            Return _UPCPrice
        End Get
        Set(value As String)
            _UPCPrice = value
        End Set
    End Property

    Private _UPCDESC As String
    Public Property UPCDESC As String
        Get
            Return _UPCDESC
        End Get
        Set(value As String)
            _UPCDESC = value
        End Set
    End Property

    Private _SLEEVE As String
    Public Property SLEEVE As String
        Get
            Return _SLEEVE
        End Get
        Set(value As String)
            _SLEEVE = value
        End Set
    End Property

    Private _SLEEVEDESC As String
    Public Property SLEEVEDESC As String
        Get
            Return _SLEEVEDESC
        End Get
        Set(value As String)
            _SLEEVEDESC = value
        End Set
    End Property

    Private _FOOD As String
    Public Property FOOD As String
        Get
            Return _FOOD
        End Get
        Set(value As String)
            _FOOD = value
        End Set
    End Property

    Private _FOODDESC As String
    Public Property FOODDESC As String
        Get
            Return _FOODDESC
        End Get
        Set(value As String)
            _FOODDESC = value
        End Set
    End Property

    Private _PICK As String
    Public Property PICK As String
        Get
            Return _PICK
        End Get
        Set(value As String)
            _PICK = value
        End Set
    End Property

    Private _PICKDESC As String
    Public Property PICKDESC As String
        Get
            Return _PICKDESC
        End Get
        Set(value As String)
            _PICKDESC = value
        End Set
    End Property

    Private _ShiptoName As String
    Public Property ShiptoName As String
        Get
            Return _ShiptoName
        End Get
        Set(value As String)
            _ShiptoName = value
        End Set
    End Property

    Private _ShipToAddress1 As String
    Public Property ShipToAddress1 As String
        Get
            Return _ShipToAddress1
        End Get
        Set(value As String)
            _ShipToAddress1 = value
        End Set
    End Property

    Private _ShipToCity As String
    Public Property ShipToCity As String
        Get
            Return _ShipToCity
        End Get
        Set(value As String)
            _ShipToCity = value
        End Set
    End Property

    Private _ShipToPhone As String
    Public Property ShipToPhone As String
        Get
            Return _ShipToPhone
        End Get
        Set(value As String)
            _ShipToPhone = value
        End Set
    End Property

    Private _HoldStatus As String
    Public Property HoldStatus As String
        Get
            Return _HoldStatus
        End Get
        Set(value As String)
            _HoldStatus = value
        End Set
    End Property

    Private _CargoDay As String
    Public Property CargoDay As String
        Get
            Return _CargoDay
        End Get
        Set(value As String)
            _CargoDay = value
        End Set
    End Property

    Private _Message1 As String
    Public Property Message1 As String
        Get
            Return _Message1
        End Get
        Set(value As String)
            _Message1 = value
        End Set
    End Property
    Private _F8Selected As Boolean
    Public Property F8Selected() As Boolean
        Get
            Return _F8Selected
        End Get
        Set(ByVal value As Boolean)
            _F8Selected = value
        End Set
    End Property
    Private _COMMENTS2 As String
    Public Property COMMENTS2 As String
        Get
            Return _COMMENTS2
        End Get
        Set(value As String)
            _COMMENTS2 = value
        End Set
    End Property
    Private _FarmDetails As New Farm
    Public Property FarmDetails() As Farm
        Get
            Return _FarmDetails
        End Get
        Set(ByVal value As Farm)
            _FarmDetails = value
        End Set
    End Property
    Private _AirportDetails As New Airport
    Public Property AirportDetails() As Airport
        Get
            Return _AirportDetails
        End Get
        Set(ByVal value As Airport)
            _AirportDetails = value
        End Set
    End Property

    Private _CarrierDetails As New Carrier
    Public Property CarrierDetails() As Carrier
        Get
            Return _CarrierDetails
        End Get
        Set(ByVal value As Carrier)
            _CarrierDetails = value
        End Set
    End Property

    Private _FREIGHT As Decimal
    Public Property FREIGHT As Decimal
        Get
            Return _FREIGHT
        End Get
        Set(value As Decimal)
            _FREIGHT = value
        End Set
    End Property

    Private _HANDLING As Decimal
    Public Property HANDLING As Decimal
        Get
            Return _HANDLING
        End Get
        Set(value As Decimal)
            _HANDLING = value
        End Set
    End Property

    Private _ANDEN As Decimal
    Public Property ANDEN As Decimal
        Get
            Return _ANDEN
        End Get
        Set(value As Decimal)
            _ANDEN = value
        End Set
    End Property

    Private _ORIGIN As String
    Public Property ORIGIN() As String
        Get
            Return _ORIGIN
        End Get
        Set(ByVal value As String)
            _ORIGIN = value
        End Set
    End Property

    Private _FBE As Decimal
    Public Property FBE As Decimal
        Get
            Return _FBE
        End Get
        Set(value As Decimal)
            _FBE = value
        End Set
    End Property

    Private _UOMSize As String
    Public Property UOMSize As String
        Get
            Return _UOMSize
        End Get
        Set(value As String)
            _UOMSize = value
        End Set
    End Property

End Class

Public Class SPORDTRANS

    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Private _TransType As String
    Public Property TransType() As String
        Get
            Return _TransType
        End Get
        Set(ByVal value As String)
            _TransType = value
        End Set
    End Property

    Private _CUSTOMER As Integer
    Public Property CUSTOMER() As Integer
        Get
            Return _CUSTOMER
        End Get
        Set(ByVal value As Integer)
            _CUSTOMER = value
        End Set
    End Property

    Private _SHIPDATE As String
    Public Property SHIPDATE() As String
        Get
            Return _SHIPDATE
        End Get
        Set(ByVal value As String)
            _SHIPDATE = value
        End Set
    End Property

    Private _ENDDATE As String
    Public Property ENDDATE() As String
        Get
            Return _ENDDATE
        End Get
        Set(ByVal value As String)
            _ENDDATE = value
        End Set
    End Property

    Private _SHIPBOGOTA As String
    Public Property SHIPBOGOTA() As String
        Get
            Return _SHIPBOGOTA
        End Get
        Set(ByVal value As String)
            _SHIPBOGOTA = value
        End Set
    End Property

    Private _ENDSHIPBOG As String
    Public Property ENDSHIPBOG() As String
        Get
            Return _ENDSHIPBOG
        End Get
        Set(ByVal value As String)
            _ENDSHIPBOG = value
        End Set
    End Property

    Private _FARM As String
    Public Property FARM() As String
        Get
            Return _FARM
        End Get
        Set(ByVal value As String)
            _FARM = value
        End Set
    End Property

    Private _FLOWER As String
    Public Property FLOWER() As String
        Get
            Return _FLOWER
        End Get
        Set(ByVal value As String)
            _FLOWER = value
        End Set
    End Property

    Private _ProductName As String
    Public Property ProductName() As String
        Get
            Return _ProductName
        End Get
        Set(ByVal value As String)
            _ProductName = value
        End Set
    End Property

    Private _ORDER As Integer
    Public Property ORDER() As Integer
        Get
            Return _ORDER
        End Get
        Set(ByVal value As Integer)
            _ORDER = value
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


    Private _UNITS As Integer
    Public Property UNITS() As Integer
        Get
            Return _UNITS
        End Get
        Set(ByVal value As Integer)
            _UNITS = value
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

    Private _STATUS As String
    Public Property STATUS() As String
        Get
            Return _STATUS
        End Get
        Set(ByVal value As String)
            _STATUS = value
        End Set
    End Property

    Private _TYPE As String
    Public Property TYPE() As String
        Get
            Return _TYPE
        End Get
        Set(ByVal value As String)
            _TYPE = value
        End Set
    End Property

    Private _COST As Integer
    Public Property COST() As Integer
        Get
            Return _COST
        End Get
        Set(ByVal value As Integer)
            _COST = value
        End Set
    End Property

    Private _CARRIER As String
    Public Property CARRIER() As String
        Get
            Return _CARRIER
        End Get
        Set(ByVal value As String)
            _CARRIER = value
        End Set
    End Property

    Private _ADDUSER As String
    Public Property ADDUSER() As String
        Get
            Return _ADDUSER
        End Get
        Set(ByVal VALUE As String)
            _ADDUSER = VALUE
        End Set
    End Property

    Private _ADDDATE As String
    Public Property ADDDATE() As String
        Get
            Return _ADDDATE
        End Get
        Set(ByVal VALUE As String)
            _ADDDATE = VALUE
        End Set
    End Property

    Private _ADDTIME As String
    Public Property ADDTIME() As String
        Get
            Return _ADDTIME
        End Get
        Set(ByVal VALUE As String)
            _ADDTIME = VALUE
        End Set
    End Property

    Private _ADDAPP As String
    Public Property ADDAPP() As String
        Get
            Return _ADDAPP
        End Get
        Set(ByVal VALUE As String)
            _ADDAPP = VALUE
        End Set
    End Property

    Private _ErrorMessage As String
    Public Property ErrorMessage() As String
        Get
            Return _ErrorMessage
        End Get
        Set(ByVal value As String)
            _ErrorMessage = value
        End Set
    End Property

    Private _FlowerDetails As New BO.Flowers
    Public Property FlowerDetails() As BO.Flowers
        Get
            Return _FlowerDetails
        End Get
        Set(value As BO.Flowers)
            _FlowerDetails = value
        End Set
    End Property
    Private _PRICES As Decimal
    Public Property PRICES() As Decimal
        Get
            Return _PRICES
        End Get
        Set(ByVal value As Decimal)
            _PRICES = value
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
    Private _BoxCode As String
    Public Property BoxCode() As String
        Get
            Return _BoxCode
        End Get
        Set(ByVal value As String)
            _BoxCode = value
        End Set
    End Property
    Private _UPC As String
    Public Property UPC() As String
        Get
            Return _UPC
        End Get
        Set(ByVal value As String)
            _UPC = value
        End Set
    End Property
    Private _DateCode As String
    Public Property DateCode() As String
        Get
            Return _DateCode
        End Get
        Set(ByVal value As String)
            _DateCode = value
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
    Private _Agency As String
    Public Property Agency() As String
        Get
            Return _Agency
        End Get
        Set(ByVal value As String)
            _Agency = value
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
    Private _Commensint As String
    Public Property Commensint() As String
        Get
            Return _Commensint
        End Get
        Set(ByVal value As String)
            _Commensint = value
        End Set
    End Property
    Private _AllowView As Boolean
    Public Property AllowView() As Boolean
        Get
            Return _AllowView
        End Get
        Set(ByVal value As Boolean)
            _AllowView = value
        End Set
    End Property
    Private _SalesMan As String
    Public Property SalesMan() As String
        Get
            Return _SalesMan
        End Get
        Set(ByVal value As String)
            _SalesMan = value
        End Set
    End Property
End Class


Public Class SPORDPRICE

    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Private _CUSTOMER As Integer
    Public Property CUSTOMER() As Integer
        Get
            Return _CUSTOMER
        End Get
        Set(ByVal value As Integer)
            _CUSTOMER = value
        End Set
    End Property

    Private _idproduct As Integer
    Public Property idproduct() As Integer
        Get
            Return _idproduct
        End Get
        Set(ByVal value As Integer)
            _idproduct = value
        End Set
    End Property

    Private _Quantity As Integer
    Public Property Quantity() As Integer
        Get
            Return _Quantity
        End Get
        Set(ByVal value As Integer)
            _Quantity = value
        End Set
    End Property

    Private _Uom As String
    Public Property Uom() As String
        Get
            Return _Uom
        End Get
        Set(ByVal value As String)
            _Uom = value
        End Set
    End Property

    Private _units As Integer
    Public Property units() As Integer
        Get
            Return _units
        End Get
        Set(ByVal value As Integer)
            _units = value
        End Set
    End Property

    Private _unitsperbunch As Integer
    Public Property unitsperbunch() As Integer
        Get
            Return _unitsperbunch
        End Get
        Set(ByVal value As Integer)
            _unitsperbunch = value
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

    Private _soldas As String
    Public Property soldas() As String
        Get
            Return _soldas
        End Get
        Set(ByVal value As String)
            _soldas = value
        End Set
    End Property

    Private _UPC As String
    Public Property UPC() As String
        Get
            Return _UPC
        End Get
        Set(ByVal value As String)
            _UPC = value
        End Set
    End Property

    Private _BoxCode As String
    Public Property BoxCode() As String
        Get
            Return _BoxCode
        End Get
        Set(ByVal value As String)
            _BoxCode = value
        End Set
    End Property

    Private _GTIN As String
    Public Property GTIN() As String
        Get
            Return _GTIN
        End Get
        Set(ByVal value As String)
            _GTIN = value
        End Set
    End Property

    Private _ErrorMessage As String
    Public Property ErrorMessage() As String
        Get
            Return _ErrorMessage
        End Get
        Set(ByVal value As String)
            _ErrorMessage = value
        End Set
    End Property

    Private _FlowerDetails As New BO.Flowers
    Public Property FlowerDetails() As BO.Flowers
        Get
            Return _FlowerDetails
        End Get
        Set(value As BO.Flowers)
            _FlowerDetails = value
        End Set
    End Property

End Class

Public Interface ICustomParams_isTransviewForSingleF8
    Property isTransviewForSingleF8() As Boolean
End Interface
Public Interface ICustomParams_SpordSqlIdForTrans
    Property SpordSqlIdForTrans() As String
End Interface
Public Interface ICustomParams_isTranscalledbyF8
    Property isTranscalledbyF8() As Boolean
End Interface