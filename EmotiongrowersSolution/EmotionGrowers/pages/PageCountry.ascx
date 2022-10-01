<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCountry.ascx.vb" Inherits="pages_PageCountry" %>



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

    /*#EditCountryCodes input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }*/
</style>

<table>
    <tr>
        <td>

            <div id="DivCountryPage">
                <table id="fgrdCountryCodes" style="display: none;"></table>
                <div id="DeleteConfirmCountryCodes" style="display: none;" title="Alert"></div>
                <div id="OldId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditCountryCodes" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <tr>
                <td style="width: 150px;">Country Code</td>
                <td>
                    <input type="text" id="txtCountryCodesCountry" style="width: 25px;text-transform:uppercase;" maxlength="2">
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td>
                    <input type="text" id="txtCountryCodesName" style="width: 180px;text-transform:uppercase;" maxlength="20">
                </td>
            </tr>
            <tr>
                <td>Currency Code</td>
                <td>
                    <input type="text" id="txtCountryCodesCurrCode" style="width: 15px;text-transform:uppercase;" maxlength="2">
                </td>
            </tr>
            <tr>
                <td>Currency </td>
                <td>
                    <input type="text" id="txtCountryCodesCurrRate" style="width: 15px;text-transform:uppercase;" maxlength="2">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="divCountryCodesID" style="display:none;"></div>


