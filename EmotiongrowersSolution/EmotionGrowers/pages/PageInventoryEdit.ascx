<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageInventoryEdit.ascx.vb" Inherits="pages_PageInventoryPODetails" %>

<link rel="stylesheet" href="css/Filters.css">
<script src="js/validation.js"></script>

<style type="text/css">
    #DivInventoryPODetails table td {
        padding: 6px;
    }

    #DivInventoryPODetails input[type=text] {
        background-color: rgb(214, 214, 255);
    }

    #DivInventoryPODetails select {
        background-color: rgb(214, 214, 255);
    }


    #DivInventoryPODetails input[type="text"]:focus {
        background-color: cornsilk;
    }

    #DivInventoryPODetails select:focus {
        background-color: cornsilk;
    }

    #tdFarm .selectize-input {
        width: 380px;
    }

    #tdFarm .selectize-dropdown-content {
        min-width: 380px;
    }
</style>

<div id="DivPageARINVS" style="display: none;"></div>
<div id="DivInventoryPODetails" align="center">
    <table style="text-align: left; border-collapse: collapse;">
        <tr style="height: 40px">
            <td colspan="4">
                <div class="Warning" align="center">
                    OOPS! Unable to process your request. Please contact admin!
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
            <td colspan="2">
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>ID : </span>
                    <label id="lblINVEN_ID"></label> 
                    <span style="padding-left: 10px;">SPORDID : </span>
                    <label id="lblINVEN_SPORDID"></label>
                </div>
            </td>
        </tr>
        <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
        <tr>
            <td style="padding-left: 10px;" class="boldfont">Farm</td>
            <td colspan="10" id="tdFarm">
                <div style="float: left; width: 395px; margin-left: -13px;">
                    <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
                    <select placeholder='Choose Farm...' id="lstInventoryFarm" style="width: auto;" value="" />
                    <input type="hidden" id="hfInventoryFarm" />
                </div>
                <div>
                    <div style="padding: 10px 9px 9px 114px; float: left;">WH</div>
                    <select id="lstWarehouse" style="width: 150px; height: 23px; margin-top: 6px;"></select>
                    <input type="hidden" id="hfInventoryWarehouse" />
                </div>
            </td>
        </tr>
        <tr style="height: 50px;">
            <td style="padding-left: 10px;" class="boldfont">Flower</td>
            <td colspan="2">
                <select placeholder='Choose Flower...' id="lstInventoryFlower" style="width: auto; display: none" value="" />
                <input type="hidden" id="hfInventoryFlower" />
                <input type="hidden" id="hfInventoryFlowerName" />
                <input type="text" style="width: 250px; margin-left: -13px;" id="txtInventoryFlower" />
            </td>
            <%--<td style="text-align: right; padding-right: 34px" class="boldfont">Desc</td>
            <td colspan="3">
                <input type="text" style="width: 249px" maxlength="15" id="txtInventoryFlowerDesc" disabled /></td>--%>
        </tr>
        <tr>
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left: 1px" class="boldfont">Received</td>
                        <td>
                            <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtQuantityReceived" style="width: 52px; margin-left: 10px;text-align:right;" maxlength="5" />&nbsp;&nbsp;&nbsp;
                            <select id="lstInventoryUOM" style="width: 125px; height: 23px"></select>
                            <input type="hidden" id="hfInventoryUOM" />
                            <input type="hidden" id="hfInventoryFBE" />
                        </td>
                        <td class="boldfont">Units/Bunch</td>
                        <td>
                            <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtInventoryUnitsPerBunch" style="width: 52px;text-align:right;" maxlength="6" /></td>
                        <td style="padding-left: 15px" class="boldfont">Units</td>
                        <td>
                            <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtInventoryUnitsPerBox" style="width: 52px; margin-right: 19px;text-align:right;" maxlength="4" /></td>
                        <td style="padding-left: 12px;" class="boldfont">Total Units</td>
                        <td>
                            <input type="text" id="txtInventoryUnits" style="width: 69px; padding-left: 16px;margin-left: 7px;text-align:right;" class="NumbersOnly" disabled /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 8px;" class="boldfont">Sold</td>
            <td>
                <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtQuantitySold" style="width: 52px; margin-left: -11px;text-align:right;" maxlength="5" readonly />&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left: 1px;" class="boldfont">Cost/Units</td>
                        <td>
                            <input type="text" id="txtInventoryCostPerUnit" style="width: 52px; margin-left: 5px;text-align:right;" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" maxlength="10" />
                        </td>
                        <td class="boldfont" style="width: 95px;">Other Cost/Box</td>
                        <td>
                            <input type="text" id="txtInventoryOtherCostPerBox" style="width: 52px;text-align:right;" class="ClsThreeDecimalsOnly ClsForValidatingThreeDecimal" maxlength="10" />
                        </td>
                        <td class="boldfont">Duties</td>
                        <td>
                            <input type="text" id="txtInventoryDuties" style="width: 52px;text-align:right;" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" maxlength="10" />
                        </td>
                        <td class="boldfont">Handling</td>
                        <td>
                            <input type="text" id="txtInventoryHandling" style="width: 52px; padding-left: 4px;text-align:right;" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" maxlength="10" />
                        </td>
                        <td class="boldfont" style="padding-left: 15px">Landed cost</td>
                        <td>
                            <input type="text" id="txtInventorylandedcost" style="width: 84px; margin-left: 6px;text-align:right;" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" maxlength="10" readonly="readonly" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left: 1px;" class="boldfont">BoxNum</td>
                        <td>
                            <input type="text" id="txtInventoryBoxNumber" style="width: 52px; margin-left: 17px" class="ClsNumbersOnly" maxlength="5" /></td>
                        <td style="padding-left: 8px;" class="boldfont">Type</td>
                        <td>
                            <select id="lstInventoryType" style="width: 173px; height: 23px"></select>
                            <input type="hidden" id="hfInventoryType" />
                        </td>
                        <td style="padding-left: 8px;" class="boldfont">InvenType </td>
                        <td>
                            <select id="lstInventoryInvenType" style="width: 115px; height: 23px"></select>
                            <input type="hidden" id="hfInventoryInvenType" />
                        </td>
                        <td style="padding-left: 50px" class="boldfont">PO #</td>
                        <td>
                            <input type="text" id="txtInventoryPO" class="restrictspecialcharacters" style="width: 95px;" maxlength="12" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <table>
                    <tr>
                        <td style="padding-left: 1px;" class="boldfont">Invoice #</td>
                        <td>
                            <input type="text" id="txtInventoryInvoice" class="NumbersOnly" style="width: 52px; margin-left: 10px" maxlength="7" />
                        </td>
                        <td style="padding-left: 8px;" class="boldfont">Order Number</td>
                        <td>
                            <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtInventoryOrderNo" style="width: 102px; margin-left: 10px;" maxlength="6" />
                        </td>
                        <td style="padding-left: 33px;" class="boldfont">Cust#</td>
                        <td>
                            <input type="text" id="txtInventoryCustNo" style="width: 111px;" class="NumbersOnly" maxlength="5" />
                        </td>
                        <td style="padding-left: 15px" class="boldfont">Comments</td>
                        <td>
                            <input type="text" id="txtInventoryComments" maxlength="10" style="width: 95px;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 8px;" class="boldfont">AWB #</td>
            <td>
                <input type="text" id="txtInventoryAWB" class="NumbersOnly" style="width: 150px; margin-left: -9px" maxlength="15" />
            </td>
            <td class="boldfont">Date Received</td>
            <td>
                <input type="text" id="txtInventoryDateRec" style="width: 80px; padding-left: 8px;" class="NumbersOnly" maxlength="5" />
            </td>
        </tr>
        <tr>
            <td style="padding-left: 8px;" class="boldfont">BreakDown</td>
            <td colspan="10">
                <input type="text" id="txtInventoryBreakDown" maxlength="150" style="width: 683px; margin-left: -9px" />
            </td>
        </tr>
        <tr>
            <td style="padding-left: 8px;" class="boldfont">Selling Price</td>
              <td colspan="10">
                 <input type="text" id="txtSellingPrice" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" maxlength="10" style="width: 52px; margin-left: -9px;text-align: right;" />
             </td>  
        </tr>
        <tr>
                        <td style="padding-left: 8px;" class="boldfont">Brand</td>
                        <td id="tdBrand" colspan="10">
                                <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
                                <input type="text"  id="txtBrand" maxlength="6" style="width: 250px;margin-left: -9px" />
                                <input type="hidden" id="hfBrand" />                           
                        </td>                    
        </tr>
    </table>
