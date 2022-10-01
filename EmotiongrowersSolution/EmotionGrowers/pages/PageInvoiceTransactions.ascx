<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageInvoiceTransactions.ascx.vb" Inherits="pages_PageInvoiceTransactions" %>
<script src="js/validation.js" type="text/javascript"></script>


    <table id="fgrdARINVTransactions" style="display: block;"></table>

<div runat="server" id="divInvoiceNo_InvTrans" style="display: none"></div>
<div runat="server" id="divIsARINVHistory_InvTrans" style="display: none"></div>
<script type="text/javascript">

    $(document).ready(function () {
        debugger;

        var invnumber = $("#ctl00_divInvoiceNo_InvTrans").html();
        var IsARINVHistory = $("#ctl00_divIsARINVHistory_InvTrans").html();

        /*Load ARINVS transaction details grid for the invoice*/
        $("#fgrdARINVTransactions").flexigrid({
            url: 'BloomService.asmx/GetARINVTransactionDetailsByInvoice',
            dataType: 'xml',
            colModel: [
                 { display: 'Type', name: 'Type', width: 65, sortable: true, align: 'left' },
                 { display: 'Date', name: 'Date', width: 60, sortable: true, align: 'center' },
                 { display: 'Amount', name: 'Amount', width: 100, sortable: true, align: 'right' },
                 { display: 'Check', name: 'Check', width: 60, sortable: true, align: 'right' },
                 { display: 'Deposit#', name: 'Deposit', width: 60, sortable: true, align: 'right' },
                 { display: 'Reason', name: 'Reason', width: 200, sortable: true, align: 'left' },
                 { display: '', name: '', width: 15, sortable: true, align: 'left' },
                 { display: '', name: '', width: 15, sortable: true, align: 'left' },
            ],
            searchitems: [
                { display: 'Type', valuse: 'Type' },
                //{ display: 'Name', valuse: 'CustName' },
                //{ display: 'INV#', name: 'INV#' },
                //{ display: 'Date', name: 'Date' },
                //{ display: 'PO#', name: 'PO#' },
                //{ display: 'AWB', name: 'AWB' },
                //{ display: 'CA', name: 'Carrier' },
                //{ display: 'Shipto', name: 'Shipto' },
                //{ display: 'Wh', name: 'Wh' },
                //{ display: 'Charges', name: 'Charges' },
                //{ display: 'Payments', name: 'Payments' },
                ////{ display: 'Credits', name: 'Credits' },
                //{ display: 'Balance', name: 'Balance' },
            ],
            showTableToggleBtn: true,
            sortname: "Type Asc",
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
            height: $(window).height() - 300,
            width: 680,
            striped: true,

            params: [
                { name: 'ExportCSV', value: '' },
                { name: 'Invoice', value: invnumber },
                { name: 'IsARINVHistory', value: IsARINVHistory }
              ],
            onSuccess: function () {
                //$("#fgrdARINVTransactions tbody tr").click(function (event) {
                //    debugger;
                //    var id = $(this).attr('id').replace('row', '')

                //    if (($(this).attr("id") != "row0")) {
                //        $("#fgrdARINVTransactions").html(id.toString());
                //        $("#fgrdARINVTransactions [id^=row]").removeClass("trSelectedHeader");
                //        $("#fgrdARINVTransactions #row" + $("#DivCustPayARIVDetailID1").html()).addClass("trSelectedHeader");
                //        $("#fgrdARINVTransactions td.unsorted").addClass("sorted");
                //        $("#fgrdARINVTransactions td.sorted").removeClass("unsorted");
                //        $("#fgrdARINVTransactions #row" + $("#DivCustPayARIVDetailID1").html()).removeClass("trSelected");
                //        $("#fgrdARINVTransactions #row" + $("#DivCustPayARIVDetailID1").html() + " td.sorted").addClass("unsorted");
                //        $("#fgrdARINVTransactions #row" + $("#DivCustPayARIVDetailID1").html() + " td.unsorted").removeClass("sorted");
                //    }
                //});

                debugger;
                var sel = jQuery("#fgrdARINVTransactions tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#editInvoicetransitions #ExportCSV").show();
                }
            },
            onError: function (xhr, status, errorThrown) {
                debugger;
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });
        $("#editInvoicetransitions .sDiv2 input[type='text']").css("width", "120px")
        //$("#DialogARINVTransactions .sDiv").css('float', 'left').css('width', '150px');
        $('#editInvoicetransitions .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#editInvoicetransitions .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#editInvoicetransitions .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#editInvoicetransitions .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    });
</script>
