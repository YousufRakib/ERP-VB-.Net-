<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageUnAppliedAmountForCustomer.ascx.vb" Inherits="pages_PageUnAppliedAmountForCustomer" %>


    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table id="fgrdUnAppliedAmountDetailsFgrd""></table>
            </td>
        </tr>
    </table>

<div runat="server" id="divCustomerNo_UnAppliedAmount" style="display:none"></div>
<script type="text/javascript">

    $(document).ready(function () {
        debugger;
        var CustomerNo = $("#ctl00_divCustomerNo_UnAppliedAmount").html();
        LoadUnAppliedAmountDetailsFgrd();

        function LoadUnAppliedAmountDetailsFgrd() {
        debugger

            $("#fgrdUnAppliedAmountDetailsFgrd").flexigrid({
                url: 'BloomService.asmx/GetUnAppliedAmountDetailsByCustomerForFgrd',
                dataType: 'xml',
                async: false,
                colModel: [
                    { display: 'DATE', name: 'DATE', width: 70, sortable: true, align: 'center', hide: IsCustomerUserType },
                    { display: 'CHECK', name: 'CHECK', width: 70, sortable: true, align: 'right', hide: IsCustomerUserType },
                    { display: 'AMOUNT', name: 'AMOUNT', width: 100, sortable: true, align: 'right' },
                ],
                searchitems: [
                    { display: 'DATE', name: 'DATE' },
                    { display: 'CHECK', name: 'Desc' },
                    { display: 'AMOUNT', name: 'AMOUNT' },
                ],
                showTableToggleBtn: true,
                sortname: "DATE Asc",
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
                height: 200,
                width: 355,
                striped: true,
                params: [
                 //{ name: 'Filter', value: '' },
                 { name: 'Customer', value: CustomerNo },
                 { name: 'ExportCSV', value: '' },

                ],
                onSuccess: function () {
                    debugger
                    $(".imgLoaderForUser").hide();


                    var sel = jQuery("#fgrdUnAppliedAmountDetailsFgrd tbody tr");
                    var len = sel.length;
                    if (len > 1) {
                        $("#UnAppliedAmountforcustomer #ExportCSV").show();
                    }
                },
                onError: function (xhr, status, errorThrown) {
                    if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                        window.location.href = "Login.aspx";
                    }
                }
            });
            debugger
            $('#CustomerUnAppliedAmountDialog .sDiv').find('.sDiv2').find('.qsbox').css({ "width": "100px" })

            $("#CustomerUnAppliedAmountDialog .sDiv").css('float', 'left').css('width', '545px');
            $('#CustomerUnAppliedAmountDialog .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#CustomerUnAppliedAmountDialog .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#CustomerUnAppliedAmountDialog .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#CustomerUnAppliedAmountDialog .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show()
        
        
    }
    });

    //$("#CustomerUnAppliedAmountDialog").dialog({
    //    autoOpen: false,
    //    resizable: false,
    //    title: "UNAPPLIED PAYMENTS",
    //    width: 400,
    //    height: 355,
    //    modal: true,
    //    close: function () {
    //        $("#CustomerUnAppliedAmountDialog").dialog("close");
    //    }
    //});

</script>