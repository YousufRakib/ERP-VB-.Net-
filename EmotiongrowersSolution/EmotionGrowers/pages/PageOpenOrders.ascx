<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageOpenOrders.ascx.vb" Inherits="pages_PageOpenOrders" %>

<div id="DivOpenOrderPage">
    <table>
        <tr id="trOpenOrderCustDetails">
            <td style="vertical-align: top; padding: 0px; margin: 0px;">
                <div id="DivOpenOrderCustDetailsPage" style="width: 1000px;"></div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivOpenOrderDetails" style="float: left">
                    <table id="fgrdOpenOrderDetails" style="display: block;"></table>
                </div>
            </td>
        </tr>
    </table>
</div>
<div id="CurrentCustomerNo" style="display:none" runat="server"></div>

<script type="text/javascript">
    $(document).ready(function () {
        debugger;
        $("#fgrdOpenOrderDetails").flexigrid({
            url: 'BloomService.asmx/GetNewOrderGridList',
            dataType: 'xml',
            colModel: [
                { display: '', name: 'Delete', width: 13, sortable: false, align: 'center',hide:true },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center',hide:true },
                { display: '', name: 'Credits', width: 13, sortable: false, align: 'center' },
                { display: 'Flower', name: 'Flower', width: 60, sortable: true, align: 'left' },
                { display: 'Description', name: 'Name', width: 180, sortable: true, align: 'left' },
                { display: 'Farm', name: 'FarmCode', width: 30, sortable: true, align: 'left' },
                { display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left' },
                { display: 'Boxes', name: 'Boxes', width: 30, sortable: false, align: 'right' },
                { display: 'UOM', name: 'UOM', width: 30, sortable: false, align: 'left' },
                { display: 'Units', name: 'Units', width: 30, sortable: false, align: 'right' },
                { display: 'TotalUnits', name: 'TotalUnits', width: 60, sortable: false, align: 'right' },
                { display: 'FOB', name: 'FOB', width: 50, sortable: false, align: 'right' },
                { display: 'Total $', name: 'TotPerLine', width: 60, sortable: true, align: 'right' },
                { display: 'Type', name: 'Type', width: 30, sortable: true, align: 'left' },
                { display: '%GPM', name: 'gpm', width: 40, sortable: true, align: 'right' },
                { display: 'BoxNum', name: 'BoxNum', width: 40, sortable: true, align: 'right' },
                { display: 'Box Code', name: 'BoxCode', width: 60, sortable: true, align: 'left' },
                { display: 'UPC', name: 'UPC', width: 70, sortable: true, align: 'left' },
                { display: 'PODFlower', name: 'PODFlower', width: 60, sortable: true, align: 'left' },
            ],
            searchitems: [
                { display: 'Flower', name: 'Flower' },
                { display: 'Description', name: 'Name' },
                { display: 'Farm', name: 'FarmCode' },
                { display: 'AWB', name: 'AWB' },
                { display: 'Boxes', name: 'Boxes' },
                { display: 'UOM', name: 'UOM' },
                { display: 'Units', name: 'Units' },
                { display: 'TotalUnits', name: 'TotalUnits' },
                { display: 'Type', name: 'Type' },
                { display: 'Box Number', name: 'BoxNum' },
                { display: 'Box Code', name: 'BoxCode' },
                { display: 'UPC', name: 'UPC' },
                { display: 'PODFlower', name: 'PODFlower' },
            ],
            showTableToggleBtn: true,
            sortname: "SQLID asc", // sortname: "Flower asc",
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
            width: 1080,
            height: $(window).height() - 240,
            striped: true,
            onSuccess: function () {
                debugger;
                $('#fgrdOpenOrderDetails #row0').addClass("TotalRows");
            },
            params: [
              { name: 'Customer', value: $("#ctl00_CurrentCustomerNo").html() },
              { name: 'ExportCSV', value: '' },
            ],

            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#DivOpenOrderDetails .sDiv").css('float', 'left').css('width', '645px');
        $('#DivOpenOrderDetails .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivOpenOrderDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivOpenOrderDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivOpenOrderDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    });

    function GetCustomerDetailsforOpenOrder() {
        debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            async: false,
            data: '{ "controlName":"pages/PageCustDetails.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $("#DivOpenOrderCustDetailsPage").html("");
                $("#DivOpenOrderCustDetailsPage").html(output.d);
                GetCustDetailsPage($("#ctl00_CurrentCustomerNo").html(), "", "");

                if ($(".lblTermCode").html().trim() == "X") {
                    $("#CustAlertmsgbox").dialog("close");
                    $("#CustAlertmsg").html("Sorry,... you can not sell to this customer, look at the TERMS on top");
                    $("#CustAlertmsgbox").dialog("open");
                    return false;
                }

                if ($(".lblCreditHold").html().trim() == "Y") {
                    $("#CustAlertmsgbox").dialog("close");
                    $("#DivOpenOrderDetailsDialog").dialog("close");
                    if ($(".lblReasonHold").html() != "") {
                        $("#CustAlertmsg").html("Sorry,... this customer is on credit hold Reason: <b>" + $(".lblReasonHold").html() + "</b>");

                    }
                    else {
                        $("#CustAlertmsg").html("Sorry,... this customer is on credit hold");
                    }
                    $("#CustAlertmsgbox").dialog("open");
                    return false;
                }
            }
        });
    }

    $("#DivOpenOrderPage1").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 1120,
        height: $(window).height() - 10,
        modal: true,
        focus: function () {
            $('#DivOpenOrderPage').focus();
        },
        open: function () {
            debugger;
            GetCustomerDetailsforOpenOrder();
        },

        beforeClose: function () {
            debugger;
            try {
                var focused = document.activeElement;
                var zindex = [];
                var divname = [];
                for (i = 0 ; i < $(".ui-dialog:visible").length; i++) {
                    var ss = $(".ui-dialog:visible")[i].style.zIndex
                    zindex.push($(".ui-dialog:visible")[i].style.zIndex);
                    divname.push($(".ui-dialog:visible")[i].children[1].id);
                }
                var max = OrderNewindexOfMax(zindex);

                if ($(".ui-dialog:visible")[max].children[1].id == "DivOpenOrderDetailsDialog") {
                    if ($("#fgrdOpenOrderDetails tr").length > 0) {
                        $("#Alertmsgbox").dialog("close");
                        $("#Alertmsg").html("Please complete the order or delete items");
                        $("#Alertmsgbox").dialog("open");
                        return false;
                    }
                }
                else {
                    $('#' + $(".ui-dialog:visible")[max].children[1].id).dialog('close')
                    return false;
                }

            }
            catch (e) { }

        },
        close: function () {

            debugger;
            SaveClickedFirstTime = false;
            $("#txtCustSearch").val("");
            $("#txtInvSearch").val("");
            var page = window.location.href;
            //if (page.indexOf('Page=Sales') >= 0 && salemade == false) {
            //    debugger
            //    var CALL_ID = $('#DivOpenOrderDetailsDialog').data("CALL_ID");
            //    //$('#DivOrderNewDetailsDialog').dialog("open");
            //    $("#DialogCallOptionsOnEsc").data("CALL_ID", CALL_ID).dialog("open");
            //}
            //else if (page.indexOf('Page=Sales') >= 0 && salemade == true) {
            //    $.ajax({
            //        type: "POST",
            //        url: 'BloomService.asmx/UpdateCallListTypeAfterSaleMade',
            //        data: '{ "Customer":"' + $("#CurrentCustomerNo").html() + '"}',
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        success: function (output, status) {
            //            $("#fgrdCallListDetails").flexReload({ url: '/url/for/refresh' });
            //        }
            //    });
            //}
            $(".lblCreditHold").html("");
            $(".lblTermCode").html("");
            $("#DivOpenOrderDetailsDialog").dialog('destroy').remove();
            $("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
            $("#DivOrderSavePage_OrderNew").html("");
        }
    });

    $("#CustAlertmsgbox").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        buttons: {
            Ok: function () {
                debugger;
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
            //$("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });            
        },
        //beforeClose: function () {          
        //    if ($(".lblCreditHold").html().trim() == "Y" || $(".lblTermCode").html().trim() == "X") {
        //        $("#txtCustSearch").val("");
        //        $("#DivOrderNewDetailsDialog").dialog('close');                
        //    }
        //}
    });

    $("#Alertmsgbox").dialog({
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
        }
    });


</script>