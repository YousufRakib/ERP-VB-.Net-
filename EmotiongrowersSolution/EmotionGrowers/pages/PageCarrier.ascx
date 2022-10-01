<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCarrier.ascx.vb" Inherits="pages_PageCarrier" %>
<script src="js/validation.js"></script>

<table>
    <tr>
        <td>

            <div id="DivCarrierForFgrd">
                <table id="fgrdCarrier" style="display: none;"></table>
                <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
    <%-- <tr>
        <td>
            <input id="btnCarrierReport" type="button" class="BloomButtonEnabled" value="C=Carrier Report" style="margin-left: 5px; width: 110px; background: red;" />
            <%--Commented by ABI :: Comment requested by Jose through Email :: 25Oct2018 :: 
                <input id="btnCarrierVendorCode" type="button" class="BloomButtonEnabled" value="V=Vendor Code" style=" width: 100px; background: red;" />
            <input id="btnCarrierBoxSizes" type="button" class="BloomButtonEnabled" value="B=BoxSizes" style="margin-left: 5px; width: 100px;background: red;" />
        </td>
    </tr>--%>
</table>


<div id="EditCarrier" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <tr>
                <td style="width: 150px;">Carier Code</td>
                <td colspan="3">
                    <input type="text" id="txtCarrierCode" style="width: 50px;" maxlength="3" class="AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr>
                <td>Carier Name</td>
                <td colspan="3">
                    <input type="text" id="txtCarrierName" style="width: 250px;" maxlength="25" class="AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr>
                <td>Address</td>
                <td colspan="3">
                    <%--<textarea id="txtCarrierAddress" cols="100" rows="5" maxlength="120"></textarea>--%>
                    <input type="text" id="txtCarrierAddress1" style="width: 450px; margin-top: -2px;" maxlength="40" class="AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="3">
                    <input type="text" id="txtCarrierAddress2" style="width: 450px; margin-top: -2px;" maxlength="40" class="AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="3">
                    <input type="text" id="txtCarrierAddress3" style="width: 450px; margin-top: -2px;" maxlength="40" class="AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr>
                <td>Type</td>
                <td colspan="3">
                    <input type="text" id="txtCarrierType" style="width: 15px;" maxlength="1" class="AllUpperCaseTextBox" />
                    <label>A- Airline     T- Truck     C- Cargo Agency     B- Broker</label>
                </td>
            </tr>
            <tr style="height: 35px;">
                <td colspan="4"></td>
            </tr>
            <tr>
                <td>Requires Account#:</td>
                <td>
                    <input type="checkbox" id="chkAccount" style="width: 30px" />
                </td>
                <td colspan="2">
                    <label>Account No Length</label>
                    <input type="text" id="txtAccLength" style="width: 50px;" maxlength="2" class="ClsNumbersOnly" />
                </td>
            </tr>
            <tr style="display: none;">
                <td>Airline IDN. </td>
                <td>
                    <input type="text" id="txtCarrierAirlineIDN" style="width: 50px;" class="AllUpperCaseTextBox" />
                </td>
                <td colspan="2">
                    <label>Delivery Charge  :</label>
                    <input type="text" id="txtCarrierDeliveryCharge" placeholder="0.00" style="text-align: right; width: 80px;" maxlength="18" class="ClsDecimalsOnly searchplaceholder" />
                    <label style="margin-left: 10px;">Min Boxes</label>
                    <input type="text" id="txtCarrierMinBoxes" placeholder="0.00" style="text-align: right; width: 80px;" class="ClsDecimalsOnly searchplaceholder" />
                </td>
            </tr>
            <tr style="display: none;">
                <td>Beg. AWB No. </td>
                <td style="width: 200px;">
                    <input type="text" id="txtCarrierBegAWB" placeholder="0" style="text-align: right; width: 100px;" maxlength="11" class="ClsNumbersOnly searchplaceholder" />
                </td>
                <td style="width: 125px;">End. AWB No. </td>
                <td>
                    <input type="text" id="txtCarrierEndAWB" placeholder="0" style="text-align: right; width: 100px;" maxlength="11" class="ClsNumbersOnly searchplaceholder" />
                    <label># </label>
                    <input type="text" id="txtCarrierHash" placeholder="0" class="searchplaceholder" style="text-align: right; width: 50px;" />
                </td>
            </tr>
            <tr style="display: none;">
                <td>Reservations</td>
                <td>
                    <input type="text" id="txtCarrierReservations" style="width: 150px;" class="AllUpperCaseTextBox" />
                </td>
                <td>Need to Book </td>
                <td>
                    <input type="text" id="txtCarrierNeedToBook" class="searchplaceholder AllUpperCaseTextBox" style="width: 15px;" maxlength="1" />
                </td>
            </tr>
            <tr style="display: none;">
                <td>To Order AWB </td>
                <td>
                    <input type="text" id="txtCarrierToOrderAWB" style="width: 150px;" class="AllUpperCaseTextBox" />
                </td>
                <td>Contact Name </td>
                <td>
                    <input type="text" id="txtCarrierContactName" style="width: 150px;" maxlength="10" class="AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr style="display: none;">
                <td>Flowers SCR </td>
                <td>
                    <input type="text" id="txtCarrierFlowersSCR" style="width: 100px;" maxlength="10" class="AllUpperCaseTextBox" />
                </td>
                <td>Flowers SCX </td>
                <td>
                    <input type="text" id="txtCarrierFlowersSCX" style="width: 100px;" maxlength="10" class="AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr>
                <td>Pallet Charge</td>
                <td>
                    <input type="text" id="txtPalletCharge" placeholder="0.00" style="width: 100px;" maxlength="10" class="ClsTwoDecimalsOnly" />
                </td>
           </tr>
  
            <tr style="height: 30px;">
                <td colspan="4"></td>
            </tr>
            <tr>
                <td>Cuttoff Time </td>
                <td colspan="3">
                    <label id="CarrierCutOffMon">Mon</label>
                    <input type="text" id="txtCarrierCutOffMon" style="width: 45px;" maxlength="4" >
                    <label id="CarrierCutOffTue">Tue</label>
                    <input type="text" id="txtCarrierCutOffTue" style="width: 45px;" maxlength="4" >
                    <label id="CarrierCutOffWed">Wed</label>
                    <input type="text" id="txtCarrierCutOffWed" style="width: 45px;" maxlength="4" >
                    <label id="CarrierCutOffThu">Thu</label>
                    <input type="text" id="txtCarrierCutOffThu" style="width: 45px;" maxlength="4" >
                    <label id="CarrierCutOffFri">Fri</label>
                    <input type="text" id="txtCarrierCutOffFri" style="width: 45px;" maxlength="4" >
                    <label id="CarrierCutOffSat">Sat</label>
                    <input type="text" id="txtCarrierCutOffSat" style="width: 45px;" maxlength="4" >
                    <label id="CarrierCutOffSun">Sun</label>
                    <input type="text" id="txtCarrierCutOffSun" style="width: 45px;" maxlength="4" >
                </td>
            </tr>
        </tbody>
    </table>
