Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class PostReturnsByCustomer

    Public Shared Function GetInvoiceNumber() As String
        Try
            Dim ConString As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using con As New SqlConnection(ConString)
                con.Open()
                Using cmd As New SqlCommand("spGetInvoiceNumberFromConstant", con)
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        Return dt.Rows(0)(0).ToString()
                    Else
                        Return "0"
                    End If
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetInvoiceNumber")
            Return Nothing
        End Try
    End Function

    Public Shared Function GetUOMFromPrices(ByVal Customer As String) As List(Of BOProd)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulist As New List(Of BOProd)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("select distinct UOM  from f_prices where Customer='" + Customer + "'  order by UOM", Con)
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

    Public Shared Function GetFlowerAutoCompletePrices(ByVal searchtext As String) As List(Of Flower)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim FList As New List(Of Flower)
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("SELECT top 20 Flower,Name FROM F_Flower where (NAME <> '' or NAME is not null) and Name LIKE  '" + searchtext + "%'  order by Flower", Con)
                    Cmd.CommandType = CommandType.Text
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataSet
                    da.Fill(ds)
                    For Each row In ds.Tables(0).Rows
                        Dim u As New Flower
                        u.Flower = row("Flower")
                        u.Name = row("Name")
                        FList.Add(u)
                    Next
                    Return FList
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetFlowerAutoCompletePrices")
            Throw ex
        End Try
    End Function

    Public Shared Function TempCreditDetailsAddUpdDel(ByVal postReturnCustModel As PostReturnsByCustomerModel, ByVal UserName As String) As PostReturnsByCustomerModel
        Dim returnCustModel As New PostReturnsByCustomerModel
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString

            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spTempCreditDetails", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@ID", postReturnCustModel.ID)
                    Cmd.Parameters.AddWithValue("@CUSTOMER", postReturnCustModel.Customer)
                    Cmd.Parameters.AddWithValue("@FLOWER", postReturnCustModel.FlowerDetails.Flower)
                    Cmd.Parameters.AddWithValue("@BOXES", postReturnCustModel.Boxes)
                    Cmd.Parameters.AddWithValue("@L", postReturnCustModel.L)
                    Cmd.Parameters.AddWithValue("@W", postReturnCustModel.W)
                    Cmd.Parameters.AddWithValue("@H", postReturnCustModel.H)
                    Cmd.Parameters.AddWithValue("@DESCRIPTION", postReturnCustModel.FlowerDetails.Name)
                    Cmd.Parameters.AddWithValue("@PRICE", postReturnCustModel.Price)
                    Cmd.Parameters.AddWithValue("@UOM", postReturnCustModel.Uom)
                    Cmd.Parameters.AddWithValue("@REASONCODE", IIf(String.IsNullOrWhiteSpace(postReturnCustModel.ReasonCode), DBNull.Value, postReturnCustModel.ReasonCode))
                    Cmd.Parameters.AddWithValue("@REASON", IIf(String.IsNullOrWhiteSpace(postReturnCustModel.Reason), DBNull.Value, postReturnCustModel.Reason))
                    Cmd.Parameters.AddWithValue("@CREDITDATE", IIf(String.IsNullOrWhiteSpace(postReturnCustModel.CreditDate), DBNull.Value, postReturnCustModel.CreditDate))
                    Cmd.Parameters.AddWithValue("@NOTES", IIf(String.IsNullOrWhiteSpace(postReturnCustModel.Notes), DBNull.Value, postReturnCustModel.Notes))
                    Cmd.Parameters.AddWithValue("@FLAG", postReturnCustModel.FLAG)
                    Cmd.Parameters.AddWithValue("@Unit", postReturnCustModel.Unit)
                    Cmd.Parameters.AddWithValue("@User", UserName)
                    Cmd.Parameters.AddWithValue("@Invoice", postReturnCustModel.Invoice)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        returnCustModel.ID = Convert.ToString(dt(0)(0))
                        returnCustModel.FLAG = postReturnCustModel.FLAG
                    End If
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In TempCreditDetailsAddUpdDel")
            returnCustModel.ErrorMessage = ex.Message.ToString()
            Throw ex
        End Try
        Return returnCustModel
    End Function

    Public Shared Function GetTempCreditDetailsList(ByVal Customer As String) As List(Of PostReturnsByCustomerModel)

        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim dtData As New DataTable
            Dim uReturnCustModelList As New List(Of PostReturnsByCustomerModel)
            Using con As New SqlConnection(ConStr)
                con.Open()
                Using cmd1 As New SqlCommand("select trns.ID, trns.customer,trns.flower,trns.boxes,trns.UNITS,trns.DESCRIPTION,trns.PRICE,trns.UOM,trns.REASON,trns.REASONCODE,trns.NOTES,CONVERT(varchar,CREDITDATE,101)CREDITDATE ,cc.Bgcolor, cc.color as Fontcolor from TEMPCREDITRETURNS as trns LEFT JOIN F_FLOWER AS FLOWER ON FLOWER.flower=trns.flower LEFT JOIN dbo.tblColorcode cc ON FLOWER.Colorcode=cc.code WHERE CUSTOMER='" + Customer + "' ", con)
                    cmd1.CommandType = CommandType.Text
                    Dim adp As New SqlDataAdapter(cmd1)
                    adp.Fill(dtData)
                    Dim TotalUnits As Integer = 0
                    Dim TotalBoxes As Integer = 0
                    Dim TotalPrice As Decimal = 0
                    Dim TotalPriceDollor As Decimal = 0
                    If (dtData.Rows.Count > 0) Then
                        If Not dtData.Compute("Sum(Boxes)", "boxes is not null") Is DBNull.Value Then
                            TotalBoxes = dtData.Compute("Sum(Boxes)", "boxes is not null")
                        End If
                        If Not dtData.Compute("Sum(price)", "price is not null") Is DBNull.Value Then
                            TotalPrice = dtData.Compute("Sum(price)", "price is not null")
                        End If
                        If Not dtData.Compute("Sum(units)", "units is not null") Is DBNull.Value Then
                            TotalUnits = dtData.Compute("Sum(units)", "units is not null")
                        End If

                        For Each row In dtData.Rows
                            Dim objReturnsByCustomerModel As New PostReturnsByCustomerModel
                            objReturnsByCustomerModel.ID = Convert.ToInt32(row("ID"))
                            objReturnsByCustomerModel.Customer = Convert.ToString(row("customer"))
                            objReturnsByCustomerModel.FlowerDetails.Flower = Convert.ToString(row("flower"))
                            objReturnsByCustomerModel.FlowerDetails.Name = Convert.ToString(row("DESCRIPTION"))
                            objReturnsByCustomerModel.Price = Convert.ToDecimal(row("price"))
                            objReturnsByCustomerModel.Unit = Convert.ToInt32(IIf(row("UNITS") Is DBNull.Value, 0, row("UNITS")))
                            objReturnsByCustomerModel.Uom = Convert.ToString(row("uom"))
                            objReturnsByCustomerModel.Boxes = Convert.ToInt32(IIf(row("boxes") Is DBNull.Value, 0, row("boxes")))
                            objReturnsByCustomerModel.Reason = Convert.ToString(row("Reason"))
                            objReturnsByCustomerModel.ReasonCode = Convert.ToString(row("ReasonCode"))
                            objReturnsByCustomerModel.CreditDate = Convert.ToString(row("CREDITDATE"))
                            objReturnsByCustomerModel.Notes = Convert.ToString(row("notes"))
                            objReturnsByCustomerModel.FlowerDetails.BGColor = Convert.ToString(row("Bgcolor"))
                            objReturnsByCustomerModel.FlowerDetails.FontColor = Convert.ToString(row("Fontcolor"))
                            objReturnsByCustomerModel.Total = String.Format("{0:0.00}", objReturnsByCustomerModel.Price * objReturnsByCustomerModel.Unit * objReturnsByCustomerModel.Boxes)
                            TotalPriceDollor = TotalPriceDollor + objReturnsByCustomerModel.Total
                            uReturnCustModelList.Add(objReturnsByCustomerModel)
                        Next
                        Dim uTotal As New PostReturnsByCustomerModel()
                        uTotal.ID = 0
                        uTotal.Customer = 0
                        uTotal.FlowerDetails.Flower = ""
                        uTotal.FlowerDetails.Name = "Total"
                        uTotal.Price = 0
                        uTotal.Unit = TotalUnits
                        uTotal.Uom = ""
                        uTotal.Boxes = TotalBoxes
                        uTotal.Reason = ""
                        uTotal.ReasonCode = ""
                        uTotal.CreditDate = ""
                        uTotal.Total = String.Format("{0:0.00}", TotalPriceDollor)
                        uTotal.Notes = ""
                        uTotal.FlowerDetails.BGColor = ""
                        uTotal.FlowerDetails.FontColor = ""
                        uReturnCustModelList.Add(uTotal)
                    End If
                End Using
            End Using
            Return uReturnCustModelList
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In GetTempCreditDetailsList")
            Throw ex
        End Try
    End Function


    Public Shared Function ApplyCreditReturns(ByVal Invoice As Integer, ByVal Customer As Integer, ByVal UserName As String, ByVal TotalAmount As Decimal) As String
        Dim ReturnInvoice As String = ""
        Try
            If (UserName.Length < 20) Then
                UserName = UserName
            Else
                UserName = UserName.Substring(0, 20)
            End If

            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spPostReturns", Con)
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.Parameters.AddWithValue("@INVOICE", Invoice)
                    Cmd.Parameters.AddWithValue("@CUSTOMER", Customer)
                    Cmd.Parameters.AddWithValue("@TOTALAMOUNT", TotalAmount)
                    Cmd.Parameters.AddWithValue("@User", UserName)
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim dt As New DataTable
                    da.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        ReturnInvoice = Convert.ToString(dt.Rows(0)("Invoice"))
                    End If
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error In TempCreditDetailsAddUpdDel")
            Throw ex
        End Try
        Return ReturnInvoice
    End Function

