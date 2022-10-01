<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PagePOHistory.ascx.vb" Inherits="pages_PagePOHistory" %>
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

<div id="DivPONumber" runat="server" style="display: none"></div>


<script type="text/javascript">  
    
    if ($("#ctl00_DivPONumber").html() != "") {
        var Query = "PONUM='" + $("#ctl00_DivPONumber").html() + "'";
        LoadSalesOrderCallHSGrd($("#ctl00_DivPONumber").html());
    }   

    var gridalreadyintialized = false;
    function LoadSalesOrderCallHSGrd(PONumber) {
        debugger
        $("#fgrdOrderCallHS").flexigrid({
            url: 'BloomService.asmx/GetPOHistoryList',
            dataType: 'xml',
            colModel: [
                { display: 'PONUM', name: 'PONUM', width: 75, sortable: true, align: 'left', hide: true },
                { display: 'Date', name: 'ADDDATE', width: 75, sortable: true, align: 'left' },
                { display: 'Time', name: 'ADDTIME', width: 50, sortable: true, align: 'left' },
                { display: 'Person', name: 'ADDUSER', width: 100, sortable: true, align: 'left' },
                { display: 'Note', name: 'LOGTEXT', width: 660, sortable: true, align: 'left' }
            ],
            searchitems: [
                { display: 'Date', name: 'ADDDATE' },
                { display: 'Person', name: 'ADDUSER' },
                { display: 'Note', name: 'LOGTEXT' }
            ],
            showTableToggleBtn: true,
            //sortname: "OrderDate Desc,CustomerName asc",
            sortname: "ADDDATE desc",
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
                    $("#DivOrderCallHSDialog").dialog('destroy').remove();
                    $.MessageBox("Cannot find activity log for PO#" + PONumber);
                    return false;
                }
                //$('#fgrdOrderCallHS #row0').addClass("TotalRows");
                $("#DivOrderCallHS #ExportCSV").show();
            },
            params: [
              { name: 'Filter', value: Query },
              { name: 'PONumber', value: PONumber },
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