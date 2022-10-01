<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageOrderDetails.ascx.vb" Inherits="pages_PageOrderDetails" %>

<style>
    .hideForEmptyWareHouse{
        display:none !important;
    }
    .SLSMAN {
        margin-top: -5px;
        margin-left: -5px;
        padding-bottom: 3px;
        margin-right: -5px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    /*fieldset {
        position: relative;
        border-radius: 8px;
        border-width: 2px;
        border-color: darkred;
        height: 100px;
        max-height: 130px;
    }*/

    /*.legend1 {
        font-size: large;
        position: absolute;
        top: -0.1em;
        background: #fff;
        line-height: 1.2em;
    }

    .legend2 {
        font-size: large;
        position: absolute;
        top: -0.1em;
        background: #fff;
        line-height: 1.2em;
    }*/

    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 12px;
        height: 16px;
    }

    .firstletterunderline::first-letter {
        text-decoration: underline;
    }
</style>
<div id="DivConsigneeDialog" style="display: none">
    <label>Account: </label>
    <input type="text" id="txtAccount" />
    <input type="hidden" id="txtShipto" />
</div>
<div id="DivOrderDetailsDialog">
    <table id="tblOrderDetails" style="float: left" cellspacing="0">
        <tr id="trOrderCustDetails" style="display: none">
            <td style="vertical-align: top; padding: 0px; margin: 0px;">
                <table>
                    <tr>
                        <td>
                            <div id="DivOrderCustDetailsPage" style="width: 875px;"></div>
                        </td>
                        <td>
                            <table style="margin-top:5px;">
                                <tr>
                                    <td style="padding:0px 0px;">
                                        <div id="DivOrderPersonDetails">
                                            <img src="images/Edit_user.png" id="imgOrderUpdatePersonDetails" style="cursor: pointer;" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 2px; color: magenta;">Carrier:</td>
                                    <td>
                                        <p id="lblCarrier"></p>
                                    </td>
                                </tr>
                                <tr id="consigneeRow" style="display:none;">
                                    <td id="lblConsignee">
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top; padding-top: 3px; margin: 0px;">
                <div id="DivOrderDetails" style="float: left">
                    <table id="fgrdOrderDetails" style="display: block;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="margin-top: 6px; display: none;" id="DivBtnOrderDetails">

                    <button id="btnOrderDetailsAdd" class="BloomButtonEnabled firstletterunderline" style="width: 45px; color: white;">Add</button>
                    <button id="btnOrderDetailsKMisc" class="BloomButtonEnabled firstletterunderline" style="margin-left: 4px; width: 60px;color: white;background:blueviolet;">K-Misc</button>
                    <button id="btnOrderDetailsSave" class="BloomButtonEnabled firstletterunderline" style="margin-left: 4px; width: 56px; color: white;background:burlywood;">Save</button>
                    <button id="btnOrderDetailsTerms" class="BloomButtonEnabled" style="margin-left: 4px; width: 55px; color: white;background:darkblue;">Terms</button>
                    <button id="btnOrderDetailsZhipto" class="BloomButtonEnabled" style="margin-left: 4px; width: 60px; color: white;background:fuchsia;">Shipto</button>
                    <button id="btnOrderDetailsMessage" class="BloomButtonEnabled" style="margin-left: 4px; width: 66px; color: white;">Message</button>
                    <button id="btnOrderDetailsEmail" class="BloomButtonEnabled" style="margin-left: 4px; width: 60px;color: white;background:palevioletred;">E<span style="text-decoration: underline;">m</span>ail</button>
                    <button id="btnOrderDetailsFax" class="BloomButtonEnabled" style="margin-left: 4px; width: 40px;">Fax</button>
                    <button id="btnOrderDetailsVDrop" title="Allows you to drop a line from this order and added to another order" class="BloomButtonEnabled" style="margin-left: 4px; width: 66px; color: white;">VDrop</button>
                    <button id="btnOrderDetailsConsol" class="BloomButtonEnabled" style="margin-left: 4px; width: 60px; color: white;">Consol</button>
                    <button id="btnOrderDetailsPDF" class="BloomButtonEnabled" style="margin-left: 4px; width: 40px;">PDF</button>
					<button id="btnOrderDetailsPicking" class="BloomButtonEnabled" style="margin-left: 4px; width: 56px;">Picking</button>
                    <button id="btnOrderDetailsVoid" class="BloomButtonEnabled" style="margin-left: 4px; width: 55px; color: white;">Void</button>
                    <button id="btnOrderDetailsFlip" class="BloomButtonEnabled" style="margin-left: 4px; width: 55px; color: white;">Flip</button>
                    <button id="btnOrderDetailsF5" class="BloomButtonEnabled" style="width: 45px;background:teal;">F5</button>
                    <button id="btnOrderDetailsF6" class="BloomButtonEnabled" style="width: 45px;background:forestgreen">F6</button>
                    <button id="btnOrderDetailsF7" class="BloomButtonEnabled" style="margin-left: 4px; width: 45px;background:dodgerblue;">F7</button>
                    <button id="btnOrderDetailsF8" class="BloomButtonEnabled" style="margin-left: 4px; width: 45px;background:gold;">F8</button>
                    <button id="btnOrderDetailsConsolView" class="BloomButtonEnabled" style="margin-left: 4px; width: 89px;">Consol View</button>
                    <button id="btnOrderNewDetailsNotes" class="BloomButtonEnabled firstletterunderline" style="margin-left: 4px; width: 66px;background:lightcoral;">Notes</button>
                    <button id="btnOrderDetailsRepeat" class="BloomButtonEnabled" style="margin-left: 4px; width: 66px;background:powderblue;color:black;font:bold 12 arial;">Repeat</button>

                    <%--<input id="btnOrderDetailsUpd" type="button" class="BloomButtonEnabled" value="Upd" style="margin-left: 4px;width:66px;" >
                    <input id="btnOrderDetailsDel" type="button" class="BloomButtonEnabled" value="Del" style="margin-left: 4px;width:66px;" >--%>
                    <%-- Commented by Abinaya :: ordered the icon's numbered by jose --%>
                    <%--<input id="btnOrderDetailsCredits" type="button" class="BloomButtonEnabled" value="Credits" style="margin-left: 4px; width: 66px;">--%>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="DivOrderDetailsConsolView" style="display: none">		
	    <table style="width: 100%">		
	        <tr>		
	            <td>		
	            <table id="fgrdOrderDetailsConsolView" style="display: none;"></table>		
	            </td>		
        </tr>		
    </table>		
</div>

<%--<div id="DivOrderCallHSDlg11">
    <table id="tblOrderCallHS" style="float: left" cellspacing="0">
        <tr>
            <td style="vertical-align: top; padding: 0px; margin: 0px;">
                <div id="DivOrderCallHS" style="float: left">
                    <table id="fgrdOrderCallHS" style="display: block;"></table>
                </div>
            </td>

        </tr>
    </table>
</div>--%>



<div id="LoggedUserType" runat="server" style="display: none"></div>
<div id="DivCustomerNo_OrderDetails" runat="server" style="display: none"></div>
<div id="DivCallHsDate" runat="server" style="display: none"></div>
<div id="DivSalesPage" runat="server" style="display: none"></div>
<div id="DivFilter" runat="server" style="display: none"></div>
<div id="DivOrderNo" runat="server" style="display: none"></div>
<%--Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions--%>
<div id="DivIsVoidedOrder" runat="server" style="display: none"></div>


<div id="DivOrder" style="display: none;" align="center">
    <div class="UserPleaseWaitOverlay" style="display: none">
        <div style="top: 51px; margin-top: 216px; font-size: 16px;">
            Please wait... 
            <img src="images/ajax-loader.gif" alt="" />
        </div>
    </div>
</div>
<div id="Deleteconfirm" style="display: none;" title="Alert"></div>
<div id="DeleteNewOrderMiscDetail" style="display: none;" title="Alert"></div>

<div id="DivOrder2SQLID" style="display: none;"></div>

<div id="DialogEmailOrFaxtheOrder" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr class="EmailOrderSection">
            <td>
                <textarea rows="2" style="width: 466px; height: 50px;" cols="5" id="txtEmailIDsForOrder" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
        <tr class="FaxOrderSection">
            <td>
                <input type="text" id="txtFaxForOrder" style="width: 100px; height: 16px; float: left" />
                <label>@faxage.com</label>
                <input type="hidden" id="hfEmailorFaxOrder" style="width: 350px; height: 16px; float: left" />
            </td>
        </tr>        
        <tr id="trSubjectDetail">
            <td>
                <b>Subject</b>
                <input type="text" style="width: 466px;" id="txtEmailSubjectDetailForOrder" value="" spellcheck="false" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Message</b>
                <textarea rows="2" style="width: 466px; height: 101px;" cols="5" id="txtEmailBodyDetailForOrder" autocorrect="off" spellcheck="false"></textarea>
            </td>
        </tr>
    </table>
</div>

<div id="DivOrderSavePage_OrderUpd" style="display: none;"></div>

<div id="CustomerFilpDialog" style="display: none;">
    <input type="text" id="txtCustomertoflip" /></div>

<div id="OrderCanModified" style="display: none;">1</div>

<div id="DialogFlipOrder" style="display: none; margin-top: 20px;">
    <table>
        <tr>
            <td>
                <label>Customer# / Name : </label>
            </td>
            <td>
                <input type="text" id="txtCustSearchForFlip" style="width: 300px;" />
                <input type="hidden" id="hfCustomerForFlip" />
            </td>
        </tr>
    </table>
</div>


<div id="msgbox-orddet" style="display: none;">
    <p id="msg-orddet">
    </p>
</div>
<div id="msgbox-select" style="display: none;" title="Alert">
    <p id="msg">
        First select any contact from the list and try again.
    </p>
</div>

<div id="OrderIsPrinted" style="display: none;"></div>
<div id="OrderIsScanned" style="display: none;"></div>
<div id="DivSalesManPermissions" runat="server" style="display: none"></div>
<div id="OrderUpdateIsCheckFirst" style="display: none;"></div>

