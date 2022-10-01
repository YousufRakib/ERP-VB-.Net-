Imports Microsoft.VisualBasic
Imports System.Data
Imports System.IO
Imports Microsoft.Reporting.WebForms
Imports System.Data.SqlClient
Imports iTextSharp
Imports iTextSharp.text.pdf
Imports iTextSharp.text


Public Class ExportSSRS

    Enum PdfOrientation
        Portrait
        Landscape
        Label
        DVLabel
        UPCLabel
        ShippingLabel
        SalesMaintenanceJournal
    End Enum

    Enum FileType
        CSV = 0
        Excel = 1
        PDF = 2
        TIFF = 3
        XML = 4
        WORD = 5
    End Enum

    Public Function ExportToPdf(fileName As String, reportName As String, reportParameterCollection As ReportParameter(),
                                Type As String, Filetype As FileType, ByVal DataSourceName As String, Optional ByVal saveInFolder As String = "") As String
        Try
            'Dim log As New BloomService
            'log.AppendLog("Export Pdf function starts", "")


            Dim deviceInfo As New StringBuilder()

            deviceInfo.AppendLine("<DeviceInfo>")

            deviceInfo.AppendLine(" <OutputFormat>EMF</OutputFormat>")

            If Type = "0" Then 'Portrait
                deviceInfo.AppendLine(" <PageWidth>8.5in</PageWidth>")
                deviceInfo.AppendLine(" <PageHeight>11in</PageHeight>")

                deviceInfo.AppendLine(" <MarginTop>0.175in</MarginTop>")
                deviceInfo.AppendLine(" <MarginLeft>0.275in</MarginLeft>")
                deviceInfo.AppendLine(" <MarginRight>0in</MarginRight>")
                deviceInfo.AppendLine(" <MarginBottom>0in</MarginBottom>")
                deviceInfo.AppendLine("</DeviceInfo>")

            ElseIf Type = "1" Then 'Landscape
                deviceInfo.AppendLine(" <PageWidth>14in</PageWidth>")
                deviceInfo.AppendLine(" <PageHeight>8.5in</PageHeight>")

                deviceInfo.AppendLine(" <MarginTop>0.1in</MarginTop>")
                deviceInfo.AppendLine(" <MarginLeft>0.1in</MarginLeft>")
                deviceInfo.AppendLine(" <MarginRight>0.1in</MarginRight>")
                deviceInfo.AppendLine(" <MarginBottom>0.1in</MarginBottom>")
                deviceInfo.AppendLine("</DeviceInfo>")
            ElseIf Type = "2" Then
                deviceInfo.AppendLine(" <PageWidth>3in</PageWidth>")
                deviceInfo.AppendLine(" <PageHeight>4in</PageHeight>")

                deviceInfo.AppendLine(" <MarginTop>0.05in</MarginTop>")
                deviceInfo.AppendLine(" <MarginLeft>0.05in</MarginLeft>")
                deviceInfo.AppendLine(" <MarginRight>0.05in</MarginRight>")
                deviceInfo.AppendLine(" <MarginBottom>0.05in</MarginBottom>")
                deviceInfo.AppendLine("</DeviceInfo>")
            ElseIf Type = "3" Then
                deviceInfo.AppendLine(" <PageWidth>4in</PageWidth>")
                deviceInfo.AppendLine(" <PageHeight>3in</PageHeight>")

                deviceInfo.AppendLine(" <MarginTop>0in</MarginTop>")
                deviceInfo.AppendLine(" <MarginLeft>0in</MarginLeft>")
                deviceInfo.AppendLine(" <MarginRight>0in</MarginRight>")
                deviceInfo.AppendLine(" <MarginBottom>0in</MarginBottom>")
                deviceInfo.AppendLine("</DeviceInfo>")
            ElseIf Type = "4" Then
                deviceInfo.AppendLine(" <PageWidth>4in</PageWidth>")
                deviceInfo.AppendLine(" <PageHeight>1in</PageHeight>")

                deviceInfo.AppendLine(" <MarginTop>0.05in</MarginTop>")
                deviceInfo.AppendLine(" <MarginLeft>0.05in</MarginLeft>")
                deviceInfo.AppendLine(" <MarginRight>0.05in</MarginRight>")
                deviceInfo.AppendLine(" <MarginBottom>0in</MarginBottom>")
                deviceInfo.AppendLine("</DeviceInfo>")
            ElseIf Type = "5" Then
                deviceInfo.AppendLine(" <PageWidth>5in</PageWidth>")
                deviceInfo.AppendLine(" <PageHeight>3.5in</PageHeight>")
                deviceInfo.AppendLine(" <MarginTop>0.05in</MarginTop>")
                deviceInfo.AppendLine(" <MarginLeft>0.05in</MarginLeft>")
                deviceInfo.AppendLine(" <MarginRight>0.05in</MarginRight>")
                deviceInfo.AppendLine(" <MarginBottom>0.05in</MarginBottom>")
                deviceInfo.AppendLine("</DeviceInfo>")
            ElseIf Type = "6" Then
                deviceInfo.AppendLine(" <PageWidth>11in</PageWidth>")
                deviceInfo.AppendLine(" <PageHeight>8.5in</PageHeight>")

                deviceInfo.AppendLine(" <MarginTop>0.1in</MarginTop>")
                deviceInfo.AppendLine(" <MarginLeft>0.1in</MarginLeft>")
                deviceInfo.AppendLine(" <MarginRight>0.1in</MarginRight>")
                deviceInfo.AppendLine(" <MarginBottom>0.1in</MarginBottom>")
                deviceInfo.AppendLine("</DeviceInfo>")
            End If

            Dim foldername As String = ConfigurationManager.AppSettings("VendorEmailsFolder").ToString() + ConfigurationManager.AppSettings("ExportFolder").ToString()
            If saveInFolder <> "" Then
                foldername = foldername + "\" + saveInFolder
            End If

            Dim ReportExportFolder = ConfigurationManager.AppSettings("ExportFolder").ToString()

            'Dim SysPath As String = HttpContext.Current.Server.MapPath("~/" + foldername + "/")
            Dim SysPath As String = foldername + "\"

            Dim reportViewer1 As New ReportViewer()
            reportViewer1.ServerReport.ReportServerUrl = New Uri(ConfigurationManager.AppSettings("ReportServerURL").ToString())
            reportViewer1.ServerReport.ReportPath = ConfigurationManager.AppSettings("ReportPath").ToString() + reportName


            reportViewer1.ProcessingMode = ProcessingMode.Remote
            Dim nc As New CustomReportCredentials(ConfigurationManager.AppSettings("ReportServerUsername").ToString(), ConfigurationManager.AppSettings("ReportServerPassword").ToString(), "")
            reportViewer1.ServerReport.ReportServerCredentials = nc


            Dim ConString As String = ConfigurationManager.ConnectionStrings("BloomsConnectionString").ToString()
            Dim ConnectionBuilter As New SqlConnectionStringBuilder(ConString)

            Dim dataSourceCredentials As New DataSourceCredentials()
            dataSourceCredentials.Name = DataSourceName
            dataSourceCredentials.UserId = ConnectionBuilter.UserID
            dataSourceCredentials.Password = ConnectionBuilter.Password

            'log.AppendLog(ConfigurationManager.AppSettings("ExportFolder").ToString(), "")
            'log.AppendLog(ConfigurationManager.AppSettings("ReportServerURL").ToString(), "")
            'log.AppendLog(ConfigurationManager.AppSettings("ReportPath").ToString(), "")
            'log.AppendLog(ConfigurationManager.AppSettings("ReportServerUsername").ToString(), "")
            'log.AppendLog(ConfigurationManager.AppSettings("ReportServerPassword").ToString(), "")


            Dim dsCredentials As DataSourceCredentials() = New DataSourceCredentials() {dataSourceCredentials}
            reportViewer1.ServerReport.SetDataSourceCredentials(dsCredentials)

            'Setting Parameters
            'log.AppendLog("Parameter Set before", "")
            reportViewer1.ServerReport.SetParameters(reportParameterCollection)

            'log.AppendLog("Parameter Set After", "")

            Dim mimeType As String = Nothing
            Dim encoding As String = Nothing
            Dim fileNameExtension As String = Nothing
            Dim Warnings As Warning() = Nothing
            Dim streamids As String() = Nothing
            Dim exportBytes As Byte() = Nothing

            Dim strFileTypeName As String = FileType.PDF.ToString()
            Dim FileTypeValue As Integer = Convert.ToInt32(FileType.PDF)
            'log.AppendLog("FileType is :" + FileTypeValue.ToString(), "")
            Select Case Filetype
                Case 0
                    'log.AppendLog("Case0", "")
                    exportBytes = reportViewer1.ServerReport.Render(FileType.CSV.ToString(), Nothing, mimeType, encoding, fileNameExtension, streamids,
                                                         Warnings)
                Case 1
                    exportBytes = reportViewer1.ServerReport.Render(FileType.Excel.ToString(), Nothing, mimeType, encoding, fileNameExtension, streamids,
                                                         Warnings)
                Case 2
                    'log.AppendLog("Case Before PDF", "")
                    exportBytes = reportViewer1.ServerReport.Render(FileType.PDF.ToString(), deviceInfo.ToString(), mimeType, encoding, fileNameExtension, streamids,
                                                         Warnings)
                    'log.AppendLog("Case After PDF", "")
                Case 3
                    exportBytes = reportViewer1.ServerReport.Render(FileType.TIFF.ToString(), deviceInfo.ToString(), mimeType, encoding, fileNameExtension, streamids,
                                                         Warnings)
                Case 4
                    exportBytes = reportViewer1.ServerReport.Render(FileType.XML.ToString(), deviceInfo.ToString(), mimeType, encoding, fileNameExtension, streamids,
                                                         Warnings)
                Case 5
                    exportBytes = reportViewer1.ServerReport.Render(FileType.WORD.ToString(), deviceInfo.ToString(), mimeType, encoding, fileNameExtension, streamids,
                                                         Warnings)

            End Select

            'log.AppendLog("After the Report render:", "")

            'exportBytes = reportViewer1.ServerReport.Render("PDF", deviceInfo.ToString(), mimeType, encoding, fileNameExtension, streamids, _
            '                                           Warnings)


            Dim di As New DirectoryInfo(SysPath)
            If di.Exists = False Then
                di.Create()
            End If
            'log.AppendLog("Pdf File Created", "")

            Dim FullFileName As [String] = String.Empty
            FullFileName = SysPath & fileName
            Dim files As New System.IO.FileInfo(FullFileName)
            If files.Exists = True Then
                System.IO.File.Delete(FullFileName)
            End If

            'cmted by mani : without using
            'Dim Stream As New FileStream(FullFileName, FileMode.Create)
            'Stream.Write(exportBytes, 0, exportBytes.Length)
            'Stream.Close()

            'added by mani : with using  
            Using Stream As New FileStream(FullFileName, FileMode.Create)
                Stream.Write(exportBytes, 0, exportBytes.Length)
            End Using

            Return ReportExportFolder + "\" + fileName

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Service::ExportToPdf")
            Return "error : " + ex.Message + ":::" + ex.ToString()
        End Try
    End Function

    Public Function ExportToPDF(ByVal dataTableItem As DataTable, ByVal fileName As String) As String
        Try
            Dim gridViewItem = New GridView()
            gridViewItem.AllowPaging = False
            gridViewItem.HeaderStyle.BackColor = System.Drawing.Color.Magenta
            gridViewItem.DataSource = dataTableItem
            gridViewItem.DataBind()
            Dim noOfColumns = 0, noOfRows = 0
            noOfColumns = dataTableItem.Columns.Count
            noOfRows = dataTableItem.Rows.Count
            Dim HeaderTextSize = 8
            Dim ReportNameSize = 10
            Dim ReportTextSize = 8
            Dim ApplicationNameSize = 7
            Dim document = New Document
            document = New Document(PageSize.A4, 0, 0, 15, 5)
            Dim mainTable = New iTextSharp.text.pdf.PdfPTable(noOfColumns)
            For i As Integer = 0 To noOfColumns - 1
                If gridViewItem.AutoGenerateColumns Then
                    Dim ph = New Phrase(dataTableItem.Columns(i).ColumnName, FontFactory.GetFont("Arial", HeaderTextSize, iTextSharp.text.Font.BOLD))
                    mainTable.AddCell(ph)
                Else
                    Dim ph = New Phrase(gridViewItem.Columns(i).HeaderText, FontFactory.GetFont("Arial", HeaderTextSize, iTextSharp.text.Font.BOLD))
                    mainTable.AddCell(ph)
                End If
            Next
            For rowNo As Integer = 0 To noOfRows - 1
                If rowNo >= noOfRows Then
                    For columnNo As Integer = 0 To noOfColumns - 1
                        Dim ph = New Phrase("", FontFactory.GetFont("Arial", ReportTextSize, iTextSharp.text.Font.NORMAL))
                        mainTable.AddCell(ph)
                    Next
                Else
                    For columnNo As Integer = 0 To noOfColumns - 1
                        If gridViewItem.AutoGenerateColumns Then
                            Dim s = gridViewItem.Rows(rowNo).Cells(columnNo).Text.Replace("&nbsp;", "").Trim()
                            Dim ph = New Phrase(s, FontFactory.GetFont("Arial", ReportTextSize, iTextSharp.text.Font.NORMAL))
                            mainTable.AddCell(ph)
                        Else
                            Dim s = gridViewItem.Rows(rowNo).Cells(columnNo).Text.Replace("&nbsp;", "").Trim()
                            Dim ph = New Phrase(s, FontFactory.GetFont("Arial", ReportTextSize, iTextSharp.text.Font.NORMAL))
                            mainTable.AddCell(ph)
                        End If
                    Next
                    'mainTable.CompleteRow()
                End If
            Next
            PdfWriter.GetInstance(document, New FileStream(fileName, FileMode.Create))
            Dim pdfFooter = New HeaderFooter(New Phrase(), True)
            pdfFooter.Alignment = Element.ALIGN_CENTER
            pdfFooter.Border = iTextSharp.text.Rectangle.NO_BORDER
            document.Footer = pdfFooter
            document.Open()
            document.Add(mainTable)
            document.Close()
            Return fileName
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function


End Class
