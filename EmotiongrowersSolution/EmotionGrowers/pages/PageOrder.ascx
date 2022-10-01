<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageOrder.ascx.vb" Inherits="pages_PageOrder" %>
<%-- 23-OCT-2015::Created By - VEN --%>
<link rel="stylesheet" href="css/Filters.css">
<link href="css/AccordionMenuStyle.css" rel="stylesheet" />
<script src="js/Chart.js"></script>
<script src="js/ChartNew.js"></script>
<style type="text/css">
    .hiddenForUserType{
        display:none !important;
    }
    .InvoiceListtd {
        border-width: 1px;
        padding: 7px;
        border-style: solid;
        border-color: #666666;
        text-align: center;
    }

    #fgrdSPORDCustomerDetail input[type="text"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 14px;
        padding-left: 2px;
        margin: -3px;
        margin-right: 3px;
        float: left;
    }

    #fgrdSalesOrderCustomerDetail input[type="text"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 14px;
        padding-left: 2px;
        margin: -3px;
        margin-right: 3px;
        float: left;
    }

    .CloseWeekClass {
        position: absolute;
        left: 8px;
        margin-top: 5px;
        float: left;
    }
    /*.TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }*/

    /*.TotalRows {
        background-color: #72C97D;
        /*color: black;*
        font-weight: bold;
        color: red;
        font-size: 12px;
    }

    #row0 {
        /*position: absolute;
    margin-top: -63px;*
        color: red;
        text-decoration: none;
    }

        #row0 td {
            /*background-color: #f3f3f3;*
            border: 0px;
        }

            #row0 td.sorted {
                /*background-color: #708090;*
                background-color: #72C97D;
                border: 0px;
            }



            /*css color and alignment for row above the grid*
            #row0 td:nth-child(12) div {
                color: red;
                background-color: #72C97D;
                /* height: 28px; *
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /* border-top: 1px solid #ffffff; *
                /* line-height: 30px; *
                padding-bottom: 3px;
                font-size: 12px;
            }

            #row0 td:nth-child(13) div {
                color: red;
                background-color: #72C97D;
                /* height: 28px; *
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /* border-top: 1px solid #ffffff; *
                /* line-height: 30px; *
                padding-bottom: 3px;
                font-size: 12px;
            }*/

    .trSelectedHeader {
        background-color: red;
        color: white;
    }

    .flowerDescription {
        margin-top: -5px;
        margin-left: -5px;
        padding-bottom: 3px;
        margin-right: -5px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .SmallButton {
        background-color: #4BE655;
        -moz-border-radius: 28px;
        -webkit-border-radius: 28px;
        border-radius: 28px;
        border: 1px solid #84bbf3;
        display: inline-block;
        cursor: pointer;
        color: #000;
        font-family: arial;
        font-size: 12px;
        padding: 4px 7px;
        text-decoration: none;
        font-weight: bold;
    }

        .SmallButton:hover {
            background-color: #378de5;
            color: #ffffff;
        }

    #tblOrderAddEditInfo {
        border-spacing: 0px 2px;
        font-size: 12px;
        min-width: 380px;
    }

        #tblOrderAddEditInfo tr td:first-child {
            height: 30px;
            background-color: darkseagreen;
            color: white;
            padding-left: 20px;
            width: 115px;
        }

        #tblOrderAddEditInfo td:nth-child(2) {
            padding-left: 20px;
            background-color: whitesmoke;
        }

    #OrderSelectionDetails {
        height: 50px;
        float: left;
    }

    .button-group:after {
        content: '';
        display: block;
        clear: both;
    }

    .button-group .button {
        float: left;
        padding: 5px 5px;
        margin-left: 1px;
        margin-right: 2px;
        width: 150px;
        border-right: 1px solid gray;
        border-bottom: 1px solid gray;
        height: 48px;
        font-size: 12px;
        margin-top: 2px;
        font-weight: bold;
    }

    .button {
        display: inline-block;
        padding: 3px 10px;
        background: #EEE;
        border: none;
        color: #222;
        cursor: pointer;
    }

        /*.button:hover,
        .button:active,
        .button.is-checked {
            background-color: #0000ff;
            color: white;
        }*/

        .button.is-checked {
            color: white;
        }

    .chart-legend li span {
        display: inline-block;
        width: 14px;
        height: 14px;
        margin-right: 5px;
    }

    .ChartPleaseWaitOverlay {
        /*position: absolute;*/
        top: 0;
        float: left;
        height: 100%;
        width: 100%;
        z-index: 10;
        background-color: #E5E5E5;
    }

    #accordion table {
        font-size: 10px;
        font-weight: 200;
    }

    .ChartTitle {
        font-size: 12px;
        font-weight: bold;
    }

    #accordion table td:nth-child(3) {
        text-align: right;
    }

    /*#DivOrderDetailsDialog .ui-state-hover,
    .ui-widget-content .ui-state-hover,
    .ui-widget-header .ui-state-hover {
        border: none;
        background: none;
        color: none;
    }



    #DivCreateOrderDetailsDialog .ui-state-default,
    .ui-widget-content .ui-state-default,
    .ui-widget-header .ui-state-default {
    }*/

    #DivOrderDetailsDialog .ui-state-hover {
        border: none;
        background: none;
        color: none;
    }



    #DivCreateOrderDetailsDialog {
    }

    .btnImageForPrint {
        background: url('images/Print.png') no-repeat;
    }

    table.gridtable {
        font-family: verdana,arial,sans-serif;
        font-size: 11px;
        color: #333333;
        border-width: 1px;
        border-color: #666666;
        border-collapse: collapse;
        margin-left: auto;
        margin-right: auto;
    }

        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }

    .totalRowFontStyle {
        background: #72C97D;
        color: black; /* red*/
        text-align: right;
        font-weight: bold;
        font-size: 11px;
        position: relative;
        margin-left: -6px;
        margin-right: -6px;
        top: 3px;
    }
    /*Commented By Prashant On 21-04-2020*/
    /*input[type="checkbox"] + label span {
        float: right;
    }*/

    table.pietbls {
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        border-bottom: 0;
        border-right: 0;
        width: 372px;
    }

    tr.pietrs {
        border-bottom: 1px solid #ccc;
    }

    td.pietds {
        border-right: 1px solid #ccc;
        padding: 3px;
    }

    #js-legend-Customer table.pietbls {
        width: 355px;
    }

    #js-legend-Desc table.pietbls {
        width: 355px;
    }


    /*fieldset {
        position: relative;
        border-radius: 8px;
        border-width: 2px;
        max-height: 130px;
    }*/

    #fsSearch {
        height: 35px;
    }

    /*.legend1 {
        font-size: large;
        position: absolute;
        top: -0.1em;
        right: 330px;
        background: #fff;
        line-height: 1.2em;
    }

    .legend2 {
        font-size: large;
        position: absolute;
        top: -0.1em;
        right: 270px;
        background: #fff;
        line-height: 1.2em;
    }*/

    .BoxSeqListtd {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #666666;
        text-align: center;
    }
     .red{
        background-color:red;
    }
  /*   .bDiv
     {
         height:474px !important;
     }*/
</style>
<div class="PleaseWaitOverlay" style="display: none; width: 300px; height: 150px;">
    <div style="font-size: 12px; font-weight: bold; margin-left: 40px; margin-top: 30px;">
        Please wait... 
                    <img src="images/ajax-loader.gif" alt="" />
    </div>
</div>
<table>
    <tr>
        <td style="vertical-align: top; vertical-align: top;" colspan="2">
            <div style="background-color: whitesmoke; height: 50px;">
                <div class="slidediv" style="overflow: visible; display: block; height: 50px; float: left">
                    <!--width: 309px;-->
                    <table>
                        <tr>
                            <td style="vertical-align: top">
                                <div class="filterbutton" id="divHeaderdate">
                                    <table style="width: 100%; height: 100%;" id="tbldate">
                                        <tr>
                                            <td style="font-size: 11px">
                                                <img id="imgOrderDate" src="images/EmptyFilter.png" class="FilterImageStyle" />
                                                DATE PERIOD
                                            </td>

                                        </tr>
                                        <tr id="tr2" style="height: 18px; text-align: center;">
                                            <td>
                                                <label class="DivFilterLabelStyle" id="lblOrderchosendate"></label>
                                                <label class="DivFilterLabelStyle" style="display: none" id="lblOrderchosendate1"></label>
                                                <label class="DivFilterLabelStyle" style="display: none" id="lblOrderchosendate2"></label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>

                            <td style="vertical-align: top; width: 100px;">
                                <div class="filterbutton" id="divOrderHeaderCarrier">
                                    <table style="width: 100%; height: 100%;" id="tblCarrier">
                                        <tr>
                                            <td style="font-size: 11px">
                                                <img id="imgCarrier" src="images/EmptyFilter.png" class="FilterImageStyle" alt="" />
                                                CARRIER
                                            </td>

                                        </tr>
                                        <tr id="trCarrier" style="height: 18px; text-align: center;">
                                            <td>
                                                <label class="DivFilterLabelStyle" id="lblCarrierFilter"></label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>

                            <td style="vertical-align: middle; padding-left: 10px;">
                                <!-- width: 100px;-->
                                <div class="Orders" style="display: block;">
                                    <table id="tblChkReports" style="display: none; width: 1000px;">
                                        <%--/880/--%>
                                        <!--width changed -->
                                        <tr>
                                            <%-- <td>
                                                <input id="btnprintLable" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Print Label" />
                                                <%--<input id="btnprintLadingBill" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Print Lading Bill" />--%
                                            </td>--%>

                                            <td class="HideInSalesPage" id="tdInvoice">
                                                <input type="checkbox" id="chkInvoice" class="chkrpt">
                                                <label for="chkInvoice"><span style="padding: 1px;"></span>Invoice</label>
                                            </td>


                                            <%-- <td style="padding-left: 10px;"> --%>
                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager" id="tdPrintPickList">
                                                <input type="checkbox" id="chkPrintPickList" class="chkrpt">
                                                <label for="chkPrintPickList"><span style="padding: 1px;"></span>Pick List</label>
                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input type="checkbox" id="chkLabel" class="chkrpt">
                                                <label for="chkLabel"><span style="padding: 1px;"></span>Labels</label>
                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input type="checkbox" id="chkBillofLading" class="chkrpt">
                                                <label for="chkBillofLading" style="width: 166px;"><span style="padding: 1px;"></span>BOL</label>
                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input type="checkbox" id="chkCCI" class="chkrpt">
                                                <label for="chkCCI" title="Canadian Customs Invoice"><span style="padding: 1px;"></span>CCI</label>
                                            </td>
                                            <td class="HideInSalesPage" style="width: 34px;" id="tdPrintButton">
                                                <%--<input id="btnPrintReports" type="button" class="btnImageForPrint" value="Print" style="margin-top: -2px;" >--%>
                                                <img style='cursor: pointer; height: 26px;' src='images/printer-icon.png' id="imgPrintReports" />
                                            </td>

                                            <td class="HideInSalesPage HideForCreditManager" style="display: none;">
                                                <input id="btnARINVSForThisCustomer" style="display: none; margin-left: 0px;" class="BloomButtonEnabled" type="button" value="Closed Orders (F5)" />
                                            </td>
                                            <td class="HideInSalesPage HideForCreditManager" style="display: none;">
                                                <input id="btnCustomerOrder" style="display: none; margin-left: 0px;" class="BloomButtonEnabled" type="button" value="New Order" />
                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input type="checkbox" id="chkVoids">
                                                <label style="margin-left: 9px;" for="chkVoids"><span style="padding: 1px;"></span>VOIDS</label>
                                            </td>
                                           <%-- <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnprintdvlabel" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="DV Label" />
                                            </td>--%>
                                             <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnAWB" class="BloomButtonEnabled" type="button" style="margin-left: 0px;color: white;background:pink;" value="AWB" />
                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnUpdateDimension" class="BloomButtonEnabled" type="button" style="margin-left: 0px;color: white;background:blueviolet;" value="Dimension" />
                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager" <%--style="padding-right: 16px;"--%>>
                                                <input id="btnlookupboxdetails" class="BloomButtonEnabled" type="button" style="margin-left: 0px;" value="Lookup Box#" />
                                            </td>


                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <img id="imgCustomerInfoToggle" src="images/Phone.png" style="cursor: pointer; width: 33px;" />
                                                <img id="imgCloseToggle" src="images/menuclose.png" style="cursor: pointer; height: 24px; width: 27px; display: none;" title="Hide Pie Charts" />
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <fieldset id="fsListType" style="margin-right: 6px; float: right; width: 215px; height: 20px; border-width: 1px; padding-bottom: 16px; margin-bottom: -8px;">
                                                    <legend style="background: white; margin-left: 2px;"></legend>
                                                    <input id="rbCustList" class="rbListType" type="radio" style="margin-top: 8px;" name="ListType" checked="checked">
                                                    <label for="rbCustList">CustomerList</label>
                                                    <input id="rbCallList" class="rbListType" type="radio" style="margin-top: 8px;" name="ListType">
                                                    <label for="rbCallList">CallList</label>
                                                    <input id="rbF8ViewLog" class="rbListType" type="radio" style="margin-top: 8px;" name="ListType">
                                                    <label for="rbF8ViewLog">ViewLog</label>
                                                </fieldset>
                                            </td>

                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager" id="tdfssearch">
                                                <fieldset id="fsSearch" style="float: right; width: 155px; height: 35px; border-width: 1px;">
                                                    <legend style="background: white; margin-left: 2px; font-size: 10px;">
                                                        <input id="rbcust" class="rbsearch" type="radio" name="search" checked="checked">
                                                        <label for="rbcust">Customer</label>
                                                        <input id="rbinv" class="rbsearch" type="radio" name="search">
                                                        <label for="rbinv">Invoice</label>
                                                        <input id="rbPO" class="rbsearch" type="radio" name="search">
                                                        <label for="rbPO">PO</label>
                                                    </legend>
                                                    <input type="text" id="txtCustSearch" placeholder="Customer Search" style="width: 155px; float: left; margin-top: -1px; background-color: white;" value="" class="AllUpperCaseTextBox searchplaceholder" />
                                                    <input type="text" id="txtInvSearch" placeholder="Invoice Search" style="width: 155px; float: left; margin-top: -1px; display: none; background-color: white;" value="" class="AllUpperCaseTextBox searchplaceholder" />
                                                    <input type="text" id="txtPOSearch" placeholder="PO Search" style="width: 155px; float: left; margin-top: -1px; display: none; background-color: white;" value="" class="AllUpperCaseTextBox searchplaceholder" />
                                                </fieldset>
                                            </td>

                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnSalesSummaryReport" class="BloomButtonEnabled" type="button" value="Summary" />
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnSPORDInvoice" class="BloomButtonEnabled" type="button" style="display: none; background: #b23cc0 !important; color: white !important; width: 70px; height: 40px;" value="Standing" title="Creates invoices from standing orders" />
                                            </td>

                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnRelease" class="BloomButtonEnabled" type="button" style="margin-left: 0px;" value="Release" />
                                            </td>

                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnActivateScan" class="BloomButtonEnabled" type="button" style="margin-left: 0px;" value="Scan" />
                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnClearPhyInven" class="BloomButtonEnabled" type="button" style="margin-left: 0px;" value="Clear Phy Inven" />
                                            </td>

                                            <td id="tdEdi" class="HideInSalesPage">
                                                <select id="lstEDI">
                                                    <option id="Select">EDI:</option>
                                                    <option id="EDI_Armellini">Armellini</option>
                                                    <option id="EDI_Prime">Prime</option>
                                                    <option id="EDI_FloridaBeauty">Florida Beauty</option>
                                                </select>

                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType" id="tdConfirmed">
                                                <input id="btnConfirmPayment" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Confirm" />
                                            </td>



                                            <%--<td>
                                                <input id="btnprintPickList" class="BloomButtonEnabled" type="button" style="margin-left: 10px;" value="Print Pick List" />

                                            </td>--%>
                                             <td class="ShowInSalesPage">
                                                <input id="btnNewCustomer" class="BloomButtonEnabled" type="button" style="margin-left: 2px;background:pink;" value="New" />
                                            </td>
                                            <td class="ShowInSalesPage">
                                                <input id="btnViewSales" class="BloomButtonEnabled" type="button" style="margin-left: 2px;" value="View Sales" />
                                            </td>

                                            <td class="ShowInSalesPage" id="tdOnlyMeSalesPerson" style="display: none; width: 80px; display: inline-block; padding-top: 20px;">
                                                <input type="checkbox" id="chkShowAllSalesPersonSales">
                                                <label style="margin-left: 9px;" for="chkShowAllSalesPersonSales"><span style="padding: 1px; display: inline-block;"></span>OnlyMe</label>
                                            </td>

                                            <td class="ShowInSalesPage ShowInSalesInvoiceSelected">
                                                <input id="btnSalesSaveInvoicePdf" class="BloomButtonEnabled" title="Save selected invoice to Download folder" type="button" style="display: none; margin-left: 10px;" value="Save" />
                                            </td>
                                            <td class="ShowInSalesPage">
                                                <select id="lstSalesCallDays" placeholder="PREPARE CALL LIST">
                                                    <option id="CallListDayOpt_0" value="0" data-dt="">PREPARE CALL LIST</option>
                                                    <option id="CallListDayOpt_1" value="1" data-dt="">Monday</option>
                                                    <option id="CallListDayOpt_2" value="2" data-dt="">Tuesday</option>
                                                    <option id="CallListDayOpt_3" value="3" data-dt="">Wednesday</option>
                                                    <option id="CallListDayOpt_4" value="4" data-dt="">Thursday</option>
                                                    <option id="CallListDayOpt_5" value="5" data-dt="">Friday</option>
                                                    <option id="CallListDayOpt_6" value="6" data-dt="">Saturday</option>
                                                    <option id="CallListDayOpt_7" value="7" data-dt="">Sunday</option>
                                                    <option id="CallListDayOpt_8" value="8" data-dt="">Remove Call List</option>
                                                </select>
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager HideForSalesPerson">
                                                <input id="btnOrderDetailsList" type="button" class="BloomButtonEnabled" style="background: #d72c83 !important; color: white !important;margin-left: 5px;" value="Details" >
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager HideForSalesPerson">
                                                <input id="btnOrderSummaryList" type="button" class="BloomButtonEnabled" value="Summary" style="margin-left: 5px; background: #d7e93c !important;">
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType">
                                                <img id="aApproval" src="images/tick.png" title="Approval" style="cursor: pointer" />
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <img id="imgToggle" src="images/menu.png" style="cursor: pointer; height: 30px; width: 40px;" title="Show Pie Charts" />
                                                <%--<img id="imgCloseToggle" src="images/menuclose.png" style="cursor: pointer; height: 24px; width: 27px; display: none;" title="Hide Pie Charts" />--%>
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <img src="images/netsalesinfo.png" class="imgAllCustSales" data-custno="" data-custname="" title="NetSales" style="margin-left: -3px; cursor: pointer; display: none" />
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <img id="aEmailInvoices" style="margin-left: 3px; cursor: pointer;" src="images/email.png" title="Email/Fax selected Invoices or check emails sent" />
                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType" style="width:200px !important;">
                                                <input id="btnOrderClearGun" class="BloomButtonEnabled" type="button" style="margin-right: -30px;" value="Clear" title="Clear Scanners">
                                            </td>
                                            <td class="HideInSalesPage HideForCustomerUserType" style="width:120px;">
                                                <input id="btnUploadPOD" class="BloomButtonEnabled" type="button" style="margin-left: 30px;" value="Upload POD" title="Upload POD for invoice.">
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnAllocation" class="BloomButtonEnabled" type="button" style="display: none; background: #b88aeb !important; color: white !important; color: blue; width: 80px; height: 40px;" value="Allocation" title="Allocates inventory to future orders" />
                                            </td>
                                            <td class="ShowInSalesPage HideForCustomerUserType HideForCreditManager">
                                                <input id="btnInventoryReport" class="BloomButtonEnabled" type="button" style="background: #f8a856  !important; color: white !important; color: fuchsia; width: 80px; height: 30px;" value="Availability" title="Creates an inventory product availability list" />
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </td>


                            <%--cmtd on 02-02-2017
                            <td style="vertical-align: top; width: 100px;">
                                <div id="divApply">
                                    <table style="width: 100%; height: 100%;" id="Table1">
                                        <tr>
                                            <td style="vertical-align: top; width: 100px;">
                                                <input id="btnapply" type="button" class="Acctionbuttons" value="APPLY" style="display: none" />
                                                <input id="btnClearAll" type="button" class="Acctionbuttons" style="display: none" value="RESET" />
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </td>--%>
                        </tr>
                        <%--<tr class="rowcss" id="trFarmtitle">
                <td style="vertical-align: top" colspan="5">
                    <div id="divOrderNoFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 210px; padding-bottom: 5px;">
                            <input type="text" id="txtOrderNoFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                            <input type="button" class="SmallButton" id="btnOrderNo" value="Ok" />
                        </div>
                    </div>
                </td>
            </tr>--%>
                        <tr class="rowcss" id="trdatetitle">
                            <td style="vertical-align: top" colspan="5">
                                <div id="divOrderdateFilter" class="filterdiv" style="display: none; width: 268px; height: 30px; vertical-align: middle">
                                    <div class="tooltip-content" style="width: 450px; height: 240px;">
                                        <table>
                                            <tr>
                                                <td>From
                                                </td>
                                                <td>
                                                    <input type="text" id="txtOrderFromRecDate" style="width: 80px;" />
                                                </td>
                                                <td>To
                                                </td>
                                                <td>
                                                    <input type="text" id="txtOrderToRecDate" style="width: 80px" />
                                                </td>
                                                <td>
                                                    <input type="button" class="SmallButton" id="btndateok" value="Ok" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div id="divFromDate" style="max-height: 162px; vertical-align: top;"></div>
                                                </td>
                                                <td colspan="3">
                                                    <div id="divToDate" style="max-height: 162px; vertical-align: top;"></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="rowcss" id="trCarriertitle">
                            <td></td>
                            <td style="vertical-align: top" colspan="5">
                                <div id="divCarrierFilter" class="filterdiv" style="display: none; width: 280px; height: 30px; vertical-align: middle">
                                    <div class="tooltip-content" style="width: 170px; padding-bottom: 5px;">
                                        <select id="lstCarrierFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </td>
    </tr>
    <%--Show Graph on Sales Page  Prashant--%>
    <tr id="trNetSalesGraph" class="ShowInSalesPage">
        <td>
            <div>
                <select id="ddlSalesMan" class="hiddenForUserType">
                    <option>Select</option>
                </select>
                
                <select id="ddlGraphType" class="hiddenForUserType">
                    <option value="Monthly">Monthly</option>
                    <option value="Today">Today</option>
                </select>
            </div>
            <div id="DialogSalesGraph" style="margin-left: 15px;" >
                <canvas id="salesChart" width="1100" height="400" style="display: none;"></canvas>
            </div>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top;">

            <div id="DivCustomerDetails" style="display: none;  font-weight: bold; width: 100%; height: 100%; background-color: #d7d7d7; position: absolute; z-index: 1000;">
                <table id="fgrdCustomerDetails" style="display: block;"></table>
            </div>
            <table id="tblcurrentOrder" style="float: left;  font-weight: bold; " cellspacing="0">
                <tr>
                    <td style="vertical-align: top; padding: 0px; margin: 0px;">
                        <div id="DivOrderHeader" style="float: left">
                            <table id="fgrdOrderHeader" style="display: block;"></table>
                        </div>
                    </td>

                </tr>
            </table>
        </td>
        <td id="tdChart" style="vertical-align: top; padding: 0px; margin: 0px; display: none;">
            <div class="ChartPleaseWaitOverlay" style="display: none">
                <div style="top: 51px; margin-top: 216px; font-size: 16px; margin-left: 90px; font-size: 12px; font-weight: bold">
                    Please wait... 
                    <img src="images/ajax-loader.gif" alt="" />
                </div>
            </div>
            <div id='ChartList' style="float: left; overflow: auto;">
                <div id="accordion">
                    <h3>Sales Person</h3>
                    <div>
                        <table>
                            <tr>
                                <td style="width: 200px;">
                                    <div id="js-legend-SalesPerson" class="chart-legend" style="float: left; display: none"></div>
                                </td>
                                <td>

                                    <div id="canvas-holder-SalesPerson" style="display: none;">
                                    </div>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <h3>Carrier Statistics</h3>
                    <div>
                        <table>
                            <tr>
                                <td class="ChartTitle">FBE</td>
                            </tr>
                            <tr>
                                <td style="width: 200px;">
                                    <div id="js-legend-CarrierFBE" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>
                                    <div id="canvas-holder-CarrierFBE" style="display: none;"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="ChartTitle">Boxes</td>
                            </tr>
                            <tr>
                                <td style="width: 200px;">
                                    <div id="js-legend-CarrierPcs" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>
                                    <div id="canvas-holder-CarrierPcs" style="display: none;"></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h3>State</h3>
                    <div>
                        <table>
                            <tr>
                                <td class="ChartTitle">Boxes</td>
                            </tr>
                            <tr>
                                <td style="width: 200px;">
                                    <div id="js-legend-State-Boxes" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>
                                    <div id="canvas-holder-State-Boxes" style="display: none; height: 250px; width: 250px"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="ChartTitle">Sales</td>
                            </tr>
                            <tr>
                                <td style="width: 200px;">
                                    <div id="js-legend-State-Sales" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>
                                    <div id="canvas-holder-State-Sales" style="display: none; height: 250px; width: 250px"></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h3>Color</h3>
                    <div>
                        <table>
                            <tr>
                                <td class="ChartTitle">Boxes</td>
                            </tr>
                            <tr>
                                <td style="width: 200px;">
                                    <div id="js-legend-Color-Boxes" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>
                                    <div id="canvas-holder-Color-Boxes" style="display: none;"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="ChartTitle">Sales</td>
                            </tr>
                            <tr>
                                <td style="width: 200px;">
                                    <div id="js-legend-Color-Sales" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>
                                    <div id="canvas-holder-Color-Sales" style="display: none;"></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h3>Category</h3>
                    <div>
                        <table>
                            <tr>
                                <td style="width: 200px;">
                                    <div id="js-legend-Cat" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>

                                    <div id="canvas-holder-Cat" style="display: none;">
                                    </div>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <h3>Flower Description</h3>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <div id="js-legend-Desc" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>

                                    <div id="canvas-holder-Desc" style="display: none;">
                                    </div>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <h3>Customer</h3>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <div id="js-legend-Customer" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>

                                    <div id="canvas-holder-Customer" style="display: none;">
                                    </div>

                                </td>
                            </tr>
                        </table>
                    </div>

                    <h3>Sales Type</h3>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <div id="js-legend-SalesType" class="chart-legend" style="float: left; display: none"></div>
                                </td>

                                <td>

                                    <div id="canvas-holder-SalesType" style="display: none;">
                                    </div>

                                </td>
                            </tr>
                        </table>
                    </div>

                </div>
            </div>
        </td>
    </tr>
</table>
<input type="hidden" id="hdnOrder" />
<input type="hidden" id="hdnORDER2SQLID" />
<div id="DivInventoryFlowerCategory" style="display: none"></div>
<div id="DivInventoryFlowerName" style="display: none"></div>
<div id="DivInventoryFlowerColorCode" style="display: none"></div>
<div id="ChartVisibility" style="display: none;" runat="server"></div>
<div id="LoggedInCustomerNo" style="display: none;" runat="server"></div>
<div id="FilterDivision" style="display: none;" runat="server"></div>
<div id="LoggedUserType" runat="server" style="display: none"></div>
<div style="display: none" id="OrderNo" runat="server"></div>
<div id="DivForViewAllColumnsInInvnetory" style="display: none" runat="server"></div>

<div id="msgbox-select" style="display: none;" title="Alert">
    <p id="msg">
        First select any contact from the list and try again.
    </p>
</div>


<div id="msgbox-warn" style="display: none;" title="Alert">
    <p id="msghtml"></p>
</div>




<div id="DivUploadDVLabel" style="display: none">
    <table style="width: 100%">
        <tr>
            <td colspan="2" style="height: 28px">
                <div class="YellowWarning" align="center">
                </div>
            </td>
        </tr>
        <tr style="width: 50%">
            <td>&nbsp;</td>
            <td>
                <form action="UploadDVLabel.aspx" method="post" enctype="multipart/form-data" id="fileuploader" target="upload_target" onsubmit="startUpload();">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <p id="upload_process">
                                    <br />
                                    Uploading...<br />
                                    <br />
                                    <img src="images/uploading.gif" /><br />
                                </p>
                                <p id="import_process">
                                    <br />
                                    Importing...<br />
                                    <br />
                                    <img src="images/uploading.gif" /><br />
                                </p>
                                <p id="upload_form" align="left">
                                    <input name="myDVfile" id="myDVfile" accept=".csv" type="file" size="30" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="btnimportcsvdata" type="button" style="display: none;" value="Submit" />
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
    </table>
</div>






<div id="DivScannedDetails" style="display: none;">
    <table id="fgrdScannedDetails" style="display: block;"></table>
</div>

<div id="DivPageARINVS" style="display: none;"></div>
<div id="DivPageOrderNew" style="display: none;"></div>
<div id="DivPagePriceApproval" style="display: none;"></div>


<div id="LoggedInUserID" runat="server" style="display: none"></div>
<div id="LoggedInUserSalesman" runat="server" style="display: none"></div>


<div id="DivOrderSavePage" style="width: 1000px; display: none"></div>


<div id="msgbox-CustDetailsWarning" style="display: none;">
    <p id="msghtml-CustDetailsWarning" style="font-size: 12.5px; font-weight: bold;"></p>
</div>

<div id="DialogSalesSummaryReport" style="display: none;">
    <fieldset id="fsSalesSummaryReport" style="font-size: 18px; font-weight: bold; height: 135px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtSalesSummaryReportHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesSummaryFromDate">From </label>
                </td>
                <td>
                    <input id="txtSalesSummaryFromDate" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesSummaryToDate">To </label>
                </td>
                <td>
                    <input id="txtSalesSummaryToDate" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesSummaryByCarrier">By Carrier </label>
                </td>
                <td>
                    <input id="txtSalesSummaryByCarrier" type="text" style="margin-top: 8px; width: 20px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSalesSummarySelectCarrier">Select Carrier </label>
                </td>
                <td>
                    <input id="txtSalesSummarySelectCarrier" class="AllUpperCaseTextBox" type="text" style="margin-top: 8px; width: 40px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogSPORDInvoice" style="display: none; background-color: whitesmoke;">
    <fieldset id="fsSPORDInvoice" style="font-size: 14px; font-weight: bold; height: 275px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtSPORDStandingHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPORDInvoiceDate">Ship Date</label>
                </td>
                <td>
                    <input id="txtSPORDShipDate" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPORDStandingInv">Invoice Standing ?? </label>
                </td>
                <td style="text-align: left;">
                    <input type="checkbox" id="chkStanding">
                    <label for="chkStanding"><span style="padding-left: -30px;"></span>&nbsp;</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPORDInvoicePrebookInv">Invoice Pre-Books ??</label>
                </td>
                <td>
                    <input type="checkbox" id="chkPrebooks">
                    <label for="chkPrebooks"><span style="padding: 1px;"></span>&nbsp;</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPORDFarm">Farm To Invoice</label>
                </td>
                <td>
                    <select id="lstSPORDFarm" style="width: 200px;"></select>
                    <input type="hidden" id="hfSPORDFarm" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblInvenToIgnore">Inventory markets to Ignore</label>
                </td>
                <td>
                    <input id="txtInvenToIgnore" class="AllUpperCaseTextBox" type="text" style="margin-top: 8px; width: 100px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPORDAWB">AWB To Invoice</label>
                </td>
                <td>
                    <input id="txtSPORDStandingAWB" class="AllUpperCaseTextBox" type="text" style="margin-top: 8px; width: 100px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSPORDWH">Warehouse To Invoice From</label>
                </td>
                <td>
                    <select id="lstSPORDWarehouse" style="width: 200px;"></select>
                </td>
            </tr>
            <tr style="height: 33px; display: none;">
                <td style="padding-right: 10px;">
                    <label id="lblInterActiveMode">InterActive Mode</label>
                </td>
                <td>
                    <input type="checkbox" id="chkInteractiveMode">
                    <label for="chkInteractiveMode"><span style="padding: 1px;"></span>&nbsp;</label>
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblRefreshGrid">Clear previous File</label>
                </td>
                <td>
                    <input type="checkbox" id="chkRefreshGrid">
                    <label for="chkRefreshGrid"><span style="padding: 1px;"></span>&nbsp;</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<table cellspacing="0">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivStandingOrderList" style="float: left; display: none;">
                <table>
                    <tr style="height: 33px;">
                        <td style="padding-right: 10px;">
                            <label>Ship Date :</label>
                        </td>
                        <td>
                            <input id="txtShipDate" type="text" style="margin-top: 8px; width: 120px;" disabled="disabled" />
                        </td>
                        <td style="padding-right: 10px;">
                            <label>ShipDay :</label>
                        </td>
                        <td>
                            <input id="txtShipDay" type="text" style="margin-top: 8px; width: 120px;" disabled="disabled" />
                        </td>
                        <td>
                            <button id="btnSPORDAllCustomer" type="button" class="BloomButtonEnabled" style="margin-top: 8px; margin-left: 2px; width: 200px;">Show Customers</button>
                        </td>
                    </tr>
                </table>
                <table id="fgrdStandingOrderList" style="display: block;"></table>

            </div>
        </td>
        <td style="vertical-align: top; padding: 0px; margin: 0px; display: none;" id="tdSPORDCustGrid">
            <div id="DivSPORDCustomerDetail">
                <table>
                    <tr style="height: 33px;">
                        <td style="padding-right: 10px;">
                            <label>Flower</label>
                        </td>
                        <td>
                            <input id="txtFlower" type="text" style="width: 200px;" disabled="disabled" />
                        </td>
                        <td style="padding-right: 10px;">
                            <label>UOM</label>
                        </td>
                        <td>
                            <input id="txtUOM" type="text" style="width: 120px;" disabled="disabled" />
                        </td>
                    </tr>
                </table>
                <table id="fgrdSPORDCustomerDetail" style="display: block;"></table>
                <div id="divFlowerCode" style="display: none;"></div>
                <div id="divUOM" style="display: none;"></div>
                <div id="divFlowerName" style="display: none;"></div>
                <div id="divRowUnit" style="display: none;"></div>
                <div id="divRowComments" style="display: none;"></div>
                <div id="divShort" style="display: none;"></div>
                <div id="divShipDt" style="display: none;"></div>
            </div>
        </td>
        <td style="vertical-align: top; padding: 0px; margin: 0px; display: none;">
            <div id="DivSPORDAllCustomerDetail">
                <table id="fgrdSPORDAllCustomerDetail" style="display: block;"></table>
            </div>
        </td>
    </tr>
</table>

<div id="DialogAllocationInvoice" style="display: none; background-color: whitesmoke;">
    <fieldset id="fsAllocationInvoice" style="font-size: 14px; font-weight: bold; height: 95px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtAllocationHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblAllocationCargoDate">Cargo Date</label>
                </td>
                <td>
                    <input id="txtAllocationCargoDate" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblMarketToIgnore">Inventory markets to ignore</label>
                </td>
                <td>
                    <input id="txtMarketToIgnore" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblRefreshGridAllocation">Clear previous File</label>
                </td>
                <td>
                    <input type="checkbox" id="chkRefreshGridAllocation">
                    <label for="chkRefreshGridAllocation"><span style="padding: 1px;"></span>&nbsp;</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogInvenAvailabilityReport" style="display: none; background-color: whitesmoke;">
    <fieldset id="fsInvenReport" style="font-size: 14px; font-weight: bold; height: 75px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblReportMarketToIgnore">Inventory markets to ignore</label>
                </td>
                <td>
                    <input id="txtInvenMarketToIgnore" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>



<table cellspacing="0">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivSalesOrderAllocationList" style="float: left; display: none;">
                <table id="fgrdSalesOrderAllocationList" style="display: block;"></table>
            </div>
        </td>
        <td style="vertical-align: top; padding: 0px; margin: 0px; display: none;" id="tdSalesOrderCustGrid">
            <div id="DivSalesOrderCustomerDetail">
                <div style="width: 100%; padding: 5px 0px 5px 0px;"> The total short is: <span id="txtTotalShort" style="color: red; font-weight: bold">0</span></div>
               <%-- <table>
                    <tr style="height: 33px;">
                        <td style="padding-right: 10px;">
                            <label>Flower</label>
                        </td>
                        <td>
                            <input id="txtSOFlower" type="text" style="width: 200px;" disabled="disabled" />
                        </td>
                        <td style="padding-right: 10px;">
                            <label>UOM</label>
                        </td>
                        <td>
                            <input id="txtSOUOM" type="text" style="width: 120px;" disabled="disabled" />
                        </td>
                    </tr>
                </table>--%>
                <table id="fgrdSalesOrderCustomerDetail" style="display: block;"></table>
            </div>
        </td>
    </tr>
</table>
<table cellspacing="0">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivSalesOrderAllocationListByCargoDt" style="float: left; display: none;">
                <table id="fgrdSalesOrderAllocationListByCargoDt" style="display: block;"></table>
            </div>
        </td>
        <td style="vertical-align: top; padding: 0px; margin: 0px; display: none;" id="tdSalesOrderCustGridByCargoDt">
            <div id="DivSalesOrderCustomerDetailByCargoDt">
               <%-- <table>
                    <tr style="height: 33px;">
                        <td style="padding-right: 10px;">
                            <label>Flower</label>
                        </td>
                        <td>
                            <input id="txtSOFlower" type="text" style="width: 200px;" disabled="disabled" />
                        </td>
                        <td style="padding-right: 10px;">
                            <label>UOM</label>
                        </td>
                        <td>
                            <input id="txtSOUOM" type="text" style="width: 120px;" disabled="disabled" />
                        </td>
                    </tr>
                </table>--%>
                <table id="fgrdSalesOrderCustomerDetailByCargoDt" style="display: block;"></table>
            </div>
        </td>
    </tr>
</table>

<div id="DialogReleaseLabels" style="display: none; text-align: center;">
    <div id="DialogReleaseLabelsMsg" style="margin: 30px 0px;"></div>
</div>
<div id="DivReleaseInvoice" style="display: none;"></div>

<div id="DivSalesYear1" class="slscretyr" style="display:none;"></div>
<div id="DivSalesYear2" class="slscrelyr" style="display:none;"></div>
<div id="DivSalesYear3" class="slscrelyr2" style="display:none;"></div>
<div id="DivSalesYear4" class="slscrelyr3" style="display:none;"></div>
<div id="DivSalesYear5" class="slscrelyr4" style="display:none;"></div>
<div id="DivPODUploadDialog" style="display:none;">
    <table>
        <tbody>
            <tr style="padding:5px;">
                <td>FILES: </td>
                <td> <input type="file" id="PODFile"  multiple="multiple" accept=".pdf" /></td>
            </tr>
            <tr style="padding:5px;">
                <td></td>
                <td>
                    <p id="POD_upload_process" style="display:none;">
                         Uploading...<br />
                        <img src="images/uploading.gif" /><br />
                    </p>
                </td>
            </tr>
        </tbody>
    </table>
   
</div>
<div id="DivPDFViewerDialog" style="display:none;">
    <div>
        <iframe id="pdfIframe" style="width:100%;height:700px;"></iframe>
    </div>
</div>
<div id="InventoryListForOrderEntryDialog" style="display:none;">
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="padding-right: 25px; color: darkblue;">Remaining Quantity</td>
                        <td>
                            <label id="InventoryRemainingQty" style="color: black; font-weight: bold;"></label>
                            <input type="hidden" id="CustCode" />
                            <input type="hidden" id="hdnInventoryRemainingQty" />
                        </td> 
                        <td style="width:750px;"></td>
                         <td style="padding-right: 25px; color: darkblue;">Product Name</td>
                        <td>
                            <label id="ProductNameDesc" style="color: black; font-weight: bold;"></label>
                        </td> 
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivAvaliableInventoryGridList">
                    <table id="fgrdAvaliableInventoryGridList" tabindex="-5" style="display: block;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="margin-top: 6px; display: block;">
                    <button id="btnApply" type="button" class="BloomButtonEnabled firstletterunderline" value="Search" style="margin-left: 2px; width: 66px;float:right;">Apply</button>
                    <div id="divWHForInvoice" style="display:none;"></div>
                </div>
            </td>
        </tr>
    </table>
</div>
<div id="DivOrderDetailsDimensionView" style="display: none">	
	    <table style="width: 100%">		
	        <tr>		
	            <td>		
	            <table id="fgrdOrderDetailsDimensionView" style="display: none;"></table>		
	            </td>		
        </tr>		
    </table>		
</div>

<div id="DialogConsoleViewDimension" style="display: none;">
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    Dimension
                    <input type="hidden" id="hdnSQLID" />
                </td>
                <td>
                    <input id="txtLength" class="" type="text" style="margin-top: 8px; width: 60px;" />
                </td>
                <td>
                    <input id="txtWidth" class="" type="text" style="margin-top: 8px; width: 60px;" />
                </td>
                <td>
                    <input id="txtHeight" class="" type="text" style="margin-top: 8px; width: 60px;" />
                </td>
            </tr>            
        </table>
</div>

<div id="DialogUpdateAWB" style="display: none;">
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    AWB
                    <input type="hidden" id="hdnAWBSQLID" />
                </td>
                <td>
                    <input id="txtAWB" class="" type="text" style="margin-top: 8px; width: 150px;" />
                </td>
            </tr>            
        </table>
</div>
<div id="DivCustomerPage" style="display: none;" class="detailcontent filesTab"></div>
<script type="text/javascript">
    var isAwbVisibleOnOrderGrid = false;
    var FilterQuery = "";
    var FilterDivision = "";
    var myChartInterval = "";
    var MyChartTimer = "";
    var IsChartLoad = "0";
    var IsSPORDCustGridReload = false;
    var IsSPORDAllCustGridReload = false;
    var IsSalesOrderGridReload = false;
    var IsSalesPerson = false;
    var DefLabelPrintDetails = "";
    var IsQtyReduce = false;
    var IsToggleCustDetails = false;
    var IsCustomerType = false;
    var ListType = "Customer";
    var IsWHType = false;
    var AllowToviewOnlyMe = false;
    var AllowToViewFlipButton = false;
    var sentence = $("#ctl00_DivForViewAllColumnsInInvnetory").html();
    var index = 10;
    //Get Current User Permission on "View Flip Button" setup
    var hasPermissionToViewFlipButton = sentence.charAt(index);
    if (hasPermissionToViewFlipButton.toUpperCase() == "Y")
        AllowToViewFlipButton = true;
    else
        AllowToViewFlipButton = false;

    index = 24;
    var hasPermissionToViewOnlyMe = sentence.charAt(index);
    if (hasPermissionToViewOnlyMe.toUpperCase() == "Y")
        hasPermissionToViewOnlyMe = true;
    else
        hasPermissionToViewOnlyMe = false;

    $("#msgbox-select").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true
        //buttons: {
        //    Ok: function () {
        //        $(this).dialog("close");
        //    }
        //}
    });
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [month, day, year].join('/');
    }

    $(document).ready(new function () {
        //debugger;
        var cc = 0;
        var IsVoidedInvoice = "";
        $('#lstSalesCallDays').click(function () {

            cc++;
            if (cc == 2) {
                $(this).change();
                cc = 0;
            }
        }).change(function () {
            prepareCallList();

            cc = -1;
        });
        //debugger;
        var SalesNewCustomer = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(11, 1).ToString()%>' == "Y" ? true : false;
        if (SalesNewCustomer) {
            $("#btnNewCustomer").show();
        }
        else {
            $("#btnNewCustomer").hide();
        }
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUserTypeAccessDetails',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "Y") {
                    $("#btnActivateScan").show();
                    $("#btnRelease").show();
                }
            }
        });


        var CurrentDate = new Date();
        var PrevDate = new Date();
        var NextDate = new Date();
        var CurrentDays = CurrentDate.getDay();
        $("#CallListDayOpt_" + CurrentDays).css('background-color', 'red');
        var ListCount = document.getElementById("lstSalesCallDays").length;
        for (var i = 1; i < ListCount - 1; i++) {
            if (CurrentDays > i) {
                $("#CallListDayOpt_" + (CurrentDays - i)).attr('data-dt', formatDate(PrevDate.setDate(PrevDate.getDate() - 1)));
            }
            else if (CurrentDays == i) {
                $("#CallListDayOpt_" + i).attr('data-dt', formatDate(CurrentDate.setDate(CurrentDate.getDate())));
            }
            else if (CurrentDays < i) {
                $("#CallListDayOpt_" + i).attr('data-dt', formatDate(NextDate.setDate(NextDate.getDate() + 1)));
            }
        }

        var page = window.location.href;

        if (page.indexOf('Page=Order') >= 0) {

            $("#tblChkReports").show();
            $(".HideInSalesPage").show();
            $(".ShowInSalesPage").hide();
            $(".ShowInSalesInvoiceSelected").hide();
            
            if ($("#ctl00_LoggedUserType").html() == "credit manager") {
                $(".HideForCreditManager").remove();
                $(".HideForCreditManager").hide();

                $("#tdInvoice").css("width", "8%");
                $("#tdPrintButton").css("width", "4%");
                $("#tdConfirmed").css("width", "8%");
                $("#btnOrderClearGun").css("display", "none");


                //$("#imgPrintReports").css("margin-left", "-340px");
                //$("#btnConfirmPayment").css("margin-left", "-340px");
            }
            else {
                //22-MAR-2019 :: Nivetha :: Add Invoice Search to Orders Screen :: Started 
                $("#tdfssearch").show();
            }

            //Hide other search option
            $("#rbcust").hide();
            $('label[for="rbcust"]').hide();
            $("#rbPO").hide();
            $('label[for="rbPO"]').hide();
            $('#txtPOSearch').hide();
            $('#txtCustSearch').hide();

            // Show Invoice serach option
            $("#rbinv").prop("checked", true);
            $('#txtInvSearch').show();

            $("#fsSearch").css("width", 100);
            $("#txtInvSearch").css("width", 100);

            $("#tdPrintPickList").css("width", 45);
            $("#tdEdi").css("width", 120);
            $("#lstEDI").css("width", 80);

            //22-MAR-2019 :: Nivetha :: Add Invoice Search to Orders Screen :: End
        }

        else {
            $("#tblChkReports").show();
            $(".HideInSalesPage").hide();
            $(".ShowInSalesPage").show();
            $(".ShowInSalesInvoiceSelected").hide();
        }

        if (page.indexOf('Page=Sales') >= 0) {

            var Count = parseInt(CheckCallListAvailability($("#ctl00_LoggedInUserID").html()));
            if (Count > 0) {
                $('#rbCallList').attr('checked', true);
                ListType = "CallList";
                IsToggleCustDetails = true;
                $("#DivCustomerDetails").hide();
                $("#imgCustomerInfoToggle").attr("title", "Show Call List");
            }
        }

        $("#tdChart").css("height", ($(window).height() - 120));
        $(".ChartPleaseWaitOverlay").css("height", ($(window).height() - 110));
        $(".ChartPleaseWaitOverlay").css("width", ($(window).width() - ($(window).width() - 380)));
        $("#ChartList").css("width", ($(window).width() - ($(window).width() - 380)));
        $("#ChartList").css("height", ($(window).height() - 120));

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetDateSession',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (dateoutput, status) {
                var date = dateoutput.d;

                if (date == null || date == "" || date[0] === "" && date[1] === "") {
                    var fdate = "Today: " + $("#txtOrderToRecDate").val();
                    $("#lblOrderchosendate").html(fdate);
                    $("#lblOrderchosendate1").html($("#txtOrderFromRecDate").val());
                    $("#lblOrderchosendate2").html($("#txtOrderToRecDate").val());
                    $("#divFromDate").datepicker().datepicker('setDate', new Date());
                    $("#divToDate").datepicker().datepicker('setDate', new Date());
                    $("#imgOrderDate").attr("src", "images/Filter.png");
                    $("#tr2").addClass('FilterDivStyle');
                }
                else {
                    var fdate = date[0] + " to " + date[1];
                    $("#txtOrderFromRecDate").val(date[0]);
                    $("#txtOrderToRecDate").val(date[1]);
                    $("#lblOrderchosendate").html(fdate);
                    $("#lblOrderchosendate1").html(date[0]);
                    $("#lblOrderchosendate2").html(date[1]);
                    $("#divFromDate").datepicker('setDate', Date.parse(date[0]));
                    $("#divToDate").datepicker('setDate', Date.parse(date[1]));

                    $("#imgOrderDate").attr("src", "images/Filter.png");
                    $("#tr2").addClass('FilterDivStyle');
                }
                //FramingFilters();
                <%--if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {
                    var CarriFilter = "Date >= ctod('" + $("#txtOrderFromRecDate").val() + "')  And  Date <= ctod('" + $("#txtOrderToRecDate").val() + "')";
                }
                else {
                    var CarriFilter = "Date >= cast('" + $("#txtOrderFromRecDate").val() + "' as date)  And  Date <= cast('" + $("#txtOrderToRecDate").val() + "' as date)";
                }
                LoadCarrierFilterDropdown(CarriFilter);--%>
            }
            
        });
        if(page.indexOf('Page=Sales') >= 0) {
            TotalCompanySalesGraph("0","0");
            ShowSalesGraph();
        }

        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetCarrierFilterSession',
        //    data: "{}",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (carrieroutput, status) {
        //        //debugger;
        //        var CarrierFilter = carrieroutput.d;

        //        var CarrierList = [];
        //        $("#fgrdOrderHeader tr").each(function () {
        //            var carrrowid = $(this).attr("id").replace("row", "");
        //            if (carrrowid != 0) {
        //                var carr = $(".Carrier_" + carrrowid)[0].innerText;
        //                if (CarrierList.indexOf(carr) == -1 && carr.trim() != "") {
        //                    CarrierList.push(carr);
        //                }
        //            }
        //        });

        //        if (CarrierList.length > 0 && CarrierList != "") {
        //            LoadCarrierFilterbyCarrierDropdown(CarrierList.join(','));
        //        }

        //        if (CarrierFilter == null || CarrierFilter == "" || CarrierFilter[0] === "") {
        //            $("#lstCarrierFilter").val("");
        //        }
        //        else {
        //            $("#lstCarrierFilter").val(CarrierFilter[0]);
        //        }
        //        //FramingFilters();
        //    }
        //});



        $(function () {
            //SOFIA: 02/08/2021 - show / hide buttons when option is selected
            GetConstantForShowStandingOrderAndAlocation();
            GetConstantForShowAwbOnOrderGrid();
            var date = new Date();
            var lastMonth = date.getMonth(0) - 24;
            var currentMonth = date.getMonth();
            var currentDate = date.getDate();
            var currentYear = date.getFullYear();

            $("#divFromDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                //monthNames: [currentMonth],
                minDate: new Date(currentYear, lastMonth, currentDate),

                //maxDate: new Date(currentYear, currentMonth  , currentDate),
                onSelect: function (minDate) {
                    //$("#txtOrderFromRecDate").val(minDate);
                    $("#txtOrderFromRecDate").val(minDate);
                    $("#txtOrderToRecDate").val(minDate);
                    $("#divFromDate").datepicker("setDate", Date.parse($("#txtOrderFromRecDate").val()));
                    $("#divToDate").datepicker("setDate", minDate);
                }
            }).datepicker("setDate", new Date());

            $("#divToDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                minDate: new Date(currentYear, lastMonth, currentDate),
                //maxDate: new Date(currentYear, currentMonth, currentDate),
                onSelect: function (maxDate) {
                    //debugger;
                    // $("#txtOrderToRecDate").val(maxDate);
                    $("#txtOrderToRecDate").val(maxDate);
                }
            }).datepicker("setDate", new Date());

            $("#txtOrderFromRecDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
            $("#txtOrderToRecDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
        });

        //$("#txtOrderFromRecDate").datepicker({
        //    changeMonth: true,
        //    changeYear: true,
        //    dateFormat: 'mm/dd/yy',
        //    showOtherMonths: true,
        //    selectOtherMonths: true,
        //}).datepicker("setDate", new Date());

        //$("#txtOrderToRecDate").datepicker({
        //    changeMonth: true,
        //    changeYear: true,
        //    dateFormat: 'mm/dd/yy',
        //    showOtherMonths: true,
        //    selectOtherMonths: true,
        //}).datepicker("setDate", new Date());

        if ($("#ctl00_LoggedUserType").html() == "warehouse") {
            $("#chkInvoice").attr("disabled", true);
            //$("#tdEdi").hide();
            $("#aApproval").css('display', 'none');//hide approval icon for warehouse users.
            $("#imgCustomerInfoToggle").css('display', 'none'); //hide customercall icon for warehouse users.
            //$("#fsSearch").css('display', 'none'); //hide customer search fieldset for warehouse users.
            //$("#txtCustSearch").css('display', 'none'); //hide customer search for warehouse users.
            //$("#btnSalesSummaryReport").css('display', 'none');
            //$("#btnRelease").css('display', 'none');
        }
        var CurrentUsertype = $("#ctl00_LoggedUserType").html();
        if (CurrentUsertype == "customer" || CurrentUsertype == "warehouse" || CurrentUsertype == "cargo agent" || CurrentUsertype == "vendor") {
            $("#imgToggle").hide();
        }


        if ($("#ctl00_LoggedUserType").html() == "customer") {
            IsCustomerType = true;
            $(".HideForCustomerUserType").remove();
            $("#btnARINVSForThisCustomer").show();
            $("#btnCustomerOrder").show();
            $("#tblChkReports").css("width", "500px");
            $(".HideForCustomerUserType").hide();

        }
        else {
            IsCustomerType = false;
        }

        if ($("#ctl00_LoggedUserType").html() == "warehouse") {
            IsWHType = true;
            $("#btnOrderDetailsList").css('display', 'none');
            $("#btnOrderSummaryList").css('display', 'none');
            $("#tblChkReports").css("width", "740px");
            $("#btnUploadPOD").css('display', 'block');
            
        }
        else {
            IsWHType = false;
            $("#btnOrderDetailsList").css('display', 'block');
            $("#btnOrderSummaryList").css('display', 'block');
        }
        if ($("#ctl00_FilterDivision").html() == "True") {
            FilterDivision = "1";
        }

        if (($("#ctl00_LoggedUserType").html() == "sales person") || ($("#ctl00_LoggedUserType").html() == "employee")) {
            if (page.indexOf('Page=Order') == "-1") {
                if (hasPermissionToViewOnlyMe) {
                    $("#tdOnlyMeSalesPerson").show();
                }
                $("#aApproval").css('display', 'none');
                //$("btnOrderDetailsList").hide();
                //$("btnOrderSummaryList").hide();
            }
        }
        else {            
            if (hasPermissionToViewOnlyMe) {
                $("#tdOnlyMeSalesPerson").show();
            }    //Change by Prashant on 05 June 2020 To Display Only Me Option for all users 
            else {
                $("#tdOnlyMeSalesPerson").hide();
            }
        }
        
        if ($("#ctl00_LoggedUserType").html() == "credit manager") { //hide onlyme & edi for credit manger
            if (page.indexOf('Page=Order') == "40") {
                $("#tdOnlyMeSalesPerson").hide();
                $("#tdEdi").hide();
            }
        }
        if ($("#ctl00_LoggedUserType").html() == "warehouse") { //hide onlyme & edi for credit manger
            if (page.indexOf('Page=Order') == "40") {
                $("#tdOnlyMeSalesPerson").hide();
                $("#btnConfirmPayment").hide();
            }
        }

        if ($("#fgrdOrderSalesHeader").html() == null || $("#fgrdOrderSalesHeader").html() == undefined) {
            //fgrdOrderSalesHeader();
            GetConstantForShowAwbOnOrderGrid();
        }

        var hasPermissionToApprovePriceChange = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(64, 1).ToString()%>' == "Y" ? true : false;
        if (!hasPermissionToApprovePriceChange) {
            $("#aApproval").css('display', 'none');
        }

        $("#txtSalesSummaryFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtSalesSummaryToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtSPORDShipDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#txtAllocationCargoDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        $("#btnViewSales").on("click", function () {
            var onlyCanSeeOwnSales = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(24, 1).ToString()%>' == "Y" ? true : false;
            if ($("#btnViewSales").val() != "View Sales" && !onlyCanSeeOwnSales) {
                $("#ddlSalesMan").removeClass("hiddenForUserType");
                $("#ddlGraphType").removeClass("hiddenForUserType");
            } else {
                $("#ddlSalesMan").addClass("hiddenForUserType");
                $("#ddlGraphType").addClass("hiddenForUserType");
            }

            var checkOnlyMe = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(25, 1).ToString()%>' == "Y" ? true : false;
            if (checkOnlyMe) {
                $("#ddlSalesMan").addClass("hiddenForUserType");
                $("#ddlGraphType").addClass("hiddenForUserType");
            }
        })
        $("#btnNewCustomer").die("click").live("click", function () {
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
                        $("#hdnCustomerSalesYN").val("Y");                      
                    }
                });
            }
            else {
                $("#DivCustomerPage").dialog("open");
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
        $("#ddlSalesMan").on("change", function () {
            if ($("#ddlGraphType").val() == "Monthly")
            {
                TotalCompanySalesGraph("0", $(this).val());
                ShowSalesGraph();
            }
        })
        $("#ddlGraphType").on("change", function () {
            $("#ddlSalesMan").val("0");
            if ($(this).val() == "Today") {
                GetSalesPersonWiseDailyDataForGraphs();
            } else {
                TotalCompanySalesGraph("0", $("#ddlSalesMan").val());
                ShowSalesGraph();
            }
            
        })

        if ($("#ctl00_LoggedUserType").html() == "sales manager" || $("#ctl00_LoggedUserType").html() == "owner") {
            $("#ddlSalesMan").removeClass("hiddenForUserType");
            $("#ddlGraphType").removeClass("hiddenForUserType");
        }
        if ($('#chkShowAllSalesPersonSales').is(':checked') == true) {
            $("#ddlSalesMan").addClass("hiddenForUserType");
            $("#ddlGraphType").addClass("hiddenForUserType");
        }
        else {
            $("#ddlSalesMan").removeClass("hiddenForUserType");
            $("#ddlGraphType").removeClass("hiddenForUserType");
        }
        $("#imgUserLoader").hide();

        var onlyCanSeeOwnSales = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(24, 1).ToString()%>' == "Y" ? true : false;

        if (onlyCanSeeOwnSales) {
            $("#tdOnlyMeSalesPerson").hide();
            $("#ddlSalesMan").addClass("hiddenForUserType");
        } else {
            $("#tdOnlyMeSalesPerson").show();
            $("#ddlSalesMan").removeClass("hiddenForUserType");
        }

        var checkOnlyMe = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(25, 1).ToString()%>' == "Y" ? true : false;
        if (checkOnlyMe) {
            setTimeout(function () {
                $("#chkShowAllSalesPersonSales").prop("checked", true);
                $("#chkShowAllSalesPersonSales").trigger("change");
            },100)
        }
        var CanSeeSalesDetails = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(47, 1).ToString()%>' == "Y" ? true : false;
        var CanSeeViewSummary = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(48, 1).ToString()%>' == "Y" ? true : false;

        if (!CanSeeSalesDetails) {
            $("#btnOrderDetailsList").remove();
            $("#btnOrderDetailsList").hide();
        }

        if (!CanSeeViewSummary) {
            $("#btnOrderSummaryList").remove();
            $("#btnOrderSummaryList").hide();
        }
    });

    function GetConstantForShowAwbOnOrderGrid() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetConstantForShowAwbOnOrderGrid',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                isAwbVisibleOnOrderGrid = output.d;
                if ($("#fgrdOrderSalesHeader").html() == null || $("#fgrdOrderSalesHeader").html() == undefined) {
                    fgrdOrderSalesHeader();
                }
                if (isAwbVisibleOnOrderGrid == true) {
                    $("#btnAWB").show();
                }
                else {
                    $("#btnAWB").hide();
                }
            }
        });
    }
    //SOFIA: 02/08/2021 - show / hide buttons when option is selected
    function GetConstantForShowStandingOrderAndAlocation() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetConstantForShowStandingOrderAndAlocation',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;               
                if (output.d == "1") {
                    $("#btnSPORDInvoice").show();
                    $("#btnAllocation").show();
                } else {
                    $("#btnSPORDInvoice").hide();
                    $("#btnAllocation").hide();
                }
            }
        });
    }

    function fgrdOrderSalesHeader() {
        var IsGPMYN = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(84, 1).ToString()%>' == "Y" ? true : false;
        $("#fgrdOrderHeader").flexigrid({
            url: 'BloomService.asmx/GetSalesOrderHeaderListNew',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="Orderselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: 'INV#', name: 'Order', width: 39, sortable: true, align: 'right' },
                { display: 'CUST#', name: 'Customer', width: 30, sortable: true, align: 'right' },
                { display: 'Name', name: 'CustomerName', width: 240, sortable: true, align: 'left' },
                { display: 'AWB', name: 'AWB', width: 70, sortable: true, align: 'left', hide: !isAwbVisibleOnOrderGrid },
                { display: 'Date', name: 'OrderDate', width: 55, sortable: true, align: 'left' },
                { display: 'Day', name: 'Day', width: 28, sortable: true, align: 'Center' },
                { display: 'Carrier', name: 'Carrier', width: 20, sortable: true, align: 'left', title: 'Carrier' },
                { display: 'State', name: 'State', width: 16, sortable: true, align: 'left', title: 'State' },
                { display: 'Country', name: 'Country', width: 16, sortable: true, align: 'left', title: 'Country' },
                { display: 'WH', name: 'wh', width: 20, sortable: true, align: 'left' },
                { display: 'Confirmed', name: 'confirmed', width: 30, sortable: false, align: 'left', hide: !isAwbVisibleOnOrderGrid },
                { display: 'Terms', name: 'Terms', width: 30, sortable: true, align: 'left' },
                { display: 'Printed', name: 'Printed', width: 20, sortable: true, align: 'left' },
                { display: 'Picking', name: 'List', width: 20, sortable: true, align: 'left' },
                { display: 'Bills', name: 'Bills', width: 20, sortable: true, align: 'left' },
                { display: 'Scan', name: 'Scanned', width: 20, sortable: true, align: 'left' },//width-20->40
                { display: 'Shipto', name: 'Shipto', width: 80, sortable: true, align: 'left' },
                { display: 'PO#', name: 'PO', width: 60, sortable: true, align: 'left' },
                { display: '', name: 'Type', width: 15, sortable: false, align: 'center' },
                { display: 'Weight', name: 'Weight', width: 30, sortable: false, align: 'right', hide: true },
                { display: 'Cubes', name: 'Cubes', width: 50, sortable: false, align: 'right' },
                { display: 'Pcs', name: 'Boxes', width: 30, sortable: true, align: 'right' },
                { display: 'FBE', name: 'FBE', width: 50, sortable: false, align: 'right' },
                { display: '$Inv.Amount', name: 'invamount', width: 80, sortable: true, align: 'right', hide: IsWHType }, // hide this column for warehose login
                { display: '%GPM', name: 'gpm', width: 40, hide: true, sortable: true, align: 'right', hide: ((IsWHType == true || IsGPMYN == false) ? true : IsCustomerType)},//hide this column for both customer and warehouse login
                //{ display: '%GPM', name: 'gpm', width: 60, hide: false, sortable: true, align: 'right' },
                { display: 'Missing', name: 'ScannedBox', width: 30, sortable: false, align: 'right', hide: IsCustomerType },
                { display: '', name: '', width: 15, sortable: false, align: 'center', hide: true },
                { display: '', name: '', width: 15, sortable: false, align: 'center', hide: true },
                { display: 'Sales Person', name: 'SalesManName', width: 90, sortable: true, align: 'left' },
                { display: 'FOBAmount', name: 'FOBAmount', width: 90, sortable: true, align: 'left', hide: true },
                { display: 'INVCOST', name: 'INVCOST', width: 90, sortable: true, align: 'left', hide: true },
                { display: 'ClosedOrder', name: 'ClosedOrder', width: 90, sortable: true, align: 'left', hide: true },
                { display: 'SLSMAN', name: 'SLSMAN', width: 90, sortable: true, align: 'left', hide: true },
                { display: 'POD', name: 'PODFILE', width: 40, sortable: true, align: 'center' },
                { display: 'Emailed', name: 'Emailed', width: 35, sortable: true, align: 'left' }
            ],
            searchitems: [
                { display: 'INV#', name: '[Order]' },
                { display: 'CUST#', name: 'Customer' },
                { display: 'Name', name: 'CustomerName' },
                { display: 'Date', name: 'OrderDate' },
                { display: 'WH', name: 'WH' },
                { display: 'AWB', name: 'AWB' },
                { display: 'Carrier', name: 'Carrier' },
                { display: 'State', name: 'State' },
                { display: 'Country', name: 'Country' },
                { display: 'Terms', name: 'Terms' },
                { display: 'Printed', name: 'Printed' },
                { display: 'Picking', name: 'List' },
                { display: 'Bills', name: 'Bills' },
                { display: 'Scanned', name: 'Scanned' },
                { display: 'Shipto', name: 'SHIPTONAME' },
                { display: 'Customer PO#', name: 'PO' },
                { display: 'Pieces', name: 'Boxes' },
                { display: 'Sales Person', name: 'SalesManName' },
                { display: 'Missing', name: 'Boxes-ScannedBox' },

                //{ display: 'FBE', name: 'FBE' },
                //{ display: '$Inv.Amount', name: 'InvAmount' },
                //{ display: '%GPM', name: 'gpm' },
            ],
            showTableToggleBtn: true,
            //sortname: "OrderDate Desc,CustomerName asc",
            sortname: "[Order] Asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "[Order]",
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 249,
            width: $(window).width() - 10,
            striped: true,
            params: [
                { name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: '' }, { name: 'FilterDivision', value: FilterDivision }
            ],
            onSuccess: function () {
                $("#DivOrderHeader .flexigrid").css("min-width", "950px");
                $(".imgLoaderForUser").hide();
                //For to show the error
                if ($("#fgrdOrderHeader tr#row-2").length > 0) {
                    $("#fgrdOrderHeader tr#row-2").hide();
                    $.MessageBox($("#fgrdOrderHeader tr#row-2")[0].innerText);
                    return false;
                }

                $('#tdChart').hide();


                //if ($("#ctl00_ChartVisibility").html() == "True") {
                //    $("#tdChart").show();
                //    var Query = $("#fgrdOrderHeader").flexOptions()[0].p.query;
                //    if (IsChartLoad == "0") {
                //        LoadPieChartByFilters();
                //        IsChartLoad = "1";
                //    }
                //    else if (Query != "") {
                //        LoadPieChartByFilters();
                //        IsChartLoad = "1";
                //    }
                //    $("#DivOrderHeader div.flexigrid").css("width", $(window).width() - 400);
                //}
                var sel = jQuery("#fgrdOrderHeader tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#imgToggle").show();
                    $("#DivOrderHeader #ExportCSV").show();
                    //GetChartVisibility();

                    //$("#tdChart").hide();   // Make toggle inactive as default.
                    $("#DivOrderHeader div.flexigrid").css("width", $(window).width() - 10);



                    $("#fgrdOrderHeader [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdOrderHeader td.unsorted").addClass("sorted");
                    $("#fgrdOrderHeader td.sorted").removeClass("unsorted");
                    $("#fgrdOrderHeader [id^=row] td.sorted").addClass("unsorted");
                    $("#fgrdOrderHeader [id^=row] td.unsorted").removeClass("sorted");

                    //$('#fgrdOrderHeader #row0 td:nth-child(16) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '12px' });
                    //$('#fgrdOrderHeader #row0 td:nth-child(19) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    //$('#fgrdOrderHeader #row0 td:nth-child(20) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    //$('#fgrdOrderHeader #row0 td:nth-child(21) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
                    //$('#fgrdOrderHeader #row0 td:nth-child(22) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

                    //VEN::For Total Row Tool Tip
                    //===================================
                    //$('#fgrdOrderHeader #row0 td:nth-child(13) div').attr("title", $('#fgrdOrderHeader #row0 td:nth-child(12) div').html());
                    //$('#fgrdOrderHeader #row0 td:nth-child(14) div').attr("title", $('#fgrdOrderHeader #row0 td:nth-child(13) div').html());
                    //$('#fgrdOrderHeader #row0 td:nth-child(15) div').attr("title", $('#fgrdOrderHeader #row0 td:nth-child(14) div').html());
                    //$('#fgrdOrderHeader #row0 td:nth-child(16) div').attr("title", $('#fgrdOrderHeader #row0 td:nth-child(15) div').html());

                    $('#fgrdOrderHeader #row0').addClass("TotalRows")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(20) div").html("Weight<br><div class='totalRowFontStyle'>" + $("#fgrdOrderHeader").find('tr.TotalRows').find("td:eq(20) div").html() + "</b>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(21) div").html("Cubes<br><div class='totalRowFontStyle'>" + $("#fgrdOrderHeader").find('tr.TotalRows').find("td:eq(21) div").html() + "</b>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(22) div").html("Pcs<br><div class='totalRowFontStyle'>" + $("#fgrdOrderHeader").find('tr.TotalRows').find("td:eq(22) div").html() + "</b>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(23) div").html("FBE<br><div class='totalRowFontStyle'>" + $("#fgrdOrderHeader").find('tr.TotalRows').find("td:eq(23) div").html() + "</b>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(24) div").html("$Inv.Amount<br><div class='totalRowFontStyle'>" + $("#fgrdOrderHeader").find('tr.TotalRows').find("td:eq(24) div").html() + "</b>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(25) div").html("%GPM<br><div class='totalRowFontStyle'>" + $("#fgrdOrderHeader").find('tr.TotalRows').find("td:eq(25) div").html() + "</b>")
                }
                else {
                    $("#ExportCSV").hide();
                    $('#fgrdOrderHeader #row0').removeClass("TotalRows");
                    $("#DivOrderHeader div.flexigrid").css("width", $(window).width() - 10); //original grid size
                    $("#DivOrderHeader div.hDivBox").find("th:eq(20) div").html("Weight<br><div class='totalRowFontStyle'>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(21) div").html("Cubes<br><div class='totalRowFontStyle'>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(22) div").html("Pcs<br><div class='totalRowFontStyle'>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(23) div").html("FBE<br><div class='totalRowFontStyle'>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(24) div").html("$Inv.Amount<br><div class='totalRowFontStyle'>")
                    $("#DivOrderHeader div.hDivBox").find("th:eq(25) div").html("%GPM<br><div class='totalRowFontStyle'>")

                    $("#DivOrderHeader div.hDivBox th div").removeClass("totalRowFontStyle");
                }
                $('#DivOrderHeader [value="Clear"]').click();

                //debugger;

                $("#DivOrderHeader .sDiv").css('float', 'left').css('width', '545px');
                $('#DivOrderHeader .pDiv').css('padding', '2px').css('border-left', '0px');
                $('#DivOrderHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
                //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
                $("#DivOrderHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
                //$("#divInventoryDetailByFarm .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
                $("#DivOrderHeader .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
                //FramingFilters();                        
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    //var myVar = setInterval(function () { myTimer() }, 3000);
    //function myTimer() {
    //    $(document).off("#tdChart");
    //    //$.getJSON().ajaxStart(function () { 'kill preloader' });
    //    GetChartVisibility();
    //}

    function GetChartVisibility() {

        if ($("#ctl00_ChartVisibility").html() == "True" && $("#ctl00_LoggedUserType").html() != "warehouse") {
            $("#imgToggle").show();
            $("#tdChart").show();
            var Query = $("#fgrdOrderHeader").flexOptions()[0].p.query;
            if (IsChartLoad == "0") {
                LoadPieChartByFilters();
                IsChartLoad = "1";
            }
            else if (Query != "") {
                LoadPieChartByFilters();
                IsChartLoad = "1";
            }
            // $("#DivOrderHeader div.flexigrid").css("width", $(window).width() - 400);
        }
    }

    $("[id^=EmailedPoSelect_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var SelectedPo = sourceCtl.context.id.split('_')[1];
        debugger;
        $("#fgrdEmailLogList").flexOptions({ params: [{ name: 'EmailType', value: 'INVOICE' }, { name: 'EmailedDocumentNumber', value: SelectedPo }], query: "", newp: 1 }).flexReload();

        $("#DivEmailLog").dialog('option', 'title', 'EMAIL LOG');
        $("#DivEmailLog").dialog("open");
    });

    //$(document).ajaxComplete(function () {
    //    if ($("#ctl00_ChartVisibility").html() == "True") {
    //        $("#tdChart").show();
    //        var Query = $("#fgrdOrderHeader").flexOptions()[0].p.query;
    //        if (IsChartLoad == "0") {
    //            LoadPieChartByFilters();
    //            IsChartLoad = "1";
    //        }
    //        else if (Query != "") {
    //            LoadPieChartByFilters();
    //            IsChartLoad = "1";
    //        }
    //        $("#DivOrderHeader div.flexigrid").css("width", $(window).width() - 400);
    //    }
    //});

    $("#DivOrderHeader .flexigrid .sDiv .sDiv2 input[value=Clear]").die("click").live("click", function () {
        IsChartLoad = "0";
    });

    $("#DivOrderHeader .flexigrid .pDiv .pDiv2 .pGroup .pReload.pButton").die("click").live("click", function () {
        IsChartLoad = "0";
    });


    //MANI:27-06-2016-Single request for chart and restrict multiple request call using before
    function LoadPieChartByFilters() {
        $(".ChartPleaseWaitOverlay").show();
        var Query = $("#fgrdOrderHeader").flexOptions()[0].p.query;
        var QueryType = $("#fgrdOrderHeader").flexOptions()[0].p.qtype;
        var RP = $("#fgrdOrderHeader").flexOptions()[0].p.rp;
        var Page = $("#fgrdOrderHeader").flexOptions()[0].p.page;
        if (J1_8($("#accordion"))[0].className == "ui-accordion ui-widget ui-helper-reset")
            J1_8($("#accordion")).accordion('destroy');

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetOrderChart',
            data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    //For Sales Person Chart
                    $("#js-legend-SalesPerson").html("");
                    $('#chart-area-SalesPerson').remove();
                    if (output.d[0] != "" && output.d[0] != null) {
                        var SalesPersonChartDetails = output.d[0];
                        //VEN::For Sales Person Chart
                        $("#js-legend-SalesPerson").show();
                        $("#canvas-holder-SalesPerson").show();
                        $('#canvas-holder-SalesPerson').append('<canvas id="chart-area-SalesPerson"  style="border-radius:50%;box-shadow: 0px 0px 5px;" width="170" height="170" />');
                        var mypieSalesPerson = new ChartX(document.getElementById("chart-area-SalesPerson").getContext("2d")).Pie(SalesPersonChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-SalesPerson').innerHTML = mypieSalesPerson.generateLegend();
                        $("#canvas-holder-SalesPerson").unbind().click(
                            function (evt) {
                                var activePoints = mypieSalesPerson.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }

                    ////For Carrier Chart by FBE
                    //$("#js-legend-CarrierFBE").html("");
                    //$('#chart-area-CarrierFBE').remove();
                    //if (output.d[0] != "" && output.d[0] != null) {
                    //    $("#js-legend-CarrierFBE").show();
                    //    $("#canvas-holder-CarrierFBE").show();
                    //    $('#canvas-holder-CarrierFBE').append('<canvas id="chart-area-CarrierFBE"  style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
                    //    var myPie = new Chart(document.getElementById("chart-area-CarrierFBE").getContext("2d")).Pie(output.d, {
                    //        animationSteps: 20,
                    //        animationEasing: 'easeInOutQuart',

                    //    });
                    //    document.getElementById('js-legend-CarrierFBE').innerHTML = myPie.generateLegend();
                    //    $("#canvas-holder-CarrierFBE").unbind().click(
                    //            function (evt) {
                    //                var activePoints = myPie.getSegmentsAtEvent(evt);
                    //                alert(activePoints[0].label);
                    //            });
                    //}

                    //For Carrier Chart by PCS
                    $("#js-legend-CarrierPcs").html("");
                    $('#chart-area-CarrierPcs').remove();
                    if (output.d[1] != "" && output.d[1] != null) {
                        $("#js-legend-CarrierPcs").show();
                        $("#canvas-holder-CarrierPcs").show();
                        $('#canvas-holder-CarrierPcs').append('<canvas id="chart-area-CarrierPcs" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
                        var myPie = new ChartX(document.getElementById("chart-area-CarrierPcs").getContext("2d")).Pie(output.d[1], {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-CarrierPcs').innerHTML = myPie.generateLegend();
                        $("#canvas-holder-CarrierPcs").unbind().click(
                            function (evt) {
                                var activePoints = myPie.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }

                    //For State Chart by Boxes
                    $("#js-legend-State-Boxes").html("");
                    $('#chart-area-State-Boxes').remove();
                    if (output.d[2] != "" && output.d[2] != null) {
                        var StateChartDetails = output.d[2];
                        //VEN::For State Chart
                        $("#js-legend-State-Boxes").show();
                        $("#canvas-holder-State-Boxes").show();
                        $('#canvas-holder-State-Boxes').append('<canvas id="chart-area-State-Boxes" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
                        var mypieState = new ChartX(document.getElementById("chart-area-State-Boxes").getContext("2d")).Pie(StateChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-State-Boxes').innerHTML = mypieState.generateLegend();
                        $("#canvas-holder-State-Boxes").unbind().click(
                            function (evt) {
                                var activePoints = mypieState.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }

                    //For State Chart by Sales
                    $("#js-legend-State-Sales").html("");
                    $('#chart-area-State-Sales').remove();
                    if (output.d[3] != "" && output.d[3] != null) {
                        var StateChartDetails = output.d[3];
                        //VEN::For State Chart
                        $("#js-legend-State-Sales").show();
                        $("#canvas-holder-State-Sales").show();
                        $('#canvas-holder-State-Sales').append('<canvas id="chart-area-State-Sales" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
                        var mypieState = new ChartX(document.getElementById("chart-area-State-Sales").getContext("2d")).Pie(StateChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-State-Sales').innerHTML = mypieState.generateLegend();
                        $("#canvas-holder-State-Sales").unbind().click(
                            function (evt) {
                                var activePoints = mypieState.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }


                    //For Flower Color Chart by Boxes
                    $("#js-legend-Color-Boxes").html("");
                    $('#chart-area-Color-Boxes').remove();
                    if (output.d[4] != "" && output.d[4] != null) {
                        var ColorChartDetails = output.d[4];
                        //VEN::For Flower Color Chart
                        $("#js-legend-Color-Boxes").show();
                        $("#canvas-holder-Color-Boxes").show();
                        $('#canvas-holder-Color-Boxes').append('<canvas id="chart-area-Color-Boxes" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
                        var mypieColor = new ChartX(document.getElementById("chart-area-Color-Boxes").getContext("2d")).Pie(ColorChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-Color-Boxes').innerHTML = mypieColor.generateLegend();
                        $("#canvas-holder-Color-Boxes").unbind().click(
                            function (evt) {
                                var activePoints = mypieColor.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }

                    //For Flower Color Chart by Sales
                    $("#js-legend-Color-Sales").html("");
                    $('#chart-area-Color-Sales').remove();
                    if (output.d[5] != "" && output.d[5] != null) {
                        var ColorChartDetails = output.d[5];
                        //VEN::For Flower Color Chart
                        $("#js-legend-Color-Sales").show();
                        $("#canvas-holder-Color-Sales").show();
                        $('#canvas-holder-Color-Sales').append('<canvas id="chart-area-Color-Sales" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
                        var mypieColor = new ChartX(document.getElementById("chart-area-Color-Sales").getContext("2d")).Pie(ColorChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-Color-Sales').innerHTML = mypieColor.generateLegend();
                        $("#canvas-holder-Color-Sales").unbind().click(
                            function (evt) {
                                var activePoints = mypieColor.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }

                    //For Flower Category Chart
                    $("#js-legend-Cat").html("");
                    $('#chart-area-Cat').remove();
                    if (output.d[6] != "" && output.d[6] != null) {
                        var CatChartDetails = output.d[6];
                        //VEN::For Flower Cat Chart
                        $("#js-legend-Cat").show();
                        $("#canvas-holder-Cat").show();
                        $('#canvas-holder-Cat').append('<canvas id="chart-area-Cat" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
                        var mypieCat = new ChartX(document.getElementById("chart-area-Cat").getContext("2d")).Pie(CatChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-Cat').innerHTML = mypieCat.generateLegend();
                        $("#canvas-holder-Cat").unbind().click(
                            function (evt) {
                                var activePoints = mypieCat.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }

                    //For Flower Description Chart
                    $("#js-legend-Desc").html("");
                    $('#chart-area-Desc').remove();
                    if (output.d[7] != "" && output.d[7] != null) {
                        var DescChartDetails = output.d[7];
                        //VEN::For Flower Desc Chart
                        $("#js-legend-Desc").show();
                        //$("#canvas-holder-Desc").show();
                        $("#canvas-holder-Desc").hide();
                        $('#canvas-holder-Desc').append('<canvas id="chart-area-Desc" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="170" height="170" />');
                        var mypieDesc = new ChartX(document.getElementById("chart-area-Desc").getContext("2d")).Pie(DescChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-Desc').innerHTML = mypieDesc.generateLegend();
                        $("#canvas-holder-Desc").unbind().click(
                            function (evt) {
                                var activePoints = mypieDesc.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }



                    //For customer chart
                    $("#js-legend-Customer").html("");
                    $('#chart-area-Customer').remove();
                    if (output.d[8] != "" && output.d[8] != null) {
                        var CustomerChartDetails = output.d[8];
                        $("#js-legend-Customer").show();
                        //$("#canvas-holder-Customer").show();
                        $("#canvas-holder-Customer").hide();
                        $('#canvas-holder-Customer').append('<canvas id="chart-area-Customer" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="170" height="170" />');
                        var mypieDesc = new ChartX(document.getElementById("chart-area-Customer").getContext("2d")).Pie(CustomerChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-Customer').innerHTML = mypieDesc.generateLegend();
                        $("#canvas-holder-Customer").unbind().click(
                            function (evt) {
                                var activePoints = mypieDesc.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }
                    //Mani::For Sales Type Chart
                    $("#js-legend-SalesType").html("");
                    $('#chart-area-SalesType').remove();
                    if (output.d[0] != "" && output.d[0] != null) {
                        var SalesTypeChartDetails = output.d[9];
                        //Mani::For Sales Type Chart
                        $("#js-legend-SalesType").show();
                        $("#canvas-holder-SalesType").show();
                        $('#canvas-holder-SalesType').append('<canvas id="chart-area-SalesType"  style="border-radius:50%;box-shadow: 0px 0px 5px;" width="170" height="170" />');
                        var mypieSalesPerson = new ChartX(document.getElementById("chart-area-SalesType").getContext("2d")).Pie(SalesTypeChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-SalesType').innerHTML = mypieSalesPerson.generateLegend();
                        $("#canvas-holder-SalesType").unbind().click(
                            function (evt) {
                                var activePoints = mypieSalesPerson.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }

                    //carrier chartby fbe
                    $("#js-legend-CarrierFBE").html("");
                    $('#chart-area-CarrierFBE').remove();
                    if (output.d[10] != "" && output.d[10] != null) {
                        //debugger;
                        var CarrierFBEChartDetails = output.d[10];
                        //Mani::For Sales CarrierFBE Chart
                        $("#js-legend-CarrierFBE").show();
                        $("#canvas-holder-CarrierFBE").show();
                        $('#canvas-holder-CarrierFBE').append('<canvas id="chart-area-CarrierFBE"  style="border-radius:50%;box-shadow: 0px 0px 5px;" width="170" height="170" />');
                        var myPieCarrierFBE = new ChartX(document.getElementById("chart-area-CarrierFBE").getContext("2d")).Pie(CarrierFBEChartDetails, {
                            animationSteps: 20,
                            animationEasing: 'easeInOutQuart',

                        });
                        document.getElementById('js-legend-CarrierFBE').innerHTML = myPieCarrierFBE.generateLegend();
                        $("#canvas-holder-CarrierFBE").unbind().click(
                            function (evt) {
                                var activePoints = myPieCarrierFBE.getSegmentsAtEvent(evt);
                                alert(activePoints[0].label);
                            });
                    }

                    J1_8($("#accordion")).accordion({
                        collapsible: true
                    });
                    $(".ChartPleaseWaitOverlay").hide();
                    $("#tdChart").show();
                    $("#accordion div.ui-accordion-content").hover(
                        function () { $(this).addClass("hover"); },
                        function () { $(this).removeClass("hover"); });

                    //STA::19-NOV-2015::to change the chart every fifteen seconds                                                      
                    var i = 2;
                    MyChartTimer = function () {
                        myChartInterval = setInterval(function () {
                            i = $("#accordion").find("h3.ui-accordion-header-active").index();
                            if ($("#accordion")[0].children[i + 1].className.indexOf("ui-accordion-content-active hover") < 0) {
                                i = i + 2;
                            }
                            else {
                                i = i + 0;
                            }

                            if (i == $("#accordion")[0].children.length)
                                i = 0;
                            if ($("#accordion")[0].children[i].className.indexOf("ui-accordion-header-active") < 0)
                                $($("#accordion")[0].children[i]).click();;

                        }, 15000);
                    }
                    MyChartTimer();
                }
                else {
                    $(".ChartPleaseWaitOverlay").hide();
                    $("#ChartList").hide();
                }
            }
        });
    }

    //Commented by MANI restrict multiple request call for chart
    //function LoadPieChartByFilters() {
    //    $(".ChartPleaseWaitOverlay").show();
    //    var Query = $("#fgrdOrderHeader").flexOptions()[0].p.query;
    //    var QueryType = $("#fgrdOrderHeader").flexOptions()[0].p.qtype;
    //    var RP = $("#fgrdOrderHeader").flexOptions()[0].p.rp;
    //    var Page = $("#fgrdOrderHeader").flexOptions()[0].p.page;
    //    if (J1_8($("#accordion"))[0].className == "ui-accordion ui-widget ui-helper-reset")
    //        J1_8($("#accordion")).accordion('destroy');
    //    //For Carrier Chart by FBE
    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/GetDistinctCarrierDetailsForChartbyFBE',
    //        data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output, status) {
    //            $("#js-legend-CarrierFBE").html("");
    //            $('#chart-area-CarrierFBE').remove();
    //            if (output.d != "" && output.d != null) {
    //                $("#js-legend-CarrierFBE").show();
    //                $("#canvas-holder-CarrierFBE").show();
    //                $('#canvas-holder-CarrierFBE').append('<canvas id="chart-area-CarrierFBE"  style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
    //                var myPie = new Chart(document.getElementById("chart-area-CarrierFBE").getContext("2d")).Pie(output.d, {
    //                    animationSteps: 20,
    //                    animationEasing: 'easeInOutQuart',

    //                });
    //                document.getElementById('js-legend-CarrierFBE').innerHTML = myPie.generateLegend();
    //                $("#canvas-holder-CarrierFBE").unbind().click(
    //                        function (evt) {
    //                            var activePoints = myPie.getSegmentsAtEvent(evt);
    //                            alert(activePoints[0].label);
    //                        });
    //            }
    //            $.ajax({
    //                type: "POST",
    //                url: 'BloomService.asmx/GetDistinctCarrierDetailsForChartbyPcs',
    //                data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                success: function (output, status) {
    //                    $("#js-legend-CarrierPcs").html("");
    //                    $('#chart-area-CarrierPcs').remove();
    //                    if (output.d != "" && output.d != null) {
    //                        $("#js-legend-CarrierPcs").show();
    //                        $("#canvas-holder-CarrierPcs").show();
    //                        $('#canvas-holder-CarrierPcs').append('<canvas id="chart-area-CarrierPcs" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
    //                        var myPie = new Chart(document.getElementById("chart-area-CarrierPcs").getContext("2d")).Pie(output.d, {
    //                            animationSteps: 20,
    //                            animationEasing: 'easeInOutQuart',

    //                        });
    //                        document.getElementById('js-legend-CarrierPcs').innerHTML = myPie.generateLegend();
    //                        $("#canvas-holder-CarrierPcs").unbind().click(
    //                                function (evt) {
    //                                    var activePoints = myPie.getSegmentsAtEvent(evt);
    //                                    alert(activePoints[0].label);
    //                                });
    //                    }

    //                    //For State Chart
    //                    $.ajax({
    //                        type: "POST",
    //                        url: 'BloomService.asmx/GetDistinctStateDetailsForChartbySales',
    //                        data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //                        contentType: "application/json; charset=utf-8",
    //                        dataType: "json",
    //                        success: function (output, status) {
    //                            $("#js-legend-State-Sales").html("");
    //                            $('#chart-area-State-Sales').remove();
    //                            if (output.d != "" && output.d != null) {
    //                                var StateChartDetails = output.d;
    //                                //VEN::For State Chart
    //                                $("#js-legend-State-Sales").show();
    //                                $("#canvas-holder-State-Sales").show();
    //                                $('#canvas-holder-State-Sales').append('<canvas id="chart-area-State-Sales" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
    //                                var mypieState = new Chart(document.getElementById("chart-area-State-Sales").getContext("2d")).Pie(StateChartDetails, {
    //                                    animationSteps: 20,
    //                                    animationEasing: 'easeInOutQuart',

    //                                });
    //                                document.getElementById('js-legend-State-Sales').innerHTML = mypieState.generateLegend();
    //                                $("#canvas-holder-State-Sales").unbind().click(
    //                                        function (evt) {
    //                                            var activePoints = mypieState.getSegmentsAtEvent(evt);
    //                                            alert(activePoints[0].label);
    //                                        });
    //                            }
    //                            $.ajax({
    //                                type: "POST",
    //                                url: 'BloomService.asmx/GetDistinctStateDetailsForChartbyBoxes',
    //                                data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //                                contentType: "application/json; charset=utf-8",
    //                                dataType: "json",
    //                                success: function (output, status) {
    //                                    $("#js-legend-State-Boxes").html("");
    //                                    $('#chart-area-State-Boxes').remove();
    //                                    if (output.d != "" && output.d != null) {
    //                                        var StateChartDetails = output.d;
    //                                        //VEN::For State Chart
    //                                        $("#js-legend-State-Boxes").show();
    //                                        $("#canvas-holder-State-Boxes").show();
    //                                        $('#canvas-holder-State-Boxes').append('<canvas id="chart-area-State-Boxes" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
    //                                        var mypieState = new Chart(document.getElementById("chart-area-State-Boxes").getContext("2d")).Pie(StateChartDetails, {
    //                                            animationSteps: 20,
    //                                            animationEasing: 'easeInOutQuart',

    //                                        });
    //                                        document.getElementById('js-legend-State-Boxes').innerHTML = mypieState.generateLegend();
    //                                        $("#canvas-holder-State-Boxes").unbind().click(
    //                                                function (evt) {
    //                                                    var activePoints = mypieState.getSegmentsAtEvent(evt);
    //                                                    alert(activePoints[0].label);
    //                                                });
    //                                    }

    //                                    //For Sales Person Chart
    //                                    $.ajax({
    //                                        type: "POST",
    //                                        url: 'BloomService.asmx/GetDistinctSalesManDetailsForChart',
    //                                        data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //                                        contentType: "application/json; charset=utf-8",
    //                                        dataType: "json",
    //                                        success: function (output, status) {
    //                                            $("#js-legend-SalesPerson").html("");
    //                                            $('#chart-area-SalesPerson').remove();
    //                                            if (output.d != "" && output.d != null) {
    //                                                var SalesPersonChartDetails = output.d;
    //                                                //VEN::For Sales Person Chart
    //                                                $("#js-legend-SalesPerson").show();
    //                                                $("#canvas-holder-SalesPerson").show();
    //                                                $('#canvas-holder-SalesPerson').append('<canvas id="chart-area-SalesPerson"  style="border-radius:50%;box-shadow: 0px 0px 5px;" width="170" height="170" />');
    //                                                var mypieSalesPerson = new Chart(document.getElementById("chart-area-SalesPerson").getContext("2d")).Pie(SalesPersonChartDetails, {
    //                                                    animationSteps: 20,
    //                                                    animationEasing: 'easeInOutQuart',

    //                                                });
    //                                                document.getElementById('js-legend-SalesPerson').innerHTML = mypieSalesPerson.generateLegend();
    //                                                $("#canvas-holder-SalesPerson").unbind().click(
    //                                                        function (evt) {
    //                                                            var activePoints = mypieSalesPerson.getSegmentsAtEvent(evt);
    //                                                            alert(activePoints[0].label);
    //                                                        });
    //                                            }
    //                                            //For Flower Color Chart
    //                                            $.ajax({
    //                                                type: "POST",
    //                                                url: 'BloomService.asmx/GetDistinctFlowerColorDetailsForChartbyBoxes',
    //                                                data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //                                                contentType: "application/json; charset=utf-8",
    //                                                dataType: "json",
    //                                                success: function (output, status) {
    //                                                    $("#js-legend-Color-Boxes").html("");
    //                                                    $('#chart-area-Color-Boxes').remove();
    //                                                    if (output.d != "" && output.d != null) {
    //                                                        var ColorChartDetails = output.d;
    //                                                        //VEN::For Flower Color Chart
    //                                                        $("#js-legend-Color-Boxes").show();
    //                                                        $("#canvas-holder-Color-Boxes").show();
    //                                                        $('#canvas-holder-Color-Boxes').append('<canvas id="chart-area-Color-Boxes" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
    //                                                        var mypieColor = new Chart(document.getElementById("chart-area-Color-Boxes").getContext("2d")).Pie(ColorChartDetails, {
    //                                                            animationSteps: 20,
    //                                                            animationEasing: 'easeInOutQuart',

    //                                                        });
    //                                                        document.getElementById('js-legend-Color-Boxes').innerHTML = mypieColor.generateLegend();
    //                                                        $("#canvas-holder-Color-Boxes").unbind().click(
    //                                                                function (evt) {
    //                                                                    var activePoints = mypieColor.getSegmentsAtEvent(evt);
    //                                                                    alert(activePoints[0].label);
    //                                                                });
    //                                                    }
    //                                                    $.ajax({
    //                                                        type: "POST",
    //                                                        url: 'BloomService.asmx/GetDistinctFlowerColorDetailsForChartbySales',
    //                                                        data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //                                                        contentType: "application/json; charset=utf-8",
    //                                                        dataType: "json",
    //                                                        success: function (output, status) {
    //                                                            $("#js-legend-Color-Sales").html("");
    //                                                            $('#chart-area-Color-Sales').remove();
    //                                                            if (output.d != "" && output.d != null) {
    //                                                                var ColorChartDetails = output.d;
    //                                                                //VEN::For Flower Color Chart
    //                                                                $("#js-legend-Color-Sales").show();
    //                                                                $("#canvas-holder-Color-Sales").show();
    //                                                                $('#canvas-holder-Color-Sales').append('<canvas id="chart-area-Color-Sales" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
    //                                                                var mypieColor = new Chart(document.getElementById("chart-area-Color-Sales").getContext("2d")).Pie(ColorChartDetails, {
    //                                                                    animationSteps: 20,
    //                                                                    animationEasing: 'easeInOutQuart',

    //                                                                });
    //                                                                document.getElementById('js-legend-Color-Sales').innerHTML = mypieColor.generateLegend();
    //                                                                $("#canvas-holder-Color-Sales").unbind().click(
    //                                                                        function (evt) {
    //                                                                            var activePoints = mypieColor.getSegmentsAtEvent(evt);
    //                                                                            alert(activePoints[0].label);
    //                                                                        });
    //                                                            }

    //                                                            //For Flower Category Chart
    //                                                            $.ajax({
    //                                                                type: "POST",
    //                                                                url: 'BloomService.asmx/GetDistinctFlowerCatDetailsForChart',
    //                                                                data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //                                                                contentType: "application/json; charset=utf-8",
    //                                                                dataType: "json",
    //                                                                success: function (output, status) {
    //                                                                    $("#js-legend-Cat").html("");
    //                                                                    $('#chart-area-Cat').remove();
    //                                                                    if (output.d != "" && output.d != null) {
    //                                                                        var CatChartDetails = output.d;
    //                                                                        //VEN::For Flower Cat Chart
    //                                                                        $("#js-legend-Cat").show();
    //                                                                        $("#canvas-holder-Cat").show();
    //                                                                        $('#canvas-holder-Cat').append('<canvas id="chart-area-Cat" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="200" height="200" />');
    //                                                                        var mypieCat = new Chart(document.getElementById("chart-area-Cat").getContext("2d")).Pie(CatChartDetails, {
    //                                                                            animationSteps: 20,
    //                                                                            animationEasing: 'easeInOutQuart',

    //                                                                        });
    //                                                                        document.getElementById('js-legend-Cat').innerHTML = mypieCat.generateLegend();
    //                                                                        $("#canvas-holder-Cat").unbind().click(
    //                                                                                function (evt) {
    //                                                                                    var activePoints = mypieCat.getSegmentsAtEvent(evt);
    //                                                                                    alert(activePoints[0].label);
    //                                                                                });
    //                                                                    }
    //                                                                    //For Flower Description Chart
    //                                                                    $.ajax({
    //                                                                        type: "POST",
    //                                                                        url: 'BloomService.asmx/GetDistinctFlowerDescDetailsForChart',
    //                                                                        data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //                                                                        contentType: "application/json; charset=utf-8",
    //                                                                        dataType: "json",
    //                                                                        success: function (output, status) {
    //                                                                            $("#js-legend-Desc").html("");
    //                                                                            $('#chart-area-Desc').remove();
    //                                                                            if (output.d != "" && output.d != null) {
    //                                                                                var DescChartDetails = output.d;
    //                                                                                //VEN::For Flower Desc Chart
    //                                                                                $("#js-legend-Desc").show();
    //                                                                                //$("#canvas-holder-Desc").show();
    //                                                                                $("#canvas-holder-Desc").hide();
    //                                                                                $('#canvas-holder-Desc').append('<canvas id="chart-area-Desc" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="170" height="170" />');
    //                                                                                var mypieDesc = new Chart(document.getElementById("chart-area-Desc").getContext("2d")).Pie(DescChartDetails, {
    //                                                                                    animationSteps: 20,
    //                                                                                    animationEasing: 'easeInOutQuart',

    //                                                                                });
    //                                                                                document.getElementById('js-legend-Desc').innerHTML = mypieDesc.generateLegend();
    //                                                                                $("#canvas-holder-Desc").unbind().click(
    //                                                                                        function (evt) {
    //                                                                                            var activePoints = mypieDesc.getSegmentsAtEvent(evt);
    //                                                                                            alert(activePoints[0].label);
    //                                                                                        });
    //                                                                            }
    //                                                                            //For Flower Description Chart
    //                                                                            $.ajax({
    //                                                                                type: "POST",
    //                                                                                url: 'BloomService.asmx/GetCustomerDescDetailsForChart',
    //                                                                                data: "{'Filter':'" + escape(FilterQuery) + "','page':'" + Page + "','rp':'" + RP + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
    //                                                                                contentType: "application/json; charset=utf-8",
    //                                                                                dataType: "json",
    //                                                                                success: function (output, status) {                                                                                        
    //                                                                                    $("#js-legend-Customer").html("");
    //                                                                                    $('#chart-area-Customer').remove();
    //                                                                                    if (output.d != "" && output.d != null) {
    //                                                                                        var CustomerChartDetails = output.d;
    //                                                                                        //VEN::For Flower Desc Chart
    //                                                                                        $("#js-legend-Customer").show();
    //                                                                                        //$("#canvas-holder-Customer").show();
    //                                                                                        $("#canvas-holder-Customer").hide();
    //                                                                                        $('#canvas-holder-Customer').append('<canvas id="chart-area-Customer" style="border-radius:50%;box-shadow: 0px 0px 5px;" width="170" height="170" />');
    //                                                                                        var mypieDesc = new Chart(document.getElementById("chart-area-Customer").getContext("2d")).Pie(CustomerChartDetails, {
    //                                                                                            animationSteps: 20,
    //                                                                                            animationEasing: 'easeInOutQuart',

    //                                                                                        });
    //                                                                                        document.getElementById('js-legend-Customer').innerHTML = mypieDesc.generateLegend();
    //                                                                                        $("#canvas-holder-Customer").unbind().click(
    //                                                                                                function (evt) {
    //                                                                                                    var activePoints = mypieDesc.getSegmentsAtEvent(evt);
    //                                                                                                    alert(activePoints[0].label);
    //                                                                                                });
    //                                                                                    }
    //                                                                                    J1_8($("#accordion")).accordion({
    //                                                                                        collapsible: true
    //                                                                                    });
    //                                                                                    $(".ChartPleaseWaitOverlay").hide();
    //                                                                                    $("#accordion div.ui-accordion-content").hover(
    //                                                                                        function () { $(this).addClass("hover"); },
    //                                                                                          function () { $(this).removeClass("hover"); });

    //                                                                                    //STA::19-NOV-2015::to change the chart every fifteen seconds                                                      
    //                                                                                    var i = 2;
    //                                                                                    MyChartTimer = function () {
    //                                                                                        myChartInterval = setInterval(function () {
    //                                                                                            i = $("#accordion").find("h3.ui-accordion-header-active").index();
    //                                                                                            if ($("#accordion")[0].children[i + 1].className.indexOf("ui-accordion-content-active hover") < 0) {
    //                                                                                                i = i + 2;
    //                                                                                            }
    //                                                                                            else {
    //                                                                                                i = i + 0;
    //                                                                                            }

    //                                                                                            if (i == $("#accordion")[0].children.length)
    //                                                                                                i = 0;
    //                                                                                            if ($("#accordion")[0].children[i].className.indexOf("ui-accordion-header-active") < 0)
    //                                                                                                $($("#accordion")[0].children[i]).click();;

    //                                                                                        }, 15000);
    //                                                                                    }
    //                                                                                    MyChartTimer();
    //                                                                                }
    //                                                                            });
    //                                                                        }
    //                                                                    });
    //                                                                }
    //                                                            });
    //                                                        }
    //                                                    });
    //                                                }
    //                                            });
    //                                        }
    //                                    });
    //                                }
    //                            });
    //                        }
    //                    });
    //                }
    //            });
    //        }
    //    });
    //}

    $("[id^=ui-id-]").die("click").live("click", function () {
        clearInterval(myChartInterval);
        MyChartTimer();
    });


    $('#divHeaderdate').click(function (event) {

        $(".rowcss").hide();
        $("#trdatetitle").show();
        if ($('#divOrderdateFilter').css('display') == 'none') {




            $(".filterdiv").hide();
            $("#divOrderdateFilter").slideToggle();
        }
        else {
            $("#divOrderdateFilter").slideToggle();
        }

    });

    $("#divOrderHeaderCarrier").click(function (event) {
        $(".rowcss").hide();
        $("#trCarriertitle").show();
        if ($('#divCarrierFilter').css('display') == 'none') {
            var CarrierFBE;
            var CarrierCode;
            var CarrierList = [];



            $("#fgrdOrderHeader tr").each(function () {
                var carrrowid = $(this).attr("id").replace("row", "");
                if (carrrowid != 0) {
                    var carr = $(".Carrier_" + carrrowid)[0].innerText;
                    var fbe = $("#aOrderFBE_" + carrrowid).html();
                    if (CarrierList.indexOf(carr) == -1 && carr.trim() != "") {

                        //var FBE = $('#fgrdOrderHeader #row' + carrrowid + ' td:nth-child(21) div')[0].innerText;
                        //CarrierFBETotal = CarrierFBETotal + parseFloat(FBE);

                        CarrierList.push({
                            CarrierCode: carr,
                            CarrierFBE: fbe
                        });


                    }
                }
            });


            if (CarrierList.length > 0) {


                LoadCarrierFilterbyCarrierDropdown(CarrierList);
                $(".filterdiv").hide();
                $("#divCarrierFilter").slideToggle();
            }
            else {
                $("#lstCarrierFilter").val("");
            }

        }
        else {
            $("#divCarrierFilter").slideToggle();
        }
    });

    $("#lstCarrierFilter").change(function () {
        //debugger;
        if ($('#lstCarrierFilter').val() != "All" && ($('#lstCarrierFilter').val() != null || $('#lstCarrierFilter').val() != undefined))
            OrderCarrierFilter = $('#lstCarrierFilter').val();

        $.ajax({ //save date to the session 
            url: 'BloomService.asmx/SaveCarrierFilterSession',
            type: 'POST',
            data: "{'CarrierFilter':'" + OrderCarrierFilter + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#trCarrier").addClass('FilterDivStyle');
                $("#lblCarrierFilter").html($("#lstCarrierFilter option:selected").text());
                $('#lstCarrierFilter').val(OrderCarrierFilter);
                $("#imgCarrier").attr("src", "images/Filter.png");
                $("#divCarrierFilter").slideToggle();
                FramingFilters();
            }
        });
    });

    $("[id^=btndateok]").live("click", function () {
        //debugger;
        var date = new Date();
        var lastMonth = date.getMonth(0) - 1;
        var currentMonth = date.getMonth();
        var currentDate = date.getDate();
        var currentYear = date.getFullYear();

        var date = new Date(currentYear, lastMonth, currentDate);
        var mnth = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        var textfromdate = [mnth, day, date.getFullYear()].join("/");

        var fromdate = new Date($("#txtOrderFromRecDate").val());

        var todate = new Date($("#txtOrderToRecDate").val());

        //if ($("#txtOrderFromRecDate").val() < textfromdate)
        //        {
        //          $.MessageBox("Invalid Date!!!!");
        //        return false;
        //  }

        if (fromdate > todate) {
            $.MessageBox("End Date Should not be less than Start Date!!!!");
            return false;
        }

        if ($("#txtOrderFromRecDate").val() != "" && $("#txtOrderToRecDate").val() == "") {
            $.MessageBox("Please choose ToDate!!!!");
            return false;
        }
        else if ($("#txtOrderFromRecDate").val() == "" && $("#txtOrderToRecDate").val() != "") {
            $.MessageBox("Please choose From Date!");
            return false;
        }
        else if ($("#txtOrderFromRecDate").val() == "" && $("#txtOrderToRecDate").val() == "") {
            $.MessageBox("Please choose From Date and ToDate!");
            return false;
        }

        $.ajax({ //save date to the session 
            url: 'BloomService.asmx/SaveDateSession',
            type: 'POST',
            data: "{'FromDate':'" + $("#txtOrderFromRecDate").val() + "','ToDate':'" + $("#txtOrderToRecDate").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                var fdate = $("#txtOrderFromRecDate").val() + " to " + $("#txtOrderToRecDate").val();
                $("#lblOrderchosendate").html(fdate);

                $("#tr2").addClass('FilterDivStyle');
                $("#lblOrderchosendate1").html($("#txtOrderFromRecDate").val());
                $("#lblOrderchosendate2").html($("#txtOrderToRecDate").val());

                $("#divFromDate").datepicker("setDate", Date.parse($("#txtOrderFromRecDate").val()));
                $("#divToDate").datepicker("setDate", Date.parse($("#txtOrderToRecDate").val()));

                $("#imgOrderDate").attr("src", "images/Filter.png");
                $("#divOrderdateFilter").slideToggle();
                FramingFilters();

                var page = window.location.href;
                if (page.indexOf('Page=Sales') >= 0) {
                    if ($("#btnViewSales").val() == "View Sales") {
                        $("#btnViewSales").click();                        
                    }
                }
                <%--if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {
                    var CarriFilter = "Date >= ctod('" + $("#txtOrderFromRecDate").val() + "')  And  Date <= ctod('" + $("#txtOrderToRecDate").val() + "')";
                }
                else {
                    var CarriFilter = "Date >= cast('" + $("#txtOrderFromRecDate").val() + "' as date)  And  Date <= cast('" + $("#txtOrderToRecDate").val() + "' as date)";
                }
                LoadCarrierFilterDropdown(CarriFilter);--%>


                //var CarrierList = [];
                //$("#fgrdOrderHeader tr").each(function () {
                //    var carrrowid = $(this).attr("id").replace("row", "");
                //    if (carrrowid != 0) {
                //        var carr = $(".Carrier_" + carrrowid)[0].innerText;
                //        if (CarrierList.indexOf(carr) == -1 && carr.trim() != "") {
                //            CarrierList.push(carr);
                //        }
                //    }
                //});

                //if (CarrierList.length > 0 && CarrierList != "") {
                //    LoadCarrierFilterbyCarrierDropdown(CarrierList.join(','));
                //}

            }
        });
    });

    //$("[id^=btnOrderNo]").live("click", function () {
    //    if ($("#txtOrderNoFilter").val() == "") {
    //        $.MessageBox("Please Enter Order number!!!!");
    //        return false;
    //    }
    //    $("#lblOrderNoFilter").html($('#txtOrderNoFilter').val());
    //    $("#tr1").addClass('FilterDivStyle');
    //    $("#imgOrderNo").attr("src", "images/Filter.png");
    //    $("#divOrderNoFilter").slideToggle();
    //    FramingFilters();
    //});

    //$("[id^=imgOrderNo]").live("click", function () {
    //    var bg = $(this).attr('src');
    //    if (bg == "images/Filter.png") {
    //        $("#imgOrderNo").attr("src", "images/EmptyFilter.png");
    //        $("#txtOrderNoFilter").val("");
    //        $("#lblOrderNoFilter").html("");
    //        $("#tr1").removeClass();
    //        FramingFilters();
    //        $("#divOrderNoFilter").hide();
    //    }
    //    e.stopPropagation();
    //});

    $("[id^=imgOrderDate]").live("click", function (e) {

        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            var today = Date.today().toString("MM/dd/yyyy");
            $("#txtOrderFromRecDate").val(today);
            $("#txtOrderToRecDate").val(today);
            var fdate = "Today: " + today;
            $("#lblOrderchosendate").html(fdate);
            $("#lblOrderchosendate1").html($("#txtOrderFromRecDate").val());
            $("#lblOrderchosendate2").html($("#txtOrderToRecDate").val());

            $("#divFromDate").datepicker("setDate", Date.parse(today));
            $("#divToDate").datepicker("setDate", Date.parse(today));

            $("#imgOrderDate").attr("src", "images/Filter.png");
            $("#tr2").addClass('FilterDivStyle');
            $("#divOrderdateFilter").hide();
            $.ajax({ //save date to the session 
                url: 'BloomService.asmx/SaveDateSession',
                type: 'POST',
                data: "{'FromDate':'" + today + "','ToDate':'" + today + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    FramingFilters();
                    <%--if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {
                        var CarriFilter = "Date >= ctod('" + $("#txtOrderFromRecDate").val() + "')  And  Date <= ctod('" + $("#txtOrderToRecDate").val() + "')";
                    }
                    else {
                        var CarriFilter = "Date >= cast('" + $("#txtOrderFromRecDate").val() + "' as date)  And  Date <= cast('" + $("#txtOrderToRecDate").val() + "' as date)";
                    }
                    LoadCarrierFilterDropdown(CarriFilter);--%>
                }
            });


        }
        e.stopPropagation();
    });

    $("[id^=imgCarrier]").live("click", function () {
        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {

            $.ajax({ //save date to the session 
                url: 'BloomService.asmx/SaveCarrierFilterSession',
                type: 'POST',
                data: "{'CarrierFilter':''}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    //debugger;
                    $("#imgCarrier").attr("src", "images/EmptyFilter.png");
                    $("#lstCarrierFilter").val("ALL");
                    $("#lblCarrierFilter").html("");
                    $("#trCarrier").removeClass();

                    FramingFilters();
                }
            });

            //var CarrierList = [];
            //$("#fgrdOrderHeader tr").each(function () {
            //    var carrrowid = $(this).attr("id").replace("row", "");
            //    if (carrrowid != 0) {
            //        var carr = $(".Carrier_" + carrrowid)[0].innerText;
            //        if (CarrierList.indexOf(carr) == -1 && carr.trim() != "") {
            //            CarrierList.push(carr);
            //        }
            //    }
            //});

            //if (CarrierList.length > 0 && CarrierList != "") {
            //    LoadCarrierFilterbyCarrierDropdown(CarrierList.join(','));
            //}
            $("#divCarrierFilter").hide();

        }
        e.stopPropagation();
    });


    $('#chkVoids').change(function () {
        FramingFilters();
    });



    $('#chkShowAllSalesPersonSales').change(function () {

        var ShowAllSalesPersonSales = true;
        var onlyCanSeeOwnSales = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(24, 1).ToString()%>' == "Y" ? true : false;
        if ($('#chkShowAllSalesPersonSales').is(':checked') == true || onlyCanSeeOwnSales) {
            ShowAllSalesPersonSales = false;
            $("#ddlSalesMan").addClass("hiddenForUserType");
            $("#ddlGraphType").addClass("hiddenForUserType");
            
        }
        else {
            ShowAllSalesPersonSales = true;
            if ($("#btnViewSales").val() == 'View Sales') {
                $("#ddlSalesMan").removeClass("hiddenForUserType");
                $("#ddlGraphType").removeClass("hiddenForUserType");
            }
        }
        if ($("#btnViewSales").val() == "View Sales") {
            TotalCompanySalesGraph("0","0");
            ShowSalesGraph();
        }
        //Add by Prashant : 20Jul2020 Used For the Filter the Calllist on Telephone Button
        IsToggleCustDetails = false;
        $.ajax({ //save date to the session 
            url: 'BloomService.asmx/SaveSalesPersonFilterSession',
            type: 'POST',
            data: "{'ShowAllSalesPersonSales':'" + ShowAllSalesPersonSales + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                FramingFilters();
            }
        });

    });

    $('#chkCCI').change(function () {
        if ($('#chkCCI').is(':checked') == true) {
            $('#DivOrderHeader [name="qtype"]').val("Country");
            $('#DivOrderHeader [name="q"]').val("CA");
            $('#DivOrderHeader [value="Search"]').click();
        }
        else {
            $('#DivOrderHeader [value="Clear"]').click();
        }
    });

    function FramingFilters() {

        IsChartLoad = "0";
        clearInterval(myChartInterval);
        //hide the chart when filter applies show after grid bind
        $("#canvas-holder").hide();
        $("#js-legend").hide();

        FilterQuery = "";
        var OrderNoFilter = "";
        //if ($("#txtOrderNoFilter").val() != "")
        //    OrderNoFilter = "Order=" + $("#txtOrderNoFilter").val();

       <%-- if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {

            var OrderDateFilter = "";
            if ($("#lblOrderchosendate1").html() != "" && $("#lblOrderchosendate2").html() != "")
                OrderDateFilter = "OrderDate >= ctod('" + $("#lblOrderchosendate1").html() + "') and OrderDate <= ctod('" + $("#lblOrderchosendate2").html() + "')";
        }
        else {
            var OrderDateFilter = "";
            if ($("#lblOrderchosendate1").html() != "" && $("#lblOrderchosendate2").html() != "")
                OrderDateFilter = "[Date] >= cast('" + $("#lblOrderchosendate1").html() + "' as date) and [Date] <= cast('" + $("#lblOrderchosendate2").html() + "' as date)";
        }--%>

        var OrderCarrierFilter = "";
        //if ($('#lstCarrierFilter').val() != "All" &&( $('#lstCarrierFilter').val() != null || $('#lstCarrierFilter').val() != undefined))
        //    OrderCarrierFilter = "CARRIER ='" + $('#lstCarrierFilter').val() + "'";


        //if ($('#lstCarrierFilter').val() == "A1" || $('#lstCarrierFilter').val() == "A2" || $('#lstCarrierFilter').val() == "A3")
        //    OrderCarrierFilter = "CARRIER ='AR'";
        //else
        //    OrderCarrierFilter = "CARRIER ='" + $('#lstCarrierFilter').val() + "'";


        //if (OrderCarrierFilter != "")
        //     FilterQuery = OrderCarrierFilter;
        // else
        //     FilterQuery = "";

        if ($('#chkVoids').is(':checked') == false) {

            if (FilterQuery != "") {
                FilterQuery = FilterQuery + " And Void=0"
            }
            else {
                FilterQuery = "Void=0"
            }
        }
        else {
            //FilterQuery = "Void in (0,1)"
            if (FilterQuery != "") {
                FilterQuery = FilterQuery + " And Void in (0,1)"
            }
            else {
                FilterQuery = "Void in (0,1)"
            }
        }

        //if ($('#chkCCI').is(':checked') == true) {

        //    if (FilterQuery != "") {
        //        FilterQuery = FilterQuery + " And COUNTRY='CN'"
        //    }
        //    else {
        //        FilterQuery = "COUNTRY='CN'"
        //    }
        //}

        if ($("#ctl00_FilterDivision").html() == "True") {
            FilterDivision = "1";
        }
        //debugger;
        $("#fgrdOrderHeader").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: '' }, { name: 'FilterDivision', value: FilterDivision }], query: "", newp: 1 }).flexReload();
        //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }], query: "", newp: 1 }).flexReload();
    }

    function LoadCarrierFilterDropdown(CarriFilter) {
        //debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCarriersForDropdownList',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstCarrierFilter').html("");
                $('#lstCarrierFilter').append('<option value="All">All</option>');
                var data = output.d;
                if (data != null) {
                    for (var i in data) {
                        var Carrier = data[i];
                        $('#lstCarrierFilter').append('<option value="' + Carrier.Carrier + '">' + "[" + Carrier.Carrier + "] " + Carrier.Name + '</option>');
                    }
                }
            }
        });

    }

    function LoadCarrierFilterbyCarrierDropdown(CarrierLst) {
        //debugger;
        var CarrierCodes = $.map(CarrierLst, function (obj) {
            return obj.CarrierCode
        });
        var UniqueCarrierCodes = CarrierCodes.filter(function (itm, i, a) {
            return i == a.indexOf(itm);
        }).join(',');

        var result = [];
        CarrierLst.reduce(function (res, value) {
            if (!res[value.CarrierCode]) {
                res[value.CarrierCode] = {
                    CarrierFBE: 0,
                    CarrierCode: value.CarrierCode
                };
                result.push(res[value.CarrierCode])
            }
            res[value.CarrierCode].CarrierFBE = parseFloat(parseFloat(res[value.CarrierCode].CarrierFBE) + parseFloat(value.CarrierFBE)).toFixed(2)
            return res;
        }, {});

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCarriersbyCarrierForDropdownList',
            data: '{"CarrierLst":"' + UniqueCarrierCodes + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                $('#lstCarrierFilter').html("");
                $('#lstCarrierFilter').append('<option value="All">All</option>');
                var data = output.d;
                if (data != null) {
                    for (var i in data) {
                        var Carrier = data[i];

                        var CarrierFBETotal = $.grep(result, function (v) {
                            return v.CarrierCode === Carrier.Carrier
                        });

                        //$("#fgrdOrderHeader tr").each(function () {

                        //    var carrrowid = $(this).attr("id").replace("row", "");
                        //    if (carrrowid != 0) {
                        //        var carr = $(".Carrier_" + carrrowid)[0].innerText;
                        //        if (carr == Carrier.Carrier) {
                        //            var FBE = $('#fgrdOrderHeader #row' + carrrowid + ' td:nth-child(21) div')[0].innerText;
                        //            CarrierFBETotal = CarrierFBETotal + parseFloat(FBE);
                        //        }
                        //    }
                        //});

                        $('#lstCarrierFilter').append('<option value="' + Carrier.Carrier + '">' + "[" + Carrier.Carrier + "] " + Carrier.Name + '  -  ' + CarrierFBETotal[0].CarrierFBE + ' FBE</option>');
                    }
                }


                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetCarrierFilterSession',
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (carrieroutput, status) {
                        //debugger;
                        var CarrierFilter = carrieroutput.d;
                        if (CarrierFilter == null || CarrierFilter == "" || CarrierFilter[0] === "") {
                            $("#lstCarrierFilter").val("");
                        }
                        else {
                            //debugger;
                            $("#lstCarrierFilter").val(CarrierFilter[0]);
                            $("#trCarrier").addClass('FilterDivStyle');
                            $("#lblCarrierFilter").html($("#lstCarrierFilter option:selected").text());
                            $("#imgCarrier").attr("src", "images/Filter.png");
                            //$("#divCarrierFilter").slideToggle();
                        }
                    }
                });
            }
        });

    }

    $("#Orderselectall").die('click').live("click", function (e) {
        debugger
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        var Query = $("#fgrdOrderHeader").flexOptions()[0].p.query;
        var QueryType = $("#fgrdOrderHeader").flexOptions()[0].p.qtype;
        //debugger;
        var page = window.location.href;

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            $('#fgrdOrderHeader tr:visible').addClass("trChecked");
            $('#fgrdOrderHeader tr#row0').removeClass("trChecked");
            $("[id^=Orderselect_]:visible").prop("src", "images/check-on.png");
            $("[id^=Orderselect_]:visible").attr('class', 'Orderselected');
            if (page.indexOf('Page=Order') >= 0) {
                debugger
                $(".ShowInSalesPage").hide();
                $(".ShowInSalesInvoiceSelected").hide();

                //22-MAR-2019 :: Nivetha :: Add Invoice Search to Orders Screen :: Started 
                $("#tdfssearch").show();

                //Hide other search option
                $("#rbcust").hide();
                $('label[for="rbcust"]').hide();
                $("#rbPO").hide();
                $('label[for="rbPO"]').hide();
                $('#txtPOSearch').hide();
                $('#txtCustSearch').hide();

                // Show Invoice serach option
                $("#rbinv").prop("checked", true);
                $('#txtInvSearch').show();

                $("#fsSearch").css("width", 100);
                $("#txtInvSearch").css("width", 100);

                $("#tdPrintPickList").css("width", 45);
                $("#tdEdi").css("width", 120);
                $("#lstEDI").css("width", 80);

                //22-MAR-2019 :: Nivetha :: Add Invoice Search to Orders Screen :: End
            }
            else {
                $(".ShowInSalesPage").show();
                $(".ShowInSalesInvoiceSelected").show();
            }
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $('#fgrdUserHeaders tr').removeClass("trChecked");
            $("[id^=Orderselect_]:visible").removeClass('Orderselected');
            $("[id^=Orderselect_]").prop("src", "images/check-off.png");
            if ($('img[class=Orderselected]').length <= 0) {
                $(".ShowInSalesInvoiceSelected").hide();
            }
        }

        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/ToggleOrderSelectedAll',
        //    data: "{'SelectedOrder':'" + Selected + "','Filter':'" + escape(FilterQuery) + "','query':'" + Query + "','qtype':'" + QueryType + "'}",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output, status) {
        //        //$("#msgbox-select").dialog("close");

        //        if (Selected == "1") {
        //            sourceCtl.prop("src", "images/check-on.png");
        //            $('#fgrdOrderHeader tr').addClass("trChecked");
        //            $('#fgrdOrderHeader tr#row0').removeClass("trChecked");
        //            $("[id^=Orderselect_]").prop("src", "images/check-on.png");
        //        }
        //        else {
        //            sourceCtl.prop("src", "images/check-off.png");
        //            $('#fgrdUserHeaders tr').removeClass("trChecked");
        //            $("[id^=Orderselect_]").prop("src", "images/check-off.png");
        //        }

        //    }
        //});
    });

    $("[id^=Orderselect_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("Orderselect_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        //debugger;
        var page = window.location.href;

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            sourceCtl.attr('class', 'Orderselected');
            if (page.indexOf('Page=Order') >= 0) {
                $(".ShowInSalesPage").hide();
                $(".ShowInSalesInvoiceSelected").hide();

                //22-MAR-2019 :: Nivetha :: Add Invoice Search to Orders Screen :: Started 
                $("#tdfssearch").show();

                //Hide other search option
                $("#rbcust").hide();
                $('label[for="rbcust"]').hide();
                $("#rbPO").hide();
                $('label[for="rbPO"]').hide();
                $('#txtPOSearch').hide();
                $('#txtCustSearch').hide();

                // Show Invoice serach option
                $("#rbinv").prop("checked", true);
                $('#txtInvSearch').show();

                $("#fsSearch").css("width", 100);
                $("#txtInvSearch").css("width", 100);

                $("#tdPrintPickList").css("width", 45);
                $("#tdEdi").css("width", 120);
                $("#lstEDI").css("width", 80);

                //22-MAR-2019 :: Nivetha :: Add Invoice Search to Orders Screen :: End

            }
            else {
                $(".ShowInSalesPage").show();
                $(".ShowInSalesInvoiceSelected").show();
            }
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $("[id ^= ManualPOselectall]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            sourceCtl.attr('class', 'unOrderselected');
            if ($('img[class=Orderselected]').length <= 0) {
                $(".ShowInSalesInvoiceSelected").hide();
            }
        }

        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/ToggleOrderSelected',
        //    data: "{'Selected':'" + Selected + "','ID':'" + headers + "'}",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output, status) {
        //        if (Selected == "1") {
        //            sourceCtl.prop("src", "images/check-on.png");
        //            sourceCtl.closest('tr').addClass("trChecked");
        //            sourceCtl.attr('class', 'Orderselected');
        //        }
        //        else {
        //            sourceCtl.prop("src", "images/check-off.png");
        //            $("[id ^= ManualPOselectall]").attr("src", "images/check-off.png");
        //            sourceCtl.closest('tr').removeClass("trChecked");
        //            sourceCtl.attr('class', 'unOrderselected');
        //        }
        //    }
        //});

    });

    //$("[id^=lblPrintLadingBill_]").die("click").live("click", function () {
    //    var sourceCtl = $(this);
    //    var ID = sourceCtl.attr('id');
    //    var Order = ID.replace("lblPrintLadingBill_", "");

    //    var w = window.open('GeneratingPDF.html');
    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/PrintLadingBill',
    //        data: "{'Order':'" + Order + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output, status) {
    //            if (output.d == "LogOut") {
    //                w.close();
    //                window.location.href = "Login.aspx"
    //            }
    //            else if (output.d == "error") {
    //                w.close();
    //                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
    //            }
    //            else if (output.d == "No Data") {
    //                w.close();
    //                $.MessageBox("No Details Found!!");
    //            }
    //            else {
    //                path = output.d;
    // var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
    //                w.location = ExportedPath;
    //            }
    //        }
    //    });
    //});

    //$("[id^=lblPrintPickList_]").die("click").live("click", function () {
    //    var sourceCtl = $(this);
    //    var ID = sourceCtl.attr('id');
    //    var Order = ID.replace("lblPrintPickList_", "");

    //    var w = window.open('GeneratingPDF.html');
    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/PrintPickList',
    //        data: "{'Order':'" + Order + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output, status) {
    //            if (output.d == "LogOut") {
    //                w.close();
    //                window.location.href = "Login.aspx"
    //            }
    //            else if (output.d == "error") {
    //                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
    //            }
    //            else if (output.d == "No Data") {
    //                w.close();
    //                $.MessageBox("No Details Found!!");
    //            }
    //            else {
    //                path = output.d;
    //     var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
    //                w.location = ExportedPath;
    //            }
    //        }
    //    });
    //});

    <%--$("[id^=btnprintLadingBill]").die("click").live("click", function () {
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintMultipleladingBill',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                 if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
                else {
                    path = output.d;
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
            }
        });
    });

    $("[id^=btnprintPickList]").die("click").live("click", function () {
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintMultiplePickList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                 if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
                else {
                    path = output.d;
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
            }
        });
    });--%>

    $("#imgPrintReports").click(function () {
        PrintReportsinOrders();
    });


    function PrintReportsinOrders() {
        var checkboxValues = [];
        var CA = [];
        var PO = [];
        var ShipDate = [];
        //debugger;

        if ($("#ctl00_LoggedUserType").html() != "warehouse") { //if usertype warehouse then only print **printed=yes** orders only
            var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");
            var SelectedCA = $(".trChecked:visible").find("td:nth-child(7) div");
            var SelectedPO = $(".trChecked:visible").find("td:nth-child(18) div");
            var SelectedDate = $(".trChecked:visible").find("td:nth-child(5) div");

            for (var i = 0; i <= SelectedOrders.length - 1; i++) {

                checkboxValues.push(SelectedOrders[i].id.substring(12));

                //check if the value already exists in the array for CA,PO and Shipdate
                if ($.inArray(SelectedCA[i].innerText, CA) == -1) {
                    CA.push(SelectedCA[i].innerText);
                }

                if ($.inArray(SelectedPO[i].innerText.innerText, PO) == -1) {
                    SelectedPO[i].innerText.trim() == "" ? "" : PO.push(SelectedPO[i].innerText);
                }

                if ($.inArray(SelectedDate[i].innerText, ShipDate) == -1) {
                    ShipDate.push(SelectedDate[i].innerText);
                }
            }
        }
        else {
            $("#chkInvoice").attr("checked", false);
            var SelectedOrderscount = 0;
            var orderIDs = [];
            $('#fgrdOrderHeader tr:visible').each(function () {

                if ($(this).attr("id") != "row0") {
                    var SelectedWCA = $(this).find("td div").eq(6)[0];
                    var SelectedWPO = $(this).find("td div").eq(17)[0];
                    var SelectedWDate = $(this).find("td div").eq(4)[0];
                    if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

                        SelectedOrderscount += 1;
                        //if ($(this).find("td div").eq(12)[0].textContent == "Yes") { // check printed=yes
                        if ($(this).find("td div").eq(13)[0].innerHTML.indexOf("<img") >= 0) { // check printed=yes
                            checkboxValues.push($(this).attr("id").substring(3));

                            //check if the value already exists in the array for CA,PO and Shipdate
                            if ($.inArray(SelectedWCA.innerText, CA) == -1) {
                                CA.push(SelectedWCA.innerText);
                            }
                            if ($.inArray(SelectedWPO.innerText, PO) == -1) {
                                SelectedWPO.innerText.trim() == "" ? "" : PO.push(SelectedWPO.innerText);
                            }
                            if ($.inArray(SelectedWDate.innerText, ShipDate) == -1) {
                                ShipDate.push(SelectedWDate.innerText);
                            }
                        }
                        else {

                            orderIDs.push($(this).attr("id").substring(3));

                        }
                    }
                }
            });

            if (orderIDs.length == 0) {
                // return 0;
            }
            else {
                orderIDs.join(',');

                var msg = "";
                var label = jQuery('label[for=' + $('.chkrpt:checked').attr('id') + ']').html();
                if (SelectedOrderscount > 1) {
                    msg = " for order (" + orderIDs + ")";
                }

                if ($('.chkrpt:checked').length > 1) {
                    $("#msghtml").html("Invoice MUST be Confirmed/Printed " + msg);
                    $("#msgbox-warn").dialog("open");
                }
                else if ($('.chkrpt:checked').length == 1) {
                    $("#msghtml").html("Invoice MUST be Confirmed/Printed " + msg);
                    $("#msgbox-warn").dialog("open");
                }
            }

            /* var orderlist = "";
             var msg = "";
             var label = jQuery('label[for=' + $('.chkrpt:checked').attr('id') + ']').html();
             if (SelectedOrders.length > 1) {
                 for (var i = 0; i <= SelectedOrders.length - 1; i++) {
                     if (orderlist.length <= 0)
                         orderlist += "";
                     else
                         orderlist += ",";
                     orderlist += SelectedOrders[i].id.substring(12);
                 }
                 msg = " for order (" + orderlist + ")";
             }
 
             if ($('.chkrpt:checked').length > 1) {
                 $("#msghtml").html("Selected reports are not printed yet" + msg);
                 $("#msgbox-warn").dialog("open");
             }
             else if ($('.chkrpt:checked').length == 1) {
 
                 $("#msghtml").html(label + " report not printed yet" + msg);
                 $("#msgbox-warn").dialog("open");
             }*/
        }

        if (checkboxValues.length == 0) {
            return false;
        }
        else {
            checkboxValues.join(',');
        }

        //debugger;
        if (CA.length == 0)
            CA = '';
        else
            CA.join(',');
        if (ShipDate.length == 0)
            ShipDate = '';
        else
            ShipDate.join(',');

        if (PO.length == 0)
            PO = '';
        else
            PO.join(',');

        //var checkboxValues = [];
        //$('input[name=checkboxName]:checked').map(function () {
        //    checkboxValues.push($(this).val());
        //})

        var w0 = '';
        var w1 = '';
        var w2 = '';
        var w3 = '';
        var w4 = '';
        var PrintBillofLading = 0;
        var PrintPickList = 0;
        var PrintShippingLabel = 0;
        var PrintCCI = 0;
        var PrintInvoice = 0;
        var WindowCount = 0;
        if ($('#chkBillofLading').is(':checked')) {
            PrintBillofLading = 1
            w0 = window.open('GeneratingPDF.html', '_blank');
            WindowCount++;
        }

        if ($('#chkPrintPickList').is(':checked')) {
            PrintPickList = 1
            if (WindowCount == 0) w0 = window.open('GeneratingPDF.html', '_blank');
            else w1 = window.open('GeneratingPDF.html', '_blank');
            WindowCount++;
        }

        if ($('#chkLabel').is(':checked')) {
            PrintShippingLabel = 1
            if (WindowCount == 0) w0 = window.open('GeneratingPDF.html', '_blank');
            else if (WindowCount == 1) w1 = window.open('GeneratingPDF.html', '_blank');
            else w2 = window.open('GeneratingPDF.html', '_blank');
            WindowCount++;
        }

        if ($('#chkCCI').is(':checked')) {
            PrintCCI = 1
            if (WindowCount == 0) w0 = window.open('GeneratingPDF.html', '_blank');
            else if (WindowCount == 1) w1 = window.open('GeneratingPDF.html', '_blank');
            else if (WindowCount == 2) w2 = window.open('GeneratingPDF.html', '_blank');
            else w3 = window.open('GeneratingPDF.html', '_blank');
            WindowCount++;
        }


        if ($('#chkInvoice').is(':checked')) {
            PrintInvoice = 1
            if (WindowCount == 0) w0 = window.open('GeneratingPDF.html', '_blank');
            else if (WindowCount == 1) w1 = window.open('GeneratingPDF.html', '_blank');
            else if (WindowCount == 2) w2 = window.open('GeneratingPDF.html', '_blank');
            else if (WindowCount == 3) w3 = window.open('GeneratingPDF.html', '_blank');
            else w4 = window.open('GeneratingPDF.html', '_blank');
        }
        //debugger;

        //$("#msg").html("<div>Generating PDF Please Wait....</div><div><img src='images/AnimatedGif_PDF.gif' /></div>");
        //$("#msgbox-select").dialog("open");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintMultipleReportsInOrder',
            data: "{'PrintBillofLading':'" + PrintBillofLading + "','PrintPickListselected':'"
                + PrintPickList + "','SelectedOrders':'" + checkboxValues + "','PrintShippingLabel':'" + PrintShippingLabel
                + "','PrintCCI':'" + PrintCCI + "','PrintInvoice':'" + PrintInvoice + "','ShipDate':'" + ShipDate + "','CA':'" + CA + "','PO':'" + escape(PO) + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //console.dir(output)
                //debugger;
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx"
                    ClosePDFWindows();
                }
                else if (output.d.indexOf("Please release order") >= 0) {
                    $("#msgbox-select").dialog("close");
                    //$.MessageBox(output.d);
                    ClosePDFWindows();
                    var Order = output.d.replace(/[^0-9]/g, '');

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/ReleaseRacksforOrder',
                        data: '{ "Order":"' + Order + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            $("#DialogReleaseLabels").dialog("close");
                            if (output.d == "success") {
                                PrintReportsinOrders();
                            }
                            else {
                                $.MessageBox(output.d);
                            }
                        }
                    });

                    //$("#DivReleaseInvoice").html(output.d.replace(/[^0-9]/g, ''))
                    //$("#DialogReleaseLabelsMsg").html(output.d);
                    //$("#DialogReleaseLabels").dialog("open");

                }
                else if (output.d.indexOf("no armellini account") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d);
                    ClosePDFWindows();
                }                
                else if (output.d.indexOf("contains 0 dimensions") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d);
                    ClosePDFWindows();
                }
                else if (output.d == "No Data") {
                    ClosePDFWindows();
                }
                else if (output.d == "No Order Found") {
                    ClosePDFWindows();
                }
                else {

                    if (PrintShippingLabel == 1 || PrintPickList == 1) {
                        var SelectedOrder = checkboxValues;
                        $.each(SelectedOrder, function (i, val) {
                            $("#fgrdOrderHeader #row" + val + "").find("td div").eq(14)[0].innerHTML = "<img style='margin-top:-3px; margin-left:3px' src='images/yellowtick.png'>";  //Check picking='Yes'
                        });
                    }


                    if (PrintBillofLading == 1) {
                        var SelectedOrder = checkboxValues;
                        $.each(SelectedOrder, function (i, val) {
                            $("#fgrdOrderHeader #row" + val + "").find("td div").eq(15)[0].innerHTML = "<img style='margin-top:-3px; margin-left:3px' src='images/pinktick.png'>";  //Check Bills='Yes'
                        });
                    }

                    if (PrintShippingLabel == 1 || PrintInvoice == 1) {
                        var SelectedOrder = checkboxValues;
                        $.each(SelectedOrder, function (i, val) {

                            $("#fgrdOrderHeader #row" + val + "").find("td div").eq(13)[0].innerHTML = "<img style='margin-top:-3px; margin-left:3px' src='images/greentick.png'>";  //Check Printed='Yes'
                        });
                    }

                    try { //It checks whether the boxes is successfully posted to armellini service for carrier A1,A2,A3,AR
                        //and carrier code bgcolor changed accodingly. Success- Green, Error - Red

                        if (PrintShippingLabel == 1) {
                            var SelectedOrder = checkboxValues;
                            var ArmelliniCarrierCode = {
                                a: "A1",
                                b: "A2",
                                c: "A3",
                                d: "AR"
                            };
                            $.each(SelectedOrder, function (i, val) {

                                var CarrierCode = $("#lnkCarrierARXML_" + val + "").html();
                                if (CarrierCode == "A1" || CarrierCode == "A2" || CarrierCode == "A3" || CarrierCode == "AR" || CarrierCode == "FB") {

                                    $.ajax({
                                        type: "POST",
                                        url: 'BloomService.asmx/CheckArmelliniLog',
                                        data: "{'Carrier':'" + CarrierCode + "','OrderNo':'" + val + "'}",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (output, status) {
                                            $("#lnkCarrierARXML_" + val + "").closest('div').html(output.d);
                                        }
                                    });
                                }
                            });
                        }
                    }
                    catch (err) {

                    }

                    try {
                        var splitedstring = output.d.split("*~*")
                        if (splitedstring.length == "1") {
                            w0.location = splitedstring[0]
                            w1.close();
                            w2.close();
                            w3.close();
                        }
                        else if (splitedstring.length == "2") {
                            w0.location = splitedstring[0]
                            w1.location = splitedstring[1]
                            w2.close();
                            w3.close();
                        }
                        else if (splitedstring.length == "3") {
                            w0.location = splitedstring[0]
                            w1.location = splitedstring[1]
                            w2.location = splitedstring[2]
                            w3.close();
                        }
                        else if (splitedstring.length == "4") {
                            w0.location = splitedstring[0]
                            w1.location = splitedstring[1]
                            w2.location = splitedstring[2]
                            w3.location = splitedstring[3]
                            w4.close();
                        }
                        else {
                            w0.location = splitedstring[0]
                            w1.location = splitedstring[1]
                            w2.location = splitedstring[2]
                            w3.location = splitedstring[3]
                            w4.location = splitedstring[4]
                        }
                    }
                    catch (err) {
                    }
                }
            }
        });

        function ClosePDFWindows() {
            w0 == "" ? "" : w0.close();
            w1 == "" ? "" : w1.close();
            w2 == "" ? "" : w2.close();
            w3 == "" ? "" : w3.close();
            w4 == "" ? "" : w4.close();
        }
    }

    $("#DialogReleaseLabels").dialog({
        title: 'Release',
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 300,
        buttons: {
            "Release & Print": function () {
                var Order = $("#DivReleaseInvoice").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ReleaseRacksforOrder',
                    data: '{ "Order":"' + Order + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $("#DialogReleaseLabels").dialog("close");
                        if (output.d == "success") {
                            PrintReportsinOrders();
                        }
                        else {
                            $.MessageBox(output.d);
                        }
                    }
                });
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Release')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel red');
        }
    });

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageARINVS.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            $("#DivPageARINVS").html(output.d);
        }
    });


    function openPDFViewer(FilePath) {
        //debugger;
        FilePath = FilePath.substr(1, FilePath.length);
        //$("#pdfIframe").attr("src", FilePath);
        $.ajax({
            url: FilePath,
            type: 'HEAD',
            error: function () {
                $("#pdfIframe").attr("src", "zoom_assets/fnf.pdf");
            },
            success: function () {
                $("#pdfIframe").attr("src", FilePath);
            }
        });
        $("#DivPDFViewerDialog").dialog("open");
    }
    // added by belal on 10 Dec 2020
    $("#DivPDFViewerDialog").dialog({
        title: 'PDF Viewer',
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 750,
        height:550,
        buttons: {
            
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel red');
        }
    });
    // added by belal on 10 Dec 2020
    $("#btnUploadPOD").die("click").live("click", function () {
        //debugger;
        $("#DivPODUploadDialog").dialog("open");
    });
     // added by belal on 10 Dec 2020
    $("#DivPODUploadDialog").dialog({
        title: 'Upload POD',
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        buttons: {
            'Upload': function () {
                //debugger;
                UploadInvoicePODAsync();
                

            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Upload')").addClass('BloomButtonEnabled');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel red');
        }
    });
     // added by belal on 10 Dec 2020
    const UploadInvoicePODAsync = async () => {
        var fileName = "";
        var fileBase64Str = "";
        $("#POD_upload_process").css("display", "block");
        for (let i = 0; i < $('#PODFile')[0].files.length; i++) {
            fileName = $('#PODFile')[0].files[i].name;
            const result = await getBase64($('#PODFile')[0].files[i]).catch(e => Error(e));
            fileBase64Str = result;
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UploadInvoicePOD',
                data: "{'fileBase64Str':'" + fileBase64Str + "','fileName':'" + fileName + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "Success") {
						$("#DivPODUploadDialog").dialog("close");
                        $.growl.notice({ title: "", message: output.d });
					}
                    else
                        $.growl.error({ title: "", message: output.d });
                }
            });

        }
        $("#POD_upload_process").css("display", "none");
        $("#PODFile").val("");
        
    }
     // added by belal on 10 Dec 2020
    function getBase64(file, fname) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => resolve(reader.result, fname);
            reader.onerror = error => reject(error);
        });
    }

    //Muthu Nivetha M :: 06Mar2020 :: Modified :: Changed dialog to redirect PageOrderAll.ascx to load orderdetails for the selected invoice#
    $("#btnOrderDetailsList").live('click', function () {
        debugger
        $(".imgLoaderForUser").show();
        var para = "CustomerNo=" + "";
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageOrderAll.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DivOrderDetailsAllDialog">/div>').dialog({
                    title: 'Order Details',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1180,
                    //height: 650,
                    //closeOnEscape:false,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                    }
                });
                $("#DivOrderDetailsAllDialog").html(output.d).dialog("open");
                $(".qsbox").blur();
            }
        });
    });

    $("[id^=aCustomer_").die('click').live('click', function () {

        var Value = $(this).attr('id').substring(10);
        var Customer = Value.split(',')[0];
        var Date = Value.split(',')[1];
        var para = 'Customer=' + Customer + '&Date=' + Date + '&Page=CallHS';
        $(".imgLoaderForUser").show();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageHistory.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivOrderSummaryDialog").css('display', 'none');
                $("#DivOrderDetailsDialog").css('disply', 'none');
                $("#DivOrderCallHSDialog").css('display', 'block');
                $('<div id="DivOrderCallHSDialog">/div>').dialog({
                    title: 'Activity Log :: ' + Customer,
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 970,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                });
                $("#DivOrderCallHSDialog").html(output.d).dialog("open");
            }
        });
    });

    $("[id^=EditOrder_").die('click').live('click', function () {
        //debugger;
        var OrderNo = $(this).attr('id').substring(10);
        IsVoidedInvoice = $(this).attr('data-void') == "True" ? "VOIDED" : "";
        var CustomerNo = $("#fgrdOrderHeader #row" + OrderNo + "").find("td div").eq(2).find("a").attr("id").substring(10).split(',')[0]
        var ClosedOrders = $("#IsClosedOrder_" + OrderNo).html().toLowerCase()

        if (ClosedOrders == "false" || ClosedOrders == "") {
            editorder(OrderNo, CustomerNo)
        }
        else {
            $("#DivVETInvoiceNo").html(OrderNo);
            LoadVETCustomerDetailsByCustNo(CustomerNo, $("#aOrderDate_" + OrderNo).html(), "DivVETInvoiceGridDialog");
            $("#CurrentCustomerNo").html(CustomerNo);
            //loadVETInvoiceGrid(splitstr[0]);
            $("#fgrdVETINVCustomer").empty();
            $("#fgrdVETINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: OrderNo }], query: "", newp: 1 }).flexReload();
            $("#DivVETInvoiceGridDialog").dialog('option', 'title', '<div> VET Details :: ' + OrderNo + '</div><div>' + IsVoidedInvoice + '</div>');
            $("#DivVETInvoiceGridDialog").data("inData", { Invoice: OrderNo, Customer: CustomerNo }).dialog("open");
            //$("#DivVETInvoiceGridDialog").data('Invoice', OrderNo).dialog("open");
        }

    });


    $(window).on('beforeunload', function () {


        ClearLockedOrder(function (callback) {
        });
    });


    function ClearLockedOrder(callback) {

        if (LockedOrder.length > 0) { // this global variable  declared in dashboarduser page 
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteOrderLock',
                data: "{ 'OrderNumber': '" + LockedOrder.join(",") + "' }",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: "json",
                success: function (output, status) {
                    var data = output.d;
                    LockedOrder = [];  // this global variable  declared in dashboarduser page 
                    if (typeof callback !== 'undefined' && typeof callback === 'function') {
                        callback(true);
                    }
                },

            });
        }
        else {
            if (typeof callback !== 'undefined' && typeof callback === 'function') {
                callback(true);
            }
        }
    }
    function editorder(OrderNo, CustomerNo) {
        //debugger;
        

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/InsertOrderLock',
            data: "{ 'OrderNumber': '" + OrderNo + "' }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                if (data == "Logout") {
                    window.location.href = "Login.aspx"
                }
                else if (data == "error") {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else if (data.indexOf("NotExist") >= 0) {
                    LockedOrder.push(OrderNo);  // this global variable  declared in dashboarduser page 
                    var para = "Page=CustDetails&OrderNo=" + OrderNo + "&Customer=" + CustomerNo + "&IsVoidedOrder=" + IsVoidedInvoice;
                    $(".imgLoaderForUser").show();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetPage',
                        data: '{ "controlName":"pages/PageOrderDetails.ascx","controlPara":"' + para + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            debugger
                            $("#DivOrderSummaryDialog").css('display', 'none');
                            $("#DivOrderDetailsDialog").css('disply', 'block');
                            $("#DivOrderCallHSDialog").css('display', 'none');
                            $('<div id="DivOrderDetailsDialog">/div>').dialog({
                                title: '<div> ORDER UPDATE :: ' + OrderNo + '<span style="margin-left:25px;" id="DaysTruck">   </span></div><div>' + IsVoidedInvoice + '</div>',
                                autoOpen: false,
                                resizable: false,
                                modal: true,
                                width: 1256,
                                //height: 650,
                                //closeOnEscape:false,
                                beforeClose: function () {
                                    FuelUpdate(OrderNo)
                                    debugger
                                    if (IsOrderModifiedAndNotSaved == true && $("#OrderIsPrinted").html() == "1") {
                                        $("<div id='IncompleteOrderAlertmsgbox1'><div style='margin-top: 20px;'> Please confirm the order again, it was printed already!!!! <div></div>").dialog({
                                            autoOpen: false,
                                            resizable: false,
                                            modal: true,
                                            buttons: {
                                                Ok: function () {
                                                    $(this).dialog("close");
                                                }
                                            },
                                            open: function () {
                                                $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
                                                //$("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                                            },
                                            close: function () {

                                            }
                                        });
                                        $("#IncompleteOrderAlertmsgbox1").dialog('open')
                                        return false;
                                    }
                                },
                                close: function (event, ui) {

                                    ClearLockedOrder(function (callback) {

                                        if (callback == true) {

                                            $("#DivOrderDetailsDialog").dialog('destroy').remove();
                                            $("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
                                            $("#txtInvSearch").val("");
                                        }
                                        //$("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                                    });




                                },
                                open: function () {
                                    //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                                    var OrderNo = $("#ctl00_DivOrderNo").html();
                                    var OrderHeaderHold = $("#fgrdOrderHeader #row" + OrderNo + "").find("td div").eq(10).html();
                                    //var OrderDetailsHold = $("#fgrdOrderDetails").parent(".bDiv").find("td div").eq(30).html()
                                    //var OrderHeaderHold = $("#fgrdOrderHeader").parent(".bDiv").find("td div").eq(31).html()                                    
                                    if (AllowToViewFlipButton) {
                                        $("#btnOrderDetailsFlip").show();
                                    }
                                    else {
                                        $("#btnOrderDetailsFlip").hide();
                                    }

                                    if (OrderHeaderHold == "*Hold*") {
                                        $("#btnOrderDetailsAdd").hide();
                                        $("#btnOrderDetailsVDrop").hide();
                                        $("#btnOrderDetailsConsol").hide();
                                        //$("#btnOrderDetailsFlip").hide(); Commented By Prashant on 9th June 2020 for use the Order Flag 11 to display Flip button in Users

                                        //  $("#btnOrderDetailsSave").hide();

                                    }
                                    // 24 Mar 19 :: Muthu Nivetha M :: Sales person should able to edit hold tickets :: Starts
                                    //if ((OrderHeaderHold == "*Hold*") && ($("#ctl00_LoggedUserType").html() == "sales person")) {
                                    //    $("[id^=OrderDetailEdit_]").die("click").live("click", function () {
                                    //        $.MessageBox("You do not have rights to modify this order!!!");
                                    //        return false
                                    //    })

                                    //}
                                    // 24 Mar 19 :: Muthu Nivetha M :: Sales person should able to edit hold tickets :: Ends
                                    if ((OrderHeaderHold == "*Hold*") && ($("#ctl00_LoggedUserType").html() == "sales person")) {
                                        $("[id^=OrderDetailDelete_]").die("click").live("click", function () {
                                            $.MessageBox("You do not have rights to modify this order!!!");
                                            return false
                                        })

                                    }
                                    //if ((OrderHeaderHold != "*Hold*") && ($("#ctl00_LoggedUserType").html() == "sales person")) {

                                    //    $("#btnOrderDetailsVDrop").hide();
                                    //    //$("#btnOrderDetailsFlip").hide(); Commented By Prashant on 9th June 2020 for use the Order Flag 11 to display Flip button in Users

                                    //}
                                    //if ((OrderHeaderHold != "*Hold*") && ($("#ctl00_LoggedUserType").html() != "sales person")) {

                                    //$("#btnOrderDetailsFlip").hide(); Commented By Prashant on 9th June 2020 for use the Order Flag 11 to display Flip button in Users

                                    //}

                                //    if ($("#ctl00_LoggedUserType").html() == "sales person") {

                                //        $("#btnOrderDetailsVoid").hide();

                                //    }
                                },
                                Cancel: function () {

                                    ClearLockedOrder(function (callback) {
                                    });

                                },
                            });
                            $("#DivOrderDetailsDialog").data("Order", OrderNo).html(output.d).dialog("open");
                        }
                    });


                }

                else if (data != "") {
                    var tmp = data.split("_")
                    $.MessageBox("This record has been locked by " + tmp[0].toString().toUpperCase() + " !");
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            },

        });



    }

    function FuelUpdate(OrderNo) {
        debugger
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/FuelUpdate',
            data: "{ 'OrderNumber': '" + OrderNo + "' }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger
                var data = output.d;
                if (data == "error") {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }


    $("#btnOrderSummaryList").live('click', function () {

        var OrderDateFilter = "";
        if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {

            var OrderDateFilter = "";
            if ($("#lblOrderchosendate1").html() != "" && $("#lblOrderchosendate2").html() != "")
                OrderDateFilter = "Date >= ctod('" + $("#lblOrderchosendate1").html() + "') and Date <= ctod('" + $("#lblOrderchosendate2").html() + "')";
        }
        else {
            var OrderDateFilter = "";
            if ($("#lblOrderchosendate1").html() != "" && $("#lblOrderchosendate2").html() != "")
                OrderDateFilter = "OrderDate >= cast('" + $("#lblOrderchosendate1").html() + "' as date) and OrderDate <= cast('" + $("#lblOrderchosendate2").html() + "' as date)";
        }

        $(".imgLoaderForUser").show();
        var para = "Filter=CUSTOMER<>0 and " + OrderDateFilter;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageOrderSummary.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //
                var res = output.d;
                $("#DivOrderSummaryDialog").css('disply', 'block');
                $("#DivOrderDetailsDialog").css('display', 'none');
                $("#DivOrderCallHSDialog").css('display', 'none');
                $('<div id="DivOrderSummaryDialog">/div>').dialog({
                    title: 'Sales Summary',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1000,
                    height: 520,
                    //closeOnEscape:false,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();

                        //$.ajax({
                        //    type: "POST",
                        //    url: 'BloomService.asmx/GetDateSession',
                        //    data: "{}",
                        //    contentType: "application/json; charset=utf-8",
                        //    dataType: "json",
                        //    success: function (dateoutput, status) {
                        //        //debugger;
                        //        var date = dateoutput.d;

                        //        if (date[0] === $("#lblOrderchosendate1").html() && date[1] === $("#lblOrderchosendate2").html()) {
                        //}
                        //else {
                        //    if (date == null || date == "" || date[0] === "" && date[1] === "") {
                        //        var fdate = "Today: " + $("#txtOrderToRecDate").val();
                        //        $("#lblOrderchosendate").html(fdate);
                        //        $("#lblOrderchosendate1").html($("#txtOrderFromRecDate").val());
                        //        $("#lblOrderchosendate2").html($("#txtOrderToRecDate").val());
                        //        $("#divFromDate").datepicker().datepicker('setDate', new Date());
                        //        $("#divToDate").datepicker().datepicker('setDate', new Date());
                        //        $("#imgOrderDate").attr("src", "images/Filter.png");
                        //        $("#tr2").addClass('FilterDivStyle');
                        //    }
                        //    else {
                        //        var fdate = date[0] + " to " + date[1];
                        //        $("#txtOrderFromRecDate").val(date[0]);
                        //        $("#txtOrderToRecDate").val(date[1]);
                        //        $("#lblOrderchosendate").html(fdate);
                        //        $("#lblOrderchosendate1").html(date[0]);
                        //        $("#lblOrderchosendate2").html(date[1]);
                        //        $("#divFromDate").datepicker('setDate', Date.parse(date[0]));
                        //        $("#divToDate").datepicker('setDate', Date.parse(date[1]));

                        //        $("#imgOrderDate").attr("src", "images/Filter.png");
                        //        $("#tr2").addClass('FilterDivStyle');
                        //    }
                        //FramingFilters();
                                  <%--  if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {
                                        var CarriFilter = "Date >= ctod('" + $("#txtOrderFromRecDate").val() + "')  And  Date <= ctod('" + $("#txtOrderToRecDate").val() + "')";
                                    }
                                    else {
                                        var CarriFilter = "Date >= cast('" + $("#txtOrderFromRecDate").val() + "' as date)  And  Date <= cast('" + $("#txtOrderToRecDate").val() + "' as date)";
                                    }
                                    //var CarriFilter = "Date >= ctod('" + $("#txtOrderFromRecDate").val() + "')  And  Date <= ctod('" + $("#txtOrderToRecDate").val() + "')";
                                    LoadCarrierFilterDropdown(CarriFilter);--%>
                        //        }
                        //    }
                        //});

                    },
                    open: function () {
                        //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                });
                $("#DivOrderSummaryDialog").html(output.d).dialog("open");
            }
        });
    });

    $("#aApproval").live("click", function () {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/CheckApprovalFileExist",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                var msgApproval = result.d;
                if (msgApproval == "Exist") {
                    //window.open("ApprovalMaster.aspx");
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetPage',
                        data: '{ "controlName":"pages/PagePriceApproval.ascx","controlPara":"" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            $("#DivPagePriceApproval").html("");
                            $("#DivPagePriceApproval").html(output.d);
                            $("#fgrdApprovalList").empty();
							// Subhajit - 06-11-2022
                            $("#fgrdApprovalList").flexOptions({ params: [{ name: 'Filter', value: 'Today' }, { name: 'Approved', value: '' }] }).flexReload();
                            $("#hdnApproved").val("");
                            $("#spanApproved").html("Pending");

                           $("#dvPriceApprovalDialog").dialog('option', 'title', 'Price Change Approvals');
                            $("#dvPriceApprovalDialog").dialog("open");
                        }
                    });


                }
                else if (msgApproval == "NotExist") {
                    //$("#msg-approval").html("Approval Files not installed...");
                    //$("#msg-approval").dialog("open");
                    $.MessageBox("<h3>Approval Files not installed!</h5>");
                }
                else {
                    //$("#msg-approval").html("Approval not implemented!");
                    //$("#msg-approval").dialog("open");
                    $.MessageBox("<h3>Approval not implemented!</h5>");
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });

    $("#msgbox-approval").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    //PrintDVLabel code starts here
    $("#DivUploadDVLabel").dialog({
        autoOpen: false,
        resizable: false,
        width: 550,
        height: 250,
        modal: true,
        title: 'Upload CSV',
        close: function () {
            $("[id^=btnprintdvlabel]").removeClass("BloomButtonProcessing");
        }
    });

    $("#myDVfile").change(function () {

        var val = $(this).val();
        switch (val.substring(val.lastIndexOf('.') + 1).toLowerCase()) {
            case 'csv':
                //$(".YellowWarning").fadeOut(1000);
                $("#btnimportcsvdata").click();
                break;
            default:
                $(this).val('');
                $(".YellowWarning").hide();
                $(".YellowWarning").html("Please select csv file!");
                $(".YellowWarning").fadeIn(1000);
                break;
        }
    });

    $("#btnimportcsvdata").die("click").live("click", function (e) {
        //w = window.open('GeneratingPDF.html');
        var val = $("#myDVfile").val();
        var filename = val.substring(val.lastIndexOf('\\') + 1);
        if (filename != "") {
            var iframe = $('<iframe name="postiframe" id="postiframe"style="display: none" />');
            $("body").append(iframe);
            var form = $('#fileuploader');
            form.attr("target", "postiframe");
            form.attr("file", $('#myDVfile').val());
            form.submit();
        }
    });

    function startUpload() {
        $('#upload_process').show();
        $('#upload_form').hide();
        return true;
    }
    $("[id^=btnprintdvlabel]").live("click", function () {
        $("[id^=btnprintdvlabel]").addClass("BloomButtonProcessing");
        $("#txtmawbnumber").val("");
        $(".YellowWarning").hide();
        $('#upload_process').hide();
        $('#import_process').hide();
        $('#upload_form').show();
        $("#myDVfile").val("");
        $("#DivUploadDVLabel").dialog('option', 'title', 'Import CSV');
        $("#DivUploadDVLabel").dialog("open");
    });

    function stopUploadDV(path) {
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UploadDvFile',
            data: "{'path':'" + path + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "success") {
                    $("#DivUploadDVLabel").dialog("close");
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/PrintDVLabels',
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            if (output.d == "LogOut") {
                                w.close();
                                window.location.href = "Login.aspx"
                            }
                            else {
                                path = output.d;
                                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                                w.location = ExportedPath;
                            }
                        }
                    });
                }
            }
        });
    }

    //LookupBox# code starts here
    $("[id^=btnlookupboxdetails]").live("click", function () {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageLookupBox.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                $('<div id="DivBoxDetails">/div>').dialog({
                    title: 'Get box Details',
                    autoOpen: false,
                    width: 900,
                    height: 500,
                    modal: true,
                    resizable: false,
                    close: function () {
                        $('.YellowWarning').hide();
                    }
                });
                $("#DivBoxDetails").html(output.d).dialog("open");
            }
        });
    });

    $("#msgbox-warn").dialog({
        autoOpen: false,
        resizable: false,
        width: 350,
        modal: true,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });


    $("#imgToggle").live("click", function () {
        $(".ui-tooltip").hide();

        //debugger;
        if ($('#tdChart').css('display') == 'none') {
            //$("#tdChart").show("slide", { direction: "right" }, 1000);
            GetChartVisibility();
            $("#tdChart").show();
            $("#imgToggle").attr("title", "Hide Pie Charts");
            $("#DivOrderHeader div.flexigrid").animate({ "width": $(window).width() - 400 }, "fast");
        }
        else {
            //$("#tdChart").hide("slide", { direction: "right" }, 1000);
            $("#tdChart").hide();
            $("#imgToggle").attr("title", "Show Pie Charts");
            $("#DivOrderHeader div.flexigrid").animate({ "width": $(window).width() - 10 }, "fast");
        }
    });

    $("#rbCustList").die("click").live("click", function () {

        ListType = "Customer";
        IsToggleCustDetails = false;
        $("#imgCustomerInfoToggle").attr("title", "Show Customer List");
    });

    $("#rbCallList").die("click").live("click", function () {

        if ($("#ctl00_LoggedInUserSalesman").html().trim() == "" || $("#ctl00_LoggedInUserSalesman").html().trim() == "0") {
            $.MessageBox("You must have a sales person assigned");
            $('#rbCustList').attr('checked', true);
        }
        else if ($("#ctl00_LoggedInUserSalesman").html().trim() != "" || $("#ctl00_LoggedInUserSalesman").html().trim() != "0") {

            var Count = parseInt(CheckCallListAvailability($("#ctl00_LoggedInUserID").html()));
            if (Count > 0) {
                ListType = "CallList";
                IsToggleCustDetails = true;
                $("#DivCustomerDetails").hide();
                $("#imgCustomerInfoToggle").attr("title", "Show Call List");
            }
            else {
                $.MessageBox("CallList not available for this user");
                $('#rbCustList').attr('checked', true);
            }
        }
        else {
            $('#rbCustList').attr('checked', true);
        }
    });

    $("#imgCustomerInfoToggle").die("click").live("click", function () {

        if (ListType == "Customer") {
            $(".ui-tooltip").hide();
            if ($('#DivCustomerDetails').css('display') == 'none') {
                $("#DivCustomerDetails").show();
                $("#imgCustomerInfoToggle").attr("title", "Hide Customer List");

                $("#btnViewSales").val("View Sales");
                $("#tblcurrentOrder").hide()
                $("#btnSalesSaveInvoicePdf").hide();
                $("#imgToggle").hide();       
                $("#trNetSalesGraph").hide();
            }
            else {
                $("#DivCustomerDetails").hide();
                $("#imgCustomerInfoToggle").attr("title", "Show Customer List");
                $("#trNetSalesGraph").show();
            }
        }
    });

    $("#imgCustomerInfoToggle").live("click", function () {        
        if (IsToggleCustDetails == false) {
            LoadToggleCustomerDetails();
            IsToggleCustDetails = true;
        }
        if (IsToggleCustDetails == true && ListType == "CallList") {
            var OnlyMe = $('#chkShowAllSalesPersonSales').is(':checked');            
            var UserID = $("#ctl00_LoggedInUserID").html();
            $.ajax({
                type: "POST",
                url: "BloomService.asmx/GetCallListCreatedDay",
                data: "{'UserID':'" + UserID + "'}",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (output) {

                    var res = output.d;
                    $("#fgrdCallListDetails").empty();
                    $("#fgrdCallListDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Exclude', value: '' }, { name: 'OnlyMe', value: OnlyMe }], query: "", newp: 1 }).flexReload();

                    $("#DialogCallList").dialog('option', 'title', 'CALL LIST FOR ' + res.toUpperCase());
                    $("#DialogCallList").dialog("open");
                }
            });
        }
    });

    function CheckCallListAvailability(UserID) {

        var Count;
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetCallListCountForUser",
            data: "{'UserID':'" + UserID + "'}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output) {

                var res = output.d;
                Count = parseInt(res);
            }
        });
        return Count
    }

    function LoadToggleCustomerDetails() {
        $("#fgrdCustomerDetails").flexigrid({
            url: 'BloomService.asmx/GetCustomerDetailsFromSQL',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 15, sortable: true, align: 'left' },
                { display: 'CUST#', name: 'Customer', width: 30, sortable: true, align: 'left' },
                { display: 'Name', name: 'Name', width: 250, sortable: true, align: 'left' },
                { display: 'Phone', name: 'Phone', width: 80, sortable: true, align: 'left' },
                { display: 'Buyer', name: 'Purchaser', width: 150, sortable: true, align: 'left' },
                { display: 'City', name: 'City', width: 90, sortable: true, align: 'left' },
                { display: 'State', name: 'State', width: 25, sortable: true, align: 'left' },
                { display: 'Country', name: 'Country', width: 33, sortable: true, align: 'left' },
                { display: 'LastSale', name: 'LastSale', width: 40, sortable: true, align: 'left' },
                { display: 'Days', name: 'Days', width: 40, sortable: true, align: 'left' },
                { display: 'LastCall', name: 'LastCall', width: 40, sortable: true, align: 'left' },
                { display: 'Balance', name: 'ARBALANCE', width: 90, sortable: true, align: 'right' },
                { display: 'Creditlimit', name: 'Creditlimit', width: 90, sortable: true, align: 'right' },
                { display: 'Available', name: 'Available', width: 90, sortable: true, align: 'right' },
                { display: 'Hold', name: 'Credithold', width: 20, sortable: true, align: 'left' },
                { display: 'Salesperson', name: 'SalesmanName', width: 100, sortable: true, align: 'left' },
            ],
            searchitems: [
                { display: 'CUST#', name: 'Customer' },
                { display: 'Name', name: 'Name' },
                { display: 'Phone', name: 'Phone' },
                { display: 'Buyer', name: 'Buyer' },
                { display: 'City', name: 'City' },
                { display: 'State', name: 'State' },
                { display: 'Country', name: 'Country' },
                { display: 'LastSale', name: 'LastSale' },
                { display: 'Days', name: 'Days' },
                { display: 'LastCall', name: 'LastCall' },
                { display: 'Balance', name: 'Balance' },
                { display: 'Creditlimit', name: 'Creditlimit' },
                { display: 'Available', name: 'Available' },
                { display: 'Hold', name: 'Credithold' },
                { display: 'Salesperson', name: 'SalesmanName' },
            ],
            showTableToggleBtn: true,
            sortname: "Order Asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: $(window).height() - 249,
            width: $(window).width() - 10,
            striped: true,

            params: [
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {

                var sel = jQuery("#fgrdCustomerDetails tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivCustomerDetails #ExportCSV").show();
                }

            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });

        $("#DivCustomerDetails .sDiv").css('float', 'left').css('width', '600px');
        $('#DivCustomerDetails .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivCustomerDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivCustomerDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivCustomerDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }


    $("#txtPOSearch").autocomplete({
        source: function (request, response) {

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPONumberFromVETForAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (VET) {
                        return {
                            label: VET.PO,
                            PO: VET.PO
                        }
                    }))
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        },
        open: function (event, ui) {
            $(".ui-menu").css("z-index", 1000);
        },
        select: function (e, i) {

            PONumberAutocompleteSelect(i.item.PO);
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtPOSearch").val("");
                $("#txtPOSearch").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    function PONumberAutocompleteSelect(PONumber) {
        $("#txtPOSearch").val("");

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetInvoiceNoListFromVETByPONumber',
            data: "{'PONumber': '" + PONumber + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                var VETData = output.d;
                var InvoiceList = ""
                InvoiceList += "<table style='margin: 0 auto;'>"
                InvoiceList += "<tr><td><b>PONumber :: " + PONumber + " </b></td></tr>"
                InvoiceList += "<tr><td class='InvoiceListtd' style='background-color: #dedede;text-align: center'>Invoice</td></tr>"

                for (var i in VETData) {
                    InvoiceList += '<tr><td class="InvoiceListtd">' + VETData[i].Invoice + '</td></tr>';
                }
                InvoiceList += "</table>"
                $.MessageBox(InvoiceList);
            }
        });
    }


    $("#txtCustSearch").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustForAutocompleteWithDivision',
                data: "{'Searchtext': '" + request.term + "','OnlyMe': '" + $('#chkShowAllSalesPersonSales').is(':checked') + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number
                    response($.map(data.d, function (item) {
                        return {
                            label: "[" + item.Customer + "] " + "[" + item.SalesMan + "] " + item.Name,
                            Customer: item.Customer,
                            Name: item.Name,
                            SalesMan: item.SalesMan
                        }
                    }))
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        },
        open: function (event, ui) {

            //$(".ui-menu").css("width", 250);
            $(".ui-menu").css("z-index", 1000);
            //if ($("#imgToggle").css('display') == 'none')
            //    $(".ui-menu").css("left", 1085);
            //else
            //    $(".ui-menu").css("left", 1095);
        },
        select: function (e, i) {
            //debugger;
            //$("#DivUser").next('div').find('.msgui').hide();
            $("#txtCustSearch").val(i.item.Customer);
            autocomplteSelect(i.item.Customer, i.item.Name, i.item.SalesMan); //27 Mar 19 :: Muthu Nivetha M :: show salesperson # in account search dropdown next to account number
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtCustSearch").val("");
                $("#txtCustSearch").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });


    var AlreadyOrderNewPageLoaded = false;
    function autocomplteSelect(Customer, Name) {


        $("#CurrentCustomerNo").html(Customer);
        //$("#fgrdARINVCustomer").empty();
        //$("#fgrdARINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }], query: "", newp: 1 }).flexReload();
        //$("#DivARINVCustomerGridDialog").dialog('option', 'title', 'ARINVS Info For Customer :: ' + Customer + '');
        //$("#DivARINVCustomerGridDialog").dialog("open");
        if (AlreadyOrderNewPageLoaded == false) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPage',
                data: '{ "controlName":"pages/PageOrderNew.ascx","controlPara":"" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    //debugger;
                    $("#DivPageOrderNew").html("");
                    $("#DivPageOrderNew").html(output.d);
                    $("#fgrdOrderNewDetails").empty();
                    $("#fgrdOrderNewDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }], query: "", newp: 1 }).flexReload();
                    $("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER :: ' + Customer + ' <span style="margin-left:25px;" id="DaysTruckNewOrder">   </span>');
                    $("#DivOrderNewDetailsDialog").dialog("open");
                }
            });
            AlreadyOrderNewPageLoaded == true
        }
        else {
            $("#fgrdOrderNewDetails").empty();
            $("#fgrdOrderNewDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }], query: "", newp: 1 }).flexReload();
            $("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER :: ' + Customer + ' <span style="margin-left:25px;" id="DaysTruckNewOrder">   </span>');
            $("#DivOrderNewDetailsDialog").dialog("open");
        }


    }

    $("[id^=aCustomerName_]").die("click").live("click", function () {
        //$(".PleaseWaitOverlay").dialog('option', 'title', "Loading");
        //$(".PleaseWaitOverlay").dialog("open");       

        $("#imgUserLoader").show();
        var Customer = $(this).attr('id').replace("aCustomerName_", "");
        $("#CurrentCustomerNo").html(Customer);
        if (AlreadyOrderNewPageLoaded == false) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPage',
                data: '{ "controlName":"pages/PageOrderNew.ascx","controlPara":"" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    $("#DivPageOrderNew").html("");
                    $("#DivPageOrderNew").html(output.d);
                    $("#fgrdOrderNewDetails").empty();
                    $("#fgrdOrderNewDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }], query: "", newp: 1 }).flexReload();
                    $("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER :: ' + Customer + ' <span style="margin-left:25px;" id="DaysTruckNewOrder">   </span>');
                    $("#DivOrderNewDetailsDialog").dialog("open");

                }
            });
            AlreadyOrderNewPageLoaded == true
        }
        else {
            $("#fgrdOrderNewDetails").empty();
            $("#fgrdOrderNewDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }], query: "", newp: 1 }).flexReload();
            $("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER :: ' + Customer + ' <span style="margin-left:25px;" id="DaysTruckNewOrder">   </span>');
            $("#DivOrderNewDetailsDialog").dialog("open");
        }

    });

    function LoadCustomerDetailsByCustNo(Customer) {

        GetCustDetailsPage(Customer, "", "");
    }

    $(".rbsearch").change(function () {
        $("#txtCustSearch").val("");
        $("#txtInvSearch").val("");
        $('#txtPOSearch').val("");
        $(".ui-menu").css("display", "none");

        if ($("#rbinv").attr("checked")) {
            $('#txtPOSearch').hide();
            $('#txtCustSearch').hide();
            $('#txtInvSearch').show();
        }
        else if ($("#rbcust").attr("checked")) {
            $('#txtPOSearch').hide();
            $('#txtInvSearch').hide();
            $('#txtCustSearch').show();
        }
        else {
            $('#txtInvSearch').hide();
            $('#txtCustSearch').hide();
            $('#txtPOSearch').show();
        }
    });

    $("#txtInvSearch").keypress(function (e) {
        debugger
        if (e.which == 13) {
            //debugger;
            IsVoidedInvoice = "";
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetOrderDateByrderNo',
                data: '{"OrderNo":"' + $("#txtInvSearch").val().toString() + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    //debugger;
                    var data = output.d.VOID;
                    IsVoidedInvoice = data.toString().toLowerCase() == "true" ? "VOIDED" : "";

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/CheckInvoice',
                        data: "{'Searchtext': '" + $("#txtInvSearch").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            //debugger;
                            var customer = output.d;
                            if (customer.trim().toLowerCase() != "error" && customer.trim().toLowerCase() != "") {
                                editorder($("#txtInvSearch").val().toString(), customer)
                            }
                            else {
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/CheckVETInvoice',
                                    data: "{'Searchtext': '" + $("#txtInvSearch").val() + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (result) {

                                        var out = result.d;
                                        if (result.d.length >= 1) {
                                            LoadVETCustomerDetailsByCustNo(out[0].Customer, out[0].RecDate, "DivVETInvoiceGridDialog");
                                            $("#CurrentCustomerNo").html(out[0].Customer);
                                            $("#DivVETInvoiceNo").html(out[0].Invoice);
                                            //loadVETInvoiceGrid(splitstr[0]);
                                            $("#fgrdVETINVCustomer").empty();
                                            $("#fgrdVETINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: out[0].Invoice }], query: "", newp: 1 }).flexReload();

                                            $("#DivVETInvoiceGridDialog").dialog('option', 'title', '<div> VET Details :: ' + out[0].Invoice + '</div><div>' + IsVoidedInvoice + '</div>');
                                            //$("#DivVETInvoiceGridDialog").data('Invoice', out[0].Invoice).dialog("open");
                                            $("#DivVETInvoiceGridDialog").data("inData", { Invoice: out[0].Invoice, Customer: out[0].Customer }).dialog("open");
                                        }
                                        else {
                                            $("#msgbox-warn").dialog("open");
                                            $("#msghtml").html("Invoice not found");
                                            $("#txtInvSearch").val("");
                                        }
                                    }
                                });
                            }

                        },
                        onError: function (xhr, status, errorThrown) {
                            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                        }
                    });
                },
                onError: function () {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            });

        }
    });



    $("#fgrdScannedDetails").flexigrid({
        url: 'BloomService.asmx/GetScannedDetailsForInvoice',
        dataType: 'xml',
        colModel: [
            { display: 'Farm', name: 'FarmCode', width: 40, sortable: true, align: 'left' },
            { display: 'Flower', name: 'Flower', width: 70, sortable: true, align: 'left' },
            { display: 'Description', name: 'Name', width: 170, sortable: true, align: 'left' },
            { display: 'Boxes', name: 'Boxes', width: 60, sortable: true, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 30, sortable: true, align: 'left' },
            { display: 'UnitsBunch', name: 'UnitsBunch', width: 60, sortable: true, align: 'right' },
            { display: 'Units', name: 'Units', width: 80, sortable: true, align: 'right' },
            { display: 'Boxnum', name: 'Boxnum', width: 60, sortable: true, align: 'right' },
            { display: 'Scanned', name: 'ScannedBox', width: 50, sortable: true, align: 'right' },
            { display: 'Missing', name: 'MissingBox', width: 50, sortable: true, align: 'right' }
        ],
        searchitems: [
            { display: 'Farm', name: 'FarmCode' },
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'Name' },
            { display: 'Boxes', name: 'Boxes' },
            { display: 'Boxnum', name: 'Boxnum' },
        ],
        showTableToggleBtn: true,
        sortname: "FarmCode Asc",
        sortorder: "",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "",
        rp: 30000,
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: false,
        showTableToggleBtn: false,
        height: 390,
        width: 810,
        striped: true,

        params: [
            { name: 'ExportCSV', value: '' },
            { name: 'Invoice', value: '0' },
        ],
        onSuccess: function () {

            var sel = jQuery("#fgrdScannedDetails tbody tr");
            var len = sel.length;
            if (len <= 1) {
                $("#DivScannedDetails #ExportCSV").hide();
            }
            else {
                $("#DivScannedDetails #ExportCSV").show();
            }
            $('#fgrdScannedDetails #row0').addClass("TotalRows")

            //$('#fgrdScannedDetails #row0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            //$('#fgrdScannedDetails #row0 td:nth-child(4) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            //$('#fgrdScannedDetails #row0 td:nth-child(9) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            //$('#fgrdScannedDetails #row0 td:nth-child(10) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

            $("#DivScannedDetails .sDiv").css('float', 'left').css('width', '585px');
            $('#DivScannedDetails .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#DivScannedDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivScannedDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivScannedDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show()
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
            }
        }
    });

    $("[id^=imgScanned_").die("click").live("click", function () {

        var ordernum = $(this).attr("id").substring(11);
        //LoadScannedDetails(ordernum);
        $("#fgrdScannedDetails").empty();
        $("#fgrdScannedDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: ordernum.toString() }], query: "", newp: 1 }).flexReload();

        $("#DivScannedDetails").dialog('option', 'title', 'Invoice# :: ' + ordernum + '');
        $("#DivScannedDetails").dialog("open");
    });

    $("#DivScannedDetails").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 835,
        height: 520,
        modal: true,
    });

    $("[id^=lnkBoxnum_]").die("click").live("click", function () {
        //debugger;
        var Order = $(this).attr("data-order");
        var Boxnum = $(this).attr("data-boxnum");
        var Farm = $(this).attr("data-farm");

        var para = "Order=" + Order + "&Boxnum=" + Boxnum + "&Farm=" + Farm;

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageLookupBox.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                $('<div id="DivBoxDetails">/div>').dialog({
                    title: 'Get box Details',
                    autoOpen: false,
                    width: 900,
                    height: 500,
                    modal: true,
                    resizable: false,
                    close: function () {
                        $('.YellowWarning').hide();
                    }
                });
                $("#DivBoxDetails").html(output.d).dialog("open");
            }
        });

        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetBoxnumSequenceFromXML',
        //    data: "{'Order': '" +Order+ "','Farm':'"+Farm+"','Boxnum':'"+Boxnum+"'}",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (data) {
        //        var res = data.d;
        //        $("#DivBoxnumSeqDetails").dialog("open");
        //        $("#DivBoxnumSeqDetails").dialog('option', 'title', 'Farm :: ' + Farm + ' Boxnum :: ' + Boxnum + '');
        //        $("#DivBoxnumSeqDetails").html(res);
        //    }
        //});

        //$("#DivBoxnumSeqDetails").dialog({
        //    autoOpen: false,
        //    resizable: false,
        //    width: 450,
        //    height: 350,
        //    modal: true,
        //    buttons: {
        //        Ok: function () {
        //            $(this).dialog("close");
        //        }
        //    },
        //    open: function () {
        //        $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        //    }
        //});
    });

    $("#btnARINVSForThisCustomer").die("click").live("click", function () {
        var Customer = $("#ctl00_LoggedInCustomerNo").html();
        LoadCustomerDetailsByCustNo(Customer);
        $("#CurrentCustomerNo").html(Customer);
        $("#fgrdARINVCustomer").empty();
        $("#fgrdARINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'IsARINVHistory', value: "0" }], query: "", newp: 1 }).flexReload();
        $("#trOrderCustDetails1").hide();
        //$("#DivARINVCustomerGridDialog .bDiv").css("height", "474px");
        $("#DivARINVCustomerGridDialog").dialog('option', 'title', 'ARINVS Info For Customer :: ' + Customer + '');
        $("#DivARINVCustomerGridDialog").dialog("open").data("Customer", Customer);
    });
    $(".PleaseWaitOverlay").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 300,
        height: 150,
        modal: true
    });




    $("#btnCustomerOrder").die("click").live("click", function () {
        //$(".PleaseWaitOverlay").dialog('option', 'title', "Loading");
        //$(".PleaseWaitOverlay").dialog("open");       
        $("#imgUserLoader").show();
        var Customer = $("#ctl00_LoggedInCustomerNo").html();
        // LoadCustomerDetailsByCustNo(Customer);
        $("#CurrentCustomerNo").html(Customer);

        var para = "";
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCustomerOrder.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                $('<div id="DivNewOrderDialog">/div>').dialog({
                    title: 'NewOrder',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1100,
                    height: $(window).height() - 10,
                    //closeOnEscape:false,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {

                    },

                });
                $("#DivNewOrderDialog").html(output.d).dialog("open");
                $('#txtShipDate').attr('disabled', false)
            }
        });
    });

    $("[id^=aSLSMAN_]").die("click").live("click", function () {
        window.location.href = "mailto:" + $(this).data("email") + "";
    });




    $("#btnActivateScan").die("click").live("click", function () {

        var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");

        if (SelectedOrders.length <= 0) {
            $.MessageBox("Please select invoice to mark as scanned");
            return false;
        }

        var OrderNos = []
        for (var i = 0; i <= SelectedOrders.length - 1; i++) {
            OrderNos.push(SelectedOrders[i].id.substring(12));
        }

        $('<div id="DivChangeScanFlag" style="">' +
            +'</div>').dialog({
                title: 'Set Scan',
                autoOpen: false,
                resizable: false,
                modal: true,
                width: 500,
                buttons: {
                    Yes: function () {



                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/ActivateScanFlag',
                            data: "{'OrderNos': '" + OrderNos + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                $("#DivChangeScanFlag").dialog('close');
                                if (output.d == "LogOut") {
                                    window.location.href = "Login.aspx"
                                }
                                else if (output.d == "success") {
                                    $.each(OrderNos, function (i, val) {

                                        //without reloading the whole grid just change the cell
                                        if ($("#fgrdOrderHeader #row" + val + "").find("td div").eq(16)[0].innerHTML.indexOf("<img") == "-1") { // If scanned column has value then empty that column after release it from table
                                            $("#fgrdOrderHeader #row" + val + "").find("td div").eq(16)[0].innerHTML = "<img id='imgscannedcustomer_" + val + "' style='margin-top:-3px; margin-left:3px;cursor:pointer;border-bottom:2px solid #ac5b6a' src='images/redtick.png'>"
                                        }

                                    });
                                }
                                else {
                                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                }
                            }
                        });
                    },
                    No: function () {
                        $(this).dialog("close");
                    }

                },
                close: function (event, ui) {
                    $(this).dialog('destroy').remove();
                },
                open: function () {
                    $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
                    $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel red');
                },

            });
        $("#DivChangeScanFlag").html("<div><b>Do you want to set the selected invoices as scanned?</b> </div>");
        $("#DivChangeScanFlag").dialog("open");


    });

    //Mani::To release "Scan" and "Shipped" on first time,   Second click will make printed , list , bills,  false in F_order1 for the selected orders
    $("#btnRelease").die("click").live("click", function () {

        var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");

        if (SelectedOrders.length <= 0) {
            $.MessageBox("Please select at least one invoice to release");
            return false;
        }

        var OrderNos = []
        for (var i = 0; i <= SelectedOrders.length - 1; i++) {
            OrderNos.push(SelectedOrders[i].id.substring(12));
        }


        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ReleaseInvoice',
            data: '{ "OrderNos":"' + OrderNos + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d == "success") {
                    $.each(OrderNos, function (i, val) {

                        var Boxes = $("#aOrderBoxes_" + val).html();
                        $("#aOrderMissingBoxes_" + val).html(Boxes);
                        //without reloading the whole grid just change the cell
                        if ($("#fgrdOrderHeader #row" + val + "").find("td div").eq(16)[0].innerHTML.indexOf("<img") >= 0) { // If scanned column has value then empty that column after release it from table
                            $("#fgrdOrderHeader #row" + val + "").find("td div").eq(16)[0].innerHTML = "" // make empty the scanned column 
                        }
                        else { // 
                            $("#fgrdOrderHeader #row" + val + "").find("td div").eq(15)[0].innerHTML = "" // make empty the Bills column 
                            $("#fgrdOrderHeader #row" + val + "").find("td div").eq(14)[0].innerHTML = "" // make empty the Picking column 
                            $("#fgrdOrderHeader #row" + val + "").find("td div").eq(13)[0].innerHTML = "" // make empty the Printed column 

                            $('#fgrdOrderHeader #row' + val).removeClass("trChecked");
                            $("#Orderselect_" + val).removeClass('Orderselected');
                            $("#Orderselect_" + val).prop("src", "images/check-off.png");
                        }
                    });

                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    });

    /*Warning for Controls loading on Customer Add/Edit screen*/
    $("#msgbox-CustDetailsWarning").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        width: 350,
        closeOnEscape: false,
        open: function () {
            $("#msgbox-CustDetailsWarning").focus();
            $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
            //$(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    /*When HOLD icon click, open Customer edit screen*/
    $("[id^=aCustomerHoldARINVS_]").die("click").live("click", function () {

        var Customer = $(this).attr('id').replace('aCustomerHoldARINVS_', '');
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
                $('<div id="DivCustomerPage">/div>').dialog({
                    title: 'Customer Details',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 970,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        $("#chkCreditHold").focus();
                        $("#txtCustNo").show();
                        $("#DivCustButtonList").hide();
                        $("#btnCustomerDetailsSave").show();
                        $('#DialogCustomerUpdate input[type="text"],#DialogCustomerUpdate textarea,#DialogCustomerUpdate select').not("#txtCustNo").attr('disabled', false);
                        //$("[id^=chk]").iButton("enable");
                        //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                });
                $("#DivCustomerPage").html(output.d).dialog("open");
                $("#msgbox-CustDetailsWarning").dialog("close");
            }
        });
    });



    //$("#txtInvSearch").autocomplete({
    //    source: function (request, response) {

    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/GetInvForAutocomplete',
    //            data: "{'Searchtext': '" + request.term + "'}",
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (data) {

    //                response($.map(data.d, function (item) {
    //                    return {
    //                        label: "[" + item.Invoice + "] " + item.RecDate,
    //                        Invoice: item.Invoice,
    //                        RecDate: item.RecDate,
    //                        Customer:item.Customer
    //                    }
    //                }))
    //            },
    //            error: function (response) {
    //                alert(response.responseText);
    //            },
    //            failure: function (response) {
    //                alert(response.responseText);
    //            }
    //        });
    //    },
    //    open: function (event, ui) {

    //        $(".ui-menu").css("width", 250);
    //        $(".ui-menu").css("z-index", 1000);
    //        if ($("#imgToggle").css('display') == 'none')
    //            $(".ui-menu").css("left", 1085);
    //        else
    //            $(".ui-menu").css("left", 1095);
    //    },
    //    select: function (e, i) {

    //        //$("#DivUser").next('div').find('.msgui').hide();
    //        $("#txtInvSearch").val(i.item.Invoice);
    //        autocomplteSelectInvoice(i.item.Invoice, i.item.RecDate, i.item.Customer);
    //    },
    //    change: function (e, i) {

    //        if (i.item == null || i.item == undefined) {
    //            $("#txtInvSearch").val("");
    //            $("#txtInvSearch").focus();
    //            $(".ui-menu").css("display", "none");
    //        }
    //    },
    //    minLength: 1,
    //    autoFocus: true
    //});

    //function autocomplteSelectInvoice(Invoice, RecDate, Customer)
    //{

    //    LoadVETCustomerDetailsByCustNo(Customer, RecDate);
    //    //loadVETInvoiceGrid(splitstr[0]);
    //    $("#fgrdVETINVCustomer").empty();
    //    $("#fgrdVETINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: Invoice }], query: "", newp: 1 }).flexReload();

    //    $("#DivVETInvoiceGridDialog").dialog('option', 'title', 'VET Info For Invoice :: ' + Invoice + '');
    //    $("#DivVETInvoiceGridDialog").dialog("open");
    //}


    /*Net sales calculation for ALL customers*/
    $(".imgAllCustSales").die('click').live('click', function () {
        var controlPara = "Customer=0";
        //debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCustNetSales.ascx","controlPara":"' + controlPara + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DivNetSalesDetails_OrderPage">/div>').dialog({
                    title: '',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 820,
                    height: 460,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();

                    },
                    open: function () {
                        $("#DivNetSalesDetails_OrderPage .ui-dialog-content.ui-widget-content").css("padding", "0px");
                        $("#DivCustSince").html($("#tblCustInfo").html());
                    }
                });
                $("#DivNetSalesDetails_OrderPage").html(output.d).dialog("open");
            }
        });
    });

    /*--------------- Anitha :: 03-Oct-2018 :: new button for sales summary report ---------------*/
    var SalesSessionFromDt = new Date();
    var SalesSessionToDt = new Date();

    $("#btnSalesSummaryReport").die("click").live("click", function () {
        $("#txtSalesSummaryFromDate").datepicker('setDate', SalesSessionFromDt);
        $("#txtSalesSummaryToDate").datepicker('setDate', SalesSessionToDt);
        $("#txtSalesSummaryByCarrier").val("");
        $("#txtSalesSummaryByCarrier").attr('placeholder', 'Y');
        $("#txtSalesSummarySelectCarrier").val("");
        $("#DialogSalesSummaryReport").dialog("open");
    });

    $("#DialogSalesSummaryReport").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales Summary Report",
        width: 390,
        height: $(window).height() - 410,
        modal: true,
        buttons: {
            Print: function () {
                var SalesSummaryFromDate = $("#txtSalesSummaryFromDate").val();
                var SalesSummaryToDate = $("#txtSalesSummaryToDate").val();
                var SalesSummaryByCarrier = $("#txtSalesSummaryByCarrier").val() == "" ? $("#txtSalesSummaryByCarrier").attr('placeholder') : $("#txtSalesSummaryByCarrier").val();
                var SalesSummarySelectCarrier = $("#txtSalesSummarySelectCarrier").val();
                PrintSalesSummaryReports(SalesSummaryFromDate, SalesSummaryToDate, SalesSummaryByCarrier, SalesSummarySelectCarrier);
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel red');
        },
    });

    function PrintSalesSummaryReports(SalesSummaryFromDate, SalesSummaryToDate, SalesSummaryByCarrier, SalesSummarySelectCarrier) {
        //debugger;
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintSalesSummaryReport',
            data: "{'SalesSummaryFromDate':'" + SalesSummaryFromDate + "','SalesSummaryToDate':'" + SalesSummaryToDate + "','SalesSummaryByCarrier':'" + SalesSummaryByCarrier
                + "','SalesSummarySelectCarrier':'" + SalesSummarySelectCarrier + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                //debugger;
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data for the selected date!");
                    w.close();
                }
                else {
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    $("#txtSalesSummaryFromDate").datepicker('setDate', SalesSessionFromDt);
                    $("#txtSalesSummaryToDate").datepicker('setDate', SalesSessionToDt);
                }
                $("#DialogSalesSummaryReport").dialog("close");
            }
        });
    }
     /* Generate Invoice For Standing Order and Pre-Books Add By Prashant 24-Apr-2020*/
    var SPORDShipdate = new Date();


    $("#btnSPORDInvoice").die("click").live("click", function () {
        $("#txtSPORDShipDate").datepicker('setDate', SPORDShipdate);
        $("#txtSPORDStandingAWB").val("");
        $("#chkInteractiveMode").prop("checked", true);
        $("#chkRefreshGrid").prop("checked", true);
        //$("#txtSalesSummaryByCarrier").attr('placeholder', 'Y');
        //$("#txtSalesSummarySelectCarrier").val("");
        LoadWarehouseListDropDownEditPO();
        $('#txtInvenToIgnore').val("LFDQP*");
        $('#lstSPORDFarm').empty();
        LoadFarm();
        $("#DialogSPORDInvoice").dialog("open");
    });

    $("#DialogSPORDInvoice").dialog({
        autoOpen: false,
        resizable: false,
        title: "Generate Standing / Pre-Books Invoices",
        width: 500,
        height: 380,
        modal: true,
        buttons: {
            'CloseWeek': {
                text: 'CloseWeek',
                class: 'BloomButtonEnabled',
                click: function () {
                    CloseWeekClicked();
                }
            },
            'Continue': {
                text: 'Continue',
                click: function () {
                    var IsStanding = $('#chkStanding').is(':checked');
                    var IsPreBooks = $('#chkPrebooks').is(':checked');
                    var Shipdate = $('#txtSPORDShipDate').val();
                    var AWB = $('#txtSPORDStandingAWB').val();
                    var Farm = $('#lstSPORDFarm').val();
                    var InvenToIgnore = $('#txtInvenToIgnore').val();
                    var Warehouse = $('#lstSPORDWarehouse').val();

                    if ($('#chkInteractiveMode').is(':checked')) {
                        if ($('#chkRefreshGrid').is(':checked')) {
                            IsSalesOrderGridReload = false;
                            ////
                            DeleteTempStandingOrder();
                        }
                        $("#DivStandingOrderList").dialog("open");
                        $("#fgrdStandingOrderList").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'ShipDate', value: Shipdate }, { name: 'IsStanding', value: IsStanding }, { name: 'IsPreBooks', value: IsPreBooks }, { name: 'AWB', value: AWB }, { name: 'Warehouse', value: Warehouse }, { name: 'Farm', value: Farm }, { name: 'InvenToIgnore', value: InvenToIgnore }], query: "", newp: 1 }).flexReload();
                    }
                }
            },
            'Close': function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Continue')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel red');
            $(".ui-dialog-buttonpane button:contains('CloseWeek')").addClass('dialogbuttonstyle icon-save');
        },
    });
    function CloseWeekClicked() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ExecuteCloseWeek',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("Error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else {
                    $.MessageBox("CloseWeek executed successfully");
                }
            }
        });
    }

    function DeleteTempStandingOrder() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteTempStandingOrder',
            async: false,
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "Success") {
                    return true;
                }
                else {
                    return false;
                }
            }
        });
    }
    function ClearStandingOrders() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ClearStandingOrders',
            async: false,
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "success") {
                    $.growl.notice({ title: "", message: "Success!!" });

                    var IsStanding = $('#chkStanding').is(':checked');
                    var IsPreBooks = $('#chkPrebooks').is(':checked');
                    var Shipdate = $('#txtSPORDShipDate').val();
                    var AWB = $('#txtSPORDStandingAWB').val();
                    var Warehouse = $('#lstSPORDWarehouse').val();
                    var Farm = $('#lstSPORDFarm').val();
                    var InvenToIgnore = $('#txtInvenToIgnore').val();
                    $("#fgrdStandingOrderList").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'ShipDate', value: Shipdate }, { name: 'IsStanding', value: IsStanding }, { name: 'IsPreBooks', value: IsPreBooks }, { name: 'AWB', value: AWB }, { name: 'Warehouse', value: Warehouse }, { name: 'Farm', value: Farm }, { name: 'InvenToIgnore', value: InvenToIgnore }], query: "", newp: 1 }).flexReload();

                }
                else {
                    $.growl.error({ title: "", message: "error!!" });
                }
            }
        });
    }

    //List For Interactive mode For Standing Order and Inventory
    $("#DivStandingOrderList").dialog({
        autoOpen: false,
        resizable: false,
        title: "Standing / Inventory Comparison",
        width: 1080,
        height: 675,
        modal: true,
        buttons: {
            Clear: function () {
                ClearStandingOrders();
            },
            Generate: function () {
                var TotalRows = 0;
                $('#fgrdStandingOrderList tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        Id = $(this).attr("id").replace("row", "");
                        TotalRows = parseInt(TotalRows) + 1
                    }
                });
                if (parseInt(TotalRows) > 0) {
                    var IsStanding = $('#chkStanding').is(':checked');
                    var IsPreBooks = $('#chkPrebooks').is(':checked');
                    var Shipdate = $('#txtSPORDShipDate').val();
                    var AWB = $('#txtSPORDStandingAWB').val();
                    var Warehouse = $('#lstSPORDWarehouse').val();
                    var Farm = $('#lstSPORDFarm').val();
                    var InvenToIgnore = $('#txtInvenToIgnore').val();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GenerateStandingInvoiceManualFromTemp',
                        async: false,
                        data: "{'Shipdate':'" + Shipdate + "','IsStanding': '" + IsStanding + "','IsPreBook': '" + IsPreBooks + "','AWB': '" + AWB + "','Warehouse': '" + Warehouse + "','Farm':'" + Farm + "','InvenToIgnore':'" + InvenToIgnore + "'}",
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
                                $.MessageBox("No data for the selected date!");
                                w.close();
                            }
                            else {
                                $.MessageBox("Invoice Generated For " + output.d);
                                $("#DialogSPORDInvoice").dialog("close");
                                $("#DivStandingOrderList").dialog("close");
                                $("#DivSPORDCustomerDetail").dialog("close");
                            }
                        }
                    });
                }
                else {
                    $.MessageBox("There is no standing order for generate Invoice");
                    $("#DivStandingOrderList").dialog("close");
                }
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            LoadStandingOrderList(function (callback) {
            });
            $(".ui-dialog-buttonpane button:contains('Close Week')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Clear')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Generate')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel red');
        }

    });

    function LoadStandingOrderList(callback) {
        var weekday = new Array(7);
        weekday[0] = "Sunday";
        weekday[1] = "Monday";
        weekday[2] = "Tuesday";
        weekday[3] = "Wednesday";
        weekday[4] = "Thursday";
        weekday[5] = "Friday";
        weekday[6] = "Saturday";
        var IsStanding = $('#chkStanding').is(':checked');
        var IsPreBooks = $('#chkPrebooks').is(':checked');
        var Shipdate = $('#txtSPORDShipDate').val();
        var AWB = $('#txtSPORDStandingAWB').val();
        var Warehouse = $('#lstSPORDWarehouse').val();
        var Farm = $('#lstSPORDFarm').val();
        var InvenToIgnore = $('#txtInvenToIgnore').val();

        $('#txtShipDate').val(Shipdate);
        var DateStr = Shipdate.split('/');
        var ShipdateC = new Date(DateStr[2], DateStr[0] - 1, DateStr[1]);
        $('#txtShipDay').val(weekday[ShipdateC.getDay()]);
        $("#fgrdStandingOrderList").flexigrid({
            url: 'BloomService.asmx/GetStandingOrderList',
            dataType: 'xml',
            colModel: [
                { display: 'Flower#', name: 'Flower', width: 50, sortable: true, align: 'left', hide: true },
                { display: 'Desc', name: 'FlowerName', width: 250, sortable: true, align: 'left', process: StandingOrderRowClick },
                { display: 'Boxes', name: 'OrderedQty', width: 35, sortable: true, align: 'right', process: StandingOrderRowClick },
                { display: 'Uom', name: 'Uom', width: 30, sortable: true, align: 'left', hide: false },
                { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
                { display: 'TotalAmt', name: 'TotalAmt', width: 50, sortable: true, align: 'right' },
                { display: 'Short', name: 'DiffQty', width: 40, sortable: true, align: 'right' },
                { display: 'ShipDay', name: 'ShipDay', width: 50, sortable: true, align: 'left', hide: true },
                { display: 'Breakdown', name: 'Comments', width: 400, sortable: true, align: 'left' },
                { display: 'ShipDate', name: 'ShipDate', width: 55, sortable: true, align: 'left', hide: false },
                { display: 'Farm', name: 'Farm', width: 55, sortable: true, align: 'left', hide: false },
            ],
            searchitems: [
                { display: 'Desc', name: 'FlowerName' }
            ],
            showTableToggleBtn: true,
            sortname: "SrNo Asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            width: 1050,
            height: 460,
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }, { name: 'ShipDate', value: Shipdate }, { name: 'IsStanding', value: IsStanding }, { name: 'IsPreBooks', value: IsPreBooks }, { name: 'AWB', value: AWB }, { name: 'Warehouse', value: Warehouse }, { name: 'Farm', value: Farm }, { name: 'InvenToIgnore', value: InvenToIgnore }
            ],
            onSuccess: function () {

                var sel = jQuery("#fgrdStandingOrderList tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivStandingOrderList #ExportCSV").show();
                    $('#fgrdStandingOrderList #row0').addClass("TotalRows")
                }
                callback(true);
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                callback(true);
            }
        });
    }

    function StandingOrderRowClick(celDiv, id) {
        $(celDiv).click(function () {
            debugger;
            var FlowerCode = $("#fgrdStandingOrderList #row" + id + "").find("td div").eq(0)[0].innerText;
            var FlowerName = $("#fgrdStandingOrderList #row" + id + "").find("td div").eq(1)[0].innerText;
            var RowUnit    = $("#fgrdStandingOrderList #row" + id + "").find("td div").eq(5)[0].innerText;
            var RowComments = $("#fgrdStandingOrderList #row" + id + "").find("td div").eq(9)[0].innerText;
            if (FlowerName != "Total") {
                var UOM = $("#fgrdStandingOrderList #row" + id + "").find("td div").eq(4)[0].innerText;
                $("#fgrdStandingOrderList [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdStandingOrderList #row" + id).addClass("trSelectedHeader");
                $("#fgrdStandingOrderList #row" + id).removeClass("trSelected");
                //if (FlowerCode == $("#divFlowerCode").html()) {
                //    IsSPORDCustGridReload = true;
                //}
                //else {
                //    IsSPORDCustGridReload = false;
                //}
                $("#divFlowerCode").html(FlowerCode);
                $("#divUOM").html(UOM);
                $("#divFlowerName").html(FlowerName);
                //2020/09/20
                $("#divRowUnit").html(RowUnit);
                $("#divRowComments").html(RowComments);

                $("#DivSPORDCustomerDetail").dialog("open");
                IsSPORDCustGridReload = true;
            }
        });
    }

    $("#DivSPORDCustomerDetail").dialog({
        autoOpen: false,
        resizable: false,
        title: "Standing Orders Customer Details",
        width: 750,
        height: 750,
        modal: true,
        open: function () {
            if (IsSPORDCustGridReload) {
                var IsStanding = $('#chkStanding').is(':checked');
                var IsPreBooks = $('#chkPrebooks').is(':checked');
                var Shipdate = $('#txtSPORDShipDate').val();
                var AWB = $('#txtSPORDStandingAWB').val();
                var Warehouse = $('#lstSPORDWarehouse').val();
                var FlowerCode = $('#divFlowerCode').html();
                var UOM = $('#divUOM').html();
                var Farm = $('#lstSPORDFarm').val();
                var InvenToIgnore = $('#txtInvenToIgnore').val();
                //2020/09/20
                var RowUnit = $('#divRowUnit').html();
                var RowComments = $('#divRowComments').html();
                if (RowComments) {
                    RowComments = RowComments.replace("&nbsp;", "");
                }

                $("#txtFlower").val($('#divFlowerName').html());
                $("#txtUOM").val(UOM);
                $("#fgrdSPORDCustomerDetail").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'ShipDate', value: Shipdate }, { name: 'IsStanding', value: IsStanding }, { name: 'IsPreBooks', value: IsPreBooks }, { name: 'AWB', value: AWB }, { name: 'Warehouse', value: Warehouse }, { name: 'FlowerCode', value: FlowerCode }, { name: 'UOM', value: UOM }, { name: 'Farm', value: Farm }, { name: 'InvenToIgnore', value: InvenToIgnore }, { name: 'Unit', value: RowUnit }, { name: 'Comments', value: RowComments }], query: "", newp: 1 }).flexReload();
                callback(true);
            }
            else {
                LoadSPORDCustomerList(function (callback) {
                });
            }
        },
        close: function () {
            debugger;
            if (IsQtyReduce) {
                SPORDQtyReduce();
                var IsStanding = $('#chkStanding').is(':checked');
                var IsPreBooks = $('#chkPrebooks').is(':checked');
                var Shipdate = $('#txtSPORDShipDate').val();
                var AWB = $('#txtSPORDStandingAWB').val();
                var Warehouse = $('#lstSPORDWarehouse').val();
                var Farm = $('#lstSPORDFarm').val();
                var InvenToIgnore = $('#txtInvenToIgnore').val();
                $("#fgrdStandingOrderList").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'ShipDate', value: Shipdate }, { name: 'IsStanding', value: IsStanding }, { name: 'IsPreBooks', value: IsPreBooks }, { name: 'AWB', value: AWB }, { name: 'Warehouse', value: Warehouse }, { name: 'Farm', value: Farm }, { name: 'InvenToIgnore', value: InvenToIgnore }], query: "", newp: 1 }).flexReload();
                //callback(true);
            }
        }
    });

    function SPORDQtyReduce() {
        var SQLID = [];
        var Id = "";
        var InvoiceQty = "";
        $('#fgrdSPORDCustomerDetail tr').each(function () {
            if ($(this).attr("id") != "row0") {
                Id = $(this).attr("id").replace("row", "");
                InvoiceQty = $("#txtInvQty_" + Id).val();
                if (InvoiceQty == "")
                    InvoiceQty = $("#txtInvQty_" + Id).attr("placeholder");
                SQLID.push(Id + '~' + InvoiceQty);
            }
        });
        if (SQLID.length > 0) {
            SQLID.join(',');
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateQtyTempStandingOrder',
                async: false,
                data: "{'SelectedStr':'" + SQLID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if (output.d != "Success") {
                        return true;
                    }
                    else {
                        return false;
                    }
                },
                error: function (err) {
                    debugger;
                    alert(err);
                }
            });
        }
    }

    function LoadSPORDCustomerList(callback) {
        var IsStanding = $('#chkStanding').is(':checked');
        var IsPreBooks = $('#chkPrebooks').is(':checked');
        var Shipdate = $('#txtSPORDShipDate').val();
        var AWB = $('#txtSPORDStandingAWB').val();
        var Warehouse = $('#lstSPORDWarehouse').val();
        var FlowerCode = $('#divFlowerCode').html();
        var UOM = $('#divUOM').html();
        var Farm = $('#lstSPORDFarm').val();
        var InvenToIgnore = $('#txtInvenToIgnore').val();
        var RowUnit = $('#divRowUnit').html();
        var RowComments = $('#divRowComments').html();
        if (RowComments) {
            RowComments = RowComments.replace("&nbsp;", "");
        }

        $("#txtFlower").val($('#divFlowerName').html());
        $("#txtUOM").val(UOM);

        $("#fgrdSPORDCustomerDetail").flexigrid({
            url: 'BloomService.asmx/GetStandingOrderCustomerDetails',
            dataType: 'xml',
            colModel: [
                { display: 'Cust#', name: 'Customer', width: 50, sortable: true, align: 'left' },
                { display: 'Name', name: 'CustomerName', width: 190, sortable: true, align: 'left' },
                { display: 'Boxes', name: 'OrderedQty', width: 40, sortable: false, align: 'right', readonly: true },
                { display: 'Uom', name: 'Uom', width: 30, sortable: true, align: 'left' },
                { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right', hide: true },
                { display: 'Price', name: 'FOB', width: 50, sortable: true, align: 'right' },
                { display: 'TotalAmt', name: 'TotalAmt', width: 50, sortable: true, align: 'right' },
                { display: 'ShipDate', name: 'ShipDate', width: 55, sortable: true, align: 'left' },
                { display: 'ShipDay', name: 'ShipDay', width: 50, sortable: true, align: 'left', hide: true },
                { display: '', name: 'Reduce', width: 30, sortable: false, align: 'left' },
                { display: 'GPM', name: 'GPM', width: 35, sortable: false, align: 'left' },
                { display: 'Hold', name: 'Hold', width: 30, sortable: false, align: 'left' },
                { display: 'Sls#', name: 'SalesPerson', width: 30, sortable: false, align: 'left' },
            ],
            searchitems: [

                { display: 'Customer#', name: 'Cust#' },
                { display: 'Name', name: 'CustomerName' },
                { display: 'SalesPerson#', name: 'SalesPerson' }
            ],
            showTableToggleBtn: true,
            sortname: "SrNo Asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            width: 750,
            height: 540,
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            striped: true,
            params: [
               { name: 'FlowerCode', value: FlowerCode }, { name: 'UOM', value: UOM }, { name: 'Unit', value: RowUnit }, { name: 'Comments', value: RowComments }
            ],
            onSuccess: function () {
                var sel = jQuery("#fgrdSPORDCustomerDetail tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivSPORDCustomerDetail #ExportCSV").hide();
                    $('#fgrdSPORDCustomerDetail #row0').addClass("TotalRows")
                }
                $("#txtInvQty_0").css("display", "none");
                $("#btnReduceQty_0").css("display", "none");
                callback(true);
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                callback(true);
            }
        });
    }

    function LoadWarehouseListDropDownEditPO() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseList',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var data = output.d;
                $('#lstSPORDWarehouse').empty();
                for (var i in data) {
                    var WH = data[i];
                    $('#lstSPORDWarehouse').append('<option value="' + WH.WH + '">[' + WH.WH + ']' + WH.Name + '</option>');
                }
            }
        });
    }

    function LoadFarm() {
        var length = $('#lstSPORDFarm > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadFarm',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    var data = output.d;
                    $("#lstSPORDFarm").empty();
                    $("#lstSPORDFarm").append('<option value="">Select</option>');
                    for (var i in data) {
                        var DefFarm = data[i];
                        $('#lstSPORDFarm').append('<option value="' + DefFarm.Farm + '">[' + DefFarm.Farm + '] ' + DefFarm.Name + '</option>');
                    }
                    $('#lstSPORDFarm').val($("#hfSPORDFarm").val());
                }
            });
        }
        else {
            $('#lstSPORDFarm').val($("#hfSPORDFarm").val());
        }
    }

    $("[id^=btnReduceQty_]").die("click").live("click", function () {
        var Id = $(this)[0].id.replace("btnReduceQty_", "");
        var InvoiceQty = $("#txtInvQty_" + Id).val();
        if (InvoiceQty == "")
            InvoiceQty = $("#txtInvQty_" + Id).attr("placeholder");

        if (parseInt(InvoiceQty) > 0) {
            $("#txtInvQty_" + Id).val(parseInt(InvoiceQty) - 1);
            IsQtyReduce = true;
        }
    });

    $('#btnSPORDAllCustomer').die("click").live("click", function () {

        $("#DivSPORDAllCustomerDetail").dialog("open");
        IsSPORDAllCustGridReload = true;
    });

    $("#DivSPORDAllCustomerDetail").dialog({
        autoOpen: false,
        resizable: false,
        title: "All Customers S/O Details",
        width: 950,
        height: 655,
        modal: true,
        open: function () {
            if (IsSPORDAllCustGridReload) {
                var IsStanding = $('#chkStanding').is(':checked');
                var IsPreBooks = $('#chkPrebooks').is(':checked');
                var Shipdate = $('#txtSPORDShipDate').val();
                var AWB = $('#txtSPORDStandingAWB').val();
                var Warehouse = $('#lstSPORDWarehouse').val();
                var Farm = $('#lstSPORDFarm').val();
                var InvenToIgnore = $('#txtInvenToIgnore').val();
                $("#fgrdSPORDAllCustomerDetail").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'ShipDate', value: Shipdate }, { name: 'IsStanding', value: IsStanding }, { name: 'IsPreBooks', value: IsPreBooks }, { name: 'AWB', value: AWB }, { name: 'Warehouse', value: Warehouse }, { name: 'Farm', value: Farm }, { name: 'InvenToIgnore', value: InvenToIgnore }], query: "", newp: 1 }).flexReload();
                callback(true);
            }
            else {
                LoadSPORDAllCustomerList(function (callback) {
                });
            }
        },
        close: function () {
            //var IsStanding = $('#chkStanding').is(':checked');
            //var IsPreBooks = $('#chkPrebooks').is(':checked');
            //var Shipdate = $('#txtSPORDShipDate').val();
            //var AWB = $('#txtSPORDStandingAWB').val();
            //var Warehouse = $('#lstSPORDWarehouse').val();
            //$("#fgrdStandingOrderList").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'ShipDate', value: Shipdate }, { name: 'IsStanding', value: IsStanding }, { name: 'IsPreBooks', value: IsPreBooks }, { name: 'AWB', value: AWB }, { name: 'Warehouse', value: Warehouse }], query: "", newp: 1 }).flexReload();
            callback(true);
        }
    });

    function LoadSPORDAllCustomerList(callback) {
        var IsStanding = $('#chkStanding').is(':checked');
        var IsPreBooks = $('#chkPrebooks').is(':checked');
        var Shipdate = $('#txtSPORDShipDate').val();
        var AWB = $('#txtSPORDStandingAWB').val();
        var Warehouse = $('#lstSPORDWarehouse').val();
        var Farm = $('#lstSPORDFarm').val();
        var InvenToIgnore = $('#txtInvenToIgnore').val();

        $("#fgrdSPORDAllCustomerDetail").flexigrid({
            url: 'BloomService.asmx/GetStandingOrderAllCustomerDetails',
            dataType: 'xml',
            colModel: [
                { display: 'Cust#', name: 'Customer', width: 40, sortable: true, align: 'right' },
                { display: 'Customer Name', name: 'CustomerName', width: 200, sortable: true, align: 'left' },
                { display: 'Boxes', name: 'OrderedQty', width: 25, sortable: true, align: 'right' },
                { display: 'Uom', name: 'Uom', width: 30, sortable: true, align: 'left' },
                { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
                { display: 'Flower Name', name: 'flowerdescription', width: 200, sortable: true, align: 'left' },
                { display: 'Price', name: 'FOB', width: 50, sortable: true, align: 'right' },
                { display: 'Total $Amt', name: 'TotalAmt', width: 60, sortable: true, align: 'right' },
                { display: 'ShipDate', name: 'ShipDate', width: 55, sortable: true, align: 'left' },
                { display: 'Carrier', name: 'Carrier', width: 40, sortable: false, align: 'right' },
                { display: 'GPM', name: 'GPM', width: 40, sortable: false, align: 'right' },
                { display: 'Hold', name: 'Hold', width: 30, sortable: false, align: 'left' },
            ],
            searchitems: [
                { display: 'Customer Name', name: 'CustomerName' }
            ],
            showTableToggleBtn: true,
            sortname: "SrNo Asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            width: 940,
            height: 460,
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }, { name: 'ShipDate', value: Shipdate }, { name: 'IsStanding', value: IsStanding }, { name: 'IsPreBooks', value: IsPreBooks }, { name: 'AWB', value: AWB }, { name: 'Warehouse', value: Warehouse }, { name: 'Farm', value: Farm }, { name: 'InvenToIgnore', value: InvenToIgnore }
            ],
            onSuccess: function () {
                var sel = jQuery("#fgrdSPORDAllCustomerDetail tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivSPORDCustomerDetail #ExportCSV").hide();
                    $('#fgrdSPORDAllCustomerDetail #row0').addClass("TotalRows")
                }
                $("#txtInvQty_0").css("display", "none");
                $("#btnReduceQty_0").css("display", "none");
                callback(true);
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                callback(true);
            }
        });
    }
    /* Generate Invoice For Standing Order and Pre-Books Add By Prashant 24-Apr-2020*/
    $("#btnInventoryReport").die("click").live("click", function () {
        $('#txtInvenMarketToIgnore').val("LFDQ*");
        $("#DialogInvenAvailabilityReport").dialog("open");
    });
    $("#DialogInvenAvailabilityReport").dialog({
        autoOpen: false,
        resizable: false,
        title: "Inventory Availability",
        width: 460,
        height: 200,
        modal: true,
        buttons: {
            EXCEL: function () {
                var MarketToIgnore = $("#txtInvenMarketToIgnore").val();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PrintInventoryAvailabilityReportToExcel',
                    data: "{'MarketToIgnore':'" + MarketToIgnore + "'}",
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
                            //debugger;
                            path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                            window.open(path);
                        }

                    }
                });
            },
            CLOSE: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('EXCEL')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel red');
        },
    });

    /* Generate Invoice For Sales Order Allocation Add By Prashant 16-May-2020*/
    var Cargodate = new Date();
    $("#btnAllocation").die("click").live("click", function () {
        $("#txtAllocationHidden").datepicker('setDate', Cargodate);
        $("#chkRefreshGridAllocation").prop("checked", true);
        $("#DialogAllocationInvoice").dialog("open");
    });

    $("#DialogAllocationInvoice").dialog({
        autoOpen: false,
        resizable: false,
        title: "Sales Order Allocation",
        width: 500,
        height: 250,
        modal: true,
        buttons: {
            Continue: function () {
                var CargoDate = $('#txtAllocationCargoDate').val();
                var MarketToIgnore = $('#txtMarketToIgnore').val();
                var invarr = [];

                MarketToIgnore = (MarketToIgnore == undefined ? "" : MarketToIgnore);
                if (MarketToIgnore.length > 1) {
                    var vallen = MarketToIgnore.length;
                    for (var i = 0; i < vallen; i++) {
                        var curval = MarketToIgnore.substring(i, i + 1);
                        invarr.push(curval.toString().toUpperCase());
                    }
                }
                else {
                    invarr.push(MarketToIgnore.toString().toUpperCase());
                }
                invarr.join(',');
                if ($('#chkRefreshGridAllocation').is(':checked')) {
                        DeleteTempSalesOrderAllocation();
                    }
                $("#DivSalesOrderAllocationList").dialog("open");
                $("#fgrdSalesOrderAllocationList").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'CargoDate', value: CargoDate }, { name: 'MarketToIgnore', value: invarr }], query: "", newp: 1 }).flexReload();
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Continue')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel red');
        },
    });

    $("#DivSalesOrderAllocationList").dialog({
        autoOpen: false,
        resizable: false,
        title: "Future Orders / Inventory Allocation",
        width: 745,
        height: 650,
        modal: true,
        buttons: {
            Generate: function () {
                var Warehouse = "AIR";
                var InvenToIgnore = $("#txtMarketToIgnore").val();

                var totalShort = 0;

                $('#fgrdSalesOrderAllocationList tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        rowId = $(this).attr("id").replace("row", "");

                        var shortValue = $("#fgrdSalesOrderAllocationList #row" + rowId + "").find("td div").eq(7)[0].innerText;
                        if (!shortValue || isNaN(shortValue) || !isNumber(shortValue)) {
                            shortValue = 0;
                        } else if (shortValue.trim() == "" || shortValue.trim() == " ") {
                            shortValue = 0;
                        }

                        totalShort = totalShort + parseInt(shortValue)
                    }
                });
                console.log("totalShort: " + totalShort)
                if (totalShort != 0) {
                    $.MessageBox("You cannot generate until you remove all shorts.");
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GenerateAllocationForFutureOrdersFromTemp',
                    async: false,
                    data: "{'Warehouse':'" + Warehouse + "','InvenToIgnore': '" + InvenToIgnore+ "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        //hide loader
                        $("#imgUserLoader").hide();
                        /////
                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx";
                        }
                        else if (output.d && output.d != null && output.d.indexOf("error") >= 0) {
                            $("#msgbox-select").dialog("close");
                            $.MessageBox(output.d.substring(5, output.d.length));
                        }
                        else if (output.d == "No Data") {
                            $.MessageBox("No data for the selected date!");
                        }
                        else {
                            $.MessageBox("Total boxes allocated " + output.d );                            
                            $("#DialogSPORDInvoice").dialog("close");
                            $("#DivStandingOrderList").dialog("close");
                            $("#DivSPORDCustomerDetail").dialog("close"); 
                            //callback()
                        }
                    }
                });
                //alert("Code Pending");
            },
            Close: function () {
                $(this).dialog("close");
            },
            Pricing: function () {
                IsSalesOrderGridReload = false;
                debugger;
                var totalShort = 0;

                $('#fgrdSalesOrderAllocationList tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        rowId = $(this).attr("id").replace("row", "");

                        var shortValue = $("#fgrdSalesOrderAllocationList #row" + rowId + "").find("td div").eq(7)[0].innerText;
                        if (!shortValue || isNaN(shortValue) || !isNumber(shortValue)) {
                            shortValue = 0;
                        } else if (shortValue.trim() == "" || shortValue.trim() == " ") {
                            shortValue = 0;
                        }

                        totalShort = totalShort + parseInt(shortValue)
                    }
                });
                console.log("totalShort: " + totalShort)
                if (totalShort != 0) {
                    $.MessageBox("You cannot go to pricing until you reduce all shorts.");
                    return;
                }

                $("#DivSalesOrderCustomerDetailByCargoDt").dialog("open");
            }
        },
        open: function () {
            LoadSalesOrderList(function (callback) {
            });
            $(".ui-dialog-buttonpane button:contains('Generate')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel red');
            $(".ui-dialog-buttonpane button:contains('Pricing')").addClass('dialogbuttonstyle icon-save').css("margin-right","420px").css("float","left");
        }

    });
    $("#DivSalesOrderCustomerDetailByCargoDt").dialog({
        autoOpen: false,
        resizable: false,
        title: "Allocation All Customer Details",
        width: 1150,
        height: 725,
        modal: true,
         buttons: {
            Close: function () {
                $(this).dialog("close");
            },
            //Email: function () {
                 
            // },
            //Generate: function () {
            //    $.ajax({
            //        type: "POST",
            //        url: 'BloomService.asmx/CreateInvoicesForAllocation',
            //        async: false,
            //        data: "",
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        success: function (output) {
            //            if (output.d == "LogOut") {
            //                window.location.href = "Login.aspx";
            //            }
            //            else if (output.d.indexOf("error") >= 0) {
            //                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
            //            }
            //            else {
            //                $.MessageBox("Invoices Generated.");
            //            }
            //        },
            //        error: function (response) {
            //            $.MessageBox(response.responseText);
            //        }
            //    });
            // }
        },
        open: function () {
            debugger;
            if (IsSalesOrderGridReload) {
                var CargoDate = $('#txtAllocationCargoDate').val();
                var MarketToIgnore = $('#txtMarketToIgnore').val();
                var invarr = [];
                MarketToIgnore = (MarketToIgnore == undefined ? "" : MarketToIgnore);
                if (MarketToIgnore.length > 1) {
                    var vallen = MarketToIgnore.length;
                    for (var i = 0; i < vallen; i++) {
                        var curval = MarketToIgnore.substring(i, i + 1);
                        invarr.push(curval.toString().toUpperCase());
                    }
                }
                else {
                    invarr.push(MarketToIgnore.toString().toUpperCase());
                }
                invarr.join(',');

                //removed by Jose on 6/23/2021
                var FlowerCode = "";
                //we must reset UOM here the same way of flowerCode because we need to open allocation for all customers and not specific UOM
                //var UOM = $('#divUOM').html();
                var UOM = "";

                //$("#txtSOFlower").val($('#divFlowerName').html());
                //$("#txtSOUOM").val(UOM);
                ////2020/09/20
                var RowUnit = $('#divRowUnit').html();
                var RowComments = $('#divRowComments').html();
                if (RowComments) {
                    RowComments = RowComments.replace("&nbsp;", " ");
                }

                $("#fgrdSalesOrderCustomerDetailByCargoDt").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'CargoDate', value: CargoDate }, { name: 'MarketToIgnore', value: invarr }, { name: 'FlowerCode', value: FlowerCode }, { name: 'UOM', value: UOM }, { name: 'Unit', value: RowUnit }, { name: 'Comments', value: RowComments }], query: "", newp: 1 }).flexReload();
                //check if the function exist before call
                if (typeof callback !== 'undefined' && typeof callback === 'function') { 
                    callback(true);
                }
            }
            else {
                LoadSalesOrderInvoiceListByCargoDt(function (callback) {
                });
            }
             $(".ui-dialog-buttonpane button:contains('Generate')").addClass('dialogbuttonstyle icon-save');
             $(".ui-dialog-buttonpane button:contains('Email')").addClass('dialogbuttonstyle icon-save');
             $(".ui-dialog-buttonpane button:contains('Clear')").addClass('dialogbuttonstyle icon-cancel red');
             $("#fgrdSalesOrderCustomerDetailByCargoDt").parent(".bDiv").css("height", "540px");
        },
        close: function () {
            debugger;
            if (IsQtyReduce) {
                SalesOrderQtyReduce();
                var CargoDate = $('#txtAllocationCargoDate').val();
                var MarketToIgnore = $('#txtMarketToIgnore').val();
                var invarr = [];
                MarketToIgnore = (MarketToIgnore == undefined ? "" : MarketToIgnore);
                if (MarketToIgnore.length > 1) {
                    var vallen = MarketToIgnore.length;
                    for (var i = 0; i < vallen; i++) {
                        var curval = MarketToIgnore.substring(i, i + 1);
                        invarr.push(curval.toString().toUpperCase());
                    }
                }
                else {
                    invarr.push(MarketToIgnore.toString().toUpperCase());
                }
                invarr.join(',');
                $("#fgrdSalesOrderAllocationList").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'CargoDate', value: CargoDate }, { name: 'MarketToIgnore', value: invarr }], query: "", newp: 1 }).flexReload();
                if (typeof callback !== 'undefined' && typeof callback === 'function') {
                    callback(true);
                }
            }
        }
    });
     function LoadSalesOrderInvoiceListByCargoDt(callback) {
        var CargoDate = $('#txtAllocationCargoDate').val();
        var MarketToIgnore = $('#txtMarketToIgnore').val();
        //we must reset flowerCode and UOM here because we need to open allocation for all customers and not specific flowerCode and UOM
        //var FlowerCode = $('#divFlowerCode').html();
        //var UOM = $('#divUOM').html();
        var FlowerCode = "";
        var UOM = "";
        var RowUnit = -1;
         if (IsSalesOrderGridReload) { 
             RowUnit = $('#divRowUnit').html();
         }
        var RowComments = $('#divRowComments').html();
        if (RowComments) {
            RowComments = RowComments.replace("&nbsp;", " ");
        }
 
        $("#txtSOFlower").val($('#divFlowerName').html());
        $("#txtSOUOM").val(UOM);

        var invarr = [];
        MarketToIgnore = (MarketToIgnore == undefined ? "" : MarketToIgnore);
        if (MarketToIgnore.length > 1) {
            var vallen = MarketToIgnore.length;
            for (var i = 0; i < vallen; i++) {
                var curval = MarketToIgnore.substring(i, i + 1);
                invarr.push(curval.toString().toUpperCase());
            }
            callback(true);
        }
        else {
            invarr.push(MarketToIgnore.toString().toUpperCase());
            callback(true);
        }
        invarr.join(',');

        $("#fgrdSalesOrderCustomerDetailByCargoDt").flexigrid({
            url: 'BloomService.asmx/GetSalesOrderAllocationInvoiceDetailsByCargoDt',
            dataType: 'xml',
            colModel: [
                { display: 'Invoice#', name: 'Invoice', width: 45, sortable: true, align: 'right', process: procMe },
                { display: 'ProductName', name: 'FlowerName', width: 220, sortable: true, align: 'left' },
                { display: 'Cust#', name: 'Customer', width: 30, sortable: true, align: 'left' },
                { display: 'Name', name: 'CustomerName', width: 220, sortable: true, align: 'left', process: custMe },
                { display: 'Boxes', name: 'OrderedQty', width: 50, sortable: false, align: 'right' },
                { display: 'Uom', name: 'Uom', width: 30, sortable: true, align: 'left'},
                { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
                { display: 'Price', name: 'Price', width: 50, sortable: true, align: 'right' },
                { display: 'ShipDate', name: 'ShipDate', width: 60, sortable: true, align: 'left' },
                { display: '', name: 'Reduce', width: 30, sortable: false, align: 'left', hide: true },
                { display: 'Short', name: 'ShortQty', width: 40, sortable: true, align: 'right', hide: true},
                { display: 'GPM', name: 'GPM', width: 30, sortable: false, align: 'right' },
                { display: 'Hold', name: 'Hold', width: 30, sortable: false, align: 'left', hide: true },
                { display: 'LANDED', name: 'LANDED', width: 40, sortable: false, align: 'right' },
                { display: 'nPer0', name: 'nPer0', width: 40, sortable: true, align: 'right', hide: true },
                { display: 'IsPriceCalculated', name: 'IsPriceCalculated', width: 40, sortable: true, align: 'right', hide: true },
                { display: 'Email', name: 'SalesmanEmail', width: 130, sortable: true, align: 'left'},
            ],
            searchitems: [
                { display: 'Name', name: 'CustomerName' },
                { display: 'Cust#', name: 'Customer#' }
            ],
            showTableToggleBtn: true,
            sortname: "SrNo Asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            width: 1124,
            height: 525,
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: false,
            showTableToggleBtn: false,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }, { name: 'CargoDate', value: CargoDate }, { name: 'MarketToIgnore', value: invarr }, { name: 'FlowerCode', value: FlowerCode }, { name: 'UOM', value: UOM }, { name: 'Unit', value: RowUnit }, { name: 'Comments', value: RowComments }
            ],
            onSuccess: function () {
                debugger;
                var sel = jQuery("#fgrdSPORDCustomerDetailByCargoDt tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivSalesOrderCustomerDetailByCargoDt #ExportCSV").hide();
                    $('#fgrdSalesOrderCustomerDetailByCargoDt #row0').addClass("TotalRows")
                }
                var Counter = 1;
                var rowCount = $('#fgrdSalesOrderCustomerDetailByCargoDt tr').length;

                $('#fgrdSalesOrderCustomerDetailByCargoDt tr').each(function () {
                    $(this).find("td").eq(0).css('text-decoration', 'underline');
                    $(this).find("td").eq(3).css('text-decoration', 'underline');
                    $(this).find("td").eq(10).css('width', '50px');
                    ////change shipDate margin
                    //$(this).find("td").eq(8).css('padding-top', '0px');
                    $(this).find("td").eq(8).find("div").eq(0).css('margin-top', '-5px');
                    //if (Counter != rowCount) {
                    //     $(this).find("td").eq(8).html("<div style='width:60px;text-align:left'>" + $("#divShipDt").text() + "</div>")
                    //}                 
                    var trid = $(this).closest('tr').attr('id');                     
                    var balance = 0;
                    var IsInventoryEmpty = 0;
                    //if (isNaN(parseFloat($("#divShort").text()))) {

                    //}
                    //else {
                    //    if (parseFloat($("#divShort").text()) != 0) {
                    //        if (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) > parseFloat($("#divShort").text())) {
                    //            $(this).find("td").eq(10).html("<div style='font-weight:bold;color:red;font-size: 13px;margin-left:15px;'>" + (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) - parseFloat($("#divShort").text())) * -1 + "</div>")
                    //            $("#divShort").html(0)
                    //        }
                    //        else if (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) = parseFloat($("#divShort").text())) {
                    //            $(this).find("td").eq(10).html("<div'></div>")
                    //            $("#divShort").html(0)
                    //        }
                    //        else if (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) < parseFloat($("#divShort").text())) {
                    //            $(this).find("td").eq(10).html("<div style='font-weight:bold;color:red;font-size: 13px;float:right;'>" + parseFloat($("#divShort").text()) - parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) + "</div>")
                    //            $("#divShort").html(parseFloat($("#divShort").text()) - parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')))
                    //        }
                    //    }
                    //    else {
                    //        var bval=isNaN((parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')))) ? "" : (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder'))) *-1
                    //        $(this).find("td").eq(10).html("<div style='font-weight:bold;color:red;font-size: 13px;margin-left:15px;'>" + bval + "</div>")
                    //    }
                    //}
                    //color price cell for calculated values
                    //$("#fgrdSalesOrderCustomerDetailByCargoDt tr#row" + SelectedId + " td:eq(15)")[0].innerText;
                    if ($(this).find("td").eq(15)[0].innerText != "0")
                        $(this).find("[id^=txtSOInvPrice_").css("background-color", "#fdaaaa");
                    

                    Counter++;  
                })
               
           
                //$("#txtSOInvQty_0").css("display", "none");
                $("#btnSOReduceQty_0").css("display", "none");
                $("#txtSOInvPrice_0").css("display", "none");

                if (typeof callback !== 'undefined' && typeof callback === 'function') {
                    callback(true);
                }
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                callback(true);
            }
        });

         //load the grid by reload function instead of autoLoad feature because autoLoad doesn't work
         $("#fgrdSalesOrderCustomerDetailByCargoDt").flexReload({ url: '/url/for/refresh' });

         //first load, make the focus on first row
         $($('[id^=txtSOInvPrice_')[0]).focus();         

    }

    function notZero(n) {
        n = +n;  // Coerce to number.
        if (!n) {  // Matches +0, -0, NaN
            return false;
        }
        return true;
    }

    $("[id^=txtSOInvPrice_").focusout().live('focusout', function (e) {
        e.preventDefault();
        var sourceCtl = $(this);
        //EditCtrlofPrices(sourceCtl, 'PriceA');
        var SelectedId = '';
        SelectedId = sourceCtl.attr('id').split('_')[1];
        ////
        var price = sourceCtl.val() == "" ? sourceCtl.attr('placeholder') : sourceCtl.val();
        //CalculatePriceBandPriceCByPriceA(parseFloat(price).toFixed(2), ID, true, false)
        var GPM = 0, LandedCost = 0, nPer0 = 0;
        LandedCost = $("#fgrdSalesOrderCustomerDetailByCargoDt tr#row" + SelectedId + " td:eq(13)")[0].innerText;
        //nPer0 = $("#fgrdSalesOrderCustomerDetailByCargoDt tr#row" + SelectedId + " td:eq(14)")[0].innerText;
        var isvaliddivident = false;
        isvaliddivident = notZero(parseFloat(price).toFixed(3));
        if (isvaliddivident) {
            GPM = (((parseFloat(price).toFixed(3) - parseFloat(LandedCost).toFixed(3)) / parseFloat(price).toFixed(3)) * 100)
        }
        else { GPM = 0; }
        if (isNaN(GPM)) {
            GPM = 0;
        }
        //set value to GPM
        //setValuestoTextboxonGrid(SelectedId, parseInt(19), GPM, 1, 'a');
        $("#fgrdSalesOrderCustomerDetailByCargoDt tr#row" + SelectedId + "  td:eq(11)").find("div").text(parseFloat(GPM).toFixed(1));

        price = parseFloat(sourceCtl.val() == "" || sourceCtl.val() == undefined ? sourceCtl.attr('placeholder') : sourceCtl.val()).toFixed(2);
        if (isNaN(price)) {
            price = '';
        }
        sourceCtl.val(price);
    });

    $("[id^=txtSOInvPrice_").keydown().live('keydown', function (e) {
        debugger;

        var charCode = (event.which) ? event.which : event.keyCode;
        //if (charCode == 40 || charCode == 13 || charCode == 38 || charCode == 9) {
        if (charCode == 13 || charCode == 9) {
            e.preventDefault();

            var sourceCtl = $(this);
            var SelectedId = '';
            SelectedId = sourceCtl.attr('id').split('_')[1];
            // set focus to next control
            if ($(document.activeElement).closest('tr').next().find('[id^=txtSOInvPrice_')[0].id == "txtSOInvPrice_0") { //($(document.activeElement).closest('tr').next().find('[id^=txtSOInvPrice_').length == 0) {
                //back to first row
                $($('[id^=txtSOInvPrice_')[0]).focus();
            } else {
                //go to next control
                $(document.activeElement).closest('tr').next().find('[id^=txtSOInvPrice_').focus();
            }
        }
    });

    $("[id^=txtSOInvPrice_").focus().live('focus', function (e) {
        e.preventDefault();
        $(this).select();
    });

    $("[id^=txtSOInvPrice_").change().live('change', function (e) {
        e.preventDefault();
        var sourceCtl = $(this);
        var SelectedId = '';
        SelectedId = sourceCtl.attr('id').split('_')[1];
        var price = (sourceCtl.val() == "" || sourceCtl.val() == undefined ? sourceCtl.attr('placeholder') : sourceCtl.val());
        if (isNaN(price) || price === "" || price === " ") { price = 0; }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UpdateTempSalesOrderAllocationInvoiceDetailsField',
            async: true,
            data: "{'FieldName':'PRICE','FieldValue':'" + price + "','FieldKey':'" + SelectedId + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else {
                    console.log('Price changed.');
                }
            },
            error: function (response) {
                $.MessageBox(response.responseText);
            }
        });
    });

    function getOrderedQtyTotal() {
        debugger;
        var gridIdSelection = "";
        if (IsSalesOrderGridReload) {
            gridIdSelection = "#fgrdSalesOrderCustomerDetail ";
        }

        var orderedTotal = 0;
        $(gridIdSelection + '[id^=txtSOInvQty_').each(function () {
            var sourceCtl = $(this);
            if (sourceCtl[0].id != "txtSOInvQty_0") { 
                var tmp = parseInt(sourceCtl.val() == "" ? sourceCtl.attr('placeholder') : sourceCtl.val());
                if (isNaN(tmp)) { tmp = 0; }
                    orderedTotal = orderedTotal + tmp;
            }
        });
        orderedTotal = parseInt(orderedTotal);
        if (isNaN(orderedTotal)) { orderedTotal = 0; }
        return orderedTotal;
    }

    function LoadSalesOrderList(callback) {
        var CargoDate = $('#txtAllocationCargoDate').val();
        var MarketToIgnore = $('#txtMarketToIgnore').val();

        var invarr = [];
        MarketToIgnore = (MarketToIgnore == undefined ? "" : MarketToIgnore);
        if (MarketToIgnore.length > 1) {
            var vallen = MarketToIgnore.length;
            for (var i = 0; i < vallen; i++) {
                var curval = MarketToIgnore.substring(i, i + 1);
                invarr.push(curval.toString().toUpperCase());
            }
        }
        else {
            invarr.push(MarketToIgnore.toString().toUpperCase());
        }
        invarr.join(',');

        $("#fgrdSalesOrderAllocationList").flexigrid({
            url: 'BloomService.asmx/GetSalesOrderAllocationList',
            dataType: 'xml',
            colModel: [
                { display: 'Flower#', name: 'Flower', width: 50, sortable: true, align: 'left', hide: true },
                { display: 'Desc', name: 'FlowerName', width: 280, sortable: true, align: 'left', process: SalesOrderRowClick },
                { display: 'Boxes', name: 'OrderedQty', width: 35, sortable: true, align: 'right', process: SalesOrderRowClick },
                { display: 'Uom', name: 'Uom', width: 40, sortable: true, align: 'left', hide: false },
                { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
                { display: 'Price', name: 'Fob', width: 70, sortable: true, align: 'right', hide: true },
                { display: 'Short', name: 'DiffQty', width: 35, sortable: true, align: 'right' },
                { display: 'ShipDay', name: 'ShipDay', width: 50, sortable: true, align: 'left', hide: false },
                { display: 'ShipDate', name: 'ShipDate', width: 55, sortable: true, align: 'left', hide: false },
            ],
            searchitems: [
                { display: 'Desc', name: 'FlowerName' }
            ],
            showTableToggleBtn: true,
            sortname: "SrNo Asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            width: 720,
            height: 460,
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }, { name: 'CargoDate', value: CargoDate }, { name: 'MarketToIgnore', value: invarr }
            ],
            onSuccess: function () {

                var sel = jQuery("#fgrdSalesOrderAllocationList tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivSalesOrderAllocationList #ExportCSV").show();
                    $('#fgrdSalesOrderAllocationList #row0').addClass("TotalRows")
                }
                callback(true);
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                callback(true);
            }
        });
    }

    function LoadSalesOrderInvoiceList(callback) {
        var CargoDate = $('#txtAllocationCargoDate').val();
        var MarketToIgnore = $('#txtMarketToIgnore').val();
        var FlowerCode = $('#divFlowerCode').html();
        var UOM = $('#divUOM').html();
        var RowUnit = $('#divRowUnit').html();
        var RowComments = $('#divRowComments').html();
        if (RowComments) {
            RowComments = RowComments.replace("&nbsp;", " ");
        }
 
        $("#txtSOFlower").val($('#divFlowerName').html());
        $("#txtSOUOM").val(UOM);

        var invarr = [];
        MarketToIgnore = (MarketToIgnore == undefined ? "" : MarketToIgnore);
        if (MarketToIgnore.length > 1) {
            var vallen = MarketToIgnore.length;
            for (var i = 0; i < vallen; i++) {
                var curval = MarketToIgnore.substring(i, i + 1);
                invarr.push(curval.toString().toUpperCase());
            }
            callback(true);
        }
        else {
            invarr.push(MarketToIgnore.toString().toUpperCase());
            callback(true);
        }
        invarr.join(',');

        $("#fgrdSalesOrderCustomerDetail").flexigrid({
            url: 'BloomService.asmx/GetSalesOrderAllocationInvoiceDetails',
            dataType: 'xml',
            colModel: [
                { display: 'Invoice#', name: 'Invoice', width: 45, sortable: true, align: 'right', process: procMe },
                { display: 'ProductName', name: 'FlowerName', width: 260, sortable: true, align: 'left' },
                { display: 'Cust#', name: 'Customer', width: 30, sortable: true, align: 'left' },
                { display: 'Name', name: 'CustomerName', width: 190, sortable: true, align: 'left', process: custMe },
                { display: 'Boxes', name: 'OrderedQty', width: 50, sortable: false, align: 'right' },
                { display: 'Uom', name: 'Uom', width: 30, sortable: true, align: 'left'},
                { display: 'Units', name: 'UnitsPerBox', width: 30, sortable: true, align: 'right' },
                { display: 'Price', name: 'Price', width: 50, sortable: true, align: 'right' },
                { display: 'ShipDate', name: 'ShipDate', width: 60, sortable: true, align: 'left' },
                { display: '', name: 'Reduce', width: 30, sortable: false, align: 'left' },
                { display: 'Short', name: 'DiffQty', width: 40, sortable: true, align: 'right', hide: true},
                { display: 'GPM', name: 'GPM', width: 30, sortable: false, align: 'left' },
                { display: 'Hold', name: 'Hold', width: 30, sortable: false, align: 'left', hide: true },
            ],
            searchitems: [
                { display: 'Name', name: 'CustomerName' },
                { display: 'Cust#', name: 'Customer#' }
            ],
            showTableToggleBtn: true,
            sortname: "SrNo Asc",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            width: 940,
            height: 540,
            rp: 30000,
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' }, { name: 'CargoDate', value: CargoDate }, { name: 'MarketToIgnore', value: invarr }, { name: 'FlowerCode', value: FlowerCode }, { name: 'UOM', value: UOM }, { name: 'Unit', value: RowUnit }, { name: 'Comments', value: RowComments }
            ],
            onSuccess: function () {
                debugger;

                var sel = jQuery("#fgrdSPORDCustomerDetail tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivSalesOrderCustomerDetail #ExportCSV").hide();
                    $('#fgrdSalesOrderCustomerDetail #row0').addClass("TotalRows")
                }
                var Counter = 1;
                var rowCount = $('#fgrdSalesOrderCustomerDetail tr').length;
                $('#fgrdSalesOrderCustomerDetail tr').each(function () {
                    $(this).find("td").eq(0).css('text-decoration', 'underline');
                    $(this).find("td").eq(3).css('text-decoration', 'underline');
                    $(this).find("td").eq(10).css('width', '50px');
                    if (Counter != rowCount) {
                         $(this).find("td").eq(8).html("<div style='width:60px;text-align:left'>" + $("#divShipDt").text() + "</div>")
                    }                 
                    //var trid = $(this).closest('tr').attr('id');                    
                    //var balance = 0;
                    //var IsInventoryEmpty = 0;
                    //if (isNaN(parseFloat($("#divShort").text()))) {

                    //}
                    //else {
                    //    if (parseFloat($("#divShort").text()) != 0) {
                    //        if (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) > parseFloat($("#divShort").text())) {
                    //            $(this).find("td").eq(10).html("<div style='font-weight:bold;color:red;font-size: 13px;margin-left:15px;'>" + (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) - parseFloat($("#divShort").text())) * -1 + "</div>")
                    //            $("#divShort").html(0)
                    //        }
                    //        else if (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) == parseFloat($("#divShort").text())) {
                    //            $(this).find("td").eq(10).html("<div'></div>")
                    //            $("#divShort").html(0)
                    //        }
                    //        else if (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) < parseFloat($("#divShort").text())) {
                    //            $(this).find("td").eq(10).html("<div style='font-weight:bold;color:red;font-size: 13px;float:right;'>" + parseFloat($("#divShort").text()) - parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')) + "</div>")
                    //            $("#divShort").html(parseFloat($("#divShort").text()) - parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')))
                    //        }
                    //    }
                    //    else {
                    //        var bval=isNaN((parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder')))) ? "" : (parseFloat($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder'))) *-1
                    //        $(this).find("td").eq(10).html("<div style='font-weight:bold;color:red;font-size: 13px;margin-left:15px;'>" + bval + "</div>")
                    //    }
                    //}
                    Counter++;  
                })

                $("#fgrdSalesOrderCustomerDetail #row0 td").eq(10).children().css("display", "none")
                //$("#txtSOInvQty_0").css("visibility", "hidden");
                $("#btnSOReduceQty_0").css("visibility", "hidden");

                if (typeof callback !== 'undefined' && typeof callback === 'function') {
                    callback(true);
                }
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                callback(true);
            }
        });
    }
     function procMe(celDiv,id)
        {
            $(celDiv).click
                (function () {
                    debugger;
                    var a = this.innerHTML
                    var InvoiceId = a.substring(a.indexOf(">") + 1, a.lastIndexOf("<"));
                    $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetOrderDateByrderNo',
                    data: '{"OrderNo":"' + InvoiceId.toString() + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        //debugger;
                        var data = output.d.VOID;
                        IsVoidedInvoice = data.toString().toLowerCase() == "true" ? "VOIDED" : "";

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/CheckInvoice',
                            data: "{'Searchtext': '" + InvoiceId + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output) {
                                //debugger;
                                var customer = output.d;
                                if (customer.trim().toLowerCase() != "error" && customer.trim().toLowerCase() != "") {
                                    editorder(InvoiceId.toString(), customer)
                                }
                                else {
                                    $.ajax({
                                        type: "POST",
                                        url: 'BloomService.asmx/CheckVETInvoice',
                                        data: "{'Searchtext': '" + InvoiceId + "'}",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (result) {

                                            var out = result.d;
                                            if (result.d.length >= 1) {
                                                LoadVETCustomerDetailsByCustNo(out[0].Customer, out[0].RecDate, "DivVETInvoiceGridDialog");
                                                $("#CurrentCustomerNo").html(out[0].Customer);
                                                $("#DivVETInvoiceNo").html(out[0].Invoice);
                                                //loadVETInvoiceGrid(splitstr[0]);
                                                $("#fgrdVETINVCustomer").empty();
                                                $("#fgrdVETINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: out[0].Invoice }], query: "", newp: 1 }).flexReload();

                                                $("#DivVETInvoiceGridDialog").dialog('option', 'title', '<div> VET Details :: ' + out[0].Invoice + '</div><div>' + IsVoidedInvoice + '</div>');
                                                //$("#DivVETInvoiceGridDialog").data('Invoice', out[0].Invoice).dialog("open");
                                                $("#DivVETInvoiceGridDialog").data("inData", { Invoice: out[0].Invoice, Customer: out[0].Customer }).dialog("open");
                                            }
                                            else {
                                                $("#msgbox-warn").dialog("open");
                                                $("#msghtml").html("Invoice not found");
                                            }
                                        }
                                    });
                                }

                            },
                            onError: function (xhr, status, errorThrown) {
                                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                }
                            }
                        });
                    },
                    onError: function () {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                    }
                });
                });
    }
     function custMe(celDiv,id)
        {
            $(celDiv).click
                (function () {
                    var trid = $(this).closest('tr').attr('id');    
                    $("#CustCode").val($(this).closest('tr').find("td:nth-child(3)").text());
                    $("#hdnOrder").val($(this).closest('tr').find("td:nth-child(1)").text());
                    $("#hdnORDER2SQLID").val(trid.substring(3, trid.len).toString());
                    $("#ProductNameDesc").html($(this).closest('tr').find("td:nth-child(2)").text());
                    $("#InventoryRemainingQty").html($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder'));   
                    $("#hdnInventoryRemainingQty").val($("#txtSOInvQty_".concat(trid.substring(3, trid.len).toString())).attr('placeholder'));   
                    $("#InventoryListForOrderEntryDialog").dialog("open");
                });
        }
    function SalesOrderRowClick(celDiv, id) {
        $(celDiv).click(function () {
            var FlowerCode = $("#fgrdSalesOrderAllocationList #row" + id + "").find("td div").eq(0)[0].innerText;
            var FlowerName = $("#fgrdSalesOrderAllocationList #row" + id + "").find("td div").eq(1)[0].innerText;
            var RowUnit     = $("#fgrdSalesOrderAllocationList #row" + id + "").find("td div").eq(5)[0].innerText;
            var RowComments = $("#fgrdSalesOrderAllocationList #row" + id + "").find("td div").eq(9)[0].innerText;
            var Short = parseFloat($("#fgrdSalesOrderAllocationList #row" + id + "").find("td div").eq(3)[0].innerText) + parseFloat($("#fgrdSalesOrderAllocationList #row" + id + "").find("td div").eq(7)[0].innerText)
            var UOM = $("#fgrdSalesOrderAllocationList #row" + id + "").find("td div").eq(4)[0].innerText;
            var ShipDt = $("#fgrdSalesOrderAllocationList #row" + id + "").find("td div").eq(9)[0].innerText;
            $("#fgrdSalesOrderAllocationList [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdSalesOrderAllocationList #row" + id).addClass("trSelectedHeader");
            $("#fgrdSalesOrderAllocationList #row" + id).removeClass("trSelected");
            $("#divFlowerCode").html(FlowerCode);
            $("#divUOM").html(UOM);
            $("#divFlowerName").html(FlowerName);
            //2020/09/20
            $("#divRowUnit").html(RowUnit);
            $("#divRowComments").html(RowComments);
            $("#divShort").html(Short);
            $("#divShipDt").html(ShipDt);

            var totalShort = parseFloat($("#fgrdSalesOrderAllocationList #row" + id + "").find("td div").eq(7)[0].innerText);
            if (!totalShort || isNaN(totalShort)) {
                totalShort = 0;
            }
            $("#txtTotalShort").html(totalShort);

            $("#DivSalesOrderCustomerDetail").dialog("open");
            IsSalesOrderGridReload = true;
        });
    }
     $("#InventoryListForOrderEntryDialog").dialog({
        modal: true,
        autoOpen: false,
        resizable: false,
        title: "Sales Inventory List",
        width: 1280,
        height: $(window).height() - 70,
        focus: function () {
        },
        open: function () {            
            //HideOrShowButtonsAsperUserPersmission();
            InventoryListForOrderEntryDialogOpen();
            GetActiveWarehouse(function (callback) { });
            $("#fgrdOrderDetails").parent(".bDiv").css("height", "474px");
        },
        close: function () {

            var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
            if (OrderNo == "0" || OrderNo == "") {
                $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
            }
            else {
                $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
            }
        }
    });  
    function CheckChange(RecNo) {
        var checkBox = document.getElementById("chkOrderInvQty_" + RecNo);
        if (checkBox.checked == true) {
            if (parseFloat($("#InventoryRemainingQty").text()) == 0) {
                $("#InventoryRemainingQty").text(0)
                $("#txtOrderInvQty_" + RecNo).val(0)
            }
            else {
                if (parseFloat($("#InventoryRemainingQty").text()) > parseFloat($("#aOrderInventoryQty_" + RecNo).text())) {
                    $("#txtOrderInvQty_" + RecNo).val($("#aOrderInventoryQty_" + RecNo).text())
                    $("#InventoryRemainingQty").text(parseFloat($("#InventoryRemainingQty").text()) - parseFloat($("#aOrderInventoryQty_" + RecNo).text()))
                }
                else {
                    $("#txtOrderInvQty_" + RecNo).val($("#InventoryRemainingQty").text())
                    $("#InventoryRemainingQty").text(0)
                }
            }
            
        }
        else {
                  $("#InventoryRemainingQty").text(parseFloat($("#InventoryRemainingQty").text()) + parseFloat($("#txtOrderInvQty_" + RecNo).val()))
                  $("#txtOrderInvQty_" + RecNo).val(0)
            }
    }
    function ChangeQtyVal(RecNo) {
        var _total = 0;
        $('input[name="txtOrderInvQty"]').each(function() {
            _total = parseFloat(_total) + ($(this).val() == '' ? 0 : parseFloat($(this).val()))
        });
        $("#InventoryRemainingQty").text(parseFloat($("#hdnInventoryRemainingQty").val()) - parseFloat(_total))
    }
    $("#btnApply").click(function () {
        $('input[type=checkbox][name=chkOrderInvQty]').each(function () {
            if (this.checked) {
                    $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateQuantityToInventory',
                    data: '{"Order":"' + $("#hdnOrder").val() + '","ORDER2SQLID":"' + $("#hdnORDER2SQLID").val() + '","INVENSQLID":"' + $("#aOrderInventoryINVIDs_" + $(this).val()).html() + '","QTYTOALLOCATE":"' + $("#txtOrderInvQty_" + $(this).val()).val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                    }
                });
            }
                
        }); 
        
         $("#InventoryListForOrderEntryDialog").dialog("close");
     });
     function HideOrShowButtonsAsperUserPersmission() {

        var index = 0;

        //Can Access Market
        index = 41;
        ButtonHideShow("btnOrderInventoryMarket", index, "M", true);

        //Can Access Local
        index = 42;
        ButtonHideShow("btnOrderInventoryLocal", index, "L", true);

        //Can Access standing
        index = 43;
        ButtonHideShow("btnOrderInventoryStanding", index, "S", true);

        //Can Access Hold
        index = 44;
        ButtonHideShow("btnOrderInventoryHold", index, "H", true);

        //Can Access Arriving
        index = 45;
        ButtonHideShow("btnOrderInventoryArriving", index, "A", true);

        //Can Access Pre Booked
        index = 46;
        ButtonHideShow("btnOrderInventoryPrebooks", index, "P", true);
    }
     function ButtonHideShow(btnname, index, invtype, ishideshow) {
        var userpermision = $("#ctl00_DivForViewAllColumnsInInvnetory").html();
        var hasPermissionToAccess = "";
        hasPermissionToAccess = userpermision.charAt(index);
        var setshow = ((hasPermissionToAccess.toUpperCase() == "Y") || ($("#ctl00_LoggedInUserType_SalesPerson").html().toLowerCase() == "admin")) ? true : false;        
        if (setshow == true) {
            if (ishideshow)
                $('#' + btnname + '').show();
            else
                $('#' + btnname + '').click();
        }
        else {
            if (ishideshow)
                $('#' + btnname + '').hide();
        }
    }
    function InventoryListForOrderEntryDialogOpen() {
        debugger;
        var OrderSaveProcessCurrentDivID = $("#CustCode").val();

        //setting id for order
        if ($("#ctl00_DivOrderNo_OrderSave").html() != "0") {
            $("#ctl00_DivOrderNo_OrderSave").html($("#ctl00_DivOrderNo_OrderSave").html() == "" ? $("#" + OrderSaveProcessCurrentDivID + " #ctl00_DivOrderNo_OrderSave").html() : $("#ctl00_DivOrderNo_OrderSave").html());
        }
        else {
            if ($("#ctl00_DivOrderNo_OrderSave").html() == "0" && OrderSaveProcessCurrentDivID == "DivOrderNewCustDetailsPage") {
                $("#ctl00_DivOrderNo_OrderSave").html(0);
            }
            else {
                $("#ctl00_DivOrderNo_OrderSave").html($("#" + OrderSaveProcessCurrentDivID + " #ctl00_DivOrderNo_OrderSave").html());
            }
        }
        //$("#ctl00_DivOrderNo_OrderSave").html(OrderSaveProcessCurrentDivID == "DivOrderNewCustDetailsPage" ? 0 : ($("#ctl00_DivOrderNo_OrderSave").html() == "" ? $("#" + OrderSaveProcessCurrentDivID + " #ctl00_DivOrderNo_OrderSave").html() : $("#ctl00_DivOrderNo_OrderSave").html()));

        $("#InventoryAddCustName").html($("#" + OrderSaveProcessCurrentDivID + " .lblCustName1").html());
        $("#InventoryAddCity").html($("#" + OrderSaveProcessCurrentDivID + " .lblCustCity1").html());
        $("#InventoryAddPhone").html($("#" + OrderSaveProcessCurrentDivID + " .lblCustPhone1").html());

        //WH
        $("#InventoryAddWH").html($("#ctl00_DivpgOdrsaveActiveWHs").html() == "" ? "No Active WH" : $("#ctl00_DivpgOdrsaveActiveWHs").html());

        var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
        $("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
        $("#fgrdAvaliableInventoryGridList").focus();
        $("#fgrdAvaliableInventoryGridList").empty();

        var Filter = "";
        var inventoryaccess = $("#ctl00_DivInventoryAccessTypes").html();       
        inventoryaccess = ((inventoryaccess != undefined || inventoryaccess != null) ? inventoryaccess.toString().toLowerCase() : "");
        var defaultflag = "";       
        
        if (inventoryaccess != "") {            
            defaultflag = "";
            var dflagarr = [];
            dflagarr = inventoryaccess.split(',')
            for (index = 0; index < dflagarr.length; index++) {
                var temp = dflagarr[index];
                if (inventoryaccess.toLowerCase().includes(temp.toLowerCase())) {                    
                    //defaultflag = ($("#ctl00_DivpgOdrnewtbltype").html() == "" ? '*' : ("'" + $("#ctl00_DivpgOdrnewtbltype").html() + "'," + "'*'"));
                    defaultflag += "'" + temp.toLowerCase() + "',";                    
                }
            }
            defaultflag += "''";
            Filter = "UPPER(Flag) not in (" + defaultflag + ")";
        }        
        if (defaultflag == "") {
            defaultflag = "''";
            Filter = "UPPER(Flag) not in (" + defaultflag + ")";
        }
        defaultqtypeload = 0;
        qtypeload = 0;
        $('#DivAvaliableInventoryGridList [name="q"]').val("");
        isInventoryClickedFrom = "AddOrMarketOrRefresh";        
        ApplyfilterForInventoryList(Filter, "Flag")
        // qtypeload = 2;

        //if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person" || $("#ctl00_LoggedInUserType").html() == "credit manager") {
        //    isInventoryClickedFrom = "AddOrMarketOrRefresh";
        //    var Filter = "Flag in (" + defaultflag + ")";
        //    ApplyfilterForInventoryList(Filter, "Flag")
        //    qtypeload = 2;
        //    IsSalesPerson = true;
        //}
        //else {
        //    $("#fgrdAvaliableInventoryGridList").flexOptions({
        //        params: [{ name: 'Filter', value: '' },
        //        { name: 'FilterColumn', value: '' },
        //        { name: 'Customer', value: $("#ctl00_DivCustomerNo_OrderSave").html() }], query: "", newp: 1
        //    }).flexReload();
        //}
    }
     function GetActiveWarehouse(callback) {        
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseListByUser',            
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    debugger;
                    $('#lstWarehouseForFilter').empty();
                    var warehouse = output.d;
                    $('#lstWarehouseForFilter').append('<option value="0">Select Warehouse</option>');
                    for (var i in warehouse) {
                        var wh = warehouse[i];
                        $('#lstWarehouseForFilter').append('<option value="' + wh.WH + '">' + wh.WH + ' - ' + wh.Name + '</option>');
                    }
                    //$('#lstWarehouseForFilter').val($("#hfInventoryUsersWarehouse").val());
                }
            }
        });
        callback(true);
    }
     function ApplyfilterForInventoryList(Filter, FilterColumn) {        
        var activewh = $("#ctl00_DivpgOdrsaveActiveWHs").html() == "" ? "" : $("#ctl00_DivpgOdrsaveActiveWHs").html();
        var WHFilter = "";
        WHFilter = " AND  WH IN ('AIR') ";
        //FilterColumn = (FilterColumn.includes("WH") ? FilterColumn : FilterColumn + " AND WH ")
        Filter = (Filter + WHFilter), "WH and Flower";
        var isWHExist = $("#ctl00_DivWHListCount").html() == "0" ? false : true;
        if (isWHExist) {
            $("#fgrdAvaliableInventoryGridList").flexOptions({
                params: [{ name: 'flower', value: $("#divFlowerCode").html() },
                { name: 'FilterColumn', value: FilterColumn }, { name: 'Customer', value: $("#CustCode").val() }], query: "", newp: 1
            }).flexReload();
        }
    }

     var AllowToViewAllColumnsInInvnetory = false;
    //Setting View of all-columns on Inven-List under user settings
    //
    var sentence = $("#ctl00_DivForViewAllColumnsInInvnetory").html();
    var index = 97;
    //Get Current User Permission on "View all columns in invnetory" setup
    var hasPermissionToViewAllColumnsInInvnetory = sentence.charAt(index);
    //if (hasPermissionToViewAllColumnsInInvnetory.toUpperCase() == "Y" || $("#ctl00_LoggedInUserType_SalesPerson").html().toLowerCase() == "admin")
    //    AllowToViewAllColumnsInInvnetory = false;
    //else
    //    AllowToViewAllColumnsInInvnetory = true;
      $("#fgrdAvaliableInventoryGridList").flexigrid({
        url: 'BloomService.asmx/GetInventoryForAddingOrderDetailFgrd_AllocationOrder',
        dataType: 'xml',
          colModel: [
            { display: '', name: '', width: 15, sortable: false, align: 'center' },
            { display: 'ID', name: 'ID', width: 20, sortable: true, align: 'left', hide: true, process: InventoryForOrderEntryClick },
            { display: 'WH', name: 'WH', width: 20, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'CO', name: 'Country', width: 20, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Type', name: 'Type', width: 13, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Cat', name: 'Cat', width: 25, sortable: true, align: 'left',hide: true, process: InventoryForOrderEntryClick },
            { display: 'Flower', name: 'Flower', width: 70, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Description', name: 'Description', width: 250, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Qty', name: 'Qty', width: 40, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'UOM', name: 'UOM', width: 30, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Allocated', name: '', width: 50, sortable: false, align: 'right',padding:0 },
            { display: 'Pack', name: 'Units', width: 30, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'U/B', name: 'UnitsBunch', width: 20, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'ActualPrice', name: 'ActualPrice', width: 35, sortable: true, align: 'right', hide: true },
            { display: 'Price', name: 'Price', width: 55, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'Fuel', name: 'Fuel', width: 55, sortable: true, align: 'right', hide: true, process: InventoryForOrderEntryClick },
            { display: '***Comments/Breakdown***', name: 'Comments', width: 180, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'DAYS', name: 'DAYS', width: 30, sortable: true, align: 'right' },            
            { display: 'linefuel', name: 'linefuel', width: 195, sortable: true, align: 'left', hide: true },
            { display: 'Plusfuel', name: 'Plusfuel', width: 195, sortable: true, align: 'left', hide: true },
            { display: 'LandedCost', name: 'COST', width: 35, sortable: true, align: 'right', process: InventoryForOrderEntryClick, hide: AllowToViewAllColumnsInInvnetory },
            { display: 'CUST#', name: 'CUST', width: 35, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'ORDER', name: 'ORDER', width: 48, sortable: true, align: 'right', hide: true, process: InventoryForOrderEntryClick, hide: AllowToViewAllColumnsInInvnetory },
            { display: 'BOXNUM', name: 'BOXNUM', width: 40, sortable: true, align: 'right', hide: true  },
            { display: 'AWB', name: 'AWB', width: 30, sortable: true, align: 'right' },
            { display: 'Variety', name: 'Variety', width: 80, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Color', name: 'Color', width: 65, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Grade', name: 'Grade', width: 60, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'FBE', name: 'FBE', width: 30, sortable: true, align: 'right', hide: true },
            { display: 'Dimensions', name: 'Dimensions', width: 30, sortable: true, align: 'left', hide: true },
            { display: 'Cubes', name: 'Cubes', width: 30, sortable: true, align: 'left', hide: true },
            { display: 'GPM', name: 'GPM', width: 30, sortable: true, align: 'right', hide: true },
            { display: 'Cost', name: 'Cost1', width: 30, sortable: true, align: 'right', hide: true },
            { display: 'LastPrice', name: 'LastPrice', width: 30, sortable: true, align: 'right', hide: true },
            { display: 'LastPurchaseDate', name: 'LastPurchaseDate', width: 30, sortable: true, align: 'right', hide: true }
        ],
        showTableToggleBtn: true,
        sortname: "Flower asc",
        sortorder: "",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "ReportName",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        colresize: false,
        autoload: false,
        showTableToggleBtn: false,
        width: 1250,
        height: $(window).height() - 280,
        striped: true,
        rp: 30000,
        params: [
            { name: 'Filter', value: '' },
            { name: 'FilterColumn', value: '' },
            { name: 'Customer', value: $("#CustCode").val() },
        ],
        searchitems: [
            { display: 'Flower', name: 'Flower' },
            { display: 'Farm', name: 'Farm' },
            { display: 'CO', name: 'Country' },
            { display: 'Type', name: 'Type' },
            { display: 'Cat', name: 'CAT' },
            { display: 'Variety', name: 'Variety' },
            { display: 'Color', name: 'Color' },
            { display: 'Grade', name: 'Grade' },
            { display: 'Description', name: 'NAME' },
            { display: 'Units', name: 'Units' },
            { display: 'Qty', name: 'Qty' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Price', name: 'Price' },
            { display: 'Awb', name: 'Awb' },
            { display: 'Box#', name: 'BoxNum' },
            { display: 'Comments', name: 'Comments' },
            { display: 'Warehouse', name: 'WH' },
        ],
        onSuccess: function () {
            $("#fgrdAvaliableInventoryGridList tr:first").addClass("trSelectedCheck");
            $('#fgrdAvaliableInventoryGridList #row0').addClass("TotalRows")

            if ($('#lstVarietyFilterForInventoryList option').length <= 0) {
                $('#lstVarietyFilterForInventoryList').empty();
                $('#lstVarietyFilterForInventoryList').append('<option value="">Select Variety</option>');
                var VarietyList = []
                $("#fgrdAvaliableInventoryGridList tr").each(function () {
                    var currentrowid = $(this).attr("id").replace("row", "");
                    if (currentrowid != 0) {

                        var Variety = $("#aOrderInventoryVariety_" + currentrowid).html();
                        Variety = (Variety == null ? "" : Variety);
                        if (VarietyList.indexOf(Variety) == -1 && Variety.trim() != "") {
                            $('#lstVarietyFilterForInventoryList').append('<option value="' + Variety.trim() + '">' + Variety + '</option>');
                            VarietyList.push(Variety)
                        }
                    }
                });
            }
            if ($('#lstColorFilterForInventoryList option').length <= 0) {
                $('#lstColorFilterForInventoryList').empty();
                $('#lstColorFilterForInventoryList').append('<option value="">Select Color</option>');
                var ColorList = []
                $("#fgrdAvaliableInventoryGridList tr").each(function () {
                    var currentrowid = $(this).attr("id").replace("row", "");
                    if (currentrowid != 0) {
                        var Color = $("#aOrderInventoryColor_" + currentrowid).html();
                        Color = (Color == null ? "" : Color);
                        if (ColorList.indexOf(Color) == -1 && Color.trim() != "") {
                            $('#lstColorFilterForInventoryList').append('<option value="' + Color.trim() + '">' + Color + '</option>');
                            ColorList.push(Color)
                        }
                    }
                });
            }
            if ($('#lstGradeFilterForInventoryList option').length <= 0) {
                $('#lstGradeFilterForInventoryList').empty();
                $('#lstGradeFilterForInventoryList').append('<option value="">Select Grade</option>');
                var GradeList = []
                $("#fgrdAvaliableInventoryGridList tr").each(function () {
                    var currentrowid = $(this).attr("id").replace("row", "");
                    if (currentrowid != 0) {
                        var Grade = $("#aOrderInventoryGrade_" + currentrowid).html();
                        Grade = (Grade == null ? "" : Grade);
                        if (GradeList.indexOf(Grade) == -1 && Grade.trim() != "") {
                            $('#lstGradeFilterForInventoryList').append('<option value="' + Grade.trim() + '">' + Grade + '</option>');
                            GradeList.push(Grade)
                        }
                    }
                });
            }
            if ($('#lstCategoryFilterForInventoryList option').length <= 0) {
                $('#lstCategoryFilterForInventoryList').empty();
                $('#lstCategoryFilterForInventoryList').append('<option value="">Select Category</option>');
                var CategoryList = []
                $("#fgrdAvaliableInventoryGridList tr").each(function () {
                    var currentrowid = $(this).attr("id").replace("row", "");
                    if (currentrowid != 0) {
                        var Category = $("#aOrderInventoryCategory_" + currentrowid).html();
                        Category = (Category == null ? "" : Category);
                        if (CategoryList.indexOf(Category) == -1 && Category.trim() != "") {
                            $('#lstCategoryFilterForInventoryList').append('<option value="' + Category.trim() + '">' + Category + '</option>');
                            CategoryList.push(Category)
                        }
                    }
                });
            }
            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
            $("#fgrdAvaliableInventoryGridList").focus();
        }
    });
     function InventoryForOrderEntryClick(celDiv, id) {
        $(celDiv).click(function () {
            $("#fgrdAvaliableInventoryGridList [id^=row]").removeClass("trSelectedCheck");
            $("#fgrdAvaliableInventoryGridList #row" + id).addClass("trSelectedCheck");
            if ($("#aOrderInventoryQty_" + id).html().indexOf("img") == "-1") {
                if (IsInventoryClick == false) {
                    var WHInvoiced = $("#aOrderCustomerWH_" + id).html();                    
                    GetWarehouse(function (callback) { });                    
                    if ($("#divWHForInvoice").html() != WHInvoiced && $("#divWHForInvoice").html() != "") {
                        $.MessageBox("You can only add items from warehouse : " + $("#divWHForInvoice").html())
                        $("#lstWarehouseForFilter").attr("disabled", "disabled");
                        return false;
                    }
                    else {
                        $("#divWHForInvoice").html(WHInvoiced);
                        $("#lstWarehouseForFilter").attr("disabled", "disabled");
                    }

                    IsInventoryClick = true;
                    InventoryId.push($("#aOrderInventoryINVIDs_" + id).html());
                    isFromARINVS = $("#InventoryListForOrderEntryDialog").data("inData") == undefined ? "" : "PageARINVS";
                    var setpage = isFromARINVS == "" ? "PageOrderSaveProcess" : isFromARINVS;
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/InsertLock',
                        data: "{ 'LockRecord': '" + $("#aOrderInventoryINVIDs_" + id).html() + "','Page':'" + setpage + "','Functionality':'InvenLock'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {

                            var data = output.d;
                            if (data == "Logout") {
                                IsInventoryClick = false;
                                window.location.href = "Login.aspx"

                            }
                            else if (data == "error") {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                IsInventoryClick = false;
                            }
                            else if (data.indexOf("NotExist") >= 0) {


                                var tmp = data.split("_")
                                $("#aOrderInventoryQty_" + id).html(tmp[1]);
                                var FlowerName = $("#aOrderInventoryFlowerName_" + id).html(),
                                    Units = $("#aOrderInventoryUnits_" + id).html(),
                                    UOM = $("#aOrderInventoryUOM_" + id).html(),
                                    Qty = $("#aOrderInventoryQty_" + id).html(),
                                    Invqty = Qty,
                                    Price = $("#aOrderInventoryActualPrice_" + id).html(),
                                    SaleType = $("#aOrderInventorySaleType_" + id).html(),
                                    InvenIDs = $("#aOrderInventoryINVIDs_" + id).html(),
                                    Fuel = $("#aOrderInventoryFuel_" + id).html(),
                                    PlusFuel = $("#aOrderCustomerPlusFuel_" + id).html(),
                                    lineFuelCustomer = $("#aOrderCustomerlinefuel_" + id).html(),
                                    fbe = $("#aOrderCustomerFBE_" + id).html(),
                                    Dimensions = $("#aOrderCustomerDimensions_" + id).html(),
                                    Cubes = $("#aOrderCustomerCubes_" + id).html(),
                                    GPM = $("#aOrderCustomerGPM_" + id).html(),
                                    LandedCostnew = $("#aOrderCustomerLandedCost_" + id).html(),
                                    Flower = $("#aOrderInventoryFlower_" + id).html(),
                                    Boxnum = $("#aOrderCustomerBOXNUM_" + id).html();
                                $("#TotalInvenQty").html(Qty);
                                var LastPrice = $("#aOrderCustomerLastPrice_" + id).html();
                                var LastDate = $("#aOrderCustomerLastDate_" + id).html();

                                var Farm = $("#aOrderInventoryFarm_" + id).html();
                                var CAT = $("#aOrderInventoryCategory_" + id).html();

                                if (SaleType == "P") {
                                    SaleType = "O"
                                }
                                else if (SaleType == "S") {
                                    SaleType = "F"
                                }
                                else {
                                    SaleType = "N"
                                }

                                $("#lblInventorySelectedRowID_AddOrderDetail").html(id);
                                $("#lblInvenIDs_AddOrderDetail").html(InvenIDs);
                                $("#lblFlowerName_AddOrderDetail").html(FlowerName);
                                $("#lblFlowerUnits_AddOrderDetail").html(Units);
                                $("#lblAvailableQty_AddOrderDetail").html(Qty);
                                $("#txtQty_AddOrderDetail").attr('placeholder', 1);
                                $("#txtQty_AddOrderDetail").val("");
                                $("#lblUOM_AddOrderDetail").html(UOM);
                                $("#lblLastPrice_AddOrderDetail").html(LastPrice);
                                $("#lblLastDate_AddOrderDetail").html(LastDate);
                                //lblLastPrice_AddOrderDetail
                                $("#txtPlusFuel_AddOrderDetail").val("");
                                //$("#txtPlusFuel_AddOrderDetail").val(parseFloat(parseFloat(PlusFuel)).toFixed(4));
                                $("#txtPlusFuel_AddOrderDetail").attr('placeholder', parseFloat(parseFloat(PlusFuel)).toFixed(4));

                                var fuelperunit = parseFloat((parseFloat(Fuel) / parseFloat(Units)));
                                $("#lblFuel_AddOrderDetail").html(fuelperunit.toFixed(4));
                                $("#txtPrice_AddOrderDetail").val("");
                                //if (lineFuelCustomer == "False") {
                                // $("#txtPrice_AddOrderDetail").attr('placeholder', parseFloat(Price - fuelperunit).toFixed(4));
                                //}
                                //else{
                                $("#txtPrice_AddOrderDetail").attr('placeholder', parseFloat(Price).toFixed(4));
                                
                                //}

                                if (lineFuelCustomer.toLowerCase() == "false") {
                                    $("#txtPlusFuel_AddOrderDetail").removeAttr("disabled");
                                    $("#txtPrice_AddOrderDetail").attr("disabled", "disabled");
                                }
                                else {
                                    $("#txtPlusFuel_AddOrderDetail").attr("disabled", "disabled");
                                    $("#txtPrice_AddOrderDetail").removeAttr("disabled");
                                }

                                //LoadSaleType(function (callback) {
                                //    
                                //    if (callback == true) {
                                //        $("#lstSaleType_AddOrderDetail").val(SaleType);
                                //        $("#txtSaleType_AddOrderDetail").attr('placeholder', SaleType);
                                //    }
                                //});

                                $("#lstSaleType_AddOrderDetail").val("N");
                                $("#txtSaleType_AddOrderDetail").attr('placeholder', "N");
                                $("#ctl00_DivOrderDetailID_OrderSave").html("");

                                //$("#lblFBE_AddOrderDetail").html(parseFloat(fbe).toFixed(4));
                                //$("#lblDimensions_AddOrderDetail").html(Dimensions);
                                $("#lblCost_AddOrderDetail").html(parseFloat(LandedCostnew).toFixed(4));
                                //var tmpcubes = parseFloat(Cubes).toFixed(4);
                                //var currentqty = $("#txtQty_AddOrderDetail").attr('placeholder')
                                //var getcubes = ((parseFloat(tmpcubes) / 1728) * (parseInt(currentqty)));
                                //$("#lblCubes_AddOrderDetail").html(parseFloat(getcubes).toFixed(4));
                                $("#lblGPM_AddOrderDetail").html(GPM);
                                $("#lblInvenId_AddOrderDetail").html(InvenIDs);

                                $("#Inventorywarning").hide();
                                GetProductFBEDetails(CAT, Farm, UOM);
                                var Farm = $("#aOrderInventoryFarm_" + id).html();
                                if (Farm == "***") {
                                    $("#AddOrderDetailFromInventoryDialog").css("height", "280px");
                                    $("#tdmultiplefarms").show();
                                    //if line has a multiple farm then load the farms dropdown and load it
                                    $.ajax({
                                        type: "POST",
                                        url: 'BloomService.asmx/LoadMultipleFarmsDropdownWhenSelling',
                                        data: "{ 'InvenIDs': '" + InvenIDs + "' }",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (output, status) {
                                            $('#lstMultipleFarms_AddOrderDetail').empty();
                                            $('#lstMultipleFarms_AddOrderDetail').append('<option data-invenids="' + InvenIDs + '"  data-boxes="' + Qty + '" value="***">*** - ' + Qty + '</option>');
                                            var data = output.d;

                                            for (var i in data) {
                                                var Farm = data[i];
                                                $('#lstMultipleFarms_AddOrderDetail').append('<option data-invenids="' + Farm.IDs + '" data-boxes="' + Farm.Qty + '" value="' + Farm.Farm + '">' + Farm.Farm + ' - ' + Farm.Qty + '</option>');
                                            }
                                        }
                                    });
                                }
                                else {
                                    $("#AddOrderDetailFromInventoryDialog").css("height", "245px");
                                    $("#tdmultiplefarms").hide();
                                }
                                var existingOrderDetailID = $("#ctl00_DivOrderDetailID_OrderSave").html() == "" ? 0 : $("#ctl00_DivOrderDetailID_OrderSave").html();
                                $("#AddOrderDetailFromInventoryDialog").dialog("open");
                                $("#AddOrderDetailFromInventoryDialog").dialog('option', 'title', 'Add Order Detail :: ' + existingOrderDetailID);
                                IsInventoryClick = false;
                            }
                            else if (data.indexOf("NoBoxes") >= 0) {
                                IsInventoryClick = false;
                                //$("#aOrderInventoryQty_" + id).html('<img href="#" src="images/sadface.png" title="No Boxes" style="cursor:pointer;width: 16px;height: 16px;">');
                                //$.MessageBox("Sorry... Item is sold out")
                                Setfocustonextrowforinventorysalelist(id);
                            }
                            else if (data != "") {
                                var tmp = data.split("_")
                                $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + " !");
                                IsInventoryClick = false;
                            }
                            else {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                IsInventoryClick = false;
                            }
                        },
                        complete: function () {
                            $("#txtPrice_AddOrderDetail").trigger('focusout');
                        }

                    });
                }
            }
            else {
                IsInventoryClick = false;
                $.MessageBox("Sorry... Item is sold out");
            }
        });
    }
    $("#DivSalesOrderCustomerDetail").dialog({
        autoOpen: false,
        resizable: false,
        title: "Allocation Customer Details",
        width: 970,
        height: 710,
        modal: true,
        open: function () {
            if (IsSalesOrderGridReload) {
                var CargoDate = $('#txtAllocationCargoDate').val();
                var MarketToIgnore = $('#txtMarketToIgnore').val();
                var invarr = [];
                MarketToIgnore = (MarketToIgnore == undefined ? "" : MarketToIgnore);
                if (MarketToIgnore.length > 1) {
                    var vallen = MarketToIgnore.length;
                    for (var i = 0; i < vallen; i++) {
                        var curval = MarketToIgnore.substring(i, i + 1);
                        invarr.push(curval.toString().toUpperCase());
                    }
                }
                else {
                    invarr.push(MarketToIgnore.toString().toUpperCase());
                }
                invarr.join(',');

                //removed by Jose on 6/23/2021
                var FlowerCode = $('#divFlowerCode').html();
                var UOM = $('#divUOM').html();
                //$("#txtSOFlower").val($('#divFlowerName').html());
                //$("#txtSOUOM").val(UOM);
                ////2020/09/20
                var RowUnit = $('#divRowUnit').html();
                var RowComments = $('#divRowComments').html();
                if (RowComments) {
                    RowComments = RowComments.replace("&nbsp;", " ");
                }

                $("#fgrdSalesOrderCustomerDetail").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'CargoDate', value: CargoDate }, { name: 'MarketToIgnore', value: invarr }, { name: 'FlowerCode', value: FlowerCode }, { name: 'UOM', value: UOM }, { name: 'Unit', value: RowUnit }, { name: 'Comments', value: RowComments }], query: "", newp: 1 }).flexReload();
                if (typeof callback !== 'undefined' && typeof callback === 'function') {
                    callback(true);
                }
            }
            else {
                LoadSalesOrderInvoiceList(function (callback) {
                });
            }
        },
        close: function () {
            debugger;
            if (IsQtyReduce) {
                SalesOrderQtyReduce();
                var CargoDate = $('#txtAllocationCargoDate').val();
                var MarketToIgnore = $('#txtMarketToIgnore').val();
                var invarr = [];
                MarketToIgnore = (MarketToIgnore == undefined ? "" : MarketToIgnore);
                if (MarketToIgnore.length > 1) {
                    var vallen = MarketToIgnore.length;
                    for (var i = 0; i < vallen; i++) {
                        var curval = MarketToIgnore.substring(i, i + 1);
                        invarr.push(curval.toString().toUpperCase());
                    }
                }
                else {
                    invarr.push(MarketToIgnore.toString().toUpperCase());
                }
                invarr.join(',');
                $("#fgrdSalesOrderAllocationList").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'CargoDate', value: CargoDate }, { name: 'MarketToIgnore', value: invarr }], query: "", newp: 1 }).flexReload();
                //callback(true);
            }
        }
    });

    function SalesOrderQtyReduce() {
        debugger;
        var SQLID = [];
        var Id = "";
        var InvoiceQty = "";
        $('#fgrdSalesOrderCustomerDetail tr').each(function () {
            if ($(this).attr("id") != "row0") {
                Id = $(this).attr("id").replace("row", "");
                InvoiceQty = $("#fgrdSalesOrderCustomerDetail #txtSOInvQty_" + Id).val();
                if (InvoiceQty == "")
                    InvoiceQty = $("#fgrdSalesOrderCustomerDetail #txtSOInvQty_" + Id).attr("placeholder");

                //if (InvoiceQty !== null && InvoiceQty !== undefined)
                SQLID.push(Id + '~' + InvoiceQty);
            }
        });

        if (SQLID.length > 0) {
            SQLID.join(',');
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateQtyTempSalesOrderAllocation',
                async: false,
                data: "{'SelectedStr':'" + SQLID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if (output.d != "Success") {
                        var gridIdSelection = "";
                        if (IsSalesOrderGridReload) {
                            gridIdSelection = "#fgrdSalesOrderCustomerDetail ";
                        }
                        if ($(gridIdSelection + "#txtSOInvQty_0")) {
                            $(gridIdSelection + "#txtSOInvQty_0").val(getOrderedQtyTotal());
                        }

                        return true;
                    }
                    else {
                        return false;
                    }
                }
            });
        }
    }

    function DeleteTempSalesOrderAllocation() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteTempSalesOrderAllocation',
            async: false,
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d != "Success") {
                    return true;
                }
                else {
                    return false;
                }
            }
        });
    }

    $("[id^=btnSOReduceQty_]").die("click").live("click", function () {
        debugger;
        //this button is exist and called from two different grid, so in some cases we need to determine the correct grid when select the element using jquery
        var gridIdSelection = "";
        if (IsSalesOrderGridReload) {
            gridIdSelection = "#fgrdSalesOrderCustomerDetail ";
        }
        var Id = $(this)[0].id.replace("btnSOReduceQty_", "");
        var InvoiceQty = $(gridIdSelection + "#txtSOInvQty_" + Id).val();
        if (InvoiceQty == "")
            InvoiceQty = $(gridIdSelection + "#txtSOInvQty_" + Id).attr("placeholder");

        var totalShort = $("#txtTotalShort").html();
        if (IsSalesOrderGridReload) { 
            if (!totalShort || isNaN(totalShort) || !isNumber(totalShort))
            { totalShort = 0; }
        
            totalShort = parseInt(totalShort);
            if (totalShort == 0) {
                $.MessageBox("You cannot reduce more than total short!");
                return;
            }
        }

        if (parseInt(InvoiceQty) > 0) {
            if (IsSalesOrderGridReload) {
                $("#txtTotalShort").html(totalShort + 1);
            }
            $(gridIdSelection + "#txtSOInvQty_" + Id).val(parseInt(InvoiceQty) - 1);
            IsQtyReduce = true;
            //update qty in table
            var sourceCtl = $(gridIdSelection + "#txtSOInvQty_" + Id);
            var qty = (sourceCtl.val() == "" || sourceCtl.val() == undefined ? sourceCtl.attr('placeholder') : sourceCtl.val());
            if (isNaN(qty) || qty === "" || qty === " ") { qty = 0; }

            //$.ajax({
            //    type: "POST",
            //    url: 'BloomService.asmx/UpdateTempSalesOrderAllocationInvoiceDetailsField',
            //    async: true,
            //    data: "{'FieldName':'OrderQty','FieldValue':'" + qty + "','FieldKey':'" + Id + "'}",
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (output) {
            //        if (output.d == "LogOut") {
            //            window.location.href = "Login.aspx";
            //        }
            //        else if (output.d.indexOf("error") >= 0) {
            //            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
            //        }
            //        else {
            //            console.log('Qty changed.');
            //        }
            //    },
            //    error: function (response) {
            //        $.MessageBox(response.responseText);
            //    }
            //});
        }
        //update orderedQty total
        if ($(gridIdSelection + "#txtSOInvQty_0")) {
            $(gridIdSelection + "#txtSOInvQty_0").val(getOrderedQtyTotal());
        }
    });

    /* End Generate Invoice For Sales Order Allocation Add By Prashant 16-May-2020*/


    /* Inventory Availibility Report By Prashant on 23 June 2020*/

    /* End of Inventory Availibility Report By Prashant on 23 June 2020*/

    //MANI::01/NOV/2018::Email/Fax selected invoices
    $("#aEmailInvoices").die("click").live("click", function () {

        var orderNos = [];

        $('#fgrdOrderHeader tr:visible').each(function () {

            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    orderNos.push($(this).attr("id").substring(3));
                }
            }
        });

        if (orderNos.length == 0) {
            viewEmailLog();
            //$.MessageBox("Please select an invoice"); // commentd by Belal on 05 Sept 2020
            //return 0;
        }
        else {
            orderNos.join(',');
        }
        //debugger;
        for (var i = 0; i < orderNos.length; i++) {
            try {
                var CustName = $("#fgrdOrderHeader #row" + orderNos[i] + "").find("td div").eq(3)[0].innerText;
            }
            catch (er) {
                var CustName = ""
            }
            try {
                var ShippingDate = $("#fgrdOrderHeader #row" + orderNos[i] + "").find("td div").eq(5)[0].innerText;
            }
            catch (er) {
                var ShippingDate = ""
            }

            try {
                var CustomerNo = $("#fgrdOrderHeader #row" + orderNos[i] + "").find("td div").eq(2)[0].innerText
            }
            catch (ex) {
                var CustomerNo = ""
            }
            EmailOrFaxInvoiceReport(orderNos[i], CustomerNo, ShippingDate);
        }




    });
    //// 04 Apr 2019 :: SALES-Invoice emailed from Invoice view should not add"printed" checkmark
    function EmailOrFaxInvoiceReport(orderNo, CustName, ShippingDate) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInvoiceReportAsync',
            data: "{'Order':'" + orderNo + "','Type':'Email','EmailIDs':'','Subject':'Subject will be generated from code','Body':'','CustName':'" + CustName + "','ShippingDate':'" + ShippingDate + "','isPrintForEmail':" + true + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx"
                }
                else if (output.d.indexOf('error') != "-1") {
                    // $("#fgrdOrderHeader tr:visible").find("td div").eq(0)[0].childNodes[0].src
                    //$("#fgrdOrderHeader #row" + orderNo + "").find("td div").eq(0)[0].childNodes[0].src = "images/check-off.png"
                    $("#Orderselect_" + orderNo).removeClass('Orderselected');
                    $("#Orderselect_" + orderNo).prop("src", "images/check-off.png");

                    $.growl.error({ title: "", message: output.d });
                }
                else {
                    $.growl.notice({ title: "", message: output.d });
                    $("#Orderselect_" + orderNo).removeClass('Orderselected');
                    $("#Orderselect_" + orderNo).prop("src", "images/check-off.png");
                    if (output.d.includes("success")) {
                        var result = output.d.split('-');
                        UpdateEmailLog(result[1], "INVOICE", Order);
                    }
                }
            }
        });
    }

    function UpdateEmailLog(MESSAGE_ID, EMAILTYPE, EMAILEDDOCUMENTNUMBER) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UpdateEmailLog',
            data: '{"MESSAGE_ID": "' + MESSAGE_ID + '","EMAILTYPE": "' + EMAILTYPE + '","EMAILEDDOCUMENTNUMBER": "' + EMAILEDDOCUMENTNUMBER + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d.includes("success")) {
                    $.growl.notice({ title: "", message: output.d });
                }
                else
                    $.growl.error({ title: "", message: output.d });

            }
        });
    }

    $('#lstEDI').live("change", (function () {
        debugger
        if ($(this).find('option:selected').text() == "Select") {
            $.MessageBox("Select an Invoice");
            return false
        }
        var carrier = ""
        var checkboxValuesEDI = [];
        var CAEDI = [];
        var ShipDateEDI = [];
        var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");
        if (SelectedOrders.length == 0 && $(this).find('option:selected').text() != "Prime") {
            $.MessageBox("Select an Invoice");
            $("#lstEDI").val("1");
            return false
        }
        if ($(this).find('option:selected').text() == "Prime") {
            var CurrentDate = Date.today().toString("MM/dd/yyyy");
            var Carrier = "PR";
            $.ajax({
                async: false,
                type: "POST",
                url: 'BloomService.asmx/GeneratePrimeEDIFiles',
                data: '{"Shipdate":"' + CurrentDate + '","Carrier":"' + Carrier + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var MessageStr = output.d.split('~');
                    if (MessageStr[0] == "Success") {
                        $.MessageBox("Text File Generated " + MessageStr[1]);
                        $("#lstEDI").val("1");
                    }
                    if (MessageStr[0] == "NoData") {
                        $.MessageBox(MessageStr[1]);
                        $("#lstEDI").val("1");
                    }
                    else if (MessageStr[0] == "Error") {
                        $.MessageBox("Error Occured While Generate Prime EDI File");
                        $("#lstEDI").val("1");
                    }
                    else {
                        $("#lstEDI").val("1");
                        return false;
                    }
                }
            });
            return false
        }
        var SelectedCA = $(".trChecked:visible").find("td:nth-child(7) div");
        var SelectedPO = $(".trChecked:visible").find("td:nth-child(18) div");
        var SelectedDate = $(".trChecked:visible").find("td:nth-child(5) div");
        var Customer = $("#ctl00_DivCustomerNo_OrderSave").html();
        for (var i = 0; i <= SelectedOrders.length - 1; i++) {
            checkboxValuesEDI.push(SelectedOrders[i].id.substring(12));
            if ($.inArray(SelectedCA[i].innerText, CAEDI) == -1) {

                if ($(this).find('option:selected').text() == "Armellini") {
                    carrier = "AR"
                    if (SelectedCA[i].innerText != "AR" && SelectedCA[i].innerText != "A1" && SelectedCA[i].innerText != "A2" && SelectedCA[i].innerText != "A3") {
                        $.MessageBox("Select AR carrier only");
                        $("#lstEDI").val("1");
                        return false
                    }
                    else
                        CAEDI.push(SelectedCA[i].innerText);
                }
                if ($(this).find('option:selected').text() == "Florida Beauty") {
                    carrier = "FB"
                    if (SelectedCA[i].innerText != "FB") {
                        $.MessageBox("Select FB carrier only");
                        $("#lstEDI").val("1");
                        return false
                    }
                    else
                        CAEDI.push(SelectedCA[i].innerText);
                }
            }

            if ($.inArray(SelectedDate[i].innerText, ShipDateEDI) == -1) {
                ShipDateEDI.push(SelectedDate[i].innerText);
            }
        }

        if (checkboxValuesEDI.length == 0) {
            return false;
        }
        else {
            checkboxValuesEDI.join(',');
        }
        //debugger;
        if (CAEDI.length == 0)
            CAEDI = '';
        else
            CAEDI.join(',');

        if (ShipDateEDI.length == 0)
            ShipDateEDI = '';
        else
            ShipDateEDI.join(',');

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/CreateARFBXML',
            data: "{'Order':'" + checkboxValuesEDI + "','ShipDate':'" + ShipDateEDI + "','CA':'" + carrier + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                if (output.d == "valid") {
                    $.MessageBox("Mail sent successfully for the selected carrier " + carrier + " ")
                    $("#lstEDI").val("1");
                    $(".trChecked:visible").find("img.Orderselected").prop("src", "images/check-off.png");
                    $('#fgrdOrderHeader tr').removeClass("trChecked");
                    $("[id^=Orderselect_]:visible").removeClass('Orderselected');
                    $("[id^=Orderselect_]").prop("src", "images/check-off.png");
                    if ($('img[class=Orderselected]').length <= 0) {
                        $(".ShowInSalesInvoiceSelected").hide();
                    }
                }
                else {
                    $.MessageBox("Please contact Administrator")
                }
            }
        });
    }));

    /*--------------- Anitha :: 14-Oct-2018 :: new button for clear ---------------*/
    $("#btnOrderClearGun").die("click").live("click", function () {
        $('<div id="DivClearGun" style="">' +
            +'</div>').dialog({
                title: 'Clear Gun',
                autoOpen: false,
                resizable: false,
                modal: true,
                width: 300,
                height: 100,
                buttons: {
                    Yes: function () {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/ClearGun',
                            data: "{}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                //debugger;
                                if (output.d == "valid") {
                                    $("#DivClearGun").dialog("close");
                                    $.MessageBox("Successfully cleared the Gun!!!");
                                }
                                else {
                                    $.MessageBox(output.d);
                                }
                            }
                        });
                    },
                    No: function () {
                        $(this).dialog("close");
                    }
                },
                close: function (event, ui) {
                    $(this).dialog('destroy').remove();
                },
                open: function () {
                    $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
                    $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel red');
                },
            });
        $("#DivClearGun").html("<div>Are you sure to clear the Gun?</div>");
        $("#DivClearGun").dialog("open");
    });
    /*--------------- Anitha :: 14-Oct-2018 :: new button for clear ---------------*/

    /*--------------- new button for clear Phy Inven---------------*/
    $("#btnClearPhyInven").die("click").live("click", function () {
        $('<div id="DivClearPhyInven" style="">' +
            +'</div>').dialog({
                title: 'Clear Phy Inven',
                autoOpen: false,
                resizable: false,
                modal: true,
                width: 300,
                height: 100,
                buttons: {
                    Yes: function () {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/CleartblBarCodes',
                            data: "{}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                //debugger;
                                if (output.d == "valid") {
                                    $("#DivClearPhyInven").dialog("close");
                                    $.MessageBox("Successfully cleared the Phy Inven!!!");
                                }
                                else {
                                    $.MessageBox(output.d);
                                }
                            }
                        });
                    },
                    No: function () {
                        $(this).dialog("close");
                    }
                },
                close: function (event, ui) {
                    $(this).dialog('destroy').remove();
                },
                open: function () {
                    $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
                    $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel red');
                },
            });
        $("#DivClearPhyInven").html("<div>Are you sure to clear the Phy Inven?</div>");
        $("#DivClearPhyInven").dialog("open");
    });
    /*--------------- new button for clear Phy Inven---------------*/

    /*--------------- View Log - SPORDTRANS ---------------*/
    $("#rbF8ViewLog").die("click").live("click", function () {
        debugger
        var Customer = "", isF8SingleTrans = false, F8SqlId = "0";
        LoadViewSPORDTransactionsGridFromSales(Customer, isF8SingleTrans, F8SqlId);
    });
    function LoadViewSPORDTransactionsGridFromSales(Customer, isviewtransbysingle, SpordSqlId) {
        var para = 'CustomerNo=' + Customer + '&isTransviewForSingleF8=' + isviewtransbysingle + '&SpordSqlIdForTrans=' + SpordSqlId + '&isTranscalledbyF8=' + false + '';
        $(".imgLoaderForUser").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageSpordTrans.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivViewSPORDTransactionDialog").css('display', 'block');
                $('<div id="DivViewSPORDTransactionDialog">/div>').dialog({
                    title: '',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 970,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                    }
                });
                $("#DivViewSPORDTransactionDialog").html(output.d).dialog("open");
            }
        });
    }
    /*--------------- View Log - SPORDTRANS ---------------*/

    $("#btnConfirmPayment").die("click").live("click", function () {
        var InvoiceList = [];
        $("#fgrdOrderHeader tr").each(function () {
            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    var carrrowid = $(this).attr("id").replace("row", "");
                    if (carrrowid != 0) {
                        if (InvoiceList.indexOf(carrrowid) == -1 && carrrowid.trim() != "") {
                            InvoiceList.push(carrrowid);
                        }
                    }
                }
            }
        });
        InvoiceList.join(',');

        if (InvoiceList.length == 0) {
            $.MessageBox("Please Select invoice to confirm.");
            return false;
        }
        else {
            $.ajax({
                type: "POST",
                url: "BloomService.asmx/ConfirmInvoiceByPaymentTerms",
                contentType: "application/json;charset=utf-8",
                data: '{"InvoiceList":"' + InvoiceList + '"}',
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "Success") {
                        FramingFilters();
                        return true;
                    }
                    else if (output.d.indexOf("error") >= 0) {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        return false;
                    }
                    else if (output.d == "LogOut") {
                        w.close();
                        window.location.href = "Login.aspx"
                    }
                }
            });
        }
    });

    function TotalCompanySalesGraph(Customer, SalesMan) {
        var OnlyMe = $('#chkShowAllSalesPersonSales').is(':checked');
        var onlyCanSeeOwnSales = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(24, 1).ToString()%>' == "Y" ? true : false;
        if (onlyCanSeeOwnSales) {
            OnlyMe = true;
        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetTotalCompanySalesCalculation',
            data: '{ "Customer":"' + Customer + '","SalesMan":"' + SalesMan + '","OnlyMe":"' + OnlyMe + '"}',
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            async: false,
            success: function (output, status) {                
                var res = output.d.CustomerList;

                $("#DivSalesYear1").html(res[0].DivYear1);
                $("#DivSalesYear2").html(res[0].DivYear2);
                $("#DivSalesYear3").html(res[0].DivYear3);
                $("#DivSalesYear4").html(res[0].DivYear4);
                $("#DivSalesYear5").html(res[0].DivYear5);

                if (SalesMan == "0") {

                    $("#ddlSalesMan").empty();
                    $.each(output.d.SalesManDDLList, function (i, item) {
                        $("#ddlSalesMan").append($("<option />").val(item.SALESMAN).text(item.Name));
                    })
                }
            }
        });       
    }

    function GetSalesPersonWiseDailyDataForGraphs() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSalesPersonWiseDailyDataForGraphs',
            data: {},
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            async: false,
            success: function (output, status) {
                var res = output.d.CustomerList;
                var personArr = ["Person 1", "Person 2", "Person 3", "Person 4", "Person 5", "Person 6", "Person 7", "Person 8", "Person 9", "Person 10", "Person 11", "Person 12"];
                $("#DivSalesYear1").html(res[0].DivYear1);
                $("#DivSalesYear2").html(res[0].DivYear2);
                $("#DivSalesYear3").html(res[0].DivYear3);
                $("#DivSalesYear4").html(res[0].DivYear4);
                $("#DivSalesYear5").html(res[0].DivYear5);
                $.each(output.d.SalesPersonModelList, function (i, item) {
                    personArr[i] = item.Name;
                })


                ShowDailySalesGraph(personArr);
            }
        });
    }

    function ShowSalesGraph() {
        try {
            $("#salesChart").remove();
        }
        catch (ex) { }
        var TopMargin = $(window).height() - 700;
        $('#DialogSalesGraph').html("<canvas id='salesChart' width='1100' height='400' style='margin-top: " + TopMargin + "px;'></canvas>");
        //debugger;
        var ctx = document.getElementById("salesChart").getContext('2d');

        var d = new Date();       
        var dynLabels = [];
        for (var y = 0; y < 5; y++) {
            dynLabels.push(d.getFullYear() - y);
        }
        dynLabels.join(",");

        var Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var slscretyr = [], slscrelyr = [], slscrelyr2 = [], slscrelyr3 = [], slscrelyr4 = [];
        var Months1 = [], Months2 = [], Months3 = [], Months4 = [], Months5 = [], Months6 = [], Months7 = [],
            Months8 = [], Months9 = [], Months10 = [], Months11 = [], Months12 = [];
       
        slscretyr = $("#DivSalesYear1").html().split("~");
        slscrelyr = $("#DivSalesYear2").html().split("~");
        slscrelyr2 = $("#DivSalesYear3").html().split("~");
        slscrelyr3 = $("#DivSalesYear4").html().split("~");
        slscrelyr4 = $("#DivSalesYear5").html().split("~");


        Months1.push((slscretyr[0].trim() == "" ?   "0.00" : slscretyr[0]) + "," + (slscrelyr[0].trim() == "" ? "0.00" : slscrelyr[0]) + "," + (slscrelyr2[0].trim() == "" ? "0.00" : slscrelyr2[0]) + "," + (slscrelyr3[0].trim() == "" ? "0.00" : slscrelyr3[0]) + "," + (slscrelyr4[0].trim() == "" ? "0.00" : slscrelyr4[0]));
        Months2.push((slscretyr[1].trim() == "" ?   "0.00" : slscretyr[1]) + "," + (slscrelyr[1].trim() == "" ? "0.00" : slscrelyr[1]) + "," + (slscrelyr2[1].trim() == "" ? "0.00" : slscrelyr2[1]) + "," + (slscrelyr3[1].trim() == "" ? "0.00" : slscrelyr3[1]) + "," + (slscrelyr4[1].trim() == "" ? "0.00" : slscrelyr4[1]));
        Months3.push((slscretyr[2].trim() == "" ?   "0.00" : slscretyr[2]) + "," + (slscrelyr[2].trim() == "" ? "0.00" : slscrelyr[2]) + "," + (slscrelyr2[2].trim() == "" ? "0.00" : slscrelyr2[2]) + "," + (slscrelyr3[2].trim() == "" ? "0.00" : slscrelyr3[2]) + "," + (slscrelyr4[2].trim() == "" ? "0.00" : slscrelyr4[2]));
        Months4.push((slscretyr[3].trim() == "" ?   "0.00" : slscretyr[3]) + "," + (slscrelyr[3].trim() == "" ? "0.00" : slscrelyr[3]) + "," + (slscrelyr2[3].trim() == "" ? "0.00" : slscrelyr2[3]) + "," + (slscrelyr3[3].trim() == "" ? "0.00" : slscrelyr3[3]) + "," + (slscrelyr4[3].trim() == "" ? "0.00" : slscrelyr4[3]));
        Months5.push((slscretyr[4].trim() == "" ?   "0.00" : slscretyr[4]) + "," + (slscrelyr[4].trim() == "" ? "0.00" : slscrelyr[4]) + "," + (slscrelyr2[4].trim() == "" ? "0.00" : slscrelyr2[4]) + "," + (slscrelyr3[4].trim() == "" ? "0.00" : slscrelyr3[4]) + "," + (slscrelyr4[4].trim() == "" ? "0.00" : slscrelyr4[4]));
        Months6.push((slscretyr[5].trim() == "" ?   "0.00" : slscretyr[5]) + "," + (slscrelyr[5].trim() == "" ? "0.00" : slscrelyr[5]) + "," + (slscrelyr2[5].trim() == "" ? "0.00" : slscrelyr2[5]) + "," + (slscrelyr3[5].trim() == "" ? "0.00" : slscrelyr3[5]) + "," + (slscrelyr4[5].trim() == "" ? "0.00" : slscrelyr4[5]));
        Months7.push((slscretyr[6].trim() == "" ?   "0.00" : slscretyr[6]) + "," + (slscrelyr[6].trim() == "" ? "0.00" : slscrelyr[6]) + "," + (slscrelyr2[6].trim() == "" ? "0.00" : slscrelyr2[6]) + "," + (slscrelyr3[6].trim() == "" ? "0.00" : slscrelyr3[6]) + "," + (slscrelyr4[6].trim() == "" ? "0.00" : slscrelyr4[6]));
        Months8.push((slscretyr[7].trim() == "" ?   "0.00" : slscretyr[7]) + "," + (slscrelyr[7].trim() == "" ? "0.00" : slscrelyr[7]) + "," + (slscrelyr2[7].trim() == "" ? "0.00" : slscrelyr2[7]) + "," + (slscrelyr3[7].trim() == "" ? "0.00" : slscrelyr3[7]) + "," + (slscrelyr4[7].trim() == "" ? "0.00" : slscrelyr4[7]));
        Months9.push((slscretyr[8].trim() == "" ?   "0.00" : slscretyr[8]) + "," + (slscrelyr[8].trim() == "" ? "0.00" : slscrelyr[8]) + "," + (slscrelyr2[8].trim() == "" ? "0.00" : slscrelyr2[8]) + "," + (slscrelyr3[8].trim() == "" ? "0.00" : slscrelyr3[8]) + "," + (slscrelyr4[8].trim() == "" ? "0.00" : slscrelyr4[8]));
        Months10.push((slscretyr[9].trim() == "" ?  "0.00" : slscretyr[9]) + "," + (slscrelyr[9].trim() == "" ? "0.00" : slscrelyr[9]) + "," + (slscrelyr2[9].trim() == "" ? "0.00" : slscrelyr2[9]) + "," + (slscrelyr3[9].trim() == "" ? "0.00" : slscrelyr3[9]) + "," + (slscrelyr4[9].trim() == "" ? "0.00" : slscrelyr4[9]));
        Months11.push((slscretyr[10].trim() == "" ? "0.00" : slscretyr[10]) + "," + (slscrelyr[10].trim() == "" ? "0.00" : slscrelyr[10]) + "," + (slscrelyr2[10].trim() == "" ? "0.00" : slscrelyr2[10]) + "," + (slscrelyr3[10].trim() == "" ? "0.00" : slscrelyr3[10]) + "," + (slscrelyr4[10].trim() == "" ? "0.00" : slscrelyr4[10]));
        Months12.push((slscretyr[11].trim() == "" ? "0.00" : slscretyr[11]) + "," + (slscrelyr[11].trim() == "" ? "0.00" : slscrelyr[11]) + "," + (slscrelyr2[11].trim() == "" ? "0.00" : slscrelyr2[11]) + "," + (slscrelyr3[11].trim() == "" ? "0.00" : slscrelyr3[11]) + "," + (slscrelyr4[11].trim() == "" ? "0.00" : slscrelyr4[11]));

        Months1.join(",")
        Months2.join(",")
        Months3.join(",")
        Months4.join(",")
        Months5.join(",")
        Months6.join(",")
        Months7.join(",")
        Months8.join(",")
        Months9.join(",")
        Months10.join(",")
        Months11.join(",")
        Months12.join(",")

        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: dynLabels,
                datasets: [{
                    label: "Jan",
                    backgroundColor: "rgb(255,0,0)",
                    data: Months1[0].split(",")
                }, {
                    label: "Feb",
                    backgroundColor: "rgb(0,255,0)",
                    data: Months2[0].split(",")
                }, {
                    label: "Mar",
                    backgroundColor: "rgb(0,0,255)",
                    data: Months3[0].split(",")
                }, {
                    label: "Apr",
                    backgroundColor: "rgb(255,255,0)",
                    data: Months4[0].split(",")
                }, {
                    label: "May",
                    backgroundColor: "rgb(0,255,255)",
                    data: Months5[0].split(",")
                }, {
                    label: "Jun",
                    backgroundColor: "rgb(255,0,255)",
                    data: Months6[0].split(",")
                }, {
                    label: "Jul",
                    backgroundColor: "rgb(128,0,0)",
                    data: Months7[0].split(",")
                }, {
                    label: "Aug",
                    backgroundColor: "rgb(0,128,0)",
                    data: Months8[0].split(",")
                }, {
                    label: "Sep",
                    backgroundColor: "rgb(128,0,128)",
                    data: Months9[0].split(",")
                }, {
                    label: "Oct",
                    backgroundColor: "rgb(128,128,128)",
                    data: Months10[0].split(",")
                }, {
                    label: "Nov",
                    backgroundColor: "rgb(255,69,0)",
                    data: Months11[0].split(",")
                }, {
                    label: "Dec",
                    backgroundColor: "rgb(0,191,255)",
                    data: Months12[0].split(",")
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                        }
                    }],
                    xAxes: [{
                        barPercentage: 0.95,
                    }]
                }
            }
        });

        document.getElementById("salesChart").innerHTML = myBarChart;
    }
    function ShowDailySalesGraph(personArr) {
        try {
            $("#salesChart").remove();
        }
        catch (ex) { }
        var TopMargin = $(window).height() - 700;
        $('#DialogSalesGraph').html("<canvas id='salesChart' width='1100' height='400' style='margin-top: " + TopMargin + "px;'></canvas>");
        //debugger;
        var ctx = document.getElementById("salesChart").getContext('2d');

        var d = new Date();
        var dynLabels = [];
        for (var y = 0; y < 5; y++) {
            dynLabels.push(d.getFullYear() - y);
        }
        dynLabels.join(",");

        var Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var slscretyr = [], slscrelyr = [], slscrelyr2 = [], slscrelyr3 = [], slscrelyr4 = [];
        var Months1 = [], Months2 = [], Months3 = [], Months4 = [], Months5 = [], Months6 = [], Months7 = [],
            Months8 = [], Months9 = [], Months10 = [], Months11 = [], Months12 = [];

        slscretyr = $("#DivSalesYear1").html().split("~");
        slscrelyr = $("#DivSalesYear2").html().split("~");
        slscrelyr2 = $("#DivSalesYear3").html().split("~");
        slscrelyr3 = $("#DivSalesYear4").html().split("~");
        slscrelyr4 = $("#DivSalesYear5").html().split("~");


        Months1.push((slscretyr[0].trim() == "" ? "0.00" : slscretyr[0]) + "," + (slscrelyr[0].trim() == "" ? "0.00" : slscrelyr[0]) + "," + (slscrelyr2[0].trim() == "" ? "0.00" : slscrelyr2[0]) + "," + (slscrelyr3[0].trim() == "" ? "0.00" : slscrelyr3[0]) + "," + (slscrelyr4[0].trim() == "" ? "0.00" : slscrelyr4[0]));
        Months2.push((slscretyr[1].trim() == "" ? "0.00" : slscretyr[1]) + "," + (slscrelyr[1].trim() == "" ? "0.00" : slscrelyr[1]) + "," + (slscrelyr2[1].trim() == "" ? "0.00" : slscrelyr2[1]) + "," + (slscrelyr3[1].trim() == "" ? "0.00" : slscrelyr3[1]) + "," + (slscrelyr4[1].trim() == "" ? "0.00" : slscrelyr4[1]));
        Months3.push((slscretyr[2].trim() == "" ? "0.00" : slscretyr[2]) + "," + (slscrelyr[2].trim() == "" ? "0.00" : slscrelyr[2]) + "," + (slscrelyr2[2].trim() == "" ? "0.00" : slscrelyr2[2]) + "," + (slscrelyr3[2].trim() == "" ? "0.00" : slscrelyr3[2]) + "," + (slscrelyr4[2].trim() == "" ? "0.00" : slscrelyr4[2]));
        Months4.push((slscretyr[3].trim() == "" ? "0.00" : slscretyr[3]) + "," + (slscrelyr[3].trim() == "" ? "0.00" : slscrelyr[3]) + "," + (slscrelyr2[3].trim() == "" ? "0.00" : slscrelyr2[3]) + "," + (slscrelyr3[3].trim() == "" ? "0.00" : slscrelyr3[3]) + "," + (slscrelyr4[3].trim() == "" ? "0.00" : slscrelyr4[3]));
        Months5.push((slscretyr[4].trim() == "" ? "0.00" : slscretyr[4]) + "," + (slscrelyr[4].trim() == "" ? "0.00" : slscrelyr[4]) + "," + (slscrelyr2[4].trim() == "" ? "0.00" : slscrelyr2[4]) + "," + (slscrelyr3[4].trim() == "" ? "0.00" : slscrelyr3[4]) + "," + (slscrelyr4[4].trim() == "" ? "0.00" : slscrelyr4[4]));
        Months6.push((slscretyr[5].trim() == "" ? "0.00" : slscretyr[5]) + "," + (slscrelyr[5].trim() == "" ? "0.00" : slscrelyr[5]) + "," + (slscrelyr2[5].trim() == "" ? "0.00" : slscrelyr2[5]) + "," + (slscrelyr3[5].trim() == "" ? "0.00" : slscrelyr3[5]) + "," + (slscrelyr4[5].trim() == "" ? "0.00" : slscrelyr4[5]));
        Months7.push((slscretyr[6].trim() == "" ? "0.00" : slscretyr[6]) + "," + (slscrelyr[6].trim() == "" ? "0.00" : slscrelyr[6]) + "," + (slscrelyr2[6].trim() == "" ? "0.00" : slscrelyr2[6]) + "," + (slscrelyr3[6].trim() == "" ? "0.00" : slscrelyr3[6]) + "," + (slscrelyr4[6].trim() == "" ? "0.00" : slscrelyr4[6]));
        Months8.push((slscretyr[7].trim() == "" ? "0.00" : slscretyr[7]) + "," + (slscrelyr[7].trim() == "" ? "0.00" : slscrelyr[7]) + "," + (slscrelyr2[7].trim() == "" ? "0.00" : slscrelyr2[7]) + "," + (slscrelyr3[7].trim() == "" ? "0.00" : slscrelyr3[7]) + "," + (slscrelyr4[7].trim() == "" ? "0.00" : slscrelyr4[7]));
        Months9.push((slscretyr[8].trim() == "" ? "0.00" : slscretyr[8]) + "," + (slscrelyr[8].trim() == "" ? "0.00" : slscrelyr[8]) + "," + (slscrelyr2[8].trim() == "" ? "0.00" : slscrelyr2[8]) + "," + (slscrelyr3[8].trim() == "" ? "0.00" : slscrelyr3[8]) + "," + (slscrelyr4[8].trim() == "" ? "0.00" : slscrelyr4[8]));
        Months10.push((slscretyr[9].trim() == "" ? "0.00" : slscretyr[9]) + "," + (slscrelyr[9].trim() == "" ? "0.00" : slscrelyr[9]) + "," + (slscrelyr2[9].trim() == "" ? "0.00" : slscrelyr2[9]) + "," + (slscrelyr3[9].trim() == "" ? "0.00" : slscrelyr3[9]) + "," + (slscrelyr4[9].trim() == "" ? "0.00" : slscrelyr4[9]));
        Months11.push((slscretyr[10].trim() == "" ? "0.00" : slscretyr[10]) + "," + (slscrelyr[10].trim() == "" ? "0.00" : slscrelyr[10]) + "," + (slscrelyr2[10].trim() == "" ? "0.00" : slscrelyr2[10]) + "," + (slscrelyr3[10].trim() == "" ? "0.00" : slscrelyr3[10]) + "," + (slscrelyr4[10].trim() == "" ? "0.00" : slscrelyr4[10]));
        Months12.push((slscretyr[11].trim() == "" ? "0.00" : slscretyr[11]) + "," + (slscrelyr[11].trim() == "" ? "0.00" : slscrelyr[11]) + "," + (slscrelyr2[11].trim() == "" ? "0.00" : slscrelyr2[11]) + "," + (slscrelyr3[11].trim() == "" ? "0.00" : slscrelyr3[11]) + "," + (slscrelyr4[11].trim() == "" ? "0.00" : slscrelyr4[11]));

        Months1.join(",")
        Months2.join(",")
        Months3.join(",")
        Months4.join(",")
        Months5.join(",")
        Months6.join(",")
        Months7.join(",")
        Months8.join(",")
        Months9.join(",")
        Months10.join(",")
        Months11.join(",")
        Months12.join(",")

        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: dynLabels,
                datasets: [{
                    label: personArr[0],
                    backgroundColor: "rgb(255,0,0)",
                    data: Months1[0].split(",")
                }, {
                    label: personArr[1],
                    backgroundColor: "rgb(0,255,0)",
                    data: Months2[0].split(",")
                }, {
                    label: personArr[2],
                    backgroundColor: "rgb(0,0,255)",
                    data: Months3[0].split(",")
                }, {
                    label: personArr[3],
                    backgroundColor: "rgb(255,255,0)",
                    data: Months4[0].split(",")
                }, {
                    label: personArr[4],
                    backgroundColor: "rgb(0,255,255)",
                    data: Months5[0].split(",")
                }, {
                    label: personArr[5],
                    backgroundColor: "rgb(255,0,255)",
                    data: Months6[0].split(",")
                }, {
                    label: personArr[6],
                    backgroundColor: "rgb(128,0,0)",
                    data: Months7[0].split(",")
                }, {
                    label: personArr[7],
                    backgroundColor: "rgb(0,128,0)",
                    data: Months8[0].split(",")
                }, {
                    label: personArr[8],
                    backgroundColor: "rgb(128,0,128)",
                    data: Months9[0].split(",")
                }, {
                    label: personArr[9],
                    backgroundColor: "rgb(128,128,128)",
                    data: Months10[0].split(",")
                }, {
                    label: personArr[10],
                    backgroundColor: "rgb(255,69,0)",
                    data: Months11[0].split(",")
                }, {
                    label: personArr[11],
                    backgroundColor: "rgb(0,191,255)",
                    data: Months12[0].split(",")
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                        }
                    }],
                    xAxes: [{
                        barPercentage: 0.95,
                    }]
                }
            }
        });

        document.getElementById("salesChart").innerHTML = myBarChart;
    }

    $("#DivOrderDetailsDimensionView").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 820,
        height: 480,
        modal: true
    });

    $("#DialogConsoleViewDimension").dialog({
        autoOpen: false,
        title: "Order Detail Dimension",
        width: 500,
        height: 160,
        modal: true,
        resizable: false,
        buttons: {
            Save: function () {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateDimensionByOrderNo',
                    data: "{'SQLID': '" + $("#hdnSQLID").val() + "','L':'" + $("#txtLength").val() + "','W':'" + $("#txtWidth").val() + "','H':'" + $("#txtHeight").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        
                    }
                });
                var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");

                if (SelectedOrders.length <= 0) {
                    $.MessageBox("Please select a invoice to release");
                    return false;
                }

                var OrderNos = []
                for (var i = 0; i <= SelectedOrders.length - 1; i++) {
                    OrderNos.push(SelectedOrders[i].id.substring(12));
                }
                $("#fgrdOrderDetailsDimensionView").flexOptions({ params: [{ name: 'OrderNo', value: OrderNos }, { name: 'Filter', value: "" }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            debugger;
            var str = $("#DialogConsoleViewDimension").data("Dimension");
            var array = str.split("x");
            $("#txtLength").val(array[0]);
            $("#txtWidth").val(array[1]);
            $("#txtHeight").val(array[2]);
            $("#hdnSQLID").val(array[3])
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        }

    });
    $("[id^=OrderDetailEditDim_]").die("click").live("click", function () {
        debugger;
        OID = $(this).attr("id").replace("OrderDetailEditDim_", "").trim();
        $("#DialogConsoleViewDimension").data('Dimension', $(this).closest('tr').find('td:eq(10)').text() + 'x' + OID).dialog("open");
    });
    $("#fgrdOrderDetailsDimensionView").flexigrid({
        url: 'BloomService.asmx/OrderDetailDimensionView',
        dataType: 'xml',
        colModel: [
                 { display: '', name: 'Delete', width: 13, sortable: false, align: 'center' },
                 { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                 { display: 'INV#', name: 'Order', width: 80, sortable: true, align: 'left', hide: true },
                 { display: 'InvType', name: 'InvenType', width: 30, sortable: false, align: 'left', hide: true },
                 { display: 'Flower', name: 'Flower', width: 100, sortable: true, align: 'left' },
                 { display: 'Description', name: 'Name', width: 230, sortable: true, align: 'left' },
                 { display: 'Farm', name: 'FarmCode', width: 30, sortable: true, align: 'left' },
                 { display: 'Boxes', name: 'Boxes', width: 30, sortable: false, align: 'right' },/*jose changed :: left to right align*/
                 { display: 'UOM', name: 'UOM', width: 30, sortable: false, align: 'left' },
                 { display: 'Units', name: 'Units', width: 30, sortable: false, align: 'right' },
                 { display: 'Dimentions', name: '', width: 80, sortable: true, align: 'right' },
                 { display: 'Cubes', name: 'Cubes', width: 50, sortable: true, align: 'right' },
                 { display: 'Weight', name: 'WEIGHT', width: 50, sortable: true, align: 'right' },
                 { display: 'Cat', name: 'CAT', width: 40, sortable: true, align: 'left', hide: false },
                 { display: 'Color', name: 'Color', width: 40, sortable: true, align: 'left', hide: true },
                 { display: 'Variety', name: 'VARIETY', width: 80, sortable: true, align: 'left', hide: true },
                 { display: 'Grade', name: 'GRADE', width: 50, sortable: true, align: 'left', hide: true },
        ],
        searchitems: [
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'Name' },
            { display: 'Farm', name: 'FarmCode' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Cat', name: 'CAT' },
       ],
        showTableToggleBtn: true,
        //sortname: "OrderDate Desc,CustomerName asc",
        sortname: "Flower asc",
        sortorder: "",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "",
        rp: 30000,
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: false,
        showTableToggleBtn: false,
        width: 790,
        height: 350,
        striped: true,
        params: [
        { name: 'Filter', value: '' },
        { name: 'OrderNo', value: '' },
        { name: 'ExportCSV', value: '' }
        ],
        onSuccess: function () {


            var sel = jQuery("#fgrdOrderDetailsDimensionView tbody tr");
            var len = sel.length;
            if (len > 1) {
                $("#DivOrderDetailsDimensionView #ExportCSV").show();
            }
            //$("#fgrdOrderDetailsDimensionView").parent(".bDiv").find("table tr:last td").addClass("TotalRows");
            $('#fgrdOrderDetailsDimensionView #row0').addClass("TotalRows");
            $("#DivOrderDetailsDimensionView .sDiv").css('float', 'left').css('width', '542px');
            $('#DivOrderDetailsDimensionView .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#DivOrderDetailsDimensionView .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivOrderDetailsDimensionView .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivOrderDetailsDimensionView .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
            $('#fgrdOrderDetailsDimensionView #OrderDetailEditDim_0').hide();
            $('#fgrdOrderDetailsDimensionView #OrderDetailDelete_0').hide();
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });

    $("#btnUpdateDimension").die('click').live('click', function () {
         var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");

        if (SelectedOrders.length <= 0) {
            $.MessageBox("Please select at least one invoice to check dimensions");
            return false;
        }

        var OrderNos = []
        for (var i = 0; i <= SelectedOrders.length - 1; i++) {
            OrderNos.push(SelectedOrders[i].id.substring(12));
        }
        $("#DivOrderDetailsDimensionView").dialog('option', 'title', 'View by Dimensions');
        $("#DivOrderDetailsDimensionView").dialog("open");
        var orderno = $("#ctl00_DivOrderNo").html();
        $("#fgrdOrderDetailsDimensionView").flexOptions({ params: [{ name: 'OrderNo', value: OrderNos }, { name: 'Filter', value: "" }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
    });
   var showCustomerlistOnload = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(40, 1).ToString()%>' == "Y" ? true : false;    
        if (showCustomerlistOnload == true) {
             $("#imgCustomerInfoToggle").click();
            }
    $("#btnAWB").die('click').live('click', function () {
        var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");

        if (SelectedOrders.length <= 0) {
            $.MessageBox("Please select the orders to update the awb#");
            return false;
        }
        $("#DialogUpdateAWB").dialog('option', 'title', 'Update AWB');
        $("#DialogUpdateAWB").dialog("open");
    });

    $("#DialogUpdateAWB").dialog({
        autoOpen: false,
        title: "Update AWB",
        width: 300,
        height: 160,
        modal: true,
        resizable: false,
        buttons: {
            Apply: function () {

                 var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");
                 var OrderNos = []
                    for (var i = 0; i <= SelectedOrders.length - 1; i++) {
                        OrderNos.push(SelectedOrders[i].id.substring(12));
                }

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateAWBByOrderNo',
                    data: "{'OrderNo': '" + OrderNos + "','AWB':'" + $("#txtAWB").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        
                    }
                });
                $("#fgrdOrderHeader").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: '' }, { name: 'FilterDivision', value: FilterDivision }], query: "", newp: 1 }).flexReload();
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");
                 var OrderNos = []
                    for (var i = 0; i <= SelectedOrders.length - 1; i++) {
                        OrderNos.push(SelectedOrders[i].id.substring(12));
                }
            $("#txtAWB").val($("#aAWB_" + OrderNos).html())
            $(".ui-dialog-buttonpane button:contains('Apply')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        }

    });
</script>
