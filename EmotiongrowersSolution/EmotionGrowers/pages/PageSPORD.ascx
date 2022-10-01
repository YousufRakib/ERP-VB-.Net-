<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageSPORD.ascx.vb" Inherits="pages_PageSPORD" %>
<style>
    div[data-placeholder]:not([data-placeholder=""]):empty::before {
        content: attr(data-placeholder);
    }

    .selectize-dropdown-content {
        height: 160px;
    }

    .searchplaceholder::-webkit-input-placeholder {
        color: #a9a9a9;
        opacity: 10;
    }

    ::-webkit-input-placeholder {
        color: white;
        opacity: 10;
        font-weight: 500;
    }

    ::-moz-placeholder {
        color: white;
        opacity: 10;
        font-weight: 500;
    }


    :-ms-input-placeholder {
        color: white;
        opacity: 10;
        font-weight: 500;
    }
    /* IE10+ */



    .selectize-input > input::-webkit-input-placeholder {
        color: #a9a9a9;
        opacity: 10;
    }

    .selectize-input > input::-moz-placeholder {
        color: #a9a9a9;
        opacity: 10;
        font-weight: 500;
    }

    .selectize-input > input:-ms-input-placeholder {
        color: #a9a9a9;
        opacity: 10;
        font-weight: 500;
    }
    /* IE10+ */

    #fsSold {
        height: 90px;
        max-height: 300px;
        float: left;
    }

    #fsCredit {
        height: 90px;
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

    /*#SPORDHoldDialog input[type="text"] {*/
    #SPORDHoldDialog .HoldStaticText {
        background-color: #A70000;
        border-color: #A70000;
        color: #00FFFF;
        border-radius: 0px;
        margin-top: -2px;
        font-size: 12.5px;
    }

        /*#SPORDHoldDialog input[type="text"]:focus {*/
        #SPORDHoldDialog .HoldStaticText:focus {
            background-color: #A70000;
            border-color: #A70000;
            color: #00FFFF;
        }


    .EditHeaderLabels {
        color: #FFFF34;
        font-size: 16px;
    }

    #SPORDPriceDialog input[type="text"], #SPORDPriceDialog textarea {
        background-color: #A70000;
        border-color: #A70000;
        color: #00FFFF;
        border-radius: 0px;
        margin-top: -2px;
        font-size: 14px;
    }

        #SPORDPriceDialog input[type="text"]:focus, #SPORDPriceDialog textarea:focus {
            background-color: #A70000;
            border-color: #A70000;
            color: #00FFFF;
        }

    #SPORDPriceDialog tr {
        height: 20px;
        padding: 5px;
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
        width: 260px;
    }

    #tdFarm .selectize-dropdown-content {
        min-width: 260px;
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
        min-height: 0px;
        max-height: 85px;
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

    .firstletterunderline::first-letter {
        text-decoration: underline;
    }

    input[type=date]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        display: none;
    }

    #tdOrderType .selectize-input {
        width: 212px;
    }

    #tdOrderType .selectize-dropdown-content {
        min-width: 212px;
        min-height: 0px;
        max-height: 105px;
    }

    .leftButtonDuplicate {
        margin-right: 72px !important;
    }

    .leftButtonSingleF8LogF7 {
        margin-right: 379px !important;
    }

    .ui-autocomplete {
        max-height: 180px;
        overflow-y: auto; /* prevent horizontal scrollbar */
        overflow-x: hidden; /* add padding to account for vertical scrollbar */
        /*z-index:200 !important;*/
    }

    .chosen-container .chosen-results {
        max-height: 50px;
    }
</style>


<table>
    <tr>
        <td>
            <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
            <div id="DivARINVSpord">
                <table id="fgrdARINVSpord" style="display: block; font-size: 11.5px;"></table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <td>
                        <button id="btnSPORDAdd" class="BloomButtonEnabled firstletterunderline" value="ADD" style="width: 60px;">ADD</button>
                    </td>
                    <td>
                        <button id="btnSPORDCopy" class="BloomButtonEnabled firstletterunderline" value="COPY" style="width: 60px;color: white;background:blueviolet;">COPY</button>
                    </td>
                    <td>
                        <button id="btnSPORDStanding" class="BloomButtonEnabled firstletterunderline" value="Standing" style="width: 70px;color: white;background:darkturquoise;">Standing</button>
                    </td>
                    <td>
                        <button id="btnSPORDPrebooks" class="BloomButtonEnabled firstletterunderline" value="Prebooks" style="width: 70px;color: white;background:greenyellow;">Prebooks</button>
                    </td>
                    <td>
                        <%-- <button id="btnSPORDEorders" class="BloomButtonEnabled firstletterunderline" value="E-Orders" style="width: 70px;">E-Orders</button>--%>
                        <button id="btnSPORDBiWeek" class="BloomButtonEnabled firstletterunderline" value="By-Weekly" style="width: 77px;color: white;background:gold;">By-Weekly</button>
                    </td>
                    <td>
                        <button id="btnSPORDSeasonal" class="BloomButtonEnabled" value="Seasonal" style="width: 70px;">S<span style="text-decoration: underline;">e</span>asonal</button>
                    </td>
                    <td>
                        <button id="btnSPORDDoubles" class="BloomButtonEnabled firstletterunderline" value="Doubles" style="width: 70px;">Doubles</button>
                    </td>
                    <td>
                        <button id="btnSPORDPrices" class="BloomButtonEnabled" value="Prices" style="width: 90px;background: fuchsia;">Price List</button>
                    </td>
                    <td>
                        <button id="btnSPORDInvoice" class="BloomButtonEnabled firstletterunderline" value="Invoice" style="width: 70px;background:chocolate;">Invoice</button>
                    </td>
                    <td>
                        <button id="btnSPORDSummary" class="BloomButtonEnabled" value="Summary" style="width: 70px;">S<span style="text-decoration: underline;">u</span>mmary</button>
                    </td>
                    <td>
                        <button id="btnSPORDConfirmation" class="BloomButtonEnabled" value="Confirmation" style="width: 90px;">C<span style="text-decoration: underline;">o</span>nfirmation</button>
                    </td>
                    <td>
                        <button id="btnSPORDALLorders" class="BloomButtonEnabled" value="ALL" style="width: 70px;">A<span style="text-decoration: underline;">L</span>L</button>
                    </td>
                    <td>
                        <button id="btnSPORDMove" class="BloomButtonEnabled" value="MOVE" style="width: 60px; display: none;"></button>
                    </td>
                    <td>
                        <input id="btnSPORDTrans" type="button" class="BloomButtonEnabled" title="Transaction History Log" value="History" style="width: 80px; display: none;background:dodgerblue;">
                    </td>
                    <td></td>
                </tr>
            </table>
            <%--<input type="button" id="btnSPORDHold" class="BloomButtonEnabled" value="HOLD" style="margin-top: 5px; width: 60px;">--%>
        </td>
    </tr>
</table>

<div id="SPORDHoldDialog" style="display: none; background-color: black;">

    <table>
        <%--<tr>
            <td class="HoldHeaderLabels">Farm</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldFarm" style="width: 30px;" readonly>
            </td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Flower</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldFlower" style="width: 145px;" readonly>
            </td>
            <td colspan="2"></td>
        </tr>--%>
        <tr>
            <td class="HoldHeaderLabels">Boxes</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldBoxes" style="width: 40px; text-align: right; margin-right: 10px;" readonly="readonly">
                <input type="text" class="HoldStaticText" id="txtSPORDHoldUOM" style="width: 20px;" readonly="readonly">
            </td>
            <td style="padding-left: 10px;">
                <label class="HoldHeaderLabels">Units/Box</label>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldUnits" style="width: 50px; text-align: right;" readonly="readonly">
            </td>
            <td>
                <label class="HoldHeaderLabels" style="padding-right: 13px;">/Bunch</label>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldBunch" style="width: 50px; text-align: right;" readonly="readonly">
            </td>
            <%--<td>
                <label class="HoldHeaderLabels">Sold As</label>
                <input type="text" class="HoldStaticText AllUpperCaseTextBox" id="txtSPORDHoldSoldAs" style="width: 50px; text-align: right;" readonly="readonly" maxlength="2">
            </td>--%>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Fob</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldFOB" style="width: 78px; text-align: right;" readonly="readonly">
            </td>
            <td colspan="2" style="padding-left: 10px;">
                <label class="HoldHeaderLabels">Fuel Included?</label>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldFuelIncl" style="width: 11px;" readonly="readonly">
            </td>
        </tr>
        <%--<tr>
            <td>Price</td>
            <td>
                <input type="text" id="txtSPORDHoldPrice" />
            </td>
            <td>Packing</td>
            <td>
                <input type="text" id="txtSPORDHoldPacking" />
            </td>
        </tr>--%>
        <tr>
            <td class="HoldHeaderLabels">Type</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldType" style="width: 15px;" readonly="readonly">
            </td>
            <td style="padding-left: 10px;">
                <label class="HoldHeaderLabels">Status</label>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldStatus" style="width: 20px;" readonly="readonly">
            </td>
            <td>
                <label class="HoldHeaderLabels">Order#</label>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldOrder" style="width: 70px; text-align: right;" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Shipping date to customer</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldShipDate" style="width: 75px; text-align: right;" readonly="readonly">
            </td>
            <td colspan="2" style="padding-left: 10px;">
                <label class="HoldHeaderLabels">End Date</label>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldEndDate" style="width: 75px; text-align: right;" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Shipping date from grower</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldShipbogota" style="width: 75px; text-align: right;" readonly="readonly">
            </td>
            <td colspan="2" style="padding-left: 10px;">
                <label class="HoldHeaderLabels">End Date</label>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldEndShipbog" style="width: 75px; text-align: right;" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Customer P/O #</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldPO" style="width: 120px;" readonly="readonly">
            </td>
            <td class="HoldHeaderLabels" style="padding-left: 10px;">Customer Box Code</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldBoxCode" style="width: 120px;" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Cost</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDCost" style="width: 70px; text-align: right;" readonly="readonly">
            </td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Carrier Code</td>
            <td>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldCarrier" style="width: 20px;" readonly="readonly">
            </td>
            <td colspan="2" style="padding-left: 10px;">
                <label class="HoldHeaderLabels">Shipto</label>
                <input type="text" class="HoldStaticText" id="txtSPORDHoldShipto" style="width: 60px; text-align: right;" readonly="readonly">
            </td>
        </tr>
        <tr style="height: 20px;">
            <td colspan="4"></td>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Boxes to Hold</td>
            <td>
                <input type="text" class="HoldDynamicText" id="txtSPORDHoldBoxesHold" style="width: 60px; text-align: right;">
            </td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Shipping date to customer</td>
            <td>
                <input type="text" class="HoldDynamicText" id="txtSPORDHoldFrom" style="width: 75px; text-align: right;">
            </td>
            <td colspan="2" style="padding-left: 10px;">
                <label class="HoldHeaderLabels">End Date</label>
                <input type="text" class="HoldDynamicText" id="txtSPORDHoldTo" style="width: 75px; text-align: right;">
            </td>
        </tr>
        <tr>
            <td class="HoldHeaderLabels">Cargo Dates</td>
            <td>
                <input type="text" class="HoldDynamicText" id="txtSPORDHoldCargof" style="width: 75px; text-align: right">
            </td>
            <td colspan="2" style="padding-left: 10px;">
                <label class="HoldHeaderLabels">End Date</label>
                <input type="text" class="HoldDynamicText" id="txtSPORDHoldCargot" style="width: 75px; text-align: right;">
            </td>
        </tr>
    </table>
</div>

<div id="SPORDAddEditDialog" style="display: none; background-color: black;">
    <table>
        <%--<tr style="height: 40px">
            <td colspan="4">
                <div class="Warning" align="center">
                    OOPS! Unable to process your request. Please contact admin!
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>--%>

        <tr>
            <td colspan="4">
                <table>
                    <tr>
                        <td>

                            <label class="EditHeaderLabels" style="margin-right: 59px;">Farm</label>
                        </td>
                        <td id="tdFarm">
                            <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
                            <%--<input type="text" id="txtSPORDEditFarm" style="width: 40px;">--%>
                            <select id="lstSPORDEditFarm" style="width: auto;" />
                            <input type="hidden" id="hfSPORDEditFarm" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 20px;">Flower</label>
                        </td>
                        <td id="tdFlower">
                            <%--<input type="text" id="txtSPORDEditFlower" style="width: 90px;">--%>
                            <%--<select placeholder='Choose Flower...' id="lstSPORDEditFlower" style="width: auto;" value="" />--%>
                            <table>
                                <tr>
                                    <td>
                                        <input type="hidden" id="hfSPORDEditFlower" />
                                        <input type="hidden" id="hfSPORDEditFlowerName" />
                                        <input type="text" style="width: 427px; margin-left: -1px;" id="txtSPORDFlower" class="AllUpperCaseTextBox" />
                                        <input type="hidden" id="hfSPORDFlower" />
                                    </td>
                                    <%--<td>
                                        <label class="EditHeaderLabels" style="margin-left: 50px;">Search By :: </label>
                                    </td>
                                    <td>
                                        <input type="checkbox" id="chkByFlowerCodeDesc" />
                                    </td>--%>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px;">Breakdown</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDEditBreakdown" style="width: 687px;" class="AllUpperCaseTextBox">
                            <input type="hidden" id="hfSPORDEditBreakdown" style="width: 687px;" class="AllUpperCaseTextBox">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 70px;">Qty</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDEditQty" class="NumbersOnly" style="width: 80px; text-align: right; margin-right: 10px; margin-top: -1px;">
                            <%--<input type="text" id="txtSPORDEditUOM" style="width: 20px;">--%>
                            <select id="lstSPORDEditUOM" style="width: 160px; height: 23px"></select>
                            <input type="hidden" id="hfSPORDEditUOM" />

                            <label class="EditHeaderLabels" style="margin-left: 10px; margin-right: 10px;">Units/Box</label>
                            <input type="text" id="txtSPORDEditUnits" class="NumbersOnly" style="width: 50px; text-align: right;">

                            <label class="EditHeaderLabels" style="margin-left: 5px; margin-right: 5px;">/Bunch</label>
                            <input type="text" id="txtSPORDEditBunch" class="NumbersOnly" style="width: 30px; text-align: right;">

                            <label class="EditHeaderLabels" style="margin-left: 5px; margin-right: 5px;">Sold As</label>
                            <input type="text" id="txtSPORDEditSoldAs" class="AllUpperCaseTextBox" style="width: 20px; text-align: right;" maxlength="2">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 7px;">Fob Price</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDEditFOB" class="DecimalsOnly" style="width: 118px; text-align: right;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="margin-top: -3px;">
                    <tr>
                        <td class="EditHeaderLabels" style="padding-right: 62px;">Type</td>
                        <td id="tdOrderType">
                            <div style="margin-top: 1px;">
                                <select placeholder='Choose Type...' id="lstSPORDEditOrderType" style="width: auto;" value="" data-size="3" />
                                <input type="hidden" id="hfSPORDEditOrderType" />
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <label id="lblSpordStatus" class="EditHeaderLabels HideForSalesPeople" style="margin-left: 73px;">Status</label>
            </td>
            <td style="width: 170px;" id="tdStatus" class="HideForSalesPeople">
                <%--<input type="text" id="txtSPORDEditStatus" style="width: 20px;">--%>
                <select placeholder='Choose Status...' id="lstSPORDEditStatus" style="width: auto;" value="" />
                <input type="hidden" id="hfSPORDEditStatus" />
            </td>
            <td>
                <label class="EditHeaderLabels" style="margin-right: 4px; margin-left: 6px;">Order#</label>
                <input type="text" id="txtSPORDEditOrder" class="NumbersOnly" style="width: 70px; text-align: right;">
            </td>
        </tr>
        <tr>
            <td class="EditHeaderLabels">Shipping date to customer</td>
            <td>
                <input type="text" id="txtSPORDEditShipDate" style="width: 85px; text-align: right; margin-left: -93px; padding-right: 3px; margin-bottom: 1px; margin-top: -1px;">
                <input type="hidden" id="hfSPORDEditShipDate">
                <label id="ShipDateDay" class="EditHeaderLabels"></label>
            </td>
            <td id="tdEndShipDate" colspan="2" style="margin-left: -54px">
                <label class="EditHeaderLabels" style="margin-right: 10px;">End Date</label>
                <input type="text" id="txtSPORDEditEndDate" style="width: 85px; text-align: right; padding-right: 3px; margin-left: 74px; margin-top: 0px;">
            </td>
        </tr>
        <tr>
            <td class="EditHeaderLabels">Cargo date from grower</td>
            <td>
                <input type="text" id="txtSPORDEditShipbogota" style="width: 85px; text-align: right; margin-left: -93px; padding-right: 3px; margin-bottom: 1px; margin-top: -2px;">
                <label id="CargoDateDay" class="EditHeaderLabels"></label>
            </td>
            <td id="tdDiffDays" colspan="2" style="margin-left: -54px">
                <label id="DiffDays" class="EditHeaderLabels"></label>
            </td>
            <td id="tdEndCargoDate" colspan="2" style="margin-left: -54px">
                <label class="EditHeaderLabels" style="margin-right: 10px;">End Date</label>
                <input type="text" id="txtSPORDEditEndShipbog" style="width: 85px; text-align: right; padding-right: 3px; margin-bottom: 1px; margin-left: 74px; margin-top: -1px;">
            </td>
        </tr>
        <tr>
            <td class="EditHeaderLabels">Customer P/O #</td>
            <td>
                <input type="text" id="txtSPORDEditPO" style="width: 120px; margin-left: -93px; margin-bottom: 1px; margin-top: -3px;" class="AllUpperCaseTextBox">
            </td>
            <td colspan="2">
                <label class="EditHeaderLabels" style="margin-left: -54px; margin-right: 10px;">Customer Box Code</label>
                <input type="text" id="txtSPORDEditBoxCode" style="width: 237px; margin-left: -11px;" class="AllUpperCaseTextBox">
            </td>
        </tr>
        <tr>
            <td class="EditHeaderLabels">
                <label class="HideForSalesPeople">Cost</label>
            </td>
            <td>
                <input type="text" class="DecimalsOnly HideForSalesPeople" id="txtSPORDEditCost" style="width: 121px; text-align: right; margin-left: -93px; margin-bottom: 1px;">
            </td>
            <td colspan="2">
                <label class="EditHeaderLabels" style="margin-left: -54px; margin-right: 10px;">Farm PO#</label>
                <label class="EditHeaderLabels" id="txtSPORDEditFarmPO" style="width: 103px;"></label>

                <label id="txtSPORDEditID" class="EditHeaderLabels" style="width: 120px; color: #FFFF34;">(ID)</label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table style="margin-top: -3px;">
                    <tr>
                        <td <%--style="width:236px;"--%>>
                            <label class="EditHeaderLabels" style="margin-right: 120px;">Carrier Code</label>
                        </td>
                        <td <%--style="width:135px;"--%> id="tdCarrier">
                            <%--<input type="text" id="txtSPORDEditCarrier" style="width: 20px;">--%>
                            <select placeholder='Choose Carrier...' id="lstSPORDEditCarrier" value="" />
                            <input type="hidden" id="hfSPORDEditCarrier" />
                        </td>
                        <%--<td>
                            <select placeholder='Choose Carrier...' id="lstSPORDEditCarrier2" value="" />
                            <input type="hidden" id="hfSPORDEditCarrier2" />
                        </td>--%>
                        <td class="ShipToSection" <%--style="width:85px"--%>>
                            <label class="EditHeaderLabels" style="margin-left: 11px; margin-right: 7px;">Shipto</label>
                        </td>
                        <td class="ShipToSection" <%--style="width:80px"--%> id="tdShipto">
                            <%--<input type="text" id="txtSPORDEditShipto" style="width: 60px; text-align: right;">--%>

                            <input type="hidden" id="hfSPORDEditShipto" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table style="margin-top: -3px;">
                    <tr>
                        <td <%--style="width:236px;"--%>>
                            <label class="EditHeaderLabels" style="margin-right: 103px;">Carrier Agency</label>
                        </td>
                        <td <%--style="width:135px;"--%> id="tdCargoAgency">
                            <select placeholder='Choose Agency...' id="lstSPORDEditCargoAgency" value="" />
                            <input type="hidden" id="hfSPORDEditCargoAgency" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="EditHeaderLabels">Comments to grower</td>
            <td colspan="3">
                <textarea rows="2" style="width: 568px; height: 43px; margin-left: -93px; margin-top: -2px; margin-bottom: 1px;" maxlength="200" cols="5" id="txtSPORDEditCommentsG" autocorrect="off" spellcheck="false" class="AllUpperCaseTextBox"></textarea>
                <%--<input type="text" id="txtSPORDEditCommentsG" style="width: 555px;" />--%>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <label class="EditHeaderLabels" style="margin-right: 10px;">Comments</label>
                <input type="text" id="txtSPORDEditComments" style="margin: -2px 0px 0px; width: 694px; height: 19px; margin-bottom: 1px;" class="AllUpperCaseTextBox" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <label class="EditHeaderLabels" style="margin-right: 64px;">UPC</label>
                <input type="text" id="txtSPORDEditUPC" style="width: 160px; margin-bottom: 1px;" maxlength="15" class="AllUpperCaseTextBox">
                <label class="EditHeaderLabels" style="margin-left: 15px;">Upc Format</label>
                <label id="lblSPORDEditUPCFormat"></label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <label class="EditHeaderLabels" style="margin-right: 19px">DateCode</label>
                <input type="text" id="txtSPORDEditDateCode" style="width: 115px; margin-bottom: 1px;" maxlength="15" class="AllUpperCaseTextBox">
                <label class="EditHeaderLabels" style="margin-left: 10px; margin-right: 10px;">Price</label>
                <input type="text" id="txtSPORDEditUPCPrice" style="width: 120px; margin-bottom: 1px;" maxlength="15" class="AllUpperCaseTextBox">
                <label class="EditHeaderLabels" style="margin-left: 5px; margin-right: 5px;">Desc</label>
                <input type="text" id="txtSPORDEditUPCDesc" style="width: 322px; margin-bottom: 1px;" class="AllUpperCaseTextBox">
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <label class="EditHeaderLabels">Sleeve</label>
                <input type="text" id="txtSPORDEditSleeve" style="width: 21px;" maxlength="1" class="AllUpperCaseTextBox">
                <label class="EditHeaderLabels" style="margin-left: 10px; margin-right: 10px;">Desc</label>
                <input type="text" id="txtSPORDEditSleeveDesc" style="width: 390px;" class="AllUpperCaseTextBox">
            </td>
        </tr>
        <tr>
            <td colspan="4" style="padding-top: 2px;">
                <label class="EditHeaderLabels" style="margin-right: 15px;">Food</label>
                <input type="text" id="txtSPORDEditFood" style="width: 21px; margin-bottom: 1px;" maxlength="1" class="AllUpperCaseTextBox">
                <label class="EditHeaderLabels" style="margin-left: 10px; margin-right: 10px;">Desc</label>
                <input type="text" id="txtSPORDEditFoodDesc" style="width: 390px;" class="AllUpperCaseTextBox">
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table>
                    <tr>
                        <td style="padding-top: 0px;">
                            <label class="EditHeaderLabels" style="margin-right: 22px;">Pick</label>
                            <input type="text" id="txtSPORDEditPick" style="width: 21px; margin-left: -2px; margin-bottom: 1px;" maxlength="1" class="AllUpperCaseTextBox">
                        </td>
                        <td style="padding-top: 0px;">
                            <label class="EditHeaderLabels" style="margin-left: 10px; margin-right: 11px;">Desc</label>
                            <input type="text" id="txtSPORDEditPickDesc" style="width: 390px; margin-bottom: 1px;" class="AllUpperCaseTextBox">
                        </td>
                        <td style="padding-top: 0px;">
                            <label class="EditHeaderLabels" style="margin-left: 5px; margin-right: 5px;">Warehouse</label>
                        </td>
                        <td style="padding-top: 0px;" id="tdWH">
                            <select placeholder='Choose WH...' id="lstSPORDEditWH" style="width: 151px;" />
                            <input type="hidden" id="hfSPORDEditWH" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>

<div id="msgbox-SPORD" style="display: none;" title="Alert">
    <p id="msgSPORDhtml"></p>
</div>

<div id="DivSelectedSPORDID" style="display: none"></div>
<div id="DivSelectedSPORDSqlID" style="display: none"></div>

