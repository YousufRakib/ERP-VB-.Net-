<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageFuel.ascx.vb" Inherits="pages_PageFuel" %>

<script src="js/validation.js"></script>
<style type="text/css">
    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
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

     /*#EditFuelByBox input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }*/
</style>

<table>
    <tr>
        <td>

            <div id="DivFuelpage">
                <table id="fgrdFuelByBox" style="display: none; width:auto;"></table>
                <div id="DeleteConfirmFuel" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditFuelByBox" style="display: none" class="filesTab">
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
                <td style="width: 150px;">UOM</td>
                <td>
                    <input type="text" class="AllUpperCaseTextBox" id="txtFuelByBoxUom" style="width: 50px;" maxlength="5">
                </td>
            </tr>
            <tr>
                <td>Sales Type</td>
                <td>
                    <input type="text" id="txtFuelByBoxSalesType" class="AllUpperCaseTextBox" style="width: 15px;" maxlength="1">
                </td>
            </tr>
            <tr>
                <td>Fuel</td>
                <td>
                    <input type="text" id="txtFuelByBoxFuel" style="width: 80px;text-align:right;" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal" maxlength="13" >
                </td>
            </tr>
            <tr>
                <td>Valid from</td>
                <td>
                    <input type="text" id="txtFuelByBoxValidFrom" style="width: 100px;" maxlength="13">
                </td>
            </tr>
            <tr>
                <td>       to</td>
                <td>
                    <input type="text" id="txtFuelByBoxValidTo" style="width: 100px;" maxlength="13">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="divFuelByBoxID" style="display:none;"></div>


