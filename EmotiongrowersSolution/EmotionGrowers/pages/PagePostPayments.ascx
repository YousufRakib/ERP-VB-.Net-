<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PagePostPayments.ascx.vb" Inherits="pages_PagePostPayments" %>
<link rel="stylesheet" href="css/Filters.css">
<script type="text/javascript" src="js/jquery.fileDownload.js"></script>
<script src="zoom_assets/jquery.smoothZoom.min.js"></script>
<link rel="stylesheet" href="css/progressbar.css">
<script type="text/javascript" src="js/progressbar.js"></script>
<script src="js/validation.js"></script>

<style type="text/css">
    ::-webkit-input-placeholder { /* WebKit, Blink, Edge */
        font-weight: 500;
    }

    :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
        opacity: 1;
        font-weight: 500;
    }

    ::-moz-placeholder { /* Mozilla Firefox 19+ */
        opacity: 1;
        font-weight: 500;
    }

    :-ms-input-placeholder { /* Internet Explorer 10-11 */
        font-weight: 500;
    }

    /*.TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }

    #row0 {
        color: red;
        text-decoration: none;
    }

        #row0 td {
            border: 0px;
        }

            #row0 td.sorted {
                background-color: #72C97D;
                border: 0px;
            }

            /*css color and alignment for row above the grid*
            #row0 td:nth-child(2) div {
                color: red;
                background-color: #72C97D;
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                padding-bottom: 3px;
                font-size: 14px;
            }

            #row0 td:nth-child(3) div {
                color: red;
                background-color: #72C97D;
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                padding-bottom: 3px;
                font-size: 14px;
            }*/

    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }


    .DepositImport {
        background: url(images/dl_icon_sm.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 10.56px;
        height: 16px;
        cursor: pointer;
        color: #2D7929;
        font-weight: bold;
    }

    .DepositInsert {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 10.56px;
        height: 16px;
        cursor: pointer;
        color: #2D7929;
        font-weight: bold;
    }

    .filter {
        /*background: url(images/EmptyFilter.png) no-repeat 10px 0px;*/
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .depdateokbtn {
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

    .trSelectedHeader {
        background-color: red !important;
    }

    .depdateokbtn:hover {
        background-color: #378de5;
        color: #ffffff;
    }

    .tdclass {
        padding: 5px;
        background-color: #D9E4ED;
    }

    input[type="checkbox"] + label span {
        float: right;
        margin-left: 4px;
    }

    .import {
        background: url(images/dl_icon_sm.png) no-repeat 10px -2px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 18px;
    }

    div.ibutton-label-off {
        background-color: rgb(132, 160, 84);
    }

    div.ibutton-label-on {
        color: #fff;
        text-shadow: 0 -1px 2px rgba(0, 0, 0, 0.4);
        left: 0;
        padding-top: 2px;
        z-index: 1;
        background-color: rgb(132, 160, 84);
    }

    .bgCustPayARINVDetails {
        background-color: red !important;
    }

    #MsgHtml {
        font-weight: bold;
    }

    #DivCustPayARINVDetails .flexigrid div.bDiv tr:hover td,
    #DivCustPayARINVDetails .flexigrid div.bDiv tr:hover td.sorted,
    #DivCustPayARINVDetails .flexigrid div.bDiv tr.trOver td.sorted,
    #DivCustPayARINVDetails .flexigrid div.bDiv tr.trOver td {
        background-color: transparent !important;
        color: black;
    }

        #DivCustPayARINVDetails .flexigrid div.bDiv tr:hover td a {
            color: initial;
        }
</style>

<div>
    <div class="slidediv" style="overflow: visible; display: block; height: 50px;">
        <table>
            <tr>
                <td style="vertical-align: top" colspan="2">
                    <table>
                        <tr>
                            <td>
                                <div class="filterbutton" id="divPostPaymentsDate">
                                    <table style="width: 100%; height: 100%;" id="tblPostPaymentsDate">
                                        <tr>
                                            <td style="font-size: 11px">
                                                <img id="imgPostPaymentsDate" src="images/EmptyFilter.png" class="FilterImageStyle" />
                                                DATE PERIOD
                                            </td>
                                        </tr>
                                        <tr id="trPostPayments" style="height: 18px; text-align: center;">
                                            <td>
                                                <label class="DivFilterLabelStyle" id="lblPostPaymentschosendate"></label>
                                                <label class="DivFilterLabelStyle" style="display: none" id="lblPostPaymentschosendate1"></label>
                                                <label class="DivFilterLabelStyle" style="display: none" id="lblPostPaymentschosendate2"></label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td class="tdDepositPayments" style="border-right: black; border-width: 5px;">
                                <span id="btnImport" class="DepositImport" >ReBuild Deposits</span>
                            </td>
         
                            <td style="border-right: black; padding-left: 6px; padding-right: 20px; /*border-right: 1px solid darkgray; */">
                                <span id="btnDepositAdd" class="DepositInsert">Add</span>
                            </td>
                            <td>
                                <input type="button" id="btnCreditCardPayments" value="Credit Card Payments" class="BloomButtonEnabled">
                            </td>
                            <td>
                                <input type="button" id="btnDepositListing" style="display: none;" value="Back to Deposits" class="BloomButtonEnabled">
                            </td>
                            <td class="tdDepositPayments" style="border-right: black; padding-left: 6px; padding-right: 48px; /*border-right: 1px solid darkgray; */">
                                <select id="lstPostPayments" class="PostPayments" style="font-weight: bold; font-size: 13px; width: 200px; margin-left: 10px; margin-top: 5px; display: none;">
                                    <%--<option style="font-weight: bold;" selected>Select Action</option>--%>
                                    <option value="ByCustomer" selected>Post Payment by Customer</option>
                                    <option value="ByInvoice">Post Payment By Invoice</option>
                                    <option value="ByPO">Post Payment by PO</option>
                                    <option value="ByNonARDeposit">Post Non A/R Deposit</option>
                                    <option value="ByPostAFile">Post A File</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="rowcss" id="trPostPaymentsdatetitle">
                <td style="vertical-align: top">
                    <div id="divPostPaymentsdateFilter" class="filterdiv" style="display: none; width: 450px; height: 240px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 450px; height: 240px;">
                            <table>
                                <tr>
                                    <td>From
                                    </td>
                                    <td>
                                        <input type="text" id="txtPostPaymentsfrmdate" style="width: 80px;" />
                                    </td>
                                    <td>To
                                    </td>
                                    <td>
                                        <input type="text" id="txtPostPaymentstodate" style="width: 80px" />
                                    </td>
                                    <td>
                                        <input type="button" class="depdateokbtn" id="btnPostPaymentsdateok" value="Ok" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align: top;">
                                        <div id="divPostPaymentsFromDate" style="max-height: 162px; vertical-align: top;"></div>
                                    </td>
                                    <td colspan="3" style="vertical-align: top;">
                                        <div id="divPostPaymentsToDate" style="max-height: 162px; vertical-align: top;"></div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <table>
        <tr>
            <td style="vertical-align: top;" class="tdDepositPayments">
                <div id="DivDepositHeader">
                    <table id="fgrdDepositHeader" style="display: block;"></table>
                </div>
            </td>
            <td id="tdhide1" style="background-color: rgb(200, 157, 157); cursor: pointer; display: none; vertical-align: top;" class="tdDepositPayments">
                <span id="btnhide1" style="font-size: initial; line-height: 500px;"><<</span>
            </td>
            <td style="vertical-align: top;" class="tdDepositPayments">
                <div id="DivDepositDetails" style="display: none;">
                    <table id="fgrdDepositDetails"></table>
                </div>
            </td>
            <td id="tdhide2" style="background-color: rgb(200, 157, 157); cursor: pointer; display: none; vertical-align: top;" class="tdDepositPayments">
                <span id="btnhide2" style="font-size: initial; line-height: 500px;"><<</span>
            </td>
            <td style="vertical-align: top;" class="tdDepositPayments">
                <div id="DivCheckDetails" style="display: none;">
                    <table id="fgrdCheckDetails"></table>
                </div>
            </td>

            <td style="vertical-align: top; display: none;" class="tdCreditCardPayments">
                <div id="DivCreditCardHeader">
                    <table id="fgrdCreditCardHeader" style="display: block;"></table>
                </div>
            </td>
            <td style="vertical-align: top;">
                <div id="DivCreditCardDetailsByCustomer" style="display: none;">
                    <table id="fgrdCreditCardDetailsByCustomer"></table>
                </div>
            </td>
            <td style="vertical-align: top;">
                <div id="DivCreditCardDetailsByInvoice" style="display: none;">
                    <table id="fgrdCreditCardDetailsByInvoice"></table>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="msgbox-select" class="DialogDiv" style="display: none;" title="Alert">
    <div class="DialogBreak">
        <p id="msg" class="DeleteDialogMsg"></p>
    </div>
</div>

<div style="display: none" id="DivHeaderID">0</div>
<div style="display: none" id="DivDetailID">0</div>
<div style="display: none" id="DivCheckDetailID">0</div>
<div style="display: none;" id="DivCustPayARIVDetailID1">0</div>

<div style="display: none" id="DivCCHeaderID">0</div>
<div style="display: none" id="DivCCDetailID">0</div>
<div style="display: none" id="DivCustomer"></div>

<div id="MsgDepositDelWarning" style="display: none;">
    <p id="MsgDepositDelHtml"></p>
</div>

<div id="MsgPaymentsDetailDelWarning" style="display: none;">
    <p id="MsgPaymentsDetailDelHtml"></p>
</div>


<div id="DialogNewDeposit" style="display: none">
    <table>
        <tbody style="font-weight: bold;">
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Deposit #</label>
                </td>
                <td>
                    <input type="text" id="txtNewDepositNum" style="width: 80px; margin-left: 10px; text-align: right;" tabindex="1" class=" ClsNumbersOnly">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Date</label>
                </td>
                <td>
                    <input type="text" id="txtNewDepositDate" style="width: 80px; margin-left: 10px; text-align: left;" tabindex="2">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Total Amount</label>
                </td>
                <td>
                    <input type="text" id="txtNewDepositAmount" class="ClsTwoDecimalsOnly" placeholder="0.00" style="width: 80px; margin-left: 10px; text-align: right;" value="0.00" tabindex="3">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Enter Bank</label>
                </td>
                <td>
                    <input type="text" id="txtNewDepositBank" style="width: 20px; margin-left: 10px; text-align: right;" maxlength="1" placeholder="1" tabindex="4">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="DialogPayByInvoice" style="display: none">
    <table style="margin-left: 40px;">
        <tbody style="font-weight: bold;">
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Invoice #</label>
                </td>
                <td>
                    <input type="text" id="txtInvPayInvoice" class="InvPay" style="width: 80px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0" tabindex="1">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Customer</label>
                </td>
                <td>
                    <input type="text" id="txtInvPayCustomer" class="InvPay PayByInv" readonly="readonly" style="width: 80px; margin-left: 10px; text-align: right;" placeholder="0"> 
                    <span id="CustNameInv"></span>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">PO#</label>
                </td>
                <td>
                    <input type="text" id="txtInvPayPO" class="InvPay PayByInv" readonly="readonly" style="width: 100px; margin-left: 10px; text-align: left;" placeholder="">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Amount Open</label>
                </td>
                <td>
                    <input type="text" id="txtInvPayAmount" class="InvCustPay" style="width: 120px; margin-left: 10px; text-align: right;" maxlength="13" placeholder="0.00">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Discount</label>
                </td>
                <td>
                    <input type="text" id="txtInvPayDiscount" class="InvCustPay ClsTwoDecimalsOnly" style="width: 120px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0.00">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">G/L</label>
                </td>
                <td>
                    <input type="text" id="txtInvPayGL" class="InvCustPay" style="width: 120px; margin-left: 10px; text-align: right;" maxlength="20">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Check #</label>
                </td>
                <td>
                    <input type="text" id="txtInvPayCheck" class="InvPay PayByInv" style="width: 80px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0" tabindex="2">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Date</label>
                </td>
                <td>
                    <input type="text" id="txtInvPayDate" class="InvPay" style="width: 80px; margin-left: 10px; text-align: left;" tabindex="3" maxlength="8">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Bank</label>
                </td>
                <td>
                    <input type="text" id="txtInvPayBank" class="InvPay PayByInv" style="width: 20px; margin-left: 10px; text-align: right;" maxlength="1" placeholder="1" tabindex="4">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="DialogPayByCustomerSearch" style="display: none; margin-top: 20px;">
    <table>
        <tr>
            <td>
                <label>Customer# / Name : </label>
            </td>
            <%--<select id="lstCustPaySearch"  multiple style="width: 350px;" ></select>--%>
            <td>
                <input type="text" id="txtCustPaySearch" style="width: 300px;" />
            </td>
            <td style="padding-top: 6px;">
                <input type="checkbox" id="chkCustPayParent">
                <label for="chkCustPayParent"><span style="padding: 1px; float: left; margin-top: -1px;"></span>Parent</label>
            </td>
        </tr>
    </table>
</div>

<div id="DialogCustPayARINVDetails" style="display: none;">
    <table style="width: 100%;">
        <tr>
            <td style="font-size: 14px; font-weight: bold; position: absolute;">
                <div style="margin-top: 6px; display: none;" id="DivBtnPaymentByIvoiceForCurrentOrders">
                    <input id="BtnPaymentByIvoiceForCurrentOrders" type="button" class="BloomButtonEnabled" value="Pay By Invoice" style="margin-left: 5px; width: 100px;">
                </div>
            </td>
            <td style="margin-top: 43px; font-size: 14px; font-weight: bold; width: 630px; margin-left: 420px; position: absolute;">
                 <table>
                    <tr>
                        <td style="padding-right: 3px;">Unapplied on file</td>
                        <td style="text-align: right;">
                            <a href="#" class="aUnAppliedAmountForCustomer_postpayments" style="color: Red; font-weight: bold;"></a>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="vertical-align: top; float: right; width: 220px;">
                <div id="DivCustPayARINVDepositDetails" style="width: 215px; height: 60px; float: left;">
                    <table style="font-size: 14px; font-weight: bold; float: right;">
                        <tr id="trARINVDepositDetails" style="/*display: none; */ height: 22px;">
                            <td style="width: 90px;">
                                <label>Deposit#</label>
                            </td>
                            <td style="width: 120px;">
                                <label id="lblARINVDeposit">0</label>
                            </td>
                        </tr>
                        <tr id="trARINVCreditCard" style="display: none;">
                            <td style="width: 90px;">
                                <label>Credit Card</label>
                            </td>
                            <td style="width: 120px;">
                                <label id="lblARINVCreditCardType"></label>
                            </td>
                        </tr>
                        <tr style="height: 22px;">
                            <td>
                                <label>Date</label>
                            </td>
                            <td>
                                <label id="lblARINVDate"></label>
                            </td>
                        </tr>
                        <tr style="height: 22px;">
                            <td>
                                <label>Balance</label>
                            </td>
                            <td>
                                <label id="lblARINVBalance" style="text-align: right;">0.00</label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="vertical-align: top; width: 250px;">
                <div id="DivCustPayARINVCheckCashDetails" style="height: 60px; float: right; margin-right: 20px;">
                    <table style="font-size: 14px; font-weight: bold; float: right;">
                        <tr id="trCustPayCheckDetails" style="display: none; height: 22px;">
                            <td>
                                <label class="showCashAndCheck" style="margin-left: 36px;">Check# : </label>
                            </td>
                            <td>
                                <label id="lblCustPayCheck" class="showCashAndCheck">0</label>
                            </td>
                        </tr>
                        <tr id="trCustPayCashDetails" style="height: 22px;">
                            <td>
                                <label class="showCashAndCheck" style="margin-left: 34px;">Amount : </label>
                            </td>
                            <td style="text-align: right;">
                                <label id="lblCustPayCash" class="showCashAndCheck">0.00</label>
                            </td>
                        </tr>
                        <tr id="trCustPayBalanceLeftDetails" style="height: 22px;">
                            <td>
                                <label class="showCashAndCheck">Balance Left : </label>
                            </td>
                            <td style="text-align: right;">
                                <label id="lblCustPayBalanceLeft" class="showCashAndCheck">0.00</label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div id="DivCustPayARINVDetails">
                    <table id="fgrdCustPayARINVDetails" style="display: none; font-size: 14px;"></table>
                    <table id="fgrdCustPayARINVDetailsCopy" style="display: none;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div style="margin-top: 6px; display: block;" id="DivBtnPaymentDetails">
                    <button id="btnCustPayCash" type="button" class="BloomButtonEnabled" value="CASH" style="margin-left: 5px; width: 55px;">C<span style="text-decoration: underline">A</span>SH</button>
                    <button id="btnCustPayCheck" type="button" class="BloomButtonEnabled" value="CHECK" style="margin-left: 5px; width: 55px;">C<span style="text-decoration: underline">H</span>ECK</button>
                    <button id="btnCustPayCreditCard" type="button" class="BloomButtonEnabled" value="CREDIT CARD" style="margin-left: 5px; width: 100px;">C<span style="text-decoration: underline">R</span>EDIT CARD</button>
                    <button id="btnCustPayCCApply" type="button" class="BloomButtonEnabled" value="Apply Payment" style="margin-left: 5px; width: 100px; display: none;">Apply Payment</button>
                    <button id="btnCustPayUnapplied" type="button" class="BloomButtonEnabled " value="UNAPPLIED" style="margin-left: 5px; width: 80px;"><span style="text-decoration: underline">U</span>NAPPLIED</button>
                    <button id="btnCustPayViewOpen" type="button" class="BloomButtonEnabled " disabled="disabled" value="View Open" style="width: 85px; background: red"><span style="text-decoration: underline">V</span>iew Open</button>
                    <button id="btnCustPayViewZeroBlnceInvoice" type="button" class="BloomButtonEnabled" value="Show 0's" style="width: 85px;"><span style="text-decoration: underline">S</span>how 0's</button>
                </div>
                <div style="margin-top: 6px; display: none;" id="DivBtnPaymentExitDetails">
                    <input id="btnCustPayExit" type="button" class="BloomButtonEnabled" value="Exit" style="margin-left: 5px; width: 55px;">
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="DialogCustPayCashAndCheck" style="display: none; margin-top: 10px; margin-bottom: 10px">
    <table style="margin-left: 20px; font-size: 13px;">
        <tr id="trCustPayNoCheck" style="display: none;">
            <td>
                <input type="text" id="txtCustPayNoCheck" class="ClsNumbersOnly" style="width: 100px;" maxlength="8" />
            </td>
        </tr>

        <tr id="trCustPayCheck" style="display: none;">
            <td>
                <label>Check# : </label>
            </td>
            <td>
                <input type="text" id="txtCustPayCheck" class="ClsNumbersOnly" style="width: 100px;" maxlength="8" />
            </td>
        </tr>
        <tr id="trCustPayCash" style="display: none;">
            <td>
                <label>Amount : </label>
            </td>
            <td>
                <input type="text" id="txtCustPayCash" <%--class="ClsTwoDecimalsOnly"--%> style="width: 130px; text-align: right;" maxlength="15" placeholder="0.00" />
            </td>
        </tr>
    </table>
</div>

<div id="DialogPayByCustomer" style="display: none">
    <table style="margin-left: 85px;">
        <tbody style="font-weight: bold;">
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Invoice #</label>
                </td>
                <td>
                    <input type="text" id="txtCustomerPayInvoice" class="CustomerPay" style="width: 80px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0" tabindex="1">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Customer</label>
                </td>
                <td>
                    <input type="text" id="txtCustomerPayCustomer" class="CustomerPay" readonly="readonly" style="width: 80px; margin-left: 10px; text-align: right;" placeholder="0">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">PO#</label>
                </td>
                <td>
                    <input type="text" id="txtCustomerPayPO" class="CustomerPay" readonly="readonly" style="width: 100px; margin-left: 10px; text-align: left;" placeholder="">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Amount Paid</label>
                </td>
                <td>
                    <input type="text" id="txtCustomerPayAmount" class="InvCustPay ClsTwoDecimalsOnly" style="width: 120px; margin-left: 10px; text-align: right;" maxlength="13" placeholder="0.00">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Discount</label>
                </td>
                <td>
                    <input type="text" id="txtCustomerPayDiscount" class="InvCustPay ClsTwoDecimalsOnly" style="width: 120px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0.00">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">G/L</label>
                </td>
                <td>
                    <input type="text" id="txtCustomerPayGL" class="InvCustPay" style="width: 120px; margin-left: 10px; text-align: right;" maxlength="20">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Check #</label>
                </td>
                <td>
                    <input type="text" id="txtCustomerPayCheck" class="CustomerPay" style="width: 80px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0" tabindex="2">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Date</label>
                </td>
                <td>
                    <input type="text" id="txtCustomerPayDate" class="CustomerPay" style="width: 80px; margin-left: 10px; text-align: left;" tabindex="3" maxlength="8">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Bank</label>
                </td>
                <td>
                    <input type="text" id="txtCustomerPayBank" class="CustomerPay" style="width: 20px; margin-left: 10px; text-align: right;" maxlength="1" placeholder="1" tabindex="4">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="DialogPayByPO" style="display: none">
    <table style="margin-left: 40px;">
        <tbody style="font-weight: bold;">
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">PO#</label>
                </td>
                <td>
                    <input type="text" id="txtPOPayPO" class="InvPay" style="width: 100px; margin-left: 10px; text-align: left;" placeholder="">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Customer</label>
                </td>
                <td>
                    <input type="text" id="txtPOPayCustomer" class="InvPay" readonly="readonly" style="width: 80px; margin-left: 10px; text-align: right;" placeholder="0">
                    <span id="CustNamePO"></span>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Invoice #</label>
                </td>
                <td>
                    <input type="text" id="txtPOPayInvoice" class="InvPay" readonly="readonly" style="width: 80px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0" tabindex="1">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Amount Open</label>
                </td>
                <td>
                    <input type="text" id="txtPOPayAmount" class="InvCustPay" style="width: 120px; margin-left: 10px; text-align: right;" maxlength="13" placeholder="0.00">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Discount</label>
                </td>
                <td>
                    <input type="text" id="txtPOPayDiscount" class="InvCustPay ClsTwoDecimalsOnly" style="width: 120px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0.00">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">GL</label>
                </td>
                <td>
                    <input type="text" id="txtPOPayGL" class="InvCustPay ClsTwoDecimalsOnly" style="width: 120px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0.00">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Check #</label>
                </td>
                <td>
                    <input type="text" id="txtPOPayCheck" class="InvPay" style="width: 80px; margin-left: 10px; text-align: right;" maxlength="10" placeholder="0" tabindex="2">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Date</label>
                </td>
                <td>
                    <input type="text" id="txtPOPayDate" class="InvPay" style="width: 80px; margin-left: 10px; text-align: left;" tabindex="3" maxlength="8">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td>
                    <label style="font-size: 17px;">Bank</label>
                </td>
                <td>
                    <input type="text" id="txtPOPayBank" class="InvPay" style="width: 20px; margin-left: 10px; text-align: right;" maxlength="1" placeholder="1" tabindex="4">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="msgbox-CustPayARINVDetails" style="display: none;" title="Alert">
    <p id="msgCustPayARINVDetailsHtml"></p>
