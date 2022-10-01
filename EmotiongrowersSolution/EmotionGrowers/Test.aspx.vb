
Partial Class Test
    Inherits System.Web.UI.Page





    Public Function getFontForCode(ByVal UPCode As String) As String
        Try
            'UPCode = "87999900934"
            Dim Code As String = ""
            If (UPCode.Length > 11) Then
                Code = ConvertFontCarolinaBCode(UPCode)
            ElseIf (UPCode.Length = 11) Then
                Dim UpcNumber = (UPCode)
                Dim CUpcNumber As Integer
                Dim OddUpcNumber As Integer = 0
                Dim EvenUpcNumber As Integer = 0
                Dim ResultUpcNumber As Integer = 0
                Dim Arraycount As Integer = 0
                Dim ArrayUpcnumber As String() = GetIntArray(UpcNumber)
                For Each c As String In ArrayUpcnumber
                    CUpcNumber = c
                    If (Arraycount Mod 2 = 0) Then
                        EvenUpcNumber += CUpcNumber
                    Else
                        OddUpcNumber += CUpcNumber
                    End If
                    Arraycount += 1
                Next
                EvenUpcNumber = EvenUpcNumber * 3

                ResultUpcNumber = EvenUpcNumber + OddUpcNumber
                Dim ModResultUpcNumber = ResultUpcNumber Mod 10
                ModResultUpcNumber = 10 - ModResultUpcNumber
                If (ModResultUpcNumber = 10) Then
                    ModResultUpcNumber = 0
                End If
                Code = ConvertFontCarolinaBCode(UPCode + ModResultUpcNumber.ToString())
            End If
            Return Code
        Catch ex As Exception
            ListBox1.DataSource = GetIntArray(UPCode)
            ListBox1.DataBind()
            Return ex.Message + " " + ConvertFontCarolinaBCode(UPCode)
        End Try
    End Function


    Public Function GetIntArray(num As String) As String()
        Dim arr As String() = New String(num.Length - 1) {}
        For i As Integer = 0 To num.Length - 1
            arr(i) = num(i).ToString()
        Next
        Return arr
    End Function



    Public Function ConvertFontCarolinaBCode(UPCode As String) As String
        Dim ReplaceCode As String = ""
        Dim FirstNumber() As Integer = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
        Dim MIDNumber() As Char = {"P", "Q", "W", "E", "R", "T", "Y", "U", "I", "O"}
        Dim Dash = "-"
        Dim SecondPartNumber() As Char = {";", "A", "S", "D", "F", "G", "H", "J", "K", "L"}
        Dim lastPart() As Char = {"/", "Z", "X", "C", "V", "B", "N", "M", ",", "."}
        Dim getFirstFive As Char() = {UPCode.Substring(0, 1), UPCode.Substring(1, 1), UPCode.Substring(2, 1), UPCode.Substring(3, 1), UPCode.Substring(4, 1), UPCode.Substring(5, 1)}
        Dim i As Integer
        For i = 0 To UPCode.Length - 1
            If (i = 0) Then
                ReplaceCode = UPCode.Chars(i)
            ElseIf (i > 0 And i < 6) Then
                ReplaceCode += MIDNumber(Val(UPCode(i)))
            ElseIf (i = 6) Then
                ReplaceCode += "-"
                ReplaceCode += SecondPartNumber(Val(UPCode(i)))
            ElseIf (i > 6 And i < 11) Then
                ReplaceCode += SecondPartNumber(Val(UPCode(i)))
            ElseIf (i = 11) Then
                ReplaceCode += lastPart(Val(UPCode(i)))
            End If
        Next
        Return ReplaceCode
    End Function


    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Response.Write(getFontForCode("85048900618"))
    End Sub
End Class
