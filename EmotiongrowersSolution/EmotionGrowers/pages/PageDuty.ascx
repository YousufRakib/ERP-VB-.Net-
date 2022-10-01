<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageDuty.ascx.vb" Inherits="pages_PageDuty" %>

<script src="js/validation.js"></script>
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

     /*#EditDuty input[type="text"] {
        height: 17px;
        background-color:cornsilk;
    }*/

</style>


<table>
    <tr>
        <td>

            <div id="DivDutyForFgrd">
                <table id="fgrdDutyTable" style="display: none;"></table>
                <div id="DeleteConfirmDuty" style="display: none;" title="Alert"></div>
                <div id="OldDutyId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditDuty" style="display: none" class="filesTab">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>            
            <tr>
                <td style="width: 150px;">Country</td>
                <td>
                    <input type="text" class="AllUpperCaseTextBox" id="txtDuty_Country" style="width: 20px;" maxlength="2">
                </td>
            </tr> 
            <tr>
                <td style="width: 150px;">Flower</td>
                <td>
                    <input type="text" class="AllUpperCaseTextBox" id="txtDuty_Flower" style="width: 30px;" maxlength="3">
                </td>
            </tr> 
            <tr>
                <td style="width: 150px;">Name</td>
                <td>
                    <input type="text" class="AllUpperCaseTextBox" id="txtDuty_Name" style="width: 150px;" maxlength="20">
                </td>
            </tr> 
            <tr>
                <td style="width: 150px;">Market Price</td>
                <td>
                    <input type="text" id="txtDuty_Price" style="width: 100px;" maxlength="8" class="ClsThreeDecimalsOnly ClsForValidatingThreeDecimal">
                </td>
            </tr>    
            <tr>
                <td style="width: 150px;">Duty Rate</td>
                <td>
                    <input type="text" id="txtDuty_Tax" style="width: 100px;" maxlength="6" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>    
            <tr>
                <td style="width: 150px;">Anti-Dumping</td>
                <td>
                    <input type="text" id="txtDuty_AntiDump" style="width: 100px;" maxlength="6" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr> 
            <tr>
                <td style="width: 150px;">M.P. Fee</td>
                <td>
                    <input type="text" id="txtDuty_Fee" style="width: 100px;" maxlength="6" class="ClsTwoDecimalsOnly ClsForValidatingTwoDecimal">
                </td>
            </tr>  
            <tr>
                <td style="width: 150px;">TUSA#</td>
                <td>
                    <input type="text" class="AllUpperCaseTextBox" id="txtDuty_Tusa" style="width: 150px;" maxlength="15">
                </td>
            </tr>  
            <tr>
                <td style="width: 150px;">Units of Meas</td>
                <td>
                    <input type="text" class="AllUpperCaseTextBox" id="txtDuty_Unitsofmeas" style="width: 70px;" maxlength="6">
                </td>
            </tr>  
        </tbody>
    </table>
</div>

<div id="divDutyID" style="display:none;"></div>
<div id="divDutyTable" runat="server" style="display:none;"></div>

