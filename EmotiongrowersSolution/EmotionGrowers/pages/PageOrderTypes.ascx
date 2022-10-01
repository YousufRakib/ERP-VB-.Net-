<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageOrderTypes.ascx.vb" Inherits="pages_PageOrderTypes" %>
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
</style>

<table>
    <tr>
        <td>
            <div id="DivOrderTypespage">
                <table id="fgrdOrderTypes" style="display: none;"></table>
                <div id="DeleteConfirmOrderTypes" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditOrderTypes" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <tr>
                <td style="width: 150px;">Order Type</td>
                <td>
                    <input type="text" id="txtOrderTypesCode" style="width: 10px;" maxlength="1" class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td>
                    <input type="text" id="txtOrderTypesDesc" style="width: 250px;" maxlength="30" class="AllUpperCaseTextBox">
                </td>
            </tr>
            <tr>
                <td>Repeat?</td>
                <td>
                    <input type="checkbox" id="ChkOrderTypesRepeat" />
                </td>
            </tr>
            <tr>
                <td>Frequency</td>
                <td>
                    <input type="text" id="txtOrderTypesFrequency" style="width: 30px;" maxlength="3" class="ClsNumbersOnly" readonly="readonly">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="divOrderTypesID" style="display: none;"></div>

<script type="text/javascript">
    $(document).ready(new function () {
        $("#ChkOrderTypesRepeat").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });

        $("#fgrdOrderTypes").flexigrid({
            url: 'BloomService.asmx/GetOrderTypesDetailsForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Code', name: 'OrderTypeCode', width: 50, sortable: true, align: 'center', process: HeaderRowClick },
                { display: 'Description', name: 'DESC', width: 345, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Repeat', name: 'Repeat', width: 35, sortable: true, align: 'center', process: HeaderRowClick },
                { display: 'Frequency', name: 'Frequency', width: 50, sortable: true, align: 'right', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'Code', name: 'OrderTypeCode' },
                { display: 'Description', name: 'DESC' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewOrderTypes },
            ],
            showTableToggleBtn: true,
            sortname: "OrderTypeCode",
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
            width: 596,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }

            ],
            onSuccess: function () {
                
                var sel = jQuery("#fgrdOrderTypes tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#DivOrderTypespage  #ExportCSV").show();
                }
            },
        });


        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {

                if (id != 0) {
                    var FilterQuery = "";

                    $("#divOrderTypesID").html(id.toString());

                    $("#fgrdOrderTypes [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdOrderTypes #row" + id).addClass("trSelectedHeader");
                    $("#fgrdOrderTypes td.unsorted").addClass("sorted");
                    $("#fgrdOrderTypes td.sorted").removeClass("unsorted");
                    $("#fgrdOrderTypes #row" + id).removeClass("trSelected");
                    $("#fgrdOrderTypes #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdOrderTypes #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }
    });

    $("#EditOrderTypes").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: $(window).height() - 470,
        title: 'Order Types',
        buttons: {
            Save: function () {
                var OrderTypesID = $("#divOrderTypesID").html();
                var OrderTypesCode = $("#txtOrderTypesCode").val();
                if (OrderTypesCode.trim() == "") {
                    $("#EditOrderTypes").next('div').find(".msgui").html("Please enter Order Type code..");
                    $("#EditOrderTypes").next('div').find('.msgui').show();
                    ctrlFocus($("#txtOrderTypesCode"));
                    return false;
                }

                var OrderTypesDesc = $("#txtOrderTypesDesc").val();
                if (OrderTypesCode.trim() == "") {
                    $("#EditOrderTypes").next('div').find(".msgui").html("Please enter Order Type Description..");
                    $("#EditOrderTypes").next('div').find('.msgui').show();
                    ctrlFocus($("#txtOrderTypesDesc"));
                    return false;
                }
                
                var OrderTypesRepeat = $('#ChkOrderTypesRepeat').is(":checked") ? "Y" : "N";
                var OrderTypesFrequency = $("#txtOrderTypesFrequency").val().trim() == "" ? "0" : $("#txtOrderTypesFrequency").val().trim();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveOrderTypes',
                    data: '{"ID":"' + OrderTypesID + '","OrderTypesCode":"' + OrderTypesCode.toUpperCase() + '","OrderTypesDesc":"' + OrderTypesDesc.toUpperCase() + '","OrderTypesRepeat":"' + OrderTypesRepeat + '","OrderTypesFrequency":"' + OrderTypesFrequency + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        
                        if (output.d != "error") {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditOrderTypes").next('div').find(".msgui").html("OrderTypesCode (<b>" + OrderTypesCode.toUpperCase() + "</b>) Already exists!");
                                $("#EditOrderTypes").next('div').find('.msgui').show();
                                $("#txtOrderTypesCode").focus();
                            }
                            else {
                                $("#EditOrderTypes").dialog("close")
                                $("#fgrdOrderTypes").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditOrderTypes").next('div').find(".msgui").html(output.d);
                            $("#EditOrderTypes").next('div').find('.msgui').show();
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

            $("#EditOrderTypes").next('div').find('.msgui').remove();
            $("#EditOrderTypes").next('div').append("<div class='msgui' style='margin-left: 10px;height: 22px;'></div>").css('height', '35px');
            $("#EditOrderTypes").next('div').find(".msgui").css("width", $("#EditOrderTypes").width() - $('#EditOrderTypes').next('div').find(".ui-dialog-buttonset").width());
            $("#EditOrderTypes").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewOrderTypes() {
        
        $("#divOrderTypesID").html("0");
        $(".YellowWarning").hide();
        $(".Warning").hide();
        $("#txtOrderTypesCode").val("");
        $("#txtOrderTypesDesc").val("");
        $('#ChkOrderTypesRepeat').iButton("toggle", false);
        $("#txtOrderTypesFrequency").val("0");

        $("#EditOrderTypes").dialog("option", "title", "Order Types");
        $("#EditOrderTypes").dialog("open");
    }

    $('input').keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtOrderTypesCode") {
                $("#txtOrderTypesDesc").focus();
                return false;
            }
            //else if ($(this).attr('id') == "txtOrderTypesDesc") {
            //    //var ChkOrderTypesRepeat = $("#ChkOrderTypesRepeat").is(":checked") ? "1" : "0";
            //    //if (ChkOrderTypesRepeat == "1") {
            //    //}
            //    $("#ChkOrderTypesRepeat").focus();
            //    return false;
            //}
            else if ($(this).attr('id') == "txtOrderTypesFrequency") {
                $("#EditOrderTypes").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

    $("[id^=EditOrderTypes_]").die('click').live("click", function (e) {
        
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var OrderTypesID = ID.replace("EditOrderTypes_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetOrderTypesDetailByID',
            data: '{"ID":"' + OrderTypesID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var OrderTypesDet = output.d;
                    $("#divOrderTypesID").html(OrderTypesDet[0].OrderTypeId);
                    $("#txtOrderTypesCode").val(OrderTypesDet[0].OrderTypeCode);
                    $("#txtOrderTypesDesc").val(OrderTypesDet[0].DESC);
                    $('#ChkOrderTypesRepeat').iButton("toggle", OrderTypesDet[0].Repeat == 'N' ? false : true);
                    $("#txtOrderTypesFrequency").val(OrderTypesDet[0].Frequency);

                    $("#fgrdOrderTypes [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdOrderTypes #row" + OrderTypesID).addClass("trSelectedHeader");
                    $("#fgrdOrderTypes td.unsorted").addClass("sorted");
                    $("#fgrdOrderTypes td.sorted").removeClass("unsorted");
                    $("#fgrdOrderTypes #row" + OrderTypesID).removeClass("trSelected");
                    $("#fgrdOrderTypes #row" + OrderTypesID + " td.sorted").addClass("unsorted");
                    $("#fgrdOrderTypes #row" + OrderTypesID + " td.unsorted").removeClass("sorted");

                    $("#EditOrderTypes").dialog('option', 'title', "Order Types :: " + OrderTypesDet[0].OrderTypeCode);
                    $("#EditOrderTypes").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteOrderTypes_]").die("click").live("click", function () {
        
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteOrderTypes_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetOrderTypesDetailByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteConfirmOrderTypes").html("<p>Are you sure to delete<b> " + res[0].OrderTypeCode + " - " + res[0].DESC + "</b> ?</p>");
                $("#DeleteConfirmOrderTypes").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    $("#DeleteConfirmOrderTypes").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                
                var adialog = $(this);
                var List = $("#DeleteOrderTypes_" + $("#OldId").html());
                var ID = $("#OldId").html();
                
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteOrderTypesbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdOrderTypes").flexReload({ url: '/url/for/refresh' });
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
            $("#txtOrderTypesType").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });
    $("#ChkOrderTypesRepeat").change(function () {
        var ChkOrderTypesRepeat = $("#ChkOrderTypesRepeat").is(":checked") ? "1" : "0";
        switch (ChkOrderTypesRepeat) {
            case "0":
                $("#txtOrderTypesFrequency").prop('readonly', true);
                $("#txtOrderTypesFrequency").val("0");
                $("#EditOrderTypes").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                break;
            case "1":
                $("#txtOrderTypesFrequency").prop('readonly', false);
                $("#txtOrderTypesFrequency").focus();
                break;
        }
    });

</script>