End Class
Public Class PostReturnsByCustomerModel
    Private _ID As Integer
    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Private _Invoice As Integer
    Public Property Invoice() As Integer
        Get
            Return _Invoice
        End Get
        Set(ByVal value As Integer)
            _Invoice = value
        End Set
    End Property


    Private _CUSTOMER As Integer
    Public Property Customer() As Integer
        Get
            Return _CUSTOMER
        End Get
        Set(ByVal value As Integer)
            _CUSTOMER = value
        End Set
    End Property

    Private _Uom As String
    Public Property Uom() As String
        Get
            Return _Uom
        End Get
        Set(ByVal value As String)
            _Uom = value
        End Set
    End Property

    Private _L As Integer
    Public Property L() As Integer
        Get
            Return _L
        End Get
        Set(ByVal value As Integer)
            _L = value
        End Set
    End Property

    Private _H As Integer
    Public Property H() As Integer
        Get
            Return _H
        End Get
        Set(ByVal value As Integer)
            _H = value
        End Set
    End Property

    Private _W As Integer
    Public Property W() As Integer
        Get
            Return _W
        End Get
        Set(ByVal value As Integer)
            _W = value
        End Set
    End Property


    Private _Unit As Integer
    Public Property Unit() As Integer
        Get
            Return _Unit
        End Get
        Set(ByVal value As Integer)
            _Unit = value
        End Set
    End Property

    Private _Price As Decimal
    Public Property Price() As Decimal
        Get
            Return _Price
        End Get
        Set(ByVal value As Decimal)
            _Price = value
        End Set
    End Property

    Private _Boxes As String
    Public Property Boxes() As String
        Get
            Return _Boxes
        End Get
        Set(ByVal value As String)
            _Boxes = value
        End Set
    End Property

    Private _ReasonCode As String
    Public Property ReasonCode() As String
        Get
            Return _ReasonCode
        End Get
        Set(ByVal value As String)
            _ReasonCode = value
        End Set
    End Property

    Private _Reason As String
    Public Property Reason() As String
        Get
            Return _Reason
        End Get
        Set(ByVal value As String)
            _Reason = value
        End Set
    End Property

    Private _CreditDate As String
    Public Property CreditDate() As String
        Get
            Return _CreditDate
        End Get
        Set(ByVal value As String)
            _CreditDate = value
        End Set
    End Property

    Private _FlowerDetails As New BO.Flowers
    Public Property FlowerDetails() As BO.Flowers
        Get
            Return _FlowerDetails
        End Get
        Set(value As BO.Flowers)
            _FlowerDetails = value
        End Set
    End Property


    Private _Notes As String
    Public Property Notes() As String
        Get
            Return _Notes
        End Get
        Set(ByVal value As String)
            _Notes = value
        End Set
    End Property

    Private _ErrorMessage As String
    Public Property ErrorMessage() As String
        Get
            Return _ErrorMessage
        End Get
        Set(ByVal value As String)
            _ErrorMessage = value
        End Set
    End Property

    Private _FLAG As String
    Public Property FLAG() As String
        Get
            Return _FLAG
        End Get
        Set(ByVal value As String)
            _FLAG = value
        End Set
    End Property

    Private _Total As Decimal
    Public Property Total() As Decimal
        Get
            Return _Total
        End Get
        Set(ByVal value As Decimal)
            _Total = value
        End Set
    End Property

End Class
