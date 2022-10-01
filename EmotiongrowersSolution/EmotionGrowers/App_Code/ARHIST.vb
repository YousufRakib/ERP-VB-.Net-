Imports System.Data.SqlClient
Imports System.Data



Public Class ARHIST
    Public Shared Function GetCountForAllInvoices(ByVal InvoicesFromDate As String, InvoicesToDate As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim RowCount As Integer = 0

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using InvoicesCmd As New SqlCommand("UDP_ARAllInvoices", con)
                    InvoicesCmd.CommandType = CommandType.StoredProcedure
                    InvoicesCmd.Parameters.AddWithValue("@FromDate", InvoicesFromDate)
                    InvoicesCmd.Parameters.AddWithValue("@ToDate", InvoicesToDate)
                    Dim InvoicesReader As SqlDataReader = InvoicesCmd.ExecuteReader()
                    If InvoicesReader.NextResult() Then
                        While InvoicesReader.Read()
                            RowCount = InvoicesReader(0)
                        End While
                    End If
                End Using
                con.Close()
            End Using
            Return RowCount
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCountForAllInvoices")
            Throw ex
        End Try
    End Function

    Public Shared Function GetCountForCreditsByCust(ByVal CreditsFromDate As String, CreditsToDate As String, ByVal CreditsDateType As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim RowCount As Integer = 0

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using CreditsCmd As New SqlCommand("UDP_ARCredits", con)
                    CreditsCmd.CommandType = CommandType.StoredProcedure
                    CreditsCmd.Parameters.AddWithValue("@CreditType", CreditsDateType)
                    CreditsCmd.Parameters.AddWithValue("@FromDate", CreditsFromDate)
                    CreditsCmd.Parameters.AddWithValue("@ToDate", CreditsToDate)
                    Dim CreditsReader As SqlDataReader = CreditsCmd.ExecuteReader()
                    If CreditsReader.NextResult() Then
                        While CreditsReader.Read()
                            RowCount = CreditsReader(0)
                        End While
                    End If
                End Using
                con.Close()
            End Using
            Return RowCount
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCountForCreditsByCust")
            Throw ex
        End Try
    End Function
End Class


