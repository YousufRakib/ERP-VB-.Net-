<%@ Page Language="VB" MasterPageFile="~/DashboardUsers.master" AutoEventWireup="false" CodeFile="404Error.aspx.vb" Inherits="ErrorPages_404Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="detail" runat="Server">
    <div id="error404" style="top: 50%; left: 50%; width: 30em; height: 18em; margin-top: -9em; /*set to a negative number 1/2 of your height*/
        margin-left: -15em; /*set to a negative number 1/2 of your width*/
        position: fixed; font-family: Verdana;">
        <table>
            <tr>
                <td>
                    <center>
                        <a style="font-size: 20px;">Server Inaccessible.</a>
                    </center>
                    <br />
                    <a style="font-size: 20px;">Please Try Again Later.</a>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
