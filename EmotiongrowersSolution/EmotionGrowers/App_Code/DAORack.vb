Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports System.IO
Imports System.Xml
Imports System.Reflection

Namespace DAO
    Public Class Rack

        Public Shared Function GetRackDetails(ByVal whereClause As String, ByVal sortExp As String, ByVal startRowIndex As Integer,
                                                     ByVal numberOfRows As Integer) As List(Of BO.Rack)
            Try
                Dim uList As New List(Of BO.Rack)
                Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
                Using Con As New SqlConnection(ConStr)
                    Con.Open()
                    Dim Qry As String = ""

                    Qry = String.Format("SELECT * FROM (SELECT RCK.*, INV.LOT,INV.NAME as 'InvProductName', SUBSTRING(RCK.BARCODE, 1, 3) as 'FARMCODE',SUBSTRING(RCK.BARCODE,4,5) as 'BOXNUM',INVG.DATA1,INVG.DATA2,INVG.DATA3,INVG.DATA4,INVG.DATA5,INVG.DATA6 " +
                                                                  "FROM F_RACKS RCK  LEFT JOIN INVEN INV ON SUBSTRING(RCK.BARCODE,1,8)=" +
                                                                  "LEFT(INV.FARM  +REPLICATE(' ',1),3)+RIGHT(REPLICATE('0',5)+RTRIM(LTRIM(" +
                                                                  "STR(INV.BOXNUM,5,0))),5) LEFT JOIN INVGRID INVG ON " +
                                                                  "INVG.[KEY]= SUBSTRING(RCK.BARCODE, 1, 3)+ RIGHT(Cast(INV.LOT as varchar(50)),5)  + INV.FLOWER AND STR(INV.BOXNUM,5,0) =STR(INVG.BOXNUM,5,0))  AS A " + IIf(whereClause.Trim = "", "", " where " + whereClause) + " order by {0}", sortExp)


                    Using Cmd As New SqlCommand(Qry, Con)
                        Cmd.CommandType = CommandType.Text
                        Dim da As New SqlDataAdapter(Cmd)
                        Dim ds As New DataTable
                        Dim INCcolumn As New DataColumn()
                        INCcolumn.DataType = System.Type.[GetType]("System.Int32")
                        INCcolumn.ColumnName = "RECNO"
                        INCcolumn.AutoIncrement = True
                        INCcolumn.AutoIncrementSeed = 1
                        INCcolumn.AutoIncrementStep = 1
                        ds.Columns.Add(INCcolumn)
                        da.Fill(ds)
                        Dim TotalCount As Integer = ds.Rows.Count
                        Dim PagedDataSet As DataTable = Nothing

                        If TotalCount <> 0 Then
                            If numberOfRows <> 0 Then
                                If (TotalCount <> startRowIndex) Then
                                    PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " And RECNO <= " + (startRowIndex + numberOfRows).ToString() + "").CopyToDataTable()
                                Else
                                    PagedDataSet = ds.Select("RECNO >= " + startRowIndex.ToString() + " And RECNO <= " + startRowIndex.ToString() + "").CopyToDataTable()
                                End If
                            Else
                                PagedDataSet = ds
                            End If
                            For Each row In PagedDataSet.Rows
                                Dim u As New BO.Rack
                                u.ARBOXNO = If(row("ARBOXNO") Is DBNull.Value, "", row("ARBOXNO"))
                                u.BarCode = If(row("BarCode") Is DBNull.Value, "", row("BarCode"))
                                u.BOXSIZE = If(row("BOXSIZE") Is DBNull.Value, "", row("BOXSIZE"))
                                u.Carrier = If(row("Carrier") Is DBNull.Value, "", row("Carrier"))
                                u.CONSIGNEE = If(row("CONSIGNEE") Is DBNull.Value, "", row("CONSIGNEE"))
                                u.CUSTPO = If(row("CUSTPO") Is DBNull.Value, "", row("CUSTPO"))
                                u.Farm = If(row("FARMCODE") Is DBNull.Value, "", row("FARMCODE"))
                                u.BoxNum = If(row("BOXNUM") Is DBNull.Value, "", row("BOXNUM"))
                                u.Gun = row("Gun")
                                u.HEIGHT = If(row("HEIGHT") Is DBNull.Value, "", row("HEIGHT"))
                                u.ID = If(row("ID") Is DBNull.Value, "", row("ID"))
                                u.Invoice = If(row("Invoice") Is DBNull.Value, "", row("Invoice"))
                                u.LENGHT = If(row("LENGHT") Is DBNull.Value, "", row("LENGHT"))
                                u.Lot = IIf(row("Lot") Is DBNull.Value, 0, row("Lot"))
                                u.OldRack = If(row("OldRack") Is DBNull.Value, "", row("OldRack"))
                                u.Order2Rec = If(row("Order2Rec") Is DBNull.Value, 0, row("Order2Rec"))
                                u.PRODUCT = If(row("PRODUCT") Is DBNull.Value, "", row("PRODUCT"))
                                u.Rack = If(row("Rack") Is DBNull.Value, "", row("Rack"))
                                u.WIDTH = If(row("WIDTH") Is DBNull.Value, "", row("WIDTH"))
                                u.AddUser = If(row("AddUser") Is DBNull.Value, "", row("AddUser"))
                                u.AddDate = row("AddDate")
                                u.AddTime = If(row("AddTime") Is DBNull.Value, "", row("AddTime"))
                                u.AddApp = If(row("AddApp") Is DBNull.Value, "", row("AddApp"))
                                Dim Comments As String = Trim(Convert.ToString(row("DATA1")) + Trim(Convert.ToString(row("DATA2"))) + Trim(Convert.ToString(row("DATA3"))) + Trim(Convert.ToString(row("DATA4"))) + Trim(Convert.ToString(row("DATA5"))) + Trim(Convert.ToString(row("DATA6"))))
                                u.Comments = Comments
                                u.InvProductName = If(Convert.ToString(row("InvProductName")) Is DBNull.Value, "", Convert.ToString(row("InvProductName")))
                                u.TotalRows = TotalCount
                                uList.Add(u)
                            Next
                        End If
                        Return uList
                    End Using
                End Using
            Catch ex As Exception
                ErrorLogs.LogException(ex, "Error in GetRackDetails")
                Dim uList As New List(Of BO.Rack)
                Dim u As New BO.Rack
                u.ErrorMessage = "Error in GetRackDetails::" + ex.Message
                uList.Add(u)
                Return uList
            End Try
        End Function
    End Class