</div>

<div style="display: none;" id="DivConfirmAppliedAmount"></div>

<div id="MsgWarning" style="display: none;">
    <p id="MsgHtml"></p>
</div>

<div id="MsgPrintWarning" style="display: none;">
    <p id="MsgPrintHtml" style="font-weight: bold;"></p>
</div>

<div id="MsgAutoPostPaymentsWarning" style="display: none;">
    <p id="MsgAutoPostPaymentsHtml"></p>
</div>

<div id="DialogPostAFile" style="display: none">
    <table>
        <tbody style="font-weight: bold;">
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Deposit #</label>
                </td>
                <td>
                    <input type="text" id="txtFileDepositNum" style="width: 80px; margin-left: 10px; text-align: right;" tabindex="1">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Date</label>
                </td>
                <td>
                    <input type="text" id="txtFileDepositDate" style="width: 80px; margin-left: 10px; text-align: left;" tabindex="2">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Total Amount</label>
                </td>
                <td>
                    <input type="text" id="txtFileDepositAmount" class="ClsTwoDecimalsOnly" placeholder="0.00" style="width: 80px; margin-left: 10px; text-align: right;" value="0.00" tabindex="3">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Enter Bank</label>
                </td>
                <td>
                    <input type="text" id="txtFileDepositBank" style="width: 20px; margin-left: 10px; text-align: right;" maxlength="1" placeholder="1" tabindex="4">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Enter Check#</label>
                </td>
                <td>
                    <input type="text" id="txtFileDepositCheck" style="width: 80px; margin-left: 10px; text-align: right;" maxlength="8" tabindex="4">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="DialogUploadExcelFile" style="display: none;">
    <table>
        <tr>
            <td colspan="2" style="height: 28px">
                <div class="YellowWarning" align="center">
                </div>
            </td>
        </tr>
        <tr style="height: 30px;">
            <td>
                <label style="font-size: 17px;">Upload a file :  </label>
            </td>
            <td>

                <form action="UploadPaymentsPostAFile.aspx" method="post" enctype="multipart/form-data" id="postafileuploader" target="upload_target" onsubmit="startPaymentsPostAFileUpload();">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <input type="text" name="hdnheaderfileid" id="hdnheaderfileid" style="display: none;" />
                                <p id="uploadFile_process">
                                    <br />
                                    Uploading...<br />
                                    <br />
                                    <img src="images/uploading.gif" /><br />
                                </p>
                                <p id="uploadFile_form" align="left">
                                    <input name="txtPostAFile" id="txtPostAFile" accept=".csv" type="file" size="30" />
                            </td>
                        </tr>

                    </table>

                </form>
            </td>
        </tr>
    </table>
</div>

<div id="DialogNewCreditCard" style="display: none">
    <table>
        <tbody style="font-weight: bold;">
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Payment Amount</label>
                </td>
                <td>
                    <input type="text" id="txtNewCCAmount" class="ClsTwoDecimalsOnly" placeholder="0.00" style="width: 80px; margin-left: 10px; text-align: right;" tabindex="1">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Credit Card Type</label>
                </td>
                <td>
                    <select id="lstNewCCType" tabindex="2" style="margin-left: 10px;">
                        <option>AMEX</option>
                        <option>VISA</option>
                        <option>MASTERCARD</option>
                        <option>DISCOVER</option>
                    </select>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Approval Code</label>
                </td>
                <td>
                    <input type="text" id="txtNewCCApprovalCode" style="width: 120px; margin-left: 10px; text-align: left;" maxlength="8" tabindex="3">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Payment Date</label>
                </td>
                <td>
                    <input type="text" id="txtNewCCDate" class="datecontrol" style="width: 80px; margin-left: 10px; text-align: left;" tabindex="4">
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>
                    <label style="font-size: 17px;">Enter Bank</label>
                </td>
                <td>
                    <input type="text" id="txtNewCCBank" style="width: 20px; margin-left: 10px; text-align: right;" maxlength="1" placeholder="1" tabindex="4">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="MsgCreditCardDelWarning" style="display: none;">
    <p id="MsgCreditCardDelHtml"></p>
</div>

<div id="DialogPaymentsTransactions">
    <table id="fgrdPaymentsTransactions" style="display: block;"></table>
</div>


