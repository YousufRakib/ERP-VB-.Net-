Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Text
Imports System.Collections
Imports System.IO
Imports System.Data.SqlClient
Imports System.Data


Public Class GrowerCgs

    Public Shared Function GetGrowerCgDetailsyID(ID As String) As GrowerCg
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New GrowerCg
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblGrowerCg where ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.Farm = Convert.ToString(row("Farm"))
                        u.Period = Convert.ToDateTime(row("Period")).ToString("MM/dd/yyyy")
                        u.Amount = IIf(row("Amount") Is DBNull.Value, "0", row("Amount"))
                        u.Reason = IIf(row("Reason") Is DBNull.Value, "", row("Reason"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUserByID")
            Return Nothing
        End Try
    End Function


    Public Shared Function UpdateGrowerCg(ByVal ID As String, ByVal Farm As String, ByVal GrDate As String,
                                          ByVal Reason As String, ByVal Amount As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim sql As String = "UPDATE tblGrowerCg set Period=@Period,Reason=@Reason,Amount=@Amount,Farm=@Farm where ID=@ID"
            Using sqlcon As New SqlConnection(ConStr)
                sqlcon.Open()
                Using Cmd As New SqlCommand(sql, sqlcon)
                    Cmd.Parameters.AddWithValue("@Period", GrDate)
                    Cmd.Parameters.AddWithValue("@Reason", Reason)
                    Cmd.Parameters.AddWithValue("@Amount", Amount)
                    Cmd.Parameters.AddWithValue("@Farm", Farm)
                    Cmd.Parameters.AddWithValue("@ID", ID)
                    Cmd.CommandType = CommandType.Text
                    Cmd.ExecuteNonQuery()
                End Using
            End Using

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateGrowerCg")
        End Try
        Return "invalid"
    End Function

    Public Shared Function SaveGrowerCg(ByVal Farm As String, ByVal GrDate As String,
                                          ByVal Reason As String, ByVal Amount As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim sql As String = "Insert into tblGrowerCg (Farm,Period,Reason,Amount) values (@Farm,@Period,@Reason,@Amount)"
            Using sqlcon As New SqlConnection(ConStr)
                sqlcon.Open()
                Using Cmd As New SqlCommand(sql, sqlcon)
                    Cmd.Parameters.AddWithValue("@Period", GrDate)
                    Cmd.Parameters.AddWithValue("@Reason", Reason)
                    Cmd.Parameters.AddWithValue("@Amount", Amount)
                    Cmd.Parameters.AddWithValue("@Farm", Farm)
                    Cmd.CommandType = CommandType.Text
                    Cmd.ExecuteNonQuery()
                End Using
            End Using

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveGrowerCg")
        End Try
        Return "invalid"
    End Function


    Public Shared Function DeleteGrowerCg(ByVal ID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim sql As String = "Delete from tblGrowerCg where ID=@ID"
            Using sqlcon As New SqlConnection(ConStr)
                sqlcon.Open()
                Using Cmd As New SqlCommand(sql, sqlcon)
                    Cmd.Parameters.AddWithValue("@ID", ID)
                    Cmd.CommandType = CommandType.Text
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteGrowerCg")
        End Try
        Return "invalid"
    End Function



    Public Shared Function DeleteExpense(ByVal ID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using sqlcon As New SqlConnection(ConStr)
                sqlcon.Open()
                Using Cmd As New SqlCommand("spDeleteExpenseByID", sqlcon)
                    Cmd.Parameters.AddWithValue("@ID", ID)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteExpense")
        End Try
        Return "error"
    End Function

    Public Shared Function SaveOrUpdateExpense(ByVal ID As String, ByVal AWB As String, ByVal FARM As String, ByVal INVOICE As String, ByVal ENTRYNUM As String, ByVal DATEexp As String, ByVal FREIGHT As String, ByVal BOXES As String, ByVal FUMIGATION As String, ByVal OTHERCHARGES As String, ByVal HANDLING As String, ByVal ADDUSER As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using sqlcon As New SqlConnection(ConStr)
                sqlcon.Open()
                Using Cmd As New SqlCommand("spSaveOrUpdateExpense", sqlcon)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@ID", ID)
                    Cmd.Parameters.AddWithValue("@AWB", AWB)
                    Cmd.Parameters.AddWithValue("@FARM", FARM)
                    Cmd.Parameters.AddWithValue("@INVOICE", INVOICE)
                    Cmd.Parameters.AddWithValue("@ENTRYNUM", ENTRYNUM)
                    Cmd.Parameters.AddWithValue("@DATE", DATEexp)
                    Cmd.Parameters.AddWithValue("@FREIGHT", If(FREIGHT = "", "0", FREIGHT))
                    Cmd.Parameters.AddWithValue("@BOXES", If(BOXES = "", "0", BOXES))
                    Cmd.Parameters.AddWithValue("@FUMIGATION", If(FUMIGATION = "", "0", FUMIGATION))
                    Cmd.Parameters.AddWithValue("@OTHERCHARGES", If(OTHERCHARGES = "", "0", OTHERCHARGES))
                    Cmd.Parameters.AddWithValue("@HANDLING", If(HANDLING = "", "0", HANDLING))
                    Cmd.Parameters.AddWithValue("@ADDUSER", ADDUSER)
                    Cmd.ExecuteNonQuery()
                End Using
            End Using

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveOrUpdateExpense")
            Return "error"
        End Try
    End Function
    Public Shared Function GetAWBListForExpenses() As List(Of AWBs)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim AWBsList As New List(Of AWBs)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetAWBListForExpenses", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New AWBs
                        u.AWB = IIf(row("AWB") Is DBNull.Value, "", row("AWB"))
                        u.DATEREC = IIf(row("DATEREC") Is DBNull.Value, "", Convert.ToDateTime(row("DATEREC")).ToString("MM/dd/yyyy"))
                        u.CSREC = IIf(row("CSREC") Is DBNull.Value, "0", row("CSREC"))
                        u.CSRECFBE = IIf(row("fbe") Is DBNull.Value, "0", row("fbe"))
                        AWBsList.Add(u)
                    Next
                End Using
            End Using
            Return AWBsList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAWBListForExpenses")
            Return Nothing
        End Try
    End Function
    Public Shared Function GetExpenseByID(ByVal ID As String) As Expenses
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New Expenses
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetExpenseByID", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.Farm = Convert.ToString(row("Farm"))
                        u.ENTRYNUM = Convert.ToString(row("ENTRYNUM"))
                        u.AWB = IIf(row("AWB") Is DBNull.Value, "0", row("AWB"))
                        u.INVOICE = IIf(row("INVOICE") Is DBNull.Value, "0", row("INVOICE"))
                        u.DATEExp = row("Date").ToString()
                        u.BOXES = IIf(row("BOXES") Is DBNull.Value, "0", row("BOXES"))
                        u.FREIGHT = IIf(row("FREIGHT") Is DBNull.Value, "0", row("FREIGHT"))
                        u.FUMIGATION = IIf(row("FUMIGATION") Is DBNull.Value, "0", row("FUMIGATION"))
                        u.Amount = IIf(row("Amount") Is DBNull.Value, "0", row("Amount"))
                        u.OTHERCHARGES = IIf(row("OTHERCHARGES") Is DBNull.Value, "0", row("OTHERCHARGES"))
                        u.HANDLING = IIf(row("HANDLING") Is DBNull.Value, "0", row("HANDLING"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetExpenseByID")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFarmByAWB(ByVal AWB As String) As List(Of Expenses)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataTable
            Dim exList As New List(Of Expenses)()
            Using sqlcon As New SqlConnection(ConStr)
                sqlcon.Open()
                Using Cmd As New SqlCommand("spGetFarmByAWB", sqlcon)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@AWB", AWB)
                    Dim da As New SqlDataAdapter(Cmd)
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim u As New Expenses()
                        u.Farm = Convert.ToString(row("Farm"))
                        u.FarmName = Convert.ToString(row("NAME"))
                        exList.Add(u)
                    Next
                End Using
            End Using
            Return exList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetExpenseByID")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFbeByAWB(ByVal AWB As String, ByVal Farm As String) As Decimal
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataTable
            Dim exList As New List(Of Expenses)()
            Using sqlcon As New SqlConnection(ConStr)
                sqlcon.Open()
                Using Cmd As New SqlCommand("spGetFbeByAWB", sqlcon)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@AWB", AWB)
                    Cmd.Parameters.AddWithValue("@Farm", Farm)
                    Dim da As New SqlDataAdapter(Cmd)
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Return Convert.ToDecimal(row("FBE"))
                    Next
                End Using
            End Using
            Return 0

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetExpenses")
        End Try
        Return Nothing
    End Function
    Public Class GetExpensesFgrd
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetExpenses() As List(Of Expenses)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim dt As New DataTable
                Dim exList As New List(Of Expenses)()
                Using sqlcon As New SqlConnection(ConStr)
                    sqlcon.Open()
                    Using Cmd As New SqlCommand("spGetExpenses", sqlcon)
                        Cmd.CommandType = CommandType.StoredProcedure
                        Dim da As New SqlDataAdapter(Cmd)
                        da.Fill(dt)
                        For Each row In dt.Rows
                            Dim u As New Expenses()
                            u.ID = row("ID")
                            u.Farm = Convert.ToString(row("Farm"))
                            u.AWB = IIf(row("AWB") Is DBNull.Value, "0", row("AWB"))
                            u.INVOICE = IIf(row("INVOICE") Is DBNull.Value, "0", row("INVOICE"))
                            u.DATEExp = Convert.ToDateTime(row("Date")).ToString("MM/dd/yy")
                            u.BOXES = IIf(row("BOXES") Is DBNull.Value, "0", row("BOXES"))
                            u.FREIGHT = IIf(row("FREIGHT") Is DBNull.Value, "0", row("FREIGHT"))
                            u.FUMIGATION = IIf(row("FUMIGATION") Is DBNull.Value, "0", row("FUMIGATION"))
                            u.OTHERCHARGES = IIf(row("OTHERCHARGES") Is DBNull.Value, "0", row("OTHERCHARGES"))
                            u.HANDLING = IIf(row("HANDLING") Is DBNull.Value, "0", row("HANDLING"))
                            u.Amount = IIf(row("Amount") Is DBNull.Value, "0", row("Amount"))
                            exList.Add(u)
                        Next
                        Me.TotalRows = dt.Rows.Count
                    End Using
                End Using
                Return exList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetExpenses")
            End Try
            Return Nothing
        End Function
    End Class

    Public Class GetGrowerCgFgrd
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetGrowerCgForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                        ByVal numberOfRows As Integer) As List(Of GrowerCg)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of GrowerCg)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim Qry As String = ""
                    If whereClause <> "" Then
                        Qry = "select ROW_NUMBER() OVER(ORDER BY Period desc)'RECNO',Farm,Period,Reason,Amount,ID from tblGrowerCg where " + whereClause + ""
                    Else
                        Qry = "select ROW_NUMBER() OVER(ORDER BY Period desc)'RECNO',Farm,Period,Reason,Amount,ID from tblGrowerCg"
                    End If
                    Using cmd As New SqlCommand(Qry, con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        Dim TotalFBE As Decimal = 0
                        Dim TotalBoxes As Decimal = 0
                        For Each row In ds.Tables(0).Rows
                            Dim u As New GrowerCg()
                            u.ID = row("ID")
                            u.Farm = Convert.ToString(row("Farm"))
                            u.Period = Convert.ToDateTime(row("Period")).ToString("MM/dd/yy")
                            u.Amount = IIf(row("Amount") Is DBNull.Value, "0", row("Amount"))
                            u.Reason = IIf(row("Reason") Is DBNull.Value, "", row("Reason"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(0).Rows.Count
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGrowerCgForFgrd")
                Throw ex
            End Try
        End Function
    End Class
End Class

Public Class GrowerCg


    Private _ID As String
    Public Property ID() As String
        Get
            Return _ID
        End Get
        Set(value As String)
            _ID = value
        End Set
    End Property

    Private _Farm As String
    Public Property Farm() As String
        Get
            Return _Farm
        End Get
        Set(value As String)
            _Farm = value
        End Set
    End Property

    Private _Period As String
    Public Property Period() As String
        Get
            Return _Period
        End Get
        Set(value As String)
            _Period = value
        End Set
    End Property

    Private _Reason As String
    Public Property Reason() As String
        Get
            Return _Reason
        End Get
        Set(value As String)
            _Reason = value
        End Set
    End Property

    Private _Amount As Decimal
    Public Property Amount() As Decimal
        Get
            Return _Amount
        End Get
        Set(value As Decimal)
            _Amount = value
        End Set
    End Property

End Class


Public Class Expenses


    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(value As Integer)
            _ID = value
        End Set
    End Property

    Private _AWB As String
    Public Property AWB() As String
        Get
            Return _AWB
        End Get
        Set(value As String)
            _AWB = value
        End Set
    End Property

    Private _INVOICE As Integer
    Public Property INVOICE() As Integer
        Get
            Return _INVOICE
        End Get
        Set(value As Integer)
            _INVOICE = value
        End Set
    End Property

    Private _Farm As String
    Public Property Farm() As String
        Get
            Return _Farm
        End Get
        Set(value As String)
            _Farm = value
        End Set
    End Property

    Private _FarmName As String
    Public Property FarmName() As String
        Get
            Return _FarmName
        End Get
        Set(value As String)
            _FarmName = value
        End Set
    End Property

    Private _ENTRYNUM As String
    Public Property ENTRYNUM() As String
        Get
            Return _ENTRYNUM
        End Get
        Set(value As String)
            _ENTRYNUM = value
        End Set
    End Property

    Private _DATE As String
    Public Property DATEExp() As String
        Get
            Return _DATE
        End Get
        Set(value As String)
            _DATE = value
        End Set
    End Property

    Private _FREIGHT As Decimal
    Public Property FREIGHT() As Decimal
        Get
            Return _FREIGHT
        End Get
        Set(value As Decimal)
            _FREIGHT = value
        End Set
    End Property

    Private _BOXES As Decimal
    Public Property BOXES() As Decimal
        Get
            Return _BOXES
        End Get
        Set(value As Decimal)
            _BOXES = value
        End Set
    End Property

    Private _WEIGHT As Decimal
    Public Property WEIGHT() As Decimal
        Get
            Return _WEIGHT
        End Get
        Set(value As Decimal)
            _WEIGHT = value
        End Set
    End Property

    Private _FUMIGATION As Decimal
    Public Property FUMIGATION() As Decimal
        Get
            Return _FUMIGATION
        End Get
        Set(value As Decimal)
            _FUMIGATION = value
        End Set
    End Property

    Private _TEMPERATUR As Integer
    Public Property TEMPERATUR() As Integer
        Get
            Return _TEMPERATUR
        End Get
        Set(value As Integer)
            _TEMPERATUR = value
        End Set
    End Property

    Private _Amount As Decimal
    Public Property Amount() As Decimal
        Get
            Return _Amount
        End Get
        Set(value As Decimal)
            _Amount = value
        End Set
    End Property

    Private _OTHERCHARGES As Decimal
    Public Property OTHERCHARGES() As Decimal
        Get
            Return _OTHERCHARGES
        End Get
        Set(value As Decimal)
            _OTHERCHARGES = value
        End Set
    End Property

    Private _HANDLING As Decimal
    Public Property HANDLING() As Decimal
        Get
            Return _HANDLING
        End Get
        Set(value As Decimal)
            _HANDLING = value
        End Set
    End Property

End Class


Public Class AWBs


    Private _AWB As String
    Public Property AWB() As String
        Get
            Return _AWB
        End Get
        Set(value As String)
            _AWB = value
        End Set
    End Property

    Private _DATEREC As String
    Public Property DATEREC() As String
        Get
            Return _DATEREC
        End Get
        Set(value As String)
            _DATEREC = value
        End Set
    End Property

    Private _CSREC As Integer
    Public Property CSREC() As Integer
        Get
            Return _CSREC
        End Get
        Set(value As Integer)
            _CSREC = value
        End Set
    End Property

    Private _CSRECFBE As Decimal
    Public Property CSRECFBE() As Decimal
        Get
            Return _CSRECFBE
        End Get
        Set(value As Decimal)
            _CSRECFBE = value
        End Set
    End Property
End Class