<script>
    $(document).ready(new function () {
        $("#fgrdFuelByBox").flexigrid({
            url: 'BloomService.asmx/GetFuelByBoxDetailsForFgrd',
            dataType: 'xml',
            colModel: [
               //{ display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'UOM', name: 'UOM', width: 40, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'SALES TYPE', name: 'SALESTYPE', width: 100, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'FUEL', name: 'FUEL', width: 80, sortable: true, align: 'right', process: HeaderRowClick },
                { display: 'FROM', name: 'FROMDATE', width: 60, sortable: false, align: 'right', process: HeaderRowClick },
                { display: '', name: '', width: 10, sortable: false, align: 'right', process: HeaderRowClick },
                { display: 'TO', name: 'TODATE', width: 60, sortable: false, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'UOM', name: 'UOM' },
                { display: 'SALES TYPE', name: 'SALESTYPE' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewFuelByBox },
            ],
            showTableToggleBtn: true,
            sortname: "UOM",
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
	        width:550,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;
                var sel = jQuery("#fgrdFuelByBox tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#DivFuelpage  #ExportCSV").show();
                }

                if ($("#divFuelByBoxID").html() != "0" && $("#fgrdFuelByBox #row" + $("#divFuelByBoxID").html()).css('display') == "table-row") {
                    var id = $("#divFuelByBoxID").html();
                    $("#fgrdFuelByBox [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdFuelByBox td.unsorted").addClass("sorted");
                    $("#fgrdFuelByBox td.sorted").removeClass("unsorted");
                    $("#fgrdFuelByBox #row" + id).addClass("trSelectedHeader");
                    $("#fgrdFuelByBox #row" + id).removeClass("trSelected");
                    $("#fgrdFuelByBox #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdFuelByBox #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divFuelByBoxID").html($("#fgrdFuelByBox tr:first td:nth-child(3) div").text());
                    $("#fgrdFuelByBox tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });


        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {

                if (id != 0) {
                    var FilterQuery = "";

                    $("#divFuelByBoxID").html(id.toString());

                    $("#fgrdFuelByBox [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdFuelByBox #row" + id).addClass("trSelectedHeader");
                    $("#fgrdFuelByBox td.unsorted").addClass("sorted");
                    $("#fgrdFuelByBox td.sorted").removeClass("unsorted");
                    $("#fgrdFuelByBox #row" + id).removeClass("trSelected");
                    $("#fgrdFuelByBox #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdFuelByBox #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }

        $("#txtFuelByBoxValidFrom").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", 'today');

        $("#txtFuelByBoxValidTo").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", 'today');
    });

    $("#EditFuelByBox").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: $(window).height() - 510,
        title: 'Fuel Box By Type',
        buttons: {
            Save: function () {
                var FuelByBoxID = $("#divFuelByBoxID").html();
                var FuelByBoxUom = $("#txtFuelByBoxUom").val() == "" ? $("#txtFuelByBoxUom").attr('placeholder'): $("#txtFuelByBoxUom").val();
                if (FuelByBoxUom == "") {
                    $(".YellowWarning").html("Please enter UOM..");
                    $(".YellowWarning").show();
                    ctrlFocus($("#txtFuelByBoxUom"));
                    return false;
                }
                var FuelByBoxSalesType = $("#txtFuelByBoxSalesType").val();
                var FuelByBoxFuel = $("#txtFuelByBoxFuel").val() == "" ? $("#txtFuelByBoxFuel").attr('placeholder') : $("#txtFuelByBoxFuel").val();
                var FuelByBoxValidFrom = $("#txtFuelByBoxValidFrom").val() == "" ? $("#txtFuelByBoxValidFrom").datepicker('setDate',new Date()) : $("#txtFuelByBoxValidFrom").val();
                var FuelByBoxValidTo = $("#txtFuelByBoxValidTo").val() == "" ? $("#txtFuelByBoxValidTo").datepicker('setDate', new Date()) : $("#txtFuelByBoxValidTo").val();
                
                debugger;

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveFuelByBox',
                    data: '{"ID":"' + FuelByBoxID + '","FuelByBoxUom":"' + FuelByBoxUom.toString().toUpperCase() + '","FuelByBoxSalesType":"' + FuelByBoxSalesType.toString().toUpperCase() + '","FuelByBoxFuel":"' + FuelByBoxFuel + '","FuelByBoxValidFrom":"' + FuelByBoxValidFrom + '","FuelByBoxValidTo":"' + FuelByBoxValidTo + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error") {
                            $("#EditFuelByBox").dialog("close")
                            $("#fgrdFuelByBox").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
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
            debugger
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewFuelByBox() {
        debugger;
        $("#divFuelByBoxID").html("0");
        $(".YellowWarning").hide();
        $(".Warning").hide();
        $("#txtFuelByBoxUom").val("");
        $("#txtFuelByBoxUom").attr('placeholder',"");
        $("#txtFuelByBoxSalesType").val("");
        $("#txtFuelByBoxFuel").val("");
        $("#txtFuelByBoxFuel").attr('placeholder', "0.00");
        $("#txtFuelByBoxValidFrom").datepicker("option", "dateFormat", "mm/dd/yy").datepicker('setDate', 'today');
        $("#txtFuelByBoxValidTo").datepicker("option", "dateFormat", "mm/dd/yy").datepicker('setDate', '+30');

        $("#EditFuelByBox").dialog("option","title","Fuel by Box Type");
        $("#EditFuelByBox").dialog("open");
    }

    $("[id^=EditFuelByBox_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var FuelByBoxID = ID.replace("EditFuelByBox_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFuelByBoxDetailByID',
            data: '{"ID":"' + FuelByBoxID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var FuelByBoxDet = output.d;
                    //$("#divFuelByBoxID").html(FuelByBoxDet[0].ID);
                    //$("#txtFuelByBoxUom").val("");
                    //$("#txtFuelByBoxUom").attr('placeholder', FuelByBoxDet[0].UOM);
                    //$("#txtFuelByBoxSalesType").val(FuelByBoxDet[0].SALESTYPE);
                    //$("#txtFuelByBoxFuel").val("");
                    //$("#txtFuelByBoxFuel").attr('placeholder',parseFloat(FuelByBoxDet[0].FUEL).toFixed(2));
                    //$("#txtFuelByBoxValidFrom").val(FuelByBoxDet[0].FROMDATE);
                    //$("#txtFuelByBoxValidTo").val(FuelByBoxDet[0].TODATE);

                    $("#divFuelByBoxID").html(FuelByBoxDet.ID);
                    $("#txtFuelByBoxUom").val("");
                    $("#txtFuelByBoxUom").attr('placeholder', FuelByBoxDet.UOM);
                    $("#txtFuelByBoxSalesType").val(FuelByBoxDet.SALESTYPE);
                    $("#txtFuelByBoxFuel").val("");
                    $("#txtFuelByBoxFuel").attr('placeholder', parseFloat(FuelByBoxDet.FUEL).toFixed(2));
                    $("#txtFuelByBoxValidFrom").val(FuelByBoxDet.FROMDATE);
                    $("#txtFuelByBoxValidTo").val(FuelByBoxDet.TODATE);
                    
                    $("#fgrdFuelByBox [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdFuelByBox #row" + FuelByBoxID).addClass("trSelectedHeader");
                    $("#fgrdFuelByBox td.unsorted").addClass("sorted");
                    $("#fgrdFuelByBox td.sorted").removeClass("unsorted");
                    $("#fgrdFuelByBox #row" + FuelByBoxID).removeClass("trSelected");
                    $("#fgrdFuelByBox #row" + FuelByBoxID + " td.sorted").addClass("unsorted");
                    $("#fgrdFuelByBox #row" + FuelByBoxID + " td.unsorted").removeClass("sorted");

                    $("#EditFuelByBox").dialog('option', 'title', "Fuel by Box Type :: " + FuelByBoxDet.UOM);
                    $("#EditFuelByBox").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteFuelByBox_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteFuelByBox_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFuelByBoxDetailByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteConfirmFuel").html("<p>Are you sure to delete<b> " + res.UOM+ "</b> ?</p>");
                $("#DeleteConfirmFuel").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    $("#DeleteConfirmFuel").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteFuelByBox_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteFuelByBoxbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdFuelByBox").flexReload({ url: '/url/for/refresh' });
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
            $("#txtFuelByBoxType").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtFuelByBoxUom") {
                $("#txtFuelByBoxSalesType").focus();
                return false;
            }
            if ($(this).attr('id') == "txtFuelByBoxSalesType") {
                $("#txtFuelByBoxFuel").focus();
                return false;
            }
            if ($(this).attr('id') == "txtFuelByBoxFuel") {
                $("#txtFuelByBoxValidFrom").focus();
                return false;
            }
            if ($(this).attr('id') == "txtFuelByBoxValidFrom") {
                $("#txtFuelByBoxValidTo").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtFuelByBoxValidTo") {
                $("#EditFuelByBox").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

</script>