<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageSetups.ascx.vb" Inherits="pages_PageSetups" %>

<script src="js/validation.js"></script>
<style>
    .Setups-button:after {
        content: '';
        display: block;
        clear: both;
    }

    .Setups-button .button {
        float: left;
        width: 135px;
        height: 30px;
        font-size: 12px;
        font-weight: bold;
    }

    .button:hover,
    .button:active,
    .button.is-checked {
        background-color: #0000ff;
        color: white;
    }

    .button.is-checked {
        color: white;
    }

    .Setups-button .admingrpbtn {
        float: left;
        width: 85px;
        height: 23px;
        font-size: 12px;
        font-weight: bold;
        margin-right: 1px;
        margin-top: 5px;
    }

    .admingrpbtn:hover,
    .admingrpbtn:active,
    .admingrpbtn.is-checked {
        background-color: red;
        color: white;
    }

    .admingrpbtn.is-checked {
        color: white;
    }

    input[type="radio"]:disabled label {
        color: darkgray;
    }

    #DialogCustomerMaintenanceSearch input[type=text], .filesTab input[type=text] {
        height: 17px;
    }

    #DialogCustomerMaintenanceSearch input[type=text], .filesTab input[type=text], .filesTab textarea, .filesTab select {
        background-color: cornsilk;
        font-weight: bold;
    }

    .searchplaceholder::-webkit-input-placeholder {
        color: black;
        opacity: 10;
        font-weight: bold;
    }

    ::-webkit-input-placeholder {
        color: black;
        opacity: 10;
        font-weight: 500;
        font-weight: bold;
    }

    ::-moz-placeholder {
        color: black;
        opacity: 10;
        font-weight: 500;
        font-weight: bold;
    }

    :-ms-input-placeholder {
        color: black;
        opacity: 10;
        font-weight: 500;
        font-weight: bold;
    }
    /* IE10+ */

    /*#DialogSetupsFile a:hover {
        color: #FF0000;
    }

    #DialogSetupsReports a:hover {
        color: #FF0000;
    }*/

    /*#DialogDutyTableMaintance a:hover{
        color: #FF0000;
    }*/

    .FileHover a:hover {
        color: #FF0000;
    }
</style>

<table>
    <tr>
        <td>
            <div class="Setups-button" id="DivHeaderBar" style="float: left;">
                <%--<input id="btnFilesTab" type="button" class="tabs tab-1 button" value="Files" style="">
                <input id="btnReportsTab" type="button" class="tabs tab-2 button" value="Reports" style="">
                <input id="btnAdminTab" type="button" class="tabs tab-3 button" value="Admin" style="">
                <input id="btnImportTab" type="button" class="tabs tab-4 button" value="Import" style="">--%>
            </div>

            <div class="Setups-button Admin tabcontent" id="DivAdminBar" style="float: left; /*margin-left: 16px; margin-top: 8px; */ display: none;">
                <input class="admingrpbtn" type="button" value="Admin" id="btnAdmin" />
                <input class="admingrpbtn" type="button" value="Email" id="btnEmail" />
                <input class="admingrpbtn" type="button" value="Logs" id="btnLogs" />
                <input class="admingrpbtn" type="button" value="ColorCode" id="btnColorCode" />
                <input class="admingrpbtn" type="button" value="ARXML" id="btnARXML" />
                <input class="admingrpbtn" type="button" value="Close" id="btnClose" />
            </div>
        </td>
    </tr>
</table>
<br />
<div id="DivImportPage" style="display: none;" class="detailcontent"></div>
<div id="DivAdminPage" style="display: none; margin-top: -15px;" class="detailcontent"></div>
<div id="DivEmailPage" style="display: none; margin-top: -15px;" class="detailcontent"></div>
<div id="DivLogsPage" style="display: none; margin-top: -15px;" class="detailcontent"></div>
<div id="DivColorCodePage" style="display: none; margin-top: -15px;" class="detailcontent"></div>
<div id="DivARXMLPage" style="display: none; margin-top: -15px;" class="detailcontent"></div>

<div id="DialogSetupsReports" style="display: none;" class="FileHover">
    <fieldset id="fsSetupsReports" style="font-size: 16px; font-weight: bold; /*height: 470px; */ border-width: 1px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbCustomerList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Customer Listing"  disabled="disabled">
                    <label for="rbCustomerList" style="color:darkgray;">Customer Listing</label>--%>
                    <a id="rbCustomerList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Customer Listing')">Customer Listing</a>

                    <img style='cursor: pointer; ' title='PDF report' id='' src='images/Excel.png' height="16" width="16" onclick="ARDialogSetupsReports('Customer Listing')" />
                 </td>
                <td style="padding-left: 40px; padding-right: 15px;" colspan="2">
                    <%--<input id="rbProdCatList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Product Categories Listing" >
                    <label for="rbProdCatList">Product Categories Listing</label>--%>
                    <a id="rbProdCatList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Product Categories Listing')">Product Categories Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Product Categories Listing')" />
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbProdCodeList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Product Code Listing" checked="checked">
                    <label for="rbProdCodeList">Product Code Listing</label>--%>
                    <a id="rbProdCodeList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Product Code Listing')">Product Code Listing</a>

                    <img style='cursor: pointer;' title='Excel report' id='' src='images/Excel.png' height="16" width="16" onclick="ARDialogSetupsReports('Product Code Listing')" />
                </td>
                <td style="padding-left: 40px; padding-right: 15px;" colspan="2">
                    <%--<input id="rbBrandsList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Brands Listing" >
                    <label for="rbBrandsList">Brands Listing</label>--%>
                    <a id="rbBrandsList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Brands Listing')">Brands Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Brands Listing')" />
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbFarmCodeList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Farm Code Listing" >
                    <label for="rbFarmCodeList">Farm Code Listing</label>--%>
                    <a id="rbFarmCodeList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Farm Code Listing')">Farm Code Listing</a>

                    <%--<img style='Cursor:pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Farm Code Listing')" />
                    <img style='Cursor:pointer;' title='PDF report' id='' src='images/Excel.png' onclick="ARDialogSetupsReports('Farm Code Listing')" />--%>
                </td>
                <td style="padding-left: 40px; padding-right: 15px;" colspan="2">
                    <%--<input id="rbOrderEntryList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Order Entry Changes">
                    <label for="rbOrderEntryList">Order Entry Changes</label>--%>
                    <a id="rbOrderEntryList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Order Entry Changes')">Order Entry Changes</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Order Entry Changes')" />
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbSalespersonList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Salesperson Listing">
                    <label for="rbSalespersonList">Salesperson Listing</label>--%>
                    <a id="rbSalespersonList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Salesperson Listing')">Salesperson Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Salesperson Listing')" />
                </td>
                <td style="padding-left: 40px; padding-right: 15px;" colspan="2">
                    <%--<input id="rbCrReasonList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Credits Reason Codes">
                    <label for="rbCrReasonList">Credits Reason Codes</label>--%>
                    <a id="rbCrReasonList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Credits Reason Codes')">Credits Reason Codes</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Credits Reason Codes')" />
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbCarrierCodeList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Carrier Codes Listing">
                    <label for="rbCarrierCodeList">Carrier Codes Listing</label>--%>
                    <a id="rbCarrierCodeList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Carrier Codes Listing')">Carrier Codes Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Carrier Codes Listing')" />
                </td>
                <td style="padding-left: 40px; padding-right: 15px;" colspan="2">
                    <%--<input id="rbCallHistoryList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Call History">
                    <label for="rbCallHistoryList">Call History</label>--%>
                    <a id="rbCallHistoryList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Call History')">Call History</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Call History')" />
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbAirportCodeList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Airport Codes Listing">
                    <label for="rbAirportCodeList">Airport Codes Listing</label>--%>
                    <a id="rbAirportCodeList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Airport Codes Listing')">Airport Codes Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Airport Codes Listing')" />
                </td>
                <td style="padding-left: 40px; padding-right: 15px;" colspan="2">
                    <%--<input id="rbPriceApprList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Price Approval Listing">
                    <label for="rbPriceApprList">Price Approval Listing</label>--%>
                    <a id="rbPriceApprList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Price Approval Listing')">Price Approval Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Price Approval Listing')" />
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbDutyTableList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Duty Table Listing">
                    <label for="rbDutyTableList">Duty Table Listing</label>--%>
                    <a id="rbDutyTableList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Duty Table Listing')">Duty Table Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Duty Table Listing')" />
                </td>
                <td style="padding-left: 40px; padding-right: 15px;" colspan="2">
                    <a id="rbCustSalesSummaryList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Customer Sales Summary')">Customer Sales Summary</a>

                    <img style='cursor: pointer;' title='Excel report' id='' src='images/Excel.png' height="16" width="16" onclick="ARDialogSetupsReports('Customer Sales Summary')" />
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbTaxTableList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Tax Table Listing">
                    <label for="rbTaxTableList">Tax Table Listing</label>--%>
                    <a id="rbTaxTableList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Tax Table Listing')">Tax Table Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Tax Table Listing')" />
                </td>
                <td style="padding-left: 40px; padding-right: 15px;" colspan="2">
                    <a id="rbSalesPersonSummaryList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Sales Person Summary')">Sales Person Summary</a>

                    <img style='cursor: pointer;' title='Excel report' id='' src='images/Excel.png' height="16" width="16" onclick="ARDialogSetupsReports('Sales Person Summary')" />
                </td>
            </tr>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbCrTermsList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Credit Terms Listing" >
                    <label for="rbCrTermsList">Credit Terms Listing</label>--%>
                    <a id="rbCrTermsList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Credit Terms Listing')">Credit Terms Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Credit Terms Listing')" />
                </td>
                <td colspan="2"></td>
            </tr>
            <tr style="height: 30px;">
                <td style="padding-right: 15px;" colspan="2">
                    <%--<input id="rbCustTypesList" class="rbSetupsReports" type="radio" style="margin-top: 8px;" name="SetupsReports" value="Customer Types Listing" >
                    <label for="rbCustTypesList">Customer Types Listing</label>--%>
                    <a id="rbCustTypesList" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsReports" onclick="ARDialogSetupsReports('Customer Types Listing')">Customer Types Listing</a>

                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" onclick="ARDialogSetupsReports('Customer Types Listing')" />
                </td>
                <td colspan="2"></td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogSetupsFile" style="display: none;" class="FileHover">
    <fieldset id="fsSetupsFile" style="font-size: 16px; font-weight: bold; /*height: 540px; */ border-width: 1px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 25px;">
                <td style="padding-right: 120px">
                    <a id="rbCustomer" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('CustomerPage')">1.- Customer</a>
                </td>
                <td>
                    <a id="rbWarehouses" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('WarehousePage')">J.- Warehouses</a>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbProdCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('FlowersPage')">2.- Product Codes</a>
                </td>
                <td>
                    <a id="rbWarehouseFreight" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('WarehouseFreightPage')">K.- Warehouse Freight</a>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbGrowerCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('FarmsPage')">3.- Farm Codes</a>
                </td>
                <td>
                    <a id="rbOrdStatusCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('OrderStatusPage')">L.- Order Status Codes</a>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbUsers" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('UsersPage')">4.- Users</a>
                </td>
                <td>
                    <a id="rbOrdTypes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('OrderTypesPage')">M.- Order Types</a>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbCarrierCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('CarrierPage')">5.- Carrier Codes</a>
                </td>
                <td>
                    <a id="rbFuelsOtherCharges" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('FuelPage')">N.- Fuels/Other Charges Menu</a>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbAirportCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('AirportPage')">6.- Airport Codes</a>
                </td>
                <td>
                    <a id="rbCreditCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('CreditCodes')">O.- Credit Codes</a>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbDutyTable" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('DutyTablePage')">7.- Duty Table</a>
                </td>
                <td>
                    <a id="rbEmails" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('Emails')">P.- Emails</a>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbCrTerms" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('CreditTermsPage')">8.- Payment Terms</a>
                </td>
                <td>
                    <a id="rbMessage" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('MsgMaintenancePage')">Q.- Message Maintenance</a>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbCustTypes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('CustTypesPage')">9.- Customer Types</a>
                </td>
                <td>
                    <a id="rbSalesMan" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('SalesManPage')">R.- Sales Persons</a>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbProdCat" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('ProdCatPage')">A.- Product Categories</a>
                </td>
                <td></td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbBoxSizes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('ProdDetailsPage')">B.- Box Sizes</a>
                </td>
                <td></td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbCountryCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('CountryCodesPage')">C.- Country Codes</a>
                </td>
                <td></td>
            </tr>
