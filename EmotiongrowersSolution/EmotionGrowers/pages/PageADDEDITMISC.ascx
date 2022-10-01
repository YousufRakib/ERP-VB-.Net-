<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageADDEDITMISC.ascx.vb" Inherits="pages_PageADDMISC" %>
<script type="text/javascript" src="js/validation.js"></script>

<style>
     #DivAddKMISC  ::-webkit-input-placeholder {
        color: black;
        
    }

    #DivAddKMISC ::-moz-placeholder {
        color: black;
      
    }
    

    #DivAddKMISC :-ms-input-placeholder {
        color: black;      
    }
    /* IE10+ */
</style>


<div id="DivAddKMISC" style="">
    <table style="width: 100%; height: 100%">
        <tr>
            <td colspan="2" style="height: 34px">
                <div class="YellowWarning_KMISC" align="center">
                </div>
            </td>
        </tr>
        <tr>
            <td align="left">Code</td>
            <td>
                <select id="lstFlowerList_KMISC" style="width: 200px" />
            </td>
        </tr>

           <tr>
            <td align="left">Description</td>
            <td>
                <input type="text" id="txtDescription_KMISC" class="AllUpperCaseTextBox"  style="width: 325px; height: 16px; float: left"  />
            </td>
        </tr>

        <tr>
            <td align="left">Quantity</td>
            <td>
                <input type="text" id="txtQuantity_KMISC" class="ClsTwoDecimalsOnly AllUpperCaseTextBox"  style="width: 70px; height: 16px; float: left"  />
            </td>
        </tr>

      

        <tr>
            <td align="left">Price/unit</td>
            <td>
                <input type="text" id="txtPrice_KMISC" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal"  style="width: 70px; height: 16px; float: left"  />
            </td>
        </tr>

        <tr>
            <td align="left">Cost/unit</td>
            <td>
                <input type="text" id="txtCost_ZMISC" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" style="width: 70px; height: 16px; float: left"  />
            </td>
        </tr>

    </table>
    <div style="margin-top:10px"  class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
        <div class="ui-dialog-buttonset">
        <button type="button" id="btnAddKMISC" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-save" role="button" aria-disabled="false"><span class="ui-button-text">Save</span></button><button type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only dialogbuttonstyle icon-cancel" id="btnCancelKMISC" role="button" aria-disabled="false"><span class="ui-button-text">Cancel</span></button></div></div>
</div>