</div>


<div id="DivSalesDetails" style="display: none">
    <table style="width: 100%">
        <tr>
            <td><b>Sales List Details</b></td>
        </tr>
        <tr>
            <td>
                <table id="fgrdSalesListDetails" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>

<div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix" style="margin-top: 44px; width: 800px; margin-left: -12px">
    <div class="ui-dialog-buttonset">
        <%--Muthu Nivetha M :: 16 Mar 19 :: Print Label on look up by boxnumber results screen--%>
        <button type="button" id="btninventprint" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false">
            <span class="ui-button-text">Print Label</span>
        </button>
        <button type="button" id="btninventsales" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false">
            <span class="ui-button-text">Sales</span>
        </button>
        <button type="button" id="btninventsave" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false">
            <span class="ui-button-text">Save</span>
        </button>
        <button type="button" id="btncancel" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-cancel" role="button" aria-disabled="false">
            <span class="ui-button-text">Cancel</span>
        </button>
    </div>
</div>


<div runat="server" id="divinventid" style="display: none"></div>
<div runat="server" id="divtablename" style="display: none"></div>
<%--26 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen--%>
<div runat="server" id="divIsFromLookUp" style="display: none"></div>
<div id="LoggedInUserID_InvenUser" runat="server" style="display: none"></div>

