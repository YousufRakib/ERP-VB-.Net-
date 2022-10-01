<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCarrierCode.ascx.vb" Inherits="pages_PageCarrierCode" %>

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
            <div id="DialogShiptoCarriers">
                <table id="fgrdShiptoCarriers"></table>
                <div id="DeleteconfirmCarrier" style="display: none;" title="Alert"></div>
                <div id="OldCarriersId" style="display: none;"></div>
            </div>
        </td>
    </tr>
</table>

<div id="EditShiptoCarriers" style="display: none">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
            <tr style="height: 25px;">
                <td colspan="2">
                    <div class="Warning" align="center">
                        OOPS! Unable to process your request. Please contact admin!
                    </div>
                    <div class="YellowWarning" align="center">
                        All fields are required fields, Please try again.
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 150px;">Carrier</td>
                <td>
                    <select id="lstCaCodeCarrier" style="width: 250px;"></select>
                </td>
            </tr>
            <tr>
                <td>Account#</td>
                <td>
                    <input type="text" id="txtCarrierAccount" style="width: 100px;" maxlength="10">
                </td>
            </tr>
            <tr>
                <td>Zone</td>
                <td>
                    <input type="text" id="txtCarrierZone" style="width: 30px;" maxlength="1" >
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="DivCustomerNo" style="display: none;" runat="server"></div>
<div id="DivShiptoID" style="display: none;" runat="server"></div>
<div id="DivCarrierID" style="display:none;"></div>

