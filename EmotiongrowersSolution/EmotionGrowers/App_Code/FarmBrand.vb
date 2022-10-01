Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO


Public Class FarmBrandModel
    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Private _Farm As String

    Public Property Farm() As String
        Get
            Return _Farm
        End Get
        Set(ByVal value As String)
            _Farm = value
        End Set
    End Property

    Private _Name As String
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(ByVal value As String)
            _Name = value
        End Set
    End Property

    Private _Category As String
    Public Property Category() As String
        Get
            Return _Category
        End Get
        Set(ByVal value As String)
            _Category = value
        End Set
    End Property

    Private _Brand As String
    Public Property Brand() As String
        Get
            Return _Brand
        End Get
        Set(ByVal value As String)
            _Brand = value
        End Set
    End Property

End Class

Public Class FarmBrand
    Public Shared Function GetFarmBrand(ByVal Farm As String) As List(Of FarmBrandModel)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of FarmBrandModel)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Dim Qry As String = ""
                Qry = "select ID,FARM,Cat,NAME,BRAND from f_farmbr where farm = @Farm ORDER BY Farm ASC"
                Using cmd As New SqlCommand(Qry, con)
                    cmd.Parameters.AddWithValue("@Farm", Farm)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    If ds.Tables(0).Rows.Count > 0 Then
                        For Each row In ds.Tables(0).Rows
                            Dim u As New FarmBrandModel
                            u.ID = row("ID")
                            u.Farm = row("Farm")
                            u.Category = row("Cat")
                            u.Name = row("Name")
                            u.Brand = row("Brand")
                            uList.Add(u)
                        Next
                    Else
                        Return Nothing
                    End If
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFarmBrand")
            Return Nothing
        End Try

    End Function

End Class
