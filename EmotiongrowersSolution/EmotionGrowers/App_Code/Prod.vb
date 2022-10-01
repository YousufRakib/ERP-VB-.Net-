Imports System.Data.SqlClient
Imports System.Data



Public Class DAOProd

    Public Shared Function GetProdDetailsByFBECalcMethod(ByVal Cat As String, ByVal Farm As String, ByVal UOM As String) As BOProd
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim P As New BOProd
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("select * from F_PROD where UOM=@UOM", Con)
                    Cmd.CommandType = CommandType.Text
                    Cmd.Parameters.AddWithValue("@UOM", UOM)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)

                    Dim result = ds.Tables(0).Select("Code=" + IIf(Cat <> "", "'" + Cat + "'", "''") + " And Farm=" + IIf(Farm <> "", "'" + Farm + "'", "''"))

                    If result.Count = 0 Then
                        result = ds.Tables(0).Select("TRIM(Code)='' And Farm=" + IIf(Farm <> "", "'" + Farm + "'", "''"))
                    End If

                    If result.Count = 0 Then
                        result = ds.Tables(0).Select("Code=" + IIf(Cat <> "", "'" + Cat + "'", "''") + " And TRIM(Farm)=''")
                    End If

                    If result.Count = 0 Then
                        result = ds.Tables(0).Select("TRIM(Code)='' And TRIM(Farm)=''")
                    End If

                    If result.Count = 0 Then
                        Return P
                    Else
                        For Each r As DataRow In result
                            P.PACKING = Convert.ToDecimal(r("PACKING"))
                            P.VOLUME = Convert.ToDecimal(r("VOLUME"))
                            P.FREIGHT = Convert.ToDecimal(r("FREIGHT"))
                            P.ARMELLINI = Convert.ToString(r("ARMELLINI"))
                            P.SIZE = Convert.ToString(r("SIZE"))
                            P.Name = Convert.ToString(r("NAME"))
                            P.L = Convert.ToDecimal(r("L"))
                            P.H = Convert.ToDecimal(r("H"))
                            P.W = Convert.ToDecimal(r("W"))
                            P.WEIGHT = Convert.ToDecimal(r("WEIGHT"))
                            P.FBE = Convert.ToDecimal(r("FBE"))
                            Return P
                        Next
                    End If
                End Using
            End Using
            Return P
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetProdDetailsByFBECalcMethod")
            Throw ex
        End Try
    End Function


    Public Shared Function GetUOMForManualPOByFarm(ByVal Farmcode As String) As List(Of BOProd)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BOProd)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetUOMForManualPOByFarm", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@FarmCode", Farmcode)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    If ds.Tables(0).Rows.Count > 0 Then
                        For Each row In ds.Tables(0).Rows
                            Dim u As New BOProd
                            u.UOM = row("UOM")
                            u.SIZE = row("SIZE")
                            ulist.Add(u)
                        Next
                    End If
                    Return ulist
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUOMFromPROD")
            Throw ex
        End Try
    End Function

    Public Shared Function GetUOMFromPROD() As List(Of BOProd)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BOProd)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("select * from F_PROD where Farm='' AND CODE='' order by UOM", Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOProd
                        u.UOM = row("UOM")
                        ulist.Add(u)
                    Next
                    Return ulist
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUOMFromPROD")
            Throw ex
        End Try
    End Function

    Public Shared Function GetUOMForSPORD(ByVal Farmcode As String) As List(Of BOProd)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BOProd)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                'Commented By Prashant On 15 Apr 2020 For the Adding the Default Value
                'Using Cmd As New SqlCommand("SELECT *,SUBSTRING(SIZE,1,2)+'x'+SUBSTRING(SIZE,3,2)+'x'+RIGHT('00'+ISNULL(SUBSTRING(SIZE,5,2),''),2) AS DIMENSION FROM F_PROD WHERE Farm = CASE WHEN @FarmCode='' THEN FARM ELSE @FarmCode END ORDER BY UOM", Con)
                Using Cmd As New SqlCommand("spGetUOMForSPORD", Con)
                    'Using Cmd As New SqlCommand("SELECT * FROM F_PROD WHERE Farm = RTRIM(LTRIM(@FarmCode)) ORDER BY UOM", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@FarmCode", Farmcode)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    'If ds.Tables(0).Rows.Count > 0 Then
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOProd
                        u.ID = row("ID")
                        u.UOM = row("UOM")
                        u.Name = row("Name")
                        u.CODE = row("CODE")
                        u.FARM = row("FARM")
                        u.SIZE = row("DIMENSION")
                        ulist.Add(u)
                    Next
                    'Else
                    '    Using Cmd1 As New SqlCommand("SELECT *,SUBSTRING(SIZE,1,2)+'x'+SUBSTRING(SIZE,3,2)+'x'+RIGHT('00'+ISNULL(SUBSTRING(SIZE,5,2),''),2) AS DIMENSION FROM F_PROD WHERE Farm='' and ISNULL(UOM,'')<>'' ORDER BY UOM", Con)
                    '        Cmd1.CommandType = CommandType.Text
                    '        Dim da1 As New SqlDataAdapter(Cmd1)
                    '        da1.Fill(ds)
                    '        For Each row In ds.Tables(0).Rows
                    '            Dim u As New BOProd
                    '            u.ID = row("ID")
                    '            u.UOM = row("UOM")
                    '            u.Name = row("Name")
                    '            u.CODE = row("CODE")
                    '            u.FARM = row("FARM")
                    '            u.SIZE = row("DIMENSION")
                    '            ulist.Add(u)
                    '        Next
                    '    End Using
                    'End If
                    Return ulist
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUOMFromPROD")
            Throw ex
        End Try
    End Function