<script type="text/javascript">

    $(document).ready(new function () {
        debugger;
        $("#fgrdDutyTable").flexigrid({
            url: 'BloomService.asmx/GetDutyForFgrd',
            dataType: 'xml',
            colModel: [
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Country', name: 'Country', width: 30, sortable: true, align: 'left' },
                { display: 'Flower', name: 'Flower', width: 45, sortable: true, align: 'left' },
                { display: 'Name', name: 'NAME', width: 110, sortable: true, align: 'left' },
                { display: 'Market Price - Duty', name: 'MarketPriceDuty', width: 105, sortable: true, align: 'Center' },
                { display: 'Last Update', name: 'DutyDate', width: 85, sortable: true, align: 'left' }
            ],
            searchitems: [
                { display: 'Country', name: 'Country' },
                { display: 'Flower', name: 'Flower' },
                { display: 'Name', name: 'Name' }
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewDuty },
            ],
            showTableToggleBtn: true,
            sortname: "Country,Flower",
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
            height: $(window).height() - 230,
            width: 530,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' },
                { name: 'TableName', value: $("#ctl00_divDutyTable").html() }
            ],
            onSuccess: function () {
                debugger;
                var sel = jQuery("#fgrdDutyTable tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivDutyForFgrd #ExportCSV").show();
                }

                if ($("#divDutyID").html() != "0" && $("#fgrdDutyTable #row" + $("#divDutyID").html()).css('display') == "table-row") {
                    var id = $("#divDutyID").html();
                    $("#fgrdDutyTable [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdDutyTable td.unsorted").addClass("sorted");
                    $("#fgrdDutyTable td.sorted").removeClass("unsorted");
                    $("#fgrdDutyTable #row" + id).addClass("trSelectedHeader");
                    $("#fgrdDutyTable #row" + id).removeClass("trSelected");
                    $("#fgrdDutyTable #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdDutyTable #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#divDutyID").html($("#divDutyID tr:first td:nth-child(3) div").text());
                    $("#fgrdDutyTable tr:first").addClass("trSelectedHeader trSelected");
                }
            },
        });
    });

    $("#EditDuty").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 350,
        height: $(window).height() - 350,
        title: 'Duty Table Maintenance',
        buttons: {
            Save: function () {
                var DutyID = $("#divDutyID").html();
                var COUNTRY = $("#txtDuty_Country").val() == "" ? $("#txtDuty_Country").attr('placeholder').toUpperCase() : $("#txtDuty_Country").val().toUpperCase();
                if (COUNTRY == "") {
                    $("#EditDuty").next('div').find(".msgui").html("Please entrer country..");
                    $("#EditDuty").next('div').find('.msgui').show();
                    ctrlFocus($("#txtDuty_Country"));
                    return false;
                }
                var FLOWER = $("#txtDuty_Flower").val() == "" ? $("#txtDuty_Flower").attr('placeholder').toUpperCase() : $("#txtDuty_Flower").val().toUpperCase();
                var NAME = $("#txtDuty_Name").val() == "" ? $("#txtDuty_Name").attr('placeholder').toUpperCase() : $("#txtDuty_Name").val().toUpperCase();
                var PRICE = $("#txtDuty_Price").val() == "" ? $("#txtDuty_Price").attr('placeholder').toUpperCase() : $("#txtDuty_Price").val().toUpperCase();
                var TAX = $("#txtDuty_Tax").val() == "" ? $("#txtDuty_Tax").attr('placeholder').toUpperCase() : $("#txtDuty_Tax").val().toUpperCase();
                var ANTIDUMP = $("#txtDuty_AntiDump").val() == "" ? $("#txtDuty_AntiDump").attr('placeholder').toUpperCase() : $("#txtDuty_AntiDump").val().toUpperCase();
                var FEE = $("#txtDuty_Fee").val() == "" ? $("#txtDuty_Fee").attr('placeholder').toUpperCase() : $("#txtDuty_Fee").val().toUpperCase();
                var TUSA = $("#txtDuty_Tusa").val() == "" ? $("#txtDuty_Tusa").attr('placeholder').toUpperCase() : $("#txtDuty_Tusa").val().toUpperCase();
                var SOLDAS = $("#txtDuty_Unitsofmeas").val() == "" ? $("#txtDuty_Unitsofmeas").attr('placeholder').toUpperCase() : $("#txtDuty_Unitsofmeas").val().toUpperCase();                
                var Mode = DutyID == "" || DutyID == "0" ? "1" : "2";
                var TableName = $("#ctl00_divDutyTable").html();
               
                $.ajax({
                    type: "POST",//ID, COUNTRY, FLOWER, TAX, PRICE, ANTIDUMP,  FEE, NAME, SOLDAS, TUSA, Mode
                    url: 'BloomService.asmx/AddEditDetleteSelectDuty',
                    data: '{"ID":"' + DutyID + '","COUNTRY":"' + COUNTRY + '","FLOWER":"' + FLOWER + '","TAX":"' + TAX + '","PRICE":"' + PRICE +
                        '","ANTIDUMP":"' + ANTIDUMP + '","FEE":"' + FEE + '","NAME":"' + NAME + '","SOLDAS":"' + SOLDAS + '","TUSA":"' + TUSA +
                        '","Mode":"' + Mode + '","TableName":"' + TableName + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != null) {
                            if (output.d.toLowerCase().indexOf("unique key") >= 0) {
                                $("#EditDuty").next('div').find(".msgui").html("Country (<b>" + COUNTRY.toUpperCase() + "</b>) and Flower <b>" + FLOWER.toUpperCase() + "</b> exists!");
                                $("#EditDuty").next('div').find('.msgui').css('height', '22px').show();
                            }
                            else {
                                $("#EditDuty").dialog("close")
                                $("#fgrdDutyTable").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else {
                            $("#EditDuty").next('div').find(".msgui").html(output.d);
                            $("#EditDuty").next('div').find('.msgui').show();
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

            $("#EditDuty").next('div').find('.msgui').remove();
            $("#EditDuty").next('div').append("<div class='msgui' style='margin-left: 10px;height: 22px;'></div>").css('height', '35px');
            $("#EditDuty").next('div').find(".msgui").css("width", $("#EditDuty").width() - $('#EditDuty').next('div').find(".ui-dialog-buttonset").width());
            $("#EditDuty").next('div').find('.msgui').hide();

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewDuty() {
        debugger;
        $("#divDutyID").html("0");
        $("#txtDuty_Country").val("").attr('placeholder', "");
        $("#txtDuty_Flower").val("").attr('placeholder', "");
        $("#txtDuty_Name").val("").attr('placeholder', "");
        $("#txtDuty_Price").val("").attr('placeholder', "0000.000");
        $("#txtDuty_Tax").val("").attr('placeholder', "000.00");
        $("#txtDuty_AntiDump").val("").attr('placeholder', "000.00");
        $("#txtDuty_Fee").val("").attr('placeholder', "000.00");
        $("#txtDuty_Tusa").val("").attr('placeholder', "");
        $("#txtDuty_Unitsofmeas").val("").attr('placeholder', "");
        var TableName = $("#ctl00_divDutyTable").html();
        $("#EditDuty").dialog("option", "title", "Duty Table Maintenance");
        $("#EditDuty").dialog("open");
    }

    $("[id^=EditDuty_]").die('click').live("click", function (e) {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var DutyID = ID.replace("EditDuty_", "");
        var TableName = $("#ctl00_divDutyTable").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetDutyByID',
            data: '{"ID":"' + DutyID + '","TableName":"' + TableName + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var DutyDet = output.d;
                    $("#divDutyID").html(DutyDet.ID);
                    $("#txtDuty_Country").val("").attr('placeholder', DutyDet.COUNTRY);
                    $("#txtDuty_Flower").val("").attr('placeholder', DutyDet.FLOWER);
                    $("#txtDuty_Name").val("").attr('placeholder', DutyDet.NAME);
                    $("#txtDuty_Price").val("").attr('placeholder', DutyDet.PRICE);
                    $("#txtDuty_Tax").val("").attr('placeholder', DutyDet.TAX);
                    $("#txtDuty_AntiDump").val("").attr('placeholder', DutyDet.ANTIDUMP);
                    $("#txtDuty_Fee").val("").attr('placeholder', DutyDet.FEE);
                    $("#txtDuty_Tusa").val("").attr('placeholder', DutyDet.TUSA);
                    $("#txtDuty_Unitsofmeas").val("").attr('placeholder', DutyDet.SOLDAS);                  
                    $("#fgrdDutyTable [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdDutyTable #row" + DutyID).addClass("trSelectedHeader");
                    $("#fgrdDutyTable td.unsorted").addClass("sorted");
                    $("#fgrdDutyTable td.sorted").removeClass("unsorted");
                    $("#fgrdDutyTable #row" + DutyID).removeClass("trSelected");
                    $("#fgrdDutyTable #row" + DutyID + " td.sorted").addClass("unsorted");
                    $("#fgrdDutyTable #row" + DutyID + " td.unsorted").removeClass("sorted");
                                        $("#EditDuty").dialog('option', 'title', "Duty Table Maintenance");
                    $("#EditDuty").dialog("open");
                }
            }
        });
    });

    $("[id^=DeleteDuty_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteDuty_', '');
        $('#OldDutyId').html(ID);
        var Country = $(this).attr("data-country");
        var Flower = $(this).attr("data-flower");
        var Name = $(this).attr("data-name");
        $("#DeleteConfirmDuty").html("<p>Are you sure to delete<b> (" + Country + ") " + Flower + " - " + Name + "</b> ?</p>");
        $("#DeleteConfirmDuty").dialog("open");
    });

    $("#DeleteConfirmDuty").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                debugger;
                var adialog = $(this);               
                var ID = $("#OldDutyId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddEditDetleteSelectDuty',
                    data: '{"ID":"' + ID + '","COUNTRY":"","FLOWER":"","TAX":"0.00","PRICE":"0.00","ANTIDUMP":"0.00","FEE":"0.00","NAME":"","SOLDAS":"","TUSA":"","Mode":"3","TableName":"' + $("#ctl00_divDutyTable").html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d != null) {
                            adialog.dialog("close");
                            $("#fgrdDutyTable").flexReload({ url: '/url/for/refresh' });
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
        if (key == 13) // the enter key code
        {
            if ($(this).closest('tr').next().find('input')) {
                if ($(this).attr('id') == "txtDuty_Unitsofmeas") {
                    $("#EditDuty").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();                
                }
                else {
                    $(this).closest('tr').next().find('input').focus();
                }
                return false;
            }           
        }
    });

</script>
