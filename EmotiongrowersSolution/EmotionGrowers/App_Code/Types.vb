Imports System.Data.SqlClient
Imports System.Data



Namespace DAO
    Public Class Types

        Public Shared Function SaveCategories(ByVal CategoryList As String) As String
            Try

                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd1 As New SqlCommand("SpSaveCategories", con)
                        cmd1.CommandType = CommandType.StoredProcedure
                        cmd1.Parameters.AddWithValue("@CategoryList", CategoryList.ToString())
                        Dim result1 = cmd1.ExecuteScalar()
                        Return result1
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in SaveCategories")
                Return Nothing
            End Try
            Return ""
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

        Public Function GetProdCatListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                          ByVal numberOfRows As Integer) As List(Of BO.Types)

            Dim uList As New List(Of BO.Types)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetProdCat]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Types()
                            u.ID = row("ID")
                            u.TYPE = row("TYPE")
                            u.NAME = row("NAME")
                            u.PERCENT0 = If(row("PERCENT0") Is DBNull.Value, 0, row("PERCENT0"))
                            u.PERCENT1 = If(row("PERCENT1") Is DBNull.Value, 0, row("PERCENT1"))
                            u.PERCENT2 = If(row("PERCENT2") Is DBNull.Value, 0, row("PERCENT2"))
                            u.Markups = u.PERCENT0.ToString() + "   -   " + u.PERCENT1.ToString() + "   -   " + u.PERCENT2.ToString()
                            u.DAYS = If(row("DAYS") Is DBNull.Value, 0, row("DAYS"))
                            u.UNITS = If(row("UNITS") Is DBNull.Value, 0, row("UNITS"))
                            u.UnitsDays = u.UNITS.ToString() + " / " + u.DAYS.ToString()
                            u.MainType = If(row("MAINTYPE") Is DBNull.Value, "", row("MAINTYPE"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetProdCatListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function GetProdCatDetailByID(ByVal ID As String) As List(Of BO.Types)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim ProdCatList As New List(Of BO.Types)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim sqlQuery As String = ""
                    sqlQuery = "SELECT ID,TYPE,NAME,PERCENT0,PERCENT1,PERCENT2,DAYS,UNITS,SOLDAS,MINPRICE,MAXPRICE,MAINTYPE FROM F_TYPES WHERE ID=" + ID + " ORDER BY TYPE"
                    Using cmd As New SqlCommand(sqlQuery, con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Types()
                            u.ID = row("ID")
                            u.TYPE = row("TYPE")
                            u.NAME = row("NAME")
                            u.PERCENT0 = If(row("PERCENT0") Is DBNull.Value, 0, row("PERCENT0"))
                            u.PERCENT1 = If(row("PERCENT1") Is DBNull.Value, 0, row("PERCENT1"))
                            u.PERCENT2 = If(row("PERCENT2") Is DBNull.Value, 0, row("PERCENT2"))
                            u.DAYS = If(row("DAYS") Is DBNull.Value, 0, row("DAYS"))
                            u.UNITS = If(row("UNITS") Is DBNull.Value, 0, row("UNITS"))
                            u.SOLDAS = If(row("SOLDAS") Is DBNull.Value, "", row("SOLDAS"))
                            u.MINPRICE = If(row("MINPRICE") Is DBNull.Value, 0, row("MINPRICE"))
                            u.MAXPRICE = If(row("MAXPRICE") Is DBNull.Value, 0, row("MAXPRICE"))
                            u.MainType = If(row("MAINTYPE") Is DBNull.Value, "", row("MAINTYPE"))
                            ProdCatList.Add(u)
                        Next
                    End Using
                End Using
                Return ProdCatList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetProdCatDetailByID")
                Throw ex
            End Try
        End Function

        Public Shared Function InsertProdCat(ByVal ProdCatType As String, ByVal ProdCatName As String, ByVal Soldas As String, ByVal UNITS As Integer,
    ByVal Days As Integer, ByVal Percent0 As Integer, ByVal Percent1 As Integer, ByVal Percent2 As Integer, ByVal MinPrice As Decimal, ByVal MaxPrice As Decimal, ByVal MainType As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim ProdCatScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_TYPESInsert", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure

                Cmd.Parameters.AddWithValue("@ProdCatType", ProdCatType)
                Cmd.Parameters.AddWithValue("@ProdCatName", ProdCatName)
                Cmd.Parameters.AddWithValue("@Soldas", Soldas)
                Cmd.Parameters.AddWithValue("@UNITS", UNITS)
                Cmd.Parameters.AddWithValue("@Days", Days)
                Cmd.Parameters.AddWithValue("@Percent0", Percent0)
                Cmd.Parameters.AddWithValue("@Percent1", Percent1)
                Cmd.Parameters.AddWithValue("@Percent2", Percent2)
                Cmd.Parameters.AddWithValue("@MINPRICE", MinPrice)
                Cmd.Parameters.AddWithValue("@MAXPRICE", MaxPrice)
                Cmd.Parameters.AddWithValue("@MainType", MainType)

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
                    Logs.Savelog(UserDetails.ID, "Users", "InsertProdCat", "Added a new Customer Type <b>" + ProdCatName + "</b>", ProdCatScopeID.ToString())
                End If
                Return ProdCatScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertProdCat")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function UpdateProdCat(ByVal ID As Integer, ByVal ProdCatType As String, ByVal ProdCatName As String, ByVal Soldas As String, ByVal UNITS As Integer,
    ByVal Days As Integer, ByVal Percent0 As Integer, ByVal Percent1 As Integer, ByVal Percent2 As Integer, ByVal MinPrice As Decimal, ByVal MaxPrice As Decimal, ByVal MainType As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim ProdCatScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_TYPESUpdate", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@ProdCatType", ProdCatType)
                Cmd.Parameters.AddWithValue("@ProdCatName", ProdCatName)
                Cmd.Parameters.AddWithValue("@Soldas", Soldas)
                Cmd.Parameters.AddWithValue("@UNITS", UNITS)
                Cmd.Parameters.AddWithValue("@Days", Days)
                Cmd.Parameters.AddWithValue("@Percent0", Percent0)
                Cmd.Parameters.AddWithValue("@Percent1", Percent1)
                Cmd.Parameters.AddWithValue("@Percent2", Percent2)
                Cmd.Parameters.AddWithValue("@MINPRICE", MinPrice)
                Cmd.Parameters.AddWithValue("@MAXPRICE", MaxPrice)
                Cmd.Parameters.AddWithValue("@MainType", MainType)
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
                    Logs.Savelog(UserDetails.ID, "Users", "UpdateProdCat", "Updated a Product categories <b>" + ProdCatName + "</b>", ProdCatScopeID.ToString())
                End If
                Return ProdCatScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in UpdateProdCat")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteProdCatbyID(ByVal ID As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("delete from  F_TYPES where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteProdCatbyID")
                Return "error"
            End Try
        End Function

        Public Shared Function LoadTypes() As List(Of BO.Types)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of BO.Types)
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("Select Distinct(TYPE),NAME From F_TYPES", con)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Types
                            u.TYPE = row("TYPE")
                            u.NAME = row("NAME")
                            uList.Add(u)
                        Next
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in LoadTypes")
                Return Nothing
            End Try
        End Function

    End Class

End Namespace

Namespace BO
    Public Class Types

        Private _ID As Integer
        Public Property ID As Integer
            Get
                Return _ID
            End Get
            Set(value As Integer)
                _ID = value
            End Set
        End Property

        Private _TYPE As String
        Public Property TYPE() As String
            Get
                Return _TYPE
            End Get
            Set(ByVal value As String)
                _TYPE = value
            End Set
        End Property

        Private _NAME As String
        Public Property NAME() As String
            Get
                Return _NAME
            End Get
            Set(ByVal value As String)
                _NAME = value
            End Set
        End Property

        Private _PERCENT0 As Integer
        Public Property PERCENT0() As Integer
            Get
                Return _PERCENT0
            End Get
            Set(ByVal value As Integer)
                _PERCENT0 = value
            End Set
        End Property

        Private _PERCENT1 As Integer
        Public Property PERCENT1() As Integer
            Get
                Return _PERCENT1
            End Get
            Set(ByVal value As Integer)
                _PERCENT1 = value
            End Set
        End Property

        Private _PERCENT2 As Integer
        Public Property PERCENT2() As Integer
            Get
                Return _PERCENT2
            End Get
            Set(ByVal value As Integer)
                _PERCENT2 = value
            End Set
        End Property

        Private _MINPRICE As Decimal
        Public Property MINPRICE() As Decimal
            Get
                Return _MINPRICE
            End Get
            Set(ByVal value As Decimal)
                _MINPRICE = value
            End Set
        End Property

        Private _MAXPRICE As Decimal
        Public Property MAXPRICE() As Decimal
            Get
                Return _MAXPRICE
            End Get
            Set(ByVal value As Decimal)
                _MAXPRICE = value
            End Set
        End Property

        Private _DAYS As Integer
        Public Property DAYS() As Integer
            Get
                Return _DAYS
            End Get
            Set(ByVal value As Integer)
                _DAYS = value
            End Set
        End Property

        Private _UNITS As Integer
        Public Property UNITS() As Integer
            Get
                Return _UNITS
            End Get
            Set(ByVal value As Integer)
                _UNITS = value
            End Set
        End Property

        Private _Markups As String
        Public Property Markups() As String
            Get
                Return _Markups
            End Get
            Set(value As String)
                _Markups = value
            End Set
        End Property

        Private _SOLDAS As String
        Public Property SOLDAS() As String
            Get
                Return _SOLDAS
            End Get
            Set(ByVal value As String)
                _SOLDAS = value
            End Set
        End Property

        Private _UnitsDays As String
        Public Property UnitsDays() As String
            Get
                Return _UnitsDays
            End Get
            Set(value As String)
                _UnitsDays = value
            End Set
        End Property

        Private _MainType As String
        Public Property MainType() As String
            Get
                Return _MainType
            End Get
            Set(value As String)
                _MainType = value
            End Set
        End Property
    End Class
End Namespace

