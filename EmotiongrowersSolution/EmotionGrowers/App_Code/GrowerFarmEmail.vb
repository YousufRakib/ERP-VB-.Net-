Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Text
Imports System.Collections
Imports System.IO
Imports System.Data.SqlClient
Imports System.Data

Public Class GrowerFarmEmails
    Public Class GetGrowerFarmEmailFgrd
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetGrowerFarmEmailForFgrd(ByVal whereClause As String, ByVal HeaderID As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                        ByVal numberOfRows As Integer) As List(Of Farm)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of Farm)()

                Using con As New SqlConnection(ConStr)
                    con.Open()

                    Using cmd As New SqlCommand("[spGrowerFarmEmail]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@HeaderID", HeaderID))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        Dim TotalFBE As Decimal = 0
                        Dim TotalBoxes As Decimal = 0
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Farm()
                            u.ID = row("ID")
                            u.Farm = Convert.ToString(row("Farm"))
                            u.Email = IIf(row("Email") Is DBNull.Value, "", row("Email"))
                            u.Name = IIf(row("FarmName") Is DBNull.Value, "", row("FarmName"))
                            u.FOB = IIf(row("FOB") Is DBNull.Value, "", row("FOB"))
                            u.City = IIf(row("FarmAirport") Is DBNull.Value, "", row("FarmAirport"))
                            u.Country = IIf(row("FarmCountry") Is DBNull.Value, "", row("FarmCountry"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(0).Rows.Count
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGrowerFarmEmailForFgrd")
                Throw ex
            End Try
        End Function
    End Class


    Public Shared Function SaveFarmEmailList() As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("SpSaveGrowerFarmEmail", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveFarmEmailList")
            Return Nothing
        End Try
        Return ""
    End Function

    Shared Function SaveGrowerFarmEmail(ByVal Farm As String, ByVal Email As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim sql As String = "insert into tblGrowerFarmEmail (Farm,Email) values (@Farm,@Email)"
            Using sqlcon As New SqlConnection(ConStr)
                sqlcon.Open()
                Using Cmd As New SqlCommand(sql, sqlcon)
                    Cmd.Parameters.AddWithValue("@Farm", Farm)
                    Cmd.Parameters.AddWithValue("@Email", Email)
                    Cmd.CommandType = CommandType.Text
                    Cmd.ExecuteNonQuery()
                End Using
            End Using

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveGrowerFarmEmail")
            Return ex.Message
        End Try
        Return "invalid"
    End Function

    Shared Function UpdateGrowerFarmEmail(ByVal ID As String, ByVal Farm As String, Email As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim sql As String = "UPDATE tblGrowerFarmEmail set Email=@Email,Farm=@Farm where ID=@ID"
            Using sqlcon As New SqlConnection(ConStr)
                sqlcon.Open()
                Using Cmd As New SqlCommand(sql, sqlcon)
                    Cmd.Parameters.AddWithValue("@Email", Email)
                    Cmd.Parameters.AddWithValue("@Farm", Farm)
                    Cmd.Parameters.AddWithValue("@ID", ID)
                    Cmd.CommandType = CommandType.Text
                    Cmd.ExecuteNonQuery()
                End Using
            End Using

            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateGrowerFarmEmail")
        End Try
        Return "invalid"
    End Function

    Shared Function GetGrowerFarmEmailDetailsByID(ByVal ID As String) As GrowerFarmEmail
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New GrowerFarmEmail
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblGrowerFarmEmail where ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", ID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.ID = row("ID")
                        u.Farm = Convert.ToString(row("Farm"))
                        u.Email = IIf(row("Email") Is DBNull.Value, "", row("Email"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetGrowerFarmEmailDetailsByID")
            Return Nothing
        End Try
    End Function

    Shared Function DeleteGrowerFarmEmail(ByVal ID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim sql As String = "Delete from tblGrowerFarmEmail where ID=@ID"
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
            ErrorLogs.LogException(ex, "Error in DeleteGrowerFarmEmail")
        End Try
        Return "invalid"
    End Function


    Public Shared Function GetGrowerFarmEmailByCode(ByVal FarmCode As String) As Farm
        Try
            Dim u As New Farm
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblGrowerFarmEmail where Farm=@farm", con)
                    cmd.Parameters.AddWithValue("@farm", FarmCode)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.Farm = row("Farm")
                        u.Email = Convert.ToString(row("Email"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetGrowerFarmEmailByCode")
            Return Nothing
        End Try
    End Function

End Class

Public Class GrowerFarmEmail

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

    Private _Email As String
    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(value As String)
            _Email = value
        End Set
    End Property
End Class
