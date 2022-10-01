Imports System.Data.SqlClient
Imports System.Data


Namespace DAO
    Public Class Country

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Function GetCountryCodesListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer) As List(Of BO.Country)

            Dim uList As New List(Of BO.Country)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetCountryCodes]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Country()
                            u.ID = row("ID")
                            u.COUNTRY = row("COUNTRY")
                            u.NAME = row("NAME")
                            u.CURRENCYCODE = ""
                            u.CURRENCYRATE = ""
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCountryCodesListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function GetCountryCodesDetailByID(ByVal ID As String) As List(Of BO.Country)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim CountryCodesList As New List(Of BO.Country)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim sqlQuery As String = ""
                    sqlQuery = "SELECT ID,COUNTRY,NAME FROM F_COUNTY WHERE ID=" + ID + " ORDER BY COUNTRY"
                    Using cmd As New SqlCommand(sqlQuery, con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Country()
                            u.ID = row("ID")
                            u.COUNTRY = row("COUNTRY")
                            u.NAME = row("NAME")
                            u.CURRENCYCODE = ""
                            u.CURRENCYRATE = ""
                            CountryCodesList.Add(u)
                        Next
                    End Using
                End Using
                Return CountryCodesList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCountryCodesDetailsForFgrd")
                Throw ex
            End Try
        End Function

        Public Shared Function InsertCountryCodes(ByVal CountryCodesCountry As String, ByVal CountryCodesName As String, ByVal CurrencyCode As String, ByVal CurrencyRate As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim CountryCodesScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_COUNTYInsert", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure

                Cmd.Parameters.AddWithValue("@CountryCodesCountry", CountryCodesCountry)
                Cmd.Parameters.AddWithValue("@CountryCodesName", CountryCodesName)
                Cmd.Parameters.AddWithValue("@CurrencyCode", CurrencyCode)
                Cmd.Parameters.AddWithValue("@CurrencyRate", CurrencyRate)
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
                    Logs.Savelog(UserDetails.ID, "Users", "InsertCountryCodes", "Added a new Country Code <b>" + CountryCodesName + "</b>", CountryCodesScopeID.ToString())
                End If
                Return CountryCodesScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertCountryCodes")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function UpdateCountryCodes(ByVal ID As Integer, ByVal CountryCodesCountry As String, ByVal CountryCodesName As String, ByVal CurrencyCode As String, ByVal CurrencyRate As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim CountryCodesScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_COUNTYUpdate", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@CountryCodesCountry", CountryCodesCountry)
                Cmd.Parameters.AddWithValue("@CountryCodesName", CountryCodesName)
                Cmd.Parameters.AddWithValue("@CurrencyCode", CurrencyCode)
                Cmd.Parameters.AddWithValue("@CurrencyRate", CurrencyRate)
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
                    Logs.Savelog(UserDetails.ID, "Users", "UpdateCountryCodes", "Updated a Country Code <b>" + CountryCodesName + "</b>", CountryCodesScopeID.ToString())
                End If
                Return CountryCodesScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in UpdateCountryCodes")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteCountryCodesbyID(ByVal ID As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("delete from  F_COUNTY where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteCountryCodesbyID")
                Return "error"
            End Try
        End Function

        ''' <summary>
        ''' ABI::28-Apr-2018::To get Country code lists
        ''' </summary>
        ''' <returns></returns>
        Public Shared Function GetCountryCodeList() As List(Of BO.Country)

            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim ulist As New List(Of BO.Country)
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select  ID,Country,Name from F_COUNTY order by COUNTRY", con)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Country
                            u.ID = row("ID")
                            u.COUNTRY = row("Country")
                            u.NAME = row("Name")
                            ulist.Add(u)
                        Next
                    End Using
                End Using
                Return ulist
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetCountryCodeList")
                Return Nothing
            End Try
        End Function

    End Class
End Namespace

Namespace BO
    Public Class Country

        Private _ID As Integer
        Public Property ID As Integer
            Get
                Return _ID
            End Get
            Set(value As Integer)
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

        Private _NAME As String
        Public Property NAME() As String
            Get
                Return _NAME
            End Get
            Set(ByVal value As String)
                _NAME = value
            End Set
        End Property

        Private _CURRENCYCODE As String
        Public Property CURRENCYCODE() As String
            Get
                Return _CURRENCYCODE
            End Get
            Set(ByVal value As String)
                _CURRENCYCODE = value
            End Set
        End Property

        Private _CURRENCYRATE As String
        Public Property CURRENCYRATE() As String
            Get
                Return _CURRENCYRATE
            End Get
            Set(ByVal value As String)
                _CURRENCYRATE = value
            End Set
        End Property
    End Class
End Namespace


