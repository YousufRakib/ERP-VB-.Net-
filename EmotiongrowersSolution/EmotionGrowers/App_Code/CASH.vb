Imports System.Data.SqlClient
Imports System.Data


Public Class CASH
    Public Shared Function GetCountForDepositsReport(ByVal DepositFrom As String, DepositTo As String, ByVal CheckNo As String, ByVal BankNo As String, CustomerNo As String, ByVal FromDate As String, ByVal ToDate As String, ByVal DepositType As String) As Integer
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim RowCount As Integer = 0

            Using con As New SqlConnection(ConStr)
                con.Open()
                If DepositType.Split("~")(0) = "A Deposit" Or DepositType.Split("~")(0) = "All Deposits" Then
                    Using DepositCmd As New SqlCommand("UDP_DepositReportDetails", con)
                        DepositCmd.CommandType = CommandType.StoredProcedure
                        DepositCmd.Parameters.AddWithValue("@DepositFrom", DepositFrom)
                        DepositCmd.Parameters.AddWithValue("@DepositTo", DepositTo)
                        DepositCmd.Parameters.AddWithValue("@BankNo", BankNo)
                        DepositCmd.Parameters.AddWithValue("@CheckNo", CheckNo)
                        DepositCmd.Parameters.AddWithValue("@CustomerNo", CustomerNo)
                        DepositCmd.Parameters.AddWithValue("@FromDate", FromDate)
                        DepositCmd.Parameters.AddWithValue("@ToDate", ToDate)
                        DepositCmd.Parameters.AddWithValue("@DepositType", If(DepositType.Split("~").Length = 2, DepositType.Split("~")(1), ""))
                        Dim DepositReader As SqlDataReader = DepositCmd.ExecuteReader()
                        If DepositReader.NextResult() Then
                            While DepositReader.Read()
                                RowCount = DepositReader(0)
                            End While
                        End If
                    End Using

                ElseIf DepositType.Split("~")(0) = "Deposit Summary" Then
                    Using DepositSummaryCmd As New SqlCommand("UDP_DepositSummaryBankWise", con)
                        DepositSummaryCmd.CommandType = CommandType.StoredProcedure
                        DepositSummaryCmd.Parameters.AddWithValue("@FromDate", FromDate)
                        DepositSummaryCmd.Parameters.AddWithValue("@ToDate", ToDate)
                        Dim DepositSummaryReader As SqlDataReader = DepositSummaryCmd.ExecuteReader()
                        If DepositSummaryReader.NextResult() Then
                            While DepositSummaryReader.Read()
                                RowCount = DepositSummaryReader(0)
                            End While
                        End If
                    End Using
                End If
                con.Close()
            End Using
            Return RowCount
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetTotalBalanceOfAR")
            Throw ex
        End Try
    End Function
End Class

