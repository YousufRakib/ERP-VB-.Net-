<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCustNetSales.ascx.vb" Inherits="pages_PageCustNetSales" %>
<script src="js/ChartNew.js"></script>

<style>
     .tblCustomerNetSalesDialog td{
        /*padding: 5px;
        font-size: 12px;*/
        font-weight: bold;
    }

    .lbldet{
        background-color:#A70000;
        color:#00FFFF;
        font-size:14px;
    }

    .netlabels{
        color:#FFFF34;
        font-size:14px;
    }

</style>

<table>
    <tr>
        <td>
            <div id="CustomerNetSalesDialog" style="background-color: black; height:365px;">
                <%--width:340px;">--%>
                <table class="tblCustomerNetSalesDialog">
                    <tr>
                        <td style="border: #FFFF34 1px solid; color: #FFFF34;">
                            <div id="DivCustSince" style="padding: 5px;"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdNetSalesRS" style="border: #FFFF34 1px solid;">
                            <table id="tblNetSalesRS">
                                <tr class="netlabels">
                                    <td style="width: 140px;">
                                        <label>**Y-T-D**</label>
                                    </td>
                                    <td style="width: 140px; text-align: right;">
                                        <label class="year1"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td style="width: 140px; text-align: right;">
                                        <label class="year2"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td style="width: 140px; text-align: right;">
                                        <label class="year3"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td style="width: 140px; text-align: right;">
                                        <label class="year4"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td style="width: 140px; text-align: right;">
                                        <label class="year5"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 140px;">
                                        <label class="netlabels">Sales</label>
                                    </td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y1Sales"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y2Sales"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y3Sales"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y4Sales"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y5Sales"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 140px;">
                                        <label class="netlabels">Payments</label>
                                    </td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y1Payment"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y2Payment"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y3Payment"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y4Payment"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y5Payment"></label>
                                    </td>
                                </tr>
                                <tr style="border-bottom: #FFFF34 1px solid;">
                                    <td style="width: 140px;">
                                        <label class="netlabels">Credits</label>
                                    </td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y1Credits"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y2Credits"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y3Credits"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y4Credits"></label>
                                    </td>
                                    <td style='width: 40px;'></td>
                                    <td class='lbldet' style="width: 140px; text-align: right;">
                                        <label class="Y5Credits"></label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>

        </td>
    </tr>
    <tr>
        <td>
            <div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
                <div id="DivCustNetSalesDialogButtonList" class="ui-dialog-buttonset" style="float: right;">
                    <button type="button" id="btnCustomerNetSalesGraph" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false"><span class="ui-button-text">Graph</span></button>
                    <button type="button" id="btnCustomerNetSalesCancel" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-cancel" role="button" aria-disabled="false"><span class="ui-button-text">Close</span></button>
                </div>
            </div>
        </td>
    </tr>
</table>
 

<div id="DivSalesYear1" class="slscretyr" style="display:none;"></div>
<div id="DivSalesYear2" class="slscrelyr" style="display:none;"></div>
<div id="DivSalesYear3" class="slscrelyr2" style="display:none;"></div>
<div id="DivSalesYear4" class="slscrelyr3" style="display:none;"></div>
<div id="DivSalesYear5" class="slscrelyr4" style="display:none;"></div>

<div id="DialogSalesGraph" style="margin-left: 15px;">
    <canvas id="salesChart" width="1100" height="400" style="display: none;"></canvas>
</div>

<div id="DivCustomerNo_CustNetSales" style="display:none;" runat="server"></div>
<div id="LoggedInUserType_CustNetSales" runat="server" style="display: none"></div>

