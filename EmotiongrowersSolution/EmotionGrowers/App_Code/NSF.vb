Imports System.Data.SqlClient
Imports System.Data

Public Class NSF
    Public Shared Function GetCountForReturnedChecks(ByVal ReturnedChecksFromDate As String, ReturnedChecksToDate As String, ByVal ReturnedChecksCustomerNo As String, ByVal ReturnedChecksType As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim RowCount As Integer = 0

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using ReturnedChecksCmd As New SqlCommand("UDP_ARReturnedChecks", con)
                    ReturnedChecksCmd.CommandType = CommandType.StoredProcedure
                    ReturnedChecksCmd.Parameters.AddWithValue("@ReturnType", ReturnedChecksType)
                    ReturnedChecksCmd.Parameters.AddWithValue("@FromDate", ReturnedChecksFromDate)
                    ReturnedChecksCmd.Parameters.AddWithValue("@ToDate", ReturnedChecksToDate)
                    ReturnedChecksCmd.Parameters.AddWithValue("@Customer", ReturnedChecksCustomerNo)
                    Dim ReturnedChecksReader As SqlDataReader = ReturnedChecksCmd.ExecuteReader()
                    If ReturnedChecksReader.NextResult() Then
                        While ReturnedChecksReader.Read()
                            RowCount = ReturnedChecksReader(0)
                        End While
                    End If
                End Using
                con.Close()
            End Using
            Return RowCount
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCountForReturnedChecks")
            Throw ex
        End Try
    End Function
End Class

Public Class F_NSF

End Class
