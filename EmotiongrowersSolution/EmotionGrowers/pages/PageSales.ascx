<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageSales.ascx.vb" Inherits="pages_PageSales" %>
<style type="text/css">


     .CallListOptions {
        position: absolute;
         /*border: solid 2px black;
       background-color: white;*/
        background-color: #333333;
        padding: 5px 0;
        display: block;
        z-index: 1000;
        margin-left:-42px;
        margin-top:8px;
        border-radius:10px;
    }

        .CallListOptions:after, .CallListOptions:before {
            bottom: 100%;
            left: 50%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
        }


        .CallListOptions:after {
            border-color: rgba(96, 193, 213, 0);
            border-bottom-color: #000000;
            border-width: 10px;
            margin-left: -10px;
        }

        .CallListOptions:before {
            border-color: rgba(194, 225, 245, 0);
            /*border-bottom-color: #c2e1f5;*/
            border-width: 16px;
            margin-left: -16px;
        }

    .ulListOptions {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        /*background-color: #333333;*/
        margin-top: -5px;
        margin-bottom: -5px;
        border-radius: 10px;
    }

    .ulListOptions li a {
        display: block;
        color: white;
        text-align: center;
        padding: 8px;
        text-decoration: none;
    }

        .ulListOptions li a:hover {
            background-color: #111111;
        }
</style>

<div id="DivOrderPageContent"></div>
 <div id="fgrdOrderSalesHeader" style="display: none;">0</div>
<div id="DialogCallList" style="float: left;display:none;">
    <table id="fgrdCallListDetails" style="display: block;"></table>
</div>

<div id="LoggedInUserID" runat="server" style="display: none"></div>
<div id="LoggedInUserSalesman" runat="server" style="display: none"></div>

<div id="DialogCallOptionsOnEsc" style="display: none;">
    <fieldset id="fsCallType" style="margin-left: 35px; font-size: 18px; font-weight: bold; width: 230px; height: 120px; border-width: 1px; margin-top: 10px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height:35px;">
                <td>
                    <input id="rbLogCall" class="rbCallType" type="radio" style="margin-top: 8px;" name="CallType" checked="checked">
                    <label for="rbLogCall">Log This Call</label>
                </td>
            </tr>
            <tr  style="height:35px;">
                <td>
                    <input id="rbCallLater" class="rbCallType" type="radio" style="margin-top: 8px;" name="CallType">
                    <label for="rbCallLater">Call Later Today</label>
                </td>
            </tr>
            <tr  style="height:35px;">
                <td>
                    <input id="rbCallAnother" class="rbCallType" type="radio" style="margin-top: 8px;" name="CallType">
                    <label for="rbCallAnother">Call Another Day</label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogCallLog" style="display:none;font-size:18px;">
    <table>
        <tr style="height:30px;">
            <td style="padding-right :20px;">Customer Called</td>
            <td>
                <label id="lblCallLogCustCalled"></label>
            </td>
        </tr>
        <tr style="height:30px;">
            <td>City</td>
            <td>
                <label id="lblCallLogCity"></label>
            </td>
        </tr>
        <tr style="height:30px;">
            <td>Phone dialed</td>
            <td>
                <label id="txtCallLogPhone"></label>
            </td>
        </tr>
        <tr style="height:30px;">
            <td>Comments</td>
            <td>
                <input type="text" id="txtCallLogComments" style="background-color:#A70000;border-color:#A70000;color:#00FFFF;width: 700px;font-size: 16px;font-weight: bold;" />
            </td>
        </tr>
    </table>
</div>

