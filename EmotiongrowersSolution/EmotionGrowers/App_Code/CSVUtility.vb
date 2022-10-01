Imports System.Data
Imports System.IO
Imports Microsoft.VisualBasic

Module CSVUtility
    Function GetCSV(ByVal data As DataTable) As MemoryStream
        Dim fieldsToExpose As String() = New String(data.Columns.Count - 1) {}

        For i As Integer = 0 To data.Columns.Count - 1
            fieldsToExpose(i) = data.Columns(i).ColumnName
        Next

        Return GetCSV(fieldsToExpose, data)
    End Function

    Function GetCSV(ByVal fieldsToExpose As String(), ByVal data As DataTable) As MemoryStream
        Dim stream As MemoryStream = New MemoryStream()

        Using writer = New StreamWriter(stream)

            'For i As Integer = 0 To fieldsToExpose.Length - 1

            '    If i <> 0 Then
            '        writer.Write(",")
            '    End If

            '    writer.Write("""")
            '    writer.Write(fieldsToExpose(i).Replace("""", """"""))
            '    writer.Write("""")
            'Next

            'writer.Write(vbLf)

            For Each row As DataRow In data.Rows

                For i As Integer = 0 To fieldsToExpose.Length - 1

                    If i <> 0 Then
                        writer.Write(",")
                    End If

                    writer.Write("")
                    If row(fieldsToExpose(i)).ToString().Contains("~") Then
                        writer.Write(row(fieldsToExpose(i)).ToString().Replace("""", "").Replace("~", """"))
                    Else
                        writer.Write(row(fieldsToExpose(i)).ToString().Replace("""", ""))
                    End If

                    writer.Write("")
                Next

                writer.Write(vbLf)
            Next
        End Using

        Return stream
    End Function
End Module
