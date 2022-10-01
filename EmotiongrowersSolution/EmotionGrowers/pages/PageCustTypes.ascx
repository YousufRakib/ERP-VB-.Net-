<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCustTypes.ascx.vb" Inherits="pages_PageCustTypes" %>


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

    /*#EditCustTypes input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }*/
    
</style>

<table>
    <tr>
        <td>

            <div>
                <table id="fgrdCustTypes" style="display: none;"></table>
                <div id="DeleteConfirmCustTypes" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditCustTypes" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>           
            <tr>
                <td style="width: 150px;">Type</td>
                <td>
                    <input type="text" id="txtCustTypesType" style="width: 15px;text-transform:uppercase;" maxlength="1">
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td>
                    <input type="text" id="txtCustTypesName" style="width: 150px;text-transform:uppercase;" maxlength="15">
                </td>
            </tr>
            <tr>
                <td>Price Level</td>
                <td>
                    <input type="text" id="txtCustTypesPriceLevel" style="width: 15px;text-transform:uppercase;" maxlength="1">
                </td>
            </tr>
            <tr>
                <td>Quote Fob</td>
                <td>
                    <input type="text" id="txtCustTypesFob" style="width: 15px;text-transform:uppercase;" maxlength="1">
                </td>
            </tr>
            <tr>
                <td>Itimize all charges</td>
                <td>
                    <input type="text" id="txtCustTypesItimize" style="width: 15px;text-transform:uppercase;" maxlength="1">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="divCustTypesID" style="display:none;"></div>


