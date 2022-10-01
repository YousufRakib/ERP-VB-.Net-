Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Xml


Public Class GrowerDetailNotes

    Public Shared Function SaveGrowerNotesByDetailID(ByVal GrowerDetailID As String, ByVal NoteNo As String, ByVal Notes As String, ByVal Amount As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("insert into tblGrowerDetailNotes(NoteNo,Notes,GrowerDetailID,Amount)values(@NoteNo,@Notes,@GrowerDetailID,@Amount)", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@NoteNo", NoteNo)
                    cmd.Parameters.AddWithValue("@Notes", Notes)
                    cmd.Parameters.AddWithValue("@GrowerDetailID", GrowerDetailID)
                    cmd.Parameters.AddWithValue("@Amount", Amount)
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveGrowerNotesByDetailID")
            Return ex.Message
        End Try
    End Function


    Public Shared Function UpdateGrowerNotesByNoteID(ByVal NoteID As String, ByVal NoteNo As String, ByVal Notes As String, ByVal Amount As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Update tblGrowerDetailNotes set Notes=@Notes,Amount=@Amount where ID=@NoteID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@NoteNo", NoteNo)
                    cmd.Parameters.AddWithValue("@Notes", Notes)
                    cmd.Parameters.AddWithValue("@Amount", Amount)
                    cmd.Parameters.AddWithValue("@NoteID", NoteID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateGrowerNotesID")
            Return ex.Message
        End Try
    End Function

    Public Shared Function DeleteGrowerNotesByID(ByVal ID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Delete from tblGrowerDetailNotes where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteGrowerNotesByID")
            Return ex.Message
        End Try
    End Function


    Public Shared Function GetGrowerNotesByNoteID(ByVal ID As String) As GrowerDetailNote
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New GrowerDetailNote()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblGrowerDetailNotes where ID=@ID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@ID", ID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    Dim TotalFBE As Decimal = 0
                    Dim TotalBoxes As Decimal = 0
                    For Each row In ds.Tables(0).Rows
                        u.GrowerDetailID = row("GrowerDetailID")
                        u.Notes = Convert.ToString(row("Notes"))
                        u.NotesID = row("ID")
                        u.NoteNo = Convert.ToString(row("NoteNo"))
                        u.Amount = IIf(row("Amount") Is DBNull.Value, 0.0, row("Amount"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetGrowerNotesByNoteID")
            Throw ex
        End Try
    End Function


    Public Class GetGrowerDetailNotesFgrd
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetGrowerNotesByDetailIDForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                        ByVal numberOfRows As Integer) As List(Of GrowerDetailNote)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of GrowerDetailNote)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select ROW_NUMBER() OVER(ORDER BY Notes) 'RECNO',Notes,NoteNo,GrowerDetailID,ID,Amount from tblGrowerDetailNotes where " + whereClause + "", con)
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
                            Dim u As New GrowerDetailNote()
                            u.GrowerDetailID = row("GrowerDetailID")
                            u.Notes = row("Notes")
                            u.NotesID = row("ID")
                            u.NoteNo = row("NoteNo")
                            u.Amount = IIf(row("Amount") Is DBNull.Value, 0.0, row("Amount"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(0).Rows.Count
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGrowerNotesByDetailIDForFgrd")
                Throw ex
            End Try
        End Function
    End Class



End Class


Public Class GrowerDetailNote

    Private _NotesID As Integer
    Public Property NotesID() As Integer
        Get
            Return _NotesID
        End Get
        Set(ByVal value As Integer)
            _NotesID = value
        End Set
    End Property

    Private _GrowerDetailID As Integer
    Public Property GrowerDetailID() As Integer
        Get
            Return _GrowerDetailID
        End Get
        Set(ByVal value As Integer)
            _GrowerDetailID = value
        End Set
    End Property

    Private _NoteNo As String
    Public Property NoteNo() As String
        Get
            Return _NoteNo
        End Get
        Set(ByVal value As String)
            _NoteNo = value
        End Set
    End Property

    Private _Notes As String
    Public Property Notes() As String
        Get
            Return _Notes
        End Get
        Set(ByVal value As String)
            _Notes = value
        End Set
    End Property

    Private _Amount As Decimal
    Public Property Amount() As Decimal
        Get
            Return _Amount
        End Get
        Set(ByVal value As Decimal)
            _Amount = value
        End Set
    End Property

End Class