<script>
    var Customer = $("#ctl00_DivCustomerNo").html();
    var Shipto = $("#ctl00_DivShiptoID").html();
    $(document).ready(new function () {
        LoadCarriers();
        /*Load Carrier grid details by Abi*/
        $("#fgrdShiptoCarriers").flexigrid({
            url: 'BloomService.asmx/GetCarrierCodeDetailsForFgrd',
            dataType: 'xml',
            colModel: [
               //{ display: '<img style="Cursor:pointer;" id="SelectAll" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: '', name: '', width: 20, sortable: true, align: 'Center' },
                { display: 'Code', name: 'Carrier', width: 30, sortable: true, align: 'left', process: CaCodeHeaderRowClick },
                { display: 'Carrier Name', name: 'CarrierName', width: 180, sortable: true, align: 'left', process: CaCodeHeaderRowClick },
                { display: 'Account#', name: 'Account', width: 100, sortable: true, align: 'left', process: CaCodeHeaderRowClick },
                { display: 'Zone', name: 'Zone', width: 30, sortable: false, align: 'left', process: CaCodeHeaderRowClick },
                { display: 'Last Update', name: 'UpdUser', width: 80, sortable: false, align: 'left', process: CaCodeHeaderRowClick },
                { display: 'Date', name: 'UpdDate', width: 80, sortable: false, align: 'left', process: CaCodeHeaderRowClick },
                { display: 'Time', name: 'UpdTime', width: 80, sortable: false, align: 'left', process: CaCodeHeaderRowClick },
            ],
            searchitems: [
                { display: 'NAME', name: 'Name' },
                { display: 'CARRIER', name: 'Carrier' },
            ],
            showTableToggleBtn: true,
            sortname: "Carrier",
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
            width: 720,
            striped: true,
            params: [
                { name: 'ExportCSV', value: '' },
                { name: 'Customer', value: Customer },
                { name: 'Shipto', value: Shipto }
            ],
            buttons: [
                { name: 'Add', bclass: 'add', onpress: AddNewCarrierCode },
            ],
            onSuccess: function () {
                debugger;
                if ($("#DivCarrierID").html() != "0" && $("#fgrdShiptoCarriers #row" + $("#DivCarrierID").html()).css('display') == "table-row") {
                    var id = $("#DivCarrierID").html();
                    $("#fgrdShiptoCarriers [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdShiptoCarriers td.unsorted").addClass("sorted");
                    $("#fgrdShiptoCarriers td.sorted").removeClass("unsorted");
                    $("#fgrdShiptoCarriers #row" + id).addClass("trSelectedHeader");
                    $("#fgrdShiptoCarriers #row" + id).removeClass("trSelected");
                    $("#fgrdShiptoCarriers #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdShiptoCarriers #row" + id + " td.unsorted").removeClass("sorted");
                }
                else {
                    $("#DivCarrierID").html($("#fgrdShiptoCarriers tr:first").attr("id").replace("row", ""));
                    $("#fgrdShiptoCarriers tr:first").addClass("trSelectedHeader trSelected");
                }

                var sel = jQuery("#fgrdShiptoCarriers tbody tr");
                var len = sel.length;

                if (len > 1) {
                    $("#DialogShiptoCarriers #ExportCSV").show();
                }

                var wtf = $("#fgrdShiptoCarriers").closest('div');
                var height = wtf[0].scrollHeight;
                wtf.scrollTop(height);
            },
            onError: function (xhr, status, errorThrown) {
                debugger;
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#DialogShiptoCarriers .sDiv").css('float', 'left').css('width', '490px');
        $('#DialogShiptoCarriers .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DialogShiptoCarriers .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DialogShiptoCarriers .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DialogShiptoCarriers .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -29px').show();
    });

    /*Load Carrier from F_CARRIE table by Abi :: Created on 09May2018 */
    function LoadCarriers() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCarriersForDropdownList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#lstCaCodeCarrier").empty();
                var CarrierData = output.d;
                $("#lstCaCodeCarrier").append('<option value="0">Select</option>');
                for (var i in CarrierData) {
                    var Carrier = CarrierData[i];
                    $("#lstCaCodeCarrier").append('<option value="' + Carrier.Carrier + '">' + Carrier.Carrier + ' - ' + Carrier.Name + '</option>');
                }
            }
        });
    }

    /*Selected row higlighted with red color by Abi :: 16May2018*/
    function CaCodeHeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {

            if (id != 0) {
                var FilterQuery = "";

                $("#DivCarrierID").html(id.toString());

                $("#fgrdShiptoCarriers [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdShiptoCarriers #row" + id).addClass("trSelectedHeader");
                $("#fgrdShiptoCarriers td.unsorted").addClass("sorted");
                $("#fgrdShiptoCarriers td.sorted").removeClass("unsorted");
                $("#fgrdShiptoCarriers #row" + id).removeClass("trSelected");
                $("#fgrdShiptoCarriers #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdShiptoCarriers #row" + id + " td.unsorted").removeClass("sorted");
            }
        });
    }

    /*Dialog for Add/Edit screen to Save by Abi :: 21May2018*/
    $("#EditShiptoCarriers").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 380,
        height: 230,
        title: 'Add/Edit Carrier Code Details',
        buttons: {
            Save: function () {
                debugger;
                var CarrierID = $("#DivCarrierID").html();
                var Carrier = $("#lstCaCodeCarrier").val();
                var Account = $("#txtCarrierAccount").val();
                var Zone = $("#txtCarrierZone").val();


                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveCarrierCodeDetails',
                    data: '{"ID":"' + CarrierID + '","Shipto":"' + Shipto + '","Customer":"' + Customer + '","Carrier":"' + Carrier + '","Account":"' + Account + '","Zone":"' + Zone + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d == "Success") {
                            $("#EditShiptoCarriers").dialog("close");
                            $("#fgrdShiptoCarriers").flexReload({ url: 'url/for/refresh' });

                        }
                        else {
                            $(".Warning").show();
                        }
                    }
                });
            },
            Cancel: function () {
                debugger;
                $(this).dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    function AddNewCarrierCode() {
        debugger;
        $(".YellowWarning").hide();
        $(".Warning").hide();
        $("#DivCarrierID").html("0");
        $("#lstCaCodeCarrier").val(0);
        $("#txtCarrierAccount").val("");
        $("#txtCarrierZone").val("");

        $("#EditShiptoCarriers").dialog("open");
    }

    /*Edit the carrier code values on Edit screen by Abi :: 21May2018*/
    $("[id^=EditCaCode_]").die('click').live("click", function (e) {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var CarrierID = ID.replace("EditCaCode_", "");
        $("#EditShiptoCarriers").dialog("open");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCarrierCodeDetailsByID',
            data: '{"ID":"' + CarrierID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                if (output.d != null) {
                    var CarrierDet = output.d;
                    $("#DivCarrierID").html(CarrierDet[0].ID);
                    $("#lstCaCodeCarrier").val(CarrierDet[0].Carrier);
                    $("#txtCarrierAccount").val(CarrierDet[0].Account);
                    $("#txtCarrierZone").val(CarrierDet[0].Zone);

                    $("#fgrdShiptoCarriers [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdShiptoCarriers #row" + CarrierID).addClass("trSelectedHeader");
                    $("#fgrdShiptoCarriers td.unsorted").addClass("sorted");
                    $("#fgrdShiptoCarriers td.sorted").removeClass("unsorted");
                    $("#fgrdShiptoCarriers #row" + CarrierID).removeClass("trSelected");
                    $("#fgrdShiptoCarriers #row" + CarrierID + " td.sorted").addClass("unsorted");
                    $("#fgrdShiptoCarriers #row" + CarrierID + " td.unsorted").removeClass("sorted");
                    $("#EditShiptoCarriers").dialog("open");
                }
            }
        });
    });

    /*Confirmation dialog to Delete the shipto by Abi::17May2018*/
    $("[id^=DeleteCaCode_]").die("click").live("click", function () {

        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace('DeleteCaCode_', '');
        $('#OldCarriersId').html(ID);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCarrierCodeDetailsByID',
            data: '{"ID":"' + ID + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger
                var res = output.d;
                $("#DeleteconfirmCarrier").html("<p>Are you sure to delete<b> Shipto- " + res[0].Shipto + "  and Carrier- " + res[0].Carrier + "</b> ?</p>");
                $("#DeleteconfirmCarrier").dialog("open");
            },
            error: function (err) {
                debugger
                alert(err)
            }
        });
    });

    /*Delete carrier code details from table by Abi :: 21May2018*/
    $("#DeleteconfirmCarrier").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var List = $("#DeleteCaCode_" + $("#OldCarriersId").html());
                var ID = $("#OldCarriersId").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteCarrierCodeDetails',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdShiptoCarriers").flexReload({ url: '/url/for/refresh' });
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

    $("#lstCaCodeCarrier").change(function () {
        $("#txtCarrierAccount").focus();
    });

    $('input').keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                var a;
                if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                    a = i;
                }
                if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i) {
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtCarrierAccount") {
                    $("#txtCarrierZone").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtCarrierZone") {
                    $("#EditShiptoCarriers").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus()
                    return false;
                }
            }
        }
    });

</script>