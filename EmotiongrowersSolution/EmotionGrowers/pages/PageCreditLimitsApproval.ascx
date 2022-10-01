<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageCreditLimitsApproval.ascx.vb" Inherits="pages_PageCreditLimitsApproval" %>
<script type="text/javascript" src="js/validation.js"></script>
<style>
    #DivCreditLimitsApprovalDialog tr{       
        font-size:15px;
    }

   #DivCreditLimitsApprovalDialog::-webkit-input-placeholder {
	   color:#00ffff;
        opacity:10;
}
#DivCreditLimitsApprovalDialog::-moz-placeholder { 
	   color:#00ffff;
        opacity:10;
}
#DivCreditLimitsApprovalDialog:-moz-placeholder { 
	   color:#00ffff;
        opacity:10;
}
#DivCreditLimitsApprovalDialog:-ms-input-placeholder { 
	    color: #00ffff;
        opacity:10;
}	/* IE10+ */



   #DivCreditLimitsApprovalDialog ::-webkit-input-placeholder {
        opacity:2;
        color: #00ffff;
    }

   #DivCreditLimitsApprovalDialog td{
        word-wrap:break-word;height: auto;font-size: 20px; color: white; background-color: blue;font-weight: bold;
        font-family: monospace,serif;
    }

   a {
   outline: 0;
}

   a:hover, a:active, a:focus {
  /* styling for any way a link is about to be used */
  outline: 0;
}
</style>

<div id="DivCreditLimitsApprovalDialog">
    <table>
        <tr>
            <td>CUSTOMER#</td>
            <td colspan="4">
                <label id="lblCLACustomer"></label>
            </td>
        </tr>        
        <tr>
            <td>NAME</td>
            <td colspan="4">
                <label id="lblCLAName" class="lblCustName1"></label>
            </td>
        </tr>      
        <tr>
            <td>BALANCE</td>
            <td colspan="2">
                <label id="lblCLABalance" style="float:right;" class="lblARBalance1"></label>
            </td>
            <td></td>
            <td></td>
        </tr>      
        <tr>
            <td>ARLIMIT</td>
            <td colspan="2">
                <label id="lblCLAARLimit" style="float:right;" class="lblARLimit"></label>
            </td>
            <td></td>
            <td></td>
        </tr>  
        <tr style="height:20px;">
            <td></td>
            <td colspan="4"></td>
        </tr>
        <tr>
            <td>UNAPPLIED</td>
             <td colspan="2">
                <%--<label id="lblCLAUnApplied" style="float:right;"></label>--%>
                 <a href="#" class="aUnAppliedAmountForCustomer" style="color: Red; font-weight: bold;float: right;"></a>
            </td>
            <td></td>
            <td></td>
        </tr>   
        <tr style="height:20px;">
            <td></td>
            <td colspan="4"></td>
        </tr>
        <tr>
             <td>OPEN ORDER</td>
            <td colspan="2">                
                <a href="#" class="CLAOpenOrder" style="color: yellow;font-weight: bold; float: right;">0.00</a>
            </td>           
            <td></td>
            <td></td>
        </tr>
         <tr style="height:20px;">
            <td></td>
            <td colspan="4"></td>
        </tr> 
        <tr>
            <td>CURRENT ORDERS</td>
            <td colspan="2">
                <%--<a id="aCLACurrentOrders"  style="float:right;text-decoration:underline;cursor:pointer;" class=""></a>--%>
                <a href="#" class="CurrentOrdersBalance" style="color: Red;font-weight: bold; float: right;">0.00</a>
            </td>
            <td></td>
            <td></td>
        </tr>  
        <tr>
            <td><label class="lblCurrentMonth" style="text-transform: capitalize;"></label></td>
            <td colspan="2">
                <label id="lblCLACurrent" style="float:right;" class="CurrentMonthBalance"></label>
            </td>
            <td></td>
            <td></td>
        </tr>     
        <tr>
            <td><label class="lblOneMonthBefore" style="text-transform: capitalize;"></label></td>
            <td colspan="2">
                <label id="lblCLAOneMonthBefore" style="float:right;" class="OneMonthBeforeBalance"></label>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td><label class="lblTwoMonthsBefore" style="text-transform: capitalize;">></label></td>
            <td colspan="2">
                <label id="lblCLATwoMonthsBefore" style="float:right;" class="TwoMonthsBeforeBalance"></label>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td><label class="lblThreeMonthsBefore" style="text-transform: capitalize;"></label></td>
            <td colspan="2">
                <label id="lblCLAThreeMonthsBefore" style="float:right;" class="ThreeMonthsBeforeBalance"></label>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr style="height:20px;">
            <td></td>
            <td colspan="4"></td>
        </tr>
        
        <tr style="height:20px;">
            <td></td>
            <td colspan="4"></td>
        </tr>
        <tr>
            <td>LAST PAYMENT</td>
            <td colspan="2">
                <div id="divCLALastPayment"></div>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>CREDIT TERMS</td>
            <td colspan="4">
                <label id="lblCLACreditTerms" class="lblTerms1"></label>
            </td>
        </tr>
        <tr>
            <td>APPROVE ORDER</td>
            <td colspan="4">
                <input type="checkbox" id="chkCLAAppoveOrder" />
                <%--<input type="text" id="txtCLAAppoveOrder" style="background-color: red; border: red;color:#00ffff;width:15px;" maxlength="1" />--%>
            </td>
        </tr>
        <tr>
            <td>ADDITIONAL AMOUNT</td>
            <td colspan="4">
                <input type="text" id="txtCLAAdditionalAmount" class="ClsTwoDecimalsOnly" style="text-align:right;background-color: #A70000; border: #A70000;color:#00ffff;width:145px;" />
            </td>
        </tr>
        <tr style="height:20px;">
            <td></td>
            <td colspan="4"></td>
        </tr>
        <tr>
            <td>HOLIDAY CREDIT LIMIT</td>
             <td colspan="2">
                <input type="text" id="txtCLAHolidayCreditLimit" class="ClsTwoDecimalsOnly" style="text-align:right;background-color: #A70000; border: #A70000;color:#00ffff;width:145px;" />
            </td>
            <td>EXPIRES ON</td>
             <td>
               <input type="text" id="txtExpiresOn" style="background-color: #A70000; border: #A70000;color:#00ffff;width:145px;" />
            </td>
        </tr>
        
    </table>
