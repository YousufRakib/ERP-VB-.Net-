<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageMsgMaintenance.ascx.vb" Inherits="pages_PageMsgMaintenance" %>

<style type="text/css">
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
</style>


<%--<div id="DivMsgMaintenancePage"></div>--%>
<fieldset id="fsMsgMaintenance" style="font-size: 18px; font-weight: bold; height: 80px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
    <legend style="background: white; margin-left: 2px;"></legend>
    <table>
        <tr style="height: 33px;">
            <td>
                <input id="rbInvoiceMsg" class="rbMsgMaintenance" type="radio" style="margin-top: 8px;" name="MsgMaintenance" checked="checked">
                <label for="rbInvoiceMsg">Invoice Message</label>
            </td>
        </tr>
        <tr style="height: 33px;">
            <td>
                <input id="rbStatementMsg" class="rbMsgMaintenance" type="radio" style="margin-top: 8px;" name="MsgMaintenance">
                <label for="rbStatementMsg">Statement Message</label>
            </td>
        </tr>
    </table>
</fieldset>


<div id="DivInvoiceMsg">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td style="text-align:right; padding-right:20px;">Message   Line # 1 </td>
            <td>
                <input type="text" maxlength="46" id="txtInvMsg1" style="width: 400px; border-radius: 0px; border-bottom: none;" />
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:20px;">Line # 2 </td>
            <td>
                <input type="text" maxlength="46" id="txtInvMsg2" style="width: 400px; border-radius: 0px; border-bottom: none; border-top: none;" />
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:20px;">Line # 3 </td>
            <td>
                <input type="text" maxlength="46" id="txtInvMsg3" style="width: 400px; border-radius: 0px; border-bottom: none; border-top: none;" />
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:20px;">Line # 4</td>
            <td>
                <input type="text" maxlength="46" id="txtInvMsg4" style="width: 400px; border-radius: 0px; border-bottom: none; border-top: none;" />
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:20px;">Line # 5 </td>
            <td>
                <input type="text" maxlength="46" id="txtInvMsg5" style="width: 400px; border-radius: 0px; border-top: none;" />
            </td>
        </tr>
    </table>
</div>


<script type="text/javascript">
    function openMessageType(MessageType) {
        debugger;
        if (MessageType == "InvoiceMsg") {
            $("#DivInvoiceMsg").show();
            $("#DivInvoiceMsg").dialog("open");
        }
    }

    /*Focus next button when users change the deposit listing options*/
    $("input[name=MsgMaintenance]").on("click", function () {
        $("#DivMsgMaintenancePage").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
    });

    $("#DivInvoiceMsg").dialog({
        autoOpen: false,
        resizable: false,
        width: 580,
        position: { my: 'center', at: 'center' },
        modal: true,
        title: "Invoice Message Maintenance",
        buttons: {
            Save: function () {
                debugger;
                var Text1 = $("#txtInvMsg1").val();
                var Text2 = $("#txtInvMsg2").val();
                var Text3 = $("#txtInvMsg3").val();
                var Text4 = $("#txtInvMsg4").val();
                var Text5 = $("#txtInvMsg5").val();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveMessagesfromMsgINV',
                    contentType: "application/json; charset=utf-8",
                    data: '{"Text1":"' + Text1 + '","Text2":"' + Text2 + '","Text3":"' + Text3 + '","Text4":"' + Text4 + '","Text5":"' + Text5 + '"}',
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        var data = output.d;
                        if (data == "Success") {
                            $("#DivInvoiceMsg").dialog("close");
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            },
            Close: function () {
                $("#DivInvoiceMsg").dialog("close");
            }
        },
        close: function () {
            $("#DivMsgMaintenancePage").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
        },
        open: function () {
            debugger;
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetMessagesfromMsgINV',
                contentType: "application/json; charset=utf-8",
                data: '{}',
                dataType: "json",
                success: function (output) {
                    debugger;
                    var data = output.d;
                    $("#txtInvMsg1").val(data.Text1);
                    $("#txtInvMsg2").val(data.Text2);
                    $("#txtInvMsg3").val(data.Text3);
                    $("#txtInvMsg4").val(data.Text4);
                    $("#txtInvMsg5").val(data.Text5);
                }
            });

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });








    $('input').keypress(function (e) {
        debugger;
        var key = e.which;
        if (key == 13) // the enter key code
        {
            debugger;

            for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                var a;
                if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                    a = i;
                }

                if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i && $(this).closest('tr').find('input')[i].disabled != true &&
                $(this).closest('tr').find('input')[i].type != "hidden") {
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }

                else if (i == $(this).closest('tr').find('input').length - 1) {
                    if ($(this).closest('tr').next('tr').find('input').length > 0) {
                        $(this).closest('tr').next('tr').find('input')[0].focus();
                    }
                    else if ($(this).attr('id') == "txtInvMsg5")
                        $(this).closest('div').next('div').find('button')[0].focus()
                    else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0)
                        $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();
                    return false;
                }
            }
        }
    });


</script>