<%--            <tr style="height: 25px;">
                <td>
                    <a id="rbDivisionCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer; pointer-events: none; font-weight: initial;" name="SetupsFile">D.- Division Codes</a>
                </td>
                <td></td>
            </tr>--%>
            <%--<tr style="height:25px;">
                <td>
                    <a id="rbBuyerCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer; pointer-events: none;  font-weight: initial;" name="SetupsFile">E.- Buyer Codes</a>
                </td>
                <td></td>
            </tr>--%>
 <%--           <tr style="height: 25px;">
                <td>
                    <a id="rbHandCharges" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer; pointer-events: none; font-weight: initial;" name="SetupsFile">E.- Handling Charges</a>
                </td>
                <td></td>
            </tr>--%>
<%--            <tr style="height: 25px;">
                <td>
                    <a id="rbCurrencyCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer; pointer-events: none; font-weight: initial;" name="SetupsFile">F.- Currency Codes</a>
                </td>
                <td></td>
            </tr>--%>
            <tr style="height: 25px;">
                <td>
                    <a id="rbColors" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('Colors')">G.- Colors</a>
                </td>
                <td></td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbVarieties" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('Varieties')">H.- Varieties</a>
                </td>
                <td></td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <a id="rbGrade" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" name="SetupsFile" onclick="ARDialogSetupsFile('Grades')">I.- Grades</a>
                </td>
                <td></td>
            </tr>
            <%--<tr style="height:25px;">
                <td>
                    <a id="rbFloralStatCodes" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer; pointer-events: none;  font-weight: initial;" name="SetupsFile">S.- Floral Stat Codes</a>
                </td>
                <td></td>
            </tr>--%>
        </table>
    </fieldset>
</div>

<div id="DialogDateSelection" style="display: none;">
    <fieldset id="fsDateSelection" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtDateSelectionHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblRptDateFrom">From </label>
                </td>
                <td>
                    <input id="txtRptDateFrom" class="rbSetupsReport" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblRptDateTo">To </label>
                </td>
                <td>
                    <input id="txtRptDateTo" class="rbSetupsReport" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogFarmListOptions" style="display: none;">
    <fieldset id="fsFarmListOptions" style="font-size: 18px; font-weight: bold; height: 100px; border-width: 1px; margin-top: 5px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td>
                    <%--<input id="rbAllFarms" class="SetupsFarmReports" type="radio" style="margin-top: 8px;" name="SetupsFarmReports" value="All" checked="checked">
                    <label for="rbAllFarms">All Farms</label>--%>
                    <a id="rbAllFarms" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsFarmReports" data-value="All Farms" onclick="ARDialogSetupsFarmReports('All Farms')">All Farms</a>
                </td>
                <td>
                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" data-value="All Farms" onclick="ARDialogSetupsFarmReports('All Farms')" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <%--<input id="rbFarmsByOrgin" class="SetupsFarmReports" type="radio" style="margin-top: 8px;" value="Origin" name="SetupsFarmReports">
                    <label for="rbFarmsByOrgin">Farms By Origin</label>--%>
                    <a id="rbFarmsByOrgin" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsFarmReports" data-value="Origin" onclick="ARDialogSetupsFarmReports('Farms By Origin')">Farms By Origin</a>
                </td>
                <td>
                    <img style='cursor: pointer;' title='PDF report' id='' src='images/PDFicon.png' height="16" width="16" data-value="Origin" onclick="ARDialogSetupsFarmReports('Farms By Origin')" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td>
                    <%--<input id="rbFarmsWithSO" class="SetupsFarmReports" type="radio" style="margin-top: 8px;" value="SO" name="SetupsFarmReports">
                    <label for="rbFarmsWithSO">Farms with S/O</label>--%>
                    <a id="rbFarmsWithSO" class="rbSetupsReports" style="margin-top: 8px; cursor: pointer;" name="SetupsFarmReports" data-value="SO" onclick="ARDialogSetupsFarmReports('Farms with S/O')">Farms with S/O</a>
                </td>
                <td>
                    <img style='cursor: pointer;' title='PDF report' id='' src='images/Excel.png' height="16" width="16" data-value="SO" onclick="ARDialogSetupsFarmReports('Farms with S/O')" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogFarmsByOrgin" style="display: none;">
    <fieldset id="fsFarmsByOrgin" style="font-size: 18px; font-weight: bold; height: 40px; border-width: 1px; margin-top: 10px; margin-bottom: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 20px;">
                    <label id="lblFarmsOrgin">Enter Airport of Orgin</label>
                </td>
                <td>
                    <input id="txtFarmsOrgin" class="rbARReports" type="text" style="margin-top: 3px; width: 40px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>