</div>

<div id="DivCLACustomerNo" style="display:none;" runat="server"></div>
<div id="DivGetCustomerValuesFlag" style="display:none;"></div>

<script type="text/javascript">
   
    $(document).ready(new function () {
               
        $("#chkCLAAppoveOrder").iButton({
            labelOn: "Yes",
            labelOff: "No"
        });
        $("#chkCLAAppoveOrder").iButton("toggle", false);
        debugger;

        $("#txtExpiresOn").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date());

        GetCustDetailsPageCreditLimitsApproval($("#ctl00_DivCLACustomerNo").html());
    });


    function GetCustDetailsPageCreditLimitsApproval(Customer) {
        debugger;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSalesOrderCustDetails',
            data: '{ "Customer":"' + Customer + '"}',
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                var res = output.d;
                
                $("#lblCLACustomer").html(res.Customer);
                $(".lblCustName1").html(res.Name);                           
                $(".lblARBalance1").html(res.ARBALANCE.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));              
                $(".lblARLimit").html(res.ARLimit.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
              
                var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August",
                                  "September", "October", "November", "December"];

                var now = new Date();
                var dupDate = new Date();

                $(".lblCurrentMonth").html(monthNames[now.getMonth()]);
                $(".lblOneMonthBefore").html(monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 1))]);
                $(".lblTwoMonthsBefore").html(monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 2))]);
                $(".lblThreeMonthsBefore").html(monthNames[dupDate.getMonth(dupDate.setMonth(now.getMonth() - 3))]);
                $(".CurrentOrdersBalance").html(res.ORDERS.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $(".CurrentOrdersBalance").attr("data-customer", "");
                $(".CurrentOrdersBalance").attr("data-customer", Customer);

                try {
                    $(".CurrentOrdersBalance").data().customer = "";
                    $(".CurrentOrdersBalance").data().customer = Customer;
                }
                catch (e) {

                }

                $(".CurrentMonthBalance").html(res.BAL0030.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $(".OneMonthBeforeBalance").html(res.BAL3060.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $(".TwoMonthsBeforeBalance").html(res.BAL6090.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                $(".ThreeMonthsBeforeBalance").html(res.BAL90.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));

                $(".lblTerms1").html(res.TERMSCODE + " " + res.TERMSDESC);
                $("#divCLALastPayment").html("<div style='width: 114px;vertical-align: middle; display: table-cell;'>" + res.LastPayment + "</div><div style='vertical-align: middle; display: table-cell;'>" + addCommas(parseFloat(res.LastPayAmt).toFixed(2)) + "</div>");
                $("#txtExpiresOn").attr("placeholder", res.EXPDATE).css('color', 'color:#00ffff;');
                $("#txtCLAHolidayCreditLimit").attr("placeholder", addCommas(parseFloat(res.HOLLYDAYAM).toFixed(2))).css('color', 'color:#00ffff;');
                $("#DivGetCustomerValuesFlag").html("Customer");
                $("#chkCLAAppoveOrder").iButton("toggle", res.APPROVED == "N" ? false : true);
                $("#DivGetCustomerValuesFlag").html("");
                $("#txtCLAAdditionalAmount").attr("placeholder", addCommas(parseFloat(res.AMTAPPROV).toFixed(2))).css('color', 'color:#00ffff;');
                /*set cust.no and name to info img attributes*/
                $(".imgCustInfo").attr('data-custno', Customer);
                $(".imgCustInfo").attr('data-custname', res.Name);
                $(".imgCustSales").attr('data-custno', Customer);
                $(".imgCustSales").attr('data-custname', res.Name);
                
                $(".CLAOpenOrder").html(addCommas(parseFloat(res.OpenOrder).toFixed(2)));
                $("#txtCLAAdditionalAmount").focus();                
            }
        });

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUnAppliedAmountForCustomer',
            data: '{ "CustomerNo":"' + Customer + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#lblCLACustomer").html(Customer);
                $(".aUnAppliedAmountForCustomer").html(output.d.toFixed(2));
                $("#txtCLAAdditionalAmount").focus();
            }
        });


    }

    /*Add commas in Amounts field*/
    function addCommas(nStr) {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }

    //$("#txtCLAAppoveOrder").keypress(function (event) {
    //    if (event.keyCode == 13) {
    //        $("#txtCLAAdditionalAmount").focus();
    //    }
    //});

    $("#txtCLAAdditionalAmount").keypress(function (event) {
        $("#DivGetCustomerValuesFlag").html("");
        if (event.keyCode == 13) {
            $("#txtCLAHolidayCreditLimit").focus();
        }
    });

    $("#txtCLAHolidayCreditLimit").keypress(function (event) {
        $("#DivGetCustomerValuesFlag").html("");
        if (event.keyCode == 13) {
            $("#txtExpiresOn").focus();
        }
    });

    $("#txtExpiresOn").keypress(function (event) {
        $("#DivGetCustomerValuesFlag").html("");
        if (event.keyCode == 13) {
            $("#DivPageCreditLimitsApproval").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").focus();
        }
    });


    $("#txtCLAAdditionalAmount").on('change', function (event) {
        $("#DivPageCreditLimitsApproval").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").show();
    });

    $("#txtCLAHolidayCreditLimit").on('change', function (event) {
        $("#DivPageCreditLimitsApproval").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").show();
    });

    $("#txtExpiresOn").change(function (event) {
        $("#DivPageCreditLimitsApproval").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").show();
    });

    $("#chkCLAAppoveOrder").on('change',function () {
        if ($("#DivGetCustomerValuesFlag").html() == "") {
            $("#DivPageCreditLimitsApproval").siblings('.ui-dialog-buttonpane').find("button:contains('Save')").show();
        }
    });
    
    $("#aCLACurrentOrders").die('click').live("click", function (e) {
        debugger;
        try {
            $("#DivCurrentOrdersDialog").dialog("close");
        }
        catch (ex) { }
        var Customer = $("#aCLACurrentOrders").data().customer;

        var para = 'Customer=' + Customer;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageCurrentOrdersForCustomer.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
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
                        debugger;
                    },

                });
                $("#DivCurrentOrdersDialog").dialog('option', 'title', 'Current Order Detail for Customer ::' + Customer);
                $("#DivCurrentOrdersDialog").html(output.d).dialog("open");
            }
        });

    });


    $(".CurrentOrdersBalance").die('click').live("click", function (e) {
        debugger;
        try {
            $("#DivCurrentOrdersDialog").dialog("close");
        }
        catch (ex) { }
        var CreditLimitsApprovalDivID = $("#CustCurrentDivID").html();
        //var Customer = $("#"+CreditLimitsApprovalDivID+".CurrentOrdersBalance").data().customer;
        var Customer = $("#" + CreditLimitsApprovalDivID + ".CurrentOrdersBalance").data("data-customer");

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
                        debugger;
                    },

                });
                $("#DivCurrentOrdersDialog").dialog('option', 'title', 'Current Order Detail for Customer ::' + Customer);
                $("#DivCurrentOrdersDialog").html(output.d).dialog("open");
            }
        });

    });

    $(".CLAOpenOrder").die('click').live("click", function (e) {
        debugger;
        var para = 'Customer=' + $("#ctl00_DivCLACustomerNo").html();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            async: false,
            data: '{ "controlName":"pages/PageOpenOrders.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $('<div id="DivOpenOrderPageDialog"></div>').dialog({
                    title: 'Open Order',
                    autoOpen: false,
                    resizable: false,
                    modal: true,
                    width: 1120,
                    height: $(window).height() - 10,
                    //closeOnEscape:false,
                    close: function (event, ui) {
                        $(this).dialog('destroy').remove();
                    },
                    open: function () {
                        debugger;
                        GetCustomerDetailsforOpenOrder();
                    },

                });
                debugger;
                //$("#DivOpenOrderPageDialog").html("");
                $("#DivOpenOrderPageDialog").html(output.d).dialog("open");
            }
        });
    });

</script>