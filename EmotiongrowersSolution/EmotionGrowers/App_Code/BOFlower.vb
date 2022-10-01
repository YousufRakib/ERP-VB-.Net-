Imports Microsoft.VisualBasic

Namespace BO
    Public Class Flowers

        Private _Flower As String
        Public Property Flower() As String
            Get
                Return _Flower
            End Get
            Set(ByVal value As String)
                _Flower = value
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

        Private _Color As String
        Public Property Color() As String
            Get
                Return _Color
            End Get
            Set(ByVal value As String)
                _Color = value
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

        Private _VARIETY As String
        Public Property VARIETY() As String
            Get
                Return _VARIETY
            End Get
            Set(ByVal value As String)
                _VARIETY = value
            End Set
        End Property

        Private _Charge As Decimal
        Public Property Charge() As Decimal
            Get
                Return _Charge
            End Get
            Set(ByVal value As Decimal)
                _Charge = value
            End Set
        End Property

        Private _BOXES As Integer
        Public Property BOXES() As Integer
            Get
                Return _BOXES
            End Get
            Set(ByVal value As Integer)
                _BOXES = value
            End Set
        End Property

        Private _BUNCHES As Integer
        Public Property BUNCHES() As Integer
            Get
                Return _BUNCHES
            End Get
            Set(ByVal value As Integer)
                _BUNCHES = value
            End Set
        End Property

        Private _UnitsPerBunch As String
        Public Property UnitsPerBunch() As String
            Get
                Return _UnitsPerBunch
            End Get
            Set(ByVal value As String)
                _UnitsPerBunch = value
            End Set
        End Property

        Private _UNITS As Integer
        Public Property UNITS() As Integer
            Get
                Return _UNITS
            End Get
            Set(ByVal value As Integer)
                _UNITS = value
            End Set
        End Property

        Private _PRICE As Decimal
        Public Property PRICE() As Decimal
            Get
                Return _PRICE
            End Get
            Set(value As Decimal)
                _PRICE = value
            End Set
        End Property

        Private _UOM As String
        Public Property UOM() As String
            Get
                Return _UOM
            End Get
            Set(value As String)
                _UOM = value
            End Set
        End Property

        Private _BUNCH As Integer
        Public Property BUNCH() As Integer
            Get
                Return _BUNCH
            End Get
            Set(value As Integer)
                _BUNCH = value
            End Set
        End Property

        Private _WEIGHT As Decimal
        Public Property WEIGHT() As Decimal
            Get
                Return _WEIGHT
            End Get
            Set(value As Decimal)
                _WEIGHT = value
            End Set
        End Property

        Private _GROWER As Decimal
        Public Property GROWER() As Decimal
            Get
                Return _GROWER
            End Get
            Set(value As Decimal)
                _GROWER = value
            End Set
        End Property

        Private _GL As String
        Public Property GL() As String
            Get
                Return _GL
            End Get
            Set(value As String)
                _GL = value
            End Set
        End Property

        Private _DUTY As String
        Public Property DUTY() As String
            Get
                Return _DUTY
            End Get
            Set(value As String)
                _DUTY = value
            End Set
        End Property

        Private _GRADE As String
        Public Property GRADE() As String
            Get
                Return _GRADE
            End Get
            Set(value As String)
                _GRADE = value
            End Set
        End Property

        Private _FLOWERTYPE As String
        Public Property FLOWERTYPE() As String
            Get
                Return _FLOWERTYPE
            End Get
            Set(value As String)
                _FLOWERTYPE = value
            End Set
        End Property

        Private _FLORALSTAT As String
        Public Property FLORALSTAT() As String
            Get
                Return _FLORALSTAT
            End Get
            Set(value As String)
                _FLORALSTAT = value
            End Set
        End Property

        Private _STATUS As String
        Public Property STATUS() As String
            Get
                Return _STATUS
            End Get
            Set(value As String)
                _STATUS = value
            End Set
        End Property

        Private _DAYS As Integer
        Public Property DAYS() As Integer
            Get
                Return _DAYS
            End Get
            Set(value As Integer)
                _DAYS = value
            End Set
        End Property

        Private _BILLCODE As String
        Public Property BILLCODE() As String
            Get
                Return _BILLCODE
            End Get
            Set(value As String)
                _BILLCODE = value
            End Set
        End Property

        Private _ColorCode As String
        Public Property ColorCode() As String
            Get
                Return _ColorCode
            End Get
            Set(ByVal value As String)
                _ColorCode = value
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


        Private _ADDDATE As DateTime
        Public Property ADDDATE() As DateTime
            Get
                Return _ADDDATE
            End Get
            Set(ByVal value As DateTime)
                _ADDDATE = value
            End Set
        End Property


        Private _ADDTIME As String
        Public Property ADDTIME() As String
            Get
                Return _ADDTIME
            End Get
            Set(ByVal value As String)
                _ADDTIME = value
            End Set
        End Property

        Private _ADDAPP As String
        Public Property ADDAPP() As String
            Get
                Return _ADDAPP
            End Get
            Set(ByVal value As String)
                _ADDAPP = value
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

        Private _UPDDATE As DateTime
        Public Property UPDDATE() As DateTime
            Get
                Return _UPDDATE
            End Get
            Set(ByVal value As DateTime)
                _UPDDATE = value
            End Set
        End Property

        Private _UPDTIME As String
        Public Property UPDTIME() As String
            Get
                Return _UPDTIME
            End Get
            Set(ByVal value As String)
                _UPDTIME = value
            End Set
        End Property

        Private _UPDAPP As String
        Public Property UPDAPP() As String
            Get
                Return _UPDAPP
            End Get
            Set(ByVal value As String)
                _UPDAPP = value
            End Set
        End Property

        Private _DELUSER As String
        Public Property DELUSER() As String
            Get
                Return _DELUSER
            End Get
            Set(ByVal value As String)
                _DELUSER = value
            End Set
        End Property

        Private _DELDATE As DateTime
        Public Property DELDATE() As DateTime
            Get
                Return _DELDATE
            End Get
            Set(ByVal value As DateTime)
                _DELDATE = value
            End Set
        End Property

        Private _DELTIME As String
        Public Property DELTIME() As String
            Get
                Return _DELTIME
            End Get
            Set(ByVal value As String)
                _DELTIME = value
            End Set
        End Property

        Private _DELAPP As String
        Public Property DELAPP() As String
            Get
                Return _DELAPP
            End Get
            Set(ByVal value As String)
                _DELAPP = value
            End Set
        End Property

        Private _LOCKUSER As String
        Public Property LOCKUSER() As String
            Get
                Return _LOCKUSER
            End Get
            Set(ByVal value As String)
                _LOCKUSER = value
            End Set
        End Property

        Private _LOCKDATE As DateTime
        Public Property LOCKDATE() As DateTime
            Get
                Return _LOCKDATE
            End Get
            Set(ByVal value As DateTime)
                _LOCKDATE = value
            End Set
        End Property

        Private _LOCKTIME As String
        Public Property LOCKTIME() As String
            Get
                Return _LOCKTIME
            End Get
            Set(ByVal value As String)
                _LOCKTIME = value
            End Set
        End Property

        Private _LOCKAPP As String
        Public Property LOCKAPP() As String
            Get
                Return _LOCKAPP
            End Get
            Set(ByVal value As String)
                _LOCKAPP = value
            End Set
        End Property

        Private _MST_ID As String
        Public Property MST_ID() As String
            Get
                Return _MST_ID
            End Get
            Set(ByVal value As String)
                _MST_ID = value
            End Set
        End Property

        Private _FontColor As String
        Public Property FontColor() As String
            Get
                Return _FontColor
            End Get
            Set(ByVal value As String)
                _FontColor = value
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
        Private _ErrorMessage As String
        Public Property ErrorMessage() As String
            Get
                Return _ErrorMessage
            End Get
            Set(ByVal value As String)
                _ErrorMessage = value
            End Set
        End Property

        Private _KOMETID As String
        Public Property KOMETID() As String
            Get
                Return _KOMETID
            End Get
            Set(ByVal value As String)
                _KOMETID = value
            End Set
        End Property
    End Class
End Namespace

