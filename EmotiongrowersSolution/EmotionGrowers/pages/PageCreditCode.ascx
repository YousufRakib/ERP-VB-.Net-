<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCreditCode.ascx.vb" Inherits="pages_PageCreditCode" %>

<link rel="stylesheet" href="css/Filters.css">
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

</style>

<table>
    <tr>
        <td>

            <div>
                <table id="fgrdCreditCode" style="display: none;"></table>
                <div id="DeleteConfirmCreditCode" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditCreditCode" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>           
            <tr>
                <td style="width: 150px;">Code</td>
                <td>
                    <input type="text" id="txtCode" style="width: 40px;text-transform:uppercase;" maxlength="3">
                </td>
            </tr>
            <tr>
                <td>Reason</td>
                <td>
                    <input type="text" id="txtReason" style="width: 280px;" maxlength="40">
                </td>
            </tr>
            <tr>
                <td>Charger Grower</td>
                <td>
                    <input type="checkbox"  id="ChkChargerrow" />
                </td>
            </tr>
            <tr>
                <td>Return to Inventory</td>
                <td>
                    <input type="checkbox" id="ChkReturnInv" >
                </td>
            </tr>
            <tr>
                <td>GL Account</td>
                <td>
                    <input type="text" id="txtGlacc" style="width: 100px;text-transform:uppercase;" maxlength="9">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="divCreditCodeID" style="display:none;"></div>

