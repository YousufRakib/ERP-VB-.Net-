<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageEmails.ascx.vb" Inherits="pages_PageEmails" %>

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
                <table id="fgrdEmails" style="display: none;"></table>
                <div id="DeleteConfirmEmails" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditEmails" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>           
            <tr>
                <td style="width: 100px;">Type</td>
                <td>
                    <input type="text" id="txtType" style="width: 150px;text-transform:uppercase;" maxlength="50">
                </td>
            </tr>
            <tr>
                <td>Emails</td>
                <td><input type="text" id="txtEmails" style="width: 450px;" maxlength="500"></td>
            </tr>
        </tbody>
    </table>
</div>

<div id="divEmailsID" style="display:none;"></div>

<script>

    $(document).ready(new function () {
        $("#fgrdEmails").flexigrid({
            url: 'BloomService.asmx/GetEmailDetailsForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'TYPE', name: 'TYPE', width: 140, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'EMAILS', name: 'EMAILS', width: 320, sortable: true, align: 'left', process: HeaderRowClick }
            ],
            searchitems: [
                { display: 'TYPE', name: 'TYPE' },
                { display: 'EMAILS', name: 'EMAILS' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewEmail },
            ],
            showTableToggleBtn: true,
            sortname: "TYPE",
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

                /*Add Export button if grid has rows :: Added by Ani :: 28Sep2018*/
                var sel = jQuery("#fgrdEmails tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivEmailsPage  #ExportCSV").show();
                }

                if ($("#divEmailsID").html() != "0" && $("#fgrdEmails #row" + $("#divEmailsID").html()).css('display') == "table-row") {
                    var id = $("#divEmailsID").html();
                    $("#fgrdEmails [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdEmails td.unsorted").addClass("sorted");
                    $("#fgrdEmails td.sorted").removeClass("unsorted");
                    $("#fgrdEmails #row" + id).addClass("trSelectedHeader");
                    $("#fgrdEmails #row" + id).removeClass("trSelected");
                    $("#fgrdEmails #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdEmails #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divEmailsID").html($("#fgrdCreditCode tr:first td:nth-child(3) div").text());
                    $("#fgrdEmails tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });

    });

    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#divEmailsID").html(id.toString());

                $("#fgrdEmails [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdEmails #row" + id).addClass("trSelectedHeader");
                $("#fgrdEmails td.unsorted").addClass("sorted");
                $("#fgrdEmails td.sorted").removeClass("unsorted");
                $("#fgrdEmails #row" + id).removeClass("trSelected");
                $("#fgrdEmails #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdEmails #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtType") {
                $("#txtEmails").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtEmails") {
                $("#EditEmails").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

    function AddNewEmail() {
        debugger;
        $("#divEmailsID").html("0");
        $("#txtType").val("");
        $("#txtEmails").val("");
    
        $("#EditEmails").dialog("open");
    }

    $("#EditEmails").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 600,
        height: $(window).height() - 500,
        title: 'Emails',
        buttons: {
            Save: function () {
                debugger
                var EmailId = $("#divEmailsID").html();
                var Type = $("#txtType").val();
                var Email = $("#txtEmails").val();
                var EmailList = Email.replace(/\s/g, '').split(",");
                var regex = /^(\s?[^\s,]+@[^\s,]+\.[^\s,]+\s?,)*(\s?[^\s,]+@[^\s,]+\.[^\s,]+)$/;

                if (Type == "") {
                    $("#EditEmails").next('div').find(".msgui").html("Please enter Code..");
                    $("#EditEmails").next('div').find('.msgui').show();
                    ctrlFocus($("#txtType"));
                    return false;
                }
                if (Email == "") {
                    $("#EditEmails").next('div').find(".msgui").html("Please enter Code..");
                    $("#EditEmails").next('div').find('.msgui').show();
                    ctrlFocus($("#txtEmails"));
                    return false;
                }
                for (var i = 0; i < EmailList.length; i++) {
                    if (EmailList[i] == "" || !regex.test(EmailList[i])) {
                        $("#EditEmails").next('div').find(".msgui").html("Please enter Valid Email..");
                        $("#EditEmails").next('div').find('.msgui').show();
                        ctrlFocus($("#txtEmails"));
                        return false;
                    }
                }

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveEmail',
                    data: '{"ID":"' + EmailId + '","Type":"' + Type.toUpperCase() + '","Emails":"' + Email + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error") {
                            //if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                            //    $("#EditEmails").next('div').find(".msgui").html("Email (<b>" + Email.toUpperCase() + "</b>) Already exists!");
                            //    $("#EditEmails").next('div').find('.msgui').show();
                            //}
                            //else {
                                $("#EditEmails").dialog("close")
                                $("#fgrdEmails").flexReload({ url: '/url/for/refresh' });
                            //}
                        }
                        else {
                            $("#EditEmails").next('div').find(".msgui").html(output.d);
                            $("#EditEmails").next('div').find('.msgui').show();
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

            $("#EditEmails").next('div').find('.msgui').remove();
            $("#EditEmails").next('div').append("<div class='msgui' style='margin-left: 10px;height: 22px;'></div>").css('height', '35px');
            $("#EditEmails").next('div').find(".msgui").css("width", $("#EditEmails").width() - $('#EditEmails').next('div').find(".ui-dialog-buttonset").width());
            $("#EditEmails").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("[id^=EditEmail_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var EmailId = ID.replace("EditEmail_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetF_EmailsByID',
            data: '{"ID":"' + EmailId + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var EmailDet = output.d;
                    $("#divEmailsID").html(EmailDet[0].ID);
                    $("#txtType").val(EmailDet[0].TYPE);
                    $("#txtEmails").val(EmailDet[0].EMAILS);
                    $("#fgrdEmails [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdEmails #row" + EmailId).addClass("trSelectedHeader");
                    $("#fgrdEmails td.unsorted").addClass("sorted");
                    $("#fgrdEmails td.sorted").removeClass("unsorted");
                    $("#fgrdEmails #row" + EmailId).removeClass("trSelected");
                    $("#fgrdEmails #row" + EmailId + " td.sorted").addClass("unsorted");
                    $("#fgrdEmails #row" + EmailId + " td.unsorted").removeClass("sorted");

                    $("#EditEmails").dialog('option', 'title', "Emails ");
                    $("#EditEmails").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteEmail_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteEmail_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetF_EmailsByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteConfirmEmails").html("<p>Are you sure to delete the Email<b> " + res[0].EMAILS + "</b> ?</p>");
                $("#DeleteConfirmEmails").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    $("#DeleteConfirmEmails").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                debugger
                var adialog = $(this);
                var List = $("#DeleteEmail_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteF_EmailsebyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdEmails").flexReload({ url: '/url/for/refresh' });
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
            $("#txtType").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });



</script>