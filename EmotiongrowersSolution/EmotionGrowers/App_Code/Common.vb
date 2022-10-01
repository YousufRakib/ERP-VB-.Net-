Imports Microsoft.VisualBasic
Imports System.IO
Imports System.Reflection
Imports System.Data
Imports System.Xml
Imports System.Data.OleDb
Imports System.Web.Services.Protocols

Namespace CommonUtilities
    Public Class ExportToCSV

        'Public Shared Function CreateCSVList(ByVal xmls As String, PageName As String, Columns As String) As String
        '    'Dim FolderPath = ConfigurationManager.AppSettings("CSVFolderPath").ToString + "\Csvfiles"
        '    'Dim FolderPath = "D:\common\Sites\VendorEmails\ReportExports"
        '    Dim FolderPath = ConfigurationManager.AppSettings("VendorEmailsFolder") + "\" + ConfigurationManager.AppSettings("ExportFolder")
        '    Dim Filename = PageName + "_CSV_" + DateTime.Now.ToString("yyyy_MM_dd_HH_mm") + ".csv"
        '    If (Directory.Exists(FolderPath)) Then
        '    Else
        '        Directory.CreateDirectory(FolderPath)
        '    End If
        '    Dim Filepath = FolderPath + "\" + Filename

        '    Dim XmlStr = Regex.Replace(xmls, "&lt;.*?&gt;", String.Empty)
        '    XmlStr = XmlStr.Replace("<cell></cell>", "")
        '    Dim strReader As New StringReader(XmlStr)
        '    ExportToCSV.Convert(XmlStr.Trim(), Columns, "row", ExportToCSV.DataArrange.Attribute, ExportToCSV.RowDelimit.NewLine, ExportToCSV.ColumnDelimit.Comma, Filename)
        '    Return Filepath

        'End Function

        Public Shared Function CreateCSVList(ByVal xmls As String, PageName As String, Columns As String) As String
            Dim XmlStr = Regex.Replace(xmls, "&lt;.*?&gt;", String.Empty)
            'XmlStr = XmlStr.Replace("<cell></cell>", "")
            Dim strReader As New StringReader(XmlStr)
            Dim Filepath = ExportToCSV.Convert(XmlStr.Trim(), Columns, "row", ExportToCSV.DataArrange.Attribute, ExportToCSV.RowDelimit.NewLine, ExportToCSV.ColumnDelimit.Comma, PageName)
            Return Filepath
        End Function
        Public Enum RowDelimit
            [Default]
            NewLine
            Space
            Ambescent
            Dollar
        End Enum
        Public Enum ColumnDelimit
            [Default]
            Comma
            TabSpace
            Percentage
            OrSymbol
            Dot
        End Enum
        Public Enum DataArrange
            Element
            Attribute
        End Enum

        Public Shared Property RowDelimiter() As RowDelimit
            Get
                Return m_RowDelimiter
            End Get
            Set(value As RowDelimit)
                m_RowDelimiter = value
            End Set
        End Property
        Private Shared m_RowDelimiter As RowDelimit

        Public Shared Property ColumnDelimiter() As ColumnDelimit
            Get
                Return m_ColumnDelimiter
            End Get
            Set(value As ColumnDelimit)
                m_ColumnDelimiter = value
            End Set
        End Property
        Private Shared m_ColumnDelimiter As ColumnDelimit

        Public Shared Sub FetchRowSeparater(delimit As RowDelimit, ByRef separater As String)
            Select Case delimit
                Case RowDelimit.NewLine, RowDelimit.[Default]
                    separater = Environment.NewLine
                    Exit Select
                Case RowDelimit.Space
                    separater = " "
                    Exit Select
                Case RowDelimit.Dollar
                    separater = "$"
                    Exit Select
                Case RowDelimit.Ambescent
                    separater = "&"
                    Exit Select
                Case Else
                    separater = Environment.NewLine
                    Exit Select
            End Select
        End Sub


        Public Shared Sub FetchColumnSeparater(delimit As ColumnDelimit, ByRef separater As String)
            Select Case delimit
                Case ColumnDelimit.Comma, ColumnDelimit.[Default]
                    separater = ","
                    Exit Select
                Case ColumnDelimit.Dot
                    separater = "."
                    Exit Select
                Case ColumnDelimit.OrSymbol
                    separater = "|"
                    Exit Select
                Case ColumnDelimit.Percentage
                    separater = "%"
                    Exit Select
                Case ColumnDelimit.TabSpace
                    separater = vbTab
                    Exit Select
                Case Else
                    separater = ","
                    Exit Select
            End Select
        End Sub

        'Public Shared Function Convert(xmlfilepath As String, columns As String, datatag As String, arrange As DataArrange, rdelimit As RowDelimit, cdelimit As ColumnDelimit, ByVal Filename As String) As String
        '    Try
        '        Dim builder As New StringBuilder()
        '        Dim doc As XDocument = XDocument.Parse(xmlfilepath)
        '        Dim Rowseparater As String = String.Empty
        '        FetchRowSeparater(rdelimit, Rowseparater)
        '        Dim Columnseparater As String = String.Empty
        '        FetchColumnSeparater(cdelimit, Columnseparater)
        '        Dim ColsSplit = columns.Split(",")
        '        For Each Strs In ColsSplit
        '            If (Strs = "") Then
        '                builder.AppendFormat("{0},", "-")
        '            Else
        '                builder.AppendFormat("{0},", Strs)
        '            End If
        '        Next
        '        builder.Append(Rowseparater)
        '        For Each data As XElement In doc.Descendants(datatag)
        '            For Each innerNode As XElement In data.Elements()
        '                If (innerNode.Value = "") Then
        '                    builder.Append(Columnseparater)
        '                Else
        '                    If (innerNode.Value.Contains(",")) Then
        '                        builder.AppendFormat("""{0}""" + ",", innerNode.Value)
        '                    Else
        '                        builder.AppendFormat("{0},", innerNode.Value)
        '                    End If
        '                End If
        '            Next
        '            builder.Append(Rowseparater)
        '        Next
        '        'File.AppendAllText(csvpath, builder.ToString())
        '        Dim FinalText = builder.ToString.Replace(",", Chr(9))
        '        Dim FolderPath = ConfigurationManager.AppSettings("VendorEmailsFolder").ToString()
        '        Dim Foldername = ConfigurationManager.AppSettings("ExportFolder").ToString()
        '        Dim FulFilePath = FolderPath + Foldername
        '        Dim FulFilename = Filename + "_" + DateTime.Now.ToString("yyyy_MM_dd_HH_mm") + ".xls"
        '        IO.File.WriteAllText(FulFilePath + FulFilename, FinalText)
        '        Return FulFilePath + FulFilename
        '    Catch
        '        Throw
        '    End Try
        'End Function

        Public Shared Function Convert(xmlfilepath As String, columns As String, datatag As String, arrange As DataArrange, rdelimit As RowDelimit, cdelimit As ColumnDelimit, ByVal Filename As String) As String
            Try
                Dim builder As New StringBuilder()
                Dim doc As XDocument = XDocument.Parse(xmlfilepath)
                Dim Rowseparater As String = String.Empty
                FetchRowSeparater(rdelimit, Rowseparater)
                Dim Columnseparater As String = String.Empty
                FetchColumnSeparater(cdelimit, Columnseparater)
                Dim ColsSplit = columns.Split(",")
                For Each Strs In ColsSplit
                    If (Strs = "") Then
                        builder.AppendFormat("{0},", " ")
                    Else
                        builder.AppendFormat("{0},", Strs)
                    End If
                Next
                builder.Append(Rowseparater)
                For Each data As XElement In doc.Descendants(datatag)
                    For Each innerNode As XElement In data.Elements()
                        If (innerNode.Value = "") Then
                            builder.Append(",")
                        Else
                            If (innerNode.Value.Contains(",")) Then
                                builder.AppendFormat("""{0}""" + ",", innerNode.Value)
                            Else
                                builder.AppendFormat("{0},", innerNode.Value)
                            End If
                        End If
                    Next
                    builder.Append(Rowseparater)
                Next
                'File.AppendAllText(csvpath, builder.ToString())
                Dim FinalText = builder.ToString.Replace(",", Chr(9))
                Dim FolderPath = ConfigurationManager.AppSettings("VendorEmailsFolder").ToString()
                Dim Foldername = ConfigurationManager.AppSettings("ExportFolder").ToString()
                Dim FulFilePath = FolderPath + Foldername
                Dim FulFilename = Filename + "_" + DateTime.Now.ToString("yyyy_MM_dd_HH_mm") + ".xls"
                IO.File.WriteAllText(FulFilePath + "/" + FulFilename, FinalText)
                Return FulFilename
            Catch
                Throw
            End Try
        End Function

        Private Shared Function FirstSheet(ByVal XLSFile As String, ByVal IsHeader As Boolean) As String

            Dim conStr As String = String.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='" & XLSFile & "'; Extended Properties='Excel 8.0;HDR={0}'", IIf(IsHeader, "yes", "no"))
            Dim Con As OleDbConnection = New OleDbConnection(conStr)
            Con.Open()
            Dim myCommand As New OleDbCommand()
            myCommand.Connection = Con

            Dim dbSchema As DataTable = Con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)
            Dim dtColumns As DataTable = Con.GetOleDbSchemaTable(OleDbSchemaGuid.Columns, New String() {Nothing, Nothing, dbSchema.Rows(0)("TABLE_NAME"), Nothing})
            If (dbSchema Is Nothing Or dbSchema.Rows.Count < 1) Then
                Throw New Exception("Error: Could not determine the name of the first worksheet.")
            Else
                Return dbSchema.Rows(0)("TABLE_NAME").ToString()
            End If

        End Function

        Public Shared Function XLSToCSV(ByVal Fields As String, ByVal XLSFile As String, ByVal IsHeader As Boolean) As Boolean
            Try
                Dim SheetName As String = FirstSheet(XLSFile, IsHeader)
                Dim FileName As String = Path.GetFileName(XLSFile)
                Dim doubleQuote As String = Chr(34)
                Dim conStr As String = String.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='" & XLSFile & "'; Extended Properties='Excel 8.0;HDR={0}'", IIf(IsHeader, "yes", "no"))
                Dim Con As OleDbConnection = New OleDbConnection(conStr)
                Con.Open()
                Dim DA As OleDbDataAdapter = New OleDbDataAdapter(String.Format("SELECT {0} From [{1}]", Fields, SheetName), Con)
                ' Dim DA As OleDbDataAdapter = New OleDbDataAdapter(String.Format("SELECT * From [{0}]", SheetName), Con)

                Dim ds As New DataSet
                DA.Fill(ds)
                DA.Dispose()
                Con.Close()
                Con.Dispose()
                Using sw As StreamWriter = IO.File.CreateText(XLSFile + ".converted")
                    Dim i As Integer = 1
                    For Each column As DataColumn In ds.Tables(0).Columns
                        sw.Write("""" + column.ColumnName + """")
                        i += 1
                        If i <= ds.Tables(0).Columns.Count Then
                            sw.Write(",")
                        End If
                    Next
                    sw.WriteLine()
                    For Each row As DataRow In ds.Tables(0).Rows
                        i = 1
                        For Each column As DataColumn In ds.Tables(0).Columns
                            sw.Write("""" & Replace(IIf(row(i - 1) Is DBNull.Value, "", row(i - 1)), doubleQuote, "'") & """")
                            i += 1
                            If i <= ds.Tables(0).Columns.Count Then
                                sw.Write(",")
                            End If
                        Next
                        sw.WriteLine()
                    Next
                    sw.Close()
                End Using
                Return True
            Catch ex As Exception
                Return False
            End Try
        End Function

        Public Shared Function IsNull(ByVal obj As Object, ByVal def As Object) As Object
            If IsDBNull(obj) Then
                Return def
            ElseIf obj Is Nothing Then
                Return def
            Else
                Return obj
            End If
        End Function
    End Class

End Namespace