<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCustDetails.ascx.vb" Inherits="pages_PageCustDetails" %>
<script src="js/ChartNew.js" type="text/javascript"></script>
<style type="text/css">
    .textEllipsis {
        /*margin-top: -5px;
        margin-left: -5px;
        padding-bottom: 3px;
        margin-right: -5px;*/
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .CustomerInfoDialogShipto {
        position: absolute;
        left: 8px;
        margin-top: 5px;
    }

    .CustomerInfoDialogPrice {
        position: absolute;
        left: 68px;
        margin-top: 5px;
    }

    .CustomerInfoDialogCarrier {
        position: absolute;
        left: 122px;
        margin-top: 5px;
    }

    .tblCustomerInfoDlg td {
        padding: 5px;
        font-size: 12px;
        font-weight: bold;
    }

    .ctrlstatic {
        color: #FFFF34;
    }

    .ctrldynamic {
        color: #FFFFFF;
    }


    #CustomerInfoDialog input[type="text"]:focus, #CustomerInfoDialog textarea:focus {
        background-color: #A70000;
        border-color: #A70000;
        /*color:#00FFFF;*/
    }

    #CustomerInfoDialog input[type="text"], #CustomerInfoDialog textarea {
        background-color: #A70000;
        border-color: #A70000;
        /*color:#00FFFF;*/
    }

    .ctrldynamic::-webkit-input-placeholder {
        /* WebKit, Blink, Edge */
        color: white;
    }

    .ctrldynamic:-moz-placeholder {
        /* Mozilla Firefox 4 to 18 */
        color: white;
        opacity: 1;
    }

    .ctrldynamic::-moz-placeholder {
        /* Mozilla Firefox 19+ */
        color: white;
        opacity: 1;
    }

    .ctrldynamic:-ms-input-placeholder {
        /* Internet Explorer 10-11 */
        color: white;
    }
</style>

<table>
    <tr class="trOrderCustDet" style="display: block; margin-top: -5px;">
        <%-- 01 Apr 2019 :: SALES-Create Shipto area on Order Screen and show shipto if one is selected :: Starts --%>
        <td style="vertical-align: top; width: 390px;">
            <fieldset class="fsBillto" style="float: left; width: 370px; overflow: auto; position: absolute; height: 96px;">
                <%-- 01 Apr 2019 :: SALES-Create Shipto area on Order Screen and show shipto if one is selected :: Ends --%>
                <legend class="lblBillTo1" style="font-size: large; background: white;">BILL TO</legend>

                <div class="DivOrderCustDetails1" style="float: left; margin-bottom: -4px; margin-top: -6px;">
                    <table class="tblOrderCustDetails1">
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">NAME</td>
                            <td colspan="3">
                                <label class="lblCustName1" style="color: black;"></label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">ADDRESS</td>
                            <td colspan="3">
                                <label class="lblCustAddress11" style="color: black;"></label>
                                <td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">ADDRESS</td>
                            <td colspan="3">
                                <label class="lblCustAddress22" style="color: black;"></label>
                                <td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">CITY</td>
                            <td style="width: 115px">
                                <label class="lblCustCity1" style="color: black;"></label>
                            </td>
                            <td>
                                <label style="color: magenta; margin-right: 13px;">STATE</label>
                            </td>
                            <td>
                                <label class="lblCustState1" style="color: black;"></label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">ZIP</td>
                            <td>
                                <label class="lblCustZIP1" style="color: black;"></label>
                            </td>

                            <td><%--Show phone# on the box :: by Abinaya :: 24Sep2018 --%>
                                <label style="color: magenta; margin-right: 7px;">PHONE</label>
                            </td>
                            <td <%--style="display: none;"--%>>
                                <label class="lblCustPhone1" style="color: black;"></label>
                            </td>
                            <td style="display: none;">
                                <label class="lblSalesMan" style="color: black;"></label>
                            </td>
                            <td style="display: none;">
                                <label class="lblCustType" style="color: black;"></label>
                            </td>
                        </tr>
                        <%--<tr>
                                <td style="padding-right: 5px; color: magenta;">A/P Contact</td>
                                <td>
                                    <label class="lblCustAPCont" style="color: black;"></label>
                                </td>
                                <td>
                                    <label style="color: magenta; margin-right: 5px;">A/P Phone</label>
                                </td>
                                <td>
                                    <label class="lblCustAPPhone" style="color: black;"></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label style="color: magenta; margin-right: 7px;">A/P Email</label>
                                </td>
                                <td colspan="3">
                                    <div class="lblCustAPEmail textEllipsis" style="color: black;width:330px;"></div>
                                </td>
                            </tr>--%>
                    </table>
                </div>
            </fieldset>
        </td>
        <td style="width: 1px; vertical-align: middle">
            <img src="images/information.png" class="imgCustInfo" data-custno="" data-custname="" style="margin-bottom: 15px; cursor: pointer;" />
            <img src="images/netsalesinfo.png" class="imgCustSales" data-custno="" data-custname="" title="NetSales" style="margin-bottom: 15px; cursor: pointer;" />
        </td>
        <td>
            <fieldset class="fsARInfo" style="float: left; width: 242px; height: 96px;">
                <legend style="font-size: large; background: white;">A/R INFO</legend>
                <div class="DivOrderCustCreditDetails" style="margin-bottom: -4px; margin-top: -6px;">
                    <table class="tblOrderCustCreditDetails">
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">TERMS</td>
                            <td>
                                <div class="lblTerms1 textEllipsis" style="color: black; width: 110px; text-align: right;"></div>
                                <div style="display: none;" class="lblTermCode textEllipsis" style="color: black; width: 150px; text-align: right;"></div>
                                <div style="display: none;" class="hf_linefuel" style="color: black; width: 150px; text-align: right;"></div>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">INVOICE DATE</td>
                            <td style="text-align: right;">
                                <label class="lblInvoiceDate1" style="color: black;"></label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">A/R BALANCE</td>
                            <td style="text-align: right;">
                                <label class="lblARBalance1" style="color: black;"></label>
                            </td>
                        </tr>

                        <tr style="display: none;">
                            <td style="padding-right: 25px; color: magenta;">CREDIT LIMIT</td>
                            <td style="text-align: right;">
                                <label class="lblCreditLimit1" style="color: black;"></label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">AVAILABLE</td>
                            <td style="text-align: right;">
                                <label class="lblAvailable1" style="color: black;"></label>

                                <input type="hidden" class="hf_CustEmail" />
                                <input type="hidden" class="hf_CustFax" />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta; white-space: nowrap;">Unapplied on file</td>
                            <td style="text-align: right;">
                                <a href="#" class="aUnAppliedAmountForCustomer" style="color: Red; font-weight: bold;"></a>
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </td>
        <td>
            <fieldset class="fsCustomerBalanceMonthWise" style="float: right; width: 172px; height: 96px;">
                <legend style="font-size: large; background: white;">Balance</legend>
                <div class="DivCustomerBalanceMonthWise" style="margin-bottom: -4px; margin-top: -6px;">
                    <table class="tblCustomerBalanceMonthWise">
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">
                                <label class="lblCurrentOrders" style="text-transform: capitalize; white-space: nowrap;">Current Orders</label></td>
                            <td>
                                <%--<label class="CurrentOrdersBalance" style="color: black; float: right;">0.00</label>--%>
                                <a href="#" class="CurrentOrdersBalance" style="color: Red; font-weight: bold; float: right;">0.00</a>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">
                                <label class="lblCurrentMonth" style="text-transform: capitalize;"></label>
                            </td>
                            <td>
                                <label class="CurrentMonthBalance" style="color: black; float: right;">0.00</label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">
                                <label class="lblOneMonthBefore" style="text-transform: capitalize;"></label>
                            </td>
                            <td style="text-align: right;">
                                <label class="OneMonthBeforeBalance" style="color: black; float: right;">0.00</label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">
                                <label class="lblTwoMonthsBefore" style="text-transform: capitalize;"></label>
                            </td>
                            <td style="text-align: right;">
                                <label class="TwoMonthsBeforeBalance" style="color: black; float: right;">0.00</label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 25px; color: magenta;">
                                <label class="lblThreeMonthsBefore" style="text-transform: capitalize;"></label>
                            </td>
                            <td style="text-align: right;">
                                <label class="ThreeMonthsBeforeBalance" style="color: black; float: right;">0.00</label>
                                <div style="display: none;" class="lblCreditHold"></div>
                                <div style="display: none;" class="lblReasonHold"></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </td>

    </tr>
