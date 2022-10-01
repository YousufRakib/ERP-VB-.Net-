Imports System.Data.SqlClient
Imports System.Data


Namespace DAO

    Public Class InvoiceHistory

        Public Shared Function SaveInvoiceHistory(ByVal ORDER As String, ByVal CUSTOMER As String, ByVal Note As String, ByVal USER As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New ManualPOHeader

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim qry As String = ""
                    Using cmd As New SqlCommand("Insert into F_IHistory ([ORDER],CUSTOMER,DATE,TIME,NOTE,[DESC],PERSON) values (@ORDER,@CUSTOMER,@AddDate,@AddTime,@Note,'',@PERSON)", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ORDER", ORDER)
                        cmd.Parameters.AddWithValue("@CUSTOMER", CUSTOMER)
                        cmd.Parameters.AddWithValue("@PERSON", USER)
                        cmd.Parameters.AddWithValue("@Note", Note)
                        cmd.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                        cmd.Parameters.AddWithValue("@AddTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                        cmd.ExecuteNonQuery()
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in SaveInvoiceHistory")
                Return "error"
            End Try
            Return Nothing
        End Function

    End Class

End Namespace