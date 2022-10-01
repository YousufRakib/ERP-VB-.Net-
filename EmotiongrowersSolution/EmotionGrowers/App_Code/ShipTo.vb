Imports System.Data.SqlClient
Imports System.Data


Public Class ShipTos

    Private _TotalRows As Integer
    Public Property TotalRows() As Integer
        Get
            Return _TotalRows
        End Get
        Set(ByVal value As Integer)
            _TotalRows = value
        End Set

    End Property

    Public Function GetShiptoListForFgrd(ByVal Customer As String) As List(Of ShipTo)

        Dim uList As New List(Of ShipTo)()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select ID,Shipto,Customer,Name,Address1,City,State,Phone,Comment from f_shipto where Customer=@Customer Order by Shipto ", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@Customer", Customer))
                    'cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                    'cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                    'cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New ShipTo()
                        u.ID = row("ID")
                        u.Shipto = row("Shipto")
                        u.Customer = If(row("Customer") Is DBNull.Value, "", row("Customer"))
                        u.Name = If(row("Name") Is DBNull.Value, "", row("Name"))
                        u.ADDRESS1 = If(row("Address1") Is DBNull.Value, "", row("Address1"))
                        u.CITY = If(row("City") Is DBNull.Value, "", row("City"))
                        u.STATE = If(row("State") Is DBNull.Value, "", row("State"))
                        u.PHONE = If(row("Phone") Is DBNull.Value, "", row("Phone"))
                        u.Comment = If(row("Comment") Is DBNull.Value, "", row("Comment"))
                        uList.Add(u)
                        Me.TotalRows = ds.Tables(0).Rows.Count
                    Next
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetShiptoListForFgrd")
            Return Nothing
        End Try
        Return uList
    End Function


    Public Shared Function GetShiptosForKometpost() As List(Of ShipTo)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of ShipTo)()

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from F_SHIPTO where  KOMETID='' or  KOMETID='0' ", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    For Each row In ds.Tables(0).Rows
                        Dim u As New ShipTo()
                        u.Customer = row("Customer")
                        u.Name = row("Name")
                        u.CITY = row("CITY")
                        u.COUNTRY = row("COUNTRY")
                        u.STATE = row("STATE")
                        u.Fax = row("Fax")
                        u.PHONE = row("PHONE")
                        u.ZIP = row("ZIP")
                        u.ADDRESS1 = row("ADDRESS1")
                        uList.Add(u)
                    Next

                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerDetailsFromSQL")
            Throw ex
        End Try
    End Function

    Public Shared Function UpdateKometID(ByVal KometID As String, ByVal CARRIER As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("Update F_SHIPTO set KOMETID=@KometID where CARRIER=@CARRIER ", con)
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

    Public Shared Function GetShiptoForDropdownByCustomer(ByVal Customer As String) As List(Of ShipTo)
        Try
            If Customer.Trim() = "" Or Customer.Trim() = "null" Or String.IsNullOrEmpty(Customer.Trim()) Then
                ErrorLogs.LogException(New Exception(), "Error Null or Empty Customer being passed to GetShiptoForDropdownByCustomer")
                Return Nothing
            ElseIf Customer.Trim() = "0" Then
                ErrorLogs.LogException(New Exception(), "Error customer 0 being passed to GetShiptoForDropdownByCustomer")
                Return Nothing
            Else
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim ShiptoList As New List(Of ShipTo)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    ' 01 Apr 2019 :: SALES-Create Shipto area on Order Screen and show shipto if one is selected 
                    Using cmd As New SqlCommand("select distinct Shipto,Name,Address1,Address2,City,state,Comment,ZIP,PHONE from F_SHIPTO where customer=@Customer", con)
                        cmd.Parameters.AddWithValue("@Customer", Customer)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim ShipTo As New ShipTo()
                            ShipTo.Name = If(row("Name") Is DBNull.Value, "", row("Name"))
                            ShipTo.Shipto = If(row("Shipto") Is DBNull.Value, 0, row("Shipto"))
                            If ShipTo.Shipto = Customer Then
                                ShipTo.IsDefault = "1"
                            Else
                                ShipTo.IsDefault = "0"
                            End If
                            ShipTo.ADDRESS1 = If(row("Address1") Is DBNull.Value, "", row("Address1"))
                            ShipTo.ADDRESS2 = If(row("Address2") Is DBNull.Value, "", row("Address2"))
                            ShipTo.CITY = If(row("City") Is DBNull.Value, "", row("City"))
                            ShipTo.STATE = If(row("STATE") Is DBNull.Value, "", row("STATE"))
                            ShipTo.Comment = If(row("Comment") Is DBNull.Value, "", row("Comment"))
                            ' 01 Apr 2019 :: SALES-Create Shipto area on Order Screen and show shipto if one is selected 
                            ShipTo.ZIP = If(row("ZIP") Is DBNull.Value, "", row("ZIP"))
                            ShipTo.PHONE = If(row("PHONE") Is DBNull.Value, "", row("PHONE"))
                            ShiptoList.Add(ShipTo)
                        Next
                    End Using
                End Using
                Return ShiptoList
            End If
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetShiptoForDropdownByCustomer")
            Throw ex
        End Try
    End Function

    Public Shared Function SaveShiptoDetails(ByVal ID As String, ByVal Shipto As String, ByVal ShiptoName As String, ByVal Address1 As String, ByVal Address2 As String, ByVal City As String, ByVal State As String, ByVal Zip As String, ByVal Country As String, ByVal Phone As String, ByVal Fax As String, ByVal Contact As String, ByVal Calls As String, ByVal CallTime As String, ByVal Caller As String, ByVal Carrier As String, ByVal Comment As String, ByVal Customer As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()

            Dim saveQuery As String = ""

            If (ID = 0) Then
                saveQuery = "INSERT INTO F_SHIPTO(CUSTOMER,SHIPTO,NAME,ADDRESS1,ADDRESS2,CITY,[STATE],ZIP,COUNTRY,PHONE,FAX,CONTACT,CALLS,CALLTIME,[CALLER],CARRIER,COMMENT) VALUES(@CUSTOMER,@SHIPTO,@NAME,@ADDRESS1,@ADDRESS2,@CITY,@STATE,@ZIP,@COUNTRY,@PHONE,@FAX,@CONTACT,@CALLS,@CALLTIME,@CALLER,@CARRIER,@COMMENT)"
            Else
                saveQuery = "UPDATE F_SHIPTO SET SHIPTO=@SHIPTO,NAME=@NAME,ADDRESS1=@ADDRESS1,ADDRESS2=@ADDRESS2,CITY=@CITY,[STATE]=@STATE,ZIP=@ZIP,COUNTRY=@COUNTRY,PHONE=@PHONE,FAX=@FAX,CONTACT=@CONTACT,CALLS=@CALLS,CALLTIME=@CALLTIME,[CALLER]=@CALLER,CARRIER=@CARRIER,COMMENT=@Comment WHERE ID=@ID and Customer=@CUSTOMER"
            End If

            Dim Cmd As New SqlCommand(saveQuery, SqlCon)
            Cmd.CommandType = CommandType.Text

            Cmd.Parameters.AddWithValue("@ID", ID)
            Cmd.Parameters.AddWithValue("@SHIPTO", Shipto)
            Cmd.Parameters.AddWithValue("@NAME", ShiptoName)
            Cmd.Parameters.AddWithValue("@ADDRESS1", Address1)
            Cmd.Parameters.AddWithValue("@ADDRESS2", Address2)
            Cmd.Parameters.AddWithValue("@CITY", City)
            Cmd.Parameters.AddWithValue("@STATE", State)
            Cmd.Parameters.AddWithValue("@ZIP", Zip)
            Cmd.Parameters.AddWithValue("@COUNTRY", Country)
            Cmd.Parameters.AddWithValue("@PHONE", Phone)
            Cmd.Parameters.AddWithValue("@FAX", Fax)
            Cmd.Parameters.AddWithValue("@CONTACT", Contact)
            Cmd.Parameters.AddWithValue("@CALLS", Calls)
            Cmd.Parameters.AddWithValue("@CALLTIME", CallTime)
            Cmd.Parameters.AddWithValue("@CALLER", Caller)
            Cmd.Parameters.AddWithValue("@CARRIER", Carrier)
            Cmd.Parameters.AddWithValue("@COMMENT", Comment)
            Cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
            Cmd.ExecuteNonQuery()

            Cmd.Dispose()
            SqlCon.Close()
            Return "Success"
        Catch ex As Exception
            If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                ErrorLogs.LogException(ex, "Error in SaveShiptoDetails")
            End If
            Return ex.Message.ToString()
        End Try
    End Function

    Public Shared Function DeleteShiptoDetails(ByVal ID As String) As String
        Try
            Dim u As New Flower
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("delete from  F_SHIPTO where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()
                    Return "Success"
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteShiptoDetails")
            Return "error"
        End Try
    End Function

    Public Shared Function GetShiptoDetailsByID(ByVal ID As String) As List(Of ShipTo)

        Dim uList As New List(Of ShipTo)()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from f_shipto where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@ID", ID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New ShipTo()
                        u.ID = row("ID")
                        u.Shipto = row("Shipto")
                        u.Customer = If(row("Customer") Is DBNull.Value, "", row("Customer"))
                        u.Name = If(row("Name") Is DBNull.Value, "", row("Name"))
                        u.CITY = If(row("City") Is DBNull.Value, "", row("City"))
                        u.STATE = If(row("State") Is DBNull.Value, "", row("State"))
                        u.PHONE = If(row("Phone") Is DBNull.Value, "", row("Phone"))
                        u.ADDRESS1 = If(row("Address1") Is DBNull.Value, "", row("Address1"))
                        u.ADDRESS2 = If(row("Address2") Is DBNull.Value, "", row("Address2"))
                        u.ZIP = If(row("Zip") Is DBNull.Value, "", row("Zip"))
                        u.COUNTRY = If(row("Country") Is DBNull.Value, "", row("Country"))
                        u.Fax = If(row("Fax") Is DBNull.Value, "", row("Fax"))
                        u.Contact = If(row("Contact") Is DBNull.Value, "", row("Contact"))

                        u.Calls = If(row("Calls") Is DBNull.Value, "", row("Calls"))
                        u.CallTime = If(row("CallTime") Is DBNull.Value, "", row("CallTime"))
                        u.Caller = If(row("Caller") Is DBNull.Value, "", row("Caller"))
                        u.Carrier = If(row("Carrier") Is DBNull.Value, "", row("Carrier"))
                        u.Comment = If(row("Comment") Is DBNull.Value, "", row("Comment"))

                        uList.Add(u)

                    Next
                End Using
            End Using

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetShiptoDetailsByID")
            Return Nothing
        End Try
        Return uList
    End Function

    Public Shared Function GetNextShiptoValue(ByVal Customer As String) As Integer

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ShiptoValue As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select ISNULL(MAX(shipto),0) +1 as ShipTo from f_shipto where customer=@customer", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@customer", Customer))
                    ShiptoValue = Convert.ToInt32(cmd.ExecuteScalar())
                End Using
            End Using
            Return ShiptoValue
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetNextShiptoValue")
            Return Nothing
        End Try
    End Function

    Public Shared Function isExistShipToForCustomer(ByVal Customer As String, ByVal ShipTo As String, ByVal ShipToId As String) As Integer

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ShiptoValue As Integer = 0
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim qry = IIf(ShipToId = "0", "select count(SHIPTO) ShipTo from f_shipto where customer=@customer and SHIPTO=@ShipTo", "select count(SHIPTO) ShipTo from f_shipto where customer=@customer and SHIPTO=@ShipTo and ID<>@ShipToId")
                Using cmd As New SqlCommand(qry, con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@customer", Customer))
                    cmd.Parameters.Add(New SqlParameter("@ShipTo", ShipTo))
                    If (ShipToId IsNot "0") Then
                        cmd.Parameters.Add(New SqlParameter("@ShipToId", ShipToId))
                    End If
                    ShiptoValue = Convert.ToInt32(cmd.ExecuteScalar())
                End Using
            End Using
            Return ShiptoValue
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in isExistShipToForCustomer")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetCustomerNameForShipto(ByVal Customer As String) As String

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim CustomerName As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Name from F_CUST where customer=@customer", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@customer", Customer))
                    CustomerName = cmd.ExecuteScalar()
                End Using
            End Using
            Return CustomerName
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCustomerNameForShipto")
            Return Nothing
        End Try
    End Function

