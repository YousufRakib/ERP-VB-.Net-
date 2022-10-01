<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageARINVS.ascx.vb" Inherits="pages_PageARINVS" %>
<script src="js/validation.js" type="text/javascript"></script>
<style>
    div[data-placeholder]:not([data-placeholder=""]):empty::before {
        content: attr(data-placeholder);
    }

    /*width for list of the autocomplete control*/
    .ui-autocomplete {
        /*width: 165px;*/
    }

    .fileuploader-input-button {
        background: #a5a5a5;
        color: #000000;
        padding-top: 11px;
        padding-right: 20px;
        padding-bottom: 11px;
        padding-left: 20px;
    }

        .fileuploader-input-button:hover {
            background: #a5a5a5;
        }

    .fileuploader {
        padding-left: 15px;
        padding-top: 0px;
        padding-right: 0px;
        padding-bottom: 0px;
        margin-top: 5px;
        margin-right: 0px;
        margin-bottom: 5px;
        margin-left: 0px;
    }

    .fileuploader-item {
        padding-top: 0px;
        padding-right: 8px;
        padding-bottom: 8px;
        padding-left: 8px;
    }

        .fileuploader-item .fileuploader-item-image img {
            height: 50px;
            width: 50px;
        }

    .selectize-dropdown-content {
        height: 160px;
    }

    .searchplaceholder::-webkit-input-placeholder {
        color: #a9a8a0;
        opacity: 10;
    }

    ::-webkit-input-placeholder {
        color: black;
        opacity: 10;
    }

    ::-moz-placeholder {
        color: black;
        opacity: 10;
    }

    :-moz-placeholder {
        color: black;
        opacity: 10;
    }

    :-ms-input-placeholder {
        color: black;
        opacity: 10;
    }
    /* IE10+ */



    ::-webkit-input-placeholder {
        opacity: 2;
        color: black;
    }

    #fsSold {
        height: 90px;
        max-height: 300px;
        float: left;
    }

    #fsCredit {
        height: 145px;
        max-height: 300px;
        float: right;
    }

    .trSelectedARXML {
        background: #7B7BFF;
        color: white;
    }

    .trSelectedCheck {
        background: red !important;
        color: white;
    }

    textarea:focus {
        background-color: cornsilk;
        outline-offset: -2px;
        outline: -webkit-focus-ring-color auto 5px;
    }


    .HoldHeaderLabels {
        color: #FFFF34;
        font-size: 16px;
    }

    .EditHeaderLabels {
        color: #FFFF34;
        font-size: 16px;
    }

    #SPORDAddEditDialog input[type="text"], #SPORDAddEditDialog textarea {
        background-color: #A70000;
        border-color: #A70000;
        color: #00FFFF;
        border-radius: 0px;
        margin-top: -2px;
        font-size: 14px;
    }

        #SPORDAddEditDialog input[type="text"]:focus, #SPORDAddEditDialog textarea:focus {
            background-color: #A70000;
            border-color: #A70000;
            color: #00FFFF;
        }

    .selectize-dropdown-content {
        height: 100%;
        /*max-height:160px;*/
        position: fixed;
        background: white !important;
        color: black;
    }

    .selectize-input > * {
        text-overflow: ellipsis;
        white-space: nowrap;
        color: black;
    }

    #SPORDAddEditDialog tr {
        height: 20px;
    }

    #tdFarm .selectize-input {
        width: 250px;
    }

    #tdFarm .selectize-dropdown-content {
        min-width: 250px;
    }

    #tdFlower .selectize-input {
        width: 350px;
    }

    #tdFlower .selectize-dropdown-content {
        min-width: 350px;
    }

    #tdStatus .selectize-input {
        width: 200px;
    }

    #tdStatus .selectize-dropdown-content {
        min-width: 200px;
    }

    #tdCarrier .selectize-input {
        width: 222px;
    }

    #tdCarrier .selectize-dropdown-content {
        min-width: 222px;
    }

    #tdShipto .selectize-input {
        width: 260px;
    }


    #tdShipto .selectize-dropdown-content {
        min-width: 260px;
    }


    #tdCargoAgency .selectize-input {
        width: 222px;
    }

    #tdCargoAgency .selectize-dropdown-content {
        min-width: 222px;
    }



    #row0_0 {
        /*position: absolute;
        margin-top: -63px;*/
        color: red;
        text-decoration: none;
    }

        #row0_0 td {
            /*background-color: #f3f3f3;*/
            border: 0px;
        }

            #row0_0 td.sorted {
                /*background-color: #708090;*/
                background-color: #72C97D;
                border: 0px;
            }

    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }

    .firstletterunderline::first-letter {
        text-decoration: underline;
    }
</style>

<div id="DivArmelliniXMLLogs" style="display: none">
	<%--New armellini resend--%>
    <input type="hidden" id="hfResendXMLOrderNo" />
    <table style="width: 100%">


        <tr>
            <td id="DivResend">
                <input id="btnResendARXMLFile" type="button" class="BloomButtonEnabled" value="Resend" style="margin-left: 5px;">
                <img id="imgResend" style="display: none; height: 16px; width: 16px;" src="images/ajax_loader_blue_512.gif" />
                <label id="lblResendMessage"></label>
            </td>
        </tr>
        <tr>
            <td>
                <table id="fgrdArmelliniXMLLogs" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>




<div id="ChangeConsigneeInARXMLDialog" style="display: none;">
    <table style="margin-left: 25px;">
        <tr>
            <td colspan="2" style="height: 28px">
                <div class="ARXMLWarning" style="display: none;" align="center">
                </div>
            </td>
        </tr>
        <tr>
            <td align="left">Ship Date</td>
            <td>
                <input type="text" id="txtShipDateForARXML" style="width: 150px; height: 16px; float: left; display: none;" />
            </td>
        </tr>
        <tr>
            <td>Consignee
            </td>
            <td>
                <input type="text" id="txtCongineeForARXML" maxlength="7" style="width: 150px; height: 16px; float: left" />
            </td>
        </tr>
    </table>
</div>




<div id="DivARINVCustomerGridDialog" style="display: none">
    <table style="width: 100%">
        <tr style="display: block">
            <td colspan="4" style="vertical-align: top;">
                <div id="DivOrderCustDetails1Page" style="width: 1000px;"></div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table id="fgrdARINVCustomer" style="display: none;"></table>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div style="margin-top: 6px;" id="DivBtnARINVDetails">
                    <input id="btnARINVEmail" type="button" class="BloomButtonEnabled" value="Email" style="margin-left: 5px; width: 55px;">
                    <input id="btnARINVFax" type="button" class="BloomButtonEnabled" value="Fax" style="margin-left: 5px; width: 48px;">
                    <input id="btnARINVPrint" type="button" class="BloomButtonEnabled" title="Prints to your defauld printer an Invoice" value="Print" style="margin-left: 5px; width: 50px;">
                    <input id="btnARINVPDF" type="button" class="BloomButtonEnabled" title="Generates a PDF for selected invoices" value="PDF" style="margin-left: 5px; width: 45px;">
                    <input id="btnARINVStatement" type="button" class="BloomButtonEnabled" title="Click to Email or generate a pdf for a statement" value="Statement" style="width: 75px;">
                    <%--<input id="btnARINVAgeing" type="button" class="BloomButtonEnabled" value="Ageing" style="margin-left: 5px; width: 66px;">--%>
                    <input id="btnARINVSaveInvoicePdfs" type="button" class="BloomButtonEnabled" title="Click to save a pdf of an invoice in your download folder" value="Save" style="margin-left: 5px; width: 50px;">
                    <input id="btnARINVHistoryCurrent" type="button" class="BloomButtonEnabled" value="History" style="margin-left: 5px; width: 55px;">
                    <input id="btnARINVViewPayments" type="button" class="BloomButtonEnabled" value="View Payments" style="margin-left: 5px; width: 100px;">
                    <input id="btnARINVNotes" type="button" class="BloomButtonEnabled" value="Notes" style="margin-left: 5px; width: 55px; display: none;">
                    <input id="btnARINVDocs" type="button" class="BloomButtonEnabled" value="Documents" style="margin-left: 5px; width: 80px;">
                    <input id="btnARINVCallHS" type="button" class="BloomButtonEnabled" title="Call History" value="F7" style="margin-left: 5px; width: 40px;">
                    <input id="btnARINVSpord" type="button" class="BloomButtonEnabled" title="Standing Orders/Pre-Books" value="F8" style="margin-left: 5px; width: 40px;">
                    <input id="btnUpdateCustomer" type="button" class="BloomButtonEnabled" title="View Customer Details" value="View Customer Details" style="margin-left: 5px; width: 148px;">
                    <select id="ddlARINVPay" style="display: none;">
                        <option>Select Action</option>
                        <option>Returned Checks</option>
                        <option>Adjustments</option>
                        <option>Discounts</option>
                        <option>Debits</option>
                        <option>Stopped Payments</option>
                        <option>Credit Card Disputes</option>
                        <option>Update Customer</option>
                    </select>
  
                    <label id="txtTotalAdjustments" style="margin-left: 5px; width: 60px; line-height: 25px; font-weight: bold;"></label>
                    <img style="cursor: pointer;  line-height: 25px;width:20px;height:20px;margin-left:10px;" src='images/printer-icon.png' id="imgPrintAdjustmentReports" />
                    <%--<label id="txtTotalAdjustments" style="margin-left: 165px; width: 50px; height: 16px;font-weight: bold;"></label>--%>
   
                    <%--<input id="btnRequestID" type="button" class="BloomButtonEnabled" value="Request ID" style="margin-left: 5px; width: 75px; float: right;">--%>
                    <%--add Update button to edit customer details :: by Abinaya :: 08May2018 --%>
                    <%--<input id="btnARINVSCustUpdate" type="button" class="BloomButtonEnabled" value="Update" style="margin-left: 5px; width: 75px; float: right; display: none;">--%>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="DivVETInvoiceGridDialog" style="display: none">
    <table style="">
        <tr style="display: block">
            <td style="vertical-align: top;">
                <div id="DivVETCustDetailsPage" style="width: 1030px;"></div>
            </td>
        </tr>
        <tr>
            <td>
                <table id="fgrdVETINVCustomer" style="display: block; "></table>
                <div id="DivVETInvoiceNo" style="display:none">0</div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="divVETButtonsList" style="margin-top: 6px; display: block;">
                    <button id="btnVETDetailsADD" type="button" class="BloomButtonEnabled firstletterunderline" value="Add" style="width: 66px; color: white;">Add</button>
                    <button id="btnVETDetailsKMisc" type="button" class="BloomButtonEnabled firstletterunderline" value="KMisc" style="margin-left: 4px; width: 66px; color: white;">KMisc</button>
                    <button id="btnVETDetailsSave" type="button" class="BloomButtonEnabled firstletterunderline" value="Save" style="margin-left: 4px; width: 66px; color: white;">Save</button>
                    <input id="btnVETDetailsShipto" type="button" class="BloomButtonEnabled" value="Shipto" style="margin-left: 4px; width: 66px; color: white;">
                    <input id="btnVETDetailsMessage" type="button" class="BloomButtonEnabled" value="Message" style="margin-left: 4px; width: 66px; color: white;">
                    <input type="button" class="BloomButtonEnabled" id="btnVETEmail" value="Email" style="margin-left: 4px; width: 66px;">
                    <input type="button" class="BloomButtonEnabled" id="btnVETFax" value="Fax" style="margin-left: 4px; width: 66px;">
                  <%--  <input type="button" class="BloomButtonEnabled" value="Consol" style="margin-left: 4px; width: 66px; background: red; color: white;">--%>
                    <%--Muthu Nivetha M :: 02 Mar 19 :: VET - Vdrop hide :: Modified--%>
                    <input type="button" class="BloomButtonEnabled" id="btnVDrop" value="VDrop" style="display:none;margin-left: 4px; width: 66px; background: red; color: white;" hidden="hidden">
                  <%--  <input type="button" class="BloomButtonEnabled" value="XTransfer" style="margin-left: 4px; width: 66px; background: red; color: white;">--%>
                    <input id="btnVETDetailsVoid" type="button" class="BloomButtonEnabled" value="Void" style="margin-left: 4px; width: 56px; color: white;">
                  <%--  <input type="button" class="BloomButtonEnabled" value="Transfer" style="margin-left: 4px; width: 66px; background: red; color: white;">--%>
                    <input type="button" id="btnVETCredits" class="BloomButtonEnabled" value="Credits" style="margin-left: 4px; width: 66px;">
                    <button id="btnOrderVETFlip" class="BloomButtonEnabled" style="margin-left: 4px; width: 56px; color: white;">Flip</button>
                    <button id="btnOrderVETConsolView" class="BloomButtonEnabled" style="margin-left: 4px; width: 89px;">Consol View</button>
                    <button id="btnOrderDetailsF6" class="BloomButtonEnabled" style="width: 56px;">F6</button>
                    <button id="btnOrderVETActivityLogView" class="BloomButtonEnabled" style="margin-left: 4px; width: 56px;">F7</button>
                   <%-- <button id="btnOrderDetailsF8" class="BloomButtonEnabled" style="margin-left: 4px; width: 56px;" >F8</button>--%>
                    <button id="btnOrderNewDetailsNotes" class="BloomButtonEnabled firstletterunderline" style="margin-left: 4px; width: 66px;">Notes</button>
                    <button id="btnOrderDetailsRepeatARINV" class="BloomButtonEnabled" style="margin-left: 4px; width: 66px;background:powderblue;color:black;font:bold 12 arial;">Repeat</button>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="DivCreditGridDialog" style="display: none; max-height: 520px">
    <table style="width: 100%">
        <tr style="height: 20px">
            <td>Flower</td>
            <td colspan="5">
                <label id="lblCreditFlowerCode"></label>
                &nbsp;&nbsp;&nbsp;&nbsp; 
                <label id="lblCreditFlowerName"></label>
            </td>
        </tr>
        <tr style="height: 20px">
            <td>Farm</td>
            <td colspan="5">
                <label id="lblCreditFarmCode"></label>
                &nbsp;&nbsp;&nbsp;&nbsp; 
                <label id="lblCreditFarmName"></label>
            </td>
        </tr>
        <tr style="height: 20px" id="trCreditLot">
            <td>Lot#</td>
            <td style="width: 250px;">
                <label id="lblCreditAwb"></label>
            </td>
            <td style="width: 100px">Farm Invoice</td>
            <td style="width: 50px">
                <label id="lblCreditInvoice"></label>
            </td>
            <td style="width: 50px;">PO#</td>
            <td>
                <label id="lblCreditPO"></label>
            </td>
        </tr>
        <tr style="height: 20px" id="trCreditDaterec">
            <td>Date Received</td>
            <td>
                <label id="lblCreditRecdate"></label>
            </td>
            <td>Days fresh</td>
            <td>
                <label id="lblCreditDaysFresh"></label>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr id="trCreditSold" style="height: 115px;">
            <td colspan="2" style="vertical-align: top;">
                <fieldset id="fsSold" style="width: 280px;">
                    <legend id="lgSold" style="font-size: large; background: white;">Sold</legend>

                    <div id="DivSoldDetails" style="float: left">
                        <table id="tblSoldDetails">
                            <tr style="height: 20px;">
                                <td style="padding-right: 25px; color: magenta;">Total Boxes</td>
                                <td style="text-align: right; width: 5px">
                                    <label id="lblSoldTotalBoxes" style="text-align: right"></label>
                                </td>
                                <td style="width: 5px;">
                                    <label id="lblSoldUOM"></label>
                                </td>
                                <td style="width: 5px;">&nbsp;X&nbsp;</td>
                                <td>
                                    <label id="lblSoldUnitsPerBox" style="text-align: right"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Total Units</td>
                                <td colspan="4">
                                    <input type="text" id="txtSoldTotalUnits" style="text-align: right" disabled />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Price/Unit</td>
                                <td colspan="4">
                                    <input type="text" id="txtSoldPricePerUnit" style="text-align: right" disabled />
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </td>
            <td colspan="4">
                <fieldset id="fsCredit" style="float: left; width: 280px;">
                    <legend id="lgCredit" style="font-size: large; background: white;">To Credit</legend>

                    <div id="DivCreditDetails" style="float: left">
                        <table id="tblCreditDetails">
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Units</td>
                                <td>
                                    <input type="text" id="txtCreditUnits" style="text-align: right" class="NegativeNumbers" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Price</td>
                                <td>
                                    <input type="text" id="txtCreditPrice" style="text-align: right" class="DecimalsOnly" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Freight</td>
                                <td>
                                    <input type="text" id="txtCreditFreight" style="text-align: right" class="NegativDecimals" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Fuel</td>
                                <td>
                                    <input type="text" id="txtCreditFuel" style="text-align: right" class="NegativDecimals" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Taxes</td>
                                <td>
                                    <input type="text" id="txtCreditTaxes" style="text-align: right" class="NegativDecimals" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 25px">
            <td>Control #</td>
            <td>
                <input type="text" id="txtCreditControl" style="margin-top: 1px;" class="NumbersOnly" /></td>
            <td colspan="4">
                <label style="margin-left: 13px;">Total</label>
                <input type="text" id="txtCreditTotal" style="margin-top: 1px; margin-left: 35px; text-align: right" disabled>
            </td>
        </tr>
        <tr style="height: 35px">
            <td>Credit Code</td>
            <td style="vertical-align: top;" id="tdCreditCode">
                <%--<select id="lstCreditCode" style="width: 200px;"></select>--%>
                <select id="lstCreditCode" style="width: auto;" class="searchplaceholder" />
                <input type="hidden" id="hfCreditCode" />
            </td>
            <td colspan="4"></td>
        </tr>
        <tr style="height: 25px">
            <td style="width: 130px">Reason</td>
            <td colspan="5">
                <%--<input type="text" id="txtCreditReason1" style="width: 330px; margin-top: 3px;" readonly="readonly" />--%>
                <textarea id="txtCreditReason2" style="margin-top: 3px; height: 90px; width: 330px;" cols="60" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <input type="file" id="fileuploader3" name="files">
            </td>
        </tr>
    </table>
</div>

<div id="msgbox-DivCreditGridDialog" style="display: none;" title="Alert">
    <p id="msgDivCreditGridDialoghtml"></p>
</div>

<div id="msgbox-CreditReq" style="display: none;" title="Alert">
    <p id="msgCreditReqhtml"></p>
</div>

<div id="msgbox-approval" style="display: none;">
    <p id="msg-approval">
    </p>
</div>

<div id="msg-CrePrev" style="display: none; max-height: 500px; max-width: 600px;" title="Alert">
    <p id="msgPrev"></p>
</div>

<div id="DivCreditReqList" style="display: none;">
    <table>
        <tr>
            <td>
                <table id="fgrdCreditReqList" style="display: block;"></table>
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" id="btnCrReqPrint" class="BloomButtonEnabled" value="Print" style="margin-top: 5px;display:none; width: 66px;">
            </td>
        </tr>
    </table>
</div>

<div id="msgbox-CreditDel" style="display: none;" title="Alert">
    <p id="msgCreditDelhtml"></p>
</div>

<div id="DivCreditImageNames" style="display: none;"></div>

<div id="DialogEmailOrFaxtheInvoice" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="float: left" title="Send Selected Invoices One By One">
                <input type="checkbox" id="chkSendInvoicesOneByOne">
                <label for="chkSendInvoicesOneByOne"><span style="padding: 1px; float: left;"></span>One By One</label>
            </td>
        </tr>
        <tr class="Emailsection">
            <td>
                <textarea rows="2" style="width: 466px; height: 81px;" cols="5" id="txtEmailIDsForInvoice" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
        <tr class="Faxsection">
            <td>
                <input type="text" id="txtFaxForInvoice" style="width: 100px; height: 16px; float: left" />
                <label>@faxage.com</label>
                <input type="hidden" id="hfEmailorFax" style="width: 350px; height: 16px; float: left" />
            </td>
        </tr>        
        <tr id="trSubjectDetail">
            <td>
                <b>Subject</b>
                <input type="text" style="width: 466px;" id="txtEmailSubjectDetail" spellcheck="false" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Message</b>
                <textarea rows="2" style="width: 466px; height: 101px;" cols="5" id="txtEmailBodyDetail" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
    </table>
</div>

<div id="ARINVSStatementDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td>Statement as of
            </td>
            <td>
                <input type="text" class="datecontrol" id="txtStatementDate" style="width: 100px; height: 16px; float: left" />
            </td>
        </tr>
        <tr>
            <td>Email to
            </td>
            <td>
                <textarea rows="2" style="width: 281px; height: 47px;" cols="5" id="txtStatementEmailTo" autocorrect="off" spellcheck="false"></textarea>
            </td>

        </tr>
    </table>
</div>

<div id="msgbox-save" style="display: none;" title="Alert">
    <p id="msgsavehtml"></p>
</div>

<div id="LoggedInUserType" runat="server" style="display: none"></div>
<div id="LoggedInUserID" runat="server" style="display: none"></div>

<div id="DivCOMMID" style="display: none;">0</div>
<div id="DivDocsID" style="display: none;">0</div>


<div id="DialogViewPayments" style="display: none;">
    <table>
        <tr>
            <td>
                <table id="fgrdARINVSViewPaymentsHeader" style="display: block;"></table>
            </td>
            <td>
                <table id="fgrdARINVSViewPaymentsDetails" style="display: block;"></table>
            </td>
        </tr>
    </table>
</div>

<div style="display: none;" id="DivARLogSelectedRowID"></div>
<div style="display: none;" id="DivARCHECKSelectedHeaderRowID"></div>
<div id="DeleteMiscDetail" style="display: none;" title="Alert"></div>

<div id="ARINVNotesDialog" style="display: none; background: #ebf3f3;">
    <table>
        <tr>
            <td>Notes</td>
            <td>
                <input type="text" id="txtARINVNotes" style="width: 550px; height: 30px; margin-left: 25px;" maxlength="76">
            </td>
            <td>
                <button type="button" id="btnAddARINVNotes" style="margin-right: 50px;" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false"><span class="ui-button-text">Add</span></button>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <div id="DivFgrdARINVNotes">
                    <table id="fgrdARINVNotes" style="display: block;"></table>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="ARINVDocsDialog" style="display: none; background: #ebf3f3;">
    <table>
        <tr>
            <td>Document [I/S] :</td>
            <td style="padding-right: 15px;">
                <input type="text" id="txtARINVDocsT" style="width: 35px;" maxlength="1" class="AllUpperCaseTextBox">
            </td>
            <td>Method [E/F/P] :</td>
            <td style="padding-right: 15px;">
                <input type="text" id="txtARINVDocsD" style="width: 35px;" maxlength="1" class="AllUpperCaseTextBox">
            </td>
            <td>Address :</td>
            <td style="padding-right: 15px;">
                <input type="text" id="txtARINVDocsAddr" style="width: 250px;" maxlength="150">
            </td>
            <td>
                <button type="button" id="btnAddARINVDocs" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false"><span class="ui-button-text">Add</span></button>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <div id="DivFgrdARINVDocs">
                    <table id="fgrdARINVDocs" style="display: block;"></table>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="CrReqPrintDialog" style="display: none">
    <table>
        <tr>
            <td>
                <fieldset class="fsEmailto" style="overflow: auto;">
                    <legend class="lblEmailTo" style="background: white;">Email To</legend>
                    <textarea rows="2" style="width: 445px; height: 50px;" cols="5" id="txtCrReqEmailTo" autocorrect="off" spellcheck="false"></textarea>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset class="fsSubject" style="overflow: auto;">
                    <legend class="lblSubject" style="background: white;">Subject</legend>
                    <input type="text" id="txtCrReqSubject" style="width: 445px; height: 25px; float: left" />
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <textarea rows="2" style="width: 465px; height: 80px;" cols="10" id="txtCrReqBody" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
    </table>
</div>

<div id="DialogEmailOrFaxtheIndividualInv" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr class="EmailIndividualInvSection">
            <td>
                <textarea rows="2" style="width: 466px; height: 81px;" cols="5" id="txtEmailIDsForIndividualInv" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
        <tr class="FaxIndividualInvSection">
            <td>
                <input type="text" id="txtFaxForIndividualInv" style="width: 100px; height: 16px; float: left" />
                <label>@faxage.com</label>
                <input type="hidden" id="hfEmailorFaxIndividualInv" style="width: 350px; height: 16px; float: left" />
            </td>
        </tr>        
        <tr id="trSubjectDetailForIndividualInv">
            <td>
                <b>Subject</b>
                <input type="text" style="width: 466px;" id="txtEmailSubjectDetailForIndividualInv" spellcheck="false" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Message</b>
                <textarea rows="2" style="width: 466px; height: 101px;" cols="5" id="txtEmailBodyDetailForIndividualInv" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
    </table>
</div>

<div id="msgbox-download" style="display: none;" title="Alert">
    <p id="msgdownloadhtml" style="font-weight: bold; text-align: center; margin-top: 30px;"></p>
</div>

<div id="DialogARAdjustment" style="display: none;">
    <table>
        <tr style="height: 33px;">
            <td colspan="6">
                <label style="padding-right: 10px;">Amount to Adjust</label>
                <input type="text" id="txtARAdjustAmount" style="text-align: right;" class="ClsTwoDecimalsOnly" maxlength="13" />
            </td>
        </tr>
        <tr style="height: 33px;">
            <td>
                <label>G/L #</label></td>
            <td style="padding-right: 10px;">
                <input type="text" id="txtARAdjustGL" style="width: 75px;" maxlength="20" />
            </td>
            <td style="padding-right: 10px;">
                <label>Date</label></td>
            <td style="padding-right: 10px;">
                <input type="text" id="txtARAdjustDate" style="width: 75px;" />
            </td>
            <td style="padding-right: 10px;">
                <label>Reason</label></td>
            <td style="padding-right: 10px;">
                <input type="text" id="txtARAdjustReason" style="width: 290px;" maxlength="100" />
            </td>
        </tr>
    </table>
</div>

<div id="msgbox-CustDelay" style="display: none;" title="Alert">
    <p id="msg" style="font-weight: bold;">Controls are loading. Please wait...</p>
</div>

<%--<div id="DialogARINVTransactions">
    <table id="fgrdARINVTransactions" style="display: block;"></table>
</div>--%>



<div id="DialogEmailForARINVSViewPaymentsReport" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr class="Emailsection">
            <td>
                <textarea rows="2" style="width: 466px; height: 81px;" cols="5" id="txtEmailIDsForARINVSViewPaymentsReport" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
    </table>
</div>


<%--
<div id="AddUpdateVETDetail">
    <table style="width: 85%"> 
         <tr style="height: 25px">
            <td colspan="4">
                <div class="Warning" id="Inventorywarning"  align="center">
                     Not enough on inventory
                </div> 
            </td>
        </tr>
        <tr>
            <td style="display: none;">
                <label id="lblInventorySelectedRowID_AddOrderDetail"></label>
                <label id="lblInvenIDs_AddOrderDetail"></label>
            </td>
        </tr>
        <tr style="height: 23px;">
            <td>Description</td>
            <td>
                <label id="lblFlowerName_AddVETDetail" style=""></label>
                <label id="lblFlowerUnits_AddVETDetail" style="padding-left: 10px"></label>
            </td>
        </tr>
        <tr>
            <td>Quantity</td>
            <td>
                <input type="text" class="ClsNumbersOnly" id="txtQty_AddVETDetail" style="width: 30px;" />
                <label style="" id="lblUOM_AddVETDetail"></label>
              <label id="lblBoxSize_AddOrderDetail"></label>
             <%--   <label id="lblBoxSize_AddOrderDetail"></label>--%>
                <label style="margin-left: 60px;float: right;">Max : <label stylemargin-left: 4px;" id="lblAvailableQty_AddVETDetail"></label></label>
            </td>
        </tr>
        <tr>
            <td>Price</td>
            <td>
                <input type="text" class="ClsDecimalsOnly" id="txtPrice_AddVETDetail" style="width: 45px;" /></td>
        </tr>
        <tr style="height: 23px;">
            <td>+Fuel</td>
            <td>
                <label id="lblPlusFuel_AddOrderDetail"></label>
                 <%--<label id="lblPlusFuel_AddOrderDetail"></label>--%>
                 <input type="text" class="ClsDecimalsOnly" id="txtPlusFuel_AddVETDetail" style="width: 45px;" />
                <label style="padding-left: 30px;" id="lblFuel_AddVETDetail"></label>
            </td>
        </tr>
        <tr>
            <td>Sale type</td>
            <td>
                <input type="text" id="txtSaleType_AddVETDetail" style="width:14px;"/>
                 <select id="lstSaleType_AddVETDetail">
                     <option value=""><----View Sales List----></option>
                     <option value="N">N-Market Sale</option>
                     <option value="F">F-Standing Order</option>
                     <option value="E">E-Double S.O</option>
                     <option value="V">V-Seasonal</option>
                     <option value="C">C-Consignment</option>
                     <option value="D">D-Dump Sale</option>
                     <option value="L">L-Local Sale</option>
                     <option value="S">S-Salvage Sale</option>
                     <option value="B">B-Donation</option>
                     <option value="T">T-Donation</option>
                     <option value="P">P-Sample</option>
                     <option value="O">O-Pre-book</option>
                     <option value="R">R-Replacement</option>
                     <option value="U">U-Fumigated</option>
                 </select>
            </td>
        </tr>        
    </table>
