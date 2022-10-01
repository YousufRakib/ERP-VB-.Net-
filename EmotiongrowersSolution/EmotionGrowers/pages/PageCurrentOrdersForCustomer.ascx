<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCurrentOrdersForCustomer.ascx.vb" Inherits="pages_PageCurrentOrdersForCustomer" %>

<style type="text/css">
    .TotalRows {
        background-color: #72C97D !important;
        color: red !important;
        font-size: 12px;
        font-weight: bold;
    }
</style>

<div id="DivCurrentCustomer_CurrentOrders" runat="server" style="display: none"></div>

<table id="tblcurrentOrder" style="float: left" cellspacing="0">
    <tr>
        <td>
            <a id="aDropLineToNewOrder" style="display: none;" class="add">New Order</a>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">

            <div id="DivCurrentOrderForCustomerHeader" style="float: left">
                <table id="fgrdCurrentOrderForCustomerHeader" style="display: block;"></table>
            </div>
        </td>

    </tr>
</table>


<div id="msgbox-DropConfirm" style="display: none;" title="Alert">
    <p id="msgDropConfirm"></p>
</div>

<div id="DivOrderIsConsol" style="display: none;"></div>
<script type="text/javascript">


    var IsDropScreen = '0';
    var Clickevent = ""
    var OrderNo = "";

    var IsConsolScreen = '0';

    if ($("#ui-dialog-title-DivCurrentOrdersDialog").html().indexOf('Drop') != -1) {
        $("#aDropLineToNewOrder").show();
        IsDropScreen = '1';
        IsConsolScreen = '0';
        Clickevent = OrderDroplineClick
        OrderNo = $("#ctl00_DivOrderNo").html();
    }
    else if ($("#ui-dialog-title-DivCurrentOrdersDialog").html().indexOf('Consolidation') != -1) {
        $("#aDropLineToNewOrder").hide();
        IsDropScreen = '0';
        IsConsolScreen = '1';
        Clickevent = OrderDroplineClick
        OrderNo = $("#ctl00_DivOrderNo").html();
    }
    else {
        $("#aDropLineToNewOrder").hide();
        IsDropScreen = '0';
        IsConsolScreen = '0';
        Clickevent = ""
        OrderNo = ""
    }



    $("#fgrdCurrentOrderForCustomerHeader").flexigrid({
        url: 'BloomService.asmx/GetCurrentOrderForCustomer',
        dataType: 'xml',
        colModel: [
            { display: '<img style="Cursor:pointer;" id="Orderselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center', process: Clickevent },
             { display: 'INV#', name: 'Order', width: 40, sortable: true, align: 'right', process: Clickevent },
             { display: 'CUST#', name: 'Customer', width: 30, sortable: true, align: 'left', hide: true },
             { display: 'Name', name: 'CustomerName', width: 170, sortable: true, align: 'left', hide: true },
             { display: 'Date', name: 'OrderDate', width: 55, sortable: true, align: 'left', process: Clickevent },
             { display: 'Day', name: 'Day', width: 28, sortable: true, align: 'left', process: Clickevent },
             { display: 'CA', name: 'Carrier', width: 22, sortable: true, align: 'left', title: 'Carrier', process: Clickevent },
             { display: 'WH', name: 'wh', width: 22, sortable: true, align: 'left', process: Clickevent },
             { display: 'Printed', name: 'Printed', width: 39, sortable: true, align: 'left', process: Clickevent },
             { display: 'Picking', name: 'List', width: 39, sortable: true, align: 'left', process: Clickevent },
             { display: 'Bills', name: 'Bills', width: 22, sortable: true, align: 'left', process: Clickevent },
             { display: 'Scan', name: 'Scanned', width: 40, sortable: true, align: 'left', process: Clickevent },
             { display: 'Shipto', name: 'Shipto', width: 160, sortable: true, align: 'left', process: Clickevent },
             { display: 'PO#', name: 'PO', width: 60, sortable: true, align: 'left', process: Clickevent },
             { display: '', name: 'Type', width: 15, sortable: false, align: 'center', process: Clickevent },
             { display: 'Pcs', name: 'Boxes', width: 30, sortable: true, align: 'right', process: Clickevent },
             { display: 'FBE', name: 'FBE', width: 60, sortable: false, align: 'right', process: Clickevent },
             { display: 'Cubes', name: 'Cubes', width: 60, sortable: false, align: 'right', process: Clickevent },
             { display: '$Inv.Amount', name: 'invamount', width: 80, sortable: true, align: 'right', process: Clickevent },
             { display: '%GPM', name: 'gpm', width: 60, sortable: true, align: 'right', hide: true },
             { display: 'Missing', name: 'ScannedBox', width: 38, sortable: false, align: 'left', hide: true },
             //{ display: 'SLS', name: 'SalesManName', width: 90, sortable: true, align: 'left', hide: true }, 
             { display: 'HOLD', name: 'HOLD', width: 90, sortable: true, align: 'left', hide: true },
             { display: 'SLSMAN', name: 'SLSMAN', width: 50, sortable: true, align: 'left', hide: true }
        ],
        searchitems: [
            { display: 'INV#', name: 'Order' },
            { display: 'Date', name: 'OrderDate' },
            { display: 'WH', name: 'WH' },
            { display: 'CA', name: 'Carrier' },
            { display: 'ST', name: 'State' },
            { display: 'CO', name: 'Country' },
            { display: 'Terms', name: 'Terms' },
            { display: 'Printed', name: 'Printed' },
            { display: 'Picking', name: 'List' },
            { display: 'Scan', name: 'Scanned' },
            { display: 'Shipto', name: 'Shipto' },
            { display: 'PO#', name: 'PO' },
            { display: 'Pcs', name: 'Boxes' },
            { display: 'SLS', name: 'SalesManName' },
            { display: 'Missing', name: 'ScannedBox' }
        ],
        showTableToggleBtn: true,
        //sortname: "OrderDate Desc,CustomerName asc",
        sortname: "Order Asc",
        sortorder: "",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "",
        rp: 30000,
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        height: $(window).height() - 160,
        width: 1000,
        striped: true,
        params: [
        { name: 'Customer', value: $("#ctl00_DivCurrentCustomer_CurrentOrders").html() },
        { name: 'IsDropScreen', value: IsDropScreen },
        { name: 'IsConsolScreen', value: IsConsolScreen },
        { name: 'OrderNo', value: OrderNo },
        { name: 'ExportCSV', value: '' },
        ],
        onSuccess: function () {
            $('#fgrdCurrentOrderForCustomerHeader #row0').addClass("TotalRows")
            //debugger;

            $("#DivCurrentOrderForCustomerHeader .flexigrid").css("min-width", "950px");
            $("#DivCurrentOrderForCustomerHeader #ExportCSV").show();
            //For to show the error
            if ($("#fgrdCurrentOrderForCustomerHeader tr#row-2").length > 0) {
                $("#fgrdCurrentOrderForCustomerHeader tr#row-2").hide();
                $.MessageBox($("#fgrdCurrentOrderForCustomerHeader tr#row-2")[0].innerText);
                return false;
            }

            //debugger;

        },
        onError: function (xhr, status, errorThrown) {
            //debugger;
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });

    $("#DivCurrentOrderForCustomerHeader .sDiv").css('float', 'left').css('width', '545px');
    $('#DivCurrentOrderForCustomerHeader .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivCurrentOrderForCustomerHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivCurrentOrderForCustomerHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivCurrentOrderForCustomerHeader .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/UpdateCustomerOrders',
        data: "{ 'Customer': '" + $("#ctl00_DivCurrentCustomer_CurrentOrders").html() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            if (output.d != "error") {
                $(".CurrentOrdersBalance").html(output.d);
            }
        },

    });


    function OrderDroplineClick(celDiv, OrderNo) {
        $(celDiv).click(function () {
            //debugger;
            if (OrderNo != "0" && OrderNo != "") {
                $("#msgDropConfirm").html("Do you want to drop into invoice #<b>" + OrderNo + "</b>");
                $("#msgbox-DropConfirm").data("inData", { OrderNoToDrop: OrderNo }).dialog("open");
            }
        })
    };

    $("#msgbox-DropConfirm").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {
                $(this).dialog("close");
                var OrderNo = $("#msgbox-DropConfirm").data("inData")["OrderNoToDrop"]


                if (OrderNo != "" && OrderNo != "0") {
                    var orderDetailIDs = [];
                    $('#fgrdOrderDetails tr:visible').each(function () {
                        if ($(this).attr("id") != "row0") {
                            if (IsConsolScreen == "1") {
                                orderDetailIDs.push($(this).attr("id").substring(3));
                            }
                            else {
                                if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                    orderDetailIDs.push($(this).attr("id").substring(3));
                                }
                            }
                        }
                    });

                    if (orderDetailIDs.length <= 0) {
                        return false
                    }                    
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/DropOrderRowsIntoAnotherOrder',
                        data: '{ "OrderNo":"' + OrderNo + '","OrderDetailIDs":"' + orderDetailIDs.join(",") + '","IsConsol":"' + IsConsolScreen + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            if (output.d == "LogOut") {
                                window.location.href = "Login.aspx"
                            }
                            else if (output.d == "error") {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                            else {
                                //$.MessageBox("Merged with order = " + OrderNo);
                                if ($("#fgrdOrderDetails tr:not(#row0)").length == $("#fgrdOrderDetails .trChecked").length) {
                                    //$(".CurrentOrdersBalance").click()
                                    $("#DivOrderDetailsDialog").dialog('close');
                                    $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                                }
                                $('#DivCurrentOrdersDialog').dialog("close");
                                IsOrderModifiedAndNotSaved = true;
                                    $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                    });
                }
       
            },
            No: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
        }
    });


    $(window).on('beforeunload', function () {
        //debugger;
        ClearLockedOrderNumber(function (callback) {
        });

    });
    function ClearLockedOrderNumber(callback) {
        //debugger;

        if (LockedOrder.length > 0) {  // this global variable  declared in dashboarduser page 
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
        callback(true);
    }

    $("[id^=EditOrderInCurrentOrders_").die('click').live('click', function () {
        //debugger;
        try {

            ClearLockedOrderNumber(function (callback) {
                if (callback == true) {
                    $("#DivOrderDetailsDialog").dialog("close");
                    $("#DivOrderDetailsDialog").dialog('destroy').remove();
                }
            });

        }
        catch (ex) {
        }
        var OrderNo = $(this).attr('id').replace("EditOrderInCurrentOrders_", "");
        var IsVoidedInvoice = $(this).attr('data-void') == "True" ? "VOIDED" : "";

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/InsertOrderLock',
            data: "{ 'OrderNumber': '" + OrderNo + "' }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                var data = output.d;

                if (data == "Logout") {
                    window.location.href = "Login.aspx"

                }
                else if (data == "error") {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }

                else if (data.indexOf("NotExist") >= 0) {
                    LockedOrder.push(OrderNo);  // this global variable  declared in dashboarduser page 
                    //$("#DivOrderNewDetailsDialog").dialog('destroy').remove();
                    var para = 'Page=CustDetails&OrderNo=' + OrderNo + '&Customer=' + $("#ctl00_DivCurrentCustomer_CurrentOrders").html();
                    $(".imgLoaderForUser").show();
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetPage',
                        data: '{ "controlName":"pages/PageOrderDetails.ascx","controlPara":"' + para + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {

                            $("#DivOrderDetailsDialog").css('disply', 'block');

                            $('<div id="DivOrderDetailsDialog">/div>').dialog({
                                title: '<div> ORDER UPDATE :: ' + OrderNo +'</div><div>'+IsVoidedInvoice+'</div>',
                                autoOpen: false,
                                resizable: false,
                                modal: true,
                                width: 1256,
                                beforeClose: function () {
					                debugger
                                    FuelUpdate(OrderNo)

                                    if (IsOrderModifiedAndNotSaved == true && $("#OrderIsPrinted").html() == "1") {
                                        $("<div id='IncompleteOrderAlertmsgbox1'><div style='margin-top: 20px;'> Please save the order!!! <div></div>").dialog({
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
                                                //$("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                                            },
                                            close: function () {
                                             
                                            }
                                        });
                                        $("#IncompleteOrderAlertmsgbox1").dialog('open')
                                        return false;
                                    }
                                },
                                //height: 650,
                                //closeOnEscape:false,
                                close: function (event, ui) {
                                    //debugger;
                                  
                                        ClearLockedOrderNumber(function (callback) {

                                            if (callback == true) {

                                                $("#DivOrderDetailsDialog").dialog('destroy').remove();

                                                //$("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
                                                $("#txtInvSearch").val("");
                                                $("#ctl00_DivOrderNo_OrderSave").html("");
                                            }
                                        });
                                        var DivVETCurrentDivID = $("#CustCurrentDivID").html();
                                        if (DivVETCurrentDivID == "DivOrderDetailsDialog") {
                                            $("#CustCurrentDivID").html("DivOrderNewCustDetailsPage");
                                        }
                                        //$("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });

                                },
                                open: function () {
                                    $("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
                                    //var OrderNo = $("#ctl00_DivOrderNo").html();
                                    var OrderHeaderHold = $("#fgrdCurrentOrderForCustomerHeader #row" + OrderNo + "").find("td div").eq(21).html();
                                    if (OrderHeaderHold == "Y") {
                                        $("#btnOrderDetailsAdd").hide();
                                        $("#btnOrderDetailsVDrop").hide();
                                        $("#btnOrderDetailsConsol").hide();
                                        $("#btnOrderDetailsFlip").hide();
                                        $("#btnOrderDetailsVoid").hide();

                                        // $("#btnOrderDetailsSave").hide();
                                        //$("[id^=OrderDetailEdit_]").die("click").live("click", function () {
                                        //    //debugger;
                                        //    $.MessageBox("You do not have rights to modify this order!!!");
                                        //    return false
                                        //})
                                        //$("[id^=OrderDetailDelete_]").die("click").live("click", function () {
                                        //    //debugger;
                                        //    $.MessageBox("You do not have rights to modify this order!!!");
                                        //    return false
                                        //})

                                        if ($("#ctl00_LoggedInUserType").html() == "credit manager") {

                                            $("#btnOrderDetailsVoid").show();
                                        }
                                    }
                                    //if ((OrderHeaderHold != "Y") && ($("#ctl00_LoggedUserType").html() == "sales person")) {

                                    //    $("#btnOrderDetailsVDrop").hide();
                                    //    $("#btnOrderDetailsFlip").hide();

                                    //}
                                    //if ((OrderHeaderHold != "Y") && ($("#ctl00_LoggedUserType").html() != "sales person")) {


                                    //    $("#btnOrderDetailsFlip").hide();

                                    //}

                                    //if ($("#ctl00_LoggedUserType").html() == "sales person") {

                                    //    $("#btnOrderDetailsVoid").hide();

                                    //}
                                    //$("#DivOrderSavePage_OrderNew").html("");
                                    //$("#DivOrderSavePage_OrderUpd").html("");                                    
                                    //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                                },
                                Cancel: function () {
                                    ClearLockedOrderNumber(function (callback) {

                                    });
                                },
                            });
                            $("#DivOrderDetailsDialog").data("Order", OrderNo).html(output.d).dialog("open");
                            if (IsDropScreen == "1") {
                                ClearLockedOrderNumber(function (callback) {
                                    $('#DivCurrentOrdersDialog').dialog('close');
                                });

                            }
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


    });

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



    $("[id^=aOrderDateCustomer_").die('click').live('click', function () {
        try {
            $("#DivActivityLogDialog").dialog("close");
        }
        catch (ex) { }
        var OrderNo = $(this).attr('id').replace("aOrderDateCustomer_", "");
        var para = 'Page=CallHS&OrderNo=' + OrderNo;
        $(".imgLoaderForUser").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageHistory.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('<div id="DivActivityLogDialog">/div>').dialog({
                    title: 'Activity Log :: ' + OrderNo,
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 970,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                    }
                });
                $("#DivActivityLogDialog").html(output.d).dialog("open");
            }
        });
    });




</script>