<script>
    $(document).ready(new function () {
        $("#fgrdCreditCode").flexigrid({
            url: 'BloomService.asmx/GetCreditCodeDetailsForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Code', name: 'Code', width: 30, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Reason', name: 'Reason', width: 210, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'CHARGEGROW', name: 'CHARGEGROW', width: 40, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'RETURNINV', name: 'RETURNINV', width: 40, sortable: false, align: 'left', process: HeaderRowClick },
                { display: 'GLACCOUNT', name: 'GLACCOUNT', width: 60, sortable: false, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'Code', name: 'Code' },
                { display: 'Reason', name: 'Reason' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewCreditCode },
            ],
            showTableToggleBtn: true,
            sortname: "REASON",
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
            height: $(window).height() - 260,
            width: 560,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;

                /*Add Export button if grid has rows :: Added by Ani :: 28Sep2018*/
                var sel = jQuery("#fgrdCreditCode tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivCreditCodePage  #ExportCSV").show();
                }

                if ($("#divCreditCodeID").html() != "0" && $("#fgrdCreditCode #row" + $("#divCreditCodeID").html()).css('display') == "table-row") {
                    var id = $("#divCreditCodeID").html();
                    $("#fgrdCreditCode [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCreditCode td.unsorted").addClass("sorted");
                    $("#fgrdCreditCode td.sorted").removeClass("unsorted");
                    $("#fgrdCreditCode #row" + id).addClass("trSelectedHeader");
                    $("#fgrdCreditCode #row" + id).removeClass("trSelected");
                    $("#fgrdCreditCode #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdCreditCode #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divCreditCodeID").html($("#fgrdCreditCode tr:first td:nth-child(3) div").text());
                    $("#fgrdCreditCode tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });

    });

    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#divCreditCodeID").html(id.toString());

                $("#fgrdCreditCode [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdCreditCode #row" + id).addClass("trSelectedHeader");
                $("#fgrdCreditCode td.unsorted").addClass("sorted");
                $("#fgrdCreditCode td.sorted").removeClass("unsorted");
                $("#fgrdCreditCode #row" + id).removeClass("trSelected");
                $("#fgrdCreditCode #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdCreditCode #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtCode") {
                $("#txtReason").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtReason") {
                $("#ChkChargerrow").focus();
                return false;
            }
            else if ($(this).attr('id') == "ChkChargerrow") {
                $("#ChkReturnInv").focus();
                return false;
            }
            else if ($(this).attr('id') == "ChkReturnInv") {
                $("#txtGlacc").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtGlacc") {
                $("#EditCreditCode").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

    function AddNewCreditCode() {
        debugger;
        $("#divCreditCodeID").html("0");
        $("#txtCode").val("");
        $("#txtReason").attr('placeholder', "");
        $("#txtReason").val("");
        $('#ChkChargerrow').iButton("toggle", true);
        $('#ChkReturnInv').iButton("toggle", false);
        $("#txtGlacc").val("");
        $("#txtGlacc").attr('placeholder', "");

        $("#EditCreditCode").dialog("open");
    }
    $("#EditCreditCode").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: $(window).height() - 430,
        title: 'Credit Code',
        buttons: {
            Save: function () {
                debugger
                var CreditCodeId = $("#divCreditCodeID").html();
                var Code = $("#txtCode").val();
                var Reason = $("#txtReason").val() == "" ? $("#txtReason").attr('placeholder') : $("#txtReason").val();
                if (Code == "") {
                    $("#EditCreditCode").next('div').find(".msgui").html("Please enter Code..");
                    $("#EditCreditCode").next('div').find('.msgui').show();
                    ctrlFocus($("#txtCode"));
                    return false;
                }
                var ChargeRow = $("#ChkChargerrow").is(":checked") ? "Y" : "N";
                var ReturnInv = $("#ChkReturnInv").is(":checked") ? "Y" : "N";
                var GlaAccount = $("#txtGlacc").val() == "" ? $("#txtGlacc").attr('placeholder') : $("#txtGlacc").val();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveCreditCode',
                    data: '{"ID":"' + CreditCodeId + '","Code":"' + Code.toUpperCase() + '","Reason":"' + Reason + '","ChargeRow":"' + ChargeRow.toUpperCase() + '","ReturnInv":"' + ReturnInv.toUpperCase() + '","GlaAccount":"' + GlaAccount.toUpperCase() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error") {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditCreditCode").next('div').find(".msgui").html("Credit Code (<b>" + Code.toUpperCase() + "</b>) Already exists!");
                                $("#EditCreditCode").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditCreditCode").dialog("close")
                                $("#fgrdCreditCode").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditCreditCode").next('div').find(".msgui").html(output.d);
                            $("#EditCreditCode").next('div').find('.msgui').show();
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

            $("#EditCreditCode").next('div').find('.msgui').remove();
            $("#EditCreditCode").next('div').append("<div class='msgui' style='margin-left: 10px;height: 22px;'></div>").css('height', '35px');
            $("#EditCreditCode").next('div').find(".msgui").css("width", $("#EditCreditCode").width() - $('#EditCreditCode').next('div').find(".ui-dialog-buttonset").width());
            $("#EditCreditCode").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#ChkChargerrow").iButton({
        labelOn: "Yes",
        labelOff: "No"
    });

    $("#ChkReturnInv").iButton({
        labelOn: "Yes",
        labelOff: "No"
    });

    $("[id^=EditCreditCode_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var CreditCodeId = ID.replace("EditCreditCode_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCreditCodeByID',
            data: '{"ID":"' + CreditCodeId + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var CreditCodeDet = output.d;
                    $("#divCreditCodeID").html(CreditCodeDet[0].ID);
                    $("#txtCode").val(CreditCodeDet[0].CODE);
                    $("#txtReason").val("");
                    $("#txtReason").attr('placeholder', CreditCodeDet[0].REASON);
                    $("#ChkChargerrow").iButton("toggle", CreditCodeDet[0].CHARGEGROW == 'N' ? false : true);
                    $("#ChkReturnInv").iButton("toggle", CreditCodeDet[0].RETURNINV == 'N' ? false : true);
                    $("#txtGlacc").val("");
                    $("#txtGlacc").attr('placeholder', CreditCodeDet[0].GLACCOUNT);

                    $("#fgrdCreditCode [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCreditCode #row" + CreditCodeId).addClass("trSelectedHeader");
                    $("#fgrdCreditCode td.unsorted").addClass("sorted");
                    $("#fgrdCreditCode td.sorted").removeClass("unsorted");
                    $("#fgrdCreditCode #row" + CreditCodeId).removeClass("trSelected");
                    $("#fgrdCreditCode #row" + CreditCodeId + " td.sorted").addClass("unsorted");
                    $("#fgrdCreditCode #row" + CreditCodeId + " td.unsorted").removeClass("sorted");

                    $("#EditCreditCode").dialog('option', 'title', "Credit Code :: " + CreditCodeDet[0].CODE);
                    $("#EditCreditCode").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteCreditCode_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteCreditCode_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCreditCodeByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteConfirmCreditCode").html("<p>Are you sure to delete the Code<b> " + res[0].CODE +  "</b> ?</p>");
                $("#DeleteConfirmCreditCode").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    $("#DeleteConfirmCreditCode").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                debugger
                var adialog = $(this);
                var List = $("#DeleteCreditCode_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteCreditCodebyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdCreditCode").flexReload({ url: '/url/for/refresh' });
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
            $("#txtCode").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });




</script>