Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO



Public Class DAOCustDO


    Public Shared Function GetAddressForCustomerByDocTypeAndDelType(ByVal CustomerNo As String, DocType As String, DelType As String) As String
        Try
            Dim u As New CustomerDetail()
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Address As String = ""

            If CustomerNo <> "" Then
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select distinct(ADDRESS),DOCTYPE,DELTYPE  from F_CUSTDO where Customer=" + CustomerNo + " And DOCTYPE='" + DocType + "' And DELTYPE in (" + DelType + ")", con)
                        'cmd.Parameters.AddWithValue("@CustomerNo", CustomerNo)
                        'cmd.Parameters.AddWithValue("@DOCTYPE", DocType)
                        'cmd.Parameters.AddWithValue("@DELTYPE", DelType)
                        cmd.CommandType = CommandType.Text
                        ' cmd.Parameters.AddWithValue("Customer", Customer)

                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)

                        For Each row In ds.Tables(0).Rows
                            If Address = "" Then
                                'Address = If(row("DELTYPE") = "F", Convert.ToString(row("ADDRESS")) + "@faxage.com", Convert.ToString(row("ADDRESS")))
                                Address = Convert.ToString(row("ADDRESS"))
                            Else
                                'Address += "," + If(row("DELTYPE") = "F", Convert.ToString(row("ADDRESS")) + "@faxage.com", Convert.ToString(row("ADDRESS")))
                                Address += "," + Convert.ToString(row("ADDRESS"))
                            End If
                        Next
                    End Using
                End Using
            End If

            Return Address
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAddressForCustomerByDocTypeAndDelType")
            Return Nothing
        End Try
    End Function

    Public Shared Function PrintOptionSetOnDocsFortheCustomer(ByVal CustomerNo As String, DocType As String) As Boolean
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select count(*) from F_CUSTDO where Customer=" + CustomerNo + " And DOCTYPE='" + DocType + "' And DELTYPE='P'", con)
                    cmd.CommandType = CommandType.Text
                    Dim count = Convert.ToInt32(cmd.ExecuteScalar())
                    If count > 0 Then
                        Return True
                    Else
                        Return False
                    End If

                End Using
            End Using
            Return False
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in IfPrintIsSetOnDocsFortheCustomer")
            Return False
        End Try
    End Function

    Public Shared Function GetARINVDocsDetail(ByVal CustomerNo As String, ByVal sortExp As String) As List(Of BOCustDO)
        Try
            Dim uList As New List(Of BOCustDO)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Address As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim whereClause As String = ""
                If CustomerNo = "" Then
                    whereClause = ""
                Else
                    whereClause = " where custdo.Customer =@CustomerNo "
                End If
                Using cmd As New SqlCommand("select custdo.ID,custdo.CUSTOMER,cust.NAME as CustomerName,custdo.DOCTYPE,custdo.DELTYPE,custdo.ADDRESS,custdo.ADDUSER,custdo.ADDDATE,custdo.ADDTIME,custdo.UPDUSER,custdo.UPDDATE,custdo.UPDTIME from F_CUSTDO custdo LEFT JOIN F_CUST cust on custdo.CUSTOMER=cust.CUSTOMER " + whereClause + " order by cust.NAME", con)
                    cmd.Parameters.AddWithValue("@CustomerNo", CustomerNo)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim u As New BOCustDO()
                        u.DocID = row("ID")
                        u.Customer = row("Customer")
                        u.CustomerName = If(row("CustomerName") Is DBNull.Value, "", row("CustomerName"))
                        u.DocType = If(row("DOCTYPE") Is DBNull.Value, "", row("DOCTYPE"))
                        u.DelType = If(row("DELTYPE") Is DBNull.Value, "", row("DELTYPE"))
                        u.ADDRESS = If(row("Address") Is DBNull.Value, "", row("Address"))
                        u.ADDUSER = IIf(row("ADDUSER") Is DBNull.Value, "", row("ADDUSER"))
                        u.ADDDATE = If(row("ADDDATE") Is DBNull.Value, "", Convert.ToDateTime(row("ADDDATE")).ToString("MM/dd/yyyy"))
                        u.ADDTIME = IIf(row("ADDTIME") Is DBNull.Value, "", row("ADDTIME"))
                        u.UPDUSER = IIf(row("UPDUSER") Is DBNull.Value, "", row("UPDUSER"))
                        u.UPDDATE = If(row("UPDDATE") Is DBNull.Value, "", Convert.ToDateTime(row("ADDDATE")).ToString("MM/dd/yyyy"))
                        u.UPDTIME = IIf(row("UPDTIME") Is DBNull.Value, "", row("UPDTIME"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetARINVDocsDetail")
            Return Nothing
        End Try
    End Function

    Public Shared Function DeleteARINVDocsByDocsID(ByVal DocsID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Delete from F_CUSTDO where ID=@DocsID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@DocsID", DocsID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteARINVDocsByDocsID")
            Throw ex
        End Try
    End Function

    Public Shared Function GetARINVDocsByDocsID(ByVal DocsID As String) As BOCustDO
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BOCustDO()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select ID,CUSTOMER,DOCTYPE,DELTYPE,ADDRESS,ADDUSER,ADDDATE,ADDTIME,UPDUSER,UPDDATE,UPDTIME from F_CUSTDO where ID=@DocsID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@DocsID", DocsID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    For Each row In ds.Tables(0).Rows
                        u.DocID = row("ID")
                        u.Customer = row("Customer")
                        u.DocType = row("DOCTYPE")
                        u.DelType = row("DELTYPE")
                        u.ADDRESS = row("Address")
                        u.ADDUSER = IIf(row("ADDUSER") Is DBNull.Value, "", row("ADDUSER"))
                        u.ADDDATE = If(row("ADDDATE") Is DBNull.Value, "", row("ADDDATE"))
                        u.ADDTIME = IIf(row("ADDTIME") Is DBNull.Value, "", row("ADDTIME"))
                        u.UPDUSER = IIf(row("UPDUSER") Is DBNull.Value, "", row("UPDUSER"))
                        u.UPDDATE = If(row("UPDDATE") Is DBNull.Value, "", row("UPDDATE"))
                        u.UPDTIME = IIf(row("UPDTIME") Is DBNull.Value, "", row("UPDTIME"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetARINVDocsByDocsID")
            Throw ex
        End Try
    End Function

    Public Shared Function SaveARINVDocsByDocsID(ByVal Customer As String, ByVal DocType As String, ByVal DelType As String, ByVal Address As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                If (User.Length < 20) Then
                    User = User
                Else
                    User = User.Substring(0, 20)
                End If
                Using cmd As New SqlCommand("INSERT INTO F_CUSTDO(Customer,DocType,DelType,ADDRESS,ADDUSER,ADDDATE,ADDTIME) VALUES(@Customer,@DocType,@DelType,@Address,@User,@AddDate,@AddTime)", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@Customer", Customer))
                    cmd.Parameters.Add(New SqlParameter("@DocType", DocType))
                    cmd.Parameters.Add(New SqlParameter("@DelType", DelType))
                    cmd.Parameters.Add(New SqlParameter("@Address", Address))
                    cmd.Parameters.AddWithValue("@User", User)
                    cmd.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd.Parameters.AddWithValue("@AddTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))

                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveARINVDocsByDocsID")
            Throw ex
        End Try
    End Function

    Public Shared Function UpdateARINVDocsByDocsID(ByVal Customer As String, ByVal DocsID As String, ByVal DocType As String, ByVal DelType As String, ByVal Address As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                If (User.Length < 20) Then
                    User = User
                Else
                    User = User.Substring(0, 20)
                End If
                Using cmd As New SqlCommand("UPDATE F_CUSTDO SET CUSTOMER=@Customer,DOCTYPE=@DocType,DELTYPE=@DelType,ADDRESS=@Address,UPDUSER=@User,UPDDATE=AddDate,UPDTIME=@AddTime where ID=@DocsID and Customer=@Customer", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@Customer", Customer))
                    cmd.Parameters.Add(New SqlParameter("@DocType", DocType))
                    cmd.Parameters.Add(New SqlParameter("@DelType", DelType))
                    cmd.Parameters.Add(New SqlParameter("@Address", Address))
                    cmd.Parameters.AddWithValue("@User", User)
                    cmd.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd.Parameters.AddWithValue("@AddTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd.Parameters.AddWithValue("@DocsID", DocsID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateARINVDocsByDocsID")
            Throw ex
        End Try
    End Function
    Public Shared Function GetARReportsDocsDetail() As List(Of BOCustDO)
        Try
            Dim uList As New List(Of BOCustDO)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Address As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()

                Using cmd As New SqlCommand("select CUSTDO.ID, CUSTDO.CUSTOMER, CUST.NAME AS CUSTOMERNAME, CUSTDO.DOCTYPE, CUSTDO.DELTYPE, CUSTDO.ADDRESS from F_CUSTDO CUSTDO LEFT JOIN F_CUST CUST ON CUSTDO.CUSTOMER=CUST.CUSTOMER ORDER BY CUST.NAME", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim u As New BOCustDO()
                        u.Customer = row("CUSTOMER")
                        u.CustomerName = If(row("CUSTOMERNAME") Is DBNull.Value, "", row("CUSTOMERNAME"))
                        u.DocType = If(row("DOCTYPE") Is DBNull.Value, "", row("DOCTYPE"))
                        u.DelType = If(row("DELTYPE") Is DBNull.Value, "", row("DELTYPE"))
                        u.ADDRESS = If(row("ADDRESS") Is DBNull.Value, "", row("ADDRESS"))

                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetARINVDocsDetail")
            Return Nothing
        End Try
    End Function
End Class

Public Class BOCustDO
    Private _DocID As Integer
    Public Property DocID() As Integer
        Get
            Return _DocID
        End Get
        Set(ByVal value As Integer)
            _DocID = value
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

    Private _CustomerName As String
    Public Property CustomerName() As String
        Get
            Return _CustomerName
        End Get
        Set(ByVal value As String)
            _CustomerName = value
        End Set
    End Property

    Private _DocType As String
    Public Property DocType() As String
        Get
            Return _DocType
        End Get
        Set(ByVal value As String)
            _DocType = value
        End Set
    End Property

    Private _DelType As String
    Public Property DelType() As String
        Get
            Return _DelType
        End Get
        Set(ByVal value As String)
            _DelType = value
        End Set
    End Property

    Private _ADDRESS As String
    Public Property ADDRESS() As String
        Get
            Return _ADDRESS
        End Get
        Set(ByVal value As String)
            _ADDRESS = value
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

End Class
