<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageOrderStatus.ascx.vb" Inherits="pages_PageOrderStatus" %>


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
     /*#EditOrderStatus input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }*/
</style>

<table>
    <tr>
        <td>

            <div id="DivOrderStatuspage">
                <table id="fgrdOrderStatus" style="display: none;"></table>
                <div id="DeleteConfirmOrderStatus" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditOrderStatus" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>           
            <tr>
                <td style="width: 150px;">Status</td>
                <td>
                    <input type="text" id="txtOrderStatusCode" style="width: 25px;" maxlength="2" class="FirstLetterUpperCase">
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td>
                    <input type="text" id="txtOrderStatusDesc" style="width: 250px;" maxlength="30" class="FirstLetterUpperCase">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="divOrderStatusID" style="display:none;"></div>


<script>
    $(document).ready(new function () {
        $("#fgrdOrderStatus").flexigrid({
            url: 'BloomService.asmx/GetOrderStatusDetailsForFgrd',
            dataType: 'xml',
            colModel: [
               //{ display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Code', name: 'STATUS', width: 50, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Description', name: 'DESC', width: 360, sortable: true, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'Code', name: 'STATUS' },
                { display: 'Description', name: '[DESC]' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewOrderStatus },
            ],
            showTableToggleBtn: true,
            sortname: "STATUS",
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
                var sel = jQuery("#fgrdOrderStatus tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#DivOrderStatuspage  #ExportCSV").show();
                }

                if ($("#divOrderStatusID").html() != "0" && $("#fgrdOrderStatus #row" + $("#divOrderStatusID").html()).css('display') == "table-row") {
                    var id = $("#divOrderStatusID").html();
                    $("#fgrdOrderStatus [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdOrderStatus td.unsorted").addClass("sorted");
                    $("#fgrdOrderStatus td.sorted").removeClass("unsorted");
                    $("#fgrdOrderStatus #row" + id).addClass("trSelectedHeader");
                    $("#fgrdOrderStatus #row" + id).removeClass("trSelected");
                    $("#fgrdOrderStatus #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdOrderStatus #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divOrderStatusID").html($("#fgrdOrderStatus tr:first td:nth-child(3) div").text());
                    $("#fgrdOrderStatus tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });


        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {

                if (id != 0) {
                    var FilterQuery = "";

                    $("#divOrderStatusID").html(id.toString());

                    $("#fgrdOrderStatus [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdOrderStatus #row" + id).addClass("trSelectedHeader");
                    $("#fgrdOrderStatus td.unsorted").addClass("sorted");
                    $("#fgrdOrderStatus td.sorted").removeClass("unsorted");
                    $("#fgrdOrderStatus #row" + id).removeClass("trSelected");
                    $("#fgrdOrderStatus #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdOrderStatus #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }
    });

    $("#EditOrderStatus").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: $(window).height() - 510,
        title: 'Status Code Definition Table',
        buttons: {
            Save: function () {
                var OrderStatusID = $("#divOrderStatusID").html();
                var OrderStatusCode = $("#txtOrderStatusCode").val() == "" ? $("#txtOrderStatusCode").attr('placeholder') : $("#txtOrderStatusCode").val();
                if (OrderStatusCode == "") {
                    $("#EditOrderStatus").next('div').find(".msgui").html("Please enter Status code..");
                    $("#EditOrderStatus").next('div').find('.msgui').show();
                    ctrlFocus($("#txtOrderStatusCode"));
                    return false;
                }
                var OrderStatusDesc = $("#txtOrderStatusDesc").val();
                debugger;

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveOrderStatus',
                    data: '{"ID":"' + OrderStatusID + '","OrderStatusCode":"' + OrderStatusCode + '","OrderStatusDesc":"' + OrderStatusDesc + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != "error") {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditOrderStatus").next('div').find(".msgui").html("Status (<b>" + OrderStatusCode + "</b>) Already exists!");
                                $("#EditOrderStatus").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditOrderStatus").dialog("close")
                                $("#fgrdOrderStatus").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditOrderStatus").next('div').find(".msgui").html(output.d);
                            $("#EditOrderStatus").next('div').find('.msgui').show();
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

            $("#EditOrderStatus").next('div').find('.msgui').remove();
            $("#EditOrderStatus").next('div').append("<div class='msgui' style='margin-left: 10px;height: 22px;'></div>").css('height', '35px');
            $("#EditOrderStatus").next('div').find(".msgui").css("width", $("#EditOrderStatus").width() - $('#EditOrderStatus').next('div').find(".ui-dialog-buttonset").width());
            $("#EditOrderStatus").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewOrderStatus() {
        debugger;
        $("#divOrderStatusID").html("0");
        $(".YellowWarning").hide();
        $(".Warning").hide();
        $("#txtOrderStatusCode").val("");
        $("#txtOrderStatusCode").attr('placeholder',"");
        $("#txtOrderStatusDesc").val("");

        $("#EditOrderStatus").dialog("option","title","Status Code Definition Table");
        $("#EditOrderStatus").dialog("open");
    }

    $("[id^=EditOrderStatus_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var OrderStatusID = ID.replace("EditOrderStatus_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetOrderStatusDetailByID',
            data: '{"ID":"' + OrderStatusID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var OrderStatusDet = output.d;
                    $("#divOrderStatusID").html(OrderStatusDet[0].ID);
                    $("#txtOrderStatusCode").val("");
                    $("#txtOrderStatusCode").attr('placeholder', OrderStatusDet[0].STATUS);
                    $("#txtOrderStatusDesc").val(OrderStatusDet[0].DESC);
                    
                    $("#fgrdOrderStatus [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdOrderStatus #row" + OrderStatusID).addClass("trSelectedHeader");
                    $("#fgrdOrderStatus td.unsorted").addClass("sorted");
                    $("#fgrdOrderStatus td.sorted").removeClass("unsorted");
                    $("#fgrdOrderStatus #row" + OrderStatusID).removeClass("trSelected");
                    $("#fgrdOrderStatus #row" + OrderStatusID + " td.sorted").addClass("unsorted");
                    $("#fgrdOrderStatus #row" + OrderStatusID + " td.unsorted").removeClass("sorted");

                    $("#EditOrderStatus").dialog('option', 'title', "Status Code Definition Table :: " + OrderStatusDet[0].STATUS);
                    $("#EditOrderStatus").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteOrderStatus_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteOrderStatus_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetOrderStatusDetailByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteConfirmOrderStatus").html("<p>Are you sure to delete<b> " + res[0].STATUS + " - " + res[0].DESC + "</b> ?</p>");
                $("#DeleteConfirmOrderStatus").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    $("#DeleteConfirmOrderStatus").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                debugger;
                var adialog = $(this);
                var List = $("#DeleteOrderStatus_" + $("#OldId").html());
                var ID = $("#OldId").html();
                debugger;
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteOrderStatusbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdOrderStatus").flexReload({ url: '/url/for/refresh' });
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
            $("#txtOrderStatusType").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtOrderStatusCode") {
                $("#txtOrderStatusDesc").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtOrderStatusDesc") {
                $("#EditOrderStatus").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

</script>