<div id="DialogCallTodayOptions" style="display: none;">
    <fieldset id="fsCallToday" style="font-size: 18px;font-weight: bold;height: 460px;border-width: 1px;margin-top: 10px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height:30px;">
                <td>
                    <input id="rbCallIn5Mins" class="rbCallType" type="radio" data-value="00:05" style="margin-top: 8px;" name="CallToday" checked="checked">
                    <label for="rbCallIn5Mins">in 5 minutes</label>
                </td>
            </tr>
            <tr  style="height:30px;">
                <td>
                    <input id="rbCallIn10Mins" class="rbCallType" type="radio" data-value="00:10" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn10Mins">in 10 minutes</label>
                </td>
            </tr>
            <tr  style="height:30px;">
                <td>
                    <input id="rbCallIn20Mins" class="rbCallType" type="radio" data-value="00:20" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn20Mins">in 20 minutes</label>
                </td>
            </tr>
            <tr style="height:30px;">
                <td>
                    <input id="rbCallIn30Mins" class="rbCallType" type="radio" data-value="00:30" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn30Mins">in 30 minutes</label>
                </td>
            </tr>
            <tr  style="height:30px;">
                <td>
                    <input id="rbCallIn45Mins" class="rbCallType" type="radio" data-value="00:45" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn45Mins">in 45 minutes</label>
                </td>
            </tr>
            <tr  style="height:30px;">
                <td>
                    <input id="rbCallIn1Hour" class="rbCallType" type="radio" data-value="01:00" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn1Hour">in 1 Hour</label>
                </td>
            </tr>
            <tr style="height:30px;">
                <td>
                    <input id="rbCallIn1HalfHour" class="rbCallType" type="radio" data-value="01:30" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn1HalfHour">in 1 1/2 Hours</label>
                </td>
            </tr>
            <tr  style="height:30px;">
                <td>
                    <input id="rbCallIn2Hour" class="rbCallType" type="radio" data-value="02:00" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn2Hour">in 2 Hours</label>
                </td>
            </tr>
            <tr  style="height:30px;">
                <td>
                    <input id="rbCallIn2HalfHour" class="rbCallType" type="radio" data-value="02:30" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn2HalfHour">in 2 1/2 Hours</label>
                </td>
            </tr>
            <tr style="height:30px;">
                <td>
                    <input id="rbCallIn3Hour" class="rbCallType" type="radio" data-value="03:00" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn3Hour">in 3 Hours</label>
                </td>
            </tr>
            <tr  style="height:30px;">
                <td>
                    <input id="rbCallIn3HalfHour" class="rbCallType" type="radio" data-value="03:30" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn3HalfHour">in 3 1/2 Hours</label>
                </td>
            </tr>
            <tr  style="height:30px;">
                <td>
                    <input id="rbCallIn4Hour" class="rbCallType" type="radio" data-value="04:00" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn4Hour">in 4 Hours</label>
                </td>
            </tr>
            <tr  style="height:30px;">
                <td>
                    <input id="rbCallIn4HalfHour" class="rbCallType" type="radio" data-value="04:30" style="margin-top: 8px;" name="CallToday">
                    <label for="rbCallIn4HalfHour">in 4 1/2 Hours</label>
                </td>
            </tr>
            <tr style="height:80px;">
                <td>
                    <label style="vertical-align: -webkit-baseline-middle;">COMMENTS</label>
                    <textarea id="txtCallLaterComments" style="background-color: rgb(167, 0, 0); border-color: rgb(167, 0, 0); color: rgb(0, 255, 255); margin: -2px 0px 0px; width: 360px; height: 60px;"></textarea>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogCallAnotherOptions" style="display: none;">
    <fieldset id="fsCallAnother" style="font-size: 18px;font-weight: bold; height: 390px;border-width: 1px;margin-top: 10px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height:32px;">
                <td>
                    <input id="rbCallTomorrow" class="rbCallType" type="radio" data-value="01" style="margin-top: 8px;" name="CallAnother" checked="checked">
                    <label for="rbCallTomorrow">Tomorrow</label>
                </td>
            </tr>
            <tr  style="height:32px;">
                <td>
                    <input id="rbCall2Days" class="rbCallType" type="radio" data-value="02" style="margin-top: 8px;" name="CallAnother">
                    <label for="rbCall2Days">2 days from today</label>
                </td>
            </tr>
            <tr  style="height:32px;">
                <td>
                    <input id="rbCall3Days" class="rbCallType" type="radio" data-value="03" style="margin-top: 8px;" name="CallAnother">
                    <label for="rbCall3Days">3 days from today</label>
                </td>
            </tr>
            <tr style="height:32px;">
                <td>
                    <input id="rbCall4Days" class="rbCallType" type="radio" data-value="04" style="margin-top: 8px;" name="CallAnother">
                    <label for="rbCall4Days">4 days from today</label>
                </td>
            </tr>
            <tr  style="height:32px;">
                <td>
                    <input id="rbCall5Days" class="rbCallType" type="radio" data-value="05" style="margin-top: 8px;" name="CallAnother">
                    <label for="rbCall5Days">5 days from today</label>
                </td>
            </tr>
            <tr  style="height:32px;">
                <td>
                    <input id="rbCall6Days" class="rbCallType" type="radio" data-value="06" style="margin-top: 8px;" name="CallAnother">
                    <label for="rbCall6Days">6 days from today</label>
                </td>
            </tr>
            <tr style="height:32px;">
                <td>
                    <input id="rbCallAWeek" class="rbCallType" type="radio" data-value="07" style="margin-top: 8px;" name="CallAnother">
                    <label for="rbCallAWeek">a week from today</label>
                </td>
            </tr>
            <tr  style="height:32px;">
                <td>
                    <input id="rbCall2Week" class="rbCallType" type="radio" data-value="14" style="margin-top: 8px;" name="CallAnother">
                    <label for="rbCall2Week">2 weeks from today</label>
                </td>
            </tr>
            <tr  style="height:32px;">
                <td>
                    <input id="rbCall3Week" class="rbCallType" type="radio" data-value="21" style="margin-top: 8px;" name="CallAnother">
                    <label for="rbCall3AWeek">3 weeks from today</label>
                </td>
            </tr>
            <tr style="height:32px;">
                <td>
                    <input id="rbCall4Week" class="rbCallType" type="radio" data-value="28" style="margin-top: 8px;" name="CallAnother">
                    <label for="rbCall4Week">4 weeks from today</label>
                </td>
            </tr>
            <tr style="height:80px;">
                <td>
                    <label style="vertical-align: -webkit-baseline-middle;">COMMENTS</label>
                    <textarea id="txtCallAnotherComments" style="background-color: rgb(167, 0, 0); border-color: rgb(167, 0, 0); color: rgb(0, 255, 255); margin: -2px 0px 0px; width: 340px; height: 60px;"></textarea>
                </td>
            </tr>
           </table>
    </fieldset>
