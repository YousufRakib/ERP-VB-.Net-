
Imports Microsoft.VisualBasic
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports System.IO

Public Class POReportExport
    Public Shared Function CombineMultiplePDFs(fileNames As String(), outFile As String) As String
        Try
            ' step 1: creation of a document-object
            Dim document As New Document()

            ' step 2: we create a writer that listens to the document
            Dim writer As New PdfCopy(document, New FileStream(outFile, FileMode.Create))
            If writer Is Nothing Then
                Return Nothing
            End If

            ' step 3: we open the document
            document.Open()

            For Each fileName As String In fileNames
                ' we create a reader for a certain document
                Dim reader As New PdfReader(fileName)
                reader.ConsolidateNamedDestinations()

                ' step 4: we add content
                For i As Integer = 1 To reader.NumberOfPages
                    Dim page As PdfImportedPage = writer.GetImportedPage(reader, i)
                    writer.AddPage(page)
                Next

                Dim form As PRAcroForm = reader.AcroForm
                If form IsNot Nothing Then
                    writer.CopyAcroForm(reader)
                End If

                reader.Close()
            Next

            ' step 5: we close the document and writer
            writer.Close()
            document.Close()
            'DeleteCreatedPoFile(fileNames)
            Return "valid"
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    Public Shared Sub DeleteCreatedPoFile(fileNames As String())
        For Each obj In fileNames
           If (File.Exists(obj)) Then
                System.IO.File.Delete(obj)
            End If
        Next
    End Sub

    Public Function FileInUse(ByVal sFile As String) As Boolean
        Dim thisFileInUse As Boolean = False
        If System.IO.File.Exists(sFile) Then
            Try
                Using f As New IO.FileStream(sFile, FileMode.Open, FileAccess.ReadWrite, FileShare.None)
                    ' thisFileInUse = False
                End Using
            Catch
                thisFileInUse = True
            End Try
        End If
        Return thisFileInUse
    End Function

End Class