<div id="DivOrderNo_MISC" runat="server" style="display: none"></div>
<div id="DivCustomerNo_MISC" runat="server" style="display: none"></div>
<div id="DivOrderDetailID_MISC" runat="server" style="display: none"></div>
<div id="DivCalledFromVET" runat="server" style="display: none">0</div>
<script>

    $(document).ready(function () {

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

        $('#txtCost_ZMISC').keypress(function (e) {
            var key = e.which;
            if (key == 13) // the enter key code
            {
                $("#btnAddKMISC").focus()
            }
        });


        $('#lstFlowerList_KMISC').change(function (e) {

            $("#txtDescription_KMISC").attr('placeholder', $(this).find('option:selected').attr("name")).val($(this).find('option:selected').attr("name"));
            
            $("#txtQuantity_KMISC").focus()
            var strSelectedKMisc = $("#lstFlowerList_KMISC").val();
            if (strSelectedKMisc.indexOf("DISC") >= 0) {
                $("#txtQuantity_KMISC").val(-1)
            //    console.log(strSelectedKMisc.slice(-2))
            //    console.log($("#row0").find("td").html())
            //    $("#txtPrice_KMISC").val((parseFloat(strSelectedKMisc.slice(-2)) * parseFloat($("#row0").find("td").eq(14).find("div").html()))/100)               
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetSaleDiscount',
                    data: "{'discountCode':'" + strSelectedKMisc + "', 'customerNo':'" + $("#ctl00_DivCustomerNo_OrderSave").html() + "','orderNo':'" + $("#ctl00_DivOrderNo_OrderSave").html().trim() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $("#txtPrice_KMISC").val(output.d);
                    }
                });
            }
            
                $("#txtQuantity_KMISC").val("");
                if ($("#lstFlowerList_KMISC").val() == "ZF") {

                    $("#txtQuantity_KMISC").attr("Placeholder", (isNaN(parseFloat(($("#NewOrderDetailBoxes_0").text() == "" ? $("#OrderDetailBoxes_0").text() : $("#NewOrderDetailBoxes_0").text())).toFixed(2))) ? "1.00" : parseFloat(($("#NewOrderDetailBoxes_0").text() == "" ? $("#OrderDetailBoxes_0").text() : $("#NewOrderDetailBoxes_0").text())).toFixed(2));
                }
                        $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetChargeByFlowerCode',
                        data: '{"FlowerCode":"' +  $('#lstFlowerList_KMISC').val() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {                          
                            var Orderdet = output.d
                            //alert(output);
                            //alert(Orderdet);
                            $("#txtPrice_KMISC").val("");
                            $("#txtPrice_KMISC").attr("Placeholder", parseFloat(Orderdet).toFixed(4));
                        }
                    });
            
            
        });

        

        $(".YellowWarning_KMISC").hide();
        $("#lstFlowerList_KMISC").val(0);
        $("#txtQuantity_KMISC").val("");
        $("#txtQuantity_KMISC").attr("Placeholder", "1.00");
        $("#txtPrice_KMISC").val("");
        $("#txtPrice_KMISC").attr("Placeholder", "0.0000");
        $("#txtCost_ZMISC").val("");
        $("#txtCost_ZMISC").attr("Placeholder","0.0000");

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFlowerWithCatergoryK',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFlowerList_KMISC').empty();
                var data = output.d;
                $('#lstFlowerList_KMISC').append('<option value="0">Select</option>');
                for (var i in data) {
                    var MISCList = data[i];
                    $('#lstFlowerList_KMISC').append('<option Name="' + MISCList.Name.trim() + '" value="' + MISCList.Flower.trim() + '" >[' + MISCList.Flower.trim() + '] ' + MISCList.Name.trim() + '</option>');
                }
                //debugger;
                if ($("#ctl00_DivOrderDetailID_MISC").html() != "") {
                    //debugger;
                    var OrderDetailID = $("#ctl00_DivOrderDetailID_MISC").html()
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetOrderDetailsForMISC',
                        data: '{"OrderDetailID":"' + OrderDetailID + '","ReadFromVET":"' + $("#ctl00_DivCalledFromVET").html() + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output) {
                           
                            //debugger;
                            var Orderdet = output.d
                            $("#lstFlowerList_KMISC").val(Orderdet.Flower).val(Orderdet.Flower);
                            $("#txtQuantity_KMISC").val("");
                            $("#txtQuantity_KMISC").attr("Placeholder", parseFloat(Orderdet.FuelBoxes).toFixed(2));
                            $("#txtDescription_KMISC").attr('placeholder', Orderdet.NAME).val(Orderdet.NAME);
                            $("#txtPrice_KMISC").val("");
                            $("#txtPrice_KMISC").attr("Placeholder", parseFloat(Orderdet.Price).toFixed(4));
                            $("#txtCost_ZMISC").val("");
                            $("#txtCost_ZMISC").attr("Placeholder", parseFloat(Orderdet.Cost).toFixed(4));

                        }
                    });
                }

            }
        });
    });

  


    $("#btnAddKMISC").die("click").live("click", function () {
        $(".YellowWarning_KMISC").hide();

        var OrderNo = $("#ctl00_DivOrderNo_MISC").html();
        var CustomerNo = $("#ctl00_DivCustomerNo_MISC").html();
        var Code = $("#lstFlowerList_KMISC").val();
        //var Name = $("#lstFlowerList_KMISC option:selected").attr('Name');
        //var Quantity = $("#txtQuantity_KMISC").val();
        //var Price = $("#txtPrice_KMISC").val();
        //var Cost = $("#txtCost_ZMISC").val();

        if (Code == "0") {
            $(".YellowWarning_KMISC").html("Please choose code");
            $(".YellowWarning_KMISC").show();
            $("#lstFlowerList_KMISC").focus();
            return false;
        }

        //debugger;
        var Quantity = (($("#txtQuantity_KMISC").val() == "") ? $("#txtQuantity_KMISC").attr('placeholder') : $("#txtQuantity_KMISC").val());
        var Price = (($("#txtPrice_KMISC").val() == "") ? $("#txtPrice_KMISC").attr('placeholder') : $("#txtPrice_KMISC").val());
        var Cost = (($("#txtCost_ZMISC").val() == "") ? $("#txtCost_ZMISC").attr('placeholder') : $("#txtCost_ZMISC").val());
        var Name = (($("#txtDescription_KMISC").val() == "") ? $("#txtDescription_KMISC").attr('placeholder') : $("#txtDescription_KMISC").val());       

        var OrderDetailID = $("#ctl00_DivOrderDetailID_MISC").html()
        $(".YellowWarning_KMISC").hide();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ADDUPDATEMisc',
            data: "{'OrderDetailID':'" + OrderDetailID + "','Order': '" + OrderNo + "','Code': '" + Code + "','Customer': '"
                + CustomerNo + "','Name': '" + Name + "','Quantity': '" + Quantity + "','Price': '" + Price + "','Cost': '" + Cost
                + "','CalledFromVET':'" + $("#ctl00_DivCalledFromVET").html() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                //debugger;
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx"
                }
                else if (output.d == 'success') {
                   
                    //debugger;

                    if ($("#ctl00_DivCalledFromVET").html() == "1") {

                        //$("#fgrdVETINVCustomer").empty();
                        $("#fgrdVETINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Invoice', value: OrderNo }], query: "", newp: 1 }).flexReload();
                    }
                    else if (OrderNo == "0" || OrderNo == "") {
                        
                        $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                    }
                    else {
                        IsOrderModifiedAndNotSaved = false;
                        //not necessary to force to reconfirm is a misc has been added
                        $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
                    }
                    $("#DivKMISCDialog").dialog("close");
                }
                else {
                    $("#DivKMISCDialog").dialog("close");
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    });

    $("#btnCancelKMISC").die("click").live("click", function () {
        $("#DivKMISCDialog").dialog("close");
    });


</script>