<div id="DialogOrderDetailsRepeat" style="display: none;">
    <fieldset id="brSPDateRange" style="height: 68px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtbrFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    Starting Date
                </td>
                <td>
                    <input id="txtStartingDt" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>            
            <tr style="height: 33px;" id="trbrToDatetxt">
                <td style="padding-right: 10px;" id="tdbrToDatelbl">
                    how many times to repeat?
                </td>
                <td id="tdrepeat">
                    <input id="txtrepeat" class="rbARReports" type="text" style="margin-top: 8px; width: 50px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<script type="text/javascript">
    var IsWHType = false;
    var IsCustomerType = false;
    var IsOrderModifiedAndNotSaved = false;
    var TotalRowsIntially = 0;
    var Orderdetailgridloadingfirsttime = true;
    var isvoid = false;                             //Muthu Nivetha M : 13 Mar 19 : For hold tickets restrictions
    var DeleteInvenId = 0;


    $(document).ready(function () {
        debugger;
        //Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
        if ($("#ctl00_DivIsVoidedOrder").html() == "VOIDED") {
            isvoid = true;
            $("#btnOrderDetailsAdd").hide();
            $("#btnOrderDetailsKMisc").hide();
            $("#btnOrderDetailsTerms").hide();
            $("#btnOrderDetailsMessage").hide();
            $("#btnOrderDetailsEmail").hide();
            $("#btnOrderDetailsFax").hide();
            $("#btnOrderDetailsVDrop").hide();
            $("#btnOrderDetailsConsol").hide();
            $("#btnOrderDetailsPDF").hide();
            $("#btnOrderDetailsVoid").hide();
            $("#btnOrderDetailsFlip").hide();
            $("#btnOrderDetailsF5").hide();
            $("#btnOrderDetailsF6").hide();
            $("#btnOrderDetailsF7").hide();
            $("#btnOrderDetailsF8").hide();
        }
        else {
            isvoid = false;
            $("#btnOrderDetailsAdd").show();
            $("#btnOrderDetailsKMisc").show();
            $("#btnOrderDetailsTerms").show();
            $("#btnOrderDetailsMessage").show();
            $("#btnOrderDetailsEmail").show();
            $("#btnOrderDetailsFax").show();
            $("#btnOrderDetailsVDrop").show();
            $("#btnOrderDetailsConsol").hide();
            $("#btnOrderDetailsPDF").show();
            $("#btnOrderDetailsVoid").show();
            $("#btnOrderDetailsFlip").show();
            $("#btnOrderDetailsF5").show();
            $("#btnOrderDetailsF6").show();
            $("#btnOrderDetailsF7").show();
            $("#btnOrderDetailsF8").show();
        }
          $(function () {
             $("#txtStartingDt").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy',
                showOtherMonths: true,
                 selectOtherMonths: true,
             }).datepicker("setDate", new Date(new Date()));
    });
        //if (getTitleOfDivOrderDetailsDialog)
        if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person") {
            $("#btnOrderDetailsVDrop").hide();
            $("#btnOrderDetailsFlip").hide();
            $("#btnOrderDetailsVoid").hide();
        }
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetOrderUpdatePersonDetails',
            data: '{ "OrderNo":"' + $("#ctl00_DivOrderNo").html() + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                $("#imgOrderUpdatePersonDetails").attr("title", output.d);

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetOrderflagsbyOrderNo',
                    data: '{ "OrderNo":"' + $("#ctl00_DivOrderNo").html() + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (output, status) {
                        var Order = output.d;
                        $("#OrderIsPrinted").html(Order.Printed ? "1" : "0");
                        $("#OrderIsScanned").html(Order.Scanned ? "1" : "0");
                        $("#lblCarrier").text(Order.Carrier);
                        debugger;
                        if (['AR', 'A1', 'A2', 'A3', 'FB', 'PR','PF'].indexOf(Order.Carrier) > -1) {
                             $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/GetConsigneebyOrderNo',
                                data: '{ "OrderNo":"' + $("#ctl00_DivOrderNo").html() + '","ShipTo":"' + Order.Shipto+'" }',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                async: false,
                                 success: function (output, status) {
                                     
                                     $("#txtShipto").val(Order.Shipto);
                                    $("#consigneeRow").show();
                                    if (output.d != "") {
                                        $("#lblConsignee").html("<p>"+output.d+"</p>");
                                    }else {
                                        $("#lblConsignee").html("<p onclick='showConsigneeDialog();' style='color:red; cursor:pointer;'>*NEED CONSIGNEE*</p>");
                                    }

                                }
                             });
                        }
                    }
                });
            }
        });

        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/CheckOrderCanModified',
        //    data: '{ "OrderNo":"' + $("#ctl00_DivOrderNo").html() + '" }',
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    async: false,
        //    success: function (output, status) {
        //        $("#OrderCanModified").html(output.d);
        //    }
        //});

        if ($("#ctl00_LoggedUserType").html() == "warehouse") {
            IsWHType = true
        }
        else {
            IsWHType = false
        }


        if ($("#ctl00_LoggedUserType").html() == "customer") {
            IsCustomerType = true;
        }
        else {
            IsCustomerType = false;
        }


        //if ($("#ctl00_LoggedUserType").html() == "sales person") {
        //    //BloomButtonDisabled
        //    $("#btnOrderDetailsAdd").removeClass('BloomButtonEnabled');
        //    $("#btnOrderDetailsAdd").addClass('BloomButtonDisabled');
        //    $("#btnOrderDetailsAdd").css('pointer-events', 'none');
        //    $("#btnOrderDetailsAdd").css('cursor','default');
        //}
        //else {
        //    $("#btnOrderDetailsAdd").removeClass('BloomButtonDisabled');
        //    $("#btnOrderDetailsAdd").addClass('BloomButtonEnabled');
        //    $("#btnOrderDetailsAdd").css('pointer-events', 'auto');
        //    $("#btnOrderDetailsAdd").css('cursor', 'pointer');
        //}



        if ($("#ctl00_DivSalesPage").html() == "CallHS") {

            //if ($("#ctl00_DivCustomerNo_OrderDetails").html() != "" && $("#ctl00_DivCustomerNo_OrderDetails").html() != null) {
            //    //var Query = "Customer=" + $("#ctl00_DivCustomerNo").html() + " and Date>=CTOD('" + $("#ctl00_DivCallHsDate").html() + "')";
            //    var Query = "Customer=" + $("#ctl00_DivCustomerNo_OrderDetails").html() + " and Date>=Cast('" + $("#ctl00_DivCallHsDate").html() + "' as date)";
            //    $("#DivBtnOrderDetails").hide();
            //    LoadSalesOrderCallHSGrd("", Query);
            //}
            //else if ($("#ctl00_DivOrderNo").html() != "") {

            //    $("#DivBtnOrderDetails").hide();
            //    LoadSalesOrderCallHSGrd($("#ctl00_DivOrderNo").html(), "");
            //}
        }
        else if ($("#ctl00_DivSalesPage").html() == "Details") {
            LoadSalesOrderDetailsGrd("", "");
        }
        else if ($("#ctl00_DivSalesPage").html() == "CustDetails") {
            LoadCustomerDetails($("#ctl00_DivOrderNo").html());
            LoadSalesOrderDetailsGrd($("#ctl00_DivOrderNo").html(), $("#ctl00_DivFilter").html());
            //$("#DivOrderCustDetailsPage").html($(".trOrderCustDet").html());
        }

        $(".NumbersOnly").keypress(function (event) {
            return isNumber(event, this)
        });
        // THE SCRIPT THAT CHECKS IF THE KEY PRESSED IS A NUMERIC OR DECIMAL VALUE.
        function isNumber(evt, element) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (
                //(charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.         
            ((charCode != 8 && charCode < 48) || charCode > 57))
                return false;
            return true;
        }

        $(".DecimalsOnly").keypress(function (event) {
            return isDecimal(event, this)
        });
        // THE SCRIPT THAT CHECKS IF THE KEY PRESSED IS A NUMERIC OR DECIMAL VALUE.
        function isDecimal(evt, element) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            if (
                //(charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.
            (charCode != 46 || $(element).val().indexOf('.') != -1) && // “.” CHECK DOT, AND ONLY ONE.
            ((charCode != 8 && charCode < 48) || charCode > 57))
                return false;
            return true;
        }

        $('input').keypress(function (e) {

            var key = e.which;
            if (key == 13) // the enter key code
            {

                for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
                    var a;
                    if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
                        a = i;
                    }

                    if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i && $(this).closest('tr').find('input')[i].disabled != true &&
                    $(this).closest('tr').find('input')[i].type != "hidden") {
                        $(this).closest('tr').find('input')[i].focus();
                        return false;
                    } else if ($(this).attr('id') == "txtInventoryUsersType") {
                        $("#txtInventoryUsersOrderNo").focus()
                        return false;
                    }

                    else if (i == $(this).closest('tr').find('input').length - 1) {
                        if ($(this).closest('tr').next('tr').find('input').length > 0) {
                            $(this).closest('tr').next('tr').find('input')[0].focus();
                        }
                        else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0)
                            $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();

                        return false;
                    }


                }

            }
        });

    });
    function showConsigneeDialog() {
        debugger;
        $("#DivConsigneeDialog").dialog("open");
    }
    function LoadCustomerDetails(OrderNo) {

        $("#trOrderCustDetails").show();
        try {
            var Customer = $("#fgrdOrderHeader #row" + OrdeNo + "").find("td div").eq(2).find("a").attr("id").substring(10).split(',')[0];
            var InvoiceDate = $("#fgrdOrderHeader #row" + OrdeNo + "").find("td div").eq(2).find("a").attr("id").substring(10).split(',')[1];
        }
        catch (er) {
            try {
                var Customer = $("#fgrdCurrentOrderForCustomerHeader #row" + OrdeNo + "").find("td div").eq(2).find("a").attr("id").substring(25).split(',')[0];
                var InvoiceDate = $("#fgrdCurrentOrderForCustomerHeader #row" + OrdeNo + "").find("td div").eq(2).find("a").attr("id").substring(25).split(',')[1];
            }
            catch (er) {
            }
        }


        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCustDetails.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {

                $("#DivOrderCustDetailsPage").html(output.d);

                var para = 'Customer=' + $("#ctl00_DivCustomerNo_OrderDetails").html() + '&OrderNo=' + $("#ctl00_DivOrderNo").html() + '&IsVoidedOrder=' + $("#DivIsVoidedOrder").html();

                //21 Mar 19 :: Muthu Nivetha M :: URGENT-Vet invoice showing on View sales for Current Day :: Starts
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetOrderDateByrderNo',
                    data: '{"OrderNo":"' + OrderNo + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        var OrderDate = output.d.ShippingDate;
                        var OrderDetailsDateByOrderCurrentDivID = $("#CustCurrentDivID").html();

                        if (OrderDate == "") {
                            if (OrderDetailsDateByOrderCurrentDivID != "DivOrderDetailsDialog") {
                                $("#DivOrderDetailsDialog .lblInvoiceDate1").html($.datepicker.formatDate('mm/dd/yy', new Date()));
                            }
                            else {
                                $("#" + OrderDetailsDateByOrderCurrentDivID + " .lblInvoiceDate1").html($.datepicker.formatDate('mm/dd/yy', new Date()));
                            }
                        }
                        else {
                            if (OrderDetailsDateByOrderCurrentDivID != "DivOrderDetailsDialog") {
                                $("#DivOrderDetailsDialog .lblInvoiceDate1").html(OrderDate);
                            }
                            else {
                                $("#" + OrderDetailsDateByOrderCurrentDivID + " .lblInvoiceDate1").html(OrderDate);
                            }
                            //$("#" + OrderDetailsDateByOrderCurrentDivID + " .lblInvoiceDate1").html(OrderDate);
                        }
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GetPage',
                            data: '{ "controlName":"pages/PageOrderSaveProcess.ascx","controlPara":"' + para + '" }',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {

                                $("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
                                if ($("#DivOrderNewDetailsDialog").dialog('isOpen') == false) {
                                    $("#DivOrderSavePage_OrderNew").html("");
                                }
                                $("#DivOrderSavePage_VETDetail").html("");
                                $("#DivOrderSavePage_OrderUpd").html("");
                                $("#DivOrderSavePage_OrderUpd").html(output.d);
                                PageOrderSaveAlreadyLoadedFromOrddet = true;
                                GetCustDetailsPage($("#ctl00_DivCustomerNo_OrderDetails").html(), OrderDate, "DivOrderDetailsDialog");
                            }
                        });
                    },
                    error: function () {
                        var OrderDetailsCurrentDivID = $("#CustCurrentDivID").html();
                        $("#" + OrderDetailsCurrentDivID + ".lblInvoiceDate1").html(OrderDate);
                    }
                });
                //21 Mar 19 :: Muthu Nivetha M :: URGENT-Vet invoice showing on View sales for Current Day :: Ends
            }
        });
    }

    function LoadSalesOrderDetailsGrd(OrdeNo, Filter) {
        debugger;
        if (OrdeNo != "") {
            var IsOrdeNo = false;
            var width = 1225;
            var height = $(window).height() - 300; /*commented by Abinaya :: jose changes*/
            //var height = $(window).height() - 460;
            if ($("#ctl00_LoggedUserType").html() == "customer") {
                //$("#DivBtnOrderDetails *").prop("disabled", true)
                $("#DivBtnOrderDetails").hide();
            }
            else {
                $("#DivBtnOrderDetails").show();
            }
            //$("#DivOrderDetailsDialog").css('width', 1150);
            //$("#DivOrderDetailsDialog").dialog('option', 'position', 'center');
            $("#DivOrderDetailsDialog").dialog("option", "width", 1305);
        }
        else {
            var IsOrdeNo = true;
            var width = 1255;
            var height = $(window).height() - 150;
            $("#DivBtnOrderDetails").hide();
            $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(0).hide();
            $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(1).hide();
            $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(2).hide();
        }
        var IsGPMYN = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(84, 1).ToString()%>' == "Y" ? true : false;
        $("#fgrdOrderDetails").flexigrid({
            url: 'BloomService.asmx/GetSalesOrderDetailsList',
            dataType: 'xml',
            colModel: [
                //{ display: 'INV#', name: 'Order', width: 35, sortable: true, align: 'left', hide: IsOrdeNo },
                { display: '<img style="Cursor:pointer;" id="OrderDetailselectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
                { display: '', name: 'Delete', width: 13, sortable: false, align: 'center', hide: IsWHType },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center', hide: IsWHType },
                { display: '', name: 'Credits', width: 13, sortable: false, align: 'center' },
                { display: 'RowNo', name: 'RowNo', width: 35, sortable: true, align: 'left', hide: true },
                { display: 'INV#', name: 'Order', width: 35, sortable: true, align: 'left' },
                { display: 'Date', name: 'Date', width: 60, sortable: true, align: 'left' },
                { display: 'Cust#', name: 'CustCode', width: 40, sortable: true, align: 'left' },
                { display: 'Customer', name: 'CustomerName', width: 150, sortable: true, align: 'left' },
                { display: 'Flag', name: 'InvenType', width: 10, sortable: false, align: 'left' },
                { display: 'Flower', name: 'Flower', width: 65, sortable: true, align: 'left', hide: false },
                { display: 'Description', name: 'Name', width: 220, sortable: true, align: 'left' },
                //{ display: 'SLS', name: 'SLSName', width: 30, sortable: true, align: 'left' },    /*Commented by Abinaya :: jose changes*/
                { display: 'Farm', name: 'FarmCode', width: 30, sortable: true, align: 'left' },
                { display: 'AWB', name: 'AWB', width: 36, sortable: true, align: 'left', hide: IsWHType },
                { display: 'Pieces', name: 'Boxes', width: 30, sortable: false, align: 'right' },/*jose changed :: left to right align*/
                { display: 'UOM', name: 'UOM', width: 20, sortable: false, align: 'left' },
                { display: 'FBE', name: 'FBE', width: 10, sortable: false, align: 'right', hide: true },
                { display: 'Pack', name: 'Units', width: 30, sortable: false, align: 'right' },
                { display: 'U/B', name: 'UnitsBunch', width: 20, sortable: false, align: 'right' },
                { display: 'Total Units', name: 'TotalUnits', width: 50, sortable: false, align: 'right', hide: false }, //Hide by Belal on 29 Aug 2020
                { display: 'FOB', name: 'FOB', width: 50, sortable: false, align: 'right' },
                { display: 'Total $', name: 'TotPerLine', width: 60, sortable: true, align: 'right' },
                //{ display: 'Price', name: 'Price', width: 50, sortable: false, align: 'right' },
                //{ display: 'Cost', name: 'Cost', width: 50, sortable: false, align: 'right' },
                { display: 'TotalCost', name: 'TotalCost', width: 30, sortable: false, align: 'right', hide: true },
                { display: 'Type', name: 'Type', width: 20, sortable: true, align: 'left' },
                { display: '%GPM', name: 'gpm', width: 40, sortable: true, align: 'right', hide: (IsWHType == true || IsGPMYN == false) ? true : IsCustomerType }, //hide this column for both customer and warehouse login

                { display: 'BoxNum', name: 'BoxNum', width: 40, sortable: true, align: 'right', hide: IsOrdeNo },/*jose changed :: left to right align*/
                //{ display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left', hide: IsOrdeNo },
                { display: 'Box Code', name: 'BoxCode', width: 60, sortable: true, align: 'left', hide: IsOrdeNo },
                { display: 'UPC', name: 'UPC', width: 70, sortable: true, align: 'left', hide: IsOrdeNo },
                { display: 'PODFlower', name: 'PODFlower', width: 75, sortable: true, align: 'left' },
                { display: 'Dimentions', name: 'Dimentions', width: 60, sortable: true, align: 'left', hide: IsOrdeNo },
                { display: 'InvenID', name: 'InvenID', width: 60, sortable: true, align: 'left', hide: true },
                { display: 'Retail', name: 'Retail', width: 60, sortable: true, align: 'left', hide: true }, //Added by Belal on 29 Aug 2020
                { display: 'AWBWithID', name: 'AWBWithID', width: 40, sortable: false, align: 'left', hide: true }, //Added on 23 Dec 2021
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
                { display: 'Box Number', name: 'BoxNum', hide: IsOrdeNo },
                { display: 'Box Code', name: 'BoxCode', hide: IsOrdeNo },
                { display: 'UPC', name: 'UPC', hide: IsOrdeNo },
                { display: 'PODFlower', name: 'PODFlower', hide: IsOrdeNo },
                { display: 'Dimentions', name: 'Dimentions' },
                //{display:'%GPM',name:'gpm'}        // not refered in query
            ],
            showTableToggleBtn: true,
            //sortname: "OrderDate Desc,CustomerName asc",
            sortname:"ORDER BY FLOWER,SQLID ASC",
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
            width: 1290,
            height: height,
            striped: true,
            onSuccess: function () {
                $("#ctl00_DivCustomerNo_OrderSave").html($("#ctl00_DivCustomerNo_OrderDetails").html());
                $("#ctl00_DivOrderNo_OrderSave").html($("#ctl00_DivOrderNo").html());

                $(".imgLoaderForUser").hide();
                //For to show the error
                if ($("#fgrdOrderDetails tr#row-2").length > 0) {
                    $("#fgrdOrderDetails tr#row-2").hide();
                    $.MessageBox($("#fgrdOrderDetails tr#row-2")[0].innerText);
                    return false;
                }
                var sel = jQuery("#fgrdOrderDetails tbody tr");
                var len = sel.length;
                /*Export button hide for Customer usertype:: Added by Abinaya :: 06oct2017*/
                if ($("#ctl00_LoggedInUserType").html() == "customer" && len > 1) {
                    $("#DivOrderDetails #ExportCSV").hide();
                }
                else {
                    if (len > 1) {
                        $("#DivOrderDetails #ExportCSV").show();
                    }
                }

                $('#fgrdOrderDetails #row1').removeClass("sorted");

                $('#fgrdOrderDetails tr').each(function () {

                    var ID = $(this).find("td").eq(4).text();
                    var InvenType = $(this).find("td").eq(25).text();//22
                    // read by id instead of column index
                    // var AWB = $(this).find("td").eq(14).text().trim();
                    var AWB = $("#NewOrderDetailAWB_" + ID).html();
                    if (AWB) { AWB = AWB.trim(); }
                    var PODFlower = $(this).find("td").eq(29).text().trim();//25

                    var isHideUnit = $(this).find("td").eq(31).text().trim();// added by Belal 29 Aug 2020
                    if (isHideUnit == "true") { // "29 Aug 2020 :: Belal :: Hiding TotalUnits column based on retail; ratil=true?hide:show
                        $('#fgrdOrderDetails td:nth-child(20)').hide();
                        $('#DivOrderDetails table th:nth-child(20)').hide();
                    } else if (isHideUnit == "false") {
                        $('#fgrdOrderDetails td:nth-child(20)').show();
                        $('#DivOrderDetails table th:nth-child(20)').show();
                    }


                    //var ID = $(this).find("td").eq(0).text();
                    //var InvenType = $(this).find("td").eq(22).text();//21
                    //var AWB = $(this).find("td").eq(9).text().trim();
                    //var PODFlower = $(this).find("td").eq(26).text().trim();//25

                    //if (ID != 0) {
                    //    $(this).find("td:nth-child(n+7)").css('background-color', (AWB != "0" && InvenType == "A" ? "Red" : (AWB == "0" && PODFlower != "" ? "Green" : (AWB == "0" && PODFlower == "" ? "#D800D8" : ""))));
                    //    $(this).find("td:nth-child(n+7)").css('color', (AWB != "0" && InvenType == "A" ? "white" : (AWB == "0" && PODFlower != "" ? "white" : (AWB == "0" && PODFlower == "" ? "white" : ""))));
                    //}
                    $(this).find('td').removeClass('sorted');

                    if ($("#ctl00_DivSalesPage").html() == "CustDetails") {
                        /*Disable edit & delete btn if fgrdOrderHeader -> Printed=True*/
                        if ($("#fgrdOrderHeader #row" + OrdeNo + "").find("td div").eq(13).find("img").attr("src") == "images/greentick.png") {
                            //$(this).find("td").eq(0).find("img").css('display', 'none');
                            //$(this).find("td").eq(0).find("img").css('display', 'none');
                            //$(this).find("td").eq(2).find("img").css('display', 'none');
                        }
                        //remove INV#,Date,Cust# and Customer from details grid  
                        $(this).find("td").eq(5).hide();
                        $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(5).hide();

                        $(this).find("td").eq(6).hide();
                        $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(6).hide();

                        $(this).find("td").eq(7).hide();
                        $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(7).hide();

                        $(this).find("td").eq(8).hide();
                        $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(8).hide();



                        if (ID != 0) {
                            $(this).find("td:nth-child(n+11)").css('background-color', (AWB != "0" && InvenType == "A" ? "Red" : (AWB == "0" && PODFlower != "" ? "Green" : (AWB == "0" && PODFlower == "" ? "#D800D8" : ""))));
                            $(this).find("td:nth-child(n+12)").css('color', (AWB != "0" && InvenType == "A" ? "white" : (AWB == "0" && PODFlower != "" ? "white" : (AWB == "0" && PODFlower == "" ? "white" : ""))));
                        }
                    }
                    else {
                        if (ID != 0) {
                            $(this).find("td:nth-child(n+12)").css('background-color', (AWB != "0" && InvenType == "A" ? "Red" : (AWB == "0" && PODFlower != "" ? "Green" : (AWB == "0" && PODFlower == "" ? "#D800D8" : ""))));
                            $(this).find("td:nth-child(n+12)").css('color', (AWB != "0" && InvenType == "A" ? "white" : (AWB == "0" && PODFlower != "" ? "white" : (AWB == "0" && PODFlower == "" ? "white" : ""))));
                        }
                        $(this).find("td").eq(0).hide();
                        $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(0).hide();
                        $(this).find("td").eq(1).hide();
                        $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(1).hide();
                        $(this).find("td").eq(2).hide();
                        $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(2).hide();
                        $(this).find("td").eq(3).hide();
                        $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(3).hide();
                    }
                });


                $('#fgrdOrderDetails #row0').addClass("TotalRows");

                if (Orderdetailgridloadingfirsttime == true) {
                    TotalRowsIntially = $('#fgrdOrderDetails tr:not(#row0)').length;
                    Orderdetailgridloadingfirsttime = false;
                }

                $("#DivOrderDetails select[name=lstsearch]").show();
                //$("#msgbox-select").dialog("close");
                $('#DivOrderDetails thead').find('#OrderDetailselectall').attr('src', 'images/check-off.png')
            },
            params: [
              { name: 'Filter', value: Filter },
              { name: 'OrderNo', value: OrdeNo },
              { name: 'ExportCSV', value: '' },
              { name: 'Exclude', value: '' },
              { name: 'iscalledFromPage', value: 'PageOrderDetails' }
            ],
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#DivOrderDetails .sDiv").css('float', 'left').css('width', '645px');
        //$('#DivOrderDetails .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivOrderDetails .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivOrderDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
        $("#DivOrderDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
        //$("#DivOrderDetails .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').css('font-weight', 'bold').css('font-size', '15px').css('color', 'red').css('top', '0').show();
        //$("#DivOrderDetails .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
        $("#DivOrderDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

        if (OrdeNo != "") {
            //for empty records :: remove INV#,Date,Cust# and Customer from details grid    
            $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(5).hide();
            $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(6).hide();
            $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(7).hide();
            $("#fgrdOrderDetails").parent(".bDiv").siblings(".hDiv").find("table tr th").eq(8).hide();
        }
        LoadCalendar();
    }
    function LoadCalendar() {
        var Customer = $("#ctl00_DivCustomerNo_OrderDetails").html();
        debugger;
        $("#DaysTruck").text("");
        $.ajax({
            type: "POST",
            async: false,
            url: 'BloomService.asmx/GetCustomerTruckDays',
            data: '{"CustomerNo":"' + Customer + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                var TruckDays = output.d;
                //alert(TruckDays.length);
                if (TruckDays == '')
                    return;
                var Mon = TruckDays.substr(0, 3);
                var Tue = TruckDays.substr(3, 3);
                var Wed = TruckDays.substr(6, 3);
                var Thu = TruckDays.substr(9, 3);
                var Fri = TruckDays.substr(12, 3);
                var Sat = TruckDays.substr(15, 3);
                var Sun = TruckDays.substr(18, 3);
                $("#MonDayTruck").html("M-" + Mon);
                $("#TuesDayTruck").html("T-" + Tue);
                $("#WednesDayTruck").html("W-" + Wed);
                $("#ThursDayTruck").html("T-" + Thu);
                $("#FriDayTruck").html("F-" + Fri);
                $("#SaturDayTruck").html("S-" + Sat);
                $("#SunDayTruck").html("S-" + Sun);
                var daysText = "";
                if (Mon.trim() != "")
                    daysText += " MO-" + Mon;
                if (Tue.trim() !== "")
                    daysText += " TU-" + Tue;
                if (Wed.trim() != "")
                    daysText += " WE-" + Wed;
                if (Thu.trim() != "")
                    daysText += " TH-" + Thu;
                if (Fri.trim() != "")
                    daysText += " FR-" + Fri;
                if (Sat.trim() != "")
                    daysText += " SA-" + Sat;
                if (Sun.trim() != "")
                    daysText += " SU-" + Sun;
                $("#DaysTruck").html(daysText);
               
            }

        });



    }
    //var gridalreadyintialized = false;
    //function LoadSalesOrderCallHSGrd(OrderNo, Query) {

    //    $("#fgrdOrderCallHS").flexigrid({
    //        url: 'BloomService.asmx/GetSalesOrderCallHSList',
    //        dataType: 'xml',
    //        colModel: [
    //            { display: 'Customer', name: 'Customer', width: 75, sortable: true, align: 'left', hide: true },
    //            { display: 'Date', name: 'CallHS_Date', width: 75, sortable: true, align: 'left' },
    //            { display: 'Time', name: 'Time', width: 50, sortable: true, align: 'left' },
    //            { display: 'Person', name: 'Person', width: 100, sortable: true, align: 'left' },
    //            { display: 'Note', name: 'Note', width: 650, sortable: true, align: 'left' }
    //        ],
    //        searchitems: [
    //            { display: 'Date', name: 'CallHS_Date' },
    //            { display: 'Person', name: 'Person' },
    //            { display: 'Note', name: 'Note' }
    //        ],
    //        showTableToggleBtn: true,
    //        //sortname: "OrderDate Desc,CustomerName asc",
    //        sortname: "CallHS_Date desc",
    //        sortorder: "",
    //        usepager: true,
    //        title: false,
    //        useRp: true,
    //        qtype: "",
    //        rp: 30000,
    //        nomsg: 'No records found!',
    //        singleSelect: true,
    //        showToggleBtn: false,
    //        resizable: false,
    //        autoload: true,
    //        showTableToggleBtn: false,
    //        width: 952,
    //        height: $(window).height() - 190,
    //        striped: true,
    //        onSuccess: function () {

    //            $(".imgLoaderForUser").hide();
    //            //For to show the error
    //            if ($("#fgrdOrderCallHS tr#row-2").length > 0) {
    //                $("#fgrdOrderCallHS tr#row-2").hide();
    //                //$.MessageBox($("#fgrdOrderCallHS tr#row-2")[0].innerText);
    //                $("#DivOrderCallHSDialog").dialog('destroy').remove();
    //                $.MessageBox("Cannot find activity log for INV#" + OrderNo);
    //                return false;
    //            }
    //            $('#fgrdOrderCallHS #row0').addClass("TotalRows");
    //            $("#DivOrderCallHS #ExportCSV").show();
    //        },
    //        params: [
    //          { name: 'Filter', value: Query },
    //          { name: 'OrderNo', value: OrderNo },
    //          { name: 'ExportCSV', value: '' }
    //        ],
    //        onError: function (xhr, status, errorThrown) {
    //            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {

    //                window.location.href = "Login.aspx";
    //            }

    //        }
    //    });
    //    gridalreadyintialized = true;
    //    $("#DivOrderCallHS .sDiv").css('float', 'left').css('width', '575px');
    //    $('#DivOrderCallHS .pDiv').css('padding', '2px').css('border-left', '0px');
    //    $('#DivOrderCallHS .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    //    $("#DivOrderCallHS .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //    //$("#DivOrderCallHS .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    //    $("#DivOrderCallHS .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    //    gridalreadyintialized = true;

    //}



    //ABI::27-SEP-2016::Email or Fax the Order from Order details 
    $("#DialogEmailOrFaxtheOrder").dialog({
        autoOpen: false,
        resizable: false,
        width: 500,
        height:350,
        modal: true,
        title: 'Email To',
        buttons: {
            Send: function () {

                if ($("#txtEmailIDsForOrder").val().trim() == "" && $("#hfEmailorFaxOrder").text() == "Email") {
                    $.MessageBox("Emailid is required!!!");
                    $("#txtEmailIDsForOrder").focus();
                    return;
                }

                if ($("#txtFaxForOrder").val().trim() == "" && $("#hfEmailorFaxOrder").text() == "Fax") {
                    $.MessageBox("Fax# is required!!!");
                    $("#txtFaxForOrder").focus();
                    return;
                }

                var EmailID = ''
                if ($("#hfEmailorFaxOrder").text() == "Email") {
                    EmailID = $("#txtEmailIDsForOrder").val();
                }
                else {
                    var FaxNo = $("#txtFaxForOrder").val();
                    EmailID = FaxNo + "@faxage.com"
                }
                var Subject = $("#txtEmailSubjectDetailForOrder").val();
                var Body = $("#txtEmailBodyDetailForOrder").val();
                var Order = $("#DialogEmailOrFaxtheOrder").data("Order");
                var Type = 'Email';
                $("#DialogEmailOrFaxtheOrder").next('div').find('.msgui').show();
                var OrderDetailsCurrentDivID = $("#CustCurrentDivID").html();
                var ShippingDate = $("#" + OrderDetailsCurrentDivID + " .lblInvoiceDate1").html();
//                $.ajax({
//                    type: "POST",
//                    url: 'BloomService.asmx/ScheduleOrders',
//                    data: "{'OrderNo':'" + Order + "','EmailIDs':'" + EmailID + "','ShippingDate':'" + ShippingDate + "','IsEmailOrFax':'" + $("#hfEmailorFaxOrder").text() + "','Customer':'0'}",
//                    //url: 'BloomService.asmx/PrintInvoiceReport',
//                    //data: "{'Order':'" + Order + "','Type':'" + Type + "','EmailIDs':'" + EmailID + "','CustName':'','ShippingDate':'" + ShippingDate + "','isPrintForEmail':" + true + "}",
//                    contentType: "application/json; charset=utf-8",
//                    dataType: "json",
//                    success: function (output, status) {

//                        if (output.d == "LogOut") {
//                            window.location.href = "Login.aspx"
//                        }
//                        else if (output.d.indexOf("error") >= 0) {
//                            $("#msgbox-select").dialog("close");
//                            $.MessageBox(output.d.substring(5, output.d.length));
//                        }
//                        else if (output.d == "No Data") {
//                            $.MessageBox("No Data");
//                        }
//                        else {
//                            //$("#fgrdOrderHeader #row" + Order + "").find("td div").eq(12)[0].innerHTML = "<img style='margin-top:-3px; margin-left:3px' src='images/greentick.png'>";  //Check Printed='Yes'
//                            $("#DialogEmailOrFaxtheOrder").dialog("close");
//                        }
//                    }
//                });

                // 04 Apr 2019 :: SALES-Invoice emailed from Invoice view should not add"printed" checkmark
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PrintInvoiceReportAsync',
                    data: "{'Order':'" + Order + "','Type':'" + Type + "','EmailIDs':'" + EmailID + "','Subject':'" + Subject + "','Body':'" + Body + "','CustName':'','ShippingDate':'" + ShippingDate + "','isPrintForEmail':" + true + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d.indexOf("error") >= 0) {
                            $("#msgbox-select").dialog("close");
                            $.MessageBox(output.d);
                        }
                        else if (output.d == "No Data") {
                            $.MessageBox("No Data");
                        }
                        else if (output.d.includes("success")) {
                            var result = output.d.split('-');
                            UpdateEmailLog(result[1], "INVOICE", Order);
                        }
                        $("#DialogEmailOrFaxtheOrder").dialog("close");
                    }
                });

            },
            Close: function () {
                $("#DialogEmailOrFaxtheOrder").dialog("close");
            }
        },
        open: function () {

            $(".ui-dialog-buttonpane button:contains('Send')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    function UpdateEmailLog(MESSAGE_ID, EMAILTYPE, EMAILEDDOCUMENTNUMBER) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UpdateEmailLog',
            data: '{"MESSAGE_ID": "' + MESSAGE_ID + '","EMAILTYPE": "' + EMAILTYPE + '","EMAILEDDOCUMENTNUMBER": "' + EMAILEDDOCUMENTNUMBER + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                debugger;
                if (output.d.includes("success")) {
                    $.growl.notice({ title: "", message: output.d });
                }
                else
                    $.growl.error({ title: "", message: output.d });

            }
        });
    }

    $("#DivConsigneeDialog").dialog({
        autoOpen: false,
        resizable: false,
        width: 300,
        height: 150,
        modal: true,
        title: 'Consignee',
        buttons: {
            Save: function () {
                var customer = $("#ctl00_DivCustomerNo_OrderDetails").html();
                var carrier = $("#lblCarrier").text();
                var Shipto = $("#txtShipto").val();
                var account = $("#txtAccount").val();
                debugger;
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveCarrierCodeDetails',
                    data: '{"ID":"0","Shipto":"' + Shipto + '","Customer":"' + customer + '","Carrier":"' + carrier + '","Account":"' + account + '","Zone":""}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        debugger;
                        if (output.d == "Success") {
                            $("#lblConsignee").html("<p>" + account + "</p>");
                            $("#DivConsigneeDialog").dialog("close");

                        }
                        else {
                            $.MessageBox(output.d);
                        }
                    }
                });

            },
            Close: function () {
                $("#DivConsigneeDialog").dialog("close");
            }
        },
        open: function () {

            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
    });

    $("#btnOrderDetailsEmail").die("click").live("click", function () {

        var hasnegativeor0boxes = true;
        var Subject = '<%=ConfigurationManager.AppSettings("CompanyName").ToString()%>' + " Invoice No.";
        var orderNo = $("#ctl00_DivOrderNo").html();
        var OrderDetailsCurrentDivID = $("#CustCurrentDivID").html();
        var ShippingDate = $("#" + OrderDetailsCurrentDivID + " .lblInvoiceDate1").html();
        ShippingDate = $.datepicker.formatDate("mm/dd/yy", new Date(ShippingDate));

        if (orderNo.includes(",")) {
            Subject += orderNo;
        } else {
            Subject += orderNo + " For shipping date " + ShippingDate;
        }

        if (hasnegativeor0boxes) {
            var Order = $("#DivOrderDetailsDialog").data("Order");
            $("#hfEmailorFaxOrder").text("Email");
            $(".EmailOrderSection").show();
            $(".FaxOrderSection").hide();
            var DelType = '\'E\'';  // Remove fax when emailing :: var DelType = '\'E\''+ ',' + '\'F\''; :: modified by Abinaya :: 12Jul2018
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustomerDocumentsAddress',
                data: '{"CustomerNo": "' + $("#ctl00_DivCustomerNo_OrderDetails").html() + '","DocType":"I","DelType":"' + DelType + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    debugger;
                    $("#txtEmailIDsForOrder").val(output.d)
                    $("#txtEmailSubjectDetailForOrder").val(Subject)
                    $("#DialogEmailOrFaxtheOrder").dialog('option', 'title', 'Email To');
                    $("#DialogEmailOrFaxtheOrder").dialog("option", "width", 500);
                    $("#DialogEmailOrFaxtheOrder").dialog("option", "height", 350);
                    $("#DialogEmailOrFaxtheOrder").next('div').find('.msgui').remove();
                    $("#DialogEmailOrFaxtheOrder").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif' </div>").css('height', '35px');
                    $("#DialogEmailOrFaxtheOrder").data('Order', Order).dialog("open");
                }
            });
        }
        else {
            $.MessageBox("Boxes cannot be 0 or less than 0. Unable to send email for this order!!!");
        }

       
    });

    $("#btnOrderDetailsFax").die("click").live("click", function () {
        var hasnegativeor0boxes = true;
        if (hasnegativeor0boxes) {
            var Order = $("#DivOrderDetailsDialog").data("Order");
            $("#hfEmailorFaxOrder").text("Fax")
            $(".EmailOrderSection").hide();
            $(".FaxOrderSection").show();
            var DelType = '\'F\'';
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustomerDocumentsAddress',
                data: '{"CustomerNo": "' + $("#ctl00_DivCustomerNo_OrderDetails").html() + '","DocType":"I","DelType":"' + DelType + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    var res = output.d;
                    //$("#txtFaxForOrder").val(res.Fax.replace("-", ""));
                    $("#txtFaxForOrder").val(res);
                    $("#DialogEmailOrFaxtheOrder").dialog("option", "width", 300);
                    $("#DialogEmailOrFaxtheOrder").dialog("option", "height", 150);
                    $("#DialogEmailOrFaxtheOrder").dialog('option', 'title', 'Fax To');
                    $("#DialogEmailOrFaxtheOrder").next('div').find('.msgui').remove();
                    $("#DialogEmailOrFaxtheOrder").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;display:none;'>Sending...  <img src='images/ajax-loader.gif'</div>").css('height', '35px');
                    $("#DialogEmailOrFaxtheOrder").data('Order', Order).dialog("open");
                }
            });
        }
        else {
            $.MessageBox("Boxes cannot be 0 or less than 0. Unable to send fax for this order!!!");
        }
     
    });

    $("#btnOrderDetailsKMisc").click(function () {

            var OrderNo = $("#ctl00_DivOrderNo").html();
            var CustomerNo = $("#ctl00_DivCustomerNo_OrderDetails").html();
            var para = 'Customer=' + CustomerNo + '&OrderNo=' + OrderNo;
            $(".imgLoaderForUser").show();

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPage',
                data: '{ "controlName":"pages/PageADDEDITMISC.ascx","controlPara":"' + para + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    $('<div id="DivKMISCDialog">/div>').dialog({
                        title: 'ADD KMISC',
                        autoOpen: false,
                        resizable: false,
                        modal: true,
                        width: 450,
                        closeOnEscape: true,
                        close: function (event, ui) {
                            $(this).dialog('destroy').remove();
                        },
                        open: function () {
                            //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                        }
                    });
                    $("#DivKMISCDialog").html(output.d).dialog("open");
                }
            });
    });


    $("[id^=OrderDetailEdit_]").die("click").live("click", function () {
        if ($('#fgrdOrderDetails .trChecked').length > 0) {
            $("#OrderUpdateIsCheckFirst").val(1);
            OrderUpdate($('#fgrdOrderDetails .trChecked').children("td").eq(2).children("div").eq(0).children("img"));
        }
        else {
            if (UserRightsforEditOrder()) {
                OrderUpdate($(this));
            }
        }
    });
     function LoadUOM_OrderUpdate() {
        var length = $('#lstUOM_FutureOrderDetail > option').length;
        var farmcode = $("#lstFarm_FutureOrderDetail")[0].value;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForSPORD',
                data: '{"FarmCode":"' + farmcode.toUpperCase() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstUOM_FutureOrderDetail').empty();
                    var UOMdata = output.d;
                    $('#lstUOM_FutureOrderDetail').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstUOM_FutureOrderDetail').append('<option value="' + UOM.UOM + '">' + UOM.UOM + ' [' + UOM.SIZE + ']</option>');
                    }

                    if ($("#hfUOM_FutureOrderDetail").val() != "" && $("#hfUOM_FutureOrderDetail").val() != 0)
                        $('#lstUOM_FutureOrderDetail').val($("#hfUOM_FutureOrderDetail").val());
                    else
                        $("#lstUOM_FutureOrderDetail").val("QB");
                }
            });
        }
        else {
            $('#lstUOM_FutureOrderDetail').val($("#hfUOM_FutureOrderDetail").val());
        }
    }

    function OrderUpdate($element) {
        if (UserRightsforChangePrice()) {
            var Farmcode = $element.attr('id').replace("OrderDetailEdit_", "").split("~")[1];
            //if (Farmcode == "ZZ") {
            //    if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person") {
            //        $.MessageBox("You do not have rights to modify this line!!!");
            //        return false
            //    }
            //}
            ////if ($("#ctl00_LoggedUserType").html() == "sales person") {
            //    $.MessageBox("You do not have rights to modify this order!!!");
            //   return false
            //}
            var OrderNo = $("#ctl00_DivOrderNo").html();
            var CustomerNo = $("#ctl00_DivCustomerNo_OrderDetails").html();
            var ID = $element.attr('id').replace("OrderDetailEdit_", "").split("~")[0];
            var haspermissiontomodifyprintedorderspriceonly = ($("#ctl00_DivSalesManPermissions").html().substring(4, 3))
            var haspermissiontomodifyprintedorders = ($("#ctl00_DivSalesManPermissions").html().substring(3, 2))
            //read by id instead of column index
            //var AWB = $('#fgrdOrderDetails #row' + ID).find("td div").eq(14).text();
            var AWB = $("#NewOrderDetailAWB_" + ID).html();
            if (AWB) { AWB = AWB.trim(); }

            if ($("#OrderDetailType_" + ID).html() == "K") {
                var para = 'Customer=' + CustomerNo + '&OrderNo=' + OrderNo + '&OrderDetailID=' + ID;
                $(".imgLoaderForUser").show();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetPage',
                    data: '{ "controlName":"pages/PageADDEDITMISC.ascx","controlPara":"' + para + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        $('<div id="DivKMISCDialog">/div>').dialog({
                            title: 'EDIT KMISC',
                            autoOpen: false,
                            resizable: false,
                            modal: true,
                            width: 450,
                            close: function (event, ui) {
                                $element.dialog('destroy').remove();
                                $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' })
                            },
                            open: function () {
                                //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                            }
                        });
                        $("#DivKMISCDialog").html(output.d).dialog("open");
                    }
                });
            }
            else if ($("#OrderDetailType_" + ID).html() != "K" && AWB.trim()=="")
            {    
                debugger;
                $("#ctl00_DivOrderDetailID_OrderSave").html(ID);
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetFutureOrderDetailsByID',
                    data: '{"OrderDetailID":"' + ID + '", "ClosedInv":0}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        var orddet = output.d;
                        if (orddet == "Logout") {
                            window.location.href = "Login.aspx"
                            return;
                        }
                        else if (orddet == "error") {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            return
                        }
                        else {
                            LoadUOM();                           
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/GetFutureOrderDetailsByID',
                                data: '{"OrderDetailID":"' + ID + '", "ClosedInv":0}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output, status) {
                                    var orddet = output.d;
                                    if (orddet == "Logout") {
                                        window.location.href = "Login.aspx"
                                        return;
                                    }
                                    else if (orddet == "error") {
                                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                        return
                                    }
                                    else {
                                        LoadUOM();
                                        $.ajax({
                                            type: "POST",
                                            url: 'BloomService.asmx/GetFarmListByFlower',
                                            data: "{'Flower':'" + orddet.Flower + "'}",
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (output, status) {                                                 
                                                $('#lstFarm_FutureOrderDetail').empty();
                                                var Typedata = output.d;
                                                $('#lstFarm_FutureOrderDetail').append('<option value="">Select</option>');
                                                $('#lstFarm_FutureOrderDetail').append(Typedata);
                                                LoadUOM_OrderUpdate();
                                                var FlowerCodeName = "[" + orddet.Flower + "] " + orddet.NAME;
                                                $("#txtFlower_FutureOrderDetail").val(FlowerCodeName);
                                                $("#txtFlower_FutureOrderDetail").attr("placeholder", FlowerCodeName);
                                                $("#txtUnitsPerBox_FutureOrderDetail").val(orddet.Units); // commented by Belal :: 30 Aug 2020
                                                $("#txtUnitsPerBox_FutureOrderDetail").attr("placeholder", orddet.Units);
                                                $("#txtQty_FutureOrderDetail").val(orddet.Boxes); // commented by Belal :: 30 Aug 2020
                                                $("#txtQty_FutureOrderDetail").attr("placeholder", orddet.Boxes);
                                                $("#hfFlower_FutureOrderDetail").val(orddet.Flower);
                                                $("#hfFlowerName_FutureOrderDetail").val(orddet.NAME);
                                                $("#txtPrice_FutureOrderDetail").attr("placeholder", orddet.Price.toFixed(3));
                                                $("#txtPrice_FutureOrderDetail").val(orddet.Price.toFixed(3)); // commented by Belal :: 30 Aug 2020
                                                $("#txtNotes_FutureOrderDetail").val(orddet.Notes);
                                                $("#txtBoxCode_FutureOrderDetail").val(orddet.BoxCode);
                                                $("#lstFarm_FutureOrderDetail").val(orddet.FarmCode);
                                                $("#hfFarm_FutureOrderDetail").val(orddet.FarmCode);
                                                $("#lstUOM_FutureOrderDetail").val(orddet.UOM);
                                                $("#hfUOM_FutureOrderDetail").val(orddet.UOM);
                                                if (orddet.PODFlower != "") {
                                                    $("#ctl00_DivPODflower_OrderSave").html(orddet.PODFlower);
                                                    $("#lblPODflower_FutureOrder").html(orddet.PODFlower);
                                                    $("#lblPODate_FutureOrder").html(orddet.PODate);
                                                    $("#lblPOBoxnum_FutureOrder").html(orddet.POBOXNUM);
                                                    $("#lblShipdate_FutureOrder").html(orddet.ShipDate);
                                                    $("#trPODetail").css('display', 'table-row');
                                                    $("#ctl00_DivHeight").html("550");

                                                    $("#txtFlower_FutureOrderDetail").attr("disabled", "disabled");
                                                    $("#txtUnitsPerBox_FutureOrderDetail").attr("disabled", "disabled");
                                                    $("#txtQty_FutureOrderDetail").attr("disabled", "disabled");
                                                    $("#lstFarm_FutureOrderDetail").attr("disabled", "disabled");
                                                    $("#lstUOM_FutureOrderDetail").attr("disabled", "disabled");
                                                    $("#txtNotes_FutureOrderDetail").attr("disabled", "disabled");
                                                }
                                                else {
                                                    $("#ctl00_DivPODflower_OrderSave").html("");
                                                    $("#lblPODflower_FutureOrder").html("");
                                                    $("#lblPODate_FutureOrder").html("");
                                                    $("#lblPOBoxnum_FutureOrder").html("");
                                                    $("#lblShipdate_FutureOrder").html("");
                                                    $("#trPODetail").css('display', 'none');
                                                    $("#ctl00_DivHeight").html("550");

                                                    $("#txtFlower_FutureOrderDetail").removeAttr("disabled");
                                                    $("#txtUnitsPerBox_FutureOrderDetail").removeAttr("disabled");
                                                    $("#txtQty_FutureOrderDetail").removeAttr("disabled");
                                                    $("#lstFarm_FutureOrderDetail").removeAttr("disabled");
                                                    $("#lstUOM_FutureOrderDetail").removeAttr("disabled");
                                                    $("#txtNotes_FutureOrderDetail").removeAttr("disabled");
                                                }
                                                debugger;
                                                $("#txtCost_FutureOrderDetail").val(orddet.Cost.toFixed(4));
                                                $("#txtCost_FutureOrderDetail").attr("disabled","disabled");
                                                if (orddet.Price == 0 || orddet.Cost == 0) {
                                                    $("#txtGPM_FutureOrderDetail").val(0);
                                                } else {
                                                    let gpm = ((orddet.Price - orddet.Cost) / orddet.Price) * 100;
                                                    $("#txtGPM_FutureOrderDetail").val(gpm);
                                                }

                                                //2021/08/24
                                                $("#txtUPC_FutureOrderDetail").val(orddet.UPC);
                                                $("#txtUPCPRICE_FutureOrderDetail").val(orddet.UPCPRICE);
                                                $("#txtDateCode_FutureOrderDetail").val(orddet.DateCode);

                                                $("#AddOrderDetailFromFutureDialog").dialog("open");
                                                $("#AddOrderDetailFromFutureDialog").dialog('option', 'title', 'Edit Future Order Detail');
                                                $("#AddOrderDetailFromFutureDialog").dialog('option', 'height', $("#ctl00_DivHeight").html());
                                            }
                                        });

                                    }
                                }
                            });
                        }
                    }
                });            
            }
            else {
                
                $("#ctl00_DivOrderDetailID_OrderSave").html(ID);
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetOrderDetailsByID',
                    data: '{"OrderDetailID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        var orddet = output.d;
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/InsertLock',
                            data: "{ 'LockRecord': '" + orddet.InvenID + "','Page':'PageOrderSaveProcess','Functionality':'InvenLock_Edit'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                var data = output.d;
                                if (data == "Logout") {
                                    IsInventoryClick = false;
                                    window.location.href = "Login.aspx"
                                }
                                else if (data == "error") {
                                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                    IsInventoryClick = false;
                                }
                                else if (data.indexOf("NotExist") >= 0 || data.indexOf("NoBoxes") >= 0) {
                                    var tempcurrentdivid = $("#CustCurrentDivID").html();
                                    var lineFuelCustomer = $("#" + tempcurrentdivid + " .hf_linefuel").html();

                                    //If #4 setUp is Yes, only price can be edited whether printed or scanned - SK 061819
                                    if ((haspermissiontomodifyprintedorderspriceonly == "Y") && ($("#OrderIsScanned").html() == "1" || $("#OrderIsPrinted").html() == "1")) {
                                        $("#txtQty_AddOrderDetail").attr("disabled", "disabled");
                                    }

                                    //Above condition is overwritten by the conditions below - SK 061819
                                    //If order is scanned and printed, #3 should be able to change Price only. Not Qty.
                                    if ((haspermissiontomodifyprintedorders == "Y") && $("#OrderIsScanned").html() == "1" && $("#OrderIsPrinted").html() == "1") {
                                        $("#txtQty_AddOrderDetail").attr("disabled", "disabled");

                                    }

                                    ////If order is not scanned but printed, #3 yes should be able to change Price and Qty.
                                    if ((haspermissiontomodifyprintedorders == "Y") && $("#OrderIsPrinted").html() == "1" && $("#OrderIsScanned").html() == "0") {
                                        $("#txtQty_AddOrderDetail").removeAttr("disabled");
                                        $("#txtQty_AddOrderDetail").attr("enabled", "enabled");

                                    }
                                    ////If order is not scanned not printed, #3 yes should be able to change Price and Qty.
                                    if ((haspermissiontomodifyprintedorders == "Y") && $("#OrderIsPrinted").html() == "0" && $("#OrderIsScanned").html() == "0") {
                                        $("#txtQty_AddOrderDetail").removeAttr("disabled");
                                        $("#txtQty_AddOrderDetail").attr("enabled", "enabled");
                                    }

                                    if (lineFuelCustomer == "false") {
                                        $("#txtPlusFuel_AddOrderDetail").removeAttr("disabled");
                                        $("#txtPrice_AddOrderDetail").attr("disabled", "disabled");
                                    }
                                    else {
                                        $("#txtPlusFuel_AddOrderDetail").attr("disabled", "disabled");
                                        $("#txtPrice_AddOrderDetail").removeAttr("disabled");
                                    }
                                    $("#lblInvenIDs_AddOrderDetail").html(orddet.InvenID);
                                    $("#lblFlowerName_AddOrderDetail").html(orddet.NAME);
                                    $("#lblFlowerUnits_AddOrderDetail").html(orddet.Units);
                                    $("#txtQty_AddOrderDetail").attr('placeholder', orddet.Boxes);
                                    $("#txtQty_AddOrderDetail").val("");
                                    $("#lblUOM_AddOrderDetail").html(orddet.UOM);
                                    $("#txtPrice_AddOrderDetail").val("");
                                    $("#txtPlusFuel_AddOrderDetail").val("");
                                    $("#txtPrice_AddOrderDetail").attr('placeholder', parseFloat(orddet.Price).toFixed(4));
                                    $("#txtPlusFuel_AddOrderDetail").attr('placeholder', parseFloat(orddet.PlusFuel).toFixed(4));
                                    $("#lblFuel_AddOrderDetail").html(parseFloat(parseFloat(orddet.PlusFuel).toFixed(4) - parseFloat(orddet.Price).toFixed(4)).toFixed(4));
                                    //$("#txtPlusFuel_AddOrderDetail").attr('placeholder', parseFloat(orddet.FOB).toFixed(4));
                                    //$("#txtPlusFuel_AddOrderDetail").val(parseFloat(orddet.Fuel).toFixed(4));
                                    $("#lblAvailableQty_AddOrderDetail").html(orddet.AvailableBoxes);
                                    $("#lstSaleType_AddOrderDetail").val(orddet.Type);
                                    $("#txtSaleType_AddOrderDetail").attr('placeholder', orddet.Type);
                                    debugger;
                                    $("#txtBoxCode_AddOrderDetail").val(orddet.BoxCode);
                                    $("#txtStoreNo_AddOrderDetail").val(orddet.StoreNo);
                                    $("#txtUpcCode_AddOrderDetail").val(orddet.UPC);
                                    $("#txtUpcPrice_AddOrderDetail").val(orddet.UPCPRICE);
                                    $("#txtDateCode_AddOrderDetail").val(orddet.DateCode);
                                    $("#txtFlowerName_AddOrderDetail").val(orddet.NAME);

                                    //Muthu Nivetha M :: 19Feb2020 :: Modified :: To add FBE,Dimentions,Cubes and GPM while loading inventory for sales
                                    $("#lblFBE_AddOrderDetail").html(parseFloat(orddet.FBE).toFixed(4));
                                    $("#lblDimensions_AddOrderDetail").html(orddet.Dimentions);
                                    $("#lblCost_AddOrderDetail").html(parseFloat(orddet.Cost).toFixed(4));
                                    $("#lblCubes_AddOrderDetail").html(parseFloat(orddet.Cubes).toFixed(4));
                                    $("#lblGPM_AddOrderDetail").html(orddet.gpm +"%");
                                    $("#lblInvenId_AddOrderDetail").html(orddet.InvenID);
                                    $("#txtNewBoxCode_AddOrderDetail").val(orddet.BoxCode);

                                    var existingOrderDetailID = $("#ctl00_DivOrderDetailID_OrderSave").html() == "" ? 0 : $("#ctl00_DivOrderDetailID_OrderSave").html();
                                    $("#AddOrderDetailFromInventoryDialog").dialog("open")
                                    $("#AddOrderDetailFromInventoryDialog").dialog('option', 'title', 'Update Order Detail :: ' + existingOrderDetailID);
                                    
                                }
                                else if (data != "") {
                                    var tmp = data.split("_")
                                    if ($('#fgrdOrderDetails .trChecked').length > 0) {
                                        $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + " ! So the next item will be processed");
                                    }
                                    else {
                                        $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + " !");
                                    }
                                    var currentOrderRowID = $('#fgrdOrderDetails .trChecked').attr('id')
                                    $('#' + currentOrderRowID).attr('class', '')
                                    if ($('#fgrdOrderDetails .trChecked').length > 0) {
                                        OrderUpdate($('#fgrdOrderDetails .trChecked').children("td").eq(2).children("div").eq(0).children("img"));
                                    }
                                }
                                else {
                                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                }                              
                            }
                        });

                    }
                });
            }
        }      
    }

    $("[id^=OrderDetailDelete_]").die("click").live("click", function () {

        if (UserRightsforEditOrder()) {
            var Farmcode = $(this).attr('id').replace("OrderDetailEdit_", "").split("~")[1];
            //if (Farmcode == "ZZ") {
            //    if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person") {
            //        $.MessageBox("You do not have rights to modify this order!!!");
            //        return false
            //    }
            //}
            //if ($("#ctl00_LoggedUserType").html() == "sales person") {
            //    $.MessageBox("You do not have rights to modify this order!!!");
            //    return false;
            //}
            var sourceCtl = $(this);
            var ID = sourceCtl.attr('id').substring(18).split("~")[0];

            var FlowerName = $("#OrderDetailName_" + ID).html();
            var Boxes = $("#OrderDetailBoxes_" + ID).html();
            if (Boxes.trim() == "") {
                Boxes = "0";
            }
            var Units = $("#OrderDetailUnits_" + ID).html();
            var UOM = $("#OrderDetailUOM_" + ID).html();

            $("#DivOrder").next('div').find('.msgui').hide();
            $('#DivOrder2SQLID').html(ID);

            var PODflower = $("#OrderDetailPODflower_" + ID).html();
            DeleteInvenId = $("#OrderDetailInvenId_" + ID).html();
            var Type = $("#OrderDetailType_" + ID).html();
            //if (DeleteInvenId != 0 && DeleteInvenId != "" && Type != "K" && Type != "O") {
            if (DeleteInvenId != 0 && DeleteInvenId != "") {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/InsertLock',
                    data: "{ 'LockRecord': '" + DeleteInvenId + "','Page':'PageOrderDetails','Functionality':'InvenLock_Delete'}",
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

                            $("#Deleteconfirm").html("<p>Are you sure to delete the " + Boxes + " " + UOM + "X" + Units + " " + FlowerName + "?</p>");
                            $("#Deleteconfirm").dialog("open");
                        }
                        else if (data != "") {

                            var tmp = data.split("_");
                            ClearLockedInventoryOrderDetails(function (callback) {
                            });
                            $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + "! ");
                            $("#Deleteconfirm").dialog("close");
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            ClearLockedInventoryOrderDetails(function (callback) {
                            });
                            $("#Deleteconfirm").dialog("close");
                        }
                    }
                });
            }
            else if ((DeleteInvenId == "" || DeleteInvenId == 0) && Type == "K") {
                $("#DeleteNewOrderMiscDetail").html("<p>Are you sure to delete the <b>" + Boxes + " " + FlowerName + "?</b></p>");
                $("#DeleteNewOrderMiscDetail").dialog("open");
            }
            else if (  (DeleteInvenId == "" || DeleteInvenId == 0) && Type == "O" ) // && (PODflower == "" ||  PODflower =="DENIED")  )//Future ORder Delete Add by Prashant on 23 June 2020
            {
                $("#DeleteNewOrderMiscDetail").html("<p>Are you sure to delete the <b>" + Boxes + " " + FlowerName + "?</b></p>");
                $("#DeleteNewOrderMiscDetail").dialog("open");
            }
            //else if (DeleteInvenId == "" || DeleteInvenId == 0) {
            //    $("#DeleteNewOrderMiscDetail").html("<p>Are you sure to delete the <b>" + Boxes + " " + FlowerName + "?</b></p>");
            //    $("#DeleteNewOrderMiscDetail").dialog("open");
            //}
            //else if ((DeleteInvenId == "" || DeleteInvenId == 0) && Type == "O" && PODflower == "")//Future ORder Delete Add by Prashant on 23 June 2020
            //{
            //    $("#DeleteNewOrderMiscDetail").html("<p>Are you sure to delete the <b>" + Boxes + " " + FlowerName + "?</b></p>");
            //    $("#DeleteNewOrderMiscDetail").dialog("open");
            //}
            else {
                // adialog.dialog("close");
                $.MessageBox("This product was purchased already, you must delete it from PO# ("+PODflower+") first");
            }
        }
    });
    $("#DeleteNewOrderMiscDetail").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var ID = $("#DivOrder2SQLID").html();                                
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteOrderMiscDetail',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success')
                        {
                            adialog.dialog("close");
                            $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            adialog.dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            },
            No: function () {               
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        }       
    });

    $("#Deleteconfirm").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);

                var ID = $("#DivOrder2SQLID").html();
                var OrderNo = $("#ctl00_DivOrderNo").html();
                var CustomerNo = $("#ctl00_DivCustomerNo_OrderDetails").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteOrderDetail',
                    data: '{"ID":"' + ID + '","OrderNo":"' + OrderNo + '","Customer":"' + CustomerNo + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d == "Inventory Error") {
                            $.MessageBox("Please contact admin, Inventory Mismatched");
                            $("#Deleteconfirm").dialog("close");
                        }
                        else if (output.d == 'success' || output.d == "voided") {                            
                            IsOrderModifiedAndNotSaved = true;
                            if (output.d == "voided") {
                                IsOrderModifiedAndNotSaved = false;
                                $("#DivOrderDetailsDialog").dialog('close');
                                $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                                $.MessageBox("All lines are dropped. Invoice# " + OrderNo + " voided successfully");                                
                            }
                            
                            $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
                            ClearLockedInventoryOrderDetails(function (callback) {
                            });
                            adialog.dialog("close");
                        }
                        else {
                            ClearLockedInventoryOrderDetails(function (callback) {
                            });
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            adialog.dialog("close");
                        }
                    }
                });
            },
            No: function () {
                ClearLockedInventoryOrderDetails(function (callback) {
                });
                $(this).dialog("close");
            }
        },

        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        },
        close: function () {
            ClearLockedInventoryOrderDetails(function (callback) {
            });
            //$(this).dialog("close");
        }
    });

    function ClearLockedInventoryOrderDetails(callback) {

        if (DeleteInvenId != 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteLock',
                data: "{ 'LockRecord': '" + DeleteInvenId + "','Page':'PageOrderDetails','Functionality':'InvenLockRelease'}",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: "json",
                success: function (output, status) {
                    var data = output.d;
                    DeleteInvenId = 0;
                    callback(true);
                }
            });
        }
        else {
            callback(true);
        }
    }


    var PageOrderSaveAlreadyLoadedFromOrddet = false;
    $("#btnOrderDetailsSave").die("click").live("click", function () {
        debugger;
        GetWarehouse();
        CheckIfHasAnyFutureOrder();
        if (UserRightsforChangePrice()) {
            $("#messageOrSaveclicked_OrderSave").html("save");
            debugger;
            console.log('test')
         
            var hasnegativeor0boxes = true;
            if (hasnegativeor0boxes)
            {
                IncludeMessageConfirmDlgcall();
                $("#IncludeMessageConfirmDlg").dialog("open");
            }
            else {
                $.MessageBox("Boxes cannot be 0 or less than 0. Unable to save this order!!!");
            }
        }
    });
    function CheckIfHasAnyFutureOrder() { // added by Belal 14 Aug 2020
        var awb = "";
        var po = ""
        var showCargo = false;
        var table = $("#fgrdOrderDetails tbody");
        var tbodyRowCount = table.find('tr').length - 1;
        debugger;
        table.find('tr').each(function (i, el) {
            debugger;
            var $tds = $(this).find('td');
            if (i < tbodyRowCount && $tds.eq(13).text().trim() == "" && $tds.eq(23).text().trim() != "K") {
                showCargo = true;
            }
        });
        if (showCargo) {
            //$("#CargoDateRow").show();
            GetDonotShowCargoDateValueFromConstant();
            if ($("#ctl00_DivOrderNo_OrderSave").html().trim() == "0") {
                var d = new Date($("#txtShippingDate_Or1").val());
                d.setDate(d.getDate() - 3)
                $("#txtCargoDate_Or1").val(d.toLocaleDateString("en-US"));
            } else {
                LoadCargoDateForOrderUpdate();
            }
        }
    }
    function GetDonotShowCargoDateValueFromConstant() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetDonotShowCargoDateValueFromConstant',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == true) {
                    $("#CargoDateRow").hide();
                } else {
                    $("#CargoDateRow").show();
                }
            }
        });
    }
    function LoadCargoDateForOrderUpdate() {
        var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html().trim();
        var Customer = $("#ctl00_DivCustomerNo_OrderSave").html();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadCargoDateForOrderUpdate',
            data: '{"ORDER":"' + OrderNo + '","CUSTOMER":"' + Customer + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "01/01/1900" || output.d =="1/1/1900") {
                    var d = new Date($("#txtShippingDate_Or1").val());
                    d.setDate(d.getDate() - 3)
                    $("#txtCargoDate_Or1").val(d.toLocaleDateString("en-US"));
                } else {
                    $("#txtCargoDate_Or1").val(output.d);
                }
            }
        });
    }

    function checkhasnegativeor0boxesInOrderUpdateScreen() {
        var isvalid = true;
        $("[id^=OrderDetailBoxes_").each(function () {
            debugger;
            var orderdetid = $(this).attr("id").replace("OrderDetailBoxes_", "");
            if (orderdetid != "0" && orderdetid != 0) {
                var boxes = $(this).html();
                if (parseFloat(boxes) <= 0) {
                    isvalid = false;
                }
            }
        });
        isvalid = false
        return isvalid;
    }

    function IncludeMessageConfirmDlgcall() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetMessagesfromMsgINV',
            contentType: "application/json; charset=utf-8",
            data: '{}',
            dataType: "json",
            success: function (output) {
                debugger;
                var data = output.d;
                $("#txtCustMsg1").val(data.Text1)
                $("#txtCustMsg2").val(data.Text2)
                $("#txtCustMsg3").val(data.Text3)
                $("#txtCustMsg4").val(data.Text4)
                $("#txtCustMsg5").val(data.Text5)
            }
        });
    }


    $("#btnOrderDetailsMessage").die("click").live("click", function () {
        $("#messageOrSaveclicked_OrderSave").html("message");
        $("#DivCustomerMessageDialog").dialog("open");
    });



    //$("#btnOrderDetailsMessage").die("click").live("click", function () {
    //    if (PageOrderSaveAlreadyLoaded == false) {
    //        var para = 'Customer=' + $("#ctl00_DivCustomerNo_OrderDetails").html() + '&OrderNo=' + $("#ctl00_DivOrderNo").html();

    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/GetPage',
    //            data: '{ "controlName":"pages/PageOrderSaveProcess.ascx","controlPara":"' + para + '" }',
    //            contentType: "application/json; charset=utf-8",
    //            dataType: "json",
    //            success: function (output, status) {

    //                $("#DivOrderSavePage").html("");
    //                $("#DivOrderSavePage").html(output.d);
    //                PageOrderSaveAlreadyLoaded = true;
    //                $("#DivCustomerMessageDialog").data("MessageClicked", "1").dialog("open");
    //            }
    //        });
    //    }
    //    else {
    //        $("#ctl00_DivCustomerNo_OrderSave").html($("#ctl00_DivCustomerNo_OrderDetails").html());
    //        $("#ctl00_DivOrderNo_OrderSave").html($("#ctl00_DivOrderNo").html());
    //        $("#DivCustomerMessageDialog").data("MessageClicked", "1").dialog("open");
    //        $("#DivCustomerMessageDialog").dialog("open");
    //    }
    //});

    $("#btnOrderDetailsTerms").die("click").live("click", function () {
        $("#DivTermsDialog_Ordersave").dialog("open");
    });

    $("#btnOrderDetailsZhipto").die("click").live("click", function () {
        if (UserRightsforEditOrder()) {
            $("#DivShiptoDialog_Ordersave").dialog("open");
        }
    });


    $("#btnOrderDetailsF5").die('click').live('click', function () {
        sessionStorage.setItem("shipToNameViewSave", $("#shipToNameView").html());
        sessionStorage.setItem("shipToAddress1ViewSave", $("#shipToAddress1View").html());
        sessionStorage.setItem("shipToAddress2ViewSave", $("#shipToAddress2View").html());
        sessionStorage.setItem("shipToCityViewSave", $("#shipToCityView").html());
        sessionStorage.setItem("shipToStateViewSave", $("#shipToStateView").html());
        sessionStorage.setItem("shipToZipViewSave", $("#shipToZipView").html());
        sessionStorage.setItem("shipToPhoneViewSave", $("#shipToPhoneView").html());
        sessionStorage.setItem("shipToFaxViewSave", $("#shipToFaxView").html());
        sessionStorage.setItem("shipToContactViewSave", $("#shipToContactView").html());
        sessionStorage.setItem("shipToCountryViewSave", $("#shipToCountryView").html());
        sessionStorage.setItem("shipToViewSave", $("#shipToView").html());

        var Customer = $("#ctl00_DivCustomerNo_OrderDetails").html();
        $("#fgrdARINVCustomer").empty();
        $("#fgrdARINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'IsARINVHistory', value: "0" }], query: "", newp: 1 }).flexReload();
        //$("#DivARINVCustomerGridDialog .bDiv").css("height", "474px");

        $("#DivARINVCustomerGridDialog").dialog('option', 'title', 'ARINVS Info For Customer :: ' + Customer + '');
        $("#DivARINVCustomerGridDialog").data("Customer", Customer).dialog("open");
    });

    $("#btnOrderDetailsF7").die('click').live('click', function () {

        var OrderNo = $("#ctl00_DivOrderNo").html();
        var para = 'Page=CallHS&OrderNo=' + OrderNo;
        $(".imgLoaderForUser").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageHistory.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#DivOrderSummaryDialog").css('display', 'none');
                $("#DivOrderDetailsDialog").css('disply', 'none');
                $("#DivOrderCallHSDialog").css('display', 'block');
                $('<div id="DivOrderCallHSDialog">/div>').dialog({
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
                $("#DivOrderCallHSDialog").html(output.d).dialog("open");
            }
        });
    });

    //$('#DivOrderCallHSDlg11').dialog({
    //    title: '',
    //    autoOpen: false,
    //    resizable: false,
    //    modal: true,
    //    width: 1203,
    //    close: function (event, ui) {
    //        $(this).dialog('destroy').remove();
    //    },
    //    open: function () {
    //        $("#fgrdOrderCallHS").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
    //    }
    //});

    $("#btnOrderDetailsF6").die('click').live("click", function (e) {

        try {
            $("#DivCurrentOrdersDialog").dialog("close");
        }
        catch (ex) { }
        var Customer = $("#ctl00_DivCustomerNo_OrderDetails").html();

        var para = 'Customer=' + Customer;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCurrentOrdersForCustomer.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DivCurrentOrdersDialog">/div>').dialog({
                    title: 'Current Order',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1030,
                    height: $(window).height() - 10,
                    //closeOnEscape:false,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        $("#DivCurrentOrdersDialog").focus();
                    },

                });
                $("#DivCurrentOrdersDialog").dialog('option', 'title', 'Current Order Detail for Customer ::' + Customer);
                $("#DivCurrentOrdersDialog").html(output.d).dialog("open");
            }
        });

    });


    $("#DivOrderDetailsConsolView").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 1000,
        height: 480,
        modal: true
    });


    $("#fgrdOrderDetailsConsolView").flexigrid({
        url: 'BloomService.asmx/OrderDetailConsolView',
        dataType: 'xml',
        colModel: [
                 { display: 'INV#', name: 'Order', width: 80, sortable: true, align: 'left', hide: true },
                 { display: 'InvType', name: 'InvenType', width: 30, sortable: false, align: 'left', hide: true },
                 { display: 'Flower', name: 'Flower', width: 100, sortable: true, align: 'left' },
                 { display: 'Description', name: 'Name', width: 230, sortable: true, align: 'left' },
                 { display: 'Farm', name: 'FarmCode', width: 30, sortable: true, align: 'left' },
                 { display: 'Boxes', name: 'Boxes', width: 30, sortable: false, align: 'right' },/*jose changed :: left to right align*/
                 { display: 'UOM', name: 'UOM', width: 30, sortable: false, align: 'left' },
                 { display: 'Units', name: 'Units', width: 30, sortable: false, align: 'right' },
                 { display: 'TotalUnits', name: 'TotalUnits', width: 60, sortable: false, align: 'right' },
                 { display: 'FOB', name: 'FOB', width: 50, sortable: false, align: 'right' },
                 { display: 'Total $', name: 'TotPerLine', width: 60, sortable: true, align: 'right' },
                  { display: 'Dimentions', name: '', width: 80, sortable: true, align: 'right' },
                 { display: 'Cubes', name: 'Cubes', width: 50, sortable: true, align: 'right' },
                  { display: 'Weight', name: 'WEIGHT', width: 50, sortable: true, align: 'right' },
                 { display: 'Cat', name: 'CAT', width: 40, sortable: true, align: 'left', hide: true },
                 { display: 'Color', name: 'Color', width: 40, sortable: true, align: 'left', hide: true },
                 { display: 'Variety', name: 'VARIETY', width: 80, sortable: true, align: 'left', hide: true },
                 { display: 'Grade', name: 'GRADE', width: 50, sortable: true, align: 'left', hide: true },
        ],
        searchitems: [
            { display: 'INV#', name: 'Order' },
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'Name' },
            { display: 'Farm', name: 'FarmCode' },
            { display: 'Boxes', name: 'Boxes' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Units', name: 'Units' },
            { display: 'TotalUnits', name: 'TotalUnits' },
            { display: 'Dimentions', name: 'Dimentions' },
            { display: 'Weight', name: 'WEIGHT' },
            { display: 'Cubes', name: 'Cubes' },
            { display: 'Cat', name: 'CAT' },
            { display: 'Color', name: 'Color' },
            { display: 'Variety', name: 'Variety' },
            { display: 'Grade', name: 'Grade' },
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
        autoload: false,
        showTableToggleBtn: false,
        width: 955,
        height: 350,
        striped: true,
        params: [
        { name: 'Filter', value: '' },
        { name: 'OrderNo', value: '' },
        { name: 'ExportCSV', value: '' }
        ],
        onSuccess: function () {


            var sel = jQuery("#fgrdOrderDetailsConsolView tbody tr");
            var len = sel.length;
            if (len > 1) {
                $("#DivOrderDetailsConsolView #ExportCSV").show();
            }
            //$("#fgrdOrderDetailsConsolView").parent(".bDiv").find("table tr:last td").addClass("TotalRows");
            $('#fgrdOrderDetailsConsolView #row0').addClass("TotalRows");
            $("#DivOrderDetailsConsolView .sDiv").css('float', 'left').css('width', '542px');
            $('#DivOrderDetailsConsolView .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#DivOrderDetailsConsolView .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivOrderDetailsConsolView .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivOrderDetailsConsolView .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });

    $("#btnOrderDetailsConsolView").die('click').live('click', function () {

        $("#DivOrderDetailsConsolView").dialog('option', 'title', 'Consol View');
        $("#DivOrderDetailsConsolView").dialog("open");
        var orderno = $("#ctl00_DivOrderNo").html();
        $("#fgrdOrderDetailsConsolView").flexOptions({ params: [{ name: 'OrderNo', value: orderno }, { name: 'Filter', value: "" }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
    });

    $("#btnOrderDetailsF8").die('click').live('click', function () {
        var para = 'Customer=' + $("#ctl00_DivCustomerNo_OrderDetails").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageSPORD.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DivSPORDDialog">/div>').dialog({
                    title: 'SPORD',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1360,
                    height: $(window).height() - 10,
                    //closeOnEscape:false,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        $("#DivSPORDDialog").focus();
                    },

                });
                $("#DivSPORDDialog").dialog('option', 'title', 'SPORD Details for Customer :: ' + $("#ctl00_DivCustomerNo_OrderDetails").html());
                //$("#DivSPORDDialog").dialog('option', 'title', 'SPORD Details for Customer ::' + $("#CurrentCustomerNo").html());
                $("#DivSPORDDialog").html(output.d).dialog("open");
            }
        });
    });


    $("#btnOrderDetailsAdd").die('click').live('click', function () {
        if (UserRightsforEditOrder()) {            
            $("#InventoryListForOrderEntryDialog").dialog("open");
        }
    });


    $("#OrderDetailselectall").die('click').live("click", function (e) {    
        var sourceCtl = $(this);
        var img = sourceCtl.attr("src").toLowerCase();
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }
        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            $('#fgrdOrderDetails tr:visible').addClass("trChecked");
            $('#fgrdOrderDetails tr#row0').removeClass("trChecked");
            $("[id^=OrderDetailselect_]:visible").prop("src", "images/check-on.png");
            // $("[id^=OrderDetailselect_]:visible").attr('class', 'Orderselected');
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");
            $('#fgrdOrderDetails tr').removeClass("trChecked");
            // $("[id^=OrderDetailselect_]:visible").removeClass('Orderselected');
            $("[id^=OrderDetailselect_]").prop("src", "images/check-off.png");
        }

    });

    $("[id^=OrderDetailselect_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id');
        var img = sourceCtl.attr("src").toLowerCase();

        var headers = ID.replace("OrderDetailselect_", "");
        var Selected = "0";
        if (img.indexOf("off") > 0) {
            Selected = "1";
        }

        if (Selected == "1") {
            sourceCtl.prop("src", "images/check-on.png");
            sourceCtl.closest('tr').addClass("trChecked");
            //sourceCtl.attr('class', 'Orderselected');
        }
        else {
            sourceCtl.prop("src", "images/check-off.png");            
            $("[id ^= OrderDetailselectall]").attr("src", "images/check-off.png");
            sourceCtl.closest('tr').removeClass("trChecked");
            //sourceCtl.attr('class', 'unOrderselected');
        }
    });




    $("#aDropLineToNewOrder").die('click').live('click', function () {
        $("#DivOrder1InfoDialog").dialog("open");
        debugger
        $("#txtShippingDate_Or1").val("");
        var setdate = $("#DivOrderDetailsDialog .lblInvoiceDate1").html();
        //ChangeCarrier($("#txtShippingDate_Or1").val());
        const today = new Date()
        const tomorrow = new Date(today)
        tomorrow.setDate(tomorrow.getDate() + 1)
        $("#txtShippingDate_Or1").val(tomorrow.toString("MM/dd/yyyy"));
        $("#lblShippingDay_Or1").html(dayNames[new Date($("#txtShippingDate_Or1").val()).getDay()]);
    });



    //Drop the line into anouther order
    $("#btnOrderDetailsVDrop").die('click').live("click", function (e) {
        if (UserRightsforEditOrder()) {

            if ($("#fgrdOrderDetails .trChecked").length > 0) {
                try {
                    $("#DivCurrentOrdersDialog").dialog('destroy').remove();
                }
                catch (ex) { }
                var Customer = $("#ctl00_DivCustomerNo_OrderDetails").html();

                var para = 'Customer=' + Customer;
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetPage',
                    data: '{ "controlName":"pages/PageCurrentOrdersForCustomer.ascx","controlPara":"' + para + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $('<div id="DivCurrentOrdersDialog">/div>').dialog({
                            title: 'DROP',
                            autoOpen: false,
                            resizable: false,
                            modal: true,
                            width: 1030,
                            height: $(window).height() - 10,
                            //closeOnEscape:false,
                            close: function (event, ui) {
                                $(this).dialog('destroy').remove();
                            },
                            open: function () {
                                
                            },

                        });
                        $("#DivCurrentOrdersDialog").dialog('option', 'title', 'Drop Order Detail for Customer ::' + Customer);
                        $("#DivCurrentOrdersDialog").html(output.d).dialog("open");
                    },
                    complete: function () {
                        GetWarehouse();
                    }
                });
            }
            else {
                $.MessageBox("Please select a line to drop.");
            }
        }

    });

    function GetWarehouse() {
        var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
        var CustomerNo = $("#CurrentCustomerNo").html();
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/GetSaveOrderWarehouse',
            data: '{"OrderNo":"' + OrderNo + '","Customer":"' + CustomerNo + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    var result = output.d.split('~');
                    $("#txtSaveWarehouse").val(result[1]);
                    $("#divWHForInvoice").html(result[0]);

                    $("#SaveWareHouseDDL").addClass("hideForEmptyWareHouse");
                    $("#txtSaveWarehouse").removeClass("hideForEmptyWareHouse");
                }
                else {
                    $("#txtSaveWarehouse").val("");
                    $("#divWHForInvoice").html("");
                    $("#txtSaveWarehouse").addClass("hideForEmptyWareHouse");
                    $("#SaveWareHouseDDL").removeClass("hideForEmptyWareHouse");
                    LoadWareHouseDDLData();
                }
            }
        });
    }
    function LoadWareHouseDDLData() {
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/LoadWareHouseDDLData',
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#SaveWareHouseDDL").empty();
                $("#SaveWareHouseDDL").append($('<option></option>').val("-1").html("Select"));
                $.each(output.d, function (i, item) {
                    $('#SaveWareHouseDDL').append($('<option></option>').val(item.Code).html(item.Name));
                });
                $.each(output.d, function (i, item) {
                    if (item.IsDefault == "1") {
                        $('#SaveWareHouseDDL').val(item.Code).trigger("change");
                    }
                });
            }
        });
    }

    //Consolidation of the invoice
    $("#btnOrderDetailsConsol").die('click').live("click", function (e) {
        if (UserRightsforEditOrder()) {

            // if ($("#fgrdOrderDetails .trChecked").length > 0) {
            try {
                $("#DivCurrentOrdersDialog").dialog('destroy').remove();
            }
            catch (ex) { }
            var Customer = $("#ctl00_DivCustomerNo_OrderDetails").html();

            var para = 'Customer=' + Customer;
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetPage',
                data: '{ "controlName":"pages/PageCurrentOrdersForCustomer.ascx","controlPara":"' + para + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('<div id="DivCurrentOrdersDialog">/div>').dialog({
                        title: 'Consolidation',
                        autoOpen: false,
                        resizable: false,
                        modal: true,
                        width: 1030,
                        height: $(window).height() - 10,
                        //closeOnEscape:false,
                        close: function (event, ui) {
                            $(this).dialog('destroy').remove();
                        },
                        open: function () {
                        },
                    });
                    $("#DivCurrentOrdersDialog").dialog('option', 'title', 'Consolidation for Customer ::' + Customer);
                    $("#DivCurrentOrdersDialog").html(output.d).dialog("open");
                }
            });
            //}
            //else {
            //    $.MessageBox("Please select a line to drop.");
            //}
        }
    });

    //Voiding an order::it is like "delete" a line need to return everything into inventory and mark the f_order1.void with a 1
    $("#btnOrderDetailsVoid").die('click').live("click", function (e) {
        if (!UserRightsforVoidOrder()) {
            $('<div id="DivVoidAnOrder" style="">' +
                      +'</div>').dialog({
                          title: 'Void',
                          autoOpen: false,
                          resizable: false,
                          modal: true,
                          width: 500,
                          buttons: {
                              Accept: function () {

                                  if ($("#txtReasonVoided").val().trim() == "") {
                                      $("#txtReasonVoided").focus();
                                      return false;
                                  }

                                  $.ajax({
                                      type: "POST",
                                      url: 'BloomService.asmx/VoidOrder',
                                      data: "{'OrderNo': '" + $("#ctl00_DivOrderNo").html() + "','ReasonVoid':'" + $("#txtReasonVoided").val() + "'}",
                                      contentType: "application/json; charset=utf-8",
                                      dataType: "json",
                                      success: function (output, status) {
                                          $("#DivVoidAnOrder").dialog('close');
                                          if (output.d == "LogOut") {
                                              window.location.href = "Login.aspx"
                                          }
                                          else if (output.d == "success") {
                                              IsOrderModifiedAndNotSaved = false;
                                              $.MessageBox("Invoice# " + $("#ctl00_DivOrderNo").html() + " voided successfully");
                                              $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                                              $("#fgrdCurrentOrderForCustomerHeader").flexReload({ url: '/url/for/refresh' });

                                              $("#DivOrderDetailsDialog").dialog("close");
                                          }
                                          else if (output.d == "Order already voided") {
                                              $.MessageBox("Order voided already!!!");
                                              $("#DivOrderDetailsDialog").dialog("close");
                                          }
                                          else if (output.d == "Void is not possible") {
                                              $.MessageBox("Please contact admin, Inventory Id not found");
                                              $("#DivOrderDetailsDialog").dialog("close");
                                          }
                                          else if (output.d == "Inventory Error") {
                                              $.MessageBox("Please contact admin, Inventory Mismatched");
                                              $("#DivOrderDetailsDialog").dialog("close");
                                          }
                                          else {
                                              $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                          }
                                      }
                                  });
                              },
                              Cancel: function () {
                                  $(this).dialog("close");
                              }

                          },
                          close: function (event, ui) {
                              $(this).dialog('destroy').remove();
                          },
                          open: function () {
                              $(".ui-dialog-buttonpane button:contains('Accept')").addClass('dialogbuttonstyle icon-save');
                              $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
                              $("#txtReasonVoided").keypress(function (e) {
                                  var key = e.which;
                                  if (key == 13) // the enter key code
                                  {

                                      $("#DivVoidAnOrder").next('div').find('button')[0].focus();
                                  }
                              });
                          },

                      });
            $("#DivVoidAnOrder").html("<div><b>Do you want to VOID  this sales invoice now?</b> <br/><br/> Please enter the reason to void this invoice<br/><input style='width:430px' id='txtReasonVoided' maxlength='50'></input></div>");
            $("#DivVoidAnOrder").dialog("open");
        }
        else {
            $.MessageBox("You do not have permission to void an order!!!");
        }
    });

    function OrderDetailsindexOfMax(arr) {

        if (arr.length === 0) {
            return -1;
        }

        var max = arr[0];
        var maxIndex = 0;

        for (var i = 1; i < arr.length; i++) {
            if (arr[i] > max) {
                maxIndex = i;
                max = arr[i];
            }
        }

        return maxIndex;
    }

    document.body.addEventListener('keydown', function (e) {

        var focused = document.activeElement;

        var zindex = [];
        var divname = [];
        for (i = 0 ; i < $(".ui-dialog:visible").length; i++) {
            var ss = $(".ui-dialog:visible")[i].style.zIndex
            zindex.push($(".ui-dialog:visible")[i].style.zIndex);
            divname.push($(".ui-dialog:visible")[i].lastChild.id);
        }

        var lastchlid1 = ""
        var max = indexOfMax(zindex);
        try {
            lastchlid1 = $(".ui-dialog:visible")[max].lastChild.id
        }
        catch (ex) {
            return false
        }

        if (lastchlid1 == "DivOrderDetailsDialog" && focused.className != "qsbox") {

            //if (e.which == 69) { //Click Alt - F2
            //    console.log("hi");
            //}
            if ((e.metaKey || e.altKey) && e.which === 113) {
                $("#DialogFlipOrder").dialog("open");
                //flipinvoice()
            }

            if (e.which == 65) {    //Click A - ADD
                $("#btnOrderDetailsAdd").click();
            }
            if (e.which == 75) {    //Click K - K-Misc
                $("#btnOrderDetailsKMisc").click();
            }
            if (e.which == 83) {    //Click S - Save
                $('#btnOrderDetailsSave').click();
            }
            if (e.which == 77) {    //Click M - Email
                $('#btnOrderDetailsEmail').click();
            }

            if (e.altKey) {
                if (e.which == 53) { //Click Alt+5
                    $('#btnOrderDetailsF5').click();
                }
                if (e.which == 54) { //Click Alt+6
                    $('#btnOrderDetailsF6').click();
                }
                if (e.which == 55) {//Click Alt+7
                    $('#btnOrderDetailsF7').click();
                }
                if (e.which == 56) {//Click Alt+8
                    $('#btnOrderDetailsF8').click();
                }
                if (e.which == 57 || e.which == 105) {//Click Alt+9
                    $('#btnOrderDetailsConsolView').click();
                }
            }
        }
    });

    //Notes For the Customer
    $("#btnOrderNewDetailsNotes").die('click').live('click', function () {
        var Customer = $("#ctl00_DivCustomerNo_OrderDetails").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustomerComments',
            data: "{'Customer': " + Customer + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('<div id="DivCustomerComments" style="">' +
                    +'<div><textarea id=txtCustomerComments></textarea></div></div>').dialog({
                        title: 'CUSTOMER NOTES SECTION',
                        autoOpen: false,
                        resizable: false,
                        modal: true,
                        width: 700,
                        buttons: {
                            Save: function () {
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/SaveCustomerComments',
                                    data: "{'Customer': '" + Customer + "','Comments':'" + escape($("#txtCustomerComments").val()) + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output1, status) {
                                        if (output1.d != "error") {
                                            $("#DivCustomerComments").dialog("close");
                                            $("#DivCustomerComments").dialog('destroy').remove();
                                        }
                                        else {
                                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                        }
                                    }
                                });
                            },
                            Cancel: function () {
                                $(this).dialog("close");
                            }

                        },
                        close: function (event, ui) {
                            $(this).dialog('destroy').remove();
                        },
                        open: function () {
                            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
                            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
                        },

                    });

                $("#DivCustomerComments").html('<textarea id="txtCustomerComments" spellcheck="false" style="width: 637px;height: 174px;">' + output.d + '</textarea>');
                $("#DivCustomerComments").dialog("open");

            }
        });

    });

    $("#btnOrderDetailsRepeat").die('click').live('click', function () {
         $("#DialogOrderDetailsRepeat").dialog("open");
    });

    $("#DialogOrderDetailsRepeat").dialog({
    autoOpen: false,
    title: "Order Detail Repeat",
    width: 500,
    height: 160,
    modal: true,
    resizable: false,
    buttons: {
        Repeat: function () {
            $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UpdateOrderDetailRepeat',
                data: "{ 'Invoice': '" + $("#ctl00_DivOrderNo").html() + "','StartDate':'" + $("#txtStartingDt").val() + "','NoTimesToRepeat': '" + $("#txtrepeat").val()+ "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                // $(this).dialog("close");
                if (output.d.includes("success")) {
                    $.growl.notice({ title: "", message: $("#txtrepeat").val() + " order(s) has been created" });
                    $("#DialogOrderDetailsRepeat").dialog("close");
                }
                else { 
                    $.growl.error({ title: "", message: output.d });
                }
             }
            });
        },
        Cancel: function () {
            $(this).dialog("close");
        },
    },
        open: function (e) {
            var OrderDetailsPDFCurrentDivID = $("#CustCurrentDivID").html();
            var ShippingDate = $("#" + OrderDetailsPDFCurrentDivID + " .lblInvoiceDate1").html();
            var StartRepeatDate = new Date(ShippingDate).addDays(7);
            //$("#txtRackRange").val("01-03");
            $(".ui-dialog-buttonpane button:contains('Repeat')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
            //set default num of times to repeate
            $("#txtrepeat").val("1");
            $("#txtStartingDt").val($.datepicker.formatDate('mm/dd/yy', StartRepeatDate));
    }

});

    //MANI::07/24/2018::Flip an invoice from one customer to anouther customer
    $('#DialogFlipOrder').dialog({
        title: 'Flip',
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 550,
        buttons: {
            Flip: function () {

                if ($("#txtCustSearchForFlip").val().trim() == "" || $("#hfCustomerForFlip").val() == "") {
                    $("#txtCustSearchForFlip").focus();
                    return false;
                }

                if ($("#hfCustomerForFlip").val() == $("#ctl00_DivCustomerNo_OrderDetails").html()) {
                    $.MessageBox("Cannot filp to the same customer!!!");
                    $("#txtCustSearchForFlip").val("");
                    $("#hfCustomerForFlip").val("");
                    $("#txtCustSearchForFlip").focus();
                    return false;
                }

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/FlipOrder',
                    data: "{'OrderNo': '" + $("#ctl00_DivOrderNo").html() + "','Customer':'" +
                        $("#hfCustomerForFlip").val() + "','CalledFromVET':'0'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $("#DivVoidAnOrder").dialog('close');
                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d == "success") {

                            $("#DialogFlipOrder").dialog("close");

                            //$.MessageBox("Invoice# " + $("#ctl00_DivOrderNo").html() + " flip successfully");


                            $("#msg-orddet").html("Invoice# " + $("#ctl00_DivOrderNo").html() + " flip successfully");
                            $("#msgbox-orddet").dialog("open");

                            $("#DivOrderDetailsDialog").dialog("close");

                            $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });

                            if ($("#DivCurrentOrdersDialog").dialog('isOpen') == true) {
                                $("#fgrdCurrentOrderForCustomerHeader").flexReload({ url: '/url/for/refresh' });
                            }
                        }
                        else if (output.d == "not exist") {

                            $.MessageBox("Customer " + $("#txtCustSearchForFlip").val() + " not exist!! please enter valid customer");
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            },
            Cancel: function () {
                $(this).dialog("close");
            }

        },
        close: function (event, ui) {

        },
        open: function () {
            $("#txtCustSearchForFlip").val("");
            $("#hfCustomerForFlip").val("");
            $(".ui-dialog-buttonpane button:contains('Flip')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
            $("#txtCustSearchForFlip").keypress(function (e) {
                var key = e.which;
                if (key == 13) // the enter key code
                {

                    $("#DialogFlipOrder").next('div').find('button')[0].focus();
                }
            });
        },

    });

    $("#txtCustSearchForFlip").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCustForAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (item) {
                        return {
                            label: "[" + item.Customer + "] " + item.Name,
                            Customer: item.Customer,
                            Name: item.Name
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
            $(".ui-menu").css("z-index", 10000);
        },
        select: function (e, i) {
            $("#txtCustSearchForFlip").val(i.item.Customer);
            $("#hfCustomerForFlip").val(i.item.Customer);
        },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtCustSearchForFlip").val("");
                $("#txtCustSearchForFlip").focus();
                $("#hfCustomerForFlip").val("");
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    /*Print Invoice report in PDF :: created by Abinaya :: 29Aug2018*/
    // 04 Apr 2019 :: SALES-Invoice emailed from Invoice view should not add"printed" checkmark
    $("#btnOrderDetailsPDF").die("click").live("click", function () {

        var Order = $("#ctl00_DivOrderNo").html();
        var OrderDetailsPDFCurrentDivID = $("#CustCurrentDivID").html();
        var ShippingDate = $("#" + OrderDetailsPDFCurrentDivID + " .lblInvoiceDate1").html();
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInvoiceReport',
            //2020/09/12
            //data: "{'Order':'" + Order + "','Type':'','EmailIDs':'','CustName':'','ShippingDate':'" + ShippingDate + "','isPrintForEmail':" + false + "}",
            data: "{'Order':'" + Order + "','Type':'','EmailIDs':'','Subject':'','Body':'','CustName':'','ShippingDate':'" + ShippingDate + "','isPrintForEmail':" + false + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d.indexOf("error") >= 0) {
                    w.close()
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else if (output.d == null) {
                    w.close()
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No Data");
                }
                else {
                    //var ReportsResult = output.d;
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                        w.location = ExportedPath;//Report Path
                    }
            }
        });
    });

