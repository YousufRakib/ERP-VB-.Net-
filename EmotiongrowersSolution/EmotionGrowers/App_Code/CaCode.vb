Imports System.Data.SqlClient
Imports System.Data



Namespace DAO
    Public Class CaCode
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Function GetCarrierCodeListForFgrd(ByVal Customer As String, ByVal Shipto As String) As List(Of BO.CaCode)

            Dim uList As New List(Of BO.CaCode)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SpGetCacodes", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@Customer", Customer))
                        cmd.Parameters.Add(New SqlParameter("@Shipto", Shipto))

                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.CaCode()
                            u.ID = row("ID")
                            u.Carrier = row("CARRIER")
                            u.CarrierName = If(row("NAME") Is DBNull.Value, "", row("NAME"))
                            u.Customer = If(row("CUSTOMER") Is DBNull.Value, "", row("CUSTOMER"))
                            u.Shipto = If(row("SHIPTO") Is DBNull.Value, "", row("SHIPTO"))
                            u.Account = If(row("ACCOUNT") Is DBNull.Value, "", row("ACCOUNT"))
                            u.Zone = If(row("ZONE") Is DBNull.Value, "", row("ZONE"))
                            u.UpdUser = If(row("UPDUSER") Is DBNull.Value, "", row("UPDUSER"))
                            u.UpdDate = If(row("LASTUPDATEDATE") Is DBNull.Value, "", row("LASTUPDATEDATE"))
                            u.UpdTime = If(row("UPDTIME") Is DBNull.Value, "", row("UPDTIME"))
                            u.AddDate = If(row("DATE") Is DBNull.Value, "", row("DATE"))
                            u.AddTime = If(row("TIME") Is DBNull.Value, "", row("TIME"))
                            uList.Add(u)
                            Me.TotalRows = ds.Tables(0).Rows.Count
                        Next
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCarrierCodeListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function


        Public Shared Function SaveCarrierCodeDetails(ByVal ID As String, ByVal Shipto As String, ByVal Customer As String, ByVal Carrier As String, ByVal Account As String, ByVal Zone As String, ByVal User As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()

                If (Shipto = "0") Then
                    Shipto = Customer
                End If

                Dim Cmd As New SqlCommand("spF_CACODE", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@CARRIER", Carrier)
                Cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                Cmd.Parameters.AddWithValue("@SHIPTO", Shipto)
                Cmd.Parameters.AddWithValue("@ACCOUNT", Account)
                Cmd.Parameters.AddWithValue("@ADDUSER", User)
                Cmd.Parameters.AddWithValue("@UPDUSER", User)

                Cmd.ExecuteNonQuery()

                Cmd.Dispose()
                SqlCon.Close()
                Return "Success"
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertCountryCodes")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteCarrierCodeDetails(ByVal ID As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("delete from  F_CACODE where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteCarrierCodeDetails")
                Return "error"
            End Try
        End Function

        Public Shared Function GetCarrierCodeDetailsByID(ByVal ID As String) As List(Of BO.CaCode)

            Dim uList As New List(Of BO.CaCode)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select * from f_cacode where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.Add(New SqlParameter("@ID", ID))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.CaCode()
                            u.ID = row("ID")
                            u.Shipto = row("Shipto")
                            u.Customer = If(row("Customer") Is DBNull.Value, "", row("Customer"))
                            u.Carrier = If(row("Carrier") Is DBNull.Value, "", row("Carrier"))
                            u.Account = If(row("Account") Is DBNull.Value, "", row("Account"))
                            u.Zone = If(row("Zone") Is DBNull.Value, "", row("Zone"))

                            uList.Add(u)

                        Next
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCarrierCodeDetailsByID")
                Return Nothing
            End Try
            Return uList
        End Function

        'Added By Anubhuti 08/10/2021
#Region "FreightByCarrier"


        Public Function GetCustomerFreightByCarrierForFgrd(ByVal Customer As String) As List(Of BO.CustomerFreightByCarrier)

            Dim uList As New List(Of BO.CustomerFreightByCarrier)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetCustomerFreightByCarrier", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@Customer", Customer))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.CustomerFreightByCarrier()
                            u.ID = row("ID")
                            u.Customer = row("Customer")
                            u.Carrier = If(row("Carrier") Is DBNull.Value, "", row("Carrier"))
                            u.ChargeAmount = If(row("ChargeAmount") Is DBNull.Value, "", row("ChargeAmount"))
                            u.ChargeBy = If(row("ChargeBy") Is DBNull.Value, "", If(row("ChargeBy") = "P", "Pallet", If(row("ChargeBy") = "B", "Box", "Cube")))
                            u.ADDUSER = If(row("ADDUSER") Is DBNull.Value, "", row("ADDUSER"))
                            u.ADDDATE = If(row("ADDDATE") Is DBNull.Value, "", row("ADDDATE"))
                            u.UPDDATE = If(row("UPDDATE") Is DBNull.Value, "", row("UPDDATE"))
                            u.UPDUSER = If(row("UPDUSER") Is DBNull.Value, "", row("UPDUSER"))
                            uList.Add(u)
                            Me.TotalRows = ds.Tables(0).Rows.Count
                        Next
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCustomerFreightByCarrierForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function SaveCustomerFreightByCarrier(ByVal Customer As String, ByVal Carrier As String, ByVal ChargeAmount As String, ByVal ChargeBy As String, ByVal ID As String, ByVal User As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()

                Dim Cmd As New SqlCommand("spCustomerFreightByCarrierInsertUpdate", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@Customer", Customer)
                Cmd.Parameters.AddWithValue("@Carrier", Carrier)
                Cmd.Parameters.AddWithValue("@ChargeAmount", ChargeAmount)
                Cmd.Parameters.AddWithValue("@ChargeBy", ChargeBy)
                Cmd.Parameters.AddWithValue("@ADDUSER", User)
                Cmd.ExecuteNonQuery()

                Cmd.Dispose()
                SqlCon.Close()
                Return "Success"
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in SaveCustomerFreightByCarrier")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function GetCustomerFreightByCarrierByID(ByVal ID As String) As BO.CustomerFreightByCarrier
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim u As New BO.CustomerFreightByCarrier
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spCustomerFreightByCarrierbyID", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@ID", ID)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            u.ID = row("ID")
                            u.Customer = Convert.ToString(row("Customer"))
                            u.Carrier = Convert.ToString(row("Carrier"))
                            u.ChargeAmount = IIf(row("ChargeAmount") Is DBNull.Value, "0", row("ChargeAmount"))
                            u.ChargeBy = Convert.ToString(row("ChargeBy"))
                        Next
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCustomerFreightByCarrierByID")
                Return Nothing
            End Try
        End Function

        Public Shared Function DeleteCustomerFreightByID(ByVal ID As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()

                Dim Cmd As New SqlCommand("spDeleteCustomerFreightbyID", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.ExecuteNonQuery()
                Cmd.Dispose()
                SqlCon.Close()
                Return "Success"
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in DeleteCustomerFreightByID")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

#End Region
    End Class
End Namespace

Namespace BO
    Public Class CaCode
        Private _ID As Integer
        Public Property ID As Integer
            Get
                Return _ID
            End Get
            Set(value As Integer)
                _ID = value
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

        Private _CarrierName As String
        Public Property CarrierName() As String
            Get
                Return _CarrierName
            End Get
            Set(ByVal value As String)
                _CarrierName = value
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

        Private _Shipto As String
        Public Property Shipto() As String
            Get
                Return _Shipto
            End Get
            Set(ByVal value As String)
                _Shipto = value
            End Set
        End Property

        Private _Account As String
        Public Property Account() As String
            Get
                Return _Account
            End Get
            Set(ByVal value As String)
                _Account = value
            End Set
        End Property

        Private _Zone As String
        Public Property Zone() As String
            Get
                Return _Zone
            End Get
            Set(ByVal value As String)
                _Zone = value
            End Set
        End Property

        Private _AddUser As String
        Public Property AddUser() As String
            Get
                Return _AddUser
            End Get
            Set(ByVal value As String)
                _AddUser = value
            End Set
        End Property

        Private _AddDate As String
        Public Property AddDate() As String
            Get
                Return _AddDate
            End Get
            Set(ByVal value As String)
                _AddDate = value
            End Set
        End Property

        Private _AddTime As String
        Public Property AddTime() As String
            Get
                Return _AddTime
            End Get
            Set(ByVal value As String)
                _AddTime = value
            End Set
        End Property

        Private _UpdUser As String
        Public Property UpdUser() As String
            Get
                Return _UpdUser
            End Get
            Set(ByVal value As String)
                _UpdUser = value
            End Set
        End Property

        Private _UpdDate As String
        Public Property UpdDate() As String
            Get
                Return _UpdDate
            End Get
            Set(ByVal value As String)
                _UpdDate = value
            End Set
        End Property

        Private _UpdTime As String
        Public Property UpdTime() As String
            Get
                Return _UpdTime
            End Get
            Set(ByVal value As String)
                _UpdTime = value
            End Set
        End Property
    End Class

    'Added by Anubhuti 09/10/2021
    Public Class CustomerFreightByCarrier
        Private _ID As Integer
        Public Property ID As Integer
            Get
                Return _ID
            End Get
            Set(value As Integer)
                _ID = value
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

        Private _Carrier As String
        Public Property Carrier() As String
            Get
                Return _Carrier
            End Get
            Set(ByVal value As String)
                _Carrier = value
            End Set
        End Property
        Private _ChargeAmount As String
        Public Property ChargeAmount() As String
            Get
                Return _ChargeAmount
            End Get
            Set(ByVal value As String)
                _ChargeAmount = value
            End Set
        End Property
        Private _ChargeBy As String
        Public Property ChargeBy() As String
            Get
                Return _ChargeBy
            End Get
            Set(ByVal value As String)
                _ChargeBy = value
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
    End Class
End Namespace