<script type="text/javascript">
    var IsUnappliedPaymentGridIntialized = false;
    var IsDepositDetailInitialize = false;
    var IsCheckDetailInitialize = false;
    var ScopeHeaderID, ScopeDetailID;
    var AmountPaid = 0.00;
    var IsPaymentsWithZeroBalance = "0";

    var xInvoice = "";
    var xCustomer = "";
    var xInvDate = "";
    // var xInvoiceDate = "";
    var xPO = "";
    var xAmountPaid = 0.00;
    var xCheck = "0";
    var xDiscount = 0.00;
    var xDate = "";
    var xBank = "";
    var xDeposit = "";
    var xDiscountRes = 0.00;
    var InvBalance = 0.00;
    var CheckBalance = 0.00;
    var OrigCheckBalance = 0.00;

    var IsAmountPaidFromConfirmed = false;
    var IsCashOrCheckApplied = false;
    var IsExitFromCheck = false;

    var IsCreditCardPaymentsActive = false;
    var IsCreditCardDetailByCustomerInitialize = false;
    var IsCreditCardDetailsByInvoiceInitialize = false;

    var xCCAmount = 0.00;
    var xCCType = "";
    var xCCApproval = "";
    var xCCDate = "";
    var xCCBank = "";

    var IsCreditDetailsAdd = false;


    var ScopeCreditCardID = 0;
    $("#DivHeaderID").html("0")

    //For date filter
    $(function () {
        //debugger;
        $("#divPostPaymentsFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
            onSelect: function (Date) {
                $("#txtPostPaymentsfrmdate").val(Date);
            }
        }).datepicker("setDate", new Date());
        $("#divPostPaymentsToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
            onSelect: function (Date) {
                $("#txtPostPaymentstodate").val(Date);
            }
        }).datepicker("setDate", new Date());
        $("#txtPostPaymentsfrmdate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
        $("#txtPostPaymentstodate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
    });

    var d = new Date();
    var currentMonth = d.getMonth();
    //d.setYear(d.getFullYear() - 1);
    d.setMonth(d.getMonth() - 3);
    var fromdate = d.toString('MM/dd/yyyy');
    var todate = new Date();

    $("#txtPostPaymentsfrmdate").val(fromdate);
    $("#txtPostPaymentstodate").val(todate.toString('MM/dd/yyyy'));
    $("#lblPostPaymentschosendate").html(fromdate + ' to ' + todate.toString('MM/dd/yyyy'));
    $("#lblPostPaymentschosendate1").html(fromdate);
    $("#lblPostPaymentschosendate2").html(todate.toString('MM/dd/yyyy'));
    $("#divPostPaymentsFromDate").datepicker("setDate", Date.parse(fromdate));
    $("#divPostPaymentsToDate").datepicker("setDate", Date.parse(todate.toString('MM/dd/yyyy')));
    $("#imgPostPaymentsDate").attr("src", "images/Filter.png");
    $("#trPostPayments").addClass('FilterDivStyle');

    //for PostPaymentsFromDate datepicker
    $("#txtPostPaymentsFromdate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
    }).datepicker("setDate", new Date());

    //for PostPaymentsToDate datepicker
    $("#txtPostPaymentsTodate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
    }).datepicker("setDate", new Date());

    //For date filter operations begin
    $('#divPostPaymentsDate').click(function (event) {
        //debugger;
        $(".rowcss").hide();
        $("#trPostPaymentsdatetitle").show();
        if ($('#divPostPaymentsdateFilter').css('display') == 'none') {
            $(".filterdiv").hide();
            $("#divPostPaymentsdateFilter").slideToggle();
        }
        else {
            $("#divPostPaymentsdateFilter").slideToggle();
        }
    });

    //For date filter OK button click
    $("[id^=btnPostPaymentsdateok]").die("click").live("click", function () {
        //debugger;
        if ($("#txtPostPaymentsfrmdate").val() != "" && $("#txtPostPaymentstodate").val() == "") {
            $("#msg").html("Please choose ToDate!");
            $("#msgbox-select").dialog("open");

            return false;
        }
        else if ($("#txtPostPaymentsfrmdate").val() == "" && $("#txtPostPaymentstodate").val() != "") {
            $("#msg").html("Please choose From Date!");
            $("#msgbox-select").dialog("open");
            return false;
        }
        else if ($("#txtPostPaymentsfrmdate").val() == "" && $("#txtPostPaymentstodate").val() == "") {
            $("#msg").html("Please choose From Date and ToDate!");
            $("#msgbox-select").dialog("open");
            return false;
        }

        PostPaymentsDateOK();
        $("#divPostPaymentsdateFilter").slideToggle();

    });

    function PostPaymentsDateOK() {
        var fdate = $("#txtPostPaymentsfrmdate").val() + " to " + $("#txtPostPaymentstodate").val();
        $("#lblPostPaymentschosendate").html(fdate);
        $("#trPostPayments").addClass('FilterDivStyle');
        $("#lblPostPaymentschosendate1").html($("#txtPostPaymentsfrmdate").val());
        $("#lblPostPaymentschosendate2").html($("#txtPostPaymentstodate").val());

        $("#divPostPaymentsFromDate").datepicker("setDate", Date.parse($("#txtPostPaymentsfrmdate").val()));
        $("#divPostPaymentsToDate").datepicker("setDate", Date.parse($("#txtPostPaymentstodate").val()));

        $("#imgPostPaymentsDate").attr("src", "images/Filter.png");
        if (IsCreditCardPaymentsActive == true) {
            //debugger;
            $("#fgrdCreditCardHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
            $("#DivCreditCardHeader").show();
            $("#DivCreditCardDetailsByCustomer").hide();
            $("#tdCChide1").hide();
            $("#DivCCHeaderID").html("0");
            $("#DivCCDetailID").html("0");
        }
        else {
            $("#fgrdDepositHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
            $("#DivDepositHeader").show();
            $("#DivDepositDetails").hide();
            $("#DivCheckDetails").hide();
            $("#lstPostPayments").hide();
            $("#tdhide1").hide();
            $("#tdhide2").hide();
            $("#DivHeaderID").html("0");
            $("#DivDetailID").html("0");

        }
    }

    //For date filter Image button click
    $("[id^=imgPostPaymentsDate]").die("click").live("click", function (e) {
        var bg = $(this).attr('src');
        if (bg == "images/Filter.png") {
            //debugger;
            var today = Date.today().toString("MM/dd/yyyy");
            $("#txtPostPaymentsfrmdate").val(today);
            $("#txtPostPaymentstodate").val(today);
            var fdate = "Today: " + today;
            $("#lblPostPaymentschosendate").html(fdate);
            $("#lblPostPaymentschosendate1").html(today);
            $("#lblPostPaymentschosendate2").html(today);

            $("#divPostPaymentsFromDate").datepicker("setDate", Date.parse(today));
            $("#divPostPaymentsToDate").datepicker("setDate", Date.parse(today));

            $("#imgPostPaymentsDate").attr("src", "images/Filter.png");
            $("#trPostPayments").addClass('FilterDivStyle');
            $("#divPostPaymentsdateFilter").hide();

            if (IsCreditCardPaymentsActive == true) {
                $("#fgrdCreditCardHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
                $("#DivCreditCardHeader").show();
                $("#DivCreditCardDetailsByCustomer").hide();
                $("#tdCChide1").hide();
                $("#DivCCHeaderID").html("0");
                $("#DivCCDetailID").html("0");
            }
            else {
                $("#fgrdDepositHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
                $("#DivDepositHeader").show();
                $("#DivDepositDetails").hide();
                $("#DivCheckDetails").hide();
                $("#lstPostPayments").hide();
                $("#tdhide1").hide();
                $("#tdhide2").hide();
                $("#DivHeaderID").html("0");
                $("#DivDetailID").html("0");
            }
            e.stopPropagation();
        }
    });

    //For date filter operations end

    //for New Deposit Date datepicker
    $("#txtNewDepositDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
        onSelect: function (date) {
            debugger;
            var cur_date = formatDate(new Date())
            var statement = (Date.parse(cur_date) <= Date.parse(date)) ? $("#txtPostPaymentstodate").val(date) : $("#txtPostPaymentsfrmdate").val(date);
            
            PostPaymentsDateOK();
        }
    }).datepicker("setDate", new Date());

    /*Grid loading for deposit header details from new Header table*/
    $("#fgrdDepositHeader").flexigrid({
        url: 'BloomService.asmx/GetDepositHeaderList',
        dataType: 'xml',
        colModel: [
                { display: '', name: 'Delete', width: 15, sortable: false, align: 'center' },
                { display: 'Date', name: 'DepositDate', width: 40, sortable: true, align: 'Left', process: DepositHeaderRowClick },
                { display: 'Deposit #', name: 'DepositNumber', width: 50, sortable: true, align: 'right', process: DepositHeaderRowClick },
                { display: '$ Amount', name: 'Amount', width: 80, sortable: true, align: 'right', process: DepositHeaderRowClick },
                { display: 'Bank', name: 'Bank', width: 25, sortable: true, align: 'right', process: DepositHeaderRowClick },
                { display: '', name: '', width: 13, sortable: true, align: 'left' },
                { display: 'XL', name: '', width: 13, sortable: true, align: 'left', hide: false },
                { display: 'PDF', name: '', width: 15, sortable: true, align: 'left',hide:true },
                { display: '', name: '', width: 13, sortable: true, align: 'left' },
                { display: 'DepositLockContent', name: 'DepositLockContent', width: 15, sortable: true, align: 'left', hide: true },
        ],
        searchitems: [
                 { display: 'Deposit #', name: 'DepositNumber' },
                 { display: 'Bank', name: 'Bank' },
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
        autoload: true,
        showTableToggleBtn: false,
        height: $(window).height() - 323,
        width: 365,//385,350
        striped: true,
        params: [
            { name: 'ExportCSV', value: '' },
            { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() },
            { name: 'ToDate', value: $("#txtPostPaymentstodate").val() },
            { name: 'IsActive', value: 1 },
        ],
        onSuccess: function () {
            //debugger;
            var sel = jQuery("#fgrdDepositHeader tbody tr");
            var len = sel.length;
            //if (isloaded == true)
            //{
            //    $("#fgrdDepositHeader tbody tr:nth-child(1)").addClass("trSelectedHeader");
            //    isloaded=false
            //}

            $("#fgrdDepositHeader tbody tr:nth-child(1)").addClass("trSelectedHeader");

            if (len > 1) {
                $("#DivDepositHeader #ExportCSV").show();

                if ($("#DivHeaderID").html() != "0" && $("#fgrdDepositHeader #row" + $("#DivHeaderID").html()).css('display') == "table-row") {
                    var id = $("#DivHeaderID").html();
                    $("#fgrdDepositHeader [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdDepositHeader td.unsorted").addClass("sorted");
                    $("#fgrdDepositHeader td.sorted").removeClass("unsorted");
                    $("#fgrdDepositHeader #row" + id).addClass("trSelectedHeader");
                    $("#fgrdDepositHeader #row" + id).removeClass("trSelected");
                    $("#fgrdDepositHeader #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdDepositHeader #row" + id + " td.unsorted").removeClass("sorted");

                    $("#DivDepositDetails").show();
                    /*Open mid pane when add the deposit*/
                    if (IsDepositDetailInitialize == false) {
                        LoadDepositDetails(id);
                        IsDepositDetailInitialize = true;
                    }
                    else {
                        $("#fgrdDepositDetails").empty();
                        $("#fgrdDepositDetails").flexOptions({ params: [{ name: 'FilterQuery', value: id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                }
                //else
                //{
                //    $("#fgrdDepositHeader tr").removeClass("trSelectedHeader");

                //}
            }
            //debugger;
            //For TotalRows

            //$("#fgrdDepositHeader tbody tr:nth-child(1)").addClass("trSelectedHeader");
            // $("#fgrdDepositHeader tbody").find(addednewrow).addClass("trSelectedHeader");

            //$('#fgrdDepositHeader #row0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdDepositHeader #row0 td:nth-child(4) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

            $('#fgrdDepositHeader #row0').addClass("TotalRows");
            //debugger;
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //debugger;
                window.location.href = "Login.aspx";
            }
        }
    });

    $("#DivDepositHeader .pcontrol input").css("width", "40px")
    $("#DivDepositHeader .btnseparator:eq(0)").hide();
    $("#DivDepositHeader .pSearch").hide();
    $("#DivDepositHeader .sDiv2").css("width", "290px");
    $("#DivDepositHeader .pDiv2").css("width", "300px").css("margin-top", "3px");
    $('#DivDepositHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivDepositHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivDepositHeader .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    /*While row clicking on First pane, keep the it's detail and call the method for second panel loading*/
    function DepositHeaderRowClick(celDiv, id) {
        //debugger;
        $(celDiv).click(function () {
            if (id != 0) {
                //debugger;
                var FilterQuery = "";
                FilterQuery = id;
                ScopeHeaderID = id;
                $("#lstPostPayments").show();
                $("#DivDepositDetails").show();
                $("#tdhide1").show();
                $("#tdhide2").hide();
                $("#DivCheckDetails").hide();
                /*Focus Payments action dropdown when add more checks from header grid row click :: by Abinaya :: 10May2018*/
                $("#lstPostPayments").focus();
                if (IsDepositDetailInitialize == false) {
                    //if (id.toString() != $("#DivHeaderID").html()) {
                    LoadDepositDetails(FilterQuery);
                    IsDepositDetailInitialize = true;
                    //}
                }
                else {
                    //if (id.toString() != $("#DivHeaderID").html()) {
                    $("#fgrdDepositDetails").empty();
                    $("#fgrdDepositDetails").flexOptions({ params: [{ name: 'FilterQuery', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                    //}
                }

                $("#DivHeaderID").html(id.toString());
                //debugger;
                $("#fgrdDepositHeader [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdDepositHeader #row" + id).addClass("trSelectedHeader");
                $("#fgrdDepositHeader td.unsorted").addClass("sorted");
                $("#fgrdDepositHeader td.sorted").removeClass("unsorted");
                $("#fgrdDepositHeader #row" + id).removeClass("trSelected");
                $("#fgrdDepositHeader #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdDepositHeader #row" + id + " td.unsorted").removeClass("sorted");
                $("#DivDetailID").html("");
            }
        });
    }

    /*Second panel loading data from cash file*/
    function LoadDepositDetails(FilterQuery) {
        //debugger;
        $("#fgrdDepositDetails").flexigrid({
            url: 'BloomService.asmx/GetDepositDetailsList',
            dataType: 'xml',
            colModel: [
            { display: 'Customer', name: 'Customer', width: 50, sortable: true, align: 'left', process: DepositDetailsRowClick },
            { display: 'Check #', name: 'Check', width: 50, sortable: true, align: 'right', process: DepositDetailsRowClick },
            { display: 'Amount', name: 'Amount', width: 80, sortable: true, align: 'right', process: DepositDetailsRowClick },
            { display: 'Type', name: 'Type', width: 40, sortable: true, align: 'left', process: DepositDetailsRowClick },
            ],
            showTableToggleBtn: true,
            sortname: "Check",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "Awb",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            colresize: false,
            autoload: true,
            showTableToggleBtn: false,
            rp: 30000,
            height: $(window).height() - 323,
            width: 280, //305,//1060
            striped: true,
            searchitems: [
                 { display: 'Check #', name: 'Check' },
                 { display: 'Type', name: 'Type' },
            ],
            params: [
                 { name: 'FilterQuery', value: FilterQuery },
                 { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                var sel = jQuery("#fgrdDepositDetails tbody tr");
                var len = sel.length;
                if (len > 1)
                    $("#DivDepositDetails #ExportCSV").show();

                //For TotalRows

                //$('#fgrdDepositDetails #row0 td:nth-child(1) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
                //$('#fgrdDepositDetails #row0 td:nth-child(3) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

                $('#fgrdDepositDetails #row0').addClass("TotalRows");
                debugger;


                if ($("#DivDetailID").html() != "0" && $("#fgrdDepositDetails #row" + $("#DivDetailID").html()).css('display') == "table-row") {
                    var id = $("#DivDetailID").html();
                    $("#fgrdDepositDetails [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdDepositDetails td.unsorted").addClass("sorted");
                    $("#fgrdDepositDetails td.sorted").removeClass("unsorted");
                    $("#fgrdDepositDetails #row" + id).addClass("trSelectedHeader");
                    $("#fgrdDepositDetails #row" + id).removeClass("trSelected");
                    $("#fgrdDepositDetails #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdDepositDetails #row" + id + " td.unsorted").removeClass("sorted");

                    if (IsCheckDetailInitialize == false) {
                        if (id.toString() != $("#DivDetailID").html()) {
                            LoadCheckDetails(FilterQuery);
                            IsCheckDetailInitialize = true;
                        }
                    }
                    else {
                        if (id.toString() != $("#DivDetailID").html()) {
                            $("#fgrdCheckDetails").empty();
                            $("#fgrdCheckDetails").flexOptions({ params: [{ name: 'FilterQuery', value: id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                        }
                    }
                }



            }
        });

        $("#DivDepositDetails .pcontrol input").css("width", "40px")
        $("#DivDepositDetails .btnseparator:eq(0)").hide();
        $("#DivDepositDetails .pSearch").hide();
        $("#DivDepositDetails .sDiv2").css("width", "290px");
        $("#DivDepositDetails .pDiv2").css("width", "300px").css("margin-top", "3px");
        $('#DivDepositDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivDepositDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivDepositDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }



    /*While row clicking on second pane, keep the it's detail and call the method for third panel loading*/
    function DepositDetailsRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";
                FilterQuery = id;
                ScopeDetailID = id;
                $("#DivCheckDetails").show();
                $("#tdhide2").show();
                if (IsCheckDetailInitialize == false) {
                    if (id.toString() != $("#DivDetailID").html()) {
                        LoadCheckDetails(FilterQuery);
                        IsCheckDetailInitialize = true;
                    }
                }
                else {
                    if (id.toString() != $("#DivDetailID").html()) {
                        $("#fgrdCheckDetails").empty();
                        $("#fgrdCheckDetails").flexOptions({ params: [{ name: 'FilterQuery', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                }

                $("#DivDetailID").html(id.toString());

                $("#fgrdDepositDetails [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdDepositDetails #row" + id).addClass("trSelectedHeader");
                $("#fgrdDepositDetails td.unsorted").addClass("sorted");
                $("#fgrdDepositDetails td.sorted").removeClass("unsorted");
                $("#fgrdDepositDetails #row" + id).removeClass("trSelected");
                $("#fgrdDepositDetails #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdDepositDetails #row" + id + " td.unsorted").removeClass("sorted");
                //$("#DivDetailID").html("");
            }
        });
    }

    /*Third panel loading data from cash file*/
    function LoadCheckDetails(FilterQuery) {
        $("#fgrdCheckDetails").flexigrid({
            url: 'BloomService.asmx/GetCheckDetailsList',
            dataType: 'xml',
            colModel: [
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
            { display: 'Cust#', name: 'Customer', width: 40, sortable: true, align: 'right' },
            { display: 'Name', name: 'CustName', width: 180, sortable: true, align: 'left' },
            { display: 'Invoice', name: 'Invoice', width: 55, sortable: true, align: 'right' },
            { display: 'PO', name: 'PO', width: 70, sortable: true, align: 'left' },
            { display: 'Amount', name: 'Amount', width: 80, sortable: true, align: 'right' },
            { display: 'GL', name: 'GL', width: 70, sortable: true, align: 'left' },
            //{ display: 'CTA', name: 'CTA', width: 70, sortable: true, align: 'left' },
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
            ],
            showTableToggleBtn: true,
            sortname: "Customer",
            sortorder: "",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "Awb",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            colresize: false,
            autoload: true,
            showTableToggleBtn: false,
            rp: 30000,
            height: $(window).height() - 303,
            width: 650, //305,//1060
            striped: true,
            searchitems: [
                 { display: 'Cust#', name: 'Customer' },
                 { display: 'Name', name: 'CustName' },
                 { display: 'Invoice', name: 'Invoice' },
                 { display: 'PO', name: 'PO' },
            ],
            params: [
                 { name: 'FilterQuery', value: FilterQuery },
                 { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                var sel = jQuery("#fgrdCheckDetails tbody tr");
                var len = sel.length;
                if (len > 1)
                    $("#DivCheckDetails #ExportCSV").show();

                //For TotalRows

                //$('#fgrdCheckDetails #row0 td:nth-child(4) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
                //$('#fgrdCheckDetails #row0 td:nth-child(6) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

                $('#fgrdCheckDetails #row0').addClass("TotalRows");
            }
        });

        $("#DivCheckDetails .pcontrol input").css("width", "40px")
        $("#DivCheckDetails .btnseparator:eq(0)").hide();
        $("#DivCheckDetails .pSearch").hide();
        //$("#DivCheckDetails .sDiv2").css("width", "290px");
        $("#DivCheckDetails .pDiv2").css("width", "300px").css("margin-top", "3px");
        $('#DivCheckDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivCheckDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivCheckDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }

    /*Import data from cash file to new header table :: By Abi ::02May2018 */
    $("#btnImport").die("click").live("click", function () {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ImportDepositsFromCash',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //$.MessageBox("Imported")
                $("#MsgWarning").dialog("open");
                $("#MsgHtml").html(output.d + " Records Imported Successfully...");

                $("#fgrdDepositHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
                $("#DivDepositHeader").show();
                $("#DivDepositDetails").hide();
                $("#DivCheckDetails").hide();
                $("#lstPostPayments").hide();
                $("#tdhide1").hide();
                $("#tdhide2").hide();
                $("#DivHeaderID").html("0");
                $("#DivDetailID").html("0");
            }
        });
    });

    /*Show message box for Imported record count/response :: Created by Abinaya :: 02May2018*/
    $("#MsgWarning").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        buttons: {
            OK: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('OK')").addClass('dialogbuttonstyle icon-save')
        }
    });

    /*Performs Lock option :: Pending- Lock Permission's for individual Users*/
    $("[id^=imgDepositLock_]").die("click").live("click", function () {
        //debugger;
        var CurrentIDs = $(this)[0].id;
        var IsLocked = CurrentIDs.split("_")[1];
        var Deposit = CurrentIDs.split("_")[2];
        var Date = CurrentIDs.split("_")[3];
        var Bank = CurrentIDs.split("_")[4];
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/CheckAndChangeDepositLockStatusForUser',
            data: '{"IsLocked":"' + IsLocked + '","Deposit":"' + Deposit + '","Date":"' + Date + '","Bank":"' + Bank + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                //debugger;
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d == "Not Authorised") {
                    $.MessageBox("You are not authorised to change the lock status of deposits!!!");
                }
                else if (output.d == "StatusChanged") {
                    IsLocked = (IsLocked == "0") ? "1" : "0";
                    if (IsLocked == "0") {
                        $("#" + CurrentIDs).attr("src", "images/unlocked.png")
                        $("#" + CurrentIDs).attr("id", "imgDepositLock_0_" + Deposit + "_" + Date + "_" + Bank)
                        $("#deleteDepositHeader_" + CurrentIDs.replace("imgDepositLock_", "")).attr("id", "deleteDepositHeader_0_" + Deposit + "_" + Date + "_" + Bank)
                        $("#imgExportAllDepositData_" + CurrentIDs.replace("imgDepositLock_", "")).attr("id", "imgExportAllDepositData_0_" + Deposit + "_" + Date + "_" + Bank)
                        $("#printDepositHeader_" + CurrentIDs.replace("imgDepositLock_", "")).attr("id", "printDepositHeader_0_" + Deposit + "_" + Date + "_" + Bank)
                    }
                    else {
                        $("#" + CurrentIDs).attr("src", "images/locked.png")
                        $("#" + CurrentIDs).attr("id", "imgDepositLock_1_" + Deposit + "_" + Date + "_" + Bank)
                        $("#deleteDepositHeader_" + CurrentIDs.replace("imgDepositLock_", "")).attr("id", "deleteDepositHeader_1_" + Deposit + "_" + Date + "_" + Bank)
                        $("#imgExportAllDepositData_" + CurrentIDs.replace("imgDepositLock_", "")).attr("id", "imgExportAllDepositData_1_" + Deposit + "_" + Date + "_" + Bank)
                        $("#printDepositHeader_" + CurrentIDs.replace("imgDepositLock_", "")).attr("id", "printDepositHeader_1_" + Deposit + "_" + Date + "_" + Bank)
                    }
                }
                else if (output.d.indexOf("is locked") != "-1") {
                    $.MessageBox(output.d);
                }
                else {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            },
            error: function () {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
    });

    //For Delete DepositHeader
    $("[id^=deleteDepositHeader_]").die("click").live("click", function () {
        //debugger;
        var CurrentIDs = $(this)[0].id.replace("deleteDepositHeader_", "");
        var IsLocked = CurrentIDs.split("_")[0];
        var Deposit = CurrentIDs.split("_")[1];
        var Date = CurrentIDs.split("_")[2];
        var Bank = CurrentIDs.split("_")[3];
        //var IsLocked = ($('#fgrdDepositHeader #row' + CurrentIDs + ' td:nth-child(6) div img').attr("src") == "images/locked.png") ? "1" : "0";

        if (IsLocked.trim() == "1") {
            $.MessageBox("Locked.Can't able to delete the deposit.");
        }
        else {
            $("#DivHeaderID").html(IsLocked + "_" + Deposit + "_" + Date + "_" + Bank);

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetIsDepositDelete',
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    if (output.d != "error" && output.d != "-1" && output.d != 'LogOut') {
                        if (output.d.toLowerCase() == "valid") {
                            $("#MsgDepositDelHtml").html("Are you sure to delete the Deposit and its details ?");
                            $("#MsgDepositDelWarning").dialog("open");
                        }
                        else {
                            $.MessageBox("You are not authorised to delete this deposit..");
                        }
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                },
                error: function () {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            });
        }
    });

    //Confirmation message for deposit delete
    $("#MsgDepositDelWarning").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var DepositSplit = $("#DivHeaderID").html().split("_");
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteDepositHeaderWithDetailsByID',
                    data: '{"Deposit":"' + DepositSplit[1] + '","Date":"' + DepositSplit[2] + '","Bank":"' + DepositSplit[3] + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != null && output.d == "valid") {
                            $("#MsgDepositDelWarning").dialog("close");
                            $("#fgrdDepositHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
                            $("#lstPostPayments").hide();
                            $("#DivDepositDetails").hide();
                            $("#DivCheckDetails").hide();
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

    /*Slider bar 1 :: hide first panel*/
    $("#tdhide1").die("click").live("click", function () {
        //debugger;
        if ($("#btnhide1").html() === "&lt;&lt;") {
            $("#DivDepositHeader").hide("slide", { direction: "left" }, 1000);
            $("#btnhide1").html(">>");
        }
        else {
            $("#DivDepositHeader").show("slide", { direction: "left" }, 1000);
            $("#btnhide1").html("<<");
        }
    });

    /*Slider bar 2 :: hide second panel*/
    $("#tdhide2").die("click").live("click", function () {
        if ($("#btnhide2").html() === "&lt;&lt;") {
            $("#DivDepositDetails").hide("slide", { direction: "left" }, 1000);
            $("#btnhide2").html(">>");
        }
        else {
            $("#DivDepositDetails").show("slide", { direction: "left" }, 1000);
            $("#btnhide2").html("<<");
        }
    });

    /*Add new deposit to the header file :: Get deposit# */
    $("#btnDepositAdd").die("click").live("click", function () {
        //debugger;
        if (IsCreditCardPaymentsActive == false) {
            GetNextDepositNum(function (callback, result) {
                if (callback == true) {
                    //var NewDepositNum = parseInt(result) + 1;
                    var NewDepositNum = parseInt(result); //incremented by 1 when it comes first
                    $("#txtNewDepositNum").val(NewDepositNum);
                    $("#DialogNewDeposit").dialog("open");
                }
            });
        }
        else {
            //IsCreditDetailsAdd = true;
            $("#DialogPayByCustomerSearch").dialog("open");
            //$("#DialogNewCreditCard").dialog("open");
        }
    });
    var isloaded = false;
    /*Save new deposit into header table*/
    $("#DialogNewDeposit").dialog({
        autoOpen: false,
        resizable: false,
        title: "Add New Deposit",
        modal: true,
        buttons: {
            Save: function () {
                //debugger;
                //var date = $("#txtNewDepositDate").val();
                //var d = date.split("/");
                //var yy = d[2].slice(2,4);
                //var newdepositdateformat = d[0] + "/" + d[1] + "/" + yy;

                var NewDepositNum = $("#txtNewDepositNum").val().trim() == "" ? $("#txtNewDepositNum").attr("placeholder") : $("#txtNewDepositNum").val();
                var NewDepositDate = $("#txtNewDepositDate").val().trim() == "" ? new Date() : $("#txtNewDepositDate").val();
                var NewDepositAmount = $("#txtNewDepositAmount").val().trim() == "" ? $("#txtNewDepositAmount").attr("placeholder") : parseFloat($("#txtNewDepositAmount").val());
                var NewDepositBank = $("#txtNewDepositBank").val() == "" ? $("#txtNewDepositBank").attr("placeholder") : $("#txtNewDepositBank").val();
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/SaveNewDeposit",
                    data: "{'Deposit':" + NewDepositNum + ",'Date':'" + NewDepositDate + "','Amount':" + NewDepositAmount + ",'Bank':'" + NewDepositBank + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        var res = output.d;
                        if (res == "success") {
                            //if (isloaded == false) {
                            $("#fgrdDepositHeader tbody tr:nth-child(1)").addClass("trSelectedHeader");
                            //    isloaded = true;
                            //}
                            $("#DialogNewDeposit").dialog("close");
                            $("#DivHeaderID").html("0_" + NewDepositNum + "_" + NewDepositDate.replace(/\//g, "-") + "_" + NewDepositBank);
                            $("#fgrdDepositHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
                            $("#DivDepositHeader").show();
                            //$("#fgrdDepositHeader #row" + $("#DivHeaderID").html()).trigger("click");

                            $("#fgrdDepositDetails").flexOptions({ params: [{ name: 'FilterQuery', value: $("#DivHeaderID").html() }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();

                            $("#DivCheckDetails").hide();

                            $("#lstPostPayments").show();
                            $("#lstPostPayments").focus();
                            $("#DialogPayByCustomerSearch").dialog("open");
                            $("#tdhide1").show();
                            //$("#tdhide2").show();
                            $("#DivDetailID").html("");



                        }
                        else {
                            $.MessageBox(res);
                            $("#DialogNewDeposit").dialog("close");
                        }
                    },
                    error: function () {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                });
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            //$("#txtNewDepositNum").focus();
            $("#txtNewDepositAmount").focus();
            $("#txtNewDepositBank").val("");
            $("#txtNewDepositAmount").val("0.00");
            $("#txtNewDepositDate").datepicker('setDate', new Date());
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });


    /*Get Deposit# from CONSTANT*/
    function GetNextDepositNum(callback, result) {
        //debugger;
        var Deposit;
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetNextDepositNum",
            data: "{}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output) {
                //debugger;
                var res = output.d;
                Deposit = parseInt(res);
                callback(true, Deposit);
            }
        });
    }

    /*Export all details to Excel, when Excel icon clicked on first panel*/
    $("[id^=imgExportAllDepositData_]").die("click").live("click", function () {
        $("#Pleasewait-msg").html("Please wait...  <img src='images/ajax-loader.gif' />");
        $("#Pleasewait-Dialog").dialog("open");
        var HeaderID = $(this)[0].id.replace("imgExportAllDepositData_", "");
        var splitID = HeaderID.split("_");
        var Deposit, DepositDate, Bank;
        if (splitID.length = 4) {
            Deposit = splitID[1];
            DepositDate = splitID[2];
            Bank = splitID[3];
        }
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ExportExcelDepositDetails',
            data: '{"Deposit":' + Deposit + ',"Date":"' + DepositDate + '","Bank":"' + Bank + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                $("#Pleasewait-Dialog").dialog("close");
                if (output.d == null) {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
                else
                    window.location.href = "<%=ConfigurationManager.AppSettings("XmlPath")%>/ReportExports/" + output.d;

            },
            error: function () {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
    });

/*Allow multiple time click on dropdown for post payments action ::ABI:: 07Mar18*/
var cc = 0;
$('#lstPostPayments').click(function () {
    cc++;
    if (cc == 2) {
        $(this).change();
        cc = 0;
    }
}).change(function () {
    PostPaymentsAction();
    cc = -1;
});

/*Open default option selected on payments action dropdown list :: by Abinaya :: 10May2018*/
$("#lstPostPayments").keydown(function (e) {
    var key = e.which;
    if (key == 13) // the enter key code
    {
        PostPaymentsAction();
    }
});

/*Pop-up opens for the Payments dropdown option selection*/
function PostPaymentsAction() {

    var SelectedAction = $("#lstPostPayments").val();
    if (SelectedAction == "ByInvoice") {
        $("#DialogPayByInvoice").data("PayByInvoiceFrom", "PaymentByIvoice").dialog("open");
    }
    else if (SelectedAction == "ByCustomer") {
        $("#DialogPayByCustomerSearch").dialog("open");
    }
    else if (SelectedAction == "ByPO") {
        $("#DialogPayByPO").dialog("open");
    }
    else if (SelectedAction == "ByPostAFile") {
        $("#DialogUploadExcelFile").dialog("open");
    }
}

/*Set current date by default- user can change it*/
$("#txtInvPayDate").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'mm/dd/yy',
    showOtherMonths: true,
    selectOtherMonths: true,
}).datepicker("setDate", new Date());

/*Set current date by default for payments by customer*/
$("#txtCustomerPayDate").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'mm/dd/yy',
    showOtherMonths: true,
    selectOtherMonths: true,
}).datepicker("setDate", new Date());

/*Check Invoice# to ARINVS*/
$("#txtInvPayInvoice").focusout(function () {
    debugger;
    var Invoice = $("#txtInvPayInvoice").val();
    var Date = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(2) div').text();
    var Customer = "0";
    if ($("#DialogPayByInvoice").data("PayByInvoiceFrom") == "PaymentByIvoiceForCurrentOrders") {
        Customer = $("#DialogCustPayARINVDetails").data("CustPayARINVData")["Customer"] == "" ? "" : $("#DialogCustPayARINVDetails").data("CustPayARINVData")["Customer"];
    }
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/CheckAndGetInvoiceDetails',
        data: '{"xInvoice":' + Invoice + ',"xDate":"' + Date + '","xCustomer":' + Customer + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            var res = output.d;
            var resultSet = res[0];
            if (resultSet.ErrorMessage.indexOf("Invoice not") >= 0) { /*If Invoice not available*/
                $.MessageBox(resultSet.ErrorMessage);
                $("#txtInvPayInvoice").val("");
                $("#txtInvPayInvoice").attr('placeholder', "0");
                $("#txtInvPayInvoice").focus();
                return false;
            }
            else {
                $("#txtInvPayCustomer").val("");
                $("#txtInvPayCustomer").attr('placeholder', resultSet.Customer);
                $("#CustNameInv").html(resultSet.CustName);
                $("#txtInvPayAmount").val("");
                $("#txtInvPayAmount").attr('placeholder', addCommas(resultSet.Balance.toFixed(2)));
                $("#txtInvPayPO").val("");
                $("#txtInvPayPO").attr('placeholder', resultSet.PO);
                $("#txtInvPayDiscount").val("");
                $("#txtInvPayDiscount").attr('placeholder', resultSet.Discount);

                // $("#DialogPayByInvoice").data("xInvoiceDate", resultSet.InvDate)
            }
        }
    });
});

/*Save posting payments for the invoice#*/
$("#DialogPayByInvoice").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Post Payments by Invoice",
    width: 618,
    buttons: {
        Save: function () {
            var Invoice = $("#txtInvPayInvoice").val().trim() == "" ? $("#txtInvPayInvoice").attr('placeholder') : $("#txtInvPayInvoice").val().trim();
            var Customer = $("#txtInvPayCustomer").val() == "" ? $("#txtInvPayCustomer").attr('placeholder') : $("#txtInvPayCustomer").val();
            var PO = $("#txtInvPayPO").val() == "" ? $("#txtInvPayPO").attr('placeholder') : $("#txtInvPayPO").val();
            var Amount = $("#txtInvPayAmount").val() == "" ? $("#txtInvPayAmount").attr('placeholder').replace(',', '') : $("#txtInvPayAmount").val().replace(',', '');
            var Discount = $("#txtInvPayDiscount").val() == "" ? $("#txtInvPayDiscount").attr('placeholder') : $("#txtInvPayDiscount").val();
            var GL = $("#txtInvPayGL").val().trim() == "" ? "" : $("#txtInvPayGL").val();
            var Check = $("#txtInvPayCheck").val() == "" ? $("#txtInvPayCheck").attr('placeholder') : $("#txtInvPayCheck").val();
            var Deposit = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(3) div').text();
            if (Deposit == "") {
                Deposit = 0;
            }
            if (Invoice == "" || Invoice == "0") {
                $.MessageBox("Must enter valid deposit number");
                return false;
            }
            if (Check == "") {
                $.MessageBox("Must enter check number");
                return false;
            }
            var Date = $("#txtInvPayDate").val();
            var Bank = $("#txtInvPayBank").val() == "" ? $("#txtInvPayBank").attr('placeholder') : $("#txtInvPayBank").val();
            // var ForARInvDate = $("#DialogPayByInvoice").data("xInvoiceDate");

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/SavePostPaymentsInvoice',
                data: '{"PaymentType":"Invoice","xInvoice":' + Invoice + ',"xCustomer":' + Customer + ',"xPO":"' + PO + '","xAmount":' + Amount.replace(',', '') + ',"xDiscount":' + Discount + ',"xCheck":' + Check + ',"xDate":"' + Date + '","xBank":"' + Bank + '","xDeposit":' + Deposit + ',"CardType":"' + xCCType + '","Approval":"' + xCCApproval + '","GL":"' + GL + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    var res = output.d;
                    if (res == "success") {
                        //$.MessageBox("Saved successfully");
                        $("#fgrdDepositHeader").flexReload({ url: '/url/for/refresh' });
                        $("#fgrdDepositDetails").flexReload({ url: '/url/for/refresh' });
                        $("#fgrdCheckDetails").flexReload({ url: '/url/for/refresh' });
                        clearInvoiceDialogFields();
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }

                    debugger;
                    if ($("#DialogPayByInvoice").data("PayByInvoiceFrom")== "PaymentByIvoiceForCurrentOrders") {
                        AmountPaid = parseFloat(Amount).toFixed(2);
                        var BalanceLeft = parseFloat($("#lblCustPayBalanceLeft").html().replace(',', '')).toFixed(2);
                        $("#lblCustPayBalanceLeft").html(addCommas(parseFloat(BalanceLeft - Amount).toFixed(2)));
                    }
                    //$("#DialogPayByInvoice").dialog("close");
                },
                error: function () {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            });
        },
        Cancel: function () {
            $(this).dialog("close");
        },
    },
    open: function () {
        debugger;
        clearInvoiceDialogFields();

        var Date = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(2) div').text();
        var Bank = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(5) div').text();

        $("#txtInvPayDate").val(Date);
        $("#txtInvPayBank").attr('placeholder', Bank);
        $("#txtInvPayDate").attr("disabled", "disabled");
        //For current orders from PayByInvoice:: payments from cash/check type
        if ($("#DialogPayByInvoice").data("PayByInvoiceFrom") == "PaymentByIvoiceForCurrentOrders") {
            if ($("#DialogCustPayCashAndCheck").data("PaymentBtnName") == "Cash") {
                $(".InvPay.PayByInv").attr("disabled", false);
                $("#txtInvPayCheck").val("");
                $("#txtInvPayCheck").attr("placeholder","0");
            }
            else {
                $(".InvPay.PayByInv").attr("disabled", "disabled");
                xCheck = $("#lblCustPayCheck").html() == "" ? "0" : $("#lblCustPayCheck").html();
                $("#txtInvPayCheck").val(xCheck);
            }
        }
        //For Current orders/VET orders from Post Payment by Invoice option
        else {
            $(".InvPay.PayByInv").attr("disabled", false);
            $("#txtInvPayCheck").val("");
            $("#txtInvPayCheck").attr("placeholder","0");
        }

        $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
    }
});

/*Reset values in Invoice posting dialog*/
function clearInvoiceDialogFields() {
    $("#txtInvPayInvoice").focus();
    $("#txtInvPayInvoice").val("");
    $("#txtInvPayInvoice").attr("placeholder", "0");
    $("#txtInvPayCustomer").val("");
    $("#txtInvPayCustomer").attr("placeholder", "");
    $("#txtInvPayPO").val();
    $("#txtInvPayPO").attr("placeholder", "");
    $("#txtInvPayAmount").val("");
    $("#txtInvPayAmount").attr("placeholder", "0.00");
    $("#txtInvPayDiscount").val("");
    $("#txtInvPayDiscount").attr("placeholder", "0.00");
    $("#txtInvPayGL").val("");
    $("#txtInvPayDate").attr("placeholder", "");
    $("#txtInvPayBank").val("");
    $("#txtInvPayBank").attr("placeholder", "1");

    $("#txtCustomerPayInvoice").focus();
    $("#txtCustomerPayInvoice").val("");
    $("#txtCustomerPayInvoice").attr("placeholder", "0");
    $("#txtCustomerPayCustomer").val("");
    $("#txtCustomerPayCustomer").attr("placeholder", "");
    $("#txtCustomerPayPO").val();
    $("#txtCustomerPayPO").attr("placeholder", "");
    $("#txtCustomerPayAmount").val("");
    $("#txtCustomerPayAmount").attr("placeholder", "0.00");
    $("#txtCustomerPayDiscount").val("");
    $("#txtCustomerPayDiscount").attr("placeholder", "0.00");
    $("#txtCustomerPayGL").val("");
    $("#txtCustomerPayDate").attr("placeholder", "");
    $("#txtCustomerPayBank").val("");
    $("#txtCustomerPayBank").attr("placeholder", "1");

    $("#txtPOPayPO").val("");
    $("#txtPOPayPO").attr("placeholder", "");
    $("#txtPOPayPO").focus();
    $("#txtPOPayInvoice").attr("placeholder", "0");
    $("#txtPOPayCustomer").val("");
    $("#txtPOPayInvoice").val("");
    $("#txtPOPayCustomer").attr("placeholder", "");
    $("#txtPOPayAmount").val("");
    $("#txtPOPayAmount").attr("placeholder", "0.00");
    $("#txtPOPayDiscount").val("");
    $("#txtPOPayDiscount").attr("placeholder", "0.00");
    $("#txtPOPayGL").val("");
    $("#txtPOPayDate").attr("placeholder", "");
    $("#txtPOPayBank").val("");
    $("#txtPOPayBank").attr("placeholder", "1");
    $("#CustNamePO").html("")
    $("#CustNameInv").html("")
}

$('input').keypress(function (e) {

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
            else if ($(this).attr('id') == "txtNewDepositNum") {
                $("#txtNewDepositDate").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtNewDepositDate") {
                $("#txtNewDepositAmount").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtNewDepositAmount") {
                $("#txtNewDepositBank").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtNewDepositBank") {
                $("#DialogNewDeposit").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtInvPayInvoice") {
                $("#txtInvPayCheck").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtInvPayAmount") {
                $("#txtInvPayDiscount").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtInvPayDiscount") {
                $("#txtInvPayGL").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtInvPayGL") {
                $("#txtInvPayCheck").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtInvPayCheck") {
                //    $("#txtInvPayDate").focus()
                //    return false;
                //}
                //else if ($(this).attr('id') == "txtInvPayDate") {
                $("#txtInvPayBank").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtInvPayBank") {
                $("#DialogPayByInvoice").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCustPayCheck") {
                $("#txtCustPayCash").focus();
            }
            else if ($(this).attr('id') == "txtCustPayCash") {
                $("#DialogCustPayCashAndCheck").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
            }
            else if ($(this).attr("id") == "txtCustomerPayAmount") {
                $("#txtCustomerPayDiscount").focus();
                return false;
            }
            else if ($(this).attr("id") == "txtCustomerPayDiscount") {
                $("#txtCustomerPayGL").focus();
                return false;
            }
            else if ($(this).attr("id") == "txtCustomerPayGL") {
                pagedownkey = 0;
                $("#DialogPayByCustomer").siblings('.ui-dialog-buttonpane').find("button:contains('Apply')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtPOPayPO") {
                $("#txtPOPayCheck").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtPOPayAmount") {
                $("#txtPOPayDiscount").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtPOPayDiscount") {
                $("#txtPOPayGL").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtPOPayGL") {
                $("#txtPOPayCheck").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtPOPayCheck") {
                //    $("#txtPOPayDate").focus()
                //    return false;
                //}
                //else if ($(this).attr('id') == "txtPOPayDate") {
                $("#txtPOPayBank").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtPOPayBank") {
                $("#DialogPayByPO").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtNewCCAmount") {
                $("#lstNewCCType").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtNewCCApprovalCode") {
                $("#txtNewCCDate").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtNewCCDate") {
                $("#txtNewCCBank").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtNewCCBank") {
                $("#DialogNewCreditCard").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    }
});

/*Search customer# :: Parent box is checked, look dependent cust# for the searched one else shown the details of searched Cust#. */
$("#DialogPayByCustomerSearch").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Post Payments by Customer",
    width: 550,
    buttons: {
        Cancel: function () {
            $(this).dialog("close");
        },
    },
    open: function () {
        $("#txtCustPaySearch").focus();
        $("#txtCustPaySearch").val("");
        $("#chkCustPayCheck").attr("checked", false);
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
    }
});

/*Load Cust# and name for searching  :: modified - autoFocus : true :: by Abinaya :: 10May2018*/
$("#txtCustPaySearch").autocomplete({
    source: function (request, response) {
        //debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustForAutocomplete',
            data: "{'Searchtext': '" + request.term + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                //debugger;
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
        // $(".ui-menu").css("z-index", 1110);
    },
    select: function (e, i) {
        $("#txtCustPaySearch").val(i.item.Customer);
        autocompletePostPay(i.item.Customer, i.item.Name);
    },
    change: function (e, i) {
        if (i.item == null || i.item == undefined) {
            $("#txtCustPaySearch").val("");
            $("#txtCustPaySearch").focus();
            $(".ui-menu").css("display", "none");
        }
    },
    minLength: 1,
    autoFocus: true
});

/*Show Invoice details for the selected customer*/
function autocompletePostPay(Customer, Name) {
    debugger;
    if (IsCreditCardPaymentsActive == true) {
        $("#btnCustPayCash").hide();
        $("#btnCustPayCheck").hide();
        $("#btnCustPayCreditCard").hide();
        $("#btnCustPayUnapplied").hide();

        $("#trARINVDepositDetails").hide();//Hide deposit row
        $("#trARINVCreditCard").show();//Show credit card type row
        $("#DivCustomer").html(Customer);
        //debugger;
    }
    else {
        $("#btnCustPayCash").show();
        $("#btnCustPayCheck").show();
        $("#btnCustPayCreditCard").show();
        $("#btnCustPayUnapplied").show();
        $("#DivCustomer").html("");
    }

    var lParentchecked = $("#chkCustPayParent").is(":checked") ? "1" : "0";
    $("#fgrdCustPayARINVDetails").empty();
    $("#fgrdCustPayARINVDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'lParentchecked', value: lParentchecked }, { name: 'IsPaymentsWithZeroBalance', value: '0' }, { name: 'IsByViewOpen', value: false },{ name: 'viewDate', value: "" }], query: "", newp: 1 }).flexReload();
    $("#DialogCustPayARINVDetails").dialog('option', 'title', 'Post Payments By Customer :: ' + Customer);
    $("#DialogCustPayARINVDetails").data("CustPayARINVData", { Customer: Customer, lParentchecked: lParentchecked }).dialog("open");
}

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

var ARINVCloseFlag = false;

/*Pop-up for ARINVS customer details for the Cust# on searching */
$("#DialogCustPayARINVDetails").dialog({
    autoOpen: false,
    resizable: false,
    title: "Post Payments By Customer",
    width: 1300,
    height: $(window).height() - 20,
    modal: true,
    focus: function () {
        $('#DialogCustPayARINVDetails').closest('.ui-dialog').focus();
    },
    open: function () {
        //debugger;
        $("#btnCustPayViewZeroBlnceInvoice").html("<span style='text-decoration: underline'>S</span>how 0's");
        /* Hide/Show the Apply Payment button on the grid :: created by Abi :: 07Aug2018*/
        if (IsCreditCardPaymentsActive == true) {
            $("#btnCustPayCCApply").show();
            $("#trARINVDepositDetails").hide();
            $("#trARINVCreditCard").show();
        }
        else {
            $("#btnCustPayCCApply").hide();
            $("#trARINVDepositDetails").show();
            $("#trARINVCreditCard").hide();
        }

        $("#txtCustPaySearch").val("");
        $("#DivCustPayARINVCheckCashDetails").hide();
        $('#fgrdCustPayARINVDetails').focus();
        $("#lblARINVDate").html($('#fgrdDepositHeader .trSelectedHeader td:nth-child(2) div').text());
        $("#lblARINVBank").html($('#fgrdDepositHeader .trSelectedHeader td:nth-child(5) div').text());
        $("#lblARINVDeposit").html($('#fgrdDepositHeader .trSelectedHeader td:nth-child(3) div').text());
        var Customer = $("#DialogCustPayARINVDetails").data("CustPayARINVData")["Customer"];
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUnAppliedAmountForCustomer',
            data: '{ "CustomerNo":"' + Customer + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                $(".aUnAppliedAmountForCustomer_postpayments").html(addCommas(output.d.toFixed(2)))
            }
        });
        clearCheckProcess();
    },
    beforeClose: function () {
        //debugger;
        //if (ARINVCloseFlag == false) {
        IsExitFromCheck = true;
        if (parseFloat($("#lblCustPayBalanceLeft").html()) > 0) {
            if (IsCreditCardPaymentsActive == true) {
                $("#msgCustPayARINVDetailsHtml").html("Card payments not completed,  are you sure you want to close?");
                $("#msgbox-CustPayARINVDetails").dialog("open");
            }
            else if ($("#txtCustPayNoCheck").val() == "") {
                $("#msgCustPayARINVDetailsHtml").html("Check not completed,  are you sure you want to close?");
                $("#msgbox-CustPayARINVDetails").dialog("open");
            }
            else {
                $("#msgCustPayARINVDetailsHtml").html("Cash not completed,  are you sure you want to close?");
                $("#msgbox-CustPayARINVDetails").dialog("open");
            }
            return false;
        }
        //if (parseFloat($("#lblCustPayBalanceLeft").html()) > 0) {
        //    if (IsCreditCardPaymentsActive == true) {
        //        $("#msgCustPayARINVDetailsHtml").html("Card payments not completed,  are you sure you want to close?");
        //        $("#msgbox-CustPayARINVDetails").dialog("open");
        //    }
        //    else if ($("#txtCustPayNoCheck").val() == "") {
        //        $("#msgCustPayARINVDetailsHtml").html("Check not completed,  are you sure you want to close?");
        //        $("#msgbox-CustPayARINVDetails").dialog("open");
        //    }
        //    else {
        //        $("#msgCustPayARINVDetailsHtml").html("Cash not completed,  are you sure you want to close?");
        //        $("#msgbox-CustPayARINVDetails").dialog("open");
        //    }
        //    return false;
        //}
        //}
        //else {
        //    return true;
        //}
    },
    close: function () {
        debugger;
        IsPaymentsWithZeroBalance = "0";
        debugger;
        //$("#btnCustPayViewOpen").html("<span style='text-decoration: underline'>V</span>iew Open");
        //$("#btnCustPayViewOpen").prop('value', 'View Open');
        $("#btnCustPayViewZeroBlnceInvoice").val("Show 0's");
        $("#txtCustPaySearch").val("");
        $("#txtCustPaySearch").focus();

        $("#fgrdDepositHeader").flexReload({ url: '/url/for/refresh' });
        //$("#fgrdDepositDetails").flexReload({ url: '/url/for/refresh' });
        var Date = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(2) div').text()
        var Deposit = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(3) div').text()
        var Bank = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(5) div').text();
        $("#DivHeaderID").html("0_" + Deposit + "_" + Date.replace(/\//g, "-") + "_" + Bank);
        $("#fgrdDepositDetails").flexOptions({ params: [{ name: 'FilterQuery', value: $("#DivHeaderID").html() }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();

        $("#fgrdCheckDetails").flexReload({ url: '/url/for/refresh' });
    },
});

$(".aUnAppliedAmountForCustomer_postpayments").die('click').live("click", function (e) {
    //debugger;

    var para = "CustomerNo=" + $("#DialogCustPayARINVDetails").data("CustPayARINVData")["Customer"];
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageUnAppliedAmountForCustomer.ascx","controlPara":"' + para + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            //debugger;
            $('<div id="CustomerUnAppliedAmountDialog">/div>').dialog({
                autoOpen: false,
                resizable: false,
                title: "UNAPPLIED PAYMENTS",
                width: 400,
                height: 355,
                modal: true,
                close: function () {
                    $(this).dialog('destroy').remove();
                }

            });
            $("#CustomerUnAppliedAmountDialog").html(output.d).dialog("open");
        }
    });
});



/* Alert Box :: Yes/No options for check payments by customer. Yes - close the ARINVS check grid, else stay on the screen */
$("#msgbox-CustPayARINVDetails").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    height: 150,
    width: 400,
    buttons: {
        Yes: function () {
            //debugger;
            //ARINVCloseFlag = true;
            $(this).dialog("close");
            if (IsExitFromCheck == true) {
                clearCheckProcess();
            }
            else {
                $("#DialogCustPayARINVDetails").dialog("close");
            }
        },
        No: function () {
            //ARINVCloseFlag = false;
            $(this).dialog("close");
        },
    },
    open: function (e) {
        $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        $(this).siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
    }
});

/*Load Cutomer payments ARINVS grid to show all invoices of the customer*/
$("#fgrdCustPayARINVDetails").flexigrid({
    url: 'BloomService.asmx/GetCustomerListForPostPayments',
    dataType: 'xml',
    colModel: [
         { display: 'Cust#', name: 'Customer', width: 40, sortable: true, align: 'right' },
         { display: 'Name', name: 'CustName', width: 210, sortable: true, align: 'left' },
         { display: '<input type="image" style="Cursor:pointer;" id="ARINVPayselectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
         { display: 'INV#', name: 'Invoice', width: 60, sortable: true, align: 'right' },
         { display: 'Date', name: 'RecDate', width: 60, sortable: true, align: 'left' },
         { display: 'PO#', name: 'PO', width: 100, sortable: true, align: 'left' },
         { display: 'Shipto', name: 'ShiptoName', width: 80, sortable: true, align: 'left' },
         { display: 'AWB', name: 'AWB', width: 85, sortable: true, align: 'center' },
         { display: 'CA', name: 'Carrier', width: 15, sortable: true, align: 'center', title: 'Carrier' },
         { display: 'WH', name: 'WH', width: 15, sortable: true, align: 'left', title: 'Warehouse' },
         { display: 'Charges', name: 'Charges', width: 75, sortable: true, align: 'right' },
         { display: 'Payments', name: 'Payments', width: 75, sortable: true, align: 'right' },
         { display: 'Credits', name: 'Credits', width: 70, sortable: true, align: 'right' },
         { display: 'Adjustments', name: 'Adjustments', width: 70, sortable: true, align: 'right' },
         { display: 'Balance', name: 'Balance', width: 70, sortable: true, align: 'right' },
         { display: 'PostBalance', name: 'Balance', width: 70, sortable: true, align: 'right', hide: true },
         { display: 'Accum.Balance', name: 'Accum.Balance', width: 80, sortable: true, align: 'right', hide: true },
         { display: 'InvDate', name: 'InvDate', width: 80, sortable: true, align: 'right', hide: true }

    ],
    searchitems: [
        { display: 'Cust#', valuse: 'Customer' },
        { display: 'Name', valuse: 'CustName' },
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
    height: $(window).height() - 245,
    width: 1250,
    striped: true,

    params: [
        { name: 'ExportCSV', value: '' },
        { name: 'Customer', value: '0' },
        { name: 'lParentchecked', value: '0' },
        { name: 'IsPaymentsWithZeroBalance', value: '0' },
        { name: 'IsByViewOpen', value: false },
        { name: 'viewDate', value: $("#lblARINVDate").html() }
    ],
    onSuccess: function () {
        $("#fgrdCustPayARINVDetails tbody tr").click(function (event) {
            //debugger;
            var id = $(this).attr('id').replace('row', '')

            if (($(this).attr("id") != "row0")) {
                $("#DivCustPayARIVDetailID1").html(id.toString());
                $("#fgrdCustPayARINVDetails [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html()).addClass("trSelectedHeader");
                $("#fgrdCustPayARINVDetails td.unsorted").addClass("sorted");
                $("#fgrdCustPayARINVDetails td.sorted").removeClass("unsorted");
                $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html()).removeClass("trSelected");
                $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html() + " td.sorted").addClass("unsorted");
                $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html() + " td.unsorted").removeClass("sorted");
            }
        });
        var sel = jQuery("#fgrdCustPayARINVDetails tbody tr");
        var len = sel.length;
        if (len > 1) {
            $("#DivCustPayARINVDetails #ExportCSV").show();
        }
        var xTotalBalance = 0.00;
        $('#fgrdCustPayARINVDetails tr').each(function () {
            if ($(this).attr("id") != "row0") {
                xTotalBalance += parseFloat($(this).find("td div").eq(14)[0].innerText.replace(/,/g, ''));
                //$('input[type="image"]').attr("disabled",true);
            }
        });
        $("#lblARINVBalance").html(addCommas(xTotalBalance.toFixed(2)));
        //if ($('.showCashAndCheck').css('display') == 'block') {
        if ($("#DivCustPayARINVCheckCashDetails").css("display") == "block") {
            $('input[type="image"]').attr("disabled", false);
            $('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");/*Enable check box after cash/check value availed :: modified by Abinaya :: 03-05-2018*/
        }
        else {
            $('input[type="image"]').attr("disabled", true);
            $('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");
        }

        $('#fgrdCustPayARINVDetails #row0').addClass("TotalRows")

        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '12px' });
        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(7) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(8) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(9) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(10) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(11) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(12) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(13) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(14) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        //$('#fgrdCustPayARINVDetails #row0 td:nth-child(15) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
        //var wtf = $("#fgrdCustPayARINVDetails").closest('div');
        //var height = wtf[0].scrollHeight;
        //wtf.scrollTop(height);


        if ($("#DivCustPayARIVDetailID1").html() != "0" && $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html()).css('display') == "table-row") {
            var id = $("#DivCustPayARIVDetailID1").html();
            //nextrow = $("#fgrdCustPayARINVDetails .trSelectedHeader").next()
            $("#fgrdCustPayARINVDetails [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdCustPayARINVDetails td.unsorted").addClass("sorted");
            $("#fgrdCustPayARINVDetails td.sorted").removeClass("unsorted");
            $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html()).addClass("trSelectedHeader");
            $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html()).removeClass("trSelected");
            $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html() + " td.sorted").addClass("unsorted");
            $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html() + " td.unsorted").removeClass("sorted");
        }
        else {
            $("#DivCustPayARIVDetailID1").html($("#fgrdCustPayARINVDetails tr:first td:nth-child(4) div").text());
            //$("#fgrdCustPayARINVDetails tr:first").addClass("trSelectedHeader trSelected");
        }

        if (IsCashOrCheckApplied == true) {
            $("#fgrdCustPayARINVDetails tr").removeClass("trSelectedHeader");
            $("#fgrdCustPayARINVDetails tr:first").addClass("trSelectedHeader");
        }

        if (IsCreditCardPaymentsActive == true) {
            //debugger;
            $('input[type="image"]').attr("disabled", false);
            $('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");/*Enable check box after cash/check value availed :: modified by Abinaya :: 03-05-2018*/
        }

    },
    onError: function (xhr, status, errorThrown) {
        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
            window.location.href = "Login.aspx";
        }
    }
});

$("#DialogCustPayARINVDetails .sDiv").css('float', 'left').css('width', '580px');
$('#DialogCustPayARINVDetails .pDiv').css('padding', '2px').css('border-left', '0px');
$('#DialogCustPayARINVDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
$("#DialogCustPayARINVDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
$("#DialogCustPayARINVDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

//function CustPayARIVClicked(celDiv, id) {
//    $(celDiv).click(function () {
//    //debugger;
//        if (id != "0") {
//            $("#DivCustPayARIVDetailID1").html(id.toString());

//            $("#fgrdCustPayARINVDetails [id^=row]").removeClass("trSelectedHeader");
//            $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html()).addClass("trSelectedHeader");
//            $("#fgrdCustPayARINVDetails td.unsorted").addClass("sorted");
//            $("#fgrdCustPayARINVDetails td.sorted").removeClass("unsorted");
//            $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html()).removeClass("trSelected");
//            $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html() + " td.sorted").addClass("unsorted");
//            $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html() + " td.unsorted").removeClass("sorted");

//        }
//    });
//}

/*when checkbox click by user, payments screen opens*/
$("[id^=ARINVPayselect_]").die("click").live("click", function () {
    //debugger;
    var sourceCtl = $(this);
    var ID = sourceCtl.attr('id');
    var img = sourceCtl.attr("src").toLowerCase();
    var headers = ID.replace("ARINVPayselect_", "");
    $("#DivCustPayARIVDetailID1").html(headers);
    var Selected = "0";
    CheckBalance = ($("#lblCustPayBalanceLeft").html() == "") ? 0 : parseFloat($("#lblCustPayBalanceLeft").html().replace(/,/g, ''));
    var InvBalance = parseFloat($("#fgrdCustPayARINVDetails tr#row" + headers).find("td").eq(14).text().trim().replace(/,/g, ''));

    if (img.indexOf("off") > 0) {
        Selected = "1";
    }

    sourceCtl.prop("src", "images/check-off.png");
    //$('#fgrdCustPayARINVDetails tr').removeClass("trChecked").removeClass('bgCustPayARINVDetails');
    //$("[id^=ARINVPayselect_]:visible").removeClass('ARINVselected');
    $("[id^=ARINVPayselect_]").prop("src", "images/check-off.png");

    if (Selected == "1" && CheckBalance > 0) {
        sourceCtl.prop("src", "images/check-on.png");
        //sourceCtl.closest('tr').addClass("trChecked").addClass('bgCustPayARINVDetails');
        //sourceCtl.attr('class', 'ARINVselected');
        CustPayARINVClicked(headers);
    }
    else {
        sourceCtl.prop("src", "images/check-off.png");
        $("[id ^= ARINVselectall]").attr("src", "images/check-off.png");
        //sourceCtl.closest('tr').removeClass("trChecked").removeClass('bgCustPayARINVDetails');
        //sourceCtl.attr('class', 'unARINVselected');
    }
});

/*Pop-up for Get cash and check values for the Cust#'s on grid*/
$("#DialogCustPayCashAndCheck").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "",
    width: 300,
    buttons: {
        Save: function () {
            //debugger;
            IsCashOrCheckApplied = true;
            var nocheck = $("#txtCustPayNoCheck").val();
            var Check = $("#txtCustPayCheck").val().trim();
            var AmountEntered = addCommas(parseFloat($("#txtCustPayCash").val().replace(/,/g, '')).toFixed(2));

            if (Check == "" && nocheck == "") {
                $("#txtCustPayCheck").focus();
                return false;
            }
            //debugger;
            if (AmountEntered == "NaN" || AmountEntered == "0.00") {
                $("#txtCustPayCash").focus();
                return false;
            }

            //debugger;

            $("#lblCustPayCheck").html(Check);
            $("#lblCustPayCash").html(AmountEntered);
            $("#lblCustPayBalanceLeft").html(AmountEntered);

            //$("#lblCustPayCash").html($("#txtCustPayCash").val());
            //$("#lblCustPayBalanceLeft").html($("#txtCustPayCash").val());

            $('input[type="image"]').attr("disabled", false);
            $('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");/*Enable check box after cash/check value availed :: modified by Abinaya :: 03-05-2018*/

            if ($("#DialogCustPayCashAndCheck").data("PaymentBtnName") == "Cash") {
                $("#trCustPayCashDetails").show();
                $("#trCustPayCheckDetails").hide();
                $("#DivCustPayARINVCheckCashDetails").show();
            }
            else if ($("#DialogCustPayCashAndCheck").data("PaymentBtnName") == "UnApplied") {
                //debugger;
                xBank = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(5) div').text();
                xDeposit = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(3) div').text();
                xCustomer = $("#DialogCustPayARINVDetails").data("CustPayARINVData")["Customer"];
                xDate = $('#fgrdDepositHeader .trSelectedHeader').find('td').eq(1).find('div')[0].children[0].dataset.depositdate;
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveUnAppliedPayments',
                    data: '{"xCustomer":"' + xCustomer + '","xCheck":"' + Check + '","xAmount":"' + AmountEntered + '","xBank":"' + xBank + '","xDeposit":"' + xDeposit + '","xDate":"' + xDate + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        //debugger;
                        var res = output.d;
                        var OldUnAppliedAmount = $(".aUnAppliedAmountForCustomer_postpayments").html();
                        OldUnAppliedAmount = (OldUnAppliedAmount == "") ? 0.00 : parseFloat(OldUnAppliedAmount.replace(/,/g, ''));
                        var NewUnAppliedAmount = parseFloat($("#txtCustPayCash")
                            .val().replace(/,/g, ''));
                        if (res == "Success") {
                            $(".aUnAppliedAmountForCustomer_postpayments").html(addCommas(parseFloat(OldUnAppliedAmount + NewUnAppliedAmount).toFixed(2)));
                        }
                        $("#DivCustPayARINVCheckCashDetails").hide();
                        clearCheckProcess();
                    },
                    error: function () {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                });
            }
                //else if ($("#DialogCustPayCashAndCheck").data("PaymentBtnName") == "ViewOpen")
                //{

                //}
            else {
                $("#trCustPayCashDetails").show();
                $("#trCustPayCheckDetails").show();
                $("#DivCustPayARINVCheckCashDetails").show();
            }

            //$("#fgrdCustPayARINVDetails").flexReload({ url: '/url/for/refresh' });
            $("#fgrdCustPayARINVDetails tr").removeClass("trSelectedHeader");
            $("#fgrdCustPayARINVDetails tr:first").addClass("trSelectedHeader");
            $("#fgrdCustPayARINVDetails").focus();
            $("#DialogCustPayCashAndCheck").dialog("close");

        },
        Cancel: function () {
            $(this).dialog("close");
            clearCheckProcess();
        }

    },
    close: function () {
        //debugger;
        if ($("#DivCustPayARINVCheckCashDetails").is(':visible') == false) {
            clearCheckProcess();
        }
    },
    open: function () {
        IsAmountPaidFromConfirmed = false;

        $("#DivBtnPaymentDetails").hide();
        $("#DivBtnPaymentExitDetails").show();

        $("#DivBtnPaymentByIvoiceForCurrentOrders").show();

        $("#txtCustPayCheck").val("");
        $("#txtCustPayCash").val("");
        /*if cash button clicked :: show amount field else show both amount and check */
        if ($("#DialogCustPayCashAndCheck").data("PaymentBtnName") == "Cash") {
            $("#trCustPayCash").show();
            $("#trCustPayCheck").hide();
            $("#txtCustPayCash").focus();
        }
        else {
            $("#trCustPayCash").show();
            $("#trCustPayCheck").show();
            $("#txtCustPayCheck").focus();
        }
        $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        Gridfocus();
    }



});
//$("#DialogCustPayCashAndCheck").closest('.ui-dialog').on('keydown', function (ev) {
//    debugger
//    if (ev.keyCode === $.ui.keyCode.ESCAPE) {
//        $("#DialogCustPayCashAndCheck").dialog("close");
//        clearCheckProcess();
//        }
//})

//$("#DialogCustPayCashAndCheck").closest('.ui-dialog').find('.ui-dialog-titlebar-close').click(function () {
//    debugger
//    $("#DialogCustPayCashAndCheck").dialog("close");
//    clearCheckProcess();
//})
/*Cash button click on PostPayments By Customer's ARINVS grid*/
$("#btnCustPayCash").die("click").live("click", function () {
    //debugger;
    //$("#DivBtnPaymentDetails").hide();
    //$("#DivBtnPaymentExitDetails").show();
    $("#txtCustPayNoCheck").val("0");
    $(".tdDepositPayments").show();
    //$("#btnCreditCardPayments").hide();
    $(".tdCreditCardPayments").hide();
    //$("#btnDepositListing").hide();
    $(".tdDepositListing").hide();

    $("#trARINVCreditCard").hide();//Hide credit card type row
    $("#DialogCustPayCashAndCheck").data("PaymentBtnName", "Cash").dialog("open");
});

/*Check button click on PostPayments By Customer's Check Payment ARINVS grid*/
$("#btnCustPayCheck").die("click").live("click", function () {
    //debugger;
    //$("#DivBtnPaymentDetails").hide();
    //$("#DivBtnPaymentExitDetails").show();
    $("#txtCustPayNoCheck").val("");
    $(".tdDepositPayments").show();
    //$("#btnCreditCardPayments").hide();
    $(".tdCreditCardPayments").hide();
    //$("#btnDepositListing").hide();
    $(".tdDepositListing").hide();
    $("#trARINVDepositDetails").show();//Show deposit row
    $("#trARINVCreditCard").hide();//Hide credit card type row
    $("#DialogCustPayCashAndCheck").data("PaymentBtnName", "Check").dialog("open");
});


/*Check button click on PostPayments By Customer's Unapplied ARINVS grid*/
$("#btnCustPayUnapplied").die("click").live("click", function () {
    //debugger;
    //$("#DivBtnPaymentDetails").hide();
    //$("#DivBtnPaymentExitDetails").show();
    $("#txtCustPayNoCheck").val("");
    $(".tdDepositPayments").show();
    //$("#btnCreditCardPayments").hide();
    $(".tdCreditCardPayments").hide();
    //$("#btnDepositListing").hide();
    $(".tdDepositListing").hide();
    $("#trARINVDepositDetails").show();//Show deposit row
    $("#trARINVCreditCard").hide();//Hide credit card type row
    $("#DialogCustPayCashAndCheck").data("PaymentBtnName", "UnApplied").dialog("open");
});

/*Credit card payments :: Created by Abinaya :: 16Aug2018*/
$("#btnCustPayCreditCard").die("click").live("click", function () {
    //debugger;
    if (IsCreditCardPaymentsActive == false) {
        $.MessageBox("Can't accessible from here...");
    }
    else {
        //IsCreditDetailsAdd = false;
        $("#trARINVDepositDetails").hide();//Hide deposit row
        $("#trARINVCreditCard").show();//Show credit card type row
        $("#DialogNewCreditCard").data("PaymentBtnName", "CreditCard").dialog("open");
    }
});

/*Muthu Nivetha M :: 12 Mar 2019 :: Post checks to Open invoices */
//View-Open
//$("#btnCustPayViewOpen").die("click").live("click", function () {
//    debugger;
//    var getButtonName = $("#btnCustPayViewOpen").val();
//    var viewdate = $("#lblARINVDate").html();
//    var setForByViewOpen = false;
//    if (getButtonName.toString().toLowerCase() == "view open") {
//        $("#btnCustPayViewOpen").html("Close");
//        $("#btnCustPayViewOpen").prop('value', 'Close');
//        setForByViewOpen = true;
//    }
//    else {
//        $("#btnCustPayViewOpen").html("<span style='text-decoration: underline'>V</span>iew Open");
//        $("#btnCustPayViewOpen").prop('value', 'View Open');
//        setForByViewOpen = false;
//    }
//    var lParentchecked = $("#chkCustPayParent").is(":checked") ? "1" : "0";
//    var Customer = $("#DialogCustPayARINVDetails").data("CustPayARINVData")["Customer"];

//    $("#fgrdCustPayARINVDetails").empty();
//    $("#fgrdCustPayARINVDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'lParentchecked', value: lParentchecked }, { name: 'IsPaymentsWithZeroBalance', value: '0' }, { name: 'IsByViewOpen', value: setForByViewOpen }, { name: 'viewDate', value: $("#lblARINVDate").html() }], query: "", newp: 1 }).flexReload();
//    $("#DialogCustPayARINVDetails").dialog('option', 'title', 'Post Payments By Customer :: ' + Customer);
//    $("#DialogCustPayARINVDetails").data("CustPayARINVData", { Customer: Customer, lParentchecked: lParentchecked }).dialog("open");
//});

/*PostPayments By Customer's ARINVS grid row click :: open's Payment pop-up*/
function CustPayARINVClicked(id) {
    //$(celDiv).click(function () {
    if (id != 0) {
        debugger;
        GetInputForPaymentsApply(id.toString());
        
        //$("#DialogPayByCustomer").data("CustPayData", { xInvoice: xInvoice, xCustomer: xCustomer, xPO: xPO, xAmountPaid: addCommas(parseFloat(xAmountPaid).toFixed(2)), xDiscount: xDiscount, xCheck: xCheck, xDate: xDate, xBank: xBank, xInvoiceDate: xInvoiceDate }).delay(5000).dialog("open");
        $("#DialogPayByCustomer").data("CustPayData", { xInvoice: xInvoice, xCustomer: xCustomer, xPO: xPO, xAmountPaid: addCommas(parseFloat(xAmountPaid).toFixed(2)), xDiscount: xDiscount, xCheck: xCheck, xDate: xDate, xBank: xBank }).delay(5000).dialog("open");
    }
    //});
}

function GetInputForPaymentsApply(rowID) {
    //debugger;
    xInvoice = rowID.toString();
    xCustomer = $("#fgrdCustPayARINVDetails #row" + rowID).find("td").eq(0).text();
    xInvDate = $("#fgrdCustPayARINVDetails #row" + rowID).find("td").eq(4).find('div')[0].children[0].dataset.recdate;
    xPO = $("#fgrdCustPayARINVDetails #row" + rowID).find("td").eq(5).text();
    xAmountPaid = parseFloat($("#fgrdCustPayARINVDetails #row" + rowID).find("td").eq(14).text().replace(/,/g, '')).toFixed(2);   // $("#lblCustPayCash").html();
    xCheck = $("#lblCustPayCheck").html() == "" ? "0" : $("#lblCustPayCheck").html();
    xDiscount = 0.00;
    //xInvoiceDate = $("#fgrdCustPayARINVDetails #row" + rowID).find("td").eq(17).find('div')[0].children[0].dataset.invdate;
    // xInvoiceDate = $("#fgrdCustPayARINVDetails #row" + rowID).find("td").eq(16).find('div')[0].innerText;

    if (IsCreditCardPaymentsActive == false) {
        xDate = $('#fgrdDepositHeader .trSelectedHeader').find('td').eq(1).find('div')[0].children[0].dataset.depositdate;
        xBank = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(5) div').text();
        xDeposit = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(3) div').text();
    }
    else {
        xDate = xCCDate;
        xBank = xCCBank;
        xDeposit = "";
    }

    xDiscountRes = GetCustPaymentsDiscount(xInvDate, xCustomer, xDate);
    xDiscount = xAmountPaid * parseFloat(xDiscountRes) / 100;

    InvBalance = xAmountPaid;
    CheckBalance = $("#lblCustPayBalanceLeft").html().replace(',', '');
    if (parseFloat(InvBalance) > parseFloat(CheckBalance)) {
        xAmountPaid = CheckBalance;
    }
    else {
        xAmountPaid = InvBalance;
    }

    if (IsAmountPaidFromConfirmed == true) {
        xAmountPaid = parseFloat($("#fgrdCustPayARINVDetails #row" + rowID).find("td").eq(11).text().replace(',', '')).toFixed(2);
    }
}

function GetCustPaymentsDiscount(xInvDate, xCustomer, xDate) {
    //debugger;
    var xDiscount = 0.00;
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetDiscountForCustomer',
        data: '{"xInvDate":"' + xInvDate + '","xCustomer":' + xCustomer + ',"xDate":"' + xDate + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {

            var res = output.d;
            xDiscount = parseFloat(res);
        },
        error: function () {
            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
        }
    });
    return xDiscount;
}

function ValidatePayByCustomer() {
    var Invoice = $("#txtCustomerPayInvoice").val().trim() == "" ? $("#txtCustomerPayInvoice").attr('placeholder') : $("#txtCustomerPayInvoice").val().trim();
    if (Invoice == "" || Invoice == "0") {
        $.MessageBox("Must enter valid deposit number");
        return false;
    }
    //if (Check == "") {
    //    $.MessageBox("Must enter check number");
    //    return false;
    //}

    //var BalanceLeft = parseFloat($("#lblCustPayBalanceLeft").html().replace(',', '')).toFixed(2);
    //if (BalanceLeft <= 0) {
    //    $.MessageBox("There's no balance to apply");
    //    return false;
    //}
    return true;
}

/*Save posting payments by Customer#*/
$("#DialogPayByCustomer").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Post Payments by Customer ",
    width: 450,
    buttons: {
        Apply: function () {
            debugger;
            //var Invoice = $("#txtCustomerPayInvoice").val().trim() == "" ? $("#txtCustomerPayInvoice").attr('placeholder') : $("#txtCustomerPayInvoice").val().trim();
            //if (Invoice == "" || Invoice == "0") {
            //    $.MessageBox("Must enter valid deposit number");
            //    return false;
            //}


            //var BalanceLeft = parseFloat($("#lblCustPayBalanceLeft").html().replace(',', '')).toFixed(2);
            //AmountPaid = $("#txtCustomerPayAmount").val() == "" ? $("#txtCustomerPayAmount").attr('placeholder') : $("#txtCustomerPayAmount").val();
            //if (parseFloat(AmountPaid) > parseFloat(BalanceLeft)) {
            //    //$.MessageBox("You have low balance amount than applied amount");
            //    //return false;
            //    $("#DivConfirmAppliedAmount").html("You have low balance amount than applied amount, Are you sure to continue?");
            //    $("#DivConfirmAppliedAmount").dialog("open");
            //}
            //else {
            debugger;
            var Invoice = $("#txtCustomerPayInvoice").val().trim() == "" ? $("#txtCustomerPayInvoice").attr('placeholder') : $("#txtCustomerPayInvoice").val().trim();
            var Customer = $("#txtCustomerPayCustomer").val() == "" ? $("#txtCustomerPayCustomer").attr('placeholder') : $("#txtCustomerPayCustomer").val();
            var PO = $("#txtCustomerPayPO").val() == "" ? $("#txtCustomerPayPO").attr('placeholder') : $("#txtCustomerPayPO").val();
            AmountPaid = $("#txtCustomerPayAmount").val() == "" ? $("#txtCustomerPayAmount").attr('placeholder') : $("#txtCustomerPayAmount").val();
            var Discount = $("#txtCustomerPayDiscount").val() == "" ? $("#txtCustomerPayDiscount").attr('placeholder') : $("#txtCustomerPayDiscount").val();
            var GL = $("#txtCustomerPayGL").val() == "" ? "" : $("#txtCustomerPayGL").val();
            var Check = $("#txtCustomerPayCheck").val() == "" ? $("#txtCustomerPayCheck").attr('placeholder') : $("#txtCustomerPayCheck").val();
            var Deposit = ($('#fgrdDepositHeader .trSelectedHeader td:nth-child(3) div').text() == "") ? "0" : $('#fgrdDepositHeader .trSelectedHeader td:nth-child(3) div').text();
            var BalanceLeft = parseFloat($("#lblCustPayBalanceLeft").html().replace(',', '')).toFixed(2);
            var Date = $("#txtCustomerPayDate").val();
            var Bank = $("#txtCustomerPayBank").val() == "" ? $("#txtCustomerPayBank").attr('placeholder') : $("#txtCustomerPayBank").val();
            debugger;
            //  var ForARInvDate = $("#DialogPayByCustomer").data("CustPayData")["xInvoiceDate"];

            if (parseFloat(AmountPaid) != 0) {
                //SavePostPaymentsInvoice(Invoice, Customer, PO, AmountPaid.replace(/,/g, ''), Discount, Check, Date, Bank, Deposit, GL, ForARInvDate);
                //SavePostPaymentsInvoiceOnGrid(Invoice, Customer, PO, AmountPaid.replace(/,/g, ''), Discount, Check, Date, Bank, Deposit, Invoice, ForARInvDate);

                SavePostPaymentsInvoice(Invoice, Customer, PO, AmountPaid.replace(/,/g, ''), Discount, Check, Date, Bank, Deposit, GL);
                SavePostPaymentsInvoiceOnGrid(Invoice, Customer, PO, AmountPaid.replace(/,/g, ''), Discount, Check, Date, Bank, Deposit, Invoice);

                //$("#fgrdCustPayARINVDetails").flexReload({ url: '/url/for/refresh' });
                //$("#fgrdDepositHeader").flexReload({ url: '/url/for/refresh' });
                //$("#fgrdDepositDetails").flexReload({ url: '/url/for/refresh' });
                //$("#fgrdCheckDetails").flexReload({ url: '/url/for/refresh' });
                //}
                //debugger;
                var Charges = 0.00;
                var Payments = 0.00;
                var Credits = 0.00;
                var Adjustments = 0.00;
                var Balance = 0.00;
                $('#fgrdCustPayARINVDetails tr').not(":last").each(function () {
                    Charges = parseFloat(Charges) + parseFloat($(this).find("td").eq(10).text().trim().replace(/,/g, ''));
                    Payments = parseFloat(Payments) + parseFloat($(this).find("td").eq(11).text().trim().replace(/,/g, ''));
                    Credits = parseFloat(Credits) + parseFloat($(this).find("td").eq(12).text().trim().replace(/,/g, ''));
                    Adjustments = parseFloat(Adjustments) + parseFloat($(this).find("td").eq(13).text().trim().replace(/,/g, ''));
                    Balance = parseFloat(Balance) + parseFloat($(this).find("td").eq(14).text().trim().replace(/,/g, ''));
                });
                $("#lblARINVBalance").html(addCommas(parseFloat(Balance).toFixed(2)));
                $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(10).find('div').text(addCommas(parseFloat(Charges).toFixed(2)));
                $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(11).find('div').text(addCommas(parseFloat(Payments).toFixed(2)));
                $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(12).find('div').text(addCommas(parseFloat(Credits).toFixed(2)));
                $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(13).find('div').text(addCommas(parseFloat(Adjustments).toFixed(2)));
                $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(14).find('div').text(addCommas(parseFloat(Balance).toFixed(2)));
            }

        },
        Cancel: function () {

            $(this).dialog("close");
        },
    },
    open: function () {
        clearInvoiceDialogFields();
        IsAmountPaidFromConfirmed = false;
        $("#txtCustomerPayAmount").focus();
        $(".CustomerPay").attr("disabled", "disabled");
        $("#txtCustomerPayAmount").attr('placeholder', $("#DialogPayByCustomer").data("CustPayData")["xAmountPaid"]);
        $("#txtCustomerPayInvoice").attr('placeholder', $("#DialogPayByCustomer").data("CustPayData")["xInvoice"]);
        $("#txtCustomerPayCustomer").attr('placeholder', $("#DialogPayByCustomer").data("CustPayData")["xCustomer"]);
        $("#txtCustomerPayPO").attr('placeholder', $("#DialogPayByCustomer").data("CustPayData")["xPO"]);
        $("#txtCustomerPayDiscount").attr('placeholder', parseFloat($("#DialogPayByCustomer").data("CustPayData")["xDiscount"]).toFixed(2));
        $("#txtCustomerPayCheck").attr('placeholder', $("#DialogPayByCustomer").data("CustPayData")["xCheck"]);
        $("#txtCustomerPayDate").val($("#DialogPayByCustomer").data("CustPayData")["xDate"]);
        $("#txtCustomerPayBank").attr('placeholder', $("#DialogPayByCustomer").data("CustPayData")["xBank"]);

        $(".ui-dialog-buttonpane button:contains('Apply')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
    },
    close: function () {
        //clearInvoiceDialogFields();
        //$('#fgrdCustPayARINVDetails tr').removeClass("trChecked");
        //$('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");

        Gridfocus();

        // $('#DialogCustPayARINVDetails').closest('.ui-dialog').find(".trSelectedHeader").focus()
        //if (parseFloat($("#lblCustPayBalanceLeft").html()) == 0) {           
        //    $("#fgrdCustPayARINVDetails").flexReload({ url: '/url/for/refresh' });
        //}

        $('#DivCustPayARINVDetails').find("#fgrdCustPayARINVDetails").focus();
    }
});

function Gridfocus() {
    clearInvoiceDialogFields();
    if (parseFloat($("#lblCustPayBalanceLeft").html()) > 0) {
        $("#fgrdCustPayARINVDetails .trSelectedHeader").nextAll().each(function () {

            var nextrowID = $(this).attr("id").replace('row', '');
            var nextrowBalance = parseFloat($("#fgrdCustPayARINVDetails  tr#row" + nextrowID).find('td').eq(14).find('div').text().replace(/,/g, ''));
            console.log(nextrowID + "," + nextrowBalance);
            $("#fgrdCustPayARINVDetails tr").removeClass("trSelectedHeader");
            $('#fgrdCustPayARINVDetails tr').removeClass("trChecked");
            $('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");
            if (nextrowBalance > 0.00 && nextrowID != "0") {
                $("#fgrdCustPayARINVDetails #row" + nextrowID).addClass("trSelectedHeader");
                return false;
            }
        });

        //$('#DivCustPayARINVDetails').closest(".ui-dialog").focus();
    }
}

function SavePostPaymentsInvoiceOnGrid(Invoice, Customer, PO, AmountPaid, Discount, Check, Date, Bank, Deposit, rowID) {
    debugger;
    AmountPaid = parseFloat(AmountPaid).toFixed(2);
    var BalanceLeft = parseFloat($("#lblCustPayBalanceLeft").html().replace(',', '')).toFixed(2);
    $("#lblCustPayBalanceLeft").html(addCommas(parseFloat(BalanceLeft - AmountPaid).toFixed(2)));

    clearInvoiceDialogFields();

    var Payments = parseFloat($("#fgrdCustPayARINVDetails tr#row" + rowID).find('td').eq(11).find('div').text().replace(/,/g, '')).toFixed(2);
    $("#fgrdCustPayARINVDetails  tr#row" + rowID).find('td').eq(11).find('div').text(addCommas(parseFloat(parseFloat(Payments) + parseFloat(AmountPaid)).toFixed(2)));

    var Charges = parseFloat($("#fgrdCustPayARINVDetails  tr#row" + rowID).find('td').eq(10).find('div').text().replace(/,/g, '')).toFixed(2);
    Payments = parseFloat($("#fgrdCustPayARINVDetails  tr#row" + rowID).find('td').eq(11).find('div').text().replace(/,/g, '')).toFixed(2);
    var Credits = parseFloat($("#fgrdCustPayARINVDetails  tr#row" + rowID).find('td').eq(12).find('div').text().replace(/,/g, '')).toFixed(2);
    var Adjustment = parseFloat(parseFloat(Discount) + parseFloat($("#fgrdCustPayARINVDetails  tr#row" + rowID).find('td').eq(13).find('div').text().replace(/,/g, ''))).toFixed(2);
    var Balance = Charges - Payments - Credits - Adjustment;
    if (parseFloat(Balance).toFixed(2) == "-0.00") {
        Balance = "0.00";
    }

    $("#fgrdCustPayARINVDetails  tr#row" + rowID).find('td').eq(13).find('div').text(addCommas(parseFloat(Adjustment).toFixed(2)));
    $("#fgrdCustPayARINVDetails  tr#row" + rowID).find('td').eq(14).find('div a').text(addCommas(parseFloat(Balance).toFixed(2)));

    //$("#fgrdCustPayARINVDetails").flexReload({ url: '/url/for/refresh' });

    //var lParentchecked = $("#DialogCustPayARINVDetails").data("CustPayARINVData")["lParentchecked"];
    //$("#fgrdCustPayARINVDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'lParentchecked', value: lParentchecked }, { name: 'IsPaymentsWithZeroBalance', value: "0" }], query: "", newp: 1 }).flexReload();

}

function SavePostPaymentsInvoice(Invoice, Customer, PO, AmountPaid, Discount, Check, Date, Bank, Deposit, GL) {
    debugger;
    var PaymentType = (IsCreditCardPaymentsActive == false) ? "Customer" : "CreditCard";
    if (Deposit == "") {
        Deposit = 0;
    }
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/SavePostPaymentsInvoice',
        data: '{"PaymentType":"' + PaymentType + '","xInvoice":' + Invoice + ',"xCustomer":' + Customer + ',"xPO":"' + PO + '","xAmount":' + AmountPaid + ',"xDiscount":' + Discount + ',"xCheck":' + Check + ',"xDate":"' + Date + '","xBank":"' + Bank + '","xDeposit":' + Deposit + ',"CardType":"' + xCCType + '","Approval":"' + xCCApproval + '","GL":"' + GL + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //async: false,
        success: function (output) {
            //debugger;
            var res = output.d;
            console.log(res);
            if (res == "success") {
                //$.MessageBox("Saved successfully");
                //debugger;
                if (IsAmountPaidFromConfirmed == true) {
                    $("#MsgAutoPostPaymentsWarning").dialog("close");
                }
                else {
                    // Gridfocus();
                    if (pagedownkey != 1) { 
                        $("#DialogPayByCustomer").dialog("close");
                    }
                    //if (parseFloat($("#lblCustPayBalanceLeft").html()) > 0) {
                    //    $("#fgrdCustPayARINVDetails .trSelectedHeader").nextAll().each(function () {
                    //        var nextrowID = $(this).attr("id").replace('row', '');
                    //        var nextrowBalance = parseFloat($("#fgrdCustPayARINVDetails  tr#row" + nextrowID).find('td').eq(14).find('div').text().replace(/,/g, ''));

                    //        $("#fgrdCustPayARINVDetails tr").removeClass("trSelectedHeader");
                    //        $('#fgrdCustPayARINVDetails tr').removeClass("trChecked");
                    //        $('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");
                    //        if (nextrowBalance > 0.00 && nextrowID != "0") {
                    //            $("#fgrdCustPayARINVDetails #row" + nextrowID).addClass("trSelectedHeader");
                    //            return false;
                    //        }
                    //    });
                    //}                    
                }
            }
            else {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        },
        error: function () {
            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
        }
    });


}

$("#DivConfirmAppliedAmount").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Alert",
    width: 345,
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
    },
    buttons: {
        Yes: function () {

            $("#DivConfirmAppliedAmount").dialog("close")
            //SavePostPaymentsInvoice();
        },
        No: function () {
            $("#DivConfirmAppliedAmount").dialog("close");
        }
    }
});

