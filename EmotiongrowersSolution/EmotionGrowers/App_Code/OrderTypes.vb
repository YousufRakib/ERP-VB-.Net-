Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Namespace DAO
    Public Class OrderTypes
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetOrderTypesListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                      ByVal numberOfRows As Integer) As Tuple(Of DataSet, String)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim dt As New DataSet()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetOrderTypes]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        da.Fill(dt)
                    End Using
                End Using
                Dim result As New Tuple(Of DataSet, String)(dt, "success")
                Return result
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetOrderTypesListForFgrd")
                Dim result As New Tuple(Of DataSet, String)(Nothing, "Error in GetOrderTypesListForFgrd")
                Return result
            End Try
        End Function

        Public Shared Function InsertOrderTypes(ByVal OrderTypesCode As String, ByVal OrderTypesDesc As String, ByVal OrderTypesRepeat As Boolean, ByVal OrderTypesFrequency As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim OrderStatusScopeID As String = ""
                Dim Cmd As New SqlCommand("[spOrderTypes]", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@mode", 1)
                Cmd.Parameters.AddWithValue("@ID", 0)
                Cmd.Parameters.AddWithValue("@OrdertypeCode", OrderTypesCode)
                Cmd.Parameters.AddWithValue("@OrdertypeDesc", OrderTypesDesc)
                Cmd.Parameters.AddWithValue("@OrdertypeRepeat", OrderTypesRepeat)
                Cmd.Parameters.AddWithValue("@OrdertypeFrequency", OrderTypesFrequency)
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
                    Logs.Savelog(UserDetails.ID, "Users", "InsertOrderTypes", "Added a new Order Type code <b>" + OrderTypesCode + "</b>", OrderStatusScopeID.ToString())
                End If
                Return OrderStatusScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertOrderTypes")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function UpdateOrderTypes(ByVal ID As Integer, ByVal OrderTypesCode As String, ByVal OrderTypesDesc As String, ByVal OrderTypesRepeat As String, ByVal OrderTypesFrequency As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim OrderStatusScopeID As String = ""
                Dim Cmd As New SqlCommand("[spOrderTypes]", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@mode", 2)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@OrdertypeCode", OrderTypesCode)
                Cmd.Parameters.AddWithValue("@OrdertypeDesc", OrderTypesDesc)
                Cmd.Parameters.AddWithValue("@OrdertypeRepeat", OrderTypesRepeat)
                Cmd.Parameters.AddWithValue("@OrdertypeFrequency", OrderTypesFrequency)
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
                    Logs.Savelog(UserDetails.ID, "Users", "UpdateOrderTypes", "Updated a Order Type Code <b>" + OrderTypesCode + "</b>", OrderStatusScopeID.ToString())
                End If
                Return OrderStatusScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in UpdateOrderTypes")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteOrderTypesbyID(ByVal ID As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spOrderTypes]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@mode", 3)
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteOrderTypesbyID")
                Return "error"
            End Try
        End Function
        Public Shared Function GetOrderTypeDetailByID(ByVal ID As String) As List(Of BO.OrderType)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim OrderTypeList As New List(Of BO.OrderType)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim sqlQuery As String = ""
                    sqlQuery = "[spOrderTypes]"
                    Using cmd As New SqlCommand(sqlQuery, con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@mode", 4)
                        cmd.Parameters.AddWithValue("@ID", ID)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.OrderType()
                            u.OrderTypeId = row("OrderTypeId")
                            u.OrderTypeCode = row("OrderTypeCode")
                            u.DESC = row("DESC")
                            u.Repeat = If(Convert.ToBoolean(row("Repeat")) = True, "Y", "N")
                            u.Frequency = row("Frequency")
                            OrderTypeList.Add(u)
                        Next
                    End Using
                End Using
                Return OrderTypeList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetOrderTypeDetailByID")
                Throw ex
            End Try
        End Function
        Public Shared Function GetOrderTypesForAutoCompleteInSPORD(ByVal Searchtext As String) As List(Of BO.OrderType)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim OTList As New List(Of BO.OrderType)
                Dim whereClause As String = ""
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("GetOrderTypesForAutoCompleteInSPORD", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@SearchText", Searchtext)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.OrderType
                            u.OrderTypeId = row("OrderTypeId")
                            u.OrderTypeCode = row("OrderTypeCode")
                            u.DESC = row("DESC")
                            u.Repeat = row("Repeat")
                            u.Frequency = row("Frequency")
                            OTList.Add(u)
                        Next
                    End Using
                End Using
                Return OTList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetOrderTypesForAutoCompleteInSPORD")
                Return Nothing
            End Try
        End Function
    End Class
End Namespace

Namespace BO
    Public Class OrderType

        Private _OrderTypeId As Integer
        Public Property OrderTypeId As Integer
            Get
                Return _OrderTypeId
            End Get
            Set(value As Integer)
                _OrderTypeId = value
            End Set
        End Property

        Private _OrderTypeCode As String
        Public Property OrderTypeCode() As String
            Get
                Return _OrderTypeCode
            End Get
            Set(ByVal value As String)
                _OrderTypeCode = value
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
        Private _Repeat As String
        Public Property Repeat() As String
            Get
                Return _Repeat
            End Get
            Set(ByVal value As String)
                _Repeat = value
            End Set
        End Property
        Private _Frequency As Integer
        Public Property Frequency As Integer
            Get
                Return _Frequency
            End Get
            Set(value As Integer)
                _Frequency = value
            End Set
        End Property
    End Class
End Namespace