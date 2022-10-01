<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageFarms.ascx.vb" Inherits="pages_PageFarms" %>
<script src="js/validation.js"></script>
<style>
     /*Added by Anubhuti*/
    .ui-dialog-buttonset
    {
        float:none !important;
        padding-top:2px !important;
        padding-left:15px !important;
    }
    /*.ibutton-handle
    {
        width:unset !important;
        left: 60px !important;
    }
   
    div.ibutton-label-off span
    {
        margin-right: -60px !important;
        padding-right:5px !important;
    }
    .ibutton-label-on
    {
        width: 64px !important;
    }
    div.ibutton-label-on span
    {
        margin-left: -19px !important;
        padding-left:5px !important;
    }*/
    .ibutton-container
    {
        width:76px !important;
    }
     .ibutton-label-off{
        width:95% !important;
    }
      /*.ibutton-label-on{
        width:95% !important;
    }*/
     /**/
</style>
<div id="DivFarmsForFgrd">
    <table id="fgrdFarms" style="display: none;"></table>
    <div id="OldId" style="display: none;"></div>
    <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
</div>

<div id="DivFarms" style="display: none; /*font-size: 14px; */" class="filesTab">
    <table>
        <tr>
            <td>
                <table>
                    <tbody>
                        <tr>
                            <td colspan="4">
                                <table style="width: 100%">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <label>Farm Code:</label>
                                            </td>
                                            <td>
                                                <input type="text" id="txtFarmCode" maxlength="6" style="width: 60px;" class="AllUpperCaseTextBox" />
                                            </td>
                                            <td>
                                                <span>Open on:</span>
                                            </td>
                                            <td colspan="3">
                                                <label id="lblOpenOn" style="width: 80px;"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Farm Name:</label>
                                            </td>
                                            <td>
                                                <input type="text" id="txtFarmName" maxlength="25" style="width: 240px;" class="AllUpperCaseTextBox" />
                                            </td>
                                            <td>
                                                <span>Country:</span>
                                            </td>
                                            <td>
                                                <select id="lstCountry" style="width: 150px;">
                                                </select>
                                            </td>
                                            <td style="text-align: left;">
                                                <span>City:</span>
                                            </td>
                                            <td style="text-align: right;">
                                                <select id="lstCity" style="width: 150px;">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Payment Terms:</label>
                                            </td>
                                            <td>
                                                <input type="text" id="txtPaymentTerms" class="AllUpperCaseTextBox" />
                                            </td>
                                            <td>
                                                <span>Purchase Type:</span>
                                            </td>
                                            <td>
                                                <input type="text" id="txtPurchaseType" maxlength="1" style="width: 20px;" placeholder="" class="AllUpperCaseTextBox" />
                                            </td>
                                            <td class="GenerateAutoPO">
                                                <span>Generate Auto PO:</span>
                                            </td>
                                            <td class="GenerateAutoPO">
                                                <input type="checkbox" id="txtAutoPO" style="width: 45px !important;"  />
                                               <%-- <input type="text" id="txtAutoPO" maxlength="1" style="width: 20px;" placeholder="" class="AllUpperCaseTextBox" />--%>

                                            </td>

                                        </tr>
                                        <tr>
                                            <%--<td>
                                    <label>Anti-dumping:</label>
                                </td>
                                <td>
                                    <input type="text" id="txtAntidump" class="ClsTwoDecimalsOnly" maxlength="6" style="text-align: right; width: 80px;" placeholder="0.0000">
                                </td>--%>
                                            <td>
                                                <span>Gpm/Comm %:</span>
                                            </td>
                                            <td colspan="1">
                                                <input type="text" id="txtCommission" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" style="text-align: right; width: 60px;" placeholder="0.00" />
                                            </td>
                                            <td>
                                                <label>Manufac ID:</label>
                                            </td>
                                            <td>
                                                <input type="text" id="txtMANUFACID" maxlength="20" style="width: 150px;" class="AllUpperCaseTextBox" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="padding: 0px;">
                                <hr>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table style="width: 100%;">
                                    <tbody>
                                        <tr style="display: none">
                                            <td>
                                                <span>Box Charged Returned :  </span>
                                            </td>
                                            <td style="text-align: right;">
                                                <span>By %</span>
                                            </td>
                                            <td>
                                                <input style="text-align: right; width: 50px;" type="text" id="txtBy" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" placeholder="0" />
                                            </td>
                                            <td>
                                                <span>%   Or </span>
                                            </td>
                                            <td>
                                                <span>Per FB</span>
                                            </td>
                                            <td>
                                                <input type="text" style="width: 50px; text-align: right;" id="txtFB" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" placeholder="0.00" />
                                            </td>
                                            <td style="text-align: right;">
                                                <span>HB: </span>
                                            </td>
                                            <td>
                                                <input type="text" style="width: 50px; text-align: right;" id="txtHB" class="ClsTwoDecimalsOnly searchplaceholder" placeholder="0.00" />
                                            </td>
                                            <td style="text-align: right;">
                                                <span>QB:</span>
                                            </td>
                                            <td style="text-align: right;">
                                                <input type="text" style="width: 50px; text-align: right;" id="txtQB" class="ClsTwoDecimalsOnly searchplaceholder" placeholder="0.00" />
                                            </td>
                                        </tr>
                                        <tr style="display: none">
                                            <td>
                                                <span>Handling Charge :</span>
                                            </td>
                                            <td>
                                                <span>% Of Boxchge </span>
                                            </td>
                                            <td>
                                                <input style="width: 50px; text-align: right;" type="text" id="txtBoxchge" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" placeholder="0" />
                                            </td>
                                            <td>
                                                <span>%   Or</span>
                                            </td>
                                            <td>
                                                <span>Per FB </span>
                                            </td>
                                            <td>
                                                <input type="text" style="width: 50px; text-align: right;" id="txtHandlingFB" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" placeholder="0.00" />
                                            </td>
                                            <td style="text-align: right;">
                                                <span>HB: </span>
                                            </td>
                                            <td>
                                                <input type="text" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" style="text-align: right; width: 50px;" id="txtHandlingHB" placeholder="0.00" />
                                            </td>
                                            <td style="text-align: right;">
                                                <span>QB:</span>
                                            </td>
                                            <td style="text-align: right;">
                                                <input type="text" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" style="text-align: right; width: 50px;" id="txtHandlingQB" placeholder="0.00" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span>Deduct (Y/N) :</span>
                                                <label style="text-align: right;">MPF :</label>
                                            </td>
                                            <td>
                                                <input style="width: 15px;" type="text" maxlength="1" id="txtMpf" class="searchplaceholder" />
                                                <label>Broker fee :</label>
                                            </td>

                                            <td>
                                                <input type="text" style="width: 15px;" class="searchplaceholder" maxlength="1" id="txtBrokerfee" />
                                            </td>
                                            <td></td>
                                            <td>
                                                <span>Cartage :</span>
                                            </td>
                                            <td>
                                                <input type="text" class="searchplaceholder" style="width: 15px;" maxlength="1" id="txtCartage" />
                                            </td>
                                            <td>
                                                <span>Handling :</span>
                                            </td>
                                            <td>
                                                <input type="text" class="searchplaceholder" style="width: 15px;" maxlength="1" id="txtHandling" />
                                            </td>
                                            <td>
                                                <span>Freight :</span>
                                            </td>
                                            <td>
                                                <input type="text" class="searchplaceholder" style="width: 15px; margin-left: 2px;" maxlength="1" id="txtFreight" />
                                            </td>
                                        </tr>
                                        <tr style="display: none">
                                            <td>
                                                <span>Return  Fuel</span>
                                                <span style="float: right;">( Y / N )  :</span>
                                            </td>
                                            <td>
                                                <input style="width: 15px;" class="searchplaceholder" type="text" maxlength="1" id="txtRetFuel" />
                                                <span style="text-align: right;">as a % :</span>
                                            </td>
                                            <td>
                                                <input class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" style="text-align: right; width: 50px;" type="text" id="txtFuelPer" placeholder="0" />
                                            </td>
                                            <td style="text-align: center;">
                                                <span>Or</span>
                                            </td>
                                            <td>
                                                <span>Per FB</span>
                                            </td>
                                            <td>
                                                <input type="text" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" style="text-align: right; width: 50px;" id="txtFuelFB" placeholder="0.00" />
                                            </td>
                                            <td style="text-align: right;">
                                                <span>HB:</span>
                                            </td>
                                            <td>
                                                <input type="text" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" style="text-align: right; width: 50px;" id="txtFuelHB" placeholder="0.00" />
                                            </td>
                                            <td style="text-align: right;">
                                                <span>QB:</span>
                                            </td>
                                            <td style="text-align: right;">
                                                <input type="text" class="ClsTwoDecimalsOnly searchplaceholder" maxlength="6" style="text-align: right; width: 50px;" id="txtFuelQB" placeholder="0.00" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="padding: 0px;">
                                <hr>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Office Address:</label>
                            </td>
                            <td colspan="3" style="">
                                <input type="text" id="txtOffAdd1" maxlength="100" style="width: 99.4%;" class="AllUpperCaseTextBox" />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Office Phone# :</label>
                            </td>
                            <td>
                                <input type="text" id="txtOffPhone" style="width: 245px;" class="AllUpperCaseTextBox" />
                            </td>
                            <td>
                                <span style="text-align: center;">Office Fax# : </span>
                            </td>
                            <td>
                                <input type="text" id="txtOffFax" maxlength="20" style="width: 98%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Owner:</label>
                            </td>
                            <td>
                                <input type="text" id="txtOwner" maxlength="25" style="width: 245px;" class="AllUpperCaseTextBox" />
                            </td>
                            <td style="text-align: left;">
                                <span>Phone: </span>
                            </td>
                            <td>
                                <input type="text" id="txtOwnerPhone" maxlength="25" style="width: 98%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Manager:</label>
                            </td>
                            <td>
                                <input type="text" id="txtManager" maxlength="25" style="width: 245px;" class="AllUpperCaseTextBox" />
                            </td>
                            <td style="text-align: left;">
                                <span>Phone: </span>
                            </td>
                            <td>
                                <input type="text" id="txtManagerPhone" maxlength="25" style="width: 98%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Secretary:</label>
                            </td>
                            <td>
                                <input type="text" id="txtSecretary" maxlength="25" style="width: 245px;" class="AllUpperCaseTextBox" />
                            </td>
                            <td style="text-align: left;">
                                <span>Phone: </span>
                            </td>
                            <td>
                                <input type="text" id="txtSecretaryPhone" maxlength="25" style="width: 98%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Sales person:</label>
                            </td>
                            <td>
                                <input type="text" id="txtSalesPerson" style="width: 245px;" class="AllUpperCaseTextBox" />
                            </td>
                            <td style="text-align: left;">
                                <span style="">Phone: </span>
                            </td>
                            <td>
                                <input type="text" id="txtCellular" maxlength="25" style="width: 98%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Post Harvest:</label>
                            </td>
                            <td>
                                <input type="text" id="txtPostHarvest" style="width: 245px;" class="AllUpperCaseTextBox" />
                            </td>
                            <td style="text-align: left;">
                                <span style="">Phone: </span>
                            </td>
                            <td>
                                <input type="text" id="txtPostHarvestPhone" maxlength="25" style="width: 98%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Bank Name:</label>
                            </td>
                            <td colspan="3">
                                <input type="text" id="txtBank" maxlength="30" style="width: 288px;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Bank Address:</label>
                            </td>
                            <td colspan="3">
                                <input type="text" id="txtBankAdd1" maxlength="150" style="width: 290px" class="AllUpperCaseTextBox" />
                                <input type="text" id="txtBankAdd2" maxlength="30" style="width: 290px" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Bank Account#:</label>
                            </td>
                            <td>
                                <input type="text" id="txtAccountNo" maxlength="15" class="AllUpperCaseTextBox" />
                            </td>
                            <td style="text-align: center;">
                                <span>Officer:</span>
                            </td>
                            <td>
                                <input type="text" id="txtOfficer" maxlength="15" style="width: 98%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="padding: 0px;">
                                <hr>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Farm Location:</label>
                            </td>
                            <td colspan="3">
                                <input type="text" id="txtFarmLoc" maxlength="15" style="width: 99.4%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Tel:</label>
                            </td>
                            <td colspan="3">
                                <input type="text" id="txtTel" maxlength="20" style="width: 99.4%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Area:</label>
                            </td>
                            <td colspan="3">
                                <input type="text" id="txtArea" maxlength="15" style="width: 99.4%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="color:red;">Categories Available:</label>
                            </td>
                            <td colspan="3">
                                <input type="text" id="txtProducts" maxlength="40" style="width: 99.4%;" class="AllUpperCaseTextBox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Credits Emails:</label>
                            </td>
                            <td colspan="3">
                                <input type="text" id="txtEmail" maxlength="150" style="width: 99.4%;" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>P/O Emails:</label>
                            </td>
                            <td colspan="3">
                                <input type="text" id="txtFarmEmail" maxlength="150" style="width: 99.4%;" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
        </tr>
    </table>
    <div style="margin-top: 10px;" class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
        <div id="DivCustButtonList2" class="ui-dialog-buttonset" style="float: left; margin-top: 10px; ">
            <input id="btnPurchases" type="button" class="BloomButtonEnabled" value="Purchases" style="width: 65px;">
        </div>
        <div id="DivCustButtonList" class="ui-dialog-buttonset" style="float: left; margin-top: 10px; ">
            <input id="btnNotes" type="button" class="BloomButtonEnabled" value="Notes" style="width: 65px;">
        </div>
        <%--<div id="DivCustDialogButtonList" class="ui-dialog-buttonset" style="float: right;">
            <button type="button" id="btnCustomerDetailsSave" style="display: none;" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false"><span class="ui-button-text">Save</span></button>
            <button type="button" id="btnCustomerDetailsCancel" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-cancel" role="button" aria-disabled="false"><span class="ui-button-text">Close</span></button>
        </div>--%>
    </div>
