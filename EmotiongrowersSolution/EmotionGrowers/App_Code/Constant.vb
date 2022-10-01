Imports System.Data.SqlClient
Imports System.Data


Namespace DAO

    Public Class Constant

        Public Shared Function GetPrintInvoiceAndPickListConstant() As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim dt As DataTable = New DataTable()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim NextInvoice As Integer = 0
                    Using cmd As New SqlCommand("select top 1 PRINTINVOICEANDPICKING from CONSTANT", con)
                        cmd.CommandType = CommandType.Text
                        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
                        sda.Fill(dt)
                    End Using
                End Using
                Return dt.Rows(0)("PRINTINVOICEANDPICKING").ToString()
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetPrintInvoiceAndPickListConstant")
                Return "False"
            End Try
            Return Nothing
        End Function

        Public Shared Function GetReportToPrintAtSaveConstant() As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim dt As DataTable = New DataTable()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim NextInvoice As Integer = 0
                    Using cmd As New SqlCommand("select top 1 REPORTSTOPRINTATSAVE from CONSTANT", con)
                        cmd.CommandType = CommandType.Text
                        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
                        sda.Fill(dt)
                    End Using
                End Using
                Return dt.Rows(0)("REPORTSTOPRINTATSAVE").ToString()
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetPrintInvoiceAndPickListConstant")
                Return ""
            End Try
            Return Nothing
        End Function

        Public Shared Function GetNextInvoiceNumFromConstant() As Integer
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of SalesPersons)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim NextInvoice As Integer = 0
                    Using cmd As New SqlCommand("select top 1 INVOICE from CONSTANT", con)
                        cmd.CommandType = CommandType.Text
                        Using rdr As SqlDataReader = cmd.ExecuteReader()
                            While (rdr.Read())
                                If (rdr("INVOICE") Is DBNull.Value) Then
                                    NextInvoice = "0"
                                Else
                                    NextInvoice = rdr("INVOICE") + 1
                                    rdr.Close()
                                    Using cmd1 As New SqlCommand("update CONSTANT set Invoice=@Invoice", con)
                                        cmd1.Parameters.AddWithValue("@Invoice", NextInvoice)
                                        cmd1.CommandType = CommandType.Text
                                        cmd1.ExecuteNonQuery()
                                    End Using
                                End If
                                Return NextInvoice
                            End While
                        End Using
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetNextInvoiceNumFromConstant")
                Return 0
            End Try
            Return Nothing
        End Function

        Public Shared Function GetNextPrebookNumFromConstant() As Integer
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of SalesPersons)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim Nextprebooknum As Integer = 0
                    Using cmd As New SqlCommand("select top 1 prebooknum from CONSTANT", con)
                        cmd.CommandType = CommandType.Text
                        Using rdr As SqlDataReader = cmd.ExecuteReader()
                            While (rdr.Read())
                                If (rdr("prebooknum") Is DBNull.Value) Then
                                    Nextprebooknum = "1"
                                Else
                                    Nextprebooknum = rdr("prebooknum") + 1
                                End If
                                rdr.Close()
                                Using cmd1 As New SqlCommand("update CONSTANT set prebooknum=@Nextprebooknum", con)
                                    cmd1.Parameters.AddWithValue("@Nextprebooknum", Nextprebooknum)
                                    cmd1.CommandType = CommandType.Text
                                    cmd1.ExecuteNonQuery()
                                End Using

                                Return Nextprebooknum
                            End While
                        End Using
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetNextprebooknumFromConstant")
                Return 0
            End Try
            Return Nothing
        End Function
        Public Shared Function GetShowGenerateAutoPOConstant() As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim dt As DataTable = New DataTable()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim NextInvoice As Integer = 0
                    Using cmd As New SqlCommand("select top 1 SHOWGENERATEAUTOPO from CONSTANT", con)
                        cmd.CommandType = CommandType.Text
                        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
                        sda.Fill(dt)
                    End Using
                End Using
                Return dt.Rows(0)("SHOWGENERATEAUTOPO").ToString()
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetShowGenerateAutoPOConstant")
                Return "False"
            End Try
            Return Nothing
        End Function

    End Class
End Namespace