<div id="DialogCustomerMaintenanceSearch" style="display: none; margin-top: 20px;">
    <table>
        <tr>
            <td>
                <label>Customer# / Name : </label>
            </td>
            <td>
                <input type="text" id="txtCustMaintenanceSearch" style="width: 300px;" maxlength="25" class="AllUpperCaseTextBox" />
            </td>
            <td>
                <input id="btnAddNewCustMaintenance" type="button" class="BloomButtonEnabled" value="NEW" style="margin-left: 5px; width: 55px;">
            </td>
        </tr>
    </table>
</div>

<div id="DialogDutyTableMaintance" class="FileHover" style="display: none;">
    <fieldset id="fsDutyTableMaintance" style="font-size: 18px; font-weight: bold; height: 40px; border-width: 1px; margin-top: 10px; margin-bottom: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table style="font-size: 16px; font-weight: bold; /*height: 540px; */ border-width: 1px; border-radius: 5px;">
            <tr>
                <td style="padding: 3px;">
                    <a id="rbCustomerDuties" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" data-customerduties="CustomerDuties" name="SetupsFile" onclick="ARDialogSetupsFile('CustomerDuties')">1.- Customer Duties</a>
                </td>
            </tr>
            <tr>
                <td style="padding: 3px;">
                    <a id="rbPurchaseDuties" class="rbSetupsFile" style="margin-top: 8px; cursor: pointer;" data-purchaseduties="PurchaseDuties" name="SetupsFile" onclick="ARDialogSetupsFile('PurchaseDuties')">2.- Purchase Duties</a>
                </td>
            </tr>
        </table>
    </fieldset>
</div>


<div id="DivCustomerPage" style="display: none;" class="detailcontent filesTab"></div>
<%--<div id="DivFlowersPage" style="display:none;" class="detailcontent filesTab"></div>--%>
<%--<div id="DivFarmsPage" style="display:none;" class="detailcontent filesTab"></div>--%>
<div id="DivUsersPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivCarrierPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivWarehousePage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivCreditTermsPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivWarehouseFreightPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivAirportPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivCustTypesPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivCreditCodePage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivEmailsPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivCountryCodesPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivOrderStatusPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivFuelPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivProdCatPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivProdDetailsPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivColorsPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivVarietiesPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivGradesPage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivDutyTablePage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivSalesManCodePage" style="display: none;" class="detailcontent filesTab"></div>
<div id="DivMsgMaintenancePage" style="display: none;" class="detailcontent filesTab"></div>
<%--OrderTypes--%>
<div id="DivOrderTypesPage" style="display: none;" class="detailcontent filesTab"></div>

<div id="msgbox-SetupsReports" style="display: none;">
    <p id="msghtml-SetupsReports" style="font-size: 15px; font-weight: bold;"></p>
</div>

<div id="LoggedInUserType" runat="server" style="display: none"></div>
<div id="LoggedInUserID" runat="server" style="display: none"></div>

<div id="LoggedInIsSetupsFile" runat="server" style="display: none"></div>
<div id="LoggedInIsSetupsReports" runat="server" style="display: none"></div>
<div id="LoggedInIsSetupsAdmin" runat="server" style="display: none"></div>
<div id="LoggedInIsSetupsImport" runat="server" style="display: none"></div>


<div id="msgbox-CustDetailsWarning" style="display: none;">
    <p id="msghtml-CustDetailsWarning" style="font-size: 12.5px; font-weight: bold;"></p>
</div>