Public Class F_CASH

    Private _PaymentsID As Integer
    Public Property PaymentsID() As Integer
        Get
            Return _PaymentsID
        End Get
        Set(value As Integer)
            _PaymentsID = value
        End Set
    End Property


    Private _DetailID As Integer
    Public Property DetailID() As Integer
        Get
            Return _DetailID
        End Get
        Set(value As Integer)
            _DetailID = value
        End Set
    End Property

    Private _Deposit As Integer = 0
    Public Property Deposit() As Integer
        Get
            Return _Deposit
        End Get
        Set(ByVal value As Integer)
            _Deposit = value
        End Set
    End Property

    Private _DepositDate As String
    Public Property DepositDate() As String
        Get
            Return _DepositDate
        End Get
        Set(ByVal value As String)
            _DepositDate = value
        End Set
    End Property

    Private _Bank As String = ""
    Public Property Bank() As String
        Get
            Return _Bank
        End Get
        Set(ByVal value As String)
            _Bank = value
        End Set
    End Property

    Private _Amount As Decimal = 0.00
    Public Property Amount() As Decimal
        Get
            Return _Amount
        End Get
        Set(ByVal value As Decimal)
            _Amount = value
        End Set
    End Property

    Private _Customer As Integer = 0
    Public Property Customer() As Integer
        Get
            Return _Customer
        End Get
        Set(value As Integer)
            _Customer = value
        End Set
    End Property

    Private _CustName As String = ""
    Public Property CustName() As String
        Get
            Return _CustName
        End Get
        Set(value As String)
            _CustName = value
        End Set
    End Property

    Private _Type As String = ""
    Public Property Type() As String
        Get
            Return _Type
        End Get
        Set(value As String)
            _Type = value
        End Set
    End Property

    Private _Check As Integer = 0
    Public Property Check() As Integer
        Get
            Return _Check
        End Get
        Set(value As Integer)
            _Check = value
        End Set
    End Property

    Private _Invoice As Integer = 0
    Public Property Invoice() As Integer
        Get
            Return _Invoice
        End Get
        Set(value As Integer)
            _Invoice = value
        End Set
    End Property

    Private _PO As String = ""
    Public Property PO() As String
        Get
            Return _PO
        End Get
        Set(value As String)
            _PO = value
        End Set
    End Property

    Private _GL As String = ""
    Public Property GL() As String
        Get
            Return _GL
        End Get
        Set(value As String)
            _GL = value
        End Set
    End Property

    Private _CTA As String = ""
    Public Property CTA() As String
        Get
            Return _CTA
        End Get
        Set(value As String)
            _CTA = value
        End Set
    End Property

    Private _Islocked As Boolean
    Public Property Islocked() As Boolean
        Get
            Return _Islocked
        End Get
        Set(ByVal value As Boolean)
            _Islocked = value
        End Set
    End Property

    Private _LockedUserID As Integer
    Public Property LockedUserID() As Boolean
        Get
            Return _LockedUserID
        End Get
        Set(ByVal value As Boolean)
            _LockedUserID = value
        End Set
    End Property

    Private _DepositLockContent As String
    Public Property DepositLockContent() As String
        Get
            Return _DepositLockContent
        End Get
        Set(value As String)
            _DepositLockContent = value
        End Set
    End Property

    Private _IsActive As Boolean
    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

    Private _ADDUSER As String
    Public Property ADDUSER() As String
        Get
            Return _ADDUSER
        End Get
        Set(ByVal value As String)
            _ADDUSER = value
        End Set
    End Property

    Private _ADDDATE As String
    Public Property ADDDATE() As String
        Get
            Return _ADDDATE
        End Get
        Set(ByVal value As String)
            _ADDDATE = value
        End Set
    End Property

    Private _ADDTIME As String
    Public Property ADDTIME() As String
        Get
            Return _ADDTIME
        End Get
        Set(value As String)
            _ADDTIME = value
        End Set
    End Property

    Private _ADDAPP As String
    Public Property ADDAPP() As String
        Get
            Return _ADDAPP
        End Get
        Set(ByVal value As String)
            _ADDAPP = value
        End Set
    End Property

    Private _UPDUSER As String
    Public Property UPDUSER() As String
        Get
            Return _UPDUSER
        End Get
        Set(ByVal value As String)
            _UPDUSER = value
        End Set
    End Property

    Private _UPDDATE As String
    Public Property UPDDATE() As String
        Get
            Return _UPDDATE
        End Get
        Set(ByVal value As String)
            _UPDDATE = value
        End Set
    End Property

    Private _UPDTIME As String
    Public Property UPDTIME() As String
        Get
            Return _UPDTIME
        End Get
        Set(value As String)
            _UPDTIME = value
        End Set
    End Property

    Private _UPDAPP As String
    Public Property UPDAPP() As String
        Get
            Return _UPDAPP
        End Get
        Set(ByVal value As String)
            _UPDAPP = value
        End Set
    End Property

    Private _LOCKUSER As String
    Public Property LOCKUSER() As String
        Get
            Return _LOCKUSER
        End Get
        Set(ByVal value As String)
            _LOCKUSER = value
        End Set
    End Property

    Private _LOCKDATE As String
    Public Property LOCKDATE() As String
        Get
            Return _LOCKDATE
        End Get
        Set(ByVal value As String)
            _LOCKDATE = value
        End Set
    End Property

    Private _LOCKTIME As String
    Public Property LOCKTIME() As String
        Get
            Return _LOCKTIME
        End Get
        Set(ByVal value As String)
            _LOCKTIME = value
        End Set
    End Property

    Private _LOCKAPP As String
    Public Property LOCKAPP() As String
        Get
            Return _LOCKAPP
        End Get
        Set(ByVal value As String)
            _LOCKAPP = value
        End Set
    End Property

End Class