</div>

<script type="text/javascript">
    var NewOrderDialogOpen = false;
    var DlgOverlayCount = 0;
    var DlgNameWitCount = "";
   
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageOrder.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            $("#DivOrderPageContent").html(output.d);
            $(".HideInSalesPage").hide();
            $("#tblcurrentOrder").hide();
            //$("#imgToggle").hide();
	        $("#imgUserLoader").hide();
            $("#tblChkReports").css("width", 0)

            if ($('#rbCallList').attr('checked') == 'checked') {
                $("#imgCustomerInfoToggle").trigger("click");
            }
            else {
                $("#txtCustSearch").focus()
            }
            $('#DivOrderHeader [name="qtype"]').val("SalesManName");


        }
    });

    $("#btnViewSales").live("click", function () {
        $(".ui-tooltip").hide();

        if ($("#btnViewSales").val() == "View Sales") {
            $("#salesChart").hide();
            $("trNetSalesGraph").hide();
            fgrdOrderSalesHeader();
            $("#DivCustomerDetails").hide();
            $("#imgCustomerInfoToggle").attr("title", "Show Customer List");
            $("#btnViewSales").val("Hide Sales");
            $("#tblcurrentOrder").show();
            $("#btnSalesSaveInvoicePdf").show();
            $("#imgToggle").show();

        }
        else {            
            $("#salesChart").show();
            $("#btnViewSales").val("View Sales");
            $("#tblcurrentOrder").hide()
            $("#btnSalesSaveInvoicePdf").hide();
            $("#imgToggle").hide();
        }
    });

    $("#btnSalesSaveInvoicePdf").die("click").live("click", function () {
        
        var orderNos = [];
        /* Detect Browsers :: Works only in chrome */
        $.browser.chrome = /chrome/.test(navigator.userAgent.toLowerCase());
        if ($.browser.chrome) {
            $('#fgrdOrderHeader tr:visible').each(function () {

                if ($(this).attr("id") != "row0") {
                    if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                        orderNos.push($(this).attr("id").substring(3));
                    }
                }
            });

            if (orderNos.length == 0) {
                $.MessageBox("Please select an invoice");
                return 0;
            }
            else {
                orderNos.join(',');
            }
            $("#msgbox-download").dialog("open");
            $("#msgdownloadhtml").html("Saving Pdf...");
            for (var i = 0; i < orderNos.length; i++) {
                var CustName = $("#fgrdOrderHeader #row" + orderNos[i] + "").find("td div").eq(3)[0].innerText;
                //PrintInvoiceReportIndividual(orderNos[i], CustName.replace('/','-').replace('#','-').replace("'","-").replace(/\\/g,"-"));
                var ShippingDate = $("#fgrdOrderHeader #row" + orderNos[i] + "").find("td div").eq(4)[0].innerText;
                PrintInvoiceReportIndividual(orderNos[i], CustName.replace(/[`~!@#$%^&*()|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '-'), ShippingDate);
            }
        }
        else {
            $.MessageBox("Sorry,  this option only works in Chrome");
        }
    });

    // 04 Apr 2019 :: SALES-Invoice emailed from Invoice view should not add"printed" checkmark
    function PrintInvoiceReportIndividual(orderNo, CustName,ShippingDate) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInvoiceReport',
            data: "{'Order':'" + orderNo + "','Type':'SalesSavePDF','EmailIDs':'','Subject':'Subject will be generated from code','Body':'','CustName':'" + CustName + "','ShippingDate':'" + ShippingDate + "','isPrintForEmail':" + false + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx"
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No Data");
                }
                else {
                    $("#fgrdOrderHeader #row" + orderNo + "").find("td div").eq(12)[0].innerHTML = "<img style='margin-top:-3px; margin-left:3px' src='images/greentick.png'>";  //Check Printed='Yes'
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    $("#msgbox-download").dialog("close");
                    // Download pdf to Downloads folder
                    var link = document.createElement("a");
                    link.setAttribute("href",ExportedPath);
                    link.setAttribute("download",ExportedPath);

                    var clickEvent = document.createEvent("MouseEvent");
                    clickEvent.initEvent("click", true, true);
                    link.dispatchEvent(clickEvent);
                }
            }
        });
    }

    $("#DialogCallList").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 1050,
        height:620,
        modal: true,
        //close: function () {
        //    $(this).dialog("close");
        //},
        open: function () {
            
            DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
            DlgNameWitCount = "DialogCallList";
        },
        close:function(){
            $("#txtCustSearch").focus();
        }
    });
    
    $("#fgrdCallListDetails").flexigrid({
        url: 'BloomService.asmx/GetCallListGridDetails',
        dataType: 'xml',
        colModel: [
            { display: 'Cust#', name: 'Customer', width: 40, sortable: true, align: 'right', process: CallListCellClick },
            { display: 'Customer Name', name: 'Name', width: 250, sortable: true, align: 'left', process: CallListCellClick },
            { display: 'Buyer', name: 'City', width: 180, sortable: true, align: 'left', process: CallListCellClick },
            { display: 'Phone', name: 'Phone', width: 80, sortable: true, align: 'center', process: CallListCellClick },
            { display: 'CallTime', name: 'CallTime', width: 30, sortable: true, align: 'right', process: CallListCellClick },
            { display: 'Carrier', name: 'Carrier', width: 30, sortable: false, align: 'left', process: CallListCellClick },
            { display: '', name: 'Type', width: 10, sortable: true, align: 'center', process: CallListCellClick },
            { display: 'Comments', name: 'Comments', width: 250, sortable: true, align: 'left', process: CallListCellClick },
            { display: 'Hold', name: '', width: 20, sortable: true, align: 'left'},
        ],
        searchitems: [
            { display: 'CustomerName', name: 'Name' },
            { display: 'Buyer', name: 'City' },
            { display: 'Phone', name: 'Phone' },
            {display:'CallTime',name:'CallTime'},
            { display: 'Carrier', name: 'Carrier' },
            {display:'Comments',name:'Comments'}
        ],
        showTableToggleBtn: true,
        sortname: "Customer asc",
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
        width: 1020,
        height: 480,
        striped: true,
        onSuccess: function () {
            
            var sel = jQuery("#fgrdCallListDetails tbody tr");
            var len = sel.length;
            if (len > 1) {
                $("#DialogCallList #ExportCSV").show();
            }

        },
        params: [
          { name: 'ExportCSV', value: '' },
          { name: 'Exclude', value: '' },
          { name: 'OnlyMe', value: 'true' }
        ],

        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
            }
        }
    });

    $("#DialogCallList .sDiv").css('float', 'left').css('width', '630px');
    $('#DialogCallList .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DialogCallList .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DialogCallList .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DialogCallList .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    function CallListCellClick(celDiv, id) {
        $(celDiv).click(function () {
            if (id != "" || id != "0") {
                var CALL_ID = id;
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/GetCallListCustomerForCallID",
                    data: "{'CALL_ID':'" + CALL_ID + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",                    
                    success: function (output) {
                        
                        var res = output.d;
                        var Customer = parseInt(res);
                        if (Customer != 0 && Customer != "") {
                            $("#CurrentCustomerNo").html(Customer);
                           // LoadCustomerDetailsByCustNo(Customer);
                            
                            if (AlreadyOrderNewPageLoaded == false) {
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/GetPage',
                                    data: '{ "controlName":"pages/PageOrderNew.ascx","controlPara":"" }',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output, status) {
                                        $("#DivPageOrderNew").html("");
                                        $("#DivPageOrderNew").html(output.d);
                                        $("#fgrdOrderNewDetails").empty();
                                        $("#fgrdOrderNewDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }], query: "", newp: 1 }).flexReload();
                                        //debugger;
                                        $("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER :: '+Customer);
                                        $("#DivOrderNewDetailsDialog").data("CALL_ID", CALL_ID).dialog("open");

                                        $("#fgrdCallListDetails [id^=row]").removeClass("trSelectedHeader");
                                        $("#fgrdCallListDetails td.unsorted").addClass("sorted");
                                        $("#fgrdCallListDetails td.sorted").removeClass("unsorted");
                                        $("#fgrdCallListDetails #row" + id).addClass("trSelectedHeader");
                                        $("#fgrdCallListDetails #row" + id).removeClass("trSelected");
                                        $("#fgrdCallListDetails #row" + id + " td.sorted").addClass("unsorted");
                                        $("#fgrdCallListDetails #row" + id + " td.unsorted").removeClass("sorted");

                                        NewOrderDialogOpen = true;

                                    }
                                });
                                AlreadyOrderNewPageLoaded == true
                            }
                            else {
                                $("#fgrdOrderNewDetails").empty();
                                $("#fgrdOrderNewDetails").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }], query: "", newp: 1 }).flexReload();
                                //debugger;
                                $("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER :: '+Customer);
                                $("#DivOrderNewDetailsDialog").data("CALL_ID", CALL_ID).dialog("open");

                                $("#fgrdCallListDetails [id^=row]").removeClass("trSelectedHeader");
                                $("#fgrdCallListDetails td.unsorted").addClass("sorted");
                                $("#fgrdCallListDetails td.sorted").removeClass("unsorted");
                                $("#fgrdCallListDetails #row" + id).addClass("trSelectedHeader");
                                $("#fgrdCallListDetails #row" + id).removeClass("trSelected");
                                $("#fgrdCallListDetails #row" + id + " td.sorted").addClass("unsorted");
                                $("#fgrdCallListDetails #row" + id + " td.unsorted").removeClass("sorted");

                                NewOrderDialogOpen = true;
                            }

                        
                        }
                    }
                });
            }
        });
    }

    function prepareCallList() {
        
        var DayID = document.getElementById("lstSalesCallDays").value;
        var CallListDate = $("#lstSalesCallDays").find(':selected').data("dt");
        var ListCount = document.getElementById("lstSalesCallDays").length;
        if ($("#ctl00_LoggedInUserSalesman").html() == "" || $("#ctl00_LoggedInUserSalesman").html() == "0") {
            $.MessageBox("You must have a sales person assigned");
            $('#lstSalesCallDays').prop('selectedIndex', 0);
        }
        else {
            if (DayID != "0" && DayID != "8") {
                $("#imgUserLoader").show();
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/SaveCallList",
                    data: "{'DayID':'" + DayID + "','CallListDate':'" + CallListDate + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        
                        var result = output.d;
                        if (result == "success") {
                            $("#imgUserLoader").hide();
                            //$("#msg-CallList").html("Call List created");
                            //$("#msgbox-CallList").dialog("open");
                            //$('#lstSalesCallDays').prop('selectedIndex', 0);
                            var Count = parseInt(CheckCallListAvailability($("#ctl00_LoggedInUserID").html()));
                            
                            if (Count > 0) {
                                $('#rbCallList').attr('checked', true);
                                ListType = "CallList";
                                IsToggleCustDetails = true;
                                $("#DivCustomerDetails").hide();
                                $("#imgCustomerInfoToggle").attr("title", "Show Call List");
                                /*Show Call list grid after call list prepared :: ABI :: 30Jan2018*/
                                $("#imgCustomerInfoToggle").trigger("click");
                            }
                            else if (Count <= 0) {
                                $.MessageBox("No calls found to prepare");
                                $('#rbCustList').attr('checked', true);
                                ListType = "Customer";
                                IsToggleCustDetails = false;
                                $("#imgCustomerInfoToggle").attr("title", "Show Customer List");
                            }
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    },
                    onError: function (xhr, status, errorThrown) {
                        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
                $("#imgUserLoader").hide();
            }
            else if (DayID == "8") {
                $("#imgUserLoader").show();
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/RemoveCallList",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        
                        var result = output.d;
                        if (result == "success") {
                            $("#imgUserLoader").hide();
                            $.MessageBox("Call List removed");
                            var Count = parseInt(CheckCallListAvailability($("#ctl00_LoggedInUserID").html()));
                            if (Count > 0) {
                                $('#rbCallList').attr('checked', true);
                                ListType = "CallList";
                                IsToggleCustDetails = true;
                                $("#DivCustomerDetails").hide();
                                $("#imgCustomerInfoToggle").attr("title", "Show Call List");
                            }
                            else {
                                $("#rbCustList").attr('checked', true);
                                ListType = "Customer";
                                IsToggleCustDetails = false;
                                $("#imgCustomerInfoToggle").attr("title", "Show Customer List");
                            }
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    },
                    onError: function (xhr, status, errorThrown) {
                        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
                $("#imgUserLoader").hide();
            }
        }
    }

    /*Dialog For Call Options When NewOrder dialog close :: 21Nov2017::ABI*/
    $("#DialogCallOptionsOnEsc").dialog({
        autoOpen: false,
        resizable: false,
        title: "ACTION MENU",
        width: 420,
        height: 280,
        modal: true,
        buttons: {
            Next: function () {
                
                var CALL_ID = $("#DialogCallOptionsOnEsc").data("CALL_ID");
                var Customer = $("#CurrentCustomerNo").html();
                if ($("#rbLogCall").attr("checked") == "checked") {
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetSalesOrderCustDetails',
                        data: '{ "Customer":"' + Customer + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            
                            var res = output.d;
                            $("#lblCallLogCustCalled").html(res.Name);
                            $("#lblCallLogCity").html(res.CITY);
                            $("#txtCallLogPhone").html(res.PHONE);
                        }
                    });
                    $("#DialogCallLog").dialog("open");
                }
                else if ($("#rbCallLater").attr("checked") == "checked") {
                    
                    //alert("CallLater")
                    $("#DialogCallTodayOptions").dialog("open");
                }
                else if ($("#rbCallAnother").attr("checked") == "checked") {
                    
                    //alert("CallAnother")
                    $("#DialogCallAnotherOptions").dialog("open");
                }
                $(this).dialog("close");
            },
            Close: function () {
                $("#txtCustSearch").focus();
                $(this).dialog("close");
            }
        },
        open: function () {
            
            DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
            DlgNameWitCount = "DialogCallOptionsOnEsc";
            $("#rbLogCall").attr("checked", true);
            $("#DialogCallOptionsOnEsc").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        },
        close: function () {
            $("#txtCustSearch").val("");
            $("#txtCustSearch").focus();
            //$("#DialogCallOptionsOnEsc").dialog("close");
            NewOrderDialogOpen = false;
            //$('#DivOrderNewDetailsDialog').dialog("close");
        }
    });

    /*Focus next button when users change the call options :: 02Feb2018 :: ABI*/
    $("input[name=CallType]").on("click", function () {
        
        $("#DialogCallOptionsOnEsc").siblings('.ui-dialog-buttonpane').find("button:contains('Next')").focus();
    });

    /*Dialog For Log this Call option to add Comments :: 21Nov2017::ABI*/
    $("#DialogCallLog").dialog({
        autoOpen: false,
        resizable: false,
        title: "CALL LOG",
        width: 920,
        height: 250,
        modal: true,
        buttons: {
            Yes: function () {
                var Comments = $("#txtCallLogComments").val();
                var Customer = $("#CurrentCustomerNo").html();
                var CALL_ID = $("#DialogCallOptionsOnEsc").data("CALL_ID");
                CallLogAjax(CALL_ID, Comments, Customer, 'Yes');
                $("#DialogCallLog").dialog("close");
            },
            No: function () {
                var Customer = $("#CurrentCustomerNo").html();
                var CALL_ID = $("#DialogCallOptionsOnEsc").data("CALL_ID");
                CallLogAjax(CALL_ID, '', Customer, 'No');
                $("#DialogCallLog").dialog("close");
            }
        },
        open: function () {
            
            DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
            DlgNameWitCount = "DialogCallLog";
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        },
        close: function () {
            $("#txtCustSearch").focus();
        }
    });   

    /*Ajax call for Log this call option :: While Yes/No button click put X for CallList grid*/
    function CallLogAjax(CALL_ID, Comments, Customer, Button) {
        
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/SaveCallListLog",
            data: "{'CALL_ID':'" + CALL_ID + "','Customer':'" + Customer + "','Comments':'" + escape(Comments) + "','Button':'" + Button + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                
                var result = output.d;
                if (result == "success" && Button == "Yes") {
                    //$.MessageBox("Call log saved");           //Comment on 31Jan2018
                    $("#DialogCallLog").dialog("close");
                    $("#fgrdCallListDetails").flexReload({ url: '/url/for/refresh' });
                }
                else if (result == "success" && Button == "No") {
                    $("#DialogCallLog").dialog("close");
                    $("#fgrdCallListDetails").flexReload({ url: '/url/for/refresh' });
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                $("#txtCallLogComments").val("");
            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    /*Focus comments box when users change the today call options :: 02Feb2018 :: ABI*/
    $("input[name=CallToday]").on("click", function () {
        
        $("#txtCallLaterComments").focus();
    });

    /*Dialog For Call Later Today option :: 22Nov2017::ABI*/
    $("#DialogCallTodayOptions").dialog({
        autoOpen: false,
        resizable: false,
        title: "CALL LATER",
        width: 550,
        height: 585,
        modal: true,
        buttons: {
            Yes: function () {
                var CallTime = $("input[name='CallToday']:checked").attr("data-value");
                var Customer = $("#CurrentCustomerNo").html();
                var Comments = ($("#txtCallLaterComments").val() == "") ? "" : escape($("#txtCallLaterComments").val())
                var CALL_ID = $("#DialogCallOptionsOnEsc").data("CALL_ID");
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/SaveCallLaterToday",
                    data: "{'CALL_ID':'" + CALL_ID + "','Customer':'" + Customer + "','CallTime':'" + CallTime + "','Comments':'" + Comments + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        
                        var result = output.d;
                        if (result == "success") {
                            //$.MessageBox("Call later log saved");     //Comment on 30Jan2018
                            $("#DialogCallTodayOptions").dialog("close");
                            $("#fgrdCallListDetails").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                        $("#txtCallLaterComments").val("");
                    },
                    onError: function (xhr, status, errorThrown) {
                        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            },
            No: function () {
                $("#DialogCallTodayOptions").dialog("close");
            }
        },
        open: function () {
            
            DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
            DlgNameWitCount = "DialogCallTodayOptions";

            $("#rbCallIn5Mins").attr("checked", true);
            $("#txtCallLaterComments").val("");
            $("#txtCallLaterComments").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        },
        close: function () {
            $("#txtCustSearch").focus();
        }
    });

    /*Focus comments box when users change the another day call options :: 02Feb2018 :: ABI*/
    $("input[name=CallAnother]").on("click", function () {
        
        $("#txtCallAnotherComments").focus();
    });

    /*Dialog For Call Another Day option :: 24Nov2017::ABI*/
    $("#DialogCallAnotherOptions").dialog({
        autoOpen: false,
        resizable: false,
        title: "CALL OTHER DAY",
        width: 525,
        height: 525,
        modal: true,
        buttons: {
            Yes: function () {
                
                var DayAdd = $("input[name='CallAnother']:checked").attr("data-value");
                var Customer = $("#CurrentCustomerNo").html();
                var Comments = ($("#txtCallAnotherComments").val() == "") ? "" : escape($("#txtCallAnotherComments").val())
                var CALL_ID = $("#DialogCallOptionsOnEsc").data("CALL_ID");
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/SaveCallAnotherDay",
                    data: "{'CALL_ID':'" + CALL_ID + "','Customer':'" + Customer + "','DayAdd':'" + DayAdd + "','Comments':'" + Comments + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        
                        var result = output.d;
                        if (result == "success") {
                            //$.MessageBox("Call another day log saved");       //Comment on 30Jan2018
                            $("#DialogCallAnotherOptions").dialog("close");
                            $("#fgrdCallListDetails").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                        $("#txtCallAnotherComments").val("");
                    },
                    onError: function (xhr, status, errorThrown) {
                        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            },
            No: function () {
                $("#DialogCallAnotherOptions").dialog("close");
            }
        },
        open: function () {
            
            DlgOverlayCount = parseInt(DlgOverlayCount) + 1;
            DlgNameWitCount = "DialogCallAnotherOptions";

            $("#rbCallTomorrow").attr("checked", true);
            $("#txtCallAnotherComments").val("");
            $("#txtCallAnotherComments").focus();
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        },
        close: function () {
            $("#txtCustSearch").focus();
        }
    });

    $('input').keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            if ($(this).attr('id') == "txtCallLogComments") {
                $("#DialogCallLog").siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
            }
            if ($(this).attr('id') == "txtCallLaterComments") {
                $("#DialogCallTodayOptions").siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
            }
            if ($(this).attr('id') == "txtCallAnotherComments") {
                $("#DialogCallAnotherOptions").siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
            }
        }
    });

    //$("html").click(function () {
    //    $(".CallListOptions").hide();
    //});

    //$(document).on('keyup', function (evt) {
        
    //    if (NewOrderDialogOpen == false) {
    //        if (evt.keyCode == 27) {
    //            $("#" + DlgNameWitCount).dialog("close");
    //            DlgOverlayCount = DlgOverlayCount - 1;
    //        }
    //    }
    //});



</script>