</div>--%>

<div id="SalesControlNum" style="display:none;"></div>
<div id="DivGetInvoiceNo" style="display:none">0</div>

<div id="DivOrderSavePage_VETDetail" style="display:none"></div>



<div id="DialogFlipOrder_VET" style="display: none; margin-top: 20px;">
    <table>
        <tr>
            <td>
                <label>Customer# / Name : </label>
            </td>
            <td>
                <input type="text" id="txtCustSearchForFlip_VET" style="width: 300px;" />
                <input type="hidden" id="hfCustomerForFlip_VET"/>
            </td>        
        </tr>
    </table>
</div>

<div id="DivOrderVETConsolView" style="display: none">		
	    <table style="width: 100%">		
	        <tr>		
	            <td>		
	            <table id="fgrdOrderVETConsolView" style="display: none; "></table>		
	            </td>		
        </tr>		
    </table>		
</div>
<div id="DialogOrderDetailsRepeatARINV" style="display: none;">
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtbrFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    Starting Date
                </td>
                <td>
                    <input id="txtARINVStartingDt" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>            
            <tr style="height: 33px;" id="trbrToDatetxt">
                <td style="padding-right: 10px;" id="tdbrToDatelbl">
                    how many times to repeat?
                </td>
                <td id="tdrepeat">
                    <input id="txtARINVrepeat" class="rbARReports" type="text" style="margin-top: 8px; width: 50px;" />
                </td>
            </tr>
        </table>  
