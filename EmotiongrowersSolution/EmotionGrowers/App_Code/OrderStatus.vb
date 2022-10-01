
Imports System.Data.SqlClient
Imports System.Data

Namespace DAO
    Public Class OrderStatus

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Function GetOrderStatusListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                  ByVal numberOfRows As Integer) As List(Of BO.OrderStatus)

            Dim uList As New List(Of BO.OrderStatus)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetOrderStatus]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.OrderStatus()
                            u.ID = row("ID")
                            u.STATUS = row("STATUS")
                            u.DESC = row("DESC")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetOrderStatusListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function GetOrderStatusDetailByID(ByVal ID As String) As List(Of BO.OrderStatus)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim OrderStatusList As New List(Of BO.OrderStatus)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim sqlQuery As String = ""
                    sqlQuery = "SELECT ID,[STATUS],[DESC] FROM F_SPSTAT WHERE ID=" + ID + " ORDER BY STATUS"
                    Using cmd As New SqlCommand(sqlQuery, con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.OrderStatus()
                            u.ID = row("ID")
                            u.STATUS = row("STATUS")
                            u.DESC = row("DESC")
                            OrderStatusList.Add(u)
                        Next
                    End Using
                End Using
                Return OrderStatusList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetOrderStatusDetailsForFgrd")
                Throw ex
            End Try
        End Function

        Public Shared Function InsertOrderStatus(ByVal OrderStatusCode As String, ByVal OrderStatusDesc As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim OrderStatusScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_SPSTATInsert", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure

                Cmd.Parameters.AddWithValue("@OrderStatusCode", OrderStatusCode)
                Cmd.Parameters.AddWithValue("@OrderStatusDesc", OrderStatusDesc)
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
                    Logs.Savelog(UserDetails.ID, "Users", "InsertOrderStatus", "Added a new Status code <b>" + OrderStatusDesc + "</b>", OrderStatusScopeID.ToString())
                End If
                Return OrderStatusScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertOrderStatus")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function UpdateOrderStatus(ByVal ID As Integer, ByVal OrderStatusCode As String, ByVal OrderStatusDesc As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim OrderStatusScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_SPSTATUpdate", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@OrderStatusCode", OrderStatusCode)
                Cmd.Parameters.AddWithValue("@OrderStatusDESC", OrderStatusDesc)
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
                    Logs.Savelog(UserDetails.ID, "Users", "UpdateOrderStatus", "Updated a Status Code <b>" + OrderStatusDesc + "</b>", OrderStatusScopeID.ToString())
                End If
                Return OrderStatusScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in UpdateOrderStatus")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteOrderStatusbyID(ByVal ID As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("delete from  F_SPSTAT where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteOrderStatusbyID")
                Return "error"
            End Try
        End Function

    End Class
End Namespace

Namespace BO
    Public Class OrderStatus

        Private _ID As Integer
        Public Property ID As Integer
            Get
                Return _ID
            End Get
            Set(value As Integer)
                _ID = value
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

        Private _DESC As String
        Public Property DESC() As String
            Get
                Return _DESC
            End Get
            Set(ByVal value As String)
                _DESC = value
            End Set
        End Property
    End Class
End Namespace