</div>



<div id="MsgWarning" style="display: none;">
    <p id="MsgHtml"></p>
</div>

<div id="DivPostConfirmDialog" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msgPostConfirm" class="PostDialogMsg"></p>
    </div>
</div>
<div id="divCarrierID" style="display: none;"></div>
<div id="CarrierCode" style="display: none;"></div>

<style type="text/css">
    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
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

    /*#EditCarrier input[type="text"] {
        height: 17px;
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
        $.mask.definitions['9'] = "[0-9]";
        $.mask.definitions['#'] = "[0-9]";
        $("#txtCarrierCutOffMon").mask("99:99");
        $("#txtCarrierCutOffTue").mask("99:99");
        $("#txtCarrierCutOffWed").mask("99:99");
        $("#txtCarrierCutOffThu").mask("99:99");
        $("#txtCarrierCutOffFri").mask("99:99");
        $("#txtCarrierCutOffSat").mask("99:99");
        $("#txtCarrierCutOffSun").mask("99:99");

        $("#chkAccount").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkAccount").iButton("toggle", false);

        $("#fgrdCarrier").flexigrid({
            url: 'BloomService.asmx/GetCarrierForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Carrier', name: 'Carrier', width: 50, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Name', name: 'Name', width: 250, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Type', name: 'AirlineType', width: 50, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'ID', name: 'KometID', width: 50, sortable: false, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'Carrier', name: 'Carrier' },
                { display: 'Name', name: 'Name' },
            ],
            buttons: [
                //{ name: 'Import Carrier', bclass: 'import', onpress: importclicked },
                { name: 'Add', bclass: 'add', onpress: addclicked },
                { name: 'Request ID', bclass: 'KometExport', onpress: exportclicked },
                //{ name: 'Close', bclass: 'close', onpress: closeclicked }
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
            height: $(window).height() - 250,
            width: 550,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;
                /*Add Export button if grid has rows :: Added by Abi :: 22Jun2018*/
                var sel = jQuery("#fgrdCarrier tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivCarrierForFgrd #ExportCSV").show();
                }

                if ($("#divCarrierID").html() != "0" && $("#fgrdCarrier #row" + $("#divCarrierID").html()).css('display') == "table-row") {
                    var id = $("#divCarrierID").html();
                    $("#fgrdCarrier [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCarrier td.unsorted").addClass("sorted");
                    $("#fgrdCarrier td.sorted").removeClass("unsorted");
                    $("#fgrdCarrier #row" + id).addClass("trSelectedHeader");
                    $("#fgrdCarrier #row" + id).removeClass("trSelected");
                    $("#fgrdCarrier #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdCarrier #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divCarrierID").html($("#fgrdCarrier tr:first td:nth-child(3) div").text());
                    $("#fgrdCarrier tr:first").addClass("trSelectedHeader trSelected");
                }

                $("[id^=select_]").each(function () {
                    $(this)[0].src = "images/check-off.png";
                });
                $("[id ^= SelectAll]").attr("src", "images/check-off.png");

            }
        });

        /*Selected row higlighted with red color by Abi :: 23Apr2018*/
        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {

                if (id != 0) {
                    var FilterQuery = "";

                    $("#divCarrierID").html(id.toString());

                    $("#fgrdCarrier [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCarrier #row" + id).addClass("trSelectedHeader");
                    $("#fgrdCarrier td.unsorted").addClass("sorted");
                    $("#fgrdCarrier td.sorted").removeClass("unsorted");
                    $("#fgrdCarrier #row" + id).removeClass("trSelected");
                    $("#fgrdCarrier #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdCarrier #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }

        KometVisibility();
        /* Comment Import option :: 06April2018 :: ABI
        function importclicked(com, grid) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ImportF_CARRIEfromDBF',
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if (output.d == "Inserted") {
                        $("#MsgWarning").dialog("open");
                        $("#MsgHtml").html("Imported Successfully...");
                        $("#fgrdCarrier").flexReload({ url: '/url/for/refresh' });
                    }
                    else {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                    }
                }
            });
        } */

        function exportclicked(com, grid) {
            var count = 0
            $("[id^=select_]").each(function () {
                if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                    count = count + 1;
                }
            });
            if (count == 0) {
                $("#msg").html("Please choose Carrier to POST!");
                $("#msgbox-select").dialog("open");
            }
            else {
                $("#DivPostConfirmDialog").dialog("open");
                $("#msgPostConfirm").html("Do you want POST selected Carrier?");
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
                        url: 'BloomService.asmx/ExportCarriersToKomet',
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            if (output.d == 'LogOut') {
                                window.location.href = "Login.aspx";
                            }
                            else if (output.d == 'Success') {

                                $("#fgrdCarrier").flexReload({ url: '/url/for/refresh' });
                                $("#DivPostConfirmDialog").dialog("close");
                                $("[id ^= SelectAll]").attr("src", "images/check-off.png");
                                $("#msg").html("Carrier ID requested successfully.");
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
                url: 'BloomService.asmx/ToggleSelectedCarrier',
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

        function addclicked() {
            $('#divCarrierID').html("0");
            $('#txtCarrierCode').val("");
            $('#txtCarrierName').val("");

            $("#txtCarrierAddress1").val("");
            $("#txtCarrierAddress2").val("");
            $("#txtCarrierAddress3").val("");
            $("#txtCarrierType").attr('placeholder', "");
            $("#txtCarrierType").val("T");
            $("#txtCarrierAirlineIDN").val("");
            $("#txtCarrierDeliveryCharge").val("");
            $("#txtCarrierDeliveryCharge").attr('placeholder', "0.00");
            $("#txtCarrierMinBoxes").val("");
            $("#txtCarrierMinBoxes").attr('placeholder', "0.00");
            $("#txtCarrierBegAWB").val("");
            $("#txtCarrierBegAWB").attr('placeholder', "0");
            $("#txtCarrierEndAWB").val("");
            $("#txtCarrierEndAWB").attr('placeholder', "0");
            $("#txtCarrierReservations").val("");
            $("#txtCarrierNeedToBook").val("");
            $("#txtCarrierNeedToBook").attr('placeholder', "Y");
            $("#txtCarrierToOrderAWB").val("");
            $("#txtCarrierContactName").val("");
            $("#txtCarrierFlowersSCR").val("");
            $("#txtCarrierFlowersSCX").val("");
            $("#txtPalletCharge").val("");
            $("#chkAccount").iButton("toggle", false);
            $("#txtAccLength").val("");
            $("#txtAccLength").attr('placeholder', "0");            

            $("#txtCarrierCutOffMon").val("");
            $("#txtCarrierCutOffTue").val("");
            $("#txtCarrierCutOffWed").val("");
            $("#txtCarrierCutOffThu").val("");
            $("#txtCarrierCutOffFri").val("");
            $("#txtCarrierCutOffSat").val("");
            $("#txtCarrierCutOffSun").val("");

            $("#EditCarrier").dialog('option', 'title', "Add New Carrier");
            $("#EditCarrier").dialog("open");
        }

        /*Remove close button because it redirects to Admin profile::Setups Menu::09Feb2018
        function closeclicked(com, grid) {
            $(location).attr('href', '/Default.aspx?Page=Users')
            return false;
        }*/

        $("#MsgWarning").dialog({
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

        $("#EditCarrier").dialog({
            autoOpen: false,
            resizable: false,
            modal: true,
            width: 800,
            //height: $(window).height() - 210,
            height: 380,
            title: 'Edit Carrier::',
            buttons: {
                Save: function () {
                    var CarrierID = $("#divCarrierID").html();
                    var CarrierCode = $("#txtCarrierCode").val().toUpperCase();
                    if (CarrierCode == "") {
                        $("#EditCarrier").next('div').find(".msgui").html("Please enter Carrier Code..");
                        $("#EditCarrier").next('div').find('.msgui').show();
                        ctrlFocus($("#txtCarrierCode"));
                        return false;
                    }
                    var CarrierName = $("#txtCarrierName").val();
                    if (CarrierName == "") {
                        $("#EditCarrier").next('div').find(".msgui").html("Please enter Carrier Name..");
                        $("#EditCarrier").next('div').find('.msgui').show();
                        ctrlFocus($("#txtCarrierName"));
                        return false;
                    }
                    debugger;
                    var Address1 = $("#txtCarrierAddress1").val();
                    var Address2 = $("#txtCarrierAddress2").val();
                    var Address3 = $("#txtCarrierAddress3").val();
                    var CarrierType = $("#txtCarrierType").val() == "" ? $("#txtCarrierType").attr("placeholder") : $("#txtCarrierType").val();
                    var AirlineIDN = $("#txtCarrierAirlineIDN").val("");
                    var DeliveryCharge = $("#txtCarrierDeliveryCharge").val() == "" ? parseFloat($("#txtCarrierDeliveryCharge").attr("placeholder")) : parseFloat($("#txtCarrierDeliveryCharge").val());
                    var CarrierMinBoxes = $("#txtCarrierMinBoxes").val() == "" ? $("#txtCarrierMinBoxes").attr("placeholder") : $("#txtCarrierMinBoxes").val();
                    var CarrierBegAWB = $("#txtCarrierBegAWB").val() == "" ? parseInt($("#txtCarrierBegAWB").attr("placeholder")) : parseInt($("#txtCarrierBegAWB").val());
                    var CarrierEndAWB = $("#txtCarrierEndAWB").val() == "" ? parseInt($("#txtCarrierEndAWB").attr("placeholder")) : parseInt($("#txtCarrierEndAWB").val());
                    var CarrierReservations = $("#txtCarrierReservations").val();
                    var CarrierNeedToBook = $("#txtCarrierNeedToBook").val() == "" ? $("#txtCarrierNeedToBook").attr("placeholder") : $("#txtCarrierNeedToBook").val();
                    var CarrierToOrderAWB = $("#txtCarrierToOrderAWB").val();
                    var CarrierContactName = $("#txtCarrierContactName").val();
                    var CarrierFlowersSCR = $("#txtCarrierFlowersSCR").val();
                    var CarrierFlowersSCX = $("#txtCarrierFlowersSCX").val();
                    var CarrierPaletCharge = $("#txtPalletCharge").val() == "" ? parseFloat($("#txtPalletCharge").attr("placeholder")) : parseFloat($("#txtPalletCharge").val());
                    var IsAccount = $("#chkAccount").is(":checked") ? "Y" : "N";
                    var AccountLength =$("#txtAccLength").val() == "" ? $("#txtAccLength").attr("placeholder") : $("#txtAccLength").val();

                    var Mon = $("#txtCarrierCutOffMon").val().replace(':', '') == "" ? "    " : $("#txtCarrierCutOffMon").val().replace(':', '')
                    var Tue = $("#txtCarrierCutOffTue").val().replace(':', '') == "" ? "    " : $("#txtCarrierCutOffTue").val().replace(':', '')
                    var Wed = $("#txtCarrierCutOffWed").val().replace(':', '') == "" ? "    " : $("#txtCarrierCutOffWed").val().replace(':', '')
                    var Thu = $("#txtCarrierCutOffThu").val().replace(':', '') == "" ? "    " : $("#txtCarrierCutOffThu").val().replace(':', '')
                    var Fri = $("#txtCarrierCutOffFri").val().replace(':', '') == "" ? "    " : $("#txtCarrierCutOffFri").val().replace(':', '')
                    var Sat = $("#txtCarrierCutOffSat").val().replace(':', '') == "" ? "    " : $("#txtCarrierCutOffSat").val().replace(':', '')
                    var Sun = $("#txtCarrierCutOffSun").val().replace(':', '') == "" ? "    " : $("#txtCarrierCutOffSun").val().replace(':', '')

                    var CutOff = Mon + Tue + Wed + Thu + Fri + Sat + Sun;

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/SaveCarrier',
                        data: '{"ID":"' + CarrierID + '","CARRIER":"' + CarrierCode.toUpperCase() + '","NAME":"' + CarrierName.toUpperCase() + '","AIRLINE":"' + CarrierType.toUpperCase() + '","CUTOFF":"' + CutOff + '","DELCHARGE":"' + DeliveryCharge + '","COUNTER":"0","IATA":"","BEGAWB":' + CarrierBegAWB + ',"ENDAWB":' + CarrierEndAWB + ',"FLOWSCR":"' + CarrierFlowersSCR.toUpperCase() + '","FLOWSCX":"' + CarrierFlowersSCX.toUpperCase() + '","INFPHONE":"","AWBPHONE":"","CONTACT":"' + CarrierContactName.toUpperCase() + '","NEEDBOOK":"' + CarrierNeedToBook.toUpperCase() + '","PRINTER":"","GENERIC":"","TWO_FORMS":"","ADDRESS1":"' + Address1.toUpperCase() + '","ADDRESS2":"' + Address2.toUpperCase() + '","ADDRESS3":"' + Address3.toUpperCase() + '","IsAccount":"' + IsAccount.toUpperCase() + '","AccountLength":"' + AccountLength + '","PALLETCHARGE":"' + CarrierPaletCharge + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            debugger;
                            if (output.d != "error") {
                                if (output.d.toLowerCase().indexOf("unique key") >= 0 || output.d.toLowerCase().indexOf("already") >= 0) {
                                    $("#EditCarrier").next('div').find(".msgui").html("Carrier Code (<b>" + CarrierCode.toUpperCase() + "</b>) Already exists!");
                                    $("#EditCarrier").next('div').find('.msgui').show();
                                }
                                else {
                                    $("#EditCarrier").dialog("close")
                                    $("#fgrdCarrier").flexReload({ url: '/url/for/refresh' });
                                }
                            }
                            else {
                                $("#EditCarrier").next('div').find(".msgui").html(output.d);
                                $("#EditCarrier").next('div').find('.msgui').show();
                            }
                        }
                    });

                },

                Cancel: function () {
                    $(this).dialog("close");
                },
            },
            open: function () {
                debugger

                $("#EditCarrier").next('div').find('.msgui').remove();
                $("#EditCarrier").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
                $("#EditCarrier").next('div').find(".msgui").css("width", $("#EditCarrier").width() - $('#EditCarrier').next('div').find(".ui-dialog-buttonset").width());
                $("#EditCarrier").next('div').find('.msgui').hide();

                $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
                $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            }
        });

        $("[id^=EditCarrier_]").die('click').live("click", function (e) {
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id');
            var CarrierID = ID.replace("EditCarrier_", "");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCarrierbyID',
                data: '{"ID":"' + CarrierID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    debugger
                    if (output.d != null) {
                        var CarrierDet = output.d;
                        $("#divCarrierID").html(CarrierDet.ID);
                        $("#txtCarrierCode").val(CarrierDet.Carrier);
                        $("#txtCarrierName").val(CarrierDet.Name);
                        //$("#txtCarrierCat").val(CarrierDet.CAT);

                        $("#txtCarrierAddress1").val(CarrierDet.ADDRESS1);
                        $("#txtCarrierAddress2").val(CarrierDet.ADDRESS2);
                        $("#txtCarrierAddress3").val(CarrierDet.ADDRESS3);
                        $("#txtCarrierType").attr('placeholder', CarrierDet.Airline);
                        $("#txtCarrierAirlineIDN").val("");
                        $("#txtCarrierDeliveryCharge").attr('placeholder', CarrierDet.DelCharge);
                        $("#txtCarrierMinBoxes").attr('placeholder', "0.00");
                        $("#txtCarrierBegAWB").attr('placeholder', CarrierDet.BEGAWB);
                        $("#txtCarrierEndAWB").attr('placeholder', CarrierDet.ENDAWB);
                        $("#txtCarrierReservations").val("");
                        $("#txtCarrierNeedToBook").attr('placeholder', CarrierDet.NEEDBOOK);
                        $("#txtCarrierToOrderAWB").val("");
                        $("#txtCarrierContactName").val(CarrierDet.CONTACT);
                        $("#txtCarrierFlowersSCR").val(CarrierDet.FLOWSCR);
                        $("#txtCarrierFlowersSCX").val(CarrierDet.FLOWSCX);

                        $("#txtCarrierCutOffMon").val(CarrierDet.CutOffMon);
                        $("#txtCarrierCutOffTue").val(CarrierDet.CutOffTue);
                        $("#txtCarrierCutOffWed").val(CarrierDet.CutOffWed);
                        $("#txtCarrierCutOffThu").val(CarrierDet.CutOffThu);
                        $("#txtCarrierCutOffFri").val(CarrierDet.CutOffFri);
                        $("#txtCarrierCutOffSat").val(CarrierDet.CutOffSat);
                        $("#txtCarrierCutOffSun").val(CarrierDet.CutOffSun);
                        $("#chkAccount").iButton("toggle", CarrierDet.IsAccount == false ? false : true);
                        $("#txtAccLength").val(CarrierDet.AccountLength);                        
                        $("#txtPalletCharge").val(CarrierDet.PALLETCHARGE);    
                        $("#fgrdCarrier [id^=row]").removeClass("trSelectedHeader");
                        $("#fgrdCarrier #row" + CarrierID).addClass("trSelectedHeader");
                        $("#fgrdCarrier td.unsorted").addClass("sorted");
                        $("#fgrdCarrier td.sorted").removeClass("unsorted");
                        $("#fgrdCarrier #row" + CarrierID).removeClass("trSelected");
                        $("#fgrdCarrier #row" + CarrierID + " td.sorted").addClass("unsorted");
                        $("#fgrdCarrier #row" + CarrierID + " td.unsorted").removeClass("sorted");

                        $("#divCarrierFlag").html("1");

                        $("#EditCarrier").dialog('option', 'title', "Edit Carrier:: " + CarrierDet.Carrier);
                        $("#EditCarrier").dialog("open");

                    }
                }
            });
        });

        $("[id^=DeleteCarrier_]").die("click").live("click", function () {
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id').substring(14);

            $('#OldId').html(ID);


            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCarrierByID',
                data: '{"ID":"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    debugger
                    $("#CarrierCode").html(output.d.Carrier);
                    $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + output.d.Carrier + " - " + output.d.Name + "</b> ?</p>");
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
                    var List = $("#DeleteCarrier_" + $("#OldId").html());
                    var ID = $("#OldId").html();
                    var Carrier = $("#CarrierCode").html();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/DeleteCarrierbyID',
                        data: '{"ID":"' + ID + '","Carrier":"' + Carrier + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {

                            if (output.d == 'Success') {
                                adialog.dialog("close");
                                $("#fgrdCarrier").flexReload({ url: '/url/for/refresh' });
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

    $('input').keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            debugger;
            for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                var a;

                if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                    a = i;
                }
                if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i) {
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }
                if ($(this).attr('id').indexOf("txtCarrierCode") > -1) {
                    $("#txtCarrierName").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierName") > -1) {
                    $("#txtCarrierAddress1").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierAddress1") > -1) {
                    $("#txtCarrierAddress2").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierAddress2") > -1) {
                    $("#txtCarrierAddress3").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierAddress3") > -1) {
                    $("#txtCarrierType").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierType") > -1) {
                    $("#chkAccount").focus();
                    return false;
                }
                else if ($(this).attr('id') == "chkAccount") {
                    $("#txtAccLength").focus();
                    return false;
                }
                //else if ($(this).attr('id').indexOf("txtCarrierAirlineIDN") > -1) {
                //    $("#txtCarrierDeliveryCharge").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierDeliveryCharge") > -1) {
                //    $("#txtCarrierMinBoxes").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierMinBoxes") > -1) {
                //    $("#txtCarrierBegAWB").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierBegAWB") > -1) {
                //    $("#txtCarrierEndAWB").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierBegAWB") > -1) {
                //    $("#txtCarrierHash").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierHash") > -1) {
                //    $("#txtCarrierReservations").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierReservations") > -1) {
                //    $("#txtCarrierNeedToBook").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierNeedToBook") > -1) {
                //    $("#txtCarrierToOrderAWB").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierToOrderAWB") > -1) {
                //    $("#txtCarrierContactName").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierContactName") > -1) {
                //    $("#txtCarrierFlowersSCR").focus();
                //    return false;
                //}
                //else if ($(this).attr('id').indexOf("txtCarrierFlowersSCR") > -1) {
                //    $("#txtCarrierFlowersSCX").focus();
                //    return false;
                //}
                else if ($(this).attr('id').indexOf("txtAccLength") > -1) {
                    $("#txtPalletCharge").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtPalletCharge") > -1) {
                    $("#txtCarrierCutOffMon").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierCutOffMon") > -1) {
                    $("#txtCarrierCutOffTue").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierCutOffTue") > -1) {
                    $("#txtCarrierCutOffWed").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierCutOffWed") > -1) {
                    $("#txtCarrierCutOffThu").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierCutOffThu") > -1) {
                    $("#txtCarrierCutOffFri").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierCutOffFri") > -1) {
                    $("#txtCarrierCutOffSat").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierCutOffSat") > -1) {
                    $("#txtCarrierCutOffSun").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtCarrierCutOffSun") > -1) {
                    $("#EditCarrier").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                }
            }
        }
    });

    $("#SelectAllLogs").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ToggleSelectedAllLog',
            data: "{'SelectedAll':'" + Selected + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#msgbox-select").dialog("close");
                if (Selected == "1") {
                    sourceCtl.prop("src", "images/check-on.png");
                    $("#fgrdCarrier").flexReload({ url: '/url/for/refresh' });

                }
                else {
                    sourceCtl.prop("src", "images/check-off.png");
                    $("#fgrdCarrier").flexReload({ url: '/url/for/refresh' });
                }
            }
        });

    });


    $("#txtCarrierType").keydown(function (e) {
        var keyenter = e.which;
        if ($(this).is(':focus') == true) {
            if (keyenter == 65) {
                $(this).val("A")
            }
            if (keyenter == 66) {
                $(this).val("B")
            }
            if (keyenter == 67) {
                $(this).val("C")
            }
            if (keyenter == 84) { $(this).val("T") }
        }
        if (keyenter != 66 && keyenter != 67 && keyenter != 65 && keyenter != 84 && keyenter != 13) {
            e.preventDefault();
        }
    });
</script>