<script>
    $(document).ready(function () {


        if ($("#ctl00_LoggedInUserType").html() == "employee") {
            $("#rbCustomer").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbGrowerCodes").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbUsers").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbCarrierCodes").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbAirportCodes").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbDutyTable").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbCrTerms").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbCustTypes").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbProdCat").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbBoxSizes").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbCountryCodes").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            //$("#rbColors").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            //$("#rbVarieties").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            //$("#rbGrade").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbWarehouses").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbOrdStatusCodes").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbFuelsOtherCharges").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbCreditCodes").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbEmails").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
            $("#rbMessage").css({ 'pointer-events': 'none', 'font-weight': 'initial' });
        }
    });
    var IsImportPageLoaded = false;
    var IsAdminPageLoaded = false;
    var IsEmailPageLoaded = false;
    var IsLogsPageLoaded = false;
    var IsColorCodePageLoaded = false;
    var IsARXMLPageLoaded = false;

    var SetupsSessionFromDate = new Date();
    var SetupsSessionToDate = new Date();

    var IsUsersPageLoaded = false;
    var IsCustomerPageLoaded = false;
    var IsFlowersPageLoaded = false;
    var IsFarmsPageLoaded = false;
    var IsWarehousePageLoaded = false;
	var IsWarehouseFreightPageLoaded = false;
    var IsCarrierPageLoaded = false;
    var IsCreditTermsPageLoaded = false;
    var IsAirportPageLoaded = false;

    var IsCustTypesPageLoaded = false;
    var IsCreditCodePageLoaded = false;
    var IsEmailPageLoaded = false;
    var IsCountryCodesPageLoaded = false;
    var IsOrderStatusPageLoaded = false;
    var IsFuelPageLoaded = false;
    var IsProdCatPageLoaded = false;
    var IsProdDetailsPageLoaded = false;
    var IsColorsPageLoaded = false;
    var IsVarietiesPageLoaded = false;
    var IsGradesPageLoaded = false;
    var IsDutyTablePageLoaded = false;
    var IsSalesManCodeLoaded = false;
    var IsMsgMaintenancePageLoaded = false;

    var IsCustomerPageLoadedFirst = false;

    var IsOrderTypesPageLoaded = false; //OrderTypes

    var pageName = "";

    $(document).ready(new function () {
        $("#txtRptDateFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtRptDateTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());
        debugger;
        $("#DivHeaderBar").html("");
        if ($("#ctl00_LoggedInIsSetupsFile").html() == "True") {
            $("#DivHeaderBar").append("<input id='btnFilesTab' type='button' class='tabs tab-1 button' value='Files' style=''>");
        }
        if ($("#ctl00_LoggedInIsSetupsReports").html() == "True") {
            $("#DivHeaderBar").append("<input id='btnReportsTab' type='button' class='tabs tab-2 button' value='Reports' style=''>");
        }
        if ($("#ctl00_LoggedInIsSetupsAdmin").html() == "True") {
            $("#DivHeaderBar").append("<input id='btnAdminTab' type='button' class='tabs tab-3 button' value='Admin' style=''>");
        }
        if ($("#ctl00_LoggedInIsSetupsImport").html() == "True") {
            $("#DivHeaderBar").append("<input id='btnImportTab' type='button' class='tabs tab-4 button' value='Import' style=''>");
        }
    });

    $(".tabs").die('click').live("click", function (e) {
        debugger
        $(".tabs").css('background', '#dddddd')
        $(".tabs").css('color', 'black');
        $(this).css('background', '#0000ff')
        $(this).css('color', 'white');
        /*var checkedBtnval = $("#DivHeaderBar").find(".is-checked")[0].value;
        HeaderSelection(checkedBtnval);*/

    });

    $(".tab-1").die('click').live("click", function (e) {
        debugger;
        $(".tabcontent").hide();
        $(".detailcontent").hide();
        $("#DialogSetupsFile").dialog("open")
    });

    $("#DialogSetupsFile").dialog({
        autoOpen: false,
        resizable: false,
        width: 600,
        modal: true,
        title: 'Files Maintenance',
        buttons: {
            Close: function () {
                $("#DialogSetupsFile").dialog("close");
            }
        },
        open: function () {
            //$("#rbProdCodes").attr("checked", "checked");
            $("#DialogSetupsFile").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
        beforeClose: function (event, ui) {
            if ($("#msgbox-CustDetailsWarning").dialog('isOpen')) {
                return false;
            }
        }
    });


    function ARDialogSetupsFile(FileName) {
        //var FileID = $("input[name='SetupsFile']:checked").attr("id");
        //pageName = $("input[name='SetupsFile']:checked").val();
        $(".detailcontent").hide();
        $(document).unbind('keydown');
        $(".trSelectedHeader").removeClass("trSelectedHeader");
        debugger;
        switch (FileName) {
            case "CustomerPage":
                if (IsCustomerPageLoaded == false) {
                    OpenCustomerPage();
                }
                else {
                    //$("#fgrCustomer").flexReload({ url: '/url/for/refresh' });
                    $("#DialogCustomerMaintenanceSearch").dialog("open");
                }
                break;
            case "FlowersPage":
                //if (IsFlowersPageLoaded == false) {
                //    OpenFlowersPage();
                //}
                //else {
                //    $("#lstFlowerCatForFilter").val("00");
                //    $("#lstFlowerColorForFilter").val("00");
                //    $("#lstFlowerVareityForFilter").val("00");
                //    $("#lstFlowerGradeForFilter").val("00");
                //    LoadGrades("", "");
                //    LoadVariety("", "");
                //    framingfilters();
                //    $("#fgrdFlowers").flexOptions({ query: "", newp: 1 }).flexReload();
                //    $("#DivFlowersPage .sDiv2 input.qsbox").val("");
                //    $("#DivFlowersPage").dialog("open");
                //}
                OpenFlowersPage();
                break;
            case "FarmsPage":
                //if (IsFarmsPageLoaded == false) {
                //    OpenFarmsPage();
                //}
                //else {
                //    $("#fgrdFarms").flexOptions({ query: "", newp: 1 }).flexReload();
                //    $("#DivFarmsPage .sDiv2 input.qsbox").val("");
                //    $("#DivFarmsPage").dialog("open");
                //}
                OpenFarmsPage();
                break;
            case "UsersPage":
                if (IsUsersPageLoaded == false) {
                    OpenUsersPage();
                }
                else {
                    $("#fgrdUsers").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivUsersPage .sDiv2 input.qsbox").val("");
                    $("#DivUsersPage").dialog("open");
                }
                break;
            case "CarrierPage":
                if (IsCarrierPageLoaded == false) {
                    OpenCarrierPage();
                }
                else {
                    $("#fgrdCarrier").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivCarrierPage .sDiv2 input.qsbox").val("");
                    $("#DivCarrierPage").dialog("open");
                }
                break;
            case "WarehousePage":
                if (IsWarehousePageLoaded == false) {
                    OpenWarehousePage();
                }
                else {
                    $("#fgrdWarehouse").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivWarehousePage .sDiv2 input.qsbox").val("");
                    $("#DivWarehousePage").dialog("open");
                }
                break;
			case "WarehouseFreightPage":
                if (IsWarehouseFreightPageLoaded  == false) {
                    OpenWarehouseFreightPage();
                }
                else {
                    $("#fgrdWarehouseFreight").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivWarehouseFreightPage .sDiv2 input.qsbox").val("");
                    $("#DivWarehouseFreightPage").dialog("open");
                }
                break;	
            case "CreditTermsPage":
                if (IsCreditTermsPageLoaded == false) {
                    OpenCreditTermsPage();

					}
                else {
                    $("#fgrdCreditTerms").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivCreditTermsPage .sDiv2 input.qsbox").val("");
                    $("#DivCreditTermsPage").dialog("open");
                }
                break;
            case "AirportPage":
                /* alert("IsAirportPageLoaded :- " + IsAirportPageLoaded);*/
                if (IsAirportPageLoaded == false) {
                    OpenAirportPage();
                }
                else {
                    $("#fgrdAirport").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivAirportPage .sDiv2 input.qsbox").val("");
                    $("#DivAirportPage").dialog("open");
                }
                break;
            case "CustTypesPage":
                if (IsCustTypesPageLoaded == false) {
                    OpenCustTypesPage();
                }
                else {
                    $("#fgrdCustTypes").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivCustTypesPage .sDiv2 input.qsbox").val("");
                    $("#DivCustTypesPage").dialog("open");
                }
                break;
            case "CreditCodes":
                if (IsCreditCodePageLoaded == false) {
                    OpenCreditCodePage();
                }
                else {
                    $("#fgrdCreditCode").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivCreditCodePage .sDiv2 input.qsbox").val("");
                    $("#DivCreditCodePage").dialog("open");
                }
                break;
            case "Emails":
                if (IsEmailPageLoaded == false) {
                    OpenEmailsPage();
                }
                else {
                    $("#fgrdEmails").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivEmailsPage .sDiv2 input.qsbox").val("");
                    $("#DivEmailsPage").dialog("open");
                }
                break;
            case "CountryCodesPage":
                if (IsCountryCodesPageLoaded == false) {
                    OpenCountryCodesPage();
                }
                else {
                    $("#fgrdCountryCodes").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivCountryCodesPage .sDiv2 input.qsbox").val("");
                    $("#DivCountryCodesPage").dialog("open");
                }
                break;
            case "OrderStatusPage":
                if (IsOrderStatusPageLoaded == false) {
                    OpenOrderStatusPage();
                }
                else {
                    $("#fgrdOrderStatus").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivOrderStatusPage .sDiv2 input.qsbox").val("");
                    $("#DivOrderStatusPage").dialog("open");
                }
                break;
            case "FuelPage":
                if (IsFuelPageLoaded == false) {
                    OpenFuelPage();
                }
                else {
                    $("#fgrdFuelByBox").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivFuelPage .sDiv2 input.qsbox").val("");
                    $("#DivFuelPage").dialog("open");
                }
                break;
            case "ProdCatPage":
                if (IsProdCatPageLoaded == false) {
                    OpenProdCatPage();
                }
                else {
                    $("#fgrdProdcat").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivProdCatPage .sDiv2 input.qsbox").val("");
                    $("#DivProdCatPage").dialog("open");
                }
                break;
            case "ProdDetailsPage":
                if (IsProdDetailsPageLoaded == false) {
                    OpenProdDetailsPage();
                }
                else {
                    $("#fgrdProdDetails").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivProdDetailsPage .sDiv2 input.qsbox").val("");
                    $("#DivProdDetailsPage").dialog("open");
                }
                break
            case "Colors":
                if (IsColorsPageLoaded == false) {
                    OpenColorsPage();
                }
                else {
                    $("#fgrdColors").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivColorsPage .sDiv2 input.qsbox").val("");
                    $("#DivColorsPage").dialog("open");
                }
                break
            case "Varieties":
                if (IsVarietiesPageLoaded == false) {
                    OpenVarietiesPage();
                }
                else {
                    $("#fgrdVarieties").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivVarietiesPage .sDiv2 input.qsbox").val("");
                    $("#DivVarietiesPage").dialog("open");
                }
                break
            case "Grades":
                if (IsGradesPageLoaded == false) {
                    OpenGradesPage();
                }
                else {
                    $("#fgrdGrades").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivGradesPage .sDiv2 input.qsbox").val("");
                    $("#DivGradesPage").dialog("open");
                }
                break
            case "DutyTablePage":
                if (IsDutyTablePageLoaded == false) {
                    OpenDutyTablePage();
                }
                else {
                    //$("#fgrdDuty").flexReload({ url: '/url/for/refresh' });
                    //$("#DivDutyTablePage").dialog("open");
                    $("#DialogDutyTableMaintance").dialog("open");
                }
                break
            case "SalesManPage":
                if (IsSalesManCodeLoaded == false) {
                    OpenSalesManPage();
                }
                else {
                    $("#fgrdSalesman").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivSalesManCodePage .sDiv2 input.qsbox").val("");
                    $("#DivSalesManCodePage").dialog("open");
                }
                break
            case "CustomerDuties":
            case "PurchaseDuties":
                OpenDutyPage(FileName);
                break
            case "MsgMaintenancePage":
                debugger;
                if (IsMsgMaintenancePageLoaded == false) {
                    OpenMsgMaintenancePage();
                }
                else {
                    $("#fgrdMsgMaintenance").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivMsgMaintenancePage .sDiv2 input.qsbox").val("");
                    $("#DivMsgMaintenancePage").dialog("open");
                }
                break
            case "OrderTypesPage":
                if (IsOrderTypesPageLoaded == false) {
                    OpenOrderTypesPage();
                }
                else {
                    $("#fgrdOrderTypes").flexOptions({ query: "", newp: 1 }).flexReload();
                    $("#DivOrderTypesPage .sDiv2 input.qsbox").val("");
                    $("#DivOrderTypesPage").dialog("open");
                }
                break;
        }
    }

    /*Focus next button when users change the files option :: 05Feb2018 :: ABI*/
    $("input[name=SetupsFile]").on("click", function () {
        debugger;
        $("#DialogSetupsFile").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
    });

    function OpenCustomerPage() {
        IsCustomerPageLoaded = true;
        $("#DialogCustomerMaintenanceSearch").dialog("open");
        $(".qsbox").blur();
    }

    $("#DialogCustomerMaintenanceSearch").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 550,
        title: "Customer Search",
        open: function () {
            $(this).focus();
            $("#txtCustMaintenanceSearch").val("");
        },
        close: function () {
            IsCustomerPageLoaded = false;
            $("#DialogSetupsFile").focus();
        },
        beforeClose: function (event, ui) {
            if ($("#msgbox-CustDetailsWarning").dialog('isOpen')) {
                return false;
            }
        }
    });

    $("#DivCustomerPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 970,
        //height: $(window).height() - 50,
        title: "Customer Details",
        close: function () {
            $("#txtCustMaintenanceSearch").val("");
            $("#DialogSetupsFile").focus();
        }
    });

    function OpenFlowersPage() {
        //IsFlowersPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageFlowers.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                //$("#DivFlowersPage").show();
                //$("#DivFlowersPage").html(output.d).dialog("open");                
                $('<div id="DivFlowersPage" class="detailcontent filesTab">' +
                  +'</div>').dialog(
                  {
                      title: 'Flowers Details',
                      autoOpen: false,
                      resizable: false,
                      modal: true,
                      width: 1110,
                      height: $(window).height() - 50,
                      close: function (event, ui) {
                          $(this).dialog('destroy').remove();
                      }
                  });
                $("#DivFlowersPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    //$("#DivFlowersPage").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    modal: true,
    //    width: 1110,
    //    height:$(window).height()-50,
    //    title: "Flowers Details",
    //    close: function () {
    //        debugger
    //        $("#DialogSetupsFile").focus();

    //    }
    //});

    function OpenFarmsPage() {
        debugger;
        //IsFamrsPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageFarms.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                //$("#DivFarmsPage").show();
                //$("#DivFarmsPage").html(output.d).dialog("open");
                $('<div id="DivFarmsPage" class="detailcontent filesTab">' +
             +'</div>').dialog({
                 title: 'Farms Details',
                 autoOpen: false,
                 resizable: false,
                 modal: true,
                 width: 1110,
                 height: $(window).height() - 50,
                 close: function (event, ui) {
                     $(document).unbind('keydown');
                     $(this).dialog('destroy').remove();
                 },
                 open: function () {
                     $(document).die('keydown').live('keydown', function (e) {

                         if ($("div[aria-labelledby='ui-dialog-title-DivFarmsPage']").css("display") != "none") {
                             if ($("div[aria-labelledby='ui-dialog-title-DivFarms']").css("display") == "none") {
                                 if ((e.which == 65 || e.which == 97)) {
                                     addFarmclicked();
                                     e.preventDefault();
                                     return false;
                                 }
                                 if (e.which == 13) {
                                     $(".trSelectedHeader").find("td").eq(2).click();
                                     $(".trSelectedHeader").find("td").eq(2).find("div").eq(0).click();
                                     $(".trSelectedHeader").find("td").eq(2).find("div").eq(0).find("img").eq(0).click();
                                     e.preventDefault();
                                     return false;
                                 }
                                 if ((e.which == 38)) {
                                     var row = $(".trSelectedHeader");
                                     var prevrow = row.prev();
                                     if (prevrow.length > 0) {
                                         $(prevrow).addClass("trSelectedHeader");
                                         $(row).removeClass("trSelectedHeader");
                                     }
                                     e.preventDefault();
                                     return false;
                                 }
                                 if ((e.which == 40)) {
                                     var row = $(".trSelectedHeader");
                                     var nextrow = row.next();
                                     if (nextrow.length > 0) {
                                         $(nextrow).addClass("trSelectedHeader");
                                         $(row).removeClass("trSelectedHeader");
                                     }
                                     e.preventDefault();
                                     return false;
                                 }
                             }
                         }
                     });
                 }
             });
                $("#DivFarmsPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    //$("#DivFarmsPage").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    modal: true,
    //    width: 1090,
    //    height: $(window).height() - 50,
    //    title: "Farms Details",
    //    close: function () {
    //        $("#DialogSetupsFile").focus();
    //    }
    //});

    function OpenUsersPage() {
        debugger;
        IsUsersPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageUsers.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivUsersPage").show();
                $("#DivUsersPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivUsersPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: $(window).width() - 100,
        height: $(window).height() - 50,
        title: "User Information",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivUsersPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-DivUser']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            addUserclicked();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenCarrierPage() {
        debugger;
        IsCarrierPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCarrier.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivCarrierPage").show();
                $("#DivCarrierPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivCarrierPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Carrier Details",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {

            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivCarrierPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditCarrier']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            addclicked();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(2).click();
                            $(".trSelectedHeader").find("td").eq(2).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(2).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenWarehousePage() {
        debugger;
        IsWarehousePageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageWarehouse.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivWarehousePage").show();
                $("#DivWarehousePage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivWarehousePage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Warehouse Details",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivWarehousePage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditWarehouse']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddWareHouse();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });
	
	function OpenWarehouseFreightPage() {
        debugger;
        IsWarehouseFreightPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageWarehouseFreight.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivWarehouseFreightPage").show();
                $("#DivWarehouseFreightPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivWarehouseFreightPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Warehouse Freight Details",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivWarehouseFreightPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditWarehouseFreight']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            addclicked();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenCreditTermsPage() {
        debugger;
        IsCreditTermsPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCreditTerms.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivCreditTermsPage").show();
                $("#DivCreditTermsPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivCreditTermsPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Payment Terms Maintenance",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivCreditTermsPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditCreditTerms']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewTerms();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenAirportPage() {
        debugger;
        IsAirportPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageAirport.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivAirportPage").show();
                $("#DivAirportPage").html(output.d).dialog("open");
                //$("input[name=q]").blur();
                $(".qsbox").blur();
            }
        });
    }

    $("#DivAirportPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Airport Maintenance",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {
                if ($("div[aria-labelledby='ui-dialog-title-DivAirportPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditAirport']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            addAirportclicked();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            debugger;
                            var row = $(".trSelectedHeader");
                            var prevrow = "";
                            prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = "";
                            nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenCustTypesPage() {
        debugger;
        IsCustTypesPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCustTypes.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivCustTypesPage").show();
                $("#DivCustTypesPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivCustTypesPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Customer Types Maintenance",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {
                if ($("div[aria-labelledby='ui-dialog-title-DivCustTypesPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditCustTypes']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewCustTypes();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenCreditCodePage() {
        debugger;
        IsCreditCodePageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCreditCode.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivCreditCodePage").show();
                $("#DivCreditCodePage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }
    $("#DivCreditCodePage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Credit Code",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {

            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivCreditCodePage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditCreditCode']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewCreditCode();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenEmailsPage() {
        debugger;
        IsEmailPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageEmails.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivEmailsPage").show();
                $("#DivEmailsPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }
    $("#DivEmailsPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Emails",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {

            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivEmailsPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditEmails']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewEmail();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });


    function OpenCountryCodesPage() {
        debugger;
        IsCountryCodesPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCountry.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivCountryCodesPage").show();
                $("#DivCountryCodesPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivCountryCodesPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Country File Maintenance",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {

            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivCountryCodesPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditCountryCodes']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewCountryCodes();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenOrderStatusPage() {
        IsOrderStatusPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageOrderStatus.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivOrderStatusPage").show();
                $("#DivOrderStatusPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivOrderStatusPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Status Codes Definition Table",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {
                if ($("div[aria-labelledby='ui-dialog-title-DivOrderStatusPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditOrderStatus']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewOrderStatus();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenFuelPage() {
        debugger;
        IsFuelPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageFuel.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivFuelPage").show();
                $("#DivFuelPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivFuelPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Fuel by Box Type",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivFuelPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditFuelByBox']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewFuelByBox();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenProdCatPage() {
        debugger;
        IsProdCatPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageProdCategories.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivProdCatPage").show();
                $("#DivProdCatPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivProdCatPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Product Categories Maintenance",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivProdCatPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditProdCat']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewProdCat();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenProdDetailsPage() {
        debugger;
        IsProdDetailsPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageProdDetails.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivProdDetailsPage").show();
                $("#DivProdDetailsPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivProdDetailsPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Box Size Maintenance",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivProdDetailsPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditProdDetails']").css("display") == "none") {
                        if (!$(".qsbox").is(":focus")) {
                            if ((e.which == 65 || e.which == 97)) {
                                AddNewProdDetails();
                                e.preventDefault();
                                return false;
                            }
                        }                        
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenColorsPage() {
        debugger;
        IsColorsPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageColors.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivColorsPage").show();
                $("#DivColorsPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivColorsPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Colors",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivColorsPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditColors']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewColors();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenVarietiesPage() {
        debugger;
        IsVarietiesPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageVarieties.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivVarietiesPage").show();
                $("#DivVarietiesPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivVarietiesPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Varieties",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivVarietiesPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditVarieties']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewVarieties();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });


    function OpenGradesPage() {
        debugger;
        IsGradesPageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageGrades.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivGradesPage").show();
                $("#DivGradesPage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }

    $("#DivGradesPage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 60,
        title: "Grades",
        close: function () {
            $(document).unbind('keydown');
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivGradesPage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditGrades']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            AddNewGrades();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });

    function OpenDutyTablePage() {
        IsDutyTablePageLoaded = true;
        $("#DialogDutyTableMaintance").dialog("open");
    }

    $("#DialogDutyTableMaintance").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 350,
        title: "DUTY TABLES",
        open: function () {
            $(this).focus();
        },
        close: function () {
            $("#DialogSetupsFile").focus();
        },
        beforeClose: function (event, ui) {
            if ($("#msgbox-CustDetailsWarning").dialog('isOpen')) {
                return false;
            }
        }
    });

    function OpenDutyPage(Param) {
        debugger;
        var Para = "DutyTable=" + Param;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageDuty.ascx","controlPara":"' + Para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivDutyTablePage").show();
                $("#DivDutyTablePage").html(output.d).dialog("open");
            }
        });
    }

    $("#DivDutyTablePage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 550,
        height: $(window).height() - 30,
        title: "Duty Table Maintance",
        close: function () {
            $("#DialogSetupsFile").focus();
        }
    });
    function OpenSalesManPage() {
        debugger;
        IsSalesManCodeLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageSalesManCode.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivSalesManCodePage").show();
                $("#DivSalesManCodePage").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    }
    $("#DivSalesManCodePage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 580,
        height: $(window).height() - 160,
        title: "Sales Person Details",
        close: function () {
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $(document).die('keydown').live('keydown', function (e) {

                if ($("div[aria-labelledby='ui-dialog-title-DivSalesManCodePage']").css("display") != "none") {
                    if ($("div[aria-labelledby='ui-dialog-title-EditSalesman']").css("display") == "none") {
                        if ((e.which == 65 || e.which == 97)) {
                            addclicked();
                            e.preventDefault();
                            return false;
                        }
                        if (e.which == 13) {
                            $(".trSelectedHeader").find("td").eq(1).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                            $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 38)) {
                            var row = $(".trSelectedHeader");
                            var prevrow = row.prev();
                            if (prevrow.length > 0) {
                                $(prevrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                        if ((e.which == 40)) {
                            var row = $(".trSelectedHeader");
                            var nextrow = row.next();
                            if (nextrow.length > 0) {
                                $(nextrow).addClass("trSelectedHeader");
                                $(row).removeClass("trSelectedHeader");
                            }
                            e.preventDefault();
                            return false;
                        }
                    }
                }
            });
        }
    });
    /*Message Maintenance Page :: by Abinaya :: 04Feb2019*/
    function OpenMsgMaintenancePage() {
        debugger;
        IsMsgMaintenancePageLoaded = true;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageMsgMaintenance.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivMsgMaintenancePage").show();
                $("#DivMsgMaintenancePage").html(output.d).dialog("open");
            }
        });
    }

    $("#DivMsgMaintenancePage").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 350,
        height: 220,
        title: "Message Maintenance",
        buttons: {
            Next: function () {
                var MessageType = ($("input[name='MsgMaintenance']:checked").attr("id") == "rbInvoiceMsg") ? "InvoiceMsg" : "StatementMsg"
                openMessageType(MessageType);
            },
            Close: function () {
                $("#DivMsgMaintenancePage").dialog("close");
            }
        },
        close: function () {
            $("#DialogSetupsFile").focus();
        },
        open: function () {
            $("#DivMsgMaintenancePage").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });



    $(".tab-2").die('click').live("click", function (e) {
        debugger;
        $(".tabcontent").hide();
        $(".detailcontent").hide();
        $("#DialogSetupsReports").dialog("open");
    });

    $("#DialogSetupsReports").dialog({
        autoOpen: false,
        resizable: false,
        width: 650,
        modal: true,
        title: 'Files Report',
        buttons: {
            Close: function () {
                $("#DialogSetupsReports").dialog("close");
            }
        },
        open: function () {
            $("#DialogSetupsReports").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    //var ReportName = $("input[name='SetupsReports']:checked").attr("value");



    function ARDialogSetupsReports(ReportName) {
        debugger;
        if (ReportName == "Call History" || ReportName == "Price Approval Listing") {
            $("#DialogDateSelection").dialog('option', 'title', ReportName + " Date Range");
            $("#DialogDateSelection").dialog("open").data("ReportName", ReportName);
        }
        else if (ReportName == 'Farm Code Listing')
            $("#DialogFarmListOptions").dialog("open").data("ReportName", ReportName);
        else {
            //$("#msghtml-SetupsReports").html("Do you want to print " + ReportName + " report?")
            //$("#msgbox-SetupsReports").dialog('option', 'title', ReportName);
            //$("#msgbox-SetupsReports").dialog("open").data("ReportName", ReportName);

            /*Don't show message boxes :: generate the report directly*/

            if (ReportName == 'Product Code Listing')
                PrintProductsToExcel();
            else if (ReportName == 'Customer Listing')
                PrintCustomerListingToExcel();

            else if (ReportName == 'Customer Sales Summary')
                PrintSalesSummaryToExcel("CustomerSummary");
            else if (ReportName == "Sales Person Summary")
                PrintSalesSummaryToExcel("SalesPersonSummary");
            else if (ReportName == 'Farm Code Listing')
                PrintSetupsReport(ReportName, '', '', "ALL")
            else
                PrintSetupsReport(ReportName, '', '', '')
        }
    }

    /*Focus next button when users change the reports option :: 05Feb2018 :: ABI*/
    $("input[name=SetupsReports]").on("click", function () {
        debugger;
        $("#DialogSetupsReports").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
    });

    /* Alert Box :: Yes/No options for reports printing. */
    $("#msgbox-SetupsReports").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 450,
        buttons: {
            Yes: function () {
                debugger;
                var ReportName = $("#msgbox-SetupsReports").data("ReportName");

                if (ReportName == 'Product Code Listing')
                    PrintProductsToExcel();
                else if (ReportName == 'Farm Code Listing')
                    PrintSetupsReport(ReportName, '', '', "ALL")
                else
                    PrintSetupsReport(ReportName, '', '', '')
            },
            No: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
        }
    });

    /* Alert Box :: select Date range for reports printing. */
    $("#DialogDateSelection").dialog({
        autoOpen: false,
        resizable: false,
        width: 300,
        height: 220,
        modal: true,
        buttons: {
            Ok: function () {
                debugger;
                var ReportName = $("#DialogDateSelection").data("ReportName");
                SetupsSessionFromDate = $("#txtRptDateFrom").val();
                SetupsSessionToDate = $("#txtRptDateTo").val();
                PrintSetupsReport(ReportName, SetupsSessionFromDate, SetupsSessionToDate, '');
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
        }
    });

    /*Focus next button when users change the Farms listing reports option*/
    $("input[name=SetupsFarmReports]").on("click", function () {
        debugger;
        $("#DialogFarmListOptions").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
    });

    /*Farm Listing Options*/
    $("#DialogFarmListOptions").dialog({
        autoOpen: false,
        resizable: false,
        width: 350,
        modal: true,
        title: 'Farms Listing',
        buttons: {
            Close: function () {
                $("#DialogFarmListOptions").dialog("close");
            }
        },
        open: function () {
            $("#DialogFarmListOptions").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    function ARDialogSetupsFarmReports(ReportName) {
        debugger;
        //var Airport = $("input[name='SetupsFarmReports']:checked").attr("value");
        if (ReportName == "All Farms") {
            PrintSetupsReport(ReportName, '', '', "ALL")
        }
            /* Farms with S/O(Standing Order) :: Export to Excel option :: 05Apr2018 :: ABI*/
        else if (ReportName == "Farms with S/O") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/PrintSOToExcel',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    debugger;
                    if (output.d == "LogOut") {
                        window.location.href = "Login.aspx";
                    }
                    else if (output.d.indexOf("error") >= 0) {
                        $("#msgbox-select").dialog("close");
                        $.MessageBox(output.d.substring(5, output.d.length));
                    }
                    else if (output.d == "No Data") {
                        $.MessageBox("No data selected!");
                        w.close();
                    }
                    else {
                        debugger;
                        path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                        window.open(path);
                    }

                }
            });
}
else {
    $("#DialogFarmsByOrgin").dialog("open").data("ReportName", ReportName);
}
}

/*Farm Listing Options By Orgin*/
$("#DialogFarmsByOrgin").dialog({
    autoOpen: false,
    resizable: false,
    width: 350,
    modal: true,
    title: 'Farms Listing By Orgin',
    buttons: {
        Print: function () {
            debugger;
            var ReportName = $("#DialogFarmsByOrgin").data("ReportName");
            var Airport = $("#txtFarmsOrgin").val().trim();
            PrintSetupsReport(ReportName, '', '', Airport)
        },
        Close: function () {
            $("#DialogFarmsByOrgin").dialog("close");
        }
    },
    open: function () {
        $("#txtFarmsOrgin").focus();
        $("#txtFarmsOrgin").val("");
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    },
});

function PrintProductsToExcel() {
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintProductsToExcel',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            debugger;
            if (output.d == "LogOut") {
                window.location.href = "Login.aspx";
            }
            else if (output.d.indexOf("error") >= 0) {
                $("#msgbox-select").dialog("close");
                $.MessageBox(output.d.substring(5, output.d.length));
            }
            else if (output.d == "No Data") {
                $.MessageBox("No data selected!");
                w.close();
            }
            else {
                debugger;
                path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                window.open(path);
            }

        }
    });
}

function PrintCustomerListingToExcel() {
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintCustomerListingToExcel',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            debugger;
            if (output.d == "LogOut") {
                window.location.href = "Login.aspx";
            }
            else if (output.d.indexOf("error") >= 0) {
                $("#msgbox-select").dialog("close");
                $.MessageBox(output.d.substring(5, output.d.length));
            }
            else if (output.d == "No Data") {
                $.MessageBox("No data selected!");
                w.close();
            }
            else {
                debugger;
                path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
            window.open(path);
        }

    }
});
}


/*Created by Abinaya :: Customer sales summary on Excel :: 04Jul2018*/
function PrintSalesSummaryToExcel(SummaryBy) {
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintSalesSummaryToExcel',
        data: "{'SummaryBy':'" + SummaryBy + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            debugger;
            if (output.d == "LogOut") {
                window.location.href = "Login.aspx";
            }
            else if (output.d.indexOf("error") >= 0) {
                $("#msgbox-select").dialog("close");
                $.MessageBox(output.d.substring(5, output.d.length));
            }
            else if (output.d == "No Data") {
                $.MessageBox("No data selected!");
                w.close();
            }
            else {
                debugger;
                path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                window.open(path);
            }

        }
    });
}

function PrintSetupsReport(ReportName, FromDate, ToDate, Airport) {
    debugger;
    var w = window.open('GeneratingPDF.html');
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintSetupsReport',
        data: "{'ReportOption':'" + ReportName + "','FromDate':'" + FromDate + "','ToDate':'" + ToDate + "','Airport':'" + Airport + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            if (output.d == "LogOut") {
                window.location.href = "Login.aspx";
            }
            else if (output.d.indexOf("error") >= 0) {
                $("#msgbox-select").dialog("close");
                $.MessageBox(output.d.substring(5, output.d.length));
            }
            else if (output.d == "No Data") {
                $.MessageBox("No data selected!");
                w.close();
            }
            else {
                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
            $("#msgbox-SetupsReports").dialog("close");
            $("#DialogDateSelection").dialog("close");
            $("#DialogFarmsByOrgin").dialog("close");
        }
    });
}

$(".tab-3").die('click').live("click", function (e) {
    debugger;
    $(".admingrpbtn").removeClass("is-checked");
    $(".admingrpbtn").css('background', '#dddddd')
    $(".admingrpbtn").css('color', 'black');
    $(".tabcontent").hide();
    $(".detailcontent").hide();
    $("#DivAdminBar").show();
    $(".tabs").hide();
});

$("#btnAdmin").die("click").live("click", function () {
    debugger;
    $(".detailcontent").hide();
    if (IsAdminPageLoaded == false) {
        callAdminPage();
    }
    else {
        $("#DivAdminPage").show();
    }
});

function callAdminPage() {
    IsAdminPageLoaded = true;
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageAdminSettings.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            debugger;
            $("#DivAdminPage").show();
            $("#DivAdminPage").html(output.d);
        }
    });
}

$("#btnEmail").die("click").live("click", function () {
    debugger;
    $(".detailcontent").hide();
    if (IsEmailPageLoaded == false) {
        callEmailPage();
    }
    else {
        $("#DivEmailPage").show();
    }
});

function callEmailPage() {
    IsEmailPageLoaded = true;
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageEmail.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            debugger;
            $("#DivEmailPage").show();
            $("#DivEmailPage").html(output.d);
        }
    });
}

$("#btnLogs").die("click").live("click", function () {
    debugger;
    $(".detailcontent").hide();
    if (IsLogsPageLoaded == false) {
        callLogsPage();
    }
    else {
        $("#DivLogsPage").show();
    }
});

function callLogsPage() {
    IsLogsPageLoaded = true;
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageLogs.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            debugger;
            $("#DivLogsPage").show();
            $("#DivLogsPage").html(output.d);
        }
    });
}

$("#btnColorCode").die("click").live("click", function () {
    debugger;
    $(".detailcontent").hide();
    if (IsColorCodePageLoaded == false) {
        callColorCodePage();
    }
    else {
        $("#DivColorCodePage").show();
    }
});

function callColorCodePage() {
    IsColorCodePageLoaded = true;
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageColorCode.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            debugger;
            $("#DivColorCodePage").show();
            $("#DivColorCodePage").html(output.d);
            $(".qsbox").blur();
        }
    });
}

$("#btnARXML").die("click").live("click", function () {
    debugger;
    $(".detailcontent").hide();
    if (IsARXMLPageLoaded == false) {
        callARXMLPage();
    }
    else {
        $("#DivARXMLPage").show();
    }
});

function callARXMLPage() {
    IsARXMLPageLoaded = true;
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageARXML.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            debugger;
            $("#DivARXMLPage").show();
            $("#DivARXMLPage").html(output.d);
        }
    });
}

$("#btnClose").die("click").live("click", function () {
    $(".tabs").show();

    $(".admingrpbtn").removeClass("is-checked");
    $(".admingrpbtn").css('background', '#dddddd')
    $(".admingrpbtn").css('color', 'black');
    $(".tabcontent").hide();
    $(".detailcontent").hide();
    $("#DivAdminBar").hide();
});

$(".tab-4").die('click').live("click", function (e) {
    debugger;
    $(".tabcontent").hide();
    $(".detailcontent").hide();
    callImportPage();
});

function callImportPage() {
    IsImportPageLoaded = true;
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageImportDBFToSQL.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            $('<div id="DivImportOptionsDialog">/div>').dialog({
                title: 'Import Options',
                autoOpen: false,
                resizable: false,
                modal: true,
                width: 1060,
                height: 630,
                //closeOnEscape:false,
                buttons: {
                    Import: function () {
                        $("#DivImportOptionsDialog").next('div').find('.msgui').remove();
                        $("#DivImportOptionsDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Importing...<img src='images/ajax-loader.gif'></img></div>").css('height', '35px');
                        ImportOptions();
                    },
                    Cancel: function () {
                        $("#DivImportOptionsDialog").dialog("close");
                    }
                },
                close: function (event, ui) {
                    $(this).dialog('destroy').remove();
                },
                open: function () {
                    $(".ui-dialog-buttonpane button:contains('Import')").addClass('dialogbuttonstyle icon-save');
                    $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
                }
            });
            $("#DivImportOptionsDialog").html(output.d).dialog("open");
        }
    });
}

$(".admingrpbtn").die('click').live("click", function (e) {
    $(".admingrpbtn").css('background', '#dddddd')
    $(".admingrpbtn").css('color', 'black');
    $(this).css('background', 'red')
    $(this).css('color', 'white');

    $(".admingrpbtn").find('.is-checked').removeClass('is-checked');
    $(this).addClass('is-checked');
});


$('input').keypress(function (e) {
    var key = e.which;
    if (key == 13) // the enter key code
    {
        if ($(this).attr('id') == "txtFarmsOrgin") {
            $("#DialogFarmsByOrgin").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
            return false;
        }
        else if ($(this).attr('id') == "txtRptDateFrom") {
            $("#txtRptDateTo").focus();
            return false;
        }
        else if ($(this).attr('id') == "txtRptDateTo") {
            $("#DialogDateSelection").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
            return false;
        }
    }
});
/*Load Cust# and name for searching  :: created by Abinaya :: 02Jul2018*/
$("#txtCustMaintenanceSearch").autocomplete({
    source: function (request, response) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustForAutocomplete',
            data: "{'Searchtext': '" + request.term + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {

                response($.map(data.d, function (item) {
                    return {
                        label: "[" + item.Customer + "] " + item.Name,
                        Customer: item.Customer,
                        Name: item.Name
                    }
                }))
            },
            error: function (response) {
                //alert(response.responseText);
            },
            failure: function (response) {
                alert(response.responseText);
            }
        });
    },
    open: function (event, ui) {
        $(".ui-menu").css("z-index", 101000);
    },
    select: function (e, i) {
        $("#txtCustMaintenanceSearch").val(i.item.Customer);
        autocompletePostPay(i.item.Customer, i.item.Name);
    },
    change: function (e, i) {
        if (i.item == null || i.item == undefined) {
            $("#txtCustMaintenanceSearch").val("");
            $("#txtCustMaintenanceSearch").focus();
            $(".ui-menu").css("display", "none");
        }
    },
    minLength: 1,
    autoFocus: true
});


/*Show Invoice details for the selected customer*/
function autocompletePostPay(Customer, Name) {
    $("#msghtml-CustDetailsWarning").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />");
    $("#msgbox-CustDetailsWarning").dialog("open");
    $(".imgLoaderForUser").show();
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageCustomer.ascx","controlPara":"' + Customer + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            $("#DivCustomerPage").html(output.d).dialog("open");
            $("#msgbox-CustDetailsWarning").dialog("close");
        }
    });
}

