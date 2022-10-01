<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCustomer.ascx.vb" Inherits="pages_PageCustomer" %>
<script src="js/validation.js" type="text/javascript"></script>

<style>
    div.ibutton-label-off {
        background-color: rgb(229, 123, 123);
    }

    div.ibutton-label-on {
        color: #fff;
        text-shadow: 0 -1px 2px rgba(0, 0, 0, 0.4);
        left: 0;
        padding-top: 2px;
        z-index: 1;
        background-color: rgb(132, 160, 84);
    }

    .ibutton-container {
        width: 55px;
    }

    div.ibutton-label-on span {
        padding-left: 0px;
    }

    div.ibutton-label-off span {
        padding-right: 0px;
    }
    /*Added ruby Anubhuti 08/10/2021*/
    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }
    /*xx*/
    /*#DialogCustomerUpdate input[type="text"] {
        height: 17px;
        background-color: cornsilk;
    }

    #DialogCustomerUpdate select {
        background-color: cornsilk;
    }

    .searchplaceholder::-webkit-input-placeholder {
        color: black;
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
    }*/
</style>

<div id="DialogCustomerUpdate" class="filesTab">
    <table>
        <tr>
            <td>
                <table id="tblCustomerDetails">
                    <tr id="trCustDetails">
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td >
                                            <label>Customer</label>
                                        </td>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 50px">
                                                            <input type="text" id="txtCustNo" class="searchplaceholder ClsNumbersOnly" style="width: 45px; text-align: right; display: none;" />
                                                        </td>
                                                        <td>
                                                             <input type="hidden" id="hdnCustomerSalesYN" />
                                                            <input type="text" id="txtCustomer" style="width: 300px;" maxlength="40" class="AllUpperCaseTextBox">
                                                        </td>
                                                        <td>
                                                            <label style="margin-left: 140px;">Type</label>
                                                        </td>
                                                        <td style="width:190px;">
                                                            <select id="lstType" style="width: 150px;"></select>
                                                        </td>
                                                        <td>
                                                            <label>MARKUP %</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" id="txtOpenMark" style="width: 60px; text-align: right;" class="ClsFourDecimalsOnly searchplaceholder ClsForValidatingFourDecimal" maxlength="9">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Address</label>
                                        </td>
                                        <td>
                                            <input type="text" id="txtAddress1" style="width: 350px;" maxlength="40" class="AllUpperCaseTextBox">
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="text" id="txtAddress2" style="width: 350px;" maxlength="40" class="AllUpperCaseTextBox">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>City</td>
                                        <td>
                                            <input type="text" id="txtCity" style="width: 200px;" maxlength="20" class="AllUpperCaseTextBox">
                                            <label style="color: white;">County</label>
                                            <label style="color: white;">--------------------------</label>
                                            <label style="margin-left: 123px;margin-right: 12px;">Country</label>
                                            <select id="lstCountry" style="width: 155px;"></select>
                                            <label style="margin-left: 3px;">Warehouse</label>
                                            <input type="text" id="txtWarehouse" style="width: 30px;" maxlength="3" class="AllUpperCaseTextBox">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <input type="text" id="txtState" style="width: 30px;" maxlength="2" class="AllUpperCaseTextBox">
                                                    </td>
                                                    <td>
                                                        <label>Zip</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" id="txtZip" style="width: 120px;" maxlength="10" class="AllUpperCaseTextBox">
                                                    </td>
                                                    <td>
                                                        <label style="margin-left: 20px;">Airport</label>
                                                    </td>
                                                    <td>
                                                        <select id="lstAirport" style="width: 150px;"></select>
                                                    </td>
                                                    <td>
                                                        <input type="text" id="txtAirport" style="width: 80px;" class="AllUpperCaseTextBox">
                                                    </td>
                                                    <td>
                                                        <label style="margin-left: 34px;margin-right: 14px;">Division</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" id="txtDivision" style="width: 40px;" class="ClsNumbersOnly">
                                                    </td>
                                                    <td>
                                                        <label>Territory</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" id="txtTerritory" style="width: 48px;" maxlength="2" class="AllUpperCaseTextBox">
                                                    </td>
                                                   <%-- <td style="width:55px;">
                                                        <label>Exclude</label>
                                                    </td>
                                                    <td>
                                                        <input type="checkbox" id="chkExclude" />
                                                    </td>--%>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr id="trBuyerDetails">
                        <td>
                            <table>
                                <tr>
                                    <td>Buyer Name</td>
                                    <td style="width:500px;">
                                        <input type="text" id="txtBuyerName" style="width: 300px;" maxlength="100" class="AllUpperCaseTextBox" />
                                    </td>
                                    <td>Telephone</td>
                                    <td style="width:180px;">
                                        <input type="text" id="txtBuyerTelephone" style="width: 150px;" maxlength="20" class="AllUpperCaseTextBox" />
                                    </td>                                  
                                    <td>Ext</td>
                                    <td>
                                        <input type="text" id="txtBuyerExt" style="width: 60px;" maxlength="4" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Contact</td>
                                    <td>
                                        <input type="text" id="txtContact" style="width: 200px;" maxlength="25" class="AllUpperCaseTextBox" />
                                    </td>
                                    <td>Telephone</td>
                                    <td>
                                        <input type="text" id="txtContactTelephone" style="width: 150px;" maxlength="20" class="AllUpperCaseTextBox" />
                                    </td>
                                    <td>Ext</td>
                                    <td>
                                        <input type="text" id="txtContactExt" style="width: 60px;" maxlength="4" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Contact title</td>
                                    <td>
                                        <input type="text" id="txtContactTitle" style="width: 200px;" maxlength="25" class="AllUpperCaseTextBox" />
                                    </td>
                                    <td>Fax #</td>
                                    <td>
                                        <input type="text" id="txtFax" style="width: 150px;" maxlength="20" class="AllUpperCaseTextBox" />
                                    </td>
                                    <td>Ext</td>
                                    <td>
                                        <input type="text" id="txtContactTitleExt" style="width: 60px;" maxlength="4" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>eMail Address</td>
                                    <td colspan="5">
                                        <textarea id="txtEmailAddress" style="width: 830px;" maxlength="300" class="AllUpperCaseTextBox"></textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr id="trSlsmanDetails">
                        <td>
                            <table>
                                <tr>
                                    <td>Salesman</td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td style="width:350px;">
                                                    <select id="lstSalesman"></select>
                                                </td>
                                                <td>
                                                    <label>Credit Terms</label>
                                                </td>
                                                <td>
                                                    <select id="lstCreditTerms"></select>
                                                </td>
                                                <td>
                                                    <label>Prepaid</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkPrepaid" />
                                                </td>
                                                <td>
                                                    <label>Line Fuel</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkLineFuel" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Billto/Parent</td>
                                    <td>
                                        <input type="text" id="txtBillTo" style="width: 80px; text-align: right;" class="ClsNumbersOnly" maxlength="9" />
                                        <input type="text" id="txtParent" style="width: 80px; text-align: right;" class="ClsNumbersOnly" maxlength="9" />
                                        <label style="margin-left: 172px;">Credit Limit</label>
                                        <input type="text" id="txtCreditLimit" style="width: 160px; margin-left: 5px; text-align: right;" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="11" />
                                      <%--  <label style="margin-left: 60px;">Interest</label>
                                        <input type="text" id="txtInterest" style="width: 80px; text-align: right;" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="11" />
                                        <label>%</label>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Resale#</td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <input type="text" id="txtResale" style="width: 150px;" maxlength="20" class="AllUpperCaseTextBox" />
                                                </td>
                                                <td>
                                                    <label style="margin-left: 30px;">App on File?</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkAppOnFile" /></td>
                                                <td>
                                                    <label style="margin-right: 40px;margin-left: 30px;">Dated</label>
                                                </td>
                                                <td>
                                                    <input type="text" id="txtDated" style="width: 80px;" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Credit Hold</td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <input type="checkbox" id="chkCreditHold" />
                                                </td>
                                                <td>
                                                    <label style="margin-left: 20px; margin-right: 28px;">Reason</label>
                                                </td>
                                                <td>
                                                    <input type="text" id="txtReason" style="width: 300px;" maxlength="30" class="AllUpperCaseTextBox" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Report to NACM?</td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <input type="checkbox" id="chkReportNACM" />
                                                </td>
                                                <td>
                                                    <label style="margin-left: 20px; margin-right: 22px;">NACM # </label>
                                                </td>
                                                <td>
                                                    <input type="text" id="txtNACM" style="width: 80px;" maxlength="10" class="AllUpperCaseTextBox" />
                                                </td>
                                                <td style="display: none;">
                                                    <label style="margin-left: 5px; margin-right: 11px;">Charge Fuel</label>
                                                </td>
                                                <td style="display: none;">
                                                    <input type="checkbox" id="chkChargeFuel" />
                                                </td>
                                                <td style="display: none;">
                                                    <label style="margin-left: 25px; margin-right: 21px;">Print</label>
                                                </td>
                                                <td style="display: none;">
                                                    <input type="text" id="txtPrint" style="width: 50px;" maxlength="10" class="AllUpperCaseTextBox" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Send Statement?</td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <input type="checkbox" id="chkSendStatement" />
                                                </td>
                                                <td>
                                                    <label style="margin-left: 19px;margin-right: 5px;">Coll.Letter?</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkCollLetter" />
                                                </td>
                                                <td>
                                                    <label style="margin-left: 35px; margin-right: 25px;">OK to Sell </label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkOKtoSell" />
                                                </td>
                                                <td hidden>
                                                    <label style="margin-left: 25px; margin-right: 5px;">Service</label>
                                                </td>
                                                <td hidden>
                                                    <input type="text" id="txtService" style="width: 20px;" maxlength="1" class="AllUpperCaseTextBox" />
                                                </td>
                                                 <td>
                                                    <label style="margin-left: 25px; margin-right: 5px;">Vendor</label>
                                                </td>
                                                <td>
                                                    <input type="text" id="txtVendor" style="width: 100px;" maxlength="10" class="AllUpperCaseTextBox" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="trShippingInstrDetails">
                        <td>
                            <table>
                                <tr>
                                    <td>Shipping Inst</td>
                                    <td>
                                        <textarea id="txtShippingInst" style="margin-left: 20px; width: 800px;" maxlength="62" class="AllUpperCaseTextBox"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Call Days</td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <label style="margin-left: 20px;">M</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkCallDaysMon" />
                                                </td>
                                                <td>
                                                    <label>T</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkCallDaysTue" />
                                                </td>
                                                <td>
                                                    <label>W</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkCallDaysWed" />
                                                </td>
                                                <td>
                                                    <label>T</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkCallDaysThu" />
                                                </td>
                                                <td>
                                                    <label>F</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkCallDaysFri" />
                                                </td>
                                                <td>
                                                    <label>S</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkCallDaysSat" />
                                                </td>
                                                <td>
                                                    <label>S</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkCallDaysSun" />
                                                </td>
                                                <td>
                                                    <label>Time to call</label>
                                                </td>
                                                <td>
                                                    <input type="text" id="txtTimeToCall" style="width: 50px;" maxlength="4" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Days by Truck</td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <input type="text" id="txtDaysTruck" style="width: 50px; margin-left: 20px;" />
                                                </td>
                                                <td>
                                                    <label>Preferred Carrier</label>
                                                </td>
                                                <td>
                                                    <select id="lstCarrier" style="width: 80px;"></select>
                                                </td>
                                                <td>
                                                    <label style="margin-left: 323px;">Dates on Label:?</label>
                                                </td>
                                                <td>
                                                    <input type="text" id="txtDatesOnLabel" style="width: 30px;" maxlength="1" />
                                                </td>
                                                <td>
                                                    <label>Duty</label>
                                                </td>
                                                <td>
                                                    <input type="checkbox" id="chkDuty" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Trucking Code</td>
                                    <td>
                                        <label style="margin-left: 20px;">M</label>
                                        <select id="lstTruckMon" style="width: 80px;"></select>
                                        <label>T</label>
                                        <select id="lstTruckTue" style="width: 80px;"></select>
                                        <label>W</label>
                                        <select id="lstTruckWed" style="width: 80px;"></select>
                                        <label>T</label>
                                        <select id="lstTruckThu" style="width: 80px;"></select>
                                        <label>F</label>
                                        <select id="lstTruckFri" style="width: 80px;"></select>
                                        <label>S</label>
                                        <select id="lstTruckSat" style="width: 80px;"></select>
                                        <label>S</label>
                                        <select id="lstTruckSun" style="width: 80px;"></select>
                                        <label>Shipper#</label>
                                        <input type="text" id="txtShipper" style="width: 60px;" maxlength="10" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="trButtonList">
            <td>
                <div style="margin-top: 10px;" class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
                    <div id="DivCustButtonList" class="ui-dialog-buttonset" style="float: left; margin-top: 10px;">
                        <input id="btnCustEdit" type="button" class="BloomButtonEnabled" value="Edit" style="margin-left: 5px; width: 55px;color:black">
                        <input id="btnCustDelete" type="button" class="BloomButtonEnabled" value="Delete" style="margin-left: 5px; width: 55px;color: white; background: darkblue;">
                        <input id="btnCustShipto" type="button" class="BloomButtonEnabled" value="Shipto" style="margin-left: 5px; width: 55px;color: white; background: fuchsia;">
                        <%--<input id="btnCustPrice" type="button" class="BloomButtonEnabled" value="Price" style="margin-left: 5px; width: 55px;">--%>
                        <input id="btnCustCarrier" type="button" class="BloomButtonEnabled" value="Carrier" style="margin-left: 5px; width: 55px;color:black; background: gold;">
                        <%--<input id="btnCustPhone" type="button" class="BloomButtonEnabled" value="Contacts" style="margin-left: 5px; width: 55px;">--%>
                        <input id="btnCustFrt" type="button" class="BloomButtonEnabled" value="Frt" style="width: 55px; display: none;">
                        <input id="btnCustM" type="button" class="BloomButtonEnabled" value="M" style="margin-left: 5px; width: 55px; display: none;">
                        <input id="btnCustMsg" type="button" class="BloomButtonEnabled" value="Msg" style="margin-left: 5px; width: 55px; display: none;">
                        <%--<input id="btnCustVendor" type="button" class="BloomButtonEnabled" value="Vendor" style="margin-left: 5px; width: 55px;">--%>
                        <input id="btnCustFuel" type="button" class="BloomButtonEnabled" value="Fuel" style="margin-left: 5px; width: 55px; display: none;">
                        <input id="btnCustCharge" type="button" class="BloomButtonEnabled" value="Charge" style="width: 55px; display: none;">
                        <input id="btnCustNext" type="button" class="BloomButtonEnabled" value="Next" style="margin-left: 5px; width: 55px;">
                        <input id="btnCustPrev" type="button" class="BloomButtonEnabled" value="Previous" style="width: 65px;">
                        <input id="btnNotes" type="button" class="BloomButtonEnabled" value="Notes" style="width: 65px;background: lightcoral;">
                        <input id="btnFreight" type="button" class="BloomButtonEnabled" value="Freight" style="width: 65px;color: black; background: orange;">
                    </div>
                    <div id="DivCustDialogButtonList" class="ui-dialog-buttonset" style="float: right;">
                        <button type="button" id="btnCustomerDetailsSave" style="display: none;" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false"><span class="ui-button-text">Save</span></button>
                        <button type="button" id="btnCustomerDetailsCancel" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-cancel" role="button" aria-disabled="false"><span class="ui-button-text">Close</span></button>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
