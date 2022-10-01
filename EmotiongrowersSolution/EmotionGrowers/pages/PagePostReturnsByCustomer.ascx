<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PagePostReturnsByCustomer.ascx.vb" Inherits="pages_PostReturnsByCustomer" %>
<input type="hidden" id="hdnPagePostReturnsSelectedFlowerId" />

<style>
    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }
</style>

<div id="DivPostReturnByCustDialog" style="display: none">
    <table style="">
        <tr style="display: block">
            <td style="vertical-align: top;">
                <div id="DivPostReturnByCustPage" style="width: 1030px;"></div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="divViewSalesReturnsPrice" style="float: left">
                    <table id="fgrdPostReturnByCust" style="display: block;"></table>
                </div>
                <div id="DivPostReturnByCustInvoiceNo" style="display: none">0</div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="divPostReturnButtonsList" style="margin-top: 6px; display: block;">
                    <button id="btnPostReturnCustADD" type="button" class="BloomButtonEnabled firstletterunderline" value="Add" style="width: 66px; color: white;float:left;">Add</button>
                    <button id="btnPostReturnCustApply" type="button" class="BloomButtonEnabled firstletterunderline" value="Post" style="width: 66px; color: white;float:right;">Post</button>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="DivViewSalesReturnPriceDialog" style="display: none;">
    <table>
        <tr>
            <td>
                <div id="divViewSalesReturnPrice" style="float: left">
                    <table id="fgrdSalesReturnPrice" style="display: block;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td id="tdSalesReturnPriceAdd">
                <button id="btnSalesReturnPriceAdd" class="BloomButtonEnabled firstletterunderline" value="PriceAdd" style="width: 70px;">Add</button>
                <button id="btnSalesReturnPriceClose" class="BloomButtonEnabled firstletterunderline" value="Close" style="width: 70px; float: right; background: red;">Close</button>
            </td>
        </tr>
    </table>
</div>

<div id="DivViewSPORDByPriceDialog" style="display: none;">
    <table>
        <tr>
            <td>
                <div id="divViewSPORDByPrice" style="float: left">
                    <table id="fgrdViewCreditReturnPrice" style="display: block;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td id="tdSPORDPriceAdd" style="visibility: hidden">
                <%--<button id="btnSPORDPriceAdd" class="BloomButtonEnabled firstletterunderline" value="PriceAdd" style="width: 70px; visibility: hidden">Add</button>--%>
                <button id="btnSPORDClose" class="BloomButtonEnabled firstletterunderline" value="Close" style="width: 70px; visibility: hidden; float: right; background: red;">Close</button>
                <button id="btnSPORDBuild" class="BloomButtonEnabled firstletterunderline" value="Build" style="width: 70px; visibility: hidden; float: right;display:none;">Build</button>

            </td>
        </tr>
    </table>
</div>



<div id="SalesReturnPriceDialog" style="display: none; background-color: black;">
    <table>
        <tr>
            <td colspan="4">
                <table>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Flower</label>
                        </td>
                        <td>
                            <input type="hidden" id="hfSalesReturnFlowerID" />
                            <input type="hidden" id="hfSalesReturnFlower" />
                            <input type="hidden" id="hfSalesReturnName" />
                            <input type="text" id="txtSalesReturnFlower" style="width: 347px; margin-bottom: 2px; width: 347px;" class="AllUpperCaseTextBox">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Description</label>
                        </td>
                        <td>
                            <select id="lstSalesReturnDesc" style="width: 175px; margin-bottom: 2px; width: 347px;"></select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">BOXES</label>
                        </td>
                        <td>
                            <input type="text" id="txtSalesReturnBoxes" style="width: 175px; margin-bottom: 2px; width: 50px;" maxlength="15" class="NumbersOnly">

                            <label class="EditHeaderLabels" style="margin-right: 5px; margin-left: 10px; margin-bottom: 2px;">UOM</label>
                            <select id="lstSalesReturnUOM" class="enterKeyPressControl" style="width: 50px;"></select>
                            <input type="hidden" id="hflstSalesReturnUOM" />
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Price</label>
                            <input type="text" id="txtSalesReturnPrice" placeholder="0.0000" style="width: 50px; margin-bottom: 2px;" maxlength="25" class="DecimalsOnly">
                        </td>
                    </tr>

                    <%--                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Reason Code</label>
                        </td>
                        <td>
                            <input type="text" id="txtReasonCode" style="width: 347px; margin-bottom: 2px;" maxlength="25" class="AllUpperCaseTextBox">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Reason</label>
                        </td>
                        <td>
                            <input type="text" id="txtReason" style="width: 347px; margin-bottom: 2px;" maxlength="25" class="AllUpperCaseTextBox">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Credit Date</label>
                        </td>
                        <td>
                            <input type="text" id="txtCreditDate" style="width: 347px; margin-bottom: 2px;" maxlength="25" class="AllUpperCaseTextBox">
                        </td>
                    </tr>--%>
                </table>
            </td>
        </tr>
    </table>