<script>

    var Customer = $("#ctl00_DivCustomerNo_CustNetSales").html();
    debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSalesOrderCustInfo',
            data: '{ "Customer":"' + Customer + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                var res = output.d;
                $(".lblCustSince").html(res[0].CustSince);
                $(".lblLastSale").html(res[0].LastSale);
                $(".lblLastPay").html(res[0].LastPayment);
                $(".lblLastPayAmt").html("$" + delimitNumbers(res[0].LastPayAmt.toFixed(2)));

                $(".txtSlsman").val(res[0].SalesMan);
                $(".txtSlsmanName").val(res[0].SalesmanName);
                $(".txtAPContact").val(res[0].APCONTACT.trim());
                $(".txtAPPhone").val(res[0].APPHONE.trim());
                $(".txtAPEmail").val(res[0].APEmail.trim());
                $(".txtAPFax").val(res[0].APFax.trim());

                $(".txtBuyer").val(res[0].Purchaser);
                $(".txtPhone").val(res[0].PHONE.trim());
                $(".txtFax").val(res[0].Fax.trim());

                $(".txtAirport").val(res[0].Airport.trim());
                $(".txtAirline").val(res[0].Airline.trim());
                $(".txtShipInstrc").val(res[0].ShipInstr);
                $(".txtEmail").val(res[0].Email);
                $(".txtSendInv").val(res[0].FaxOrEmail.trim());

                var days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

                var CallDays = res[0].CallDays;
                var CDays = "";
                if (CallDays != "") {
                    var splitCDays = CallDays.split('');
                    for (var i = 0; i < splitCDays.length; i++) {
                        switch (i) {
                            case i:
                                if (splitCDays[i] != " ") {
                                    (splitCDays.length == 1) ? CDays = days[i] : CDays += "&nbsp;&nbsp;" + days[i];
                                }
                                $(".txtCallDays" + i).val(splitCDays[i].trim());
                                break;
                        }
                    }
                }
                $(".lblCallDays").html(CDays);

                var CallTime = res[0].CallTime;
                var CTime = "";
                if (CallTime != "") {
                    var splitCTime = CallTime.match(/.{1,2}/g);
                    CTime = splitCTime[0] + ":" + splitCTime[1];
                }
                $(".txtCallTime").val(CTime.trim());

                var DeliveryDays = res[0].DeliveryDays;
                var Dells = "";
                if (DeliveryDays != "") {
                    var splitDDays = DeliveryDays.match(/.{1,2}/g);
                    for (var i = 0; i < days.length; i++) {
                        switch (i) {
                            case i:
                                if (splitDDays[i] == undefined) {
                                    splitDDays[i] = "";
                                }
                                Dells += days[i] + "-" + splitDDays[i] + "&nbsp;&nbsp;&nbsp;";
                                $(".txtDelivDays" + i).val(splitDDays[i].trim());
                                $(".lblDells" + i).html(splitDDays[i].trim());
                                break;
                        }
                    }
                }
                //$(".lblDelivDays").html(Dells);

                //$("#tblNetSalesRS").append(temp);
                //temp = FrameNetSalesInfo(Customer);

                var d = new Date();
                $(".year1").html(d.getFullYear());
                $(".year2").html(d.getFullYear() - 1);
                $(".year3").html(d.getFullYear() - 2);
                $(".year4").html(d.getFullYear() - 3);
                $(".year5").html(d.getFullYear() - 4);

                $(".Y1Sales").html(delimitNumbers(res[0].Y1Sales.toFixed(2)));
                $(".Y2Sales").html(delimitNumbers(res[0].Y2Sales.toFixed(2)));
                $(".Y3Sales").html(delimitNumbers(res[0].Y3Sales.toFixed(2)));
                $(".Y4Sales").html(delimitNumbers(res[0].Y4Sales.toFixed(2)));
                $(".Y5Sales").html(delimitNumbers(res[0].Y5Sales.toFixed(2)));

                $(".Y1Payment").html(delimitNumbers(res[0].Y1Payment.toFixed(2)));
                $(".Y2Payment").html(delimitNumbers(res[0].Y2Payment.toFixed(2)));
                $(".Y3Payment").html(delimitNumbers(res[0].Y3Payment.toFixed(2)));
                $(".Y4Payment").html(delimitNumbers(res[0].Y4Payment.toFixed(2)));
                $(".Y5Payment").html(delimitNumbers(res[0].Y5Payment.toFixed(2)));

                $(".Y1Credits").html(delimitNumbers(res[0].Y1Credits.toFixed(2)));
                $(".Y2Credits").html(delimitNumbers(res[0].Y2Credits.toFixed(2)));
                $(".Y3Credits").html(delimitNumbers(res[0].Y3Credits.toFixed(2)));
                $(".Y4Credits").html(delimitNumbers(res[0].Y4Credits.toFixed(2)));
                $(".Y5Credits").html(delimitNumbers(res[0].Y5Credits.toFixed(2)));

                var Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                //var Months = { 1: "January", 2: "February", 3: "March", 4: "April", 5: "May", 6: "June", 7: "July", 8: "August", 9: "September", 10: "October", 11: "November", 12: "December" };
                var slscretyr = [], slscrelyr = [], slscrelyr2 = [], slscrelyr3 = [], slscrelyr4 = [];

                var temp = "";
                for (var i = 1; i <= Months.length; i++) {
                    slscretyr[i] = parseFloat(res[0].slscretyr.substr((i - 1) * 10, 10) - res[0].slscretyr.substr((i - 1) * 10 + 121, 10));
                    slscretyr[i] = (slscretyr[i] == 0.00) ? " " : delimitNumbers(slscretyr[i].toFixed(2));
                    slscrelyr[i] = (res[0].slscrelyr.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr.substr((i - 1) * 10, 10)).toFixed(2));
                    slscrelyr2[i] = (res[0].slscrelyr2.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr2.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr2.substr((i - 1) * 10, 10)).toFixed(2));
                    slscrelyr3[i] = (res[0].slscrelyr3.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr3.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr3.substr((i - 1) * 10, 10)).toFixed(2));
                    slscrelyr4[i] = (res[0].slscrelyr4.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr4.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr4.substr((i - 1) * 10, 10)).toFixed(2));


                    temp += "<tr class='trDynamicNetSM'><td style='width:140px;' class='netlabels'>" + Months[i - 1] + "</td><td class='lbldet' style='width:140px;text-align:right;'>" + slscretyr[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr2[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr3[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr4[i] + "</td></tr>";
                }

                $("#DivSalesYear1").html(slscretyr.join("#"));
                $("#DivSalesYear2").html(slscrelyr.join("#"));
                $("#DivSalesYear3").html(slscrelyr2.join("#"));
                $("#DivSalesYear4").html(slscrelyr3.join("#"));
                $("#DivSalesYear5").html(slscrelyr4.join("#"));

                $("#tblNetSalesRS").append(temp);

            }
        });
    
        function FrameNetSalesInfo(Customer) {
            debugger;
            var result="";
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetNestSalesCalculation',
                data: '{ "Customer":"' + Customer + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (output, status) {
                    var res = output.d;
                    debugger;
                    var d = new Date();
                    $(".year1").html(d.getFullYear());
                    $(".year2").html(d.getFullYear() - 1);
                    $(".year3").html(d.getFullYear() - 2);
                    $(".year4").html(d.getFullYear() - 3);
                    $(".year5").html(d.getFullYear() - 4);

                    $(".Y1Sales").html(delimitNumbers(res[0].Y1Sales.toFixed(2)));
                    $(".Y2Sales").html(delimitNumbers(res[0].Y2Sales.toFixed(2)));
                    $(".Y3Sales").html(delimitNumbers(res[0].Y3Sales.toFixed(2)));
                    $(".Y4Sales").html(delimitNumbers(res[0].Y4Sales.toFixed(2)));
                    $(".Y5Sales").html(delimitNumbers(res[0].Y5Sales.toFixed(2)));

                    $(".Y1Payment").html(delimitNumbers(res[0].Y1Payment.toFixed(2)));
                    $(".Y2Payment").html(delimitNumbers(res[0].Y2Payment.toFixed(2)));
                    $(".Y3Payment").html(delimitNumbers(res[0].Y3Payment.toFixed(2)));
                    $(".Y4Payment").html(delimitNumbers(res[0].Y4Payment.toFixed(2)));
                    $(".Y5Payment").html(delimitNumbers(res[0].Y5Payment.toFixed(2)));

                    $(".Y1Credits").html(delimitNumbers(res[0].Y1Credits.toFixed(2)));
                    $(".Y2Credits").html(delimitNumbers(res[0].Y2Credits.toFixed(2)));
                    $(".Y3Credits").html(delimitNumbers(res[0].Y3Credits.toFixed(2)));
                    $(".Y4Credits").html(delimitNumbers(res[0].Y4Credits.toFixed(2)));
                    $(".Y5Credits").html(delimitNumbers(res[0].Y5Credits.toFixed(2)));

                    var Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                    //var Months = { 1: "January", 2: "February", 3: "March", 4: "April", 5: "May", 6: "June", 7: "July", 8: "August", 9: "September", 10: "October", 11: "November", 12: "December" };
                    var slscretyr = [], slscrelyr = [], slscrelyr2 = [], slscrelyr3 = [], slscrelyr4 = [];

                    var temp = "";
                    for (var i = 1; i <= Months.length; i++) {
                        slscretyr[i] = parseFloat(res[0].slscretyr.substr((i - 1) * 10, 10) - res[0].slscretyr.substr((i - 1) * 10 + 121, 10));
                        slscretyr[i] = (slscretyr[i] == 0.00) ? " " : delimitNumbers(slscretyr[i].toFixed(2));
                        slscrelyr[i] = (res[0].slscrelyr.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr.substr((i - 1) * 10, 10)).toFixed(2));
                        slscrelyr2[i] = (res[0].slscrelyr2.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr2.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr2.substr((i - 1) * 10, 10)).toFixed(2));
                        slscrelyr3[i] = (res[0].slscrelyr3.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr3.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr3.substr((i - 1) * 10, 10)).toFixed(2));
                        slscrelyr4[i] = (res[0].slscrelyr4.substr((i - 1) * 10, 10).trim() === "" || res[0].slscrelyr4.substr((i - 1) * 10, 10).trim() == "0.00") ? " " : delimitNumbers(parseFloat(res[0].slscrelyr4.substr((i - 1) * 10, 10)).toFixed(2));


                        temp += "<tr class='trDynamicNetSM'><td style='width:140px;' class='netlabels'>" + Months[i - 1] + "</td><td class='lbldet' style='width:140px;text-align:right;'>" + slscretyr[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr2[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr3[i] + "</td><td style='width:40px;'></td><td class='lbldet' style='width:140px;text-align:right;'>" + slscrelyr4[i] + "</td></tr>";
                    }

                    $("#DivSalesYear1").html(slscretyr.join("#"));
                    $("#DivSalesYear2").html(slscrelyr.join("#"));
                    $("#DivSalesYear3").html(slscrelyr2.join("#"));
                    $("#DivSalesYear4").html(slscrelyr3.join("#"));
                    $("#DivSalesYear5").html(slscrelyr4.join("#"));
                    result = temp;
                }
            });
            return result;
        }

        $("#DialogSalesGraph").dialog({
            autoOpen: false,
            resizable: false,
            modal: true,
            width: 1150,
            height: 550,
            buttons: {
                Ok: function () {
                    $(this).dialog("close");
                }
            },
            open: function () {
                $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
            }
        });

        function ShowSalesGraph() {
            debugger;
            $("#DialogSalesGraph").dialog('option', 'title', 'Sales Details for Customer :: ' + $("#CurrentCustomerNo").html())
            $("#DialogSalesGraph").dialog("open");

            //$("#salesChart").html("");
            //var ctx = document.getElementById('salesChart').getContext('2d');
            //debugger;

            try {
                $("#salesChart").remove();
            }
            catch (ex) { }

            $('#DialogSalesGraph').html("<canvas id='salesChart' width='1100' height='400'></canvas>");

            var ctx = document.getElementById("salesChart").getContext('2d');

            var dynLabels = [];
            for (var y = 1; y <= 5; y++) {
                dynLabels.push($(".year" + y).html());
            }
            dynLabels.join(",");

            var Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var slscretyr = [], slscrelyr = [], slscrelyr2 = [], slscrelyr3 = [], slscrelyr4 = [];
            var Months1 = [], Months2 = [], Months3 = [], Months4 = [], Months5 = [], Months6 = [], Months7 = [],
                        Months8 = [], Months9 = [], Months10 = [], Months11 = [], Months12 = [];

            slscretyr = $("#DivSalesYear1").html().replace(/,/g, '').split("#");
            slscrelyr = $("#DivSalesYear2").html().replace(/,/g, '').split("#");
            slscrelyr2 = $("#DivSalesYear3").html().replace(/,/g, '').split("#");
            slscrelyr3 = $("#DivSalesYear4").html().replace(/,/g, '').split("#");
            slscrelyr4 = $("#DivSalesYear5").html().replace(/,/g, '').split("#");


            Months1.push((slscretyr[1].trim() == "" ? "0.00" : slscretyr[1]) + "," + (slscrelyr[1].trim() == "" ? "0.00" : slscrelyr[1]) + "," + (slscrelyr2[1].trim() == "" ? "0.00" : slscrelyr2[1]) + "," + (slscrelyr3[1].trim() == "" ? "0.00" : slscrelyr3[1]) + "," + (slscrelyr4[1].trim() == "" ? "0.00" : slscrelyr4[1]));
            Months2.push((slscretyr[2].trim() == "" ? "0.00" : slscretyr[2]) + "," + (slscrelyr[2].trim() == "" ? "0.00" : slscrelyr[2]) + "," + (slscrelyr2[2].trim() == "" ? "0.00" : slscrelyr2[2]) + "," + (slscrelyr3[2].trim() == "" ? "0.00" : slscrelyr3[2]) + "," + (slscrelyr4[2].trim() == "" ? "0.00" : slscrelyr4[2]));
            Months3.push((slscretyr[3].trim() == "" ? "0.00" : slscretyr[3]) + "," + (slscrelyr[3].trim() == "" ? "0.00" : slscrelyr[3]) + "," + (slscrelyr2[3].trim() == "" ? "0.00" : slscrelyr2[3]) + "," + (slscrelyr3[3].trim() == "" ? "0.00" : slscrelyr3[3]) + "," + (slscrelyr4[3].trim() == "" ? "0.00" : slscrelyr4[3]));
            Months4.push((slscretyr[4].trim() == "" ? "0.00" : slscretyr[4]) + "," + (slscrelyr[4].trim() == "" ? "0.00" : slscrelyr[4]) + "," + (slscrelyr2[4].trim() == "" ? "0.00" : slscrelyr2[4]) + "," + (slscrelyr3[4].trim() == "" ? "0.00" : slscrelyr3[4]) + "," + (slscrelyr4[4].trim() == "" ? "0.00" : slscrelyr4[4]));
            Months5.push((slscretyr[5].trim() == "" ? "0.00" : slscretyr[5]) + "," + (slscrelyr[5].trim() == "" ? "0.00" : slscrelyr[5]) + "," + (slscrelyr2[5].trim() == "" ? "0.00" : slscrelyr2[5]) + "," + (slscrelyr3[5].trim() == "" ? "0.00" : slscrelyr3[5]) + "," + (slscrelyr4[5].trim() == "" ? "0.00" : slscrelyr4[5]));
            Months6.push((slscretyr[6].trim() == "" ? "0.00" : slscretyr[6]) + "," + (slscrelyr[6].trim() == "" ? "0.00" : slscrelyr[6]) + "," + (slscrelyr2[6].trim() == "" ? "0.00" : slscrelyr2[6]) + "," + (slscrelyr3[6].trim() == "" ? "0.00" : slscrelyr3[6]) + "," + (slscrelyr4[6].trim() == "" ? "0.00" : slscrelyr4[6]));
            Months7.push((slscretyr[7].trim() == "" ? "0.00" : slscretyr[7]) + "," + (slscrelyr[7].trim() == "" ? "0.00" : slscrelyr[7]) + "," + (slscrelyr2[7].trim() == "" ? "0.00" : slscrelyr2[7]) + "," + (slscrelyr3[7].trim() == "" ? "0.00" : slscrelyr3[7]) + "," + (slscrelyr4[7].trim() == "" ? "0.00" : slscrelyr4[7]));
            Months8.push((slscretyr[8].trim() == "" ? "0.00" : slscretyr[8]) + "," + (slscrelyr[8].trim() == "" ? "0.00" : slscrelyr[8]) + "," + (slscrelyr2[8].trim() == "" ? "0.00" : slscrelyr2[8]) + "," + (slscrelyr3[8].trim() == "" ? "0.00" : slscrelyr3[8]) + "," + (slscrelyr4[8].trim() == "" ? "0.00" : slscrelyr4[8]));
            Months9.push((slscretyr[9].trim() == "" ? "0.00" : slscretyr[9]) + "," + (slscrelyr[9].trim() == "" ? "0.00" : slscrelyr[9]) + "," + (slscrelyr2[9].trim() == "" ? "0.00" : slscrelyr2[9]) + "," + (slscrelyr3[9].trim() == "" ? "0.00" : slscrelyr3[9]) + "," + (slscrelyr4[9].trim() == "" ? "0.00" : slscrelyr4[9]));
            Months10.push((slscretyr[10].trim() == "" ? "0.00" : slscretyr[10]) + "," + (slscrelyr[10].trim() == "" ? "0.00" : slscrelyr[10]) + "," + (slscrelyr2[10].trim() == "" ? "0.00" : slscrelyr2[10]) + "," + (slscrelyr3[10].trim() == "" ? "0.00" : slscrelyr3[10]) + "," + (slscrelyr4[10].trim() == "" ? "0.00" : slscrelyr4[10]));
            Months11.push((slscretyr[11].trim() == "" ? "0.00" : slscretyr[11]) + "," + (slscrelyr[11].trim() == "" ? "0.00" : slscrelyr[11]) + "," + (slscrelyr2[11].trim() == "" ? "0.00" : slscrelyr2[11]) + "," + (slscrelyr3[11].trim() == "" ? "0.00" : slscrelyr3[11]) + "," + (slscrelyr4[11].trim() == "" ? "0.00" : slscrelyr4[11]));
            Months12.push((slscretyr[12].trim() == "" ? "0.00" : slscretyr[12]) + "," + (slscrelyr[12].trim() == "" ? "0.00" : slscrelyr[12]) + "," + (slscrelyr2[12].trim() == "" ? "0.00" : slscrelyr2[12]) + "," + (slscrelyr3[12].trim() == "" ? "0.00" : slscrelyr3[12]) + "," + (slscrelyr4[12].trim() == "" ? "0.00" : slscrelyr4[12]));

            Months1.join(",")
            Months2.join(",")
            Months3.join(",")
            Months4.join(",")
            Months5.join(",")
            Months6.join(",")
            Months7.join(",")
            Months8.join(",")
            Months9.join(",")
            Months10.join(",")
            Months11.join(",")
            Months12.join(",")

            var myBarChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: dynLabels,
                    datasets: [{
                        label: "Jan",
                        backgroundColor: "rgb(255,0,0)",
                        data: Months1[0].split(",")
                    }, {
                        label: "Feb",
                        backgroundColor: "rgb(0,255,0)",
                        data: Months2[0].split(",")
                    }, {
                        label: "Mar",
                        backgroundColor: "rgb(0,0,255)",
                        data: Months3[0].split(",")
                    }, {
                        label: "Apr",
                        backgroundColor: "rgb(255,255,0)",
                        data: Months4[0].split(",")
                    }, {
                        label: "May",
                        backgroundColor: "rgb(0,255,255)",
                        data: Months5[0].split(",")
                    }, {
                        label: "Jun",
                        backgroundColor: "rgb(255,0,255)",
                        data: Months6[0].split(",")
                    }, {
                        label: "Jul",
                        backgroundColor: "rgb(128,0,0)",
                        data: Months7[0].split(",")
                    }, {
                        label: "Aug",
                        backgroundColor: "rgb(0,128,0)",
                        data: Months8[0].split(",")
                    }, {
                        label: "Sep",
                        backgroundColor: "rgb(128,0,128)",
                        data: Months9[0].split(",")
                    }, {
                        label: "Oct",
                        backgroundColor: "rgb(128,128,128)",
                        data: Months10[0].split(",")
                    }, {
                        label: "Nov",
                        backgroundColor: "rgb(255,69,0)",
                        data: Months11[0].split(",")
                    }, {
                        label: "Dec",
                        backgroundColor: "rgb(0,191,255)",
                        data: Months12[0].split(",")
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                            }
                        }],
                        xAxes: [{
                            barPercentage: 0.95,
                        }]
                    }
                }
            });

            document.getElementById("salesChart").innerHTML = myBarChart;
        }

        $("#btnCustomerNetSalesCancel").die("click").live("click", function () {
            $("#DivNetSalesDetails_CustDetailsPage").dialog("close");
        });

        $("#btnCustomerNetSalesGraph").die("click").live("click", function () {
            ShowSalesGraph();
        });

</script>