Imports System.IO
Imports System.Data
Partial Class pages_PageOrder
    Inherits System.Web.UI.UserControl
    
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim UserFeatures As List(Of Feature) = Session("LoginUserFeatures")

        ChartVisibility.InnerText = ""
        For Each i In UserFeatures
            If i.Name.ToLower = "order statistics" Then
                ChartVisibility.InnerText = i.Value
            End If
            If i.Name.ToLower = "division" Then
                FilterDivision.InnerText = i.Value
            End If
        Next

        Dim LoginUserDetails As New User
        If (Not Session("LoginUserDetails") Is Nothing) Then
            LoginUserDetails = Session("LoginUserDetails")
            LoggedUserType.InnerText = LoginUserDetails.UserType.ToLower()
            DivForViewAllColumnsInInvnetory.InnerText = LoginUserDetails.ORDER
            LoggedInUserSalesman.InnerText = LoginUserDetails.SalesPerson
            LoggedInUserID.InnerText = LoginUserDetails.ID.ToString()
            If LoginUserDetails.UserType = "Customer" Then
                ChartVisibility.InnerText = False
                Try
                    LoggedInCustomerNo.InnerText = LoginUserDetails.CustomerNo
                Catch ex As Exception
                    LoggedInCustomerNo.InnerText = 0
                End Try


            End If
        End If

    End Sub

End Class
