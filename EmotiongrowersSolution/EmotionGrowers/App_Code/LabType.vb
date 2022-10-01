Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO

Public Class LabType
    Public Shared Function SaveLabeltype(ByVal Labeltype As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim UserScopeID As String = ""
            Dim Cmd As New SqlCommand("insert into tblLabelType(LabelType,CreatedDate) values (@LabelType,getdate())", SqlCon)
            Cmd.CommandType = CommandType.Text
            Cmd.Parameters.AddWithValue("@LabelType", Labeltype)
            Cmd.ExecuteNonQuery()
            Cmd.Dispose()
            SqlCon.Close()
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In SaveLabeltype")
            Return ex.Message
        End Try
    End Function

    Public Shared Function EditLabeltype(ByVal Labeltype As String, ByVal OldId As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim Cmd As New SqlCommand("update tblLabelType set LabelType=@LabelType WHERE ID=@OldId", SqlCon)
            Cmd.CommandType = CommandType.Text
            Cmd.Parameters.AddWithValue("@LabelType", Labeltype)
            Cmd.Parameters.AddWithValue("@OldId", OldId)
            Cmd.ExecuteNonQuery()
            Cmd.Dispose()
            SqlCon.Close()
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In EditLabeltype")
            Return ex.Message
        End Try
    End Function

    Shared Function DeleteLabeltype(ByVal ID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim SqlCon As New SqlConnection(ConStr)
            SqlCon.Open()
            Dim sql As String = "Delete from tblLabelType where ID=@ID"
            Using Cmd As New SqlCommand(sql, SqlCon)
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.CommandType = CommandType.Text
                Cmd.ExecuteNonQuery()
            End Using
            SqlCon.Close()
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In DeleteLabeltype")
            Return ex.Message
        End Try
        Return "invalid"
    End Function

    Public Shared Function GetLabelTypeById(ByVal ID As Integer) As LabTypes
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim u As New LabTypes
        Using con As New SqlConnection(ConStr)
            con.Open()
            Using cmd As New SqlCommand("select * from tblLabelType where ID=@ID", con)
                cmd.Parameters.AddWithValue("@ID", ID)
                Dim da As New SqlDataAdapter(cmd)
                Dim ds As New DataSet
                da.Fill(ds)
                For Each row In ds.Tables(0).Rows
                    u.ID = row("ID")
                    u.Labeltype = row("Labeltype")
                Next
            End Using
        End Using
        Return u
    End Function

    Public Shared Function GetLabelType() As List(Of LabTypes)
        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
        Dim UList As New List(Of LabTypes)
        Using con As New SqlConnection(ConStr)
            con.Open()
            Using cmd As New SqlCommand("select * from tblLabelType", con)
                Dim da As New SqlDataAdapter(cmd)
                Dim ds As New DataSet
                da.Fill(ds)
                For Each row In ds.Tables(0).Rows
                    Dim u As New LabTypes
                    u.ID = row("ID")
                    u.Labeltype = row("Labeltype")
                    UList.Add(u)
                Next
            End Using
        End Using
        Return UList
    End Function

    Public Class GetLabelTypeDetails

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property


        Public Function GetSpLabelType(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of LabTypes)

            Dim uList As New List(Of LabTypes)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("spGetLabelType", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New LabTypes()
                            u.ID = row("ID")
                            u.Labeltype = row("Labeltype")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception

            End Try
            Return uList
        End Function
    End Class
End Class


Public Class LabTypes

    Private _ID As String
    Public Property ID() As String
        Get
            Return _ID
        End Get
        Set(value As String)
            _ID = value
        End Set
    End Property

    Private _Labeltype As String
    Public Property Labeltype() As String
        Get
            Return _Labeltype
        End Get
        Set(value As String)
            _Labeltype = value
        End Set
    End Property

End Class