$("#btnAddNewCustMaintenance").die("click").live("click", function () {
    debugger;
    if (IsCustomerPageLoadedFirst == false) {
        $("#msghtml-CustDetailsWarning").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />");
        $("#msgbox-CustDetailsWarning").dialog("open");
        $(".imgLoaderForUser").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCustomer.ascx","controlPara":"0" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivCustomerPage").html(output.d).dialog("open");
                $("#msgbox-CustDetailsWarning").dialog("close");
            }
        });
    }
    else {
        $("#DivCustomerPage").dialog("open");
    }
});

//$(function () {
//    //allow for ESC to close only top dialog
//    $(document).bind('keydown', function (event) {
//        debugger;
//        //if (event.isPropagationStopped()) return true;
//        if ($("#msgbox-CustDetailsWarning").dialog("isOpen") &&
//            event.keyCode &&
//            event.keyCode === $.ui.keyCode.ESCAPE) {
//           alert('s')
//            //$("#DialogCustomerMaintenanceSearch").closeTopDialog();
//            event.preventDefault();
//            //event.stopPropagation();

//        }
//    });
//});

/*Warning for Controls loading on Customer Add/Edit screen*/
$("#msgbox-CustDetailsWarning").dialog({
    autoOpen: false,
    resizable: false,
    title: "Alert",
    modal: true,
    width: 350,
    closeOnEscape: false,
    //buttons: {
    //    Ok: function () {
    //        $(this).dialog("close");
    //    }
    //},
    open: function () {
        $("#msgbox-CustDetailsWarning").focus();
        $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
        //$(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
    }
});



