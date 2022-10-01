Imports System.Data.SqlClient
Imports System.Data



Namespace DAO

    Public Class Terms

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Shared Function GetTermsForDropdown() As List(Of BO.Terms)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim TermsList As New List(Of BO.Terms)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select CODE,TERMSDESC from F_TERMS order by TERMSDESC", con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim Terms As New BO.Terms()
                            Terms.Code = row("CODE")
                            Terms.TermsDesc = row("TERMSDESC")
                            TermsList.Add(Terms)
                        Next
                    End Using
                End Using
                Return TermsList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetTermsForDropdown")
                Throw ex
            End Try
        End Function

        Public Function GetTermsDetailsForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of BO.Terms)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim TermsList As New List(Of BO.Terms)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetCreditTerms]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim Terms As New BO.Terms()
                            Terms.ID = row("ID")
                            Terms.Code = row("CODE")
                            Terms.TermsDesc = row("TERMSDESC")
                            Terms.CreditCard = Convert.ToString(row("CREDITCARD"))
                            Terms.Discount = Convert.ToDecimal(row("DISCOUNT"))
                            Terms.DDays = Convert.ToInt32(row("DDAYS"))
                            Terms.COD = Convert.ToString(row("COD"))
                            TermsList.Add(Terms)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using
                Return TermsList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetTermsDetailsForFgrd")
                Throw ex
            End Try
        End Function

        Public Shared Function GetCreditTermsDetailByID(ByVal ID As String) As List(Of BO.Terms)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim TermsList As New List(Of BO.Terms)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim sqlQuery As String = ""
                    sqlQuery = "SELECT ID,CODE, TERMSDESC, CREDITCARD, DISCOUNT, DDAYS, COD, DAYS FROM F_TERMS WHERE ID=" + ID + " ORDER BY TERMSDESC"
                    Using cmd As New SqlCommand(sqlQuery, con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim Terms As New BO.Terms()
                            Terms.ID = row("ID")
                            Terms.Code = row("CODE")
                            Terms.TermsDesc = row("TERMSDESC")
                            Terms.CreditCard = Convert.ToString(row("CREDITCARD"))
                            Terms.Discount = Convert.ToDecimal(row("DISCOUNT"))
                            Terms.DDays = Convert.ToInt32(row("DDAYS"))
                            Terms.COD = Convert.ToString(row("COD"))
                            Terms.Days = Convert.ToInt32(row("DAYS"))
                            TermsList.Add(Terms)
                        Next
                    End Using
                End Using
                Return TermsList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetTermsDetailsForFgrd")
                Throw ex
            End Try
        End Function

        Public Shared Function InsertCreditTerms(ByVal CreditTermsCode As String, ByVal CreditTermsDesc As String, ByVal COD As String, ByVal CreditCard As String,
    ByVal Days As Integer, ByVal Discount As Decimal, ByVal DDays As Integer) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim CarrierScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_TERMSInsert", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure

                Cmd.Parameters.AddWithValue("@CreditTermsCode", CreditTermsCode)
                Cmd.Parameters.AddWithValue("@CreditTermsDesc", CreditTermsDesc)
                Cmd.Parameters.AddWithValue("@COD", COD)
                Cmd.Parameters.AddWithValue("@CreditCard", CreditCard)
                Cmd.Parameters.AddWithValue("@Days", Days)
                Cmd.Parameters.AddWithValue("@Discount", Discount)
                Cmd.Parameters.AddWithValue("@DDays", DDays)
                Cmd.ExecuteNonQuery()

                Cmd.Dispose()
                SqlCon.Close()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "InsertCreditTerms", "Added a new Term <b>" + CreditTermsDesc + "</b>", CarrierScopeID.ToString())
                End If
                Return CarrierScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertCreditTerms")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function UpdateCreditTerms(ByVal ID As Integer, ByVal CreditTermsCode As String, ByVal CreditTermsDesc As String, ByVal COD As String, ByVal CreditCard As String,
    ByVal Days As Integer, ByVal Discount As Decimal, ByVal DDays As Integer) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim CarrierScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_TERMSUpdate", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@CreditTermsCode", CreditTermsCode)
                Cmd.Parameters.AddWithValue("@CreditTermsDesc", CreditTermsDesc)
                Cmd.Parameters.AddWithValue("@COD", COD)
                Cmd.Parameters.AddWithValue("@CreditCard", CreditCard)
                Cmd.Parameters.AddWithValue("@Days", Days)
                Cmd.Parameters.AddWithValue("@Discount", Discount)
                Cmd.Parameters.AddWithValue("@DDays", DDays)
                Cmd.ExecuteNonQuery()

                Cmd.Dispose()
                SqlCon.Close()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "UpdateCreditTerms", "Updated a Term <b>" + CreditTermsDesc + "</b>", CarrierScopeID.ToString())
                End If
                Return CarrierScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in UpdateCreditTerms")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteCreditTermsbyID(ByVal ID As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("delete from  F_TERMS where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteCreditTermsbyID")
                Return "error"
            End Try
        End Function

    End Class

End Namespace

Namespace BO

    Public Class Terms

        Private _ID As Integer
        Public Property ID As Integer
            Get
                Return _ID
            End Get
            Set(value As Integer)
                _ID = value
            End Set
        End Property

        Private _TermsDesc As String
        Public Property TermsDesc() As String
            Get
                Return _TermsDesc
            End Get
            Set(ByVal value As String)
                _TermsDesc = value
            End Set
        End Property

        Private _Code As String
        Public Property Code() As String
            Get
                Return _Code
            End Get
            Set(ByVal value As String)
                _Code = value
            End Set
        End Property

        Private _CreditCard As String
        Public Property CreditCard() As String
            Get
                Return _CreditCard
            End Get
            Set(ByVal value As String)
                _CreditCard = value
            End Set
        End Property

        Private _Days As Integer
        Public Property Days() As Integer
            Get
                Return _Days
            End Get
            Set(ByVal value As Integer)
                _Days = value
            End Set
        End Property

        Private _Discount As Decimal
        Public Property Discount() As Decimal
            Get
                Return _Discount
            End Get
            Set(ByVal value As Decimal)
                _Discount = value
            End Set
        End Property

        Private _DDays As Integer
        Public Property DDays() As Integer
            Get
                Return _DDays
            End Get
            Set(ByVal value As Integer)
                _DDays = value
            End Set
        End Property

        Private _COD As String
        Public Property COD() As String
            Get
                Return _COD
            End Get
            Set(ByVal value As String)
                _COD = value
            End Set
        End Property

    End Class

End Namespace


