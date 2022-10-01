Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Public Class DAOARCOMM

    Public Shared Function GetARINVNotesDetail(ByVal CustomerNo As String, ByVal sortExp As String) As List(Of BOARCOMM)
        Try
            Dim uList As New List(Of BOARCOMM)
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim Address As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select ID,CUSTOMER,COMMENTS,ADDUSER,ADDDATE,ADDTIME,UPDUSER,UPDDATE,UPDTIME from F_ARCOMM where Customer=@CustomerNo order by " + sortExp, con)
                    cmd.Parameters.AddWithValue("@CustomerNo", CustomerNo)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    For Each row In dt.Rows
                        Dim u As New BOARCOMM()
                        u.COMMID = row("ID")
                        u.Customer = row("Customer")
                        u.COMMENTS = row("COMMENTS")
                        u.ADDUSER = IIf(row("ADDUSER") Is DBNull.Value, "", row("ADDUSER"))
                        u.ADDDATE = IIf(row("ADDDATE") Is DBNull.Value, "", row("ADDDATE"))
                        u.ADDTIME = IIf(row("ADDTIME") Is DBNull.Value, "", row("ADDTIME"))
                        u.UPDUSER = IIf(row("UPDUSER") Is DBNull.Value, "", row("UPDUSER"))
                        u.UPDDATE = IIf(row("UPDDATE") Is DBNull.Value, "", row("ADDDATE"))
                        u.UPDTIME = IIf(row("UPDTIME") Is DBNull.Value, "", row("UPDTIME"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetARINVNotesDetail")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetARINVNotesByCOMMID(ByVal COMMID As String) As BOARCOMM
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New BOARCOMM()
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select ID,CUSTOMER,COMMENTS,ADDUSER,ADDDATE,ADDTIME,UPDUSER,UPDDATE,UPDTIME from F_ARCOMM where ID=@COMMID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@COMMID", COMMID))
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    For Each row In ds.Tables(0).Rows
                        u.COMMID = row("ID")
                        u.Customer = row("Customer")
                        u.COMMENTS = row("COMMENTS")
                        u.ADDUSER = IIf(row("ADDUSER") Is DBNull.Value, "", row("ADDUSER"))
                        u.ADDDATE = IIf(row("ADDDATE") Is DBNull.Value, "", row("ADDDATE"))
                        u.ADDTIME = IIf(row("ADDTIME") Is DBNull.Value, "", row("ADDTIME"))
                        u.UPDUSER = IIf(row("UPDUSER") Is DBNull.Value, "", row("UPDUSER"))
                        u.UPDDATE = IIf(row("UPDDATE") Is DBNull.Value, "", row("UPDDATE"))
                        u.UPDTIME = IIf(row("UPDTIME") Is DBNull.Value, "", row("UPDTIME"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetARINVNotesByCOMMID")
            Throw ex
        End Try
    End Function

    Public Shared Function DeleteARINVNotesByCOMMID(ByVal COMMID As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("Delete from F_ARCOMM where ID=@COMMID", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@COMMID", COMMID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteARINVNotesByCOMMID")
            Throw ex
        End Try
    End Function

    Public Shared Function SaveARINVNotesByCOMMID(ByVal Customer As String, ByVal COMMENTS As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                If (User.Length < 20) Then
                    User = User
                Else
                    User = User.Substring(0, 20)
                End If
                Using cmd As New SqlCommand("INSERT INTO F_ARCOMM(Customer,COMMENTS,ADDUSER,ADDDATE,ADDTIME) VALUES(@Customer,@COMMENTS,@User,@AddDate,@AddTime)", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@Customer", Customer))
                    cmd.Parameters.Add(New SqlParameter("@COMMENTS", COMMENTS))
                    cmd.Parameters.AddWithValue("@User", User)
                    cmd.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd.Parameters.AddWithValue("@AddTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))

                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveARINVNotesByCOMMID")
            Throw ex
        End Try
    End Function

    Public Shared Function UpdateARINVNotesByCOMMID(ByVal Customer As String, ByVal COMMID As String, ByVal COMMENTS As String, ByVal User As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                If (User.Length < 20) Then
                    User = User
                Else
                    User = User.Substring(0, 20)
                End If
                Using cmd As New SqlCommand("UPDATE F_ARCOMM SET COMMENTS=@COMMENTS,UPDUSER=@User,UPDDATE=AddDate,UPDTIME=@AddTime where ID=@COMMID and Customer=@Customer", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@Customer", Customer))
                    cmd.Parameters.Add(New SqlParameter("@COMMENTS", COMMENTS))
                    cmd.Parameters.AddWithValue("@User", User)
                    cmd.Parameters.AddWithValue("@AddDate", Convert.ToDateTime(DateTime.Now.Date, New System.Globalization.CultureInfo("en-US", True)).ToString("MM/dd/yy"))
                    cmd.Parameters.AddWithValue("@AddTime", Convert.ToDateTime(DateTime.Now, New System.Globalization.CultureInfo("en-US", True)).ToString("HH:mm:ss"))
                    cmd.Parameters.AddWithValue("@COMMID", COMMID)
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "Success"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateARINVNotesByCOMMID")
            Throw ex
        End Try
    End Function

End Class

Public Class BOARCOMM

    Private _COMMID As Integer
    Public Property COMMID() As Integer
        Get
            Return _COMMID
        End Get
        Set(ByVal value As Integer)
            _COMMID = value
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

    Private _COMMENTS As String
    Public Property COMMENTS() As String
        Get
            Return _COMMENTS
        End Get
        Set(ByVal value As String)
            _COMMENTS = value
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
End Class