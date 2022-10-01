Imports System.Data.SqlClient
Imports System.Data


Namespace DAO
    Public Class Colors
        Public Shared Function LoadColors() As List(Of BO.Colors)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim UList As New List(Of BO.Colors)
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SELECT ID,COLORCODE FROM F_COLORS order by colorcode asc", con)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Colors
                            u.ID = row("ID")
                            u.ColorCode = row("COLORCODE")
                            UList.Add(u)
                        Next
                    End Using
                End Using
                Return UList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in LoadColors")
                Return Nothing
            End Try
        End Function

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Function GetColorsListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer) As List(Of BO.Colors)

            Dim uList As New List(Of BO.Colors)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetColors]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Colors()
                            u.ID = row("ID")
                            u.ColorCode = row("ColorCode")
                            u.ShortCode = If(row("ShortCode") Is DBNull.Value, "", row("ShortCode"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetColorsListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function AddEditDetleteSelectColors(ByVal ID As String, ByVal ColorCode As String, ByVal Mode As String, ByVal ShortCode As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim ColorsScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_Colors", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@ColorCode", ColorCode)
                Cmd.Parameters.AddWithValue("@ShortCode", ShortCode)
                Cmd.Parameters.AddWithValue("@Mode", Mode)
                ColorsScopeID = Cmd.ExecuteScalar()

                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "AddEditDetleteSelectColors", IIf(ID = "0", "Added a new Color Code <b>" + ColorCode + "</b>", "Updated a Color Code <b>" + ColorCode + "</b>"), ColorsScopeID.ToString())
                End If
                Return ColorsScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in AddEditDetleteSelectColors")
                End If
                Return ex.Message()
            End Try
        End Function

        Public Shared Function GetColorsByID(ByVal ID As String) As BO.Colors
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim u As New BO.Colors()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SELECT * FROM F_COLORS WHERE ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            u.ID = row("ID")
                            If IsDBNull(row("ColorCode")) Then
                                u.ColorCode = ""
                            Else
                                u.ColorCode = row("ColorCode")
                            End If
                            If IsDBNull(row("ShortCode")) Then
                                u.ShortCode = ""
                            Else
                                u.ShortCode = row("ShortCode")
                            End If
                        Next
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetColorsByID")
                Throw ex
            End Try
        End Function


    End Class
End Namespace

Namespace BO
    Public Class Colors
        Private _ID As String
        Public Property ID() As String
            Get
                Return _ID
            End Get
            Set(ByVal value As String)
                _ID = value
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

        Private _Shortcode As String
        Public Property ShortCode() As String
            Get
                Return _Shortcode
            End Get
            Set(ByVal value As String)
                _Shortcode = value
            End Set
        End Property

    End Class
End Namespace
