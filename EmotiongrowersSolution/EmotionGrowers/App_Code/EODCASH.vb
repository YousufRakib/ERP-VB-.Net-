Imports System.Data.SqlClient
Imports System.Data


Namespace DAO
    Public Class EODCASH
        Public Shared Function GetEODCASHDetails() As BO.EODCASH
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString()
                Dim eodCashObj As New BO.EODCASH
                Using Con As New SqlConnection(ConStr)
                    Con.Open()
                    Using Cmd As New SqlCommand("SELECT ISNULL(PREVIOUSBA,0.00) PREVIOUSBA, ISNULL(TOTALAREOD,0.00) TOTALAREOD, ISNULL(TOTALDEP,0.00) TOTALDEP, ISNULL(TOTALADJ,0.00) TOTALADJ, ISNULL(TOTALRET,0.00) TOTALRET, ISNULL(TOTALMISC,0.00) TOTALMISC, ISNULL(TOTALDISC,0.00) TOTALDISC, ISNULL(CREDITCARD,0.00) CREDITCARD  FROM EODCASH", Con)
                        Dim eodCashDA As New SqlDataAdapter(Cmd)
                        Dim eodCashDT As New DataTable
                        eodCashDA.Fill(eodCashDT)
                        If eodCashDT.Rows.Count > 0 Then
                            eodCashObj.PREVIOUSBA = eodCashDT(0)("PREVIOUSBA")
                            eodCashObj.TOTALAREOD = eodCashDT(0)("TOTALAREOD")
                            eodCashObj.TOTALDEP = eodCashDT(0)("TOTALDEP")
                            eodCashObj.TOTALADJ = eodCashDT(0)("TOTALADJ")
                            eodCashObj.TOTALRET = eodCashDT(0)("TOTALRET")
                            eodCashObj.TOTALMISC = eodCashDT(0)("TOTALMISC")
                            eodCashObj.TOTALDISC = eodCashDT(0)("TOTALDISC")
                            eodCashObj.CREDITCARD = eodCashDT(0)("CREDITCARD")
                            eodCashObj.ErrorMessage = ""
                        Else
                            eodCashObj.ErrorMessage = "NO DATA"
                        End If

                    End Using
                End Using
                Return eodCashObj
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error In GetEODCASHDetails")
                Throw ex
            End Try
        End Function
    End Class
End Namespace

Namespace BO
    Public Class EODCASH
        Private _PREVIOUSBA As Decimal
        Public Property PREVIOUSBA() As Decimal
            Get
                Return _PREVIOUSBA
            End Get
            Set(value As Decimal)
                _PREVIOUSBA = value
            End Set
        End Property

        Private _TOTALAREOD As Decimal
        Public Property TOTALAREOD() As Decimal
            Get
                Return _TOTALAREOD
            End Get
            Set(value As Decimal)
                _TOTALAREOD = value
            End Set
        End Property

        Private _TOTALDEP As Decimal
        Public Property TOTALDEP() As Decimal
            Get
                Return _TOTALDEP
            End Get
            Set(value As Decimal)
                _TOTALDEP = value
            End Set
        End Property

        Private _TOTALADJ As Decimal
        Public Property TOTALADJ() As Decimal
            Get
                Return _TOTALADJ
            End Get
            Set(value As Decimal)
                _TOTALADJ = value
            End Set
        End Property

        Private _TOTALRET As Decimal
        Public Property TOTALRET() As Decimal
            Get
                Return _TOTALRET
            End Get
            Set(value As Decimal)
                _TOTALRET = value
            End Set
        End Property

        Private _TOTALMISC As Decimal
        Public Property TOTALMISC() As Decimal
            Get
                Return _TOTALMISC
            End Get
            Set(value As Decimal)
                _TOTALMISC = value
            End Set
        End Property

        Private _TOTALDISC As Decimal
        Public Property TOTALDISC() As Decimal
            Get
                Return _TOTALDISC
            End Get
            Set(value As Decimal)
                _TOTALDISC = value
            End Set
        End Property

        Private _ErrorMessage As String
        Public Property ErrorMessage() As String
            Get
                Return _ErrorMessage
            End Get
            Set(value As String)
                _ErrorMessage = value
            End Set
        End Property

        Private _CREDITCARD As Decimal
        Public Property CREDITCARD() As Decimal
            Get
                Return _CREDITCARD
            End Get
            Set(value As Decimal)
                _CREDITCARD = value
            End Set
        End Property

    End Class
End Namespace
