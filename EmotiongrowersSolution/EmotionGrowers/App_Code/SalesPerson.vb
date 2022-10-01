Imports System.Data.SqlClient
Imports System.Data

Public Class SalesPerson
    Public Shared Function LoadSalesPersonDetails() As List(Of SalesPersons)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SalesPersons)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Salesman,Email,Name from F_SLSMAN order by Salesman", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New SalesPersons
                        u.Salesman = row("Salesman")
                        u.Email = IIf(row("Email") Is DBNull.Value, "", row("Email"))
                        u.SlsName = IIf(row("Name") Is DBNull.Value, "", row("Name"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadSalesPersonDetails")
            Return Nothing
        End Try
    End Function


    Public Shared Function GetSalesPersonEmailIdforCustomer(ByVal Customer As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SalesManEmail As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("select isnull(S.Email,'') from F_SLSMAN S inner join F_CUST C on C.Salesman=S.SALESMAN where CUSTOMER=@CUSTOMER", Con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@Customer", Customer)
                    SalesManEmail = cmd.ExecuteScalar()
                End Using
            End Using
            Return SalesManEmail
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesPersonEmailIdforCustomer")
            Return ""
        End Try
    End Function


    Public Shared Function GetSalesmanNameBySalesman(ByVal Salesman As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SalesmanName As String = ""
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("select Name from F_SLSMAN where Salesman=@Salesman", Con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@Salesman", Salesman)
                    SalesmanName = cmd.ExecuteScalar()
                End Using
            End Using
            Return SalesmanName
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSalesmanNameBySalesman")
            Throw ex
        End Try
    End Function

    Public Shared Function LoadSalesPersonOnlyinCustomertable() As List(Of SalesPersons)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SalesPersons)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select distinct S.SalesMan,S.Name from F_CUST CU " +
                                            "inner join F_SLSMAN S on CU.SalesMan=S.SalesMan", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New SalesPersons
                        u.Salesman = row("Salesman")
                        u.SlsName = IIf(row("Name") Is DBNull.Value, "", row("Name"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadSalesPersonDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetSlsmanControlNum(Salesman As String) As List(Of SalesPersons)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of SalesPersons)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select Salesman,Control,Email,Name from F_SLSMAN where Salesman=@Salesman order by Salesman", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("Salesman", Salesman)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New SalesPersons
                        u.Salesman = row("Salesman")
                        If (row("control") Is DBNull.Value) Then
                            u.Control = "1"
                            Using cmd1 As New SqlCommand("update F_SLSMAN set control=1 where Salesman=@Salesman", con)
                                cmd1.Parameters.AddWithValue("Salesman", Salesman)
                                cmd1.CommandType = CommandType.Text
                                cmd1.ExecuteNonQuery()
                            End Using
                        Else
                            Dim controlnum As Integer = Convert.ToInt16(row("Control")) + 1
                            u.Control = controlnum.ToString()
                            Using cmd1 As New SqlCommand("update F_SLSMAN set control=" + controlnum.ToString() + " where Salesman=@Salesman", con)
                                cmd1.Parameters.AddWithValue("Salesman", Salesman)
                                cmd1.CommandType = CommandType.Text
                                cmd1.ExecuteNonQuery()
                            End Using
                            'Dim obj As New DFlowerDBFService.DFlowerDBFServiceSoapClient
                            'Dim res = obj.UpdateSlsControl(controlnum, Salesman)
                            'Dim result = obj.U.DAOSalesHeaders.UpdateSlsControl(controlnum, Salesman)
                            'u.Control = controlnum.ToString()
                        End If
                        'u.Control = IIf(row("Control") Is DBNull.Value, "0", row("Control"))
                        u.Email = IIf(row("Email") Is DBNull.Value, "", row("Email"))
                        u.SlsName = IIf(row("Name") Is DBNull.Value, "", row("Name"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetSlsmanControlNum")
            Return Nothing
        End Try
    End Function
End Class

Public Class SalesPersons

    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Private _Salesman As String
    Public Property Salesman() As String
        Get
            Return _Salesman
        End Get
        Set(ByVal value As String)
            _Salesman = value
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

    Private _SlsName As String
    Public Property SlsName() As String
        Get
            Return _SlsName
        End Get
        Set(ByVal value As String)
            _SlsName = value
        End Set
    End Property

    Private _Control As String
    Public Property Control() As String
        Get
            Return _Control
        End Get
        Set(ByVal value As String)
            _Control = value
        End Set
    End Property

End Class