<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageColors.ascx.vb" Inherits="pages_PageColors" %>

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
    /*#EditColors input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }*/
</style>


<table>
    <tr>
        <td>

            <div id="DivColorsForFgrd">
                <table id="fgrdColors" style="display: none;"></table>
                <div id="DeleteConfirmColors" style="display: none;" title="Alert"></div>
                <div id="OldColorsId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditColors" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>            
            <tr>
                <td style="width: 150px;">Color Code</td>
                <td>
                    <input type="text" id="txtColorCode" style="width: 200px;text-transform:uppercase;" maxlength="10">
                </td>
            </tr>
            <tr>
                <td style="width: 150px;">Short Code</td>
                <td>
                    <input type="text" id="txtShortColorCode" style="width: 200px;text-transform:uppercase;" maxlength="3">
                </td>
            </tr>            
        </tbody>
    </table>
</div>

<div id="divColorsID" style="display:none;"></div>

<script type="text/javascript">

    $(document).ready(new function () {
        $("#fgrdColors").flexigrid({
            url: 'BloomService.asmx/GetColorsForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Color Code', name: 'ColorCode', width: 300, sortable: true, align: 'left' },
              { display: 'Short Code', name: 'Shortcode', width: 60, sortable: true, align: 'left' }     
            ],
            searchitems: [
                { display: 'Color Code', name: 'ColorCode' },
                { display: 'Short Code', name: 'Shortcode' }
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewColors },
            ],
            showTableToggleBtn: true,
            sortname: "ColorCode",
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
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;
                var sel = jQuery("#fgrdColors tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivColorsForFgrd #ExportCSV").show();
                }

                if ($("#divColorsID").html() != "0" && $("#fgrdColors #row" + $("#divColorsID").html()).css('display') == "table-row") {
                    var id = $("#divColorsID").html();
                    $("#fgrdColors [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdColors td.unsorted").addClass("sorted");
                    $("#fgrdColors td.sorted").removeClass("unsorted");
                    $("#fgrdColors #row" + id).addClass("trSelectedHeader");
                    $("#fgrdColors #row" + id).removeClass("trSelected");
                    $("#fgrdColors #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdColors #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divColorsID").html($("#divColorsID tr:first td:nth-child(3) div").text());
                    $("#fgrdColors tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });
    });
      
    $("#EditColors").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: 140,
        title: 'Colors Maintenance',
        buttons: {
            Save: function () {
                var ColorsID = $("#divColorsID").html();
                var ColorCode = $("#txtColorCode").val() == "" ? $("#txtColorCode").attr('placeholder').toUpperCase() : $("#txtColorCode").val().toUpperCase();
                if (ColorCode == "") {
                    $("#EditColors").next('div').find(".msgui").html("Please enter Color code..");
                    $("#EditColors").next('div').find('.msgui').show();
                    ctrlFocus($("#txtColorCode"));
                    return false;
                }
                var ColorShortCode = $("#txtShortColorCode").val() == "" ? $("#txtShortColorCode").attr('placeholder').toUpperCase() : $("#txtShortColorCode").val().toUpperCase();
                //if (ColorShortCode == "") {
                //    $("#EditColors").next('div').find(".msgui").html("Please enter Color code..");
                //    $("#EditColors").next('div').find('.msgui').show();
                //    ctrlFocus($("#txtShortColorCode"));
                //    return false;
                //}
                var Mode = ColorsID == "" || ColorsID == "0" ? "1" : "2";
               
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddEditDetleteSelectColors',
                    data: '{"ID":"' + ColorsID + '","ColorCode":"' + ColorCode + '","ShortCode":"' + ColorShortCode + '","Mode":"' + Mode + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != null) {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditColors").next('div').find(".msgui").html("Color Code (<b>" + ColorCode.toUpperCase() + "</b>) Already exists!");
                                $("#EditColors").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditColors").dialog("close")
                                $("#fgrdColors").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditColors").next('div').find(".msgui").html(output.d);
                            $("#EditColors").next('div').find('.msgui').show();
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

            $("#EditColors").next('div').find('.msgui').remove();
            $("#EditColors").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
            $("#EditColors").next('div').find(".msgui").css("width", $("#EditColors").width() - $('#EditColors').next('div').find(".ui-dialog-buttonset").width());
            $("#EditColors").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewColors() {
        debugger;
        $("#divColorsID").html("0");
        $("#txtColorCode").val("");
        $("#txtColorCode").attr('placeholder', "");
        $("#txtShortColorCode").val("");
        $("#txtShortColorCode").attr('placeholder', "");
        $("#EditColors").dialog("option", "title", "Colors Maintenance");
        $("#EditColors").dialog("open");
    }

    $("[id^=EditColors_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var ColorsID = ID.replace("EditColors_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetColorsByID',
            data: '{"ID":"' + ColorsID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var ColorsDet = output.d;
                    $("#divColorsID").html(ColorsDet.ID);
                    $("#txtColorCode").val("");
                    $("#txtColorCode").attr('placeholder', ColorsDet.ColorCode);
                    $("#txtShortColorCode").attr('placeholder', ColorsDet.ShortCode);
                    $("#fgrdColors [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdColors #row" + ColorsID).addClass("trSelectedHeader");
                    $("#fgrdColors td.unsorted").addClass("sorted");
                    $("#fgrdColors td.sorted").removeClass("unsorted");
                    $("#fgrdColors #row" + ColorsID).removeClass("trSelected");
                    $("#fgrdColors #row" + ColorsID + " td.sorted").addClass("unsorted");
                    $("#fgrdColors #row" + ColorsID + " td.unsorted").removeClass("sorted");
                    $("#EditColors").dialog('option', 'title', "Colors Maintenance :: " + ColorsDet.ColorCode);
                    $("#EditColors").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteColors_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteColors_', '');
        $('#OldColorsId').html(ID);
        var ColorCode = $(this).attr("data-colorcode");
        $("#DeleteConfirmColors").html("<p>Are you sure to delete<b> " + ColorCode + "</b> ?</p>");
        $("#DeleteConfirmColors").dialog("open");
    });

    $("#DeleteConfirmColors").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                debugger;
                var adialog = $(this);               
                var ID = $("#OldColorsId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddEditDetleteSelectColors',
                    data: '{"ID":"' + ID + '","ColorCode":"","ShortCode":"","Mode":"3"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != null) {
                            adialog.dialog("close");
                            $("#fgrdColors").flexReload({ url: '/url/for/refresh' });
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
            if ($(this).closest('tr').next().find('input')) {
                if ($(this).attr('id') == "txtColorCode") {
                    $("#txtShortColorCode").focus();
                }
                if ($(this).attr('id') == "txtShortColorCode") {
                    $("#EditColors").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                }
                else {
                    $(this).closest('tr').next().find('input').focus();
                }
                return false;
            }
        }
    });

</script>
