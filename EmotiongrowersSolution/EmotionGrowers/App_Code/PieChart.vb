Imports Microsoft.VisualBasic

Public Class PieChart

    Private _value As Decimal
    Public Property value() As Decimal
        Get
            Return _value
        End Get
        Set(ByVal value As Decimal)
            _value = value
        End Set
    End Property

    Private _color As String
    Public Property color() As String
        Get
            Return _color
        End Get
        Set(ByVal value As String)
            _color = value
        End Set
    End Property


    Private _label As String
    Public Property label() As String
        Get
            Return _label
        End Get
        Set(ByVal value As String)
            _label = value
        End Set
    End Property

    Private _labelColor As String
    Public Property labelColor() As String
        Get
            Return _labelColor
        End Get
        Set(ByVal value As String)
            _labelColor = value
        End Set
    End Property

    Private _labelFontSize As String
    Public Property labelFontSize() As String
        Get
            Return _labelFontSize
        End Get
        Set(ByVal value As String)
            _labelFontSize = value
        End Set
    End Property

    Private _PreFixSymbol As String
    Public Property PreFixSymbol() As String
        Get
            Return _PreFixSymbol
        End Get
        Set(ByVal value As String)
            _PreFixSymbol = value
        End Set
    End Property

    Private _SuFixSymbol As String
    Public Property SuFixSymbol() As String
        Get
            Return _SuFixSymbol
        End Get
        Set(ByVal value As String)
            _SuFixSymbol = value
        End Set
    End Property

End Class

Public Class Chart
    Private _CarrierDetailsByFBE As New List(Of PieChart)
    Public Property CarrierDetailsByFBE() As List(Of PieChart)
        Get
            Return _CarrierDetailsByFBE
        End Get
        Set(value As List(Of PieChart))
            _CarrierDetailsByFBE = value
        End Set
    End Property

    Private _CarrierDetailsByBoxes As New List(Of PieChart)
    Public Property CarrierDetailsByBoxes() As List(Of PieChart)
        Get
            Return _CarrierDetailsByBoxes
        End Get
        Set(value As List(Of PieChart))
            _CarrierDetailsByBoxes = value
        End Set
    End Property

    Private _StateDetailsByBoxes As New List(Of PieChart)
    Public Property StateDetailsByBoxes() As List(Of PieChart)
        Get
            Return _StateDetailsByBoxes
        End Get
        Set(value As List(Of PieChart))
            _StateDetailsByBoxes = value
        End Set
    End Property

    Private _StateDetailsBySales As New List(Of PieChart)
    Public Property StateDetailsBySales() As List(Of PieChart)
        Get
            Return _StateDetailsBySales
        End Get
        Set(value As List(Of PieChart))
            _StateDetailsBySales = value
        End Set
    End Property

    Private _SalesManDetails As New List(Of PieChart)
    Public Property SalesManDetails() As List(Of PieChart)
        Get
            Return _SalesManDetails
        End Get
        Set(value As List(Of PieChart))
            _SalesManDetails = value
        End Set
    End Property

    Private _SalesTypeDetails As New List(Of PieChart)
    Public Property SalesTypeDetails() As List(Of PieChart)
        Get
            Return _SalesTypeDetails
        End Get
        Set(value As List(Of PieChart))
            _SalesTypeDetails = value
        End Set
    End Property

    Private _FlowerColorDetailsByBoxes As New List(Of PieChart)
    Public Property FlowerColorDetailsByBoxes() As List(Of PieChart)
        Get
            Return _FlowerColorDetailsByBoxes
        End Get
        Set(value As List(Of PieChart))
            _FlowerColorDetailsByBoxes = value
        End Set
    End Property

    Private _FlowerColorDetailsBySales As New List(Of PieChart)
    Public Property FlowerColorDetailsBySales() As List(Of PieChart)
        Get
            Return _FlowerColorDetailsBySales
        End Get
        Set(value As List(Of PieChart))
            _FlowerColorDetailsBySales = value
        End Set
    End Property

    Private _FlowerCatDetails As New List(Of PieChart)
    Public Property FlowerCatDetails() As List(Of PieChart)
        Get
            Return _FlowerCatDetails
        End Get
        Set(value As List(Of PieChart))
            _FlowerCatDetails = value
        End Set
    End Property

    Private _FlowerDescDetails As New List(Of PieChart)
    Public Property FlowerDescDetails() As List(Of PieChart)
        Get
            Return _FlowerDescDetails
        End Get
        Set(value As List(Of PieChart))
            _FlowerDescDetails = value
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