/*Post Payments By PO section*/
$("#txtPOPayDate").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'mm/dd/yy',
    showOtherMonths: true,
    selectOtherMonths: true
}).datepicker("setDate", new Date());

/*Check Invoice# to ARINVS*/
$("#txtPOPayPO").focusout(function () {
    debugger;
    var PO = $("#txtPOPayPO").val();
    var Date = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(2) div').text();
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/CheckAndGetPODetails',
        data: '{"xPO":"' + PO + '","xDate":"' + Date + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            var res = output.d;
            var resultSet = res[0];
            if (resultSet.ErrorMessage.indexOf("Invoice not") >= 0) { /*If Invoice not available*/
                $.MessageBox(resultSet.ErrorMessage);
                $("#txtPOPayPO").val("");
                $("#txtPOPayPO").attr('placeholder', "");
                $("#txtPOPayPO").focus();
                return false;
            }
            else {
                $("#txtPOPayCustomer").val("");
                $("#txtPOPayCustomer").attr('placeholder', resultSet.Customer);
                $("#txtPOPayAmount").val("");
                $("#txtPOPayAmount").attr('placeholder', addCommas(resultSet.Balance.toFixed(2)));
                $("#txtPOPayInvoice").val("");
                $("#txtPOPayInvoice").attr('placeholder', resultSet.Invoice);
                $("#txtPOPayDiscount").val("");
                $("#txtPOPayDiscount").attr('placeholder', resultSet.Discount);
                $("#CustNamePO").html(resultSet.CustName)
                //   $("#DialogPayByPO").data("xInvoiceDate", resultSet.InvDate);
            }
        }
    });
});

