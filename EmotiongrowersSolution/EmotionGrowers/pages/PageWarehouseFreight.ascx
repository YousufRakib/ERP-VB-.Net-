<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageWarehouseFreight.ascx.vb" Inherits="pages_PageWarehouseFreight" %>
<script src="js/validation.js"></script>
<table>
    <tr>
        <td>
            <div id="DivWarehouseFreightFgrd">
                <table id="fgrdWarehouseFreight" style="display: none;"></table>
                <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>
<div id="EditWarehouseFreight" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <tr>
                <td style="width: 150px;">Warehouse</td>
                <td colspan="3">
                    <select id="lstWarehouse"></select>
                    <input type="hidden" id="hfWarehouse">
                </td>
            </tr>
            <tr>
                <td>Airport</td>
                <td colspan="3">
                    <select id="lstAirport"></select>
                    <input type="hidden" id="hfAirport">
                </td>
            </tr>
            <tr>
                <td>Freight</td>
                <td>
                    <input type="text" id="txtFreight" style="width: 100px;" maxlength="6" class="DecimalsOnly" />
                </td>
            </tr>
        </tbody>
    </table>
</div>

<%--<div id="MsgWarning" style="display: none;">
    <p id="MsgHtml"></p>
</div>

<div id="DivPostConfirmDialog" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msgPostConfirm" class="PostDialogMsg"></p>
    </div>
