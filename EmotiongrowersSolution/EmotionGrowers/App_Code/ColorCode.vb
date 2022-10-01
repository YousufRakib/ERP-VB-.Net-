Imports System.Data.SqlClient
Imports System.Data


Namespace DAO
    Public Class ColorCode
        Public Shared Function LoadColorCode() As List(Of BO.ColorCode)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim UList As New List(Of BO.ColorCode)
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SELECT ID,CODE,COLOR,BGCOLOR FROM tblColorCode", con)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.ColorCode
                            u.ID = row("ID")
                            u.Code = row("CODE")
                            u.Color = row("COLOR")
                            u.BgColor = row("BGCOLOR")
                            UList.Add(u)
                        Next
                    End Using
                End Using
                Return UList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in LoadColorCode")
                Return Nothing
            End Try
        End Function

    End Class
End Namespace

Namespace BO
    Public Class ColorCode
        Private _ID As String
        Public Property ID() As String
            Get
                Return _ID
            End Get
            Set(ByVal value As String)
                _ID = value
            End Set
        End Property

        Private _Code As String
        Public Property Code() As String
            Get
                Return _Code
            End Get
            Set(ByVal value As String)
                _Code = value
            End Set
        End Property

        Private _Color As String
        Public Property Color() As String
            Get
                Return _Color
            End Get
            Set(ByVal value As String)
                _Color = value
            End Set
        End Property

        Private _BgColor As String
        Public Property BgColor() As String
            Get
                Return _BgColor
            End Get
            Set(ByVal value As String)
                _BgColor = value
            End Set
        End Property

    End Class
End Namespace