/*Save posting payments for the invoice#*/
$("#DialogPayByPO").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Post Payments by PO",
    width: 618,
    buttons: {
        Save: function () {
            debugger;
            var Invoice = $("#txtPOPayInvoice").val().trim() == "" ? $("#txtPOPayInvoice").attr('placeholder') : $("#txtPOPayInvoice").val().trim();
            var Customer = $("#txtPOPayCustomer").val() == "" ? $("#txtPOPayCustomer").attr('placeholder') : $("#txtPOPayCustomer").val();
            var PO = $("#txtPOPayPO").val() == "" ? $("#txtPOPayPO").attr('placeholder') : $("#txtPOPayPO").val();
            var Amount = $("#txtPOPayAmount").val() == "" ? $("#txtPOPayAmount").attr('placeholder').replace(',', '') : $("#txtPOPayAmount").val().replace(',', '');
            var Discount = $("#txtPOPayDiscount").val() == "" ? $("#txtPOPayDiscount").attr('placeholder') : $("#txtPOPayDiscount").val();
            var GL = $("#txtPOPayGL").val().trim() == "" ? "" : $("#txtPOPayGL").val();
            var Check = $("#txtPOPayCheck").val() == "" ? $("#txtPOPayCheck").attr('placeholder') : $("#txtPOPayCheck").val();
            var Deposit = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(3) div').text();
            if (Invoice == "" || Invoice == "0") {
                $.MessageBox("Must enter valid deposit number");
                return false;
            }
            if (Check == "") {
                $.MessageBox("Must enter check number");
                return false;
            }
            var Date = $("#txtPOPayDate").val();
            var Bank = $("#txtPOPayBank").val() == "" ? $("#txtPOPayBank").attr('placeholder') : $("#txtPOPayBank").val();
            //  var ForARInvDate = $("#DialogPayByCustomer").data("CustPayData")["xInvoiceDate"];

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/SavePostPaymentsInvoice',
                data: '{"PaymentType":"PO","xInvoice":' + Invoice + ',"xCustomer":' + Customer + ',"xPO":"' + PO + '","xAmount":' + Amount.replace(',', '') + ',"xDiscount":' + Discount + ',"xCheck":' + Check + ',"xDate":"' + Date + '","xBank":"' + Bank + '","xDeposit":' + Deposit + ',"CardType":"","Approval":"","GL":"'+GL+'"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    var res = output.d;
                    if (res == "success") {
                        //$.MessageBox("Saved successfully");
                        clearInvoiceDialogFields();
                        //$("#fgrdDepositDetails").flexOptions({ params: [{ name: 'FilterQuery', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();

                        $("#fgrdDepositHeader").flexReload({ url: '/url/for/refresh' });
                        $("#fgrdDepositDetails").flexReload({ url: '/url/for/refresh' });
                        $("#fgrdCheckDetails").flexReload({ url: '/url/for/refresh' });
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                    //$("#DialogPayByPO").dialog("close");
                },
                error: function () {
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                }
            });
        },
        Cancel: function () {
            $(this).dialog("close");
        },
    },
    open: function () {
        clearInvoiceDialogFields();
        var Date = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(2) div').text();
        var Bank = $('#fgrdDepositHeader .trSelectedHeader td:nth-child(5) div').text();
        $("#txtPOPayDate").val(Date);
        $("#txtPOPayDate").attr("placeholder", Bank);
        $("#txtPOPayDate").attr("disabled","disabled");
        $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
    }
});

