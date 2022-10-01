<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageSpordTrans.ascx.vb" Inherits="pages_PageSpordTrans" %>
<style>
    #row0:hover td {
        background: #7b7bff !important;
        color: white;
    }
</style>
<table>
    <tr>
        <td>
            <div id="DivViewSPORDTransactionDialog">
                <div id="divViewSPORDTransactions" style="float: left">
                    <table id="fgrdViewSPORDTransactions" style="display: block;"></table>
                </div>
            </div>
        </td>
    </tr>
</table>
<div id="DivCurrentCustomer_F8Trans" runat="server" style="display: none"></div>
<div id="DivViewTransForSingleF8" runat="server" style="display: none"></div>
<div id="DivSpordSqlIdForTrans" runat="server" style="display: none"></div>
<div id="DivTransCalledFromF8" runat="server" style="display: none"></div>
<div id="LoggedInUserType_PageF8Trans" runat="server" style="display: none"></div>
<div id="LoggedInUserIsAdmin_PageF8Trans" runat="server" style="display: none"></div>
<div id="LoggedInUserSalesman" runat="server" style="display: none"></div>

<script type="text/javascript">

    $("#fgrdViewSPORDTransactions").flexigrid({
        url: 'BloomService.asmx/GetViewSPORDTransactionsGrid',
        dataType: 'xml',
        colModel: [
            { display: '', name: 'Comments', width: 13, sortable: false, align: 'center' },
            { display: '', name: 'CommentsInt', width: 15, sortable: false, align: 'center' },
            { display: 'TransType', name: 'TransType', width: 75, sortable: true, align: 'left' },
            { display: 'Cust#', name: 'CUSTOMER', width: 30, sortable: true, align: 'left' },
            { display: 'Shipdate', name: 'SHIPDATE', width: 60, sortable: true, align: 'left' },
            { display: 'EndDate', name: 'ENDDATE', width: 80, sortable: true, align: 'left' },
            { display: 'FarmShip', name: 'SIHPTOBOGOTA', width: 80, sortable: true, align: 'left' },
            { display: 'FarmEndDate', name: 'ENDSHIPBOG', width: 80, sortable: true, align: 'left' },
            { display: 'Farm', name: 'FARM', width: 30, sortable: true, align: 'left' },
            { display: 'Flower', name: 'FLOWER', width: 60, sortable: true, align: 'left', hide: true },
            { display: 'Product Name', name: 'PRODUCTNAME', width: 180, sortable: true, align: 'left' },
            { display: 'Order', name: '[ORDER]', width: 50, sortable: true, align: 'right' },
            { display: 'Boxes', name: 'BOXES', width: 30, sortable: true, align: 'right' },
            { display: 'Units', name: 'UNITS', width: 30, sortable: true, align: 'right', title: 'Units Per Bunch' },
            { display: 'UOM', name: 'UOM', width: 30, sortable: true, align: 'right', title: 'Units Per Box' },
            { display: 'Status', name: 'STATUS', width: 40, sortable: false, align: 'left' },
            { display: 'Type', name: 'TYPE', width: 30, sortable: true, align: 'left' },
            { display: 'Price', name: 'PRICES', width: 30, sortable: true, align: 'right' },
            { display: 'Cost', name: 'COST', width: 30, sortable: true, align: 'right' },
            { display: 'Carrier', name: 'CARRIER', width: 40, sortable: true, align: 'left' },
            { display: 'PO', name: 'PO', width: 40, sortable: true, align: 'left' },
            { display: 'BoxCode', name: 'BoxCode', width: 40, sortable: true, align: 'left' },
            { display: 'UPC', name: 'UPC', width: 40, sortable: true, align: 'left' },
            { display: 'DateCode', name: 'DateCode', width: 40, sortable: true, align: 'left' },
            { display: 'WH', name: 'WH', width: 40, sortable: true, align: 'left' },
            { display: 'Agency', name: 'Agency', width: 40, sortable: true, align: 'left' },
            { display: '', name: '', width: 13, sortable: true, align: 'left' }
        ],
        searchitems: [
        { display: 'Cust#', name: 'CUSTOMER' },
        { display: 'Shipdate', name: 'SHIPDATE' },
        { display: 'FarmShip', name: 'SHIPTOBOGOTA' },
        { display: 'Farm', name: 'FARM' }
        ],
        showTableToggleBtn: true,
        sortname: "ID",
        sortorder: "asc",
        usepager: true,
        title: false,
        useRp: true,
        //rp: parseInt(($(window).height() - 290) / 25)
        qtype: "ID",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        params: [
            { name: 'Customer', value: $("#ctl00_DivCurrentCustomer_F8Trans").html() },
            { name: 'isGetSingleF8TransLog', value: $("#ctl00_DivViewTransForSingleF8").html() },
            { name: 'SpordSqlId', value: $("#ctl00_DivSpordSqlIdForTrans").html() },
            { name: 'isFromF8screen', value: $("#ctl00_DivTransCalledFromF8").html() },
            { name: 'ExportCSV', value: '' }
        ],
        height: $(window).height() - 180,
        width: "1187",
        striped: true,
        onSuccess: function () {
            $("#fgrdViewSPORDTransactions table").width = "1502px";
            $("#divViewSPORDTransactions #ExportCSV").show();
            //For to show the error
            if ($("#fgrdViewSPORDTransactions tr#row-2").length > 0) {
                $("#fgrdViewSPORDTransactions tr#row-2").hide();
                $.MessageBox($("#fgrdViewSPORDTransactions tr#row-2")[0].innerText);
                return false;
            }

            isF8SingleTrans = false
            F8SqlId = "0";

            $("#divViewSPORDTransactions .sDiv").css('float', 'left').css('width', '545px');
            $('#divViewSPORDTransactions .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#divViewSPORDTransactions .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
            $("#divViewSPRODTransactions .pDiv").find(".pDiv2").find(".btnseparator").hide();
            //$("#divInventoryDetailByFarm .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
            $("#divViewSPORDTransactions .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
            $("#divViewSPORDTransactions .bDiv table").css('width', '1502px')
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS!!! Please try after some time..");
            }
        }
    });

    $("#DivViewSPORDTransactionDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "",
        width: 1210,
        open: function (e) {
            debugger;
            $("#fgrdViewSPORDTransactions").flexReload();
            var dlgtitle = "View All SPORD Transactions", isFromSingleF8 = "";
            isFromSingleF8 = $("#ctl00_DivViewTransForSingleF8").html() == undefined ? "" : $("#ctl00_DivViewTransForSingleF8").html();
            dlgtitle = ((isFromSingleF8 == "" || isFromSingleF8 == "false") ? "View All SPORD Transactions" : "View SPORD Transactions");
            $("#DivViewSPORDTransactionDialog").dialog('option', { 'title': dlgtitle });
        }
    });
</script>
