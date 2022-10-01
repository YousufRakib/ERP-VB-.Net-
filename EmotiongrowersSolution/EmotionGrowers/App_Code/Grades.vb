Imports System.Data.SqlClient
Imports System.Data


Namespace DAO
    Public Class Grades
        Public Shared Function LoadGrades(ByVal Category As String) As List(Of BO.Grades)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim UList As New List(Of BO.Grades)
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim Qry As String = ""
                    If Category = "" Then
                        Qry = "SELECT ID,Grade FROM F_Grades order by Grade asc"
                    Else
                        Qry = "SELECT ID,Grade FROM F_Grades where Category='" + Category + "' order by Grade asc"
                    End If

                    Using cmd As New SqlCommand(Qry, con)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Grades
                            u.ID = row("ID")
                            u.Grade = row("Grade")
                            UList.Add(u)
                        Next
                    End Using
                End Using
                Return UList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in LoadGrades")
                Return Nothing
            End Try
        End Function

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set

        End Property

        Public Function GetGradesListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                              ByVal numberOfRows As Integer) As List(Of BO.Grades)

            Dim uList As New List(Of BO.Grades)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetGrades]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BO.Grades()
                            u.ID = row("ID")
                            u.Category = row("Category")
                            u.Grade = row("Grade")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGradesListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function

        Public Shared Function AddEditDetleteSelectGrades(ByVal ID As String, ByVal Category As String, ByVal Grade As String, ByVal Mode As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim GradesScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_GRADES", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@Category", Category)
                Cmd.Parameters.AddWithValue("@Grade", Grade)
                Cmd.Parameters.AddWithValue("@Mode", Mode)
                GradesScopeID = Cmd.ExecuteScalar()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "AddEditDetleteSelectGrades", IIf(ID = "0", "Added a new Grade <b>" + Grade + "</b>", "Updated a Grade <b>" + Grade + "</b>"), GradesScopeID.ToString())
                End If
                Return GradesScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in AddEditDetleteSelectVarieties")
                End If
                Return ex.Message()
            End Try
        End Function

        Public Shared Function GetGradesByID(ByVal ID As String) As BO.Grades
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim u As New BO.Grades()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("SELECT * FROM F_GRADES WHERE ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            u.ID = row("ID")
                            u.Category = row("Category")
                            u.Grade = row("Grade")
                        Next
                    End Using
                End Using
                Return u
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetGradesByID")
                Throw ex
            End Try
        End Function

    End Class
End Namespace

Namespace BO
    Public Class Grades
        Private _ID As String
        Public Property ID() As String
            Get
                Return _ID
            End Get
            Set(ByVal value As String)
                _ID = value
            End Set
        End Property

        Private _Category As String
        Public Property Category() As String
            Get
                Return _Category
            End Get
            Set(ByVal value As String)
                _Category = value
            End Set
        End Property

        Private _Grade As String
        Public Property Grade() As String
            Get
                Return _Grade
            End Get
            Set(ByVal value As String)
                _Grade = value
            End Set
        End Property

        Private _Name As String
        Public Property Name() As String
            Get
                Return _Name
            End Get
            Set(ByVal value As String)
                _Name = value
            End Set
        End Property

    End Class
End Namespace