$("#btnOrderDetailsFlip").die("click").live("click", function () {
    if (UserRightsforEditOrder()) {
        $("#DialogFlipOrder").dialog("open");        //flipinvoice()
    }
});


//$('#DivOrderDetailsDialog').on('dialogclose', function (event) {
//    console.log('closed');
//    event.preventdefault()
//    event.stopPropagation()
//    return false;

//});

function UserRightsforEditOrder() {
    debugger;
    var hasPermissionToModifyOrders = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(1, 1).ToString()%>' == "Y" ? true : false;
    var hasPermissionToModifyPrintedOrders = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(2, 1).ToString()%>' == "Y" ? true : false;
    //if ($("#OrderIsScanned").html() == "1")
    //{
    //    $.MessageBox("You need to ask warehouse to release scanned order.");
    //    return false;
    //}

    if (hasPermissionToModifyOrders == false)
    {
        $.MessageBox("You do not have permission to modify this order.");
        return false;
    }

    if (hasPermissionToModifyPrintedOrders == false && $("#OrderIsPrinted").html() == "1")
    {
        $.MessageBox("You do not have permission to modify a confirmed/printed order.");
        return false;
    }

    return true;
}

function UserRightsforVoidOrder() {
    var haspermissiontovoidorders = ($("#ctl00_DivSalesManPermissions").html().substring(5, 4))//Get Sales Permission has rights to void an order
    
    if ($("#OrderIsPrinted").html() == "1") {
        if (haspermissiontovoidorders == "Y") {
            if ($("#OrderIsScanned").html() == "1") {
                $.MessageBox("The Order is already scanned, please talk to warehouse!!!");
                return true;
            }
            return false;
        }
        else {
            return true;
        }
    }
    else {
        return false;
    }
}
function UserRightsforChangePrice() {
        debugger;
    var hasPermissionToModifyPriceOfPrintedOrders = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(3, 1).ToString()%>' == "Y" ? true : false;
    
        if (hasPermissionToModifyPriceOfPrintedOrders) {
            return true;
        }
        else {
            if ($("#OrderIsPrinted").html() == "1") {
                $.MessageBox("You do not have rights to modify this order!!!");
                return false;
            }
            else {
                return true;
            }
        }
    }
    


