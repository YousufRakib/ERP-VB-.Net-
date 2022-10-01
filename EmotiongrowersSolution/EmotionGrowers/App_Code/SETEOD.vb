
Imports System.Data.SqlClient
Imports System.Data



Namespace DAO

    Public Class SETEOD

        Public Shared Function GetTypeFromSETEOD() As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim Type As String = ""
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SpGetTypeFromSETEOD", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dsEOD As New DataTable
                        da.Fill(dsEOD)
                        Dim Setup1 As String = Convert.ToString(dsEOD.Rows(0)("Setup1"))
                        Type = Convert.ToString(Setup1.Substring(30, 1))
                    End Using
                End Using
                Return Type
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetTypeFromSETEOD")
                Return ""
            End Try
        End Function




    End Class

End Namespace