/*Add shortcut keys for File maintenance list options :: Alt+(serial caption on the list) :: Created by Abi*/
//document.addEventListener('keydown', function keydown(evt) {
//    debugger;
//    if ($("#DialogSetupsFile").dialog("isOpen") == true) {
//        var handled = false;
//        var cmd = (evt.ctrlKey ? 1 : 0) |
//                  (evt.altKey ? 2 : 0) |
//                  (evt.shiftKey ? 4 : 0) |
//                  (evt.metaKey ? 8 : 0);
//        if (cmd === 2) { // alt-key

//            switch (evt.keyCode) {
//                case 49: // '1'
//                    debugger;
//                    ARDialogSetupsFile("CustomersPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 50: // '2'
//                    debugger;
//                    ARDialogSetupsFile("FlowersPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 51: // '3'
//                    debugger;
//                    ARDialogSetupsFile("FarmsPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 52: // '4'
//                    debugger;
//                    ARDialogSetupsFile("UsersPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 53: // '5'
//                    debugger;
//                    ARDialogSetupsFile("CarrierPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 54: // '6'
//                    debugger;
//                    ARDialogSetupsFile("AirportPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 55: // '7'
//                    debugger;
//                    ARDialogSetupsFile("DutyTablePage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 56: // '8'
//                    debugger;
//                    ARDialogSetupsFile("CreditTermsPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 57: // '9'
//                    debugger;
//                    ARDialogSetupsFile("CustTypesPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 65: // 'A'
//                    debugger;
//                    ARDialogSetupsFile("ProdCatPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 66: // 'B'
//                    debugger;
//                    ARDialogSetupsFile("ProdDetailsPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 67: // 'C'
//                    debugger;
//                    ARDialogSetupsFile("CountryCodesPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 68: // 'D'
//                    debugger;
//                    ARDialogSetupsFile("DivisionCodesPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 70: // 'F'
//                    debugger;
//                    ARDialogSetupsFile("HandlingChargesPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 77: // 'M'
//                    debugger;
//                    ARDialogSetupsFile("CurrencyCodesPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 82: // 'R'
//                    debugger;
//                    ARDialogSetupsFile("ColorsVarietiesPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 87: // 'W'
//                    debugger;
//                    ARDialogSetupsFile("WarehousePage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 79: // 'O'
//                    debugger;
//                    ARDialogSetupsFile("OrderStatusPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//                case 72: // 'H'
//                    debugger;
//                    ARDialogSetupsFile("FuelPage")
//                    handled = true;
//                    evt.stopImmediatePropagation();
//                    break;
//            }
//        }
//    }
//});