/*Show message box for print option progress :: Created by Abinaya :: 05May2018*/
$("#MsgPrintWarning").dialog({
    autoOpen: false,
    resizable: false,
    title: "Alert",
    modal: true,
});

//For Print DepositHeader :: Created by Abinaya :: 03May2018
$("[id^=printDepositHeader_]").die("click").live("click", function () {
    /* Show progress dialog for printing :: 04May2018
    $("#MsgPrintHtml").html("Printing... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
    $("#MsgPrintWarning").dialog("open");*/
    debugger;
    var CurrentIDs = $(this)[0].id;
    var IsLocked = CurrentIDs.split("_")[1];
    var Deposit = CurrentIDs.split("_")[2];
    var Date = CurrentIDs.split("_")[3];
    var Bank = CurrentIDs.split("_")[4];
    //var IsLocked = $('#fgrdDepositHeader #row' + CurrentIDs + ' td:nth-child(8) div').text()

    //if (IsLocked.trim() != "") {
    //    $.MessageBox(IsLocked);
    //}
    //else {

    $("#DivHeaderID").html(IsLocked + "_" + Deposit + "_" + Date + "_" + Bank);
    PrintPaymentsDepositReports(Deposit, '0', Bank, '0', Date, Date, 'A Deposit');
    //}
});


function PrintPaymentsDepositReports(DepositNumber, CheckNo, BankNo, CustomerNo, FromDate, ToDate, DepositType) {

    var w = window.open('GeneratingPDF.html');
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintARDepositReports',
        data: "{'DepositNumber':'" + DepositNumber + "','CheckNo':'" + CheckNo + "','BankNo':'" + BankNo + "', 'CustomerNo':'" + CustomerNo + "','FromDate':'" + FromDate + "','ToDate': '" + ToDate + "','DepositType':'" + DepositType + "'}",
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

                /* Print the PDF directly to the Default Printer of the Server :: 04May2018
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PrintPostPaymentsDepositReports',
                    data: "{'ExportedPath':'" + escape(ExportedPath) + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                       
                        if (output.d == "Success") {
                            $("#MsgPrintWarning").dialog("close");
                        }
                        else if (output.d.indexOf("error") >= 0) {
                            $.MessageBox(output.d.substring(5, output.d.length));
                        }
                        else if (output.d.indexOf("No application is associated with the specified file") >= 0) {
                            $.MessageBox("Printer not connected with server.");
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    },
                    error:function(){
                        $.MessageBox("Printer not connected with server.");
                    }
                });  */
                }
        }
    });
}

$(document).ready(function () {
    debugger;
    $("#btnCustPayViewOpen").html("<span style='text-decoration: underline'>V</span>iew Open");
    $("#btnCustPayViewOpen").prop('value', 'View Open');
});
var pagedownkey = 0;
$(document).unbind('keydown').bind('keydown', function (e) {
    //debugger;
    if ($("#btnCustPayCash").is(":hidden") != true && $("#DivCustPayARINVDetails .qsbox").is(":focus") == false) {
        if (e.keyCode == 65) {
            $("#btnCustPayCash").click();
        }
        if (e.keyCode == 72) {
            $("#btnCustPayCheck").click();
        }
        if (e.keyCode == 82) {
            $("#btnCustPayCreditCard").click();
        }
        if (e.keyCode == 85) {
            $("#btnCustPayUnapplied").click();
        }
        if (e.keyCode == 86) {
            //if ($("#btnCustPayCash").is(":hidden") != true || $("#btnCustPayCCApply").is(":hidden") != true)
            //    $("#btnCustPayViewOpen").click();
        }
        if (e.keyCode == 83) {
            if ($("#btnCustPayCash").is(":hidden") != true || $("#btnCustPayCCApply").is(":hidden") != true)
                $("#btnCustPayViewZeroBlnceInvoice").click();
        }
    }
    else {
        if (e.keyCode == 83) {
            if ($("#btnCustPayCash").is(":hidden") != true || $("#btnCustPayCCApply").is(":hidden") != true)
                $("#btnCustPayViewZeroBlnceInvoice").click();
        }
    }
    if (e.keyCode != 121 && !e.altKey) { //fixed-alt+f10 is not working in postpayments screen.
        e.stopPropagation();
    }
   
});

$('#DialogPayByCustomer').unbind('keydown').bind('keydown', function (e) {
    debugger
    if (e.which == 38) {
        if ($("#txtCustomerPayDiscount").is(':focus') == true) {
            $("#txtCustomerPayAmount").focus()
            return false
        }
        if ($("#txtCustomerPayGL").is(':focus') == true) {
            $("#txtCustomerPayDiscount").focus()
            return false
        }
    }
    if (e.which == 40) {
        if ($("#txtCustomerPayAmount").is(':focus') == true) {
            $("#txtCustomerPayDiscount").focus()
            return false
        }
        if ($("#txtCustomerPayDiscount").is(':focus') == true) {
            $("#txtCustomerPayGL").focus()
            return false
        }
    }
    if ($("#DialogPayByCustomer").dialog('isOpen') == true) {
        if (e.keyCode == 34) {
            if ($("#txtCustomerPayAmount").is(':focus') == true || $("#txtCustomerPayDiscount").is(':focus') == true || $("#txtCustomerPayGL").is(':focus') == true) {
                var buttons = $("#DialogPayByCustomer").dialog("option", "buttons")
                buttons["Apply"]();
                $("#DialogPayByCustomer").dialog("close")
                var focused = document.activeElement;
                e.preventDefault();
                var CurrentSelectedrow = $("#fgrdCustPayARINVDetails .trSelectedHeader")
                var id = CurrentSelectedrow.attr('id').replace('row', '');
                var InvBalance = $("#fgrdCustPayARINVDetails #row" + id).find("td").eq(14).text().replace(/,/g, '');
                if (InvBalance != "0.00") {
                    $("#ARINVPayselect_" + id + "").trigger("click");
                }
                pagedownkey = 1;
                e.stopPropagation();
            }
        }
    }
})
/*Arrow keys for up and down on grid rows :: created by Abinaya :: 04May2018*/
$('#DivCustPayARINVDetails').unbind('keydown').bind('keydown', function (e) {
    //debugger;
    var focused = document.activeElement;
    if (e.which == 13) { //key enter
        e.preventDefault();
        var CurrentSelectedrow = $("#fgrdCustPayARINVDetails .trSelectedHeader")
        var id = CurrentSelectedrow.attr('id').replace('row', '');
        var InvBalance = $("#fgrdCustPayARINVDetails #row" + id).find("td").eq(14).text().replace(/,/g, '');
        if (InvBalance != "0.00") {
            $("#ARINVPayselect_" + id + "").trigger("click");
        }

        e.stopPropagation();
    }
    if (e.which == 38) { //up arrow
        e.preventDefault();
        var CurrentSelectedrow = $("#fgrdCustPayARINVDetails .trSelectedHeader")
        Prevrow = $("#fgrdCustPayARINVDetails .trSelectedHeader").prev();

        if (Prevrow.length != 0) {
            CurrentSelectedrow.removeClass("trSelectedHeader");
            Prevrow.addClass("trSelectedHeader");


            var newRow = $(Prevrow)
            var rowTop = newRow.position().top;
            var rowBottom = rowTop + newRow.height();
            var $table = $('#DivCustPayARINVDetails .bDiv'); // store instead of calling twice
            var tableHeight = $table.height();
            var currentScroll = $table.scrollTop();

            if (rowTop < 0) {
                // scroll up
                $('#DivCustPayARINVDetails .bDiv').scrollTop(currentScroll + rowTop);
            }
            else if (rowBottom > tableHeight) {
                // scroll down
                var scrollAmount = rowBottom - tableHeight;
                $('#DivCustPayARINVDetails .bDiv').scrollTop(currentScroll + scrollAmount);
            }

            return false; e.stopPropagation();
        }
        return false; e.stopPropagation();

    }
    else if (e.which == 40) { //down arrow
        e.preventDefault();
        var CurrentSelectedrow = $("#fgrdCustPayARINVDetails .trSelectedHeader")
        nextrow = $("#fgrdCustPayARINVDetails .trSelectedHeader").next()
        //debugger;
        if (nextrow.length != 0 && nextrow.attr('id') != 'row0') {
            CurrentSelectedrow.removeClass("trSelectedHeader");
            nextrow.addClass("trSelectedHeader");

            var newRow = $(nextrow)
            var rowTop = newRow.position().top;
            var rowBottom = rowTop + newRow.height();
            var $table = $('#DivCustPayARINVDetails .bDiv'); // store instead of calling twice
            var tableHeight = $table.height();
            var currentScroll = $table.scrollTop();

            if (rowTop < 0) {
                // scroll up
                $('#DivCustPayARINVDetails .bDiv').scrollTop(currentScroll + rowTop);
            }
            else if (rowBottom > tableHeight) {
                // scroll down
                var scrollAmount = rowBottom - tableHeight;
                $('#DivCustPayARINVDetails .bDiv').scrollTop(currentScroll + scrollAmount);
            }

            return false; e.stopPropagation();
        }
        return false;
        e.stopPropagation();
    }


});


$('#DivCustPayARINVDetails').on('mouseenter', function (e) {
    //$('#DivCustPayARINVDetails').attr('tabindex', -1);
    var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
    $("#fgrdCustPayARINVDetails")[0].tabIndex = tabindex;
    $('#fgrdCustPayARINVDetails').focus();
});

/*Add commas when enter values in textboxes :: Created by Abinaya :: 07May2018*/
$('#txtCustPayCash, #txtInvPayAmount, #txtPOPayAmount').keyup(function (event) {
    // skip for arrow keys
    if (event.which >= 37 && event.which <= 40) {
        event.preventDefault();
    }
    $(this).val(function (index, value) {
        value = value.replace(/,/g, '');
        return numberWithCommas(value);
    });
});

function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}

