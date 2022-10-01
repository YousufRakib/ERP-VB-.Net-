Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO

Namespace DAO


    Public Class F_ID

        Public Shared Function GetNextIDForTABLES(ByVal TableName As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim CurrentID As Integer = 0
                Dim NextID As Integer = 0
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("Select top 1 ID from F_ID where [TABLE]=@TABLE", con)
                        cmd.Parameters.AddWithValue("@TABLE", TableName)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        If (dt.Rows.Count = 0) Then
                            Using Cmd1 As New SqlCommand("INSERT INTO F_ID([TABLE],ID,[ADDUSER],[ADDDATE],[ADDTIME],[ADDAPP]) VALUES (@TABLE,1,@ADDUSER,CONVERT(DATE,GETDATE(),101),CONVERT(TIME,GETDATE(),101),'')", con)
                                Cmd1.Parameters.AddWithValue("@TABLE", TableName)
                                Cmd1.Parameters.AddWithValue("@ADDUSER", TableName)
                                Cmd1.CommandType = CommandType.Text
                                Cmd1.ExecuteNonQuery()
                            End Using
                        End If

                        If dt.Rows.Count > 0 Then
                            If (dt.Rows(0)("ID") Is DBNull.Value) Then
                                NextID = 0
                                CurrentID = 0
                            Else
                                CurrentID = Convert.ToInt64(dt.Rows(0)("ID"))
                                NextID = Convert.ToInt64(dt.Rows(0)("ID")) + 1
                                Using Sqlcmd As New SqlCommand("update F_ID set ID=" + NextID.ToString() + " where [TABLE]=@TABLE", con)
                                    Sqlcmd.Parameters.AddWithValue("@TABLE", TableName)
                                    Sqlcmd.CommandType = CommandType.Text
                                    Sqlcmd.ExecuteNonQuery()
                                End Using

                            End If
                            Return NextID
                        Else
                            Return "0"
                        End If

                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetNextIDForTABLES")
                Throw ex
            End Try
        End Function

        Public Shared Function GetNextIDForTABLES(ByVal TableName As String, ByVal ADDUSER As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim CurrentID As Integer = 0
                Dim NextID As Integer = 0
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("Select top 1 ID from F_ID where [TABLE]=@TABLE", con)
                        cmd.Parameters.AddWithValue("@TABLE", TableName)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim dt As New DataTable
                        da.Fill(dt)
                        If (dt.Rows.Count = 0) Then
                            Using Cmd1 As New SqlCommand("INSERT INTO F_ID([TABLE],ID,[ADDUSER],[ADDDATE],[ADDTIME],[ADDAPP]) VALUES (@TABLE,1,@ADDUSER,CONVERT(DATE,GETDATE(),101),CONVERT(TIME,GETDATE(),101),'')", con)
                                Cmd1.Parameters.AddWithValue("@TABLE", TableName)
                                Cmd1.Parameters.AddWithValue("@ADDUSER", ADDUSER)
                                Cmd1.CommandType = CommandType.Text
                                Cmd1.ExecuteNonQuery()
                            End Using
                        End If

                        If dt.Rows.Count > 0 Then
                            If (dt.Rows(0)("ID") Is DBNull.Value) Then
                                NextID = 0
                                CurrentID = 0
                            Else
                                CurrentID = Convert.ToInt64(dt.Rows(0)("ID"))
                                NextID = Convert.ToInt64(dt.Rows(0)("ID")) + 1
                                Using Sqlcmd As New SqlCommand("update F_ID set ID=" + NextID.ToString() + ",[UPDUSER]=@UPDUSER,[UPDDATE]=CONVERT(DATE,GETDATE(),101),[UPDTIME]=CONVERT(TIME,GETDATE(),101),[UPDAPP]='' where [TABLE]=@TABLE", con)
                                    Sqlcmd.Parameters.AddWithValue("@TABLE", TableName)
                                    Sqlcmd.Parameters.AddWithValue("@UPDUSER", ADDUSER)
                                    Sqlcmd.CommandType = CommandType.Text
                                    Sqlcmd.ExecuteNonQuery()
                                End Using

                            End If
                            Return NextID
                        Else
                            Return "0"
                        End If

                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetNextIDForTABLES")
                Throw ex
            End Try
        End Function

    End Class

End Namespace



