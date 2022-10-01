Imports System.Data.SqlClient
Imports System.Data



Public Class Carriers

    Private _TotalRows As Integer
    Public Property TotalRows() As Integer
        Get
            Return _TotalRows
        End Get
        Set(ByVal value As Integer)
            _TotalRows = value
        End Set
    End Property

    Public Function GetCarrierListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of Carrier)

        Dim uList As New List(Of Carrier)()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spGetCarriers]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                    cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                    cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                    cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Carrier()
                        u.ID = row("ID")
                        u.Carrier = row("CARRIER")
                        u.Name = row("NAME")
                        u.Selected = False
                        If (row("Airline") = "A") Then
                            u.AirlineType = "Airline"
                        ElseIf (row("Airline") = "T") Then
                            u.AirlineType = "Truck"
                        ElseIf (row("Airline") = "B") Then
                            u.AirlineType = "Broker"
                        ElseIf (row("Airline") = "C") Then
                            u.AirlineType = "Cargo Agent"

                        ElseIf (row("Airline") = "Y") Then
                            u.AirlineType = "Airline"
                        ElseIf (row("Airline") = "N") Then
                            u.AirlineType = "Truck"
                        Else
                            u.AirlineType = "?    "
                        End If

                        u.ADDRESS1 = Convert.ToString(row("ADDRESS1"))
                        u.ADDRESS2 = Convert.ToString(row("ADDRESS2"))
                        u.ADDRESS3 = Convert.ToString(row("ADDRESS3"))
                        u.Selected = False
                        If (Convert.ToString(row("KOMETID")) = "" Or Convert.ToString(row("KOMETID")) = "0") Then
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
            ErrorLogs.LogException(ex, "Error in GetCarriersListForFgrd")
            Return Nothing
        End Try
        Return uList
    End Function
    Public Shared Function LoadCarrierForPOEdit(ByVal Airline As String) As List(Of Carrier)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim CarrieList As New List(Of Carrier)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from F_CARRIE where Airline IN(SELECT Item FROM dbo.ufn_CSV2Table('" + Airline + "',',')) ORDER BY CARRIER ASC", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim Carrie As New Carrier()
                        Carrie.ID = row("ID")
                        Carrie.Carrier = row("CARRIER")
                        Carrie.Name = row("NAME")
                        CarrieList.Add(Carrie)
                    Next
                End Using
            End Using
            Return CarrieList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadCarrierForPOEdit")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCarriersForDropdownList() As List(Of Carrier)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim CarrieList As New List(Of Carrier)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  CARRIER,NAME from F_CARRIE where carrier<>''  order by CARRIER", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim Carrie As New Carrier()
                        Carrie.Carrier = row("CARRIER")
                        Carrie.Name = row("NAME")
                        CarrieList.Add(Carrie)
                    Next
                End Using
            End Using
            Return CarrieList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadCarrierForPOEdit")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Mani:11/22/2018:Get Carrier list for autocomplete
    ''' </summary>
    ''' <param name="Searchtext"></param>
    ''' <returns></returns>
    Public Shared Function GetCarriersForAutocomplete(ByVal Searchtext As String) As List(Of Carrier)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim CarrieList As New List(Of Carrier)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  CARRIER,NAME from F_CARRIE where carrier<>'' and Carrier like '" + Searchtext + "%' or Name like '" + Searchtext + "%'   order by CARRIER", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@Searchtext", Searchtext)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim Carrie As New Carrier()
                        Carrie.Carrier = row("CARRIER")
                        Carrie.Name = row("NAME")
                        CarrieList.Add(Carrie)
                    Next
                End Using
            End Using
            Return CarrieList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCarriersForAutocomplete")
            Throw ex
        End Try
    End Function
    Public Shared Function GetCarrierFromExistingOrder(ByVal Order As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim CarrieList As New List(Of Carrier)()
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetCarrierFromExistingOrder", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ORDER", Order)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    result = dt.Rows(0)("CARRIER").ToString()
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCarrierFromExistingOrder")
            Return ""
        End Try
    End Function

    Public Shared Function GetCarriersbyCarrierForDropdownList(ByVal CarrierLst As String) As List(Of Carrier)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim CarrieList As New List(Of Carrier)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  CARRIER,NAME from F_CARRIE where carrier<>'' and CARRIER in(select s from dbo.CSV2Table('" + CarrierLst + "')) order by CARRIER", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim Carrie As New Carrier()
                        Carrie.Carrier = row("CARRIER")
                        Carrie.Name = row("NAME")
                        CarrieList.Add(Carrie)
                    Next
                End Using
            End Using
            Return CarrieList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCarriersbyCarrierForDropdownList")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCarriersForKometpost() As List(Of Carrier)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Carrier)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select  * from F_CARRIE where KOMETID='' or  KOMETID='0'", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    For Each row In ds.Tables(0).Rows
                        Dim u As New Carrier()
                        u.ID = row("ID")
                        u.Selected = False
                        u.Carrier = row("CARRIER")
                        u.Name = row("NAME")
                        uList.Add(u)
                    Next

                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCarriersForKometpost")
            Throw ex
        End Try
    End Function




    Public Shared Function UpdateKometID(ByVal KometID As String, ByVal CARRIER As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("Update F_CARRIE set KOMETID=@KometID where CARRIER=@CARRIER ", con)
                    cmd1.CommandType = CommandType.Text
                    cmd1.Parameters.AddWithValue("@CARRIER", CARRIER.ToString())
                    cmd1.Parameters.AddWithValue("@KometID", KometID.ToString())
                    Dim result1 = cmd1.ExecuteNonQuery()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCARRIERKometID")
            Return Nothing
        End Try
        Return ""
    End Function


    Public Shared Function DeleteCarrierbyID(ByVal ID As String) As String
        Try
            Dim u As New Flower
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("delete from  F_CARRIE where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteCarrierbyID")
            Return "error"
        End Try
    End Function

    Public Shared Function GetCarrierbyID(ByVal ID As String) As Carrier
        Try
            Dim u As New Carrier
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select *,IIF(LEN(CUTOFF)>=2,SUBSTRING(CUTOFF,1,2)+':'+SUBSTRING(CUTOFF,3,2),CUTOFF) MON, IIF(LEN(CUTOFF)>=2,SUBSTRING(CUTOFF,5,2)+':'+SUBSTRING(CUTOFF,7,2),CUTOFF) TUE, IIF(LEN(CUTOFF)>=2,SUBSTRING(CUTOFF,9,2)+':'+SUBSTRING(CUTOFF,11,2),CUTOFF) WED,IIF(LEN(CUTOFF)>=2,SUBSTRING(CUTOFF,13,2)+':'+SUBSTRING(CUTOFF,15,2),CUTOFF) THU, IIF(LEN(CUTOFF)>=2,SUBSTRING(CUTOFF,17,2)+':'+SUBSTRING(CUTOFF,19,2),CUTOFF) FRI, IIF(LEN(CUTOFF)>=2,SUBSTRING(CUTOFF,21,2)+':'+SUBSTRING(CUTOFF,23,2),CUTOFF) SAT, IIF(LEN(CUTOFF)>=2,SUBSTRING(CUTOFF,25,2)+':'+SUBSTRING(CUTOFF,27,2),CUTOFF) SUN from F_Carrie where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.ID = row("ID")
                        u.Carrier = row("Carrier")
                        u.Name = row("Name")

                        If (row("Airline") = "A") Then
                            u.AirlineType = "Airline"
                        ElseIf (row("Airline") = "T") Then
                            u.AirlineType = "Truck"
                        ElseIf (row("Airline") = "B") Then
                            u.AirlineType = "Broker"
                        ElseIf (row("Airline") = "C") Then
                            u.AirlineType = "Cargo Agent"

                        ElseIf (row("Airline") = "Y") Then
                            u.AirlineType = "Airline"
                        ElseIf (row("Airline") = "N") Then
                            u.AirlineType = "Truck"
                        Else
                            u.AirlineType = "?    "
                        End If

                        u.Airline = row("Airline")
                        u.CutOff = row("CutOff")
                        u.DelCharge = row("DelCharge")
                        u.Counter = row("Counter")
                        u.IATA = row("IATA")

                        If (IsDBNull(row("BEGAWB"))) Then
                            u.BEGAWB = 0
                        Else
                            u.BEGAWB = row("BEGAWB")
                        End If

                        If (IsDBNull(row("ENDAWB"))) Then
                            u.ENDAWB = 0
                        Else
                            u.ENDAWB = row("ENDAWB")
                        End If
                        u.FLOWSCR = row("FLOWSCR")
                        u.FLOWSCX = row("FLOWSCX")
                        u.INFPHONE = row("INFPHONE")
                        u.AWBPHONE = row("AWBPHONE")
                        u.CONTACT = row("CONTACT")
                        u.NEEDBOOK = row("NEEDBOOK")
                        u.PRINTER = row("PRINTER")
                        u.GENERIC = row("GENERIC")
                        If (IsDBNull(row("TWO_FORMS"))) Then
                            u.TWO_FORMS = ""
                        Else
                            u.TWO_FORMS = row("TWO_FORMS")
                        End If
                        u.ADDRESS1 = Convert.ToString(row("ADDRESS1"))
                        u.ADDRESS2 = Convert.ToString(row("ADDRESS2"))
                        u.ADDRESS3 = Convert.ToString(row("ADDRESS3"))
                        u.KometID = Convert.ToString(row("KOMETID"))

                        u.CutOffMon = Convert.ToString(row("MON"))
                        u.CutOffTue = Convert.ToString(row("TUE"))
                        u.CutOffWed = Convert.ToString(row("WED"))
                        u.CutOffThu = Convert.ToString(row("THU"))
                        u.CutOffFri = Convert.ToString(row("FRI"))
                        u.CutOffSat = Convert.ToString(row("SAT"))
                        u.CutOffSun = Convert.ToString(row("SUN"))
						u.IsAccount = row("IsAccount")
                        u.AccountLength = Convert.ToString(row("AccountLength"))
                        u.PALLETCHARGE = Convert.ToString(row("PALLETCHARGE"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCarrierbyID")
            Return Nothing
        End Try
    End Function

    Public Shared Function SaveCarriers(ByVal List As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("SpSaveCarriers", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@List", List.ToString())
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCarriers")
            Return Nothing
        End Try
        Return ""
    End Function

    Public Shared Function InsertCarriers(ByVal CARRIER As String, ByVal NAME As String, ByVal AIRLINE As String, ByVal CUTOFF As String,
    ByVal DELCHARGE As Double, ByVal COUNTER As Integer, ByVal IATA As String, ByVal BEGAWB As Integer, ByVal ENDAWB As Integer, ByVal FLOWSCR As String, ByVal FLOWSCX As String, ByVal INFPHONE As String,
    ByVal AWBPHONE As String, ByVal CONTACT As String, ByVal NEEDBOOK As String, ByVal PRINTER As String, ByVal GENERIC As String, ByVal TWO_FORMS As String,
    ByVal ADDRESS1 As String, ByVal ADDRESS2 As String, ByVal ADDRESS3 As String, ByVal ISACCOUNT As String, ByVal ACCOUNTLENGTH As String, ByVal PALLETCHARGE As Double) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim CarrierScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_CARRIEInsert", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure

            Cmd.Parameters.AddWithValue("@CARRIER", CARRIER)
            Cmd.Parameters.AddWithValue("@NAME", NAME)
            Cmd.Parameters.AddWithValue("@AIRLINE", AIRLINE)
            Cmd.Parameters.AddWithValue("@CUTOFF", CUTOFF)
            Cmd.Parameters.AddWithValue("@DELCHARGE", DELCHARGE)
            Cmd.Parameters.AddWithValue("@COUNTER", COUNTER)
            Cmd.Parameters.AddWithValue("@IATA", IATA)
            Cmd.Parameters.AddWithValue("@BEGAWB", BEGAWB)
            Cmd.Parameters.AddWithValue("@ENDAWB", ENDAWB)
            Cmd.Parameters.AddWithValue("@FLOWSCR", FLOWSCR)
            Cmd.Parameters.AddWithValue("@FLOWSCX", FLOWSCX)
            Cmd.Parameters.AddWithValue("@INFPHONE", INFPHONE)
            Cmd.Parameters.AddWithValue("@AWBPHONE", AWBPHONE)
            Cmd.Parameters.AddWithValue("@CONTACT", CONTACT)
            Cmd.Parameters.AddWithValue("@NEEDBOOK", NEEDBOOK)
            Cmd.Parameters.AddWithValue("@PRINTER", PRINTER)
            Cmd.Parameters.AddWithValue("@GENERIC", GENERIC)
            Cmd.Parameters.AddWithValue("@TWO_FORMS", TWO_FORMS)
            Cmd.Parameters.AddWithValue("@ADDRESS1", ADDRESS1)
            Cmd.Parameters.AddWithValue("@ADDRESS2", ADDRESS2)
            Cmd.Parameters.AddWithValue("@ADDRESS3", ADDRESS3)
            Cmd.Parameters.AddWithValue("@ISACCOUNT", ISACCOUNT)
            Cmd.Parameters.AddWithValue("@ACCOUNTLENGTH", ACCOUNTLENGTH)
            Cmd.Parameters.AddWithValue("@PALLETCHARGE", PALLETCHARGE)
            CarrierScopeID = Cmd.ExecuteScalar().ToString()

            Cmd.Dispose()
            SqlCon.Close()
            Dim CarrierDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                CarrierDetails = HttpContext.Current.Session("LoginUserDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                CarrierDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not CarrierDetails Is Nothing) Then
                Logs.Savelog(CarrierDetails.ID, "Users", "SaveCarrierDetails", "Added a new Carrier <b>" + NAME + "</b>", CarrierScopeID.ToString())
            End If
            Return CarrierScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in InsertCarriers")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function UpdateCarriers(ByVal ID As Integer, ByVal CARRIER As String, ByVal NAME As String, ByVal AIRLINE As String, ByVal CUTOFF As String,
    ByVal DELCHARGE As Double, ByVal COUNTER As Integer, ByVal IATA As String, ByVal BEGAWB As Integer, ByVal ENDAWB As Integer, ByVal FLOWSCR As String, ByVal FLOWSCX As String, ByVal INFPHONE As String,
    ByVal AWBPHONE As String, ByVal CONTACT As String, ByVal NEEDBOOK As String, ByVal PRINTER As String, ByVal GENERIC As String, ByVal TWO_FORMS As String,
    ByVal ADDRESS1 As String, ByVal ADDRESS2 As String, ByVal ADDRESS3 As String, ByVal ISACCOUNT As String, ByVal ACCOUNTLENGTH As String, ByVal PALLETCHARGE As Double) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim CarrierScopeID As String = ""
            Dim Cmd As New SqlCommand("sp_F_CARRIEUpdate", SqlCon)
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.AddWithValue("@ID", ID)
            Cmd.Parameters.AddWithValue("@CARRIER", CARRIER)
            Cmd.Parameters.AddWithValue("@NAME", NAME)
            Cmd.Parameters.AddWithValue("@AIRLINE", AIRLINE)
            Cmd.Parameters.AddWithValue("@CUTOFF", CUTOFF)
            Cmd.Parameters.AddWithValue("@DELCHARGE", DELCHARGE)
            Cmd.Parameters.AddWithValue("@COUNTER", COUNTER)
            Cmd.Parameters.AddWithValue("@IATA", IATA)
            Cmd.Parameters.AddWithValue("@BEGAWB", BEGAWB)
            Cmd.Parameters.AddWithValue("@ENDAWB", ENDAWB)
            Cmd.Parameters.AddWithValue("@FLOWSCR", FLOWSCR)
            Cmd.Parameters.AddWithValue("@FLOWSCX", FLOWSCX)
            Cmd.Parameters.AddWithValue("@INFPHONE", INFPHONE)
            Cmd.Parameters.AddWithValue("@AWBPHONE", AWBPHONE)
            Cmd.Parameters.AddWithValue("@CONTACT", CONTACT)
            Cmd.Parameters.AddWithValue("@NEEDBOOK", NEEDBOOK)
            Cmd.Parameters.AddWithValue("@PRINTER", PRINTER)
            Cmd.Parameters.AddWithValue("@GENERIC", GENERIC)
            Cmd.Parameters.AddWithValue("@TWO_FORMS", TWO_FORMS)
            Cmd.Parameters.AddWithValue("@ADDRESS1", ADDRESS1)
            Cmd.Parameters.AddWithValue("@ADDRESS2", ADDRESS2)
            Cmd.Parameters.AddWithValue("@ADDRESS3", ADDRESS3)
            Cmd.Parameters.AddWithValue("@ISACCOUNT", ISACCOUNT)
            Cmd.Parameters.AddWithValue("@ACCOUNTLENGTH", ACCOUNTLENGTH)
            Cmd.Parameters.AddWithValue("@PALLETCHARGE", PALLETCHARGE)
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            Dim CarrierDetails As New User
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                CarrierDetails = HttpContext.Current.Session("LoginUserDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                CarrierDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not CarrierDetails Is Nothing) Then
                Logs.Savelog(CarrierDetails.ID, "Users", "UpdateCarriers", "Added a new Carrier <b>" + NAME + "</b>", CarrierScopeID.ToString())
            End If
            Return CarrierScopeID
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in UpdateCarriers")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

End Class
Public Class Carrier
    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
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

    Private _Carrier As String
    Public Property Carrier() As String
        Get
            Return _Carrier
        End Get
        Set(ByVal value As String)
            _Carrier = value
        End Set
    End Property

    Private _Airline As String
    Public Property Airline() As String
        Get
            Return _Airline
        End Get
        Set(ByVal value As String)
            _Airline = value
        End Set
    End Property

    Private _AirlineType As String
    Public Property AirlineType() As String
        Get
            Return _AirlineType
        End Get
        Set(ByVal value As String)
            _AirlineType = value
        End Set
    End Property

    Private _CutOff As String
    Public Property CutOff() As String
        Get
            Return _CutOff
        End Get
        Set(ByVal value As String)
            _CutOff = value
        End Set
    End Property

    Private _CutOffMon As String
    Public Property CutOffMon() As String
        Get
            Return _CutOffMon
        End Get
        Set(ByVal value As String)
            _CutOffMon = value
        End Set
    End Property

    Private _CutOffTue As String
    Public Property CutOffTue() As String
        Get
            Return _CutOffTue
        End Get
        Set(ByVal value As String)
            _CutOffTue = value
        End Set
    End Property

    Private _CutOffWed As String
    Public Property CutOffWed() As String
        Get
            Return _CutOffWed
        End Get
        Set(ByVal value As String)
            _CutOffWed = value
        End Set
    End Property

    Private _CutOffThu As String
    Public Property CutOffThu() As String
        Get
            Return _CutOffThu
        End Get
        Set(ByVal value As String)
            _CutOffThu = value
        End Set
    End Property

    Private _CutOffFri As String
    Public Property CutOffFri() As String
        Get
            Return _CutOffFri
        End Get
        Set(ByVal value As String)
            _CutOffFri = value
        End Set
    End Property

    Private _CutOffSat As String
    Public Property CutOffSat() As String
        Get
            Return _CutOffSat
        End Get
        Set(ByVal value As String)
            _CutOffSat = value
        End Set
    End Property

    Private _CutOffSun As String
    Public Property CutOffSun() As String
        Get
            Return _CutOffSun
        End Get
        Set(ByVal value As String)
            _CutOffSun = value
        End Set
    End Property

    Private _DelCharge As Decimal
    Public Property DelCharge() As Decimal
        Get
            Return _DelCharge
        End Get
        Set(ByVal value As Decimal)
            _DelCharge = value
        End Set
    End Property

    Private _Counter As Integer
    Public Property Counter() As Integer
        Get
            Return _Counter
        End Get
        Set(ByVal value As Integer)
            _Counter = value
        End Set
    End Property

    Private _IATA As String
    Public Property IATA() As String
        Get
            Return _IATA
        End Get
        Set(ByVal value As String)
            _IATA = value
        End Set
    End Property

    Private _BEGAWB As Integer

    Public Property BEGAWB() As Integer
        Get
            Return _BEGAWB
        End Get
        Set(ByVal value As Integer)
            _BEGAWB = value
        End Set
    End Property

    Private _ENDAWB As Integer
    Public Property ENDAWB() As Integer
        Get
            Return _ENDAWB
        End Get
        Set(ByVal value As Integer)
            _ENDAWB = value
        End Set
    End Property

    Private _FLOWSCR As String
    Public Property FLOWSCR() As String
        Get
            Return _FLOWSCR
        End Get
        Set(ByVal value As String)
            _FLOWSCR = value
        End Set
    End Property

    Private _FLOWSCX As String
    Public Property FLOWSCX() As String
        Get
            Return _FLOWSCX
        End Get
        Set(ByVal value As String)
            _FLOWSCX = value
        End Set
    End Property

    Private _INFPHONE As String
    Public Property INFPHONE() As String
        Get
            Return _INFPHONE
        End Get
        Set(ByVal value As String)
            _INFPHONE = value
        End Set
    End Property

    Private _AWBPHONE As String
    Public Property AWBPHONE() As String
        Get
            Return _AWBPHONE
        End Get
        Set(ByVal value As String)
            _AWBPHONE = value
        End Set
    End Property

    Private _CONTACT As String
    Public Property CONTACT() As String
        Get
            Return _CONTACT
        End Get
        Set(ByVal value As String)
            _CONTACT = value
        End Set
    End Property

    Private _NEEDBOOK As Char
    Public Property NEEDBOOK() As Char
        Get
            Return _NEEDBOOK
        End Get
        Set(ByVal value As Char)
            _NEEDBOOK = value
        End Set
    End Property


    Private _PRINTER As String
    Public Property PRINTER() As String
        Get
            Return _PRINTER
        End Get
        Set(ByVal value As String)
            _PRINTER = value
        End Set
    End Property


    Private _GENERIC As String
    Public Property GENERIC() As String
        Get
            Return _GENERIC
        End Get
        Set(ByVal value As String)
            _GENERIC = value
        End Set
    End Property


    Private _TWO_FORMS As String
    Public Property TWO_FORMS() As String
        Get
            Return _TWO_FORMS
        End Get
        Set(ByVal value As String)
            _TWO_FORMS = value
        End Set
    End Property


    Private _ADDRESS1 As String
    Public Property ADDRESS1() As String
        Get
            Return _ADDRESS1
        End Get
        Set(ByVal value As String)
            _ADDRESS1 = value
        End Set
    End Property


    Private _ADDRESS2 As String
    Public Property ADDRESS2() As String
        Get
            Return _ADDRESS2
        End Get
        Set(ByVal value As String)
            _ADDRESS2 = value
        End Set
    End Property

    Private _ADDRESS3 As String
    Public Property ADDRESS3() As String
        Get
            Return _ADDRESS3
        End Get
        Set(ByVal value As String)
            _ADDRESS3 = value
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

    Private _Selected As String
    Public Property Selected() As String
        Get
            Return _Selected
        End Get
        Set(ByVal value As String)
            _Selected = value
        End Set
    End Property
	
	Private _IsAccount As Boolean
    Public Property IsAccount() As Boolean
        Get
            Return _IsAccount
        End Get
        Set(ByVal value As Boolean)
            _IsAccount = value
        End Set
    End Property

    Private _AccountLength As String
    Public Property AccountLength() As String
        Get
            Return _AccountLength
        End Get
        Set(ByVal value As String)
            _AccountLength = value
        End Set
    End Property
    Private _PALLETCHARGE As String
    Public Property PALLETCHARGE() As String
        Get
            Return _PALLETCHARGE
        End Get
        Set(ByVal value As String)
            _PALLETCHARGE = value
        End Set
    End Property
End Class

Public Class KometCarrier
    Private _id As Integer
    Public Property id() As Integer
        Get
            Return _id
        End Get
        Set(ByVal value As Integer)
            _id = value
        End Set
    End Property
    Private _name As String
    Public Property name() As String
        Get
            Return _name
        End Get
        Set(ByVal value As String)
            _name = value
        End Set
    End Property

    Private _code As String
    Public Property code() As String
        Get
            Return _code
        End Get
        Set(ByVal value As String)
            _code = value
        End Set
    End Property

End Class