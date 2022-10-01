Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Public Class DAOFarmPR


    Public Shared Function GetPurchaseDetailsFromFarmPR(ByVal Farm As String) As List(Of BOFarmPR)
        Try
            Dim ConStr As String = ConfigurationManager.ConnectionStrings.Item("BloomsConnectionString").ToString
            Dim ulistPOD As New List(Of BOFarmPR)
            Dim RecNo As Integer = 0
            Using Con As New SqlConnection(ConStr)
                Con.Open()
                Using Cmd As New SqlCommand("spGetPurchaseDetailsFromFarmPR", Con)
                    Cmd.Parameters.Add(New SqlParameter("@Farmcode", Farm))
                    Cmd.CommandType = CommandType.StoredProcedure
                    Dim da As New SqlDataAdapter(Cmd)
                    Dim ds As New DataTable
                    da.Fill(ds)
                    For Each row In ds.Rows
                        Dim u As New BOFarmPR
                        RecNo = RecNo + 1
                        u.RecNo = RecNo
                        u.Farm = Convert.ToString(row("FARM"))
                        u.Flower = Convert.ToString(row("FLOWER"))
                        u.Boxes = Convert.ToString(row("BOXES"))
                        u.UOM = Convert.ToString(row("UOM"))
                        u.UnitsPerBox = Convert.ToString(row("UNITS"))
                        u.UnitsPerBunch = Convert.ToString(row("UNITSBUNCH"))
                        u.Cost = Convert.ToDecimal(row("LASTCOST"))
                        u.Flowername = Convert.ToString(row("NAME"))
                        u.ForeColor = Convert.ToString(row("Color"))
                        u.BGColor = Convert.ToString(row("BGColor"))
                        u.ColorCode = row("ColorCode")
                        u.FlowerCategory = row("CAT")

                        ulistPOD.Add(u)
                    Next
                    Return ulistPOD
                End Using
            End Using
        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in GetCurrentDateShippingDetails")
            Return Nothing
        End Try
    End Function

End Class


    Public Class BOFarmPR

    Private _RecNo As String
    Public Property RecNo() As String
        Get
            Return _RecNo
        End Get
        Set(ByVal value As String)
            _RecNo = value
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

    Private _Flower As String
    Public Property Flower() As String
        Get
            Return _Flower
        End Get
        Set(ByVal value As String)
            _Flower = value
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

    Private _Description As String
    Public Property Description() As String
        Get
            Return _Description
        End Get
        Set(ByVal value As String)
            _Description = value
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

    Private _UOM As String
    Public Property UOM() As String
        Get
            Return _UOM
        End Get
        Set(ByVal value As String)
            _UOM = value
        End Set
    End Property

    Private _Bunches As String
    Public Property Bunches() As String
        Get
            Return _Bunches
        End Get
        Set(ByVal value As String)
            _Bunches = value
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

    Private _UnitsPerBox As String
    Public Property UnitsPerBox() As String
        Get
            Return _UnitsPerBox
        End Get
        Set(ByVal value As String)
            _UnitsPerBox = value
        End Set
    End Property

    Private _TotalUnits As String
    Public Property TotalUnits() As String
        Get
            Return _TotalUnits
        End Get
        Set(ByVal value As String)
            _TotalUnits = value
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

    Private _TotalCost As Decimal
    Public Property TotalCost() As Decimal
        Get
            Return _TotalCost
        End Get
        Set(ByVal value As Decimal)
            _TotalCost = value
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

    Private _CustNumber As String
    Public Property CustNumber() As String
        Get
            Return _CustNumber
        End Get
        Set(ByVal value As String)
            _CustNumber = value
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

    Private _AWB As String
    Public Property AWB() As String
        Get
            Return _AWB
        End Get
        Set(ByVal value As String)
            _AWB = value
        End Set
    End Property

    Private _Flowername As String
    Public Property Flowername() As String
        Get
            Return _Flowername
        End Get
        Set(ByVal value As String)
            _Flowername = value
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


    Private _FlowerCategory As String
    Public Property FlowerCategory() As String
        Get
            Return _FlowerCategory
        End Get
        Set(ByVal value As String)
            _FlowerCategory = value
        End Set
    End Property


    Private _FarmName As String
    Public Property FarmName() As String
        Get
            Return _FarmName
        End Get
        Set(ByVal value As String)
            _FarmName = value
        End Set
    End Property



End Class