</div>
<script type="text/javascript">
    var SelectedInvenId = 0;
    $(document).ready(function () {
     
        $("#btnOrderVETActivityLogView").on('click', function () {

            var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
            var para = 'Page=CallHS&OrderNo=' + OrderNo;
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
                        title: 'Activity Log :: ' + OrderNo,
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

        if ($("#ctl00_LoggedInUserType").html() == "sales person") {
            $("[id^=VETDetailEdit_]").die("click").live("click", function () {
                $.MessageBox("You do not have rights to modify this order!!!");
            });

            $("#btnOrderVETFlip").hide();
            $("#btnVETDetailsVoid").hide();
            $("#btnVETDetailsADD").hide();
            $("#btnVETDetailsKMisc").hide();
            $("#btnVETDetailsSave").hide();
            $("#btnVETDetailsShipto").hide();
            $("#btnVETDetailsMessage").hide();
        }
        //if ($("#ctl00_LoggedInUserType").html() == "employee") {
        // $("#btnOrderVETFlip").hide();
        // $("#btnVETDetailsVoid").hide();
        // $("#btnVETDetailsADD").hide();
        // $("#btnVETDetailsKMisc").hide();
        // $("#btnVETDetailsSave").hide();
        // $("#btnVETDetailsShipto").hide();
        // $("#btnVETDetailsMessage").hide();
        //}
    });
    var Salesman = "";
    var CreditFilenames = [];  /* Get uploaded filename from aspx in folder */
    var CreditVETID = "";
    var CREREQID = "";
    var SelectizeFlag = "0";
    var IsCustomerUserType = false;
    var IsUnappliedPaymentGridIntialized = false;
    var IsARINVHistory = "0";

    function KometVisibility() {
        var IsKometSales = '<%=ConfigurationManager.AppSettings("IsKometSales").ToString() %>'
        if (IsKometSales.toUpperCase() != 'YES') {
            $('#btnRequestID').hide();
        }
        else {
            $('#btnRequestID').show();
        }

    }
    $(document).ready(new function () {
        LoadCreditCode();
        KometVisibility();
        $("#btnOrderDetailsF6").die('click').live("click", function (e) {

            try {
                $("#DivCurrentOrdersDialog").dialog("close");
            }
            catch (ex) { }
            var Customer = $("#ctl00_DivCustomerNo_OrderDetails").html();

            var para = 'Customer=' + Customer;
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPage',
                data: '{ "controlName":"pages/PageCurrentOrdersForCustomer.ascx","controlPara":"' + para + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('<div id="DivCurrentOrdersDialog">/div>').dialog({
                        title: 'Current Order',
                        autoOpen: false,
                        resizable: false,
                        modal: true,
                        width: 1030,
                        height: $(window).height() - 10,
                        //closeOnEscape:false,
                        close: function (event, ui) {
                            $(this).dialog('destroy').remove();
                        },
                        open: function () {
                            $("#DivCurrentOrdersDialog").focus();
                        },

                    });
                    $("#DivCurrentOrdersDialog").dialog('option', 'title', 'Current Order Detail for Customer ::' + Customer);
                    $("#DivCurrentOrdersDialog").html(output.d).dialog("open");
                }
            });

        });

        $("#btnOrderDetailsF8").die('click').live('click', function () {
            var para = 'Customer=' + $("#ctl00_DivCustomerNo_OrderDetails").html();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPage',
                data: '{ "controlName":"pages/PageSPORD.ascx","controlPara":"' + para + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('<div id="DivSPORDDialog">/div>').dialog({
                        title: 'SPORD',
                        autoOpen: false,
                        resizable: false,
                        modal: true,
                        width: 1360,
                        height: $(window).height() - 10,
                        //closeOnEscape:false,
                        close: function (event, ui) {
                            $(this).dialog('destroy').remove();
                        },
                        open: function () {
                            $("#DivSPORDDialog").focus();
                        },

                    });
                    $("#DivSPORDDialog").dialog('option', 'title', 'SPORD Details for Customer :: ' + ($("#ctl00_DivCustomerNo_OrderDetails").html() == 'null' ? $("#CurrentCustomerNo").html() : $("#ctl00_DivCustomerNo_OrderDetails").html()));
                    //$("#DivSPORDDialog").dialog('option', 'title', 'SPORD Details for Customer ::' + $("#CurrentCustomerNo").html());
                    $("#DivSPORDDialog").html(output.d).dialog("open");
                }
            });
        });
        //Notes For the Customer
        $("#btnOrderNewDetailsNotes").die('click').live('click', function () {
            var Customer = $("#ctl00_DivCustomerNo_OrderDetails").html();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustomerComments',
                data: "{'Customer': " + Customer + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('<div id="DivCustomerComments" style="">' +
                        +'<div><textarea id=txtCustomerComments></textarea></div></div>').dialog({
                            title: 'CUSTOMER NOTES SECTION',
                            autoOpen: false,
                            resizable: false,
                            modal: true,
                            width: 700,
                            buttons: {
                                Save: function () {
                                    $.ajax({
                                        type: "POST",
                                        url: 'BloomService.asmx/SaveCustomerComments',
                                        data: "{'Customer': '" + Customer + "','Comments':'" + escape($("#txtCustomerComments").val()) + "'}",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (output1, status) {
                                            if (output1.d != "error") {
                                                $("#DivCustomerComments").dialog("close");
                                                $("#DivCustomerComments").dialog('destroy').remove();
                                            }
                                            else {
                                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                            }
                                        }
                                    });
                                },
                                Cancel: function () {
                                    $(this).dialog("close");
                                }

                            },
                            close: function (event, ui) {
                                $(this).dialog('destroy').remove();
                            },
                            open: function () {
                                $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
                                $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
                            },

                        });

                    $("#DivCustomerComments").html('<textarea id="txtCustomerComments" spellcheck="false" style="width: 637px;height: 174px;">' + output.d + '</textarea>');
                    $("#DivCustomerComments").dialog("open");

                }
            });

        });

          $("#txtARINVStartingDt").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                 selectOtherMonths: true,
             }).datepicker("setDate", new Date(new Date()));

        $("#btnOrderDetailsRepeatARINV").die('click').live('click', function () {
         $("#DialogOrderDetailsRepeatARINV").dialog("open");
        });

        $("#DialogOrderDetailsRepeatARINV").dialog({
            autoOpen: false,
            title: "Order Detail Repeat",
            width: 500,
            height: 160,
            modal: true,
            resizable: false,
            buttons: {
                Repeat: function () {
                    $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateOrderDetailRepeat',
                        data: "{ 'Invoice': '" + ($("#ctl00_DivOrderNo").html() == '' || $("#ctl00_DivOrderNo").html() == null ? $("#ctl00_DivOrderNo_OrderSave").html() : $("#ctl00_DivOrderNo").html()) + "','StartDate':'" + $("#txtARINVStartingDt").val() + "','NoTimesToRepeat': '" + $("#txtARINVrepeat").val()+ "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        // $(this).dialog("close");
                        if (output.d.includes("success")) {
                            $.growl.notice({ title: "", message: $("#txtARINVrepeat").val() + " order(s) has been created" });
                            $("#DialogOrderDetailsRepeatARINV").dialog("close");
                        }
                        else { 
                            $.growl.error({ title: "", message: output.d });
                        }
                     }
                    });
                },
                Cancel: function () {
                    $(this).dialog("close");
                },
            },
                open: function (e) {
                debugger;
                    var OrderDetailsPDFCurrentDivID = $("#CustCurrentDivID").html();
                    var ShippingDate = $("#" + OrderDetailsPDFCurrentDivID + " .lblInvoiceDate1").html();
                    const ShippingDateArray = ShippingDate.split("/");
                    var ShippingDate_date = ShippingDateArray[0];
                    var ShippingDate_month = ShippingDateArray[1];
                    var ShippingDate_year = ShippingDateArray[2];
                    let ShippingDay = new Date(ShippingDate_month + '-' + ShippingDate_date  + '-' + ShippingDate_year).getDay();
                    var StartRepeatDate = new Date(nextDayAndTime(ShippingDay, 0, 0).toString()); 
                    //$("#txtRackRange").val("01-03");
                    $(".ui-dialog-buttonpane button:contains('Repeat')").addClass('dialogbuttonstyle icon-save');
                    $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
                    //set default num of times to repeate
                    $("#txtARINVrepeat").val("1");
                    $("#txtARINVStartingDt").val($.datepicker.formatDate('mm/dd/yy', StartRepeatDate));
            }

        });

        function nextDayAndTime(dayOfWeek, hour, minute) {
            var now = new Date().addDays(7)
            now.setHours(0,0,0,0);
          var result = new Date(
                         now.getFullYear(),
                         now.getMonth(),
                         now.getDate() + (7 + dayOfWeek - now.getDay()) % 7,
                         hour,
                         minute)

          if (result < now)
            result.setDate(result.getDate() + 7)
  
          return result
        }

        if ($("#ctl00_LoggedInUserType").html() == "customer") {
            //$("#divVETButtonsList *").prop("disabled", true)
            $("#btnARINVCallHS").hide();
            $("#btnARINVSpord").hide();
            $("#btnRequestID").hide();
            $("#divVETButtonsList").hide();
        }

        /*Show Payments dropdown in ARINVS pop-up :: ABI :: 22Jan2018*/
        //Muthu Nivetha M :: 02 Mar 19 :: VET - Vdrop hide :: Modified
        //if ($("#ctl00_LoggedInUserType").html() == "credit manager") {
        //if ($("#ctl00_LoggedInUserType").html().toLowerCase() == "credit manager") || ($("#ctl00_LoggedInUserType").html().toLowerCase() == "owner") {
        if (($("#ctl00_LoggedInUserType").html().toLowerCase() == "credit manager") || ($("#ctl00_LoggedInUserType").html().toLowerCase() == "owner")) {
            $("#ddlARINVPay").show();
            $("#btnVDrop").show();
        } else {
            $("#btnVDrop").hide();
        }

        if ($("#ctl00_LoggedInUserType").html() == "sales person") {
            $("#btnUpdateCustomer").show()
        }
        else {
            $("#btnUpdateCustomer").hide()
        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCustDetails.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivOrderCustDetails1Page").html(output.d);
                $("#DivVETCustDetailsPage").html(output.d);
                $("#txtCustSearch").focus()
            }
        });


        $(".DecimalsOnly").keypress(function (event) {
            return isDecimal(event, this)
        });


        // THE SCRIPT THAT CHECKS IF THE KEY PRESSED IS A NUMERIC OR DECIMAL VALUE.
        function isDecimal(evt, element) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            if (
                //(charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.
                (charCode != 46 || $(element).val().indexOf('.') != -1) && // “.” CHECK DOT, AND ONLY ONE.
                ((charCode != 8 && charCode < 48) || charCode > 57))
                return false;
            return true;
        }

        $(".NumbersOnly").keypress(function (event) {
            return isNumber(event, this)
        });
        // THE SCRIPT THAT CHECKS IF THE KEY PRESSED IS A NUMERIC OR DECIMAL VALUE.
        function isNumber(evt, element) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (
                //(charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.         
                ((charCode != 8 && charCode < 48) || charCode > 57))
                return false;
            return true;
        }

        $(".NegativDecimals").keypress(function (event) {
            return NegativDecimals(event, this)
        });

        function NegativDecimals(evt, element) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            if (
                (charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.
                (charCode != 46 || $(element).val().indexOf('.') != -1) && // “.” CHECK DOT, AND ONLY ONE.
                ((charCode != 8 && charCode < 48) || charCode > 57))
                return false;
            return true;
        }

        $(".NegativeNumbers").keypress(function (event) {
            return isNegativeNumber(event, this)
        });

        function isNegativeNumber(evt, element) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (
                (charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.         
                ((charCode != 8 && charCode < 48) || charCode > 57))
                return false;
            return true;
        }

        $('input').keypress(function (e) {
            //
            var key = e.which;
            if (key == 13) // the enter key code
            {

                for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                    var a;
                    if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                        a = i;
                    }
                    if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i) {
                        $(this).closest('tr').find('input')[i].focus();
                        return false;
                    }
                    else if ($(this).attr('id') == "txtCreditUnits") {
                        $("#txtCreditPrice").focus()
                        //if (CheckUnitsByTotUnits()) {
                        //}
                        return false;
                    }
                    else if ($(this).attr('id') == "txtCreditPrice") {
                        $("#txtCreditFreight").focus()
                        return false;
                    }
                    else if ($(this).attr('id') == "txtCreditFreight") {
                        $("#txtCreditFuel").focus()
                        return false;
                    }
                    else if ($(this).attr('id') == "txtCreditFuel") {
                        $("#txtCreditTaxes").focus()
                        return false;
                    }
                    else if ($(this).attr('id') == "txtCreditTaxes") {
                        $("#txtCreditControl").focus()
                        return false;
                    }
                    else if ($(this).attr('id') == "txtCreditControl") {
                        $("#lstCreditCode")[0].selectize.focus();
                        return false;
                    }
                    else if ($(this).attr('id') == "txtCreditReason2") {
                        $(".fileuploader-input-button").focus();
                        return false;
                    }

                    else if ($(this).attr('id') == "txtARINVDocsT") {
                        $("#txtARINVDocsD").focus();
                        return false;
                    }
                    else if ($(this).attr('id') == "txtARINVDocsD") {
                        $("#txtARINVDocsAddr").focus();
                        return false;
                    }
                    else if ($(this).attr('id') == "txtARINVDocsAddr") {
                        $("#btnAddARINVDocs")[0].focus();
                        return false;
                    }
                    else if ($(this).attr('id') == "txtARINVNotes") {
                        $("#btnAddARINVNotes")[0].focus();
                    }
                    else if ($(this).attr('id') == "txtARAdjustAmount") {
                        $("#txtARAdjustGL").focus();
                        return false;
                    }
                    else if ($(this).attr('id') == "txtARAdjustGL") {
                        $("#txtARAdjustDate").focus();
                        return false;
                    }
                    else if ($(this).attr('id') == "txtARAdjustDate") {
                        $("#txtARAdjustReason").focus();
                        return false;
                    }
                    else if ($(this).attr('id') == "txtARAdjustReason") {
                        $("#DialogARAdjustment").siblings('.ui-dialog-buttonpane').find("button:contains('Apply')").focus();
                        return false;
                    }
                }
            }
        });




        $("#txtCreditReason2").keypress(function (e) {
            if (e.keyCode == 13 && e.shiftKey) {
            }
            else if (e.keyCode == 13 && $(this).val().split("\n").length >= 5) {  /*Move the focus to Save button after pressing 5 enters on textarea control*/
                /* focus to upload the pictures
                $(".fileuploader-input-button").attr("tabindex", -1).focus();
                $(".fileuploader-input-button").attr("tabindex", -1).trigger("click");*/

                $("#DivCreditGridDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                e.preventDefault();
                return;
            }
        });

        $(".fileuploader-input-button:focus").keypress(function (e) {
            if (e.keyCode == 13) {
                $("#DivCreditGridDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").trigger("click");
            }
        });

        if ($("#ctl00_LoggedInUserType").html() == "customer") {
            IsCustomerUserType = true;
            $("#trCreditLot").hide();
            $("#trCreditDaterec").hide();
        }
        else {
            IsCustomerUserType = false;
        }


    });

    $("#DivArmelliniXMLLogs").dialog({
        autoOpen: false,
        resizable: false,
        width: 900,
        height: 400,
        modal: true,
    });

    $("[id^=lnkCarrierARXML_]").live("click", function (e) {
        //debugger;
        var rowid = $(this).attr('id').replace("lnkCarrierARXML_", "");
        var OrderNo = rowid
        var Carrier = $("#lnkCarrierARXML_" + OrderNo).html();
        $("#DivARLogSelectedRowID").html("0");
        $("#lblResendMessage").html("");
        $("#imgResend").hide();
        $("#fgrdArmelliniXMLLogs").empty();
        $("#fgrdArmelliniXMLLogs").flexOptions({ params: [{ name: 'Order', value: OrderNo }, { name: 'Carrier', value: Carrier }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();

        //var Title = "";
        //if (Carrier = "FB") {
        //    Title = "EDI Log For Order";
        //}
        //else {
        //    Title = "ARXML Log For Order";
        //}

        $("#DivArmelliniXMLLogs").dialog('option', 'title', 'EDI Log For Order :: <span id="ARXMLHeaderOrderNo">' + OrderNo + '</span>');
        //New armellini resend
        $("#DivArmelliniXMLLogs").data("inData", { ResendxmlOrderNo: OrderNo }).dialog("open");
    });


    $("#DivArmelliniXMLLogs").dialog({
        autoOpen: false,
        resizable: false,
        width: 900,
        height: 400,
        modal: true,
        //New armellini resend
        open: function () {
            //debugger;
            $("#hfResendXMLOrderNo").text($("#DivArmelliniXMLLogs").data("inData")["ResendxmlOrderNo"]);
        }
    });

    $("#fgrdArmelliniXMLLogs").flexigrid({
        url: 'BloomService.asmx/GetArmelliniXMLLogsByOrder',
        dataType: 'xml',
        colModel: [
            { display: 'ShipDate', name: 'ShipDate', width: 60, sortable: false, align: 'left', process: ARLogRowClick },
            { display: 'XMLFileName', name: 'XMLFileName', width: 70, sortable: false, align: 'left', process: ARLogRowClick },
            { display: 'ResponseMsg', name: 'Response Msg', width: 340, sortable: false, align: 'left', process: ARLogRowClick },
            { display: 'Status', name: 'Status', width: 70, sortable: false, align: 'left', process: ARLogRowClick },
            { display: 'Transmitted Time', name: 'DateTime', width: 110, sortable: false, align: 'left', process: ARLogRowClick },
            { display: 'Consignee', name: 'Consignee', width: 50, sortable: false, align: 'left', process: ARLogRowClick },
            { display: 'Boxno', name: 'Boxno', width: 80, sortable: false, align: 'left', process: ARLogRowClick },
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
        autoload: false,
        showTableToggleBtn: false,
        height: 250,
        width: 870,
        striped: true,
        params: [
            { name: 'Order', value: '0' }, { name: 'Carrier', value: '' }, { name: 'ExportCSV', value: '' }
        ],
        onSuccess: function () {

            var selectedrowid = $("#DivARLogSelectedRowID").html();
            if (selectedrowid == "0" || selectedrowid == "") {
                $("#fgrdArmelliniXMLLogs tr:first").addClass("trSelectedARXML");
                $("#DivARLogSelectedRowID").html($("#fgrdArmelliniXMLLogs tr:first").attr('id').replace('row', ''));
            }
            else {
                $("#fgrdArmelliniXMLLogs [id^=row]").removeClass("trSelectedARXML");
                $("#fgrdArmelliniXMLLogs #row" + selectedrowid).addClass("trSelectedARXML");
                $("#fgrdArmelliniXMLLogs td.unsorted").addClass("sorted");
                $("#fgrdArmelliniXMLLogs td.sorted").removeClass("unsorted");
                $("#fgrdArmelliniXMLLogs #row" + selectedrowid).removeClass("trSelected");
                $("#fgrdArmelliniXMLLogs #row" + selectedrowid + " td.sorted").addClass("unsorted");
                $("#fgrdArmelliniXMLLogs #row" + selectedrowid + " td.unsorted").removeClass("sorted");
            }
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });




    function ARLogRowClick(celDiv, id) {
        $(celDiv).click(function () {
            $("#DivARLogSelectedRowID").html(id.toString());
            $("#fgrdArmelliniXMLLogs [id^=row]").removeClass("trSelectedARXML");
            $("#fgrdArmelliniXMLLogs #row" + id).addClass("trSelectedARXML");
            $("#fgrdArmelliniXMLLogs td.unsorted").addClass("sorted");
            $("#fgrdArmelliniXMLLogs td.sorted").removeClass("unsorted");
            $("#fgrdArmelliniXMLLogs #row" + id).removeClass("trSelected");
            $("#fgrdArmelliniXMLLogs #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdArmelliniXMLLogs #row" + id + " td.unsorted").removeClass("sorted");
        });
    }

    $("#ChangeConsigneeInARXMLDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 300,
        height: 220,
        modal: true,
        title: 'Resend',
        buttons: {
            Send: function () {

                var CurrentSelectedRowID = $("#DivARLogSelectedRowID").html();
                var OldConsignee = $("#aConsigneeARXML_" + CurrentSelectedRowID).html();
                var OldShipdate = $("#aShipDateARXML_" + CurrentSelectedRowID).html();
                var UploadStatus = 0;
                if ($("#aXMLStatusARXML_" + CurrentSelectedRowID).html() == "Success") {
                    UploadStatus = true;
                }
                else {
                    UploadStatus = false;
                }

                var NewConsignee = $("#txtCongineeForARXML").val();
                if (NewConsignee == "")
                    NewConsignee = $("#txtCongineeForARXML").attr("Placeholder")
                if (NewConsignee == "") {
                    $(".ARXMLWarning").html("Please enter Consignee before resend..");
                    $(".ARXMLWarning").show();
                    $("#txtCongineeForARXML").focus();
                    return false;
                }

                var NewShipdate = $("#txtShipDateForARXML").val();
                if (NewShipdate == "") {
                    $(".ARXMLWarning").html("Please choose Shipdate before resend..");
                    $(".ARXMLWarning").show();
                    $("#txtShipDateForARXML").focus();
                    return false;
                }
                $(".ARXMLWarning").hide();

                //Get FileName From the Grid
                var FileName = $("#aXMLFileNameForARXML_" + CurrentSelectedRowID).html();
                var OldConsignee = $("#aConsigneeARXML_" + CurrentSelectedRowID).html();

                $("#lblResendMessage").html("");
                $("#ChangeConsigneeInARXMLDialog").dialog("close");
                $("#imgResend").show();
                $("#btnResendARXMLFile").removeClass('BloomButtonEnabled');
                $("#btnResendARXMLFile").addClass('BloomButtonDisabled');
                //New armellini resend
                var Carrier = $("#lnkCarrierARXML_" + $("#hfResendXMLOrderNo").text()).html();

                //data: "{'FileName':'" + FileName + "','OldConsignee':'" + OldConsignee + "','NewConsignee':'" + NewConsignee +
                //       "','UploadStatus':'" + UploadStatus + "','OldShipdate':'" + OldShipdate + "','NewShipdate':'" + NewShipdate + "'}",
                //contentType: "application/json; charset=utf-8",

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ResendARXMLFile',
                    data: "{'FileName':'" + FileName + "','OldConsignee':'" + OldConsignee + "','NewConsignee':'" + NewConsignee +
                        "','UploadStatus':'" + UploadStatus + "','OldShipdate':'" + OldShipdate + "','NewShipdate':'" + NewShipdate + "','OrderNo':'" + $("#hfResendXMLOrderNo").text() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $("#imgResend").hide();
                        $("#ChangeConsigneeInARXMLDialog").dialog("close");
                        $("#btnResendARXMLFile").addClass('BloomButtonEnabled');
                        $("#btnResendARXMLFile").removeClass('BloomButtonDisabled');
                        if (output.d == "success") {
                            //New armellini resend
                            $("#lblResendMessage").html("Success..");
                            $("#fgrdArmelliniXMLLogs").flexOptions({ params: [{ name: 'Order', value: $("#hfResendXMLOrderNo").text() }, { name: 'Carrier', value: Carrier }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                        }
                        else {
                            $("#lblResendMessage").html(output.d);
                        }
                    },
                });
            }
        },
        open: function () {
            $("#txtShipDateForARXML").show();
            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
        }
    });




    $("#btnResendARXMLFile").die("click").live("click", function (e) {

        $(".ARXMLWarning").hide();
        var CurrentSelectedRowID = $("#DivARLogSelectedRowID").html();

        //if ($("#aXMLStatusARXML_" + CurrentSelectedRowID).html() != "Success" && $("#aXMLStatusARXML_" + CurrentSelectedRowID).html().trim() != "Error") {
        //    $("#lblResendMessage").html("Can not resend exception file...");
        //    return false;
        //}
        $("#txtCongineeForARXML").val("");
        var OldConsignee = $("#aConsigneeARXML_" + CurrentSelectedRowID).html();
        $("#txtCongineeForARXML").attr("Placeholder", OldConsignee);
        $("#txtShipDateForARXML").val($("#aOrderDate_" + $("#ARXMLHeaderOrderNo").html()).html());
        //var OldShipDate = $("#aShipDateARXML_" + CurrentSelectedRowID).html();
        //$("#txtShipDateForARXML").val(OldShipDate);

        $("#txtShipDateForARXML").hide();
        $("#ChangeConsigneeInARXMLDialog").dialog("open");
    });

    $("#txtShipDateForARXML").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());



    $("#txtStatementDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("[id^=ARINVS_]").die('click').live("click", function (e) {
        debugger
        var Customer = $(this).attr('id').replace("ARINVS_", "");

        var IsKometSales = '<%=ConfigurationManager.AppSettings("IsKometSales").ToString() %>'
        if (IsKometSales.toUpperCase() != 'YES') {
            $('#btnRequestID').hide();
        }
        else {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustomerKometID',
                data: '{"CustomerNo":"' + Customer + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    if (parseInt(output.d) >= 0) {
                        $("#btnRequestID").attr('value', output.d);
                    }
                    else {
                        $("#btnRequestID").attr('value', 'Request ID');
                    }
                }

            });
        }



        $("#CurrentCustomerNo").html(Customer);
        LoadCustomerDetailsByCustNo(Customer)
        $("#fgrdARINVCustomer").empty();
        $("#fgrdARINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'IsARINVHistory', value: IsARINVHistory }], query: "", newp: 1 }).flexReload();
        $("#DivARINVCustomerGridDialog").dialog('option', 'title', 'ARINVS Info For Customer :: ' + Customer + '');
        $("#DivARINVCustomerGridDialog").data("Customer", Customer).dialog("open");
    });

    $("[id^=aCustomerARINVS_]").die('click').live("click", function (e) {

        var Customer = $(this).attr('id').replace("aCustomerARINVS_", "");
        $("#CurrentCustomerNo").html(Customer);
        LoadCustomerDetailsByCustNo(Customer);
        $("#fgrdOrderNewDetails").empty();
        $("#fgrdOrderNewDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }], query: "", newp: 1 }).flexReload();
        $("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER :: ' + Customer);
        $("#DivOrderNewDetailsDialog").dialog("open");
    });

    $("[id^=EmailedInvoiceSelect_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var SelectedInvoice = sourceCtl.context.id.split('_')[1];
        debugger;
        $("#fgrdEmailLogList").flexOptions({ params: [{ name: 'EmailType', value: 'INVOICE' }, { name: 'EmailedDocumentNumber', value: SelectedInvoice }], query: "", newp: 1 }).flexReload();

        $("#DivEmailLog").dialog('option', 'title', 'EMAIL LOG');
        $("#DivEmailLog").dialog("open");
    });

    var IsKometSales = '<%=ConfigurationManager.AppSettings("IsKometSales").ToString() %>'

    $("#DivARINVCustomerGridDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: (IsKometSales.toUpperCase() != 'YES') ? 1095 : 1185,
        height: $(window).height() - 30,
        modal: true,
        //closeOnEscape: false,
        focus: function () {
            $('#DivARINVCustomerGridDialog').closest('.ui-dialog').focus();
        },
        open: function () {
            debugger
            var Customer = $("#DivARINVCustomerGridDialog").data("Customer");
            if (($("#ctl00_LoggedInUserType").html().toLowerCase() == "credit manager") || ($("#ctl00_LoggedInUserType").html().toLowerCase() == "owner")) {
                $("#btnARINVNotes").show();
                $("#btnARINVDocs").show();
            }
            //get total adjustments//
            GetAdjustmentsTotalsForToday();
            /////
            GetCustDetailsPage(Customer, "", "DivARINVCustomerGridDialog");
            $("#DivARINVCustomerGridDialog").focus();
        },
        close: function () {
            debugger
            if ($("#txtInvSearch").val() != "") {
                $("#CustCurrentDivID").html("DivOrderDetailsDialog");
            }
            else {
                // alert($("#DivVETInvoiceGridDialog #ctl00_DivOrderNo_OrderSave").html());
                if ($("#DivVETInvoiceGridDialog #ctl00_DivOrderNo_OrderSave").html() == "" || $("#DivVETInvoiceGridDialog #ctl00_DivOrderNo_OrderSave").html() == null) {
                    if (($('#DivOrderNewDetailsDialog').dialog('isOpen')) == true) {
                        if (($('#DivOrderDetailsDialog').dialog('isOpen')) == true) {
                            $("#CustCurrentDivID").html("DivOrderDetailsDialog");
                        }
                        else {
                            $("#CustCurrentDivID").html("DivOrderNewDetailsDialog");
                        }

                        //Start Get Shipto info from session:Anand
                        $("#shipToNameView").html(sessionStorage.getItem("shipToNameViewSave"))
                        $("#shipToAddress1View").html(sessionStorage.getItem("shipToAddress1ViewSave"))
                        $("#shipToAddress2View").html(sessionStorage.getItem("shipToAddress2ViewSave"))
                        $("#shipToCityView").html(sessionStorage.getItem("shipToCityViewSave"))
                        $("#shipToStateView").html(sessionStorage.getItem("shipToStateViewSave"))
                        $("#shipToZipView").html(sessionStorage.getItem("shipToZipViewSave"))
                        $("#shipToPhoneView").html(sessionStorage.getItem("shipToPhoneViewSave"))
                        $("#shipToFaxView").html(sessionStorage.getItem("shipToFaxViewSave"))
                        $("#shipToContactView").html(sessionStorage.getItem("shipToContactViewSave"))
                        $("#shipToCountryView").html(sessionStorage.getItem("shipToCountryViewSave"))
                        //End Get Shipto info from session:Anand
                    }
                    else {
                        $("#CustCurrentDivID").html("DivOrderDetailsDialog");
                    }
                }
                else {
                    $("#CustCurrentDivID").html("DivOrderNewDetailsDialog");
                }


            }
            $("#txtCustSearch").val("");
            $("#txtInvSearch").val("");
            //RestoreDivOrder1InfoDialog();
            IsARINVHistory = "0";
            IsCustomerPageLoadedFirst = false;
            $("#ctl00_DivOrderNo_OrderSave").html($("#ctl00_DivOrderNo").html())
            carrierUpdate();
        },
        beforeClose: function (event, ui) {
            if ($("#msgbox-CustDelay").dialog('isOpen')) {
                return false;
            }
        }
    });

    function GetAdjustmentsTotalsForToday() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetAdjustmentsTotalsForToday',
            data: '',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //console.log(output.d);
                //console.dir(output);
                $("#txtTotalAdjustments").text(output.d.toFixed(2));
            }
        });
    }
    function PrintAdjustmentReportFromSales() {
        var w = window.open('GeneratingPDF.html');
        var d = new Date();

        var month = d.getMonth()+1;
        var day = d.getDate();

        var output = (('' + month).length < 2 ? '0' : '') + month + '/' + (('' + day).length < 2 ? '0' : '') + day + '/' + d.getFullYear();
            
            
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintARAdjustmentReport',
            data: "{'AdjustmentFromDate':'" + output + "','AdjustmentToDate':'" + output + "','AdjustmentDateType':'ByDateEntered','GL':'true'}",
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
                        $("#txtAdjustmentFromDate").val("");
                        $("#txtAdjustmentToDate").val("");
                        $("#txtAdjustmentFromDate").datepicker('setDate', ARSessionFromDt);
                        $("#txtAdjustmentToDate").datepicker('setDate', ARSessionToDt);
                    }
                    $("#DialogAdjustmentDate").dialog("close");
                }
            });
    }
      $("#imgPrintAdjustmentReports").die('click').live('click', function () {
         PrintAdjustmentReportFromSales();
        });
    function RestoreDivOrder1InfoDialog() {
        debugger
        $("#txtShippingDate_Or1").val(sessionStorage.getItem("shippingdatesave"));
        $("#txtCarrier_Or1").val(sessionStorage.getItem("carriersave"));
        $("#txtCutOfftime_Or1").val(sessionStorage.getItem("cutoffsave"));
        $("#txtAWB_Or1").val(sessionStorage.getItem("awbsave"));
        $("#txtCustPO_Or1").val(sessionStorage.getItem("posave"));
        $("#txtSalesMan_Or1").val(sessionStorage.getItem("smsave"));

        $("#txtCustMsg1").val(sessionStorage.setItem("cm1save"));
        $("#txtCustMsg2").val(sessionStorage.setItem("cm2save"));
        $("#txtCustMsg3").val(sessionStorage.setItem("cm3save"));
        $("#txtCustMsg4").val(sessionStorage.setItem("cm4save"));
        $("#txtCustMsg5").val(sessionStorage.setItem("cm5save"));

        $("#txtShipMsg1").val(sessionStorage.setItem("sm1save"));
        $("#txtShipMsg2").val(sessionStorage.setItem("sm2save"));
        $("#txtShipMsg3").val(sessionStorage.setItem("sm3save"));
        $("#txtShipMsg4").val(sessionStorage.setItem("sm4save"));
        $("#txtShipMsg5").val(sessionStorage.setItem("sm5save"));

        $("#DivVETCustDetailsPage .trOrderCustDet").find('.tdfsShipToInfo').remove();

        //var ShipToDiv = "<td class='tdfsShipToInfo'><fieldset class='fsShipToInfo' style='float: left; width: 285px; height: 96px;'><legend style='font-size: large; background: white;'>SHIP TO</legend>";
        //ShipToDiv += "<div class='DivOrderCustShipToDetails' style='margin-bottom:-4px;margin-top: -6px;'><table class='tblOrderCustShipToDetails'>";
        //ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>NAME</td><td colspan='3'><label id='shipToNameView' style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToNameViewSave") + "</label></td></tr>";
        //ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ADDRESS</td><td colspan='3'><label id='shipToAddress1View' style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToAddress1ViewSave") + "</label></td></tr>";
        //ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'></td><td colspan='3'><label id='shipToAddress2View' style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToAddress2ViewSave") + "</label></td></tr>";
        //ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>CITY</td><td style='width: 115px'><label id='shipToCityView' style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToCityViewSave") + "</label></td>";
        //ShipToDiv += "<td><label style='color: magenta; margin-right: 13px;'>STATE</label></td><td><label id='shipToStateView' style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToStateViewSave") + "</label></td></tr>";
        //ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ZIP</td><td><label id='shipToZipView' style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToZipViewSave") + "</label></td>";
        //ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>PHONE</label></td><td><label id='shipToPhoneView'  style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToPhoneViewSave") + "</label></td></tr>";
        //ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Fax</label></td><td><label id='shipToFaxView'  style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToFaxViewSave") + "</label></td></tr>";
        //ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Contact</label></td><td><label id='shipToContactView'  style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToContactViewSave") + "</label></td></tr>";
        //ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Country</label></td><td><label id='shipToCountryView'  style='color: black;white-space: nowrap;'>" + sessionStorage.getItem("shipToCountryViewSave") + "</label></td></tr>";
        //ShipToDiv += "<td><label style='color: magenta; margin-right: 7px; display:none;'>Store</label></td><td><label id='shipToView'  style='color: black;white-space: nowrap; display:none;'>" + sessionStorage.getItem("shipToView") + "</label></td></tr>";
        //ShipToDiv += "</table></div></fieldset></td>";

        //$("#DivVETCustDetailsPage .trOrderCustDet").append(ShipToDiv);

        //$("#DivVETCustDetailsPage").css('width', '1198px');

    }
    $("#fgrdARINVCustomer").flexigrid({
        url: 'BloomService.asmx/GetARINVDetailsForCustomerFgrd',
        dataType: 'xml',
        colModel: [
            { display: '<img style="Cursor:pointer;" id="ARINVselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
            { display: 'INV#', name: 'INV#', width: 40, sortable: true, align: 'center' },
            { display: 'Date', name: 'Date', width: 45, sortable: true, align: 'left' },
            { display: 'PO#', name: 'PO#', width: 70, sortable: true, align: 'left' },
            { display: 'Shipto', name: 'Shipto', width: 80, sortable: true, align: 'left' },
            { display: 'AWB', name: 'AWB', width: 85, sortable: true, align: 'center' },
            { display: 'CA', name: 'Carrier', width: 15, sortable: true, align: 'center', title: 'Carrier' },
            { display: 'WH', name: 'WH', width: 15, sortable: true, align: 'left', title: 'Warehouse' },
            { display: 'Charges', name: 'Charges', width: 75, sortable: true, align: 'right' },
            { display: 'Payments', name: 'Payments', width: 75, sortable: true, align: 'right' },
            { display: 'Credits', name: 'Credits', width: 70, sortable: true, align: 'right' },
            { display: 'Adjustments', name: 'Adjustments', width: 70, sortable: true, align: 'right' },
            { display: 'Balance', name: 'Balance', width: 70, sortable: true, align: 'right' },
            { display: 'Accum.Balance', name: 'Accum.Balance', width: 80, sortable: true, align: 'right' },
            { display: 'SLSMAN', name: 'SLSMAN', width: 50, sortable: true, align: 'left', hide: true },
            { display: 'EMAILED', name: 'EMAILED', width: 40, sortable: true, align: 'left' }
        ],
        searchitems: [
            { display: 'INV#', name: 'INV#' },
            { display: 'Date', name: 'Date' },
            { display: 'PO#', name: 'PO#' },
            { display: 'AWB', name: 'AWB' },
            { display: 'CA', name: 'Carrier' },
            { display: 'Shipto', name: 'Shipto' },
            { display: 'Wh', name: 'Wh' },
            { display: 'Charges', name: 'Charges' },
            { display: 'Payments', name: 'Payments' },
            { display: 'Credits', name: 'Credits' },
            { display: 'Balance', name: 'Balance' },
        ],
        showTableToggleBtn: true,
        sortname: "Invoice Asc",
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
        height: $(window).height() - 300,
        width: 1060,
        striped: true,

        params: [
            { name: 'ExportCSV', value: '' },
            { name: 'Customer', value: '0' },
            { name: 'IsARINVHistory', value: '0' },
        ],
        onSuccess: function () {
            var sel = jQuery("#fgrdARINVCustomer tbody tr");
            var len = sel.length;
            /*Export button hide for Customer usertype:: Added by Abinaya :: 06oct2017*/
            if ($("#ctl00_LoggedInUserType").html() == "customer" && len > 1) {
                $("#DivARINVCustomerGridDialog #ExportCSV").hide();
            }
            else {
                if (len > 1) {
                    $("#DivARINVCustomerGridDialog #ExportCSV").show();
                }
            }
            $('#fgrdARINVCustomer #row0').addClass("TotalRows")

            $('#fgrdARINVCustomer #row0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdARINVCustomer #row0 td:nth-child(7) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdARINVCustomer #row0 td:nth-child(8) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdARINVCustomer #row0 td:nth-child(9) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdARINVCustomer #row0 td:nth-child(10) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdARINVCustomer #row0 td:nth-child(11) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdARINVCustomer #row0 td:nth-child(12) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdARINVCustomer #row0 td:nth-child(13) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdARINVCustomer #row0 td:nth-child(14) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

            var wtf = $("#fgrdARINVCustomer").closest('div');
            var height = wtf[0].scrollHeight;
            wtf.scrollTop(height);
            GetAdjustmentsTotalsForToday();
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });

    $("#DivARINVCustomerGridDialog .sDiv").css('float', 'left').css('width', '580px');
    $('#DivARINVCustomerGridDialog .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivARINVCustomerGridDialog .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivARINVCustomerGridDialog .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivARINVCustomerGridDialog .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    $("#ARINVSFilterBalanceIsZero").die("click").live("click", function () {

        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        $(".ui-tooltip").hide();
        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
        }

    });



    var IsGPMYN = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(84, 1).ToString()%>' == "Y" ? true : false;
    $("#fgrdVETINVCustomer").flexigrid({
        url: 'BloomService.asmx/GetVETInvoiceDetailsList',
        dataType: 'xml',
        colModel: [
            { display: '<input type="image" style="Cursor:pointer;" id="VETOrderselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
            { display: '', name: 'Delete', width: 13, sortable: false, align: 'center', hide: IsCustomerUserType },
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'center', hide: IsCustomerUserType },
            { display: '', name: '', width: 13, sortable: false, align: 'left' },
            { display: 'RowNo', name: 'RowNo', width: 35, sortable: true, align: 'left', hide: true },
            { display: 'Flower', name: 'Flower', width: 70, sortable: true, align: 'left', hide: false },
            { display: 'Description', name: 'Desc', width: 180, sortable: true, align: 'left' },
            //{ display: 'SLS', name: 'SLSName', width: 30, sortable: true, align: 'left' }, ::commented by Abi on 08Nov2017 instr by jose
            { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left' },
            { display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left', hide: IsCustomerUserType },
            { display: 'Pieces', name: 'Boxes', width: 30, sortable: false, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 30, sortable: false, align: 'left' },
            { display: 'Units', name: 'Units', width: 30, sortable: false, align: 'right' },
            { display: 'TotalUnits', name: 'TotalUnits', width: 60, sortable: false, align: 'right' },
            { display: 'FOB', name: 'FOB', width: 50, sortable: false, align: 'right' },
            { display: 'Total $', name: 'TotPerLine', width: 60, sortable: true, align: 'right' },
            { display: 'Type', name: 'Type', width: 30, sortable: true, align: 'left' },
            { display: '%GPM', name: 'gpm', width: 40, sortable: true, align: 'right', hide: IsGPMYN == false ? true :IsCustomerUserType },
            { display: 'BoxNum', name: 'BoxNum', width: 40, sortable: true, align: 'left' },
            { display: 'Box Code', name: 'BoxCode', width: 60, sortable: true, align: 'left' },
            { display: 'UPC', name: 'UPC', width: 60, sortable: true, align: 'left' },
            { display: 'PODFlower', name: 'PODFlower', width: 60, sortable: true, align: 'left' },
            { display: 'Salesman', name: 'Salesman', width: 30, sortable: true, align: 'left', hide: true },
            { display: 'InvenID', name: 'InvenID', width: 50, sortable: true, align: 'left', hide: false },
        ],
        searchitems: [
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'Desc' },
            { display: 'SLS', name: 'SLSName' },
            { display: 'Farm', name: 'Farm' },
            { display: 'AWB', name: 'AWB' },
            { display: 'Pieces', name: 'Boxes' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Units', name: 'Units' },
            { display: 'TotalUnits', name: 'TotalUnits' },
            { display: 'Type', name: 'Type' },
            { display: 'BoxNum', name: 'BoxNum' },
            { display: 'Box Code', name: 'BoxCode' },
            { display: 'UPC', name: 'UPC' },
            { display: 'PODFlower', name: 'PODFlower' },
        ],
        showTableToggleBtn: true,
        sortname: "Flower Asc",
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
        height: $(window).height() - 270,
        width: 1185,
        striped: true,
        params: [
            //{ name: 'Filter', value: '' },
            { name: 'Invoice', value: '0' },
            { name: 'ExportCSV', value: '' },

        ],
        onSuccess: function () {
            $(".imgLoaderForUser").hide();

            var sel = jQuery("#fgrdVETINVCustomer tbody tr");
            var len = sel.length;
            /*Export button hide for Customer usertype:: Added by Abinaya :: 06oct2017*/
            if ($("#ctl00_LoggedInUserType").html() == "customer" && len > 1) {
                $("#DivVETInvoiceGridDialog #ExportCSV").hide();

            }
            else {
                if (len > 1) {
                    $("#DivVETInvoiceGridDialog #ExportCSV").show();
                }
            }
            //$("#DivVETInvoiceGridDialog select[name=lstsearch]").show();

            $('#fgrdVETINVCustomer #row0 td:nth-child(3) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdVETINVCustomer #row0 td:nth-child(8) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdVETINVCustomer #row0 td:nth-child(11) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdVETINVCustomer #row0 td:nth-child(13) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdVETINVCustomer #row0 td:nth-child(15) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

            $('#fgrdVETINVCustomer tr').each(function () {
                if ($(this).attr("id") == "row0") {
                    $(this).addClass("TotalRows");
                }
                else {
                    var AWB = $(this).find("td").eq(6).text().trim();
                    var PODFlower = $(this).find("td").eq(18).text().trim();//25

                    $(this).find("td:nth-child(n+5)").css('background-color', (AWB == "0" && PODFlower != "" ? "Green" : (AWB == "0" && PODFlower == "" ? "#D800D8" : "")));
                    $(this).find("td:nth-child(n+5)").css('color', (AWB == "0" && PODFlower != "" ? "white" : (AWB == "0" && PODFlower == "" ? "white" : "")));
                    $(this).find('td').removeClass('sorted');
                }
            });
        },

        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });
    $("#DivVETInvoiceGridDialog .sDiv").css('float', 'left').css('width', '590px');
    $('#DivVETInvoiceGridDialog .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivVETInvoiceGridDialog .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivVETInvoiceGridDialog .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivVETInvoiceGridDialog .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show()

    function LoadCustomerDetailsByCustNo(Customer) {
        GetCustDetailsPage(Customer, "", "DivARINVCustomerGridDialog");
        //GetCustDetailsPage(Customer, "" );
    }

    $("#ARINVselectall").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        var Query = $("#fgrdARINVCustomer").flexOptions()[0].p.query;
        var QueryType = $("#fgrdARINVCustomer").flexOptions()[0].p.qtype;

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            $('#fgrdARINVCustomer tr:visible').addClass("trChecked");
            $('#fgrdARINVCustomer tr#row0').removeClass("trChecked");
            $("[id^=ARINVselect_]:visible").prop("src", "images/check-on.png");
            $("[id^=ARINVselect_]:visible").attr('class', 'ARINVselected');
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $('#fgrdARINVCustomer tr').removeClass("trChecked");
            $("[id^=ARINVselect_]:visible").removeClass('ARINVselected');
            $("[id^=ARINVselect_]").prop("src", "images/check-off.png");
        }
    });

    $("[id^=ARINVselect_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("ARINVselect_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            sourceCtl.attr('class', 'ARINVselected');
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $("[id ^= ARINVselectall]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            sourceCtl.attr('class', 'unARINVselected');
        }

        var orderNos = [];
        var shipDates = [];
        $('#fgrdARINVCustomer tr:visible').each(function () {

            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    orderNos.push($(this).attr("id").substring(3));
                    var id = "#aOrderDate_" + $(this).attr("id").substring(3);
                    shipDates.push($(id).html());
                }
            }
        });
        //debugger;
        var Subject ='<%=ConfigurationManager.AppSettings("CompanyName").ToString()%>' + " Invoice No.";
        if (orderNos.length > 1) {
            Subject += orderNos.join(",");
        } else {
            Subject += orderNos[0] + " For shipping date " + shipDates[0].toString("MM-dd-yy");
        }

        $("#txtEmailSubjectDetail").val(Subject);
    });


    $("[id^=aVetInvoice_]").die("click").live("click", function (e) {

        var IsVoidedInvoice = "";
        var splitstr = $(this).attr('id').replace("aVetInvoice_", "").split('$');
        var CustomerNo = splitstr[1];
        var InvoiceNo = splitstr[0];
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetOrderDateByrderNo',
            data: '{"OrderNo":"' + InvoiceNo + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var data = output.d.VOID;
                IsVoidedInvoice = data.toString().toLowerCase() == "true" ? "VOIDED" : "";


                LoadVETCustomerDetailsByCustNo(CustomerNo, splitstr[2], "DivVETInvoiceGridDialog");

                //loadVETInvoiceGrid(splitstr[0]);
                $("#DivVETInvoiceNo").html(InvoiceNo);
                $("#fgrdVETINVCustomer").empty();
                $("#fgrdVETINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: splitstr[0].toString() }], query: "", newp: 1 }).flexReload();

                $("#DivVETInvoiceGridDialog").dialog('option', 'title', '<div> VET Details :: ' + InvoiceNo + '</div><div>' + IsVoidedInvoice + '</div>');
                //$("#DivVETInvoiceGridDialog").data('Invoice', InvoiceNo).dialog("open");
                $("#DivVETInvoiceGridDialog").data("inData", { Invoice: InvoiceNo, Customer: CustomerNo }).dialog("open");
                if (InvoiceNo != "") {
                    //$("#DivOrderDetailsDialog").dialog("close");
                }
            }
        });
    });

    var ControlNoForThisSession = '';

    $("#DivVETInvoiceGridDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 1230,
        height: $(window).height(),
        modal: true,
        open: function () {

            var InvoiceNo = $("#DivVETInvoiceGridDialog").data("inData")["Invoice"];
            var CustomerNo = $("#DivVETInvoiceGridDialog").data("inData")["Customer"];
            var IsVoided = "";

            ControlNoForThisSession = '';

            //21 Mar 19 :: Muthu Nivetha M :: URGENT-Vet invoice showing on View sales for Current Day :: Starts
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetOrderDateByrderNo',
                data: '{"OrderNo":"' + InvoiceNo + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    var OrderDate = output.d.ShippingDate;
                    IsVoided = output.d.VOID;
                    if (OrderDate == "") {
                        $("#DivVETInvoiceGridDialog .lblInvoiceDate1").html($.datepicker.formatDate('mm/dd/yy', new Date()));
                    }
                    else {
                        $("#DivVETInvoiceGridDialog .lblInvoiceDate1").html(OrderDate);
                    }
                    IsVoided = IsVoided.toString().toLowerCase() == "true" ? "VOIDED" : "";
                    var para = 'Customer=' + CustomerNo + '&OrderNo=' + InvoiceNo + '&CalledFromVET=' + "1" + '&IsVoidedOrder=' + IsVoided;
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetPage',
                        data: '{ "controlName":"pages/PageOrderSaveProcess.ascx","controlPara":"' + para + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            $("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
                            $("#DivOrderSavePage_VETDetail").html("");
                            $("#DivOrderSavePage_VETDetail").html(output.d);
                        }
                    });
                },
                error: function () {
                    $("#DivVETInvoiceGridDialog .lblInvoiceDate1").html(OrderDate);
                }
            });
            //21 Mar 19 :: Muthu Nivetha M :: URGENT-Vet invoice showing on View sales for Current Day :: Ends

        },
        close: function () {
            debugger
            $("#txtCustSearch").val("");
            $("#txtInvSearch").val("");
            $("#ctl00_DivCalledFromVET_OrderSave").html("");

            $("#ctl00_DivOrderNo_OrderSave").html("");
           // $("#fgrdARINVCustomer").flexReload({ url: '/url/for/refresh' });
            var DivVETCurrentDivID = $("#CustCurrentDivID").html();
            if (DivVETCurrentDivID == "DivOrderNewCustDetailsPage") {
                $("#CustCurrentDivID").html("DivOrderNewCustDetailsPage");
            }
            // else { $("#CustCurrentDivID").html("DivOrderDetailsDialog"); }


        },
    });

    function LoadVETCustomerDetailsByCustNo(Customer, InvDate, ARINVSDivId) {

        $("#trOrderVETCustDetails").show();
        GetCustDetailsPage(Customer, InvDate, ARINVSDivId)
    }

    $("#ARINVSStatementDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 500,
        modal: true,
        title: 'Statement',
        buttons: {
            Pdf: function () {

                var w = window.open('GeneratingPDF.html');

                var StatementDate = $("#txtStatementDate").val();
                var Customer = $("#CurrentCustomerNo").html();
                $("#ARINVSStatementDialog").next('div').find('.msgui').html("Printing...  <img src='images/ajax-loader.gif'");
                $("#ARINVSStatementDialog").next('div').find('.msgui').show();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SendStatementReportForCustomer',
                    data: "{'Customers':'" + $("#CurrentCustomerNo").html() + "','StatementDate':'" + StatementDate + "','EmailToIDs':'','SendEmailByOutlook':'0','EmailOrPDF':'PDF'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == null) {
                            $("#ARINVSStatementDialog").dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                        else {
                            var ReportsResult = output.d;
                            if (ReportsResult.length == 0) {
                                $("#ARINVSStatementDialog").dialog("close");
                                w.close();
                            }
                            else {
                                $("#ARINVSStatementDialog").dialog("close");
                                w.location = ReportsResult[0];//Report Path 
                                //2020/09/12
                                //w.location = ReportsResult.Result;//Report Path 
                            }
                        }

                    }
                });

            },
            Send: function () {
                if ($("#txtStatementEmailTo").val().trim() == "") {
                    $.MessageBox("Emailid is required!!!");
                    $("#txtStatementEmailTo").focus();
                    return;
                }

                var EmailToIDs = $("#txtStatementEmailTo").val();
                var StatementDate = $("#txtStatementDate").val();
                var Customer = $("#CurrentCustomerNo").html();
                $("#ARINVSStatementDialog").next('div').find('.msgui').show();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SendStatementReportForCustomer',
                    data: "{'Customers':'" + $("#CurrentCustomerNo").html() + "','StatementDate':'" + StatementDate + "','EmailToIDs':'" + EmailToIDs + "','SendEmailByOutlook':'0','EmailOrPDF':'Email'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == null) {
                            $("#ARINVSStatementDialog").dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                        else {
                            $("#ARINVSStatementDialog").dialog("close");
                        }
                    }
                });

            },

            Close: function () {
                $("#ARINVSStatementDialog").dialog("close");
            }
        },
        open: function () {
            //$("#txtStatementEmailTo").val($("#hf_CustEmail").text());
            $("#txtStatementDate").attr("disabled", false);
            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Pdf')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });


    $("#btnARINVStatement").die("click").live("click", function () {
        $("#txtStatementDate").attr("disabled", true);
        var DelType = '\'E\'';
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustomerDocumentsAddress',
            data: '{"CustomerNo": "' + $("#CurrentCustomerNo").html() + '","DocType":"S","DelType":"' + DelType + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                $("#txtStatementEmailTo").val(output.d)
                $("#ARINVSStatementDialog").next('div').find('.msgui').remove();
                $("#ARINVSStatementDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif'/> </div>").css('height', '35px');
                $("#ARINVSStatementDialog").dialog("open");
            }
        });

    });

    $("[id^=PrintCredit_]").die("click").live("click", function () {
        debugger
        var PrintCreReqID = $(this)[0].id.replace("PrintCredit_", "").split("~")[0]
        var PrintInvoiceId = $(this)[0].id.replace("PrintCredit_", "").split("~")[2]
        $("#DivCreditReqList").data("CreReqID", PrintCreReqID)
        $("#DivCreditReqList").data("PrintInvoiceId", PrintInvoiceId)
        $("#btnCrReqPrint").click();
    });


    $("[id^=editCredit_]").die("click").live("click", function () {
        var InvSplit = $(this)[0].id.replace("editCredit_", "").split("~");
        var CreditStatus = InvSplit[3];
        if (CreditStatus == "A") {
            $.MessageBox("Credit already approved, can not update it!!!");
        }
        else {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCreditDetailsFromCREREQ',
                data: "{'ID': '" + InvSplit[0] + "','VETID':'" + InvSplit[1] + "','Invoice':'" + InvSplit[2] + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    var res = output.d;

                    $("#lblCreditFlowerCode").text(res[0].Flower);
                    $("#lblCreditFlowerName").text(res[0].FlowerName);
                    $("#lblCreditFarmCode").text(res[0].Farm);
                    $("#lblCreditFarmName").text(res[0].FarmName);
                    $("#lblCreditAwb").text(res[0].AWB);
                    $("#lblCreditRecdate").text(res[0].DateRec);
                    $("#lblCreditDaysFresh").text(res[0].DaysFresh);
                    $("#lblCreditPO").text(res[0].PO)
                    $("#lblCreditInvoice").text(res[0].FarmInv);

                    $("#lblSoldTotalBoxes").text(res[0].Boxes);
                    $("#lblSoldUOM").text(res[0].UOM);
                    $("#lblSoldUnitsPerBox").text(res[0].Units);
                    $("#txtSoldTotalUnits").val(res[0].TotalUnits);
                    $("#txtSoldPricePerUnit").val(res[0].FOB.toFixed(4));

                    $("#txtCreditUnits").val("");
                    $("#txtCreditUnits").attr('placeholder', res[0].TotalUnits);
                    $("#txtCreditPrice").val("");
                    $("#txtCreditPrice").attr('placeholder', res[0].FOB.toFixed(4));
                    $("#txtCreditFreight").val("");
                    $("#txtCreditFreight").attr('placeholder', res[0].Freight.toFixed(2));
                    $("#txtCreditFuel").val("");
                    $("#txtCreditFuel").attr('placeholder', res[0].Fuel.toFixed(2));
                    $("#txtCreditTaxes").val("");
                    $("#txtCreditTaxes").attr('placeholder', res[0].Tax1.toFixed(2));

                    //var amt = parseFloat(res[0].TotalUnits * res[0].FOB.toFixed(4)).toFixed(2)
                    //var total = parseFloat(amt) + parseFloat(res[0].Freight.toFixed(2));

                    // var total = parseFloat(res[0].Tax1 + res[0].Price);

                    $("#txtCreditTotal").val(res[0].Price.toFixed(2));
                    //LoadCreditCode();
                    SelectizeFlag = "1";
                    //$("#hfCreditCode").val(res[0].CODE + '~' + res[0].REASON.split("~")[0]);
                    $("#hfCreditCode").val(res[0].CODE + '~' + res[0].CreditDesc);
                    J1_10($("#lstCreditCode")).selectize()[0].selectize.setValue($("#hfCreditCode").val());
                    //J1_10($("#lstCreditCode")).selectize()[0].selectize.setValue(res[0].CODE + '~' + res[0].REASON.split("~")[0]);
                    $("#txtCreditControl").val(res[0].ControlNum);

                    //$("#txtCreditReason1").val(res[0].REASON.split("~")[0]);
                    //$("#txtCreditReason2").val(res[0].REASON.split("~")[0] + "\n" + res[0].REASON.split("~")[1]);
                    if (res[0].REASON == "") {
                        $("#txtCreditReason2").val(res[0].CreditDesc);
                    }
                    else {
                        $("#txtCreditReason2").val(res[0].REASON);
                    }
                    Salesman = res[0].Salesman;
                    CreditVETID = res[0].VETID;
                    CREREQID = res[0].ID;
                    CreditFilenames = [];

                    CreditFileNames = res[0].ImageName;
                    if (CreditFileNames != "") {
                        var imgNameSplit = CreditFileNames.split(",");
                        for (var i = 0; i < imgNameSplit.length; i++) {
                            var ext = imgNameSplit[i].split(".")[1];
                            var str1 = { name: imgNameSplit[i], type: 'image/' + ext, size: '', file: 'CreditRequestImages/CREREQ/' + res[0].ID + '/' + imgNameSplit[i] }
                            var api = $.fileuploader.getInstance(input);
                            api.append(str1);
                        }
                    }

                    $("#DivCreditGridDialog").next('div').find('.msgui').remove();
                    $("#DivCreditGridDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
                    $("#DivCreditGridDialog").next('div').find(".msgui").css("width", '525px');
                    $("#DivCreditGridDialog").next('div').find('.msgui').hide();
                    $("#DivCreditGridDialog").dialog('option', 'title', 'Credit Request for Invoice :: ' + res[0].ORDER + ' VET_ID ::' + res[0].VETID + '');
                    $("#DivCreditGridDialog").data('VETID', res[0].VETID).dialog("open");
                }
            });
        }
    });

    /* Delete :: from Credits button */
    $("[id^=deleteCredit_]").die("click").live("click", function () {

        var InvSplit = $(this)[0].id.replace("deleteCredit_", "").split("~");
        var CreditStatus = InvSplit[3];
        if (CreditStatus == "A") {
            $.MessageBox("Credit already approved, can not delete this!!!");
        }
        //if ($("#ctl00_LoggedInUserType").html().toLowerCase() == "sales person") {
        //    $("#msgsavehtml").html("You don't have rights to delete Credit request.");
        //    $("#msgbox-save").dialog("open");
        //}
        else {
            $("#msgCreditDelhtml").html("Are you sure to Delete this Credit Request?");
            $("#msgbox-CreditDel").data("inData", { CREREQID: InvSplit[0], VETID: InvSplit[1] }).dialog("open");
        }
    });

    /* Alert Box :: Yes/No options for credit request Delete. Default-No(if user pressed Enter Key) */
    $("#msgbox-CreditDel").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {

                $(this).dialog("close");
                var CREREQID = $("#msgbox-CreditDel").data("inData")["CREREQID"]
                var VETID = $("#msgbox-CreditDel").data("inData")["VETID"];
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteCreditRequestDetails',
                    data: "{'CREREQID': '" + CREREQID + "','VETID':'" + VETID + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        var res = output.d;
                        if (output.d == "Success") {
                            $(".ui-dialog-buttonpane div.dialogProgress").hide();
                            $("#msgsavehtml").html("Request Deleted...");
                            $("#msgbox-save").dialog("open");
                            $("#fgrdCreditReqList").flexReload({ url: '/url/for/refresh' });
                            $("#fgrdVETINVCustomer").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                    }
                });
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



    /* Save Credit Request Details */
    $("#DivCreditGridDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 750,
        modal: true,
        position: [300, 30],
        buttons: {
            Save: function () {
                //if ($("#txtCreditReason1").val().trim() == "") {
                //    $("#DivCreditGridDialog").next('div').find(".msgui").html("Credit code is required");
                //    $("#DivCreditGridDialog").next('div').find('.msgui').show();
                //    $("#lstCreditCode")[0].selectize.focus();
                //    return false;
                //}

                //Commented by mani as soumya request to remove the restriction
                //if (CreditFilenames.length == 0) {
                //    $("#DivCreditGridDialog").next('div').find(".msgui").html("Pictures required");
                //    $("#DivCreditGridDialog").next('div').find('.msgui').show();
                //    return false;
                //}

                //if (CheckUnitsByTotUnits()) {

                if (ControlNoForThisSession != '') {
                    $("#SalesControlNum").html(ControlNoForThisSession);
                }
                else {
                    $("#SalesControlNum").html($("#txtCreditControl").val());
                }

                $("#msgDivCreditGridDialoghtml").html("Credit amount is $" + delimitNumbers($("#txtCreditTotal").val()));
                $("#msgbox-DivCreditGridDialog").dialog("open");
                //}



                //
                //if ($("#txtCreditControl").val().trim() == "") {
                //    GetControlNum($("#txtCreditControl").val());
                //}
                //else {                    
                //    $("#msgDivCreditGridDialoghtml").html("Credit amount is $" + delimitNumbers($("#txtCreditTotal").val()));
                //    $("#msgbox-DivCreditGridDialog").dialog("open");
                //}

            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
            $("#DivCreditGridDialog").find(".selectize-control").css({ "width": '555px', "position": 'absolute' });
            $("#DivCreditGridDialog").find(".selectize-dropdown-content").css({ "width": '35%' });
            $("#DivCreditGridDialog").dialog({ position: 'center' });
            $("#txtCreditUnits").focus();

            if (ControlNoForThisSession != '' && (CREREQID == "0" || CREREQID == "")) { // When apply new credit if sessioncontrol# already exist assign it on control# textbox 
                $("#txtCreditControl").val(ControlNoForThisSession);
            }

        },
        close: function () {

            var api = $.fileuploader.getInstance(input);
            api.reset();
        }
    });

    function delimitNumbers(str) {
        return (str + "").replace(/\b(\d+)((\.\d+)*)\b/g, function (a, b, c) {
            return (b.charAt(0) > 0 && !(c || ".").lastIndexOf(".") ? b.replace(/(\d)(?=(\d{3})+$)/g, "$1,") : b) + c;
        });
    }

    /* Alert Box :: Save/Cancel options for credit request save screen. */
    $("#msgbox-DivCreditGridDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Save: {
                text: "Save",
                id: "btnDivCreditGridDialog",
                click: function () {

                    if ($("#txtCreditControl").val().trim() == "") {
                        //debugger;
                        if (ControlNoForThisSession == '') {
                            GetControlNum($("#txtCreditControl").val());
                        }
                        else {
                            $("#SalesControlNum").html(ControlNoForThisSession);
                            SaveCreditDetails();
                        }
                    }
                    else {
                        $("#SalesControlNum").html($("#txtCreditControl").val().trim());
                        SaveCreditDetails();
                    }
                }
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $("#btnDivCreditGridDialog").addClass('dialogbuttonstyle icon-save');
            // $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
            //$(this).siblings('.ui-dialog-buttonpane').find("button:contains('No')").focus();
        }
    });

    function CheckUnitsByTotUnits() {


        var invoiceno = $("#DivGetInvoiceNo").html();
        var CurrentUnits = ($("#txtCreditUnits").val() == "") ? $("#txtCreditUnits").attr('placeholder') : $("#txtCreditUnits").val();
        var TotalUnits = $("#txtSoldTotalUnits").val();

        if (parseInt(CurrentUnits) > parseInt(TotalUnits) || parseInt(CurrentUnits) <= 0) {
            $("#DivCreditGridDialog").next('div').find('.msgui').hide();
            $("#DivCreditGridDialog").next('div').find(".msgui").css("width", $("#DivCreditGridDialog").width() - $('#DivCreditGridDialog').next('div').find(".ui-dialog-buttonset").width());
            $("#DivCreditGridDialog").next('div').find(".msgui").html('Invoice :: ' + invoiceno + ' has only ' + TotalUnits + ' available unit(s).');
            $("#DivCreditGridDialog").next('div').find('.msgui').show();
            //$("#txtCreditUnits").val(TotalUnits);
            return false;
        }
        else {
            return true;
        }

        //$.ajax({
        //    type: "POST",
        //    url: "BloomService.asmx/CheckCreditUnitLimits",
        //    data: "{'InvoiceNo':'" + invoiceno + "'}",
        //    contentType: "application/json;charset=utf-8",
        //    dataType: "json",
        //    success: function (output) {
        //        
        //        if (output.d != null) {
        //            
        //            var res = output.d;
        //            var getunitlimits = res;
        //            
        //            if (getunitlimits == 0) {
        //                if (parseInt(CurrentUnits) > parseInt(TotalUnits)) {
        //                    $("#DivCreditGridDialog").next('div').find('.msgui').hide();
        //                    $("#DivCreditGridDialog").next('div').find(".msgui").css("width", $("#DivCreditGridDialog").width() - $('#DivCreditGridDialog').next('div').find(".ui-dialog-buttonset").width());
        //                    $("#DivCreditGridDialog").next('div').find(".msgui").html('Invoice-No: ' + invoiceno + ' has only ' + TotalUnits + ' available unit(s).');
        //                    $("#DivCreditGridDialog").next('div').find('.msgui').show();
        //                }
        //            }
        //            else if (parseInt(TotalUnits) > getunitlimits) {
        //                var tempunits = parseInt(TotalUnits) - getunitlimits;
        //                if (parseInt(CurrentUnits) > tempunits) {
        //                    $("#DivCreditGridDialog").next('div').find('.msgui').hide();
        //                    $("#DivCreditGridDialog").next('div').find(".msgui").css("width", $("#DivCreditGridDialog").width() - $('#DivCreditGridDialog').next('div').find(".ui-dialog-buttonset").width());
        //                    $("#DivCreditGridDialog").next('div').find(".msgui").html('Invoice-No: ' + invoiceno + ' has only ' + tempunits + ' available unit(s).');
        //                    $("#DivCreditGridDialog").next('div').find('.msgui').show();
        //                    $("#txtCreditUnits").val(tempunits);
        //                }
        //            }
        //            else if (parseInt(TotalUnits) == getunitlimits) {
        //                $("#DivCreditGridDialog").next('div').find('.msgui').hide();
        //                $("#DivCreditGridDialog").next('div').find(".msgui").css("width", $("#DivCreditGridDialog").width() - $('#DivCreditGridDialog').next('div').find(".ui-dialog-buttonset").width());
        //                $("#DivCreditGridDialog").next('div').find(".msgui").html('Invoice-No: ' + invoiceno + ' has already credited with available unit(s) ' + TotalUnits + '.');
        //                $("#DivCreditGridDialog").next('div').find('.msgui').show();
        //                $("#txtCreditUnits").val(TotalUnits);
        //            }
        //        }
        //    }
        //});
    }

    function SaveCreditDetails() {

        $("#DivCreditGridDialog").next('div').find('.msgui').hide();
        $("#DivCreditGridDialog").next('div').find(".msgui").css("width", '525px');
        var ControlNum = $("#SalesControlNum").html();
        if (ControlNum == "") {
            ControlNum = 0;
        }
        var Id = $("#DivCreditGridDialog").data("VETID");
        var TotalUnits = ($("#txtCreditUnits").val() == "") ? $("#txtCreditUnits").attr('placeholder') : $("#txtCreditUnits").val();
        var Price = ($("#txtCreditPrice").val() == "") ? $("#txtCreditPrice").attr('placeholder') : $("#txtCreditPrice").val();
        var Freight = ($("#txtCreditFreight").val() == "") ? $("#txtCreditFreight").attr('placeholder') : $("#txtCreditFreight").val();
        var Fuel = ($("#txtCreditFuel").val() == "") ? $("#txtCreditFuel").attr('placeholder') : $("#txtCreditFuel").val();
        var Taxes = ($("#txtCreditTaxes").val() == "") ? $("#txtCreditTaxes").attr('placeholder') : $("#txtCreditTaxes").val();
        var CreditCode = $("#lstCreditCode")[0].value.split('~')[0].toString();
        var Reason = $("#txtCreditReason2").val();
        $("#msgbox-DivCreditGridDialog .ui-dialog-buttonpane div.dialogProgress").show();
        //$("#msgbox-DivCreditGridDialog .ui-dialog-buttonpane button:contains('Save')").attr("disabled", true).addClass("ui-state-disabled");
        $("#btnDivCreditGridDialog").attr("disabled", true).addClass("ui-state-disabled");
        let source = "";
        if ($("#ctl00_DivCalledFromVET_OrderSave").html() == "1") {
            source = "vet"
        } else {
            source = "order"
        }

        $.ajax({
            type: 'POST',
            url: 'BloomService.asmx/SaveCreditRequestDetails',
            data: "{'ID':" + Id + ",'TotalUnits':" + TotalUnits + ",'Price':" + Price + ",'Freight':" + Freight + ",'CreditCode':'" + CreditCode + "','Reason':'" + Reason + "','Control':" + ControlNum + ",'CreditFileNames':'" + CreditFilenames + "','CREREQID':'" + CREREQID + "','Fuel':'" + Fuel + "','Taxes':'" + Taxes + "','Source':'" + source + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var res = output.d;
                if (parseInt(output.d) >= 0) {
                    if (CREREQID == "0") {
                        $("#msg-CrePrev").dialog("close");
                        $("#msgbox-DivCreditGridDialog").dialog("close");
                        $("#DivCreditGridDialog").dialog("close");
                    }
                    else {
                        $("#msg-CrePrev").dialog("close");
                        $("#msgbox-DivCreditGridDialog").dialog("close");
                        $("#DivCreditGridDialog").dialog("close");
                    }
                    $(".ui-dialog-buttonpane div.dialogProgress").hide();

                    // Modified by: Subhajit On: 06-14-2022
                    var invoice = $("#DivVETInvoiceGridDialog").data("inData")["Invoice"];
                    //$("#fgrdCreditReqList").flexReload({ url: '/url/for/refresh' });
                    $("#fgrdCreditReqList").empty();
                    $("#fgrdCreditReqList").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: invoice }], query: "", newp: 1 }).flexReload();

                    $("#fgrdVETINVCustomer").flexReload({ url: '/url/for/refresh' });
                    //$("#msgbox-DivCreditGridDialog .ui-dialog-buttonpane button:contains('Save')").attr("disabled", false).removeClass("ui-state-disabled");
                    $("#btnDivCreditGridDialog").attr("disabled", false).removeClass("ui-state-disabled");
                }
                else {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });
    }

    /* Get Control# */
    function GetControlNum(Controlnum) {
        var SalesControlNum;
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetSlsmanControlNum",
            data: "{'Salesman':'" + Salesman + "'}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (output) {

                if (output.d != null) {
                    var res = output.d;
                    if (res[0].Control == "0")
                        res[0].Control = 1;
                    //SalesControlNum = parseInt(res[0].Control) + 1;
                    SalesControlNum = parseInt(res[0].Control);
                    $("#SalesControlNum").html(SalesControlNum);
                    var salesman = res[0].Salesman;
                    salesman = pad(salesman, 3)
                    var salescontrol = res[0].Control
                    salescontrol = pad(SalesControlNum, 5);
                    ControlNoForThisSession = SalesControlNum;
                    $("#msgPrev").html("Your Control # is " + salesman + "-" + salescontrol + "");
                    $("#msg-CrePrev").dialog("open");
                } else
                    $("#SalesControlNum").html("0");
            }
        });
    }

    function pad(str, max) {
        str = str.toString();
        return str.length < max ? pad("0" + str, max) : str;
    }

    /* Load Credit Request code with reason :: autocomplete */
    function LoadCreditCode() {

        var length = $('#lstCreditCode > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadCreditCode',
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    $('#lstCreditCode').empty();
                    var data = output.d;

                    for (var i in data) {
                        var res = data[i];
                        if (res.CODE != "") {
                            $('#lstCreditCode').append('<option value="' + res.CODE + '~' + res.REASON + '">' + res.CODE + '  [' + res.REASON + ']' + '</option>');
                        }
                    }
                    $("#hfCreditCode").val(data[0].CODE + '~' + data[0].REASON);
                    //$("#hfCreditCode").val(data[0].CODE);
                    $("#txtCreditReason2").val(data[0].REASON);
                    J1_10($("#lstCreditCode")).selectize({
                        onChange: function () {

                            if (SelectizeFlag == "1") {
                                $("#txtCreditUnits").focus();
                                SelectizeFlag = "0";
                            }
                            else {
                                var codesplit = $("#lstCreditCode")[0].value.split('~');
                                $("#txtCreditReason2").val(codesplit[1] + "\n");
                                //if (codesplit[0] != "0" && codesplit[0] != "") {
                                //    $("#txtCreditReason2").val(codesplit[1] + "\n");
                                //    //$("#txtCreditReason2").focus();                                    
                                //}
                                //else {
                                //    $("#txtCreditReason2").val(codesplit[1]);
                                //    //$('#txtCreditReason2').select().val('').val($("#txtCreditReason2").val() + "\n");

                                //}
                                moveCursorToEnd($('#txtCreditReason2'));
                                // $("#txtCreditReason2").focus();
                            }
                        }
                        //onEnter: function () {
                        //    alert('onenter');
                        //    $("#txtCreditReason2").focus();
                        //}
                    });
                    J1_10($("#lstCreditCode")).selectize()[0].selectize.setValue($("#hfCreditCode").val());
                },
            });
        }
        else {
            J1_10($("#lstCreditCode")).selectize()[0].selectize.setValue($("#hfCreditCode").val());
        }
    }

    /* Check credit request already applied or not for the selected VET ID & Invoice */
    $("[id^=credit_]").die("click").live("click", function () {
        if ($("#ctl00_LoggedUserType").html() == "customer") {
            $.MessageBox("Sorry... you have to call your sales person for a credit");
        }
        else {
            var InvSplit = $(this)[0].id.replace("credit_", "").split("~");
            var orderNo = 0;
            if (InvSplit.length > 1) {
                orderNo = InvSplit[1];
            } else {
                orderNo = $("#ctl00_DivOrderNo").html();
            }
            $("#DivGetInvoiceNo").html(orderNo);
            $("#fgrdVETINVCustomer [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdVETINVCustomer #row" + InvSplit[0]).addClass("trSelectedHeader");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/CheckCreditAppliedStatus',
                data: "{'ID': '" + InvSplit[0] + "','Order':'" + orderNo + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    var res = output.d;
                    if (res.length > 0) {
                        if (res[0].ErrorMessage == "Success") {
                            $("#msgCreditReqhtml").html("Already a credit request issued on this product.  Do you want to contine?");
                            //$("#msgCreditReqhtml").html("Already Credit applied. Reason :: " + res[0].REASON + ". Credit Amount:: " + res[0].Price.toFixed(2) + ". Do you want to add another credit?");
                            $("#msgbox-CreditReq").data("inData", { Id: InvSplit[0], Order: orderNo }).dialog("open");
                        }
                    }
                    else {
                        GetCreditRequestDetails(InvSplit[0], orderNo);
                    }
                }
            });
        }

    });
    /* Get credit request details :: Using VET_ID and Invoice */
    function GetCreditRequestDetails(Id, Order) {
        $("#msgbox-CreditReq").dialog("close");
        
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCreditDetails',
            data: "{'ID': '" + Id + "','Order':'" + Order + "','CalledFromVET':'" + $("#ctl00_DivCalledFromVET_OrderSave").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                var res = output.d;

                $("#lblCreditFlowerCode").text(res[0].Flower);
                $("#lblCreditFlowerName").text(res[0].FlowerName);
                $("#lblCreditFarmCode").text(res[0].Farm);
                $("#lblCreditFarmName").text(res[0].FarmName);
                $("#lblCreditAwb").text(res[0].AWB);
                $("#lblCreditRecdate").text(res[0].DateRec);
                $("#lblCreditDaysFresh").text(res[0].DaysFresh);
                $("#lblCreditPO").text(res[0].PO)
                $("#lblCreditInvoice").text(res[0].FarmInv);

                $("#lblSoldTotalBoxes").text(res[0].Boxes);
                $("#lblSoldUOM").text(res[0].UOM);
                $("#lblSoldUnitsPerBox").text(res[0].Units);
                $("#txtSoldTotalUnits").val(res[0].TotalUnits);
                $("#txtSoldPricePerUnit").val(res[0].FOB.toFixed(4));

                $("#txtCreditUnits").val("");
                $("#txtCreditUnits").attr('placeholder', res[0].TotalUnits);
                $("#txtCreditPrice").val("");
                $("#txtCreditPrice").attr('placeholder', res[0].FOB.toFixed(4));
                $("#txtCreditFreight").val("");
                $("#txtCreditFreight").attr('placeholder', res[0].Freight.toFixed(2));

                $("#txtCreditFuel").val("");
                $("#txtCreditFuel").attr('placeholder', res[0].Fuel.toFixed(2));
                $("#txtCreditTaxes").val("");
                $("#txtCreditTaxes").attr('placeholder', res[0].Tax1.toFixed(2));

                var amt = parseFloat(res[0].TotalUnits * res[0].FOB.toFixed(4)).toFixed(2)
                var total = parseFloat(amt) + parseFloat(res[0].Freight.toFixed(2)) + parseFloat(res[0].Fuel.toFixed(2)) + parseFloat(res[0].Tax1.toFixed(2));

                $("#txtCreditTotal").val(total.toFixed(2));
                $('#lstCreditCode').empty();
                SelectizeFlag = "1";
                LoadCreditCode();
                $("#txtCreditControl").val("");
                $("#txtCreditReason2").val("");
                Salesman = res[0].Salesman;
                CreditVETID = res[0].ID;
                CreditFilenames = [];
                CREREQID = 0;
                $("#DivCreditGridDialog").next('div').find('.msgui').remove();
                $("#DivCreditGridDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
                $("#DivCreditGridDialog").next('div').find(".msgui").css("width", '525px');
                $("#DivCreditGridDialog").next('div').find('.msgui').hide();
                $("#DivCreditGridDialog").dialog('option', 'title', 'Credit Request for Invoice :: ' + res[0].ORDER + ' VET_ID ::' + res[0].ID + '');
                $("#DivCreditGridDialog").data('VETID', res[0].ID).dialog("open");
            }
        });
    }

    //$("#txtCreditUnits").change(function (event) {

    //    var TotalUnits = $("#txtCreditUnits").val() == "" ? $("#txtCreditUnits").attr("Placeholder") : $("#txtCreditUnits").val();
    //    var Price = $("#txtCreditPrice").val() == "" ? $("#txtCreditPrice").attr("Placeholder") : $("#txtCreditPrice").val();
    //    var Freight = $("#txtCreditFreight").val() == "" ? $("#txtCreditFreight").attr("Placeholder") : $("#txtCreditFreight").val();
    //    if (TotalUnits != "" && Price != "" && Freight != "") {
    //        var amt = parseFloat(TotalUnits * Price).toFixed(2)
    //        var total = parseFloat(parseFloat(amt) + parseFloat(Freight)).toFixed(2);
    //        $("#txtCreditTotal").val(total);
    //    }
    //});

    //$("#txtCreditPrice").change(function (event) {

    //    var TotalUnits = $("#txtCreditUnits").val() == "" ? $("#txtCreditUnits").attr("Placeholder") : $("#txtCreditUnits").val();
    //    var Price = $("#txtCreditPrice").val() == "" ? $("#txtCreditPrice").attr("Placeholder") : $("#txtCreditPrice").val();
    //    var Freight = $("#txtCreditFreight").val() == "" ? $("#txtCreditFreight").attr("Placeholder") : $("#txtCreditFreight").val();
    //    if (TotalUnits != "" && Price != "" && Freight != "") {
    //        var amt = parseFloat(TotalUnits * Price).toFixed(2)
    //        var total = parseFloat(parseFloat(amt) + parseFloat(Freight)).toFixed(2);
    //        $("#txtCreditTotal").val(total);
    //    }
    //});

    //$("#txtCreditFreight").change(function (event) {

    //    var TotalUnits = $("#txtCreditUnits").val() == "" ? $("#txtCreditUnits").attr("Placeholder") : $("#txtCreditUnits").val();
    //    var Price = $("#txtCreditPrice").val() == "" ? $("#txtCreditPrice").attr("Placeholder") : $("#txtCreditPrice").val();
    //    var Freight = $("#txtCreditFreight").val() == "" ? $("#txtCreditFreight").attr("Placeholder") : $("#txtCreditFreight").val();
    //    if (TotalUnits != "" && Price != "" && Freight != "") {
    //        var amt = parseFloat(TotalUnits * Price).toFixed(2)
    //        var total = parseFloat(parseFloat(amt) + parseFloat(Freight)).toFixed(2);
    //        $("#txtCreditTotal").val(total);
    //    }
    //});

    $("#txtCreditFuel,#txtCreditFreight,#txtCreditTaxes,#txtCreditPrice,#txtCreditUnits").change(function (event) {
        var TotalUnits = $("#txtCreditUnits").val() == "" ? $("#txtCreditUnits").attr("Placeholder") : $("#txtCreditUnits").val();
        var Price = $("#txtCreditPrice").val() == "" ? $("#txtCreditPrice").attr("Placeholder") : $("#txtCreditPrice").val();
        var Freight = $("#txtCreditFreight").val() == "" ? $("#txtCreditFreight").attr("Placeholder") : $("#txtCreditFreight").val();
        var Fuel = $("#txtCreditFuel").val() == "" ? $("#txtCreditFuel").attr("Placeholder") : $("#txtCreditFuel").val();
        var Taxes = $("#txtCreditTaxes").val() == "" ? $("#txtCreditTaxes").attr("Placeholder") : $("#txtCreditTaxes").val();
        if (TotalUnits != "" && Price != "" && Freight != "" && Fuel != "" && Taxes != "") {
            var amt = parseFloat(TotalUnits * Price).toFixed(2)
            var total = parseFloat(parseFloat(amt) + parseFloat(Freight) + parseFloat(Fuel) + parseFloat(Taxes)).toFixed(2);
            $("#txtCreditTotal").val(total);
        }
    });

    /* FileUploader control */
    var input = $('#fileuploader3').fileuploader({
        extensions: ['jpg', 'jpeg', 'png', 'gif', 'bmp'],
        changeInput: ' ',
        theme: 'thumbnail',
        enableApi: true,
        addMore: true,
        limit: 10,
        thumbnails: {
            box: '<div class="fileuploader-items">\
                      <div class="fileuploader-items-list">\
                      <div class="fileuploader-thumbnails-input" style="border: 1px #a5a5a5 solid;height: 60px;width: 670px;background: #eee;"><div class="fileuploader-thumbnails-input-inner" style="margin-top:12px">\
                      <div class="fileuploader-input-button">\
                      <span>Upload Pictures</span></div></div></div>\
                      </div>\
                      </div>',
            item: '<div class="fileuploader-item" style="display:table-cell;vertical-align:middle;">\
                       <div class="fileuploader-item-inner"><a id="${name.split(".")[0]}" onclick=ShowPreview("${name.split(".")[0]}")>\
                       <div class="thumbnail-holder" id="divThumbPreview" title="${name}" style="cursor:pointer;"">${image}</div></a>\
                       <div class="actions-holder">\
                       <a class="fileuploader-action fileuploader-action-remove" title="Remove"><i class="remove"></i></a>\
                       </div>\
                       </div>\
                       </div>',
            startImageRenderer: false,
            canvasImage: false,
            _selectors: {
                list: '.fileuploader-items-list',
                item: '.fileuploader-item',
                start: '.fileuploader-action-start',
                retry: '.fileuploader-action-retry',
                remove: '.fileuploader-action-remove'
            },
            onItemShow: function (item, listEl) {

                var plusInput = listEl.find('.fileuploader-thumbnails-input');

                plusInput.insertAfter(item.html);

                if (item.format == 'image') {
                    item.html.find('.fileuploader-item-icon').hide();
                    //CreditFilenames.push(item.name);
                    CreditFilenames.push(item.name = item.name.replace(/ /g, ''));
                    //if (CreditFileNames.indexOf(item.name) != -1)
                    //    CreditFilenames.push(item.name);
                }
            }
        },
        onItemRemove: function (html) {

            html.children().animate({ 'opacity': 0 }, 200, function () {
                setTimeout(function () {
                    html.slideUp(200, function () {
                        html.remove();
                    });
                }, 100);
            });
        },
        afterRender: function (listEl, parentEl, newInputEl, inputEl) {

            var plusInput = listEl.find('.fileuploader-thumbnails-input'),
                api = $.fileuploader.getInstance(inputEl.get(0));

            plusInput.on('click', function () {
                api.open();
            });
        },
        onRemove: function (item, listEl, parentEl, newInputEl, inputEl) {
            var CreditID, CreditFrom;
            CreditFilenames.splice(CreditFilenames.indexOf(item.name), 1)
            if (CREREQID != "0" || CREREQID != "") {
                CreditID = CREREQID;
                CreditFrom = "CREREQ";
            }
            else {
                CreditID = CreditVETID;
                CreditFrom = "VET";
            }
            $.ajax({
                url: "DeleteCreditReq.aspx",
                type: 'post',
                data: { ID: CreditID, FileName: item.name, IDFrom: CreditFrom },
                success: function (response) {
                }
            });
            /*Remove image from table*/
            if (CREREQID != "0" || CREREQID != "") {
                $.ajax({
                    type: 'POST',
                    url: 'BloomService.asmx/RemoveCreditRequestPic',
                    data: "{'ID':" + CREREQID + ",'VETID':" + CreditVETID + ",'FileName':'" + item.name + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                    }
                });
            }
            return true;
        },
        upload: {
            url: "UploadCreditReq.aspx",
            data: {},
            type: 'POST',
            enctype: "multipart/form-data",
            start: true,
            synchron: true,
            beforeSend: function (item, listEl, parentEl, newInputEl, inputEl) {
                if (CREREQID != "0" || CREREQID != "") {
                    item.upload.data.ID = CREREQID;
                    item.upload.data.IDFrom = "CREREQ"
                }
                else {
                    item.upload.data.ID = CreditVETID;
                    item.upload.data.IDFrom = "VET"
                }
                return true;
            },
            onSuccess: function (data, item) {

                $("#DivCreditGridDialog").next('div').find('.msgui').hide();
                setTimeout(function () {

                    if (data == "Nil") {
                        item.remove();
                    }
                    else {
                        item.html.find('.progress-holder').hide();
                        item.renderImage();
                    }

                }, 400);

            },
            onError: function (item) {
                item.html.find('.progress-holder').hide();
                item.html.find('.fileuploader-item-icon i').text('Failed!');

                setTimeout(function () {
                    item.remove();
                }, 1500);
            },
            onProgress: function (data, item) {
                var progressBar = item.html.find('.progress-holder');

                if (progressBar.length > 0) {
                    progressBar.show();
                    progressBar.find('.fileuploader-progressbar .bar').width(data.percentage + "%");
                }
            },
            onComplete: function (listEl, parentEl, newInputEl, inputEl, jqXHR, textStatus) {
            }
        },
        dragDrop: {
            container: '.fileuploader-thumbnails-input'
        },
    });

    $('.expand-pre').on('click', function () {
        $(this).prev('pre').css('max-height', 'none');
        $(this).remove();
    });

    /* Alert Box :: Yes/No options for credit request apply screen. Default-No(if user pressed Enter Key) */
    $("#msgbox-CreditReq").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {

                var Id = $("#msgbox-CreditReq").data("inData")["Id"]
                var Order = $("#msgbox-CreditReq").data("inData")["Order"];
                GetCreditRequestDetails(Id, Order);
            },
            No: function () {
                //alert('c');
                $(this).dialog("close");
            }
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            //$(this).siblings('.ui-dialog-buttonpane').find("button:contains('No')").focus();
        }
    });

    /* Alert box :: Credit Request Save */
    $("#msgbox-save").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
                $("#DivCreditGridDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });


    $("#msg-CrePrev").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
                if ($('#DivCreditGridDialog').dialog('isOpen') == true) {
                    //$("#msgDivCreditGridDialoghtml").html("Credit amount is $" + delimitNumbers($("#txtCreditTotal").val()));
                    //$("#msgbox-DivCreditGridDialog").dialog("open");
                    SaveCreditDetails();
                }
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });
    function ShowPreview(imgName) {

        //alert('hi');
        //$("#msgPrev").html("<img src=CreditRequestImages\'" + $("#divThumbPreview").find("img").attr("title") + "'/>");
        //$("#msg-CrePrev").dialog("open");
        window.open($("#" + imgName + "").find("img").attr("src"), '_blank');
    }

    /* Credits button :: to show full list of credit request for selected invoice */
    $("#btnVETCredits").click("live", function () {

        //var invoice = $("#DivVETInvoiceGridDialog").data("Invoice");
        var invoice = $("#DivVETInvoiceGridDialog").data("inData")["Invoice"];

        $("#fgrdCreditReqList").empty();
        $("#fgrdCreditReqList").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: invoice }], query: "", newp: 1 }).flexReload();

        $("#DivCreditReqList").dialog('option', 'title', 'Credit Request List for Invoice :: ' + invoice + '');
        $("#DivCreditReqList").data("Invoice", invoice).dialog("open");
    });

    /* Div for credit request list of the invoice :: by click on Credits button */
    $("#DivCreditReqList").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 965,
        height: 550,
        modal: true,
        buttons: {
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    /* show credit request list for the invoice :: by click on Credits button */
    $("#fgrdCreditReqList").flexigrid({
        url: 'BloomService.asmx/GetCreditRequestInvoiceDetailsList',
        dataType: 'xml',
        colModel: [
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },//0
            { display: '', name: 'Delete', width: 15, sortable: false, align: 'center' },//1
            { display: 'RowNo', name: 'RowNo', width: 35, sortable: true, align: 'left', hide: true },//2
            { display: 'Invoice', name: 'Order', width: 50, sortable: true, align: 'left' },//3
            { display: 'Control', name: 'ControlNum', width: 30, sortable: true, align: 'left' },//4
            { display: 'CreditDate', name: 'ADDDATE', width: 60, sortable: true, align: 'left' },//5
            { display: 'InvoiceDate', name: 'Date1', width: 60, sortable: true, align: 'left' },//5
            { display: 'Farm', name: 'Farm', width: 30, sortable: false, align: 'left' },//6
            { display: 'DF', name: 'DaysFresh', width: 30, sortable: true, align: 'left', title: 'Days Fresh' },//7
            { display: 'DI', name: 'DaysCredit', width: 30, sortable: true, align: 'left', title: 'Days credit was applied' },//8
            { display: 'Description', name: 'FlowerName', width: 170, sortable: false, align: 'left' },//9
            { display: 'Units', name: 'Units', width: 60, sortable: false, align: 'right' },//10
            { display: 'Amount', name: 'Price', width: 60, sortable: false, align: 'right' },//11
            { display: 'Status', name: 'Status', width: 30, sortable: false, align: 'center' },//12
            { display: 'Applied', name: 'Applied', width: 30, sortable: true, align: 'center' },//13
            { display: 'Reason', name: 'Reason', width: 150, sortable: true, align: 'left' },//14
        ],
        searchitems: [
            { display: 'Description', name: 'Desc' },
            { display: 'Units', name: 'Units' },
        ],
        showTableToggleBtn: true,
        sortname: "Farm Asc",
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
        height: 400,
        width: 940,
        striped: true,
        params: [
            { name: 'Invoice', value: '0' },
            { name: 'ExportCSV', value: '' },

        ],
        onSuccess: function () {
            $(".imgLoaderForUser").hide();

            var sel = jQuery("#fgrdCredtitReqList tbody tr");
            var len = sel.length;
            if (len > 1) {
                $("#DivCreditReqList #ExportCSV").show();
            }
            $('#fgrdCreditReqList #row0').addClass("TotalRows")
            $('#fgrdCreditReqList #row0 td:nth-child(7) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdCreditReqList #row0 td:nth-child(12) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            $('#fgrdCreditReqList #row0 td:nth-child(13) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });

    $("#DivCreditReqList .sDiv").css('float', 'left').css('width', '545px');
    $('#DivCreditReqList .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivCreditReqList .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivCreditReqList .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivCreditReqList .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show()



    $("#btnARINVEmail").die("click").live("click", function () {


        //var orderNos = [];
        //$('#fgrdARINVCustomer tr:visible').each(function () {
        //    
        //    if ($(this).attr("id") != "row0") {
        //        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
        //            orderNos.push($(this).attr("id").substring(3));
        //        }
        //    }
        //});

        if ($("#fgrdARINVCustomer .trChecked").length == 0) {
            $.MessageBox("Please select an invoice to email");
            return 0;
        }
        else {
            $("#hfEmailorFax").text("Email")
            $(".Emailsection").show();
            $(".Faxsection").hide();
            var DelType = '\'E\'';  // Remove fax when emailing :: var DelType = '\'E\''+ ',' + '\'F\''; :: modified by Abinaya :: 12Jul2018
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustomerDocumentsAddress',
                data: '{"CustomerNo": "' + $("#CurrentCustomerNo").html() + '","DocType":"I","DelType":"' + DelType + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    $("#txtEmailIDsForInvoice").val(output.d)
                    $("#DialogEmailOrFaxtheInvoice").dialog('option', 'title', 'Email To');
                    $("#DialogEmailOrFaxtheInvoice").dialog("option", "width", 500);
                    $("#DialogEmailOrFaxtheInvoice").dialog("option", "height", 380);
                    $("#DialogEmailOrFaxtheInvoice").next('div').find('.msgui').remove();
                    $("#DialogEmailOrFaxtheInvoice").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif' </div>").css('height', '35px');
                    $("#DialogEmailOrFaxtheInvoice").dialog("open");
                }
            });
        }
    });

    $("#btnARINVFax").die("click").live("click", function () {


        if ($("#fgrdARINVCustomer .trChecked").length == 0) {
            $.MessageBox("Please select an invoice to email");
            return 0;
        }
        else {
            $("#hfEmailorFax").text("Fax")
            $(".Emailsection").hide();
            $(".Faxsection").show();
            var DelType = '\'F\'';
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustomerDocumentsAddress',
                data: '{"CustomerNo": "' + $("#CurrentCustomerNo").html() + '","DocType":"I","DelType":"' + DelType + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    var res = output.d;
                    $("#txtFaxForInvoice").val(res);
                    //$("#txtFaxForInvoice").val(res.Fax.replace("-", ""));
                    $("#DialogEmailOrFaxtheInvoice").dialog("option", "width", 300);
                    $("#DialogEmailOrFaxtheInvoice").dialog("option", "height", 150);
                    $("#DialogEmailOrFaxtheInvoice").dialog('option', 'title', 'Fax To');
                    $("#DialogEmailOrFaxtheInvoice").next('div').find('.msgui').remove();
                    $("#DialogEmailOrFaxtheInvoice").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif'</div>").css('height', '35px');
                    $("#DialogEmailOrFaxtheInvoice").dialog("open");
                }
            });
            //var res = GetSalesOrderCustomerDetails($("#CurrentCustomerNo").html());     // Fax get from GetCustomerDocumentAddress not from cust detail


        }
    });

    $("#btnARINVPDF,#btnARINVPrint").die("click").live("click", function () {

        var orderNos = [];
        $('#fgrdARINVCustomer tr:visible').each(function () {

            if ($(this).attr("id") != "row0") {
                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                    orderNos.push($(this).attr("id").substring(3));
                }
            }
        });

        if (orderNos.length == 0) {
            $.MessageBox("Please select an invoice");
            return 0;
        }
        else {
            orderNos.join(',');
        }
        if ($(this).attr('id') == "btnARINVPrint") {
            PrintInvoiceReportForVET("Print", orderNos, "", "", "", true, '');
        }
        else {
            PrintInvoiceReportForVET("PDF", orderNos, "", "", "", true, '');
        }
    });



    //MANI::04-JUN-2016::Confirmation Dialog Before Transfer User 
    $("#DialogEmailOrFaxtheInvoice").dialog({
        autoOpen: false,
        resizable: false,
        width: 500,
        modal: true,
        title: 'Email To',
        buttons: {
            Send: function () {

                if ($("#txtEmailIDsForInvoice").val().trim() == "" && $("#hfEmailorFax").text() == "Email") {
                    $.MessageBox("Emailid is required!!!");
                    $("#txtEmailIDsForInvoice").focus();
                    return;
                }

                if ($("#txtFaxForInvoice").val().trim() == "" && $("#hfEmailorFax").text() == "Fax") {
                    $.MessageBox("Fax# is required!!!");
                    $("#txtFaxForInvoice").focus();
                    return;
                }

                var EmailID = ''
                if ($("#hfEmailorFax").text() == "Email") {
                    EmailID = $("#txtEmailIDsForInvoice").val();
                }
                else {
                    var FaxNo = $("#txtFaxForInvoice").val();
                    EmailID = FaxNo + "@faxage.com"
                }

                var Subject = $("#txtEmailSubjectDetail").val();
                var Body = $("#txtEmailBodyDetail").val();

                var orderNos = [];
                $('#fgrdARINVCustomer tr:visible').each(function () {

                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                            orderNos.push($(this).attr("id").substring(3));
                        }
                    }
                });

                if (orderNos.length == 0) {
                    $.MessageBox("Please select an invoice to email");
                    return 0;
                }
                else {
                    orderNos.join(',');
                }

                $("#DialogEmailOrFaxtheInvoice").next('div').find('.msgui').show();
                var SendOneByOne = 0;
                if ($('#chkSendInvoicesOneByOne').is(':checked')) {
                    SendOneByOne = 1;
                }

                $("#DivPOHeader").next('div').find('.msgui').show();
                if (SendOneByOne == 1) {


                    $.each(orderNos, function (i, OrderNo) {

                        var CloseDialog = false;
                        if (i === orderNos.length - 1) {
                            $("#fgrdARINVCustomer").flexReload({ url: '/url/for/refresh' });
                            CloseDialog = true;
                        }
                        PrintInvoiceReportForVET("Email", OrderNo, EmailID, Subject, Body, CloseDialog, '');

                    });
                }
                else {

                    PrintInvoiceReportForVET("Email", orderNos, EmailID, Subject, Body, true, '');
                    $("#fgrdARINVCustomer").flexReload({ url: '/url/for/refresh' });
                }


            },
            Close: function () {

                $("#DialogEmailOrFaxtheInvoice").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
            //$("#txtEmailIDsForInvoice").val($(".hf_CustEmail").text());
            //$("#txtFaxForInvoice").val($(".hf_CustFax").text());
        },
    });

    function PrintInvoiceReportForVET(type, orderNos, EmailID, Subject, Body, CloseDialog, CustName) {

        if (type == "PDF" || type == "Print") {
            //if (type == "PDF") {
            var w = window.open('GeneratingPDF.html');
        }
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInvoiceReportForVET',
            data: "{'Invoice': '" + orderNos + "','EmailIDs':'" + EmailID + "','Subject':'" + Subject + "','Body':'" + Body + "','Type':'" + type + "','CustName':'" + CustName + "'}",
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
                    if (CloseDialog == "ARINVSSavePDF") {
                        $("#msgbox-download").dialog("close");
                    }
                    $.MessageBox("No Data");
                    w.close();
                }
                else if (output.d == "No Order Found") {
                    $.MessageBox("Order Not Found");
                    w.close();
                }
                else {
                    //2020/09/12
                    //var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    if (type == "PDF") {
                        w.location = ExportedPath;
                    }
                    else if (type == "Print") {
                        w.location = ExportedPath;
                        //w.load(function () {
                        //    w.print();
                        //});

                    }
                    if (CloseDialog == "ARINVSSavePDF") {
                        $("#msgbox-download").dialog("close");
                        // Download pdf to Downloads folder
                        var link = document.createElement("a");
                        link.setAttribute("href", ExportedPath);
                        link.setAttribute("download", ExportedPath);

                        var clickEvent = document.createEvent("MouseEvent");
                        clickEvent.initEvent("click", true, true);
                        link.dispatchEvent(clickEvent);
                    }
                }
                if (CloseDialog == true) {
                    $("#DialogEmailOrFaxtheInvoice").dialog("close");
                }
                else if (CloseDialog == "VETEmailOrFaxClose") {
                    $("#DialogEmailOrFaxtheIndividualInv").dialog("close");
                }
                //else if(CloseDialog=="ARINVSSavePDF"){
                //    $("#msgbox-download").dialog("close");
                //}
            }
        });

    }



    $("#btnARINVViewPayments").die("click").live("click", function () {
        debugger
        $("#DialogViewPayments").dialog("open");
        $("#DialogViewPayments").dialog('option', 'title', 'Payments For Customer:: ' + $("#CurrentCustomerNo").html() + '');

        $("#DivARCHECKSelectedHeaderRowID").html("");
        $("#fgrdARINVSViewPaymentsHeader").empty();
        $("#fgrdARINVSViewPaymentsHeader").flexOptions({
            params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
            { name: 'ExportCSV', value: '' }], query: "", newp: 1
        }).flexReload();


    });

    $("#DialogViewPayments").dialog({
        autoOpen: false,
        resizable: false,
        title: 'ViewPayments',
        width: 870,
        height: 550,
        modal: true,
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

    $("#fgrdARINVSViewPaymentsHeader").flexigrid({
        url: 'BloomService.asmx/GetARINVSViewPaymentsHeaderByCustomer',
        dataType: 'xml',
        colModel: [
            { display: '', name: '', width: 50, sortable: false, align: 'left', process: ARCheckHeaderRowClick },
            { display: 'Reference#', name: 'Check', width: 85, sortable: true, align: 'left', process: ARCheckHeaderRowClick },
            { display: 'Date', name: 'Date', width: 60, sortable: false, align: 'left', process: ARCheckHeaderRowClick },
            { display: 'Amount', name: 'Amount', width: 80, sortable: true, align: 'right', process: ARCheckHeaderRowClick },
            { display: 'Deposit', name: 'Deposit', width: 50, sortable: true, align: 'right', process: ARCheckHeaderRowClick },
            { display: '', name: '', width: 15, sortable: true, align: 'center' }
        ],
        showTableToggleBtn: true,
        sortname: "Date Asc",
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
        height: 350,
        width: 430,
        striped: true,
        searchitems: [
            { display: 'Reference#', name: 'Check' },
            { display: 'Date', name: 'Date' },
            { display: 'Amount', name: 'Amount' }
        ],
        params: [
            { name: 'Customer', value: '0' }, { name: 'ExportCSV', value: '' }
        ],
        onSuccess: function () {
            debugger

            var selectedrowid = $("#DivARCHECKSelectedHeaderRowID").html();
            if (selectedrowid == "0" || selectedrowid == "") {
                $("#fgrdARINVSViewPaymentsHeader tr:first").addClass("trSelectedCheck");
                if ($("#DivARCHECKSelectedHeaderRowID").html($("#fgrdARINVSViewPaymentsHeader tr:first").attr("id")).html() == "") {
                    $("#DivARCHECKSelectedHeaderRowID").html($("#fgrdARINVSViewPaymentsHeader tr:first").attr('id'))
                }
                else {
                    $("#DivARCHECKSelectedHeaderRowID").html($("#fgrdARINVSViewPaymentsHeader tr:first").attr('id').replace('row', ''));
                }
                var check = $("#DivARCHECKSelectedHeaderRowID").html().split("_")[0]
                var RecDate = $("#DivARCHECKSelectedHeaderRowID").html().split("_")[1]
                if ($("#DivARCHECKSelectedHeaderRowID").html() == "") {
                    RecDate = ""
                }
                else {
                    RecDate = RecDate.substring(0, 2) + "/" + RecDate.substring(2, 4) + "/" + RecDate.substring(4, 6)
                }
                $("#fgrdARINVSViewPaymentsDetails").empty();
                $("#fgrdARINVSViewPaymentsDetails").flexOptions({
                    params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                            { name: 'Check', value: check },
                            { name: 'RecDate', value: RecDate },
                        { name: 'ExportCSV', value: '' },
                        { name: 'Deposit', value: '0' },
                    ], query: "", newp: 1
                }).flexReload();
            }
            else {
                $("#fgrdARINVSViewPaymentsHeader [id^=row]").removeClass("trSelectedCheck");
                $("#fgrdARINVSViewPaymentsHeader #row" + selectedrowid).addClass("trSelectedCheck");
                $("#fgrdARINVSViewPaymentsHeader td.unsorted").addClass("sorted");
                $("#fgrdARINVSViewPaymentsHeader td.sorted").removeClass("unsorted");
                $("#fgrdARINVSViewPaymentsHeader #row" + selectedrowid).removeClass("trSelected");
                $("#fgrdARINVSViewPaymentsHeader #row" + selectedrowid + " td.sorted").addClass("unsorted");
                $("#fgrdARINVSViewPaymentsHeader #row" + selectedrowid + " td.unsorted").removeClass("sorted");
            }
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });

    //$("#DialogViewPayments .sDiv").css('float', 'left').css('width', '380px');
    $("#DialogViewPayments .sDiv2 .qsbox").css('width', '80px');
    $('#DialogViewPayments .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DialogViewPayments .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DialogViewPayments .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DialogViewPayments .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show()

    function ARCheckHeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {
            debugger
            var check = id.split("_")[0];
            var RecDate = id.split("_")[1];
            var deposit = id.split("_")[2];

            RecDate = RecDate.substring(0, 2) + "/" + RecDate.substring(2, 4) + "/" + RecDate.substring(4, 6)
            $("#DivARCHECKSelectedHeaderRowID").html(id.toString());
            $("#fgrdARINVSViewPaymentsHeader [id^=row]").removeClass("trSelectedCheck");
            $("#fgrdARINVSViewPaymentsHeader #row" + id).addClass("trSelectedCheck");
            $("#fgrdARINVSViewPaymentsHeader td.unsorted").addClass("sorted");
            $("#fgrdARINVSViewPaymentsHeader td.sorted").removeClass("unsorted");
            $("#fgrdARINVSViewPaymentsHeader #row" + id).removeClass("trSelected");
            $("#fgrdARINVSViewPaymentsHeader #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdARINVSViewPaymentsHeader #row" + id + " td.unsorted").removeClass("sorted");
            $("#fgrdARINVSViewPaymentsDetails").empty();
            $("#fgrdARINVSViewPaymentsDetails").flexOptions({
                params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                        { name: 'Check', value: check },
                        { name: 'RecDate', value: RecDate },
                    { name: 'ExportCSV', value: '' },
                    { name: 'Deposit', value: deposit },
                ], query: "", newp: 1
            }).flexReload();
        });
    }

    //ABI :: Email prompt for the check when email icon clicked
    $("[id^=aViewPaymentsEmail_]").die("click").live("click", function () {

        var id = $(this).attr('id');
        var customerno = $("#CurrentCustomerNo").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetEmailAddressForARINVSViewPaymentsReport',
            data: "{'CustomerNo':'" + customerno + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != "") {

                    $("#txtEmailIDsForARINVSViewPaymentsReport").val(output.d)
                    $("#DialogEmailForARINVSViewPaymentsReport").dialog('option', 'title', 'Email To');
                    $("#DialogEmailForARINVSViewPaymentsReport").dialog("option", "width", 500);
                    $("#DialogEmailForARINVSViewPaymentsReport").dialog("option", "height", 200);
                    $("#DialogEmailForARINVSViewPaymentsReport").next('div').find('.msgui').remove();
                    $("#DialogEmailForARINVSViewPaymentsReport").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif' </div>").css('height', '35px');
                    $("#DialogEmailForARINVSViewPaymentsReport").dialog("open");
                }
                else if (output.d.indexOf("error") >= 0) {
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
            },
            error: function () {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });

    });;

    //ABI::05-OCT-2018::Confirmation Dialog Before View payments report email send 
    $("#DialogEmailForARINVSViewPaymentsReport").dialog({
        autoOpen: false,
        resizable: false,
        width: 500,
        modal: true,
        title: 'Email To',
        buttons: {
            Send: function () {

                if ($("#txtEmailIDsForARINVSViewPaymentsReport").val().trim() == "") {
                    $.MessageBox("Emailid is required!!!");
                    $("#txtEmailIDsForARINVSViewPaymentsReport").focus();
                    return;
                }

                var ToEmailID = $("#txtEmailIDsForARINVSViewPaymentsReport").val();
                var customerno = $("#CurrentCustomerNo").html();
                var customername = escape($("#CurrentCustomerName").html());
                console.log($("#DivARCHECKSelectedHeaderRowID").html());
                var check = $("#DivARCHECKSelectedHeaderRowID").html().split("_")[0]
                var RecDate = $("#DivARCHECKSelectedHeaderRowID").html().split("_")[1]
                var Deposit = $("#DivARCHECKSelectedHeaderRowID").html().split("_")[2]
                RecDate = RecDate.substring(0, 2) + "/" + RecDate.substring(2, 4) + "/" + RecDate.substring(4, 6)
                var amount = parseFloat($("#fgrdARINVSViewPaymentsHeader .trSelectedCheck").find("td div").eq(3).text().replace(",", ""))
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetARINVSViewPaymentsHeaderByCustomerdetails',
                    data: "{'Check':'" + check + "','RecDate':'" + RecDate + "','CustomerNo':'" + customerno + "','Amount':'" + amount + "','CustomerName':'" + customername + "','ToEmail':'" + ToEmailID + "','Deposit':"+ Deposit+"}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == "Success") {

                            $("#DialogEmailForARINVSViewPaymentsReport").dialog("close");
                        }
                        else if (output.d.indexOf("error") >= 0) {
                            $.MessageBox(output.d.substring(5, output.d.length));
                        }
                    },
                    error: function () {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                });


            },
            Close: function () {
                $("#DialogEmailForARINVSViewPaymentsReport").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });


    $("#fgrdARINVSViewPaymentsDetails").flexigrid({
        url: 'BloomService.asmx/GetARINVSViewPaymentsDetailsByCustomerAndCheck',
        dataType: 'xml',
        colModel: [
            { display: 'Invoice', name: 'Invoice', width: 60, sortable: true, align: 'left' },
            { display: 'Date', name: 'Date', width: 70, sortable: false, align: 'left' },
            { display: 'PO', name: 'PO', width: 100, sortable: true, align: 'left' },
            { display: 'Amount', name: 'Amount', width: 100, sortable: true, align: 'right' }
        ],
        showTableToggleBtn: true,
        sortname: "Date Asc",
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
        height: 350,
        width: 400,
        striped: true,
        searchitems: [
            { display: 'Invoice', name: 'Invoice' },
            { display: 'Date', name: 'Date' },
            { display: 'PO', name: 'PO' },
            { display: 'Amount', name: 'Amount' }
        ],
        params: [
            { name: 'Customer', value: '0' }, { name: 'Check', value: '0' }, { name: 'RecDate', value: '' }, { name: 'ExportCSV', value: '' }, { name: 'Deposit', value: '0' }
        ],
        onSuccess: function () {

            $('#fgrdARINVSViewPaymentsDetails #row0_0').addClass("TotalRows")
            //$('#fgrdOrderHeader #row0 td:nth-child(16) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '12px' });
            //$('#fgrdOrderHeader #row0 td:nth-child(19) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });


    $("#DialogViewPayments .ExportCSV").hide()
    //$("#DialogViewPayments .sDiv").css('float', 'left').css('width', '380px');
    $("#DialogViewPayments .sDiv2 .qsbox").css('width', '80px');
    $('#DialogViewPayments .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DialogViewPayments .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DialogViewPayments .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DialogViewPayments .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show()


    $("#fgrdARINVNotes").flexigrid({
        url: 'BloomService.asmx/GetARINVNotesForFgrd',
        dataType: 'xml',
        colModel: [
            { display: '', name: '', width: 20, sortable: false, align: 'left' },
            { display: '', name: '', width: 20, sortable: false, align: 'left' },
            { display: 'COMMENTS', name: 'NOTES', width: 552, sortable: false, align: 'left' },
            { display: 'ADDUSER', name: 'ADDUSER', width: 60, sortable: false, align: 'left' },
            { display: 'ADDDATE', name: 'ADDDATE', width: 60, sortable: false, align: 'center' },
            { display: 'ADDTIME', name: 'ADDTIME', width: 60, sortable: false, align: 'center' },
            //{ display: 'ADDUSER', name: 'ADDUSER', width: 50, sortable: false, align: 'left' },
            //{ display: 'ADDDATE', name: 'ADDDATE', width: 50, sortable: false, align: 'left' },
            //{ display: 'ADDTIME', name: 'ADDTIME', width: 50, sortable: false, align: 'left' },
        ],
        showTableToggleBtn: true,
        sortname: "ID",
        sortorder: "desc",
        usepager: false,
        title: false,
        useRp: true,
        qtype: "",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        height: "400",
        width: "845",
        striped: true,
        params: [
            { name: 'Customer', value: '0' },
            { name: 'ExportCSV', value: '' }
        ],
    });

    $("#ARINVNotesDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Notes",
        modal: true,
        //closeOnEscape: false,
        width: "880px",
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },

        open: function () {
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#btnARINVNotes").die("click").live("click", function () {
        $("#ARINVNotesDialog").dialog("open");
        $("#ARINVNotesDialog").dialog('option', 'title', 'NOTES for Customer :: ' + $("#CurrentCustomerNo").html() + '');
        $("#DivCOMMID").val("0");
        $("#txtARINVNotes").val("");
        $("#btnAddARINVNotes span").html("Add");
        $("#fgrdARINVNotes").empty();
        $("#fgrdARINVNotes").flexOptions({
            params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                    { name: 'ExportCSV', value: '' }], query: "", newp: 1
        }).flexReload();
    });

    $("[id^=editARINVNotes_]").die("click").live("click", function () {
        var COMMID = $(this)[0].id.replace("editARINVNotes_", "");
        $("#DivCOMMID").val(COMMID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetARINVNotesByCOMMID',
            data: "{'COMMID':'" + COMMID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    $("#btnAddARINVNotes span").html("Update");
                    $("#txtARINVNotes").val(output.d.COMMENTS);
                    $("#txtARINVNotes").focus();
                }
                else {
                    $("#txtARINVNotes").val("");
                }
            }
        });
    });

    $("[id^=deleteARINVNotes_]").die("click").live("click", function () {
        var COMMID = $(this)[0].id.replace("deleteARINVNotes_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteARINVNotesByCOMMID',
            data: "{'COMMID':'" + COMMID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "Success") {
                    $("#txtARINVNotes").val("");
                    $("#DivCOMMID").val("0");
                    $("#btnAddARINVNotes span").html("Add");
                    $("#fgrdARINVNotes").empty();
                    $("#fgrdARINVNotes").flexOptions({
                        params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                        { name: 'ExportCSV', value: '' }], query: "", newp: 1
                    }).flexReload();
                    $("#txtARINVNotes").focus();
                }
                else {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });
    });

    $("#btnAddARINVNotes").die("click").live("click", function () {
        var COMMENTS = $("#txtARINVNotes").val();
        if (COMMENTS.trim() == "") {
            $("#txtARINVNotes").focus();
            return false;
        }
        var COMMID = $("#DivCOMMID").val();
        var Customer = $("#CurrentCustomerNo").html();
        if (COMMID != "" && COMMID != "0") {

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateARINVNotesByCOMMID',
                data: "{'Customer':'" + Customer + "','COMMID':'" + COMMID + "','COMMENTS':'" + escape(COMMENTS) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "Success") {
                        //   $("#txtGrowerNoteNo").val("");
                        $("#txtARINVNotes").val("");
                        $("#btnAddARINVNotes span").html("Add");
                        $("#DivCOMMID").val("0");
                        $("#fgrdARINVNotes").empty();
                        $("#fgrdARINVNotes").flexOptions({
                            params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                                    { name: 'ExportCSV', value: '' }], query: "", newp: 1
                        }).flexReload();
                        $("#txtARINVNotes").focus();
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                }
            });
        }
        else {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/SaveARINVNotesByCOMMID',
                data: "{'Customer':'" + Customer + "','COMMENTS':'" + escape(COMMENTS) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "Success") {
                        //   $("#txtGrowerNoteNo").val("");
                        $("#txtARINVNotes").val("");
                        $("#btnAddARINVNotes span").html("Add");
                        $("#DivCOMMID").val("0");
                        $("#fgrdARINVNotes").empty();
                        $("#fgrdARINVNotes").flexOptions({
                            params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                                    { name: 'ExportCSV', value: '' }], query: "", newp: 1
                        }).flexReload();
                        $("#txtARINVNotes").focus();
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                }
            });
        }
    });

    $("#fgrdARINVDocs").flexigrid({
        url: 'BloomService.asmx/GetARINVDocsForFgrd',
        dataType: 'xml',
        colModel: [
            { display: '', name: '', width: 20, sortable: false, align: 'left' },
            { display: '', name: '', width: 20, sortable: false, align: 'left' },
            { display: 'DOCUMENT', name: 'DOCTYPE', width: 60, sortable: false, align: 'left' },
            { display: 'METHOD', name: 'DELTYPE', width: 60, sortable: false, align: 'left' },
            { display: 'ADDRESS', name: 'ADDRESS', width: 380, sortable: false, align: 'left' },
            { display: 'ADDUSER', name: 'ADDUSER', width: 55, sortable: false, align: 'left' },
            { display: 'ADDDATE', name: 'ADDDATE', width: 60, sortable: false, align: 'center' },
            { display: 'ADDTIME', name: 'ADDTIME', width: 55, sortable: false, align: 'center' },
        ],
        showTableToggleBtn: true,
        sortname: "ID",
        sortorder: "desc",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: false,
        height: "400",
        width: "820",
        striped: true,
        params: [
            { name: 'Customer', value: '0' },
            { name: 'ExportCSV', value: '' }
        ],
        searchitems: [
            { display: 'DOCUMENT', name: 'DOCTYPE' },
            { display: 'METHOD', name: 'DELTYPE' },
            { display: 'ADDRESS', name: 'ADDRESS' },
        ],
        onSuccess: function () {

            var sel = jQuery("#fgrdARINVDocs tbody tr");
            var len = sel.length;
            if (len < 1) {
                $("#ARINVDocsDialog #ExportCSV").hide();
            }
            else {
                $("#ARINVDocsDialog #ExportCSV").show();
            }

        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });
    $("#ARINVDocsDialog .sDiv").css('float', 'left').css('width', '545px');
    $('#ARINVDocsDialog .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#ARINVDocsDialog .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#ARINVDocsDialog .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#ARINVDocsDialog .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();


    $("#ARINVDocsDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Docs",
        modal: true,
        //closeOnEscape: false,
        width: "830px",
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#btnARINVDocs").die("click").live("click", function () {
        $("#ARINVDocsDialog").dialog("open");
        $("#ARINVDocsDialog").dialog('option', 'title', 'Docs for Customer :: ' + $("#CurrentCustomerNo").html() + '');
        $("#btnAddARINVDocs span").html("Add");
        $("#DivDocsID").val("0");
        $("#txtARINVDocsT").val("");
        $("#txtARINVDocsD").val("");
        $("#txtARINVDocsAddr").val("");
        $("#fgrdARINVDocs").empty();
        $("#fgrdARINVDocs").flexOptions({
            params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
            { name: 'ExportCSV', value: '' }], query: "", newp: 1
        }).flexReload();
    });

    $("[id^=deleteARINVDocs_]").die("click").live("click", function () {
        var DocsID = $(this)[0].id.replace("deleteARINVDocs_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteARINVDocsByDocsID',
            data: "{'DocsID':'" + DocsID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "Success") {
                    $("#txtARINVDocsT").val("");
                    $("#txtARINVDocsD").val("");
                    $("#txtARINVDocsAddr").val("");
                    $("#btnAddARINVDocs span").html("Add");
                    $("#DivDocsID").val("0");
                    $("#fgrdARINVDocs").empty();
                    $("#fgrdARINVDocs").flexOptions({
                        params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                        { name: 'ExportCSV', value: '' }], query: "", newp: 1
                    }).flexReload();
                    $("#txtARINVDocsT").focus();
                }
                else {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            }
        });
    });

    $("[id^=editARINVDocs_]").die("click").live("click", function () {
        var DocsID = $(this)[0].id.replace("editARINVDocs_", "");
        $("#DivDocsID").val(DocsID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetARINVDocsByDocsID',
            data: "{'DocsID':'" + DocsID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    $("#btnAddARINVDocs span").html("Update");
                    $("#txtARINVDocsT").val(output.d.DocType);
                    $("#txtARINVDocsD").val(output.d.DelType);
                    $("#txtARINVDocsAddr").val(output.d.ADDRESS)
                    $("#txtARINVDocsT").focus();
                }
                else {
                    $("#txtARINVDocsT").val("");
                    $("#txtARINVDocsD").val("");
                    $("#txtARINVDocsAddr").val("");
                }
            }
        });
    });

    $("#btnAddARINVDocs").die("click").live("click", function () {
        var DocType = $("#txtARINVDocsT").val().toUpperCase();
        var DelType = $("#txtARINVDocsD").val().toUpperCase();
        var Address = $("#txtARINVDocsAddr").val();
        if (DocType.trim() == "") {
            $("#txtARINVDocsT").focus();
            return false;
        }
        else if (DelType.trim() == "") {
            $("#txtARINVDocsD").focus();
            return false;
        }
        //else if (Address.trim() == "") {
        //    $("#txtARINVDocsAddr").focus();
        //    return false;
        //}
        //else if (!validateEmail(Address.trim())) {
        //    $("#txtARINVDocsAddr").focus();
        //    return false;
        //}

        var DocsID = $("#DivDocsID").val();
        var Customer = $("#CurrentCustomerNo").html();
        if (DocsID != "" && DocsID != "0") {

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateARINVDocsByDocsID',
                data: "{'Customer':'" + Customer + "','DocsID':'" + DocsID + "','DocType':'" + DocType.toUpperCase() + "','DelType':'" + DelType.toUpperCase() + "','Address':'" + escape(Address) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "Success") {
                        $("#txtARINVDocsT").val("");
                        $("#txtARINVDocsD").val("");
                        $("#txtARINVDocsAddr").val("");
                        $("#btnAddARINVDocs span").html("Add");
                        $("#DivDocsID").val("0");
                        $("#fgrdARINVDocs").empty();
                        $("#fgrdARINVDocs").flexOptions({
                            params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                            { name: 'ExportCSV', value: '' }], query: "", newp: 1
                        }).flexReload();
                        $("#txtARINVDocsT").focus();
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                }
            });
        }
        else {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/SaveARINVDocsByDocsID',
                data: "{'Customer':'" + Customer + "','DocType':'" + DocType + "','DelType':'" + DelType + "','Address':'" + escape(Address) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "Success") {
                        $("#txtARINVDocsT").val("");
                        $("#txtARINVDocsD").val("");
                        $("#txtARINVDocsAddr").val("");
                        $("#btnAddARINVDocs span").html("Add");
                        $("#DivDocsID").val("0");
                        $("#fgrdARINVDocs").empty();
                        $("#fgrdARINVDocs").flexOptions({
                            params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                            { name: 'ExportCSV', value: '' }], query: "", newp: 1
                        }).flexReload();
                        $("#txtARINVDocsT").focus();
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                }
            });
        }
    });

    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

    $("#btnRequestID").die("click").live("click", function () {
        debugger
        var Customer = $("#CurrentCustomerNo").html();
        if (parseInt($('#btnRequestID').val()) > 0) {
            return false
        }
        else {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ExportSingleCustomerToKomet',
                data: '{"CustomerNo":"' + Customer + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    if (output.d >= 0) {
                        $("#btnRequestID").attr('value', output.d);
                        $.MessageBox("This Customer posted successfully.Request ID:" + output.d);
                        $("#fgrdARINVCustomer").flexReload({ url: '/url/for/refresh' });
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                }

            });
        }

    });

    $("#btnCrReqPrint").die("click").live("click", function () {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustomerEmailIDforCrReq',
            data: "{'Customer': '" + $("#CurrentCustomerNo").html() + "','InvoiceId': '" + $("#DivCreditReqList").data("PrintInvoiceId") +"'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var res = output.d;
                $("#txtCrReqEmailTo").val(res[0]);
                $("#txtCrReqSubject").val(res[1]);
                $("#CrReqPrintDialog").next('div').find('.msgui').remove();
                $("#CrReqPrintDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif'/> </div>").css('height', '35px');
                $("#CrReqPrintDialog").dialog("open");
            }
        });

    });

    $("#CrReqPrintDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 500,
        modal: true,
        title: 'Credit Request',
        buttons: {
            Email: function () {
                debugger
                var Invoice = $("#DivCreditReqList").data("Invoice");
                var PrintCreReqID = $("#DivCreditReqList").data("CreReqID");
                var EmailOrPDF = "EMAIL";
                var EmailTo = $("#txtCrReqEmailTo").val();
                var Subject = $("#txtCrReqSubject").val();
                var Body = $("#txtCrReqBody").val();
                $("#CrReqPrintDialog").next('div').find('.msgui').show();

                if (EmailTo.trim() == "") {
                    $("#CrReqPrintDialog").next('div').find('.msgui').html("EmailTo required...  <img src='images/ajax-loader.gif'");
                    $("#txtCrReqEmailTo").focus();
                    return false;
                }
                if (Subject.trim() == "") {
                    $("#CrReqPrintDialog").next('div').find('.msgui').html("Subject required...  <img src='images/ajax-loader.gif'");
                    $("#txtCrReqSubject").focus();
                    return false;
                }

                $("#CrReqPrintDialog").next('div').find('.msgui').html("Sending...  <img src='images/ajax-loader.gif'");
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PrintCreditReqReport',
                    data: "{'Invoice':'" + Invoice + "','EmailOrPDF':'" + EmailOrPDF + "','EmailTo':'" + EmailTo + "','Subject':'" + Subject + "','Body':'" + escape(Body) + "','CreReqID':'" + PrintCreReqID + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == null) {
                            $("#CrReqPrintDialog").dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                        else {
                            $("#CrReqPrintDialog").dialog("close");
                        }
                    }
                });
            },
            Pdf: function () {
                debugger
                var w = window.open('GeneratingPDF.html');
                var PrintCreReqID = $("#DivCreditReqList").data("CreReqID");
                var Invoice = $("#DivCreditReqList").data("Invoice");
                var EmailOrPDF = "PDF";
                var EmailTo = $("#txtCrReqEmailTo").val();
                var Subject = $("#txtCrReqSubject").val();
                var Body = $("#txtCrReqBody").val();


                $("#CrReqPrintDialog").next('div').find('.msgui').html("Printing...  <img src='images/ajax-loader.gif'");
                $("#CrReqPrintDialog").next('div').find('.msgui').show();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PrintCreditReqReport',
                    data: "{'Invoice':'" + Invoice + "','EmailOrPDF':'" + EmailOrPDF + "','EmailTo':'" + EmailTo + "','Subject':'" + Subject + "','Body':'" + escape(Body) + "','CreReqID':'" + PrintCreReqID + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == null) {
                            $("#CrReqPrintDialog").dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                        else {
                            var ReportsResult = output.d;
                            if (ReportsResult.length == 0) {
                                $("#CrReqPrintDialog").dialog("close");
                                w.close();
                            }
                            else {
                                $("#CrReqPrintDialog").dialog("close");
                                //2020/09/12
                                w.location = ReportsResult;//Report Path 
                                //w.location = ReportsResult.Result;//Report Path 
                            }
                        }
                    }
                });
            },
            Close: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Email')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Pdf')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });


    $("[id^=aOrderDate_").die('click').live('click', function () {

        var OrderNo = $(this).attr('id').substring(11);
        var para = 'Page=CallHS&OrderNo=' + OrderNo;
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
                    title: 'Activity Log :: ' + OrderNo,
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


    //ABI::27-SEP-2016::Email or Fax the Individual invoice from VET 
    $("#DialogEmailOrFaxtheIndividualInv").dialog({
        autoOpen: false,
        resizable: false,
        width: 500,
        modal: true,
        title: 'Email To',
        buttons: {
            Send: function () {

                if ($("#txtEmailIDsForIndividualInv").val().trim() == "" && $("#hfEmailorFaxIndividualInv").text() == "Email") {
                    $.MessageBox("Emailid is required!!!");
                    $("#txtEmailIDsForIndividualInv").focus();
                    return;
                }

                if ($("#txtFaxForIndividualInv").val().trim() == "" && $("#hfEmailorFaxIndividualInv").text() == "Fax") {
                    $.MessageBox("Fax# is required!!!");
                    $("#txtFaxForIndividualInv").focus();
                    return;
                }

                var EmailID = ''
                if ($("#hfEmailorFaxIndividualInv").text() == "Email") {
                    EmailID = $("#txtEmailIDsForIndividualInv").val();
                }
                else {
                    var FaxNo = $("#txtFaxForIndividualInv").val();
                    EmailID = FaxNo + "@faxage.com"
                }
                var Subject = $("#txtEmailSubjectDetailForIndividualInv").val();
                var Body = $("#txtEmailBodyDetailForIndividualInv").val();

                var Invoice = $("#DialogEmailOrFaxtheIndividualInv").data("Invoice");
                var CloseDialog = "VETEmailOrFaxClose";
                $("#DialogEmailOrFaxtheIndividualInv").next('div').find('.msgui').show();
                PrintInvoiceReportForVET("Email", Invoice, EmailID, Subject, Body, CloseDialog, '');
            },
            Close: function () {
                $("#DialogEmailOrFaxtheIndividualInv").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });


    $("#btnVETEmail").die("click").live("click", function () {


        debugger

        var hasnegativeor0boxes = true;

        if (hasnegativeor0boxes) {

            //var Invoice = $("#DivVETInvoiceGridDialog").data("Invoice");
            var Invoice = $("#DivVETInvoiceGridDialog").data("inData")["Invoice"];
            var DivCurrentDivID = $("#CustCurrentDivID").html();
            //var CustomerNo = $("#" + DivCurrentDivID + " .lblBillTo1").html().substring(10, 12);
            var CustomerNo = $("#" + DivCurrentDivID + " .lblBillTo1").find('.ClsCustomerNoHeader').html().trim();
            //$("#DivVETInvoiceGridDialog").dialog('option', 'title', 'VET Details :: ' + splitstr[0] + '');
            $("#hfEmailorFaxIndividualInv").text("Email");
            $(".EmailIndividualInvSection").show();
            $(".FaxIndividualInvSection").hide();
            var DelType = '\'E\'';//+ ',' + '\'F\'';
            var Subject = '<%=ConfigurationManager.AppSettings("CompanyName").ToString()%>' + " Invoice No.";
            var shipDate = $("#DivVETCustDetailsPage .lblInvoiceDate1").text();
            Subject += Invoice + " For shipping date " + $.datepicker.formatDate("mm/dd/yy", new Date(shipDate));
            if ($("#ui-dialog-title-DivVETInvoiceGridDialog div").html().toString().toUpperCase().includes("VOIDED")) {
                Subject += Subject + " *VOIDED*"
            }
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustomerDocumentsAddress',
                data: '{"CustomerNo": "' + CustomerNo + '","DocType":"I","DelType":"' + DelType + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    $("#txtEmailIDsForIndividualInv").val(output.d);
                    $("#txtEmailSubjectDetailForIndividualInv").val(Subject);
                    $("#DialogEmailOrFaxtheIndividualInv").dialog('option', 'title', 'Email To');
                    $("#DialogEmailOrFaxtheIndividualInv").dialog("option", "width", 500);
                    $("#DialogEmailOrFaxtheIndividualInv").dialog("option", "height", 380);
                    $("#DialogEmailOrFaxtheIndividualInv").next('div').find('.msgui').remove();
                    $("#DialogEmailOrFaxtheIndividualInv").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif' </div>").css('height', '35px');
                    $("#DialogEmailOrFaxtheIndividualInv").data('Invoice', Invoice).dialog("open");
                }
            });
        } else {
            $.MessageBox("Boxes cannot be 0 or less than 0. Unable to send email for this order!!!");
        }
    });

    $("#btnVETFax").die("click").live("click", function () {
        var hasnegativeor0boxes = true;

        if (hasnegativeor0boxes) {

            //var Invoice = $("#DivVETInvoiceGridDialog").data("Invoice");
            var Invoice = $("#DivVETInvoiceGridDialog").data("inData")["Invoice"];
            $("#hfEmailorFaxIndividualInv").text("Fax")
            $(".EmailIndividualInvSection").hide();
            $(".FaxIndividualInvSection").show();
            $("#txtFaxForIndividualInv").val("");
            //var res = GetSalesOrderCustomerDetails($("#CurrentCustomerNo").html());

            //$("#txtFaxForIndividualInv").val(res.Fax.replace("-", ""));

            //$("#DialogEmailOrFaxtheIndividualInv").dialog("option", "width", 300);
            //$("#DialogEmailOrFaxtheIndividualInv").dialog("option", "height", 150);
            //$("#DialogEmailOrFaxtheIndividualInv").dialog('option', 'title', 'Fax To');
            //$("#DialogEmailOrFaxtheIndividualInv").next('div').find('.msgui').remove();
            //$("#DialogEmailOrFaxtheIndividualInv").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif'</div>").css('height', '35px');
            //$("#DialogEmailOrFaxtheIndividualInv").data('Invoice', Invoice).dialog("open");

            var DelType = '\'F\'';
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustomerDocumentsAddress',
                data: '{"CustomerNo": "' + $("#CurrentCustomerNo").html() + '","DocType":"I","DelType":"' + DelType + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    var res = output.d;
                    $("#txtFaxForIndividualInv").val(res);

                    $("#DialogEmailOrFaxtheIndividualInv").dialog("option", "width", 300);
                    $("#DialogEmailOrFaxtheIndividualInv").dialog("option", "height", 380);
                    $("#DialogEmailOrFaxtheIndividualInv").dialog('option', 'title', 'Fax To');
                    $("#DialogEmailOrFaxtheIndividualInv").next('div').find('.msgui').remove();
                    $("#DialogEmailOrFaxtheIndividualInv").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif'</div>").css('height', '35px');
                    $("#DialogEmailOrFaxtheIndividualInv").data('Invoice', Invoice).dialog("open");
                }
            });
        }
        else {
            $.MessageBox("Boxes cannot be 0 or less than 0. Unable to send fax for this order!!!");
        }
    });

    function GetSalesOrderCustomerDetails(Customer) {

        var res = "";
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSalesOrderCustDetails',
            data: "{'Customer': '" + Customer + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {

                res = output.d;
            }
        });
        return res;
    }

    $("#btnARINVSaveInvoicePdfs").die("click").live("click", function () {

        var orderNos = [];
        var Customer = $("#CurrentCustomerNo").html();
        var CustDet = GetSalesOrderCustomerDetails(Customer);
        //var CustName = CustDet.Name.replace('/','-').replace('#','-').replace("'","-").replace('/\\/g',"-");
        var CustName = CustDet.Name.replace(/[`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '-');
        /* Detect Browsers :: Works only in chrome */
        $.browser.chrome = /chrome/.test(navigator.userAgent.toLowerCase());
        if ($.browser.chrome) {
            $('#fgrdARINVCustomer tr:visible').each(function () {
                if ($(this).attr("id") != "row0") {
                    if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                        orderNos.push($(this).attr("id").substring(3));
                    }
                }
            });

            if (orderNos.length == 0) {
                $.MessageBox("Please select an invoice");
                return 0;
            }
            else {
                orderNos.join(',');
            }

            $("#msgbox-download").dialog("open");
            $("#msgdownloadhtml").html("Saving Pdf...");
            for (var i = 0; i < orderNos.length; i++) {
                PrintInvoiceReportForVET("Download", orderNos[i], "", "", "", "ARINVSSavePDF", CustName);
            }
        }
        else {
            $.MessageBox("Sorry,  this option only works in Chrome");
        }
    });

    /*History button to get ARHIST details*/
    $("#btnARINVHistoryCurrent").die("click").live("click", function () {
        if (IsARINVHistory == "0") {
            IsARINVHistory = "1";
            $("#btnARINVHistoryCurrent").val("Current");
            $("#DivARINVCustomerGridDialog").dialog('option', 'title', 'ARHIST Info For Customer :: ' + $("#CurrentCustomerNo").html() + '');
        }
        else {
            IsARINVHistory = "0";
            $("#btnARINVHistoryCurrent").val("History");
            $("#DivARINVCustomerGridDialog").dialog('option', 'title', 'ARINVS Info For Customer :: ' + $("#CurrentCustomerNo").html() + '');
        }
        var Customer = $("#CurrentCustomerNo").html();
        $("#fgrdARINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'IsARINVHistory', value: IsARINVHistory }], query: "", newp: 1 }).flexReload();
    });

    /* Alert box :: Alert for ARINVS save to download PDF*/
    $("#msgbox-download").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        open: function () {
            //$(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });


    /*F7:: Customer's call history :: Abinaya :: 10Oct2017*/
    $("#btnARINVCallHS").die('click').live('click', function () {
        var Customer = $("#CurrentCustomerNo").html();
        var para = 'Customer=' + Customer + '&Date=' + "01/01/1900" + '&Page=CallHS';  /*default date bcoz it needs to show all data from the begin*/
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

    $("#btnARINVSpord").die("click").live("click", function () {
        var para = 'Customer=' + $("#CurrentCustomerNo").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageSPORD.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DivSPORDDialog">/div>').dialog({
                    title: 'SPORD',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1360,
                    height: $(window).height() - 10,
                    //closeOnEscape:false,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {

                    },

                });
                $("#DivSPORDDialog").dialog('option', 'title', 'SPORD Details for Customer ::' + $("#CurrentCustomerNo").html());
                $("#DivSPORDDialog").html(output.d).dialog("open");
            }
        });

    });

    /*Allow multiple time click on dropdown for payments action*/
    var cc = 0;
    $('#ddlARINVPay').click(function () {
        cc++;
        if (cc == 2) {
            $(this).change();
            cc = 0;
        }
    }).change(function () {
        ARINVActionsddl();
        cc = -1;
    });
    var IsCustomerPageLoadedFirst = false;
    /*Multiple invoice select and Sum of their balances to Adjust value for Adjustments option*/
    function ARINVActionsddl() {

        if ($("#ddlARINVPay").val() == "Adjustments") {
            if ($("#fgrdARINVCustomer .trChecked").length == 0) {
                $.MessageBox("Please select an invoice");
                return 0;
            }
            else {
                var InvBalance = 0.00;
                var xInvoice = [];
                var xDate = [];
                var xInvAmount = [];

                $('#fgrdARINVCustomer .trChecked').each(function () {
                    InvBalance += parseFloat($(this).find("td div").eq(12)[0].innerText.replace(",", ""));
                    xInvoice.push($(this).find("td div").eq(1)[0].innerText.replace(",", ""));
                    xDate.push($(this).find("td div").eq(2)[0].innerText.replace(",", ""));
                    xInvAmount.push($(this).find("td div").eq(12)[0].innerText.replace(",", ""));
                });
                var Customer = $("#DivARINVCustomerGridDialog").data("Customer");
                $("#DialogARAdjustment").dialog("option", "title", "Adjustment Posting for Customer :: " + Customer);
                $("#DialogARAdjustment").data("PostingData", { InvBalance: InvBalance.toFixed(2), xInvoice: xInvoice, xDate: xDate, xInvAmount: xInvAmount }).dialog("open");
            }
        }
        else if ($("#ddlARINVPay").val() == "Update Customer") {

            updatecustomerdialog();
        }
    }

    function updatecustomerdialog() {
        var Customer = $("#DivARINVCustomerGridDialog").data("Customer");
        // 
        $('<div id="DivCustomerPage"></div>').dialog({
            title: 'Customer Details',
            autoOpen: false,
            resizable: false,
            modal: true,
            width: 970,
            open: function () {
                //$("#txtCustNo").focus();
                $("#txtCustNo").show();
                $("#DivCustButtonList").show();
                $("#btnCustomerDetailsSave").hide();
                //$('#DialogCustomerUpdate input[type="text"], textarea,select').attr('readonly', 'readonly');
                //$("[id^=chk]").is(":enabled") == false ? $("[id^=chk]").iButton("enable") : $("[id^=chk]").iButton("enable");
                //$('#DialogCustomerUpdate input[type="text"],#DialogCustomerUpdate textarea,#DialogCustomerUpdate select').attr('disabled', 'disabled');
                $('#tblCustomerDetails input[type="text"],#tblCustomerDetails textarea, #tblCustomerDetails select').css('background', "rgb(235, 235, 228)");
                $("#tblCustomerDetails").css("pointer-events", "none");
            },
            close: function (event, ui) {
                // 
                // $(this).dialog('destroy').remove();
            },
        });

        if (IsCustomerPageLoadedFirst == false) {
            $("#msgbox-CustDelay").dialog("open");
            $("#msg").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />")
            $(".imgLoaderForUser").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPage',
                data: '{ "controlName":"pages/PageCustomer.ascx","controlPara":"' + Customer + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    IsCustomerPageLoadedFirst = true;
                    $("#DivCustomerPage").html(output.d).dialog("open");
                    $("#msgbox-CustDelay").dialog("close");
                }
            });
        }
        else {
            $("#DivCustomerPage").dialog("open");
        }
    }
    /*Set current date by default while setting Adjustment value for the invoices - user can change it*/
    $("#txtARAdjustDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    /*Screen to enter adjustment value for the selected invoices*/
    $("#DialogARAdjustment").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Adjustment posting",
        width: 650,
        buttons: {
            Apply: function () {

                var InvBalance = ($("#txtARAdjustAmount").val() == "") ? $("#txtARAdjustAmount").attr('placeholder') : $("#txtARAdjustAmount").val();   //Sum of slected invoice balance
                if (InvBalance == "") {
                    $.MessageBox("Please enter amount to apply Adjustment");
                    return false;
                }
                var Customer = $("#DivARINVCustomerGridDialog").data("Customer");
                var xInvoice = $("#DialogARAdjustment").data("PostingData")["xInvoice"].join(",");  //Combine selected invoices
                var xInvAmount = $("#DialogARAdjustment").data("PostingData")["xInvAmount"].join(",");  //Join balance value for those invoices
                var xDate = $("#txtARAdjustDate").val();    //Adjustment applied date
                var xGL = $("#txtARAdjustGL").val();    //GL value entered by the user @Adjustment screen
                var xReason = $("#txtARAdjustReason").val();    //Reason value entered by the user @Adjustment screen
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PostingPaymentsToAdjustment',
                    data: "{'xCust': '" + Customer + "','xAmount':" + InvBalance + ",'xInvoice':'" + xInvoice + "','xDate':'" + xDate + "','xInvAmount':'" + xInvAmount + "','xReason':'" + xReason + "','xGL':'" + xGL + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == "valid") {
                            //$.MessageBox("Adjustment applied");
                            LoadCustomerDetailsByCustNo(Customer);
                            $("#DialogARAdjustment").dialog("close");
                            $("#CurrentCustomerNo").html(Customer);
                            //get total adjustments//
                            GetAdjustmentsTotalsForToday();
                            /////
                            var ARGridAdjustments = parseFloat($("#fgrdARINVCustomer #row" + xInvoice + "").find("td div").eq(11)[0].innerHTML.replace(/,/g, ''));
                            var ARGridInvBalance = parseFloat($("#fgrdARINVCustomer #row" + xInvoice + "").find("td div a")[3].innerHTML.replace(/,/g, ''));
                            var ARGridAccumBalance = parseFloat($("#fgrdARINVCustomer #row" + xInvoice + "").find("td div").eq(13)[0].innerHTML.replace(/,/g, ''));


                            $("#fgrdARINVCustomer #row" + xInvoice + "").find("td div").eq(11)[0].innerHTML = addCommas(parseFloat(ARGridAdjustments + parseFloat(InvBalance)).toFixed(2))
                            $("#fgrdARINVCustomer #row" + xInvoice + "").find("td div a")[3].innerHTML = addCommas(parseFloat(ARGridInvBalance - parseFloat(InvBalance)).toFixed(2))
                            $("#fgrdARINVCustomer #row" + xInvoice + "").find("td div").eq(13)[0].innerHTML = addCommas(parseFloat(ARGridAccumBalance - parseFloat(InvBalance)).toFixed(2))

                            //$("#fgrdARINVCustomer").empty();
                            //$("#fgrdARINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer },{ name: 'IsARINVHistory', value: IsARINVHistory }], query: "", newp: 1 }).flexReload();

                        }
                    }
                });
            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            $("#txtARAdjustAmount").val("");
            $("#txtARAdjustGL").val("");
            $("#txtARAdjustReason").val("");
            $("#txtARAdjustDate").datepicker('setDate', new Date())
            var InvBalance = $("#DialogARAdjustment").data("PostingData")["InvBalance"];
            $("#txtARAdjustAmount").attr('placeholder', InvBalance);
            $(".ui-dialog-buttonpane button:contains('Apply')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

    /*Add commas in Amounts field*/
    function addCommas(nStr) {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }


    $("#msgbox-CustDelay").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        closeOnEscape: false,
        //buttons: {
        //    Ok: function () {
        //        $(this).dialog("close");
        //    }
        //},
        open: function () {
            $(this).focus();
            $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
            //$(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    $("#btnUpdateCustomer").die("click").live("click", function () {
        var Customer = $("#DivARINVCustomerGridDialog").data("Customer");

        $('<div id="DivCustomerPage"></div>').dialog({
            title: 'Customer Details',
            autoOpen: false,
            resizable: false,
            modal: true,
            width: 970,
            open: function () {
                //$("#txtCustNo").focus();
                $("#txtCustNo").show();
                $("#DivCustButtonList").show();
                $("#btnCustomerDetailsSave").hide();
                //$('#DialogCustomerUpdate input[type="text"], textarea,select').attr('readonly', 'readonly');
                //$("[id^=chk]").is(":enabled") == false ? $("[id^=chk]").iButton("enable") : $("[id^=chk]").iButton("enable");
                //$('#DialogCustomerUpdate input[type="text"],#DialogCustomerUpdate textarea,#DialogCustomerUpdate select').attr('disabled', 'disabled');
                //$('#tblCustomerDetails input[type="text"], textarea, select').css('background', "rgb(235, 235, 228)");
                $('#tblCustomerDetails input[type="text"],#tblCustomerDetails textarea, #tblCustomerDetails select').css('background', "rgb(235, 235, 228)");
                $("#tblCustomerDetails").css("pointer-events", "none");
            },
            close: function (event, ui) {

                // $(this).dialog('destroy').remove();
            },
        });

        if (IsCustomerPageLoadedFirst == false) {
            $("#msgbox-CustDelay").dialog("open");
            $("#msg").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />")
            $(".imgLoaderForUser").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPage',
                data: '{ "controlName":"pages/PageCustomer.ascx","controlPara":"' + Customer + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    IsCustomerPageLoadedFirst = true;
                    $("#DivCustomerPage").html(output.d).dialog("open");
                    $("#msgbox-CustDelay").dialog("close");
                }
            });
        }
        else {
            $("#DivCustomerPage").dialog("open");
        }
    });

    /*VET order details for select all options :: Created by Abinaya :: 05AUG2018*/

    $("[id^=VETOrderselect_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("VETOrderselect_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            sourceCtl.attr('class', 'VETOrderselected');
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $("[id ^= VETOrderselect_]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            sourceCtl.attr('class', 'VETOrderselected');
        }
    });

    $("#VETOrderselectall").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }


        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            $('#fgrdVETINVCustomer tr:visible').addClass("trChecked");
            $('#fgrdVETINVCustomer tr#row0').removeClass("trChecked");
            $("[id^=VETOrderselect_]:visible").prop("src", "images/check-on.png");
            $("[id^=VETOrderselect_]:visible").attr('class', 'VETOrderselected');
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $('#fgrdVETINVCustomer tr').removeClass("trChecked");
            $("[id^=VETOrderselect_]:visible").removeClass('VETOrderselected');
            $("[id^=VETOrderselect_]").prop("src", "images/check-off.png");
        }
    });

    $(document).keydown(function (e) { //mani::10-Sep-2018 adding shortcut for updating customer detail
       // debugger
        if ($("#DivARINVCustomerGridDialog").dialog('isOpen') == true) {
            //if ($("#ctl00_LoggedInUserType").html() == "credit manager") {
            if ((e.metaKey || e.altKey) && e.keyCode == 52) {
                updatecustomerdialog();
            }
            //}
        }
        if ($("#DivVETInvoiceGridDialog").dialog('isOpen') == true) {
            if (e.altKey && (e.which == 57 || e.which == 105)) {
                $('#btnOrderVETConsolView').click();
            }
        }

    });

    /*Add hyperlink for Balance column in ARINVS grid, click on the link pop-up with its transaction details in grid :: created by Abinaya :: 12Sep2018*/
    $("[id^=aOrderBalance_]").die("click").live("click", function () {

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var headers = ID.replace("aOrderBalance_", "");
        var para = "Invoiceno=" + headers + '&IsARINVHistory=' + IsARINVHistory;

        //$("#fgrdARINVTransactions").empty();
        //$("#fgrdARINVTransactions").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: headers }], query: "", newp: 1 }).flexReload();
        //$("#DialogARINVTransactions").dialog('option', 'title', 'Invoice Transaction Details :: ' + headers);
        //$("#DialogARINVTransactions").dialog("open");
        var para = "Invoiceno=" + headers;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageInvoiceTransactions.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('<div id="editInvoicetransitions">/div>').dialog({
                    autoOpen: false,
                    resizable: false,
                    width: 700,
                    height: $(window).height() - 130,
                    modal: true,
                    focus: function () {
                        $('#editInvoicetransitions').closest('.ui-dialog').focus();
                    },
                    close: function () {
                        $(this).dialog('destroy').remove();
                    }

                });
                $("#editInvoicetransitions").html(output.d).dialog("open");
                $("#editInvoicetransitions").dialog('option', 'title', 'Invoice Transaction Details :: ' + headers);
            }
        });
    });


    //MANI::Delete a line from closed orders::10/23/2018
    $("[id^=VETDetailDelete_]").die("click").live("click", function () {
        if ($("#ctl00_LoggedInUserType").html() == "sales person") {
            $.MessageBox("You do not have rights to modify this order!!!");
        }
        //else if ($("#ctl00_LoggedInUserType").html() == "employee") {
        //    $.MessageBox("You do not have rights to modify this order!!!");
        //}
        else {
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id').replace("VETDetailDelete_", "");

            if ($("#fgrdVETINVCustomer #row" + ID).find("td div a img").eq(0).attr('src').includes("sadface.png")) {
                $.MessageBox("You can not delete a row that has credit!!!");
                return false
            }

            var FlowerName = $("#VETDetailName_" + ID).html();
            var Boxes = $("#VETDetailBoxes_" + ID).html();
            if (Boxes.trim() == "") {
                Boxes = "0";
            }
            var Units = $("#VETDetailUnits_" + ID).html();
            var UOM = $("#VETDetailUOM_" + ID).html();

            $("#DivOrder").next('div').find('.msgui').hide();
            SelectedInvenId = $("#VETDetailInvenId_" + ID).html();

            if (SelectedInvenId != 0 && SelectedInvenId != "") {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/InsertLock',
                    data: "{ 'LockRecord': '" + SelectedInvenId + "','Page':'PageARINVS','Functionality':'InvenLock_Delete'}",
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
                        else if (data.indexOf("NotExist") >= 0 || data.indexOf("NoBoxes") >= 0) {
                            $("<div id='DeleteVETDetailconfirm'><p>Are you sure to delete the " + Boxes + " " + UOM + "X" + Units + " " + FlowerName + "?</p></div>").dialog({
                                autoOpen: false,
                                resizable: false,
                                title: "Alert",
                                width: 400,
                                modal: true,
                                buttons: {
                                    Yes: function () {
                                        var adialog = $(this);
                                        //debugger;
                                        $.ajax({
                                            type: "POST",
                                            url: 'BloomService.asmx/DeleteVETDetail',
                                            data: '{"ID":"' + ID + '"}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (output) {
                                                ClearLockedInventoryOnVETDelete(function (callback) {
                                                });
                                                if (output.d == "LogOut") {
                                                    adialog.dialog("close");
                                                    window.location.href = "Login.aspx"
                                                }
                                                else if (output.d == 'success') {
                                                    adialog.dialog("close");
                                                    $("#fgrdVETINVCustomer").flexReload({ url: '/url/for/refresh' });
                                                }
                                                else if (output.d == "Invalid inventory") {
                                                    adialog.dialog("close");
                                                    $.MessageBox("Invalid Inventory!");
                                                }
                                                else {
                                                    adialog.dialog("close");
                                                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                                }
                                            }
                                        });
                                    },
                                    No: function () {
                                        ClearLockedInventoryOnVETDelete(function (callback) {
                                        });
                                        $(this).dialog("close");
                                    }
                                },
                                close: function () {
                                    ClearLockedInventoryOnVETDelete(function (callback) {
                                    });
                                    $(this).dialog('destroy').remove();
                                },
                                open: function () {
                                    $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
                                    $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
                                }
                            });
                            $("#DeleteVETDetailconfirm").dialog("open");
                        }
                        else if (data != "") {
                            var tmp = data.split("_")
                            ClearLockedInventoryOnVETDelete(function (callback) {
                            });
                            $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + " !");
                        }
                        else {
                            ClearLockedInventoryOnVETDelete(function (callback) {
                            });
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    },
                });
            } else if (SelectedInvenId == "" || SelectedInvenId == 0) {
                $("#DeleteMiscDetail").html("<p>Are you sure to delete the <b>" + Boxes + " " + FlowerName + "?</b></p>");
                $("#DeleteMiscDetail").data("ID",ID).dialog("open");
            }else {
                //adialog.dialog("close");
                //ClearLockedInventoryOnVETDelete(function (callback) {
                //});
                $.MessageBox("Invalid Inventory!");
            }
        }
    });

    function ClearLockedInventoryOnVETDelete(callback) {
        if (SelectedInvenId != 0 && SelectedInvenId != "") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteLock',
                data: "{ 'LockRecord': '" + SelectedInvenId + "','Page':'PageARINVS','Functionality':'InvenLockRelease'}",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: "json",
                success: function (output, status) {
                    var data = output.d;
                    SelectedInvenId = 0;
                    callback(true);
                },

            });
        }
        else {
            callback(true);
        }
    }

    //$("#AddUpdateVETDetail").dialog({
    //    modal: true,
    //    autoOpen: false,
    //    resizable: false,
    //    title: "ADD Order detail",
    //    width: 400,
    //    height: 245,
    //    open: function () {
    //        $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
    //        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
    //        $("#txtSaleType_AddVETDetail").val("");
    //        $("#txtQty_AddVETDetail").focus();




    //    },
    //    close: function () {
    //        //ClearLockedInventory();
    //        //var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
    //        //$("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
    //        //$("#fgrdAvaliableInventoryGridList").focus();
    //        //var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
    //        //if (OrderNo == "0" || OrderNo == "") {
    //        //    $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
    //        //}
    //        //else {
    //        //    $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
    //        //}

    //    },
    //    buttons: {
    //        "Save": {
    //            text: "Save",
    //            id: "btnInvSave",
    //            click: function () {

    //                
    //                $(".YellowWarning_KMISC").hide();

    //                var CurrentselectedRowID = $("#lblInventorySelectedRowID_AddVETDetail").html();

    //                var OrderNo = $("#DivVETInvoiceNo").html();
    //                var CustomerNo = $("#CurrentCustomerNo").html();

    //                var QuantityEntered = (($("#txtQty_AddVETDetail").val() == "") ? $("#txtQty_AddVETDetail").attr('placeholder') : $("#txtQty_AddVETDetail").val());

    //                var Units = $("#lblFlowerUnits_AddVETDetail").html();

    //                var PlusFuel = (($("#txtPlusFuel_AddVETDetail").val() == "") ? $("#txtPlusFuel_AddVETDetail").attr('placeholder') : $("#txtPlusFuel_AddVETDetail").val());


    //                var Price = (($("#txtPrice_AddVETDetail").val() == "") ? $("#txtPrice_AddVETDetail").attr('placeholder') : $("#txtPrice_AddVETDetail").val());

    //                
    //                var Type = (($("#txtSaleType_AddVETDetail").val() == "") ? $("#txtSaleType_AddVETDetail").attr('placeholder') : $("#txtSaleType_AddVETDetail").val());
    //                var InventoryIDs = $("#AddUpdateVETDetail").data("inData")["InvenID"];
    //                var VETID = $("#AddUpdateVETDetail").data("inData")["VETID"]

    //                if (Type.trim() == "") {
    //                    $("#lstSaleType_AddVETDetail").focus();
    //                    return false;
    //                }
    //                if (VETID == "0" || VETID == "") {
    //                    if (parseInt($("#lblAvailableQty_AddVETDetail").html()) < parseInt(QuantityEntered)) {
    //                        $('#txtQty_AddVETDetail').focus();
    //                        $("#Inventorywarning").show();
    //                        return false;
    //                    }
    //                }

    //                $.ajax({
    //                    type: "POST",
    //                    url: 'BloomService.asmx/ADDUPDATEVETDetail',
    //                    data: "{'VETID':'" + VETID + "','Order': '" + OrderNo + "','Customer': '" + CustomerNo + "','InventoryIDs': '" + InventoryIDs + "','Quantity': '" +
    //                        QuantityEntered + "','Price': '" + Price + "','Type': '" + Type + "','Units':'0','PlusFuel':'" + PlusFuel + "'}",
    //                    contentType: "application/json; charset=utf-8",
    //                    dataType: "json",
    //                    success: function (output, status) {
    //                        
    //                        if (output.d == "LogOut") {
    //                            window.location.href = "Login.aspx"
    //                        }
    //                        else if (output.d == 'success') {
    //                            $("#AddUpdateVETDetail").dialog("close");
    //                            //$("#fgrdVETINVCustomer").empty();
    //                            $("#fgrdVETINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: OrderNo }], query: "", newp: 1 }).flexReload();
    //                        }
    //                        else {

    //                            $("#AddUpdateVETDetail").dialog("close");
    //                            //$("#DivKMISCDialog").dialog("close");
    //                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
    //                        }
    //                    }
    //                });


    //            }
    //        },
    //        "Cancel": function () {
    //            $("#AddUpdateVETDetail").dialog("close");
    //        }
    //    }
    //});

    $("[id^=VETDetailEdit_]").die("click").live("click", function () {
        //if ($("#ctl00_LoggedInUserType").html() == "sales person") {
        //      $.MessageBox("You do not have rights to modify this order!!!");
        //  }
        if ($("#ctl00_LoggedInUserType").html() == "sales person") {

            $.MessageBox("You do not have rights to modify this order!!!");
            $("#btnOrderVETFlip").hide();
            $("#btnVETDetailsVoid").hide();
            return false
        }
        //else if ($("#ctl00_LoggedInUserType").html() == "employee") {
        //    $.MessageBox("You do not have rights to modify this order!!!");
        //    return false
        //}
        else {
            debugger;
            var OrderNo = $("#DivVETInvoiceNo").html();
            var CustomerNo = $("#CurrentCustomerNo").html();
            var ID = $(this).attr('id').replace("VETDetailEdit_", "");
            // SelectedInvenId = $("#fgrdVETINVCustomer #row" + ID).find("td div").eq(23).text();
            SelectedInvenId = $("#VETDetailInvenId_" + ID).text();
            if (SelectedInvenId) { SelectedInvenId = SelectedInvenId.trim(); }
            //var SelectedAWB = $("#fgrdVETINVCustomer #row" + ID).find("td div").eq(8).text();
            //if (SelectedAWB) { SelectedAWB = SelectedAWB.trim(); }

            if ($("#VETDetailType_" + ID).html() == "K") {
                var para = 'Customer=' + CustomerNo + '&OrderNo=' + OrderNo + '&OrderDetailID=' + ID + '&CalledFromVET=' + "1";
                $(".imgLoaderForUser").show();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetPage',
                    data: '{ "controlName":"pages/PageADDEDITMISC.ascx","controlPara":"' + para + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        $('<div id="DivKMISCDialog">/div>').dialog({
                            title: 'EDIT KMISC',
                            autoOpen: false,
                            resizable: false,
                            modal: true,
                            width: 450,
                            close: function (event, ui) {

                                $(this).dialog('destroy').remove();
                            },
                            open: function () {

                                //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                            }
                        });
                        $("#DivKMISCDialog").html(output.d).dialog("open");
                    }
                });
            }
            else {
                $("#ctl00_DivOrderDetailID_OrderSave").html(ID);

                if (SelectedInvenId != 0 && SelectedInvenId != "") {
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/InsertLock',
                        data: "{ 'LockRecord': '" + SelectedInvenId + "','Page':'PageARINVS','Functionality':'InvenLock_Edit'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            //debugger;
                            var data = output.d;

                            if (data == "Logout") {
                                IsInventoryClick = false;
                                window.location.href = "Login.aspx"
                            }
                            else if (data == "error") {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                IsInventoryClick = false;
                            }
                            else if (data.indexOf("NotExist") >= 0 || data.indexOf("NoBoxes") >= 0) {
                                //debugger;
                                // $("#fgrdVETINVCustomer").flexReload({ url: '/url/for/refresh' });
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/GetVETDetailsByID',
                                    data: '{"ID":"' + ID + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output, status) {
                                        var orddet = output.d;

                                        var lineFuelCustomer = $(".hf_linefuel").html();
                                        if (lineFuelCustomer == "false") {
                                            $("#txtPlusFuel_AddOrderDetail").removeAttr("disabled");
                                            $("#txtPrice_AddOrderDetail").attr("disabled", "disabled");
                                        }
                                        else {
                                            $("#txtPlusFuel_AddOrderDetail").attr("disabled", "disabled");
                                            $("#txtPrice_AddOrderDetail").removeAttr("disabled");
                                        }

                                        $("#lblInvenIDs_AddOrderDetail").html(orddet.InvenID);
                                        $("#lblFlowerName_AddOrderDetail").html(orddet.NAME);
                                        $("#lblFlowerUnits_AddOrderDetail").html(orddet.Units);
                                        $("#txtQty_AddOrderDetail").attr('placeholder', orddet.Boxes);
                                        $("#txtQty_AddOrderDetail").val("");
                                        $("#lblUOM_AddOrderDetail").html(orddet.UOM);
                                        $("#txtPrice_AddOrderDetail").val("");
                                        $("#txtPlusFuel_AddOrderDetail").val("");
                                        $("#txtPrice_AddOrderDetail").attr('placeholder', parseFloat(orddet.Price).toFixed(4));
                                        $("#txtPlusFuel_AddOrderDetail").attr('placeholder', parseFloat(orddet.PlusFuel).toFixed(4));
                                        $("#lblFuel_AddOrderDetail").html(parseFloat(parseFloat(orddet.PlusFuel).toFixed(4) - parseFloat(orddet.Price).toFixed(4)).toFixed(4));
                                        //$("#txtPlusFuel_AddOrderDetail").attr('placeholder', parseFloat(orddet.FOB).toFixed(4));
                                        //$("#txtPlusFuel_AddOrderDetail").val(parseFloat(orddet.Fuel).toFixed(4));
                                        $("#lblAvailableQty_AddOrderDetail").html(orddet.AvailableBoxes);
                                        $("#lstSaleType_AddOrderDetail").val(orddet.Type);
                                        $("#txtSaleType_AddOrderDetail").attr('placeholder', orddet.Type);
                                        $("#txtBoxCode_AddOrderDetail").val(orddet.BoxCode);
                                        $("#txtStoreNo_AddOrderDetail").val(orddet.StoreNo);
                                        $("#txtUpcCode_AddOrderDetail").val(orddet.UPC);
                                        $("#txtDateCode_AddOrderDetail").val(orddet.DateCode);
                                        $("#txtFlowerName_AddOrderDetail").val(orddet.NAME);
                                        $("#lblCost_AddOrderDetail").html(orddet.Cost);
                                        $("#lblDimensions_AddOrderDetail").html(orddet.BoxLength + "x" + orddet.BoxWidth + "x" + orddet.BoxHeight);
                                        $("#AddOrderDetailFromInventoryDialog").data("inData", { InventoryId: SelectedInvenId }).dialog("open")
                                        $("#AddOrderDetailFromInventoryDialog").dialog('option', 'title', 'Update Order Detail');
                                    }
                                });
                            }
                            else if (data != "") {
                                //debugger;
                                var tmp = data.split("_")
                                ClearLockedInventoryOnVETDelete(function (callback) {
                                });
                                $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + " !");
                            }
                            else {
                                //debugger;
                                ClearLockedInventoryOnVETDelete(function (callback) {
                                });
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                        },
                    });
                } else {
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetFutureOrderDetailsByID',
                        data: '{"OrderDetailID":"' + ID + '", "ClosedInv":"1"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            var orddet = output.d;
                            if (orddet == "Logout") {
                                window.location.href = "Login.aspx"
                                return;
                            }
                            else if (orddet == "error") {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                return
                            }
                            else {
                                LoadUOM();
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/GetFarmListByFlower',
                                    data: "{'Flower':'" + orddet.Flower + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output, status) {
                                        $('#lstFarm_FutureOrderDetail').empty();
                                        var Typedata = output.d;
                                        $('#lstFarm_FutureOrderDetail').append('<option value="">Select</option>');
                                        $('#lstFarm_FutureOrderDetail').append(Typedata);
                                        LoadUOM_OrderUpdate();
                                        var FlowerCodeName = "[" + orddet.Flower + "] " + orddet.NAME;
                                        $("#txtFlower_FutureOrderDetail").val(FlowerCodeName);
                                        $("#txtFlower_FutureOrderDetail").attr("placeholder", FlowerCodeName);
                                        $("#txtUnitsPerBox_FutureOrderDetail").val(orddet.Units); // commented by Belal :: 30 Aug 2020
                                        $("#txtUnitsPerBox_FutureOrderDetail").attr("placeholder", orddet.Units);
                                        $("#txtQty_FutureOrderDetail").val(orddet.Boxes); // commented by Belal :: 30 Aug 2020
                                        $("#txtQty_FutureOrderDetail").attr("placeholder", orddet.Boxes);
                                        $("#hfFlower_FutureOrderDetail").val(orddet.Flower);
                                        $("#hfFlowerName_FutureOrderDetail").val(orddet.NAME);
                                        $("#txtPrice_FutureOrderDetail").attr("placeholder", orddet.Price.toFixed(3));
                                        $("#txtPrice_FutureOrderDetail").val(orddet.Price.toFixed(3)); // commented by Belal :: 30 Aug 2020
                                        $("#txtNotes_FutureOrderDetail").val(orddet.Notes);
                                        $("#txtBoxCode_FutureOrderDetail").val(orddet.BoxCode);
                                        $("#lstFarm_FutureOrderDetail").val(orddet.FarmCode);
                                        $("#hfFarm_FutureOrderDetail").val(orddet.FarmCode);
                                        $("#lstUOM_FutureOrderDetail").val(orddet.UOM);
                                        $("#hfUOM_FutureOrderDetail").val(orddet.UOM);
                                        $("#txtCost_FutureOrderDetail").val(orddet.Cost.toFixed(4));
                                        $("#txtCost_FutureOrderDetail").attr("disabled", "disabled");
                                        if (orddet.Price == 0 || orddet.Cost == 0) {
                                            $("#txtGPM_FutureOrderDetail").val(0);
                                        } else {
                                            let gpm = ((orddet.Price - orddet.Cost) / orddet.Price) * 100;
                                            $("#txtGPM_FutureOrderDetail").val(gpm);
                                        }

                                        //2021/08/24
                                        $("#txtUPC_FutureOrderDetail").val(orddet.UPC);
                                        $("#txtUPCPRICE_FutureOrderDetail").val(orddet.UPCPRICE);
                                        $("#txtDateCode_FutureOrderDetail").val(orddet.DateCode);

                                        $("#AddOrderDetailFromFutureDialog").dialog("open");
                                        $("#AddOrderDetailFromFutureDialog").dialog('option', 'title', 'Edit Future Order Detail');
                                        $("#AddOrderDetailFromFutureDialog").dialog('option', 'height', '500');
                                    }
                                });

                            }
                        }
                    });



                }
                
                //$.ajax({
                //    type: "POST",
                //    url: 'BloomService.asmx/GetVETDetailsByID',
                //    data: '{"ID":"' + ID + '"}',
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (output, status) {
                //        
                //        var orddet = output.d;
                //        var lineFuelCustomer = $(".hf_linefuel").html();
                //        if (lineFuelCustomer == "false") {
                //            $("#txtPlusFuel_AddVETDetail").removeAttr("disabled");
                //            $("#txtPrice_AddVETDetail").attr("disabled", "disabled");
                //        }
                //        else {
                //            $("#txtPlusFuel_AddVETDetail").attr("disabled", "disabled");
                //            $("#txtPrice_AddVETDetail").removeAttr("disabled");
                //        }
                //        
                //        $("#lblInvenIDs_AddVETDetail").html(orddet.InvenID);
                //        $("#lblFlowerName_AddVETDetail").html(orddet.NAME);
                //        $("#lblFlowerUnits_AddVETDetail").html(orddet.Units);
                //        $("#txtQty_AddVETDetail").attr('placeholder', orddet.Boxes);
                //        $("#txtQty_AddVETDetail").val("");
                //        $("#lblUOM_AddVETDetail").html(orddet.UOM);
                //        $("#txtPrice_AddVETDetail").val("");
                //        $("#txtPlusFuel_AddVETDetail").val("");
                //        $("#txtPrice_AddVETDetail").attr('placeholder', parseFloat(orddet.Price).toFixed(4));
                //        $("#txtPlusFuel_AddVETDetail").attr('placeholder', parseFloat(orddet.PlusFuel).toFixed(4));
                //        $("#lblFuel_AddVETDetail").html(parseFloat(parseFloat(orddet.PlusFuel).toFixed(4) - parseFloat(orddet.Price).toFixed(4)).toFixed(4));
                //        $("#txtPlusFuel_AddOrderDetail").attr('placeholder', parseFloat(orddet.FOB).toFixed(4));
                //        $("#txtPlusFuel_AddOrderDetail").val(parseFloat(orddet.Fuel).toFixed(4));
                //        $("#lblAvailableQty_AddVETDetail").html(orddet.AvailableBoxes);
                //        $("#lstSaleType_AddVETDetail").val(orddet.Type);
                //        $("#txtSaleType_AddVETDetail").attr('placeholder', orddet.Type);
                //        $("#AddUpdateVETDetail").dialog("open");
                //        $("#AddUpdateVETDetail").dialog('option', 'title', 'Update VET Detail');
                //        $("#AddUpdateVETDetail").data("inData", { VETID: ID, InvenID: orddet.InvenID }).dialog("open");
                //    }
                //});
            }
        }
    });
    function LoadUOM_OrderUpdate() {
        var length = $('#lstUOM_FutureOrderDetail > option').length;
        var farmcode = $("#lstFarm_FutureOrderDetail")[0].value;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForSPORD',
                data: '{"FarmCode":"' + farmcode.toUpperCase() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstUOM_FutureOrderDetail').empty();
                    var UOMdata = output.d;
                    $('#lstUOM_FutureOrderDetail').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstUOM_FutureOrderDetail').append('<option value="' + UOM.UOM + '">' + UOM.UOM + ' [' + UOM.SIZE + ']</option>');
                    }

                    if ($("#hfUOM_FutureOrderDetail").val() != "" && $("#hfUOM_FutureOrderDetail").val() != 0)
                        $('#lstUOM_FutureOrderDetail').val($("#hfUOM_FutureOrderDetail").val());
                    else
                        $("#lstUOM_FutureOrderDetail").val("QB");
                }
            });
        }
        else {
            $('#lstUOM_FutureOrderDetail').val($("#hfUOM_FutureOrderDetail").val());
        }
    }

    $("#txtPrice_AddVETDetail").focusout(function () {

        var Price = (($("#txtPrice_AddVETDetail").val() == "") ? $("#txtPrice_AddVETDetail").attr('placeholder') : $("#txtPrice_AddVETDetail").val());
        $("#txtPlusFuel_AddVETDetail").val(parseFloat(parseFloat(Price) + parseFloat($("#lblFuel_AddVETDetail").html())).toFixed(4));
    });

    $("#txtPlusFuel_AddVETDetail").focusout(function () {

        var PlusFuel = (($("#txtPlusFuel_AddVETDetail").val() == "") ? $("#txtPlusFuel_AddVETDetail").attr('placeholder') : $("#txtPlusFuel_AddVETDetail").val());
        $("#txtPrice_AddVETDetail").val(parseFloat(parseFloat(PlusFuel) - parseFloat($("#lblFuel_AddVETDetail").html())).toFixed(4));
    });


    $('input').keypress(function (e) {
        // 
        var key = e.which;
        if (key == 13) // the enter key code
        {


            for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                var a;
                if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                    a = i;
                }
                if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i && $(this).closest('tr').find('input')[i].disabled != true &&
                    $(this).closest('tr').find('input')[i].type != "hidden") {
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }
                else if (i == $(this).closest('tr').find('input').length - 1) {
                    if ($(this).closest('tr').next('tr').find('input').length > 0) {
                        $(this).closest('tr').next('tr').find('input')[0].focus();
                    }
                    else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0)
                        $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();
                    else if ($(this).attr('id') == "txtSaleType_AddVETDetail")
                        $(this).closest('div').next('div').find('button')[0].focus()
                    return false;
                }
            }
        }
    });

    $("#txtPrice_AddVETDetail").keypress(function (e) {
        if (e.which == 13) {
            $("#txtSaleType_AddVETDetail").focus();
        }
    });


    $("#txtQty_AddVETDetail").keypress(function (e) {
        if (e.which == 13) {
            if ($("#txtPrice_AddVETDetail").attr('disabled') == "disabled") {
                $("#txtPlusFuel_AddVETDetail").focus()
            }
            else {
                $("#txtPrice_AddVETDetail").focus()
            }
        }
    });




    $("#btnVETDetailsKMisc").click(function () {
        var OrderNo = $("#DivVETInvoiceNo").html();
        var CustomerNo = $("#CurrentCustomerNo").html();
        var para = 'Customer=' + CustomerNo + '&OrderNo=' + OrderNo + '&CalledFromVET=' + "1";
        $(".imgLoaderForUser").show();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageADDEDITMISC.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('<div id="DivKMISCDialog">/div>').dialog({
                    title: 'ADD KMISC',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 450,
                    closeOnEscape: true,
                    close: function (event, ui) {

                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                });
                $("#DivKMISCDialog").html(output.d).dialog("open");
            }
        });
    });




    //Voiding an order::it is like "delete" a line need to return everything into inventory and mark the f_order1.void with a 1
    $("#btnVETDetailsVoid").die('click').live("click", function (e) {
        var OrderNo = $("#DivVETInvoiceNo").html();
        var CustomerNo = $("#CurrentCustomerNo").html();
        $('<div id="DivVoidAnVET" style="">' +
            +'</div>').dialog({
                title: 'Void',
                autoOpen: false,
                resizable: false,
                modal: true,
                width: 500,
                buttons: {
                    Accept: function () {

                        if ($("#txtReasonVoidedVET").val().trim() == "") {
                            $("#txtReasonVoidedVET").focus();
                            return false;
                        }

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/VoidVET',
                            data: "{'OrderNo': '" + OrderNo + "','ReasonVoid':'" + $("#txtReasonVoidedVET").val() + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                $("#DivVoidAnVET").dialog('close');
                                if (output.d == "LogOut") {
                                    window.location.href = "Login.aspx"
                                }
                                else if (output.d == "success") {
                                    IsOrderModifiedAndNotSaved = false;
                                    $.MessageBox("Invoice# " + OrderNo + " voided successfully");

                                    $("#DivVETInvoiceGridDialog").dialog("close");
                                    $("#fgrdARINVCustomer").flexReload({ url: '/url/for/refresh' });
                                }
                                else if (output.d == "Order already voided") {
                                    $.MessageBox("Order voided already!!!");
                                    $("#DivVETInvoiceGridDialog").dialog("close");
                                    $("#fgrdARINVCustomer").flexReload({ url: '/url/for/refresh' });
                                }
                                else {
                                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                }
                            }
                        });
                    },
                    Cancel: function () {
                        $(this).dialog("close");
                    }

                },
                close: function (event, ui) {
                    $(this).dialog('destroy').remove();
                },
                open: function () {
                    $(".ui-dialog-buttonpane button:contains('Accept')").addClass('dialogbuttonstyle icon-save');
                    $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
                    $("#txtReasonVoidedVET").keypress(function (e) {
                        var key = e.which;
                        if (key == 13) // the enter key code
                        {

                            $("#DivVoidAnVET").next('div').find('button')[0].focus();
                        }
                    });
                },

            });
        $("#DivVoidAnVET").html("<div><b>Do you want to VOID  this sales invoice now?</b> <br/><br/> Please enter the reason to void this invoice<br/><input style='width:430px' id='txtReasonVoidedVET' maxlength='50'></input></div>");
        $("#DivVoidAnVET").dialog("open");
    });


    $("#btnOrderVETFlip").die("click").live("click", function () {

        $("#DialogFlipOrder_VET").dialog("open");        //flipinvoice()

    });

    //MANI:11/26/2018::Flip an invoice (Closed Order) from one customer to anouther customer
    $('#DialogFlipOrder_VET').dialog({
        title: 'Flip',
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 550,
        buttons: {
            Flip: function () {

                if ($("#txtCustSearchForFlip_VET").val().trim() == "" || $("#hfCustomerForFlip_VET").val() == "") {
                    $("#txtCustSearchForFlip_VET").focus();
                    return false;
                }

                if ($("#hfCustomerForFlip_VET").val() == $("#CurrentCustomerNo").html()) {
                    $.MessageBox("Cannot filp to the same customer!!!");
                    $("#txtCustSearchForFlip_VET").val("");
                    $("#hfCustomerForFlip_VET").val("");
                    $("#txtCustSearchForFlip_VET").focus();
                    return false;
                }
                var OrderNo = $("#DivVETInvoiceNo").html();
                var CustomerNo = $("#hfCustomerForFlip_VET").val();


                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/FlipOrder',
                    data: "{'OrderNo': '" + OrderNo + "','Customer':'" + CustomerNo + "','CalledFromVET':'1'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $("#DivVoidAnOrder").dialog('close');
                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d == "success") {

                            $("#DialogFlipOrder_VET").dialog("close");

                            //$.MessageBox("Invoice# " + $("#ctl00_DivOrderNo").html() + " flip successfully");



                            $("#msgsavehtml").html("Invoice# " + OrderNo + " flip successfully");
                            $("#msgbox-save").dialog("open");

                            $("#DivVETInvoiceGridDialog").dialog("close");
                            $("#fgrdARINVCustomer").flexReload({ url: '/url/for/refresh' });

                            //$("#fgrdVETINVCustomer").flexReload({ url: '/url/for/refresh' });

                            //if ($("#DivCurrentOrdersDialog").dialog('isOpen') == true) {
                            //    $("#fgrdCurrentOrderForCustomerHeader").flexReload({ url: '/url/for/refresh' });
                            //}
                        }
                        else if (output.d == "not exist") {

                            $.MessageBox("Customer " + $("#txtCustSearchForFlip_VET").val() + " not exist!! please enter valid customer");
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            },
            Cancel: function () {
                $(this).dialog("close");
            }

        },
        close: function (event, ui) {

        },
        open: function () {
            $("#txtCustSearchForFlip_VET").val("");
            $("#hfCustomerForFlip_VET").val("");
            $(".ui-dialog-buttonpane button:contains('Flip')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
            $("#txtCustSearchForFlip_VET").keypress(function (e) {
                var key = e.which;
                if (key == 13) // the enter key code
                {

                    $("#DialogFlipOrder_VET").next('div').find('button')[0].focus();
                }
            });
        },

    });

    $("#DeleteMiscDetail").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);

                var ID = $("#DeleteMiscDetail").data("ID");
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteVetMiscDetail',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",   
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdVETINVCustomer").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            adialog.dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            },
            No: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#txtCustSearchForFlip_VET").autocomplete({
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
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        },
        open: function (event, ui) {
            $(".ui-menu").css("z-index", 10000);
        },
        select: function (e, i) {
            $("#txtCustSearchForFlip_VET").val(i.item.Customer);
            $("#hfCustomerForFlip_VET").val(i.item.Customer);
        },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtCustSearchForFlip_VET").val("");
                $("#txtCustSearchForFlip_VET").focus();
                $("#hfCustomerForFlip_VET").val("");
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });


    $("#tdCreditCode,#lstCreditCode").keydown(function (e) {
        //$("#txtCreditReason2").focus();
        $("#txtCreditReason2").val($("#txtCreditReason2").val().replace("\n", "") + "\n");
        moveCursorToEnd($("#txtCreditReason2"));
        return false;
    });

    //function
    function moveCursorToEnd(input) {
        var originalValue = input.val();
        input.val('');
        input.blur().focus().val(originalValue);
    }

    //(function () {
    //    
    //    var searchInput = $("#txtCreditReason2");

    //    searchInput
    //      .putCursorAtEnd() // should be chainable
    //      .on("focus", function () { // could be on any event
    //          searchInput.putCursorAtEnd()
    //      });

    //})();

    //Inventory Sales List save process for VET:starts

    $("#btnVETDetailsADD").die('click').live('click', function () {
        $("#InventoryListForOrderEntryDialog").data("inData", { Page: "PageARINVS" }).dialog("open");
        //$("#InventoryListForOrderEntryDialog").dialog("open");
    });

    $("#btnOrderVETConsolView").die('click').live('click', function () {
        debugger
        $("#DivOrderVETConsolView").dialog('option', 'title', 'Consol View');
        $("#DivOrderVETConsolView").dialog("open");
        var orderno = $("#DivVETInvoiceGridDialog").data("inData")["Invoice"];
        $("#fgrdOrderVETConsolView").flexOptions({ params: [{ name: 'Invoice', value: orderno }, { name: 'Filter', value: "" }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
    });


    $("#DivOrderVETConsolView").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 990,
        height: 480,
        modal: true
    });

    $("#fgrdOrderVETConsolView").flexigrid({
        url: 'BloomService.asmx/VETOrderConsolView',
        dataType: 'xml',
        colModel: [
            { display: 'INV#', name: 'Order', width: 80, sortable: true, align: 'left', hide: true },
            { display: 'Flower', name: 'Flower', width: 100, sortable: true, align: 'left' },
            { display: 'Description', name: 'Name', width: 230, sortable: true, align: 'left' },
            { display: 'Farm', name: 'FarmCode', width: 30, sortable: true, align: 'left' },
            { display: 'Boxes', name: 'Boxes', width: 30, sortable: false, align: 'right' },/*jose changed :: left to right align*/
            { display: 'UOM', name: 'UOM', width: 30, sortable: false, align: 'left' },
            { display: 'Units', name: 'Units', width: 30, sortable: false, align: 'right' },
            { display: 'TotalUnits', name: 'TotalUnits', width: 60, sortable: false, align: 'right' },
            { display: 'FOB', name: 'FOB', width: 50, sortable: false, align: 'right' },
            { display: 'Total $', name: 'TotPerLine', width: 60, sortable: true, align: 'right' },
            { display: 'Dimentions', name: '', width: 90, sortable: true, align: 'right' },
            { display: 'Cubes', name: 'Cubes', width: 50, sortable: true, align: 'right' },
            { display: 'Weight', name: 'WEIGHT', width: 55, sortable: true, align: 'right' },
            { display: 'Cat', name: 'CAT', width: 40, sortable: true, align: 'left', hide: true },
            { display: 'Color', name: 'Color', width: 40, sortable: true, align: 'left', hide: true },
            { display: 'Variety', name: 'VARIETY', width: 80, sortable: true, align: 'left', hide: true },
            { display: 'Grade', name: 'GRADE', width: 50, sortable: true, align: 'left', hide: true },
        ],
        searchitems: [
            { display: 'INV#', name: 'Order' },
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'Name' },
            { display: 'Farm', name: 'FarmCode' },
            { display: 'Boxes', name: 'Boxes' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Units', name: 'Units' },
            { display: 'TotalUnits', name: 'TotalUnits' },
            { display: 'Dimentions', name: 'Dimentions' },
            { display: 'Weight', name: 'WEIGHT' },
            { display: 'Cubes', name: 'Cubes' },
            { display: 'Cat', name: 'CAT' },
            { display: 'Color', name: 'Color' },
            { display: 'Variety', name: 'Variety' },
            { display: 'Grade', name: 'Grade' },
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
        width: 965,
        height: 350,
        striped: true,
        params: [
            { name: 'Filter', value: '' },
            { name: 'Invoice', value: '' },
            { name: 'ExportCSV', value: '' }
        ],
        onSuccess: function () {
            debugger

            var sel = jQuery("#fgrdOrderVETConsolView tbody tr");
            var len = sel.length;
            if (len > 1) {
                $("#DivOrderVETConsolView #ExportCSV").show();
            }
            //$("#fgrdOrderVETConsolView").parent(".bDiv").find("table tr:last td").addClass("TotalRows");
            $('#fgrdOrderVETConsolView #row0').addClass("TotalRows");

            $("#DivOrderVETConsolView .sDiv").css('float', 'left').css('width', '542px');
            $('#DivOrderVETConsolView .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#DivOrderVETConsolView .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivOrderVETConsolView .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivOrderVETConsolView .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });



    function checkhasnegativeor0boxesInVETUpdateScreen() {
        var isvalid = true;
        $("[id^=VETDetailBoxes_").each(function () {
            //debugger;
            var orderdetid = $(this).attr("id").replace("VETDetailBoxes_", "");
            if (orderdetid != "0" && orderdetid != 0) {
                var boxes = $(this).html();
                if (parseFloat(boxes) <= 0) {
                    isvalid = false;
                }
            }
        });
        return isvalid;
    }

    $("#btnVETDetailsSave").die("click").live("click", function () {
        //debugger;

        var hasnegativeor0boxes = true;

        if (hasnegativeor0boxes) {
            var shippingdate = $("#txtShippingDate_Or1").val();
            if (shippingdate.endsWith("9") != true) {
                $.mask.definitions['#'] = "[0-9]";
                var get3placesyear = shippingdate.slice(6, 10);
                $("#txtShippingDate_Or1").mask("##/##/" + get3placesyear);
            }
            else {
                var nData = new Date();
                $.mask.definitions['#'] = "[0-9]";
                $.mask.definitions['9'] = null;
                var getyear = nData.getFullYear().toString();
                var get3placesyear = getyear.slice(0, 3);
                $("#txtShippingDate_Or1").mask("##/##/" + get3placesyear + "9");
            }
            GetWarehouseForVet();
            $("#messageOrSaveclicked_OrderSave").html("save");
            $("#IncludeMessageConfirmDlg").dialog("open");
        }
        else {
            $.MessageBox("Boxes cannot be 0 or less than 0. Unable to save this order!!!");
        }

    });

    // added by Belal :: 12 Nov 2020
    function GetWarehouseForVet() {
        var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/GetSaveOrderWarehouseForVet',
            data: '{"OrderNo":"' + OrderNo + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                if (output.d == null || output.d == "") {
                    $("#txtSaveWarehouse").val("");
                    $("#divWHForInvoice").html("");
                    $("#txtSaveWarehouse").addClass("hideForEmptyWareHouse");
                    $("#SaveWareHouseDDL").removeClass("hideForEmptyWareHouse");
                    LoadWareHouseDDLDataForVet();
                } else {
                    var initalData = output.d.split('--');
                    var result = initalData[0].split('~');
                    $("#txtSaveWarehouse").val(result[1]);
                    $("#divWHForInvoice").html(result[0]);
                    $("#txtShippingDate_Or1").val(initalData[1]);

                    $("#SaveWareHouseDDL").addClass("hideForEmptyWareHouse");
                    $("#txtSaveWarehouse").removeClass("hideForEmptyWareHouse");
                }
            }
        });

    }

    // added by Belal :: 12 Nov 2020
    function LoadWareHouseDDLDataForVet() {
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/LoadWareHouseDDLData',
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#SaveWareHouseDDL").empty();
                $("#SaveWareHouseDDL").append($('<option></option>').val("-1").html("Select"));
                $.each(output.d, function (i, item) {
                    $('#SaveWareHouseDDL').append($('<option></option>').val(item.Code).html(item.Name));
                });
                var hasDefault = 0;
                var FirstItemCode = "";
                var DefaultItemCode = "";
                $.each(output.d, function (i, item) {
                    if (i == 0) {
                        FirstItemCode = item.Code;
                    }
                    if (item.IsDefault == "1") {
                        hasDefault = 1;
                        DefaultItemCode = item.Code;
                    }
                });
                if (hasDefault == 1) {
                    $('#SaveWareHouseDDL').val(DefaultItemCode).trigger("change");
                } else {
                    $('#SaveWareHouseDDL').val(FirstItemCode).trigger("change");
                }
            }
        });
    }

    $("#btnVETDetailsShipto").die("click").live("click", function () {
        $("#DivShiptoDialog_Ordersave").dialog("open");
    });

    $("#btnVETDetailsMessage").die("click").live("click", function () {
        $("#messageOrSaveclicked_OrderSave").html("message");
        $("#DivCustomerMessageDialog").dialog("open");
    });

    document.body.addEventListener('keydown', function (e) {
        // 


        var focused = document.activeElement;

        var zindex = [];
        var divname = [];
        for (i = 0; i < $(".ui-dialog:visible").length; i++) {
            var ss = $(".ui-dialog:visible")[i].style.zIndex
            zindex.push($(".ui-dialog:visible")[i].style.zIndex);
            divname.push($(".ui-dialog:visible")[i].lastChild.id);
        }

        function indexOfMax(arr) {

            if (arr.length === 0) {
                return -1;
            }

            var max = arr[0];
            var maxIndex = 0;

            for (var i = 1; i < arr.length; i++) {
                if (arr[i] > max) {
                    maxIndex = i;
                    max = arr[i];
                }
            }

            return maxIndex;
        }

        var lastchlid1 = ""
        var max = indexOfMax(zindex);
        try {
            lastchlid1 = $(".ui-dialog:visible")[max].lastChild.id
        }
        catch (ex) {
            return false
        }

        if (lastchlid1 == "DivVETInvoiceGridDialog" && focused.className != "qsbox") {


            if ((e.metaKey || e.altKey) && e.which === 113) {
                $("#DialogFlipOrder_VET").dialog("open");

            }

            if (e.which == 65) {    //Click A - ADD
                $("#btnVETDetailsADD").click();
            }
            if (e.which == 75) {    //Click K - K-Misc
                $("#btnVETDetailsKMisc").click();
            }
            if (e.which == 83) {    //Click S - Save
                $('#btnVETDetailsSave').click();
            }
            if (e.which == 77) {    //Click M - Email
                $('#btnVETEmail').click();
            }


        }
    });

    $("[id^=deleteAdjustment_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('deleteAdjustment_', '');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteAdjustmentbyID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                $("#fgrdARINVTransactions").flexReload({ url: '/url/for/refresh' });  
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });
</script>