<div id="OrderNewYN" style="display: none"></div>
<div id="msgbox-SPORDDel" style="display: none;" title="Alert">
    <p id="msgSPORDDelhtml"></p>
</div>

<div id="msgbox-SPORDCopyTo" style="display: none;" title="Alert">
    <div style="margin-top: 24px;">
        Please enter customer # to copy it to
        <input type="text" id="txtSPORDCopyToCustomer" style="width: 100px;">
    </div>
</div>

<div id="msgbox-SPORDMoveTo" style="display: none;" title="Alert">
    <div style="margin-top: 24px;">
        Please enter customer # to move it to
        <input type="text" id="txtSPORDMoveToCustomer" style="width: 100px;">
    </div>
</div>

<div id="DivCurrentCustomer_SPORD" runat="server" style="display: none"></div>


<div id="msgbox-SPORDControlsLoading" style="display: none;">
    <p id="msghtml-SPORDControlsLoading" style="font-size: 12.5px; font-weight: bold;"></p>
</div>

<div id="LoggedInUserType_PageSPORD" runat="server" style="display: none"></div>
<div id="LoggedInUserIsAdmin_PageSPORD" runat="server" style="display: none"></div>

<div id="DivViewSPORDByPriceDialog" style="display: none;">
    <table>
        <tr>
            <td>
                <div id="divViewSPORDByPrice" style="float: left">
                    <table id="fgrdViewSPORDByPrice" style="display: block;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td id="tdSPORDPriceAdd" style="visibility: hidden">
                <button id="btnSPORDPriceAdd" class="BloomButtonEnabled firstletterunderline" value="PriceAdd" style="width: 70px; visibility: hidden">Add</button>
                <button id="btnSPORDClose" class="BloomButtonEnabled firstletterunderline" value="Close" style="width: 70px; visibility: hidden;float:right;background: red;">Close</button>
                <button id="btnSPORDBuild" class="BloomButtonEnabled firstletterunderline" value="Build" style="width: 70px; visibility: hidden;float:right;">Build</button>
                
            </td>
        </tr>
    </table>
</div>
<div id="SPORDPriceDialog" style="display: none; background-color: black;">
    <table>
        <tr>
            <td colspan="4">
                <table>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px; visibility: hidden;">Customer</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceCust" style="width: 120px; margin-bottom: 2px; visibility: hidden;" class="AllUpperCaseTextBox" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Flower</label>
                        </td>
                        <td>
                            <input type="hidden" id="hfSPORDPriceFlowerID" />
                            <input type="hidden" id="hfSPORDPriceFlower" />
                            <input type="hidden" id="hfSPORDPriceFlowerName" />
                            <input type="text" id="txtSPORDPriceFlower" style="width: 347px; margin-bottom: 2px;" class="AllUpperCaseTextBox">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 5px; margin-bottom: 2px;">QTY</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceQTY" class="NumbersOnly" style="width: 80px; text-align: right; margin-bottom: 2px;">
                            <select id="lstSPORDPriceUOM" style="width: 65px; height: 23px; margin-bottom: 2px;"></select>
                            <input type="hidden" id="hfSPORDPriceUOM" />

                            <label class="EditHeaderLabels" style="margin-left: 10px; margin-right: 10px; margin-bottom: 2px;">Units</label>
                            <input type="text" id="txtSPORDPriceUnits" class="NumbersOnly" style="width: 80px; text-align: right; margin-bottom: 2px;">

                            <label class="EditHeaderLabels" style="margin-left: 10px; margin-right: 10px; margin-bottom: 2px;">Units/Bunch</label>
                            <input type="text" id="txtSPORDPriceUnitsBunch" class="NumbersOnly" style="width: 80px; text-align: right; margin-bottom: 2px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">PRICE</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPrice_Price" class="DecimalsOnly" style="width: 100px; text-align: right; margin-bottom: 2px;">
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Soldas</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceSoldas" style="width: 21px; margin-bottom: 2px;" class="AllUpperCaseTextBox" maxlength="2">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">UPC</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceUPC" style="width: 175px; margin-bottom: 2px;" maxlength="12" class="AllUpperCaseTextBox">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">BOXCODE</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceBoxCode" style="width: 175px; margin-bottom: 2px;" maxlength="15" class="AllUpperCaseTextBox">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">GTIN</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceGTIN" style="width: 347px; margin-bottom: 2px;" maxlength="25" class="AllUpperCaseTextBox">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="msgbox-SPORDPRICEDel" style="display: none;" title="Alert">
    <p id="SPORDPRICEDel"></p>
</div>
<div id="DivSelectedSPORDPriceID" style="display: none"></div>
<div id="ScheduleForShippingDialog" style="display: none;">
    <fieldset id="fsScheduleForShipping" style="font-size: 18px; font-weight: bold; height: 37px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtF8ShippingDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblF8ShippingDate">Shipping Date </label>
                </td>
                <td>
                    <input id="txtF8ShippingDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<div id="DivSummaryAndConfirmationDialog" style="display: none;">
    <fieldset id="fsSummaryAndConfirmation" style="font-size: 18px; font-weight: bold; height: 68px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtSumConfirmFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblSumConfirmFromDate">From </label>
                </td>
                <td>
                    <input id="txtSumConfirmFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr id="trSumconfirmToDatelbl">
                <td colspan="2" id="tdSumconfirmToDatelblhdn">
                    <input type="text" id="txtSumConfirmToDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;" id="trSumconfirmToDatetxt">
                <td style="padding-right: 10px;" id="tdSumconfirmToDatelbl">
                    <label id="lblSumConfirmToDate">To </label>
                </td>
                <td id="tdSumconfirmToDatetxt">
                    <input id="txtSumConfirmToDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<div id="msgbox-SpordValidateCargoDate" style="display: none;" title="Alert">
    <p id="msgSPORDCargoDatehtml"></p>
</div>
<div id="PoqHistoryDialog" style="display: none;" title="Alert">
    <table id="poqHistoryTable"></table>
</div>
<div id="DivOrderNewPricingDetails" style="display: none">
    <table style="width: 100%">
        <tr>
            <td>
                <table id="fgrdOrderNewPricingDetails" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>
