Imports System.Data.SqlClient
Imports System.Data


Namespace DAO
    Public Class Duty

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Function GetDutyListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer, ByVal TableName As String) As List(Of BO.Duty)

            Dim uList As New List(Of BO.Duty)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetDutyTable]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        cmd.Parameters.Add(New SqlParameter("@TableName", TableName))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Duty()
                            u.ID = row("ID")
                            u.COUNTRY = row("COUNTRY")
                            u.FLOWER = row("FLOWER")
                            u.TAX = row("TAX")
                            u.PRICE = row("PRICE")
                            u.ANTIDUMP = row("ANTIDUMP")
                            u.DutyDATE = row("Date")
                            u.FEE = row("FEE")
                            u.NAME = row("NAME")
                            u.SOLDAS = row("SOLDAS")
                            u.TUSA = row("TUSA")
                            u.MarketPriceDuty = row("MarketPriceDuty")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetDutyListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function AddEditDetleteSelectDuty(ByVal ID As String, ByVal COUNTRY As String, ByVal FLOWER As String, ByVal TAX As String, ByVal PRICE As String, ByVal ANTIDUMP As String, ByVal FEE As String, ByVal NAME As String, ByVal SOLDAS As String, ByVal TUSA As String, ByVal Mode As String, ByVal TableName As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim DutyScopeID As String = ""
                'COUNTRY,FLOWER,TAX,PRICE,ANTIDUMP,DATE,FEE,NAME,SOLDAS,TUSA
                Dim Cmd As New SqlCommand("sp_f_flotax", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@COUNTRY", COUNTRY)
                Cmd.Parameters.AddWithValue("@FLOWER", FLOWER)
                Cmd.Parameters.AddWithValue("@TAX", TAX)
                Cmd.Parameters.AddWithValue("@PRICE", PRICE)
                Cmd.Parameters.AddWithValue("@ANTIDUMP", ANTIDUMP)
                Cmd.Parameters.AddWithValue("@FEE", FEE)
                Cmd.Parameters.AddWithValue("@NAME", NAME)
                Cmd.Parameters.AddWithValue("@SOLDAS", SOLDAS)
                Cmd.Parameters.AddWithValue("@TUSA", TUSA)
                Cmd.Parameters.AddWithValue("@Mode", Mode)
                Cmd.Parameters.AddWithValue("@TableName", TableName)
                DutyScopeID = Cmd.ExecuteScalar()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "AddEditDetleteSelectDuty", IIf(ID = "0", "Added a new Duty <b>" + COUNTRY + "-" + FLOWER + "</b>", "Updated a Duty <b>" + COUNTRY + "-" + FLOWER + "</b>"), DutyScopeID.ToString())
                End If
                Return DutyScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in AddEditDetleteSelectDuty")
                End If
                Return ex.Message()
            End Try
        End Function

        Public Shared Function GetDutyByID(ByVal ID As String, ByVal TableName As String) As BO.Duty
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim u As New BO.Duty()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim table As String = IIf(TableName = "CustomerDuties", "F_FLODUT", "f_flotax")
                    Using cmd As New SqlCommand("SELECT * FROM " + table + " WHERE ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            u.ID = row("ID")
                            u.COUNTRY = row("COUNTRY")
                            u.FLOWER = row("FLOWER")
                            u.TAX = row("TAX")
                            u.PRICE = row("PRICE")
                            u.ANTIDUMP = row("ANTIDUMP")
                            u.DutyDATE = row("Date")
                            u.FEE = row("FEE")
                            u.NAME = row("NAME")
                            u.SOLDAS = row("SOLDAS")
                            u.TUSA = row("TUSA")
                        Next
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetDutyByID")
                Throw ex
            End Try
        End Function

    End Class
End Namespace

Namespace BO
    Public Class Duty
        Private _ID As String
        Public Property ID() As String
            Get
                Return _ID
            End Get
            Set(ByVal value As String)
                _ID = value
            End Set
        End Property

        Private _COUNTRY As String
        Public Property COUNTRY() As String
            Get
                Return _COUNTRY
            End Get
            Set(ByVal value As String)
                _COUNTRY = value
            End Set
        End Property

        Private _FLOWER As String
        Public Property FLOWER() As String
            Get
                Return _FLOWER
            End Get
            Set(ByVal value As String)
                _FLOWER = value
            End Set
        End Property

        Private _TAX As Decimal
        Public Property TAX() As Decimal
            Get
                Return _TAX
            End Get
            Set(ByVal value As Decimal)
                _TAX = value
            End Set
        End Property

        Private _PRICE As Decimal
        Public Property PRICE() As Decimal
            Get
                Return _PRICE
            End Get
            Set(ByVal value As Decimal)
                _PRICE = value
            End Set
        End Property

        Private _ANTIDUMP As Decimal
        Public Property ANTIDUMP() As Decimal
            Get
                Return _ANTIDUMP
            End Get
            Set(ByVal value As Decimal)
                _ANTIDUMP = value
            End Set
        End Property

        Private _DutyDATE As DateTime
        Public Property DutyDATE() As DateTime
            Get
                Return _DutyDATE
            End Get
            Set(ByVal value As DateTime)
                _DutyDATE = value
            End Set
        End Property

        Private _FEE As Decimal
        Public Property FEE() As Decimal
            Get
                Return _FEE
            End Get
            Set(ByVal value As Decimal)
                _FEE = value
            End Set
        End Property

        Private _NAME As String
        Public Property NAME() As String
            Get
                Return _NAME
            End Get
            Set(ByVal value As String)
                _NAME = value
            End Set
        End Property

        Private _SOLDAS As String
        Public Property SOLDAS() As String
            Get
                Return _SOLDAS
            End Get
            Set(ByVal value As String)
                _SOLDAS = value
            End Set
        End Property

        Private _TUSA As String
        Public Property TUSA() As String
            Get
                Return _TUSA
            End Get
            Set(ByVal value As String)
                _TUSA = value
            End Set
        End Property

        Private _MarketPriceDuty As String
        Public Property MarketPriceDuty() As String
            Get
                Return _MarketPriceDuty
            End Get
            Set(ByVal value As String)
                _MarketPriceDuty = value
            End Set
        End Property

    End Class
End Namespace

Public Interface ICustomParams_DutyTable
    Property DutyTable() As String
End Interface
