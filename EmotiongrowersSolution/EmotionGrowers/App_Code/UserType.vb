Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Configuration

Public Class UserTypes
    Public Shared Function LoadUserType() As List(Of UserType)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of UserType)()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblUserType", con)
                    cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New UserType
                        u.ID = row("ID")
                        u.UserType = row("UserType")
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in LoadUserType")
            Return Nothing
        End Try
    End Function


End Class


Public Class UserType

    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(value As Integer)
            _ID = value
        End Set
    End Property

    Private _UserType As String
    Public Property UserType() As String
        Get
            Return _UserType
        End Get
        Set(value As String)
            _UserType = value
        End Set
    End Property




End Class