</div>

<div id="MsgFarmWarning" style="display: none;">
    <p id="MsgFarmHtml"></p>
</div>

<div id="divFarmID" style="display: none;">0</div>

<div id="DivPostConfirmDialog" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msgPostConfirm" class="PostDialogMsg"></p>
    </div>
</div>
<div id="DivPurchasesByFarm" style="display: none;" class="FileHover">
    <table id="tblPurchasesByFarm" style="display: none;"></table>
</div>
<div id="DivLoadPurchasesByProduct" style="display: none;" class="FileHover">
    <table id="tblLoadPurchasesByProduct" style="display: none;"></table>
</div>

<style type="text/css">
    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }
    .allbtn {
        background: url(images/check_small.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 20px;
    }

    .KometExport {
        background: url(images/Update.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .close {
        background: url(images/Filter.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .trSelectedHeader {
        background-color: red !important;
    }

    /*#DivFarms input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }
    #DivFarms textarea, #DivFarms select {
        background-color:cornsilk;
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
    /* IE10+ */

    .BloomButtonEnabled2{
        margin-right: 5px !important;
    }
    .BloomButtonEnabled3{
        margin-right: 360px !important;  /*Changed by Anubhuti*/
    }

      #tblPurchasesByFarm td div{
        padding:5px;
    }
      #tblLoadPurchasesByProduct td div{
        padding:5px;
    }
</style>

<script type="text/javascript">
    function KometVisibility() {
        var IsKometSales = '<%=ConfigurationManager.AppSettings("IsKometSales").ToString() %>'
        if (IsKometSales.toUpperCase() != 'YES') {
            $('.KometExport').parent().parent().hide();
        }
        else {
            $('.KometExport').parent().parent().show();
        }
    }
    $(document).ready(new function () {
        debugger;
        var dDate = new Date();
        $("#lblOpenOn").text(dDate.getMonth() + 1 + "/" + dDate.getDate() + "/" + dDate.getFullYear());
        LoadAirport();
        LoadCountry();
        $("#txtFarmCode").change(function (e) {
            CheckFarmCodeAlreadyExists($(this).val());
        })
        $("#fgrdFarms").flexigrid({
            url: 'BloomService.asmx/GetFarmsForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Farm', name: 'Farm', width: 60, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Name', name: 'Name', width: 225, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'FOB', name: 'FOB', width: 30, sortable: false, align: 'left', process: HeaderRowClick },
                { display: 'City', name: 'City', width: 30, sortable: false, align: 'left', process: HeaderRowClick },
                { display: 'Country', name: 'Country', width: 50, sortable: false, align: 'left', process: HeaderRowClick },
                { display: 'Manufac ID', name: 'Manufacid', width: 110, sortable: false, align: 'left', process: HeaderRowClick },
                { display: 'Email', name: 'Email', width: 400, sortable: false, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'Farm', name: 'Farm' },
                { display: 'Name', name: 'Name' },
                { display: 'City', name: 'City' },
                { display: 'Country', name: 'Country' },
                { display: 'FOB', name: 'FOB' },
                { display: 'Manufacid', name: 'Manufacid' },
            ],
            buttons: [
                //{ name: 'Import Farms', bclass: 'import', onpress: importclicked },
                { name: 'Add', bclass: 'add', onpress: addFarmclicked }, { name: 'Request ID', bclass: 'KometExport', onpress: exportFarmclicked },
                { name: '<button title="Show inactive also" style="border:none; font-weight:600; color:green;">Show all</button>', bclass: 'allbtn', onpress: allButtonClicked },
                //{ name: 'Close', bclass: 'close', onpress: closeclicked }
            ],
            showTableToggleBtn: true,
            sortname: "Farm",
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
            height: $(window).height() - 250,
            width: 1060,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                //For to show the error
                if ($("#fgrdFarms tr#row-2").length > 0) {
                    $("#fgrdFarms tr#row-2").hide();
                    $.MessageBox($("#fgrdFarms tr#row-2")[0].innerText);
                    return false;
                }
                /*Add Export button if grid has rows :: Added by Abi :: 22Jun2018*/
                var sel = jQuery("#fgrdFarms tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivFarmsForFgrd #ExportCSV").show();
                }


                if ($("#divFarmID").html() != "0" && $("#fgrdFarms #row" + $("#divFarmID").html()).css('display') == "table-row") {
                    var id = $("#divFarmID").html();
                    $("#fgrdFarms [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdFarms td.unsorted").addClass("sorted");
                    $("#fgrdFarms td.sorted").removeClass("unsorted");
                    $("#fgrdFarms #row" + id).addClass("trSelectedHeader");
                    $("#fgrdFarms #row" + id).removeClass("trSelected");
                    $("#fgrdFarms #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdFarms #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divFarmID").html($("#fgrdFarms tr:first td:nth-child(3) div").text());
                    $("#fgrdFarms tr:first").addClass("trSelectedHeader trSelected");
                }

                $("[id^=select_]").each(function () {
                    $(this)[0].src = "images/check-off.png";
                });
            }
        });

        /*Selected row higlighted with red color by Abi :: 23Apr2018*/
        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {

                if (id != 0) {
                    var FilterQuery = "";

                    $("#divFarmID").html(id.toString());

                    $("#fgrdFarms [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdFarms #row" + id).addClass("trSelectedHeader");
                    $("#fgrdFarms td.unsorted").addClass("sorted");
                    $("#fgrdFarms td.sorted").removeClass("unsorted");
                    $("#fgrdFarms #row" + id).removeClass("trSelected");
                    $("#fgrdFarms #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdFarms #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }

        KometVisibility();
        function exportFarmclicked(com, grid) {
            var count = 0
            $("[id^=select_]").each(function () {
                if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                    count = count + 1;
                }
            });
            if (count == 0) {
                $("#msg").html("Please choose Farm to POST!");
                $("#msgbox-select").dialog("open");
            }
            else {
                $("#DivPostConfirmDialog").dialog("open");
                $("#msgPostConfirm").html("Do you want POST selected Farms?");
            }
        }

        $("#DivPostConfirmDialog").dialog({
            autoOpen: false,
            resizable: false,
            width: 320,
            modal: true,
            buttons: {
                Yes: function () {
                    $("#DivPostConfirmDialog").dialog("close");
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/ExportSelectedFarms',
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            if (output.d == 'LogOut') {
                                window.location.href = "Login.aspx";
                            }
                            else {
                                $("#fgrdFarms").flexReload({ url: '/url/for/refresh' });
                                $("#DivPostConfirmDialog").dialog("close");
                                $("[id ^= SelectAll]").attr("src", "images/check-off.png");
                                $("#msg").html("Farms ID requested  successfully.");
                                $("#msgbox-select").dialog("open");
                            }
                        }
                    });
                },
                No: function () {
                    $("#DivPostConfirmDialog").dialog("close");
                }
            },

            open: function () {
                $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
                $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            }
        });

        $("[id^=select_]").die("click").live("click", function () {
            debugger;
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id');
            var img = sourceCtl.attr("src").toLowerCase();

            var SelectedID = ID.replace("select_", "");
            var Selected = "0";
            if (img.indexOf("off") > 0) {
                Selected = "1";
            }
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ToggleSelectedFarm',
                data: "{'Selected':'" + Selected + "','ID':'" + SelectedID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    if (Selected == "1") {
                        sourceCtl.prop("src", "images/check-on.png");
                    }
                    else {
                        sourceCtl.prop("src", "images/check-off.png");
                        $("[id ^= SelectAll]").attr("src", "images/check-off.png");

                    }

                }
            });

        });

        $("#SelectAll").die('click').live("click", function (e) {
            var sourceCtl = $(this);
            var img = sourceCtl.attr("src").toLowerCase();
            var Selected = "0";
            if (img.indexOf("off") > 0) {
                Selected = "1";
            }

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ToggleSelectedAllFarm',
                data: "{'SelectedAll':'" + Selected + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $("#msgbox-select").dialog("close");
                    if (Selected == "1") {
                        sourceCtl.prop("src", "images/check-on.png");
                        $("#fgrdFarms").flexReload({ url: '/url/for/refresh' });

                    }
                    else {
                        sourceCtl.prop("src", "images/check-off.png");
                        $("#fgrdFarms").flexReload({ url: '/url/for/refresh' });
                    }
                }
            });

        });

        //$("#txtOpenOn").datepicker({
        //    changeMonth: true,
        //    changeYear: true,
        //    dateFormat: 'mm/dd/yy',
        //    showOtherMonths: true,
        //    selectOtherMonths: true
        //}).datepicker("setDate", new Date());


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

        function allButtonClicked() {
            $("#fgrdFarms").flexOptions({ query: "ALL" }).flexReload();
        }

        function addFarmclicked(com, grid) {
            // $(".UserPleaseWaitOverlay").hide();
            //ClearUserFarmSession(true);

            $('#divFarmID').html("0");
            $('#txtFarmCode').val("");
            var dDate = new Date();
            $("#lblOpenOn").text(dDate.getMonth() + 1 + "/" + dDate.getDate() + "/" + dDate.getFullYear());
            $("#txtFarmName").val("");
            $("#lstCountry").val("US");
            $("#lstCity").val("MIA");
            $("#txtPaymentTerms").val("NET 30");
            $("#txtPurchaseType").val("F");
            $("#txtPurchaseType").attr("placeholder", "");
            //$("#txtAutoPO").val("");
            //$("#txtAutoPO").attr("placeholder", "");
             $('#txtAutoPO').iButton("toggle", false);
            //$("#txtAntidump").val("");
            //'$("#txtAntidump").attr("placeholder", "0.0000");
            $("#txtCommission").val("");
            $("#txtCommission").attr("placeholder", "0.00");
            $("#txtBy").val("");
            $("#txtBy").attr("placeholder", "0");
            $("#txtFB").val("");
            $("#txtFB").attr("placeholder", "0.00");
            $("#txtHB").val("");
            $("#txtHB").attr("placeholder", "0.00");
            $("#txtQB").val("");
            $("#txtQB").attr("placeholder", "0.00");
            $("#txtBoxchge").val("");
            $("#txtBoxchge").attr("placeholder", "0");
            $("#txtHandlingFB").val("");
            $("#txtHandlingFB").attr("placeholder", "0.00");
            $("#txtHandlingHB").val("");
            $("#txtHandlingHB").attr("placeholder", "0.00");
            $("#txtHandlingQB").val("");
            $("#txtHandlingQB").attr("placeholder", "0.00");
            $("#txtMpf").val("Y");
            $("#txtBrokerfee").val("N");
            $("#txtCartage").val("N");
            $("#txtHandling").val("N");
            $("#txtFreight").val("N");
            $("#txtRetFuel").val("N");
            $("#txtFuelPer").val("");
            $("#txtFuelPer").attr("placeholder", "0");
            $("#txtFuelFB").val("");
            $("#txtFuelFB").attr("placeholder", "0.00");
            $("#txtFuelHB").val("");
            $("#txtFuelHB").attr("placeholder", "0.00");
            $("#txtFuelQB").val("");
            $("#txtFuelQB").attr("placeholder", "0.00");
            $("#txtOffAdd1").val("");
            //$("#txtOffAdd2").val("");
            $("#txtOffPhone").val("");
            $("#txtOffFax").val("");
            $("#txtManager").val("");
            $("#txtSecretary").val("");
            $("#txtSalesPerson").val("");
            $("#txtCellular").val("");
            $("#txtFarmLoc").val("");
            $("#txtBank").val("");
            $("#txtBankAdd1").val("");
            $("#txtBankAdd2").val("");
            $("#txtAccountNo").val("");
            $("#txtOfficer").val("");
            $("#txtFarmLoc").val("");
            $("#txtTel").val("");
            $("#txtArea").val("");
            $("#txtProducts").val("");
            $("#txtEmail").val("");
            $("#txtFarmEmail").val("");
            $("#DivFarms").dialog('option', 'title', "Add New Farm");
            $("#DivFarms").dialog("open");
        }
        /*Remove close button because it redirects to Admin profile::Setups Menu::09Feb2018
        function closeclicked(com, grid) {
            $(location).attr('href', '/Default.aspx?Page=Users')
            return false;
        }*/

        $("#MsgFarmWarning").dialog({
            autoOpen: false,
            resizable: false,
            title: "Alert",
            modal: true,
            buttons: {
                OK: function () {
                    $(this).dialog("close");
                    //$("#fgrdFlowers").flexReload({ url: '/url/for/refresh' });
                }
            },
            open: function () {
                $(".ui-dialog-buttonpane button:contains('OK')").addClass('dialogbuttonstyle icon-save')
            }
        });
        $("#DivPurchasesByFarm").dialog({
            autoOpen: false,
            resizable: false,
            width: 600,
            modal: true,
            title: 'Purchases by Awb',
            buttons: {
                Close: function () {

                    $("#DivPurchasesByFarm").dialog("close");
                }
            },
            open: function () {
                //$("#rbProdCodes").attr("checked", "checked");
                $("#DivPurchasesByFarm").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
                $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
            },
            beforeClose: function (event, ui) {
                if ($("#msgbox-CustDetailsWarning").dialog('isOpen')) {
                    return false;
                }
            }
        });
        //added By Belal on 26 Nov 2020
        $("#DivLoadPurchasesByProduct").dialog({
            autoOpen: false,
            resizable: false,
            width: 1250,
            modal: true,
            title: 'Purchases by Product',
            buttons: {
                Close: function () {

                    $("#DivLoadPurchasesByProduct").dialog("close");
                }
            },
            open: function () {
                //$("#rbProdCodes").attr("checked", "checked");
                $("#DivLoadPurchasesByProduct").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
                $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
            },
            beforeClose: function (event, ui) {
                if ($("#msgbox-CustDetailsWarning").dialog('isOpen')) {
                    return false;
                }
            }
        });
        function LoadPurchasesByFarm(FARMCODE) {

            $("#tblPurchasesByFarm").flexigrid({
                url: 'BloomService.asmx/LoadPurchasesByFarmByAWB',
                dataType: 'xml',
                colModel: [
                    { display: 'AWB', name: 'LOT', width: 120, padding: 5, sortable: true, align: 'left' },
                    { display: 'Date Received', name: 'DATEREC', width: 100, sortable: true, align: 'left' },
                    { display: 'PIECES', name: 'BOXES', width: 70, sortable: false, align: 'right' },
                    { display: 'FBE', name: 'FBE', width: 90, sortable: false, align: 'right' },
                    { display: 'AMOUNT', name: 'AMOUNT', width: 90, sortable: false, align: 'right' },
                ],

                showTableToggleBtn: true,
                sortname: "LOT",
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
                params: [
                    { name: 'FARMCODE', value: FARMCODE }
                ],
                height: 400,
                width: 540,
                striped: true,

                onSuccess: function () {
                    //$("#DivPurchasesByFarm").dialog("open");
                }
            });



        }
        // added by Belal on 26 Nov 2020
        function LoadPurchasesByProduct(Farmcode, Product) {

            $("#tblLoadPurchasesByProduct").flexigrid({
                url: 'BloomService.asmx/LoadPurchasesByProduct',
                dataType: 'xml',
                colModel: [
                    { display: 'WH', name: 'WH', width: 30, padding: 5, sortable: true, align: 'left' },
                    { display: 'FARM', name: 'FARM', width: 30, padding: 5, sortable: true, hide: true, align: 'left', process: HeaderRowClick },
                    { display: 'AWB', name: 'LOT', width: 40, padding: 5, sortable: true, align: 'left' },
                    { display: 'Date Received', name: 'DATEREC', width: 60, sortable: true, align: 'left' , process: HeaderRowClick },
                    { display: 'Description', name: 'Description', width: 250, sortable: true, align: 'left' , process: HeaderRowClick },
                    { display: 'Pieces', name: 'BOXES', width: 40, sortable: false, align: 'right' },
                    { display: 'UOM', name: 'UOM', width: 30, sortable: false, align: 'left', process: HeaderRowClick },
                    { display: 'U/B', name: 'UNITSBUNCH', width: 40, sortable: false, align: 'right' },
                    { display: 'PACK', name: 'UNITS', width: 40, sortable: false, align: 'right' },
                    { display: 'Total Units', name: 'TotalUnits', width: 70, sortable: false, align: 'right' },
                    { display: 'COST', name: 'COST', width: 70, sortable: false, align: 'right' },
                    { display: 'TYPE', name: 'TYPE', width: 40, sortable: false, align: 'right' },
                    { display: 'FLAG', name: 'FLAG', width: 30, sortable: false, align: 'right' },
                    { display: 'CUST', name: 'CUST', width: 40, sortable: false, align: 'right' },
                    { display: 'PO', name: 'PO', width: 120, sortable: false, align: 'center' },
                    { display: 'INVOICE', name: 'INVOICE', width: 70, sortable: false, align: 'right' }
                ],

                showTableToggleBtn: true,
                sortname: "",
                sortorder: "",
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
                params: [
                    { name: 'FARMCODE', value: Farmcode },
                    { name: 'Product', value: Product }
                ],
                height: 400,
                width: 1200,
                striped: true,

                onSuccess: function () {
                    //$("#DivLoadPurchasesByProduct").dialog("open");
                }
            });



        }
        LoadPurchasesByFarm("");
        LoadPurchasesByProduct("", "");
        /*Save and Update the Farm Details to database :: Modified by Abinaya :: 02-05-2018*/


        //$('#txtAutoPO').iButton("toggle", false);
        $("#txtAutoPO").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        //$("#txtAutoPO .ibutton-container").width(175);
        //$("#txtAutoPO .ibutton-container .ibutton-handle").width(5);



        $("#DivFarms").dialog({
            autoOpen: false,
            resizable: false,
            modal: true,
            width: 850,
            height: "auto",
            title: 'Edit Farm::',
            buttons: {

                AWB: function () {
                    $("#tblPurchasesByFarm").flexOptions({ params: [{ name: 'FARMCODE', value: $("#txtFarmCode").val() }] }).flexReload();
                    $("#DivPurchasesByFarm").dialog("open");
                },
                Product: function () {
                    $("#tblLoadPurchasesByProduct").flexOptions({ sortname:"", sortorder:"", params: [{ name: 'FARMCODE', value: $("#txtFarmCode").val() }, { name: 'Product', value: $("#txtProducts").val() }] }).flexReload();
                    $("#DivLoadPurchasesByProduct").dialog("open");
                },

                Notes: function () {
                    debugger
                    var FarmCode = $("#txtFarmCode").val();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetFarmComments',
                        data: "{'Farm': '" + FarmCode + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {

                            $('<div id="DivFarmComments" style="">' +
                                +'<div><textarea id=txtFarmComments></textarea></div></div>').dialog({
                                    title: 'FARM NOTES SECTION',
                                    autoOpen: false,
                                    resizable: false,
                                    modal: true,
                                    width: 700,
                                    buttons: {
                                        Save: function () {
                                            $.ajax({
                                                type: "POST",
                                                url: 'BloomService.asmx/SaveFarmComments',
                                                data: "{'Farm': '" + $("#txtFarmCode").val() + "','Comments':'" + escape($("#txtFarmComments").val()) + "'}",
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: function (output1, status) {
                                                    if (output1.d != "error") {
                                                        $("#DivFarmComments").dialog("close");
                                                        $("#DivFarmComments").dialog('destroy').remove();
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

                            $("#DivFarmComments").html('<textarea id="txtFarmComments" spellcheck="false" style="width: 637px;height: 174px;">' + output.d + '</textarea>');
                            $("#DivFarmComments").dialog("open");

                        }
                    });
                },
                Save: function () {
                    debugger
                    var FarmID = $("#divFarmID").html();
                    var FarmCode = $("#txtFarmCode").val();
                    if (FarmCode == "") {
                        $("#DivFarms").next('div').find(".msgui").html("Please enter Farm Code..");
                        $("#DivFarms").next('div').find('.msgui').show();
                        ctrlFocus($("#txtFarmCode"));
                        return false;
                    }
                    var FarmName = $("#txtFarmName").val();
                    if (FarmName == "") {
                        $("#DivFarms").next('div').find(".msgui").html("Please enter Farm Name..");
                        $("#DivFarms").next('div').find('.msgui').show();
                        ctrlFocus($("#txtFarmName"));
                        return false;
                    }
                    var VENDOR = "0";
                    //var PARTNER = $("#txtAutoPO").val() == "" ? $("#txtAutoPO").attr("placeholder") : $("#txtAutoPO").val();;
                    var PARTNER = $("#txtAutoPO").is(":checked");
                    var FOB = $("#txtPurchaseType").val() == "" ? $("#txtPurchaseType").attr("placeholder") : $("#txtPurchaseType").val();




                    var By = "";// $("#txtBy").val()
                    var CommValue = $("#txtCommission").val() == "" ? leftPad($("#txtCommission").attr("placeholder"), 5) : leftPad(parseFloat($("#txtCommission").val()).toFixed(2), 5);
                    var RetBoxFB = $("#txtFB").val() == "" ? leftPad($("#txtFB").attr("placeholder"), 5) : leftPad(parseFloat($("#txtFB").val()).toFixed(2), 5);
                    var RetBoxHB = $("#txtHB").val() == "" ? leftPad($("#txtHB").attr("placeholder"), 5) : leftPad(parseFloat($("#txtHB").val()).toFixed(2), 5);
                    var RetBoxQB = $("#txtQB").val() == "" ? leftPad($("#txtQB").attr("placeholder"), 5) : leftPad(parseFloat($("#txtQB").val()).toFixed(2), 5);

                    var HandlingFB = $("#txtHandlingFB").val() == "" ? leftPad($("#txtHandlingFB").attr("placeholder"), 5) : leftPad(parseFloat($("#txtHandlingFB").val()).toFixed(2), 5);
                    var HandlingHB = $("#txtHandlingHB").val() == "" ? leftPad($("#txtHandlingHB").attr("placeholder"), 5) : leftPad(parseFloat($("#txtHandlingHB").val()).toFixed(2), 5);
                    var HandlingQB = $("#txtHandlingQB").val() == "" ? leftPad($("#txtHandlingQB").attr("placeholder"), 5) : leftPad(parseFloat($("#txtHandlingQB").val()).toFixed(2), 5);
                    var HandlingPer = $("#txtBoxchge").val() == "" ? leftPad($("#txtBoxchge").attr("placeholder"), 3) : leftPad($("#txtBoxchge").val(), 3);

                    var MPF = $("#txtMpf").val() == "" ? leftPad($("#txtMpf").attr("placeholder"), 1) : leftPad($("#txtMpf").val(), 1);
                    var BrokerFee = $("#txtBrokerfee").val() == "" ? leftPad($("#txtBrokerfee").attr("placeholder"), 1) : leftPad($("#txtBrokerfee").val(), 1);
                    var Cartage = $("#txtCartage").val() == "" ? leftPad($("#txtCartage").attr("placeholder"), 1) : leftPad($("#txtCartage").val(), 1);
                    var Handling = $("#txtHandling").val() == "" ? leftPad($("#txtHandling").attr("placeholder"), 1) : leftPad($("#txtHandling").val(), 1);
                    var Freight = $("#txtFreight").val() == "" ? leftPad($("#txtFreight").attr("placeholder"), 1) : leftPad($("#txtFreight").val(), 1);

                    var FuelFB = $("#txtFuelFB").val() == "" ? leftPad($("#txtFuelFB").attr("placeholder"), 5) : leftPad(parseFloat($("#txtFuelFB").val()).toFixed(2), 5);
                    var FuelHB = $("#txtFuelHB").val() == "" ? leftPad($("#txtFuelHB").attr("placeholder"), 5) : leftPad(parseFloat($("#txtFuelHB").val()).toFixed(2), 5);
                    var FuelQB = $("#txtFuelQB").val() == "" ? leftPad($("#txtFuelQB").attr("placeholder"), 5) : leftPad(parseFloat($("#txtFuelQB").val()).toFixed(2), 5);

                    var COMMISSION = CommValue + RetBoxFB + RetBoxHB + RetBoxQB + HandlingFB + HandlingHB + HandlingQB + HandlingPer + MPF + BrokerFee + Cartage + Handling + Freight + leftPad("", 4) + FuelFB + FuelHB + FuelQB;

                    var ANTIDUMP = "True"
                    var CITY = $("#lstCity").val();
                    var GL = "";
                    var COUNTRY = $("#lstCountry").val();
                    //var DUMPING = $("#txtAntidump").val() == "" ? $("#txtAntidump").attr("placeholder") : $("#txtAntidump").val();
                    var DUMPING = 0.00;
                    var FARMADD1 = $("#txtFarmLoc").val();
                    var FARMADD2 = "";
                    var OFFICEADD1 = $("#txtOffAdd1").val();
                    var OFFICEADD2 = "" //Combine both officeadd1 and officeadd2 to officeadd1, so officeadd2 send with empty data
                    var OFFICETEL = $("#txtOffPhone").val();
                    var OFFICEMAN = $("#txtManager").val();
                    var OFFICESEC = $("#txtSecretary").val();
                    var OFFICEFAX = $("#txtOffFax").val();
                    var FARMAGR = "";// $("#txtOfficer").val();

                    var PRODUCTS = $("#txtProducts").val();
                    var VARIETIES = "";
                    var AREA = $("#txtArea").val();
                    var BANKNAME = $("#txtBank").val();
                    var BANKADD1 = $("#txtBankAdd1 ").val();
                    var BANKADD2 = $("#txtBankAdd2 ").val();
                    var BANKACCOUN = $("#txtAccountNo ").val();
                    var BANKOFF = $("#txtOfficer").val();
                    var FUEL = "0.00";
                    if ($("#txtFuelPer ").val() > 0) {
                        FUEL = $("#txtFuelPer ").val();
                    }


                    var RETURNFUEL = "False";
                    //if ($("#txtRetFuel").val() = "Y")
                    //      RETURNFUEL ="True";
                    var EMAIL = $("#txtEmail ").val();
                    var CreatedDate = $("#lblOpenOn").text();//new Date().toString("MM/dd/yyyy");;
                    var KOMETID = "0";
                    var STATUS = "A";
                    var PACKRET = "0";
                    var MANUFACID = $("#txtMANUFACID").val();

                    var SalesPerson = $("#txtSalesPerson").val();
                    var Cellular = $("#txtCellular").val();
                    var FARMEMAIL = $("#txtFarmEmail").val();

                    var OFFICEMANPHONE = $("#txtManagerPhone").val();
                    var OFFICESECPHONE = $("#txtSecretaryPhone").val();
                    var OWNER = $("#txtOwner").val();
                    var OWNERPHONE = $("#txtOwnerPhone").val();
                    var PostHarvest = $("#txtPostHarvest").val();
                    var PostHarvestPhone = $("#txtPostHarvestPhone").val();


                    var values = '{ "ID": "' + FarmID + '", "FARM": "' + FarmCode.toUpperCase() + '", "NAME": "' + escape(FarmName.toUpperCase()) + '" , "VENDOR": "' + VENDOR + '" , "FOB": "' + FOB.toUpperCase() + '", "PARTNER": "' + PARTNER + '", "COMMISSION": "' + COMMISSION + '", "ANTIDUMP": "' + ANTIDUMP + '", "CITY": "' + CITY + '", "GL": "' + GL.toUpperCase() + '","COUNTRY": "' + COUNTRY.toUpperCase() + '", "PACKRET": "' + PACKRET + '", "MANUFACID": "' + MANUFACID.toUpperCase() + '", "DUMPING": "' + DUMPING + '","FARMADD1": "' + escape(FARMADD1) + '", "FARMADD2": "' + escape(FARMADD2) + '", "OFFICEADD1": "' + escape(OFFICEADD1) + '", "OFFICEADD2": "' + escape(OFFICEADD2) + '", "OFFICETEL": "' + escape(OFFICETEL.toUpperCase()) + '", "OFFICEMAN": "' + escape(OFFICEMAN) + '", "OFFICESEC": "' + escape(OFFICESEC) + '", "OFFICEFAX": "' + escape(OFFICEFAX.toUpperCase()) + '", "FARMAGR": "' + escape(FARMAGR.toUpperCase()) + '", "PRODUCTS": "' + PRODUCTS.toUpperCase() + '", "VARIETIES": "' + VARIETIES.toUpperCase() + '", "AREA": "' + AREA.toUpperCase() + '", "BANKNAME": "' + BANKNAME.toUpperCase() + '", "BANKADD1": "' + escape(BANKADD1.toUpperCase()) + '", "BANKADD2": "' + escape(BANKADD2.toUpperCase()) + '", "BANKACCOUN": "' + BANKACCOUN.toUpperCase() + '", "BANKOFF": "' + BANKOFF.toUpperCase() + '", "FUEL": "' + FUEL + '", "RETURNFUEL": "' + RETURNFUEL + '", "EMAIL": "' + escape(EMAIL) + '", "CreatedDate": "' + CreatedDate + '", "KOMETID": "' + KOMETID + '", "STATUS": "' + STATUS.toUpperCase() + '", "FARMEMAIL": "' + escape(FARMEMAIL) + '" ,"SALESPERSON":"' + SalesPerson + '","CELLULAR":"' + Cellular.toUpperCase() + '","OFFICEMANPHONE": "' + OFFICEMANPHONE.toUpperCase() + '","OFFICESECPHONE": "' + OFFICESECPHONE.toUpperCase() + '","OWNER": "' + OWNER.toUpperCase() + '","OWNERPHONE": "' + OWNERPHONE.toUpperCase() + '","PostHarvest": "' + PostHarvest.toUpperCase() + '","PostHarvestPhone": "' + PostHarvestPhone.toUpperCase() + '"}';
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/SaveFarm',
                        data: values,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            debugger
                            if (output.d != "error") {
                                var result = output.d;
                                if (result.toLowerCase().indexOf("unique key") >= 0) {
                                    $("#DivFarms").next('div').find(".msgui").html("Farm Code (<b>" + FarmCode.toUpperCase() + "</b>) Already exists!");
                                    $("#DivFarms").next('div').find('.msgui').show();
                                }
                                else {
                                    $("#DivFarms").dialog("close")
                                    $("#fgrdFarms").flexReload({ url: '/url/for/refresh' });
                                }
                            }
                            else {
                                $("#DivFarms").next('div').find(".msgui").html(output.d);
                                $("#DivFarms").next('div').find('.msgui').show();
                            }
                        }
                    });

                },
                Cancel: function () {
                    $(this).dialog("close");
                },

            },
            open: function () {
                debugger;
                $("#purchasesByLabel").remove();
                $("#DivFarms").next(".ui-dialog-buttonpane").children(".ui-dialog-buttonset").prepend("<label id='purchasesByLabel' style='font-weight:bold; margin-right:5px;'>Purchases By:</label>")
                $("#DivFarms").next('div').find('.msgui').remove();
                $("#DivFarms").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
                $("#DivFarms").next('div').find(".msgui").css("width", $("#DivFarms").width() - $('#DivFarms').next('div').find(".ui-dialog-buttonset").width());
                $("#DivFarms").next('div').find('.msgui').hide();
                CheckAutoPOVisibilityFromConstant();
                $("#txtFarmCode").focus();
                $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
                $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
                $(".ui-dialog-buttonpane button:contains('Notes')").addClass('BloomButtonEnabled');
                //$(".ui-dialog-buttonpane button:contains('Purchases')").addClass('BloomButtonEnabled');
                $(".ui-dialog-buttonpane button:contains('Product')").addClass('BloomButtonEnabled');
                $(".ui-dialog-buttonpane button:contains('Product')").addClass('BloomButtonEnabled3');
                $(".ui-dialog-buttonpane button:contains('AWB')").addClass('BloomButtonEnabled');
                $(".ui-dialog-buttonpane button:contains('AWB')").addClass('BloomButtonEnabled2');
       
            }
        });

        function leftPad(number, targetLength) {
            var output = number + '';
            while (output.length < targetLength) {
                output = ' ' + output;
            }
            return output;
        }

        /*Get Farm details and fill it to the controls from database :: Modified by Abinaya :: 02-05-2018*/
        $("[id^=EditFarms_]").die('click').live("click", function (e) {

            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id');
            var FarmID = ID.replace("EditFarms_", "");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFarmsByID',
                data: '{"ID":"' + FarmID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if (output.d != null) {
                        var FarmDet = output.d;

                        $("#divFarmID").html(FarmDet.ID);
                        $("#txtFarmCode").val(FarmDet.Farm);
                        $("#txtMANUFACID").val(FarmDet.Manufacid);

                        $("#lblOpenOn").text(FarmDet.AddDate)
                        $("#txtFarmName").val(FarmDet.Name);
                        $("#lstCountry").val(FarmDet.Country);
                        $("#lstCity").val(FarmDet.City);
                        $("#txtPaymentTerms").val("");
                        $("#txtPaymentTerms").attr("placeholder", "");
                        $("#txtPurchaseType").val("");
                        $("#txtPurchaseType").attr("placeholder", FarmDet.FOB);
                        //$("#txtAntidump").val("");
                        //$("#txtAntidump").attr("placeholder", FarmDet.Dumping);
                        //$("#txtAutoPO").val("");
                        //$("#txtAutoPO").attr("placeholder", FarmDet.Partner);
                        //$('#txtAutoPO').iButton("toggle", FarmDet.Partner == 'N' ? false : true);
                         $('#txtAutoPO').iButton("toggle", FarmDet.Partner);
                        var commfullstring = FarmDet.Commission;

                        $("#txtCommission").val("");
                        $("#txtCommission").attr("placeholder", commfullstring.substr(0, 5));

                        $("#txtBy").val("");
                        $("#txtBy").attr("placeholder", "0");
                        $("#txtFB").val("");
                        $("#txtFB").attr("placeholder", parseFloat(commfullstring.substr(5, 5)).toFixed(2));
                        $("#txtHB").val("");
                        $("#txtHB").attr("placeholder", parseFloat(commfullstring.substr(10, 5)).toFixed(2));
                        $("#txtQB").val("");
                        $("#txtQB").attr("placeholder", parseFloat(commfullstring.substr(15, 5)).toFixed(2));

                        $("#txtBoxchge").val("");
                        $("#txtBoxchge").attr("placeholder", "0");
                        $("#txtHandlingFB").val("");
                        $("#txtHandlingFB").attr("placeholder", parseFloat(commfullstring.substr(20, 5)).toFixed(2));
                        $("#txtHandlingHB").val("");
                        $("#txtHandlingHB").attr("placeholder", parseFloat(commfullstring.substr(25, 5)).toFixed(2));
                        $("#txtHandlingQB").val("");
                        $("#txtHandlingQB").attr("placeholder", parseFloat(commfullstring.substr(30, 5)).toFixed(2));

                        $("#txtMpf").val("");
                        $("#txtMpf").attr("placeholder", commfullstring.substr(38, 1));
                        $("#txtBrokerfee").val("");
                        $("#txtBrokerfee").attr("placeholder", commfullstring.substr(39, 1));
                        $("#txtCartage").val();
                        $("#txtCartage").attr("placeholder", commfullstring.substr(40, 1));
                        $("#txtHandling").val("");
                        $("#txtHandling").attr("placeholder", commfullstring.substr(41, 1));
                        $("#txtFreight").val("");
                        $("#txtFreight").attr("placeholder", commfullstring.substr(42, 1));

                        $("#txtRetFuel").val("Y");
                        $("#txtFuelPer").val("");
                        $("#txtFuelPer").attr("placeholder", "0");
                        $("#txtFuelFB").val("");
                        $("#txtFuelFB").attr("placeholder", parseFloat(commfullstring.substr(47, 5)).toFixed(2));
                        $("#txtFuelHB").val("");
                        $("#txtFuelHB").attr("placeholder", parseFloat(commfullstring.substr(52, 5)).toFixed(2));
                        $("#txtFuelQB").val("");
                        $("#txtFuelQB").attr("placeholder", parseFloat(commfullstring.substr(57, 5)).toFixed(2));

                        $("#txtOffAdd1").val(FarmDet.Officeadd1);
                        $("#txtOffAdd2").val(FarmDet.Officeadd2);
                        $("#txtOffPhone").val(FarmDet.Officetel);
                        $("#txtOffFax").val(FarmDet.Officefax);


                        $("#txtManager").val(FarmDet.Officeman);

                        $("#txtSecretary").val(FarmDet.Officesec);

                        $("#txtFarmLoc").val(FarmDet.Farmadd1);
                        $("#txtOfficer").val(FarmDet.Bankoff);
                        $("#txtBank").val(FarmDet.BankName);
                        $("#txtBankAdd1").val(FarmDet.BankAdd1);
                        $("#txtBankAdd2").val(FarmDet.BankAdd2);
                        $("#txtAccountNo").val(FarmDet.BankAccoun);
                        $("#txtTel").val(FarmDet.Officetel);
                        $("#txtArea").val(FarmDet.Area);
                        $("#txtProducts").val(FarmDet.Products);
                        $("#txtEmail").val(FarmDet.Email);

                        $("#txtFarmEmail").val(FarmDet.FARMEMAIL);
                        $("#txtSalesPerson").val(FarmDet.SALESPERSON);
                        $("#txtCellular").val(FarmDet.CELLULAR);

                        $("#txtManagerPhone").val(FarmDet.OFFICEMANPHONE);
                        $("#txtSecretaryPhone").val(FarmDet.OFFICESECPHONE);
                        $("#txtOwner").val(FarmDet.OWNER);
                        $("#txtOwnerPhone").val(FarmDet.OWNERPHONE);
                        $("#txtPostHarvest").val(FarmDet.POSTHARVEST);
                        $("#txtPostHarvestPhone").val(FarmDet.POSTHARVESTPHONE);


                        $("#fgrdFarms [id^=row]").removeClass("trSelectedHeader");
                        $("#fgrdFarms #row" + FarmID).addClass("trSelectedHeader");
                        $("#fgrdFarms td.unsorted").addClass("sorted");
                        $("#fgrdFarms td.sorted").removeClass("unsorted");
                        $("#fgrdFarms #row" + FarmID).removeClass("trSelected");
                        $("#fgrdFarms #row" + FarmID + " td.sorted").addClass("unsorted");
                        $("#fgrdFarms #row" + FarmID + " td.unsorted").removeClass("sorted");

                        $("#DivFarms").dialog('option', 'title', "Edit Farm:: " + FarmDet.Farm);
                        $("#DivFarms").dialog("open");

                    }
                }
            });
        });

        $("[id^=DeleteFarms_]").die("click").live("click", function () {
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id').substring(12);

            $('#OldId').html(ID);

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFarmsByID',
                data: '{"ID":"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    debugger

                    $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + output.d.Farm + "</b> ?</p>");
                    $("#Deleteconfirm").dialog("open");

                },
                error: function (err) {
                    debugger
                    alert(err)
                }

            });
        });


        $("#Deleteconfirm").dialog({
            autoOpen: false,
            resizable: false,
            title: "Alert",
            width: 400,
            modal: true,
            buttons: {
                Yes: function () {
                    var adialog = $(this);
                    var List = $("#DeleteFarms_" + $("#OldId").html());
                    var ID = $("#OldId").html();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/DeleteFarm',
                        data: '{"ID":"' + ID + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {

                            if (output.d == 'Success') {
                                adialog.dialog("close");
                                $("#fgrdFarms").flexReload({ url: '/url/for/refresh' });
                            }
                            else {
                                adialog.dialog("close");
                                $("#msg").html("There was an error during save the details!");
                                $("#msgbox-select").dialog("open");
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
    });

    /*Load Airport from F_AIRPOT table by Abi :: Created on 28April2018 */
    function LoadAirport() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetAirportCodeList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $('#lstCity').empty();
                var CODEdata = output.d;
                $('#lstCity').append('<option value="0">Select</option>');
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    $('#lstCity').append('<option value="' + CODE.Airport + '">' + CODE.Airport + ' - ' + CODE.Name + '</option>');
                }
            }
        });
    }

    $("#txtBankAdd1").on('keydown', function (e) {
        debugger;
        var keycode = e.which;
        if (keycode == 13) {
            $("#txtBankAdd2").focus();
            return false;
        }
    });
    //$("#txtOffAdd1").on('keydown', function (e) {
    //    debugger;
    //    if (e.which == 13 && !e.shiftKey) {
    //        $("#txtOffPhone").focus();
    //        //e.preventDefault();
    //        return false;
    //    }
    //});

    $("#txtBankAdd2").on('keydown', function (e) {
        debugger;
        var keycode = e.which;
        if (keycode == 13) {
            $("#txtAccountNo").focus();
            return false;
        }
    });

    $("#lstCountry").on('keydown', function (e) {
        debugger;
        var keycode = e.which
        if (keycode == 13) {
            if ($("#lstCountry").val() == 0) {
                $("#lstCountry").focus();
            }
            else {
                $("#lstCity").focus();
                return false;
            }
        }

    });

    $("#lstCity").on('keydown', function (e) {
        debugger;
        var keycode = e.which;
        if (keycode == 13) {
            if ($("#lstCity").val() == 0) {
                $("#lstCity").focus();
            }
            else {
                $("#txtPaymentTerms").focus();
                return false;
            }
        }

    });

    $("#lstCountry").change(function () {

        $("#lstCity").focus();
    });

    $("#lstCity").change(function () {
        $("#txtPaymentTerms").focus();
    });

    /*Load Country from F_COUNTY table by Abi :: Created on 28April2018 */
    function LoadCountry() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCountryCodeList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstCountry').empty();
                var CODEdata = output.d;
                $('#lstCountry').append('<option value="0">Select</option>');
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    $('#lstCountry').append('<option value="' + CODE.COUNTRY + '">' + CODE.COUNTRY + ' - ' + CODE.NAME + '</option>');
                }
            }
        });
    }



    /*Enter key navigation :: Created by Abinaya :: 28April2018*/
    $('input').keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            debugger;
            for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                var a;
                a = 1;
                if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                    a = i;
                }
                if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i) {
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }
                if ($(this).attr('id').indexOf("txtFarmCode") > -1) {
                    $("#txtFarmName").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFarmName") > -1) {
                    $("#lstCountry").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtPaymentTerms") > -1) {
                    $("#txtPurchaseType").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtPurchaseType") > -1) {
                    $("#txtCommission").focus();
                    return false;
                }
 
                else if ($(this).attr('id').indexOf("txtCommission") > -1) {
                    $("#txtOffAdd1").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtOffAdd1") > -1) {
                    $("#txtOffPhone").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtOffPhone") > -1) {
                    $("#txtOffFax").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtOffFax") > -1) {
                    $("#txtOwner").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtOwner") > -1) {
                    $("#txtOwnerPhone").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtOwnerPhone") > -1) {
                    $("#txtManager").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtManager") > -1) {
                    $("#txtManagerPhone").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtManagerPhone") > -1) {
                    $("#txtSecretary").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtSecretary") > -1) {
                    $("#txtSecretaryPhone").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtSecretaryPhone") > -1) {
                    $("#txtSalesPerson").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtSalesPerson") > -1) {
                    $("#txtCellular").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCellular") > -1) {
                    $("#txtPostHarvest").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtPostHarvest") > -1) {
                    $("#txtPostHarvestPhone").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtPostHarvestPhone") > -1) {
                    $("#txtBank").focus();
                    return false;
                }

                else if ($(this).attr('id').indexOf("txtBank") > -1) {
                    $("#txtBankAdd1").focus();
                    return false;
                }
                //else if ($(this).attr('id').indexOf("txtBankAdd1") > -1) {
                //    $("#txtBankAdd2").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtBankAdd2") > -1) {
                //    $("#txtAccountNo").focus();
                //    return false;
                //}
                else if ($(this).attr('id').indexOf("txtAccountNo") > -1) {
                    $("#txtOfficer").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtOfficer") > -1) {
                    $("#txtFarmLoc").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFarmLoc") > -1) {
                    $("#txtTel").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtTel") > -1) {
                    $("#txtArea").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtArea") > -1) {
                    $("#txtProducts").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtProducts") > -1) {
                    $("#txtEmail").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtEmail") > -1) {
                    $("#txtFarmEmail").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFarmEmail") > -1) {
                    $("#DivFarms").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                }
            }
        }
    });

    $("#SelectAll").die('click').live("click", function (e) {
        debugger
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ToggleSelectedAllCarrier',
            data: "{'SelectedAll':'" + Selected + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#msgbox-select").dialog("close");
                if (Selected == "1") {
                    sourceCtl.prop("src", "images/check-on.png");
                    $("[id^=select_]").prop("src", "images/check-on.png");
                    // $("#fgrdInventorytoKomet").flexReload({ url: '/url/for/refresh' });

                }
                else {
                    sourceCtl.prop("src", "images/check-off.png");
                    $("[id^=select_]").prop("src", "images/check-off.png");
                    // $("#fgrdInventorytoKomet").flexReload({ url: '/url/for/refresh' });
                }
            }
        });

    });

    function CheckFarmCodeAlreadyExists(Farm) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/CheckFarmCodeAlreadyExists',
            data: "{'Farm':'" + Farm + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d > 0) {
                    $.MessageBox("The farm code is already exist !!");
                    $("#txtFarmCode").val("");
                    $("#txtFarmCode").focus();
                } else {
                    $("#txtFarmName").focus();
                }
            }
        });
    }

    function CheckAutoPOVisibilityFromConstant() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetShowGenerateAutoPOConstant',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d == 'False') {
                    $(".GenerateAutoPO").hide();
                }
                else {
                    $(".GenerateAutoPO").show();
                }
            }
        });
    }


    $('#txtMpf,#txtBrokerfee,#txtCartage,#txtHandling,#txtRetFuel,#txtFreight').focus().keydown(function (e) {
        var keyenter = e.which;
        if ($(this).is(':focus') == true) {
            if (keyenter == 78)
                $(this).val("N")
            else
                $(this).val("Y")
        }
        if (keyenter != 78 && keyenter != 89 && keyenter != 13) {
            e.preventDefault();
        }
    });
</script>