<script>
    var AWBFlag = "";
    var ReceivedPiecesOnly = "0";
    $(document).ready(function () {

        debugger;
        var EdtInvId = $("#ctl00_divinventid").html();
        var inventable = $("#ctl00_divtablename").html();
        //26 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen
        var isfromlookup = $("#ctl00_divIsFromLookUp").html();

        if (!isfromlookup) {
            if ('<%=ConfigurationManager.AppSettings("CompanyName")%>'.toLowerCase().indexOf("esprit") >= 0 && $("#DivCoolerDisplay").find('button.is-checked')[0].value == "arrival") {
                AWBFlag = "1";
            }
            else {
                AWBFlag = "";
            }

            if ('<%=ConfigurationManager.AppSettings("CompanyName")%>'.toLowerCase().indexOf("esprit") >= 0 && $("#DivCoolerDisplay").find('button.is-checked')[0].value != "available") {
                ReceivedPiecesOnly = "1";
            }
        }
        else {
            AWBFlag = "";
            ReceivedPiecesOnly = "1"
        }

        inventedit(EdtInvId, inventable)
        var loadingdropdownonDetailsDialogCompleted = false;
        //LoadControlsOnDetailDialog()
        //LoadInventoryInvenType();
        //LoadWarehouse()
        //LoadInventoryUOM();
        //LoadInventoryType();
        //inventedit(EdtInvId, tableName)

        $("#fgrdSalesListDetails").flexigrid({
            url: 'BloomService.asmx/GetSalesbyIDINVEN',
            dataType: 'xml',
            colModel: [
            { display: 'Invoice', name: 'Invoice', width: 60, sortable: true, align: 'right' },
            { display: 'Date', name: 'Date', width: 60, sortable: true, align: 'left' },
            { display: 'Customer', name: 'CustomerName', width: 210, sortable: true, align: 'left' },
            { display: 'Pieces', name: 'Boxes', width: 50, sortable: true, align: 'right' },
             { display: 'Printed', name: 'Printed', width: 50, sortable: true, align: 'left' },
            { display: 'Scanned', name: 'Scanned', width: 50, sortable: true, align: 'left' },
            ],
            searchitems: [
            { display: 'Invoice', name: 'Invoice' },
            { display: 'Date', name: 'Date' },
            { display: 'Cust#', name: 'CustomerName' },
            { display: 'Boxes', name: 'Boxes' },
            { display: 'Printed', name: 'Printed' },
            { display: 'Scanned', name: 'Scanned' },
            ],
            showTableToggleBtn: true,
            sortname: "PrintedDate",
            sortorder: "desc",
            usepager: true,
            title: false,
            useRp: true,
            //rp: parseInt(($(window).height() - 290) / 25),
            // qtype: "Farm",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: false,
            showTableToggleBtn: false,
            params: [
            { name: 'IDINVEN', value: EdtInvId }
            ],
            height: 300,
            width: 550,
            striped: true,
            onSuccess: function () {
                $('#fgrdSalesListDetails #row0').addClass("TotalRows")
            }
        });
        $("#DivSalesDetails .sDiv").css('float', 'left').css('width', '500px');
        $('#DivSalesDetails .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivSalesDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivSalesDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivSalesDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();

        function editorder(OrderNo, CustomerNo) {
            //Muthu Nivetha M :: 12 Mar 19 :: Add VOID when showing a voided invoice 
            //Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
            // debugger;
            var IsVoidedInvoice = "";
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetOrderDateByrderNo',
                data: '{"OrderNo":"' + OrderNo + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    var data = output.d.VOID;
                    IsVoidedInvoice = data.toString().toLowerCase() == "true" ? "VOIDED" : "";

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/InsertOrderLock',
                        data: "{ 'OrderNumber': '" + OrderNo + "' }",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {

                            var data = output.d;

                            if (data == "Logout") {
                                window.location.href = "Login.aspx"

                            }
                            else if (data == "error") {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }

                            else if (data.indexOf("NotExist") >= 0) {
                                debugger
                                LockedOrder.push(OrderNo);  // this global variable  declared in dashboarduser page 
                                var para = "Page=CustDetails&OrderNo=" + OrderNo + "&Customer=" + CustomerNo;
                                $(".imgLoaderForUser").show();
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/GetPage',
                                    data: '{ "controlName":"pages/PageOrderDetails.ascx","controlPara":"' + para + '" }',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output, status) {
                                        debugger
                                        $("#DivOrderSummaryDialog").css('display', 'none');
                                        $("#DivOrderDetailsDialog").css('disply', 'block');
                                        $("#DivOrderCallHSDialog").css('display', 'none');
                                        $('<div id="DivOrderDetailsDialog">/div>').dialog({
                                            title: '<div> ORDER UPDATE :: ' + OrderNo + '</div><div>' + IsVoidedInvoice + '</div>',
                                            autoOpen: false,
                                            resizable: false,
                                            modal: true,
                                            width: 1256,
                                            //height: 650,
                                            //closeOnEscape:false,
                                            beforeClose: function () {
                                                FuelUpdate(OrderNo)
                                                debugger
                                                if (IsOrderModifiedAndNotSaved == true && $("#OrderIsPrinted").html() == "1") {
                                                    $("<div id='IncompleteOrderAlertmsgbox1'><div style='margin-top: 20px;'> Please confirm the order again, it was printed already_2!!!! <div></div>").dialog({
                                                        autoOpen: false,
                                                        resizable: false,
                                                        modal: true,
                                                        buttons: {
                                                            Ok: function () {
                                                                $(this).dialog("close");
                                                            }
                                                        },
                                                        open: function () {
                                                            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
                                                            
                                                        },
                                                        close: function () {
                                                        }
                                                    });
                                                    $("#IncompleteOrderAlertmsgbox1").dialog('open')
                                                    return false;
                                                }
                                            },
                                            close: function (event, ui) {
                                                ClearLockedOrder(function (callback) {
                                                    if (callback == true) {
                                                        $("#DivOrderDetailsDialog").dialog('destroy').remove();
                                                        $("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
                                                        $("#txtInvSearch").val("");
                                                    }
                                                    $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                                                });
                                            },
                                            open: function () {
                                                //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                                                var OrderNo = $("#ctl00_DivOrderNo").html();
                                                var OrderHeaderHold = $("#fgrdOrderHeader #row" + OrderNo + "").find("td div").eq(10).html();
                                                //var OrderDetailsHold = $("#fgrdOrderDetails").parent(".bDiv").find("td div").eq(30).html()
                                                //var OrderHeaderHold = $("#fgrdOrderHeader").parent(".bDiv").find("td div").eq(31).html()
                                                if (OrderHeaderHold == "*Hold*") {
                                                    $("#btnOrderDetailsAdd").hide();
                                                    $("#btnOrderDetailsVDrop").hide();
                                                    $("#btnOrderDetailsConsol").hide();
                                                    $("#btnOrderDetailsFlip").hide();
                                                    //  $("#btnOrderDetailsSave").hide();

                                                }
                                                // 24 Mar 19 :: Muthu Nivetha M :: Sales person should able to edit hold tickets :: Starts
                                                //if ((OrderHeaderHold == "*Hold*") && ($("#ctl00_LoggedUserType").html() == "sales person")) {
                                                //    $("[id^=OrderDetailEdit_]").die("click").live("click", function () {
                                                //        $.MessageBox("You do not have rights to modify this order!!!");
                                                //        return false
                                                //    })
                                                //}
                                                // 24 Mar 19 :: Muthu Nivetha M :: Sales person should able to edit hold tickets :: Ends
                                                if ((OrderHeaderHold == "*Hold*") && ($("#ctl00_LoggedUserType").html() == "sales person")) {
                                                    $("[id^=OrderDetailDelete_]").die("click").live("click", function () {
                                                        $.MessageBox("You do not have rights to modify this order!!!");
                                                        return false
                                                    })
                                                }
                                                //if ((OrderHeaderHold != "*Hold*") && ($("#ctl00_LoggedUserType").html() == "sales person")) {
                                                //    $("#btnOrderDetailsVDrop").hide();
                                                //    $("#btnOrderDetailsFlip").hide();
                                                //}
                                            //    if ((OrderHeaderHold != "*Hold*") && ($("#ctl00_LoggedUserType").html() != "sales person")) {
                                            //        $("#btnOrderDetailsFlip").hide();
                                            //    }
                                            //    if ($("#ctl00_LoggedUserType").html() == "sales person") {
                                            //        $("#btnOrderDetailsVoid").hide();
                                            //    }
                                            },
                                            Cancel: function () {
                                                ClearLockedOrder(function (callback) {
                                                });
                                            },
                                        });
                                        $("#DivOrderDetailsDialog").data("Order", OrderNo).html(output.d).dialog("open");
                                    }
                                });
                            }
                            else if (data != "") {
                                var tmp = data.split("_")
                                $.MessageBox("This record has been locked by " + tmp[0].toString().toUpperCase() + " !");
                            }
                            else {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                        },

                    });
                }
            });


        }

        function ClearLockedOrder(callback) {

            if (LockedOrder.length > 0) { // this global variable  declared in dashboarduser page 
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteOrderLock',
                    data: "{ 'OrderNumber': '" + LockedOrder.join(",") + "' }",
                    contentType: "application/json; charset=utf-8",
                    async: false,
                    dataType: "json",
                    success: function (output, status) {
                        var data = output.d;
                        LockedOrder = [];  // this global variable  declared in dashboarduser page 
                        callback(true);
                    },

                });
            }
            else {
                callback(true);
            }
        }

        function FuelUpdate(OrderNo) {
            debugger
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/FuelUpdate',
                data: "{ 'OrderNumber': '" + OrderNo + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger
                    var data = output.d;
                    if (data == "error") {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                    }
                }
            });
        }


        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageARINVS.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivPageARINVS").html(output.d);
            }
        });


        $("[id^=EditInv_").die('click').live('click', function () {
            var InvoiceNo = $(this).attr('id').substring(8);
            var CustomerNo = $(this).attr("data-customer")
            if (InvoiceNo.slice(0, 1) != "*") {
                editorder(InvoiceNo, CustomerNo)
            }
            else {
                InvoiceNo = InvoiceNo.slice(1, 8)
                var IsVoidedInvoice = "";
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetOrderDateByrderNo',
                    data: '{"OrderNo":"' + $("#txtInvSearch").val().toString() + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        debugger;
                        var data = output.d.VOID;
                        IsVoidedInvoice = data.toString().toLowerCase() == "true" ? "VOIDED" : "";

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/CheckVETInvoice',
                            data: "{'Searchtext': '" + InvoiceNo + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                var out = result.d;
                                if (result.d.length >= 1) {
                                    debugger;
                                    LoadVETCustomerDetailsByCustNo(out[0].Customer, out[0].RecDate, "DivVETInvoiceGridDialog");
                                    $("#DivVETInvoiceNo").html(out[0].Invoice);
                                    //loadVETInvoiceGrid(splitstr[0]);
                                    $("#fgrdVETINVCustomer").empty();
                                    $("#fgrdVETINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: out[0].Invoice }], query: "", newp: 1 }).flexReload();

                                    $("#DivVETInvoiceGridDialog").dialog('option', 'title', '<div> VET Details :: ' + out[0].Invoice + '</div><div>' + IsVoidedInvoice + '</div>');
                                    //$("#DivVETInvoiceGridDialog").data('Invoice', out[0].Invoice).dialog("open");
                                    $("#DivVETInvoiceGridDialog").data("inData", { Invoice: out[0].Invoice, Customer: out[0].Customer }).dialog("open");
                                }
                            }
                        });
                    }
                });
            }
        });

        
        $("#btninventsave").die('click').live('click', function () {
            
            var Id = $("#ctl00_divinventid").html();
            var tableName = $("#ctl00_divtablename").html();            

            //var flowerssplit = $("#lstInventoryFlower")[0].value.split('~');
            var Flower = $("#hfInventoryFlower").val();
            if (Flower == "" || Flower == "0") {
                $('.YellowWarning').html("Please choose flower..");
                $('.YellowWarning').show();
                $("#txtInventoryFlower").focus();
                return false;
            }

            var FlowerCat = $("#DivInventoryFlowerCategory").html();
            var FlowerName = $("#DivInventoryFlowerName").html();

            var Invoice = $("#txtInventoryInvoice").val();
            if (Invoice == "")
                Invoice = $("#txtInventoryInvoice").attr("Placeholder")

            var PONumber = $("#txtInventoryPO").val();
            if (PONumber == "")
                PONumber = $("#txtInventoryPO").attr("Placeholder")

            var QtyRec = $("#txtQuantityReceived").val();
            if (QtyRec == "")
                QtyRec = $("#txtQuantityReceived").attr("Placeholder")
            if (QtyRec == "") {
                $(".YellowWarning").html("Please enter Quantity Received..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtQuantityReceived"));
                return false;
            }

            var QtySold = $("#txtQuantitySold").val();
            if (QtySold == "")
                QtySold = $("#txtQuantitySold").attr("Placeholder")
            if (QtySold == "") {
                $(".YellowWarning").html("Please enter Quantity Sold..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtQuantitySold"));
                return false;
            }

            var UOM = $("#lstInventoryUOM").val();
            if (UOM == 0) {
                $(".YellowWarning").html("Please Choose UOM..");
                $(".YellowWarning").show();
                ctrlFocus($("#lstUOM"));
                return false;
            }
            var Units = $("#txtInventoryUnitsPerBox").val();
            if (Units == "")
                Units = $("#txtInventoryUnitsPerBox").attr("Placeholder")
            if (Units == "") {
                $(".YellowWarning").html("Please enter Units..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtUnits"));
                return false;
            }

            var UnitsPerBunch = $("#txtInventoryUnitsPerBunch").val() == "" ? "0" : $("#txtInventoryUnitsPerBunch").val();
            if ($("#txtInventoryUnitsPerBunch").val() == "")
                UnitsPerBunch = $("#txtInventoryUnitsPerBunch").attr("Placeholder");


            var UnitsPerBox = $("#txtInventoryUnitsPerBox").val();
            if (UnitsPerBox == "")
                UnitsPerBox = $("#txtInventoryUnitsPerBox").attr("Placeholder")
            if (UnitsPerBox == "") {
                $(".YellowWarning").html("Please enter Units Per Box..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtUnitsPerBox"));
                return false;
            }

            var CostPerUnits = $("#txtInventoryCostPerUnit").val();
            if (CostPerUnits == "")
                CostPerUnits = $("#txtInventoryCostPerUnit").attr("Placeholder")
            if (CostPerUnits == "") {
                $(".YellowWarning").html("Please enter Cost Per Units..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtCostPerUnit"));
                return false;
            }

            debugger;
            var Type = $("#lstInventoryType").val();
            if (Type == "0") {
                $(".YellowWarning").html("Please enter type..");
                $(".YellowWarning").show();
                ctrlFocus($("#lstInventoryType"));
                return false;
            }

            var InvenType = $("#lstInventoryInvenType").val();
            if (InvenType == "0") {
                $(".YellowWarning").html("Please enter inventype..");
                $(".YellowWarning").show();
                ctrlFocus($("#lstInventoryInvenType"));
                return false;
            }

            var Comments = $("#txtInventoryComments").val();

            var CustNumber = $("#txtInventoryCustNo").val() == "" ? $("#txtInventoryCustNo").attr("Placeholder") : $("#txtInventoryCustNo").val();
            if (CustNumber == "") {
                CustNumber = 0
            }


            var OrderNumber = $("#txtInventoryOrderNo").val() == "" || $("#txtInventoryOrderNo").val() == undefined ? $("#txtInventoryOrderNo").attr("Placeholder") : $("#txtInventoryOrderNo").val();
            if (OrderNumber == "" || OrderNumber == undefined) {
                OrderNumber = 0;
            }
            var boxnumber = $("#txtInventoryBoxNumber").val() == "" ? $("#txtInventoryBoxNumber").attr("Placeholder") : $("#txtInventoryBoxNumber").val();

            var ColorCode = $("#DivInventoryFlowerColorCode").html();
            var warehouse = $("#lstWarehouse").val()

            var AWB = $("#txtInventoryAWB").val();
            var DateRec = $("#txtInventoryDateRec").val();
            //hfInventoryFarm
            debugger;
            var SelectedFarm = $("#hfInventoryFarm").val();
            if ($("#lstInventoryFarm").text() == "") {
                $(".YellowWarning").html("Please Choose Farm..");
                $(".YellowWarning").show();
                $("#lstInventoryFarm")[0].selectize.focus();
                return false;
            }
            var BreakDown = $("#txtInventoryBreakDown").val() == "" ? $("#txtInventoryBreakDown").attr("Placeholder") : $("#txtInventoryBreakDown").val();

            //Muthu Nivetha M :: 06Mar2020 :: Modified :: To save values of othercost,handling,duties/andean and landedcost for Edit Inventory email requirements
            var Othercost = 0, Handling = 0, Duties = 0, LandedCost = 0;
            Othercost = $("#txtInventoryOtherCostPerBox").val() == "" ? $("#txtInventoryOtherCostPerBox").attr("Placeholder") : $("#txtInventoryOtherCostPerBox").val();
            Handling = $("#txtInventoryHandling").val() == "" ? $("#txtInventoryHandling").attr("Placeholder") : $("#txtInventoryHandling").val();
            Duties = $("#txtInventoryDuties").val() == "" ? $("#txtInventoryDuties").attr("Placeholder") : $("#txtInventoryDuties").val();
            LandedCost = $("#txtInventorylandedcost").val() == "" ? $("#txtInventorylandedcost").attr("Placeholder") : $("#txtInventorylandedcost").val();


            var SellingPrice = $("#txtSellingPrice").val() == "" ? "0" : $("#txtSellingPrice").val();
            var BRAND = ($('#txtBrand').val() == "" || $('#txtBrand').val() == "0") ? $("#txtBrand").attr("Placeholder")  : $('#txtBrand').val();


            //debugger;
            if (tableName == "inven" || tableName == "invhist") {
                //STA::27-OCT-2015::to update the inventory(inven or invhist) details
                
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveInventoryDetails',
                    data: '{"ID":"' + Id + '","TableName":"' + tableName + '","Flower":"' + Flower + '","FlowerName":"' + FlowerName + '","FlowerCategory":"' + FlowerCat
                           + '","QtyRec":"' + QtyRec + '","QtySold":"' + QtySold + '","UOM":"' + UOM + '","UnitsPerBunch":"' + UnitsPerBunch + '","Units":"' + Units
                           + '","Cost":"' + CostPerUnits + '","InvenType":"' + InvenType + '","BoxNum":"' + boxnumber + '","OrderNum":"' + OrderNumber
                           + '","PO":"' + PONumber + '","Invoice":"' + Invoice + '","Cust":"' + CustNumber + '","Comments":"' + Comments + '","ColorCode":"' + ColorCode
                           + '","Type":"' + Type + '","warehouse":"' + warehouse + '","AWB":"' + AWB + '","DateRec":"' + DateRec + '","Farm":"' + SelectedFarm + '","BreakDown":"' + BreakDown + '","OtherCost":"'
                           + Othercost + '","Handling":"' + Handling + '","Duties":"' + Duties + '","LandedCost":"' + LandedCost + '","SellingPrice":"' + SellingPrice + '","BRAND":"' + BRAND + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {                        
                        if (output.d == "logout") {
                            window.location.href = "Login.aspx";
                        }
                        else if (output.d == "success") {
                            if (typeof DefInventoryDetailsByFARM === 'undefined') {
                                DefInventoryDetailsByFARM=""
                            }

                            //2021/08/11, stop refresh
                            //$("#fgrdInventoryHeader").flexReload({ url: '/url/for/refresh' });
							//$("#fgrdInventoryDetailbyFARM").empty();
							//$("#fgrdInventoryDetailbyFARM").flexOptions({ params: [{ name: 'Filter', value: DefInventoryDetailsByFARM }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();

                            $("#EditInventoryPODetails").dialog("close");
							$("#DivInventoryFlowerCategory").html("");

                        }
                        else {
                            $(".Warning").show();
                        }
                    }
                });
            }
            else {
                //STA::27-OCT-2015::to update the Inventory user details
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateInventoryUserDetails',
                    data: '{"AWB":"' + $("#InventoryAWB").html() + '","TableName":"' + $("#InventoryUserTableName").html() + '","Flower":"' + Flower + '","FlowerName":"' + FlowerName + '","FlowerCategory":"' + FlowerCat
                           + '","QtyRec":"' + QtyRec + '","QtySold":"' + QtySold + '","UOM":"' + UOM + '","UnitsPerBunch":"' + UnitsPerBunch + '","Units":"' + Units
                           + '","Cost":"' + CostPerUnits + '","InvenType":"' + InvenType + '","BoxNum":"' + boxnumber + '","OrderNum":"' + OrderNumber
                           + '","PO":"' + PONumber + '","Invoice":"' + Invoice + '","Cust":"' + CustNumber + '","Comments":"' + Comments
                           + '","Farm":"' + $("#InventoryFarm").html() + '","ColorCode":"' + ColorCode + '","Type":"' + Type + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == "success") {
                            debugger;
                            $("#InventoryFarm").html("");

                            $("#fgrdInventoryUsersHeaders").flexReload({ url: '/url/for/refresh' });

                            $("#EditInventoryPODetails").dialog("close");
                            $("#DivInventoryFlowerCategory").html("");
                            $("#InventoryUserTableName").html("");
                            $("#InventoryAWB").html("");

                            $('.YellowWarning').hide();
                        }
                        else {
                            $(".Warning").show();
                        }
                    }
                });
            }

        });

        $("#btncancel").die('click').live('click', function () {
            debugger
            $("#EditInventoryPODetails").dialog("close");
            $("#InventoryFarm").html("");
            $("#DivInventoryFlowerCategory").html("");
            $("#InventoryUserTableName").html("");
            $("#InventoryAWB").html("");

            $('.YellowWarning').hide();
            ClearLockedInventoryOnEdit(function (callback) {
            });

        });

        $("#txtInventoryDateRec").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true
        }).datepicker("setDate", new Date());

    });

    var EditInvenUserDetailClickedcompleted = true;
    function inventedit(Id, tableName) {
        debugger;
        $('.YellowWarning').html("");
        $('.YellowWarning').hide();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetInventoryById',
            data: '{"ID":"' + Id + '","TableName":"' + tableName + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output1) {
                debugger;
                EditInvenUserDetailClickedcompleted = false;
                var InvenDetailData = output1.d;
                var InvenFlowerCode = InvenDetailData.ProductCode;
                var InvenFarmCode = InvenDetailData.Farm;
                //$("#txtInventoryFlowerDesc").val(InvenDetailData.ProductName);

                //J1_10($("#lstInventoryFarm")).selectize()[0].selectize.setValue($("#hfInventoryFarm").val().trim());
				LoadInventoryUOM(InvenFarmCode);
                $("#txtInventoryInvoice").val("");
                $("#txtInventoryInvoice").attr("Placeholder", InvenDetailData.Invoice);
                $("#txtInventoryPO").val("");
                $("#txtInventoryPO").attr("Placeholder", InvenDetailData.PO);
                $("#txtQuantityReceived").val("");
                $("#txtQuantityReceived").attr("Placeholder", InvenDetailData.CSREC);
                $("#txtQuantitySold").val("");
                $("#txtQuantitySold").attr("Placeholder", InvenDetailData.CSSOLD);
                $("#hfInventoryUOM").val(InvenDetailData.UOM);
                $("#DivInventoryFlowerColorCode").html(InvenDetailData.FlowerDetails.ColorCode);
                debugger;                

                $("#txtInventoryUnits").val("");
                $("#txtInventoryUnits").attr("Placeholder", InvenDetailData.TotalUnits);
                $("#txtInventoryUnitsPerBunch").val("");
                $("#txtInventoryUnitsPerBunch").attr("Placeholder", InvenDetailData.UnitsBunch);
                $("#txtInventoryUnitsPerBox").val("");
                $("#txtInventoryUnitsPerBox").attr("Placeholder", InvenDetailData.Units);
                debugger;
                $("#txtInventoryCostPerUnit").val("");
                $("#txtInventoryCostPerUnit").attr("Placeholder", parseFloat(InvenDetailData.Cost).toFixed(4));
                //$("#txtInventoryType").val(InvenDetailData.Type);
                //$("#txtInventoryType").attr("Placeholder", InvenDetailData.InvenType);
                $("#txtInventoryComments").val(InvenDetailData.Comments);
                $("#txtInventoryCustNo").val("");
                $("#txtInventoryCustNo").attr("Placeholder", InvenDetailData.CustNum);
                $("#txtInventoryOrderNo").val("");
                $("#txtInventoryOrderNo").attr("Placeholder", InvenDetailData.OrderNumber);
                //$("#txtInventoryBoxNumber").attr("disabled", true);
                $("#txtInventoryBoxNumber").val("");
                $("#txtInventoryBoxNumber").attr("Placeholder", InvenDetailData.BoxNumber);

                $("#txtInventoryBreakDown").val("");
                $("#txtInventoryBreakDown").attr("Placeholder", InvenDetailData.Message1);

                $("#txtSellingPrice").val("");
                $("#txtSellingPrice").attr("Placeholder", parseFloat(InvenDetailData.Price).toFixed(4));

                $("#txtBrand").val("");
                $("#txtBrand").attr("Placeholder", InvenDetailData.BRAND);

                debugger;
                $("#DivInventoryFlowerCategory").html(InvenDetailData.ProductCategory);
                $("#DivInventoryFlowerName").html(InvenDetailData.ProductName);
                $("#txtInventoryUnitsPerBunch").trigger('change');
                //$("#hfInventoryFlower").val(InvenDetailData.ProductCode.trim() + '~' + InvenDetailData.ProductName.trim() + '~' + InvenDetailData.ProductCategory.trim() + '~' + InvenDetailData.FlowerDetails.ColorCode.trim());
                if (InvenDetailData.ProductCode == null) {
                    $("#hfInventoryFlower").val("");
                }
                else {
                    $("#hfInventoryFlower").val(InvenDetailData.ProductCode.trim());
                }

                $("#txtInventoryFlower").val("");
                $("#txtInventoryFlower").attr("Placeholder", "[" + InvenDetailData.ProductCode.trim() + "] " + InvenDetailData.ProductName.trim());

                $("#lblINVEN_SPORDID").html(InvenDetailData.SPORDID);
                $("#lblINVEN_ID").html(InvenDetailData.ID);

                //from Email :: ANITHA :: INVENTORY :: add new table for Type in SQL
                $("#hfInventoryType").val(InvenDetailData.Type);

                LoadInventoryType();
                //from Email :: ANITHA :: INVENTORY :: add new table for InvenType in SQL
                $("#hfInventoryInvenType").val(InvenDetailData.InvenType);
                $("#hfInventoryWarehouse").val(InvenDetailData.WH);
                LoadInventoryInvenType();


                LoadWarehouse()
                LoadFarmCode();

                $("#txtInventoryAWB").val(InvenDetailData.AWB);
                $("#txtInventoryDateRec").val(InvenDetailData.DateRecEdit.replace("-", "/").replace("-", "/"));
                //var date = dateTimeFormat(InvenDetailData.DateRec);
                //$("#txtInventoryDateRec").val(date);

                //$("#DivInventoryPODetails").dialog("open");
                //$("#DivInventoryPODetails").dialog('option', 'title', "InventoryEdit Detail :: " + ($("#lblchoosenInventoryAWB").html().replace(/-/g, '') + "-" + InvenFarmCode + "-" + InvenFlowerCode));
                $("#hfInventoryFarm").val(InvenDetailData.Farm);

                //Edit Inventory :: 04Mar2020
                debugger;
                
                $("#txtInventoryOtherCostPerBox").val("");
                $("#txtInventoryOtherCostPerBox").attr("Placeholder", parseFloat(InvenDetailData.OtherCost).toFixed(3));
                $("#txtInventoryHandling").val("");
                $("#txtInventoryHandling").attr("Placeholder", parseFloat(InvenDetailData.Handling).toFixed(4));
                $("#txtInventoryDuties").val("");
                $("#txtInventoryDuties").attr("Placeholder", parseFloat(InvenDetailData.Andean).toFixed(4));
                $("#txtInventorylandedcost").val("");
                $("#txtInventorylandedcost").attr("Placeholder", parseFloat(InvenDetailData.LandedCost).toFixed(4));
                $("#lstInventoryFarm").focus();
                
                EditInvenUserDetailClickedcompleted = true;
            }
        });
    }

    function dateTimeFormat(dateTimeValue) {
        var dt = new Date(parseInt(dateTimeValue.replace(/(^.*\()|([+-].*$)/g, '')));
        var dateTimeFormat = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear();
        return dateTimeFormat;
    }

    function LoadControlsOnDetailDialog() {
        LoadFarmCode(function (callback1) {
            if (callback1 == true) {
                loadingdropdownonDetailsDialogCompleted = true;
            }
        });
    }

    $(window).on('beforeunload', function () {
        ClearLockedInventoryOnEdit(function (callback) {
        });
    });

    function ClearLockedInventoryOnEdit(callback) {
        debugger;
        if (LockedInventoryOnEdit.length > 0) { // this global variable  declared in dashboarduser page 
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteLock',
                data: "{ 'LockRecord': '" + LockedInventoryOnEdit.join(",") + "','Page':'PageInventory','Functionality':'InvenLockRelease'}",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    var data = output.d;
                    LockedInventoryOnEdit = [];  // this global variable  declared in dashboarduser page 
                    callback(true);
                },

            });
        }
        else {
            callback(true);
        }
    }

    function LoadFarmCode() {
        debugger;
        //var length = $('#lstInventoryFarm > option').length;
        var LoginUserID = $("#ctl00_LoggedInUserID_InvenUser").html();
        //if (length <= 0) {

        $(".YellowWarningDetail").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
        $(".YellowWarningDetail").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUserFarmCode',
            data: "{'UserID':'" + LoginUserID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $('#lstInventoryFarm').empty();
                var data = output.d;
                for (var i in data) {
                    var farm = data[i];
                    if (farm.Farm != "") {

                        if (farm.FOB == "Y") {
                            farm.FOB = 'F';
                        }
                        else if (farm.FOB = "N") {
                            farm.FOB = 'C';
                        }

                        $('#lstInventoryFarm').append('<option data-Inventype="' + farm.FOB + '"  value="' + farm.Farm + '">[' + farm.Farm + '] ' + farm.Name + '</option>');
                    }
                }
                debugger;
                J1_10($("#lstInventoryFarm")).selectize({
                    allowEmptyOption: false,
                    create: false,
                    valueField: 'id',
                    valueField: 'name',
                    onInitialize: function () {
                        var s = this;
                        this.revertSettings.$children.each(function () {
                            $.extend(s.options[this.value], $(this).data());
                        });
                    },
                    onChange: function (value) {
                        debugger;
                        var Farm=""
                        if (value != "") {
                            var option = this.options[value]
                            //alert(option.inventype)
                            $("#lstInventoryInvenType").val(option.inventype);                            
                        }
                        if (EditInvenUserDetailClickedcompleted == true) {
                            if (value != "") {
                                var option = this.options[value]
                                Farm = option.name;
                            }
                            else {
                                Farm = $("#lstInventoryInvenType")[0].value
                            }                            
                            $("#lstInventoryUOM").empty();
                            LoadInventoryUOM(Farm);
                            $("#hfInventoryFarm").val(Farm);
                            try {                                
                                $("#lstWarehouse").focus();
                            }
                            catch (er) {

                            }
                        }
                    }
                });
                J1_10($("#lstInventoryFarm")).selectize()[0].selectize.setValue($("#hfInventoryFarm").val().trim());
                $("#imgFlowerAutocompleteLoader").css("display", "none");
                $(".YellowWarningDetail").hide();
                // callback(true)
            },
        });
        //}
        //else {
        //    J1_10($("#lstInventoryFarm")).selectize()[0].selectize.setValue($("#hfInventoryUsersFarm").val().trim());
        //    //callback(true)
        //}
    }

    function LoadInventoryType() {
        var length = $('#lstInventoryType > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetTypeForInventory',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstInventoryType').empty();
                    var Typedata = output.d;
                    $('#lstInventoryType').append('<option value="0">Select</option>');
                    for (var i in Typedata) {
                        var Type = Typedata[i];
                        $('#lstInventoryType').append('<option value="' + Type.Code + '">' + Type.Code + ' - ' + Type.Name + '</option>');
                    }
                    if ($("#hfInventoryType").val() != "" && $("#hfInventoryType").val() != 0)
                        $('#lstInventoryType').val($("#hfInventoryType").val());
                    else
                        $("#lstInventoryType").val("0");
                }
            });
        }
        else {
            $('#lstInventoryType').val($("#hfInventoryType").val());
        }
    }

    function LoadInventoryInvenType() {
        var length = $('#lstInventoryInvenType > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetInvenTypeForInventory',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstInventoryInvenType').empty();
                    var InvenTypedata = output.d;
                    $('#lstInventoryInvenType').append('<option value="0">Select</option>');
                    for (var i in InvenTypedata) {
                        var InvenType = InvenTypedata[i];
                        $('#lstInventoryInvenType').append('<option value="' + InvenType.Code + '">' + InvenType.Code + ' - ' + InvenType.Name + '</option>');
                    }
                    if ($("#hfInventoryInvenType").val() != "" && $("#hfInventoryInvenType").val() != 0)
                        $('#lstInventoryInvenType').val($("#hfInventoryInvenType").val());
                    else
                        $("#lstInventoryInvenType").val("0");
                }
            });
        }
        else {
            $('#lstInventoryInvenType').val($("#hfInventoryInvenType").val());
        }
    }


    function LoadWarehouse() {
        var length = $('#lstWarehouse > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetWarehouseList',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    $('#lstWarehouse').empty();
                    var warehouse = output.d;
                    $('#lstWarehouse').append('<option value="0">Select</option>');
                    for (var i in warehouse) {
                        var wh = warehouse[i];
                        $('#lstWarehouse').append('<option value="' + wh.WH + '">' + wh.WH + ' - ' + wh.Name + '</option>');
                    }

                    $('#lstWarehouse').val($("#hfInventoryWarehouse").val());

                }
            });
        }
        else {
            $('#lstWarehouse').val($("#hfInventoryWarehouse").val());
        }
    }
    function LoadInventoryUOM(FarmCode) {
        var length = $('#lstInventoryUOM > option').length;
        //var farmcode = $("#hfInventoryFarm").val();
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForManualPOByFarm',
                data: '{"FarmCode":"' + FarmCode.toUpperCase() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstInventoryUOM').empty();
                    var UOMdata = output.d;
                    $('#lstInventoryUOM').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstInventoryUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM +' [' + UOM.SIZE +']'+'</option>');
                    }
                    if ($("#hfInventoryUOM").val() != "" && $("#hfInventoryUOM").val() != 0)
                        $('#lstInventoryUOM').val($("#hfInventoryUOM").val());
                    else
                        $("#lstInventoryUOM").val("QB");
                }
            });
        }
        else {
            $('#lstInventoryUOM').val($("#hfInventoryUOM").val());
        }
    }



    $("#txtInventoryFlower").autocomplete({
        source: function (request, response) {

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoComplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (flr) {
                        return {
                            label: "[" + flr.Flower.trim() + "] " + flr.Name,
                            Flower: flr.Flower,
                            Name: flr.Name,
                            CAT: flr.CAT,
                            Bunch: flr.BUNCH,
                            ColorCode: flr.ColorCode
                        }
                    }))
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        },
        open: function (event, ui) {

        },
        select: function (e, i) {
            debugger;
            $("#txtInventoryFlower").attr("placeholder", "");
            $("#txtInventoryFlower").val("[" + i.item.Flower.trim() + "] " + i.item.Name);


            $("#hfInventoryFlower").val(i.item.Flower.trim());
            $("#txtInventoryUnitsPerBunch").val(i.item.Bunch)
            $("#DivInventoryFlowerCategory").html(i.item.CAT.trim());
            $("#DivInventoryFlowerColorCode").html(i.item.ColorCode);
            $("#DivInventoryFlowerName").html(i.item.Name);
			$("#txtInventoryUnitsPerBox").html(i.item.Units);
            //  $("#txtUnitsPerBunch").val(flowerssplit[3]);
            $("#txtQuantityReceived").focus();

        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                $("#txtInventoryFlower").val("");
                $("#DivInventoryFlowerName").html("");
                $("#hfInventoryFlower").val("0");
                $("#txtInventoryFlower").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    $('input').keypress(function (e) {

        var key = e.which;
        if (key == 13) // the enter key code
        {
            debugger;
            for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {

                debugger;
                var a;
                if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                    a = i;
                }

                if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i && $(this).closest('tr').find('input')[i].disabled != true &&
                $(this).closest('tr').find('input')[i].type != "hidden" && $(this).attr('id') != "txtQuantityReceived") {
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtQuantityReceived") {
                    $("#lstInventoryUOM").focus()
                    return false;
                }
                else if ($(this).attr('id') == "lstInventoryUOM") {
                    $("#txtInventoryUnitsPerBunch").focus()
                    return false;
                }


                else if ($(this).attr('id') == "txtInventoryUnitsPerBunch") {
                    $("#txtInventoryUnitsPerBox").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtInventoryUnitsPerBox") {
                    $("#txtQuantitySold").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtQuantitySold") {
                    $("#txtInventoryCostPerUnit").focus();
                    return false;
                }

                else if ($(this).attr('id') == "txtInventoryCostPerUnit") {
                    $("#lstInventoryType").focus();
                    return false;
                }

                else if ($(this).attr('id') == "lstInventoryType") {
                    $("#lstInventoryInvenType").focus();
                    return false;
                }

                else if ($(this).attr('id') == "lstInventoryInvenType") {
                    $("#lstWarehouse").focus();
                    return false;
                }
                else if (i == $(this).closest('tr').find('input').length - 1 && $(this).attr('id') != 'btndateok') {
                    if ($(this).closest('tr').next('tr').find('input').length > 0) {

                        if ($(this).closest('tr').next('tr').find('input')[0].id != "txtInventoryBoxNumber")
                            $(this).closest('tr').next('tr').find('input')[0].focus();
                        else if ($(this).closest('tr').next('tr').find('input')[0].id == "txtInventoryBoxNumber") {
                            $("#txtInventoryOrderNo").focus()
                            return false;
                        }
                    }
                    else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0)
                        $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();
                    //else if ($(this).attr('id') == "txtInventoryComments" || $(this).attr('id') == "txtagency" || $(this).attr('id') == "txtInvNewCost")
                    //    $(this).closest('div').next('div').find('button')[1].focus()

                    return false;
                }
                else if ($(this).attr('id') == "txtInventoryComments") {
                    $("#txtInventoryAWB").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtInventoryAWB") {
                    $("#txtInventoryDateRec").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtInventoryDateRec") {
                    $("#txtInventoryBreakDown").focus();
                    return false;
                }
                else if ($(this).attr('id') == "txtInventoryBreakDown") {
                    debugger;
                    $(this).closest('div').next('div').find('button')[1].focus()
                    return false;
                }
            }
        }
    });

    $("#lstInventoryUOM").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            $("#txtInventoryUnitsPerBunch").focus();
            return false;
        }
    });

    $("#lstInventoryType").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            $("#lstInventoryInvenType").focus();
            return false;
        }
    });

    $("#lstInventoryInvenType").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            $("#txtInventoryOrderNo").focus();
            return false;
        }
    });
    $("#lstInventoryInvenType").change(function (event) {
        event.preventDefault();
        if ($(this).val() == "D") {
            $("#txtInventoryOtherCostPerBox").val(0);
            $("#txtInventoryDuties").val(0);
            $("#txtInventoryHandling").val(0);
            CalculateFBE();
            FreightAndHandling();
            CalculateDuty();
            calculatelandedcost();
        }
    });

    $("#lstWarehouse").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {            
            $("#txtInventoryFlower").focus();
            return false;
        }
    });

    
    $("#txtInventoryBreakDown").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            $("#btninventsave").focus();
            return false;
        }
    });

    $("#txtQuantityReceived").change(function (event) {

        var QuantityVal = $("#txtQuantityReceived").val() == "" ? $("#txtQuantityReceived").attr("Placeholder") : $("#txtQuantityReceived").val();
        var CostVal = $("#txtInventoryUnitsPerBox").val() == "" ? $("#txtInventoryUnitsPerBox").attr("Placeholder") : $("#txtInventoryUnitsPerBox").val();
        if (QuantityVal != "" && CostVal != "")
            $("#txtInventoryUnits").val(QuantityVal * CostVal);

    });

    $("#txtInventoryUnitsPerBox").change(function (event) {

        var QuantityVal = $("#txtQuantityReceived").val() == "" ? $("#txtQuantityReceived").attr("Placeholder") : $("#txtQuantityReceived").val();
        var CostVal = $("#txtInventoryUnitsPerBox").val() == "" ? $("#txtInventoryUnitsPerBox").attr("Placeholder") : $("#txtInventoryUnitsPerBox").val();
        if (QuantityVal != "" && CostVal != "")
            $("#txtInventoryUnits").val(QuantityVal * CostVal);

    });

    $("#DivSalesDetails").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 576,
        height: 480,
        modal: true
    });

      $("#btninventsales").die('click').live('click', function () {
          var farmno = $("#hfInventoryFarm").val();
          var Boxno = $("#txtInventoryBoxNumber").val() == "" ? $("#txtInventoryBoxNumber").attr("Placeholder") : $("#txtInventoryBoxNumber").val();
        $("#DivSalesDetails").dialog('option', 'title', 'Sales List :: ' + farmno.toUpperCase() + "-" + Boxno);
        $("#DivSalesDetails").dialog("open");

        $("#fgrdSalesListDetails").flexOptions({ params: [{ name: 'IDINVEN', value: $("#lblINVEN_ID").html() }], query: "", newp: 1 }).flexReload();
        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetSalesbyIDINVEN',
        //    data: '{"IDINVEN":"' + $("#ctl00_divinventid").html() + '"}',
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output) {
        //        debugger;
        //        if (output.d == "LogOut") {
        //            window.location.href = "Login.aspx";
        //        }
        //        else if (output.d.indexOf("error") >= 0) {
        //            $("#msgbox-select").dialog("close");
        //            $.MessageBox(output.d.substring(5, output.d.length));
        //        }
        //        else if (output.d == "No Data") {
        //            $.MessageBox("No data selected!");
        //            w.close();
        //        }
        //        else {
        //            debugger;

        //        }
        //    }
        //});
    });

    //Muthu Nivetha M :: 16 Mar 19 :: Print Label on look up by boxnumber results screen
    //25 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen :: Starts
    $("#btninventprint").die('click').live('click', function () {
        debugger;
        $('.YellowWarning').html('');                 //22 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen
        var farmcode = $("#hfInventoryFarm").val();
        if (farmcode == "") {
            $('.YellowWarning').html("The Current user does not have rights to access this <span style='text-decoration: bold'>FARM</span>");
            $('.YellowWarning').show();

            return false;
        }
        var Boxno = $("#txtInventoryBoxNumber").val() == "" ? $("#txtInventoryBoxNumber").attr("Placeholder") : $("#txtInventoryBoxNumber").val();
        var AWB = $("#txtInventoryAWB").val() == "" ? $("#txtInventoryAWB").attr("Placeholder") : $("#txtInventoryAWB").val();
        var flower = $("#hfInventoryFlower").val();
        var daterec = $("#txtInventoryDateRec").val() == "" ? $("#txtInventoryDateRec").attr("Placeholder") : $("#txtInventoryDateRec").val();
        var receivedpieces = $("#txtQuantityReceived").val() == "" ? $("#txtQuantityReceived").attr("Placeholder") : $("#txtQuantityReceived").val();
        // var tablename = "inven";
        debugger;
        if (Boxno == "" || Boxno == "0" || Boxno == 0) {
            $('.YellowWarning').html("BoxNo cannot be empty Or BoxNo cannot be 0");
            $('.YellowWarning').show();
            $("#txtInventoryBoxNumber").focus();
            return false;
        }
        var tableName = $("#ctl00_divtablename").html();
        PrintInventoryLabelByFarmAndBoxNo(AWB, farmcode, flower, daterec, Boxno, tableName, ReceivedPiecesOnly)
        //$('.YellowWarning').html("Printing process started for FARM: <span style='text-decoration: bold'>" + farmno + "</span> and BoxNo: <span style='text-decoration: bold'>" + Boxno + "</span>");
        //$('.YellowWarning').show();
        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetOrdersByFarmandBoxnum',
        //    data: "{ 'Farm': '" + farmno + "', 'BoxNum': '" + Boxno + "'}",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success:function(output,status)
        //    {
        //        debugger;
        //        if (output.d == "No records to Print")        //21 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen
        //        {
        //            $('.YellowWarning').html("No records to Print for FARM: <span style='text-decoration: bold'>" + farmno + "</span> and BoxNo: <span style='text-decoration: bold'>" + Boxno + "</span>");
        //            $('.YellowWarning').show();
        //        }
        //        else
        //            //22 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen :: Starts
        //            $('.YellowWarning').html("Printed successfully for FARM: <span style='text-decoration: bold'>" + farmno + "</span> and BoxNo: <span style='text-decoration: bold'>" + Boxno + "</span>");
        //            $('.YellowWarning').hide();
        //            $("#EditInventoryPODetails").dialog("close");
        //            $("#DivInventoryFlowerCategory").html("");
        //        //22 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen :: Ends

          //    },
          //    error:function()
          //    {
          //        debugger;
          //        $('.YellowWarning').html("Error on printing FARM: <span style='text-decoration: bold'>" + farmno + "</span> and BoxNo: <span style='text-decoration: bold'>" + Boxno + "</span>");
          //        $('.YellowWarning').show();
          //    }
          //})
      });


    
      function PrintInventoryLabelByFarmAndBoxNo(AWB, Farm, Flower, DateRec, Boxnumber, TableName, ReceivedPiecesOnly) {
          debugger;
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInventoryLabel',
            data: "{'AWB':'" + AWB + "','Farm':'" + Farm + "','Flower':'" + Flower + "','DateRec':'" + DateRec
                    + "','BoxNum':'" + Boxnumber + "','TableName':'" + TableName + "','ReceivedPiecesOnly':'" + ReceivedPiecesOnly + "','AWBFlag':'" + AWBFlag + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
                else {
                    path = output.d;
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                    $("#EditInventoryPODetails").dialog("close");
                }
            }
        });
      }
    //25 Mar 19 :: Muthu Nivetha M :: Print Label on look up by boxnumber results screen :: Ends

    // Muthu Nivetha M :: 05Mar2020 :: Modified :: To calc landedcost on txtInventoryCostPerUnit focusout
    $("#txtInventoryCostPerUnit").focusout().live('focusout', function () {
        debugger;
        var sourceCtl = $(this);
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost(function (callback) { });
    });

    // Muthu Nivetha M :: 05Mar2020 :: Modified :: To calc landedcost on txtInventoryCostPerUnit focusout
    $("#txtInventoryUnitsPerBox").focusout().live('focusout', function () {
        debugger;
        var sourceCtl = $(this);
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost(function (callback) { });
    });

    // Muthu Nivetha M :: 05Mar2020 :: Modified :: To calc landedcost on txtInventoryCostPerUnit focusout
    $("#txtInventoryOtherCostPerBox").focusout().live('focusout', function () {
        debugger;
        var sourceCtl = $(this);
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost(function (callback) { });
    });

    // Muthu Nivetha M :: 05Mar2020 :: Modified :: To calc landedcost on txtInventoryCostPerUnit focusout
    $("#txtInventoryDuties").focusout().live('focusout', function () {
        debugger;
        var sourceCtl = $(this);
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost(function (callback) { });
    });

    // Muthu Nivetha M :: 05Mar2020 :: Modified :: To calc landedcost on txtInventoryCostPerUnit focusout
    $("#txtInventoryHandling").focusout().live('focusout', function () {
        debugger;
        var sourceCtl = $(this);
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost(function (callback) { });
    });

    //function calculatelandedcost() {        

    //    var tmpcost = parseFloat("0"), tmpothrcost = parseFloat("0"), tmpunits = parseInt("0"), tmphandling = parseFloat("0"), tmpduties = parseFloat("0"), tmplndcst = parseFloat("0");

    //    tmpcost = ((($("#txtInventoryCostPerUnit").val() == "")) ? ($("#txtInventoryCostPerUnit").attr('placeholder')) : $("#txtInventoryCostPerUnit").val());
    //    tmpothrcost = ((($("#txtInventoryOtherCostPerBox").val() == "")) ? ($("#txtInventoryOtherCostPerBox").attr('placeholder')) : $("#txtInventoryOtherCostPerBox").val());
    //    tmpunits = ((($("#txtInventoryUnitsPerBox").val() == "")) ? ($("#txtInventoryUnitsPerBox").attr('placeholder')) : $("#txtInventoryUnitsPerBox").val());
    //    tmphandling = ((($("#txtInventoryHandling").val() == "")) ? ($("#txtInventoryHandling").attr('placeholder')) : $("#txtInventoryHandling").val());
    //    tmpduties = ((($("#txtInventoryDuties").val() == "")) ? ($("#txtInventoryDuties").attr('placeholder')) : $("#txtInventoryDuties").val());

    //    //cost+othercost/units+handling+duties
    //    var tmpothrcostresult = ((parseFloat(tmpothrcost)) / (parseInt(tmpunits)));
    //    var tmphandlingresult = ((parseFloat(tmphandling)) / (parseInt(tmpunits)));
    //    tmplndcst = ((parseFloat(tmpcost)) + (parseFloat(tmpothrcostresult)) + (parseFloat(tmphandlingresult)) + (parseFloat(tmpduties)));
    //    $("#txtInventorylandedcost").val("");
    //    $("#txtInventorylandedcost").attr("Placeholder", parseFloat(tmplndcst).toFixed(4));
    //}

    function calculatelandedcost(callback) 
    {        
        var tmpcost = parseFloat("0"), tmpothrcost = parseFloat("0"), tmpunits = parseInt("0"), tmphandling = parseFloat("0"), tmpduties = parseFloat("0"), tmplndcst = parseFloat("0");

        tmpcost = ((($("#txtInventoryCostPerUnit").val() == "")) ? ($("#txtInventoryCostPerUnit").attr('placeholder')) : $("#txtInventoryCostPerUnit").val());
        tmpothrcost = ((($("#txtInventoryOtherCostPerBox").val() == "")) ? ($("#txtInventoryOtherCostPerBox").attr('placeholder')) : $("#txtInventoryOtherCostPerBox").val());
        tmpunits = ((($("#txtInventoryUnitsPerBox").val() == "")) ? ($("#txtInventoryUnitsPerBox").attr('placeholder')) : $("#txtInventoryUnitsPerBox").val());
        tmphandling = ((($("#txtInventoryHandling").val() == "")) ? ($("#txtInventoryHandling").attr('placeholder')) : $("#txtInventoryHandling").val());
        tmpduties = ((($("#txtInventoryDuties").val() == "")) ? ($("#txtInventoryDuties").attr('placeholder')) : $("#txtInventoryDuties").val());
        
        tmpcost = ((tmpcost == null || tmpcost == "undefined" || tmpcost == "NaN") ? parseFloat("0") : tmpcost);
        tmpothrcost = ((tmpothrcost == null || tmpothrcost == "undefined" || tmpothrcost == "NaN") ? parseFloat("0") : tmpothrcost);
        tmpunits = ((tmpunits == null || tmpunits == "undefined" || tmpunits == "NaN") ? parseFloat("0") : tmpunits);
        tmphandling = ((tmphandling == null || tmphandling == "undefined" || tmphandling == "NaN") ? parseFloat("0") : tmphandling);
        tmpduties = ((tmpduties == null || tmpduties == "undefined" || tmpduties == "NaN") ? parseFloat("0") : tmpduties);

        //cost+othercost/units+handling+duties
        var tmpothrcostresult = ((parseFloat(tmpothrcost)) / (parseInt(tmpunits)));
        var tmphandlingresult = ((parseFloat(tmphandling)) / (parseInt(tmpunits)));
        
        tmplndcst = ((parseFloat(tmpcost)) + (parseFloat(tmpothrcostresult)) + (parseFloat(tmphandlingresult)) + (parseFloat(tmpduties)));
        tmplndcst = ((tmplndcst == null || tmplndcst == undefined || tmplndcst == "NaN") ? parseFloat("0") : tmplndcst);
        $("#txtInventorylandedcost").val("");
        $("#txtInventorylandedcost").attr("Placeholder", parseFloat(tmplndcst).toFixed(4));
        callback(true);
    }

    function FreightAndHandling() {
        var Farm = "";
        var FBE = "";
        var WH = "";
        Farm = $("#hfInventoryFarm").val().trim();
        FBE = $("#hfInventoryFBE").val();
        WH = $("#lstWarehouse").val();
        var Flower = "";
        Flower = $("txtInventoryUsersFlower").val();       
        if (Farm != "" && WH != "" && Flower != "") {
            $.ajax({
                async: false,
                type: "POST",
                url: 'BloomService.asmx/GetFreightByFarmAndHandlingByWarehouse',
                data: '{"Farm":"' + Farm + '","Warehouse":"' + WH + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var result = output.d.split("~");
                    var FreightAmount = result[0];
                    var HandlingCharge = result[1];
                    var FreightAmt = 0, HandlingAmt = 0;

                    FreightAmt = (parseFloat(FreightAmount) * parseFloat(FBE));
                    FreightAmt = ((FreightAmt == null || FreightAmt == "undefined" || FreightAmt == "NaN") ? parseFloat("0") : FreightAmt);

                    HandlingAmt = (parseFloat(HandlingCharge) * parseFloat(FBE));
                    HandlingAmt = ((HandlingAmt == null || HandlingAmt == "undefined" || HandlingAmt == "NaN") ? parseFloat("0") : HandlingAmt);
                    if (FreightAmt != "NaN" && $("#txtInventoryOtherCostPerBox").val() == "") {
                        $("#txtInventoryOtherCostPerBox").val(FreightAmt.toFixed(3));
                    }
                    if (HandlingAmt != "NaN" && $("#txtInventoryHandling").val() == "") {
                         $("#txtInventoryHandling").val(HandlingAmt.toFixed(4));
                    }                    
                }
            });
        }
    }

    function CalculateDuty() {
        var Flower = "";
        var Farm = "";
        var Cost = "";
        Flower = $("#hfInventoryFlower").val();
        Farm = $("#hfInventoryFarm").val();//J1_10($("#lstInventoryUsersFarm")).selectize()[0].selectize.setValue($("#hfInventoryUsersFarm").val().trim());
        Cost = $("#txtInventoryCostPerUnit").val();
        if (Cost == "")
            Cost = $("#txtInventoryCostPerUnit").attr("Placeholder");      
        if (Flower != "" && Farm != "" && Cost != "") {
            $.ajax({
                async: false,
                type: "POST",
                url: 'BloomService.asmx/GetDutyPerUnitByFarm',
                data: '{"Flower":"' + Flower + '","Farm":"' + Farm + '","Cost":"' + Cost + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var result = isNaN(parseFloat(output.d)) == true ? 0 : parseFloat(output.d);
                    var Duties = $("#txtInventoryDuties").val().trim();
                    if (Duties == "" || Duties == "0.0000") {
                        $("#txtInventoryDuties").val(parseFloat(result).toFixed(4));
                    }
                }
             });
        }
        else {
            $("#txtInventoryDuties").val(parseFloat(0.000).toFixed(3));
        }
    }

    function CalculateFBE() {
        var Flower = "";
        var FARM = "";
        var UOM = "";
        Flower = $("#hfInventoryFlower").val();
        FARM = $("#hfInventoryFarm").val().trim();
        UOM = $("#hfInventoryUOM").val();        
        if (Flower != "" && FARM != "" && UOM != "") {
            $.ajax({
                async: false,
                type: "POST",
                url: 'BloomService.asmx/GetFBE',
                data: '{"Flower":"' + Flower + '","Farm":"' + FARM + '","UOM":"' + UOM + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var result = output.d;
                    $("#hfInventoryFBE").val(result);
                }
            });
        }
    }

</script>
