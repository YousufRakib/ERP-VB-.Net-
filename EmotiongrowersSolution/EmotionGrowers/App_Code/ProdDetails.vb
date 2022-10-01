Imports System.Data.SqlClient
Imports System.Data


Public Class ProdDetails
    Public Shared Function SaveProdDetails(ByVal ProdList As String, ByVal UserID As String) As String
        Try

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("[SpSaveProdDetails]", con)
                    cmd1.CommandType = CommandType.StoredProcedure
                    cmd1.Parameters.AddWithValue("@ProdList", ProdList.ToString())
                    cmd1.Parameters.AddWithValue("@UserID", UserID)
                    Dim result1 = cmd1.ExecuteScalar()
                    Return result1
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in SaveProdDetails")
            Return Nothing
        End Try
        Return ""
    End Function
    Public Class GetProdDetails
        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Public Function GetProdListForFgrd(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer, ByVal numberOfRows As Integer) As List(Of Prod)

            Dim uList As New List(Of Prod)()
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("[spGetProdDetails]", con)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.Add(New SqlParameter("@WhereClause", whereClause))
                        cmd.Parameters.Add(New SqlParameter("@SortExpression", sortExp))
                        cmd.Parameters.Add(New SqlParameter("@RowIndex", startRowIndex))
                        cmd.Parameters.Add(New SqlParameter("@NoOfRows", numberOfRows))
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Prod()
                            u.ID = row("ID")
                            u.ARMELLINI = Convert.ToString(row("ARMELLINI"))
                            u.ARMELPROD = Convert.ToString(row("ARMELPROD"))
                            u.BOXRETURN = If(row("BOXRETURN") Is DBNull.Value, 0.00, row("BOXRETURN"))
                            u.CODE = Convert.ToString(row("CODE"))
                            u.FARM = Convert.ToString(row("FARM"))
                            u.FBE = If(row("FBE") Is DBNull.Value, 0.0000, row("FBE"))
                            u.FREIGHT = If(row("FREIGHT") Is DBNull.Value, 0.00, row("FREIGHT"))
                            u.H = If(row("H") Is DBNull.Value, 0.00, row("H"))
                            u.L = If(row("L") Is DBNull.Value, 0.00, row("L"))
                            u.NAME = Convert.ToString(row("NAME"))
                            u.PACKING = If(row("PACKING") Is DBNull.Value, 0.00, row("PACKING"))
                            u.SIZE = Convert.ToString(row("SIZE"))
                            u.UOM = Convert.ToString(row("UOM"))
                            u.VOLUME = If(row("VOLUME") Is DBNull.Value, 0.00, row("VOLUME"))
                            u.W = If(row("W") Is DBNull.Value, 0.00, row("W"))
                            u.WEIGHT = If(row("WEIGHT") Is DBNull.Value, 0.00, row("WEIGHT"))
                            uList.Add(u)
                        Next
                        Me.TotalRows = ds.Tables(1).Rows(0)(0)
                    End Using
                End Using

            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetProdListForFgrd")
                Return Nothing
            End Try
            Return uList
        End Function


        Public Shared Function GetSingleProductForKometpost(ByVal FLOWER As String) As List(Of Prod)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim uList As New List(Of Prod)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select * from F_flower where FLOWER=@FLOWER", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@FLOWER", FLOWER.ToString())
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)


                        For Each row In ds.Tables(0).Rows
                            Dim u As New Prod()
                            u.CODE = row("FLOWER")
                            u.NAME = row("NAME")
                            u.CAT = IIf(row("CAT") Is DBNull.Value, "", row("CAT"))
                            u.COLOR = IIf(row("COLOR") Is DBNull.Value, "", row("COLOR"))
                            u.VARIETY = IIf(row("VARIETY") Is DBNull.Value, "", row("VARIETY"))
                            u.GRADE = IIf(row("GRADE") Is DBNull.Value, "", row("GRADE"))
                            uList.Add(u)
                        Next

                    End Using
                End Using
                Return uList


            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetSingleProductForKometpost")
                Throw ex
            End Try
        End Function

        Public Shared Function IsProductHaveKometID(ByVal Flower As String) As Boolean
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim IsKometID As Boolean

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select KometID from F_flower where Flower='" + Flower.ToString().Trim() + "'", con)
                        cmd.CommandType = CommandType.Text
                        Dim kometid = cmd.ExecuteScalar()
                        If (kometid = Nothing) Then
                            IsKometID = False
                        End If
                        If kometid.ToString().Trim() <> "" Then
                            IsKometID = True
                        Else
                            IsKometID = False
                        End If

                    End Using
                End Using
                Return IsKometID
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in IsProductHaveKometID")
                Throw ex
            End Try
        End Function
        Public Shared Function GetProductKometID(ByVal Flower As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim kometid As String

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select KometID from F_flower where Flower='" + Flower + "'", con)
                        cmd.CommandType = CommandType.Text
                        kometid = cmd.ExecuteScalar()
                    End Using
                End Using
                Return kometid
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in IsProductHaveKometID")
                Throw ex
            End Try
        End Function

        Public Shared Function GetFarmCodebyCity(ByVal CITY As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim FARMCODE As String = "0"

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("select FARMCODE  from F_FARMTOORIGIN where ORIGIN='" + CITY + "'", con)
                        cmd.CommandType = CommandType.Text
                        FARMCODE = cmd.ExecuteScalar()
                    End Using
                End Using
                Return FARMCODE
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetFarmCodebyCity")
                Throw ex
            End Try
        End Function

        Public Shared Function UpdateKometID(ByVal KometID As String, ByVal Flower As String) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd1 As New SqlCommand("Update F_flower set KOMETID=@KometID where FLOWER=@FLOWER ", con)
                        cmd1.CommandType = CommandType.Text
                        cmd1.Parameters.AddWithValue("@FLOWER", Flower.ToString())
                        cmd1.Parameters.AddWithValue("@KometID", KometID)
                        Dim result1 = cmd1.ExecuteNonQuery()
                        Return result1
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in UpdateCUSTOMERKometID")
                Return Nothing
            End Try
            Return ""
        End Function

        Public Shared Function GetProdDetailByID(ByVal ID As String) As List(Of Prod)
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim ProdCatList As New List(Of Prod)()

                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Dim sqlQuery As String = ""
                    sqlQuery = "SELECT ID,CODE,FARM,NAME,UOM,ARMELPROD,ARMELLINI,SIZE,PACKING,FBE,FREIGHT,BOXRETURN,VOLUME,WEIGHT,H,W,L  FROM F_PROD WHERE ID=" + ID + " ORDER BY CODE,FARM"
                    Using cmd As New SqlCommand(sqlQuery, con)
                        cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet
                        da.Fill(ds)
                        For Each row In ds.Tables(0).Rows
                            Dim u As New Prod()
                            u.ID = row("ID")
                            u.CODE = row("CODE")
                            u.FARM = row("FARM")
                            u.NAME = row("NAME")
                            u.UOM = row("UOM")
                            u.ARMELPROD = If(row("ARMELPROD") Is DBNull.Value, "", row("ARMELPROD"))
                            u.ARMELLINI = If(row("ARMELLINI") Is DBNull.Value, "", row("ARMELLINI"))
                            u.SIZE = If(row("SIZE") Is DBNull.Value, "", row("SIZE"))
                            u.PACKING = If(row("PACKING") Is DBNull.Value, 0.00, row("PACKING"))
                            u.FBE = If(row("FBE") Is DBNull.Value, 0.0000, row("FBE"))
                            u.FREIGHT = If(row("FREIGHT") Is DBNull.Value, 0.00, row("FREIGHT"))
                            u.BOXRETURN = If(row("BOXRETURN") Is DBNull.Value, 0.00, row("BOXRETURN"))
                            u.VOLUME = If(row("VOLUME") Is DBNull.Value, 0.00, row("VOLUME"))
                            u.WEIGHT = If(row("WEIGHT") Is DBNull.Value, 0.00, row("WEIGHT"))
                            u.H = If(row("H") Is DBNull.Value, 0.00, row("H"))
                            u.W = If(row("W") Is DBNull.Value, 0.00, row("W"))
                            u.L = If(row("L") Is DBNull.Value, 0.00, row("L"))

                            ProdCatList.Add(u)
                        Next
                    End Using
                End Using
                Return ProdCatList
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetProdDetailByID")
                Throw ex
            End Try
        End Function
        ''' <summary>
        ''' Altered :: Muthu Nivetha M :: 05Feb2020 :: Implemented the changes of Box size maintenance/ Duplicate button
        ''' </summary>
        Public Shared Function InsertProdDetails(ByVal CODE As String, ByVal FARM As String, ByVal NAME As String, ByVal UOM As String,
   ByVal SIZE As String, ByVal FBE As Decimal, ByVal VOLUME As Decimal, ByVal WEIGHT As Decimal, ByVal H As Decimal, ByVal W As Decimal, ByVal L As Decimal, ByVal isDuplicateBoxMaintance As Boolean) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim ProdDetailsScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_PRODInsert", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure

                Cmd.Parameters.AddWithValue("@CODE", CODE)
                Cmd.Parameters.AddWithValue("@FARM", FARM)
                Cmd.Parameters.AddWithValue("@NAME", NAME)
                Cmd.Parameters.AddWithValue("@UOM", UOM)
                Cmd.Parameters.AddWithValue("@SIZE", SIZE)
                Cmd.Parameters.AddWithValue("@FBE", FBE)
                Cmd.Parameters.AddWithValue("@H", H)
                Cmd.Parameters.AddWithValue("@W", W)
                Cmd.Parameters.AddWithValue("@L", L)
                'Cmd.Parameters.AddWithValue("@isDuplicateBoxMaintance", isDuplicateBoxMaintance)
                'Cmd.ExecuteNonQuery()
                ProdDetailsScopeID = Cmd.ExecuteScalar()

                Cmd.Dispose()
                SqlCon.Close()
                Dim UserDetails As New User
                If (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                ElseIf (Not HttpContext.Current.Session("LoginUserDetails") Is Nothing) Then
                    UserDetails = HttpContext.Current.Session("LoginUserDetails")
                End If
                If (Not UserDetails Is Nothing) Then
                    Logs.Savelog(UserDetails.ID, "Users", "InsertProdDetails", "Added a new Product box size <b>" + CODE + " :: " + FARM + " :: " + UOM + "</b>", ProdDetailsScopeID.ToString())
                End If
                Return ProdDetailsScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in InsertProdDetails")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function UpdateProdDetails(ByVal ID As Integer, ByVal CODE As String, ByVal FARM As String, ByVal NAME As String, ByVal UOM As String, ByVal SIZE As String, ByVal FBE As Decimal, ByVal VOLUME As Decimal, ByVal WEIGHT As Decimal, ByVal H As Decimal, ByVal W As Decimal, ByVal L As Decimal) As String
            Try
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Dim SqlCon As New SqlConnection(ConStr)
                SqlCon.Open()
                Dim ProdDetailsScopeID As String = ""
                Dim Cmd As New SqlCommand("sp_F_PRODUpdate", SqlCon)
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.Parameters.AddWithValue("@ID", ID)
                Cmd.Parameters.AddWithValue("@CODE", CODE)
                Cmd.Parameters.AddWithValue("@FARM", FARM)
                Cmd.Parameters.AddWithValue("@NAME", NAME)
                Cmd.Parameters.AddWithValue("@UOM", UOM)
                ' Cmd.Parameters.AddWithValue("@ARMELPROD", ARMELPROD)
                'Cmd.Parameters.AddWithValue("@ARMELLINI", ARMELLINI)
                Cmd.Parameters.AddWithValue("@SIZE", SIZE)
                'Cmd.Parameters.AddWithValue("@PACKING", PACKING)
                Cmd.Parameters.AddWithValue("@FBE", FBE)
                'Cmd.Parameters.AddWithValue("@FREIGHT", FREIGHT)
                'Cmd.Parameters.AddWithValue("@BOXRETURN", BOXRETURN)
                'Cmd.Parameters.AddWithValue("@VOLUME", VOLUME)
                'Cmd.Parameters.AddWithValue("@WEIGHT", WEIGHT)
                Cmd.Parameters.AddWithValue("@H", H)
                Cmd.Parameters.AddWithValue("@W", W)
                Cmd.Parameters.AddWithValue("@L", L)
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
                    Logs.Savelog(UserDetails.ID, "Users", "UpdateProdDetails", "Updated a Product box size <b>" + CODE + " :: " + FARM + " :: " + UOM + "</b>", ProdDetailsScopeID.ToString())
                End If
                Return ProdDetailsScopeID
            Catch ex As Exception
                If (Not ex.Message.Contains("UNIQUE KEY constraint")) Then
                    ErrorLogs.LogException(ex, "Error in UpdateProdDetails")
                End If
                Return ex.Message.ToString()
            End Try
        End Function

        Public Shared Function DeleteProdDetailsbyID(ByVal ID As String) As String
            Try
                Dim u As New Flower
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using con As New SqlConnection(ConStr)
                    con.Open()
                    Using cmd As New SqlCommand("delete from  F_PROD where ID=@ID", con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ID", ID)
                        cmd.ExecuteNonQuery()
                        Return "Success"
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in DeleteProdDetailsbyID")
                Return "error"
            End Try
        End Function


    End Class
End Class

Public Class Prod

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

    Private _NAME As String
    Public Property NAME() As String
        Get
            Return _NAME
        End Get
        Set(ByVal value As String)
            _NAME = value
        End Set
    End Property
    Private _CAT As String
    Public Property CAT() As String
        Get
            Return _CAT
        End Get
        Set(ByVal value As String)
            _CAT = value
        End Set
    End Property

    Private _COLOR As String
    Public Property COLOR() As String
        Get
            Return _COLOR
        End Get
        Set(ByVal value As String)
            _COLOR = value
        End Set
    End Property

    Private _VARIETY As String
    Public Property VARIETY() As String
        Get
            Return _VARIETY
        End Get
        Set(ByVal value As String)
            _VARIETY = value
        End Set
    End Property

    Private _GRADE As String
    Public Property GRADE() As String
        Get
            Return _GRADE
        End Get
        Set(ByVal value As String)
            _GRADE = value
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


Public Class KometProduct
    Public Property color() As String
        Get
            Return m_color
        End Get
        Set
            m_color = Value
        End Set
    End Property
    Private m_color As String
    Public Property variety() As String
        Get
            Return m_variety
        End Get
        Set
            m_variety = Value
        End Set
    End Property
    Private m_variety As String
    Public Property grade() As String
        Get
            Return m_grade
        End Get
        Set
            m_grade = Value
        End Set
    End Property
    Private m_grade As String
    Public Property description() As String
        Get
            Return m_description
        End Get
        Set
            m_description = Value
        End Set
    End Property
    Private m_description As String
    Public Property active() As Integer
        Get
            Return m_active
        End Get
        Set
            m_active = Value
        End Set
    End Property
    Private m_active As Integer
    Public Property id() As Integer
        Get
            Return m_id
        End Get
        Set
            m_id = Value
        End Set
    End Property
    Private m_id As Integer
    Public Property divisionId() As Integer
        Get
            Return m_divisionId
        End Get
        Set
            m_divisionId = Value
        End Set
    End Property
    Private m_divisionId As Integer
    Public Property category() As String
        Get
            Return m_category
        End Get
        Set
            m_category = Value
        End Set
    End Property
    Private m_category As String
    Public Property legacyCode() As String
        Get
            Return m_legacyCode
        End Get
        Set
            m_legacyCode = Value
        End Set
    End Property
    Private m_legacyCode As String
    Public Property divisionDescription() As String
        Get
            Return m_divisionDescription
        End Get
        Set
            m_divisionDescription = Value
        End Set
    End Property
    Private m_divisionDescription As String
    Public Property tags() As String
        Get
            Return m_tags
        End Get
        Set
            m_tags = Value
        End Set
    End Property
    Private m_tags As String
End Class

Public Class RootObject
    Public Property message() As String
        Get
            Return m_message
        End Get
        Set
            m_message = Value
        End Set
    End Property
    Private m_message As String
    Public Property status() As Integer
        Get
            Return m_status
        End Get
        Set
            m_status = Value
        End Set
    End Property
    Private m_status As Integer
    Public Property products() As List(Of KometProduct)
        Get
            Return m_products
        End Get
        Set
            m_products = Value
        End Set
    End Property
    Private m_products As List(Of KometProduct)
End Class