<div id="DeleteConfirmCustomer" style="display: none;" title="Alert"></div>
<div id="DivGetCustomerNumber" style="display: none;">
    <table>
        <tr>
            <td>Customer number :</td>
            <td>
                <input type="text" id="txtCustomerNumber" />
            </td>
        </tr>
    </table>
</div>
<%--Added by Anubhuti 08/10/2021--%>
<div id="DivViewFreightDialog" style="display: none;">
    <table>
        <tr>
            <td>
                <div id="divViewFreight" style="float: left">
                    <table id="fgrdViewFreight" style="display: block;"></table>
                </div>
            </td>
        </tr>
    </table>
</div>
<div id="AddCustomerFreightByCarrier" style="display: none">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <tr style="height: 25px;">
                <td colspan="2">
                    <div class="Warning" align="center">
                        OOPS! Unable to process your request. Please contact admin!
                    </div>
                    <div class="YellowWarning" align="center">
                        All fields are required fields, Please try again.
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 150px;">Carrier</td>
                <td>
                    <select id="lstFreightCarrier" style="width: 250px;"></select>
                </td>
            </tr>
            <tr>
                <td>Charge Amount</td>
                <td>
                    <input type="text" id="txtChargeAmount" style="width: 100px;" maxlength="10">
                    <input type="hidden" id="hdnID" >
                    <input type="hidden" id="hdnSelectedCarrier" >
                </td>
            </tr>
            <tr>
                <td>Charge By</td>
                <td>
                     <select id="lstChargeBy" style="width: 250px;">                
                         <option value="C">Cube</option>
                         <option value="P">Pallet</option>
                         <option value="B">Box</option>                         
                     </select>
                </td>
            </tr>
        </tbody>
    </table>
</div>


<div id="msgbox-CustDetailsSave" style="display: none;">
    <p id="msghtml-CustDetailsSave" style="font-size: 15px; font-weight: bold;"></p>
</div>

<div id="DivCustomerNo" style="display: none;" runat="server"></div>
<div id="DivNextCustomer" style="display: none;" runat="server"></div>
<div id="DivPrevCustomer" style="display: none;" runat="server"></div>