</div>


<div id="AddCreditDetailsDialogSalesReturn">
    <table style="width: 100%;">
        <tr style="height: 25px">
            <td colspan="4">
                <div class="Warning" id="Futurewarning" align="center" style="display: none;">
                    Not enough on inventory
                </div>
                <div class="YellowWarning" align="center" style="display: none;">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr style="height: 35px;">
            <td style="width: 24%">PRODUCT</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox" id="txtFlower_CreditReturns" style="width: 350px;" />
                <input type="hidden" id="hfFlower_CreditReturns" />
                <input type="hidden" id="hfCreditReturnsID" />
                <input type="hidden" id="hfCreditReturnsAddFlag" />
                <input type="hidden" id="hfFlowerName_CreditReturns" />
            </td>
        </tr>
        <tr style="height: 35px; display: none;">
            <td>FARM</td>
            <td>
                <select id="lstFarm_CreditReturns" class="enterKeyPressControl" style="width: auto;">
                </select>
                <input type="hidden" id="hfFarm_CreditReturns" />
            </td>
            <td colspan="2">&nbsp;
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>BOXES</td>
            <td>
                <input type="text" class="ClsNumbersOnly enterKeyPressControl" id="txtBoxQty_CreditReturns" style="width: 50px;" />
                <select id="lstUOM_CreditReturns" class="enterKeyPressControl" style="width: 100px; height: 23px">
                </select>
                <input type="hidden" id="hfUOM_CreditReturns" />
                <label style="margin-left: 20px">UNITS/BOX</label>
                <input type="text" class="ClsNumbersOnly enterKeyPressControl" id="txtUnitsPerBox_CreditReturns" style="width: 50px;" />
            </td>
            <td colspan="2">&nbsp;                  
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>PRICE</td>
            <td colspan="3">
                <input type="text" class="DecimalsOnly enterKeyPressControl" placeholder="0.000" id="txtPrice_CreditReturns" style="width: 65px;" />
                <%--    <label style="margin-left: 20px">COST</label>
                <input type="text" class="ClsDecimalsOnly enterKeyPressControl" id="txtCost_CreditReturns" style="width: 65px;" />
                <label style="margin-left: 20px">GPM%</label>
                <input type="text" class="ClsDecimalsOnly " id="txtGPM_CreditReturns" style="width: 65px;" disabled />--%>
            </td>
        </tr>
        <tr>
            <td>
                <label style="margin-right: 10px; margin-bottom: 2px;">Reason Code</label>
            </td>
            <td>
                <input type="text" id="txtReasonCode_CreditReturns" style="width: 347px; margin-bottom: 2px;" maxlength="25" class="AllUpperCaseTextBox">
            </td>
        </tr>

        <tr>
            <td>
                <label style="margin-right: 10px; margin-bottom: 2px;">Reason</label>
            </td>
            <td>
                <input type="text" id="txtReason_CreditReturns" style="width: 347px; margin-bottom: 2px;" maxlength="25" class="AllUpperCaseTextBox">
            </td>
        </tr>

        <tr>
            <td>
                <label style="margin-right: 10px; margin-bottom: 2px;">Credit Date</label>
            </td>
            <td>
                <input type="text" id="txtCreditDate_CreditReturns" style="width: 347px; margin-bottom: 2px;" maxlength="25" class="AllUpperCaseTextBox">
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>NOTES</td>
            <td colspan="3">
                <textarea id="txtNotes_CreditReturns" class="enterKeyPressControl" style="width: 360px;" rows="5" cols="40" />
            </td>
        </tr>
    </table>
</div>


<div id="CurrentCustomerNo" style="display: none;"></div>
<div id="CurrentInvoiceNo" style="display: none;"></div>
<div id="DeleteReturnCredit" style="display: none;" title="Alert"></div>






