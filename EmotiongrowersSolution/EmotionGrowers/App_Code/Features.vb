Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Xml

Public Class Features
    Public Class GetFeatureDetails
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property
        Public Function GetFeatures(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                         ByVal numberOfRows As Integer) As List(Of Feature)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of Feature)()
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetFeatureDetails]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Feature()
                            u.FeatureID = row("ID")
                            u.Name = row("Name")
                            u.Value = row("Value")
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using
                Return uList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetFeatures")
                Return Nothing
            End Try
        End Function
    End Class

    Public Shared Function GetFeature() As List(Of Feature)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim uList As New List(Of Feature)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblFeatures", con)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Feature
                        u.FeatureID = row("ID")
                        u.Name = row("Name")
                        u.Value = IIf(IsDBNull(row("Value")), "0", row("Value"))
                        u.ModifiedDate = Convert.ToDateTime(row("ModifiedDate"))
                        u.Options = IIf(IsDBNull(row("Options")), "", row("Options"))
                        u.Prvalue = IIf(IsDBNull(row("PrValue")), "", row("PrValue"))
                        uList.Add(u)
                    Next
                End Using
            End Using
            Return uList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFeature")
            Return Nothing
        End Try
    End Function

    Public Shared Function SaveFeatureDetails(ByVal FeatureName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spSaveFeatureDetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Name", FeatureName))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveFeatureDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function UpdateFeatureDetails(ByVal FeatureName As String, ByVal FeatureID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spUpdateFeatureDetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Name", FeatureName))
                    cmd.Parameters.Add(New SqlParameter("@FeatureID", FeatureID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in UpdateFeatureDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function DeleteFeatureDetails(ByVal FeatureID As Integer) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spDeleteFeatureDetails]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@FeatureID", FeatureID))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in DeleteFeatureDetails")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFeatureforFeatureID(ByVal FeatureID As Integer) As Feature
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New Feature
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblFeatures where ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", FeatureID)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.FeatureID = row("ID")
                        u.Name = row("Name")
                        u.Value = IIf(row("Value") Is DBNull.Value, "0", row("Value"))
                    Next
                End Using
            End Using
            Return u
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFeatureforFeatureID")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetFeatureByName(ByVal Name As String) As Feature
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim F As New Feature
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblFeatures Where Name=@Name", con)
                    cmd.Parameters.AddWithValue("@Name", Name)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        F.FeatureID = row("ID")
                        F.Name = row("Name")
                        F.Value = IIf(IsDBNull(row("Value")), "0", row("Value"))
                        F.ModifiedDate = Convert.ToDateTime(row("ModifiedDate"))
                        F.Options = IIf(IsDBNull(row("Options")), "", row("Options"))
                        F.Prvalue = IIf(IsDBNull(row("PrValue")), "", row("PrValue"))
                    Next
                End Using
            End Using
            Return F
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFeature")
            Return Nothing
        End Try
    End Function

    Public Shared Function getPrinterValueOption(ByVal PrinterName As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim u As New Feature
            Dim result As String = ""
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("select * from tblFeatures where Name=@PrinterName", con)
                    cmd.Parameters.AddWithValue("@PrinterName", PrinterName)
                    Dim da As New SqlDataAdapter(cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        u.FeatureID = row("ID")
                        u.Name = row("Name")
                        u.Prvalue = IIf(row("PrValue") Is DBNull.Value, "", row("PrValue"))
                        result += IIf(result.Length <= 0, "", " , ")
                        result += u.FeatureID
                    Next
                End Using
            End Using
            Dim LoginUserDetails As New User
            'If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
            '    LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            '    Logs.Savelog(LoginUserDetails.ID, "Admin", "SaveFeatureValues", "Updated the Feature settings", result)
            'End If
            ''Move Admin session to Users :: 09Feb2018''
            If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
                Logs.Savelog(LoginUserDetails.ID, "Admin", "SaveFeatureValues", "Updated the Feature settings", result)
            End If
            Return u.Prvalue
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveFeatureValues")
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' VEN::13-Nov-2015::For Save Feature Values 
    ''' </summary>
    ''' <param name="FeatureDetails"></param>
    ''' <returns></returns>
    Public Shared Function SaveFeatureValues(ByVal FeatureDetails As String) As String
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd As New SqlCommand("[spSaveFeatureValues]", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@FeatureDetails", FeatureDetails))
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Dim IDs As New XmlDocument()
            IDs.LoadXml(FeatureDetails)
            Dim IDsList As XmlNodeList = IDs.GetElementsByTagName("FeatureID")
            Dim result As String = ""
            For Each detail As XmlNode In IDsList
                result += IIf(result.Length <= 0, "", " , ")
                result += detail.InnerText
            Next
            Dim LoginUserDetails As New User
            If (Not HttpContext.Current.Session("LoginAdminDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginAdminDetails")
            ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                LoginUserDetails = HttpContext.Current.Session("LoginUserDetails")
            End If
            If (Not LoginUserDetails Is Nothing) Then
                Logs.Savelog(LoginUserDetails.ID, "Admin", "SaveFeatureValues", "Updated the Feature settings", result)
            End If
            Return "valid"
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveFeatureValues")
            Return Nothing
        End Try
    End Function

End Class

Public Class Feature

    Private _FeatureID As Integer
    Public Property FeatureID() As Integer
        Get
            Return _FeatureID
        End Get
        Set(ByVal value As Integer)
            _FeatureID = value
        End Set
    End Property

    Private _UserID As Integer
    Public Property UserID() As Integer
        Get
            Return _UserID
        End Get
        Set(ByVal value As Integer)
            _UserID = value
        End Set
    End Property

    Private _Name As String
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(value As String)
            _Name = value
        End Set
    End Property

    Private _Value As Boolean
    Public Property Value As Boolean
        Get
            Return _Value
        End Get
        Set(value As Boolean)
            _Value = value
        End Set
    End Property

    Private _ModifiedDate As DateTime
    Public Property ModifiedDate As DateTime
        Get
            Return _ModifiedDate
        End Get
        Set(value As DateTime)
            _ModifiedDate = value
        End Set
    End Property

    Private _Options As String
    Public Property Options() As String
        Get
            Return _Options
        End Get
        Set(value As String)
            _Options = value
        End Set
    End Property

    Private _Prvalue As String
    Public Property Prvalue() As String
        Get
            Return _Prvalue
        End Get
        Set(value As String)
            _Prvalue = value
        End Set
    End Property
End Class
