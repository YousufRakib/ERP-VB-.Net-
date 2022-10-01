<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageLogs.ascx.vb" Inherits="pages_PageLogs" %>


<div>
    <table id="fgrdLogs" style="display: none;"></table>
</div>

<div id="msgbox-select" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msg" class="DeleteDialogMsg"></p>
    </div>
</div>

<div id="DivDeleteConfirmDialog" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msgDeleteConfirm" class="DeleteDialogMsg"></p>
    </div>
</div>

<style>
    .delete {
        background: url(images/Delete-icon.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }
</style>


<script type="text/javascript">

    $.ajax({ //Clear the session 
        url: 'BloomService.asmx/ClearSelectedLogSession',
        type: 'POST',
        data: {},
        async: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",

    });

    $("#fgrdLogs").flexigrid({
        url: 'BloomService.asmx/GetLogsForFgrd',
        dataType: 'xml',
        colModel: [
            { display: '<img style="Cursor:pointer;" id="SelectAllLogs" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
            { display: 'ModifiedDate', name: 'ModifiedDateTime', width: 240, sortable: true, align: 'left' },
            { display: 'ModifiedBy', name: 'ModifiedByName', width: 240, sortable: true, align: 'left' },
            { display: 'ModifiedPage', name: 'ModifiedPage', width: 200, sortable: false, align: 'left' },
            { display: 'Details', name: 'Details', width: 600, sortable: false, align: 'left' },
        ],
        searchitems: [
            { display: 'ModifiedPage', name: 'ModifiedPage' },
            { display: 'ModifiedBy', name: 'ModifiedByName' },
            { display: 'ModifiedDate', name: 'ModifiedDateTime' },
        ],
        buttons: [
             { name: 'Delete', bclass: 'delete', onpress: DeleteClicked },
        ],
        showTableToggleBtn: true,
        sortname: "ModifiedDateTime",
        sortorder: "desc",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "ModifiedDateTime",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        height: $(window).height() - 280,
        striped: true,
        params: [
            { name: 'Filter', value: '' }
        ],
    });

    $("#msgbox-select").dialog({
        autoOpen: false,
        resizable: false,
        width: 320,
        modal: true,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    $("#DivDeleteConfirmDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 320,
        modal: true,
        buttons: {
            Yes: function () {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteSelectedLogs',
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == 'LogOut') {
                            window.location.href = "Login.aspx";
                        }
                        else {
                            $("#fgrdLogs").flexReload({ url: '/url/for/refresh' });
                            $("#DivDeleteConfirmDialog").dialog("close");
                            $("[id ^= SelectAllLogs]").attr("src", "images/check-off.png");
                        }
                    }
                });
            },
            No: function () {
                $("#DivDeleteConfirmDialog").dialog("close");
            }
        },

        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

    function DeleteClicked() {
        var count = 0
        $("[id^=Logselect_]").each(function () {
            if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
                count = count + 1;
            }
        });
        if (count == 0) {
            $("#msg").html("Please choose Log to delete!");
            $("#msgbox-select").dialog("open");
        }
        else {
            $("#DivDeleteConfirmDialog").dialog("open");
            $("#msgDeleteConfirm").html("Do you want delete selected logs?");
        }
    }


    $("[id^=Logselect_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var SelectedID = ID.replace("Logselect_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ToggleSelectedLog',
            data: "{'Selected':'" + Selected + "','ID':'" + SelectedID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (Selected == "1") {
                    sourceCtl.prop("src", "images/check-on.png");
                }
                else {
                    sourceCtl.prop("src", "images/check-off.png");
                    $("[id ^= SelectAllLogs]").attr("src", "images/check-off.png");

                }

            }
        });

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
                    $("#fgrdLogs").flexReload({ url: '/url/for/refresh' });

                }
                else {
                    sourceCtl.prop("src", "images/check-off.png");
                    $("#fgrdLogs").flexReload({ url: '/url/for/refresh' });
                }
            }
        });

    });

</script>