<script>
    $(document).ready(new function () {
        $("#fgrdCountryCodes").flexigrid({
            url: 'BloomService.asmx/GetCountryCodesDetailsForFgrd',
            dataType: 'xml',
            colModel: [
               //{ display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Code', name: 'COUNTRY', width: 50, sortable: true, align: 'left',process : HeaderRowClick },
                { display: 'Name', name: 'NAME', width: 250, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Currency', name: 'CURRENCY', width: 80, sortable: true, align: 'left', process: HeaderRowClick },
                { display: 'Rate', name: 'RATE', width: 50, sortable: false, align: 'right', process: HeaderRowClick },
            ],
            searchitems: [
                { display: 'Code', name: 'COUNTRY' },
                { display: 'Name', name: 'NAME' },
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewCountryCodes },
            ],
            showTableToggleBtn: true,
            sortname: "Country",
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
                var sel = jQuery("#fgrdCountryCodes tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#DivCountryPage  #ExportCSV").show();
                }

                if ($("#divCountryCodesID").html() != "0" && $("#fgrdCountryCodes #row" + $("#divCountryCodesID").html()).css('display') == "table-row") {
                    var id = $("#divCountryCodesID").html();
                    $("#fgrdCountryCodes [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCountryCodes td.unsorted").addClass("sorted");
                    $("#fgrdCountryCodes td.sorted").removeClass("unsorted");
                    $("#fgrdCountryCodes #row" + id).addClass("trSelectedHeader");
                    $("#fgrdCountryCodes #row" + id).removeClass("trSelected");
                    $("#fgrdCountryCodes #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdCountryCodes #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divCountryCodesID").html($("#fgrdPendingInfo tr:first td:nth-child(3) div").text());
                    $("#fgrdCountryCodes tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });
    });

    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#divCountryCodesID").html(id.toString());

                $("#fgrdCountryCodes [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdCountryCodes #row" + id).addClass("trSelectedHeader");
                $("#fgrdCountryCodes td.unsorted").addClass("sorted");
                $("#fgrdCountryCodes td.sorted").removeClass("unsorted");
                $("#fgrdCountryCodes #row" + id).removeClass("trSelected");
                $("#fgrdCountryCodes #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdCountryCodes #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    $("#EditCountryCodes").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 400,
        height: $(window).height() - 460,
        title: 'Country File Maintenance',
        buttons: {
            Save: function () {
                var CountryCodesID = $("#divCountryCodesID").html();
                var CountryCodesCountry = $("#txtCountryCodesCountry").val() == "" ? $("#txtCountryCodesCountry").attr('placeholder').toUpperCase() : $("#txtCountryCodesCountry").val().toUpperCase();
                if (CountryCodesCountry == "") {
                    $("#EditCountryCodes").next('div').find(".msgui").html("Please enter Country code..");
                    $("#EditCountryCodes").next('div').find('.msgui').show();
                    ctrlFocus($("#txtCountryCodesCountry"));
                    return false;
                }
                var CountryCodesName = $("#txtCountryCodesName").val().toUpperCase();
                var CurrencyCode = $("#txtCountryCodesCurrCode").val() == "" ? $("#txtCountryCodesCurrCode").attr('placeholder').toUpperCase() : $("#txtCountryCodesCurrCode").val().toUpperCase();
                var CurrencyRate = $("#txtCountryCodesCurrRate").val() == "" ? $("#txtCountryCodesCurrRate").attr('placeholder').toUpperCase() : $("#txtCountryCodesCurrRate").val().toUpperCase();
                
                debugger;

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveCountryCodes',
                    data: '{"ID":"' + CountryCodesID + '","CountryCodesCountry":"' + CountryCodesCountry + '","CountryCodesName":"' + CountryCodesName + '","CurrencyCode":"' + CurrencyCode + '","CurrencyRate":"' + CurrencyRate + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d != "error") {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditCountryCodes").next('div').find(".msgui").html("Country Code (<b>" + CountryCodesCountry.toUpperCase() + "</b>) Already exists!");
                                $("#EditCountryCodes").next('div').find('.msgui').show();
                            }
                            else {
                                $("#EditCountryCodes").dialog("close")
                                $("#fgrdCountryCodes").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditCountryCodes").next('div').find(".msgui").html(output.d);
                            $("#EditCountryCodes").next('div').find('.msgui').show();
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

            $("#EditCountryCodes").next('div').find('.msgui').remove();
            $("#EditCountryCodes").next('div').append("<div class='msgui' style='margin-left: 10px;height: 22px;'></div>").css('height', '35px');
            $("#EditCountryCodes").next('div').find(".msgui").css("width", $("#EditCountryCodes").width() - $('#EditCountryCodes').next('div').find(".ui-dialog-buttonset").width());
            $("#EditCountryCodes").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewCountryCodes() {
        debugger;
        $("#divCountryCodesID").html("0");
        $(".YellowWarning").hide();
        $(".Warning").hide();
        $("#txtCountryCodesCountry").val("");
        $("#txtCountryCodesCountry").attr('placeholder',"");
        $("#txtCountryCodesName").val("");
        $("#txtCountryCodesCurrCode").val("");
        $("#txtCountryCodesCurrCode").attr('placeholder', "");
        $("#txtCountryCodesCurrRate").attr('placeholder', "");
        $("#txtCountryCodesCurrRate").val("");

        $("#EditCountryCodes").dialog("option","title","Country File Maintenance");
        $("#EditCountryCodes").dialog("open");
    }

    $("[id^=EditCountryCodes_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var CountryCodesID = ID.replace("EditCountryCodes_", "");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCountryCodesDetailByID',
            data: '{"ID":"' + CountryCodesID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var CountryCodesDet = output.d;
                    $("#divCountryCodesID").html(CountryCodesDet[0].ID);
                    $("#txtCountryCodesCountry").val("");
                    $("#txtCountryCodesCountry").attr('placeholder', CountryCodesDet[0].COUNTRY);
                    $("#txtCountryCodesName").val(CountryCodesDet[0].NAME);
                    $("#txtCountryCodesCurrCode").val("");
                    $("#txtCountryCodesCurrCode").attr('placeholder',"");
                    $("#txtCountryCodesCurrRate").val("");
                    $("#txtCountryCodesCurrRate").attr('placeholder', "");
                    
                    $("#fgrdCountryCodes [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdCountryCodes #row" + CountryCodesID).addClass("trSelectedHeader");
                    $("#fgrdCountryCodes td.unsorted").addClass("sorted");
                    $("#fgrdCountryCodes td.sorted").removeClass("unsorted");
                    $("#fgrdCountryCodes #row" + CountryCodesID).removeClass("trSelected");
                    $("#fgrdCountryCodes #row" + CountryCodesID + " td.sorted").addClass("unsorted");
                    $("#fgrdCountryCodes #row" + CountryCodesID + " td.unsorted").removeClass("sorted");

                    $("#EditCountryCodes").dialog('option', 'title', "Country File Maintenance :: " + CountryCodesDet[0].COUNTRY);
                    $("#EditCountryCodes").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteCountryCodes_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteCountryCodes_', '');
        $('#OldId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCountryCodesDetailByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteConfirmCountryCodes").html("<p>Are you sure to delete<b> " + res[0].COUNTRY + " - " + res[0].NAME + "</b> ?</p>");
                $("#DeleteConfirmCountryCodes").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    $("#DeleteConfirmCountryCodes").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteCountryCodes_" + $("#OldId").html());
                var ID = $("#OldId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteCountryCodesbyID',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdCountryCodes").flexReload({ url: '/url/for/refresh' });
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
            $("#txtCountryCodesType").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $('input').keypress(function (e) {
        var key = e.which;
        debugger;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtCountryCodesCountry") {
                $("#txtCountryCodesName").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCountryCodesName") {
                $("#txtCountryCodesCurrCode").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCountryCodesCurrCode") {
                $("#txtCountryCodesCurrRate").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtCountryCodesCurrRate") {
                $("#EditCountryCodes").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                return false;
            }
        }
    });

</script>