<input type="hidden" id="hdnPageSPORDSelectedFlowerId" />
<div id="AddOrderDetailFromFutureDialog_SPORD">
    <table style="width: 100%;">
        <tr style="height: 25px">
            <td colspan="4">
                <div class="Warning" id="Futurewarning" align="center">
                    Not enough on inventory
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr style="height: 35px;">
            <td style="width: 20%">PRODUCT</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl" id="txtFlower_FutureOrderDetail_SPORD" style="width: 350px;" />
                <input type="hidden" id="hfFlower_FutureOrderDetail_SPORD" />
                <input type="hidden" id="hfFlowerName_FutureOrderDetail_SPORD" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>FARM</td>
            <td>
                <select id="lstFarm_FutureOrderDetail_SPORD" class="enterKeyPressControl" style="width: auto;">
                </select>
                <input type="hidden" id="hfFarm_FutureOrderDetail_SPORD" />
            </td>
            <td colspan="2">&nbsp;
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>BOXES</td>
            <td>
                <input type="text" class="ClsNumbersOnly enterKeyPressControl" id="txtQty_FutureOrderDetail_SPORD" style="width: 50px;" />
                <select id="lstUOM_FutureOrderDetail_SPORD" class="enterKeyPressControl" style="width: 100px; height: 23px">
                </select>
                <input type="hidden" id="hfUOM_FutureOrderDetail_SPORD" />
                <label style="margin-left: 20px">UNITS/BOX</label>
                <input type="text" class="ClsNumbersOnly enterKeyPressControl" id="txtUnitsPerBox_FutureOrderDetail_SPORD" style="width: 50px;" />
            </td>
            <td colspan="2">&nbsp;                  
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>PRICE</td>
            <td colspan="3">
                <input type="text" class="ClsDecimalsOnly enterKeyPressControl" id="txtPrice_FutureOrderDetail_SPORD" style="width: 65px;" />
                <label style="margin-left: 20px">COST</label>
                <input type="text" class="ClsDecimalsOnly enterKeyPressControl" id="txtCost_FutureOrderDetail_SPORD" style="width: 65px;" />
                <label style="margin-left: 20px">GPM%</label>
                <input type="text" class="ClsDecimalsOnly " id="txtGPM_FutureOrderDetail_SPORD" style="width: 65px;" disabled />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>BOX CODE</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl" id="txtBoxCode_FutureOrderDetail_SPORD" style="width: 65px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>UPC</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl" id="txtUPC_FutureOrderDetail_SPORD" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>UPC PRICE</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl" id="txtUPCPRICE_FutureOrderDetail_SPORD" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>DATE CODE</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl" id="txtDateCode_FutureOrderDetail_SPORD" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>NOTES</td>
            <td colspan="3">
                <textarea id="txtNotes_FutureOrderDetail_SPORD" class="enterKeyPressControl" style="width: 360px;" rows="5" cols="40" />
            </td>
        </tr>
        <tr id="trPODetail" style="display: none; width: 100%">
            <td colspan="4">
                <table style="width: 100%;">
                    <tr style="height: 25px">
                        <td style="width: 50%;">
                            <label>Dflower PO</label>
                            <label style="color: red;" id="lblPODflower_FutureOrder"></label>
                        </td>
                        <td>
                            <label>Ship Date</label>
                            <label style="color: red;" id="lblShipdate_FutureOrder"></label>
                        </td>
                    </tr>
                    <tr style="height: 25px;">
                        <td>&nbsp;</td>
                    </tr>
                    <tr style="height: 25px; display: none;">
                        <td>
                            <label>BoxNum</label>
                            <label style="color: red;" id="lblPOBoxnum_FutureOrder"></label>
                        </td>
                        <td style="width: 50%;">
                            <label>PO Date</label>
                            <label style="color: red;" id="lblPODate_FutureOrder"></label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label style="color: red;" id="lblProductPurchaseWarningMsg">**This Product has been purchased already.. You can only change the Price</label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    //Region Global declarations
    var SpordSqlID = "0";
    var isDuplicateSPORD = false, loadingdropdownonSPORDCompleted = false, IsShipToDropDownAlreadyLoadedByCustomer = false,
        IsGridLoadingAtFirst = false, IsAddEditShortcutKeyClick = false, IsEmployeeFirstOrder = false, isSPORDeditclicked = false,
        isSPORDPriceeditclicked = false, setisOnlyMeF8 = false, SpordStatusEdit = false, FullSpordEdit = false,
        isPricelstExistForCust = false, isPriceClicked = false, isSummaryList = true, isDateValidatedForF8Save = false;
    var EmployeeOrderNo = "", SelectedType = "", SpordDetailAddTime = "", SpordDetailSend = "";
    var UOMList = [], F8PriceIds = [];
    var isF8SingleTrans = false, isFromSingleF8 = false, F8SqlId = "0";
    let originalValues = {};
    //End Region Global declarations

    $(document).ready(new function () {
        debugger;

        $.mask.definitions['9'] = "[0-9]";
        $.mask.definitions['#'] = "[0-9]";
        if ($("#ctl00_LoggedInUserType_PageSPORD").html() == "sales person") {
            $(".HideForSalesPeople").hide();
        }


        if ($("#ctl00_LoggedInUserType_PageSPORD").html().toLowerCase() == "employee" && isSPORDeditclicked == false) { //Employee usertype and add clicked
            if (IsEmployeeFirstOrder == false) { /*First order for Employee usertype :: empty the Order field */
                $("#txtSPORDEditOrder").val("");
                $("#txtSPORDEditOrder").attr("placeholder", "");
                EmployeeOrderNo = "";
            }
            else {
                $("#txtSPORDEditOrder").val(EmployeeOrderNo);
                $("#txtSPORDEditOrder").attr("placeholder", EmployeeOrderNo);
            }
        }

        //if ($("#ctl00_LoggedInUserType_PageSPORD").html().toLowerCase() == "employee") {
        //    if (IsEmployeeFirstOrder == false) {
        //        IsEmployeeFirstOrder = true;
        //    }
        //}

        if ($("#ctl00_LoggedInUserIsAdmin_PageSPORD").html() != "0") {
            $("#btnSPORDTrans").show();
        }

        //$("#chkByFlowerCodeDesc").iButton({
        //    labelOn: "Code",
        //    labelOff: "Desc"
        //});

        //$("#chkByFlowerCodeDesc").iButton("toggle", true);

        $("#fgrdARINVSpord").flexigrid({
            url: 'BloomService.asmx/GetARINVSpordDetailsForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;margin-top:-2px;margin-left:-2px" id="F8selectall" src="images/check-off.png"/>', name: 'Selected', width: 13, sortable: false, align: 'center' },
                { display: '', name: '', width: 15, sortable: false, align: 'left', process: SPORDRowClick },
                { display: '', name: '', width: 13, sortable: false, align: 'left', process: SPORDRowClick },
                { display: '', name: '', width: 13, sortable: false, align: 'left', process: SPORDRowClick },
                { display: 'Farm', name: 'Farm', width: 25, sortable: true, align: 'left', process: SPORDRowClick },
                { display: 'Flower', name: 'Flower', width: 60, sortable: true, align: 'left', process: SPORDRowClick, hide: true },
                { display: 'Description', name: 'FlowerName', width: 215, sortable: true, align: 'left', process: SPORDRowClick },
                { display: 'Type', name: 'Type', width: 20, sortable: true, align: 'left', process: SPORDRowClick },
                { display: 'Status', name: 'Status', width: 25, sortable: true, align: 'center', process: SPORDRowClick },
                { display: 'ShipDate', name: 'ShipDate', width: 65, sortable: true, align: 'center', process: SPORDRowClick },
                { display: 'CargoDate', name: 'CargoDate', width: 65, sortable: true, align: 'center', process: SPORDRowClick },
                { display: 'Qty', name: 'Boxes', width: 20, sortable: true, align: 'right', process: SPORDRowClick },
                { display: 'UOM', name: 'UOM', width: 21, sortable: true, align: 'center', process: SPORDRowClick },
                { display: 'UNITS', name: 'Units', width: 30, sortable: true, align: 'right', process: SPORDRowClick },
                { display: 'Shipped', name: 'Shipped', width: 38, sortable: true, align: 'right', process: SPORDRowClick },
                { display: 'Sell Price', name: 'Fob', width: 50, sortable: true, align: 'right', process: SPORDRowClick },
                { display: 'Farm Cost', name: 'Cost', width: 50, sortable: true, align: 'right', process: SPORDRowClick },
                { display: 'Carrier', name: 'carrier', width: 30, sortable: true, align: 'center', process: SPORDRowClick },
                { display: 'Shipto', name: 'Shipto', width: 30, sortable: true, align: 'center', process: SPORDRowClick },
                { display: 'CustomerPO', name: 'PO', width: 60, sortable: true, align: 'left', process: SPORDRowClick },
                { display: 'BoxCode', name: 'BoxCode', width: 70, sortable: true, align: 'left', process: SPORDRowClick },
                { display: 'UPC', name: 'UPC', width: 74, sortable: true, align: 'left', process: SPORDRowClick },
                { display: 'Datecode', name: 'Datecode', width: 50, sortable: true, align: 'left', process: SPORDRowClick },
                { display: 'Order', name: '[Order]', width: 40, sortable: true, align: 'right', process: SPORDRowClick, hide: true  },
                { display: 'WH', name: 'WH', width: 15, sortable: true, align: 'center', process: SPORDRowClick },
                { display: 'Agency', name: 'AGENCY', width: 35, sortable: true, align: 'center', process: SPORDRowClick },
                { display: '', name: '', width: 15, sortable: true, align: 'left', process: SPORDRowClick },
                { display: 'SPORDSqlId', name: 'SPORDSqlId', width: 20, sortable: true, align: 'right', process: SPORDRowClick, hide: true },
                { display: 'PODFlower', name: 'PODFlower', width: 80, sortable: true, align: 'left', process: SPORDRowClick },
            ],
            searchitems: [
                { display: 'Farm', name: 'Farm' },
                { display: 'Flower', name: 'Flower' },
                { display: 'Description', name: 'FlowerName' },
                { display: 'Type', name: 'Type' },
                { display: 'Status', name: 'Status' },
                { display: 'ShipDate', name: 'ShipDate' },
                { display: 'CargoDate', name: 'CargoDate' },
                { display: 'Qty', name: 'Boxes' },
                { display: 'UOM', name: 'UOM' },
                { display: 'Units', name: 'Units' },
                { display: 'Order', name: '[Order]' }
            ],
            sortname: "flower",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: false,
            showTableToggleBtn: false,
            height: $(window).height() - 195,
            width: 1300,
            striped: true,
            params: [
                { name: 'Customer', value: '0' },
                { name: 'ExportCSV', value: '' },
                { name: 'Type', value: '' },
                { name: 'SummaryDate', value: '' },
                { name: 'isF8BySummary', value: isSummaryList }
            ],
            onSuccess: function () {
                try {
                    var tmpSpordSqlID = $("#DivSelectedSPORDSqlID").html();
                    if (tmpSpordSqlID != "0" && tmpSpordSqlID != "") {
                        $("#fgrdARINVSpord [id^=row]").removeClass("trSelectedCheck");
                        $("#fgrdARINVSpord #row" + tmpSpordSqlID).addClass("trSelectedCheck");
                    }
                    else {
                        $("#fgrdARINVSpord tr:first").addClass("trSelectedCheck");
                        $("#DivSelectedSPORDSqlID").html($("#fgrdARINVSpord tr:first").attr('id').replace('row', ''));
                    }
                }
                catch (ex) {
                }

                if ($("#DivSummaryAndConfirmationDialog").dialog('isOpen') == true) {
                    $("#DivSummaryAndConfirmationDialog").dialog('close');
                }
                var sel = jQuery("#fgrdARINVSpord tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#DivSPORDDialog #ExportCSV").show();
                }
                if (IsGridLoadingAtFirst == false) {
                    IsGridLoadingAtFirst = true;
                    if (IsGridLoadingAtFirst == true) {
                        LoadShipto(function (callback1) {
                            if (callback1 == true) {
                                IsShipToDropDownAlreadyLoadedByCustomer = true;
                                //LoadAllCodes();
                                LoadFarmCode(function (callback3) {
                                    if (callback3 == true) {
                                        LoadStatus(function (callback4) {
                                            if (callback4 == true) {
                                                debugger;
                                                LoadOrderTypesCode(function (callback5) {
                                                    if (callback5 == true) {
                                                        LoadCarrierFilterDropdown(function (callback6) {
                                                            if (callback6 == true) {
                                                                LoadCargoAgency(function (callback7) {
                                                                    if (callback7 == true) {
                                                                        loadingdropdownonSPORDCompleted = true;
                                                                        LoadUOM(function (callback8) {
                                                                            if (callback8 == true) {
                                                                                LoadWHCode(function (callback9) {
                                                                                    if (callback9 == true) {
                                                                                        if ($("#msgbox-SPORDControlsLoading").dialog('isOpen')) {
                                                                                            $("#msgbox-SPORDControlsLoading").dialog("close");
                                                                                            IsAddSPORDclicked = true;
                                                                                            clearSPORDDetails();
                                                                                            SpordSqlID = "0";
                                                                                            $("#lstSPORDEditFarm").val("   ");
                                                                                            //clearSPORDDetails();
                                                                                            $("#SPORDAddEditDialog").dialog('option', 'title', "SPORD Add");
                                                                                            $("#SPORDAddEditDialog").dialog("open");
                                                                                        }
                                                                                    }
                                                                                })
                                                                            }
                                                                        })
                                                                    }
                                                                });
                                                            }
                                                        });
                                                    }
                                                })
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                }
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });
        //$("#DivSPORDDialog .sDiv").css('float', 'left').css('width', '645px');
        //$('#DivSPORDDialog .pDiv').css('padding', '2px').css('border-left', '0px');
        //$('#DivSPORDDialog .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        //$("#DivSPORDDialog .pDiv").find(".pDiv2").find(".btnseparator").hide();
        //$("#DivSPORDDialog .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();

        $("#DivSelectedSPORDSqlID").html("");
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

        //Region "F8-Doubles-Check"
        $("#txtF8ShippingDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));
        //End region

        //Region "F8-summary/Confirm"
        $("#txtSumConfirmFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));


        $("#txtSumConfirmToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));
        //End region

        GetPoqHistoryForF8();

    }); //end of document ready function

    $('input').keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            //for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
            //    var a;
            //    if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
            //        a = i;
            //    }
            //    if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i) {
            //        $(this).closest('tr').find('input')[i].focus();
            //        return false;
            //    }

            //    else

            if ($(this).attr('id') == "txtSPORDFlower") {
                $("#txtSPORDEditBreakdown").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtCreditUnits") {
                $("#txtCreditPrice").focus()
                return false;
            }

            else if ($(this).attr('id') == "txtCreditPrice") {
                $("#txtCreditFreight").focus()
                return false;
            }
            else if ($(this).attr('id') == "txtCreditFreight") {
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
            else if ($(this).attr('id') == "txtSPORDHoldBoxesHold") {
                $("#txtSPORDHoldFrom").focus();
            }
            else if ($(this).attr('id') == "txtSPORDHoldFrom") {
                $("#txtSPORDHoldTo").focus();
            }
            else if ($(this).attr('id') == "txtSPORDHoldTo") {
                $("#txtSPORDHoldCargof").focus();
            }
            else if ($(this).attr('id') == "txtSPORDHoldCargof") {
                $("#txtSPORDHoldCargot").focus();
            }
            else if ($(this).attr('id') == "txtSPORDHoldCargot") {
                $("#SPORDHoldDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditBreakdown") {
                $("#txtSPORDEditQty").focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditQty") {
                //$("#lstSPORDEditUOM").focus();
                $("#txtSPORDEditUnits").focus();
            }
            //else if ($(this).attr('id') == "lstSPORDEditUOM") {
            //    $("#txtSPORDEditUnits").focus();
            //}
            else if ($(this).attr('id') == "txtSPORDEditUnits") {
                $("#txtSPORDEditBunch").focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditBunch") {
                $("#txtSPORDEditSoldAs").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtSPORDEditSoldAs") {
                $("#txtSPORDEditFOB").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtSPORDEditFOB") {
                //$("#lstSPORDEditOrderType")[0].selectize.focus();
                $("#txtSPORDEditOrder").focus();
            }
            else if ($(this).attr('id') == "lstSPORDEditOrderType") {
                debugger;
                J1_10($("#lstSPORDEditStatus")).selectize()[0].selectize.enable();
            }
            else if ($(this).attr('id') == "txtSPORDEditOrder") {
                $("#txtSPORDEditShipDate").focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditShipDate") {
                if ($("#tdEndShipDate").css("display") != "none") {
                    $("#txtSPORDEditEndDate").focus();
                }
                else {
                    $("#txtSPORDEditShipbogota").focus()
                }
            }
            else if ($(this).attr('id') == "txtSPORDEditEndDate") {
                $("#txtSPORDEditShipbogota").focus()
            }
            else if ($(this).attr('id') == "txtSPORDEditShipbogota") {
                if ($("#tdEndCargoDate").css("display") != "none") {
                    $("#txtSPORDEditEndShipbog").focus();
                }
                else {
                    $("#txtSPORDEditPO").focus();
                }
            }
            else if ($(this).attr('id') == "txtSPORDEditEndShipbog") {
                $("#txtSPORDEditPO").focus()
            }
            else if ($(this).attr('id') == "txtSPORDEditPO") {
                $("#txtSPORDEditBoxCode").focus()
            }
            else if ($(this).attr('id') == "txtSPORDEditBoxCode") {
                if ($("#txtSPORDEditCost").css("display") == "none") {
                    $("#lstSPORDEditCarrier")[0].selectize.focus();
                }
                else {
                    $("#txtSPORDEditCost").focus();
                }
            }
            else if ($(this).attr('id') == "txtSPORDEditCost") {
                $("#lstSPORDEditCarrier")[0].selectize.focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditCommentsG") {
                $("#txtSPORDEditComments").focus()
            }
            else if ($(this).attr('id') == "txtSPORDEditComments") {
                $("#txtSPORDEditUPC").focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditUPC") {
                $("#txtSPORDEditDateCode").focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditDateCode") {
                $("#txtSPORDEditUPCPrice").focus()
            }
            else if ($(this).attr('id') == "txtSPORDEditUPCPrice") {
                $("#txtSPORDEditUPCDesc").focus()
            }
            else if ($(this).attr('id') == "txtSPORDEditUPCDesc") {
                $("#txtSPORDEditSleeve").focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditSleeve") {
                $("#txtSPORDEditSleeveDesc").focus()
            }
            else if ($(this).attr('id') == "txtSPORDEditSleeveDesc") {
                $("#txtSPORDEditFood").focus()
            }
            else if ($(this).attr('id') == "txtSPORDEditFood") {
                $("#txtSPORDEditFoodDesc").focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditFoodDesc") {
                $("#txtSPORDEditPick").focus();
            }
            else if ($(this).attr('id') == "txtSPORDEditPick") {
                $("#txtSPORDEditPickDesc").focus()
            }
            else if ($(this).attr('id') == "txtSPORDEditPickDesc") {
                $("#lstSPORDEditWH").focus();
            }
            else if ($(this).attr('id') == "lstSPORDEditWH") {
                $("#SPORDAddEditDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
            }
            else if ($(this).attr('id') == "txtSPORDCopyToCustomer") {
                $("#msgbox-SPORDCopyTo").siblings('.ui-dialog-buttonpane').find("button:contains('Copy')").focus();
            }

            //F8 - PRICE
            if ($(this).attr('id') == "txtSPORDPriceFlower") {
                $("#txtSPORDPriceQTY").focus()
                return false;
            }
            if ($(this).attr('id') == "txtSPORDPriceQTY") {
                $("#txtSPORDPriceUnits").focus()
                return false;
            }
            if ($(this).attr('id') == "txtSPORDPriceUnits") {
                $("#txtSPORDPriceUnitsBunch").focus()
                return false;
            }

            if ($(this).attr('id') == "txtSPORDPriceUnitsBunch") {
                $("#txtSPORDPrice_Price").focus()
                return false;
            }
            if ($(this).attr('id') == "txtSPORDPrice_Price") {
                $("#txtSPORDPriceSoldas").focus()
                return false;
            }
            if ($(this).attr('id') == "txtSPORDPriceSoldas") {
                $("#txtSPORDPriceUPC").focus()
                return false;
            }
            if ($(this).attr('id') == "txtSPORDPriceUPC") {
                $("#txtSPORDPriceBoxCode").focus()
                return false;
            }
            if ($(this).attr('id') == "txtSPORDPriceBoxCode") {
                $("#txtSPORDPriceGTIN").focus()
                return false;
            }
            if ($(this).attr('id') == "txtSPORDPriceGTIN") {
                $("#SPORDPriceDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }

            // }
        }
    }); //end of input key press

    /*Warning for Controls loading on Customer Add/Edit screen*/
    $("#msgbox-SPORDControlsLoading").dialog({
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
    reloadspord("");

    function reloadspord(type) {
        var date = '';
        var issummary = false;
        debugger;
        if (type != "") {
            if (type.toLowerCase() == "U".toLowerCase()) {
                date = $("#txtSumConfirmFromDate").val();
                issummary = true;
            }
            else {
                date = '';
                issummary = false;
            }
        }
        else {
            date = '';
            issummary = false;
        }
        $("#fgrdARINVSpord").flexOptions({
            params: [{ name: 'Customer', value: $("#ctl00_DivCurrentCustomer_SPORD").html() },
            { name: 'ExportCSV', value: '' },
            { name: 'Type', value: type },
            { name: 'SummaryDate', value: date },
            { name: 'isF8BySummary', value: issummary }], query: "", newp: 1
        }).flexReload();
    }


    function SPORDRowClick(celDiv, id) {

        $(celDiv).click(function () {
            if (SPORDCopyClicked == false) {
                $("#DivSelectedSPORDSqlID").html(id.toString());
            }

            $("#fgrdARINVSpord [id^=row]").removeClass("trSelectedCheck");
            $("#fgrdARINVSpord #row" + id).addClass("trSelectedCheck");
        });
    }




    $("#txtSPORDHoldFrom").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("#txtSPORDHoldTo").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("#txtSPORDHoldCargof").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("#txtSPORDHoldCargot").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    $("[id^=spordId_]").die("click").live("click", function () {
        debugger;
        var spordId = "";
        spordId = $(this).attr("id").replace("spordId_", "");
        $("#poqHistoryTable").flexOptions({ params: [{ name: 'spordId', value: spordId }], query: "", newp: 1 }).flexReload();
        $("#PoqHistoryDialog").dialog("open");

    });

    function GetPoqHistoryForF8(){

        $("#poqHistoryTable").flexigrid({
            url: 'BloomService.asmx/GetPoqHistoryForF8',
            dataType: 'xml',
            colModel: [
                { display: 'Farm', name: 'Farm', width: 25, sortable: true },
                { display: 'PO', name: 'PO', width: 100, sortable: true },
                { display: 'Prod NameQ', name: 'ProdNameQ', width: 150, sortable: true },
                { display: 'Ship Date', name: 'ShipDate', width: 70, sortable: true },
                { display: 'Boxes', name: 'Boxes', width: 40, sortable: true },
                { display: 'UOM', name: 'UOM', width: 40, sortable: true },
                { display: 'QtyXBox', name: 'QtyXBox', width: 40, sortable: true },
                { display: 'Box Num', name: 'BoxNum', width: 40, sortable: true },
                { display: 'UnitCosq', name: 'UnitCosq', width: 40, sortable: true },
                { display: 'UnitSalq', name: 'UnitSalq', width: 40, sortable: true },
                { display: 'Status', name: 'ProStatus', width: 70, sortable: true },
                { display: 'Market', name: 'Market', width: 40, sortable: true },
                { display: 'CustShDate', name: 'CustShDate', width: 70, sortable: true },
                { display: 'Awb', name: 'Awb', width: 70, sortable: true },
                { display: 'Order', name: 'Order', width: 40, sortable: true }
            ],
            showTableToggleBtn: true,
            sortname: "",
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
            width: 1050,
            height: 400,
            striped: true,
            params: [
                { name: 'spordId', value: '' }
            ],
            onSuccess: function () {

                $("#PoqHistoryDialog .sDiv").css('float', 'left').css('width', '542px');
                $('#PoqHistoryDialog .pDiv').css('padding', '2px').css('border-left', '0px');
                $('#PoqHistoryDialog .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
                $("#PoqHistoryDialog .pDiv").find(".pDiv2").find(".btnseparator").hide();
                $("#PoqHistoryDialog .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });
    }


    $("[id^=holdARINVSpord_]").die("click").live("click", function () {

        var tmpSpordSqlIDforHold = $(this).attr("id").replace("holdARINVSpord_", "").trim();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSPORDHoldDetails',
            data: "{'SpordSqlID':'" + tmpSpordSqlIDforHold + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                res = output.d;
                $("#txtSPORDHoldFarm").val(res[0].Farm);
                $("#txtSPORDHoldFlower").val(res[0].FlowerName);
                $("#txtSPORDHoldBoxes").val(res[0].Boxes);
                $("#txtSPORDHoldUOM").val(res[0].UOM);
                $("#txtSPORDHoldUnits").val(res[0].Units);
                $("#txtSPORDHoldBunch").val(res[0].UnitsBunch);
                $("#txtSPORDHoldFOB").val(res[0].Fob.toFixed(4));
                $("#txtSPORDHoldFuelIncl").val(res[0].FuelInclud);
                $("#txtSPORDHoldType").val(res[0].Type);
                $("#txtSPORDHoldStatus").val(res[0].Status);
                $("#txtSPORDHoldOrder").val(res[0].Order);
                $("#txtSPORDHoldShipDate").val(res[0].ShipDate);
                $("#txtSPORDHoldEndDate").val(res[0].EndShipDate);
                $("#txtSPORDHoldShipbogota").val(res[0].CargoDate);
                $("#txtSPORDHoldEndShipbog").val(res[0].EndCargoDate);
                $("#txtSPORDHoldPO").val(res[0].PO);
                $("#txtSPORDHoldBoxCode").val(res[0].BoxCode);
                $("#txtSPORDCost").val(res[0].Cost.toFixed(3));
                $("#txtSPORDHoldCarrier").val(res[0].Carrier);
                $("#txtSPORDHoldShipto").val(res[0].Shipto);
                $("#txtSPORDHoldBoxesHold").val(res[0].Hold);
                //$("#txtSPORDHoldSoldAs").val(res[0].SOLDAS);

                $("#txtSPORDHoldFrom").datepicker('setDate', isValidDate(Date.parse(res[0].HoldFrom)) ? Date.parse(res[0].HoldFrom) : new Date());
                $("#txtSPORDHoldTo").datepicker('setDate', isValidDate(Date.parse(res[0].HoldTo)) ? Date.parse(res[0].HoldTo) : new Date());
                $("#txtSPORDHoldCargof").datepicker('setDate', isValidDate(Date.parse(res[0].CargoHoldf)) ? Date.parse(res[0].CargoHoldf) : new Date());
                $("#txtSPORDHoldCargot").datepicker('setDate', isValidDate(Date.parse(res[0].CargoHoldt)) ? Date.parse(res[0].CargoHoldt) : new Date());

                //$("#txtSPORDHoldFrom").val(res[0].HoldFrom);
                //$("#txtSPORDHoldTo").val(res[0].HoldTo);
                //$("#txtSPORDHoldCargof").val(res[0].CargoHoldf);
                //$("#txtSPORDHoldCargot").val(res[0].CargoHoldt);

                $("#SPORDHoldDialog").data("SpordSqlID", tmpSpordSqlIDforHold).dialog("open");
            }
        });

    });

    function isValidDate(datevalue, isvalid) {
        debugger;
        isvalid = false;
        var _date = new Date(datevalue);
        var getyr = _date.getFullYear();
        if (getyr < 1995) {
            isvalid = false;
        }
        else { isvalid = true; }
        return isvalid;
    }

    $("#SPORDHoldDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "SPORD Hold",
        modal: true,
        //closeOnEscape: false,
        width: 700,
        //height:550,
        buttons: {
            Save: function () {

                var BoxesHold = $("#txtSPORDHoldBoxesHold").val();
                var HoldFrom = $("#txtSPORDHoldFrom").val();
                var HoldTo = $("#txtSPORDHoldTo").val();
                var CargoHoldf = $("#txtSPORDHoldCargof").val();
                var CargoHoldt = $("#txtSPORDHoldCargot").val();
                var tmpSpordSqlID = $("#SPORDHoldDialog").data("SpordSqlID");

                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/SaveHoldDetails",
                    data: "{'BoxesHold':'" + BoxesHold + "','HoldFrom':'" + HoldFrom + "','HoldTo':'" + HoldTo + "','CargoHoldf':'" + CargoHoldf + "','CargoHoldt':'" + CargoHoldt + "','SpordSqlID':'" + tmpSpordSqlID + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        var res = output.d;
                        if (output.d == "success") {
                            $("#SPORDHoldDialog").dialog("close");
                            $.MessageBox("Hold Updated...")
                        }
                        $("#fgrdARINVSpord").flexReload({ url: '/url/for/refresh' });
                    }
                });
            },
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
            $("#txtSPORDHoldBoxesHold").focus();
        },
    });

    var nData = new Date();
    $("#txtSPORDEditShipDate,#txtSPORDEditShipbogota").mask("99/99/" + nData.getFullYear());

    $("#txtSPORDEditEndDate,#txtSPORDEditEndShipbog").mask("99/99/9999");

    var growershipdate = 3;

    $("#txtSPORDEditShipbogota").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
    }).datepicker("setDate", new Date()).on("input change", function (e) {

        var SelectedDate = Date.parse(e.target.value);
        //var TYPE = $("#txtSPORDEditType").val().toUpperCase();
        var TYPE = $("#hfSPORDEditOrderType").val().toUpperCase();
        if (TYPE == "P" || TYPE == "D") {
            $("#txtSPORDEditEndShipbog").datepicker("setDate", SelectedDate);
        }
    });

    $("#txtSPORDEditEndShipbog").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
    }).datepicker("setDate", new Date());

    var Shipdatetocust = Date.parse($("#txtSPORDEditShipbogota").val());
    Shipdatetocust.setDate(Shipdatetocust.getDate() + 3);
    $("#txtSPORDEditShipDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
        //onSelect: function (selected) {
        //    $("#txtSPORDEditEndDate").datepicker("option", "minDate", selected)
        //},
    }).datepicker("setDate", new Date(Shipdatetocust)).on("input change", function (e) {
        var SelectedDate = Date.parse(e.target.value);
        var GrowerSelectedDate = Date.parse(e.target.value);
        var TYPE = $("#hfSPORDEditOrderType").val().toUpperCase();
        if (TYPE == "P" || TYPE == "D") {
            $("#txtSPORDEditEndDate").datepicker("setDate", SelectedDate);
        }
        SelectedDate.setDate(SelectedDate.getDate() - 3);
        if (TYPE == "P" || TYPE == "D") {
            $("#txtSPORDEditEndShipbog").datepicker("setDate", SelectedDate);
        }
        debugger
        CarrierChangeAutomatically = true;
        
        ChangeCarrierSPORD(e.target.value);
        if ($("#SPORDAddEditDialog").dialog('option', 'title') == "SPORD Add") {
            $("#txtSPORDEditShipDate").focusout();
        }
        else {
            GrowerSelectedDate.setDate(GrowerSelectedDate.getDate() - 3);
            //$("#txtSPORDEditShipbogota").val($.datepicker.formatDate('mm/dd/yy', new Date(GrowerSelectedDate)));
        }
    });

    $("#txtSPORDEditEndDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true
        //onSelect: function (selected) {
        //    $("#txtSPORDEditEndDate").datepicker("option", "minDate", selected)
        //},
    }).datepicker("setDate", new Date()).on("input change", function (e) {
        var SelectedDate = Date.parse(e.target.value);
        SelectedDate.setDate(SelectedDate.getDate() - 3);
        $("#txtSPORDEditEndShipbog").val($.datepicker.formatDate('mm/dd/yy', new Date(SelectedDate)));
    });


    $("#txtSPORDEditShipbogota").on('input change keydown focusout', function (e) {
        var SelectedDate = Date.parse(e.target.value);
        $("#CargoDateDay").text(SelectedDate.toLocaleString('en-us', { weekday: 'long' }).substr(0, 7));
        let shipdate = new Date($("#txtSPORDEditShipDate").val());
        CalculateDiffDays(shipdate, SelectedDate);
    });


    $("#txtSPORDEditShipDate").on('input change keydown focusout', function (e) {
        //if (e.which == 13) {
        var SelectedDate = Date.parse(e.target.value);
        if ($("#SPORDAddEditDialog").dialog('option', 'title') == "SPORD Add") {
            if (new Date($("#txtSPORDEditShipDate").val()) != "Invalid Date") {
                GrowerShipdateFromCustomerShipdate($("#txtSPORDEditShipDate").val(), $("#lstSPORDEditFarm")[0].value, function (callback) {
                    if (callback== true) {
                        var misDays = 3;
                        if (!growershipdate)
                            misDays = 3;
                        else
                            misDays = growershipdate;
                        SelectedDate.setDate(SelectedDate.getDate() - misDays);
                        //UpdateShippingDate(SelectedDate);
                    }
                });
            }
        }
        else {
            SelectedDate.setDate(SelectedDate.getDate() - 3);
            //UpdateShippingDate(SelectedDate);
        }
        //CarrierChangeAutomatically = true;
        //ChangeCarrierSPORD(e.target.value);
        //}
        //else if (e.which == 89) {
        if (e.which == 89) {
            $("#txtSPORDEditShipDate,#txtSPORDEditShipbogota").mask("99/99/9999");
        }

        //ChangeCarrierSPORD(new Date($("#txtSPORDEditShipDate").val()).toString("MM/dd/yyyy"));
        //}
        let cargodate = new Date($("#txtSPORDEditShipbogota").val());
        CalculateDiffDays(SelectedDate, cargodate);
        $("#ShipDateDay").text(SelectedDate.toLocaleString('en-us', { weekday: 'long' }).substr(0, 7));
    });

    function GrowerShipdateFromCustomerShipdate(ShippingDateToCustomer, FarmCode, callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/FarmShipDate ',
            data: '{"ShippingDateToCustomer":"' + ShippingDateToCustomer + '","FarmCode":"' + FarmCode + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                res = output.d;
                growershipdate = "";
                growershipdate = res;
                callback(true)
            }
        });
    }
    //$("#txtSPORDEditShipDate, #txtSPORDEditEndDate").focusout(function () {
    //    
    //    var shipFromDate = new Date($("#txtSPORDEditShipDate").val());
    //    //var shipToDate = new Date($("#txtSPORDEditEndDate").val());
    //    //if ($("#tdEndShipDate").css("display") != "none") {
    //    //    if (shipFromDate > shipToDate) {
    //    //        //$("#txtSPORDEditEndDate").focus();
    //    //        $.MessageBox("End Date Should not be less than Start Date!!!!")
    //    //        return false;
    //    //    }
    //    //}
    //});

    //$("#txtSPORDEditShipbogota, #txtSPORDEditEndShipbog").focusout(function () {
    //    
    //    var growerFromDate = new Date($("#txtSPORDEditShipbogota").val());
    //    //var growerToDate = new Date($("#txtSPORDEditEndShipbog").val());
    //    //if ($("#tdEndCargoDate").css("display") != "none") {
    //    //    if (growerFromDate > growerToDate) {
    //    //        //$("#txtSPORDEditEndShipbog").focus();
    //    //        $.MessageBox("End Date Should not be less than Start Date!!!!")
    //    //        return false;
    //    //    }
    //    //}
    //});




    //function LoadSPORDFlowers(callback) {

    //    var length = $('#lstSPORDEditFlower > option').length;
    //    if (length <= 0) {
    //        $("#imgFlowerAutocompleteLoader").css("display", "block");
    //        $(".YellowWarning").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
    //        $(".YellowWarning").show();
    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/LoadFlowers',
    //            data: '{}',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (output, status) {

    //                $('#lstSPORDEditFlower').empty();
    //                var data = output.d;
    //                for (var i in data) {
    //                    var flower = data[i];
    //                    if (flower.Flower.trim() != "") {
    //                        //$('#lstSPORDEditFlower').append('<option value="' + flower.Flower.trim() + "~" + flower.UOM + "~" + flower.UNITS  + '" >[' + flower.Flower + '] ' + flower.Name + '</option>');
    //                        $('#lstSPORDEditFlower').append('<option value="' + flower.Flower.trim()  + '" >[' + flower.Flower + '] ' + flower.Name + '</option>');
    //                    }
    //                }
    //                J1_10($("#lstSPORDEditFlower")).selectize({
    //                    onChange: function () {

    //                        if (isSPORDeditclicked == false && IsAddSPORDclicked == false) {

    //                            $("#hfSPORDEditFlower").val($("#lstSPORDEditFlower")[0].value);
    //                            var Flower = $("#hfSPORDEditFlower").val();
    //                            var resArray = new Array();
    //                            
    //                            GetFlowerDetailsByCode(function (callback1, resArray) {
    //                                if (callback1 == true) {
    //                                    try{
    //                                        $("#lstSPORDEditUOM").val(resArray[0].UOM);
    //                                        $("#txtSPORDEditUnits").val(resArray[0].UNITS);
    //                                    }
    //                                    catch(ex){}
    //                                }
    //                            })



    //                            $("#txtSPORDEditBreakdown").focus().select();
    //                        }
    //                    }
    //                });
    //                J1_10($("#lstSPORDEditFlower")).selectize()[0].selectize.setValue($("#hfSPORDEditFlower").val().trim());
    //                $("#imgFlowerAutocompleteLoader").css("display", "none");
    //                $(".YellowWarning").hide();
    //                callback(true)
    //            },
    //        });
    //    }
    //    else {
    //        J1_10($("#lstSPORDEditFlower")).selectize()[0].selectize.setValue($("#hfSPORDEditFlower").val().trim());
    //        callback(true)
    //    }
    //}

    function GetFlowerDetailsByCode(callback) {

        var resArray = ""
        var Flower = $("#hfSPORDEditFlower").val();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFlowerDetailsByCode',
            data: '{"Flower":"' + Flower + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                res = output.d;
                callback(true, res)
            }
        });
    }

    function LoadFarmCode(callback) {
        debugger;
        var length = $('#lstSPORDEditFarm > option').length;
        var LoginUserID = $("#ctl00_LoggedInUserID").html();
        if (length <= 0) {
            //$("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading farm codes... Please Wait <img style='display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUserFarmCode',
                data: "{'UserID':'" + LoginUserID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstSPORDEditFarm').empty();
                    var data = output.d;
                    for (var i in data) {
                        var farm = data[i];
                        //console.log(farm);
                        if (farm.Farm != "") {
                            $('#lstSPORDEditFarm').append('<option value="' + farm.Farm + '">[' + farm.Farm + '] ' + farm.Name + '</option>');
                        }
                    }
                    J1_10($("#lstSPORDEditFarm")).selectize({
                        onChange: function () {
                            debugger;
                            if (isSPORDeditclicked == false && IsAddSPORDclicked == false && $("#lstSPORDEditFarm")[0].value != "") {
                                setSelectedFarm();
                            }
                            else if (isSPORDeditclicked && $("#lstSPORDEditFarm")[0].value != "") {
                                setSelectedFarm();
                            }
                            $("#txtSPORDFlower").focus().select();
                            $('#lstSPORDEditUOM').find('option').remove().end();
                            LoadUOM(function (callback) { });
                            //update ship date and grower date//
                            var SelectedFarm = $("#lstSPORDEditFarm")[0].value ;
                            console.log("Selected Farm: " + SelectedFarm);
                            var SelectedDate = Date.parse($("#txtSPORDEditShipDate").val());
                            //check if ship date not null
                            if (SelectedDate) { 
                                if ($("#SPORDAddEditDialog").dialog('option', 'title') == "SPORD Add") {
                                    if (new Date($("#txtSPORDEditShipDate").val()) != "Invalid Date") {
                                        GrowerShipdateFromCustomerShipdate($("#txtSPORDEditShipDate").val(), $("#lstSPORDEditFarm")[0].value, function (callback) {
                                            if (callback == true) {
                                                SelectedDate.setDate(SelectedDate.getDate() - growershipdate);
                                                $("#txtSPORDEditShipbogota").val($.datepicker.formatDate('mm/dd/yy', new Date(SelectedDate)));
                                                $("#CargoDateDay").val("1")
                                                let shipdate = new Date($("#txtSPORDEditShipDate").val());
                                                CalculateDiffDays(shipdate, SelectedDate);

                                                //2021/09/18
                                               
                                                //ChangeCarrierSPORD(new Date($("#txtSPORDEditShipDate").val()).toString("MM/dd/yyyy"));
                                            }
                                        });
                                    }
                                }
                                else {
                                    SelectedDate.setDate(SelectedDate.getDate() - 3);
                                    //$("#txtSPORDEditShipbogota").val($.datepicker.formatDate('mm/dd/yy', new Date(SelectedDate)));
                                }
                            }
                            /////
                        }
                    });
                    $("#hfSPORDEditFarm").val("   ");
                    J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.setValue($("#hfSPORDEditFarm").val());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                    debugger;
                    callback(true)
                },
            });
        }
        else {
            J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.setValue($("#hfSPORDEditFarm").val().trim());
            debugger;
            callback(true)
        }
    }
    function setSelectedFarm() {
        debugger;
        var Farm = $("#lstSPORDEditFarm")[0].value;
        $("#hfSPORDEditFarm").val(Farm);
        try {
            // $("txtSPORDFlower").focus();
            //$("#lstSPORDEditFlower")[0].selectize.focus();
            setUOMByFarm(function (callback) {
                if (callback == true) {
                    $("#txtSPORDFlower").focus().select();
                }
                else {
                    $("#txtSPORDFlower").focus().select();
                }
            });
        }
        catch (er) {
        }
    }

    function LoadUOM(callback) {
        debugger;
        var Farm = $("#hfSPORDEditFarm").val();
        var length = $('#lstSPORDEditUOM > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForSPORD',
                data: "{'FarmCode':'" + Farm + "'}",
                contentType: "application/json; charset=utf-8",
                //dataType: "json",
                success: function (output, status) {
                    debugger;
                    if (output.d != null) {
                        $('#lstSPORDEditUOM').empty();
                        UOMList = [];
                        UOMList = output.d;
                        var UOMdata = output.d;
                        $('#lstSPORDEditUOM').append('<option value="0">Select</option>');
                        for (var i in UOMdata) {
                            var UOM = UOMdata[i];
                            $('#lstSPORDEditUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM + ' [' + UOM.SIZE + ']</option>');
                        }

                        if ($("#hfSPORDEditUOM").val() != "" && $("#hfSPORDEditUOM").val() != 0)
                            $('#lstSPORDEditUOM').val($("#hfSPORDEditUOM").val());
                        else
                            $("#lstSPORDEditUOM").val("QB");
                    }
                    callback(true);
                }
            });
        }
        else {
            $('#lstSPORDEditUOM').val($("#hfSPORDEditUOM").val());
            //callback(true);
        }
    }

    function LoadStatus(callback) {

        var length = $('#lstSPORDEditStatus > option').length;
        if (length <= 0) {
            //$("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading status codes... Please Wait <img style='display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetStatusForSPORD',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstSPORDEditStatus').empty();
                    var data = output.d;
                    for (var i in data) {
                        var status = data[i];
                        if (status.Status != "") {
                            $('#lstSPORDEditStatus').append('<option value="' + status.Status + '">[' + status.Status + '] ' + status.StatusDesc + '</option>');
                        }
                    }

                    J1_10($("#lstSPORDEditStatus")).selectize({
                        onChange: function () {
                            if (isSPORDeditclicked == false && IsAddSPORDclicked == false) {
                                var Status = $("#lstSPORDEditStatus")[0].value;
                                $("#hfSPORDEditStatus").val(Status);
                                $("#txtSPORDEditOrder").focus().select();
                            }
                        }
                    });
                    LoadDefaultStatus();
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                    callback(true)
                },
            });
        }
        else {
            J1_10($("#lstSPORDEditStatus")).selectize()[0].selectize.setValue($("#hfSPORDEditStatus").val().trim());
            callback(true)
        }
    }

    function LoadCarrierFilterDropdown(callback) {

        var length = $('#lstSPORDEditCarrier > option').length;
        if (length <= 0) {
            $("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading carriers... Please Wait <img style='display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadCarrierForPOEdit',
                data: '{"Airline":"A,T"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstSPORDEditCarrier').empty();
                    var data = output.d;
                    if (data != null) {
                        for (var i in data) {
                            var DefCarrier = data[i];
                            $('#lstSPORDEditCarrier').append('<option value="' + DefCarrier.Carrier + '">[' + DefCarrier.Carrier + "] " + DefCarrier.Name + '</option>');
                        }
                    }

                    J1_10($("#lstSPORDEditCarrier")).selectize({
                        onChange: function () {
                            if (isSPORDeditclicked == false && IsAddSPORDclicked == false && $("#lstSPORDEditCarrier")[0].value.trim() != "") {

                                var Carrier = $("#lstSPORDEditCarrier")[0].value;
                                $("#hfSPORDEditCarrier").val(Carrier);
                                try {
                                    if ($(".ShipToSection").css("display") == "none") {
                                        //$("#lstSPORDEditCargoAgency")[0].selectize.focus();
                                        if (CarrierChangeAutomatically != true) {
                                            $("#txtSPORDEditCommentsG").focus().select();
                                        }
                                    }
                                    else {
                                        if (CarrierChangeAutomatically != true) {
                                            $("#lstSPORDEditShipto")[0].selectize.focus();
                                            // CarrierChangeAutomatically = false;
                                        }
                                    }
                                    CarrierChangeAutomatically = false;
                                    //$("#lstSPORDEditShipto")[0].selectize.focus();
                                }
                                catch (er) { }
                            }


                        }
                    });
                    J1_10($("#lstSPORDEditCarrier")).selectize()[0].selectize.setValue($("#hfSPORDEditCarrier").val().trim());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                    callback(true)
                },
            });
        }
        else {
            J1_10($("#lstSPORDEditCarrier")).selectize()[0].selectize.setValue($("#hfSPORDEditCarrier").val().trim());
            callback(true)
        }
    }

    function LoadShipto(callback) {

        if (IsShipToDropDownAlreadyLoadedByCustomer == false) {
            $(".YellowWarning").html("Loading shipto... Please Wait <img style='display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetShiptoForSPORD',
                data: "{'Customer':'" + ($("#ctl00_DivCurrentCustomer_SPORD").html() == 'null' ? $("#CurrentCustomerNo").html() : $("#ctl00_DivCurrentCustomer_SPORD").html()) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, Shipto) {
                    try {
                        J1_10($('#lstSPORDEditShipto')).selectize()[0].selectize.destroy();
                    }
                    catch (ex) {
                    }

                    $("#tdShipto #lstSPORDEditShipto").remove();
                    $("#tdShipto").append("<select placeholder='Choose Shipto...' id='lstSPORDEditShipto' value='' />")
                    $('#lstSPORDEditShipto').empty();
                    var data = output.d;
                    if (data.length > 0) {
                        $(".ShipToSection").show();
                        for (var i in data) {
                            var shipto = data[i];
                            if (shipto.Shipto != "") {
                                $('#lstSPORDEditShipto').append('<option value="' + shipto.Shipto + '">[' + shipto.Shipto + '] ' + shipto.ShiptoName + '</option>');
                            }
                        }

                        J1_10($("#lstSPORDEditShipto")).selectize({
                            onChange: function () {
                                if (isSPORDeditclicked == false && IsAddSPORDclicked == false && $("#lstSPORDEditShipto")[0].value != "") {
                                    var Shipto = $("#lstSPORDEditShipto")[0].value;
                                    $("#hfSPORDEditShipto").val(Shipto);
                                    try {
                                        $("#txtSPORDEditCommentsG").focus();
                                        //$("#lstSPORDEditCargoAgency")[0].selectize.focus();
                                    }
                                    catch (er) {

                                    }
                                }

                            },
                            //load: function (query, callback) {

                            //    this.clearOptions();        // clear the data
                            //    this.renderCache = {};      // clear the html template cache
                            //}
                        });
                        J1_10($("#lstSPORDEditShipto")).selectize()[0].selectize.setValue($("#hfSPORDEditShipto").val().trim());
                        $("#imgFlowerAutocompleteLoader").css("display", "none");
                        $(".YellowWarning").hide();
                    }
                    else {
                        $(".ShipToSection").hide();
                        $("#hfSPORDEditShipto").val("");
                    }

                    callback(true)
                },
            });
        }
        else {
            J1_10($("#lstSPORDEditShipto")).selectize()[0].selectize.setValue($("#hfSPORDEditShipto").val().trim());
            callback(true)
        }
    }

    function LoadCargoAgency(callback) {

        var length = $('#lstSPORDEditCargoAgency > option').length;
        if (length <= 0) {
            $("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarning").html("Loading cargo agency... Please Wait <img style='display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadCarrierForPOEdit',
                data: '{"Airline":"C"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstSPORDEditCargoAgency').empty();
                    //$('#lstSPORDEditCargoAgency').append('<option value="All">All</option>');
                    var data = output.d;
                    if (data != null) {
                        for (var i in data) {
                            var DefCarrier = data[i];
                            $('#lstSPORDEditCargoAgency').append('<option value="' + DefCarrier.Carrier + '">[' + DefCarrier.Carrier + "] " + DefCarrier.Name + '</option>');

                        }
                    }

                    J1_10($("#lstSPORDEditCargoAgency")).selectize({
                        onChange: function () {
                            if (isSPORDeditclicked == false && IsAddSPORDclicked == false) {
                                var Carrier = $("#lstSPORDEditCargoAgency")[0].value;
                                $("#hfSPORDEditCargoAgency").val(Carrier);
                                $("#txtSPORDEditCommentsG").focus().select();
                            }

                        }
                    });
                    J1_10($("#lstSPORDEditCargoAgency")).selectize()[0].selectize.setValue($("#hfSPORDEditCargoAgency").val().trim());

                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                    callback(true)
                },
            });
        }
        else {
            J1_10($("#lstSPORDEditCargoAgency")).selectize()[0].selectize.setValue($("#hfSPORDEditCargoAgency").val().trim());
            callback(true)
        }
    }

    var IsAddSPORDclicked = false;
    $("#btnSPORDAdd").die("click").live("click", function () {
        debugger;
        addF8();
    });

    function addForF8() {
        $("#SPORDAddEditDialog :input").prop("disabled", false);
        J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.enable();
        J1_10($("#lstSPORDEditStatus")).selectize()[0].selectize.enable();
        $("#SPORDAddEditDialog").css("pointer-events", "visible");
        IsAddSPORDclicked = true;
        isPricelstExistForCust = false;
        //if ($("#ctl00_LoggedInUserType_PageSPORD").html().toLowerCase() == "employee" && isSPORDeditclicked == false) {
        //    if (IsEmployeeFirstOrder == false) {
        //        IsEmployeeFirstOrder = true;
        //    }
        //    else {
        //        IsEmployeeFirstOrder = false;
        //    }
        //}
        // reset the date input on startup
        var sPORDEditShipDate = new Date();
        sPORDEditShipDate.setDate(sPORDEditShipDate.getDate() + 3);
        //$("#txtSPORDEditShipDate").val(Shipdatetocust.toLocaleDateString());
        $("#txtSPORDEditShipDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true
        }).datepicker("setDate", sPORDEditShipDate);

        var txtSPORDEditShipbogotaDate = new Date(Shipdatetocust.toString());
        txtSPORDEditShipbogotaDate.setDate(txtSPORDEditShipbogotaDate.getDate() - 3);
        UpdateShippingDate(txtSPORDEditShipbogotaDate);
        $("#ShipDateDay").text(sPORDEditShipDate.toLocaleString('en-us', { weekday: 'long' }).substr(0, 7));
        CalculateDiffDays(sPORDEditShipDate, txtSPORDEditShipbogotaDate);

        if (loadingdropdownonSPORDCompleted == false) {
            $("#msghtml-SPORDControlsLoading").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />");
            $("#msgbox-SPORDControlsLoading").dialog("open");
        }
        else {
            clearSPORDDetails();
            SpordSqlID = "0";
            //clearSPORDDetails();
            $("#SPORDAddEditDialog").dialog('option', 'title', "SPORD Add");
            $("#SPORDAddEditDialog").data("inData", ({ isFrom: "DirectF8" })).dialog("open");
        }
    }

    var CarrierChangeAutomatically = false;

    function clearSPORDDetails() {
        $("#txtSPORDFlower").val("");
        $("#hfSPORDFlower").val("");
        $("#txtSPORDEditBreakdown").val("");
        $("#hfSPORDEditBreakdown").val("");
        $("#txtSPORDEditQty").val("");
        $("#txtSPORDEditQty").attr('placeholder', '');
        $("#txtSPORDEditUnits").val("");
        $("#txtSPORDEditUnits").attr('placeholder', '0');
        $("#txtSPORDEditBunch").val("");
        $("#txtSPORDEditBunch").attr('placeholder', '0');
        $("#txtSPORDEditSoldAs").val("");
        $("#txtSPORDEditSoldAs").attr('placeholder', '');
        $("#txtSPORDEditFOB").val("");
        $("#txtSPORDEditFOB").attr('placeholder', '0.0000');
        $("#txtSPORDEditType").val("P");
        $("#tdEndShipDate").css({ display: "none" });
        //$("#hfEndShipDate").val("");
        $("#tdEndCargoDate").css({ display: "none" });
        $("#tdDiffDays").css({ display: "none" });
        $("#txtSPORDEditEndDate").datepicker('setDate', $("#txtSPORDEditShipDate").val());
        $("#txtSPORDEditEndShipbog").datepicker('setDate', $("#txtSPORDEditShipbogota").val());
        if ($("#ctl00_LoggedInUserType").html().toLowerCase() == "sales person") {
            J1_10($("#lstSPORDEditStatus")).selectize()[0].selectize.setValue("Pe"); // Email:Esprit Dev Updates :: 15May19 :: Tasks
            J1_10($("#lstSPORDEditStatus")).selectize()[0].selectize.disable();
        }
        CarrierChangeAutomatically = true;
        ChangeCarrierSPORD(new Date().toString("MM/dd/yyyy"));
        if ($("#ctl00_LoggedInUserType_PageSPORD").html().toLowerCase() == "employee" && isSPORDeditclicked == false) { //Employee usertype and add clicked
            if (IsEmployeeFirstOrder == false) { /*First order for Employee usertype :: empty the Order field */
                $("#txtSPORDEditOrder").val("");
                $("#txtSPORDEditOrder").attr("placeholder", "");
                EmployeeOrderNo = "";
            }
            else {
                $("#txtSPORDEditOrder").val(EmployeeOrderNo);
                $("#txtSPORDEditOrder").attr("placeholder", EmployeeOrderNo);
            }
        }
        else {
            GetNextPrebookNumFromConstant();
        }
        $("#txtSPORDEditPO").val("");
        $("#txtSPORDEditBoxCode").val("");
        $("#txtSPORDEditCost").val("");
        $("#txtSPORDEditCost").attr('placeholder', '0.0000');
        $("#txtSPORDEditFarmPO").html("");
        $("#txtSPORDEditID").html("(ID)");
        J1_10($("#lstSPORDEditCarrier")).selectize()[0].selectize.clear();
        J1_10($("#lstSPORDEditShipto")).selectize()[0].selectize.clear();
        J1_10($("#lstSPORDEditCargoAgency")).selectize()[0].selectize.clear();
        $("#txtSPORDEditCommentsG").val("");
        $("#txtSPORDEditComments").val("");
        $("#txtSPORDEditUPC").val("");
        $("#txtSPORDEditDateCode").val("");
        $("#txtSPORDEditUPCPrice").val("");
        $("#txtSPORDEditUPCDesc").val("");
        $("#txtSPORDEditSleeve").val("");
        $("#txtSPORDEditSleeveDesc").val("");
        $("#txtSPORDEditFood").val("");
        $("#txtSPORDEditFoodDesc").val("");
        $("#txtSPORDEditPick").val("");
        $("#txtSPORDEditPickDesc").val("");
        var nData = new Date();
        $("#txtSPORDEditShipDate,#txtSPORDEditShipbogota").mask("99/99/" + nData.getFullYear());
        IsAddSPORDclicked = false;
    }

    function GetNextPrebookNumFromConstant() {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetNextPrebookNumFromConstant",
            data: "{}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output) {
                //
                var res = output.d;
                $("#txtSPORDEditOrder").val(res);
            }
        });
    }

    //Muthu Nivetha M :: 11Feb2020 :: Modified :: Changed loading F8 by F_SPORD.SqlId instead F_SPORD.Id due to empty in ID
    $("[id^=editARINVSpord_]").die("click").live("click", function () {
        SpordSqlID = $(this).attr("id").replace("editARINVSpord_", "").trim();
        var F_SpordId = 0;
        F_SpordId = $("#F_SpordId_" + SpordSqlID).html();
        F_SpordId = ((F_SpordId == undefined || F_SpordId == "") ? "0" : F_SpordId.trim());
        $("#DivSelectedSPORDID").html(F_SpordId);
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetSPORDEditDetails",
            data: "{'SpordID':'" + SpordSqlID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                debugger
                isSPORDeditclicked = true

                res = output.d;
                originalValues = JSON.parse(JSON.stringify(res[0]));
                if (isSPORDeditclicked = true) {
                    if ($("#ctl00_LoggedInUserType_PageSPORD").html().toLowerCase() == "sales person") {
                        if (SPORDCopyClicked == true) {
                            //if (res[0].Status == "Cc") {
                            res[0].Status = "Pe" //// Email:Esprit Dev Updates :: 15May19 :: Tasks
                            //res[0].Status = "PE"
                            //}
                            $("#SPORDAddEditDialog :input").prop("disabled", false);
                            J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.enable();
                            $("#SPORDAddEditDialog").css("pointer-events", "visible");
                        }
                        else {
                            $("#SPORDAddEditDialog :input").prop("disabled", true);
                            $("#SPORDAddEditDialog").css("pointer-events", "none");
                            J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.disable();
                            $("#txtSPORDEditPO").prop('disabled', false);
                            $("#txtSPORDEditPO").css("pointer-events", "visible");
                            $("#tdCarrier").css("pointer-events", "visible");
                            $("#tdShipto").css("pointer-events", "visible");
                            $("#tdCarrier :input").prop('disabled', false);
                            $("#tdShipto :input").prop('disabled', false);
                        }
                    }
                }
                $("#txtSPORDEditBreakdown").val(res[0].Message1);
                $("#hfSPORDEditBreakdown").val(res[0].Message1);
                $("#txtSPORDEditQty").val("");
                $("#txtSPORDEditQty").attr('placeholder', res[0].Boxes);
                $("#txtSPORDEditUnits").val("");
                $("#txtSPORDEditUnits").attr('placeholder', res[0].Units);
                $("#txtSPORDEditBunch").val("");
                $("#txtSPORDEditBunch").attr('placeholder', res[0].UnitsBunch);
                $("#txtSPORDEditFOB").val("");
                $("#txtSPORDEditFOB").attr('placeholder', res[0].Fob.toFixed(4));
                $("#txtSPORDEditOrder").val("");
                $("#txtSPORDEditOrder").attr('placeholder', res[0].Order);
                $("#txtSPORDEditShipDate").datepicker('setDate', Date.parse(res[0].ShipDate));
                $("#hfSPORDEditShipDate").val(Date.parse(res[0].ShipDate));
                $("#txtSPORDEditEndDate").datepicker('setDate', Date.parse(res[0].EndShipDate));
                $("#txtSPORDEditShipbogota").datepicker('setDate', Date.parse(res[0].CargoDate));
                $("#CargoDateDay").text(Date.parse(res[0].CargoDate).toLocaleString('en-us', { weekday: 'long' }).substr(0,7));
                $("#ShipDateDay").text(Date.parse(res[0].ShipDate).toLocaleString('en-us', { weekday: 'long' }).substr(0, 7));

                $("#txtSPORDEditEndShipbog").datepicker('setDate', Date.parse(res[0].EndCargoDate));
                $("#txtSPORDEditPO").val(res[0].PO);
                $("#txtSPORDEditBoxCode").val(res[0].BoxCode);
                $("#txtSPORDEditCost").val("");
                $("#txtSPORDEditCost").attr('placeholder', res[0].Cost.toFixed(4));
                $("#txtSPORDEditFarmPO").html(res[0].PODFlower);
                $("#txtSPORDEditCommentsG").val(res[0].COMMENTS);
                $("#txtSPORDEditComments").val(res[0].COMMENSINT);
                $("#txtSPORDEditUPC").val(res[0].UPC);
                $("#txtSPORDEditDateCode").val(res[0].DateCode);
                $("#txtSPORDEditUPCPrice").val(res[0].UPCPrice);
                $("#txtSPORDEditUPCDesc").val(res[0].UPCDESC);
                $("#txtSPORDEditSleeve").val(res[0].SLEEVE);
                $("#txtSPORDEditSleeveDesc").val(res[0].SLEEVEDESC);
                $("#txtSPORDEditFood").val(res[0].FOOD);
                $("#txtSPORDEditFoodDesc").val(res[0].FOODDESC);
                $("#txtSPORDEditPick").val(res[0].PICK);
                $("#txtSPORDEditPickDesc").val(res[0].PICKDESC);
                $("#txtSPORDEditSoldAs").val("");
                $("#txtSPORDEditSoldAs").attr('placeholder', res[0].SOLDAS);

                $("#hfSPORDEditUOM").val(res[0].UOM);
                //LoadUOM(function (callback) { });

                $("#hfSPORDEditFarm").val(res[0].Farm);
                //LoadFarmCode(function (callback) { });

                $("#hfSPORDEditFlower").val(res[0].Flower);
                $("#hfSPORDEditFlowerName").val(res[0].FlowerName);

                $("#txtSPORDFlower").val("[" + res[0].Flower + "]" + res[0].FlowerName);
                $("#hfSPORDFlower").val(res[0].Flower);

                $("#hfSPORDEditOrderType").val(res[0].Type);
                //LoadOrderTypesCode(function (callback) { });

                $("#hfSPORDEditStatus").val(res[0].Status);
                //LoadStatus(function (callback) { });
                
                $("#hfSPORDEditCarrier").val(res[0].Carrier);
                //LoadCarrierFilterDropdown(function (callback) { });

                $("#hfSPORDEditShipto").val(res[0].Shipto);
                //LoadShipto(function (callback) { });

                $("#hfSPORDEditCargoAgency").val(res[0].Agency);
                //LoadCargoAgency(function (callback) { });

                $("#hfSPORDEditWH").val(res[0].WH);
                //LoadUOM(function (callback) { });

                LoadWHCode(function (callback) { });
                LoadFarmCode(function (callback) { });
                LoadOrderTypesCode(function (callback) { });
                LoadStatus(function (callback) { });
                LoadCarrierFilterDropdown(function (callback) { });
                LoadShipto(function (callback) { });
                LoadCargoAgency(function (callback) { });
                LoadUOM(function (callback) { });


                if (SPORDCopyClicked == true) {

                    $("#txtSPORDEditID").text("(ID " + $("#DivSelectedSPORDSqlID").html() + ")");
                    var CopyToCustomer = (($("#txtSPORDCopyToCustomer").val() == "") ? $("#txtSPORDCopyToCustomer").attr('placeholder') : $("#txtSPORDCopyToCustomer").val());
                    $("#SPORDAddEditDialog").dialog('option', 'title', "Copy To Customer::" + CopyToCustomer);
                    $("#SPORDAddEditDialog").data("SPORDEditData", { SpordID: $("#DivSelectedSPORDSqlID").html(), CargoDate: res[0].CargoDate }).dialog("open");
                }
                else {
                    $("#txtSPORDEditID").text("(ID " + SpordSqlID + ")");
                    $("#SPORDAddEditDialog").dialog('option', 'title', "SPORD Edit");
                    $("#SPORDAddEditDialog").data("SPORDEditData", { SpordID: SpordSqlID, CargoDate: res[0].CargoDate }).dialog("open");
                }

            }
        });
    });


    $("[id^=deleteARINVSpord_]").die("click").live("click", function () {
        var hasPermission = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(73, 1).ToString()%>' == "Y" ? true : false;
        //alert(hasPermission);
        if (hasPermission == false) {
            $("#msgsavehtml").html("You don't have rights to delete SPORD details.");
            $("#msgbox-save").dialog("open");
        }
        else {
            SpordSqlID = $(this).attr("id").replace("deleteARINVSpord_", "").trim();
            var Type = $(this).attr("data-attr");
            $("#msgSPORDDelhtml").html("Are you sure you want to delete?");
            $("#msgbox-SPORDDel").data("inData", { SPORDID: SpordSqlID, Type: Type }).dialog("open");
        }
    });

    //Muthu Nivetha M :: 11Feb2020 :: Modified :: Changed deleting F8 by F_SPORD.SqlId instead F_SPORD.Id due to empty in ID
    $("#msgbox-SPORDDel").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {
                $(this).dialog("close");
                var tmpSpordSqlID = $("#msgbox-SPORDDel").data("inData")["SPORDID"]
                var Type = $("#msgbox-SPORDDel").data("inData")["Type"]
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/DeleteSPORDDetails",
                    data: "{'SpordSqlID':'" + tmpSpordSqlID + "','Type':'" + Type + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        res = output.d;
                        if (output.d == "success") {
                            $("#row" + tmpSpordSqlID).remove();
                            $("#DivSelectedSPORDSqlID").html("");
                            //$("#fgrdARINVSpord").flexReload({ url: '/url/for/refresh' });
                            $("#msgbox-SPORDDel").dialog("close");
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

    $("#SPORDAddEditDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "SPORD Add/Edit",
        modal: true,
        //closeOnEscape: false,
        width: 850,
        //height:550,
        buttons: {
            Duplicate: {
                text: 'Save as Duplicate',
                click: function () {
                    debugger;
                    isDuplicateSPORD = true;
                    if (!isDateValidatedForF8Save) {
                        validateForCargoDate();
                    }
                    else { SaveUpdateF8(); }
                }
            },
            SingleF8LogF7: {
                class: 'leftButtonSingleF8LogF7',
                text: 'History',
                click: function () {
                    debugger;
                    //isDuplicateSPORD = true;
                    isFromSingleF8 = true;
                    LoadViewSPORDTransactionsGridForSelectedF8();
                }
            },
            Save: function () {
                debugger;
                isDuplicateSPORD = false;
                var hasPermission = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(73, 1).ToString()%>' == "Y" ? true : false;
                var Status = originalValues.Status;
                //var Shipto = originalValues.Shipto;
                //var NewShipto = (($("#lstSPORDEditShipto").val().trim() == "") ? '0' : $("#lstSPORDEditShipto").val());
                ////alert(Status);
                ////alert(Shipto);
                ////alert(NewShipto);



                //if (hasPermission == false && parseInt(SpordSqlID) != 0 && Status != 'Pe' && Shipto != NewShipto) {
                //    Alert("Shipto has been changed,  only this value it will be updated!!")
                //    updateShiptoForConfirmedOrder()
                //    return;
                //} 

                if (hasPermission == false && parseInt(SpordSqlID) != 0 && Status != 'Pe') {
                    $("#msgsavehtml").html("This order has been purchased already, Buyer needs to make the changes on the PO itself");
                    $("#msgbox-save").dialog("open");
                }else if(!isDateValidatedForF8Save) {
                    validateForCargoDate();
                }
                else { SaveUpdateF8(); }



        },
        Close: function () {
            $(this).dialog("close");
        },
    },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Duplicate')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('History')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');

            $("#SPORDAddEditDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')")[0].disabled = false;
            IsAddEditShortcutKeyClick = false;/*activated with false to this flag, When ADD/EDIT dialog opens to save the records*/
            LoadDefaultWarehouse();
            //if ($("#ctl00_LoggedInUserType_PageSPORD").html().toLowerCase() == "employee" && isSPORDeditclicked == false) { //Employee usertype and add clicked
            //    if (IsEmployeeFirstOrder == false) { /*First order for Employee usertype :: empty the Order field */
            //        $("#txtSPORDEditOrder").val("");
            //        $("#txtSPORDEditOrder").attr("placeholder","");
            //        EmployeeOrderNo = "";
            //    }
            //    else {
            //        $("#txtSPORDEditOrder").val(EmployeeOrderNo);
            //        $("#txtSPORDEditOrder").attr("placeholder", EmployeeOrderNo);
            //    }
            //}
            //$("#lstSPORDEditFarm")[0].selectize.focus();
            //$("#hfSPORDEditFlower").focus();

            if (SpordSqlID != "" && SpordSqlID != "0") {
                $("#txtSPORDEditQty").focus();
                $('.ui-dialog-buttonpane button:contains("Duplicate")').button().show();
                $('.ui-dialog-buttonpane button:contains("History")').button().show();
            }
            else {
                $('.ui-dialog-buttonpane button:contains("Duplicate")').button().hide();
                $('.ui-dialog-buttonpane button:contains("History")').button().hide();
                ////$("#lstSPORDEditFarm")[0].selectize.focus();
                //if (J1_10($("#lstSPORDEditFarm")).selectize()[0].value != "") {
                //    $("#txtSPORDFlower").focus().select();
                //}
                //else {
                //    // $("#lstSPORDEditFarm")[0].selectize.focus();
                //}
                $("#lstSPORDEditUOM").val("QB");
                LoadDefaultOrderType();
                LoadDefaultStatus();
                LoadDefaultWH();
                var isFromF8Price = "";
                isFromF8Price = $("#SPORDAddEditDialog").data("inData")["isFrom"];
                if (isFromF8Price != undefined) {
                    if (isFromF8Price.toString().toLowerCase() == "F8Price".toLowerCase()) {
                        $("#txtSPORDEditQty").focus().select();
                    }
                    else {
                        $("#txtSPORDFlower").focus().select();
                    }
                }
                else {
                    $("#txtSPORDFlower").focus().select();
                }
            }
            if ($("#SPORDPriceDialog").dialog('isOpen') == true) {
                $("#SPORDPriceDialog").dialog("close");
            }

        },
        close: function () {
            isSPORDeditclicked = false;
            SPORDCopyClicked = false;
            isPriceClicked = false;
        }
    });
    function LoadDefaultWarehouse() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseListByUser',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    debugger;
                    $('#lstSPORDEditWH').empty();
                    var warehouse = output.d;
                    //$('#lstSPORDEditWH').append('<option value="0">Select Warehouse</option>');
                    for (var i in warehouse) {
                        var wh = warehouse[i];
                        $('#lstSPORDEditWH').append('<option value="' + wh.WH + '">' + wh.WH + ' - ' + wh.Name + '</option>');
                    }
                }
            }
        });
    }
    function SaveUpdateF8() {
        debugger
        if (SPORDCopyClicked == true) {
            var Customer = (($("#txtSPORDCopyToCustomer").val() == "") ? $("#txtSPORDCopyToCustomer").attr('placeholder') : $("#txtSPORDCopyToCustomer").val());
            SpordSqlID = 0 //$("#DivSelectedSPORDSqlID").html();
        }
        else {
            var Customer = $("#ctl00_DivCurrentCustomer_SPORD").html();
        }
        //if ($("#lstSPORDEditFarm").val().trim() == "") {
        //    $("#msgSPORDhtml").html("Please select Farm");
        //    $("#msgbox-SPORD").dialog("open");
        //    $("#txtSPORDFarm").focus();
        //    IsAddEditShortcutKeyClick = false;
        //    return;
        //}
        var Farm = $("#hfSPORDEditFarm").val();
        var Flower = $("#hfSPORDEditFlower").val();
        var FlowerName = $("#hfSPORDEditFlowerName").val()
        if (Flower == "" || $("#txtSPORDFlower").val().trim() == "") {
            $("#msgSPORDhtml").html("Please select Flower");
            $("#msgbox-SPORD").data("inData", { LastFocusId: "txtSPORDFlower" }).dialog("open");
            $("#msgbox-SPORD").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
            IsAddEditShortcutKeyClick = false;
            return;
        }
        var BreakDown = $("#txtSPORDEditBreakdown").val();
        var Qty = (($("#txtSPORDEditQty").val() == "") ? $("#txtSPORDEditQty").attr('placeholder') : $("#txtSPORDEditQty").val());
        if (Qty == "") {
            if (isSPORDeditclicked == false) {  //for add dialog qty value took from textbox value and show msg for empty textboxes
                $("#msgSPORDhtml").html("Please enter Qty");
                $("#msgbox-SPORD").data("inData", { LastFocusId: "txtSPORDEditQty" }).dialog("open");
                $("#msgbox-SPORD").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
                IsAddEditShortcutKeyClick = false;
                return;
            }
        }
        debugger
        var UOM = "";
        UOM = $("#lstSPORDEditUOM").val();
        if (UOM != "") {
            if (UOM.trim() == "" || UOM.trim().toLowerCase() == "select".toLowerCase() || parseInt(UOM.trim()) == parseInt(0)) {
                $("#msgSPORDhtml").html("Please select UOM");
                $("#msgbox-SPORD").data("inData", { LastFocusId: "lstSPORDEditUOM" }).dialog("open");
                $("#msgbox-SPORD").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
                IsAddEditShortcutKeyClick = false;
                return;
            }
        }
        else if (UOM == "") {
            $("#msgSPORDhtml").html("Please select UOM");
            $("#msgbox-SPORD").data("inData", { LastFocusId: "lstSPORDEditUOM" }).dialog("open");
            $("#msgbox-SPORD").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
            IsAddEditShortcutKeyClick = false;
            return;
        }

        var Units = (($("#txtSPORDEditUnits").val() == "") ? $("#txtSPORDEditUnits").attr('placeholder') : $("#txtSPORDEditUnits").val());
        var Bunch = (($("#txtSPORDEditBunch").val() == "") ? $("#txtSPORDEditBunch").attr('placeholder') : $("#txtSPORDEditBunch").val());
        var FOB = (($("#txtSPORDEditFOB").val() == "") ? $("#txtSPORDEditFOB").attr('placeholder') : $("#txtSPORDEditFOB").val());
        var Type = $("#hfSPORDEditOrderType").val().toUpperCase();
        var Status = (isDuplicateSPORD ? "Pe" : $("#lstSPORDEditStatus").val());
        var Order = (($("#txtSPORDEditOrder").val() == "") ? $("#txtSPORDEditOrder").attr('placeholder') : $("#txtSPORDEditOrder").val());
        //if (Farm == "WWW") {
        //    if (Type == "S") {
        //        $("#msgSPORDhtml").html("Please set the type as P");
        //        $("#msgbox-SPORD").data("inData", { LastFocusId: "txtSPORDEditType" }).dialog("open");
        //        $("#msgbox-SPORD").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
        //        IsAddEditShortcutKeyClick = false;
        //        return;
        //    }
        //    Status = "Co";
        //}
        var hasPermission = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(76, 1).ToString()%>' == "Y" ? true : false;
        //alert(hasPermissionForStatus);
        if (!hasPermission && parseInt(SpordSqlID) == 0) {
            if (Status != "Pe") {
                Status = "Pe";
                $.MessageBox("You are only authorized to create orders as Pending!!!");
            }
        }
        if (Order == "") {
            $("#msgSPORDhtml").html("Please enter Order number...");
            $("#msgbox-SPORD").data("inData", { LastFocusId: "txtSPORDEditOrder" }).dialog("open");
            $("#msgbox-SPORD").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
            IsAddEditShortcutKeyClick = false;
            return;
        }
        if ($("#ctl00_LoggedInUserType_PageSPORD").html().toLowerCase() == "employee" && isSPORDeditclicked == false) {
            if (IsEmployeeFirstOrder == false) {
                IsEmployeeFirstOrder = true;
            }
            EmployeeOrderNo = Order;
        }
        debugger
        var ShipDate = $("#txtSPORDEditShipDate").val();
        var EndDate = $("#txtSPORDEditEndDate").val();
        var GrowerDate = $("#txtSPORDEditShipbogota").val();
        var EndGrowerDate = $("#txtSPORDEditEndShipbog").val();
        if ($("#tdEndShipDate").css("display") != "none") {
            if (new Date(ShipDate) > new Date(EndDate)) {
                $.MessageBox("End Date Should not be less than Start Date!!!!")
                IsAddEditShortcutKeyClick = false;
                return false;
            }
        }
        if ($("#tdEndCargoDate").css("display") != "none") {
            if (new Date(GrowerDate) > new Date(EndGrowerDate)) {
                $.MessageBox("End Date Should not be less than Start Date!!!!")
                IsAddEditShortcutKeyClick = false;
                return false;
            }
        }
        //if (new Date(ShipDate) < new Date(GrowerDate)) {
        //    $.MessageBox("Customer Shipdate Should not be less than Growerdate!!!!")
        //    IsAddEditShortcutKeyClick = true;
        //    return true;
        //}
        var GrowerDateFromDB = "", bitNewShip = "0";
        if (isSPORDeditclicked == true) {
            GrowerDateFromDB = $("#SPORDAddEditDialog").data("SPORDEditData")["CargoDate"].replace(/-/g, "/");
            bitNewShip = (GrowerDateFromDB == GrowerDate) ? "0" : "1";
        }
        var CustPO = $("#txtSPORDEditPO").val()
        var BoxCode = $("#txtSPORDEditBoxCode").val()
        var Cost = (($("#txtSPORDEditCost").val() == "") ? $("#txtSPORDEditCost").attr('placeholder') : $("#txtSPORDEditCost").val());
        var PODFlower = $("#txtSPORDEditFarmPO").val();
        var Carrier = $("#lstSPORDEditCarrier")[0].value
        var Shipto = (($("#lstSPORDEditShipto").val().trim() == "") ? '0' : $("#lstSPORDEditShipto").val());
        var CargoAgency = $("#lstSPORDEditCargoAgency").val();
        var CommentsG = $("#txtSPORDEditCommentsG").val();
        var Comments = $("#txtSPORDEditComments").val();
        var UPC = $("#txtSPORDEditUPC").val();
        var DateCode = $("#txtSPORDEditDateCode").val();
        var UPCPrice = $("#txtSPORDEditUPCPrice").val();
        var UPCDesc = $("#txtSPORDEditUPCDesc").val();
        var Sleeve = $("#txtSPORDEditSleeve").val();
        var SleeveDesc = $("#txtSPORDEditSleeveDesc").val();
        var Food = $("#txtSPORDEditFood").val()
        var FoodDesc = $("#txtSPORDEditFoodDesc").val();
        var Pick = $("#txtSPORDEditPick").val();
        var PickDesc = $("#txtSPORDEditPickDesc").val();
        var Warehouse = $("#lstSPORDEditWH").val();
        var soldas = $("#txtSPORDEditSoldAs").val();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/SaveSPORDDetails",
            data: "{'CopyThisRecordToAnotherCustomer':'" + SPORDCopyClicked + "','SpordSqlID':'" + SpordSqlID + "','Customer':" + Customer + ",'Farm':'" + Farm + "','Flower':'" + Flower + "','FlowerName':'" + FlowerName + "','BreakDown':'" + BreakDown + "','Qty':" + Qty + ",'UOM':'" + UOM + "','Units':" + Units + ",'Bunch':" + Bunch + ",'FOB':" + FOB + ",'Type':'" + Type + "','Status':'" + Status + "','Order':" + Order + ",'ShipDate':'" + ShipDate + "','EndDate':'" + EndDate + "','GrowerDate':'" + GrowerDate + "','EndGrowerDate':'" + EndGrowerDate + "','CustPO':'" + CustPO + "','BoxCode':'" + BoxCode + "','Cost':" + Cost + ",'PODFlower':'" + PODFlower + "','Carrier':'" + Carrier + "','Shipto':" + Shipto + ",'CargoAgency':'" + CargoAgency + "','CommentsG':'" + CommentsG + "','Comments':'" + Comments + "','UPC':'" + UPC + "','DateCode':'" + DateCode + "','UPCPrice':'" + UPCPrice + "','UPCDesc':'" + UPCDesc + "','Sleeve':'" + Sleeve + "','SleeveDesc':'" + SleeveDesc + "','Food':'" + Food + "','FoodDesc':'" + FoodDesc + "','Pick':'" + Pick + "','PickDesc':'" + PickDesc + "','Warehouse':'" + Warehouse + "','bitNewShip':'" + bitNewShip + "','CreateDuplicateRecord':" + isDuplicateSPORD + ",'SoldAs':'" + soldas + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#SPORDAddEditDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')")[0].disabled = true;
                //$("#SPORDAddEditDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Duplicate')")[0].disabled = true;
                //$("#SPORDAddEditDialog").siblings('.ui-dialog-buttonpane').find("button:contains('F7')")[0].disabled = true;
                var res = output.d;
                if (output.d != "error") {
                    SpordSqlID = output.d;
                    $("#SPORDAddEditDialog").dialog("close");
                    if (Customer == $("#ctl00_DivCurrentCustomer_SPORD").html()) {
                        //$("#fgrdARINVSpord").flexReload({ url: '/url/for/refresh' });
                        
                        var farm = $("#row" + SpordSqlID).children("td")[4];
                        $(farm).children().text(Farm);
                        var desription = $("#row" + SpordSqlID).children("td")[6];
                        $(desription).children().text(FlowerName);
                        var type = $("#row" + SpordSqlID).children("td")[7];
                        $(type).children().text(Type);
                        var status = $("#row" + SpordSqlID).children("td")[8];
                        $(status).children().text(Status);
                        var shipDate = $("#row" + SpordSqlID).children("td")[9];
                        $(shipDate).children().text(ShipDate);
                        var cargoDate = $("#row" + SpordSqlID).children("td")[10];
                        $(cargoDate).children().text(GrowerDate);
                        var qty = $("#row" + SpordSqlID).children("td")[11];
                        $(qty).children().text(Qty);
                        var uom = $("#row" + SpordSqlID).children("td")[12];
                        $(uom).children().text(UOM);
                        var unit = $("#row" + SpordSqlID).children("td")[13];
                        $(unit).children().text(Units);
                        var sellPrice = $("#row" + SpordSqlID).children("td")[15];
                        $(sellPrice).children().text(parseFloat(FOB).toFixed(4));
                        var farmCost = $("#row" + SpordSqlID).children("td")[16];
                        $(farmCost).children().text(parseFloat(Cost).toFixed(4));
                        var carrier = $("#row" + SpordSqlID).children("td")[17];
                        $(carrier).children().text(Carrier);
                        var shipto = $("#row" + SpordSqlID).children("td")[18];
                        $(shipto).children().text(Shipto);
                        var customerPO = $("#row" + SpordSqlID).children("td")[19];
                        $(customerPO).children().text(CustPO);
                        var boxCode = $("#row" + SpordSqlID).children("td")[20];
                        $(boxCode).children().text(BoxCode);
                        var upc = $("#row" + SpordSqlID).children("td")[21];
                        $(upc).children().text(UPC);
                        var dateCode = $("#row" + SpordSqlID).children("td")[22];
                        $(dateCode).children().text(DateCode);
                        var wh = $("#row" + SpordSqlID).children("td")[23];
                        $(wh).children().text(Warehouse);
                        var podFlower = $("#row" + SpordSqlID).children("td")[26];
                        $(podFlower).children().text(PODFlower);

                    }
                    if (SPORDCopyClicked == true) {
                        $("#msgSPORDhtml").html("Copied successfully to Customer:: " + Customer + "");
                    }
                    SPORDCopyClicked = false;
                    isDuplicateSPORD = false;
                    isDateValidatedForF8Save = false;
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    //Muthu Nivetha M :: 11Feb2020 :: Modified :: I need this to be a yes or no message
    function validateForCargoDate() {
        debugger
        //past date orders should not be accept
        var growerdatestring = $("#txtSPORDEditShipbogota").val().split('/');
        var newdatestring = new Date().toString("MM/dd/yyyy").split('/');
        var growerdate = new Date(growerdatestring[2], growerdatestring[0] - 1, growerdatestring[1]);
        var newdate = new Date(newdatestring[2], newdatestring[0] - 1, newdatestring[1]);
        if (growerdate < newdate && isSPORDeditclicked == false) {
            var tmpdate = new Date(newdate - 1);
            if (new Date(growerdate).toString("MM/dd/yyyy") == new Date(tmpdate).toString("MM/dd/yyyy")) {
                $("#msgSPORDCargoDatehtml").html("Are you sure you want to set cargo date to yesterday?");
            }
            else {
                $("#msgSPORDCargoDatehtml").html("Are you sure you want to set cargo date to " + new Date(growerdate).toString("MM/dd/yyyy") + "?");
            }
            $("#msgbox-SpordValidateCargoDate").dialog("open");
        }
        else {

            SaveUpdateF8();
        }
    }

    $("#msgbox-SpordValidateCargoDate").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {
                $(this).dialog("close");
                isDateValidatedForF8Save = true;
                SaveUpdateF8();
            },
            No: function () {
                $(this).dialog("close");
                IsAddEditShortcutKeyClick = false;
                $("#msgSPORDhtml").html("Orders doesnot accept for past date");
                $("#msgbox-SPORD").data("inData", { LastFocusId: "txtSPORDEditShipbogota" }).dialog("open");
                $("#msgbox-SPORD").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
                return;
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
        }
    });

    $("#PoqHistoryDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 550,
        width: 1100,
        title: 'Purchase History',
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

    function RefreshParticularRowOnSPORDFlexigrid(SPORDID) {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ReloadParcularRowOnSPORDFgrd',
            dataType: 'xml',
            contentType: "application/json; charset=utf-8",
            data: "{'Customer':'" + $("#ctl00_DivCurrentCustomer_SPORD").html() + "','SPORDID':'" + SPORDID + "'}",
            success: function (data) {

                var row_index = $("#row" + SPORDID).index();
                $("#row" + SPORDID).remove();
                //build new body
                var tbody = document.createElement('tbody');
                $("rows row", data).each
                    (
                        function () {
                            i++;

                            var tr = document.createElement('tr');
                            //if (i % 2 && p.striped) tr.className = 'erow';

                            if ($(this).attr('Class') == "trChecked")
                                tr.className = "trChecked";

                            var nid = $(this).attr('id');
                            if (nid) tr.id = 'row' + nid;

                            var styles = $(this).attr("style")
                            if (styles) tr.style.cssText = styles

                            var titles = $(this).attr("title")
                            if (titles) tr.title = titles;

                            nid = null;

                            //VEN::12-11-2015::For change row backgroud color and font color 
                            var bgvalue = $(this).attr('background-color');
                            if (bgvalue != "")
                                tr.style.backgroundColor = bgvalue;

                            var ftvalue = $(this).attr('color');
                            if (ftvalue != "")
                                tr.style.color = ftvalue;

                            var robj = this;

                            $('cell', this).each
                                (

                                    function () {

                                        var td = document.createElement('td');
                                        td.innerHTML = $(this).text();
                                        $(tr).append(td);
                                        td = null;
                                    }
                                );

                            if ($("#fgrdARINVSpord tr").length == 0) {
                                $("#fgrdARINVSpord").append(tr);
                            }
                            else if (row_index == 0) {

                                $("#fgrdARINVSpord tr").eq(row_index).before(tr);
                            }
                            else if (row_index == -1) {
                                $("#fgrdARINVSpord tr").eq(0).before(tr);
                            }
                            else {

                                $("#fgrdARINVSpord tr").eq(row_index - 1).after(tr);
                            }

                            tr = null;
                            robj = null;
                        }
                    );

                $('#fgrdARINVSpord #row' + SPORDID + ' td').each
                    (
                        function () {

                            var tdDiv = document.createElement('div');
                            var n = $('td', $(this).parent()).index(this);
                            var pth = $('#DivSPORDDialog th:eq(' + n + ')').get(0);

                            if (pth != null) {
                                //if (p.sortname == $(pth).attr('abbr') && p.sortname) {
                                //    this.className = 'sorted';
                                //}
                                $(tdDiv).css({ textAlign: pth.align, width: $('div:first', pth)[0].style.width });

                                if (pth.hide) $(this).css('display', 'none');

                            }

                            //if (p.nowrap == false) $(tdDiv).css('white-space', 'normal');

                            if (this.innerHTML == '') this.innerHTML = '&nbsp;';

                            //tdDiv.value = this.innerHTML; //store preprocess value
                            tdDiv.innerHTML = this.innerHTML;

                            var prnt = $(this).parent()[0];
                            var pid = false;
                            if (prnt.id) pid = prnt.id.substr(3);

                            if (pth != null) {
                                if (pth.process) pth.process(tdDiv, pid);
                            }

                            $(this).empty().append(tdDiv).removeAttr('width'); //wrap content

                            //add editable event here 'dblclick'

                        }
                    );

                if (SPORDCopyClicked == false) {
                    $("#DivSelectedSPORDSqlID").html(SPORDID.toString());
                }

                $("#fgrdARINVSpord [id^=row]").removeClass("trSelectedCheck");
                $("#fgrdARINVSpord #row" + SPORDID).addClass("trSelectedCheck");
            }

        });
    }

    /* Alert box :: for SPORD */
    $("#msgbox-SPORD").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
                var lastfocus = $("#msgbox-SPORD").data("inData")["LastFocusId"]
                if (lastfocus != undefined) {
                    switch (lastfocus) {
                        case "txtSPORDEditShipbogota":
                            $("#txtSPORDEditShipbogota").focus();
                            break;
                        case "txtSPORDEditQty":
                            $("#txtSPORDEditQty").focus();
                            break;
                        case "lstSPORDEditUOM":
                            $("#lstSPORDEditUOM").focus();
                            break;
                        case "txtSPORDEditOrder":
                            $("#txtSPORDEditOrder").focus();
                            break;
                        case "txtSPORDEditType":
                            $("#txtSPORDEditType").focus();
                            break;
                        case "txtSPORDPriceQTY":
                            $("#txtSPORDPriceQTY").focus();
                            break;
                        case "txtSPORDFlower":
                            $("#txtSPORDFlower").focus();
                            break;
                    }
                }
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    $("#btnSPORDStanding").die("click").live("click", function () {

        reloadspord("S");
    });

    $("#btnSPORDPrebooks").die("click").live("click", function () {
        reloadspord("P");
    });

    $("#btnSPORDBiWeek").die("click").live("click", function () {
        reloadspord("B");
    });

    $("#btnSPORDSeasonal").die("click").live("click", function () {
        reloadspord("V");
    });

    $("#btnSPORDDoubles").die("click").live("click", function () {
        Doubles();
    });

    $("#btnSPORDPrices").die("click").live("click", function () {
        //reloadspord("V");
        $("#OrderNewYN").html("N")
        var Customer = $("#ctl00_DivCurrentCustomer_SPORD").html();
        isPricelstExistForCust = false;
        LoadViewSPORDByPriceGrid(Customer);
    });

    //$("#btnSPORDEorders").die("click").live("click", function () {
    //    reloadspord("E");
    //});

    $("#btnSPORDInvoice").die("click").live("click", function () {
        F8CreateInvoice();
    });

    $("#btnSPORDSummary").die("click").live("click", function () {
        F8LoadBySummary();
    });

    $("#btnSPORDConfirmation").die("click").live("click", function () {
        F8GenerateConfirmationReport();
    });

    $("#btnSPORDALLorders").die("click").live("click", function () {
        reloadspord("");
    });

    var SPORDCopyClicked = false;
    $("#btnSPORDCopy").die("click").live("click", function () {
        SPORDCopyClicked = false;
        if ($("#DivSelectedSPORDSqlID").html() == "") {
            $.MessageBox("Please select a record to copy")
        }
        else {
            $("#txtSPORDCopyToCustomer").val("")
            $("#txtSPORDCopyToCustomer").attr("placeholder", "")
            $("#txtSPORDCopyToCustomer").attr("placeholder", $("#ctl00_DivCurrentCustomer_SPORD").html())
            $("#msgbox-SPORDCopyTo").dialog("open");
        }

    });

    $("#msgbox-SPORDCopyTo").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        title: 'Copy To',
        buttons: {
            Copy: function () {
                SPORDCopyClicked = true;
                var editSPORDID = $("#DivSelectedSPORDSqlID").html();
                //vinoth :: 24/Apr/2019 :: As per the discussion with Soumya via call on 23/Apr/2019 - Copy button click event was not triggered properly. Following line only commented 
                $("#editARINVSpord_" + editSPORDID).trigger("click");
                $("#msgbox-SPORDCopyTo").dialog("close");
                //$.ajax({
                //    type: "POST",
                //    url: 'BloomService.asmx/GetNextIDForTables',
                //    data: '{"TableName":"STORD" }',
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (output, status) {
                //        var NextSPORDID = parseInt(output.d);
                //        $("#DivSelectedSPORDID").html(NextSPORDID);
                //        $("#editARINVSpord_" + editSPORDID).trigger("click");
                //        $("#msgbox-SPORDCopyTo").dialog("close");
                //    }
                //});


            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Copy')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');

        }
    });


    $("#btnSPORDMove").die("click").live("click", function () {
        $("#txtSPORDCopyToCustomer").val("");
        $("#msgbox-SPORDMoveTo").dialog("open");
    });


    $("#msgbox-SPORDMoveTo").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        title: 'Copy To',
        buttons: {
            Move: function () {



            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Copy')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');

        }
    });

    //$("#txtSPORDEditType").keydown(function (e) {
    //    var keyenter = e.which;
    //    if ($(this).is(':focus') == true) {
    //        if (keyenter == 80)
    //            $(this).val("P")
    //        if (keyenter == 83)
    //            $(this).val("S")
    //        if (keyenter == 66)
    //            $(this).val("B")
    //        if (keyenter == 68)
    //            $(this).val("D")
    //    }
    //    if (keyenter != 66 && keyenter != 68 && keyenter != 13 && keyenter != 83 && keyenter != 80) {
    //        e.preventDefault();
    //    }
    //    //if (($(this).attr('id') == "txtSPORDEditType" && (key == 66 || key == 68 || key == 83 || key == 80))) {
    //    //    if (key == 80) {
    //    //        $(this).val("P");
    //    //    }
    //    //    else if (key == 83) {
    //    //        $(this).val("S");
    //    //    }
    //    //    else if (key == 66) {
    //    //        $(this).val("B");
    //    //    }
    //    //    else {
    //    //        $(this).val("D");
    //    //    }
    //    //}
    //});



    $("#txtSPORDEditType").on('keydown keyup keypress change', function (event) {

        var TYPE = $("#txtSPORDEditType").val().toUpperCase();
        //changecontrolsbasedontype(TYPE, event);
    });

    function changecontrolsbasedontype(TYPE, event) {
        if (TYPE == "P" || TYPE == "D") {
            debugger
            $("#tdEndShipDate").css({ display: "none" });
            $("#tdEndCargoDate").css({ display: "none" });
            $("#tdDiffDays").css({ display: "block" });
            $("#txtSPORDEditEndDate").datepicker('setDate', $("#txtSPORDEditShipDate").val());
            $("#txtSPORDEditEndShipbog").datepicker('setDate', $("#txtSPORDEditShipbogota").val());
            $("#txtSPORDEditPO").css('margin-top', '-2px');
        }
        else if (TYPE == "S" || TYPE == "B") {
            debugger
            $("#tdEndShipDate").css({ display: "block" });
            $("#tdEndCargoDate").css({ display: "block" });
            $("#tdDiffDays").css({ display: "none" });

            $("#txtSPORDEditPO").css('margin-top', '-3px');
            if (event.which == 13) {
                $("#txtSPORDEditEndDate").datepicker('setDate', $("#txtSPORDEditEndDate").val());
                $("#txtSPORDEditEndShipbog").datepicker('setDate', $("#txtSPORDEditEndShipbog").val());
            }
            else {
                $("#txtSPORDEditEndDate").datepicker('setDate', "12/31/2999");
                $("#txtSPORDEditEndShipbog").datepicker('setDate', "12/31/2999");
            }
        }
        else {
            $("#tdEndShipDate").css({ display: "block" });
            $("#tdEndCargoDate").css({ display: "block" });
            $("#txtSPORDEditPO").css('margin-top', '-3px');
        }
        $("#txtSPORDEditOrder").focus().select();
    }

    $("#lstSPORDEditUOM ").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {

            $("#txtSPORDEditUnits").focus();

            return false;
        }
    });

    $("#tdCarrier").keydown(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {

            if ($(".ShipToSection").css("display") == "none") {
                //$("#lstSPORDEditCargoAgency")[0].selectize.focus();
                $("#txtSPORDEditCommentsG").focus();
            }
            else {
                $("#lstSPORDEditShipto")[0].selectize.focus();

            }

            return false;
        }
    });

    $("#tdShipto").keydown(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#txtSPORDEditCommentsG").focus();
            return false;
        }
    });

    $("#txtSPORDEditCommentsG").keydown(function (e) {
        if (e.which == 13 && !e.shiftKey) {
            $("#txtSPORDEditComments").focus();
            return false;
        }
    })
    document.body.addEventListener('keydown', function (e) {
        var focused = document.activeElement;

        var zindex = [];
        var divname = [];
        for (i = 0; i < $(".ui-dialog:visible").length; i++) {
            var ss = $(".ui-dialog:visible")[i].style.zIndex
            zindex.push($(".ui-dialog:visible")[i].style.zIndex);
            divname.push($(".ui-dialog:visible")[i].lastChild.id);
        }
        var max = indexOfMax(zindex);

        if ($(".ui-dialog:visible")[max].lastChild.id == "DivSPORDDialog" && focused.className != "qsbox" || (e.metaKey || e.altKey) && (e.which == 90)) {//to check if focus on search textbox and clear shortcut key

            if (e.which == 65) {    //Click A - ADD
                if ($("#btnSPORDAdd").is(':hidden') == false)
                    $("#btnSPORDAdd").click();
            }

            if (e.which == 67) {//Click C
                $('#btnSPORDCopy').click();
            }

            if (e.which == 83) {//Click S
                if ($("#btnSPORDStanding").is(':hidden') == false)
                    $('#btnSPORDStanding').click();
            }

            if (e.which == 80) {//Click P
                if ($("#btnSPORDPrebooks").is(':hidden') == false)
                    $('#btnSPORDPrebooks').click();
            }

            //if (e.which == 69) {//Click E
            //    $('#btnSPORDEorders').click();
            //}

            if (e.which == 66) {//Click B
                if ($("#btnSPORDBiWeek").is(':hidden') == false)
                    $('#btnSPORDBiWeek').click();
            }

            if (e.which == 69) {//Click E
                if ($("#btnSPORDSeasonal").is(':hidden') == false)
                    $('#btnSPORDSeasonal').click();
            }

            if (e.which == 76) {//Click L
                if ($("#btnSPORDALLorders").is(':hidden') == false)
                    $("#btnSPORDALLorders").click();
            }

            if (e.which == 68) {//Click D
                $("#btnSPORDDoubles").click();
            }

            if (e.which == 82) {//Click R
                if ($("#btnSPORDPrices").is(':hidden') == false)
                    $("#btnSPORDPrices").click();
            }

            if (e.which == 73) {//Click I
                $("#btnSPORDInvoice").click();
            }

            if (e.which == 85) {//Click U
                if ($("#btnSPORDSummary").is(':hidden') == false)
                    $("#btnSPORDSummary").click();
            }

            if (e.which == 79) {//Click O
                if ($("#btnSPORDConfirmation").is(':hidden') == false)
                    $("#btnSPORDConfirmation").click();
            }

            else if ((e.metaKey || e.altKey) && (e.which == 90)) { // the ALT+Z key code
                $('#DivARINVSpord [value="Clear"]').click();
            }

        }
        if ($(".ui-dialog:visible")[max].lastChild.id == "DivViewSPORDByPriceDialog" && focused.className != "qsbox" || (e.metaKey || e.altKey) && (e.which == 90)) {
            if (e.which == 65) {    //Click A - ADD
                $("#btnSPORDPriceAdd").click();
            }
        }
        if ($('#SPORDAddEditDialog').dialog('isOpen')) {

            if ((e.metaKey || e.altKey) && e.which === 83) {//Click Alt+S
                if (IsAddEditShortcutKeyClick == false) {
                    IsAddEditShortcutKeyClick = true;
                    $("#SPORDAddEditDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").click();
                }
            }
        }
    });

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

    $("#txtSPORDFlower").autocomplete({
        source: function (request, response) {
            debugger;
            //var SearchBy = $("#chkByFlowerCodeDesc").is(":checked") ? "0" : "1";
            var SearchBy = "";
            var Farm = $("#lstSPORDEditFarm").val() != "" ? ($("#lstSPORDEditFarm").val().trim() != "" ? $("#hfSPORDEditFarm").val() : "") : "";
            //if (Farm == undefined) {
            //    $("#msgSPORDhtml").html("Please select Farm");
            //    return false;
            //}
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoCompleteInSPORD',
                data: "{'Searchtext': '" + request.term + "','Farm':'" + Farm + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    response($.map(data.d, function (flr) {
                        return {
                            label: "[" + flr.Flower.trim() + "] " + flr.Name,
                            Flower: flr.Flower,
                            Name: flr.Name,
                            CAT: flr.CAT,
                            Bunch: flr.BUNCH,
                            ColorCode: flr.ColorCode,
                            UOM: flr.UOM,
                            UNITS: flr.UNITS,
                            Soldas: flr.FType.SOLDAS
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

        },
        select: function (e, i) {
            debugger;
            $("#txtSPORDFlower").attr("placeholder", "");
            $("#lstSPORDEditUOM").val(i.item.UOM);
            $("#txtSPORDEditUnits").val(i.item.UNITS);
            $("#txtSPORDFlower").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
            $("#txtSPORDEditBreakdown").focus();
            $("#hfSPORDEditFlower").val(i.item.Flower.trim());
            $("#hfSPORDEditFlowerName").val(i.item.Name.trim());
            $("#txtSPORDEditBunch").val(i.item.Bunch);      //F8
            $("#txtSPORDEditSoldAs").val("")
            $("#txtSPORDEditSoldAs").attr('placeholder', i.item.Soldas);
            //$("#txtQuantityReceived").focus();
        },
        change: function (e, i) {
            debugger;
            if (i.item == null || i.item == undefined) {
                $("#txtSPORDFlower").val("");
                $("#hfSPORDEditFlower").val("");
                $("#hfSPORDEditFlowerName").val("");
                $("#txtInventoryFlower").focus();
                $("#txtSPORDEditBunch").val("0");
                $("#txtSPORDEditSoldAs").val("")
                $("#txtSPORDEditSoldAs").attr('placeholder', '');
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    //when changing the date carrier will also change by F_DELLS->DELLS information
    function ChangeCarrierSPORD(dateText) {
        var dateText = new Date($("#txtSPORDEditShipDate").val()).toString("MM/dd/yyyy");
        if (SpordSqlID == "0" || SpordSqlID == "") {
            var selectedDayNumber = new Date(dateText).getDay()
            // $("#lblShippingDay_Or1").html(dayNames[new Date(dateText).getDay()]);
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustomerTruckDays',
                data: '{"CustomerNo":"' + $("#ctl00_DivCurrentCustomer_SPORD").html() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    var TruckDays = output.d;
                    //alert(TruckDays.length);
                    if (TruckDays == '') {
                        $("#lstCARRIER_Or1").val("0");
                        return;
                    }


                    var CarrierDays = []
                    debugger
                    CarrierDays[0] = TruckDays.substr(18, 3); //Sunday
                    CarrierDays[1] = TruckDays.substr(0, 3);//Monday
                    CarrierDays[2] = TruckDays.substr(3, 3);//Tuesday
                    CarrierDays[3] = TruckDays.substr(6, 3);//Wednesday
                    CarrierDays[4] = TruckDays.substr(9, 3);//Thursday
                    CarrierDays[5] = TruckDays.substr(12, 3);//Friday
                    CarrierDays[6] = TruckDays.substr(15, 3);//Saturday
                    window.CarrierDaysList = CarrierDays;
                    console.log("selectedDayNumber: " + selectedDayNumber);
                    var dayCarrier = (CarrierDays[selectedDayNumber] ? CarrierDays[selectedDayNumber].replaceAll(' ', '') : "");
                    console.log("dayCarrier", dayCarrier);
                    //2021/09/18, 
                    J1_10($("#lstSPORDEditCarrier")).selectize()[0].selectize.setValue(dayCarrier);

                    CarrierChangeAutomatically = false;
                    //$("#lstCARRIER_Or1").focus();
                }

            });
        }
    }

    /*Clear textbox value when search by options change :: created by abinaya :: 28Aug2018 */
    //$("#chkByFlowerCodeDesc").change(function () {
    //    $("#txtSPORDFlower").val("");
    //    $("#txtSPORDFlower").focus();
    //});

    $("#tdStatus").keydown(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#txtSPORDEditOrder").focus();
            return false;
        }
    });

    /*F7:: Customer's call history :: Anitha :: 28Jan2019*/
    $("#btnSPORDTrans").die('click').live('click', function () {
        debugger;
        var Customer = $("#ctl00_DivCurrentCustomer_SPORD").html();
        isF8SingleTrans = false;
        F8SqlId = "0";
        LoadViewSPORDTransactionsGrid(Customer, isF8SingleTrans, F8SqlId);
    });

    function LoadViewSPORDTransactionsGrid(Customer, isviewtransbysingle, SpordSqlId) {
        var para = 'CustomerNo=' + Customer + '&isTransviewForSingleF8=' + isF8SingleTrans + '&SpordSqlIdForTrans=' + SpordSqlId + '&isTranscalledbyF8=' + true + '';
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

    function LoadOrderTypesCode(callback) {
        debugger;
        var length = $('#lstSPORDEditOrderType > option').length;
        var SearchOrderType = ($('#lstSPORDEditOrderType').val() == null || $('#lstSPORDEditOrderType').val() == "null" || $('#lstSPORDEditOrderType').val() == undefined ? "" : $('#lstSPORDEditOrderType').val().trim());
        if (length <= 0) {
            $(".YellowWarning").html("Loading order types... Please Wait <img style='display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetOrderTypesForAutoCompleteInSPORD',
                data: "{'Searchtext':'" + SearchOrderType + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstSPORDEditOrderType').empty();
                    var data = output.d;
                    for (var i in data) {
                        var odrtype = data[i];
                        if (odrtype.OrderTypeCode != "") {
                            $('#lstSPORDEditOrderType').append('<option value="' + odrtype.OrderTypeCode + '">[' + odrtype.OrderTypeCode + '] ' + odrtype.DESC + '</option>');
                        }
                    }
                    J1_10($("#lstSPORDEditOrderType")).selectize({
                        onChange: function () {
                            debugger;
                            if (isSPORDeditclicked == false && IsAddSPORDclicked == false && $("#lstSPORDEditOrderType")[0].value != "") {
                                setSelectedOrderType();
                            }
                            else if (isSPORDeditclicked && $("#lstSPORDEditOrderType")[0].value != "") {
                                setSelectedOrderType();
                            }
                            changecontrolsbasedontype($("#hfSPORDEditOrderType").val().trim(), event);

                        }
                    });
                    LoadDefaultOrderType();
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarning").hide();
                    callback(true)
                },
            });
        }
        else {
            debugger;
            J1_10($("#lstSPORDEditOrderType")).selectize()[0].selectize.setValue($("#hfSPORDEditOrderType").val().trim());
            changecontrolsbasedontype($("#hfSPORDEditOrderType").val().trim(), event);
            //$('#lstSPORDEditOrderType').val($("#hfSPORDEditOrderType").val());
            callback(true);
        }
    }
    function setSelectedOrderType() {
        debugger;
        var odrtype = $("#lstSPORDEditOrderType")[0].value;
        $("#hfSPORDEditOrderType").val(odrtype);
        try {
            // $("#txtSPORDEditOrder").focus().select();
        }
        catch (er) {
        }
    }
    function LoadDefaultOrderType() {
        debugger;
        var ordertypeval = "P";
        $("#hfSPORDEditOrderType").val(ordertypeval);
        J1_10($("#lstSPORDEditOrderType")).selectize()[0].selectize.setValue($("#hfSPORDEditOrderType").val().trim());
    }

    $("#lstSPORDEditOrderType").keydown(function (e) {
        debugger;
        var key = e.which;
        var isReadonly = $(this).attr('readonly');
        if (key == 40 || key == 13 || key == 9) { //up arrow
            if ($("#ctl00_LoggedInUserType").html().toLowerCase() == "sales person") {
                $("#txtSPORDEditOrder").focus();
            }
            else {
                J1_10($("#lstSPORDEditStatus")).selectize()[0].selectize.enable();
                // $("#lstSPORDEditStatus")[0].selectize.focus();
            }
            return;
        }
    });

    function LoadDefaultStatus() {
        debugger;
        var statusval = "Pe";
        $("#hfSPORDEditStatus").val((isSPORDeditclicked && ($("#hfSPORDEditStatus").val() != "" || $("#hfSPORDEditStatus").val() != undefined)) ? $("#hfSPORDEditStatus").val() : statusval);
        J1_10($("#lstSPORDEditStatus")).selectize()[0].selectize.setValue($("#hfSPORDEditStatus").val().trim());
    }

    function LoadWHCode(callback) {
        debugger;
        var length = $('#lstSPORDEditWH > option').length;
        var SearchOrderType = ($('#lstSPORDEditWH').val() == null || $('#lstSPORDEditWH').val() == "null" || $('#lstSPORDEditWH').val() == undefined ? "" : $('#lstSPORDEditWH').val().trim());
        if (length <= 0) {
            $(".YellowWarning").html("Loading warehouses... Please Wait <img style='display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarning").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetWarehouseList',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    $('#lstSPORDEditWH').empty();
                    var data = output.d;
                    data.sort(function (a, b) {
                        return parseFloat(a.WarehouseID) - parseFloat(b.WarehouseID);
                    });
                    for (var i in data) {
                        var WH = data[i];
                        if (WH.WH != "") {
                            $('#lstSPORDEditWH').append('<option value="' + WH.WH + '">' + WH.WH + ' - ' + WH.Name + '</option>');
                        }
                    }
                    LoadDefaultWH();
                    callback(true);
                },
            });
        }
        else {
            $('#lstSPORDEditWH').val($("#hfSPORDEditWH").val());
            callback(true);
        }
    }
    function setSelectedWH() {
        debugger;
        var odrtype = $("#lstSPORDEditWH")[0].value;
        $("#hfSPORDEditWH").val(odrtype);
        try {
            $("#SPORDAddEditDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
        }
        catch (er) {
        }
    }
    function LoadDefaultWH() {
        var WH = $("#lstSPORDEditWH option:first-child").val();
        //       $("#hfSPORDEditWH").val(WH);
        //       $('#lstSPORDEditWH').val($("#hfSPORDEditWH").val());
        //$("#hfSPORDEditWH").val(WH);
        $('#lstSPORDEditWH').val(WH);
    }

    $("#lstSPORDEditWH").keydown(function (e) {
        debugger;
        var key = e.which;
        var isReadonly = $(this).attr('readonly');
        if (key == 40 || key == 13 || key == 9) { //up arrow
            $(this).closest('div').next('div').find('button')[0];
            return;
        }
    });

    //$("#lstSPORDEditFarm").on('focusout keydown', function (e) {
    //    debugger;
    //    var key = e.which;
    //    var isReadonly = $(this).attr('readonly');
    //    if (key == 40 || key == 13 || key == 9) { //up arrow
    //        $("#txtSPORDFlower").focus();
    //        return;
    //    }
    //});

    function setUOMByFarm(callback) {
        debugger;
        if (parseInt(SpordSqlID) == parseInt(0)) {
            var Farm = $("#hfSPORDEditFarm").val();
            var getuom = [];
            getuom = UOMList.filter(obj => {
                return obj.FARM === Farm
            })
            $('#lstSPORDEditUOM').empty();
            var UOMdata = getuom;
            $('#lstSPORDEditUOM').append('<option value="0">Select</option>');
            for (var i in UOMdata) {
                var UOM = UOMdata[i];
                $('#lstSPORDEditUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM + '</option>');
            }
        }
        $("#txtSPORDFlower").focus().select();
        callback(true);
    }


    $("#txtSPORDHoldFrom").on('focusout', function (e) {
        debugger;
        var SelectedDate = Date.parse(e.target.value);
        //$("#txtSPORDHoldFrom").datepicker('setDate', isValidDate(Date.parse(SelectedDate)) ? Date.parse(SelectedDate) : new Date());
        $("#txtSPORDHoldFrom").val($.datepicker.formatDate('mm/dd/yy', new Date(isValidDate(Date.parse(SelectedDate)) ? SelectedDate : new Date())));
    });

    function LoadViewSPORDTransactionsGridForSelectedF8() {
        isF8SingleTrans = true;
        F8SqlId = $("#DivSelectedSPORDSqlID").html();
        LoadViewSPORDTransactionsGrid($("#ctl00_DivCurrentCustomer_SPORD").html(), isF8SingleTrans, F8SqlId);
    }

    //Region "SPORD PRICE fired"
    function LoadViewSPORDByPriceGrid(Customer) {
        debugger;
        $("#fgrdViewSPORDByPrice").flexigrid({
            url: 'BloomService.asmx/GetViewSPORDByPriceGrid',
            dataType: 'xml',
            colModel: [

                { display: '', name: 'Delete', width: 13, sortable: false, align: 'center' },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                { display: 'Cust#', name: 'Customer', width: 30, sortable: true, align: 'left', process: PriceForF8AddClick, hide: true },
                { display: 'Product', name: 'idproduct', width: 60, sortable: true, align: 'left', process: PriceForF8AddClick, hide: true },
                { display: 'Flower', name: 'Flower', width: 85, sortable: true, align: 'left', process: PriceForF8AddClick, hide: true },
                { display: 'Product Name', name: 'Name', width: 220, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: 'Quantity', name: 'Quantity', width: 50, sortable: true, align: 'right', process: PriceForF8AddClick },
                { display: 'Uom', name: 'Uom', width: 40, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: 'Units', name: 'units', width: 40, sortable: true, align: 'right', process: PriceForF8AddClick },
                { display: 'U/B', name: 'unitsperbunch', width: 30, sortable: true, align: 'right', title: 'Units Per Bunch', process: PriceForF8AddClick },
                { display: 'Price', name: 'Price', width: 65, sortable: true, align: 'right', process: PriceForF8AddClick },
                { display: 'Soldas', name: 'soldas', width: 35, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: 'UPC', name: 'UPC', width: 95, sortable: true, align: 'right', process: PriceForF8AddClick },
                { display: 'BoxCode', name: 'BoxCode', width: 95, sortable: true, align: 'right', process: PriceForF8AddClick },
                { display: 'GTIN', name: 'GTIN', width: 120, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: '', name: '', width: 5, sortable: true, align: 'left', process: PriceForF8AddClick, hide: true }
            ],
            searchitems: [
                { display: 'Cust#', name: 'Customer' },
                { display: 'BoxCode', name: 'BoxCode' },
            ],
            showTableToggleBtn: true,
            sortname: "ID",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "ID",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            params: [
                { name: 'Customer', value: (Customer == 'null' ? $("#CurrentCustomerNo").html() : Customer) },
                { name: 'ExportCSV', value: '' }
            ],
            height: $(window).height() - 180,
            width: (isPricelstExistForCust) ? "785" : "890",
            striped: true,
            onSuccess: function () {
                debugger;
                $("#fgrdViewSPORDByPrice tr:first").addClass("trSelectedCheck");
                $("#DivSelectedSPORDPriceID").html($("#fgrdViewSPORDByPrice tr:first").attr('id').replace('row', ''));

                var sel = jQuery("#fgrdViewSPORDByPrice tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#divViewSPORDByPrice #ExportCSV").show();
                    $("#btnSPORDBuild").hide()
                }
                else {
                    $("#btnSPORDBuild").show()
                }
                //For to show the error
                if ($("#fgrdViewSPORDByPrice tr#row-2").length > 0) {
                    $("#fgrdViewSPORDByPrice tr#row-2").hide();
                    $.MessageBox($("#fgrdViewSPORDByPrice tr#row-2")[0].innerText);
                    return false;
                }
                $('#fgrdViewSPORDByPrice #row0').addClass("TotalRows");
                debugger;
                if (!isPricelstExistForCust && ($("#DivViewSPORDByPriceDialog").dialog('isOpen') == true)) {
                    debugger;
                    changegridColByF8Price(true);
                }
                else {
                    changegridColByF8Price(false);
                }
                $("#divViewSPORDByPrice .flexigrid").css('width', isPricelstExistForCust ? '785px' : '890px');

            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS!!! Please try after some time..");
                }
            }
        });
        if (isPricelstExistForCust) {
            $("#divViewSPORDByPrice .sDiv").css('float', 'left').css('width', '545px').hide();
        }
        else {
            $("#divViewSPORDByPrice .sDiv").css('float', 'left').css('width', '545px').show();
        }
          var sel = jQuery("#fgrdViewSPORDByPrice tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#btnSPORDBuild").hide()
                }
                else {
                     $("#btnSPORDBuild").show()
                }
        $('#divViewSPORDByPrice .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#divViewSPORDByPrice .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#divViewSPORDByPrice .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#divViewSPORDByPrice .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
        
        $("#DivViewSPORDByPriceDialog").dialog("open");
    }


    $("#DivViewSPORDByPriceDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "View SPORD Price",
        width: 910,
        open: function (e) {
            $("#DivViewSPORDByPriceDialog").dialog('option', { 'title': 'Price List for Customer ::' + ($("#CurrentCustomerNo").html() == "" ? $("#ctl00_DivCustomerNo_OrderDetails").html() : $("#CurrentCustomerNo").html()), 'width': isPricelstExistForCust ? '810px' : '910px' });
            $("#fgrdViewSPORDByPrice").flexOptions({
                params: [{ name: 'Customer', value: ($("#CurrentCustomerNo").html() == "" ? $("#ctl00_DivCustomerNo_OrderDetails").html() : $("#CurrentCustomerNo").html()) },
                { name: 'ExportCSV', value: '' },
                ], query: "", newp: 1
            }).flexReload();
            var sel = jQuery("#fgrdViewSPORDByPrice tbody tr");
            var len = sel.length;
            debugger;
            if (len > 1) {
                 $("#btnSPORDBuild").hide()
            }
            else {
                 $("#btnSPORDBuild").show()
            }
            if (!isPricelstExistForCust && ($("#DivViewSPORDByPriceDialog").dialog('isOpen') == true)) {
                debugger;
                changegridColByF8Price(true);
            }
            else {
                changegridColByF8Price(false);
            }
            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdViewSPORDByPrice")[0].tabIndex = tabindex;
            $("#fgrdViewSPORDByPrice").focus();
        },
        close: function () {
            if (isPricelstExistForCust) {
                addForF8();
            }
            $("#btnSPORDPriceAdd").css("visibility", "hidden");
            $("#btnSPORDBuild").css("visibility", "hidden");
            $("#btnSPORDClose").css("visibility", "hidden");
            $("#tdSPORDPriceAdd").css("visibility", "hidden");
        }
    });

    $("#btnSPORDPriceAdd").die("click").live("click", function () {
        debugger
        clearSPORDPRICEDetails();
        isSPORDPriceeditclicked = false;
        $("#SPORDPriceDialog :input").prop("disabled", false);
        $("#SPORDPriceDialog").css("pointer-events", "visible");
        $("#SPORDPriceDialog").dialog('option', 'title', "SPORD PRICE Add");
        $("#SPORDPriceDialog").dialog("open");
    });
    $("#btnSPORDBuild").die("click").live("click", function () {
       debugger
         $.ajax({
            type: "POST",
            url: "BloomService.asmx/LoadPricingDetailsForSelectedCust",
            data: "{'SelectedCust':" + ($("#CurrentCustomerNo").html() == "" ? $("#ctl00_DivCustomerNo_OrderDetails").html() : $("#CurrentCustomerNo").html()) + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
             success: function (output, status) {
                 debugger
                $("#fgrdViewSPORDByPrice").flexOptions({
                params: [{ name: 'Customer', value:  $("#CurrentCustomerNo").html() },
                { name: 'ExportCSV', value: '' },
                ], query: "", newp: 1
            }).flexReload();
            }
        });
        
    });
    //$("#DivOrderNewPricingDetails").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    title: "Alert",
    //    width: 800,
    //    height: 580,
    //    modal: true,
    //    open: function () {
    //        debugger;
    //        var selectedcust = $("#CurrentCustomerNo").html();
    //        $("#fgrdOrderNewPricingDetails").flexOptions({ params: [{ name: 'SelectedCust', value: selectedcust }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
    //    }
    //});

    //$("#fgrdOrderNewPricingDetails").flexigrid({
    //    url: 'BloomService.asmx/LoadPricingDetailsForSelectedCust',
    //    dataType: 'xml',
    //    colModel: [
    //        { display: 'PRODUCT', name: 'FLOWER', width: 80, sortable: true, align: 'left' },
    //        { display: 'NAME', name: 'FLOWERNAME', width: 250, sortable: true, align: 'left' },
    //        { display: 'FARM', name: 'FARM', width: 35, sortable: true, align: 'left' },
    //        { display: 'DATE', name: 'DATE1', width: 50, sortable: true, align: 'left' },
    //        { display: 'BOXES', name: 'BOXES', width: 60, sortable: false, align: 'left' },
    //        { display: 'PRICE', name: 'PRICE', width: 50, sortable: false, align: 'right' },
    //        { display: 'COST', name: 'COST', width: 50, sortable: false, align: 'right' },
    //        { display: '%GPM', name: 'GPM', width: 60, sortable: true, align: 'right' },
    //        { display: 'INVOICE', name: 'INVOICE', width: 40, sortable: false, align: 'right', hide: true }
    //    ],
    //    searchitems: [
    //        { display: 'PRODUCT', name: 'FLOWER' },
    //        { display: 'NAME', name: 'FLOWERNAME' },
    //        { display: 'FARM', name: 'FARM' },
    //        { display: 'DATE', name: 'DATE1' },
    //        { display: '%GPM', name: 'GPM' }
    //    ],
    //    showTableToggleBtn: true,
    //    sortname: "Flower asc",
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
    //    width: 785,
    //    height: 450,
    //    striped: true,
    //    params: [
    //        { name: 'SelectedCust', value: $("#CurrentCustomerNo").html() },
    //        { name: 'ExportCSV', value: '' }
    //    ],
    //    onSuccess: function () {
    //        debugger
    //        var sel = jQuery("#fgrdOrderNewPricingDetails tbody tr");
    //        var len = sel.length;
    //        if (len > 1) {
    //            $("#DivOrderNewPricingDetails #ExportCSV").show();
    //        }

    //        // $('#fgrdOrderNewF3Details #row0').addClass("TotalRows");
    //        $("#DivOrderNewPricingDetails .sDiv").css('float', 'left').css('width', '542px');
    //        $('#DivOrderNewPricingDetails .pDiv').css('padding', '2px').css('border-left', '0px');
    //        $('#DivOrderNewPricingDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //        $("#DivOrderNewPricingDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //        $("#DivOrderNewPricingDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
    //    },
    //    onError: function (xhr, status, errorThrown) {
    //        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
    //            window.location.href = "Login.aspx";
    //        }
    //    }
    //});

    $("#btnSPORDClose").die("click").live("click", function () {
        debugger
         $("#DivViewSPORDByPriceDialog").dialog("close");
    });

    function clearSPORDPRICEDetails() {
        debugger
        $("#txtSPORDPriceFlower").val("");
        $("#hfSPORDPriceFlowerID").val("");
        $("#hfSPORDPriceFlower").val("");
        $("#hfSPORDPriceFlowerName").val("");
        $("#txtSPORDPriceQTY").val("");
        $("#txtSPORDPriceQTY").attr('placeholder', '');
        $("#txtSPORDPriceUnits").val("");
        $("#txtSPORDPriceUnits").attr('placeholder', '0');
        $("#txtSPORDPriceUnitsBunch").val("");
        $("#txtSPORDPriceUnitsBunch").attr('placeholder', '0');
        $("#txtSPORDPrice_Price").val("");
        $("#txtSPORDPrice_Price").attr('placeholder', '0.0000');
        $("#txtSPORDPriceSoldas").val("");
        $("#txtSPORDPriceUPC").val("");
        $("#txtSPORDPriceBoxCode").val("");
        $("#txtSPORDPriceGTIN").val("");
    }

    $("#SPORDPriceDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "SPORD PRICE Add",
        modal: true,
        //closeOnEscape: false,
        width: 650,
        buttons: {
            Save: function () {
                SaveUpdateSpordPrice();
            },
            Close: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            LoadPriceUOM(function (callback) { });
            //var cust = $("#ctl00_DivCurrentCustomer_SPORD").html()
            //$("#txtSPORDPriceCust").val(cust)
            $("#txtSPORDPriceFlower").focus();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

    $("#txtSPORDPriceFlower").autocomplete({
        source: function (request, response) {
            debugger;
            var Farm = "";
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoCompleteInSPORD',
                data: "{'Searchtext': '" + request.term + "','Farm':'" + Farm + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger
                    response($.map(data.d, function (flr) {
                        return {
                            label: "[" + flr.Flower.trim() + "] " + flr.Name,
                            Flower: flr.Flower,
                            Name: flr.Name,
                            ID: flr.ID,
                            CAT: flr.CAT,
                            Bunch: flr.BUNCH,
                            ColorCode: flr.ColorCode,
                            UOM: flr.UOM,
                            UNITS: flr.UNITS,
                            Soldas: flr.FType.SOLDAS
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

        },
        select: function (e, i) {
            debugger;
            $("#txtSPORDPriceFlower").attr("placeholder", "");
            $("#lstSPORDPriceUOM").val(i.item.UOM);
            $("#txtSPORDPriceUnits").val(i.item.UNITS);
            $("#txtSPORDPriceUnitsBunch").val(i.item.Bunch);
            $("#hfSPORDPriceFlowerID").val(i.item.ID);
            $("#txtSPORDPriceFlower").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
            $("#hfSPORDPriceFlower").val(i.item.Flower.trim());
            $("#hfSPORDPriceFlowerName").val(i.item.Name.trim());
            $("#txtSPORDPriceSoldas").val("")
            $("#txtSPORDPriceSoldas").attr('placeholder', i.item.Soldas);
        },
        change: function (e, i) {
            debugger;
            if (i.item == null || i.item == undefined) {
                $("#txtSPORDPriceFlower").val("");
                $("#hfSPORDPriceFlower").val("");
                $("#hfSPORDPriceFlowerName").val("");
                $("#txtSPORDPriceSoldas").val("")
                $("#txtSPORDPriceSoldas").attr('placeholder', '');
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    function LoadPriceUOM(callback) {
        debugger;
        var Farm = "";
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUOMForSPORD',
            data: "{'FarmCode':'" + Farm + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d != null) {
                    $('#lstSPORDPriceUOM').empty();
                    UOMList = [];
                    UOMList = output.d;
                    var UOMdata = output.d;
                    $('#lstSPORDPriceUOM').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstSPORDPriceUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM + '</option>');
                    }

                    if ($("#hfSPORDPriceUOM").val() != "" && $("#hfSPORDPriceUOM").val() != 0)
                        $('#lstSPORDPriceUOM').val($("#hfSPORDPriceUOM").val());
                    else
                        $("#hfSPORDPriceUOM").val("QB");
                }
                callback(true);
            }
        });
    }

    function SaveUpdateSpordPrice() {
        debugger
        if (isSPORDPriceeditclicked == true) {
            var SpordPriceID = SpordPID
        }
        else {
            var SpordPriceID = "0"
        }
        var PCustomer = $("#ctl00_DivCurrentCustomer_SPORD").html();
        var PFlower = $("#hfSPORDPriceFlowerID").val()
        if ($("#txtSPORDPriceFlower").val() == "") {
            $("#msgSPORDhtml").html("Please select Flower");
            $("#msgbox-SPORD").dialog("open");
            IsAddEditShortcutKeyClick = false;
            $("#txtSPORDPriceFlower").focus();
            return;
        }
        var PQTY = (($("#txtSPORDPriceQTY").val() == "") ? $("#txtSPORDPriceQTY").attr('placeholder') : $("#txtSPORDPriceQTY").val());
        if (PQTY == "") {
            $("#msgSPORDhtml").html("Please enter Qty");
            $("#msgbox-SPORD").data("inData", { LastFocusId: "txtSPORDPriceQTY" }).dialog("open");
            $("#msgbox-SPORD").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
            IsAddEditShortcutKeyClick = false;
            return;
        }
        var PUOM = $('#lstSPORDPriceUOM').val();
        var PUnits = (($("#txtSPORDPriceUnits").val() == "") ? $("#txtSPORDPriceUnits").attr('placeholder') : $("#txtSPORDPriceUnits").val());
        var PBunch = (($("#txtSPORDPriceUnitsBunch").val() == "") ? $("#txtSPORDPriceUnitsBunch").attr('placeholder') : $("#txtSPORDPriceUnitsBunch").val());
        var PSoldas = $("#txtSPORDPriceSoldas").val();
        var PPrice = (($("#txtSPORDPrice_Price").val() == "") ? $("#txtSPORDPrice_Price").attr('placeholder') : $("#txtSPORDPrice_Price").val());
        var PUPC = $("#txtSPORDPriceUPC").val();
        var PBoxcode = $("#txtSPORDPriceBoxCode").val();
        var PGTIN = $("#txtSPORDPriceGTIN").val();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/SaveSPORDPRICEDetails",
            data: "{'SpordPriceID':'" + SpordPriceID + "','PCustomer':" + PCustomer + ",'PFlower':" + PFlower + ",'PQTY':" + PQTY + ",'PUOM':'" + PUOM + "','PUnits':" + PUnits + ",'PBunch':" + PBunch + ",'PSoldas':'" + PSoldas + "','PPrice':" + PPrice + ",'PUPC':'" + PUPC + "','PBoxcode':'" + PBoxcode + "','PGTIN':'" + PGTIN + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger
                var res = output.d;
                if (output.d != "error") {
                    $("#SPORDPriceDialog").dialog("close");
                    $("#fgrdViewSPORDByPrice").flexReload({ url: '/url/for/refresh' });
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    $("[id^=F8PriceEdit_]").die("click").live("click", function () {
        debugger
        SpordPID = $(this).attr("id").replace("F8PriceEdit_", "").trim();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetSPORDEditPriceDetails",
            data: "{'SpordID':'" + SpordPID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                debugger
                isSPORDPriceeditclicked = true;
                res = output.d;
                $("#txtSPORDPriceCust").val(res[0].Customer);
                $("#txtSPORDPriceQTY").val(res[0].Quantity);
                $("#txtSPORDPriceUnits").val(res[0].units);
                $("#txtSPORDPriceUnitsBunch").val(res[0].unitsperbunch);
                $("#txtSPORDPrice_Price").val(res[0].Price);
                $("#txtSPORDPriceSoldas").val(res[0].soldas);
                $("#txtSPORDPriceUPC").val(res[0].UPC);
                $("#txtSPORDPriceBoxCode").val(res[0].BoxCode);
                $("#txtSPORDPriceGTIN").val(res[0].GTIN);
                $("#hfSPORDPriceFlower").val(res[0].FlowerDetails.Flower);
                $("#hfSPORDPriceFlowerName").val(res[0].FlowerDetails.Name);
                $("#hfSPORDPriceFlowerID").val(res[0].idproduct)
                $("#txtSPORDPriceFlower").val("[" + res[0].FlowerDetails.Flower + "]" + res[0].FlowerDetails.Name);
                $("#hfSPORDPriceUOM").val(res[0].Uom);
                LoadPriceUOM(function (callback) { });
                $("#SPORDPriceDialog").dialog('option', 'title', "SPORD Price Edit");
                $("#SPORDPriceDialog").data("SPORDEditData", { SpordID: SpordSqlID }).dialog("open");
            }
        });
    });

    $("[id^=F8PriceDelete_]").die("click").live("click", function () {
        if ($("#ctl00_LoggedInUserType").html().toLowerCase() == "sales person") {
            $("#msgsavehtml").html("You don't have rights to delete SPORD details.");
            $("#msgbox-save").dialog("open");
        }
        else {
            PSpordID = $(this).attr("id").replace("F8PriceDelete_", "").trim();
            $("#SPORDPRICEDel").html("Are you sure you want to delete?");
            $("#msgbox-SPORDPRICEDel").data("inData", { PSPORDID: PSpordID }).dialog("open");
        }
    });

    $("#msgbox-SPORDPRICEDel").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {
                $(this).dialog("close");
                var DELSpordID = $("#msgbox-SPORDPRICEDel").data("inData")["PSPORDID"]
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/DeleteSPORDPRICEDetails",
                    data: "{'SpordID':'" + DELSpordID + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        res = output.d;
                        if (output.d == "success") {

                            $("#row" + DELSpordID).remove();
                            // $("#DivSelectedSPORDID").html("");
                            $("#fgrdViewSPORDByPrice").flexReload({ url: '/url/for/refresh' });
                            $("#msgbox-SPORDPRICEDel").dialog("close");
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

    function addF8() {
        debugger;
        var cust = $("#ctl00_DivCurrentCustomer_SPORD").html();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetPriceListForCust",
            data: "{'customer':'" + cust + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                res = output.d;
                if (res != parseInt(0)) {
                    addForF8Price();
                }
                else {
                    addForF8();
                }
            }
        });
    }

    function addForF8Price() {
        debugger;
        var cust = $("#ctl00_DivCurrentCustomer_SPORD").html();
        isPricelstExistForCust = true;
        LoadViewSPORDByPriceGrid(cust);
    }

    function PriceForF8AddClick(celDiv, id) {
        $(celDiv).click(function () {
            debugger;

            // reset the date input on startup
            var sPORDEditShipDate = new Date();
            sPORDEditShipDate.setDate(sPORDEditShipDate.getDate() + 3);
            //$("#txtSPORDEditShipDate").val(Shipdatetocust.toLocaleDateString());
            $("#txtSPORDEditShipDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true
            }).datepicker("setDate", sPORDEditShipDate);

            var txtSPORDEditShipbogotaDate = new Date(Shipdatetocust.toString());
            txtSPORDEditShipbogotaDate.setDate(txtSPORDEditShipbogotaDate.getDate() - 3);
            $("#txtSPORDEditShipbogota").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                selectOtherMonths: true
            }).datepicker("setDate", txtSPORDEditShipbogotaDate);

            var isSPOrdrDialogOpened = false;

            $("#fgrdViewSPORDByPrice [id^=row]").removeClass("trSelectedCheck");
            $("#fgrdViewSPORDByPrice #row" + id).addClass("trSelectedCheck");
            if (isPricelstExistForCust) {
                if (isPriceClicked == false) {
                    isPriceClicked = true;
                    F8PriceIds.push(id);
                    SpordSqlID = "0";
                    var customerF8 = $("#F8PriceCust_" + id).html();
                    var idproductF8 = $("#F8PriceProdId_" + id).html();
                    var FlowerF8 = $("#F8PriceProdCode_" + id).html();
                    GetFarmListByFlower_SPORD(FlowerF8);
                    var NameF8 = $("#F8PriceProdName_" + id).html();
                    var QuantityF8 = $("#F8PriceQty_" + id).html();
                    var UomF8 = $("#F8PriceUOM_" + id).html();
                    var unitsF8 = $("#F8PriceUnits_" + id).html();
                    var unitsperbunchF8 = $("#F8PriceUBunch_" + id).html();
                    var PriceF8 = $("#F8PricePrice_" + id).html();
                    var soldasF8 = $("#F8PriceSoldas_" + id).html();
                    var UPCF8 = $("#F8PriceUPC_" + id).html();
                    var BoxCodeF8 = $("#F8PriceBoxCode_" + id).html();
                    var GTINF8 = $("#F8PriceGTIN_" + id).html();

                    if ($("#ctl00_LoggedInUserType_PageSPORD").html().toLowerCase() == "sales person") {
                        if (SPORDCopyClicked == true) {
                            res[0].Status = "Pe" //// Email:Esprit Dev Updates :: 15May19 :: Tasks
                            $("#SPORDAddEditDialog :input").prop("disabled", false);
                            J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.enable();
                            $("#SPORDAddEditDialog").css("pointer-events", "visible");
                        }
                        else {
                            $("#SPORDAddEditDialog :input").prop("disabled", true);
                            $("#SPORDAddEditDialog").css("pointer-events", "none");
                            J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.disable();
                            $("#txtSPORDEditPO").prop('disabled', false);
                            $("#txtSPORDEditPO").css("pointer-events", "visible");
                            $("#tdCarrier").css("pointer-events", "visible");
                            $("#tdShipto").css("pointer-events", "visible");
                            $("#tdCarrier :input").prop('disabled', false);
                            $("#tdShipto :input").prop('disabled', false);
                        }
                    }

                    $("#SPORDAddEditDialog :input").prop("disabled", false);
                    J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.enable();
                    J1_10($("#lstSPORDEditStatus")).selectize()[0].selectize.enable();
                    $("#SPORDAddEditDialog").css("pointer-events", "visible");
                    IsAddSPORDclicked = true;

                    if (loadingdropdownonSPORDCompleted == false) {
                        $("#msghtml-SPORDControlsLoading").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />");
                        $("#msgbox-SPORDControlsLoading").dialog("open");
                    }
                    else {
                        clearSPORDDetails();
                        SpordSqlID = "0";
                    }

                    $("#txtSPORDEditQty").attr('placeholder', QuantityF8);
                    $("#txtSPORDEditUnits").attr('placeholder', unitsF8);
                    $("#txtSPORDEditBunch").attr('placeholder', unitsperbunchF8);
                    $("#txtSPORDEditFOB").attr('placeholder', parseFloat(PriceF8).toFixed(4));
                    $("#txtSPORDEditBoxCode").val(BoxCodeF8);
                    //$("#txtSPORDEditFarmPO").html(FlowerF8);
                    $("#txtSPORDEditUPC").val(UPCF8);
                    $("#txtSPORDEditSoldAs").val(soldasF8);

                    $("#hfSPORDEditUOM").val(UomF8);
                    LoadUOM(function (callback) { });

                    $("#hfSPORDEditFlower").val(FlowerF8);
                    $("#hfSPORDEditFlowerName").val(NameF8);

                    $("#txtSPORDFlower").val("[" + FlowerF8 + "]" + NameF8);
                    $("#hfSPORDFlower").val(FlowerF8);

                    $("#txtSPORDEditID").text("(ID " + SpordSqlID + ")");
                    isPricelstExistForCust = false;

                    isSPOrdrDialogOpened = true

                    $("#DivViewSPORDByPriceDialog").dialog('close');
                    $("#SPORDAddEditDialog").dialog('option', 'title', "SPORD Add");
                    $("#SPORDAddEditDialog").data("inData", ({ isFrom: "F8Price" })).dialog("open");
                }
            }


            // if (!isSPOrdrDialogOpened || !isPricelstExistForCust) {
            if ($("#SPORDAddEditDialog").length === 0 || !$("#SPORDAddEditDialog").dialog('isOpen')) {
                $("#hdnPageSPORDSelectedFlowerId").val(id)
                $("#AddOrderDetailFromFutureDialog_SPORD").dialog("open");
                $("#AddOrderDetailFromFutureDialog_SPORD").dialog('option', 'title', 'Add Future Product');
            }
            
        })
    }

    function GetFarmListByFlower_SPORD(flower) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmListByFlower',
            data: "{'Flower':'"+flower+"'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFarm_FutureOrderDetail_SPORD').empty();
                var Typedata = output.d;
                $('#lstFarm_FutureOrderDetail_SPORD').append('<option value="">Select</option>');
                $('#lstFarm_FutureOrderDetail_SPORD').append(Typedata);
                //LoadUOM();
            }
        });
    }
     $("#AddOrderDetailFromFutureDialog_SPORD").dialog({
        autoOpen: false,
        resizable: false,
        title: 'Add Future Product',
        width: 520,
        modal: true,
        buttons: {
            SAVE: function () {
                SaveFutureOrderDetail_SPORD();
                $("#ctl00_DivShortKeyFlag").html("0");
            },
            CLOSE: function () {
                $("#txtFlower_FutureOrderDetail").val("");
                $("#lstFarm_FutureOrderDetail").val("");
                $("#hfFarm_FutureOrderDetail").val("");
                $("#txtQty_FutureOrderDetail").val(0);
                $("#lstUOM_FutureOrderDetail").val("");
                $("#txtUnitsPerBox_FutureOrderDetail").val(0);
                $("#txtPrice_FutureOrderDetail").val(0);
                $("#txtCost_FutureOrderDetail").val(0);
                $("#txtGPM_FutureOrderDetail").val(0);
                $("#txtBoxCode_FutureOrderDetail").val("");
                $("#txtUPC_FutureOrderDetail").val("");
                $("#txtUPCPRICE_FutureOrderDetail").val("");
                $("#txtDateCode_FutureOrderDetail").val("");
                $("#txtNotes_FutureOrderDetail").val("");
                $("#trPODetail").css('display', 'none');
                $("#ctl00_DivShortKeyFlag").html("0");

                $("#ctl00_DivPODflower_OrderSave").html("");
                $("#lblPODflower_FutureOrder").html("");
                $("#lblPODate_FutureOrder").html("");
                $("#lblPOBoxnum_FutureOrder").html("");
                $("#lblShipdate_FutureOrder").html("");
                $("#trPODetail").css('display', 'none');
                $("#ctl00_DivHeight").html("500");
                $("#ctl00_DivOrderDetailID_OrderSave").html("0");

                $("#txtFlower_FutureOrderDetail").removeAttr("disabled");
                $("#txtUnitsPerBox_FutureOrderDetail").removeAttr("disabled");
                $("#txtQty_FutureOrderDetail").removeAttr("disabled");
                $("#lstFarm_FutureOrderDetail").removeAttr("disabled");
                $("#lstUOM_FutureOrderDetail").removeAttr("disabled");
                $("#txtNotes_FutureOrderDetail").removeAttr("disabled");

                $("#AddOrderDetailFromFutureDialog_SPORD").dialog("close");
            },
        },
        open: function () {
            debugger;
            //LoadFarmList();
            $(".ui-dialog-buttonpane button:contains('SAVE')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
            LoadUOM_SPORD();
            $("#hfFlower_FutureOrderDetail_SPORD").val($("#F8PriceProdCode_" + $("#hdnPageSPORDSelectedFlowerId").val()).html());
            GetFarmListByFlower_SPORD($("#hfFlower_FutureOrderDetail_SPORD").val());
            $("#hfFlowerName_FutureOrderDetail_SPORD").val($("#F8PriceProdName_" + $("#hdnPageSPORDSelectedFlowerId").val()).html());
            $("#txtFlower_FutureOrderDetail_SPORD").val("[" + $("#F8PriceProdCode_" + $("#hdnPageSPORDSelectedFlowerId").val()).html() + "] " + $("#F8PriceProdName_" + $("#hdnPageSPORDSelectedFlowerId").val()).html());
            $("#txtQty_FutureOrderDetail_SPORD").val($("#F8PriceQty_" + $("#hdnPageSPORDSelectedFlowerId").val()).html());
            $("#lstUOM_FutureOrderDetail_SPORD").val($("#F8PriceUOM_" + $("#hdnPageSPORDSelectedFlowerId").val()).html());
            $("#txtUnitsPerBox_FutureOrderDetail_SPORD").val($("#F8PriceUnits_" + $("#hdnPageSPORDSelectedFlowerId").val()).html())
            $("#txtPrice_FutureOrderDetail_SPORD").val($("#F8PricePrice_" + $("#hdnPageSPORDSelectedFlowerId").val()).html())
            $("#txtUPC_FutureOrderDetail_SPORD").val($("#F8PriceUPC_" + $("#hdnPageSPORDSelectedFlowerId").val()).html());
            $("#txtBoxCode_FutureOrderDetail_SPORD").val($("#F8PriceBoxCode_" + $("#hdnPageSPORDSelectedFlowerId").val()).html());
            
            //$("#txtUPCPRICE_FutureOrderDetail_SPORD").val('');
            $("#txtUPCPRICE_FutureOrderDetail_SPORD").val($("#F8PriceGTIN_" + $("#hdnPageSPORDSelectedFlowerId").val()).html());

            $("#txtDateCode_FutureOrderDetail_SPORD").val('');
        }
    });
    
    function SaveFutureOrderDetail_SPORD() {
        var QuantityEntered = (($("#txtQty_FutureOrderDetail_SPORD").val() == "") ? $("#txtQty_FutureOrderDetail_SPORD").attr('placeholder') : $("#txtQty_FutureOrderDetail_SPORD").val());
        debugger;
                $(".YellowWarning").hide();
                var FlowerCode = $("#hfFlower_FutureOrderDetail_SPORD").val();
                var FlowerName = $("#hfFlowerName_FutureOrderDetail_SPORD").val();
                var Farm = $("#lstFarm_FutureOrderDetail_SPORD").val();
                var UOM = $("#lstUOM_FutureOrderDetail_SPORD").val();
                var Dimension = $("#lstUOM_FutureOrderDetail_SPORD option:selected").text().split('['); 
                var DimLWH = Dimension[1].replace("]", "").split('x');                
                var OrderNo = $("#ctl00_DivOrderNo").html();
                var CustomerNo = ($("#ctl00_DivCustomerNo_OrderDetails").html() == null ? $("#CurrentCustomerNo").html() : $("#ctl00_DivCustomerNo_OrderDetails").html())
                var UnitsPerBox = $("#txtUnitsPerBox_FutureOrderDetail_SPORD").val() == "" ? $("#txtUnitsPerBox_FutureOrderDetail_SPORD").attr('placeholder') : $("#txtUnitsPerBox_FutureOrderDetail_SPORD").val();
                var Price = (($("#txtPrice_FutureOrderDetail_SPORD").val() == "") ? $("#txtPrice_FutureOrderDetail_SPORD").attr('placeholder') : $("#txtPrice_FutureOrderDetail_SPORD").val());
                var Cost = (($("#txtCost_FutureOrderDetail_SPORD").val() == "") ? 0 : $("#txtCost_FutureOrderDetail_SPORD").val());
                var Type = "O";
                var OrderDetailID = 0;
                var Notes = $("#txtNotes_FutureOrderDetail_SPORD").val();
                var BoxCodeNew = $("#txtBoxCode_FutureOrderDetail_SPORD").val();
                var UPC = $("#txtUPC_FutureOrderDetail_SPORD").val().toUpperCase(); // Added by Belal :: 29 Aug 2020
                var UPCPRICE = $("#txtUPCPRICE_FutureOrderDetail_SPORD").val().toUpperCase();
                var DateCode = $("#txtDateCode_FutureOrderDetail_SPORD").val().toUpperCase(); // Added by Belal :: 29 Aug 2020
                $(".YellowWarning").hide();
                //OrderDetailID,Order, Customer , Flower , Farm , Quantity , UOM , Price , Type , Units , UserName , UserID , BoxCode , Notes , Desc 
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddFutureOrderDetail',
                    async: false,
                    data: "{'OrderDetailID':'" + OrderDetailID + "','Order': '" + OrderNo + "','Customer': '" + CustomerNo + "','Flower': '" + FlowerCode + "','Farm':'" + Farm + "','Quantity': '" + QuantityEntered + "','UOM': '" + UOM
                        + "', 'Price': '" + Price + "', 'Cost': '" + Cost + "', 'Type': '" + Type + "', 'Units': '" + UnitsPerBox + "', 'BoxCode':'" + BoxCodeNew + "', 'UPC':'" + UPC + "', 'UPCPRICE':'" + UPCPRICE + "', 'DateCode':'" + DateCode + "', 'Notes':'" + Notes + "','Desc':'" + FlowerName + "','L':'" + DimLWH[0] + "','W':'" + DimLWH[1] + "','H':'" + DimLWH[2] + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        debugger;
                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d == 'success') {
                            if (OrderDetailID == "" || OrderDetailID == "0" || OrderDetailID == null)
                                $.growl.notice({ title: "Added!", message: "" });
                            else
                                $.growl.notice({ title: "Updated!", message: "" });

                            $("#AddOrderDetailFromFutureDialog_SPORD").dialog("close");
                            $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                            $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
                            $("#ctl00_DivOrderDetailID_OrderSave").html("0");
                        }
                        else {
                            $("#AddOrderDetailFromFutureDialog_SPORD").dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
    }
     $('.enterKeyPressControl').unbind('keydown').bind('keydown', function (e) { 
            var currentInputID = $(this).attr('id');
            if (e.keyCode == 13) {
                if (currentInputID == "txtFlower_FutureOrderDetail_SPORD") {
                    $("#lstFarm_FutureOrderDetail_SPORD").focus();
                } else if (currentInputID == "lstFarm_FutureOrderDetail_SPORD") {
                    $("#txtQty_FutureOrderDetail_SPORD").focus();
                } else if (currentInputID == "txtQty_FutureOrderDetail_SPORD") {
                    $("#lstUOM_FutureOrderDetail_SPORD").focus();
                } else if (currentInputID == "lstUOM_FutureOrderDetail_SPORD") {
                    $("#txtUnitsPerBox_FutureOrderDetail_SPORD").focus();
                } else if (currentInputID == "txtUnitsPerBox_FutureOrderDetail_SPORD") {
                    $("#txtPrice_FutureOrderDetail_SPORD").focus();
                } else if (currentInputID == "txtPrice_FutureOrderDetail_SPORD") {
                    $("#txtCost_FutureOrderDetail_SPORD").focus();
                } else if (currentInputID == "txtCost_FutureOrderDetail_SPORD") {
                    $("#txtBoxCode_FutureOrderDetail_SPORD").focus();
                } else if (currentInputID == "txtBoxCode_FutureOrderDetail_SPORD") {
                    $("#txtUPC_FutureOrderDetail_SPORD").focus();
                } else if (currentInputID == "txtUPC_FutureOrderDetail_SPORD") {
                    $("#txtUPCPRICE_FutureOrderDetail_SPORD").focus();
                } else if (currentInputID == "txtUPCPRICE_FutureOrderDetail_SPORD") {
                    $("#txtDateCode_FutureOrderDetail_SPORD").focus();
                }
                else if (currentInputID == "txtDateCode_FutureOrderDetail_SPORD") {
                    $("#txtNotes_FutureOrderDetail_SPORD").focus();
                }
            }else if (e.keyCode == 34) {
                if (currentInputID == "txtBoxCode_FutureOrderDetail_SPORD" || currentInputID == "txtUPC_FutureOrderDetail_SPORD" || currentInputID == "txtUPCPRICE_FutureOrderDetail_SPORD" || currentInputID == "txtDateCode_FutureOrderDetail_SPORD" || currentInputID == "txtNotes_FutureOrderDetail_SPORD") {
                    SaveFutureOrderDetail_SPORD();
                }
            }
        });
    function LoadUOM_SPORD() {
        var length = $('#lstUOM_FutureOrderDetail_SPORD > option').length;
        var farmcode = $("#lstFarm_FutureOrderDetail_SPORD")[0].value;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForSPORD',
                data: '{"FarmCode":"' + farmcode.toUpperCase() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstUOM_FutureOrderDetail_SPORD').empty();
                    var UOMdata = output.d;
                    $('#lstUOM_FutureOrderDetail_SPORD').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstUOM_FutureOrderDetail_SPORD').append('<option value="' + UOM.UOM + '">' + UOM.UOM + ' [' + UOM.SIZE + ']</option>');
                    }

                    if ($("#hfUOM_FutureOrderDetail_SPORD").val() != "" && $("#hfUOM_FutureOrderDetail").val() != 0)
                        $('#lstUOM_FutureOrderDetail_SPORD').val($("#hfUOM_FutureOrderDetail").val());
                    else
                        $("#lstUOM_FutureOrderDetail_SPORD").val("QB");
                }
            });
        }
        else {
            $('#lstUOM_FutureOrderDetail_SPORD').val($("#hfUOM_FutureOrderDetail_SPORD").val());
        }
    }
    function changegridColByF8Price(isVisible) {
        $("#btnSPORDPriceAdd").css("visibility", isVisible ? "visible" : "hidden");
        $("#btnSPORDBuild").css("visibility", isVisible ? "visible" : "hidden");
        $("#btnSPORDClose").css("visibility", isVisible ? "visible" : "hidden");
        $("#tdSPORDPriceAdd").css("visibility", isVisible ? "visible" : "hidden");
        $("#fgrdViewSPORDByPrice").flexToggleCol('0', isVisible)
        $("#fgrdViewSPORDByPrice").flexToggleCol('1', isVisible)
        $("#fgrdViewSPORDByPrice").flexToggleCol('11', isVisible)

    }

    $('#DivViewSPORDByPriceDialog').on('keydown', function (e) {
        var focused = document.activeElement;
        if (e.which == 13 && focused.className != "qsbox") { //key enter

            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdViewSPORDByPrice")[0].tabIndex = tabindex;
            $("#fgrdViewSPORDByPrice").focus();

            e.preventDefault();
            var CurrentSelectedrow = $("#fgrdViewSPORDByPrice .trSelectedCheck")
            var id = CurrentSelectedrow.attr('id').replace('row', '');
            $("#F8PriceCust_" + id).click()
            e.stopPropagation();
        }
        if (e.which == 38) { //up arrow

            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdViewSPORDByPrice")[0].tabIndex = tabindex;
            $("#fgrdViewSPORDByPrice").focus();

            e.preventDefault();
            var CurrentSelectedrow = $("#fgrdViewSPORDByPrice .trSelectedCheck")
            Prevrow = $("#fgrdViewSPORDByPrice .trSelectedCheck").prevAll('tr:visible:first');

            if (Prevrow.length != 0) {
                CurrentSelectedrow.removeClass("trSelectedCheck");
                Prevrow.addClass("trSelectedCheck");


                var newRow = $(Prevrow)
                var rowTop = newRow.position().top;
                var rowBottom = rowTop + newRow.height();
                var $table = $('#divViewSPORDByPrice .bDiv'); // store instead of calling twice
                var tableHeight = $table.height();
                var currentScroll = $table.scrollTop();

                if (rowTop < 0) {
                    // scroll up
                    $('#divViewSPORDByPrice .bDiv').scrollTop(currentScroll + rowTop);
                }
                else if (rowBottom > tableHeight) {
                    // scroll down
                    var scrollAmount = rowBottom - tableHeight;
                    $('#divViewSPORDByPrice .bDiv').scrollTop(currentScroll + scrollAmount);
                }

                return false; e.stopPropagation();
            }
            return false; e.stopPropagation();

        }
        else if (e.which == 40) { //down arrow

            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdViewSPORDByPrice")[0].tabIndex = tabindex;
            $("#fgrdViewSPORDByPrice").focus();

            e.preventDefault();
            var CurrentSelectedrow = $("#fgrdViewSPORDByPrice .trSelectedCheck")
            nextrow = $("#fgrdViewSPORDByPrice .trSelectedCheck").nextAll('tr:visible:first');
            if (nextrow.length != 0) {
                CurrentSelectedrow.removeClass("trSelectedCheck");
                nextrow.addClass("trSelectedCheck");

                var newRow = $(nextrow)
                var rowTop = newRow.position().top;
                var rowBottom = rowTop + newRow.height();
                var $table = $('#divViewSPORDByPrice .bDiv'); // store instead of calling twice
                var tableHeight = $table.height();
                var currentScroll = $table.scrollTop();

                if (rowTop < 0) {
                    // scroll up
                    $('#divViewSPORDByPrice .bDiv').scrollTop(currentScroll + rowTop);
                }
                else if (rowBottom > tableHeight) {
                    // scroll down
                    var scrollAmount = rowBottom - tableHeight;
                    $('#divViewSPORDByPrice .bDiv').scrollTop(currentScroll + scrollAmount);
                }

                return false;
            }
            return false;
            e.stopPropagation();
        }
    })

    //End region "SPORD PRICE"

    //Region "F8-Check"
    $("#F8selectall").die('click').live("click", function (e) {
        debugger
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        var Query = $("#fgrdARINVSpord").flexOptions()[0].p.query;
        var QueryType = $("#fgrdARINVSpord").flexOptions()[0].p.qtype;
        debugger;
        var page = window.location.href;

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            $('#fgrdARINVSpord tr:visible').addClass("trChecked");
            $('#fgrdARINVSpord tr#row0').removeClass("trChecked");
            $("[id^=F8select_]:visible").prop("src", "images/check-on.png");
            $("[id^=F8select_]:visible").attr('class', 'Orderselected');
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $('#fgrdARINVSpord tr').removeClass("trChecked");
            $("[id^=F8select_]:visible").removeClass('Orderselected');
            $("[id^=F8select_]").prop("src", "images/check-off.png");
        }
        var SelectedF8Orders = $(".trChecked:visible").find("img.Orderselected");
        if (SelectedF8Orders.length <= 0) {
            HideShowAllButtons(true);
        }
        else {
            HideShowAllButtons(false);
        }
    });

    $("[id^=F8select_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("F8select_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        debugger;
        var page = window.location.href;

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            sourceCtl.attr('class', 'Orderselected');

            //var gettype = $("#typeARINVSpord_" + headers).html();
            //if (gettype != undefined) {
            //    if (gettype.toLowerCase() == "S".toLowerCase()) {
            //    }
            //}
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $("[id ^= ManualPOselectall]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            sourceCtl.attr('class', 'unOrderselected');
        }
        var SelectedF8Orders = $(".trChecked:visible").find("img.Orderselected");
        if (SelectedF8Orders.length <= 0) {
            HideShowAllButtons(true);
        }
        else {
            HideShowAllButtons(false);
        }
    });

    function HideShowAllButtons(canshow) {
        debugger;
        if (canshow) {
            $("#btnSPORDAdd").show();
            $("#btnSPORDPrebooks").show();
            $("#btnSPORDStanding").show();
            $("#btnSPORDBiWeek").show();
            $("#btnSPORDSeasonal").show();
            $("#btnSPORDPrices").show();
            $("#btnSPORDALLorders").show();
            $("#btnSPORDTrans").show();
            $("#btnSPORDSummary").show();
            $("#btnSPORDConfirmation").show();
        }
        else {
            $("#btnSPORDAdd").hide();
            $("#btnSPORDPrebooks").hide();
            $("#btnSPORDStanding").hide();
            $("#btnSPORDBiWeek").hide();
            $("#btnSPORDSeasonal").hide();
            $("#btnSPORDPrices").hide();
            $("#btnSPORDALLorders").hide();
            $("#btnSPORDTrans").hide();
            $("#btnSPORDSummary").hide();
            $("#btnSPORDConfirmation").hide();
        }
    }

    function Doubles() {
        debugger;
        var isvaliddoubles = false;
        var SelectedF8Orders = $(".trChecked:visible").find("img.Orderselected");
        if (SelectedF8Orders.length > 0) {
            var F8SqlIds = [];
            var F8Type = [];
            var SelectedType = $(".trChecked:visible").find("td:nth-child(8) div");
            for (var i = 0; i < SelectedF8Orders.length; i++) {
                debugger;
                if (SelectedType[i].innerText != undefined) {
                    if (SelectedType[i].innerText.toString().toLowerCase() != "S".toLowerCase()) {
                        $("#msgSPORDhtml").html("Please select Type <b>([S] - Standing Orders)</b> Only!!!");
                        $("#msgbox-SPORD").dialog("option", { "width": "355px" });
                        $("#msgbox-SPORD").dialog("open");
                        isvaliddoubles = false;
                        break;
                    }
                    else {
                        var f8id = SelectedF8Orders[i].id.split('_')[1];
                        if ($.inArray(f8id, F8SqlIds) == -1) {
                            F8SqlIds.push(f8id);
                            F8Type.push(SelectedType[i].innerText);
                            isvaliddoubles = true;
                        }
                    }
                }
            }
            if (isvaliddoubles) {
                if (F8SqlIds.length == 0) {
                    return false;
                }
                else {
                    F8SqlIds.join(',');
                    if (F8SqlIds == "") {
                        return false;
                    }
                    $("#ScheduleForShippingDialog").data("inData", { F8SqlIds: F8SqlIds }).dialog('open');
                }
            }
        }
        else {
            reloadspord("D");
        }
    }

    function ValidateDoubles(F8SqlIds) {
        var isvalid = false;

    }

    $("#ScheduleForShippingDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: '',
        width: 375,
        height: 170,
        modal: true,
        buttons: {
            Double: {
                text: 'Create Doubles',
                click: function () {
                    var F8SqlIds = $("#ScheduleForShippingDialog").data("inData")["F8SqlIds"];
                    CreateDoubleForF8(F8SqlIds);
                }
            },
            Cancel: function () {
                $("#ScheduleForShippingDialog").dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Double')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function CreateDoubleForF8(F8SqlIds) {
        debugger;
        var shippingdate = $("#txtF8ShippingDate").val();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/CreateDoubleForF8",
            data: "{'SPORDSqlIds':'" + F8SqlIds + "','ShippingDate':'" + shippingdate + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                res = output.d;
                if (res.toLowerCase() == "success") {
                    $("#ScheduleForShippingDialog").dialog("close");
                    reloadspord("");
                }
                else {
                    $("#msgSPORDhtml").html("OOPS! Unable to process your request. Please contact admin!");
                    $("#msgbox-SPORD").dialog("open");
                }
                HideShowAllButtons(true);
            },
            onError: function () {
                $("#msgSPORDhtml").html("OOPS! Unable to process your request. Please contact admin!");
                $("#msgbox-SPORD").dialog("open");
                HideShowAllButtons(true);
            }

        });
    }

    function F8CreateInvoice() {
    }
    function F8LoadBySummary() {
        isSummaryList = true;
        $("#DivSummaryAndConfirmationDialog").dialog('open');
    }

    $("#DivSummaryAndConfirmationDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: '',
        width: 375,
        height: 190,
        modal: true,
        buttons: {
            Ok: function () {
                if (isSummaryList) {
                    reloadspord('U');
                }
                else {
                    GenerateConfirmationReport();
                }
            },
            Cancel: function () {
                $("#DivSummaryAndConfirmationDialog").dialog("close");
            },
        },
        open: function () {
            if (isSummaryList) {
                $("#lblSumConfirmFromDate").html("Ship Date");
                $("#trSumconfirmToDatelbl").hide();
                $("#tdSumconfirmToDatelblhdn").hide();
                $("#tdSumconfirmToDatelbl").hide();
                $("#tdSumconfirmToDatetxt").hide();
            }
            else {
                $("#lblSumConfirmFromDate").html("From");
                $("#trSumconfirmToDatelbl").show();
                $("#tdSumconfirmToDatelblhdn").show();
                $("#tdSumconfirmToDatelbl").show();
                $("#tdSumconfirmToDatetxt").show();
            }
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function F8GenerateConfirmationReport() {
        isSummaryList = false;
        $("#DivSummaryAndConfirmationDialog").dialog('open');
    }

    function CalculateDiffDays(shippingDate, cargoDate) {
        let suggested = 3;
        if (growershipdate)
            suggested = growershipdate;
        let difference = Math.floor((shippingDate - cargoDate) / (24 * 3600 * 1000));
        $("#DiffDays").text('(' + difference + ' Days - Suggested ' + suggested +')');

    }

    function UpdateShippingDate(value) {
        $("#txtSPORDEditShipbogota").datepicker("setDate", value);
        $("#CargoDateDay").text(value.toLocaleString('en-us', { weekday: 'long' }).substr(0, 7));
    }

    function GenerateConfirmationReport() {
        debugger;
        //ByVal FromDate As String, ToDate As String, ByVal Customer As String
        var fromshipdate = $("#txtSumConfirmFromDate").val();
        var toshipdate = $("#txtSumConfirmToDate").val();
        if (new Date(fromshipdate) > new Date(toshipdate)) {
            $("#msgbox-select").dialog("close");
            $.MessageBox("From-Date cannot be greater than To-Date");
            return;
        }
        var customer = $("#ctl00_DivCurrentCustomer_SPORD").html();
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GenerateConfirmationReport",
            data: "{'FromDate':'" + fromshipdate + "','ToDate':'" + toshipdate + "','Customer':'" + customer + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                    w.close();
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    if ($("#btnSPORDALLorders").is(':hidden') == false)
                        $("#btnSPORDALLorders").click();
                }
                $("#DivSummaryAndConfirmationDialog").dialog("close");
            },
            onError: function () {
                $("#msgSPORDhtml").html("OOPS! Unable to process your request. Please contact admin!");
                $("#msgbox-SPORD").dialog("open");
            }

        });
    }


//End region
</script>