$("#btnCustPayViewZeroBlnceInvoice").die("click").live("click", function () {
    //debugger;
    if (IsPaymentsWithZeroBalance == "0") {
        IsPaymentsWithZeroBalance = "1"
        $("#btnCustPayViewZeroBlnceInvoice").html("Hide 0's");
    }
    else {
        IsPaymentsWithZeroBalance = "0"
        $("#btnCustPayViewZeroBlnceInvoice").html("<span style='text-decoration: underline'>S</span>how 0's");
    }

    var Customer = $("#DialogCustPayARINVDetails").data("CustPayARINVData")["Customer"];
    var lParentchecked = $("#DialogCustPayARINVDetails").data("CustPayARINVData")["lParentchecked"];

    $("#fgrdCustPayARINVDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'lParentchecked', value: lParentchecked }, { name: 'IsPaymentsWithZeroBalance', value: IsPaymentsWithZeroBalance }, { name: 'IsByViewOpen', value: false }, { name: 'viewDate', value: "" }], query: "", newp: 1 }).flexReload();
});


/*Show ARINV payments detail buttons back to the process :: Created by Abinaya :: 11Jun2018*/
$("#btnCustPayExit").die("click").live("click", function () {
    //debugger;
    IsExitFromCheck = true;
    if (parseFloat($("#lblCustPayBalanceLeft").html()) > 0) {
        if (IsCreditCardPaymentsActive == true) {
            $("#msgCustPayARINVDetailsHtml").html("Card payments not completed,  are you sure you want to close?");
            $("#msgbox-CustPayARINVDetails").dialog("open");
        }
        else if ($("#txtCustPayNoCheck").val() == "") {
            $("#msgCustPayARINVDetailsHtml").html("Check not completed,  are you sure you want to close?");
            $("#msgbox-CustPayARINVDetails").dialog("open");
        }
        else {
            $("#msgCustPayARINVDetailsHtml").html("Cash not completed,  are you sure you want to close?");
            $("#msgbox-CustPayARINVDetails").dialog("open");
        }
        return false;
    }
    else {
        clearCheckProcess();
    }
});

function clearCheckProcess() {
    $("#DivBtnPaymentDetails").show();
    $("#DivBtnPaymentExitDetails").hide();
    IsCashOrCheckApplied = false;
    $("#DivCustPayARINVCheckCashDetails").hide();//hide cash or check details 
    $('[id^=ARINVPayselectAll]').attr('src', "images/check-off.png")
    $("#lblCustPayCheck").html("");
    $("#lblCustPayCash").html("");
    $("#lblCustPayBalanceLeft").html("");

    $('input[type="image"]').attr("disabled", true);
    $('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");/*Enable check box after cash/check value availed :: modified by Abinaya :: 03-05-2018*/

    $('#fgrdCustPayARINVDetails tr').removeClass("trChecked");
    $("[id^=ARINVPayselect_]:visible").removeClass('ARINVselected');
    $("#DivCustPayARIVDetailID1").html("0");

    // $("#fgrdCustPayARINVDetails").flexReload({ url: '/url/for/refresh' });

    $("#DivBtnPaymentByIvoiceForCurrentOrders").hide();

}

/*Auto payments for select all options :: Created by Abinaya :: 11Jun2018*/
$("#ARINVPayselectAll").die("click").live("click", function () {
    //debugger;
    var sourceCtl = $(this);
    var img = sourceCtl.attr("src").toLowerCase();
    var Selected = "0";
    if (img.indexOf("off") > 0) {
        Selected = "1";
    }
    var Query = $("#fgrdCustPayARINVDetails").flexOptions()[0].p.query;
    var QueryType = $("#fgrdCustPayARINVDetails").flexOptions()[0].p.qtype;
    var CheckBalance = 0.00;
    var InvBalance = 0.00;
    var AvailBalance = 0.00;
    var BalanceLeft = 0.00;
    CheckBalance = parseFloat($("#lblCustPayBalanceLeft").html().replace(/,/g, ''));
    OrigCheckBalance = parseFloat($("#lblCustPayBalanceLeft").html().replace(/,/g, ''));
    BalanceLeft = CheckBalance;
    if (Selected == "1" && CheckBalance > 0) {
        sourceCtl.prop("src", "images/check-on.png");

        /*Reset the check boxes*/
        $('#fgrdCustPayARINVDetails tr').removeClass("trChecked");
        $("[id^=ARINVPayselect_]:visible").removeClass('ARINVselected');
        $("[id^=ARINVPayselect_]").prop("src", "images/check-off.png");

        $("#fgrdCustPayARINVDetailsCopy").html($("#fgrdCustPayARINVDetails").html())

        $('#fgrdCustPayARINVDetails tr').each(function () {
            var rowID = $(this).attr("id").replace("row", "");
            var PostBalance;
            //debugger;
            if ($(this).attr("id") == "row0") {
            }
            else {
                InvBalance = parseFloat($(this).find("td").eq(14).text().trim().replace(/,/g, ''));

                if (InvBalance > 0 && BalanceLeft > 0) {

                    if (BalanceLeft > InvBalance) {
                        PostBalance = InvBalance;
                    }
                    else {
                        PostBalance = BalanceLeft;
                    }

                    $("#fgrdCustPayARINVDetails  tr#row" + rowID).find('td').eq(15).find('div a').text(addCommas(parseFloat(PostBalance).toFixed(2)));

                    //parseFloat(InvBalance) + parseFloat($(this).find("td").eq(10).text().trim().replace(/,/g, ''));  //Invoice balance on the grid for the customer.
                    AvailBalance = BalanceLeft - InvBalance;

                    if ((AvailBalance > 0 || BalanceLeft > 0) && InvBalance > 0) {
                        $('#fgrdCustPayARINVDetails tr#row' + rowID).addClass("trChecked");
                        $('#fgrdCustPayARINVDetails tr#row0').removeClass("trChecked");
                        $("#ARINVPayselect_" + rowID + ":visible").prop("src", "images/check-on.png");
                        $("#ARINVPayselect_" + rowID + ":visible").attr('class', 'ARINVselected');

                        BalanceLeft = AvailBalance;
                        //debugger;
                        IsAmountPaidFromConfirmed = false;
                        GetInputForPaymentsApply(rowID);
                        SavePostPaymentsInvoiceOnGrid(xInvoice, xCustomer, xPO, xAmountPaid, xDiscount, xCheck, xDate, xBank, xDeposit, rowID)

                        $("#MsgAutoPostPaymentsWarning").dialog("open");
                        $("#MsgAutoPostPaymentsHtml").html("Do you want to apply this payment?")
                    }
                }
            }
            $("#DivCustPayARINVDetails").data("rowID", rowID);
        });
    }
    else {
        sourceCtl.prop("src", "images/check-off.png");
        $('#fgrdCustPayARINVDetails tr').removeClass("trChecked");
        $("[id^=ARINVPayselect_]:visible").removeClass('ARINVselected');
        $("[id^=ARINVPayselect_]").prop("src", "images/check-off.png");
    }
});

//Confirmation message for posting the payments automatically :: Created by Abi :: 12Jun2018
$("#MsgAutoPostPaymentsWarning").dialog({
    autoOpen: false,
    resizable: false,
    title: "Alert",
    modal: true,
    buttons: {
        Yes: function () {
            //debugger;
            var rowID = '';
            $('#fgrdCustPayARINVDetails tr.trChecked').each(function () {
                rowID = $(this).attr("id").replace("row", "");
                //debugger;
                IsAmountPaidFromConfirmed = true;
                GetInputForPaymentsApply(rowID);
                var PostCheckAmount = parseFloat($("#fgrdCustPayARINVDetails  tr#row" + rowID).find('td').eq(15).find('div a').text().replace(",", ""));
                debugger;
                // var ForARInvDate = $("#DialogPayByCustomer").data("CustPayData")["xInvoiceDate"];
                SavePostPaymentsInvoice(xInvoice, xCustomer, xPO, PostCheckAmount, xDiscount, xCheck, xDate, xBank, xDeposit)
            });
        },
        No: function () {
            IsAmountPaidFromConfirmed = false;
            $("#fgrdCustPayARINVDetails").html($("#fgrdCustPayARINVDetailsCopy").html());
            $("#lblCustPayBalanceLeft").html(addCommas(parseFloat(OrigCheckBalance).toFixed(2)));
            $('[id^=ARINVPayselectAll]').attr('src', "images/check-off.png")
            $('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");/*Enable check box after cash/check value availed :: modified by Abinaya :: 03-05-2018*/
            $('#fgrdCustPayARINVDetails tr').removeClass("trChecked");
            $("[id^=ARINVPayselect_]:visible").removeClass('ARINVselected');


            $("#fgrdCustPayARINVDetails tbody tr").click(function (event) {
                //debugger;
                if ($(this).attr("id") != "row0") {
                    var id = $(this).attr('id').replace('row', '')
                    $("#DivCustPayARIVDetailID1").html(id.toString());
                    $("#fgrdCustPayARINVDetails [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html()).addClass("trSelectedHeader");
                    $("#fgrdCustPayARINVDetails td.unsorted").addClass("sorted");
                    $("#fgrdCustPayARINVDetails td.sorted").removeClass("unsorted");
                    $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html()).removeClass("trSelected");
                    $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html() + " td.sorted").addClass("unsorted");
                    $("#fgrdCustPayARINVDetails #row" + $("#DivCustPayARIVDetailID1").html() + " td.unsorted").removeClass("sorted");
                }
            });


            $("#MsgAutoPostPaymentsWarning").dialog("close");
        }
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
        $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
    },
    close: function () {
        //debugger;
        $("#fgrdCustPayARINVDetailsCopy").html("");

        if (IsAmountPaidFromConfirmed == true) {
            clearCheckProcess();

            var Charges = 0.00;
            var Payments = 0.00;
            var Credits = 0.00;
            var Adjustments = 0.00;
            var Balance = 0.00;
            $('#fgrdCustPayARINVDetails tr').not(":last").each(function () {
                Charges = parseFloat(Charges) + parseFloat($(this).find("td").eq(10).text().trim().replace(/,/g, ''));
                Payments = parseFloat(Payments) + parseFloat($(this).find("td").eq(11).text().trim().replace(/,/g, ''));
                Credits = parseFloat(Credits) + parseFloat($(this).find("td").eq(12).text().trim().replace(/,/g, ''));
                Adjustments = parseFloat(Adjustments) + parseFloat($(this).find("td").eq(13).text().trim().replace(/,/g, ''));
                Balance = parseFloat(Balance) + parseFloat($(this).find("td").eq(14).text().trim().replace(/,/g, ''));
            });
            $("#lblARINVBalance").html(addCommas(parseFloat(Balance).toFixed(2)));
            $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(10).find('div').text(addCommas(parseFloat(Charges).toFixed(2)));
            $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(11).find('div').text(addCommas(parseFloat(Payments).toFixed(2)));
            $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(12).find('div').text(addCommas(parseFloat(Credits).toFixed(2)));
            $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(13).find('div').text(addCommas(parseFloat(Adjustments).toFixed(2)));
            $("#fgrdCustPayARINVDetails  tr#row0").find('td').eq(14).find('div').text(addCommas(parseFloat(Balance).toFixed(2)));
        }
        else {
            //$("#fgrdCustPayARINVDetails").flexReload({ url: '/url/for/refresh' });
        }
    }
});


/*Post A File option :: Upload a Excel file :: Created by Abinaya :: 26Jun2018 */
$("#DialogUploadExcelFile").dialog({
    autoOpen: false,
    resizable: false,
    title: "Post A File",
    modal: true,
    width: 450,
    buttons: {
    },
    open: function () {
        $('#uploadFile_process').hide();
        $(".YellowWarning").hide();
        //$(".ui-dialog-buttonpane button:contains('OK')").addClass('dialogbuttonstyle icon-save');
        //$(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
    },
    close: function () {
        //debugger;
    }
});


$("#txtPostAFile").change(function () {
    UploadPaymentFileAsync();
});

const UploadPaymentFileAsync = async () => {
    debugger;
        var DepositNum = $("#fgrdDepositHeader .trSelectedHeader").find("td").eq(2).text();
        $("#hdnheaderfileid").val(DepositNum);

        fileName = $("#txtPostAFile")[0].files[0].name;
        const result = await getBase64($("#txtPostAFile")[0].files[0]).catch(e => Error(e));
        fileBase64Str = result;
        var JsonModel = { 'fileBase64Str': fileBase64Str, 'fileName': fileName, 'depositNo': DepositNum };
        $.ajax({
        type: "POST",
        url: "BloomService.asmx/UploadPostPaymentFile",
        data: JSON.stringify(JsonModel),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            if (output.d == "success") {
                $.growl.notice({ title: "", message: "File has been uploaded successfully!!" });
                $("#txtPostAFile").val(null);
                $("#DialogUploadExcelFile").dialog("close");
            } else {
                $.growl.error({ title: "", message: output.d });
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            debugger;
        },
        complete: function () {
            debugger;
        }
    });
}

function getBase64(file, fname) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result, fname);
        reader.onerror = error => reject(error);
    });
}

function startPaymentsPostAFileUpload() {
    //debugger;
    $('#uploadFile_process').show();
    $('#uploadFile_form').hide();
    return true;
}

function stopUploadPostingFiles(path, fileType) {
    //debugger;
    //Abinaya::26Jun2018::to update/add the header files
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/SaveCSVFilesToTemp',
        data: "{'HeaderFileName':'" + path + "','fileType':'" + fileType + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            //debugger;
            var res = output.d;
            if (res.ErrorMessage == "Wrong POs") {
                $.MessageBox("There is PO's not found... Please check your email!");
                $("#uploadFile_process").hide();
                $("#uploadFile_form").show();
            }
            else {
                $("#uploadFile_process").hide();
                $("#uploadFile_form").show();
                //$("#DialogUploadExcelFile").dialog("close");

                var Check = res.Check;
                var TotalAmount = res.Amount;
                var Date = $("#fgrdDepositHeader .trSelectedHeader").find("td").eq(1).text();
                var DepositNum = $("#fgrdDepositHeader .trSelectedHeader").find("td").eq(2).text();
                var Bank = $("#fgrdDepositHeader .trSelectedHeader").find("td").eq(4).text();
                //showPostAFilePopup(check,TotalAmount);

                $("#txtFileDepositNum").val(DepositNum);
                $("#txtFileDepositDate").val(Date);
                $("#txtFileDepositBank").val(Bank);
                $("#txtFileDepositAmount").val(parseFloat(TotalAmount).toFixed(2));
                $("#txtFileDepositCheck").val(Check);
                $("#DialogPostAFile").dialog("open");
            }

        }
    });
}
//END

//for New Deposit Date datepicker
$("#txtFileDepositDate").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'mm/dd/yy',
    showOtherMonths: true,
    selectOtherMonths: true
}).datepicker("setDate", new Date());


/*Post A File option :: Payments Apply option :: Created by Abinaya :: 28Jun2018 */
$("#DialogPostAFile").dialog({
    autoOpen: false,
    resizable: false,
    title: "Post A File",
    modal: true,
    width: 450,
    buttons: {
        Apply: function () {
            /* Payments Apply option :: Created by Abinaya :: 29Jun2018 */
            //debugger;
            var Deposit = $("#txtFileDepositNum").val();
            var DepositDate = $("#txtFileDepositDate").val();
            var Bank = $("#txtFileDepositBank").val();
            var Amount = $("#txtFileDepositAmount").val();
            var Check = $("#txtFileDepositCheck").val();

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ApplyPaymentsForPostAFile',
                data: "{'Deposit':'" + Deposit + "','DepositDate':'" + DepositDate + "','Bank':'" + Bank + "','Amount':'" + Amount + "','Check':'" + Check + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    //debugger;
                    var res = output.d;
                }
            });
        },
        Cancel: function () { }
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Apply')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
    },
    close: function () {
        //debugger;
    }
});

/*Credit card payments :: created by Abinaya :: 17Aug2018*/
$("#btnCreditCardPayments").die("click").live("click", function () {
    //debugger;
    $(".tdDepositPayments").hide();
    $("#btnCreditCardPayments").hide();
    $("#DivCreditCardHeader").show();    
    $(".tdCreditCardPayments").show();
    //$("#btnDepositListing").hide();
    $("#btnDepositListing").show();
    $(".tdDepositListing").show();
    IsCreditCardPaymentsActive = true;

    $("#fgrdCreditCardHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
});

/*Back to deposit listing :: added by Jose Diaz :: 2012-06-01*/
$("#btnDepositListing").die("click").live("click", function () {
    debugger;
    $(".tdDepositPayments").show();
    $("#DivCreditCardHeader").hide();        
    $("#btnCreditCardPayments").show();
    $(".tdCreditCardPayments").show();
    //$("#btnDepositListing").hide();
    $("#btnDepositListing").hide();
    $(".tdDepositListing").hide();
    IsCreditCardPaymentsActive = false;
    $("#fgrdDepositHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
    $("#DivDepositHeader").show();
    $("#DivDepositDetails").hide();
    $("#DivCheckDetails").hide();
    $("#lstPostPayments").hide();
    $("#tdhide1").hide();
    $("#tdhide2").hide();
    $("#DivHeaderID").html("0");
    $("#DivDetailID").html("0");

});

//for New CreditCard details Date datepicker
$("#txtNewCCDate").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'mm/dd/yy',
    showOtherMonths: true,
    selectOtherMonths: true
}).datepicker("setDate", new Date());

/*Save new credit card details into header table*/
$("#DialogNewCreditCard").dialog({
    autoOpen: false,
    resizable: false,
    title: "Add New Credit Card Details",
    modal: true,
    width: 400,
    buttons: {
        Save: function () {
            //debugger;
            var NewCCAmount = addCommas(parseFloat($("#txtNewCCAmount").val().trim() == "" ? $("#txtNewCCAmount").attr("placeholder") : parseFloat($("#txtNewCCAmount").val())).toFixed(2));
            var NewCCType = $("#lstNewCCType").val();
            var NewCCDate = $("#txtNewCCDate").val().trim() == "" ? new Date() : $("#txtNewCCDate").val();
            var NewCCApprovalCode = $("#txtNewCCApprovalCode").val().trim() == "" ? "" : $("#txtNewCCApprovalCode").val();
            var NewCCBank = $("#txtNewCCBank").val() == "" ? $("#txtNewCCBank").attr("placeholder") : $("#txtNewCCBank").val();

            xCCAmount = NewCCAmount;
            xCCType = NewCCType;
            xCCDate = NewCCDate;
            xCCApproval = NewCCApprovalCode;
            xCCBank = NewCCBank;
            $("#txtCCAmount").val("");
            $("#txtCCAmount").attr("placeholder", xCCAmount);
            $("#lstNewCCType").val(xCCType);
            $("#txtNewCCApprovalCode").val(xCCApproval);
            $("#txtNewCCDate").val(xCCDate);
            $("#txtNewCCBank").val(xCCBank);




            $("#trARINVDepositDetails").hide();//Hide deposit row
            $("#trARINVCreditCard").show();//Show credit card type row

            var AmountEntered = addCommas(parseFloat($("#txtNewCCAmount").val().replace(/,/g, '')).toFixed(2));
            if (AmountEntered == "0.00" || AmountEntered == "NaN") {
                $("#txtNewCCAmount").focus();
                return false;
            }
            $("#DivCustPayARINVCheckCashDetails").show();
            $("#lblARINVCreditCardType").html(xCCType);
            $("#lblARINVDate").html(xCCDate);

            $("#lblCustPayCash").html(NewCCAmount);
            $("#lblCustPayBalanceLeft").html(NewCCAmount);

            $('input[type="image"]').attr("disabled", false);
            $('[id^=ARINVPayselect_]').attr('src', "images/check-off.png");/*Enable check box after cash/check value availed :: modified by Abinaya :: 03-05-2018*/
            $("#trCustPayCashDetails").show();

            $("#fgrdCustPayARINVDetails tr").removeClass("trSelectedHeader");
            $("#fgrdCustPayARINVDetails tr:first").addClass("trSelectedHeader");
            $("#DialogNewCreditCard").dialog("close");

        },
        Cancel: function () {
            $(this).dialog("close");
            $("#DivBtnPaymentDetails").show();
            $("#DivBtnPaymentExitDetails").hide();
        }
    },
    open: function () {
        //debugger;
        resetCreditCardInputControls();
        $("#DivBtnPaymentDetails").hide();
        $("#DivBtnPaymentExitDetails").show();

        $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
    },
    close: function () {
        //debugger;
        if ($("#DivCustPayARINVCheckCashDetails").is(':visible') == false) {
            clearCheckProcess();
        }
    },
});

function resetCreditCardInputControls() {
    $("#txtNewCCAmount").focus();
    $("#txtNewCCAmount").val("");
    $("#lstNewCCType").val(0);
    $("#txtNewCCApprovalCode").val("");
    $("#txtNewCCDate").datepicker("setDate", new Date())
    $("#txtNewCCBank").val("");
}

$("#lstNewCCType").change(function () {
    $("#txtNewCCApprovalCode").focus();
});

