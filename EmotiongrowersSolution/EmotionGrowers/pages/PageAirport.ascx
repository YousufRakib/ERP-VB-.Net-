<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageAirport.ascx.vb" Inherits="pages_PageAirport" %>
<script src="js/validation.js"></script>

<style>
    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .trSelectedHeader {
        background-color: red !important;
    }

         /*#EditAirport input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }*/

</style>

<table>
    <tr>
        <td>
            <div id="DivAirportForFgrd">
                <table id="fgrdAirport" style="display: none;"></table>

                <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div style="margin-top: 10px;" class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
                <div id="DivAirportButtonList" class="ui-dialog-buttonset" style="float: left; margin-top: 10px;">
                    <input id="btnAirportHistory" type="button" class="BloomButtonEnabled" value="H=History" style="margin-left: 5px; width: 100px; background: Green;" />
                </div>
                <div id="DivAirportDialogButtonList" class="ui-dialog-buttonset" style="float: right;">
                    <button type="button" id="btnAirportDetailsCancel" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-cancel" role="button" aria-disabled="false"><span class="ui-button-text">Close</span></button>
                </div>
            </div>
        </td>
    </tr>
</table>

<div id="DivAirportHist" style="display: none;">
    <table id="fgrdAirportHist" style="display: block;"></table>
</div>

<div id="EditAirport" style="display: none;" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <%--  <tr style="height: 30px;">
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
                <td style="width: 150px;">Airport</td>
                <td>
                    <input type="text" id="txtAirportCode" style="width: 50px;" maxlength="3" class="AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td>
                    <input type="text" id="txtAirportName" style="width: 240px;" maxlength="20" class="AllUpperCaseTextBox" />
                </td>
            </tr>
            <tr>
                <td>Freight</td>
                <td>
                    <input type="text" id="txtAirportFreight" style="width: 80px;" maxlength="9" class="ClsDecimalsOnly">
                </td>
            </tr>
            <tr>
                <td>Fuel</td>
                <td>
                    <input type="text" id="txtAirportFuel" style="width: 80px;" maxlength="9" class="ClsDecimalsOnly">
                </td>
            </tr>
            <tr style="height: 10px;">
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <label>Days to deduct from customer shipping date </label>
                    <br />
                    <label id="AirportMon">Mon:</label>
                    <input type="text" id="txtAirportMon" style="width: 15px;" maxlength="1" class="ClsNumbersOnly AirportDays">
                    <label id="AirportTue">Tue:</label>
                    <input type="text" id="txtAirportTue" style="width: 15px;" maxlength="1" class="ClsNumbersOnly AirportDays">
                    <label id="AirportWed">Wed:</label>
                    <input type="text" id="txtAirportWed" style="width: 15px;" maxlength="1" class="ClsNumbersOnly AirportDays">
                    <label id="AirportThu">Thu:</label>
                    <input type="text" id="txtAirportThu" style="width: 15px;" maxlength="1" class="ClsNumbersOnly AirportDays">
                    <label id="AirportFri">Fri:</label>
                    <input type="text" id="txtAirportFri" style="width: 15px;" maxlength="1" class="ClsNumbersOnly AirportDays">
                    <label id="AirportSat">Sat:</label>
                    <input type="text" id="txtAirportSat" style="width: 15px;" maxlength="1" class="ClsNumbersOnly AirportDays">
                    <label id="AirportSun">Sun:</label>
                    <input type="text" id="txtAirportSun" style="width: 15px;" maxlength="1" class="ClsNumbersOnly AirportDays">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="MsgWarning" style="display: none;">
    <p id="MsgHtml"></p>
</div>

<div id="divAirportID" style="display: none;"></div>

