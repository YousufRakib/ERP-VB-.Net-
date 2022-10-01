<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageOrderAll.ascx.vb" Inherits="pages_PageOrderAll" %>
<script src="js/validation.js" type="text/javascript"></script>

<table>
    <tr>
        <td>
            <div id="DivOrderDetailsAllDialog">
                <div id="DivOrderDetailsAll" style="float: left">
                    <table id="fgrdOrderDetailsAll" style="display: block;"></table>
                </div>
            </div>
        </td>
    </tr>
</table>

<div id="DivCustomerNo_OrderSave" runat="server" style="display: none"></div>

<script type="text/javascript">
    var width = 1255;
    var height = $(window).height() - 150;

    $(document).ready(new function () {
        $("#fgrdOrderDetailsAll").flexigrid({
            url: 'BloomService.asmx/GetSalesOrderDetailsList',
            dataType: 'xml',
            colModel: [
                //{ display: 'INV#', name: 'Order', width: 35, sortable: true, align: 'left', hide: IsOrdeNo },
                { display: '<img style="Cursor:pointer;" id="OrderDetailselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center', hide: true },
                { display: '', name: 'Delete', width: 13, sortable: false, align: 'center', hide: true },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center', hide: true },
                { display: '', name: 'Credits', width: 13, sortable: false, align: 'center', hide: true },
                { display: 'RowNo', name: 'RowNo', width: 35, sortable: true, align: 'left', hide: true },
                { display: 'INV#', name: 'Order', width: 35, sortable: true, align: 'left' },
                { display: 'Date', name: 'Date', width: 60, sortable: true, align: 'left' },
                { display: 'Cust#', name: 'CustCode', width: 40, sortable: true, align: 'left' },
                { display: 'Customer', name: 'CustomerName', width: 150, sortable: true, align: 'left' },
                { display: 'InvType', name: 'InvenType', width: 40, sortable: false, align: 'left' },
                { display: 'Flower', name: 'Flower', width: 100, sortable: true, align: 'left'},
                { display: 'Description', name: 'Name', width: 220, sortable: true, align: 'left' },
                //{ display: 'SLS', name: 'SLSName', width: 30, sortable: true, align: 'left' },    /*Commented by Abinaya :: jose changes*/
                { display: 'Farm', name: 'FarmCode', width: 30, sortable: true, align: 'left' },
                { display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left' },
                { display: 'Boxes', name: 'Boxes', width: 30, sortable: false, align: 'right' },/*jose changed :: left to right align*/
                { display: 'UOM', name: 'UOM', width: 20, sortable: false, align: 'left' },
                { display: 'FBE', name: 'FBE', width: 10, sortable: false, align: 'right', hide: true },
                { display: 'Units', name: 'Units', width: 30, sortable: false, align: 'right' },
                { display: 'UnitsBunch', name: 'UnitsBunch', width: 30, sortable: false, align: 'right', hide: true },
                { display: 'TotalUnits', name: 'TotalUnits', width: 60, sortable: false, align: 'right' },
                { display: 'FOB', name: 'FOB', width: 50, sortable: false, align: 'right' },
                { display: 'Total $', name: 'TotPerLine', width: 60, sortable: true, align: 'right' },
                //{ display: 'Price', name: 'Price', width: 50, sortable: false, align: 'right' },
                //{ display: 'Cost', name: 'Cost', width: 50, sortable: false, align: 'right' },
                { display: 'TotalCost', name: 'TotalCost', width: 30, sortable: false, align: 'right', hide: true },
                { display: 'Type', name: 'Type', width: 20, sortable: true, align: 'left' },
                { display: '%GPM', name: 'gpm', width: 40, sortable: true, align: 'right' }, //hide this column for both customer and warehouse login

                { display: 'BoxNum', name: 'BoxNum', width: 40, sortable: true, align: 'right', hide: true },/*jose changed :: left to right align*/
                //{ display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left', hide: IsOrdeNo },
                { display: 'Box Code', name: 'BoxCode', width: 60, sortable: true, align: 'left', hide: true },
                { display: 'UPC', name: 'UPC', width: 70, sortable: true, align: 'left', hide: true },
                { display: 'PODFlower', name: 'PODFlower', width: 60, sortable: true, align: 'left', hide: true },
                { display: 'Dimentions', name: 'Dimentions', width: 60, sortable: true, align: 'left', hide: true },
                { display: 'InvenID', name: 'InvenID', width: 60, sortable: true, align: 'left', hide: true },
            ],
            searchitems: [
                { display: 'INV#', name: 'Order' },
                { display: 'Date', name: 'Date' },
                { display: 'Cust#', name: 'CustCode' },
                { display: 'Customer', name: 'CustomerName' },
                { display: 'Flower', name: 'Flower' },
                { display: 'Description', name: 'Name' },
                //{ display: 'SLS', name: 'SLSName' },
                { display: 'Farm', name: 'FarmCode' },
                { display: 'AWB', name: 'AWB' },
                { display: 'Boxes', name: 'Boxes' },
                { display: 'UOM', name: 'UOM' },
                { display: 'Units', name: 'Units' },
                { display: 'TotalUnits', name: 'TotalUnits' },
                //{ display: 'Price', name: 'Price' },
                //{ display: 'Cost', name: 'Cost' },
                { display: 'Type', name: 'Type' },
                { display: 'Box Number', name: 'BoxNum', hide: true },
                { display: 'Box Code', name: 'BoxCode', hide: true },
                { display: 'UPC', name: 'UPC', hide: true },
                { display: 'PODFlower', name: 'PODFlower', hide: true },
                { display: 'Dimentions', name: 'Dimentions' },
                //{display:'%GPM',name:'gpm'}        // not refered in query
            ],
            showTableToggleBtn: true,
            //sortname: "OrderDate Desc,CustomerName asc",
            sortname: "Flower asc",
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
            width: 1255,
            height: $(window).height() - 150,
            striped: true,
            onSuccess: function () {
                $("#fgrdOrderDetailsAll tr:first").addClass("trSelectedCheck");
                debugger;
                if ($("#DivOrderDetailsAll .qsbox").is(":focus") == true) {
                    $("#fgrdOrderDetailsAll").focus();
                }
                $("#DivOrderDetailsAll .qsbox").attr("autocomplete", "off")
                var sel = jQuery("#fgrdOrderDetailsAll tbody tr");
                var len = sel.length;
                if (len > 1) {
                    $("#DivOrderDetailsAll #ExportCSV").show();
                }
                $('#fgrdOrderDetailsAll #row0').addClass("TotalRows");
                $("#DivOrderDetailsAll .sDiv").css('float', 'left').css('width', '542px');
                $('#DivOrderDetailsAll .pDiv').css('padding', '2px').css('border-left', '0px');
                $('#DivOrderDetailsAll .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
                $("#DivOrderDetailsAll .pDiv").find(".pDiv2").find(".btnseparator").hide();
                $("#DivOrderDetailsAll .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
            },
            params: [
              { name: 'Filter', value: '' },
              { name: 'OrderNo', value: '' },
              { name: 'ExportCSV', value: '' },
              { name: 'Exclude', value: '' },
              { name: 'iscalledFromPage', value: 'PageOrderAll' }
            ],
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });
    })

    $("#DivOrderDetailsAllDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Order Details",
        width: 1270,
        modal: true,
        open: function () {
            $("#fgrdOrderDetailsAll").flexReload();
            $("#fgrdOrderDetailsAll tr:first").addClass("trSelectedCheck");
            if ($("#DivOrderDetailsAll .qsbox").is(":focus") == true) {
                $("#fgrdOrderDetailsAll").focus();
            }
        }
    });

    $("[id^=OrderDetailINV_").die('click').live('click', function () {
        debugger;
        var ID = $(this).attr('id').substring(15);
        var OrderNo = $("#fgrdOrderDetailsAll  #row" + ID + "").find("td div").eq(5).text()
        var CustomerNo = $("#fgrdOrderDetailsAll  #row" + ID + "").find("td div").eq(7).text()
        editorder(OrderNo, CustomerNo)
    });

    function editorder(OrderNo, CustomerNo) {
        debugger;
        var para = "Page=CustDetails&OrderNo=" + OrderNo + "&Customer=" + CustomerNo;
        $(".imgLoaderForUser").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageOrderDetails.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivOrderSummaryDialog").css('display', 'none');
                $("#DivOrderDetailsDialog").css('disply', 'block');
                $("#DivOrderCallHSDialog").css('display', 'none');
                $('<div id="DivOrderDetailsDialog">/div>').dialog({
                    title: '<div> ORDER UPDATE :: ' + OrderNo + '</div>',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1256,
                    //height: 650,
                    //closeOnEscape:false,
                    beforeClose: function () {
                        debugger
                        FuelUpdate(OrderNo)
                    },
                    close: function (event, ui) {
                        debugger
                        $(this).dialog('destroy').remove();
                        $("#DivOrderDetailsDialog").dialog('destroy').remove();
                        $("#ctl00_DivOrderNo_OrderSave").html("");
                        //added by Belal 07/16/21
                        $("#txtQuickShiptoName").val("");
                        $("#txtQuickShiptoAddress1").val("");
                        $("#txtQuickShiptoAddress2").val("");
                        $("#txtQuickShiptoCity").val("");
                        $("#txtQuickShiptoState").val("");
                        $("#txtQuickShiptoZip").val("");
                        $("#txtQuickShiptoCountry").val("");
                        $("#txtQuickShiptoPhone").val("");
                        $("#txtQuickShiptoFax").val("");
                        $("#txtQuickShiptoContact").val("");
                    },
                    open: function () {
                    }
                });
                $("#DivOrderDetailsDialog").data("Order", OrderNo).html(output.d).dialog("open");
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
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
               }
            }
        });
    }
</script>
