
Partial Class PageCheckEmailStatusInMailJet
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            SalesOrder.CheckEmailStatusInMailJet()

        Catch ex As Exception
            ErrorLogs.LogException(ex, "Error in Page::PageCheckEmailStatusInMailJet")
        End Try
    End Sub
End Class