/*Grid loading for deposit header details from new Header table*/
$("#fgrdCreditCardHeader").flexigrid({
    url: 'BloomService.asmx/GetCreditCardHeaderList',
    dataType: 'xml',
    colModel: [
            { display: '', name: 'Delete', width: 15, sortable: false, align: 'center' },
            { display: 'Date', name: 'CreditCardDate', width: 40, sortable: true, align: 'left', process: CreditCardHeaderRowClick },
            { display: 'Type', name: 'CreditCardType', width: 90, sortable: true, align: 'left', process: CreditCardHeaderRowClick },
            { display: '$ Amount', name: 'TotalAmount', width: 100, sortable: true, align: 'right', process: CreditCardHeaderRowClick },
            { display: 'Bank', name: 'Bank', width: 25, sortable: true, align: 'right', process: CreditCardHeaderRowClick },
           // { display: '', name: '', width: 13, sortable: true, align: 'left' },
            { display: 'XL', name: '', width: 13, sortable: true, align: 'left' },
            { display: '', name: '', width: 13, sortable: true, align: 'left' },
           // { display: 'CreditCardLockContent', name: 'CreditCardLockContent', width: 15, sortable: true, align: 'left', hide: true },
    ],
    searchitems: [
             { display: 'Type', name: 'Type' },
             { display: 'Bank', name: 'Bank' },
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
    autoload: true,
    showTableToggleBtn: false,
    height: $(window).height() - 300,
    width: 400,//385,350
    striped: true,
    params: [
        { name: 'ExportCSV', value: '' },
        { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() },
        { name: 'ToDate', value: $("#txtPostPaymentstodate").val() },
        { name: 'IsActive', value: 1 },
    ],
    onSuccess: function () {

        var sel = jQuery("#fgrdCreditCardHeader tbody tr");
        var len = sel.length;
        if (len > 1) {
            $("#DivCreditCardHeader #ExportCSV").show();

            //debugger;
            if ($("#DivCCHeaderID").html() != "0" && $("#fgrdCreditCardHeader #row" + $("#DivCCHeaderID").html()).css('display') == "table-row") {
                var id = $("#DivCCHeaderID").html();
                $("#fgrdCreditCardHeader [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdCreditCardHeader td.unsorted").addClass("sorted");
                $("#fgrdCreditCardHeader td.sorted").removeClass("unsorted");
                $("#fgrdCreditCardHeader #row" + id).addClass("trSelectedHeader");
                $("#fgrdCreditCardHeader #row" + id).removeClass("trSelected");
                $("#fgrdCreditCardHeader #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdCreditCardHeader #row" + id + " td.unsorted").removeClass("sorted");

                $("#DivCreditCardDetailsByCustomer").show();
                /*Open mid pane when add the deposit*/
                if (IsCreditCardDetailByCustomerInitialize == false) {
                    LoadCreditCardDetailsByCustomer(id);
                    IsCreditCardDetailByCustomerInitialize = true;
                }
                else {
                    $("#fgrdCreditCardDetailsByCustomer").empty();
                    $("#fgrdCreditCardDetailsByCustomer").flexOptions({ params: [{ name: 'FilterQuery', value: id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                }
            }
        }

        //For TotalRows

        //$('#fgrdCreditCardHeader #row0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
        //$('#fgrdCreditCardHeader #row0 td:nth-child(4) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

        $('#fgrdCreditCardHeader #row0').addClass("TotalRows");
    },
    onError: function (xhr, status, errorThrown) {
        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
            window.location.href = "Login.aspx";
        }
    }
});

$("#DivCreditCardHeader .pcontrol input").css("width", "40px")
$("#DivCreditCardHeader .btnseparator:eq(0)").hide();
$("#DivCreditCardHeader .pSearch").hide();
//$("#DivCreditCardHeader .sDiv2").css("width", "290px");
$("#DivCreditCardHeader .qsbox").css("width", "100px")
$("#DivCreditCardHeader .pDiv2").css("width", "300px").css("margin-top", "3px");
$('#DivCreditCardHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
$("#DivCreditCardHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
$("#DivCreditCardHeader .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

//For Delete Credit card header details
$("[id^=deleteCreditCardHeader_]").die("click").live("click", function () {
    //
    var CurrentIDs = $(this)[0].id;
    var IsLocked = $('#fgrdDepositHeader #row' + CurrentIDs + ' td:nth-child(8) div').text()

    if (IsLocked.trim() != "") {
        $.MessageBox(IsLocked);
    }
    else {
        $("#DivCCHeaderID").html(CurrentIDs);
        $("#MsgCreditCardDelHtml").html("Are you sure to delete this credit card payment?");
        $("#MsgCreditCardDelWarning").dialog("open");
    }
});

//Confirmation message for deposit delete
$("#MsgCreditCardDelWarning").dialog({
    autoOpen: false,
    resizable: false,
    title: "Alert",
    modal: true,
    buttons: {
        Yes: function () {
            //debugger;
            var adialog = $(this);
            var CreditCardSplit = $("#DivCCHeaderID").html().split("_");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteCreditCardHeaderWithDetailsByID',
                data: '{"CardType":"' + CreditCardSplit[1] + '","Date":"' + CreditCardSplit[2] + '","Bank":"' + CreditCardSplit[3] + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    //debugger;
                    if (output.d != null && output.d == "valid") {
                        $("#MsgCreditCardDelWarning").dialog("close");
                        $("#fgrdCreditCardHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
                        $("#lstPostPayments").hide();
                        $("#DivDepositDetails").hide();
                        $("#DivCheckDetails").hide();
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

/*While row clicking on First pane, keep the it's detail and call the method for second panel loading*/
function CreditCardHeaderRowClick(celDiv, id) {
    $(celDiv).click(function () {
        if (id != 0) {
            //debugger;
            var FilterQuery = "";
            FilterQuery = id;
            ScopeHeaderID = id;
            $("#DivCreditCardDetailsByCustomer").show();
            $("#tdCChide1").show();
            $("#tdCChide2").hide();
            $("#DivCreditCardDetailsByInvoice").hide();
            if (IsCreditCardDetailByCustomerInitialize == false) {
                //if (id.toString() != $("#DivHeaderID").html()) {
                LoadCreditCardDetailsByCustomer(FilterQuery);
                IsCreditCardDetailByCustomerInitialize = true;
                //}
            }
            else {
                //$("#fgrdCreditCardDetailsByCustomer").empty();
                $("#fgrdCreditCardDetailsByCustomer").flexOptions({ params: [{ name: 'FilterQuery', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
            }

            $("#DivCCHeaderID").html(id.toString());

            $("#fgrdCreditCardHeader [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdCreditCardHeader #row" + id).addClass("trSelectedHeader");
            $("#fgrdCreditCardHeader td.unsorted").addClass("sorted");
            $("#fgrdCreditCardHeader td.sorted").removeClass("unsorted");
            $("#fgrdCreditCardHeader #row" + id).removeClass("trSelected");
            $("#fgrdCreditCardHeader #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdCreditCardHeader #row" + id + " td.unsorted").removeClass("sorted");
            $("#DivCCDetailID").html("");
        }
    });
}

/*Second panel loading data from f_arcard file*/
function LoadCreditCardDetailsByCustomer(FilterQuery) {
    //debugger;
    $("#fgrdCreditCardDetailsByCustomer").flexigrid({
        url: 'BloomService.asmx/GetCreditCardDetailsListByCustomer',
        dataType: 'xml',
        colModel: [
        { display: 'Customer', name: 'Customer', width: 50, sortable: true, align: 'left', process: CreditCardDetailsByCustomerRowClick },
        { display: 'Name', name: 'CustName', width: 200, sortable: true, align: 'left', process: CreditCardDetailsByCustomerRowClick },
        { display: 'Amount', name: 'TotalAmount', width: 100, sortable: true, align: 'right', process: CreditCardDetailsByCustomerRowClick },
        { display: 'Approval Code', name: 'ApprovalCode', width: 80, sortable: true, align: 'left', process: CreditCardDetailsByCustomerRowClick },
        ],
        showTableToggleBtn: true,
        sortname: "Customer",
        sortorder: "",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "Awb",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        colresize: false,
        autoload: true,
        showTableToggleBtn: false,
        rp: 30000,
        height: $(window).height() - 300,
        width: 500, //305,//1060
        striped: true,
        searchitems: [
             { display: 'Customer', name: 'Customer' },
             { display: 'Approval Code', name: 'Approval' },
        ],
        params: [
             { name: 'FilterQuery', value: FilterQuery },
             { name: 'ExportCSV', value: '' }
        ],
        onSuccess: function () {
            var sel = jQuery("#fgrdCreditCardDetailsByCustomer tbody tr");
            var len = sel.length;
            if (len > 1) {
                $("#DivCreditCardDetailsByCustomer #ExportCSV").show();


                //debugger;
                if ($("#DivCCDetailID").html() != "0" && $("#fgrdCreditCardDetailsByInvoice #row" + $("#DivCCHeaderID").html()).css('display') == "table-row") {
                    var id = $("#DivCCDetailID").html();
                    $("#fgrdCreditCardDetailsByInvoice [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCreditCardDetailsByInvoice td.unsorted").addClass("sorted");
                    $("#fgrdCreditCardDetailsByInvoice td.sorted").removeClass("unsorted");
                    $("#fgrdCreditCardDetailsByInvoice #row" + id).addClass("trSelectedHeader");
                    $("#fgrdCreditCardDetailsByInvoice #row" + id).removeClass("trSelected");
                    $("#fgrdCreditCardDetailsByInvoice #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdCreditCardDetailsByInvoice #row" + id + " td.unsorted").removeClass("sorted");

                    $("#DivCreditCardDetailsByInvoice").show();
                    /*Open mid pane when add the deposit*/
                    if (IsCreditCardDetailByCustomerInitialize == false) {
                        LoadCreditCardDetailsByInvoice(id);
                        IsCreditCardDetailByCustomerInitialize = true;
                    }
                    else {
                        $("#fgrdCreditCardDetailsByInvoice").empty();
                        $("#fgrdCreditCardDetailsByInvoice").flexOptions({ params: [{ name: 'FilterQuery', value: id }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                }

            }
            //For TotalRows
            //debugger;
            //$('#fgrdCreditCardDetailsByCustomer #row0 td:nth-child(1) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdCreditCardDetailsByCustomer #row0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

            $('#fgrdCreditCardDetailsByCustomer #row0').addClass("TotalRows");
        }
    });

    $("#DivCreditCardDetailsByCustomer .pcontrol input").css("width", "40px")
    $("#DivCreditCardDetailsByCustomer .btnseparator:eq(0)").hide();
    $("#DivCreditCardDetailsByCustomer .pSearch").hide();
    $("#DivCreditCardDetailsByCustomer .qsbox").css("width", "170px");
    $("#DivCreditCardDetailsByCustomer .pDiv2").css("width", "300px").css("margin-top", "3px");
    $('#DivCreditCardDetailsByCustomer .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivCreditCardDetailsByCustomer .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivCreditCardDetailsByCustomer .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
}

function CreditCardDetailsByCustomerRowClick(celDiv, id) {
    /*While row clicking on second pane, keep the it's detail and call the method for third panel loading*/
    $(celDiv).click(function () {
        //debugger;
        if (id != 0) {
            var FilterQuery = "";
            FilterQuery = id;
            ScopeDetailID = id;
            $("#DivCreditCardDetailsByInvoice").show();
            if (id.toString() != $("#DivCCDetailID").html()) {
                LoadCreditCardDetailsByInvoice(FilterQuery);
                IsCreditCardDetailsByInvoiceInitialize = true;
            }
            if (id.toString() != $("#DivCCDetailID").html()) {
                $("#fgrdCreditCardDetailsByInvoice").empty();
                $("#fgrdCreditCardDetailsByInvoice").flexOptions({ params: [{ name: 'FilterQuery', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
            }

            $("#DivCCDetailID").html(id.toString());

            $("#fgrdCreditCardDetailsByCustomer [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdCreditCardDetailsByCustomer #row" + id).addClass("trSelectedHeader");
            $("#fgrdCreditCardDetailsByCustomer td.unsorted").addClass("sorted");
            $("#fgrdCreditCardDetailsByCustomer td.sorted").removeClass("unsorted");
            $("#fgrdCreditCardDetailsByCustomer #row" + id).removeClass("trSelected");
            $("#fgrdCreditCardDetailsByCustomer #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdCreditCardDetailsByCustomer #row" + id + " td.unsorted").removeClass("sorted");
        }
    });
}

/*Third panel loading data from f_arcard file*/
function LoadCreditCardDetailsByInvoice(FilterQuery) {
    //debugger;
    $("#fgrdCreditCardDetailsByInvoice").flexigrid({
        url: 'BloomService.asmx/GetCreditCardDetailsListByInvoice',
        dataType: 'xml',
        colModel: [
        { display: '', name: 'Delete', width: 15, sortable: false, align: 'center' },
        { display: 'Invoice', name: 'Invoice', width: 60, sortable: true, align: 'left' },
        { display: 'InvDate', name: 'Date', width: 40, sortable: true, align: 'left' },
        { display: 'Amount', name: 'TotalAmount', width: 100, sortable: true, align: 'right' },
        ],
        showTableToggleBtn: true,
        sortname: "Invoice",
        sortorder: "",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "Awb",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        colresize: false,
        autoload: true,
        showTableToggleBtn: false,
        rp: 30000,
        height: $(window).height() - 324,
        width: 300, //305,//1060
        striped: true,
        searchitems: [
             { display: 'Invoice', name: 'Invoice' },
             { display: 'Invoice Date', name: 'Date' },
        ],
        params: [
             { name: 'FilterQuery', value: FilterQuery },
             { name: 'ExportCSV', value: '' }
        ],
        onSuccess: function () {
            var sel = jQuery("#fgrdCreditCardDetailsByInvoice tbody tr");
            var len = sel.length;
            if (len > 1)
                $("#DivCreditCardDetailsByInvoice #ExportCSV").show();

            //For TotalRows
            //debugger;
            //$('#fgrdCreditCardDetailsByInvoice #row0 td:nth-child(1) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdCreditCardDetailsByInvoice #row0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'red', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });

            $('#fgrdCreditCardDetailsByInvoice #row0').addClass("TotalRows");
        }
    });

    $("#DivCreditCardDetailsByInvoice .pcontrol input").css("width", "40px")
    $("#DivCreditCardDetailsByInvoice .pcontrol select").css("width", "70px")
    $("#DivCreditCardDetailsByInvoice .btnseparator:eq(0)").hide();
    $("#DivCreditCardDetailsByInvoice .pSearch").hide();
    $("#DivCreditCardDetailsByInvoice .sDiv2").css("width", "250px");
    $("#DivCreditCardDetailsByInvoice .qsbox").css("width", "85px");
    $("#DivCreditCardDetailsByInvoice .pDiv2").css("width", "300px").css("margin-top", "3px");
    $('#DivCreditCardDetailsByInvoice .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivCreditCardDetailsByInvoice .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivCreditCardDetailsByInvoice .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
}

$("#btnCustPayCCApply").die("click").live("click", function () {
    //debugger;
    $("#DialogNewCreditCard").dialog("open");
});


/*Add hyperlink for Balance column in ARINVS grid, click on the link pop-up with its transaction details in grid :: created by Abinaya :: 12Sep2018*/
$("[id^=aPaymentsBalance_]").die("click").live("click", function () {
    //debugger;
    var sourceCtl = $(this);
    var ID = sourceCtl.attr('id');
    var headers = ID.replace("aPaymentsBalance_", "");
    var IsARINVHistory = "0";
    var para = "Invoiceno=" + headers + '&IsARINVHistory=' + IsARINVHistory;

    //$("#fgrdARINVTransactions").empty();
    //$("#fgrdARINVTransactions").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: headers }], query: "", newp: 1 }).flexReload();
    //$("#DialogARINVTransactions").dialog('option', 'title', 'Invoice Transaction Details :: ' + headers);
    //$("#DialogARINVTransactions").dialog("open");
 
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageInvoiceTransactions.ascx","controlPara":"' + para + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            //debugger;
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




//For Delete Deposit details :: Insert values in negative...  :: by Abinaya :: 21Jan2019
$("[id^=imgDeleteDetails_]").die("click").live("click", function () {
    //debugger;
    var PaymentDetailIDs = $(this)[0].id.replace("imgDeleteDetails_", "");

    $("#DivCheckDetailID").html(PaymentDetailIDs);

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetIsDepositDelete',
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            debugger;
            if (output.d != "error" && output.d != "-1" && output.d != 'LogOut') {
                if (output.d.toLowerCase() == "valid") {
                    $("#MsgPaymentsDetailDelHtml").html("Are you sure to delete the Deposit details ?");
                    $("#MsgPaymentsDetailDelWarning").dialog("open");
                }
                else {
                    $.MessageBox("You are not authorised to delete this deposit..");
                }
            }
            else {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        },
        error: function () {
            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
        }
    });
});


//Confirmation message for deposit details delete :: by Abinaya :: 21Jan2019
$("#MsgPaymentsDetailDelWarning").dialog({
    autoOpen: false,
    resizable: false,
    title: "Alert",
    modal: true,
    buttons: {
        Yes: function () {
            debugger;
            var adialog = $(this);
            var PaymentDetailIDs = $("#DivCheckDetailID").html().split("_");
            var CheckDetailID = PaymentDetailIDs[0];
            var PaymentType = PaymentDetailIDs[1];

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeletePaymentsDetailByID',
                data: '{"DetailID":"' + CheckDetailID + '","PaymentType":"' + PaymentType + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if (output.d != null && output.d == "success") {
                        $("#MsgPaymentsDetailDelWarning").dialog("close");
                        //$("#fgrdDepositHeader").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'FromDate', value: $("#txtPostPaymentsfrmdate").val() }, { name: 'ToDate', value: $("#txtPostPaymentstodate").val() }, { name: 'IsActive', value: 1 }], query: "", newp: 1 }).flexReload();
                        //$("#lstPostPayments").hide();
                        //$("#DivDepositDetails").hide();
                        //$("#DivCheckDetails").hide();

                        //$("#fgrdCheckDetails").flexOptions({ params: [{ name: 'FilterQuery', value: $("#DivCheckDetailID").html() }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();

                        $("#fgrdDepositHeader").flexReload({ url: '/url/for/refresh' });
                        $("#fgrdDepositDetails").flexReload({ url: '/url/for/refresh' });
                        $("#fgrdCheckDetails").flexReload({ url: '/url/for/refresh' });
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

$("#BtnPaymentByIvoiceForCurrentOrders").die("click").live("click", function () {
    debugger;
    $("#DialogPayByInvoice").data("PayByInvoiceFrom", "PaymentByIvoiceForCurrentOrders").dialog("open");
});


/*PDF for Deposit row details*/
$("[id^=imgExportAllDepositPDFData_]").die("click").live("click", function () {
    $("#Pleasewait-msg").html("Please wait...  <img src='images/ajax-loader.gif' />");
    $("#Pleasewait-Dialog").dialog("open");
    var HeaderID = $(this)[0].id.replace("imgExportAllDepositPDFData_", "");
    var splitID = HeaderID.split("_");
    var Deposit, DepositDate, Bank;
    if (splitID.length = 4) {
        Deposit = splitID[1];
        DepositDate = splitID[2];
        Bank = splitID[3];
    }
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/ExportPDFDepositDetails',
        data: '{"Deposit":' + Deposit + ',"Date":"' + DepositDate + '","Bank":"' + Bank + '","FileFormat":".pdf"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            $("#Pleasewait-Dialog").dialog("close");
            if (output.d == null) {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
            else
                <%--window.location.href = "<%=ConfigurationManager.AppSettings("XmlPath")%>/ReportExports/" + output.d;--%>
                window.open("<%=ConfigurationManager.AppSettings("XmlPath")%>/ReportExports/" + output.d);

        },
        error: function () {
            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
        }
    });
});


/*Pop-up for ARINVS transaction details for the invoice */
//$("#DialogPaymentsTransactions").dialog({
//    autoOpen: false,
//    resizable: false,
//    width: 700,
//    height: $(window).height() - 130,
//    modal: true,
//    focus: function () {
//        $('#DialogPaymentsTransactions').closest('.ui-dialog').focus();
//    },
//    open: function () {
//        debugger;

//    },
//});

/*Load ARINVS transaction details grid for the invoice*/
//$("#fgrdPaymentsTransactions").flexigrid({
//    url: 'BloomService.asmx/GetARINVTransactionDetailsByInvoice',
//    dataType: 'xml',
//    colModel: [
//         { display: 'Type', name: 'Type', width: 65, sortable: true, align: 'left' },
//         { display: 'Date', name: 'Date', width: 60, sortable: true, align: 'center' },
//         { display: 'Amount', name: 'Amount', width: 100, sortable: true, align: 'right' },
//         { display: 'Check', name: 'Check', width: 60, sortable: true, align: 'right' },
//         { display: 'Deposit#', name: 'Deposit', width: 60, sortable: true, align: 'right' },
//         { display: 'Reason', name: 'Reason', width: 200, sortable: true, align: 'left' },
//         { display: '', name: '', width: 15, sortable: true, align: 'left' },
//    ],
//    searchitems: [
//        { display: 'Type', valuse: 'Type' },
//        //{ display: 'Name', valuse: 'CustName' },
//        //{ display: 'INV#', name: 'INV#' },
//        //{ display: 'Date', name: 'Date' },
//        //{ display: 'PO#', name: 'PO#' },
//        //{ display: 'AWB', name: 'AWB' },
//        //{ display: 'CA', name: 'Carrier' },
//        //{ display: 'Shipto', name: 'Shipto' },
//        //{ display: 'Wh', name: 'Wh' },
//        //{ display: 'Charges', name: 'Charges' },
//        //{ display: 'Payments', name: 'Payments' },
//        ////{ display: 'Credits', name: 'Credits' },
//        //{ display: 'Balance', name: 'Balance' },
//    ],
//    showTableToggleBtn: true,
//    sortname: "Type Asc",
//    sortorder: "",
//    usepager: true,
//    title: false,
//    useRp: true,
//    qtype: "",
//    rp: 30000,
//    nomsg: 'No records found!',
//    singleSelect: true,
//    showToggleBtn: false,
//    resizable: false,
//    autoload: false,
//    showTableToggleBtn: false,
//    height: $(window).height() - 300,
//    width: 660,
//    striped: true,

//    params: [
//        { name: 'ExportCSV', value: '' },
//        { name: 'Invoice', value: '0' }
//    ],
//    onSuccess: function () {
//        //$("#fgrdPaymentsTransactions tbody tr").click(function (event) {
//        //    debugger;
//        //    var id = $(this).attr('id').replace('row', '')

//        //    if (($(this).attr("id") != "row0")) {
//        //        $("#fgrdPaymentsTransactions").html(id.toString());
//        //        $("#fgrdPaymentsTransactions [id^=row]").removeClass("trSelectedHeader");
//        //        $("#fgrdPaymentsTransactions #row" + $("#DivCustPayARIVDetailID1").html()).addClass("trSelectedHeader");
//        //        $("#fgrdPaymentsTransactions td.unsorted").addClass("sorted");
//        //        $("#fgrdPaymentsTransactions td.sorted").removeClass("unsorted");
//        //        $("#fgrdPaymentsTransactions #row" + $("#DivCustPayARIVDetailID1").html()).removeClass("trSelected");
//        //        $("#fgrdPaymentsTransactions #row" + $("#DivCustPayARIVDetailID1").html() + " td.sorted").addClass("unsorted");
//        //        $("#fgrdPaymentsTransactions #row" + $("#DivCustPayARIVDetailID1").html() + " td.unsorted").removeClass("sorted");
//        //    }
//        //});

//        debugger;
//        var sel = jQuery("#fgrdPaymentsTransactions tbody tr");
//        var len = sel.length;
//        if (len >= 1) {
//            $("#DialogPaymentsTransactions #ExportCSV").show();
//        }
//    },
//    onError: function (xhr, status, errorThrown) {
//        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
//            window.location.href = "Login.aspx";
//        }
//    }
//});
//$("#DialogPaymentsTransactions .sDiv2 input[type='text']").css("width", "120px")
////$("#DialogPaymentsTransactions .sDiv").css('float', 'left').css('width', '150px');
//$('#DialogPaymentsTransactions .pDiv').css('padding', '2px').css('border-left', '0px');
//$('#DialogPaymentsTransactions .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
//$("#DialogPaymentsTransactions .pDiv").find(".pDiv2").find(".btnseparator").hide();
//$("#DialogPaymentsTransactions .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();


</script>
