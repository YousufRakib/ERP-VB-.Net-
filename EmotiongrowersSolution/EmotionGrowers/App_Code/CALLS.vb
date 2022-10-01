Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Public Class CALLS
    ''' <summary>
    ''' ABI::14-Nov-2017::SAVE THE CALL LIST
    ''' </summary>
    ''' <param name="Salesman"></param>
    ''' <param name="UserID"></param>
    ''' <returns></returns>
    Public Shared Function SaveCallList(ByVal Salesman As String, ByVal UserID As Integer, ByVal DayID As Integer, ByVal CallListDate As Date, ByVal UserName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Using Cmd As New SqlCommand("UDP_SAVECALLLIST", SqlCon)
                Cmd.Parameters.AddWithValue("@DayID", DayID)
                Cmd.Parameters.AddWithValue("@CallListDate", CallListDate)
                Cmd.Parameters.AddWithValue("@Salesman", Salesman)
                Cmd.Parameters.AddWithValue("@UserId", UserID)
                Cmd.Parameters.AddWithValue("@UserName", UserName)
                Cmd.Parameters.AddWithValue("@CurrentDate", Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"), New System.Globalization.CultureInfo("en-US", True)))
                Cmd.Parameters.AddWithValue("@CurrentTime", DateTime.Now.ToString("HH:mm:ss"))
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.ExecuteNonQuery()
                Return "success"
            End Using
            SqlCon.Close()
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCallList")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' ABI::14-Nov-2017::Get the call list details
    ''' </summary>
    ''' <param name="filter"></param>
    ''' <returns></returns>
    Public Function GetCallListDetailsFromSQL(ByVal filter As String) As List(Of CALLSS)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of CALLSS)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("UDP_GetCallListDetailsFromSQL", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FILTER", filter)
                    Dim CListDR As SqlDataReader = cmd.ExecuteReader()
                    While (CListDR.Read())
                        Dim u As New CALLSS()
                        u.CALL_ID = CListDR("CALL_ID")
                        u.Customer = IIf(CListDR("CUSTOMER") Is DBNull.Value, 0, CListDR("CUSTOMER"))
                        u.Name = IIf(CListDR("NAME") Is DBNull.Value, "", CListDR("NAME"))
                        u.City = IIf(CListDR("CITY") Is DBNull.Value, "", CListDR("CITY"))
                        u.Phone = IIf(CListDR("PHONE") Is DBNull.Value, "", CListDR("PHONE"))
                        u.CallTime = IIf(CListDR("TIME") Is DBNull.Value, "", CListDR("TIME"))
                        u.Carrier = IIf(CListDR("CARRIER") Is DBNull.Value, "", CListDR("CARRIER"))
                        u.Comments = IIf(CListDR("COMMENTS") Is DBNull.Value, "", CListDR("COMMENTS"))
                        u.DeliveryDays = IIf(CListDR("DELLS") Is DBNull.Value, "", CListDR("DELLS"))
                        u.CreditHold = IIf(CListDR("Credithold") Is DBNull.Value, "", CListDR("Credithold"))
                        u.ReasonHold = IIf(CListDR("ReasonHold") Is DBNull.Value, "", CListDR("ReasonHold"))
                        'u.Email = IIf(CListDR("Email") Is DBNull.Value, "", CListDR("Email"))
                        Dim DELLS As String = ""
                        Dim DDays As String = ""

                        Dim week(7) As String
                        week(1) = "MON"
                        week(2) = "TUE"
                        week(3) = "WED"
                        week(4) = "THU"
                        week(5) = "FRI"
                        week(6) = "SAT"
                        week(7) = "SUN"

                        For count = 1 To week.Length
                            Try
                                DELLS = u.DeliveryDays.Substring(2 * count - 2, 2)
                                If DELLS.Trim() <> "" Then
                                    DDays += week(count) + "-" + DELLS + "  "
                                End If
                            Catch
                            End Try
                        Next
                        u.DeliveryDaysTooltip = DDays
                        u.Type = IIf(CListDR("TYPE") Is DBNull.Value, "", CListDR("TYPE"))
                        uList.Add(u)
                    End While
                End Using
                con.Close()
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCallListDetailsFromSQL")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ABI::20-Nov-2017::Get CallList record count for corresponding LoggedIn User
    ''' </summary>
    ''' <param name="UserID"></param>
    ''' <returns></returns>
    Public Function GetCallListCountForUser(ByVal UserID As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim CListDR As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SELECT COUNT(*) FROM F_CALLS where UserID='" + UserID + "'", con)
                    cmd.CommandType = CommandType.Text
                    CListDR = cmd.ExecuteScalar()
                End Using
                con.Close()
            End Using
            Return CListDR
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCallListCountForUser")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ABI::22-Nov-2017::SAVE THE CALL LOG COMMENTS TO CALLHS and TYPE to CALL LIST
    ''' </summary>
    ''' <param name="Customer"></param>
    ''' <param name="Comments"></param>
    ''' <param name="UserID"></param>
    ''' <param name="UserName"></param>
    Public Shared Function SaveCallListLog(ByVal CALL_ID As Integer, ByVal Customer As Integer, ByVal Comments As String, ByVal UserID As Integer, ByVal UserName As String, ByVal Button As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Using Cmd As New SqlCommand("UDP_SaveCallLog", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@Customer", Customer)
                Cmd.Parameters.AddWithValue("@CurrentDate", Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"), New System.Globalization.CultureInfo("en-US", True)))
                Cmd.Parameters.AddWithValue("@CurrentTime", DateTime.Now.ToString("HH:mm:ss"))
                Cmd.Parameters.AddWithValue("@Comments", Comments)
                Cmd.Parameters.AddWithValue("@UserId", UserID)
                Cmd.Parameters.AddWithValue("@UserName", UserName)
                Cmd.Parameters.AddWithValue("@Button", Button)
                Cmd.Parameters.AddWithValue("@CALL_ID", CALL_ID)
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Return "success"
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ABI::23-Nov-2017::SAVE THE CALL LIST TIME FROM CALL LATER TODAY
    ''' </summary>
    ''' <param name="Customer"></param>
    ''' <param name="CallTime"></param>
    ''' <returns></returns>
    Public Shared Function SaveCallLaterToday(ByVal CALL_ID As Integer, ByVal Customer As Integer, ByVal CallTime As String, ByVal Comments As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Using Cmd As New SqlCommand("UDP_SaveCallLaterToday", SqlCon)
                Cmd.Parameters.AddWithValue("@Customer", Customer)
                Cmd.Parameters.AddWithValue("@CallTime", CallTime)
                Cmd.Parameters.AddWithValue("@Comments", Comments)
                Cmd.Parameters.AddWithValue("@CALL_ID", CALL_ID)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.ExecuteNonQuery()
                Return "success"
            End Using
            SqlCon.Close()
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCallLaterToday")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' ABI::24-Nov-2017::SAVE THE CALL LIST PRE-SCHEDULED CALLS FROM CALL ANOTHER DAY
    ''' </summary>
    ''' <param name="Customer"></param>
    ''' <param name="DayAdd"></param>
    ''' <param name="Comments"></param>
    ''' <returns></returns>
    Public Shared Function SaveCallAnotherDay(ByVal CALL_ID As Integer, ByVal Customer As String, ByVal DayAdd As Integer, ByVal Comments As String, ByVal UserID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Using Cmd As New SqlCommand("UDP_SaveCallAnotherDay", SqlCon)
                Cmd.Parameters.AddWithValue("@Customer", Customer)
                Cmd.Parameters.AddWithValue("@DayAdd", DayAdd)
                Cmd.Parameters.AddWithValue("@Comments", Comments)
                Cmd.Parameters.AddWithValue("@UserID", UserID)
                Cmd.Parameters.AddWithValue("@CALL_ID", CALL_ID)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.ExecuteNonQuery()
                Return "success"
            End Using
            SqlCon.Close()
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveCallAnotherDay")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' ABI::24-Nov-2017::REMOVE THE CALL LIST FOR THAT DAY EXCEPT SCHEDULED CALLS  
    ''' </summary>
    ''' <param name="UserID"></param>
    ''' <returns></returns>
    Public Shared Function RemoveCallList(ByVal UserID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Using Cmd As New SqlCommand("UDP_RemoveCallList", SqlCon)
                Cmd.Parameters.AddWithValue("@UserID", UserID)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.ExecuteNonQuery()
                Return "success"
            End Using
            SqlCon.Close()
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in RemoveCallList")
            Return "error"
        End Try
    End Function

    Public Shared Function UpdateCallListTypeAfterSaleMade(ByVal Customer As String, ByVal UserID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Using Cmd As New SqlCommand("update F_CALLS set Type='Y' where Customer=@Customer And UserID=@UserID", SqlCon)
                Cmd.Parameters.AddWithValue("@Customer", Customer)
                Cmd.Parameters.AddWithValue("@UserID", UserID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
                Return "success"
            End Using
            SqlCon.Close()
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateCallListTypeAfterSaleMade")
            Return "error"
        End Try
    End Function

    ''' <summary>
    ''' ABI::27-Nov-2017::Get CallList customer# for corresponding call list ID
    ''' </summary>
    ''' <param name="CALL_ID"></param>
    ''' <returns></returns>
    Public Function GetCallListCustomerForCallID(ByVal CALL_ID As Integer) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim CListDR As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SELECT Customer FROM F_CALLS where ID='" + CALL_ID.ToString() + "'", con)
                    cmd.CommandType = CommandType.Text
                    CListDR = cmd.ExecuteScalar()
                End Using
                con.Close()
            End Using
            Return CListDR
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCallListCustomerForCallID")
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' ABI::28-Nov-2017::Get CallList prepared day for corresponding LoggedIn User for last created id
    ''' </summary>
    ''' <param name="UserID"></param>
    ''' <returns></returns>
    Public Function GetCallListCreatedDay(ByVal UserID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim CListDay As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("SELECT datename(dw,MIN(DATE))+' '+datename(MM,MIN(DATE)) +' ' + DATENAME(DD,MIN(DATE))+IIF(DATENAME(DD,MIN(DATE)) in (1,21,31),'st',IIF(DATENAME(DD,MIN(DATE))  IN (2,22),'nd',IIF(DATENAME(DD,MIN(DATE))IN (3,23),'rd','th')))+' '+ DATENAME(YYYY,MIN(DATE)) DATE FROM F_CALLS where UserID='" + UserID + "' order by DATE asc", con)
                    cmd.CommandType = CommandType.Text
                    CListDay = cmd.ExecuteScalar()
                End Using
                con.Close()
            End Using
            Return CListDay
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCallListCreatedDay")
            Throw ex
        End Try
    End Function

End Class

Public Class CALLSS

    Private _CALL_ID As Integer
    Public Property CALL_ID() As Integer
        Get
            Return _CALL_ID
        End Get
        Set(ByVal value As Integer)
            _CALL_ID = value
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

    Private _Customer As Integer
    Public Property Customer() As Integer
        Get
            Return _Customer
        End Get
        Set(ByVal value As Integer)
            _Customer = value
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

    Private _Phone As String
    Public Property Phone() As String
        Get
            Return _Phone
        End Get
        Set(ByVal value As String)
            _Phone = value
        End Set
    End Property

    Private _CallTime As String
    Public Property CallTime() As String
        Get
            Return _CallTime
        End Get
        Set(ByVal value As String)
            _CallTime = value
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

    Private _Comments As String
    Public Property Comments() As String
        Get
            Return _Comments
        End Get
        Set(ByVal value As String)
            _Comments = value
        End Set
    End Property

    Private _DeliveryDays As String
    Public Property DeliveryDays() As String
        Get
            Return _DeliveryDays
        End Get
        Set(ByVal value As String)
            _DeliveryDays = value
        End Set
    End Property

    Private _ReasonHold As String
    Public Property ReasonHold() As String
        Get
            Return _ReasonHold
        End Get
        Set(ByVal value As String)
            _ReasonHold = value
        End Set
    End Property

    Private _CreditHold As String
    Public Property CreditHold() As String
        Get
            Return _CreditHold
        End Get
        Set(ByVal value As String)
            _CreditHold = value
        End Set
    End Property

    Private _DeliveryDaysTooltip As String
    Public Property DeliveryDaysTooltip() As String
        Get
            Return _DeliveryDaysTooltip
        End Get
        Set(ByVal value As String)
            _DeliveryDaysTooltip = value
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

    Private _Email As String
    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(ByVal value As String)
            _Email = value
        End Set
    End Property
End Class