<script type="text/javascript">

    $(document).ready(new function ()
    {
        $("#fgrdAirport").flexigrid({
            url: 'BloomService.asmx/GetAirportForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Code', name: 'Airport', width: 50, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Airport Name', name: 'Name', width: 200, sortable: true, align: 'left', process: HeaderRowClick },
                /*{ display: 'Carrier1', name: 'Carrier1', width: 50, sortable: false, align: 'left' },
                { display: 'Carrier2', name: 'Carrier2', width: 50, sortable: false, align: 'left' },
                { display: 'Carrier3', name: 'Carrier3', width: 50, sortable: false, align: 'left' },
                { display: 'Carrier4', name: 'Carrier4', width: 50, sortable: false, align: 'left' },
                { display: 'Carrier5', name: 'Carrier5', width: 50, sortable: false, align: 'left' },   */
                { display: 'Freight', name: 'Freight', width: 50, sortable: false, align: 'Right', process: HeaderRowClick },
                { display: 'Fuel', name: 'Fuel', width: 50, sortable: false, align: 'Right', process: HeaderRowClick },
                /*{ display: 'FreightCre', name: 'FreightCre', width: 50, sortable: false, align: 'left' }, */
                //{ display: 'Monday', name: 'Monday', width: 40, sortable: false, align: 'Center' },
                //{ display: 'Tuesday', name: 'Tuesday', width: 40, sortable: false, align: 'Center' },
                //{ display: 'Wed', name: 'Wednesday', width: 40, sortable: false, align: 'Center' },
                //{ display: 'Thursday', name: 'ThursDay', width: 40, sortable: false, align: 'Center' },
                //{ display: 'Friday', name: 'Friday', width: 40, sortable: false, align: 'Center' },
                //{ display: 'Saturday', name: 'Saturday', width: 40, sortable: false, align: 'Center' },
                //{ display: 'Sunday', name: 'Sunday', width: 40, sortable: false, align: 'Center' }
            ],
            searchitems: [
                { display: 'Code', name: 'Airport' },
                { display: 'Airport Name', name: 'Name' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: addAirportclicked },
            ],
            showTableToggleBtn: true,
            sortname: "Airport",
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
            height: $(window).height() - 295,
	        width:550,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;
                /*Add Export button if grid has rows :: Added by Abi :: 22Jun2018*/
                var sel = jQuery("#fgrdAirport tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivAirportForFgrd #ExportCSV").show();
                }
                if ($("#divAirportID").html() != "0" && $("#fgrdAirport #row" + $("#divAirportID").html()).css('display') == "table-row") {
                    var id = $("#divAirportID").html();
                    $("#fgrdAirport [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdAirport td.unsorted").addClass("sorted");
                    $("#fgrdAirport td.sorted").removeClass("unsorted");
                    $("#fgrdAirport #row" + id).addClass("trSelectedHeader");
                    $("#fgrdAirport #row" + id).removeClass("trSelected");
                    $("#fgrdAirport #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdAirport #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divAirportID").html($("#fgrdPendingInfo tr:first td:nth-child(3) div").text());
                    $("#fgrdAirport tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });        
    });

    function addAirportclicked() {
            debugger;
            $("#divAirportID").html("0");

            $("#txtAirportCode").val("");
            $("#txtAirportCode").attr('placeholder', "");
            $("#txtAirportName").val("");
            $("#txtAirportFreight").val("");
            $("#txtAirportFreight").attr('placeholder', "0.00");
            $("#txtAirportFuel").val("");
            $("#txtAirportFuel").attr('placeholder', "0.00");

            $("#txtAirportMon").val("");
            $("#txtAirportMon").attr('placeholder', "");
            $("#txtAirportTue").val("");
            $("#txtAirportTue").attr('placeholder', "");
            $("#txtAirportWed").val("");
            $("#txtAirportWed").attr('placeholder', "");
            $("#txtAirportThu").val("");
            $("#txtAirportThu").attr('placeholder', "");
            $("#txtAirportFri").val("");
            $("#txtAirportFri").attr('placeholder', "");
            $("#txtAirportSat").val("");
            $("#txtAirportSat").attr('placeholder', "");
            $("#txtAirportSun").val("");
            $("#txtAirportSun").attr('placeholder', "");
            $("#EditAirport").dialog('option', 'title', 'Airport Maintenance');
            $("#EditAirport").dialog("open");
        }
    /*Selected row higlighted with red color by Abi :: 23Apr2018*/
    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#divAirportID").html(id.toString());

                $("#fgrdAirport [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdAirport #row" + id).addClass("trSelectedHeader");
                $("#fgrdAirport td.unsorted").addClass("sorted");
                $("#fgrdAirport td.sorted").removeClass("unsorted");
                $("#fgrdAirport #row" + id).removeClass("trSelected");
                $("#fgrdAirport #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdAirport #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    $("#EditAirport").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 500,
        height: 250,
        title: 'Airport File Maintenance::',
        buttons: {
            Save: function () {
                debugger;
                var AirportID = $("#divAirportID").html();
                var AirportCode = $("#txtAirportCode").val() == "" ? $("#txtAirportCode").attr("placeholder") : $("#txtAirportCode").val();
                if (AirportCode == "") {
                    $(".YellowWarning").html("Please enter Airport..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtAirportCode"));
                    return false;
                }
                var AirportName = $("#txtAirportName").val();
                if (AirportName == "") {
                    $(".YellowWarning").html("Please enter Airport Name..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtAirportName"));
                    return false;
                }
                debugger;
                var Freight = $("#txtAirportFreight").val() == "" ? parseFloat($("#txtAirportFreight").attr("placeholder")) : parseFloat($("#txtAirportFreight").val());
                var Fuel = $("#txtAirportFuel").val() == "" ? parseFloat($("#txtAirportFuel").attr("placeholder")) : parseFloat($("#txtAirportFuel").val());

                var Mon = $("#txtAirportMon").val() == "" ? $("#txtAirportMon").attr("placeholder") : $("#txtAirportMon").val().replace(':', '') == "" ? "" : $("#txtAirportMon").val().replace(':', '')
                var Tue = $("#txtAirportTue").val() == "" ? $("#txtAirportTue").attr("placeholder") : $("#txtAirportTue").val().replace(':', '') == "" ? "" : $("#txtAirportTue").val().replace(':', '')
                var Wed = $("#txtAirportWed").val() == "" ? $("#txtAirportWed").attr("placeholder") : $("#txtAirportWed").val().replace(':', '') == "" ? "" : $("#txtAirportWed").val().replace(':', '')
                var Thu = $("#txtAirportThu").val() == "" ? $("#txtAirportThu").attr("placeholder") : $("#txtAirportThu").val().replace(':', '') == "" ? "" : $("#txtAirportThu").val().replace(':', '')
                var Fri = $("#txtAirportFri").val() == "" ? $("#txtAirportFri").attr("placeholder") : $("#txtAirportFri").val().replace(':', '') == "" ? "" : $("#txtAirportFri").val().replace(':', '')
                var Sat = $("#txtAirportSat").val() == "" ? $("#txtAirportSat").attr("placeholder") : $("#txtAirportSat").val().replace(':', '') == "" ? "" : $("#txtAirportSat").val().replace(':', '')
                var Sun = $("#txtAirportSun").val() == "" ? $("#txtAirportSun").attr("placeholder") : $("#txtAirportSun").val().replace(':', '') == "" ? "" : $("#txtAirportSun").val().replace(':', '')

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveAirport',
                    data: '{"ID":"' + AirportID + '","AIRPORT":"' + AirportCode + '","NAME":"' + AirportName + '","FREIGHT":"' + Freight + '","FUEL":"' + Fuel + '","MONDAY":"' + Mon + '","TUESDAY":"' + Tue + '","WEDNESDAY":"' + Wed + '","THURSDAY":"' + Thu + '","FRIDAY":"' + Fri + '","SATURDAY":"' + Sat + '","SUNDAY":"' + Sun + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != "error") {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditAirport").next('div').find(".msgui").html("Airport Code (<b>" + AirportCode.toUpperCase() + "</b>) Already exists!");
                                $("#EditAirport").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditAirport").dialog("close")
                                $("#fgrdAirport").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $(".Warning").html(output.d);
                            $(".Warning").show();
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
            $("#EditAirport").next('div').find('.msgui').remove();
            $("#EditAirport").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
            $("#EditAirport").next('div').find(".msgui").css("width", $("#EditAirport").width() - $('#EditAirport').next('div').find(".ui-dialog-buttonset").width());
            $("#EditAirport").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("[id^=EditAirport_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var AirportID = ID.replace("EditAirport_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetAirportDetailByID',
            data: '{"ID":"' + AirportID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var AirportDet = output.d;
                    $("#divAirportID").html(AirportID);
                    $("#txtAirportCode").val("");
                    $("#txtAirportCode").attr('placeholder', AirportDet.Airport);
                    $("#txtAirportName").val(AirportDet.Name);
                    $("#txtAirportFreight").val("");
                    $("#txtAirportFreight").attr('placeholder', parseFloat(AirportDet.Freight).toFixed(2));
                    $("#txtAirportFuel").val("");
                    $("#txtAirportFuel").attr('placeholder', parseFloat(AirportDet.Fuel).toFixed(2));

                    $("#txtAirportMon").val("");
                    $("#txtAirportMon").attr('placeholder', AirportDet.Monday);
                    $("#txtAirportTue").val("");
                    $("#txtAirportTue").attr('placeholder', AirportDet.Tuesday);
                    $("#txtAirportWed").val("");
                    $("#txtAirportWed").attr('placeholder', AirportDet.Wednesday);
                    $("#txtAirportThu").val("");
                    $("#txtAirportThu").attr('placeholder', AirportDet.ThursDay);
                    $("#txtAirportFri").val("");
                    $("#txtAirportFri").attr('placeholder', AirportDet.Friday);
                    $("#txtAirportSat").val("");
                    $("#txtAirportSat").attr('placeholder', AirportDet.Saturday);
                    $("#txtAirportSun").val("");
                    $("#txtAirportSun").attr('placeholder', AirportDet.Sunday);


                    $("#fgrdAirport [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdAirport #row" + AirportID).addClass("trSelectedHeader");
                    $("#fgrdAirport td.unsorted").addClass("sorted");
                    $("#fgrdAirport td.sorted").removeClass("unsorted");
                    $("#fgrdAirport #row" + AirportID).removeClass("trSelected");
                    $("#fgrdAirport #row" + AirportID + " td.sorted").addClass("unsorted");
                    $("#fgrdAirport #row" + AirportID + " td.unsorted").removeClass("sorted");
                    $("#EditAirport").dialog('option', 'title', "Airport File Maintenance :: " + AirportDet.Airport);
                    $("#EditAirport").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteAirport_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteAirport_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetAirportDetailByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + res.Airport + " - " + res.Name + "</b> ?</p>");
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
                var List = $("#DeleteAirport_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteAirportbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdAirport").flexReload({ url: '/url/for/refresh' });
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

    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtAirportCode") {
                $("#txtAirportName").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportName") {
                $("#txtAirportFreight").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportFreight") {
                $("#txtAirportFuel").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportFuel") {
                $("#txtAirportMon").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportMon") {
                $("#txtAirportTue").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportTue") {
                $("#txtAirportWed").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportWed") {
                $("#txtAirportThu").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportThu") {
                $("#txtAirportFri").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportFri") {
                $("#txtAirportSat").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportSat") {
                $("#txtAirportSun").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtAirportSun") {
                $("#EditAirport").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

    $("#btnAirportHistory").die("click").live("click", function () {
        debugger;
        //$("#DivAirportHist").dialog("open");
        //$("#fgrdAirportHist").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();

        // $("#fgrdAirportHist").empty();
        $("#fgrdAirportHist").flexOptions().flexReload();
        //$("#fgrdAirportHist").flexOptions({ params: [{}], query: "", newp: 1 }).flexReload();

        $("#DivAirportHist").dialog('option', 'title', 'Airport History File');
        $("#DivAirportHist").dialog("open");
    });

    $("#fgrdAirportHist").flexigrid({
        url: 'BloomService.asmx/GetAirportHistForFgrd',
        dataType: 'xml',
        colModel: [
            //{ display: '', name: '', width: 20, sortable: true, align: 'Center' },
            //{ display: '', name: '', width: 20, sortable: true, align: 'Center' },
            { display: 'Type', name: 'Type', width: 100, sortable: true, align: 'left' },
            { display: 'Code', name: 'Airport', width: 50, sortable: true, align: 'left' },
            /*{ display: 'Carrier1', name: 'Carrier1', width: 50, sortable: false, align: 'left' },
            { display: 'Carrier2', name: 'Carrier2', width: 50, sortable: false, align: 'left' },
            { display: 'Carrier3', name: 'Carrier3', width: 50, sortable: false, align: 'left' },
            { display: 'Carrier4', name: 'Carrier4', width: 50, sortable: false, align: 'left' },
            { display: 'Carrier5', name: 'Carrier5', width: 50, sortable: false, align: 'left' },   */
            { display: 'Freight', name: 'Freight', width: 80, sortable: true, align: 'Right' },
            { display: 'Fuel', name: 'Fuel', width: 80, sortable: true, align: 'Right' },
            { display: 'Adduser', name: 'Adduser', width: 100, sortable: false, align: 'left' },
            { display: 'Adddate', name: 'Adddate', width: 80, sortable: true, align: 'Right' },
            /*{ display: 'Tuesday', name: 'Tuesday', width: 50, sortable: false, align: 'left' },
            { display: 'Wednesday', name: 'Wednesday', width: 50, sortable: false, align: 'left' },
            { display: 'ThursDay', name: 'ThursDay', width: 50, sortable: false, align: 'left' },
            { display: 'Friday', name: 'Friday', width: 50, sortable: false, align: 'left' },
            { display: 'Saturday', name: 'Saturday', width: 50, sortable: false, align: 'left' },
            { display: 'Sunday', name: 'Sunday', width: 50, sortable: false, align: 'left' },    */
        ],
        searchitems: [
            { display: 'Type', name: 'Type' },
            { display: 'Code', name: 'Airport' },
        ],
        showTableToggleBtn: true,
        sortname: "Order Asc",
        sortorder: "",
        usepager: false,
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
        height: 440,
        width: $(window).width() - 770,
        striped: true,
        onSuccess: function () {
            debugger;
        },
    });


    $("#DivAirportHist").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 650,
        height: 550,
        title: 'Airport History File',
        buttons: {
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    /*--------- 25-Sep-2018 :: Anitha :: Added for set next text box focus */
    $("#txtAirportMon").keypress(function () {
        $("#txtAirportTue").focus();
    });
    $("#txtAirportTue").keypress(function () {
        $("#txtAirportWed").focus();
    });
    $("#txtAirportWed").keypress(function () {
        $("#txtAirportThu").focus();
    });
    $("#txtAirportThu").keypress(function () {
        $("#txtAirportFri").focus();
    });
    $("#txtAirportFri").keypress(function () {
        $("#txtAirportSat").focus();
    });
    $("#txtAirportSat").keypress(function () {
        $("#txtAirportSun").focus();
    });
    $("#txtAirportSun").keypress(function (e) {
        var key = e.which;
        if (key == 13) { //enter key
            $(this).next().focus();
        }
    });

    $(".AirportDays").keydown(function (e) {
        var key = e.which;
        if (key == 37) { //left arrow
            $(this).prev().prev().focus();
        }
        else if (key == 39) { //right arrow
            $(this).next().next().focus();
        }
        else if (key == 13) { //enter key
            $(this).next().focus();
        }
    });
    /*--------- 25-Sep-2018 :: Anitha :: Added for set next text box focus */

    $("#btnAirportDetailsCancel").die("click").live("click", function () {
        $("#DivAirportPage").dialog("close");
    });
</script>
