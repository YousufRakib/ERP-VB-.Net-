Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO


Public Class ARChecks

    'Public Shared Function wtrar(ByVal xInvoice As Integer, ByVal xDate As String, ByVal xType As String, ByVal xCheck As Integer, ByVal xAmount As Decimal, ByVal xCust As Integer, ByVal xDiscount As Integer, ByVal xRef As String, ByVal xDep As Integer) As String
    '    Try
    '        Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
    '        Using con As New SqlConnection(ConStr)
    '            con.Open()

    '            Dim queryARINVS As String = "INSERT INTO F_ARINVS(INVOICE,DATE,TYPE,CHECK,AMOUNT,CUSTOMER,DISCOUNT,REFNO,DEPOSIT) VALUES(" + xInvoice + "," + xDate + "," + xType + "," + xCheck + "," + xAmount + "," + xCust + "," + xDiscount + "," + xRef + "," + xDep + ")"
    '            Using cmd As New SqlCommand(queryARINVS, con)
    '                cmd.ExecuteNonQuery()
    '            End Using
    '            If xType = "2" Or xType = "7" Or xType = "4" Or xType = "9" Then
    '                Dim whereClause = "CUSTOMER=" + xCust + " AND CHECK=" + xCheck + " And DATE=" + xDate + " And TYPE=" + xType
    '                Using cmdARCHKS As New SqlCommand("SELECT COUNT(*) FROM F_ARCHKS WHERE " + whereClause, con)
    '                    Dim count As Int16 = Convert.ToInt16(cmdARCHKS.ExecuteScalar())
    '                    If count > 0 Then
    '                        Dim amount As Decimal = 0.0
    '                        If Type = 4 Then
    '                            Dim queryARCHKS As String = "UPDATE F_ARCHKS SET CUSTOMER=" + xCust + ", CHECK=" + xCheck + ",AMOUNT-" + xAmount + ", DATE=" + xDate + ", DEPOSIT=" + xDep + ", TYPE=" + xType + " WHERE " + whereClause
    '                        Else
    '                            Dim queryARCHKS As String = "UPDATE F_ARCHKS SET CUSTOMER=" + xCust + ", CHECK=" + xCheck + ",AMOUNT=" + xAmount + ", DATE=" + xDate + ", DEPOSIT=" + xDep + ", TYPE=" + xType + " WHERE " + whereClause
    '                        End If

    '                        Using updARCHKS As New SqlCommand(queryARCHKS, con)
    '                            updARCHKS.ExecuteNonQuery()
    '                        End Using
    '                    End If
    '                End Using
    '            End If
    '        End Using
    '        Return "valid"
    '    Catch ex As Exception
    '        ErrorLogs.LogException(ex, "Error in PostingPayments to F_ARINVS")
    '        Throw ex
    '    End Try
    'End Function

End Class

Public Class ARCHKS
    Private _Invoice As String
    Public Property Invoice() As String
        Get
            Return _Invoice
        End Get
        Set(ByVal value As String)
            _Invoice = value
        End Set
    End Property

    Private _Customer As String
    Public Property Customer() As String
        Get
            Return _Customer
        End Get
        Set(ByVal value As String)
            _Customer = value
        End Set
    End Property

    Private _Check As String
    Public Property Check() As String
        Get
            Return _Check
        End Get
        Set(ByVal value As String)
            _Check = value
        End Set
    End Property

    Private _Deposit As String
    Public Property Deposit() As String
        Get
            Return _Deposit
        End Get
        Set(ByVal value As String)
            _Deposit = value
        End Set
    End Property

    Private _RecDate As String
    Public Property RecDate() As String
        Get
            Return _RecDate
        End Get
        Set(ByVal value As String)
            _RecDate = value
        End Set
    End Property


    Private _Charges As Decimal
    Public Property Charges() As Decimal
        Get
            Return _Charges
        End Get
        Set(ByVal value As Decimal)
            _Charges = value
        End Set
    End Property

    Private _Payments As Decimal
    Public Property Payments() As Decimal
        Get
            Return _Payments
        End Get
        Set(ByVal value As Decimal)
            _Payments = value
        End Set
    End Property

    Private _Credits As Decimal
    Public Property Credits() As Decimal
        Get
            Return _Credits
        End Get
        Set(ByVal value As Decimal)
            _Credits = value
        End Set
    End Property

    Private _Balance As Decimal
    Public Property Balance() As Decimal
        Get
            Return _Balance
        End Get
        Set(ByVal value As Decimal)
            _Balance = value
        End Set
    End Property
End Class