</table>


<%--<div id="CustomerUnAppliedAmountDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table id="fgrdUnAppliedAmountDetailsFgrd" style="display: block;"></table>
            </td>
        </tr>
    </table>
</div>--%>

<div id="CustomerInfoDialog" style="display: none; background-color: black;">
    <table class="tblCustomerInfoDlg">
        <tbody>
            <tr>
                <td id="tdCustInfo" style="border: 1px solid #FFFF34;">
                    <table id="tblCustInfo" class="ctrlstatic">
                        <tbody>
                            <tr>
                                <td style="padding-right: 5px;">Customer Since</td>
                                <td>
                                    <label class="lblCustSince" style="padding-right: 5px;"></label>
                                </td>
                                <td style="padding-right: 5px;">Last Sale</td>
                                <td>
                                    <label class="lblLastSale" style="padding-right: 5px;"></label>
                                </td>

                                <td style="padding-right: 5px;">Last Payment</td>
                                <td>
                                    <label class="lblLastPay" style="padding-right: 5px;"></label>
                                </td>
                                <td style="padding-right: 5px;">Amount</td>
                                <td style="width: 150px;">
                                    <label class="lblLastPayAmt" style="padding-right: 5px; text-align: right;"></label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td id="tdSlsmanInfo" style="border: 1px solid #FFFF34;">
                    <table id="tblSlsmanInfo">
                        <tbody>
                            <tr>
                                <td style="padding-right: 25px;" class="ctrlstatic">Sales Person</td>
                                <td colspan="3">
                                    <input type="text" class="txtSlsman ctrlstatic" style="width: 25px;" readonly>

                                    <input type="text" class="txtSlsmanName ctrlstatic" style="width: 383px;" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td class="ctrlstatic">A/P Contact</td>
                                <td colspan="2">
                                    <input type="text" class="txtAPContact ctrldynamic APDetails" style="width: 160px;" readonly>
                                    <label class="ctrlstatic">A/P Phone</label>
                                </td>
                                <td>
                                    <input type="text" class="txtAPPhone ctrldynamic APDetails" style="width: 167px;" readonly>
                                    <label class="ctrlstatic">Fax#</label>
                                    <input type="text" class="txtAPFax ctrldynamic APDetails" style="width: 125px" readonly />
                                </td>
                            </tr>
                            <tr>
                                <td class="ctrlstatic">Contact Email</td>
                                <td colspan="3">
                                    <input type="text" class="txtAPEmail ctrldynamic APDetails" style="width: 417px;" readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td></td>
            </tr>
            <tr>
                <td id="tdBuyInfo" style="border-left: 1px solid #FFFF34; border-right: 1px solid #FFFF34;">
                    <table id="tblBuyInfo">
                        <tbody>
                            <tr>
                                <td style="padding-right: 0px;" class="ctrlstatic">Buyer</td>
                                <td>
                                    <input type="text" class="txtBuyer ctrldynamic" style="margin-left: 0px; width: 280px;" readonly>
                                </td>
                                <td colspan="2">
                                    <input type="text" class="txtPhone ctrldynamic" style="width: 125px;" readonly>
                                    <label style="padding-left: 1px;" class="ctrlstatic">Fax#</label>
                                    <input type="text" class="txtFax ctrldynamic" style="width: 125px;" readonly>
                                </td>
                            </tr>
                            <tr style="height: 36px;">
                                <td style="width: 105px;">
                                    <label class="ctrlstatic">Call Time</label>
                                </td>
                                <td colspan="3">
                                    <input type="text" class="txtCallTime ctrldynamic" style="margin-right: 0px; width: 50px;" maxlength="4" readonly>
                                    <label class="ctrlstatic" style="margin-left: 20px;">
                                        Call Days</label>
                                    <div id="divCallDaysView" style="margin-top: -19px; margin-left: 135px;">
                                        <label class="lblCallDays ctrldynamic" style="margin-left: 11px;"></label>
                                    </div>
                                    <%-- Show CallDays with textbox in Edit mode only... --%>
                                    <div id="divCallDaysEdit" style="display: none; margin-top: -25px; margin-left: 145px;">
                                        <label class="lblCallDays0 ctrldynamic" style="margin-left: 11px;">MON</label>
                                        <input type="text" class="txtCallDays0 ctrldynamic" style="width: 10px; text-transform: uppercase;" maxlength="1" readonly>
                                        <label class="lblCallDays1 ctrldynamic" style="margin-left: 0px;">TUE</label>
                                        <input type="text" class="txtCallDays1 ctrldynamic" style="width: 10px; text-transform: uppercase;" maxlength="1" readonly>
                                        <label class="lblCallDays2 ctrldynamic" style="margin-left: 0px;">WED</label>
                                        <input type="text" class="txtCallDays2 ctrldynamic" style="width: 10px; text-transform: uppercase;" maxlength="1" readonly>
                                        <label class="lblCallDays3 ctrldynamic" style="margin-left: 0px;">THU</label>
                                        <input type="text" class="txtCallDays3 ctrldynamic" style="width: 10px; text-transform: uppercase;" maxlength="1" readonly>
                                        <label class="lblCallDays4 ctrldynamic" style="margin-left: 0px;">FRI</label>
                                        <input type="text" class="txtCallDays4 ctrldynamic" style="width: 10px; text-transform: uppercase;" maxlength="1" readonly>
                                        <label class="lblCallDays5 ctrldynamic" style="margin-left: 0px;">SAT</label>
                                        <input type="text" class="txtCallDays5 ctrldynamic" style="width: 10px; text-transform: uppercase;" maxlength="1" readonly>
                                        <label class="lblCallDays6 ctrldynamic" style="margin-left: 0px;">SUN</label>
                                        <input type="text" class="txtCallDays6 ctrldynamic" style="width: 10px; text-transform: uppercase;" maxlength="1" readonly>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 36px;">
                                <td class="ctrlstatic">Delivery Days</td>
                                <td colspan="3" id="tdDelivDaysView">
                                    <%--<label class="lblDelivDays ctrldynamic" style="margin-left: 0px;"></label>--%>
                                    <label class="ctrlstatic" style="margin-left: 11px;">MON-</label>
                                    <label class="lblDells0 ctrldynamic" style="width: 20px;"></label>
                                    &nbsp;&nbsp;
                                    <label class="ctrlstatic" style="margin-left: 0px;">TUE-</label>
                                    <label class="lblDells1 ctrldynamic" style="width: 20px;"></label>
                                    &nbsp;&nbsp;
                                    <label class="ctrlstatic" style="margin-left: 0px;">WED-</label>
                                    <label class="lblDells2 ctrldynamic" style="width: 20px;"></label>
                                    &nbsp;&nbsp;
                                    <label class="ctrlstatic" style="margin-left: 0px;">THU-</label>
                                    <label class="lblDells3 ctrldynamic" style="width: 20px;"></label>
                                    &nbsp;&nbsp;
                                    <label class="ctrlstatic" style="margin-left: 0px;">FRI-</label>
                                    <label class="lblDells4 ctrldynamic" style="width: 20px;"></label>
                                    &nbsp;&nbsp;
                                    <label class="ctrlstatic" style="margin-left: 0px;">SAT-</label>
                                    <label class="lblDells5 ctrldynamic" style="width: 20px;"></label>
                                    &nbsp;&nbsp;
                                    <label class="ctrlstatic" style="margin-left: 0px;">SUN-</label>
                                    <label class="lblDells6 ctrldynamic" style="width: 20px;"></label>
                                    &nbsp;&nbsp;
                                </td>
                                <%-- Show DELLS with textbox in Edit mode only... --%>
                                <td colspan="3" id="tdDelivDaysEdit" style="display: none">
                                    <label class="lblDelivDays0 ctrldynamic" style="margin-left: 11px;">MON</label>&nbsp;
                                    <input type="text" class="txtDelivDays0 ctrldynamic" style="width: 25px; text-transform: uppercase;" maxlength="3" readonly>&nbsp;&nbsp;
                                    <label class="lblDelivDays1 ctrldynamic" style="margin-left: 0px;">TUE</label>&nbsp;
                                    <input type="text" class="txtDelivDays1 ctrldynamic" style="width: 25px; text-transform: uppercase;" maxlength="3" readonly>&nbsp;&nbsp;
                                    <label class="lblDelivDays2 ctrldynamic" style="margin-left: 0px;">WED</label>&nbsp;
                                    <input type="text" class="txtDelivDays2 ctrldynamic" style="width: 25px; text-transform: uppercase;" maxlength="3" readonly>&nbsp;&nbsp;
                                    <label class="lblDelivDays3 ctrldynamic" style="margin-left: 0px;">THU</label>&nbsp;
                                    <input type="text" class="txtDelivDays3 ctrldynamic" style="width: 25px; text-transform: uppercase;" maxlength="3" readonly>&nbsp;&nbsp;
                                    <label class="lblDelivDays4 ctrldynamic" style="margin-left: 0px;">FRI</label>&nbsp;
                                    <input type="text" class="txtDelivDays4 ctrldynamic" style="width: 25px; text-transform: uppercase;" maxlength="3" readonly>&nbsp;&nbsp;
                                    <label class="lblDelivDays5 ctrldynamic" style="margin-left: 0px;">SAT</label>&nbsp;
                                    <input type="text" class="txtDelivDays5 ctrldynamic" style="width: 25px; text-transform: uppercase;" maxlength="3" readonly>&nbsp;&nbsp;
                                    <label class="lblDelivDays6 ctrldynamic" style="margin-left: 0px;">SUN</label>&nbsp;
                                    <input type="text" class="txtDelivDays6 ctrldynamic" style="width: 25px; text-transform: uppercase;" maxlength="3" readonly>&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="ctrlstatic">Airport</td>
                                <td colspan="3">
                                    <input type="text" style="margin-left: 0px; width: 50px; text-transform: uppercase;" class="txtAirport ctrldynamic" readonly>
                                    <label style="padding-left: 20px;" class="ctrlstatic">Airline</label>
                                    <input type="text" class="txtAirline ctrldynamic" style="margin-left: 10px; text-transform: uppercase;" readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td></td>
            </tr>
            <tr>
                <td id="tdCustDesc" style="border-bottom: 1px solid #FFFF34; border-left: 1px solid #FFFF34; border-right: 1px solid #FFFF34;">
                    <table id="tblCustDesc">
                        <tbody>
                            <tr>
                                <td style="padding-right: 10px;" class="ctrlstatic">Shipping Instrc</td>
                                <td>
                                    <textarea style="width: 600px; height: 65px;" class="txtShipInstrc ctrldynamic" readonly></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 10px;" class="ctrlstatic">Email</td>
                                <td>
                                    <textarea style="width: 600px; height: 40px;" class="txtEmail ctrldynamic" readonly></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <%--//Abi/Nivetha :: 01 Mar 19 :: Need to add three edit fields that are in f_cust :: Added--%>
            <tr>
                <td style="border-bottom: 1px solid #FFFF34; border-left: 1px solid #FFFF34; border-right: 1px solid #FFFF34;">
                    <table>
                        <tbody>
                            <tr>
                                <td style="padding-right: 10px;" class="ctrlstatic">AutoLoad Combine Invoice</td>
                                <td>
                                    <input type="text" class="txtCombInv ctrldynamic" style="width: 20px; margin-right: 7px; text-transform: uppercase;" maxlength="1" readonly>
                                </td>
                                <td style="padding-right: 10px;" class="ctrlstatic">Exclude from printing</td>
                                <td>
                                    <input type="text" class="txtExcludePrint ctrldynamic" style="width: 20px; margin-right: 7px; text-transform: uppercase;" maxlength="1" readonly>
                                </td>
                                <td style="padding-right: 10px;" class="ctrlstatic">No Autoload Substitution</td>
                                <td>
                                    <input type="text" class="txtNoSubs ctrldynamic" style="width: 20px; margin-right: 7px; text-transform: uppercase;" maxlength="1" readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="ctrlstatic" style="border-bottom: 1px solid #FFFF34; border-left: 1px solid #FFFF34; border-right: 1px solid #FFFF34;">Send Invoice via
                    <input type="text" class="txtSendInv ctrldynamic" style="width: 30px; margin-left: 7px; text-transform: uppercase;" readonly>
                    <label class="ctrlstatic">*E*EOD Email *F*EOD Fax*IE*Immediate Email*IF*Immediate Fax</label>
                </td>
            </tr>
        </tbody>
    </table>
    <div style="margin-top: 10px;" class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
    </div>