//Order Types
function OpenOrderTypesPage() {
    IsOrderStatusPageLoaded = true;
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageOrderTypes.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            debugger;
            $("#DivOrderTypesPage").show();
            $("#DivOrderTypesPage").html(output.d).dialog("open");
            $(".qsbox").blur();
        }
    });
}

$("#DivOrderTypesPage").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    width: 620,
    height: $(window).height() - 60,
    title: "Order Types",
    close: function () {
        $(document).unbind('keydown');
        $("#DialogSetupsFile").focus();
    },
    open: function () {
        $(document).die('keydown').live('keydown', function (e) {
            if ($("div[aria-labelledby='ui-dialog-title-DivOrderTypesPage']").css("display") != "none") {
                if ($("div[aria-labelledby='ui-dialog-title-EditOrderTypes']").css("display") == "none") {
                    if ((e.which == 65 || e.which == 97)) {
                        AddNewOrderStatus();
                        e.preventDefault();
                        return false;
                    }
                    if (e.which == 13) {
                        $(".trSelectedHeader").find("td").eq(1).click();
                        $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
                        $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
                        e.preventDefault();
                        return false;
                    }
                    if ((e.which == 38)) {
                        var row = $(".trSelectedHeader");
                        var prevrow = row.prev();
                        if (prevrow.length > 0) {
                            $(prevrow).addClass("trSelectedHeader");
                            $(row).removeClass("trSelectedHeader");
                        }
                        e.preventDefault();
                        return false;
                    }
                    if ((e.which == 40)) {
                        var row = $(".trSelectedHeader");
                        var nextrow = row.next();
                        if (nextrow.length > 0) {
                            $(nextrow).addClass("trSelectedHeader");
                            $(row).removeClass("trSelectedHeader");
                        }
                        e.preventDefault();
                        return false;
                    }
                }
            }
        });
    }
});

</script>