#Region "Warehouse Handling"
    Public Shared Function GetUOMForWHHandling(ByVal Farmcode As String) As List(Of BOProd)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BOProd)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spLoadUOMForWH_Handling", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New BOProd
                        Dim tmpuom = (From itm In ulist Where itm.UOM.ToLower() = row("UOM").ToString().ToLower())
                        If Not tmpuom.Any() And row("UOM") <> "" Then
                            u.ID = row("ID")
                            u.UOM = row("UOM")
                            u.Name = row("Name")
                            u.CODE = row("CODE")
                            u.FARM = row("FARM")
                            ulist.Add(u)
                        End If
                    Next
                    Return ulist
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetUOMFromPROD")
            Throw ex
        End Try
    End Function
#End Region
End Class





Public Class BOProd

    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Private _CODE As String
    Public Property CODE() As String
        Get
            Return _CODE
        End Get
        Set(ByVal value As String)
            _CODE = value
        End Set
    End Property

    Private _FARM As String
    Public Property FARM() As String
        Get
            Return _FARM
        End Get
        Set(ByVal value As String)
            _FARM = value
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

    Private _UOM As String
    Public Property UOM() As String
        Get
            Return _UOM
        End Get
        Set(ByVal value As String)
            _UOM = value
        End Set
    End Property

    Private _ARMELPROD As String
    Public Property ARMELPROD() As String
        Get
            Return _ARMELPROD
        End Get
        Set(ByVal value As String)
            _ARMELPROD = value
        End Set
    End Property

    Private _ARMELLINI As String
    Public Property ARMELLINI() As String
        Get
            Return _ARMELLINI
        End Get
        Set(ByVal value As String)
            _ARMELLINI = value
        End Set
    End Property

    Private _SIZE As String
    Public Property SIZE() As String
        Get
            Return _SIZE
        End Get
        Set(ByVal value As String)
            _SIZE = value
        End Set
    End Property

    Private _PACKING As Decimal
    Public Property PACKING() As Decimal
        Get
            Return _PACKING
        End Get
        Set(ByVal value As Decimal)
            _PACKING = value
        End Set
    End Property

    Private _FBE As Decimal
    Public Property FBE() As Decimal
        Get
            Return _FBE
        End Get
        Set(ByVal value As Decimal)
            _FBE = value
        End Set
    End Property

    Private _FREIGHT As Decimal
    Public Property FREIGHT() As Decimal
        Get
            Return _FREIGHT
        End Get
        Set(ByVal value As Decimal)
            _FREIGHT = value
        End Set
    End Property

    Private _BOXRETURN As Decimal
    Public Property BOXRETURN() As Decimal
        Get
            Return _BOXRETURN
        End Get
        Set(ByVal value As Decimal)
            _BOXRETURN = value
        End Set
    End Property

    Private _VOLUME As Decimal
    Public Property VOLUME() As Decimal
        Get
            Return _VOLUME
        End Get
        Set(ByVal value As Decimal)
            _VOLUME = value
        End Set
    End Property

    Private _WEIGHT As Decimal
    Public Property WEIGHT() As Decimal
        Get
            Return _WEIGHT
        End Get
        Set(ByVal value As Decimal)
            _WEIGHT = value
        End Set
    End Property

    Private _H As Decimal
    Public Property H() As Decimal
        Get
            Return _H
        End Get
        Set(ByVal value As Decimal)
            _H = value
        End Set
    End Property

    Private _W As Decimal
    Public Property W() As Decimal
        Get
            Return _W
        End Get
        Set(ByVal value As Decimal)
            _W = value
        End Set
    End Property

    Private _L As Decimal
    Public Property L() As Decimal
        Get
            Return _L
        End Get
        Set(value As Decimal)
            _L = value
        End Set
    End Property

    Private _ErrorMessage As String
    Public Property ErrorMessage As String
        Get
            Return _ErrorMessage
        End Get
        Set(value As String)
            _ErrorMessage = value
        End Set
    End Property
End Class