<div id="LoggedInUserType_Customermaintenance" runat="server" style="display: none"></div>
<div id="DivOrderNewPageContent"></div>
<div id="DivOrderPageContent"></div>
<script>
    var IsCustomerAdd = false;

    $(document).ready(new function () {

        $.mask.definitions['9'] = "[0-9]";
        $.mask.definitions['#'] = "[0-9]";

        if ($("#ctl00_LoggedInUserType_Customermaintenance").html() == "sales person") {
            $("#btnCustEdit").hide();
            $("#btnCustDelete").hide();
        }

        /*Toggle button for Yes/No options :: Created by Abinaya :: 20Jul2018*/
        $("#chkPrepaid").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkPrepaid").iButton("toggle", false);

        $("#chkLineFuel").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkLineFuel").iButton("toggle", true);

        $("#chkAppOnFile").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkAppOnFile").iButton("toggle", true);

        $("#chkCreditHold").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCreditHold").iButton("toggle", true);

        $("#chkReportNACM").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkReportNACM").iButton("toggle", true);

        $("#chkSendStatement").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkSendStatement").iButton("toggle", true);

        $("#chkCollLetter").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCollLetter").iButton("toggle", true);

        $("#chkOKtoSell").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkOKtoSell").iButton("toggle", false);

        $("#chkDuty").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkDuty").iButton("toggle", false);

        $("#chkExclude").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkExclude").iButton("toggle", false);

        $("#chkChargeFuel").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkChargeFuel").iButton("toggle", false);

        $("#chkCallDaysMon").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCallDaysMon").iButton("toggle", false);

        $("#chkCallDaysTue").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCallDaysTue").iButton("toggle", false);

        $("#chkCallDaysWed").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCallDaysWed").iButton("toggle", false);

        $("#chkCallDaysThu").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCallDaysThu").iButton("toggle", false);

        $("#chkCallDaysFri").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCallDaysFri").iButton("toggle", false);

        $("#chkCallDaysSat").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCallDaysSat").iButton("toggle", false);

        $("#chkCallDaysSun").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCallDaysSun").iButton("toggle", false);


        var Customer = $("#ctl00_DivCustomerNo").html();
        if (Customer == "0") {
            IsCustomerAdd = true;
            $("#DivCustButtonList").hide();
            $("#btnCustomerDetailsSave").show();
        }
        else {
            $("#txtCustNo").show();

            $("#DivCustButtonList").show();
            $("#btnCustomerDetailsSave").hide();
            //$('#DialogCustomerUpdate input[type="text"],#DialogCustomerUpdate textarea,#DialogCustomerUpdate select').attr('disabled', 'disabled');
            $("#txtCustNo").attr("readonly", "readonly");
            //$('#tblCustomerDetails input[type="text"], textarea, select').css('background', "rgb(235, 235, 228)");
            $('#tblCustomerDetails input[type="text"],#tblCustomerDetails textarea, #tblCustomerDetails select').css('background', "rgb(235, 235, 228)");
            $("#tblCustomerDetails").css("pointer-events", "none");
        }

        //$("#txtCustomer").focus();
        $("#txtTimeToCall").mask("99:99");


        LoadCustomerTypes(function (callback1) {
            LoadAirport(function (callback2) {
                LoadCountry(function (callback3) {
                    LoadSalesPersonDetails(function (callback4) {
                        LoadCreditTerms(function (callback5) {
                            LoadCarriers(function (callback5) {
                                LoadCustomerDetails(Customer);
                            });
                        });
                    });
                });
            });
        });


    });
    function SetDefaultCustomerValue() {
        $.ajax
            ({
                type: "POST",
                url: 'BloomService.asmx/GetLastCustDetails',
                data: '{ }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var res = output.d;
                    $("#lstType").val(res.Type);
                    $("#lstSalesman").val(res.SalesMan);
                    $("#lstCreditTerms").val(res.TERMSCODE);
                    $('#lstCountry').val('US');
                    $("#chkCreditHold").iButton("toggle", false);
                    $("#chkDuty").iButton("toggle", false);
                }
            });
    }
    $("#txtDated").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'mm/dd/yy',
        showOtherMonths: true,
        selectOtherMonths: true,
    }).datepicker("setDate", new Date());

    /*Load Customer types from F_CTYPES table by Abi :: Created on 09May2018 */
    function LoadCustomerTypes(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadCustomerTypes',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('#lstType').empty();
                var CODEdata = output.d;
                $('#lstType').append('<option value="0">Select</option>');
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    $('#lstType').append('<option value="' + CODE.TYPE + '">' + CODE.TYPE + ' - ' + CODE.NAME + '</option>');
                }
                callback(true);
            }
        });
    }

    /*Load Airport from F_AIRPOT table by Abi :: Created on 09May2018 */
    function LoadAirport(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetAirportCodeList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('#lstAirport').empty();
                var AirportData = output.d;
                $('#lstAirport').append('<option value="0">Select</option>');
                for (var i in AirportData) {
                    var Airport = AirportData[i];
                    $('#lstAirport').append('<option value="' + Airport.Airport + '">' + Airport.Airport + ' - ' + Airport.Name + '</option>');
                }
                callback(true);
            }
        });
    }

    /*Load Country from F_COUNTY table by Abi :: Created on 09May2018 */
    function LoadCountry(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCountryCodeList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('#lstCountry').empty();
                var CountryData = output.d;
                //Commented by Prashant 2019-08-28 for default value should be USA
                //$('#lstCountry').append('<option value="0">Select</option>');
                for (var i in CountryData) {
                    var Country = CountryData[i];
                    $('#lstCountry').append('<option value="' + Country.COUNTRY + '">' + Country.COUNTRY + ' - ' + Country.NAME + '</option>');
                }
                callback(true);
            }
        });
    }

    /*Load Salesman from F_SLSMAN table by Abi :: Created on 09May2018 */
    function LoadSalesPersonDetails(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadSalesPersonDetails',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('#lstSalesman').empty();
                var SlsmanData = output.d;
                $('#lstSalesman').append('<option value="0">Select</option>');
                for (var i in SlsmanData) {
                    var SLSMAN = SlsmanData[i];
                    $('#lstSalesman').append('<option value="' + SLSMAN.Salesman + '">' + SLSMAN.Salesman + ' - ' + SLSMAN.SlsName + '</option>');
                }
                callback(true);
            }
        });
    }

    /*Load Credit Terms from F_TERMS table by Abi :: Created on 09May2018 */
    function LoadCreditTerms(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetTermsForDropdown',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('#lstCreditTerms').empty();
                var TermsData = output.d;
                $('#lstCreditTerms').append('<option value="0">Select</option>');
                for (var i in TermsData) {
                    var Terms = TermsData[i];
                    $('#lstCreditTerms').append('<option value="' + Terms.Code.trim() + '">' + Terms.Code.trim() + ' - ' + Terms.TermsDesc.trim() + '</option>');
                }
                callback(true);
            }
        });
    }

    /*Load Carrier from F_CARRIE table by Abi :: Created on 09May2018 */
    function LoadCarriers(callback) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCarriersForDropdownList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $("#lstCarrier,#lstTruckMon ,#lstTruckTue, #lstTruckWed ,#lstTruckThu, #lstTruckFri, #lstTruckSat, #lstTruckSun").empty();
                var CarrierData = output.d;
                $("#lstCarrier,#lstTruckMon ,#lstTruckTue ,#lstTruckWed, #lstTruckThu ,#lstTruckFri, #lstTruckSat, #lstTruckSun").append('<option value="0">Select</option>');
                for (var i in CarrierData) {
                    var Carrier = CarrierData[i];
                    $("#lstCarrier,#lstTruckMon ,#lstTruckTue, #lstTruckWed, #lstTruckThu, #lstTruckFri, #lstTruckSat, #lstTruckSun").append('<option value="' + Carrier.Carrier + '">' + Carrier.Carrier + ' - ' + Carrier.Name + '</option>');
                }
                callback(true);
            }
        });
    }

    $("#lstCountry").change(function () {

        $("#lstAirport").focus();
    });

    $("#lstAirport").change(function () {
        $("#txtPaymentTerms").focus();
    });

    function LoadCustomerDetails(Customer) {


        if (Customer == "0" && IsCustomerAdd == true) {
            resetCustomerInputFields()
            SetDefaultCustomerValue();
        }
        else {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustDetailsByCustomerNoWithPrevNextCustomer',
                data: '{ "Customer":"' + Customer + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    var res = output.d;
                    $("#txtCustNo").val("");
                    $("#txtCustNo").attr("placeholder", res.Customer);
                    $("#txtCustomer").val(res.Name);
                    $("#lstType").val(res.Type);
                    $("#txtOpenMark").val("");
                    $("#txtOpenMark").attr("placeholder", parseFloat(res.Markup).toFixed(4));
                    $("#txtAddress1").val(res.ADDRESS1);
                    //$("#txtFB").val("");
                    //$("#txtFB").attr("placeholder", parseFloat(res.Packing).toFixed(2));
                    //$("#txtHB").val("");
                    //$("#txtHB").attr("placeholder", parseFloat(res.PackingHB).toFixed(2));
                    $("#txtAddress2").val(res.ADDRESS2);
                    //$("#txtQB").val("");
                    //$("#txtQB").attr("placeholder", parseFloat(res.PackingQB).toFixed(2));
                    //$("#txtTR").val("");
                    //$("#txtTR").attr("placeholder", parseFloat(res.PackingTR).toFixed(2));
                    $("#txtCity").val(res.CITY);
                    $("#lstCountry").val(res.COUNTRY);
                    $("#txtState").val(res.STATE);
                    $("#txtZip").val(res.ZIP);
                    $("#lstAirport").val(res.Airport);
                    $("#txtTerritory").val(res.Territory);
                    $("#txtWarehouse").val(res.Warehouse);
                    $("#txtDivision").val(res.Division);
                    $("#chkExclude").iButton("toggle", res.Exclude == false ? false : true);

                    $("#txtBuyerName").val(res.Purchaser);
                    $("#txtBuyerTelephone").val(res.PHONE);
                    $("#txtBuyerExt").val(res.Ext1);
                    $("#txtContact").val(res.CONTACT);
                    $("#txtContactTelephone").val(res.APPHONE);
                    $("#txtContactExt").val(res.Ext2);
                    $("#txtContactTitle").val(res.Title);
                    $("#txtFax").val(res.Fax);
                    $("#txtContactTitleExt").val(res.Ext3);
                    $("#txtEmailAddress").val(res.Email);

                    $("#lstSalesman").val(res.SalesMan);
                    $("#lstCreditTerms").val(res.TERMSCODE);
                    $("#chkPrepaid").iButton("toggle", res.Prepaid == false ? false : true);
                    $("#chkLineFuel").iButton("toggle", res.LineFuel == false ? false : true);
                    $("#txtBillTo").val(res.Billto);
                    $("#txtParent").val(res.Parent);
                    $("#txtCreditLimit").val("");
                    $("#txtCreditLimit").attr("placeholder", parseFloat(res.ARLimit).toFixed(2));
                    $("#txtInterest").val("");
                    $("#txtInterest").attr("placeholder", parseFloat(res.Interest).toFixed(2));
                    $("#txtResale").val(res.SalesID);
                    $("#chkAppOnFile").iButton("toggle", res.CreditApp == 'Y' ? true : false);
                    $("#txtDated").val(res.CreditDate);
                    $("#chkCreditHold").iButton("toggle", res.Credithold == 'Y' ? true : false);
                    $("#chkReportNACM").iButton("toggle", res.NACM == 'Y' ? true : false);
                    $("#txtNACM").val(res.NACMNUM);
                    $("#chkChargeFuel").iButton("toggle", res.ChargeFuel == false ? false : true);
                    $("#txtReason").val(res.ReasonHold);
                    $("#txtPrint").val(res.FaxOrEmail);
                    $("#chkSendStatement").iButton("toggle", res.Statement == false ? false : true);
                    $("#chkCollLetter").iButton("toggle", res.Collection == false ? false : true);
                    $("#chkOKtoSell").iButton("toggle", res.OktoSell == 'Y' ? true : false);
                    $("#txtService").val("");
                    $("#txtVendor").val(res.Vendor);
                    $("#txtShippingInst").val(res.ShipInstr);
                    var CallTime = res.CallTime;
                    var CTime = "";
                    if (CallTime != "") {
                        var splitCTime = CallTime.match(/.{1,2}/g);
                        CTime = splitCTime[0] + ":" + splitCTime[1];
                    }
                    $("#txtTimeToCall").val(CTime.trim());
                    $("#txtDaysTruck").val("");
                    $("#lstCarrier").val(res.Carrier);
                    $("#txtDatesOnLabel").val("");
                    $("#chkDuty").iButton("toggle", res.AndeanTax == false ? false : true);
                    $("#txtShipper").val(res.Armellini2);
                    $("#ctl00_DivNextCustomer").html(res.NextCustomer);
                    $("#ctl00_DivPrevCustomer").html(res.PrevCustomer);

                    var days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

                    var CallDays = res.CallDays;
                    var CDays = "";
                    if (CallDays != "") {
                        var splitCDays = CallDays.split('');
                        for (var i = 0; i < splitCDays.length; i++) {
                            switch (i) {
                                case i:
                                    if (splitCDays[i] != " ") {
                                        (splitCDays.length == 1) ? CDays = days[i] : CDays += "&nbsp;&nbsp;" + days[i];
                                    }
                                    $("#chkCallDays" + days[i]).iButton("toggle", splitCDays[i].trim() == "Y" ? true : false);
                                    break;
                            }
                        }
                    }

                    var DeliveryDays = res.DeliveryDays;
                    var Dells = "";
                    if (DeliveryDays != "") {
                        var splitDDays = DeliveryDays.match(/.{1,3}/g);
                        for (var i = 0; i < days.length; i++) {
                            switch (i) {
                                case i:
                                    if (splitDDays[i] == undefined) {
                                        splitDDays[i] = "";
                                    }
                                    $("#lstTruck" + days[i]).val(splitDDays[i].trim());
                                    break;
                            }
                        }
                    }
                }
            });
        }

    }

    function resetCustomerInputFields() {

        $("#txtCustNo").val("");
        $("#ctl00_DivNextCustomer").html("0");
        $("#ctl00_DivPrevCustomer").html("0");
        $("#txtCustomer").val("");
        $("#lstType").val("");
        $("#txtOpenMark").val("");
        $("#txtOpenMark").attr("placeholder", "0.0000");
        $("#txtAddress1").val("");
        //$("#txtFB").val("");
        //$("#txtFB").attr("placeholder", "0.00");
        //$("#txtHB").val("");
        //$("#txtHB").attr("placeholder", "0.00");
        $("#txtAddress2").val("");
        //$("#txtQB").val("");
        //$("#txtQB").attr("placeholder", "0.00");
        //$("#txtTR").val("");
        //$("#txtTR").attr("placeholder", "0.00");
        $("#txtCity").val("");
        $("#lstCountry").val("");
        $("#txtState").val("");
        $("#txtZip").val("");
        $("#lstAirport").val("");
        $("#txtTerritory").val("");
        $("#chkExclude").iButton("toggle", false);

        $("#txtBuyerName").val("");
        $("#txtBuyerTelephone").val("");
        $("#txtBuyerExt").val('');
        $("#txtContact").val("");
        $("#txtContactTelephone").val("");
        $("#txtContactExt").val('');
        $("#txtContactTitle").val("");
        $("#txtFax").val("");
        $("#txtContactTitleExt").val('');
        $("#txtEmailAddress").val("");

        $("#lstSalesman").val("");
        $("#lstCreditTerms").val("");
        $("#chkPrepaid").iButton("toggle", false);
        $("#chkLineFuel").iButton("toggle", true);
        $("#txtBillTo").val("");
        $("#txtParent").val("");
        $("#txtCreditLimit").val("");
        $("#txtCreditLimit").attr("placeholder", "500.00");
        $("#txtInterest").val("");
        $("#txtInterest").attr("placeholder", "0.00");
        $("#txtResale").val("");
        $("#chkAppOnFile").iButton("toggle", true);
        $("#txtDated").val("");

        $("#chkReportNACM").iButton("toggle", true);
        $("#txtNACM").val("");
        $("#txtReason").val("");
        $("#chkChargeFuel").iButton("toggle", false);
        $("#txtPrint").val("");
        $("#chkSendStatement").iButton("toggle", true);
        $("#chkCollLetter").iButton("toggle", true);
        $("#chkOKtoSell").iButton("toggle", false);
        $("#txtService").val("");
        $("#txtShippingInst").val("");

        $("#txtTimeToCall").val("");
        $("#txtDaysTruck").val("");
        $("#lstCarrier").val("");
        $("#txtDatesOnLabel").val("");
        $("#txtWarehouse").val("");
        $("#txtDivision").val("1");

        $("#txtShipper").val("");

        var days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

        for (var i = 0; i < days.length; i++) {
            $("#chkCallDays" + days[i]).iButton("toggle", false);
            $("#lstTruck" + days[i]).val("");
        }
        SetDefaultCustomerValue();
    }


    $("#btnCustomerDetailsSave").die("click").live("click", function () {
        var Customer = $("#txtCustNo").val() == "" ? $("#txtCustNo").attr("placeholder") : $("#txtCustNo").val();

        var CustName = $("#txtCustomer").val();
        if (CustName == "") {
            $("#msgbox-CustDetailsSave").dialog("open");
            $("#msghtml-CustDetailsSave").html("Please enter customer name.");
            return false;
        }
        debugger;
        if (IsCustomerAdd == true) {
            if (Customer == "" || Customer == undefined || Customer == null)
                GetNextCustomerNoFromConst();   /*Prompt for Customer# and get the cust# from CONSTANT by default*/
            else
                SaveCustomerDetails(Customer);                
        }
        else {
            SaveCustomerDetails(Customer);
        }        
    });

    function CheckCustomerCreatedfromSales() {
        if ($("#hdnCustomerSalesYN").val() == "Y") {
            $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetPage',
                        data: '{ "controlName":"pages/PageOrderNew.ascx","controlPara":"" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            $("#DivOrderNewPageContent").html(output.d);                            
                            $("#CurrentCustomerNo").html(($("#txtCustNo").val() == "" ? $("#txtCustNo").attr("placeholder") : $("#txtCustNo").val()))
                            $("#msgbox-CustDetailsWarning").dialog("close");
                            $("#fgrdOrderNewDetails").empty();
                            $("#fgrdOrderNewDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: ($("#txtCustNo").val() == "" ? $("#txtCustNo").attr("placeholder") : $("#txtCustNo").val()) }], query: "", newp: 1 }).flexReload();
                            $("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER :: ' + ($("#txtCustNo").val() == "" ? $("#txtCustNo").attr("placeholder") : $("#txtCustNo").val()) + ' <span style="margin-left:25px;" id="DaysTruckNewOrder">   </span>');
                            $("#DivOrderNewDetailsDialog").dialog("open");
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/GetPage',
                                data: '{ "controlName":"pages/PageOrder.ascx","controlPara":"" }',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output, status) {
                                    $("#DivOrderPageContent").html(output.d);
                    
                                }
                            });
                        }
                    });                                 
        }
    }
    function GetNextCustomerNoFromConst() {

        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetNextCustomerNoFromConst",
            data: "{}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //$("#txtCustomerNumber").val("");
                //$("#txtCustomerNumber").attr("placeholder", output.d);
                $("#txtCustNo").val("");
                $("#txtCustNo").attr("placeholder", output.d);
                $("#txtCustNo").show();
                $("#txtCustNo").focus();
                //$('#DialogCustomerUpdate input[type="text"],#DialogCustomerUpdate textarea,#DialogCustomerUpdate select').not('#txtCustNo').attr('disabled', 'disabled');
                //$('#tblCustomerDetails input[type="text"], textarea,select').not('#txtCustNo').css('background', "rgb(235, 235, 228)");
                $('#tblCustomerDetails input[type="text"],#tblCustomerDetails textarea, #tblCustomerDetails select').css('background', "rgb(235, 235, 228)");
                $("#tblCustomerDetails").not("#txtCuxtNo").css("pointer-events", "none");
                // $("#DivGetCustomerNumber").dialog("open");  /*Open the prompt for customer#*/
            }
        });
    }

    function SaveCustomerDetails(Customer) {
        if ($("#lstCountry").val() == null) {
            $.MessageBox("Country list cannot be empty..");
            return false;
        }
        var CustNo = Customer;
        $("#ctl00_DivCustomerNo").html(Customer);
        var CustName = $("#txtCustomer").val().replace("'", "~");
        var Type = $("#lstType").val();
        var Markup = $("#txtOpenMark").val() == "" ? $("#txtOpenMark").attr("placeholder") : $("#txtOpenMark").val();
        var Address1 = $("#txtAddress1").val().replace("'", "~");
        var Packing = 0; //$("#txtFB").val() == "" ? $("#txtFB").attr("placeholder") : $("#txtFB").val(); //Commented by Belal 11 Aug 2020; will not be used anymore 
        var PackingHB = 0; //$("#txtHB").val() == "" ? $("#txtHB").attr("placeholder") : $("#txtHB").val(); //Commented by Belal 11 Aug 2020; will not be used anymore 
        var Address2 = $("#txtAddress2").val().replace("'", "~");
        var PackingQB = 0; //$("#txtQB").val() == "" ? $("#txtQB").attr("placeholder") : $("#txtQB").val(); //Commented by Belal 11 Aug 2020; will not be used anymore 
        var PackingTR = 0; //$("#txtTR").val() == "" ? $("#txtTR").attr("placeholder") : $("#txtTR").val(); //Commented by Belal 11 Aug 2020; will not be used anymore 
        var City = $("#txtCity").val().replace("'", "~");
        var Country = $("#lstCountry").val() == null ? "" : $("#lstCountry").val();
        var State = $("#txtState").val();
        var Zip = $("#txtZip").val();
        var Airport = $("#lstAirport").val().replace("'", "~");
        var Territory = $("#txtTerritory").val();
        var Exclude = $("#chkExclude").is(":checked") ? "Y" : "N";

        var Purchaser = $("#txtBuyerName").val().replace("'", "~");
        var Phone = $("#txtBuyerTelephone").val();
        var BuyerExt = $("#txtBuyerExt").val();
        var Contact = $("#txtContact").val().replace("'", "~");
        var Apphone = $("#txtContactTelephone").val();
        var ContactExt = $("#txtContactExt").val();
        var Title = $("#txtContactTitle").val().replace("'", "~");
        var Fax = $("#txtFax").val();
        var ContactTitleExt = $("#txtContactTitleExt").val();
        var Email = $("#txtEmailAddress").val();

        var Salesman = $("#lstSalesman").val();
        var SalesmanName = ($("#lstSalesman option:selected").text().split("-").length > 1) ? $("#lstSalesman option:selected").text().split("-")[1].trim() : "";
        var Termscode = $("#lstCreditTerms").val();
        var TermsDesc = ($("#lstCreditTerms option:selected").text().split("-").length > 1) ? $("#lstCreditTerms option:selected").text().split("-")[1].trim() : "";
        var Prepaid = $("#chkPrepaid").is(":checked") ? "Y" : "N";
        var LineFuel = $("#chkLineFuel").is(":checked") ? "Y" : "N";
        var Billto = $("#txtBillTo").val();
        var Parent = $("#txtParent").val();
        var ARLimit = $("#txtCreditLimit").val() == "" ? $("#txtCreditLimit").attr("placeholder") : $("#txtCreditLimit").val();


        //var Interest = $("#txtInterest").val() == "" ? $("#txtInterest").attr("placeholder") : $("#txtInterest").val();
        var Interest = '';

        var SalesID = $("#txtResale").val();
        var CreditApp = $("#chkAppOnFile").is(":checked") ? "Y" : "N";
        var CreditDate = $("#txtDated").val();
        var CreditHold = $("#chkCreditHold").is(":checked") ? "Y" : "N";

        var NACM = $("#chkReportNACM").is(":checked") ? "Y" : "N";
        var NACMNUM = $("#txtNACM").val();
        var ReasonHold = $("#txtReason").val().replace("'", "~");
        var ChargeFuel = $("#chkChargeFuel").is(":checked") ? "Y" : "N";
        var FaxOrEmail = $("#txtPrint").val();
        var Statement = $("#chkSendStatement").is(":checked") ? "Y" : "N";
        var Collection = $("#chkCollLetter").is(":checked") ? "Y" : "N";
        var OkToSell = $("#chkOKtoSell").is(":checked") ? "Y" : "N";
        var Service = $("#txtService").val();
        var Vendor = $("#txtVendor").val();
        var ShipInstr = $("#txtShippingInst").val().replace("'", "~");
        var CallTime = $("#txtTimeToCall").val();
        var TruckDays = $("#txtDaysTruck").val();//fields need to be added
        var Carrier = $("#lstCarrier").val();
        var Printnodat = $("#txtDatesOnLabel").val();
        var AndeanTax = $("#chkDuty").is(":checked") ? "Y" : "N";
        var Armellini2 = $("#txtShipper").val();
        var Division = $("#txtDivision").val();
        var WareHouse = $("#txtWarehouse").val().toUpperCase(); // added by Belal 11 Aug 2020

        var days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        var Calls = '';
        var DELLS = '';
        for (var i = 0; i < days.length; i++) {
            Calls += $("#chkCallDays" + days[i]).val() == "" ? " " : $("#chkCallDays" + days[i]).is(":checked") ? "Y" : "N";
            DELLS += $("#lstTruck" + days[i]).val() == "0" ? "   " : ($("#lstTruck" + days[i]).val().length == 2 ? $("#lstTruck" + days[i]).val() + " " : ($("#lstTruck" + days[i]).val().length == 1 ? $("#lstTruck" + days[i]).val() + "  " : $("#lstTruck" + days[i]).val()));
        }

        var IsCustomerAddOrUpdate = (IsCustomerAdd == true) ? "0" : "1";/*0-Add new customer :: 1-Update existing customer*/

        /*Check if customer number already exist for new customer :: Created by Abinaya :: 06Jul2018*/
        if (IsCustomerAddOrUpdate == "0") {
            $.ajax({
                type: "POST",
                url: "BloomService.asmx/CheckIsCustomerAlreadyExist",
                contentType: "application/json;charset=utf-8",
                data: "{'Customer':'" + Customer + "'}",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "Already Exist") {
                        $("#txtCustNo").focus();
                        $.MessageBox("Customer# already exist...");
                        $('#tblcustomerdetails input[type="text"], textarea,select').not('#txtcustno').css('background', "none");
                        $("#tblCustomerDetails").not("#txtCuxtNo").css("pointer-events", "auto");
                        //return false;
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/SaveCustomerDetails',
                            contentType: "application/json; charset=utf-8",
                            data: "{'IsCustomerAdd':'" + IsCustomerAddOrUpdate + "','Customer': '" + CustNo + "','Name':'" + CustName.toUpperCase() + "','Type':'" + Type + "','Markup':'" + Markup + "','Address1':'" + escape(Address1.toUpperCase()) + "','Address2': '" + escape(Address2.toUpperCase()) + "','City':'" + City.toUpperCase() + "','Country':'" + Country.toUpperCase() + "','State':'" + State.toUpperCase() + "',  'Zip':'" + Zip + "','Airport':'" + Airport + "','Territory':'" + Territory + "','Purchaser': '" + Purchaser.toUpperCase() + "','Phone':'" + Phone + "',  'BuyerExt':'" + BuyerExt + "','Contact':'" + escape(Contact.toUpperCase()) + "','Apphone':'" + Apphone + "','ContactExt':'" + ContactExt + "','Title':'" + Title.toUpperCase() + "','Fax': '" + Fax + "','ContactTitleExt':'" + ContactTitleExt.toUpperCase() + "','Email':'" + escape(Email.toUpperCase()) + "','Salesman': '" + Salesman + "','SalesmanName':'" + SalesmanName + "', 'Termscode':'" + Termscode + "','TermsDesc':'" + TermsDesc.toUpperCase() + "','Prepaid':'" + Prepaid + "','LineFuel':'" + LineFuel + "','Billto':'" + Billto + "','Parent':'" + Parent + "','ARLimit':'" + ARLimit + "','Interest': '" + Interest + "','SalesID':'" + SalesID.toUpperCase() + "','CreditApp':'" + CreditApp + "','CreditDate':'" + CreditDate + "','CreditHold':'" + CreditHold + "','NACM': '" + NACM + "','NACMNUM':'" + NACMNUM.toUpperCase() + "','ReasonHold':'" + ReasonHold.toUpperCase() + "','ChargeFuel':'" + ChargeFuel + "','FaxOrEmail':'" + FaxOrEmail + "','Statement':'" + Statement + "','Collection':'" + Collection + "','OkToSell': '" + OkToSell + "','Service':'" + Service + "','ShipInstr':'" + ShipInstr.toUpperCase() + "','CallTime':'" + CallTime.replace(':', '') + "','Carrier':'" + Carrier + "','Printnodat':'" + Printnodat + "','AndeanTax':'" + AndeanTax + "','Armellini2':'" + Armellini2 + "','Calls':'" + Calls + "','DELLS':'" + DELLS + "','WareHouse':'" + WareHouse + "','Division':'" + Division +  "','Vendor':'" + Vendor  + "'}",
                            dataType: "json",
                            success: function (output, status) {
                                if (output.d == "Success") {
                                    $("#DivCustButtonList").show();
                                    $("#btnCustomerDetailsSave").hide();
                                    //$('#DialogCustomerUpdate input[type="text"],#DialogCustomerUpdate textarea,#DialogCustomerUpdate select').attr('disabled', 'disabled');
                                    //$('#tblCustomerDetails input[type="text"], textarea,select').css('background', "rgb(235, 235, 228)");
                                    $('#tblCustomerDetails input[type="text"],#tblCustomerDetails textarea, #tblCustomerDetails select').css('background', "rgb(235, 235, 228)");
                                    $("#tblCustomerDetails").css("pointer-events", "none");
                                    //$("[id^=chk]").iButton("disable");
                                    if ($("#hdnCustomerSalesYN").val() == "Y") {
                                        $("#DivCustomerPage").dialog("close");
                                    }
                                    CheckCustomerCreatedfromSales();
                                }
                                else if (output.d.indexOf("error") >= 0) {
                                    $.MessageBox(output.d.substring(5, output.d.length));
                                }
                                else
                                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                        });
                    }
                }
            });
        }
        else {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/SaveCustomerDetails',
                contentType: "application/json; charset=utf-8",
                data: "{'IsCustomerAdd':'" + IsCustomerAddOrUpdate + "','Customer': '" + CustNo + "','Name':'" + CustName.toUpperCase() + "','Type':'" + Type + "','Markup':'" + Markup + "','Address1':'" + escape(Address1.toUpperCase()) + "','Address2': '" + escape(Address2.toUpperCase()) + "','City':'" + City.toUpperCase() + "','Country':'" + Country.toUpperCase() + "','State':'" + State.toUpperCase() + "',  'Zip':'" + Zip + "','Airport':'" + Airport + "','Territory':'" + Territory + "','Purchaser': '" + Purchaser.toUpperCase() + "','Phone':'" + Phone + "',  'BuyerExt':'" + BuyerExt + "','Contact':'" + escape(Contact.toUpperCase()) + "','Apphone':'" + Apphone + "','ContactExt':'" + ContactExt + "','Title':'" + Title.toUpperCase() + "','Fax': '" + Fax + "','ContactTitleExt':'" + ContactTitleExt.toUpperCase() + "','Email':'" + escape(Email.toUpperCase()) + "','Salesman': '" + Salesman + "','SalesmanName':'" + SalesmanName + "', 'Termscode':'" + Termscode + "','TermsDesc':'" + TermsDesc + "','Prepaid':'" + Prepaid + "','LineFuel':'" + LineFuel + "','Billto':'" + Billto + "','Parent':'" + Parent + "','ARLimit':'" + ARLimit + "','Interest': '" + Interest + "','SalesID':'" + SalesID.toUpperCase() + "','CreditApp':'" + CreditApp + "','CreditDate':'" + CreditDate + "','CreditHold':'" + CreditHold + "','NACM': '" + NACM + "','NACMNUM':'" + NACMNUM.toUpperCase() + "','ReasonHold':'" + ReasonHold.toUpperCase() + "','ChargeFuel':'" + ChargeFuel + "','FaxOrEmail':'" + FaxOrEmail + "','Statement':'" + Statement + "','Collection':'" + Collection + "','OkToSell': '" + OkToSell + "','Service':'" + Service + "','ShipInstr':'" + ShipInstr.toUpperCase() + "','CallTime':'" + CallTime.replace(':', '') + "','Carrier':'" + Carrier + "','Printnodat':'" + Printnodat + "','AndeanTax':'" + AndeanTax + "','Armellini2':'" + Armellini2 + "','Calls':'" + Calls + "','DELLS':'" + DELLS + "','WareHouse':'" + WareHouse + "','Division':'" + Division +  "','Vendor':'" + Vendor  + "'}",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "Success") {
                        //$.MessageBox("Customer details updated")                        
                        //$("#DivCustButtonList").show();
                        //$("#DivCustomerPage").dialog("close"); Comment By Prashant on 30 Aug 2019 For not to close form
                        $("#DivCustButtonList").show();//Uncommented by Prashant
                        $("#btnCustomerDetailsSave").hide();
                        $('#tblCustomerDetails input[type="text"],#tblCustomerDetails textarea, #tblCustomerDetails select').css('background', "rgb(235, 235, 228)");
                        $("#tblCustomerDetails").css("pointer-events", "none");                        
                    }
                    else if (output.d.indexOf("error") >= 0) {
                        $.MessageBox(output.d.substring(5, output.d.length));
                    }
                    else
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            });
        }
    }

    /* Alert Box :: Warning message used on Customer details Save functionality */
    $("#msgbox-CustDetailsSave").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Alert",
        width: 450,
        buttons: {
            OK: function () {
                $(this).dialog("close");
            }
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('OK')").addClass('dialogbuttonstyle icon-save');
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('OK')").focus();
        },
        close: function (e) {
            $("#txtCustomer").focus();
        }
    });

    /*Prompt for customer number :: Created by Abinaya :: 09Jul2018*/
    $("#DivGetCustomerNumber").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Customer Number",
        width: 400,
        buttons: {
            Yes: function () {
                var Customer = $("#txtCustomerNumber").val() == "" ? $("#txtCustomerNumber").attr("placeholder") : $("#txtCustomerNumber").val();
                CheckIsCustomerExist(Customer);
                $(this).dialog("close");
            },
            No: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
        },
        close: function (e) {
            $("#txtCustomer").focus();
        }
    });

    $("#btnCustomerDetailsCancel").die("click").live("click", function () {
        //$("#DialogCustomerUpdate")
        if ($("#btnCustomerDetailsSave").is(":visible")) {
            VerifyCarrierAccount();
            $("#btnCustomerDetailsSave").hide();
            $("#DivCustButtonList").show();
            $('#tblCustomerDetails input[type="text"],#tblCustomerDetails textarea, #tblCustomerDetails select').css('background', "rgb(235, 235, 228)");
            $("#tblCustomerDetails").css("pointer-events", "none");
        }
        else {
            VerifyCarrierAccount();
            $("#DivCustomerPage").dialog("close");
        }
        if ($("#hdnCustomerSalesYN").val() == "Y") {
             $("#DivCustomerPage").dialog("close");
        }
    });

    $("#lstType").change(function () {
        $("#txtOpenMark").focus();
    });

    $("#lstCountry").change(function () {
        $("#txtState").focus();
    });

    $("#lstAirport").change(function () {
        $("#txtDivision").focus();
    });

    $("#lstSalesman").change(function () {
        $("#lstCreditTerms").focus();
    });

    $("#lstCreditTerms").change(function () {
        $("#chkPrepaid").focus();
    });

    $("#lstCarrier").change(function () {
        $("#txtDatesOnLabel").focus();
    });

    $("#lstTruckMon").change(function () {
        $("#lstTruckTue").focus();
    });

    $("#lstTruckTue").change(function () {
        $("#lstTruckWed").focus();
    });

    $("#lstTruckWed").change(function () {
        $("#lstTruckThu").focus();
    });

    $("#lstTruckThu").change(function () {
        $("#lstTruckFri").focus();
    });

    $("#lstTruckFri").change(function () {
        $("#lstTruckSat").focus();
    });

    $("#lstTruckSat").change(function () {
        $("#lstTruckSun").focus();
    });

    $("#lstTruckSun").change(function () {
        $("#txtShipper").focus();
    });

    $("#txtReason").keypress(function () {
        if (event.keyCode == 13) {
            event.preventDefault();
        }
    });

    $("#txtShippingInst").keypress(function () {
        if (event.keyCode == 13) {
            event.preventDefault();
        }
    });

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
                //else if ($(this).attr('id') == "txtCustNo") {
                //    $("#txtCustomer").focus()
                //    return false;
                //}
                else if ($(this).attr('id') == "txtCustomer") {
                    $("#lstType").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtOpenMark") {
                    $("#txtAddress1").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtAddress1") {
                    $("#txtAddress2").focus();
                    return false;
                }

                else if ($(this).attr('id') == "txtAddress2") {
                    $("#txtCity").focus();
                    return false;
                }

                else if ($(this).attr('id') == "txtCity") {
                    $("#lstCountry").focus();
                    return false;
                }
                else if ($(this).attr('id') == "lstCountry") {
                    $("#txtWarehouse").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtWarehouse") {
                    $("#txtState").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtState") {
                    $("#txtZip").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtZip") {
                    $("#lstAirport").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtDivision") {
                    $("#txtTerritory").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtTerritory") {
                    $("#chkExclude").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkExclude") {
                    $("#txtBuyerName").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtBuyerName") {
                    $("#txtBuyerTelephone").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtBuyerTelephone") {
                    $("#txtBuyerExt").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtBuyerExt") {
                    $("#txtContact").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtContact") {
                    $("#txtContactTelephone").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtContactTelephone") {
                    $("#txtContactExt").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtContactExt") {
                    $("#txtContactTitle").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtContactTitle") {
                    $("#txtFax").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtFax") {
                    $("#txtContactTitleExt").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtContactTitleExt") {
                    $("#txtEmailAddress").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtEmailAddress") {
                    $("#lstSalesman").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkPrepaid") {
                    $("#chkLineFuel").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkLineFuel") {
                    $("#txtBillTo").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtBillTo") {
                    $("#txtParent").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtParent") {
                    $("#txtCreditLimit").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtCreditLimit") {
                    $("#txtInterest").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtInterest") {
                    $("#txtResale").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtResale") {
                    $("#chkAppOnFile").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkAppOnFile") {
                    $("#txtDated").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtDated") {
                    $("#chkCreditHold").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkCreditHold") {
                    $("#chkReportNACM").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkReportNACM") {
                    $("#txtNACM").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtNACM") {
                    $("#txtReason").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtReason") {
                    $("#chkChargeFuel").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkChargeFuel") {
                    $("#txtPrint").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtPrint") {
                    $("#chkSendStatement").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkSendStatement") {
                    $("#chkCollLetter").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkCollLetter") {
                    $("#chkOKtoSell").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkOKtoSell") {
                    $("#txtService").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtService") {
                    $("#txtShippingInst").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShippingInst") {
                    $("#chkCallDaysMon").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkCallDaysMon") {
                    $("#chkCallDaysTue").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkCallDaysTue") {
                    $("#chkCallDaysWed").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkCallDaysWed") {
                    $("#chkCallDaysThu").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkCallDaysThu") {
                    $("#chkCallDaysFri").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkCallDaysFri") {
                    $("#chkCallDaysSat").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkCallDaysSun") {
                    $("#txtTimeToCall").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtTimeToCall") {
                    $("#txtDaysTruck").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtDaysTruck") {
                    $("#lstCarrier").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtDatesOnLabel") {
                    $("#chkDuty").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkDuty") {
                    $("#lstTruckMon").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtShipper") {
                    $("#btnCustomerDetailsSave").focus();
                    return false;
                }
            }
        }
    });

    $("#btnCustShipto").die("click").live("click", function () {

        $(".imgLoaderForUser").show();
        var Customer = $("#ctl00_DivCustomerNo").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageShipto.ascx","controlPara":"' + Customer + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DialogCustomerShipto">/div>').dialog({
                    title: 'Shipto Maintenance :: ' + Customer,
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1080,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                    }
                });
                $("#DialogCustomerShipto").html(output.d).dialog("open");
            }
        });
    });

    $("#btnCustCarrier").die("click").live("click", function () {

        $(".imgLoaderForUser").show();
        var Customer = $("#ctl00_DivCustomerNo").html();
        var Shipto = "0";
        var para = 'Customer=' + Customer + '&Shipto=' + Shipto;
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
    });


    //Added by Anubhuti 08/10/2021
     function LoadfCarriers() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCarriersForDropdownList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                    $("#lstFreightCarrier").empty();
                    var CarrierData = output.d;
                    $("#lstFreightCarrier").append('<option value="0">Select</option>');
                    for (var i in CarrierData) {
                        var Carrier = CarrierData[i];
                        $("#lstFreightCarrier").append('<option value="' + Carrier.Carrier + '">' + Carrier.Carrier + ' - ' + Carrier.Name + '</option>');
                    }
                if ($("#hdnSelectedCarrier").val() != "") {
                    $("#lstFreightCarrier").val($("#hdnSelectedCarrier").val());
                }
                
            }
        });
    }
    $("#btnFreight").die("click").live("click", function () {
         $("#DivViewFreightDialog").dialog("open");
    });

    $("#DivViewFreightDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Freight By Carrier",
        width: 700,
        height: 400,
        open: function (e) {
            $("#DivViewFreightDialog").dialog('option', { 'title': 'Freight By Carrier ::' + ($("#ctl00_DivCustomerNo").html()), 'width': '700px' });
            LoadViewCustomerFreightByCarrierGrid();
        },
        close: function () {
            
        }
    });
    function LoadViewCustomerFreightByCarrierGrid() {
        $("#fgrdViewFreight").flexigrid({
            url: 'BloomService.asmx/GetCustomerFreightByCarrierForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Customer', name: 'Customer', width: 50, sortable: true, align: 'left' },
                { display: 'Carrier Name', name: 'Carrier', width: 180, sortable: true, align: 'left' },
                { display: 'Charge Amount', name: 'ChargeAmount', width: 100, sortable: true, align: 'left' },
                { display: 'Charge By', name: 'ChargeBy', width: 50, sortable: false, align: 'left' },
                { display: 'Last Update By', name: 'UPDUSER', width: 80, sortable: false, align: 'left' },
                { display: 'Date', name: 'UPDDATE', width: 120, sortable: false, align: 'left' },
                //{ display: 'Time', name: 'UpdTime', width: 80, sortable: false, align: 'left', process: CaCodeHeaderRowClick },
            ],
            searchitems: [
                { display: 'NAME', name: 'Name' },
                { display: 'CARRIER', name: 'Carrier' },
            ],
            showTableToggleBtn: true,
            sortname: "Carrier",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            height: 200,
            width: 650,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' },
                { name: 'Customer', value: $("#ctl00_DivCustomerNo").html() },
                { name: 'Carrier', value: '' }
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewCarrierCode },
            ],
            onSuccess: function () {
                debugger;
                if ($("#DivCarrierID").html() != "0" && $("#fgrdShiptoCarriers #row" + $("#DivCarrierID").html()).css('display') == "table-row") {
                    var id = $("#DivCarrierID").html();
                    $("#fgrdViewFreight [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdViewFreight td.unsorted").addClass("sorted");
                    $("#fgrdViewFreight td.sorted").removeClass("unsorted");
                    $("#fgrdViewFreight #row" + id).addClass("trSelectedHeader");
                    $("#fgrdViewFreight #row" + id).removeClass("trSelected");
                    $("#fgrdViewFreight #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdViewFreight #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#DivCarrierID").html($("#fgrdViewFreight tr:first").attr("id").replace("row", ""));
                    $("#fgrdViewFreight tr:first").addClass("trSelectedHeader trSelected");
                }

                var sel = jQuery("#fgrdShiptoCarriers tbody tr");
                var len = sel.length;

                if (len > 1) {
                    $("#DialogShiptoCarriers #ExportCSV").show();
                }

                var wtf = $("#fgrdViewFreight").closest('div');
                var height = wtf[0].scrollHeight;
                wtf.scrollTop(height);
            },
            onError: function (xhr, status, errorThrown) {
                debugger;
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });
    }
      function AddNewCarrierCode() {
        debugger;
        $(".YellowWarning").hide();
        $(".Warning").hide();
        $("#hdnSelectedCarrier").val("");
        $("#hdnID").val("");
        $("#txtChargeAmount").val("");
        $("#lstFreightCarrier").val(0);
        $("#lstChargeBy").val("C");
        LoadfCarriers();
        $("#AddCustomerFreightByCarrier").dialog("open");
    }

    $("#AddCustomerFreightByCarrier").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 380,
        height: 230,
        title: 'Add/Edit Freight By Carrier',
        buttons: {
            Save: function () {
                debugger;           
                var Carrier = $("#lstFreightCarrier").val();
                var ChargeAmount = $("#txtChargeAmount").val();
                var ChargeBy = $("#lstChargeBy").val();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveCustomerFreightByCarrier',
                    data: '{"Customer":"' + $("#ctl00_DivCustomerNo").html() + '","Carrier":"' + Carrier + '","ChargeAmount":"' + ChargeAmount + '","ChargeBy":"' + ChargeBy + '","ID":"' + $("#hdnID").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d == "Success") {
                            $("#AddCustomerFreightByCarrier").dialog("close");
                            $("#fgrdViewFreight").flexReload({ url: 'url/for/refresh' });

                        }
                        else {
                            $(".Warning").show();
                        }
                    }
                });
            },
            Cancel: function () {
                debugger;
                $(this).dialog("close");
            },
        },
        open: function () {                       
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

   

     $("[id^=EditFreightByCarrier_]").die("click").live("click", function () {
        debugger
        ID = $(this).attr("id").replace("EditFreightByCarrier_", "").trim();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetCustomerFreightByCarrierByID",
            data: "{'ID':'" + ID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                debugger
                var Freight = output.d;
                LoadfCarriers();
                $("#lstFreightCarrier").val(Freight.Carrier);
                $("#hdnSelectedCarrier").val(Freight.Carrier);                
                $("#txtChargeAmount").val(Freight.ChargeAmount);
                $("#lstChargeBy").val(Freight.ChargeBy);
                $("#hdnID").val(Freight.ID);
                $("#AddCustomerFreightByCarrier").dialog("open");
            }
        });
    });

    $("[id^=DeleteFreightByCarrier_]").die("click").live("click", function () {
       ID = $(this).attr("id").replace("DeleteFreightByCarrier_", "").trim();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/DeleteCustomerFreightByID",
            data: "{'ID':'" + ID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                $("#fgrdViewFreight").flexReload({ url: '/url/for/refresh' });
            }
        });
    });

    
    $("#btnNotes").die('click').live('click', function () {
        var Customer = $("#ctl00_DivCustomerNo").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustomerComments',
            data: "{'Customer': " + $("#ctl00_DivCustomerNo").html() + "}",
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
                                    data: "{'Customer': '" + $("#ctl00_DivCustomerNo").html() + "','Comments':'" + escape($("#txtCustomerComments").val()) + "'}",
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

    $("#btnCustEdit").die("click").live("click", function () {
        //debugger;

        if ($("#ctl00_LoggedInUserType_Customermaintenance").html() == "sales person") {
            $.MessageBox("you do not have permission to edit the customer details");
        }
        else {
            IsCustomerAdd = false;
            $("#btnCustomerDetailsSave").show();
            $("#DivCustButtonList").hide();
            //$("#txtCustNo").attr("readonly", "readonly");
            //$('#tblCustomerDetails input[type="text"], textarea,select').not("#txtCustNo").css('background', "none");
            $('#tblCustomerDetails input[type="text"], textarea,select').css('background-color', "cornsilk")
            //$('#DialogCustomerUpdate input[type="text"],#DialogCustomerUpdate textarea,#DialogCustomerUpdate select').not("#txtCustNo").attr('disabled', false);
            $("#tblCustomerDetails").not("#txtCustNo").css("pointer-events", "auto");
            //$("[id^=chk]").iButton("disable");
            $("#txtCustomer").focus();
        }
    });

    $("#btnCustDelete").die("click").live("click", function () {
        //debugger;
        if ($("#ctl00_LoggedInUserType_Customermaintenance").html() == "sales person") {
            $.MessageBox("you do not have permission to edit the customer details");
        }
        else {

            var Customer = $("#ctl00_DivCustomerNo").html();
            if (Customer == "0") {
                IsCustomerAdd = false;
                $.MessageBox("No Customer Select For Delete");
                return false;
            }
            else {
                var CustName = $("#txtCustomer").val();
                $("#DeleteConfirmCustomer").html("<p>Are you sure to delete the Customer <b> " + Customer + " - " + CustName + "</b> ?</p>");
                $("#DeleteConfirmCustomer").dialog("open");
            }
        }
    });

    $("#DeleteConfirmCustomer").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var Customer = $("#ctl00_DivCustomerNo").html();
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/DeleteCustomer",
                    contentType: "application/json;charset=utf-8",
                    data: "{'Customer':'" + Customer + "'}",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == "Success") {
                            $("#DeleteConfirmCustomer").dialog("close");
                            $("#DivCustomerPage").dialog("close");
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
        open: function () {
            $("#txtCode").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });
    function VerifyCarrierAccount() {
        var days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        var DELLS = '';
        for (var i = 0; i < days.length; i++) {
            DELLS += $("#lstTruck" + days[i]).val() == "0" ? "," : $("#lstTruck" + days[i]).val() + ",";
        }
        var Customer = $("#ctl00_DivCustomerNo").html();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/VerifyCarrierAccount",
            contentType: "application/json;charset=utf-8",
            data: '{"Customer":"' + Customer + '","DELLS":"' + DELLS + '"}',
            dataType: "json",
            success: function (output, status) {
                if (output.d != "Success") {
                    $.MessageBox(output.d)
                    return false;
                }
            }
        });
    }
    $('#DialogCustomerUpdate').unbind('keydown').bind('keydown', function (e) {
        //debugger;
        var focused = document.activeElement;
        if (e.which == 34) { //key page down
            $("#btnCustomerDetailsSave").focus();
            return false;
        }
    });

    $("#btnCustNext").die("click").live("click", function () {
        //debugger;
        if ($("#ctl00_LoggedInUserType_Customermaintenance").html() == "sales person") {
            $.MessageBox("you do not have permission to edit the customer details");
        }
        else {
            var NextCustomer = $("#ctl00_DivNextCustomer").html();
            if (NextCustomer == "0") {
                return false;
            }
            else {
                IsCustomerAdd = false;
                LoadCustomerDetails(NextCustomer);
            }
        }
    });
    $("#btnCustPrev").die("click").live("click", function () {
        //debugger;
        if ($("#ctl00_LoggedInUserType_Customermaintenance").html() == "sales person") {
            $.MessageBox("you do not have permission to edit the customer details");
        }
        else {
            var PrevCustomer = $("#ctl00_DivPrevCustomer").html();
            if (PrevCustomer == "0") {
                return false;
            }
            else {
                IsCustomerAdd = false;
                LoadCustomerDetails(PrevCustomer);
            }
        }
    });
    $("#btnConfirmPayment").die("click").live("click", function () {
        if ($("#ctl00_LoggedInUserType_Customermaintenance").html() == "sales person") {
            $.MessageBox("you do not have permission to edit the customer details");
        }
        else {
            var PrevCustomer = $("#ctl00_DivPrevCustomer").html();
            if (PrevCustomer == "0") {
                return false;
            }
            else {
                IsCustomerAdd = false;
                LoadCustomerDetails(PrevCustomer);
            }
        }
    });

</script>