</div>--%>
<div id="divwarehouseAirport" style="display: none;"></div>
<div id="WarehouseAirport" style="display: none;"></div>

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
</style>
<script type="text/javascript">    
    $(document).ready(new function () {
        LoadAirport();
        LoadWarehouse();
        $("#fgrdWarehouseFreight").flexigrid({
            url: 'BloomService.asmx/GetWarehouseFreightForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'WH', name: 'WH', width: 120, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'AIRPORT', name: 'AIRPORT', width: 120, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'FREIGHT', name: 'FREIGHT', width: 120, sortable: true, align: 'right', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'WH', name: 'WH' },
                { display: 'AIRPORT', name: 'AIRPORT' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: addclicked },
            ],
            showTableToggleBtn: true,
            sortname: "WH",
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
            width: 555,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;
                /*Add Export button if grid has rows :: Added by Abi :: 22Jun2018*/
                var sel = jQuery("#fgrdWarehouseFreight tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivWarehouseFreightFgrd #ExportCSV").show();
                }

                if ($("#divwarehouseAirport").html() != "0" && $("#fgrdWarehouseFreight #row" + $("#divwarehouseAirport").html()).css('display') == "table-row") {
                    var id = $("#divwarehouseAirport").html();
                    $("#fgrdWarehouseFreight [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdWarehouseFreight td.unsorted").addClass("sorted");
                    $("#fgrdWarehouseFreight td.sorted").removeClass("unsorted");
                    $("#fgrdWarehouseFreight #row" + id).addClass("trSelectedHeader");
                    $("#fgrdWarehouseFreight #row" + id).removeClass("trSelected");
                    $("#fgrdWarehouseFreight #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdWarehouseFreight #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divwarehouseAirport").html($("#fgrdWarehouseFreight tr:first td:nth-child(3) div").text());
                    $("#fgrdWarehouseFreight tr:first").addClass("trSelectedHeader trSelected");
                }
            }
        });

        /*Selected row higlighted with red color by Abi :: 23Apr2018*/
        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {
                if (id != 0) {
                    $("#divwarehouseAirport").html(id.toString());
                    $("#fgrdWarehouseFreight [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdWarehouseFreight #row" + id).addClass("trSelectedHeader");
                    $("#fgrdWarehouseFreight td.unsorted").addClass("sorted");
                    $("#fgrdWarehouseFreight td.sorted").removeClass("unsorted");
                    $("#fgrdWarehouseFreight #row" + id).removeClass("trSelected");
                    $("#fgrdWarehouseFreight #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdWarehouseFreight #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }

        $("[id^=EditWarehouseFreight_]").die('click').live("click", function (e) {
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id');
            var WarehousAirport = ID.replace("EditWarehouseFreight_", "");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetWarehouseFreightByID',
                data: '{"ID":"' + WarehousAirport + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    debugger
                    if (output.d != null) {
                        var WHDet = output.d;
                        $("#divwarehouseAirport").html(WarehousAirport);
                        $("#lstWarehouse").val(WHDet.WH);
                        $("#txtFreight").val(WHDet.FREIGHT);
                        $("#lstAirport").val(WHDet.AIRPORT);

                        $("#fgrdWarehouseFreight [id^=row]").removeClass("trSelectedHeader");
                        $("#fgrdWarehouseFreight #row" + WarehousAirport).addClass("trSelectedHeader");
                        $("#fgrdWarehouseFreight td.unsorted").addClass("sorted");
                        $("#fgrdWarehouseFreight td.sorted").removeClass("unsorted");
                        $("#fgrdWarehouseFreight #row" + WarehousAirport).removeClass("trSelected");
                        $("#fgrdWarehouseFreight #row" + WarehousAirport + " td.sorted").addClass("unsorted");
                        $("#fgrdWarehouseFreight #row" + WarehousAirport + " td.unsorted").removeClass("sorted");

                        $("#EditWarehouseFreight").dialog('option', 'title', "Edit Warehouse Freight:: " + WHDet.WH + " - " + WHDet.AIRPORT);
                        $("#EditWarehouseFreight").dialog("open");

                    }
                }
            });
        });

        $("#EditWarehouseFreight").dialog({
            autoOpen: false,
            resizable: false,
            modal: true,
            width: 400,
            height: 200,
            title: 'Edit Warehouse Freight::',
            buttons:
            {
                Save: function () {
                    var ID = $("#divwarehouseAirport").html();
                    var Warehouse = $("#lstWarehouse").val();
                    var Airport = $("#lstAirport").val();
                    var Freight = $("#txtFreight").val() == "" ? $("#txtFreight").attr('placeholder') : $("#txtFreight").val();

                    if (Warehouse == "0") {
                        $("#EditWarehouseFreight").next('div').find(".msgui").html("Please Select Warehouse..");
                        $("#EditWarehouseFreight").next('div').find('.msgui').show();
                        ctrlFocus($("#lstWarehouse"));
                        return false;
                    }
                    if (Airport == "0") {
                        $("#EditWarehouseFreight").next('div').find(".msgui").html("Please Select Aiport..");
                        $("#EditWarehouseFreight").next('div').find('.msgui').show();
                        ctrlFocus($("#lstAirport"));
                        return false;
                    }
                    if (Freight == "") {
                        $("#EditWarehouseFreight").next('div').find(".msgui").html("Please Enter Freight..");
                        $("#EditWarehouseFreight").next('div').find('.msgui').show();
                        ctrlFocus($("#txtFreight"));
                        return false;
                    }
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/SaveWarehouseFreight',
                        data: '{"ID":"' + ID + '","WH":"' + Warehouse.toUpperCase() + '","AIRPORT":"' + Airport.toUpperCase() + '","FREIGHT":"' + Freight + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                            debugger;
                            if (output.d != "error") {                               
                                if (output.d.toLowerCase().indexOf("unique key") >= 0 || output.d.toLowerCase().indexOf("already") >= 0) {                                    
                                    $("#EditWarehouseFreight").next('div').find(".msgui").html("Freight For (<b>" + Warehouse.toUpperCase() + " - " + Airport.toUpperCase() + "</b>) Already exists!");
                                    $("#EditWarehouseFreight").next('div').find('.msgui').show();
                                }
                                else {
                                    $("#EditWarehouseFreight").dialog("close")
                                    $("#fgrdWarehouseFreight").flexReload({ url: '/url/for/refresh' });
                                }
                            }
                            else {
                                $("#EditWarehouseFreight").next('div').find(".msgui").html(output.d);
                                $("#EditWarehouseFreight").next('div').find('.msgui').show();
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
                $("#EditWarehouseFreight").next('div').find('.msgui').remove();
                $("#EditWarehouseFreight").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
                $("#EditWarehouseFreight").next('div').find(".msgui").css("width", $("#EditWarehouseFreight").width() - $('#EditWarehouseFreight').next('div').find(".ui-dialog-buttonset").width());
                $("#EditWarehouseFreight").next('div').find('.msgui').hide();

                $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
                $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            }
        });


        var currentRowId = 0;
        $("[id^=DeleteWarehouseFreight_]").die("click").live("click", function () {
            debugger;
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id').substring(23);
            var sourceCtl = $(this);
            if (currentRowId == 0) {
                $("#fgrdWarehouseFreight .trSelectedHeader").removeClass("trSelectedHeader");
                $("#fgrdWarehouseFreight .erow").addClass("erow");
            }
            else {
                $("#fgrdWarehouseFreight #row" + currentRowId).removeClass("trSelectedHeader");
                $("#fgrdWarehouseFreight #row" + currentRowId).addClass("erow");
            }
            var ID = sourceCtl.attr('id').substring(23);
            currentRowId = ID;
            //var $row = $(this).closest('table').children('tr:first');
            $("#fgrdWarehouseFreight #row" + ID).addClass("trSelectedHeader");

            $('#OldId').html(ID);
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetWarehouseFreightByID',
                data: '{"ID":"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    debugger
                    $("#WarehouseAirport").html(output.d.ID);
                    $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + output.d.WH + " - " + output.d.AIRPORT + "</b> ?</p>");
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
                    var ID = $("#OldId").html();                    
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/DeleteWarehouseFreightByID',
                        data: '{"ID":"' + ID + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {

                            if (output.d == 'Success') {
                                adialog.dialog("close");
                                $("#fgrdWarehouseFreight").flexReload({ url: '/url/for/refresh' });
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
    /*Load Airport from F_AIRPOT table by Prashant:: Created on 25April2018 */
    function LoadAirport() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetAirportList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstAirport').empty();
                var AiportData = output.d;
                $('#lstAirport').append('<option value="0">Select</option>');
                for (var i in AiportData) {
                    var Airport = AiportData[i];
                    $('#lstAirport').append('<option value="' + Airport.Airport + '">' + Airport.Airport + '</option>');
                }

                if ($("#lstAirport").val() != "" && $("#hfAirport").val() != 0)
                    $('#lstAirport').val($("#hfAirport").val());
                else
                    $("#lstAirport").val("0");
            }
        });
    }
    function LoadWarehouse() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstWarehouse').empty();
                var WHData = output.d;
                $('#lstWarehouse').append('<option value="0">Select</option>');
                for (var i in WHData) {
                    var WH = WHData[i];
                    $('#lstWarehouse').append('<option value="' + WH.WH + '">' + WH.WH + '</option>');
                }

                if ($("#lstWarehouse").val() != "" && $("#hfWarehouse").val() != 0)
                    $('#lstWarehouse').val($("#hfWarehouse").val());
                else
                    $("#lstWarehouse").val("0");
            }
        });
    }

    function addclicked() {
        $("#divwarehouseAirport").html("0");
        $('#lstWarehouse').val("");
        $('#lstAirport').val("");
        $("#txtFreight").val("");
        $("#txtFreight").attr("placeholder", "0.00");
        $("#EditWarehouseFreight").dialog('option', 'title', "Add Warehouse Freight");
        $("#EditWarehouseFreight").dialog("open");
    }
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
                if ($(this).attr('id').indexOf("lstWarehouse") > -1) {
                    $("#lstAirport").focus();
                    return false;
                }
                if ($(this).attr('id').indexOf("lstAirport") > -1) {
                    $("#txtFreight").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("txtFreight") > -1) {
                    $("#EditWarehouseFreight").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                }
            }
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
</script>
