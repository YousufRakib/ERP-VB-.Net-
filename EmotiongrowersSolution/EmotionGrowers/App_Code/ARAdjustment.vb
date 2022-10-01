Imports System.Data.SqlClient
Imports System.Data


Public Class ARAdjustment
    Public Shared Function GetCountForAdjustment(ByVal AdjustmentFromDate As String, AdjustmentToDate As String, ByVal AdjustmentDateType As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim RowCount As Integer = 0

            Using con As New SqlConnection(ConStr)
                con.Open()
                Using AdjustmentCmd As New SqlCommand("UDP_ARAdjustment", con)
                    AdjustmentCmd.CommandType = CommandType.StoredProcedure
                    AdjustmentCmd.Parameters.AddWithValue("@AdjustmentDateType", AdjustmentDateType)
                    AdjustmentCmd.Parameters.AddWithValue("@FromDate", AdjustmentFromDate)
                    AdjustmentCmd.Parameters.AddWithValue("@ToDate", AdjustmentToDate)
                    Dim AdjustmentReader As SqlDataReader = AdjustmentCmd.ExecuteReader()
                    If AdjustmentReader.NextResult() Then
                        While AdjustmentReader.Read()
                            RowCount = AdjustmentReader(0)
                        End While
                    End If
                End Using
                con.Close()
            End Using
            Return RowCount
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetCountForAdjustment")
            Throw ex
        End Try
    End Function

    Public Shared Function GetAdjustmentReason(ByVal Customer As String, ByVal Invoice As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
            Dim Reason As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using adjCommand As New SqlCommand("select Reason from f_aradj where Customer=@Customer and Invoice=@Invoice", con)
                    adjCommand.CommandType = CommandType.Text
                    adjCommand.Parameters.AddWithValue("@Customer", Customer)
                    adjCommand.Parameters.AddWithValue("@Invoice", Invoice)
                    Dim adjReader As SqlDataReader = adjCommand.ExecuteReader()
                    If adjReader.NextResult() Then
                        While adjReader.Read()
                            Reason = adjReader(0)
                        End While
                    End If
                End Using
            End Using
            Return Reason
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetAdjustmentReason")
            Throw ex
        End Try
    End Function
End Class

Public Class F_ARADJ

End Class