<script type="text/javascript">
    $(document).ready(new function () {

        $("#btnPostReturnCustADD").die("click").live("click", function () {
            var Customer = $("#CurrentCustomerNo").html();
            isPricelstExistForCust = false;
            LoadViewCreditReturnPriceGrid(Customer);
        });

        $("#btnPostReturnCustApply").die("click").live("click", function () {
            var Customer = $("#CurrentCustomerNo").html();
            var Invoice = $("#CurrentInvoiceNo").html();

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ApplyCreditReturns',
                data: "{'Customer': '" + Customer + "','Invoice' : '" + Invoice+"','TotalAmount' : '" + $("#Total_0").html()+"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    var InvoiceNumber = output.d
                    $.MessageBox("Credit# " + InvoiceNumber + " created");
                    return true;
                }
            });
        });

        $(".DecimalsOnly").keypress(function (event) {
            return isDecimal(event, this)
        });

        function isDecimal(evt, element) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            if (
                (charCode != 46 || $(element).val().indexOf('.') != -1) && // “.” CHECK DOT, AND ONLY ONE.
                ((charCode != 8 && charCode < 48) || charCode > 57))
                return false;
            return true;
        }

        function isNumber(evt, element) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (
                //(charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.         
                ((charCode != 8 && charCode < 48) || charCode > 57))
                return false;
            return true;
        }

        $(".NumbersOnly").keypress(function (event) {
            return isNumber(event, this)
        });

        $("#txtCreditDate_CreditReturns").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
            onSelect: function (Date) {
                $("#txtCreditDate_CreditReturns").val(Date);
            }
        });
        LoadPostReturnByCust();

        $("[id^=SalesReturnDelete_]").die("click").live("click", function () {
            var ID = $(this).attr('id').replace("SalesReturnDelete_", "");
            $("#hfCreditReturnsID").val(ID);
            $("#hfCreditReturnsAddFlag").val("D");
            $("#DeleteReturnCredit").dialog("open")
        });

        $("#[id^=SalesReturnEdit_]").die("click").live("click", function () {
            var ID = $(this).attr('id').replace("SalesReturnEdit_", "");
            updateClicked(ID)
        });


        $('input').keypress(function (e) {
            var key = e.which;
            if (key == 13) // the enter key code
            {
                if ($(this).attr('id') == "txtFlower_CreditReturns") {
                    $("#txtBoxQty_CreditReturns").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtBoxQty_CreditReturns") {
                    $("#lstUOM_CreditReturns").focus()
                    return false;
                }

                else if ($(this).attr('id') == "lstUOM_CreditReturns") {
                    $("#txtUnitsPerBox_CreditReturns").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtUnitsPerBox_CreditReturns") {
                    $("#txtPrice_CreditReturns").focus()
                    return false;
                }
                else if ($(this).attr('id') == "txtPrice_CreditReturns") {
                    $("#txtReasonCode_CreditReturns").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtReasonCode_CreditReturns") {
                    $("#txtReason_CreditReturns").focus();
                    return false;
                }

                else if ($(this).attr('id') == "txtReason_CreditReturns") {
                    $("#txtCreditDate_CreditReturns").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtCreditDate_CreditReturns") {
                    $("#txtNotes_CreditReturns").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtNotes_CreditReturns") {
                    $("#AddCreditDetailsDialogSalesReturn").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
                    return false;
                }   
                // }
            }
        });

    });


    $("#DivViewSPORDByPriceDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "View SPORD Price",
        width: 910,
        open: function (e) {
            $("#DivViewSPORDByPriceDialog").dialog('option', { 'title': 'SPORD Price Details for Customer ::' + $("#CurrentCustomerNo").html(), 'width': isPricelstExistForCust ? '810px' : '910px' });
            $("#fgrdViewCreditReturnPrice").flexOptions({
                params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                { name: 'ExportCSV', value: '' },
                ], query: "", newp: 1
            }).flexReload();

            if (!isPricelstExistForCust && ($("#DivViewSPORDByPriceDialog").dialog('isOpen') == true)) {
                changegridColByF8Price(true);
            }
            else {
                changegridColByF8Price(false);
            }
            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdViewCreditReturnPrice")[0].tabIndex = tabindex;
            $("#fgrdViewCreditReturnPrice").focus();
        },
        close: function () {
            if (isPricelstExistForCust) {
                addForF8();
            }
            $("#btnSPORDPriceAdd").css("visibility", "hidden");
            $("#btnSPORDBuild").css("visibility", "hidden");
            $("#btnSPORDClose").css("visibility", "hidden");
            $("#tdSPORDPriceAdd").css("visibility", "hidden");
        }
    });

    function changegridColByF8Price(isVisible) {
        //$("#btnSPORDPriceAdd").css("visibility", isVisible ? "visible" : "hidden");
        $("#btnSPORDBuild").css("visibility", isVisible ? "visible" : "hidden");
        $("#btnSPORDClose").css("visibility", isVisible ? "visible" : "hidden");
        $("#tdSPORDPriceAdd").css("visibility", isVisible ? "visible" : "hidden");
        $("#fgrdViewCreditReturnPrice").flexToggleCol('0', isVisible)
        $("#fgrdViewCreditReturnPrice").flexToggleCol('1', isVisible)
        $("#fgrdViewCreditReturnPrice").flexToggleCol('11', isVisible)

    }

    $("#btnSPORDBuild").die("click").live("click", function () {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/LoadPricingDetailsForSelectedCust",
            data: "{'SelectedCust':" + $("#CurrentCustomerNo").html() + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#fgrdViewCreditReturnPrice").flexOptions({
                    params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                    { name: 'ExportCSV', value: '' },
                    ], query: "", newp: 1
                }).flexReload();
            }
        });

    });

    $("#btnSPORDClose").die("click").live("click", function () {

        $("#DivViewSPORDByPriceDialog").dialog("close");
    });

    function LoadViewCreditReturnPriceGrid(Customer) {
        $("#hdnPageOrderNewCustId").val(Customer)
        $("#fgrdViewCreditReturnPrice").flexigrid({
            url: 'BloomService.asmx/GetViewSPORDByPriceGrid',
            dataType: 'xml',
            colModel: [

                { display: '', name: 'Delete', width: 13, sortable: false, align: 'center' },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                { display: 'Cust#', name: 'Customer', width: 30, sortable: true, align: 'left', process: PriceForCreditReturn, hide: true },
                { display: 'Product', name: 'idproduct', width: 60, sortable: true, align: 'left', process: PriceForCreditReturn, hide: true },
                { display: 'Flower', name: 'Flower', width: 85, sortable: true, align: 'left', process: PriceForCreditReturn, hide: true },
                { display: 'Product Name', name: 'Name', width: 220, sortable: true, align: 'left', process: PriceForCreditReturn },
                { display: 'Quantity', name: 'Quantity', width: 50, sortable: true, align: 'right', process: PriceForCreditReturn },
                { display: 'Uom', name: 'Uom', width: 45, sortable: true, align: 'left', process: PriceForCreditReturn },
                { display: 'Units', name: 'units', width: 45, sortable: true, align: 'right', process: PriceForCreditReturn },
                { display: 'U/B', name: 'unitsperbunch', width: 69, sortable: true, align: 'right', title: 'Units Per Bunch', process: PriceForCreditReturn },
                { display: 'Price', name: 'Price', width: 65, sortable: true, align: 'right', process: PriceForCreditReturn },
                { display: 'Soldas', name: 'soldas', width: 40, sortable: true, align: 'left', process: PriceForCreditReturn },
                { display: 'UPC', name: 'UPC', width: 45, sortable: true, align: 'right', process: PriceForCreditReturn },
                { display: 'BoxCode', name: 'BoxCode', width: 60, sortable: true, align: 'right', process: PriceForCreditReturn },
                { display: 'GTIN', name: 'GTIN', width: 75, sortable: true, align: 'right', process: PriceForCreditReturn },
                { display: '', name: '', width: 5, sortable: true, align: 'left', process: PriceForCreditReturn, hide: true }
            ],
            searchitems: [
                { display: 'Cust#', name: 'Customer' },
                { display: 'BoxCode', name: 'BoxCode' },
            ],
            showTableToggleBtn: true,
            sortname: "ID",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "ID",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            params: [
                { name: 'Customer', value: $("#CurrentCustomerNo").html() }
            ],
            height: $(window).height() - 180,
            width: (isPricelstExistForCust) ? "785" : "890",
            striped: true,
            onSuccess: function () {
                $("#fgrdViewCreditReturnPrice tr:first").addClass("trSelectedCheck");
                $("#DivSelectedSPORDPriceID").html($("#fgrdViewCreditReturnPrice tr:first").attr('id').replace('row', ''));

                var sel = jQuery("#fgrdViewCreditReturnPrice tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#divViewSPORDByPrice #ExportCSV").show();
                }
                //For to show the error
                if ($("#fgrdViewCreditReturnPrice tr#row-2").length > 0) {
                    $("#fgrdViewCreditReturnPrice tr#row-2").hide();
                    $.MessageBox($("#fgrdViewCreditReturnPrice tr#row-2")[0].innerText);
                    return false;
                }
                $('#fgrdViewCreditReturnPrice #row0').addClass("TotalRows");
                if (!isPricelstExistForCust && ($("#DivViewSPORDByPriceDialog").dialog('isOpen') == true)) {
                    changegridColByF8Price(true);
                }
                else {
                    changegridColByF8Price(false);
                }
                $("#divViewSPORDByPrice .flexigrid").css('width', isPricelstExistForCust ? '785px' : '890px');

            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS!!! Please try after some time..");
                }
            }
        });
        if (isPricelstExistForCust) {
            $("#divViewSPORDByPrice .sDiv").css('float', 'left').css('width', '545px').hide();
        }
        else {
            $("#divViewSPORDByPrice .sDiv").css('float', 'left').css('width', '545px').show();
        }

        $('#divViewSPORDByPrice .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#divViewSPORDByPrice .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#divViewSPORDByPrice .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#divViewSPORDByPrice .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
        $("#DivViewSPORDByPriceDialog").dialog("open");
    }
    function PriceForCreditReturn(celDiv, id) {
        $(celDiv).click(function () {
            $("#fgrdViewCreditReturnPrice [id^=row]").removeClass("trSelectedCheck");
            $("#fgrdViewCreditReturnPrice #row" + id).addClass("trSelectedCheck");
            if (isPricelstExistForCust) {
                if (isPriceClicked == false) {
                    isPriceClicked = true;
                    F8PriceIds.push(id);
                    SpordSqlID = "0";
                    var customerF8 = $("#F8PriceCust_" + id).html();
                    var idproductF8 = $("#F8PriceProdId_" + id).html();
                    var FlowerF8 = $("#F8PriceProdCode_" + id).html();
                    var NameF8 = $("#F8PriceProdName_" + id).html();
                    var QuantityF8 = $("#F8PriceQty_" + id).html();
                    var UomF8 = $("#F8PriceUOM_" + id).html();
                    var unitsF8 = $("#F8PriceUnits_" + id).html();
                    var unitsperbunchF8 = $("#F8PriceUBunch_" + id).html();
                    var PriceF8 = $("#F8PricePrice_" + id).html();
                    var soldasF8 = $("#F8PriceSoldas_" + id).html();
                    var UPCF8 = $("#F8PriceUPC_" + id).html();
                    var BoxCodeF8 = $("#F8PriceBoxCode_" + id).html();
                    var GTINF8 = $("#F8PriceGTIN_" + id).html();
                }
            }
            console.log($("#hdnPagePostReturnsSelectedFlowerId").val())
            console.log(id)
            $("#hdnPagePostReturnsSelectedFlowerId").val(id)
            console.log($("#hdnPagePostReturnsSelectedFlowerId").val())
            $("#AddCreditDetailsDialogSalesReturn").dialog("open");
            $("#AddCreditDetailsDialogSalesReturn").dialog('option', 'title', 'Add Credit Details');

            $("#hfCreditReturnsID").val("0");
            $("#hfCreditReturnsAddFlag").val("I");

        })
    }


    $("#AddCreditDetailsDialogSalesReturn").dialog({
        autoOpen: false,
        resizable: false,
        title: 'Add Credit Details',
        width: 520,
        modal: true,
        buttons: {
            SAVE: function () {
                SaveCreditReturns();
                $("#ctl00_DivShortKeyFlag").html("0");
            },
            CLOSE: function () {
                $("#AddCreditDetailsDialogSalesReturn").dialog("close");
                ClearCreditReturnField();
                $("#hfCreditReturnsID").val("0");
                $("#hfCreditReturnsAddFlag").val("");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('SAVE')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
            if ($('#DivViewSPORDByPriceDialog').dialog('isOpen')) {
                LoadUOM_CreditReturns();
                $("#hfFlower_CreditReturns").val($("#F8PriceProdCode_" + $("#hdnPagePostReturnsSelectedFlowerId").val()).html());
                GetFarmListByFlowerCreditReturn($("#hfFlower_CreditReturns").val());
                $("#hfFlowerName_CreditReturns").val($("#F8PriceProdName_" + $("#hdnPagePostReturnsSelectedFlowerId").val()).html());
                $("#txtFlower_CreditReturns").val("[" + $("#F8PriceProdCode_" + $("#hdnPagePostReturnsSelectedFlowerId").val()).html() + "] " + $("#F8PriceProdName_" + $("#hdnPagePostReturnsSelectedFlowerId").val()).html());
                $("#txtBoxQty_CreditReturns").val($("#F8PriceQty_" + $("#hdnPagePostReturnsSelectedFlowerId").val()).html());
                $("#lstUOM_CreditReturns").val($("#F8PriceUOM_" + $("#hdnPagePostReturnsSelectedFlowerId").val()).html());
                $("#txtUnitsPerBox_CreditReturns").val($("#F8PriceUnits_" + $("#hdnPagePostReturnsSelectedFlowerId").val()).html())
                //var unitsperbunchF8 = $("#F8PriceUBunch_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html();
                $("#txtPrice_CreditReturns").val($("#F8PricePrice_" + $("#hdnPagePostReturnsSelectedFlowerId").val()).html())
                //var soldasF8 = $("#F8PriceSoldas_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html();
                $("#txtUPC_FutureOrderDetail").val($("#F8PriceUPC_" + $("#hdnPagePostReturnsSelectedFlowerId").val()).html());
            }
        }
    });


    function GetFarmListByFlowerCreditReturn(flower) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmListByFlower',
            data: "{'Flower':'" + flower + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFarm_CreditReturns').empty();
                var Typedata = output.d;
                $('#lstFarm_CreditReturns').append('<option value="">Select</option>');
                $('#lstFarm_CreditReturns').append(Typedata);
                //LoadUOM();
            }
        });
    }
    function LoadUOM_CreditReturns() {
        var length = $('#lstUOM_CreditReturns > option').length;
        var farmcode = $("#lstFarm_CreditReturns")[0].value;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForSPORD',
                data: '{"FarmCode":"' + farmcode.toUpperCase() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstUOM_CreditReturns').empty();
                    var UOMdata = output.d;
                    $('#lstUOM_CreditReturns').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstUOM_CreditReturns').append('<option value="' + UOM.UOM + '">' + UOM.UOM + ' [' + UOM.SIZE + ']</option>');
                    }

                    if ($("#hfUOM_CreditReturns").val() != "" && $("#hfUOM_CreditReturns").val() != 0)
                        $('#lstUOM_CreditReturns').val($("#hfUOM_CreditReturns").val());
                    else
                        $("#lstUOM_CreditReturns").val("QB");
                }
            });
        }
        else {
            $('#lstUOM_CreditReturns').val($("#hfUOM_CreditReturns").val());
        }
    }

    function SaveCreditReturns() {
        var validationResult = ($("#hfCreditReturnsAddFlag").val() == "D" ? "" : validate());
        if (validationResult != "") {
            $(".YellowWarning").css("display", "block");
            $(".YellowWarning").html(validationResult);
        }
        else {
            $(".YellowWarning").css("display", "none");
            $(".YellowWarning").html("");
            var obj = convertToJson(0);
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/TempCreditDetailsAddUpdDel',
                async: false,
                data: "{postReturnCustModel:" + JSON.stringify(obj) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    if (output.d == "LogOut") {
                        window.location.href = "Login.aspx"
                    }
                    else if (output.d.ID != '' && output.d.ID != null && output.d.ErrorMessage == null) {
                        if (output.d.FLAG == "I")
                            $.growl.notice({ title: "Added!", message: "Success" });
                        else if (output.d.FLAG == "U")
                            $.growl.notice({ title: "Updated!", message: "Success" });
                        else if (output.d.FLAG == "D")
                            $.growl.notice({ title: "Deleted!", message: "Success" });

                        $("#AddCreditDetailsDialogSalesReturn").dialog("close");
                        $("#fgrdPostReturnByCust").flexReload({ url: '/url/for/refresh' });
                        ClearCreditReturnField();
                    }
                    else {
                        $("#AddCreditDetailsDialogSalesReturn").dialog("close");
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        ClearCreditReturnField();
                    }
                }
            });
        }
    }


    function validate() {
        var returnValidationMsg = ""
        var FlowerCode = $("#hfFlower_CreditReturns").val();
        var FlowerName = $("#hfFlowerName_CreditReturns").val();
        //var Farm = $("#lstFarm_CreditReturns").val();
        var UOM = $("#lstUOM_CreditReturns").val();
        var Dimension = $("#lstUOM_CreditReturns option:selected").text().split('[');
        var DimLWH = Dimension[1] == undefined ? "0x0x0".split('x') : Dimension[1].replace("]", "").split('x');
        var OrderNo = 0;
        var CustomerNo = $("#CurrentCustomerNo").html();
        var UnitsPerBox = $("#txtUnitsPerBox_CreditReturns").val();
        var Price = $("#txtPrice_CreditReturns").val();
        var ID = 0;
        var Notes = $("#txtNotes_CreditReturns").val();
        var BoxQty = $("#txtBoxQty_CreditReturns").val();
        var CreditDate = $("#txtCreditDate_CreditReturns").val();


        if (UOM == "" || UOM == null) {
            returnValidationMsg = "Please select uom"
        }
        if (UnitsPerBox == "0.000" || UnitsPerBox == null || UnitsPerBox == "") {
            returnValidationMsg = returnValidationMsg + (returnValidationMsg.length <= 0 ? "Please enter units/box" : "<br/>Please enter units/box")
        }

        if (Price == null || Price == "") {
            returnValidationMsg = returnValidationMsg + (returnValidationMsg.length <= 0 ? "Please enter price" : "<br/>Please enter price")
        }

        if (BoxQty == null || BoxQty == "") {
            returnValidationMsg = returnValidationMsg + (returnValidationMsg.length <= 0 ? "Please enter boxes" : "<br/>Please enter boxes")
        }

        return returnValidationMsg
    }

    function convertToJson(id) {

        var FlowerCode = $("#hfFlower_CreditReturns").val();
        var FlowerName = $("#hfFlowerName_CreditReturns").val();
        var Farm = $("#lstFarm_CreditReturns").val();
        var UOM = $("#lstUOM_CreditReturns").val() == null ? "" : $("#lstUOM_CreditReturns").val();
        var Dimension = $("#lstUOM_CreditReturns option:selected").text().split('[');
        var DimLWH = Dimension[1] == undefined ? "0x0x0".split('x') : Dimension[1].replace("]", "").split('x');
        var CustomerNo = $("#CurrentCustomerNo").html();
        var UnitsPerBox = $("#txtUnitsPerBox_CreditReturns").val() == "" ? $("#txtUnitsPerBox_CreditReturns").attr('placeholder') : $("#txtUnitsPerBox_CreditReturns").val();
        var Price = (($("#txtPrice_CreditReturns").val() == "") ? $("#txtPrice_CreditReturns").attr('placeholder') : $("#txtPrice_CreditReturns").val());
        var Notes = $("#txtNotes_CreditReturns").val();
        var BoxQty = (($("#txtBoxQty_CreditReturns").val() == "") ? "0" : $("#txtBoxQty_CreditReturns").val());
        var CreditDate = $("#txtCreditDate_CreditReturns").val();

        var ReasonCode = $("#txtReasonCode_CreditReturns").val();
        var Reason = $("#txtReason_CreditReturns").val();

        var CreditDate = $("#txtCreditDate_CreditReturns").val();
        var ID = $("#hfCreditReturnsID").val();
        var Flag = $("#hfCreditReturnsAddFlag").val();

        var flowerObject = {
            Flower: FlowerCode,
            Name: FlowerName,
        }

        var data = {
            Customer: $("#CurrentCustomerNo").html(),
            Uom: UOM,
            Unit: UnitsPerBox,
            Boxes: BoxQty,
            Notes: Notes,
            L: (DimLWH[0] == "" ? 0 : DimLWH[0]),
            W: (DimLWH[1] == "" ? 0 : DimLWH[1]),
            H: (DimLWH[2] == "" ? 0 : DimLWH[2]),
            ID: ID,
            CreditDate: CreditDate,
            FLAG: Flag,
            Price: Price,
            FlowerDetails: flowerObject,
            Reason: Reason == null ? "" : Reason,
            ReasonCode: ReasonCode == null ? "" : ReasonCode,
            Invoice: $("#CurrentInvoiceNo").html()
        }

        return data;
    }

    function ClearCreditReturnField() {
        $("#hfFlower_CreditReturns").val("");
        $("#hfFlowerName_CreditReturns").val("");
        $("#txtFlower_CreditReturns").val("");
        $("#lstUOM_CreditReturns").val("0");
        $("#txtUnitsPerBox_CreditReturns").val("");
        $("#txtPrice_CreditReturns").val("").attr("placeholder", "0.000");
        $("#txtNotes_CreditReturns").val();
        $("#txtBoxQty_CreditReturns").val("");
        $("#txtCreditDate_CreditReturns").val("");
        $("#hfCreditReturnsID").val("0");
        $("#hfCreditReturnsAddFlag").val("");
        $("#txtReasonCode_CreditReturns").val("");
        $("#txtReason_CreditReturns").val("");
        $("#txtNotes_CreditReturns").val("");
    }



    function LoadPostReturnByCust() {
        $("#fgrdPostReturnByCust").flexigrid({
            url: 'BloomService.asmx/GetTempCreditDetailsList',
            dataType: 'xml',
            colModel: [
                { display: '', name: 'Delete', width: 13, sortable: false, align: 'center' },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                { display: 'Cust#', name: 'Customer', width: 30, sortable: true, align: 'left', process: PriceForCreditReturnParent, hide: true },
                { display: 'Flower', name: 'Flower', width: 85, sortable: true, align: 'left', process: PriceForCreditReturnParent, hide: true },
                { display: 'Product Name', name: 'Name', width: 200, sortable: true, align: 'left', process: PriceForCreditReturnParent },
                { display: 'Boxes', name: 'boxes', width: 45, sortable: true, align: 'right', process: PriceForCreditReturnParent },
                { display: 'Uom', name: 'uom', width: 30, sortable: true, align: 'left', process: PriceForCreditReturnParent },
                { display: 'Units', name: 'units', width: 45, sortable: true, align: 'right', process: PriceForCreditReturnParent },
                { display: 'Price', name: 'price', width: 65, sortable: true, align: 'right', process: PriceForCreditReturnParent },
                { display: 'Total$', name: 'price', width: 65, sortable: true, align: 'right', process: PriceForCreditReturnParent },
                { display: 'Reason Code', name: 'reasoncode', width: 200, sortable: true, align: 'left', process: PriceForCreditReturnParent },
                { display: 'Reason', name: 'reason', width: 220, sortable: true, align: 'left', process: PriceForCreditReturnParent },
                { display: 'Credit Date', name: 'Creditdate', width: 60, sortable: true, align: 'left', process: PriceForCreditReturnParent, hide: true},
                { display: 'Notes', name: 'notes', width: 200, sortable: true, align: 'left', process: PriceForCreditReturnParent },
            ],
            searchitems: [
                { display: 'Cust#', name: 'Customer' }
            ],
            showTableToggleBtn: true,
            sortname: "ID",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "ID",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            params: [
                { name: 'Customer', value: $("#CurrentCustomerNo").html() },
                { name: 'ExportCSV', value: '' }
            ],
            height: $(window).height() - 310,
            width: 1193,
            striped: true,
            onSuccess: function () {
                $('#fgrdPostReturnByCust #row0').addClass("TotalRows");
                //$("#DivSelectedSPORDPriceID").html($("#fgrdViewCreditReturnPrice tr:first").attr('id').replace('row', ''));

                var sel = jQuery("#fgrdPostReturnByCust tbody tr");
                var len = sel.length;
                //if (len >= 1) {
                //    $("#divViewSalesReturnsPrice #ExportCSV").show();
                //}
                //For to show the error
                //if ($("#fgrdViewCreditReturnPrice tr#row-2").length > 0) {
                //    $("#fgrdViewCreditReturnPrice tr#row-2").hide();
                //    $.MessageBox($("#fgrdViewCreditReturnPrice tr#row-2")[0].innerText);
                //    return false;
                //}
                //$('#fgrdPostReturnByCust #row0').addClass("TotalRows");
                //debugger;
                //if (!isPricelstExistForCust && ($("#DivViewSPORDByPriceDialog").dialog('isOpen') == true)) {
                //    debugger;
                //    changegridColByF8Price(true);
                //}
                //else {
                //    changegridColByF8Price(false);
                //}
                $("#divViewSPORDByPrice .flexigrid").css('width', '890px');
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS!!! Please try after some time..");
                }
            }
        });
        //if (isPricelstExistForCust) {
        //    $("#divViewSalesReturnsPrice .sDiv").css('float', 'left').css('width', '545px').hide();
        //}
        //else {
        //    $("#divViewSalesReturnsPrice .sDiv").css('float', 'left').css('width', '545px').show();
        //}

        $('#divViewSalesReturnsPrice .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#divViewSalesReturnsPrice .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#divViewSalesReturnsPrice .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#divViewSalesReturnsPrice .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    }


    $("#DivPostReturnByCustDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 1225,
        height: $(window).height() - 10,
        modal: true,
        open: function () {
            var InvoiceNo = $("#DivPostReturnByCustDialog").data("inData")["Invoice"];
            var CustomerNo = $("#DivPostReturnByCustDialog").data("inData")["Customer"];
            var IsVoided = "";
            $("#CurrentInvoiceNo").html(InvoiceNo);
            $("#CurrentCustomerNo").html(CustomerNo);

            ControlNoForThisSession = '';
            $("#fgrdPostReturnByCust").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: CustomerNo }], query: "", newp: 1 }).flexReload();
        },
        close: function () {


        },
    });

    function PriceForCreditReturnParent(celDiv, id) {
        $(celDiv).click(function () {
            updateClicked(id);
        });
    }


    function updateClicked(id) {
        var Customer = $("#Customer_" + id).html();
        var Flower = $("#Flower_" + id).html();
        var FlowerName = $("#FlowerName" + id).html();
        var Unit = $("#Unit_" + id).html();
        var Price = $("#Price_" + id).html();
        var Boxes = $("#Boxes_" + id).html();
        var Uom = $("#Uom_" + id).html();
        var ReasonCode = $("#Reasoncode_" + id).html();
        var Reason = $("#Reason_" + id).html();
        var Creditdate = $("#Creditdate_" + id).html();
        var Notes = $("#Notes_" + id).html();


        $("#hfFlower_CreditReturns").val(Flower);
        $("#hfFlowerName_CreditReturns").val(FlowerName);
        $("#txtFlower_CreditReturns").val(FlowerName);
        GetFarmListByFlowerCreditReturn(Flower);
        $("#txtUnitsPerBox_CreditReturns").val(Unit)
        $("#txtPrice_CreditReturns").val(Price);
        $("#txtNotes_CreditReturns").val();
        $("#txtBoxQty_CreditReturns").val(Boxes);
        $("#txtCreditDate_CreditReturns").val(Creditdate);
        $("#hfCreditReturnsID").val(id);
        $("#hfCreditReturnsAddFlag").val("U");
        LoadUOM_CreditReturns();
        $("#txtReasonCode_CreditReturns").val(ReasonCode);
        $("#txtReason_CreditReturns").val(Reason);
        $("#txtNotes_CreditReturns").val(Notes);
        $("#lstUOM_CreditReturns").val(Uom);
        $("#AddCreditDetailsDialogSalesReturn").dialog("open");
        $("#AddCreditDetailsDialogSalesReturn").dialog('option', 'title', 'Edit Credit Details');
    }


    $("#DeleteReturnCredit").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                SaveCreditReturns();
                adialog.dialog("close");
            },
            No: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            var id = $("#hfCreditReturnsID").val();
            var FlowerName = $("#FlowerName" + id).html();
            var Units = $("#Unit_" + id).html();
            var Boxes = $("#Boxes_" + id).html();
            var UOM = $("#Uom_" + id).html();
            var FlowerName = $("#FlowerName" + id).html();

            $("#DeleteReturnCredit").html("<p>Are you sure to delete the <b>" + Boxes + " " + UOM + "X" + Units + " " + FlowerName + "?</b></p>");
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        },
        close: function () {
            $("#hfCreditReturnsID").val("0");
            $("#hfCreditReturnsAddFlag").val("");
        }
    });

</script>
