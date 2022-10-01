Imports System.Data.SqlClient
Imports System.Data


Namespace DAO
    Public Class Fuel

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Function GetFuelByBoxListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer) As List(Of BO.Fuel)

            Dim uList As New List(Of BO.Fuel)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetFuelByBox]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Fuel()
                            u.ID = row("ID")
                            u.UOM = row("UOM")
                            u.SALESTYPE = row("SALESTYPE")
                            u.FUEL = row("FUEL")
                            u.FROMDATE = row("FROMDATE")
                            u.TODATE = row("TODATE")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetFuelByBoxListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function GetFuelByBoxDetailByID(ByVal ID As String) As BO.Fuel
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim u As New BO.Fuel()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim sqlQuery As String = ""
                    sqlQuery = "SELECT ID,UOM,SALESTYPE,FUEL,FORMAT(FROMDATE,'MM/dd/yy') FROMDATE,FORMAT(TODATE,'MM/dd/yy') TODATE FROM F_FUEL WHERE ID=" + ID + " ORDER BY UOM"
                    Using cmd As New SqlCommand(sqlQuery, con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            u.ID = row("ID")
                            u.UOM = row("UOM")
                            u.SALESTYPE = row("SALESTYPE")
                            u.FUEL = row("FUEL")
                            u.FROMDATE = row("FROMDATE")
                            u.TODATE = row("TODATE")
                        Next
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetFuelByBoxDetailByID")
                Throw ex
            End Try
        End Function

        Public Shared Function InsertFuelByBox(ByVal FuelByBoxUom As String, ByVal FuelByBoxSalesType As String, ByVal FuelByBoxFuel As Decimal, ByVal FuelByBoxValidFrom As String, ByVal FuelByBoxValidTo As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim FuelByBoxScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_FUELInsert", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure

                Cmd.Parameters.AddWithValue("@FuelByBoxUom", FuelByBoxUom)
                Cmd.Parameters.AddWithValue("@FuelByBoxSalesType", FuelByBoxSalesType)
                Cmd.Parameters.AddWithValue("@FuelByBoxFuel", FuelByBoxFuel)
                Cmd.Parameters.AddWithValue("@FuelByBoxValidFrom", FuelByBoxValidFrom)
                Cmd.Parameters.AddWithValue("@FuelByBoxValidTo", FuelByBoxValidTo)
                Cmd.ExecuteNonQuery()

                Cmd.Dispose()
                SqlCon.Close()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "InsertFuelByBox", "Added a new Fuel by Box Type <b>" + FuelByBoxUom + "</b>", FuelByBoxScopeID.ToString())
                End If
                Return FuelByBoxScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertFuelByBox")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function UpdateFuelByBox(ByVal ID As Integer, ByVal FuelByBoxUom As String, ByVal FuelByBoxSalesType As String, ByVal FuelByBoxFuel As Decimal, ByVal FuelByBoxValidFrom As String, ByVal FuelByBoxValidTo As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim FuelByBoxScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_FUELUpdate", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@FuelByBoxUom", FuelByBoxUom)
                Cmd.Parameters.AddWithValue("@FuelByBoxSalesType", FuelByBoxSalesType)
                Cmd.Parameters.AddWithValue("@FuelByBoxFuel", FuelByBoxFuel)
                Cmd.Parameters.AddWithValue("@FuelByBoxValidFrom", FuelByBoxValidFrom)
                Cmd.Parameters.AddWithValue("@FuelByBoxValidTo", FuelByBoxValidTo)
                Cmd.ExecuteNonQuery()

                Cmd.Dispose()
                SqlCon.Close()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "UpdateFuelByBox", "Updated a Fuel by  Box type <b>" + FuelByBoxUom + "</b>", FuelByBoxScopeID.ToString())
                End If
                Return FuelByBoxScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in UpdateFuelByBox")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteFuelByBoxbyID(ByVal ID As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("delete from  F_FUEL where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteFuelByBoxbyID")
                Return "error"
            End Try
        End Function

    End Class
End Namespace

Namespace BO
    Public Class Fuel

        Private _ID As Integer
        Public Property ID As Integer
            Get
                Return _ID
            End Get
            Set(value As Integer)
                _ID = value
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

        Private _SALESTYPE As String
        Public Property SALESTYPE() As String
            Get
                Return _SALESTYPE
            End Get
            Set(ByVal value As String)
                _SALESTYPE = value
            End Set
        End Property

        Private _FUEL As Decimal
        Public Property FUEL() As Decimal
            Get
                Return _FUEL
            End Get
            Set(ByVal value As Decimal)
                _FUEL = value
            End Set
        End Property

        Private _FROMDATE As String
        Public Property FROMDATE() As String
            Get
                Return _FROMDATE
            End Get
            Set(ByVal value As String)
                _FROMDATE = value
            End Set
        End Property

        Private _TODATE As String
        Public Property TODATE() As String
            Get
                Return _TODATE
            End Get
            Set(ByVal value As String)
                _TODATE = value
            End Set
        End Property

    End Class
End Namespace