End Namespace


Namespace BO
    Public Class Rack
        Private _RowNo As Integer
        Public Property RowNo() As Integer
            Get
                Return _RowNo
            End Get
            Set(ByVal value As Integer)
                _RowNo = value
            End Set
        End Property

        Private _TotalRows As Integer
        Public Property TotalRows() As Integer
            Get
                Return _TotalRows
            End Get
            Set(ByVal value As Integer)
                _TotalRows = value
            End Set
        End Property

        Private _Rack As String
        Public Property Rack() As String
            Get
                Return _Rack
            End Get
            Set(value As String)
                _Rack = value
            End Set
        End Property

        Private _Barcode As String
        Public Property BarCode() As String
            Get
                Return _Barcode
            End Get
            Set(value As String)
                _Barcode = value
            End Set
        End Property

        Private _Invoice As String
        Public Property Invoice() As String
            Get
                Return _Invoice
            End Get
            Set(value As String)
                _Invoice = value
            End Set
        End Property

        Private _Order2Rec As Integer
        Public Property Order2Rec() As Integer
            Get
                Return _Order2Rec
            End Get
            Set(value As Integer)
                _Order2Rec = value
            End Set
        End Property

        Private _ID As String
        Public Property ID() As String
            Get
                Return _ID
            End Get
            Set(value As String)
                _ID = value
            End Set
        End Property

        Private _Gun As String
        Public Property Gun() As String
            Get
                Return _Gun
            End Get
            Set(value As String)
                _Gun = value
            End Set
        End Property

        Private _OldRack As String
        Public Property OldRack() As String
            Get
                Return _OldRack
            End Get
            Set(value As String)
                _OldRack = value
            End Set
        End Property

        Private _Carrier As String
        Public Property Carrier() As String
            Get
                Return _Carrier
            End Get
            Set(value As String)
                _Carrier = value
            End Set
        End Property

        Private _Farm As String
        Public Property Farm() As String
            Get
                Return _Farm
            End Get
            Set(value As String)
                _Farm = value
            End Set
        End Property

        Private _ARBOXNO As String
        Public Property ARBOXNO() As String
            Get
                Return _ARBOXNO
            End Get
            Set(value As String)
                _ARBOXNO = value
            End Set
        End Property

        Private _CONSIGNEE As String
        Public Property CONSIGNEE() As String
            Get
                Return _CONSIGNEE
            End Get
            Set(value As String)
                _CONSIGNEE = value
            End Set
        End Property

        Private _BOXSIZE As String
        Public Property BOXSIZE() As String
            Get
                Return _BOXSIZE
            End Get
            Set(value As String)
                _BOXSIZE = value
            End Set
        End Property

        Private _LENGHT As String
        Public Property LENGHT() As String
            Get
                Return _LENGHT
            End Get
            Set(value As String)
                _LENGHT = value
            End Set
        End Property

        Private _WIDTH As String
        Public Property WIDTH() As String
            Get
                Return _WIDTH
            End Get
            Set(value As String)
                _WIDTH = value
            End Set
        End Property

        Private _HEIGHT As String
        Public Property HEIGHT() As String
            Get
                Return _HEIGHT
            End Get
            Set(value As String)
                _HEIGHT = value
            End Set
        End Property

        Private _PRODUCT As String
        Public Property PRODUCT() As String
            Get
                Return _PRODUCT
            End Get
            Set(value As String)
                _PRODUCT = value
            End Set
        End Property


        Private _InvProductName As String
        Public Property InvProductName() As String
            Get
                Return _InvProductName
            End Get
            Set(value As String)
                _InvProductName = value
            End Set
        End Property

        Private _CUSTPO As String
        Public Property CUSTPO() As String
            Get
                Return _CUSTPO
            End Get
            Set(value As String)
                _CUSTPO = value
            End Set
        End Property

        Private _Lot As Int64
        Public Property Lot As Int64
            Get
                Return _Lot
            End Get
            Set(value As Int64)
                _Lot = value
            End Set
        End Property

        Private _AddUser As String
        Public Property AddUser As String
            Get
                Return _AddUser
            End Get
            Set(value As String)
                _AddUser = value
            End Set
        End Property

        Private _AddDate As DateTime
        Public Property AddDate As DateTime
            Get
                Return _AddDate
            End Get
            Set(value As DateTime)
                _AddDate = value
            End Set
        End Property

        Private _AddTime As String
        Public Property AddTime As String
            Get
                Return _AddTime
            End Get
            Set(value As String)
                _AddTime = value
            End Set
        End Property

        Private _AddApp As String
        Public Property AddApp As String
            Get
                Return _AddApp
            End Get
            Set(value As String)
                _AddApp = value
            End Set
        End Property

        Private _DELUSER As String
        Public Property DELUSER As String
            Get
                Return _DELUSER
            End Get
            Set(value As String)
                _DELUSER = value
            End Set
        End Property

        Private _DELDATE As DateTime
        Public Property DELDATE As DateTime
            Get
                Return _DELDATE
            End Get
            Set(value As DateTime)
                _DELDATE = value
            End Set
        End Property

        Private _DELTIME As String
        Public Property DELTIME As String
            Get
                Return _DELTIME
            End Get
            Set(value As String)
                _DELTIME = value
            End Set
        End Property

        Private _DELAPP As String
        Public Property DELAPP As String
            Get
                Return _DELAPP
            End Get
            Set(value As String)
                _DELAPP = value
            End Set
        End Property

        Private _BoxNum As String
        Public Property BoxNum As String
            Get
                Return _BoxNum
            End Get
            Set(value As String)
                _BoxNum = value
            End Set
        End Property

        Private _Comments As String
        Public Property Comments() As String
            Get
                Return _Comments
            End Get
            Set(ByVal value As String)
                _Comments = value
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
    End Class
End Namespace
