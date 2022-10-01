Namespace BO
    Public Class Inventory

        Private _ID As String
        Public Property ID() As String
            Get
                Return _ID
            End Get
            Set(ByVal value As String)
                _ID = value
            End Set
        End Property

        Private _IDs As String
        Public Property IDs() As String
            Get
                Return _IDs
            End Get
            Set(ByVal value As String)
                _IDs = value
            End Set
        End Property


        Private _Farm As String
        Public Property Farm() As String
            Get
                Return _Farm
            End Get
            Set(ByVal value As String)
                _Farm = value
            End Set
        End Property

        Private _ProductCode As String
        Public Property ProductCode() As String
            Get
                Return _ProductCode
            End Get
            Set(ByVal value As String)
                _ProductCode = value
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


        Private _Flower As String
        Public Property Flower() As String
            Get
                Return _Flower
            End Get
            Set(ByVal value As String)
                _Flower = value
            End Set
        End Property


        Private _Country As String
        Public Property Country() As String
            Get
                Return _Country
            End Get
            Set(ByVal value As String)
                _Country = value
            End Set
        End Property

        Private _ForeColor As String
        Public Property ForeColor() As String
            Get
                Return _ForeColor
            End Get
            Set(ByVal value As String)
                _ForeColor = value
            End Set
        End Property

        Private _BGColor As String
        Public Property BGColor() As String
            Get
                Return _BGColor
            End Get
            Set(ByVal value As String)
                _BGColor = value
            End Set
        End Property

        Private _ProductName As String
        Public Property ProductName() As String
            Get
                Return _ProductName
            End Get
            Set(ByVal value As String)
                _ProductName = value
            End Set
        End Property

        Private _ProductCategory As String
        Public Property ProductCategory() As String
            Get
                Return _ProductCategory
            End Get
            Set(ByVal value As String)
                _ProductCategory = value
            End Set
        End Property

        Private _ProductCategoryName As String
        Public Property ProductCategoryName() As String
            Get
                Return _ProductCategoryName
            End Get
            Set(ByVal value As String)
                _ProductCategoryName = value
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

        Private _FBE As Decimal
        Public Property FBE() As Decimal
            Get
                Return _FBE
            End Get
            Set(value As Decimal)
                _FBE = value
            End Set
        End Property

        Private _FEE As Decimal
        Public Property FEE() As Decimal
            Get
                Return _FEE
            End Get
            Set(value As Decimal)
                _FEE = value
            End Set
        End Property

        Private _CustNum As Integer
        Public Property CustNum() As Integer
            Get
                Return _CustNum
            End Get
            Set(ByVal value As Integer)
                _CustNum = value
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


        Private _OrderNumber As Integer
        Public Property OrderNumber() As Integer
            Get
                Return _OrderNumber
            End Get
            Set(ByVal value As Integer)
                _OrderNumber = value
            End Set
        End Property

        Private _AWB As String
        Public Property AWB() As String
            Get
                Return _AWB
            End Get
            Set(ByVal value As String)
                _AWB = value
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

        Private _ManufacID As String
        Public Property ManufacID() As String
            Get
                Return _ManufacID
            End Get
            Set(ByVal value As String)
                _ManufacID = value
            End Set
        End Property

        Private _BoxNumber As Integer
        Public Property BoxNumber() As Integer
            Get
                Return _BoxNumber
            End Get
            Set(ByVal value As Integer)
                _BoxNumber = value
            End Set
        End Property


        'VEN::07-10-2015::For PageInventory
        Private _DateRec As DateTime
        Public Property DateRec As DateTime
            Get
                Return _DateRec
            End Get
            Set(value As DateTime)
                _DateRec = value
            End Set
        End Property

        Private _CSREC As Integer
        Public Property CSREC() As Integer
            Get
                Return _CSREC
            End Get
            Set(ByVal value As Integer)
                _CSREC = value
            End Set
        End Property

        Private _RecQty As Integer
        Public Property RecQty() As Integer
            Get
                Return _RecQty
            End Get
            Set(ByVal value As Integer)
                _RecQty = value
            End Set
        End Property

        Private _CSSOLD As Integer
        Public Property CSSOLD() As Integer
            Get
                Return _CSSOLD
            End Get
            Set(ByVal value As Integer)
                _CSSOLD = value
            End Set
        End Property

        Private _CSHOLD As Integer
        Public Property CSHOLD() As Integer
            Get
                Return _CSHOLD
            End Get
            Set(ByVal value As Integer)
                _CSHOLD = value
            End Set
        End Property

        Private _linefuel As String
        Public Property linefuel() As String
            Get
                Return _linefuel
            End Get
            Set(ByVal value As String)
                _linefuel = value
            End Set
        End Property

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

        Private _PO As String
        Public Property PO() As String
            Get
                Return _PO
            End Get
            Set(ByVal value As String)
                _PO = value
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

        Private _FlowerDetails As New BO.Flowers
        Public Property FlowerDetails() As BO.Flowers
            Get
                Return _FlowerDetails
            End Get
            Set(value As BO.Flowers)
                _FlowerDetails = value
            End Set
        End Property

        ''STA::14-OCT-2015
        Private _AddUser As String
        Public Property AddUser() As String
            Get
                Return _AddUser
            End Get
            Set(ByVal value As String)
                _AddUser = value
            End Set
        End Property

        Private _AddDate As String
        Public Property AddDate() As String
            Get
                Return _AddDate
            End Get
            Set(ByVal value As String)
                _AddDate = value
            End Set
        End Property

        Private _AddTime As String
        Public Property AddTime() As String
            Get
                Return _AddTime
            End Get
            Set(ByVal value As String)
                _AddTime = value
            End Set
        End Property

        Private _UpdateUser As String
        Public Property UpdateUser() As String
            Get
                Return _UpdateUser
            End Get
            Set(ByVal value As String)
                _UpdateUser = value
            End Set
        End Property

        Private _UpdateDate As String
        Public Property UpdateDate() As String
            Get
                Return _UpdateDate
            End Get
            Set(ByVal value As String)
                _UpdateDate = value
            End Set
        End Property

        Private _UpdateTime As String
        Public Property UpdateTime() As String
            Get
                Return _UpdateTime
            End Get
            Set(ByVal value As String)
                _UpdateTime = value
            End Set
        End Property

        Private _DeleteUser As String
        Public Property DeleteUser() As String
            Get
                Return _DeleteUser
            End Get
            Set(ByVal value As String)
                _DeleteUser = value
            End Set
        End Property

        Private _DeleteDate As String
        Public Property DeleteDate() As String
            Get
                Return _DeleteDate
            End Get
            Set(ByVal value As String)
                _DeleteDate = value
            End Set
        End Property

        Private _DeleteTime As String
        Public Property DeleteTime() As String
            Get
                Return _DeleteTime
            End Get
            Set(ByVal value As String)
                _DeleteTime = value
            End Set
        End Property

        Private _CreReqID As Integer
        Public Property CreReqID() As Integer
            Get
                Return _CreReqID
            End Get
            Set(ByVal value As Integer)
                _CreReqID = value
            End Set
        End Property

        Private _LockUser As String
        Public Property LockUser() As String
            Get
                Return _LockUser
            End Get
            Set(ByVal value As String)
                _LockUser = value
            End Set
        End Property

        Private _LockDate As String
        Public Property LockDate() As String
            Get
                Return _LockDate
            End Get
            Set(ByVal value As String)
                _LockDate = value
            End Set
        End Property

        Private _LockTime As String
        Public Property LockTime() As String
            Get
                Return _LockTime
            End Get
            Set(ByVal value As String)
                _LockTime = value
            End Set
        End Property

        Private _UnitesBunch As String
        Public Property UnitesBunch() As String
            Get
                Return _UnitesBunch
            End Get
            Set(ByVal value As String)
                _UnitesBunch = value
            End Set
        End Property

        Private _Cost As Decimal
        Public Property Cost() As Decimal
            Get
                Return _Cost
            End Get
            Set(ByVal value As Decimal)
                _Cost = value
            End Set
        End Property

        Private _UnitsBunch As String
        Public Property UnitsBunch() As String
            Get
                Return _UnitsBunch
            End Get
            Set(ByVal value As String)
                _UnitsBunch = value
            End Set
        End Property

        Private _OtherCost As Decimal
        Public Property OtherCost() As Decimal
            Get
                Return _OtherCost
            End Get
            Set(ByVal value As Decimal)
                _OtherCost = value
            End Set
        End Property

        Private _Type As String
        Public Property Type() As String
            Get
                Return _Type
            End Get
            Set(ByVal value As String)
                _Type = value
            End Set
        End Property

        Private _InvenType As String
        Public Property InvenType() As String
            Get
                Return _InvenType
            End Get
            Set(ByVal value As String)
                _InvenType = value
            End Set
        End Property

        Private _Units As Integer
        Public Property Units() As Integer
            Get
                Return _Units
            End Get
            Set(ByVal value As Integer)
                _Units = value
            End Set
        End Property

        Private _TotalUnits As Integer
        Public Property TotalUnits() As Integer
            Get
                Return _TotalUnits
            End Get
            Set(value As Integer)
                _TotalUnits = value
            End Set
        End Property

        Private _TotalCost As Decimal
        Public Property TotalCost() As Decimal
            Get
                Return _TotalCost
            End Get
            Set(value As Decimal)
                _TotalCost = value
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

        'VEN::13-Jan-2016
        Private _UnitsPerBox As Integer
        Public Property UnitsPerBox() As Integer
            Get
                Return _UnitsPerBox
            End Get
            Set(value As Integer)
                _UnitsPerBox = value
            End Set
        End Property

        Private _Length As String
        Public Property Length() As String
            Get
                Return _Length
            End Get
            Set(ByVal value As String)
                _Length = value
            End Set
        End Property

        Private _Width As String
        Public Property Width() As String
            Get
                Return _Width
            End Get
            Set(ByVal value As String)
                _Width = value
            End Set
        End Property

        Private _Height As String
        Public Property Height() As String
            Get
                Return _Height
            End Get
            Set(ByVal value As String)
                _Height = value
            End Set
        End Property


        Private _Dt As DateTime

        Public Property Dt() As DateTime
            Get
                Return _Dt
            End Get
            Set(ByVal value As DateTime)
                _Dt = value
            End Set
        End Property
        Private _Sequence As String
        Public Property Sequence() As String
            Get
                Return _Sequence
            End Get
            Set(ByVal value As String)
                _Sequence = value
            End Set
        End Property
        Private _Application As String
        Public Property Application() As String
            Get
                Return _Application
            End Get
            Set(ByVal value As String)
                _Application = value
            End Set
        End Property
        Private _DeviceID As String
        Public Property DeviceID() As String
            Get
                Return _DeviceID
            End Get
            Set(ByVal value As String)
                _DeviceID = value
            End Set
        End Property
        Private _UserID As String
        Public Property UserID() As String
            Get
                Return _UserID
            End Get
            Set(ByVal value As String)
                _UserID = value
            End Set
        End Property
        Private _Flag As String
        Public Property Flag() As String
            Get
                Return _Flag
            End Get
            Set(ByVal value As String)
                _Flag = value
            End Set
        End Property

        Private _Color As String
        Public Property Color() As String
            Get
                Return _Color
            End Get
            Set(ByVal value As String)
                _Color = value
            End Set
        End Property

        Private _Variety As String
        Public Property Variety() As String
            Get
                Return _Variety
            End Get
            Set(ByVal value As String)
                _Variety = value
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


        Private _CARGODATE As DateTime
        Public Property CARGODATE As DateTime
            Get
                Return _CARGODATE
            End Get
            Set(value As DateTime)
                _CARGODATE = value
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

        Private _InvenPrice As Decimal
        Public Property InvenPrice() As Decimal
            Get
                Return _InvenPrice
            End Get
            Set(ByVal value As Decimal)
                _InvenPrice = value
            End Set
        End Property

        Private _PriceB As Decimal
        Public Property PriceB() As Decimal
            Get
                Return _PriceB
            End Get
            Set(ByVal value As Decimal)
                _PriceB = value
            End Set
        End Property

        Private _PriceC As Decimal
        Public Property PriceC() As Decimal
            Get
                Return _PriceC
            End Get
            Set(ByVal value As Decimal)
                _PriceC = value
            End Set
        End Property

        Private _Fuel As Decimal
        Public Property Fuel() As Decimal
            Get
                Return _Fuel
            End Get
            Set(ByVal value As Decimal)
                _Fuel = value
            End Set
        End Property

        Private _City As String
        Public Property City() As String
            Get
                Return _City
            End Get
            Set(ByVal value As String)
                _City = value
            End Set
        End Property
        Private _Soldas As String
        Public Property Soldas() As String
            Get
                Return _Soldas
            End Get
            Set(ByVal value As String)
                _Soldas = value
            End Set
        End Property

        Private _FtUnits As Integer
        Public Property FtUnits() As Integer
            Get
                Return _FtUnits
            End Get
            Set(ByVal value As Integer)
                _FtUnits = value
            End Set
        End Property

        Private _StemBunch As Integer
        Public Property StemBunch() As Integer
            Get
                Return _StemBunch
            End Get
            Set(ByVal value As Integer)
                _StemBunch = value
            End Set
        End Property

        Private _SqlQty As Integer
        Public Property SqlQty() As Integer
            Get
                Return _SqlQty
            End Get
            Set(ByVal value As Integer)
                _SqlQty = value
            End Set
        End Property

        Private _Qty As Integer
        Public Property Qty() As Integer
            Get
                Return _Qty
            End Get
            Set(ByVal value As Integer)
                _Qty = value
            End Set
        End Property

        Private _SqlID As Integer
        Public Property SqlID() As Integer
            Get
                Return _SqlID
            End Get
            Set(ByVal value As Integer)
                _SqlID = value
            End Set
        End Property


        Private _LandedCost As Decimal
        Public Property LandedCost() As Decimal
            Get
                Return _LandedCost
            End Get
            Set(ByVal value As Decimal)
                _LandedCost = value
            End Set
        End Property

        Private _GPM As String
        Public Property GPM() As String
            Get
                Return _GPM
            End Get
            Set(ByVal value As String)
                _GPM = value
            End Set
        End Property


        Private _Days As String
        Public Property Days() As String
            Get
                Return _Days
            End Get
            Set(ByVal value As String)
                _Days = value
            End Set
        End Property



        Private _Selected As Boolean
        Public Property Selected() As Boolean
            Get
                Return _Selected
            End Get
            Set(ByVal value As Boolean)
                _Selected = value
            End Set
        End Property

        Private _Bunches As Integer
        Public Property Bunches() As Integer
            Get
                Return _Bunches
            End Get
            Set(ByVal value As Integer)
                _Bunches = value
            End Set
        End Property

        Private _WH As String
        Public Property WH() As String
            Get
                Return _WH
            End Get
            Set(ByVal value As String)
                _WH = value
            End Set
        End Property

        Private _USERFileNo As String
        Public Property USERFileNo() As String
            Get
                Return _USERFileNo
            End Get
            Set(ByVal value As String)
                _USERFileNo = value
            End Set
        End Property

        Private _SPORDID As String
        Public Property SPORDID() As String
            Get
                Return _SPORDID
            End Get
            Set(ByVal value As String)
                _SPORDID = value
            End Set
        End Property


        Private _Message1 As String
        Public Property Message1() As String
            Get
                Return _Message1
            End Get
            Set(ByVal value As String)
                _Message1 = value
            End Set
        End Property

        Private _TableName As String
        Public Property TableName() As String
            Get
                Return _TableName
            End Get
            Set(ByVal value As String)
                _TableName = value
            End Set
        End Property

        Private _ReceivedPiecesOnly As Integer
        Public Property ReceivedPiecesOnly() As Integer
            Get
                Return _ReceivedPiecesOnly
            End Get
            Set(ByVal value As Integer)
                _ReceivedPiecesOnly = value
            End Set
        End Property

        Private _InvenTable As String
        Public Property InvenTbl() As String
            Get
                Return _InvenTable
            End Get
            Set(ByVal value As String)
                _InvenTable = value
            End Set
        End Property

        Private _FOB As Decimal
        Public Property FOB() As Decimal
            Get
                Return _FOB
            End Get
            Set(value As Decimal)
                _FOB = value
            End Set
        End Property

        Private _FOBBOX As Decimal
        Public Property FOBBOX() As Decimal
            Get
                Return _FOBBOX
            End Get
            Set(value As Decimal)
                _FOBBOX = value
            End Set
        End Property

        Private _DateRecEdit As String
        Public Property DateRecEdit As String
            Get
                Return _DateRecEdit
            End Get
            Set(value As String)
                _DateRecEdit = value
            End Set
        End Property

        Private _Handling As Decimal
        Public Property Handling As Decimal
            Get
                Return _Handling
            End Get
            Set(value As Decimal)
                _Handling = value
            End Set
        End Property
        Private _Andean As Decimal
        Public Property Andean As Decimal
            Get
                Return _Andean
            End Get
            Set(value As Decimal)
                _Andean = value
            End Set
        End Property
        Private _BRAND As String
        Public Property BRAND() As String
            Get
                Return _BRAND
            End Get
            Set(ByVal value As String)
                _BRAND = value
            End Set
        End Property
    End Class

    Public Class Type
        Private _ID As Integer
        Public Property ID() As Integer
            Get
                Return _ID
            End Get
            Set(ByVal value As Integer)
                _ID = value
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

        Private _Name As String
        Public Property Name() As String
            Get
                Return _Name
            End Get
            Set(ByVal value As String)
                _Name = value
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

    Public Class InvenType
        Private _ID As Integer
        Public Property ID() As Integer
            Get
                Return _ID
            End Get
            Set(ByVal value As Integer)
                _ID = value
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

        Private _Name As String
        Public Property Name() As String
            Get
                Return _Name
            End Get
            Set(ByVal value As String)
                _Name = value
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

    Public Class InventoryTrans

        Private _ID As String
        Public Property ID() As String
            Get
                Return _ID
            End Get
            Set(ByVal value As String)
                _ID = value
            End Set
        End Property

        Private _IDs As String
        Public Property IDs() As String
            Get
                Return _IDs
            End Get
            Set(ByVal value As String)
                _IDs = value
            End Set
        End Property

        Private _TransType As String
        Public Property TransType() As String
            Get
                Return _TransType
            End Get
            Set(ByVal value As String)
                _TransType = value
            End Set
        End Property

        Private _Farm As String
        Public Property Farm() As String
            Get
                Return _Farm
            End Get
            Set(ByVal value As String)
                _Farm = value
            End Set
        End Property

        Private _ProductCode As String
        Public Property ProductCode() As String
            Get
                Return _ProductCode
            End Get
            Set(ByVal value As String)
                _ProductCode = value
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


        Private _Flower As String
        Public Property Flower() As String
            Get
                Return _Flower
            End Get
            Set(ByVal value As String)
                _Flower = value
            End Set
        End Property


        Private _Country As String
        Public Property Country() As String
            Get
                Return _Country
            End Get
            Set(ByVal value As String)
                _Country = value
            End Set
        End Property

        Private _ForeColor As String
        Public Property ForeColor() As String
            Get
                Return _ForeColor
            End Get
            Set(ByVal value As String)
                _ForeColor = value
            End Set
        End Property

        Private _BGColor As String
        Public Property BGColor() As String
            Get
                Return _BGColor
            End Get
            Set(ByVal value As String)
                _BGColor = value
            End Set
        End Property

        Private _ProductName As String
        Public Property ProductName() As String
            Get
                Return _ProductName
            End Get
            Set(ByVal value As String)
                _ProductName = value
            End Set
        End Property

        Private _ProductCategory As String
        Public Property ProductCategory() As String
            Get
                Return _ProductCategory
            End Get
            Set(ByVal value As String)
                _ProductCategory = value
            End Set
        End Property

        Private _ProductCategoryName As String
        Public Property ProductCategoryName() As String
            Get
                Return _ProductCategoryName
            End Get
            Set(ByVal value As String)
                _ProductCategoryName = value
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

        Private _FBE As Decimal
        Public Property FBE() As Decimal
            Get
                Return _FBE
            End Get
            Set(value As Decimal)
                _FBE = value
            End Set
        End Property

        Private _FEE As Decimal
        Public Property FEE() As Decimal
            Get
                Return _FEE
            End Get
            Set(value As Decimal)
                _FEE = value
            End Set
        End Property

        Private _CustNum As Integer
        Public Property CustNum() As Integer
            Get
                Return _CustNum
            End Get
            Set(ByVal value As Integer)
                _CustNum = value
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


        Private _OrderNumber As Integer
        Public Property OrderNumber() As Integer
            Get
                Return _OrderNumber
            End Get
            Set(ByVal value As Integer)
                _OrderNumber = value
            End Set
        End Property

        Private _AWB As String
        Public Property AWB() As String
            Get
                Return _AWB
            End Get
            Set(ByVal value As String)
                _AWB = value
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

        Private _ManufacID As String
        Public Property ManufacID() As String
            Get
                Return _ManufacID
            End Get
            Set(ByVal value As String)
                _ManufacID = value
            End Set
        End Property

        Private _BoxNumber As Integer
        Public Property BoxNumber() As Integer
            Get
                Return _BoxNumber
            End Get
            Set(ByVal value As Integer)
                _BoxNumber = value
            End Set
        End Property


        'VEN::07-10-2015::For PageInventory
        Private _DateRec As DateTime
        Public Property DateRec As DateTime
            Get
                Return _DateRec
            End Get
            Set(value As DateTime)
                _DateRec = value
            End Set
        End Property

        Private _CSREC As Integer
        Public Property CSREC() As Integer
            Get
                Return _CSREC
            End Get
            Set(ByVal value As Integer)
                _CSREC = value
            End Set
        End Property

        Private _CSSOLD As Integer
        Public Property CSSOLD() As Integer
            Get
                Return _CSSOLD
            End Get
            Set(ByVal value As Integer)
                _CSSOLD = value
            End Set
        End Property

        Private _CSHOLD As Integer
        Public Property CSHOLD() As Integer
            Get
                Return _CSHOLD
            End Get
            Set(ByVal value As Integer)
                _CSHOLD = value
            End Set
        End Property

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

        Private _PO As String
        Public Property PO() As String
            Get
                Return _PO
            End Get
            Set(ByVal value As String)
                _PO = value
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

        Private _FlowerDetails As New BO.Flowers
        Public Property FlowerDetails() As BO.Flowers
            Get
                Return _FlowerDetails
            End Get
            Set(value As BO.Flowers)
                _FlowerDetails = value
            End Set
        End Property

        ''STA::14-OCT-2015
        Private _AddUser As String
        Public Property AddUser() As String
            Get
                Return _AddUser
            End Get
            Set(ByVal value As String)
                _AddUser = value
            End Set
        End Property

        Private _AddDate As String
        Public Property AddDate() As String
            Get
                Return _AddDate
            End Get
            Set(ByVal value As String)
                _AddDate = value
            End Set
        End Property

        Private _AddTime As String
        Public Property AddTime() As String
            Get
                Return _AddTime
            End Get
            Set(ByVal value As String)
                _AddTime = value
            End Set
        End Property

        Private _UpdateUser As String
        Public Property UpdateUser() As String
            Get
                Return _UpdateUser
            End Get
            Set(ByVal value As String)
                _UpdateUser = value
            End Set
        End Property

        Private _UpdateDate As String
        Public Property UpdateDate() As String
            Get
                Return _UpdateDate
            End Get
            Set(ByVal value As String)
                _UpdateDate = value
            End Set
        End Property

        Private _UpdateTime As String
        Public Property UpdateTime() As String
            Get
                Return _UpdateTime
            End Get
            Set(ByVal value As String)
                _UpdateTime = value
            End Set
        End Property

        Private _DeleteUser As String
        Public Property DeleteUser() As String
            Get
                Return _DeleteUser
            End Get
            Set(ByVal value As String)
                _DeleteUser = value
            End Set
        End Property

        Private _DeleteDate As String
        Public Property DeleteDate() As String
            Get
                Return _DeleteDate
            End Get
            Set(ByVal value As String)
                _DeleteDate = value
            End Set
        End Property

        Private _DeleteTime As String
        Public Property DeleteTime() As String
            Get
                Return _DeleteTime
            End Get
            Set(ByVal value As String)
                _DeleteTime = value
            End Set
        End Property

        Private _LockUser As String
        Public Property LockUser() As String
            Get
                Return _LockUser
            End Get
            Set(ByVal value As String)
                _LockUser = value
            End Set
        End Property

        Private _LockDate As String
        Public Property LockDate() As String
            Get
                Return _LockDate
            End Get
            Set(ByVal value As String)
                _LockDate = value
            End Set
        End Property

        Private _LockTime As String
        Public Property LockTime() As String
            Get
                Return _LockTime
            End Get
            Set(ByVal value As String)
                _LockTime = value
            End Set
        End Property

        Private _UnitesBunch As String
        Public Property UnitesBunch() As String
            Get
                Return _UnitesBunch
            End Get
            Set(ByVal value As String)
                _UnitesBunch = value
            End Set
        End Property

        Private _Cost As Decimal
        Public Property Cost() As Decimal
            Get
                Return _Cost
            End Get
            Set(ByVal value As Decimal)
                _Cost = value
            End Set
        End Property

        Private _UnitsBunch As String
        Public Property UnitsBunch() As String
            Get
                Return _UnitsBunch
            End Get
            Set(ByVal value As String)
                _UnitsBunch = value
            End Set
        End Property

        Private _OtherCost As Decimal
        Public Property OtherCost() As Decimal
            Get
                Return _OtherCost
            End Get
            Set(ByVal value As Decimal)
                _OtherCost = value
            End Set
        End Property

        Private _Type As String
        Public Property Type() As String
            Get
                Return _Type
            End Get
            Set(ByVal value As String)
                _Type = value
            End Set
        End Property

        Private _InvenType As String
        Public Property InvenType() As String
            Get
                Return _InvenType
            End Get
            Set(ByVal value As String)
                _InvenType = value
            End Set
        End Property

        Private _Units As Integer
        Public Property Units() As Integer
            Get
                Return _Units
            End Get
            Set(ByVal value As Integer)
                _Units = value
            End Set
        End Property

        Private _TotalUnits As Integer
        Public Property TotalUnits() As Integer
            Get
                Return _TotalUnits
            End Get
            Set(value As Integer)
                _TotalUnits = value
            End Set
        End Property

        Private _TotalCost As Decimal
        Public Property TotalCost() As Decimal
            Get
                Return _TotalCost
            End Get
            Set(value As Decimal)
                _TotalCost = value
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

        'VEN::13-Jan-2016
        Private _UnitsPerBox As Integer
        Public Property UnitsPerBox() As Integer
            Get
                Return _UnitsPerBox
            End Get
            Set(value As Integer)
                _UnitsPerBox = value
            End Set
        End Property

        Private _Length As String
        Public Property Length() As String
            Get
                Return _Length
            End Get
            Set(ByVal value As String)
                _Length = value
            End Set
        End Property

        Private _Width As String
        Public Property Width() As String
            Get
                Return _Width
            End Get
            Set(ByVal value As String)
                _Width = value
            End Set
        End Property

        Private _Height As String
        Public Property Height() As String
            Get
                Return _Height
            End Get
            Set(ByVal value As String)
                _Height = value
            End Set
        End Property


        Private _Dt As DateTime

        Public Property Dt() As DateTime
            Get
                Return _Dt
            End Get
            Set(ByVal value As DateTime)
                _Dt = value
            End Set
        End Property
        Private _Sequence As String
        Public Property Sequence() As String
            Get
                Return _Sequence
            End Get
            Set(ByVal value As String)
                _Sequence = value
            End Set
        End Property
        Private _Application As String
        Public Property Application() As String
            Get
                Return _Application
            End Get
            Set(ByVal value As String)
                _Application = value
            End Set
        End Property
        Private _DeviceID As String
        Public Property DeviceID() As String
            Get
                Return _DeviceID
            End Get
            Set(ByVal value As String)
                _DeviceID = value
            End Set
        End Property
        Private _UserID As String
        Public Property UserID() As String
            Get
                Return _UserID
            End Get
            Set(ByVal value As String)
                _UserID = value
            End Set
        End Property
        Private _Flag As String
        Public Property Flag() As String
            Get
                Return _Flag
            End Get
            Set(ByVal value As String)
                _Flag = value
            End Set
        End Property

        Private _Color As String
        Public Property Color() As String
            Get
                Return _Color
            End Get
            Set(ByVal value As String)
                _Color = value
            End Set
        End Property

        Private _Variety As String
        Public Property Variety() As String
            Get
                Return _Variety
            End Get
            Set(ByVal value As String)
                _Variety = value
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


        Private _CARGODATE As DateTime
        Public Property CARGODATE As DateTime
            Get
                Return _CARGODATE
            End Get
            Set(value As DateTime)
                _CARGODATE = value
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

        Private _InvenPrice As Decimal
        Public Property InvenPrice() As Decimal
            Get
                Return _InvenPrice
            End Get
            Set(ByVal value As Decimal)
                _InvenPrice = value
            End Set
        End Property

        Private _PriceB As Decimal
        Public Property PriceB() As Decimal
            Get
                Return _PriceB
            End Get
            Set(ByVal value As Decimal)
                _PriceB = value
            End Set
        End Property

        Private _PriceC As Decimal
        Public Property PriceC() As Decimal
            Get
                Return _PriceC
            End Get
            Set(ByVal value As Decimal)
                _PriceC = value
            End Set
        End Property

        Private _Fuel As Decimal
        Public Property Fuel() As Decimal
            Get
                Return _Fuel
            End Get
            Set(ByVal value As Decimal)
                _Fuel = value
            End Set
        End Property

        Private _City As String
        Public Property City() As String
            Get
                Return _City
            End Get
            Set(ByVal value As String)
                _City = value
            End Set
        End Property
        Private _Soldas As String
        Public Property Soldas() As String
            Get
                Return _Soldas
            End Get
            Set(ByVal value As String)
                _Soldas = value
            End Set
        End Property

        Private _FtUnits As Integer
        Public Property FtUnits() As Integer
            Get
                Return _FtUnits
            End Get
            Set(ByVal value As Integer)
                _FtUnits = value
            End Set
        End Property

        Private _StemBunch As Integer
        Public Property StemBunch() As Integer
            Get
                Return _StemBunch
            End Get
            Set(ByVal value As Integer)
                _StemBunch = value
            End Set
        End Property

        Private _SqlQty As Integer
        Public Property SqlQty() As Integer
            Get
                Return _SqlQty
            End Get
            Set(ByVal value As Integer)
                _SqlQty = value
            End Set
        End Property

        Private _Qty As Integer
        Public Property Qty() As Integer
            Get
                Return _Qty
            End Get
            Set(ByVal value As Integer)
                _Qty = value
            End Set
        End Property

        Private _SqlID As Integer
        Public Property SqlID() As Integer
            Get
                Return _SqlID
            End Get
            Set(ByVal value As Integer)
                _SqlID = value
            End Set
        End Property


        Private _LandedCost As Decimal
        Public Property LandedCost() As Decimal
            Get
                Return _LandedCost
            End Get
            Set(ByVal value As Decimal)
                _LandedCost = value
            End Set
        End Property

        Private _GPM As String
        Public Property GPM() As String
            Get
                Return _GPM
            End Get
            Set(ByVal value As String)
                _GPM = value
            End Set
        End Property


        Private _Days As String
        Public Property Days() As String
            Get
                Return _Days
            End Get
            Set(ByVal value As String)
                _Days = value
            End Set
        End Property



        Private _Selected As Boolean
        Public Property Selected() As Boolean
            Get
                Return _Selected
            End Get
            Set(ByVal value As Boolean)
                _Selected = value
            End Set
        End Property

        Private _Bunches As Integer
        Public Property Bunches() As Integer
            Get
                Return _Bunches
            End Get
            Set(ByVal value As Integer)
                _Bunches = value
            End Set
        End Property

        Private _WH As String
        Public Property WH() As String
            Get
                Return _WH
            End Get
            Set(ByVal value As String)
                _WH = value
            End Set
        End Property

        Private _USERFileNo As String
        Public Property USERFileNo() As String
            Get
                Return _USERFileNo
            End Get
            Set(ByVal value As String)
                _USERFileNo = value
            End Set
        End Property

        Private _SPORDID As String
        Public Property SPORDID() As String
            Get
                Return _SPORDID
            End Get
            Set(ByVal value As String)
                _SPORDID = value
            End Set
        End Property


        Private _Message1 As String
        Public Property Message1() As String
            Get
                Return _Message1
            End Get
            Set(ByVal value As String)
                _Message1 = value
            End Set
        End Property

        Private _TableName As String
        Public Property TableName() As String
            Get
                Return _TableName
            End Get
            Set(ByVal value As String)
                _TableName = value
            End Set
        End Property

        Private _ReceivedPiecesOnly As Integer
        Public Property ReceivedPiecesOnly() As Integer
            Get
                Return _ReceivedPiecesOnly
            End Get
            Set(ByVal value As Integer)
                _ReceivedPiecesOnly = value
            End Set
        End Property

    End Class


End Namespace

Public Interface ICustomParams_InventId
    Property InventID() As String
End Interface

Public Interface ICustomParams_TableName
    Property TableName() As String
End Interface

Public Interface ICustomParams_LookupOrder
    Property Order() As String
End Interface

Public Interface ICustomParams_LookupBoxnum
    Property Boxnum() As String
End Interface

Public Interface ICustomParams_LookupFarm
    Property Farm() As String
End Interface
'26 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen
Public Interface ICustomParams_IsFromLookUpForm
    Property IsFromLookUp() As Boolean
End Interface


