<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageSalesManCode.ascx.vb" Inherits="pages_PageSalesManCode" %>
<script src="js/validation.js"></script>
<table>
    <tr>
        <td>

            <div id="DivSalesmanForFgrd">
                <table id="fgrdSalesman" style="display: none;"></table>
                <div id="Deleteconfirm" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>
<div id="EditSalesman" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <tr>
                <td style="width: 150px;">Sales Person#</td>
                <td colspan="3">
                    <input type="text" id="txtSalesmanCode" style="width: 50px;" maxlength="3" />
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td colspan="3">
                    <input type="text" id="txtSalesmanName" style="width: 250px;" maxlength="27" />
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td colspan="3">
                    <input type="text" id="txtSalesmanEmail" style="width: 250px;" maxlength="150" />
                </td>
            </tr>
            <tr>
                <td>Screen Color</td>
                <td>
                    <select id="lstFlowerScreenColor"></select>
                    <input type="hidden" id="hfFlowerScreenColor">
                </td>
            </tr>
            <tr>
                <td>Product Categories</td>
                <td>
                    <textarea id="txtProductCategories" style="width: 250px; height:150px;text-transform: uppercase;" spellcheck="false"></textarea>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="MsgWarning" style="display: none;">
    <p id="MsgHtml"></p>
</div>

<div id="DivPostConfirmDialog" class="DialogDiv" title="Alert">
    <div class="DialogBreak">
        <p id="msgPostConfirm" class="PostDialogMsg"></p>
    </div>
</div>
<div id="divSalesmanID" style="display: none;"></div>
<div id="SalesmanCode" style="display: none;"></div>

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

    /*#EditSalesman input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }

     .searchplaceholder::-webkit-input-placeholder {
        color: black;
        opacity: 10;
    }

    ::-webkit-input-placeholder {
        color: white;
        opacity: 10;
        font-weight: 500;
    }

    ::-moz-placeholder {
        color: white;
        opacity: 10;
        font-weight: 500;
    }


    :-ms-input-placeholder {
        color: white;
        opacity: 10;
        font-weight: 500;
    }*/
    /* IE10+ */
</style>