End Class
Public Class ShipTo

    Private _ID As Integer
    Public Property ID As Integer
        Get
            Return _ID
        End Get
        Set(value As Integer)
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

    Private _Shipto As String
    Public Property Shipto() As String
        Get
            Return _Shipto
        End Get
        Set(ByVal value As String)
            _Shipto = value
        End Set
    End Property

    Private _IsDefault As String
    Public Property IsDefault() As String
        Get
            Return _IsDefault
        End Get
        Set(ByVal value As String)
            _IsDefault = value
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

    Private _CITY As String
    Public Property CITY() As String
        Get
            Return _CITY
        End Get
        Set(ByVal value As String)
            _CITY = value
        End Set
    End Property

    Private _STATE As String
    Public Property STATE() As String
        Get
            Return _STATE
        End Get
        Set(ByVal value As String)
            _STATE = value
        End Set
    End Property

    Private _COUNTRY As String
    Public Property COUNTRY() As String
        Get
            Return _COUNTRY
        End Get
        Set(ByVal value As String)
            _COUNTRY = value
        End Set
    End Property

    Private _ZIP As String
    Public Property ZIP() As String
        Get
            Return _ZIP
        End Get
        Set(ByVal value As String)
            _ZIP = value
        End Set
    End Property

    Private _PHONE As String
    Public Property PHONE() As String
        Get
            Return _PHONE
        End Get
        Set(ByVal value As String)
            _PHONE = value
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

    Private _Fax As String
    Public Property Fax() As String
        Get
            Return _Fax
        End Get
        Set(ByVal value As String)
            _Fax = value
        End Set
    End Property

    Private _Contact As String
    Public Property Contact() As String
        Get
            Return _Contact
        End Get
        Set(ByVal value As String)
            _Contact = value
        End Set
    End Property

    Private _Calls As String
    Public Property Calls() As String
        Get
            Return _Calls
        End Get
        Set(ByVal value As String)
            _Calls = value
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

    Private _Caller As String
    Public Property Caller() As String
        Get
            Return _Caller
        End Get
        Set(ByVal value As String)
            _Caller = value
        End Set
    End Property

    Private _Comment As String
    Public Property Comment() As String
        Get
            Return _Comment
        End Get
        Set(ByVal value As String)
            _Comment = value
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

End Class

Public Interface ICustomParams_ShiptoID
    Property ShiptoID() As String
End Interface