<script>
    $(document).ready(new function () {
        $("#fgrdCustTypes").flexigrid({
            url: 'BloomService.asmx/GetCustTypesDetailsForFgrd',
            dataType: 'xml',
            colModel: [
               //{ display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Type', name: 'TYPE', width: 50, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Description', name: 'NAME', width: 270, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Price Level', name: 'PRICELEVEL', width: 80, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'FOB', name: 'FOB', width: 50, sortable: false, align: 'left', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'Type', name: 'TYPE' },
                { display: 'Description', name: 'NAME' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewCustTypes },
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
                var sel = jQuery("#fgrdCustTypes tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivCustTypesPage  #ExportCSV").show();
                }

                if ($("#divCustTypesID").html() != "0" && $("#fgrdCustTypes #row" + $("#divCustTypesID").html()).css('display') == "table-row") {
                    var id = $("#divCustTypesID").html();
                    $("#fgrdCustTypes [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCustTypes td.unsorted").addClass("sorted");
                    $("#fgrdCustTypes td.sorted").removeClass("unsorted");
                    $("#fgrdCustTypes #row" + id).addClass("trSelectedHeader");
                    $("#fgrdCustTypes #row" + id).removeClass("trSelected");
                    $("#fgrdCustTypes #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdCustTypes #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divCustTypesID").html($("#fgrdCustTypes tr:first td:nth-child(3) div").text());
                    $("#fgrdCustTypes tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });
    });

    /*Selected row higlighted with red color by Abi :: 23Apr2018*/
    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#divCustTypesID").html(id.toString());

                $("#fgrdCustTypes [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdCustTypes #row" + id).addClass("trSelectedHeader");
                $("#fgrdCustTypes td.unsorted").addClass("sorted");
                $("#fgrdCustTypes td.sorted").removeClass("unsorted");
                $("#fgrdCustTypes #row" + id).removeClass("trSelected");
                $("#fgrdCustTypes #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdCustTypes #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    $("#EditCustTypes").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: $(window).height() - 430,
        title: 'Customer Types Maintenance',
        buttons: {
            Save: function () {
                var CustTypesID = $("#divCustTypesID").html();
                var CustTypesCode = $("#txtCustTypesType").val() == "" ? $("#txtCustTypesType").attr('placeholder') : $("#txtCustTypesType").val();
                if (CustTypesCode == "") {
                    $("#EditCustTypes").next('div').find(".msgui").html("Please enter Customer type..");
                    $("#EditCustTypes").next('div').find('.msgui').show();
                    ctrlFocus($("#txtCustTypesType"));
                    return false;
                }
                var CustTypesName = $("#txtCustTypesName").val();
                var PriceLevel = $("#txtCustTypesPriceLevel").val() == "" ? $("#txtCustTypesPriceLevel").attr('placeholder') : $("#txtCustTypesPriceLevel").val();
                var Fob = $("#txtCustTypesFob").val() == "" ? $("#txtCustTypesFob").attr('placeholder') : $("#txtCustTypesFob").val();
                var Itimize = $("#txtCustTypesItimize").val() == "" ? $("#txtCustTypesItimize").attr('placeholder') : $("#txtCustTypesItimize").val();
                debugger;

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveCustTypes',
                    data: '{"ID":"' + CustTypesID + '","CustTypesCode":"' + CustTypesCode.toUpperCase() + '","CustTypesName":"' + CustTypesName.toUpperCase() + '","PriceLevel":"' + PriceLevel.toUpperCase() + '","Fob":"' + Fob.toUpperCase() + '","Itimize":"' + Itimize.toUpperCase() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error") {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditCustTypes").next('div').find(".msgui").html("Custome Type (<b>" + CustTypesCode.toUpperCase() + "</b>) Already exists!");
                                $("#EditCustTypes").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditCustTypes").dialog("close")
                                $("#fgrdCustTypes").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditCustTypes").next('div').find(".msgui").html(output.d);
                            $("#EditCustTypes").next('div').find('.msgui').show();
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

            $("#EditCustTypes").next('div').find('.msgui').remove();
            $("#EditCustTypes").next('div').append("<div class='msgui' style='margin-left: 10px;height: 22px;'></div>").css('height', '35px');
            $("#EditCustTypes").next('div').find(".msgui").css("width", $("#EditCustTypes").width() - $('#EditCustTypes').next('div').find(".ui-dialog-buttonset").width());
            $("#EditCustTypes").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewCustTypes() {
        debugger;
        $("#divCustTypesID").html("0");
        $("#txtCustTypesType").val("");
        $("#txtCustTypesType").attr('placeholder',"");
        $("#txtCustTypesName").val("");
        $("#txtCustTypesPriceLevel").val("");
        $("#txtCustTypesPriceLevel").attr('placeholder', "");
        $("#txtCustTypesFob").attr('placeholder', "");
        $("#txtCustTypesItimize").val("");
        $("#txtCustTypesItimize").attr('placeholder', "");

        $("#EditCustTypes").dialog("open");
    }

    $("[id^=EditCustTypes_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var CustTypesID = ID.replace("EditCustTypes_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustTypesDetailByID',
            data: '{"ID":"' + CustTypesID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var CustTypesDet = output.d;
                    $("#divCustTypesID").html(CustTypesDet[0].ID);
                    $("#txtCustTypesType").val("");
                    $("#txtCustTypesType").attr('placeholder', CustTypesDet[0].TYPE);
                    $("#txtCustTypesName").val(CustTypesDet[0].NAME);
                    $("#txtCustTypesPriceLevel").val("");
                    $("#txtCustTypesPriceLevel").attr('placeholder', CustTypesDet[0].PRICELEVEL);
                    $("#txtCustTypesFob").val("");
                    $("#txtCustTypesFob").attr('placeholder', CustTypesDet[0].FOB);
                    $("#txtCustTypesItimize").val("");
                    $("#txtCustTypesItimize").attr('placeholder', CustTypesDet[0].ITIMIZE);

                    $("#fgrdCustTypes [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCustTypes #row" + CustTypesID).addClass("trSelectedHeader");
                    $("#fgrdCustTypes td.unsorted").addClass("sorted");
                    $("#fgrdCustTypes td.sorted").removeClass("unsorted");
                    $("#fgrdCustTypes #row" + CustTypesID).removeClass("trSelected");
                    $("#fgrdCustTypes #row" + CustTypesID + " td.sorted").addClass("unsorted");
                    $("#fgrdCustTypes #row" + CustTypesID + " td.unsorted").removeClass("sorted");

                    $("#EditCustTypes").dialog('option', 'title', "Customer Types Maintenance :: " + CustTypesDet[0].TYPE);
                    $("#EditCustTypes").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteCustTypes_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteCustTypes_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustTypesDetailByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteConfirmCustTypes").html("<p>Are you sure to delete<b> " + res[0].TYPE + " - " + res[0].NAME + "</b> ?</p>");
                $("#DeleteConfirmCustTypes").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    $("#DeleteConfirmCustTypes").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteCustTypes_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteCustTypesbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdCustTypes").flexReload({ url: '/url/for/refresh' });
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
            $("#txtCustTypesType").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtCustTypesType") {
                $("#txtCustTypesName").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCustTypesName") {
                $("#txtCustTypesPriceLevel").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCustTypesPriceLevel") {
                $("#txtCustTypesFob").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCustTypesFob") {
                $("#txtCustTypesItimize").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCustTypesItimize") {
                $("#EditCustTypes").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

</script>