///Showing message pop up 
$("#msgbox-orddet").dialog({
    autoOpen: false,
    resizable: false,
    title: "Alert",
    modal: true,
    buttons: {
        Ok: function () {
            $(this).dialog("close");
        }
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
    }
});

$("#btnOrderDetailsPicking").die("click").live("click", function () {
        PrintReports()
    });

    function PrintReports() {
        var checkboxValues = [];
        var CA = [];
        var PO = [];
        var ShipDate = [];
        debugger;

        //if ($("#ctl00_LoggedUserType").html() != "warehouse") { //if usertype warehouse then only print **printed=yes** orders only
        //    var SelectedOrders = $(".trChecked:visible").find("img.Orderselected");
        //    var SelectedCA = $(".trChecked:visible").find("td:nth-child(7) div");
        //    var SelectedPO = $(".trChecked:visible").find("td:nth-child(18) div");
        //    var SelectedDate = $(".trChecked:visible").find("td:nth-child(5) div");

        //    for (var i = 0; i <= SelectedOrders.length - 1; i++) {

        //        checkboxValues.push(SelectedOrders[i].id.substring(12));

        //        //check if the value already exists in the array for CA,PO and Shipdate
        //        if ($.inArray(SelectedCA[i].innerText, CA) == -1) {
        //            CA.push(SelectedCA[i].innerText);
        //        }

        //        if ($.inArray(SelectedPO[i].innerText.innerText, PO) == -1) {
        //            SelectedPO[i].innerText.trim() == "" ? "" : PO.push(SelectedPO[i].innerText);
        //        }                

        //        if ($.inArray(SelectedDate[i].innerText, ShipDate) == -1) {
        //            ShipDate.push(SelectedDate[i].innerText);
        //        }
        //    }
        //}
        //else {
        $("#chkInvoice").attr("checked", false);
        var SelectedOrderscount = 0;
        var orderIDs = [];
        orderIDs = $("#ctl00_DivOrderNo").html();
        //$('#fgrdOrderHeader tr:visible').each(function ()
        //{

        //        if ($(this).attr("id") != "row0") {
        //            var SelectedWCA = $(this).find("td div").eq(6)[0];
        //            var SelectedWPO = $(this).find("td div").eq(17)[0];
        //            var SelectedWDate = $(this).find("td div").eq(4)[0];
        //            if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {

        //                SelectedOrderscount += 1;
        //                //if ($(this).find("td div").eq(12)[0].textContent == "Yes") { // check printed=yes
        //                if ($(this).find("td div").eq(12)[0].innerHTML.indexOf("<img") >= 0) { // check printed=yes
        //                    checkboxValues.push($(this).attr("id").substring(3));

        //                    //check if the value already exists in the array for CA,PO and Shipdate
        //                    if ($.inArray(SelectedWCA.innerText, CA) == -1) {
        //                        CA.push(SelectedWCA.innerText);
        //                    }
        //                    if ($.inArray(SelectedWPO.innerText, PO) == -1) {
        //                        SelectedWPO.innerText.trim() == "" ? "" : PO.push(SelectedWPO.innerText);
        //                    }
        //                    if ($.inArray(SelectedWDate.innerText, ShipDate) == -1) {
        //                        ShipDate.push(SelectedWDate.innerText);
        //                    }
        //                }
        //                else {

        //                    orderIDs.push($(this).attr("id").substring(3));

        //                }
        //            }
        //        }
        //    });

        //if (orderIDs.length == 0)
        //{
        //    // return 0;
        //}
        //else
        //{
        //    orderIDs.join(',');

        //    var msg = "";
        //    var label = jQuery('label[for=' + $('.chkrpt:checked').attr('id') + ']').html();
        //    if (SelectedOrderscount > 1) {
        //        msg = " for order (" + orderIDs + ")";
        //    }

        //    if ($('.chkrpt:checked').length > 1) {
        //        $("#msghtml").html("Invoice MUST be Confirmed/Printed " + msg);
        //        $("#msgbox-warn").dialog("open");
        //    }
        //    else if ($('.chkrpt:checked').length == 1) {
        //        $("#msghtml").html("Invoice MUST be Confirmed/Printed " + msg);
        //        $("#msgbox-warn").dialog("open");
        //    }
        //}

        /* var orderlist = "";
         var msg = "";
         var label = jQuery('label[for=' + $('.chkrpt:checked').attr('id') + ']').html();
         if (SelectedOrders.length > 1) {
             for (var i = 0; i <= SelectedOrders.length - 1; i++) {
                 if (orderlist.length <= 0)
                     orderlist += "";
                 else
                     orderlist += ",";
                 orderlist += SelectedOrders[i].id.substring(12);
             }
             msg = " for order (" + orderlist + ")";
         }
 
         if ($('.chkrpt:checked').length > 1) {
             $("#msghtml").html("Selected reports are not printed yet" + msg);
             $("#msgbox-warn").dialog("open");
         }
         else if ($('.chkrpt:checked').length == 1) {
 
             $("#msghtml").html(label + " report not printed yet" + msg);
             $("#msgbox-warn").dialog("open");
         }*/
        //}

        //if (checkboxValues.length == 0) {
        //    return false;
        //}
        //else {
        //    checkboxValues.join(',');
        //}

        debugger;
        if (CA.length == 0)
            CA = '';
        else
            CA.join(',');
        if (ShipDate.length == 0)
            ShipDate = '';
        else
            ShipDate.join(',');

        if (PO.length == 0)
            PO = '';
        else
            PO.join(',');

        //var checkboxValues = [];
        //$('input[name=checkboxName]:checked').map(function () {
        //    checkboxValues.push($(this).val());
        //})

        var w0 = '';
        var w1 = '';
        var w2 = '';
        var w3 = '';
        var w4 = '';
        var PrintBillofLading = 0;
        var PrintPickList = 0;
        var PrintShippingLabel = 0;
        var PrintCCI = 0;
        var PrintInvoice = 0;
        var WindowCount = 0;

        PrintPickList = 1
        if (WindowCount == 0) w0 = window.open('GeneratingPDF.html', '_blank');
        else w1 = window.open('GeneratingPDF.html', '_blank');
        WindowCount++;

        debugger;

        //$("#msg").html("<div>Generating PDF Please Wait....</div><div><img src='images/AnimatedGif_PDF.gif' /></div>");
        //$("#msgbox-select").dialog("open");
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintMultipleReportsInOrder',
            data: "{'PrintBillofLading':'" + PrintBillofLading + "','PrintPickListselected':'"
                + PrintPickList + "','SelectedOrders':'" + orderIDs + "','PrintShippingLabel':'" + PrintShippingLabel
                + "','PrintCCI':'" + PrintCCI + "','PrintInvoice':'" + PrintInvoice + "','ShipDate':'" + ShipDate + "','CA':'" + CA + "','PO':'" + escape(PO) + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status)
            {
                debugger;
                if (output.d == "LogOut")
                {
                    window.location.href = "Login.aspx"
                    ClosePDFWindows();
                }
                else if (output.d.indexOf("Please release order") >= 0)
                {
                    $("#msgbox-select").dialog("close");
                    //$.MessageBox(output.d);
                    ClosePDFWindows();
                    var Order = output.d.replace(/[^0-9]/g, '');

                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/ReleaseRacksforOrder',
                        data: '{ "Order":"' + Order + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            $("#DialogReleaseLabels").dialog("close");
                            if (output.d == "success") {
                                PrintReports();
                            }
                            else {
                                $.MessageBox(output.d);
                            }
                        }
                    });

                    //$("#DivReleaseInvoice").html(output.d.replace(/[^0-9]/g, ''))
                    //$("#DialogReleaseLabelsMsg").html(output.d);
                    //$("#DialogReleaseLabels").dialog("open");

                }
                else if (output.d.indexOf("no armellini account") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d);
                    ClosePDFWindows();
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                    ClosePDFWindows();
                }
                else if (output.d == "No Data") {
                    ClosePDFWindows();
                }
                else if (output.d == "No Order Found") {
                    ClosePDFWindows();
                }
                else {
					var ExportedPath = output.d.split("*~*")
                    w0.location = ExportedPath;
                    //if (PrintShippingLabel == 1 || PrintPickList == 1) {
                    //    var SelectedOrder = checkboxValues;
                    //    $.each(SelectedOrder, function (i, val) {
                    //        $("#fgrdOrderHeader #row" + val + "").find("td div").eq(13)[0].innerHTML = "<img style='margin-top:-3px; margin-left:3px' src='images/yellowtick.png'>";  //Check picking='Yes'
                    //    });
                    //}


                    //if (PrintBillofLading == 1) {
                    //    var SelectedOrder = checkboxValues;
                    //    $.each(SelectedOrder, function (i, val) {
                    //        $("#fgrdOrderHeader #row" + val + "").find("td div").eq(14)[0].innerHTML = "<img style='margin-top:-3px; margin-left:3px' src='images/pinktick.png'>";  //Check Bills='Yes'
                    //    });
                    //}

                    //if (PrintShippingLabel == 1 || PrintInvoice == 1) {
                    //    var SelectedOrder = checkboxValues;
                    //    $.each(SelectedOrder, function (i, val) {

                    //        $("#fgrdOrderHeader #row" + val + "").find("td div").eq(12)[0].innerHTML = "<img style='margin-top:-3px; margin-left:3px' src='images/greentick.png'>";  //Check Printed='Yes'
                    //    });
                    //}

                    //try
                    //{ //It checks whether the boxes is successfully posted to armellini service for carrier A1,A2,A3,AR
                    //    //and carrier code bgcolor changed accodingly. Success- Green, Error - Red

                    //    if (PrintShippingLabel == 1)
                    //    {
                    //        var SelectedOrder = checkboxValues;
                    //        var ArmelliniCarrierCode =
                    //        {
                    //            a: "A1",
                    //            b: "A2",
                    //            c: "A3",
                    //            d: "AR"
                    //        };
                    //        $.each(SelectedOrder, function (i, val) {

                    //            var CarrierCode = $("#lnkCarrierARXML_" + val + "").html();
                    //            if (CarrierCode == "A1" || CarrierCode == "A2" || CarrierCode == "A3" || CarrierCode == "AR" || CarrierCode == "FB") {

                    //                $.ajax({
                    //                    type: "POST",
                    //                    url: 'BloomService.asmx/CheckArmelliniLog',
                    //                    data: "{'Carrier':'" + CarrierCode + "','OrderNo':'" + val + "'}",
                    //                    contentType: "application/json; charset=utf-8",
                    //                    dataType: "json",
                    //                    success: function (output, status) {
                    //                        $("#lnkCarrierARXML_" + val + "").closest('div').html(output.d);
                    //                    }
                    //                });
                    //            }
                    //        });
                    //    }
                    //}
                    //catch (err) {

                    //}

                    //try
                    //{
                    //    var splitedstring = output.d.split("*~*")
                    //    if (splitedstring.length == "1")
                    //    {
                    //        w0.location = splitedstring[0]
                    //        w1.close();
                    //        w2.close();
                    //        w3.close();
                    //    }
                    //    else if (splitedstring.length == "2")
                    //    {
                    //        w0.location = splitedstring[0]
                    //        w1.location = splitedstring[1]
                    //        w2.close();
                    //        w3.close();
                    //    }
                    //    else if (splitedstring.length == "3")
                    //    {
                    //        w0.location = splitedstring[0]
                    //        w1.location = splitedstring[1]
                    //        w2.location = splitedstring[2]
                    //        w3.close();
                    //    }
                    //    else if (splitedstring.length == "4")
                    //    {
                    //        w0.location = splitedstring[0]
                    //        w1.location = splitedstring[1]
                    //        w2.location = splitedstring[2]
                    //        w3.location = splitedstring[3]
                    //        w4.close();
                    //    }
                    //    else
                    //    {
                    //        w0.location = splitedstring[0]
                    //        w1.location = splitedstring[1]
                    //        w2.location = splitedstring[2]
                    //        w3.location = splitedstring[3]
                    //        w4.location = splitedstring[4]
                    //    }
                    //}
                    //catch (err)
                    //{
                    //}
                }
            }
        });

        function ClosePDFWindows() {
            w0 == "" ? "" : w0.close();
            w1 == "" ? "" : w1.close();
            w2 == "" ? "" : w2.close();
            w3 == "" ? "" : w3.close();
            w4 == "" ? "" : w4.close();
        }
    }


</script>


