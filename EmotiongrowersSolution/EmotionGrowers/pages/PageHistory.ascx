<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageHistory.ascx.vb" Inherits="pages_PageHistory" %>

<div id="DivOrderCallHSDlg11">
    <table id="tblOrderCallHS" style="float: left" cellspacing="0">
        <tr>
            <td style="vertical-align: top; padding: 0px; margin: 0px;">
                <div id="DivOrderCallHS" style="float: left">
                    <table id="fgrdOrderCallHS" style="display: block;"></table>
                </div>
            </td>

        </tr>
    </table>
</div>

<div id="DivCustomerNo" runat="server" style="display: none"></div>
<div id="DivCallHsDate" runat="server" style="display: none"></div>
<div id="DivOrderNo" runat="server" style="display: none"></div>


<script type="text/javascript">

    if ($("#ctl00_DivCustomerNo").html() != "" && $("#ctl00_DivCustomerNo").html() != null) {        
        var Query = "Customer=" + $("#ctl00_DivCustomerNo").html() + " and Date>=Cast('" + $("#ctl00_DivCallHsDate").html() + "' as date)";       
        LoadSalesOrderCallHSGrd("", Query);
    }
    else if ($("#ctl00_DivOrderNo").html() != "") {     ;
        LoadSalesOrderCallHSGrd($("#ctl00_DivOrderNo").html(), "");
    }
    

    var gridalreadyintialized = false;
    function LoadSalesOrderCallHSGrd(OrderNo, Query) {
        debugger
        $("#fgrdOrderCallHS").flexigrid({
            url: 'BloomService.asmx/GetSalesOrderCallHSList',
            dataType: 'xml',
            colModel: [
                { display: 'Customer', name: 'Customer', width: 75, sortable: true, align: 'left', hide: true },
                { display: 'Date', name: 'CallHS_Date', width: 125, sortable: true, align: 'left' },
                { display: 'Time', name: 'Time', width: 50, sortable: true, align: 'left' },
                { display: 'Person', name: 'Person', width: 100, sortable: true, align: 'left' },
                { display: 'Note', name: 'Note', width: 660, sortable: true, align: 'left' }
            ],
            searchitems: [
                { display: 'Date', name: 'CallHS_Date' },
                { display: 'Person', name: 'Person' },
                { display: 'Note', name: 'Note' }
            ],
            showTableToggleBtn: true,
            //sortname: "OrderDate Desc,CustomerName asc",
            sortname: "CallHS_Date desc",
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
            width: 952,
            height: $(window).height() - 190,
            striped: true,
            onSuccess: function () {

                $(".imgLoaderForUser").hide();
                //For to show the error
                if ($("#fgrdOrderCallHS tr#row-2").length > 0) {
                    $("#fgrdOrderCallHS tr#row-2").hide();
                    //$.MessageBox($("#fgrdOrderCallHS tr#row-2")[0].innerText);
                    $("#DivOrderCallHSDialog").dialog('destroy').remove();
                    $.MessageBox("Cannot find activity log for INV#" + OrderNo);
                    return false;
                }
                $('#fgrdOrderCallHS #row0').addClass("TotalRows");
                $("#DivOrderCallHS #ExportCSV").show();
            },
            params: [
              { name: 'Filter', value: Query },
              { name: 'OrderNo', value: OrderNo },
              { name: 'ExportCSV', value: '' }
            ],
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {

                    window.location.href = "Login.aspx";
                }

            }
        });
        gridalreadyintialized = true;
        $("#DivOrderCallHS .sDiv").css('float', 'left').css('width', '575px');
        $('#DivOrderCallHS .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivOrderCallHS .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
        $("#DivOrderCallHS .pDiv").find(".pDiv2").find(".btnseparator").hide();
        //$("#DivOrderCallHS .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
        $("#DivOrderCallHS .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
        gridalreadyintialized = true;

    }




</script>