</div>



<div id="CurrentCustomerNo" style="display: none;"></div>

<div id="msgbox-CustInfo" style="display: none;" title="Alert">
    <p id="msgCustInfohtml"></p>
</div>

<div id="msgbox-save" style="display: none;" title="Alert">
    <p id="msgsavehtml"></p>
</div>

<div id="LoggedInUserType" runat="server" style="display: none"></div>

<div id="CustCurrentDivID" style="display: none;"></div>

<script type="text/javascript">
    $(document).ready(function () {

        if ($("#ctl00_LoggedInUserType").html() == "customer") {
            $(".imgCustInfo").hide();
        }
    });

    $(document).keydown(function (e) { //mani::10-Sep-2018 adding shortcut for updating customer detail
        //
        if (e.keyCode == 115) {
            $(".imgCustInfo").click();
        }
    });
    function GetCustDetailsPage(Customer, InvoiceDate, ARINVDivControl) {

        //GetSalesOrderCustDetails
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSalesOrderCustDetails',
            data: '{ "Customer":"' + Customer + '"}',
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                var res = output.d;

                $("#CustCurrentDivID").html(ARINVDivControl);

                $("#" + ARINVDivControl + " .lblBillTo1").html("BILL TO : <label class='ClsCustomerNoHeader'> " + Customer + " </label>    <span style='background: #2c2cea;color: white;'>" + res.FuelOrAndeanCaption + "</span>");
                $("#" + ARINVDivControl + " .lblCustName1").html(res.Name);
                $("#" + ARINVDivControl + " .lblCustAddress11").html(res.ADDRESS1);
                $("#" + ARINVDivControl + " .lblCustAddress22").html(res.ADDRESS2);
                $("#" + ARINVDivControl + " .lblCustCity1").html(res.CITY);
                $("#" + ARINVDivControl + " .lblCustState1").html(res.STATE);
                $("#" + ARINVDivControl + " .lblCustZIP1").html(res.ZIP);
                $("#" + ARINVDivControl + " .lblCustPhone1").html(res.PHONE);
                $("#" + ARINVDivControl + " .lblSalesMan").html(res.SalesMan);
                //$(".lblARInfo").html(OrdeNo);
                $("#" + ARINVDivControl + " .lblTerms1").html(res.TERMSCODE + " " + res.TERMSDESC)
                $("#" + ARINVDivControl + " .lblTerms1").attr("title", res.TERMSCODE + " " + res.TERMSDESC);
                $("#" + ARINVDivControl + " .lblCreditHold").html(res.Credithold);
                $("#" + ARINVDivControl + " .lblReasonHold").html(res.ReasonHold);

                $("#" + ARINVDivControl + " .hf_linefuel").html(res.LineFuel.toString());
                if (res.TERMSCODE != null) {
                    $("#" + ARINVDivControl + " .lblTermCode").html(res.TERMSCODE.trim());
                }
                if ($("#rbcust").attr("checked")) {
                    $("#" + ARINVDivControl + " .lblInvoiceDate1").html(InvoiceDate)
                }
                //$(".lblInvoiceDate").html(custDet[1]);
                //if (InvoiceDate == "") {
                //    $(".lblInvoiceDate1").html($.datepicker.formatDate('mm/dd/yy', new Date()));
                //}
                //else {
                //    $(".lblInvoiceDate1").html(InvoiceDate);
                //}
                $("#" + ARINVDivControl + " .lblARBalance1").html(res.ARBALANCE.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $("#" + ARINVDivControl + " .lblCreditLimit1").html(res.CREDITLIMIT.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $("#" + ARINVDivControl + " .lblAvailable1").html(res.Available.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $("#" + ARINVDivControl + " .hf_CustEmail").html(res.Email);
                $("#" + ARINVDivControl + " .hf_CustFax").html(res.Fax.replace("-", ""));


                var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August",
                                  "September", "October", "November", "December"];

                var now = new Date();
                var dupDate = new Date();

                $("#" + ARINVDivControl + " .lblCurrentMonth").html(monthNames[now.getMonth()]);
                $("#" + ARINVDivControl + " .lblOneMonthBefore").html(monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 1, 1))]);
                $("#" + ARINVDivControl + " .lblTwoMonthsBefore").html(monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 2))]);
                $("#" + ARINVDivControl + " .lblThreeMonthsBefore").html(monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 3))]);
                $("#" + ARINVDivControl + " .CurrentOrdersBalance").html(res.ORDERS.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $("#" + ARINVDivControl + " .CurrentOrdersBalance").attr("data-customer", "");
                //$("#" + ARINVDivControl + " .CurrentOrdersBalance").attr('id', (ARINVDivControl + "_CurrentOrderBalanceAliasId"));
                $("#" + ARINVDivControl + " .CurrentOrdersBalance").attr("data-customer", Customer);

                try {
                    $("#" + ARINVDivControl + " .CurrentOrdersBalance").data("data-customer") = "";
                    //$("#" + ARINVDivControl + " .CurrentOrdersBalance").attr('id', (ARINVDivControl + "_CurrentOrderBalanceAliasId"));
                    $("#" + ARINVDivControl + " .CurrentOrdersBalance").data("data-customer") = Customer;
                }
                catch (e) {

                }

                $("#" + ARINVDivControl + " .CurrentMonthBalance").html(res.BAL0030.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $("#" + ARINVDivControl + " .OneMonthBeforeBalance").html(res.BAL3060.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $("#" + ARINVDivControl + " .TwoMonthsBeforeBalance").html(res.BAL6090.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $("#" + ARINVDivControl + " .ThreeMonthsBeforeBalance").html(res.BAL90.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));

                //$(".CurrentMonthBalance").html(res.BAL0030.toFixed(2));
                //$(".OneMonthBeforeBalance").html(res.BAL3060.toFixed(2));
                //$(".TwoMonthsBeforeBalance").html(res.BAL6090.toFixed(2));
                //$(".ThreeMonthsBeforeBalance").html(res.BAL90.toFixed(2));

                /*commented by Abinaya::01-09-2017 :: Remove AP fields from BillTo panel*/
                //$(".lblCustAPCont").html(res.APCONTACT);
                //$(".lblCustAPPhone").html(res.APPHONE);
                //$(".lblCustAPEmail").attr("title", res.Email);
                //$(".lblCustAPEmail").html(res.Email.replace(/\s*,\s*/g, '; ').replace(/\s*;\s*/g, '; '));

                /*set cust.no and name to info img attributes*/

                $("#" + ARINVDivControl + " .imgCustInfo").attr('data-custno', Customer);
                $("#" + ARINVDivControl + " .imgCustInfo").attr('data-custname', res.Name);
                $("#" + ARINVDivControl + " .imgCustSales").attr('data-custno', Customer);
                $("#" + ARINVDivControl + " .imgCustSales").attr('data-custname', res.Name);
                $("#" + ARINVDivControl + " .lblCustType").html(res.Type);
            }
        });

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUnAppliedAmountForCustomer',
            data: '{ "CustomerNo":"' + Customer + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#" + ARINVDivControl + " #CurrentCustomerNo").html(Customer);
                $("#" + ARINVDivControl + " .aUnAppliedAmountForCustomer").html(output.d.toFixed(2))
            }
        });
    }

    //Muthu Nivetha M :: 13Feb2020 :: Modified :: Resolved Invalid Columnname 'undefined' on CurrentOrders(F6)
    $(".CurrentOrdersBalance").die('click').live("click", function (e) {
        try {
            $("#DivCurrentOrdersDialog").dialog("close");
        }
        catch (ex) { }
        //// var CurrentOrderBalanceDivID = $(this).attr("id").replace("_CurrentOrderBalanceDivIAliasId", "");
        // var CurrentOrderBalanceDivID = $("#CustCurrentDivID").html();
        // var Customer = $("#" + CurrentOrderBalanceDivID + " .CurrentOrdersBalance").attr("data-customer");

        var Customer = $(this).attr("data-customer");

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
                    },
                });
                $("#DivCurrentOrdersDialog").dialog('option', 'title', 'Current Order Detail for Customer ::' + Customer);
                $("#DivCurrentOrdersDialog").html(output.d).dialog("open");
            }
        });
    });

    $(".aUnAppliedAmountForCustomer").die('click').live("click", function (e) {
        if ($("#CurrentCustomerNo").html() == "") {
            var CurrentDivid = $("#CustCurrentDivID").html();
            var Customer = $("#" + CurrentDivid + " .imgCustSales").attr('data-custno');
            var para = "CustomerNo=" + Customer
        }
        else
            var para = "CustomerNo=" + $("#CurrentCustomerNo").html();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageUnAppliedAmountForCustomer.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

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
        //LoadUnAppliedAmountDetailsFgrd();
        //$("#CustomerUnAppliedAmountDialog").dialog("open");
    });

    $("#CustomerInfoDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Customer Info Screen",
        width: 810,
        height: 600,
        modal: true,
        buttons: {
            'Shipto': {
                text: 'Shipto',
                class: 'BloomButtonEnabled',
                click: function () {
                    btnCustShiptoclick();
                }
            },
            'Carrier': {
                text: 'Carrier',
                class: 'BloomButtonEnabled',
                click: function () {
                    btnCustCarrierclick();
                }
            },
            'Edit': {
                text: 'Edit',
                id: 'btnDlgCustInfoEdit',
                click: function () {
                    $("#btnDlgCustInfoEdit").hide();
                    $("#btnDlgCustInfoSave").show();
                    $("#tdDelivDaysEdit").show();
                    $("#tdDelivDaysView").hide();
                    $("#divCallDaysEdit").show();
                    $("#divCallDaysView").hide();
                    $(".ctrldynamic").attr("readonly", false);
                    if ($("#ctl00_LoggedInUserType").html().toLowerCase() == "credit manager") {
                        $(".APDetails").attr("readonly", false);
                        $(".txtAPContact").focus();
                    }
                    else {
                        $(".APDetails").attr("readonly", true);
                        $(".txtBuyer").focus();
                    }
                    $(".txtPhone").val($(".txtPhone").val().replace(/[-()]/g, ''));
                    $(".txtFax").val($(".txtFax").val().replace(/[-()]/g, ''));
                    $(".txtAPPhone").val($(".txtAPPhone").val().replace(/[-()]/g, ''));
                    $(".txtCallTime").val($(".txtCallTime").val().replace(':', ''));
                    $(".txtAPFax").val($(".txtAPFax").val().replace(/[-()]/g, ''));
                },
            },
            'Save': {
                text: 'Save',
                id: 'btnDlgCustInfoSave',
                click: function () {

                    var CustNo = $("#CustomerInfoDialog").data("CustData")["CustNo"];
                    $("#msgCustInfohtml").html("Do you want to Save the changes?");
                    $("#msgbox-CustInfo").data("CustNo", CustNo).dialog("open");
                },
            },
            'Close': function () {

                $(this).dialog('close');
            }
        },
        close: function () {
            //$('.tblCustomerNetSalesDialog tr.trDynamicNetSM').remove(); /*Clear Net sales Jan-Dec dynamic row creation to prevent unwanted row append bcoz both dialog's call same method*/
            $("#tdDelivDaysEdit").hide();
            $("#tdDelivDaysView").show();
            $("#divCallDaysEdit").hide();
            $("#divCallDaysView").show();
            $(".ctrldynamic").attr("readonly", true);
            $(".APDetails").attr("readonly", true);

            clearLabels();
            // $("#CustomerInfoDialog").dialog('remove');
        },
        open: function () {

            $(".ui-dialog-buttonpane button:contains('Edit')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
            $(".ui-dialog-buttonpane button:contains('Shipto')").addClass('CustomerInfoDialogShipto');
            $(".ui-dialog-buttonpane button:contains('Price')").addClass('CustomerInfoDialogPrice');
            $(".ui-dialog-buttonpane button:contains('Carrier')").addClass('CustomerInfoDialogCarrier');


            $("#btnDlgCustInfoSave").hide();    /*Hide Save button when the dialog open's and activated after clicked by Edit button*/
            $("#btnDlgCustInfoEdit").show();
        }
    });

    function clearLabels() {
        for (var i = 0; i < 7; i++) {
            $(".txtCallDays" + i).val("");
            $(".txtDelivDays" + i).val("");
            $(".lblDells" + i).html("");
        }
    }

    $(".imgCustInfo").die('click').live('click', function () {
        var CurrentDivid = $("#CustCurrentDivID").html();
        //alert(CurrentDivid);
        var custno = $("#" + CurrentDivid + " .imgCustInfo").attr('data-custno');
        var custname = $("#" + CurrentDivid + " .imgCustInfo").attr('data-custname');
        var tempcustno = "";
        if ($("#CurrentCustomerNo").html() == "") {
            tempcustno = custno;
            $("#CurrentCustomerNo").html(custno)
        }
        else {
            tempcustno = $("#CurrentCustomerNo").html();
        }
        GetCustInfoPage(custno);
        //GetCustInfoPage(tempcustno);
        //GetCustDetailsPage($("#CurrentCustomerNo").html(), "", "CustomerInfoDialog");
        var custno = $("#" + CurrentDivid + " .imgCustInfo").attr('data-custno');
        var custname = $("#" + CurrentDivid + " .imgCustInfo").attr('data-custname');
        $("#CustomerInfoDialog").dialog('option', 'title', 'Customer Info For :: ' + custname);
        $("#CustomerInfoDialog").dialog("open").data("CustData", { CustNo: custno, CustName: custname });
    });

    function GetCustInfoPage(Customer) {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSalesOrderCustInfo',
            data: '{ "Customer":"' + Customer + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                var res = output.d;
                $(".lblCustSince").html(res[0].CustSince);
                $(".lblLastSale").html(res[0].LastSale);
                $(".lblLastPay").html(res[0].LastPayment);
                $(".lblLastPayAmt").html("$" + delimitNumbers(res[0].LastPayAmt.toFixed(2)));

                $(".txtSlsman").val(res[0].SalesMan);
                $(".txtSlsmanName").val(res[0].SalesmanName);
                $(".txtAPContact").val(res[0].APCONTACT.trim());
                $(".txtAPPhone").val(res[0].APPHONE.trim());
                $(".txtAPEmail").val(res[0].APEmail.trim());
                $(".txtAPFax").val(res[0].APFax.trim());

                $(".txtBuyer").val(res[0].Purchaser);
                $(".txtPhone").val(res[0].PHONE.trim());
                $(".txtFax").val(res[0].Fax.trim());

                $(".txtAirport").val(res[0].Airport.trim());
                $(".txtAirline").val(res[0].Airline.trim());
                $(".txtShipInstrc").val(res[0].ShipInstr);
                $(".txtEmail").val(res[0].Email);
                $(".txtSendInv").val(res[0].FaxOrEmail.trim());

                var days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

                var CallDays = res[0].CallDays;
                var CDays = "";
                if (CallDays != "") {
                    var splitCDays = CallDays.split('');
                    for (var i = 0; i < splitCDays.length; i++) {
                        switch (i) {
                            case i:
                                if (splitCDays[i] != " ") {
                                    (splitCDays.length == 1) ? CDays = days[i] : CDays += "&nbsp;&nbsp;" + days[i];
                                }
                                $(".txtCallDays" + i).val(splitCDays[i].trim());
                                break;
                        }
                    }
                }
                $(".lblCallDays").html(CDays);

                var CallTime = res[0].CallTime;
                var CTime = "";
                if (CallTime != "") {
                    var splitCTime = CallTime.match(/.{1,2}/g);
                    CTime = splitCTime[0] + ":" + splitCTime[1];
                }
                $(".txtCallTime").val(CTime.trim());

                var DeliveryDays = res[0].DeliveryDays;
                var Dells = "";
                if (DeliveryDays != "") {
                    var splitDDays = DeliveryDays.match(/.{1,3}/g);
                    for (var i = 0; i < days.length; i++) {
                        switch (i) {
                            case i:
                                if (splitDDays[i] == undefined) {
                                    splitDDays[i] = "";
                                }
                                Dells += days[i] + "-" + splitDDays[i] + "&nbsp;&nbsp;&nbsp;";
                                $(".txtDelivDays" + i).val(splitDDays[i].trim());
                                $(".lblDells" + i).html(splitDDays[i].trim());
                                break;
                        }
                    }
                }
                //$(".lblDelivDays").html(Dells);

                var d = new Date();
                $(".year1").html(d.getFullYear());
                $(".year2").html(d.getFullYear() - 1);
                $(".year3").html(d.getFullYear() - 2);
                $(".year4").html(d.getFullYear() - 3);
                $(".year5").html(d.getFullYear() - 4);

                $(".Y1Sales").html(delimitNumbers(res[0].Y1Sales.toFixed(2)));
                $(".Y2Sales").html(delimitNumbers(res[0].Y2Sales.toFixed(2)));
                $(".Y3Sales").html(delimitNumbers(res[0].Y3Sales.toFixed(2)));
                $(".Y4Sales").html(delimitNumbers(res[0].Y4Sales.toFixed(2)));
                $(".Y5Sales").html(delimitNumbers(res[0].Y5Sales.toFixed(2)));

                $(".Y1Payment").html(delimitNumbers(res[0].Y1Payment.toFixed(2)));
                $(".Y2Payment").html(delimitNumbers(res[0].Y2Payment.toFixed(2)));
                $(".Y3Payment").html(delimitNumbers(res[0].Y3Payment.toFixed(2)));
                $(".Y4Payment").html(delimitNumbers(res[0].Y4Payment.toFixed(2)));
                $(".Y5Payment").html(delimitNumbers(res[0].Y5Payment.toFixed(2)));

                $(".Y1Credits").html(delimitNumbers(res[0].Y1Credits.toFixed(2)));
                $(".Y2Credits").html(delimitNumbers(res[0].Y2Credits.toFixed(2)));
                $(".Y3Credits").html(delimitNumbers(res[0].Y3Credits.toFixed(2)));
                $(".Y4Credits").html(delimitNumbers(res[0].Y4Credits.toFixed(2)));
                $(".Y5Credits").html(delimitNumbers(res[0].Y5Credits.toFixed(2)));

                var Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                //var Months = { 1: "January", 2: "February", 3: "March", 4: "April", 5: "May", 6: "June", 7: "July", 8: "August", 9: "September", 10: "October", 11: "November", 12: "December" };
                var slscretyr = [], slscrelyr = [], slscrelyr2 = [], slscrelyr3 = [], slscrelyr4 = [];

                var temp = "";
                for (var i = 1; i <= Months.length; i++) {
                    slscretyr[i] = parseFloat(res[0].slscretyr.substr((i - 1) * 10, 10) - res[0].slscretyr.substr((i - 1) * 10 + 121, 10));
                    slscretyr[i] = (slscretyr[i] == 0.00) ? " " : delimitNumbers(slscretyr[i].toFixed(2));
                    slscrelyr[i] = (res[0].slscrelyr.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr.substr((i - 1) * 10, 10)).toFixed(2));
                    slscrelyr2[i] = (res[0].slscrelyr2.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr2.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr2.substr((i - 1) * 10, 10)).toFixed(2));
                    slscrelyr3[i] = (res[0].slscrelyr3.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr3.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr3.substr((i - 1) * 10, 10)).toFixed(2));
                    slscrelyr4[i] = (res[0].slscrelyr4.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr4.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr4.substr((i - 1) * 10, 10)).toFixed(2));


                    temp += "<tr class='trDynamicNetSM'><td style='width:140px;' class='netlabels'>" + Months[i - 1] + "</td><td class='lbldet' style='width:140px;text-align:right;'>" + slscretyr[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr2[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr3[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr4[i] + "</td></tr>";
                }

                $("#DivSalesYear1").html(slscretyr.join("#"));
                $("#DivSalesYear2").html(slscrelyr.join("#"));
                $("#DivSalesYear3").html(slscrelyr2.join("#"));
                $("#DivSalesYear4").html(slscrelyr3.join("#"));
                $("#DivSalesYear5").html(slscrelyr4.join("#"));

                $("#tblNetSalesRS").append(temp);
            }
        });
    }

    $(".imgCustSales").die('click').live('click', function () {
        if ($("#CurrentCustomerNo").html() == "") {
            var CurrentDivid = $("#CustCurrentDivID").html();
            var Customer = $("#" + CurrentDivid + " .imgCustSales").attr('data-custno');
            var controlPara = "Customer=" + Customer
        }
        else
            var controlPara = "Customer=" + $("#CurrentCustomerNo").html();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCustNetSales.ascx","controlPara":"' + controlPara + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DivNetSalesDetails_CustDetailsPage">/div>').dialog({
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
                        $("#DivNetSalesDetails_CustDetailsPage .ui-dialog-content.ui-widget-content").css("padding", "0px");
                        $("#DivCustSince").html($("#tblCustInfo").html());
                    }
                });
                $("#DivNetSalesDetails_CustDetailsPage").html(output.d).dialog("open");
            }
        });
    });



    function delimitNumbers(str) {
        return (str + "").replace(/\b(\d+)((\.\d+)*)\b/g, function (a, b, c) {
            return (b.charAt(0) > 0 && !(c || ".").lastIndexOf(".") ? b.replace(/(\d)(?=(\d{3})+$)/g, "$1,") : b) + c;
        });
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
                if ($(this).attr('class').indexOf("txtAPContact") > -1) {
                    $(".txtAPPhone").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtAPPhone") > -1) {
                    $(".txtAPFax").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtAPFax") > -1) {
                    $(".txtAPEmail").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtAPEmail") > -1) {
                    $(".txtBuyer").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtBuyer") > -1) {
                    $(".txtPhone").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtPhone") > -1) {
                    $(".txtFax").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtFax") > -1) {
                    $(".txtCallTime").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtCallTime") > -1) {
                    $(".txtCallDays0").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtCallDays0") > -1) {
                    $(".txtCallDays1").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtCallDays1") > -1) {
                    $(".txtCallDays2").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtCallDays2") > -1) {
                    $(".txtCallDays3").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtCallDays3") > -1) {
                    $(".txtCallDays4").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtCallDays4") > -1) {
                    $(".txtCallDays5").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtCallDays5") > -1) {
                    $(".txtCallDays6").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtCallDays6") > -1) {
                    $(".txtDelivDays0").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtDelivDays0") > -1) {
                    $(".txtDelivDays1").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtDelivDays1") > -1) {
                    $(".txtDelivDays2").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtDelivDays2") > -1) {
                    $(".txtDelivDays3").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtDelivDays3") > -1) {
                    $(".txtDelivDays4").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtDelivDays4") > -1) {
                    $(".txtDelivDays5").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtDelivDays5") > -1) {
                    $(".txtDelivDays6").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtDelivDays6") > -1) {
                    $(".txtAirport").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtAirport") > -1) {
                    $(".txtAirline").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtAirline") > -1) {
                    $(".txtShipInstrc").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtShipInstrc") > -1) {
                    $(".txtEmail").focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtEmail") > -1) {
                    $(".txtSendInv")[0].focus();
                    return false;
                }
                else if ($(this).attr('class').indexOf("txtSendInv") > -1) {
                    $("#btnDlgCustInfoSave")[0].focus();
                    return false;
                }
            }
        }
    });

    function fillWithSpaces(val, length) {
        if (!val) { val = ""; }
        if (val.length < length)
            val = val + new Array(length - val.length).fill(' ').join("");

        return val;
    }

    /* Alert Box :: Yes/No options for Customer info screen. */
    $("#msgbox-CustInfo").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {
                var Buyer = $(".txtBuyer").val();
                var Phone = $(".txtPhone").val();
                var Fax = $(".txtFax").val();
                var FaxOrEmail = $(".txtSendInv").val().toUpperCase();

                var CallTime = $(".txtCallTime").val();
                var CallDays = (($(".txtCallDays0").val() == "") ? " " : $(".txtCallDays0").val().toUpperCase()) + (($(".txtCallDays1").val() == "") ? " " : $(".txtCallDays1").val().toUpperCase()) + (($(".txtCallDays2").val() == "") ? " " : $(".txtCallDays2").val().toUpperCase()) + (($(".txtCallDays3").val() == "") ? " " : $(".txtCallDays3").val().toUpperCase()) + (($(".txtCallDays4").val() == "") ? " " : $(".txtCallDays4").val().toUpperCase()) + (($(".txtCallDays5").val() == "") ? " " : $(".txtCallDays5").val().toUpperCase()) + (($(".txtCallDays6").val() == "") ? " " : $(".txtCallDays6").val().toUpperCase());

                //var DelivDays = (($(".txtDelivDays0").val() == "") ? "   " : $(".txtDelivDays0").val().toUpperCase() );
                //DelivDays += (($(".txtDelivDays1").val() == "") ? "   " : $(".txtDelivDays1").val().toUpperCase() );
                //DelivDays += (($(".txtDelivDays2").val() == "") ? "   " : $(".txtDelivDays2").val().toUpperCase() );
                //DelivDays += (($(".txtDelivDays3").val() == "") ? "   " : $(".txtDelivDays3").val().toUpperCase() );
                //DelivDays += (($(".txtDelivDays4").val() == "") ? "   " : $(".txtDelivDays4").val().toUpperCase() );
                //DelivDays += (($(".txtDelivDays5").val() == "") ? "   " : $(".txtDelivDays5").val().toUpperCase() );
                //DelivDays += (($(".txtDelivDays6").val() == "") ? "   " : $(".txtDelivDays6").val().toUpperCase() );
                var DelivDays = fillWithSpaces($(".txtDelivDays0").val().toUpperCase(), 3);
                DelivDays += fillWithSpaces($(".txtDelivDays1").val().toUpperCase(), 3);
                DelivDays += fillWithSpaces($(".txtDelivDays2").val().toUpperCase(), 3);
                DelivDays += fillWithSpaces($(".txtDelivDays3").val().toUpperCase(), 3);
                DelivDays += fillWithSpaces($(".txtDelivDays4").val().toUpperCase(), 3);
                DelivDays += fillWithSpaces($(".txtDelivDays5").val().toUpperCase(), 3);
                DelivDays += fillWithSpaces($(".txtDelivDays6").val().toUpperCase(), 3);

                // delivDays = 'APMAPMAPMAPMAPMAPMAPM'
                // alert(DelivDays)
                var Airport = $(".txtAirport").val().toUpperCase();
                var Airline = $(".txtAirline").val();
                var ShipInstrc = $(".txtShipInstrc").val();
                var Email = $(".txtEmail").val();

                var APContact = $(".txtAPContact").val();
                var APPhone = $(".txtAPPhone").val();
                var APEmail = $(".txtAPEmail").val();
                var APFax = $(".txtAPFax").val();

                //Abi/Nivetha :: 01 Mar 19 :: Need to add three edit fields that are in f_cust :: Added

                var CombInv = $(".txtCombInv").val().toUpperCase() == "Y" ? true : false;
                var ExcludePrint = $(".txtExcludePrint").val().toUpperCase() == "Y" ? true : false;
                var NoSubs = $(".txtNoSubs").val().toUpperCase() == "Y" ? 1 : 0;

                var CustNo = $("#msgbox-CustInfo").data("CustNo");

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateCustomerDetailsInfo',
                    data: "{'CustNo': '" + CustNo + "','Buyer':'" + Buyer + "','Phone':'" + Phone + "','Fax':'" + Fax + "','CallTime':'" + CallTime + "','CallDays':'" + CallDays + "','DelivDays':'" + DelivDays + "','Airport':'" + Airport + "','Airline':'" + Airline + "','ShipInstrc':'" + ShipInstrc + "','Email':'" + Email + "','FaxOrEmail':'" + FaxOrEmail + "','APContact':'" + APContact + "','APPhone':'" + APPhone + "','APEmail':'" + APEmail + "','APFax':'" + APFax + "','CombInv':'" + CombInv + "','ExcludePrint':'" + ExcludePrint + "','NoSubs':'" + NoSubs + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        var res = output.d;
                        if (output.d == "success") {
                            $(".txtPhone").val(Phone.substr(1, 3) + "-" + Phone.substr(4, 3) + "-" + Phone.substr(7, 4));
                            $(".txtFax").val("(" + Fax.substr(1, 3) + ")-" + Fax.substr(4, 3) + "-" + Fax.substr(7, 4));
                            $(".ctrldynamic").attr("readonly", true);

                            //$("#msgsavehtml").html("Changes Updated...");
                            //$("#msgbox-save").dialog("open");
                            $("#btnDlgCustInfoEdit").show();
                            $("#btnDlgCustInfoSave").hide();
                            $("#tdDelivDaysEdit").hide();
                            $("#tdDelivDaysView").show();
                            $("#divCallDaysEdit").hide();
                            $("#divCallDaysView").show();
                            $(".APDetails").attr("readonly", true);
                            $("#msgbox-CustInfo").dialog("close");
                            $("#CustomerInfoDialog").dialog("close");
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
            // $(this).siblings('.ui-dialog-buttonpane').find("button:contains('No')").focus();
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
                $("#CustomerInfoDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    function btnCustShiptoclick() {
        var CurrentDivid = $("#CustCurrentDivID").html();
        var custno = $("#" + CurrentDivid + " .imgCustInfo").attr('data-custno');
        custno = custno == "" ? $("#CurrentCustomerNo").html() : custno;
        $(".imgLoaderForUser").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageShipto.ascx","controlPara":"' + custno + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DialogCustomerShipto">/div>').dialog({
                    title: 'Shipto Maintenance :: ' + custno,
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 860,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                    }
                });
                $("#DialogCustomerShipto").html(output.d).dialog("open");
            }
        });
    }

    function btnCustCarrierclick() {

        debugger
        $(".imgLoaderForUser").show();
        var CurrentDivid = $("#CustCurrentDivID").html();
        var custno = $("#" + CurrentDivid + " .imgCustInfo").attr('data-custno');
        var Shipto = "0";
        var para = 'Customer=' + custno + '&Shipto=' + Shipto;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCarrierCode.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DialogCustCarriersCode">/div>').dialog({
                    title: 'Carrier code maintenance',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 760,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                    }
                });
                $("#DialogCustCarriersCode").html(output.d).dialog("open");
            }
        });
    }

    //Abi/Nivetha :: 01 Mar 19 :: Need to add three edit fields that are in f_cust :: Modified
    $(".txtCombInv,.txtExcludePrint,.txtNoSubs").keydown(function (e) {

        var key = e.which;
        var isReadonly = $(this).attr('readonly');
        if (key == 40 || key == 13 || key == 9) { //up arrow
            $(this).closest('tr').next().find('input').focus();
            return;
        }
        else if (key == 38) { //down arrow
            $(this).closest('tr').prev().find('input').focus();
            return;
        }
        if (!isReadonly) {
            if (key == 49 || key == 89)
                $(this).val("Y");
            else
                $(this).val("N");

            $(this).closest('tr').next().find('input').focus();
        }
    });

</script>
