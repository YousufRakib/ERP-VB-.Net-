Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Public Class BoxTypes
    Public Shared Function InsertBoxTypes(ByVal KometID As String, ByVal Code As String, ByVal fbe As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("Insert into  K_BoxTypes values ('" + Code.ToString() + "','" + fbe.ToString() + "'," + KometID.ToString() + ")", con)
                    cmd1.CommandType = CommandType.Text
                    Dim result1 = cmd1.ExecuteNonQuery()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in InsertBoxTypes")
            Return Nothing
        End Try
        Return ""
    End Function

    Public Shared Function EmptyBoxTypes() As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("truncate table K_BoxTypes", con)
                    cmd1.CommandType = CommandType.Text
                    Dim result1 = cmd1.ExecuteNonQuery()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in InsertBoxTypes")
            Return Nothing
        End Try
        Return ""
    End Function

    Public Shared Function GetBoxTypeKometID(ByVal Code As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim kometid As String

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select KometID from K_Boxtypes where code='" + Code + "'", con)
                    cmd.CommandType = CommandType.Text
                    kometid = cmd.ExecuteScalar()


                End Using
            End Using
            Return kometid
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in IsProductHaveKometID")
            Throw ex
        End Try
    End Function
End Class
Public Class BoxType
    Private _id As Integer
    Public Property id() As Integer
        Get
            Return _id
        End Get
        Set(ByVal value As Integer)
            _id = value
        End Set
    End Property

    Private _code As String
    Public Property code() As String
        Get
            Return _code
        End Get
        Set(ByVal value As String)
            _code = value
        End Set
    End Property


    Private _fbe As String
    Public Property fbe() As String
        Get
            Return _fbe
        End Get
        Set(ByVal value As String)
            _fbe = value
        End Set
    End Property
End Class
