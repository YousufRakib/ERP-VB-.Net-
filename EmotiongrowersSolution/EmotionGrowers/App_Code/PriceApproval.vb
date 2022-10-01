Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class PriceApproval
    'Modified By: Subhajit On: 06-07-2022
    Public Shared Function SaveInformationForApprove(ByVal inventoryId As String, ByVal customerNo As Int64, ByVal currentPrice As Decimal, ByVal userName As String, ByVal boxes As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spSaveInformationForApprove", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@inventoryId", inventoryId))
                    cmd.Parameters.Add(New SqlParameter("@customerNo", customerNo))
                    cmd.Parameters.Add(New SqlParameter("@currentPrice", currentPrice))
                    cmd.Parameters.Add(New SqlParameter("@boxes", boxes))
                    cmd.Parameters.Add(New SqlParameter("@userName", userName))
                    cmd.ExecuteNonQuery()

                End Using
            End Using
            Return "success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In SaveInformationForApprove")
            Return "error"
        End Try
    End Function
    Public Shared Function CheckForPriceApproval(ByVal inventoryId As String, ByVal customerNo As Int64, ByVal currentPrice As Decimal, ByVal userName As String, ByVal boxes As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataTable
            Dim result As String = ""

            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spCheckForPriceApproval", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@inventoryId", inventoryId))
                    cmd.Parameters.Add(New SqlParameter("@customerNo", customerNo))
                    cmd.Parameters.Add(New SqlParameter("@currentPrice", currentPrice))
                    cmd.Parameters.Add(New SqlParameter("@boxes", boxes))
                    cmd.Parameters.Add(New SqlParameter("@userName", userName))
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(dt)
                    result = dt.Rows(0)("APPROVED").ToString() + "@" + Convert.ToString(dt.Rows(0)("REJECTREASON"))
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In CheckForPriceApproval")
            Return ""
        End Try
    End Function

    Public Shared Function DeletePriceApproval(ByVal inventoryId As String, ByVal customerNo As Int64, ByVal currentPrice As Decimal, ByVal userName As String, ByVal boxes As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dt As New DataTable
            Dim result As String = ""

            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spDeletePriceApproval", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@inventoryId", inventoryId))
                    cmd.Parameters.Add(New SqlParameter("@customerNo", customerNo))
                    cmd.Parameters.Add(New SqlParameter("@currentPrice", currentPrice))
                    cmd.Parameters.Add(New SqlParameter("@boxes", boxes))
                    cmd.Parameters.Add(New SqlParameter("@userName", userName))
                    If cmd.ExecuteNonQuery() > 0 Then
                        result = "OK"
                    Else
                        result = "Error"
                    End If
                End Using
            End Using
            Return result
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In CheckForPriceApproval")
            Return ""
        End Try
    End Function
    Public Function GetPendingRecordsToApprove() As DataTable
        Dim dtResult As New DataTable()
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spGetPendingRecordsToApprove", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(dtResult)

                    Return dtResult
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetFarmCreditsFromCredit")
            Return dtResult
        End Try
    End Function

    Public Function GetApprovedRecords(ByVal Filter As String) As DataTable
        Dim dtResult As New DataTable()
        Try
            Dim FromDate As DateTime = DateTime.Today
            Dim ToDate As DateTime = DateTime.Today

            If Filter = "Today" Then
                FromDate = DateTime.Today
                ToDate = DateTime.Today
            ElseIf Filter = "Yesterday" Then
                FromDate = DateTime.Today.AddDays(-1)
                ToDate = DateTime.Today.AddDays(-1)
            ElseIf Filter = "ThisMonth" Then
                FromDate = Convert.ToDateTime(DateTime.Today.Year.ToString() + "-" + DateTime.Today.Month.ToString() + "-01")
                ToDate = FromDate.AddMonths(1).AddDays(-1)
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spApprovalRecordsByFilter", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate.ToString("yyyy-MM-dd"))
                    cmd.Parameters.AddWithValue("@ToDate", ToDate.ToString("yyyy-MM-dd"))
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(dtResult)

                    Return dtResult
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetFarmCreditsFromCredit")
            Return dtResult
        End Try
    End Function

    Public Overloads Function GetApprovalRecords(ByVal Filter As String, ByVal Approved As String) As DataTable
        Dim dtResult As New DataTable()
        Try
            Dim FromDate As DateTime = DateTime.Today
            Dim ToDate As DateTime = DateTime.Today

            If Filter = "Today" Then
                FromDate = DateTime.Today
                ToDate = DateTime.Today
            ElseIf Filter = "Yesterday" Then
                FromDate = DateTime.Today.AddDays(-1)
                ToDate = DateTime.Today.AddDays(-1)
            ElseIf Filter = "ThisMonth" Then
                FromDate = Convert.ToDateTime(DateTime.Today.Year.ToString() + "-" + DateTime.Today.Month.ToString() + "-01")
                ToDate = FromDate.AddMonths(1).AddDays(-1)
            End If



            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spAllApprovalRecordsByFilter", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FromDate", FromDate.ToString("yyyy-MM-dd"))
                    cmd.Parameters.AddWithValue("@ToDate", ToDate.ToString("yyyy-MM-dd"))
                    cmd.Parameters.AddWithValue("@Approved", Approved)
                    Dim da As New SqlDataAdapter(cmd)
                    da.Fill(dtResult)

                    Return dtResult
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetFarmCreditsFromCredit")
            Return dtResult
        End Try
    End Function

    Public Function GetPendingToApproveDetailsByRecNo(ByVal ID As Integer) As List(Of Approval)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim approvlDetails As New List(Of Approval)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using cmd As New SqlCommand("spGetPendingToApproveDetailsByID", Con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.CommandTimeout = 0
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)

                    Dim TotalCount As Integer = dt.Rows.Count
                    If TotalCount <> 0 Then
                        For Each row In dt.Rows
                            Dim u As New Approval
                            u.ID = IIf(row("ID") Is DBNull.Value, 0, Convert.ToInt32(row("ID")))
                            u.CUSTOMER = IIf(row("CUSTOMER") Is DBNull.Value, "", Convert.ToString(row("CUSTOMER")))
                            u.NAME = IIf(row("NAME") Is DBNull.Value, "", Convert.ToString(row("NAME")))
                            u.AWB = IIf(row("AWB") Is DBNull.Value, 0, Convert.ToInt64(row("AWB")))
                            u.DATEREC = IIf(row("DATEREC") Is DBNull.Value, "", Convert.ToDateTime(row("DATEREC")).ToString("MM/dd/yyyy"))
                            u.FLOWER = IIf(row("FLOWER") Is DBNull.Value, "", Convert.ToString(row("FLOWER")))
                            u.FARM = IIf(row("FARM") Is DBNull.Value, "", Convert.ToString(row("FARM")))
                            u.DESC = IIf(row("DESC") Is DBNull.Value, "", Convert.ToString(row("DESC")))
                            u.COLORCODE = IIf(row("COLORCODE") Is DBNull.Value, 0, Convert.ToInt32(row("COLORCODE")))
                            u.PRICE = IIf(row("PRICE") Is DBNull.Value, 0, Convert.ToDecimal(row("PRICE")))
                            u.MARKET = IIf(row("MARKET") Is DBNull.Value, 0, Convert.ToDecimal(row("MARKET")))
                            u.COST = IIf(row("COST") Is DBNull.Value, 0, Convert.ToDecimal(row("COST")))
                            u.BOXES = IIf(row("BOXES") Is DBNull.Value, 0, Convert.ToInt32(row("BOXES")))
                            u.CSHAND = IIf(row("CSHAND") Is DBNull.Value, 0, Convert.ToInt32(row("CSHAND")))
                            u.UNITS = IIf(row("UNITS") Is DBNull.Value, 0, Convert.ToInt32(row("UNITS")))
                            u.UOM = IIf(row("UOM") Is DBNull.Value, "", Convert.ToString(row("UOM")))
                            u.APPROVED = IIf(row("APPROVED") Is DBNull.Value, "", Convert.ToString(row("APPROVED")))
                            u.APPROVEDBY = IIf(row("APPROVEDBY") Is DBNull.Value, "", Convert.ToString(row("APPROVEDBY")))
                            u.TRANSDATE = IIf(row("TRANSDATE") Is DBNull.Value, "", Convert.ToDateTime(row("TRANSDATE")).ToString("MM/dd/yyyy hh:mm tt"))
                            u.TRANSTIME = IIf(row("TRANSTIME") Is DBNull.Value, "", Convert.ToString(row("TRANSTIME")))
                            u.ASKEDBY = IIf(row("ASKEDBY") Is DBNull.Value, "", Convert.ToString(row("ASKEDBY")))
                            u.ASKEDDATE = IIf(row("ASKEDDATE") Is DBNull.Value, "", Convert.ToDateTime(row("ASKEDDATE")).ToString("MM/dd/yyyy hh:mm tt"))
                            u.ASKEDTIME = IIf(row("ASKEDTIME") Is DBNull.Value, "", Convert.ToString(row("ASKEDTIME")))
                            u.SHOWN = IIf(row("SHOWN") Is DBNull.Value, False, Convert.ToBoolean(row("SHOWN")))
                            u.REJECTREASON = IIf(row("REJECTREASON") Is DBNull.Value, "", Convert.ToString(row("REJECTREASON")))

                            approvlDetails.Add(u)
                        Next
                    End If
                End Using
            End Using
            Return approvlDetails
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCreditDetailsListByOption")
            Throw ex
        End Try
    End Function

    Public Function UpdateApprovalStatus(ByVal ID As Integer, ByVal ApprovalStatus As String, ByVal ApprovedBy As String, ByVal Reason As String) As String
        Dim Result As String = ""
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("spUpdateApprovalStatus", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ID", ID)
                    cmd.Parameters.AddWithValue("@ApprovalStatus", ApprovalStatus)
                    cmd.Parameters.AddWithValue("@ApprovedBy", ApprovedBy)
                    cmd.Parameters.AddWithValue("@Reason", Reason)
                    cmd.CommandTimeout = 0
                    cmd.ExecuteNonQuery()
                    Result = "Success"
                    Return Result
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In UpdateApprovalStatus")
            Result = "Error"
            Return Result
        End Try
    End Function

    'Modified By: Subhajit On: 06-17-2022
    'Approvals more than one hour old will be expired
    Public Function GetApprovalText(ByVal Approved As String, ByVal AskedDate As DateTime) As String
        Dim ApprovalString As String = ""

        If Approved = "" Then
            If AskedDate > DateTime.Now.AddHours(-1) Then
                ApprovalString = "<div style='padding-bottom: 3px; background-color: fuchsia; color: white;' class='flowerDescription'>" + "Pending" + "</div>"
            Else
                ApprovalString = "<div style='padding-bottom: 3px; background-color: darkgrey; color: white;' class='flowerDescription'>" + "Expired" + "</div>"
            End If
        ElseIf Approved = "Y" Then
            ApprovalString = "<div style='padding-bottom: 3px; background-color: darkgreen; color: white;' class='flowerDescription'>" + "Approved" + "</div>"
        ElseIf Approved = "N" Then
            ApprovalString = "<div style='padding-bottom: 3px; background-color: darkred; color: white;' class='flowerDescription'>" + "Denied" + "</div>"
        End If

        Return ApprovalString
    End Function

    'Modified By: Subhajit On: 06-17-2022
    'Approvals more than one hour old will be expired
    Public Function GetApproveButton(ByVal Approved As String, ByVal ID As String, ByVal AskedDate As DateTime) As String
        Dim ApprovalButton As String = ""

        If Approved = "" Then
            If AskedDate > DateTime.Now.AddHours(-1) Then
                ApprovalButton = "<a href='#' onclick='UpdateApprovalStatus(""" + ID + """,""Y"")'><img src='images/bluetick.png' title='Approve' alt='Approve' style='height: 15px;'></img></a>"
            Else
                ApprovalButton = ""
            End If
        End If

        Return ApprovalButton
    End Function

    'Modified By: Subhajit On: 06-17-2022
    'Approvals more than one hour old will be expired
    Public Function GetDenyButton(ByVal Approved As String, ByVal ID As String, ByVal AskedDate As DateTime) As String
        Dim DenyButton As String = ""

        If Approved = "" Then
            If AskedDate > DateTime.Now.AddHours(-1) Then
                DenyButton = "<a href='#' onclick='UpdateApprovalStatus(""" + ID + """,""N"")'><img src='images/cancel.png' title='Deny' alt='Deny' style='height: 15px;'></img></a>"
            Else
                DenyButton = ""
            End If
        End If

        Return DenyButton
    End Function
End Class

Public Class Approval
    Public Property ID As Integer
    Public Property CUSTOMER As String
    Public Property NAME As String
    Public Property AWB As Long
    Public Property DATEREC As String
    Public Property FLOWER As String
    Public Property FARM As String
    Public Property DESC As String
    Public Property COLORCODE As Integer
    Public Property PRICE As Decimal
    Public Property MARKET As Decimal
    Public Property COST As Decimal
    Public Property BOXES As Integer
    Public Property CSHAND As Integer
    Public Property UNITS As Integer
    Public Property UOM As String
    Public Property APPROVED As String
    Public Property APPROVEDBY As String
    Public Property TRANSDATE As String
    Public Property TRANSTIME As String
    Public Property ASKEDBY As String
    Public Property ASKEDDATE As String
    Public Property ASKEDTIME As String
    Public Property SHOWN As Boolean
    Public Property REJECTREASON As String

End Class