<script type="text/javascript">    
    $(document).ready(new function () {
        debugger;
        LoadColorCode();
        $("#fgrdSalesman").flexigrid({
            url: 'BloomService.asmx/GetSalesmanForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Code', name: 'Salesman', width: 30, sortable: true, align: 'right', process: HeaderRowClick },
                { display: 'Name', name: 'Name', width: 150, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Email', name: 'Email', width: 250, sortable: true, align: 'left', process: HeaderRowClick },


            ],
            searchitems: [
                { display: 'Code', name: 'Salesman' },
                { display: 'Name', name: 'Name' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: addclicked },
            ],
            showTableToggleBtn: true,
            sortname: "Salesman",
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
            height: $(window).height() - 360,
            width: 550,
            striped: true,
            params: [
                { name: 'Filter', value: '' },
                { name: 'ExportCSV', value: '' }
            ],
            onSuccess: function () {
                debugger;
                /*Add Export button if grid has rows :: Added by Abi :: 22Jun2018*/
                var sel = jQuery("#fgrdSalesman tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivSalesmanForFgrd #ExportCSV").show();
                }

                if ($("#divSalesmanID").html() != "0" && $("#fgrdSalesman #row" + $("#divSalesmanID").html()).css('display') == "table-row") {
                    var id = $("#divSalesmanID").html();
                    $("#fgrdSalesman [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdSalesman td.unsorted").addClass("sorted");
                    $("#fgrdSalesman td.sorted").removeClass("unsorted");
                    $("#fgrdSalesman #row" + id).addClass("trSelectedHeader");
                    $("#fgrdSalesman #row" + id).removeClass("trSelected");
                    $("#fgrdSalesman #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdSalesman #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divSalesmanID").html($("#fgrdSalesman tr:first td:nth-child(3) div").text());
                    $("#fgrdSalesman tr:first").addClass("trSelectedHeader trSelected");
                }
            }
        });

        /*Selected row higlighted with red color by Abi :: 23Apr2018*/
        function HeaderRowClick(celDiv, id) {
            $(celDiv).click(function () {

                if (id != 0) {
                    var FilterQuery = "";

                    $("#divSalesmanID").html(id.toString());
                    $("#fgrdSalesman [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdSalesman #row" + id).addClass("trSelectedHeader");
                    $("#fgrdSalesman td.unsorted").addClass("sorted");
                    $("#fgrdSalesman td.sorted").removeClass("unsorted");
                    $("#fgrdSalesman #row" + id).removeClass("trSelected");
                    $("#fgrdSalesman #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdSalesman #row" + id + " td.unsorted").removeClass("sorted");
                }
            });
        }
        /* Added by Prashant for the Assign Shortcut Keys*/
        //$(document).keydown(function (e) 
        // {            
        //    if ($("div[aria-labelledby='ui-dialog-title-DivSalesManCodePage']").css("display") != "none") 
        //    {                
        //        if ($("div[aria-labelledby='ui-dialog-title-EditSalesman']").css("display") == "none") 
        //        {
        //            if ((e.which == 65 || e.which == 97)) 
        //            {
        //                addclicked();
        //                e.preventDefault();
        //                return false;
        //            }
        //            if (e.which == 13) 
        //            {
        //                $(".trSelectedHeader").find("td").eq(1).click();
        //                $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).click();
        //                $(".trSelectedHeader").find("td").eq(1).find("div").eq(0).find("img").eq(0).click();
        //                e.preventDefault();
        //                return false;
        //            }
        //            if ((e.which == 38)) 
        //            {
        //                var row = $(".trSelectedHeader");
        //                var prevrow = row.prev();
        //                if (prevrow.length > 0) 
        //                {
        //                    $(prevrow).addClass("trSelectedHeader");
        //                    $(row).removeClass("trSelectedHeader");
        //                }
        //                e.preventDefault();
        //                return false;
        //            }
        //            if ((e.which == 40)) 
        //            {
        //                var row = $(".trSelectedHeader");
        //                var nextrow = row.next();
        //                if (nextrow.length > 0) {
        //                    $(nextrow).addClass("trSelectedHeader");
        //                    $(row).removeClass("trSelectedHeader");
        //                }
        //                e.preventDefault();
        //                return false;
        //            }
        //        }                
        //    }
        //});
        /*Remove close button because it redirects to Admin profile::Setups Menu::09Feb2018
        function closeclicked(com, grid) {
            $(location).attr('href', '/Default.aspx?Page=Users')
            return false;
        }*/

        $("#MsgWarning").dialog({
            autoOpen: false,
            resizable: false,
            title: "Alert",
            modal: true,
            buttons: {
                OK: function () {
                    $(this).dialog("close");
                    //$("#fgrdFlowers").flexReload({ url: '/url/for/refresh' });
                }
            },
            open: function () {
                $(".ui-dialog-buttonpane button:contains('OK')").addClass('dialogbuttonstyle icon-save')
            }
        });

        $("#EditSalesman").dialog
            ({
                autoOpen: false,
                resizable: false,
                modal: true,
                width: 400,
                height: 400,
                title: 'Edit Sales Person::',
                buttons:
                {
                    Save: function () {
                        debugger;
                        var SalesmanID = $("#divSalesmanID").html();
                        var SalesmanCode = $("#txtSalesmanCode").val();
                        var ScreenColor = $("#lstFlowerScreenColor").val();
                        if (SalesmanCode == "") {
                            $("#EditSalesman").next('div').find(".msgui").html("Please enter Salesman Code..");
                            $("#EditSalesman").next('div').find('.msgui').show();
                            ctrlFocus($("#txtSalesmanCode"));
                            return false;
                        }
                        var SalesName = $("#txtSalesmanName").val();
                        if (SalesName == "") {
                            $("#EditSalesman").next('div').find(".msgui").html("Please enter Salesman Name..");
                            $("#EditSalesman").next('div').find('.msgui').show();
                            ctrlFocus($("#txtSalesmanName"));
                            return false;
                        }
                        var SalesEmail = $("#txtSalesmanEmail").val();
                        if (SalesEmail == "") {
                            $("#EditSalesman").next('div').find(".msgui").html("Please enter sales person email..");
                            $("#EditSalesman").next('div').find('.msgui').show();
                            ctrlFocus($("#txtSalesmanEmail"));
                            return false;
                        }
                        var ProductCategories = $("#txtProductCategories").val().trim();
                        if (ProductCategories != "" && ProductCategories.length % 3 != 0) {
                            alert("Length of product categories must be multplication of 3");
                            ctrlFocus($("#txtProductCategories"));
                            return false;
                        }

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/SaveSalesManCode',
                            data: '{"ID":"' + SalesmanID + '","SALESMAN":"' + SalesmanCode.toUpperCase() + '","NAME":"' + SalesName + '","EMAIL":"' + SalesEmail + '","COLORCODE":"' + ScreenColor.toUpperCase() + '","PRODUCTS":"' + ProductCategories.toUpperCase() + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output) {
                                debugger;
                                if (output.d != "error") {
                                    if (output.d.toLowerCase().indexOf("unique key") >= 0 || output.d.toLowerCase().indexOf("already") >= 0) {
                                        $("#EditSalesman").next('div').find(".msgui").html("Salesman Code (<b>" + SalesmanCode.toUpperCase() + "</b>) Already exists!");
                                        $("#EditSalesman").next('div').find('.msgui').show();
                                    }
                                    else {
                                        $("#EditSalesman").dialog("close")
                                        $("#fgrdSalesman").flexReload({ url: '/url/for/refresh' });
                                    }
                                }
                                else {
                                    $("#EditSalesman").next('div').find(".msgui").html(output.d);
                                    $("#EditSalesman").next('div').find('.msgui').show();
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
                    $("#EditSalesman").next('div').find('.msgui').remove();
                    $("#EditSalesman").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
                    $("#EditSalesman").next('div').find(".msgui").css("width", $("#EditSalesman").width() - $('#EditSalesman').next('div').find(".ui-dialog-buttonset").width());
                    $("#EditSalesman").next('div').find('.msgui').hide();

                    $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
                    $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
                }
            });

        $("[id^=EditSalesman_]").die('click').live("click", function (e) {
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id');
            var SalesmanID = ID.replace("EditSalesman_", "");
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetSalesManByID',
                data: '{"ID":"' + SalesmanID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    debugger
                    if (output.d != null) {
                        var SalesmanDet = output.d;
                        $("#divSalesmanID").html(SalesmanDet.ID);
                        $("#txtSalesmanCode").val(SalesmanDet.SalesMan);
                        $("#txtSalesmanName").val(SalesmanDet.Name);
                        $("#txtSalesmanEmail").val(SalesmanDet.Email);
                        $("#txtProductCategories").val(SalesmanDet.Products);
                        $("#lstFlowerScreenColor").val(SalesmanDet.ColorCode);

                        $("#fgrdSalesman [id^=row]").removeClass("trSelectedHeader");
                        $("#fgrdSalesman #row" + SalesmanID).addClass("trSelectedHeader");
                        $("#fgrdSalesman td.unsorted").addClass("sorted");
                        $("#fgrdSalesman td.sorted").removeClass("unsorted");
                        $("#fgrdSalesman #row" + SalesmanID).removeClass("trSelected");
                        $("#fgrdSalesman #row" + SalesmanID + " td.sorted").addClass("unsorted");
                        $("#fgrdSalesman #row" + SalesmanID + " td.unsorted").removeClass("sorted");

                        $("#divSalesmanFlag").html("1");

                        $("#EditSalesman").dialog('option', 'title', "Edit Salesman:: " + SalesmanDet.SalesMan);
                        $("#EditSalesman").dialog("open");

                    }
                }
            });
        });
        var currentRowId = 0;
        $("[id^=DeleteSalesman_]").die("click").live("click", function () {
            debugger;
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id').substring(15);
            var sourceCtl = $(this);
            if (currentRowId == 0) {
                $("#fgrdSalesman .trSelectedHeader").removeClass("trSelectedHeader");
                $("#fgrdSalesman .erow").addClass("erow");
            }
            else {
                $("#fgrdSalesman #row" + currentRowId).removeClass("trSelectedHeader");
                $("#fgrdSalesman #row" + currentRowId).addClass("erow");
            }
            var ID = sourceCtl.attr('id').substring(15);
            currentRowId = ID;
            var $row = $(this).closest('table').children('tr:first');
            $("#fgrdSalesman #row" + ID).addClass("trSelectedHeader");

            $('#OldId').html(ID);
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetSalesManByID',
                data: '{"ID":"' + ID + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    debugger
                    $("#SalesmanCode").html(output.d.SalesMan);
                    $("#Deleteconfirm").html("<p>Are you sure to delete<b> " + output.d.SalesMan + " - " + output.d.Name + "</b> ?</p>");
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
                    var List = $("#DeleteSalesman_" + $("#OldId").html());
                    var ID = $("#OldId").html();
                    var SalesmanCode = $("#SalesmanCode").html();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/DeleteSalesManByID',
                        data: '{"ID":"' + ID + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {

                            if (output.d == 'Success') {
                                adialog.dialog("close");
                                $("#fgrdSalesman").flexReload({ url: '/url/for/refresh' });
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
    /*Load ColorCode from tblColorCode table by Abi :: Created on 25April2018 */
    function LoadColorCode() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadColorCode',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFlowerScreenColor').empty();
                var CODEdata = output.d;
                $('#lstFlowerScreenColor').append('<option value="0">Select</option>');
                for (var i in CODEdata) {
                    var CODE = CODEdata[i];
                    $('#lstFlowerScreenColor').append('<option style="color:' + CODE.Color + ';background:' + CODE.BgColor + '" value="' + CODE.Code + '">' + CODE.Code + '</option>');
                }

                if ($("#lstFlowerScreenColor").val() != "" && $("#hfFlowerScreenColor").val() != 0)
                    $('#lstFlowerScreenColor').val($("#hfFlowerScreenColor").val());
                else
                    $("#lstFlowerScreenColor").val("0");
            }
        });
    }
    function addclicked() {
        $('#divSalesmanID').html("0");
        $('#txtSalesmanCode').val("");
        $('#txtSalesmanName').val("");
        $('#txtProductCategories').val("");
        $("#EditSalesman").dialog('option', 'title', "Add New Salesman");
        $("#EditSalesman").dialog("open");
        $("#lstFlowerScreenColor").val("");
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
                if ($(this).attr('id').indexOf("txtSalesmanCode") > -1) {
                    $("#txtSalesmanName").focus();
                    return false;
                }
                if ($(this).attr('id').indexOf("txtSalesmanName") > -1) {
                    $("#lstFlowerScreenColor").focus();
                    return false;
                }
                else if ($(this).attr('id').indexOf("lstFlowerScreenColor") > -1) {
                    $("#EditSalesman").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                }
            }
        }
    });
</script>
