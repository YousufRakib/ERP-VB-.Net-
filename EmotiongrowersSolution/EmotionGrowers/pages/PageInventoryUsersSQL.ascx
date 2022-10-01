<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageInventoryUsersSQL.ascx.vb" Inherits="pages_PageInventoryUserSQL" %>
<script src="js/validation.js"></script>

<style>
    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
        font-size: 12px;
    }

    /*For Header grid section*/
    .HeaderTitleDiv {
        background: #fafafa url(css/images/bg.gif) repeat-x top;
        position: relative;
        border: 1px solid #cccccc;
        border-bottom: 0px;
        overflow: hidden;
        padding-bottom: 3px;
    }

    .HeaderTitleDiv2 {
        float: left;
        clear: both;
        padding: 1px;
        width: 100%;
        height: 25px;
        /*padding-top: 2px;*/
    }

    .HeaderTitlelink {
        text-decoration: underline;
        font-size: .8em;
        color: #fff;
    }

        .HeaderTitlelink:hover {
            text-decoration: underline;
            color: #3f860e;
        }

    .HeaderTitlelinks {
        color: #2D7929;
        font-weight: bold;
        text-decoration: none;
        float: left;
        cursor: pointer;
    }

        .HeaderTitlelinks:hover {
            text-decoration: underline;
            color: #000000;
        }

    .DetailsTitleDiv {
        background: #fafafa url(css/images/bg.gif) repeat-x top;
        position: relative;
        border: 1px solid #cccccc;
        border-bottom: 0px;
        overflow: hidden;
        /*padding-bottom: 3px;*/
    }

    .DetailsTitleDiv2 {
        float: left;
        clear: both;
        padding: 1px;
        width: 100%;
        height: 25px;
        /*padding-top: 5px;*/
    }

    .DetailsTitlelink {
        text-decoration: underline;
        font-size: .8em;
        color: #fff;
    }

        .DetailsTitlelink:hover {
            text-decoration: underline;
            color: #3f860e;
        }

    .DetailsTitlelinks {
        color: #2D7929;
        font-weight: bold;
        text-decoration: none;
        float: left;
        cursor: pointer;
    }

        .DetailsTitlelinks:hover {
            text-decoration: underline;
            color: #000000;
        }


    .add {
        background: url(images/add_icon.gif) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .update {
        background: url(images/Update.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .trSelectedCheck {
        background: red !important;
        color: white;
    }

    #DivInventoryUsersDetailAddEditDialog table td {
        padding: 6px;
    }

    #DivInventoryUsersDetailAddEditDialog input[type=text] {
        background-color: rgb(214, 214, 255);
    }

    #DivInventoryUsersDetailAddEditDialog select {
        background-color: rgb(214, 214, 255);
    }

    #DivInventoryUsersDetailAddEditDialog input[type="text"]:focus {
        background-color: cornsilk;
    }

    #DivInventoryUsersDetailAddEditDialog select:focus {
        background-color: cornsilk;
    }

    .selectize-dropdown-content {
        height: 100%;
        /*max-height:160px;*/
        position: fixed;
        background: white !important;
        color: black;
    }

    .selectize-input > * {
        text-overflow: ellipsis;
        white-space: nowrap;
        color: black;
    }

    #tdFarm .selectize-input {
        width: 250px;
    }

    #tdFarm .selectize-dropdown-content {
        min-width: 250px;
    }

    /*#tdFlower .selectize-input {
        width: 380px;
    }

    #tdFlower .selectize-dropdown-content {
        min-width: 380px;
    }*/

    #tblTransfer {
        border-collapse: collapse;
        width: 100%;
        margin: 3px;
    }

        #tblTransfer td {
            border: 1px solid #ccc;
            text-align: left;
            padding: 5px;
        }

        #tblTransfer th {
            border: 1px solid #ccc;
            text-align: center;
            padding: 5px;
        }

    .tdRightTransfer {
        white-space: nowrap;
        width: 276px;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>

<table id="tblInventoryUsersSection" style="float: left;">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryUsersHeader" style="float: left">
                <div class="HeaderTitleDiv" style="font-size: 11px; display: block;">
                    <div class="HeaderTitleDiv2">
                        <div class="HeaderTitlelink">
                            <a class="HeaderTitlelinks" style="margin-top: 5px;"><span class="add" onclick="addheaderclicked();" title="Add a new user">Add new user</span></a>
                        </div>
                    </div>
                </div>
                <table id="fgrdInventoryUsersHeader" style="display: block;"></table>
            </div>
        </td>
        <td style="vertical-align: top;">
            <%--<a class="HeaderTitlelinks" style="margin-top: 5px;"><span class="add" onclick="addDetailclicked();" title="Add a new user detail">Add new detail</span></a>--%>

        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryUserDetails" style="float: left; display: none;">
                <div class="DetailsTitleDiv" style="font-size: 11px; display: block">
                    <div class="DetailsTitleDiv2">

                        <div class="DetailsTitlelink">
                            <a class="DetailsTitlelinks"><span style="margin-top: 4px;" class="add" onclick="addDetailclicked();" title="Add a new user detail">Add new</span></a>
                        </div>

                        <div class="DetailsTitlelink" style="float: left;">
                            <a class="DetailsTitlelinks">
                                <span>
                                    <%--<div style="position: absolute; margin-left: 5px; font-size: 11px; float: left;">--%>

                                    <input id="btnPrintProductReportInInventoryUserDetails" class="BloomButtonEnabled" type="button" style="margin-left: 5px;" value="Report" />
                                    <input id="btnTransferInventoryUserDetails" class="BloomButtonEnabled" type="button" style="margin-left: 5px;" value="Transfer" />
                                    <input id="btnRecalculateInventoryUserDetails" class="BloomButtonEnabled" type="button" style="margin-left: 5px;" value="Re-Calculate" />
                                    <%--</div>--%>
                                </span>

                            </a>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>

                <table id="fgrdInventoryUserDetails" style="display: block;"></table>
            </div>
        </td>
        <%--    <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryUsersDetailAddEditDialog" style="float: left">
                <table id="fgrdInventoryUsersDetails" style="display: block;"></table>
            </div>
        </td>--%>
    </tr>
</table>


<div id="DivAddUserHeaderDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td colspan="2" style="height: 34px">
                <div class="YellowWarningHeader">
                </div>
            </td>
        </tr>
        <tr>
            <td>User #</td>
            <td>
                <input id="txtUserFileNo_Header" maxlength="10" class="restrictspecialcharacters AllUpperCaseTextBox" style="width: 80px" type="text" /><label style="display: none; color: Red" id="lblUserNoRequired">*required</label>
            </td>
        </tr>
        <tr>
            <td>AWB</td>
            <td>
                <input type="text" id="txtAWB_Header" style="width: 150px; height: 16px; float: left" maxlength="15" class="AllUpperCaseTextBox ClsNumbersOnly " />
            </td>
        </tr>
        <tr>
            <td>Receiving Date</td>
            <td>
                <input type="text" id="txtReceivingDate_Header" style="width: 150px; height: 16px; float: left" class="AllUpperCaseTextBox" />
            </td>
        </tr>

        <tr>
            <td>FBE</td>
            <td>
                <input type="text" id="txtFBE_Header" class="ClsThreeDecimalsOnly" style="width: 150px; height: 16px; float: left" />
            </td>
        </tr>

        <tr>
            <td>Freight Amount</td>
            <td>
                <input type="text" id="txtFreightAmount_Header" class="ClsThreeDecimalsOnly" style="width: 150px; height: 16px; float: left" />
            </td>
        </tr>

        <tr>
            <td>Handling/FBE</td>
            <td>
                <input type="text" id="txtHandling_Header" class="ClsThreeDecimalsOnly" style="width: 150px; height: 16px; float: left" />
            </td>
        </tr>

    </table>
</div>

<div id="DeleteConfirmationHeader" style="display: none;" title="Alert"></div>
<div id="DeleteConfirmationDetail" style="display: none;" title="Alert"></div>

<div id="divHeaderID" style="display: none;">0</div>

<div id="divSelectedHeaderID" style="display: none;">0</div>

<div id="divDetailID" style="display: none;">0</div>


<div id="DivInventoryUsersDetailAddEditDialog" style="display: none;">
    <table style="text-align: left; border-collapse: collapse;">
        <tr style="height: 40px">
            <td>
                <table>
                    <tr>
                        <td colspan="10">
                            <div class="Warning">
                                OOPS! Unable to process your request. Please contact admin!
                            </div>
                            <div class="YellowWarningDetail" style="color:red !important;">
                                All fields are required fields, Please try again.
                            </div>
                        </td>
                        <td colspan="2">
                            <%--<div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span>ID : </span>
                            <label id="lblINVEN_ID"></label> 
                            <span style="padding-left: 10px;">SPORDID : </span>
                            <label id="lblINVEN_SPORDID"></label>
                        </div>--%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--<input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />--%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px; width:60px;" class="boldfont">Farm</td>
                        <td id="tdFarm" style="width: 250px;">
                            <div style="float: left; width: 250px;">
                                <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
                                <select placeholder='Choose Farm...' id="lstInventoryUsersFarm" style="width: auto;" />
                                <input type="hidden" id="hfInventoryUsersFarm" />
                            </div>                            
                        </td>
                        <td style="padding-left: 150px;" class="boldfont">WH</td>
                        <td>
                            <div>                                
                                <select id="lstInventoryUserswarehouse" style="width: 150px; height: 23px; margin-top: 6px;"></select>
                                <input type="hidden" id="hfInventoryUsersWarehouse" />
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50px;">
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px; width:60px;" class="boldfont">Flower</td>
                        <td id="tdFlower">
                            <select placeholder='Choose Flower...' id="lstInventoryUsersFlower" style="width: auto; display: none" />
                            <input type="hidden" id="hfInventoryUsersFlower" />
                            <input type="hidden" id="hfInventoryUsersFlowerName" />
                            <input type="text" style="width: 250px;" id="txtInventoryUsersFlower" class="AllUpperCaseTextBox" />
                        </td>
                        <%--<td style="text-align: right; padding-right: 34px" class="boldfont">Desc</td>
            <td colspan="3">
                <input type="text" style="width: 249px" maxlength="15" id="lstInventoryUsersFlowerDesc" disabled /></td>--%>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px;width:50px;" class="boldfont">Received</td>
                        <td>
                            <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtInventoryUsersQuantityReceived" style="width: 52px; margin-left: 10px; text-align: right;" maxlength="5" />&nbsp;&nbsp;&nbsp;
                            <select id="lstInventoryUsersUOM" style="width: 125px; height: 23px"></select>
                            <input type="hidden" id="hfInventoryUsersUOM" />
                            <input type="hidden" id="hfInventoryUsersFBE" />

                        </td>
                        <td class="boldfont">Units/Bunch</td>
                        <td>
                            <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtInventoryUsersUnitsPerBunch" style="width: 52px; text-align: right;" maxlength="6" /></td>
                        <td style="padding-left: 35px" class="boldfont">Units</td>
                        <td>
                            <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtInventoryUsersUnitsPerBox" style="width: 52px; margin-right: 19px; text-align: right;" maxlength="4" /></td>
                        <td style="padding-left: 12px;" class="boldfont">Total Units</td>
                        <td colspan="3">
                            <input type="text" id="txtInventoryUsersTotalUnits" style="width: 69px; padding-left: 16px; margin-left: 7px; text-align: right;" class="NumbersOnly" disabled /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="trInventoryUsersQuantitySold">
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px; width:60px;" class="boldfont">Sold</td>
                        <td colspan="9">
                            <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtInventoryUsersQuantitySold" style="width: 52px; margin-left: -95px; text-align: right;" maxlength="5" />&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px; width:60px;" class="boldfont">Cost/Units</td>
                        <td>
                            <input type="text" id="txtInventoryUsersCostPerUnit" style="width: 52px; margin-left: 5px; text-align: right;" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" maxlength="10" />
                        </td>
                        <td class="boldfont" style="width: 95px;">Other Cost/Box</td>
                        <td>
                            <input type="text" id="txtInventoryUsersOtherCostPerBox" style="width: 52px; text-align: right;" class="ClsThreeDecimalsOnly ClsForValidatingThreeDecimal" maxlength="10" />
                        </td>
                        <td class="boldfont">Duties</td>
                        <td>
                            <input type="text" id="txtInventoryUsersDuties" style="width: 52px; text-align: right;" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" maxlength="10" />
                        </td>
                        <td class="boldfont">Handling</td>
                        <td>
                            <input type="text" id="txtInventoryUsersHandling" style="width: 52px; padding-left: 4px; text-align: right;" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" maxlength="10" />
                        </td>
                        <td class="boldfont" style="padding-left: 15px">Landed cost</td>
                        <td>
                            <input type="text" id="txtInventoryUserslandedcost" style="width: 84px; margin-left: 6px; text-align: right;" class="ClsFourDecimalsOnly ClsForValidatingFourDecimal" maxlength="10" readonly="readonly" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px;width:50px;" class="boldfont">BoxNum</td>
                        <td>
                            <input type="text" id="txtInventoryUsersBoxNumber" style="width: 52px; margin-left: 17px" class="ClsNumbersOnly" maxlength="5" /></td>
                        <td style="padding-left: 8px;" class="boldfont">Type</td>
                        <td>
                            <select id="lstInventoryUsersType" style="width: 173px; height: 23px"></select>
                            <input type="hidden" id="hfInventoryUsersType" />
                        </td>
                        <td style="padding-left: 8px;" class="boldfont">InvenType </td>
                        <td>
                            <select id="lstInventoryUsersInvenType" style="width: 115px; height: 23px"></select>
                            <input type="hidden" id="hfInventoryUsersInvenType" />
                        </td>
                        <td style="padding-left: 50px" class="boldfont">PO #</td>
                        <td colspan="3">
                            <input type="text" id="txtInventoryUsersPO" class="restrictspecialcharacters" style="width: 95px;" maxlength="12" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px; width:60px;" class="boldfont">Invoice #</td>
                        <td>
                            <input type="text" id="txtInventoryUsersInvoice" class="NumbersOnly" style="width: 52px; margin-left: 10px" maxlength="7" />
                        </td>
                        <td style="padding-left: 8px;" class="boldfont">Order Number</td>
                        <td>
                            <input type="text" class="ClsNumbersOnly NumbersOnly" id="txtInventoryUsersOrderNo" style="width: 102px; margin-left: 10px;" maxlength="6" />
                        </td>
                        <td style="padding-left: 33px; text-indent: 0.2em;" class="boldfont">Cust#</td>
                        <td>
                            <input type="text" id="txtInventoryUsersCustNo" style="width: 111px;" class="NumbersOnly" maxlength="5" />
                        </td>
                        <td style="padding-left: 15px" class="boldfont">Comments</td>
                        <td colspan="3">
                            <input type="text" id="txtInventoryUsersComments" maxlength="10" style="width: 95px;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="display: none;">
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px; width:60px;" class="boldfont">AWB #</td>
                        <td>
                            <input type="text" id="txtInventoryUsersAWB" class="NumbersOnly" style="width: 150px; margin-left: -91px" maxlength="15" />
                        </td>
                        <td class="boldfont">Date Received</td>
                        <td colspan="7">
                            <input type="text" id="txtInventoryUsersDateRec" style="width: 80px; padding-left: 8px;" class="NumbersOnly" maxlength="5" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="padding-left: 10px; width:60px;" class="boldfont">BreakDown</td>
                        <td colspan="9">
                            <input type="text" id="txtInventoryUsersBreakDown" maxlength="150" style="width: 683px;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                       
                        <td style="padding-left: 10px; width:84px;" class="boldfont ">Selling Price</td>
                        <td>
                            <div>                                
                                <input type="text" id="txtSellingPrice" class="ClsThreeDecimalsOnly ClsForValidatingThreeDecimal" maxlength="10" style="width: 52px; margin-left: -14px" />
                            </div>
                        </td>
    
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                       
                        <td style="padding-left: 10px; width:69px;" class="boldfont">Brand</td>
                        <td id="tdBrand" style="width: 250px;">
                            <div style="float: left; width: 250px;">
                                <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
                                <input type="text"  id="txtBrand" maxlength="6" style="width: 250px;" />
                                <input type="hidden" id="hfBrand" />
                            </div>                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>


<div id="LoggedInUserID_InvenUser" runat="server" style="display: none"></div>

<div id="MsgBoxTransfer" style="display: none;"></div>

<div id="divDefaultType" style="display: none;"></div>

<script type="text/javascript">

    $(document).ready(new function () {

        $("#hfInventoryUsersInvenType").val("")
        $("#hfInventoryUsersType").val("");
        LoadInventoryUsersInvenType();
        LoadInventoryUsersType();
        LoadInventoryUsersWarehouse();
        LoadDefaultWarehouse();

        $("#txtReceivingDate_Header").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true
        }).datepicker("setDate", new Date());
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
                        else if ($(this).attr('id') == "txtHandling_Header" || $(this).attr('id') == "txtInventoryUsersComments" || $(this).attr('id') == "txtInventoryUsersBreakDown")
                            $(this).closest('div').next('div').find('button')[0].focus()

                        return false;
                    }


                }

            }
        });
    });

    $("#txtInventoryUsersFlower").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerForAutoComplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    response($.map(data.d, function (flr) {
                        debugger;
                        return {
                            label: "[" + flr.Flower.trim() + "] " + flr.Name,
                            Flower: flr.Flower,
                            Name: flr.Name,
                            CAT: flr.CAT,
                            UnitsPerBunch: flr.UnitsPerBunch,
                            ColorCode: flr.ColorCode,
                            UOM: flr.UOM,
                            Bunch: flr.BUNCH,
                            UNITS: flr.UNITS,
                            UOMSOLD: flr.UOMSOLD, //Anand :: 13Mar2022 added Sales Price and Brand
                            Price : flr.PRICE  //Anand :: 13Mar2022 added Sales Price and Brand
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

        },
        select: function (e, i) {
            debugger;
            $('#lstSPORDEditFlower').empty();
            $("#txtInventoryUsersFlower").attr("placeholder", "");
            $("#txtInventoryUsersFlower").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
            $("#hfInventoryUsersFlower").val(i.item.Flower.trim());
            $("#hfInventoryUsersUOM").val(i.item.UOM);
            $("#txtInventoryUsersUnitsPerBunch").val(i.item.Bunch);
            $("#txtInventoryUsersUnitsPerBox").val(i.item.UNITS);

            $("#txtInventoryUsersQuantityReceived").focus();
            if (i.item.UOMSOLD != '') {
                $('#lstInventoryUsersUOM').val(i.item.UOMSOLD);
            } else {
                $('#lstInventoryUsersUOM').val(i.item.UOM);
            }
            $("#txtSellingPrice").val(i.item.Price == "" ? parseFloat(0).toFixed(3) : parseFloat(i.item.Price).toFixed(3)) //Anand :: 13Mar2022 added Sales Price and Brand
        },
        change: function (e, i) {
            debugger;
            if (i.item == null || i.item == undefined) {
                $('#lstSPORDEditFlower').empty();
                $("#txtInventoryUsersFlower").val("");
                $("#hfInventoryUsersFlower").val("0");
                $("#txtInventoryUsersFlower").focus();
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });

    $("#txtInventoryUsersQuantityReceived").change(function (event) {
        debugger;
        CalculateTotalUnits()
    });
    $("#txtInventoryUsersUnitsPerBox").change(function (event) {
        debugger;
        event.preventDefault();
        CalculateTotalUnits()
    });
    $("#txtInventoryUsersUnitsPerBox").focusout(function (e) {
        debugger;
        e.preventDefault();
        CalculateTotalUnits()
    });

    function CalculateTotalUnits() {
        debugger;
        var Quantity = $("#txtInventoryUsersQuantityReceived").val() == "" ? $("#txtInventoryUsersQuantityReceived").attr("Placeholder") : $("#txtInventoryUsersQuantityReceived").val();
        var Units = $("#txtInventoryUsersUnitsPerBox").val() == "" ? $("#txtInventoryUsersUnitsPerBox").attr("Placeholder") : $("#txtInventoryUsersUnitsPerBox").val();
        if (Units == 0) {
            $(".YellowWarningDetail").html("Units can not be 0..");
            $(".YellowWarningDetail").show();
            return false;
        } else {
            $(".YellowWarningDetail").hide();
        }
        if (Quantity != "" && Units != "")
            $("#txtInventoryUsersTotalUnits").val(Quantity * Units);
    }

    var IsInventoryGridIntialized = false;


    $("#fgrdInventoryUsersHeader").flexigrid({
        url: 'BloomService.asmx/GetInventoryUsersHeaderFromSQLForFgrd',
        dataType: 'xml',
        colModel: [
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
            { display: 'AWB', name: 'AWB', width: 75, sortable: true, align: 'left', process: HeaderRowClick },
            { display: 'Received', name: 'DateRec', width: 55, sortable: true, align: 'left', process: HeaderRowClick },
            { display: 'Pieces', name: 'TotalBoxes', width: 35, sortable: true, align: 'right', process: HeaderRowClick },
            { display: 'FBE', name: '', width: 35, sortable: false, align: 'right', process: HeaderRowClick },
            { display: 'User', name: '', width: 20, sortable: false, align: 'center', process: HeaderRowClick },
            { display: '', name: '', width: 15, sortable: false, align: 'center' },
        ],
        searchitems: [
            { display: 'AWB', name: 'Lot' },
            { display: 'Received', name: 'DateRec' },
        ],
        showTableToggleBtn: true,
        sortname: "DateRec",
        sortorder: "Desc",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        height: $(window).height() - 280,
        width: 330,
        striped: true,
        onSuccess: function () {

            if (IsInventoryGridIntialized == true) {
                var SelectedHeaderID = $("#divSelectedHeaderID").html();
                if (SelectedHeaderID != "0") {
                    $("#fgrdInventoryUsersHeader [id^=row]").removeClass("trSelectedCheck");
                    $("#fgrdInventoryUsersHeader #row" + SelectedHeaderID).addClass("trSelectedCheck");
                }
                else {
                    $("#fgrdInventoryUsersHeader tr:first").addClass("trSelectedCheck");
                    $("#divSelectedHeaderID").html($("#fgrdInventoryUsersHeader tr:first").attr('id').replace('row', ''));

                }
                $("#DivInventoryUserDetails").css("display", "block");
                $("#fgrdInventoryUserDetails").flexOptions({ params: [{ name: 'HeaderID', value: $("#divSelectedHeaderID").html() }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
            }
            else {
                $("#fgrdInventoryUsersHeader tr:first").addClass("trSelectedCheck");
                $("#divSelectedHeaderID").html($("#fgrdInventoryUsersHeader tr:first").attr('id').replace('row', ''));
                $("#DivInventoryUserDetails").css("display", "block");
                $("#fgrdInventoryUserDetails").flexOptions({ params: [{ name: 'HeaderID', value: $("#fgrdInventoryUsersHeader tr:first").attr('id').replace('row', '') }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
            }


            $("#DivInventoryUsersHeader #ExportCSV").show();

            IsInventoryGridIntialized = true

        },
        params: [
            { name: 'ExportCSV', value: '' }
        ],
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        }
    });
    $("#DivInventoryUsersHeader .pcontrol input").css("width", "40px")
    $("#DivInventoryUsersHeader .btnseparator:eq(0)").hide();
    $("#DivInventoryUsersHeader .pSearch").hide();
    $("#DivInventoryUsersHeader .sDiv2").css("width", "290px");
    $("#DivInventoryUsersHeader .pDiv2").css("width", "300px").css("margin-top", "3px");
    //$("#DivInventoryHeader .pDiv2 .pPageStat").css('top', '9px');
    //$("#DivInventoryHeader .pDiv2 .pReload").css('margin-top', '5px');
    //$("#DivInventoryHeader .pDiv2 .btnseparator:nth-child(12)").css('margin-top', '6px')
    //$("#DivManualPOHeader .sDiv").css('float', 'left').css('width', '470px');
    //$('#DivManualPOHeader .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivInventoryUsersHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    $("#DivInventoryUsersHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //$("#DivInventoryHeader .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    $("#DivInventoryUsersHeader .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();



    $("#fgrdInventoryUserDetails").flexigrid({
        url: 'BloomService.asmx/GetInventoryUsersDetailsFromSQLForFgrd',
        dataType: 'xml',
        colModel: [
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
            { display: 'WH', name: 'WH', width: 25, sortable: true, align: 'left' },
            { display: 'Farm', name: 'Farm', width: 25, sortable: true, align: 'left' },
            { display: 'Flower', name: 'Flower', width: 60, sortable: true, align: 'left' },
            { display: 'Description', name: 'Name', width: 180, sortable: true, align: 'left' },
            { display: 'Boxes', name: 'CSREC', width: 30, sortable: true, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 20, sortable: true, align: 'left' },
            { display: 'FBE', name: 'FBE', width: 35, sortable: false, align: 'right' },
            { display: 'Units/Bunch', name: 'UnitsBunch', width: 35, sortable: true, align: 'right' },
            { display: 'Units', name: 'Units', width: 30, sortable: true, align: 'right' },
            { display: 'Total Units', name: 'TotalUnits', width: 50, sortable: true, align: 'right' },
            { display: 'Cost', name: 'Cost', width: 40, sortable: true, align: 'right' },
            { display: '$Total', name: 'TotalCost', width: 50, sortable: true, align: 'right' },
            { display: '$Landed', name: 'LandedCost', width: 50, sortable: true, align: 'right' },
            { display: '$TotalLanded', name: 'TotalLandedCost', width: 50, sortable: true, align: 'right' },
            { display: 'Type', name: 'InvenType', width: 15, sortable: true, align: 'left' },
            { display: 'Cust#', name: 'Cust', width: 25, sortable: true, align: 'left' },
            { display: 'Comments', name: 'Comments', width: 60, sortable: true, align: 'left' },
            { display: 'BoxNum', name: 'BoxNum', width: 35, sortable: true, align: 'left' },
            { display: 'PO#', name: 'PO', width: 40, sortable: true, align: 'left' },
            { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'left' },
            { display: '', name: '', width: 15, sortable: false, align: 'left' },
        ],
        searchitems: [
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'Name' },
            { display: 'Boxes', name: 'CSREC' },
            { display: 'Farm', name: 'Farm' },
            { display: 'Cust#', name: 'Cust' },
            { display: 'BoxNum', name: 'BoxNum' },
            { display: 'PO#', name: 'PO' },
            { display: 'Invoice', name: 'Invoice' },
        ],
        showTableToggleBtn: true,
        sortname: "DateRec",
        sortorder: "Desc",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: false,
        showTableToggleBtn: false,
        height: $(window).height() - 250,
        width: $(window).width() - 340,
        striped: true,
        onSuccess: function () {
            $('#fgrdInventoryUserDetails #row0').addClass("TotalRows")
            //For to show the error
            if ($("#fgrdInventoryUserDetails tr#row-2").length > 0) {
                $("#fgrdInventoryUserDetails tr#row-2").hide();
                $.MessageBox($("#fgrdInventoryUserDetails tr#row-2")[0].innerText);
                return false;
            }

            $("#DivInventoryUserDetails #ExportCSV").show();
        },
        params: [
            { name: 'HeaderID', value: $("#divSelectedHeaderID").html() },
            { name: 'ExportCSV', value: '' }
        ],
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        }
    });

    $("#DivInventoryUserDetails .sDiv").css('float', 'left').css('width', '545px');
    $('#DivInventoryUserDetails .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivInventoryUserDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    $("#DivInventoryUserDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //$("#DivInventoryUserDetails .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    $("#DivInventoryUserDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();



    function HeaderRowClick(celDiv, id) {
        $(celDiv).click(function () {
            $("#DivInventoryUserDetails").css("display", "block");
            $("#divSelectedHeaderID").html(id.toString());
            $("#fgrdInventoryUsersHeader [id^=row]").removeClass("trSelectedCheck");
            $("#fgrdInventoryUsersHeader #row" + id).addClass("trSelectedCheck");
            $("#fgrdInventoryUserDetails").flexOptions({ params: [{ name: 'HeaderID', value: $("#divSelectedHeaderID").html() }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
        });
    }


    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetTypeFromSETEOD',
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            if (output.d != "error") {
                $("#divDefaultType").html(output.d);
            }
            else {
                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
            }

        }
    });

    $("#DivAddUserHeaderDialog").dialog({
        autoOpen: false,
        width: 450,
        modal: true,
        title: 'New User',
        resizable: false,
        buttons: {
            Save: function () {

                if ($("#txtUserFileNo_Header").val().trim() == "") {
                    $(".YellowWarningHeader").html("Please enter User#");
                    $(".YellowWarningHeader").show();
                    $("#txtUserFileNo_Header").focus();
                    return false;
                }

                if ($("#txtAWB_Header").val().trim() == "") {
                    $(".YellowWarningHeader").html("Please enter AWB#");
                    $(".YellowWarningHeader").show();
                    $("#txtAWB_Header").focus();
                    return false;
                }

                $(".YellowWarningHeader").hide();

                var UserNo = $("#txtUserFileNo_Header").val();
                var AWB = $("#txtAWB_Header").val();
                var DateRec = $("#txtReceivingDate_Header").val();
                var Handling = $("#txtHandling_Header").val() == "" ? "0" : $("#txtHandling_Header").val();
                var FBE = $("#txtFBE_Header").val() == "" ? "0" : $("#txtFBE_Header").val();
                var FreightAmount = $("#txtFreightAmount_Header").val() == "" ? "0" : $("#txtFreightAmount_Header").val();
                var HeaderID = $("#divHeaderID").html();

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveInventoryUsersHeader',
                    data: '{"UserNo":"' + UserNo + '","AWB":"' + AWB + '","DateRec":"' + DateRec +
                        '","Handling":"' + Handling + '","FBE":"' + FBE + '","FreightAmount":"' + FreightAmount + '","HeaderID":"' + HeaderID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d == "Already Exist") {
                            $(".YellowWarningHeader").html("The combination [User# + AWB + ReceivingDate] you have entered is already exist");
                            $(".YellowWarningHeader").show();
                        }
                        else if ($.isNumeric(output.d)) {
                            $("#divSelectedHeaderID").html(output.d);
                            //close and refresh the dialog
                            $("#fgrdInventoryUsersHeader").flexReload({ url: '/url/for/refresh' });
                            $("#DivAddUserHeaderDialog").dialog("close");
                        }
                        else {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                    }
                });

            },
            Cancel: function () {
                $("#DivAddUserHeaderDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
            $("#txtAWB_Header").focus();
        }
    });

    $("[id^=editInventoryUsersHeader_]").die("click").live("click", function () {

        var HeaderID = $(this)[0].id.replace("editInventoryUsersHeader_", "");

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetInventoryUsersHeaderByID',
            data: '{"ID":"' + HeaderID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var InventoryUserHeader = output.d;
                $("#divHeaderID").html(InventoryUserHeader.HeaderID);
                $("#txtUserFileNo_Header").val(InventoryUserHeader.UserFileNo);
                $("#txtReceivingDate_Header").val(InventoryUserHeader.DATEREC);
                $("#txtAWB_Header").val(InventoryUserHeader.AWB);
                $("#txtFBE_Header").val(InventoryUserHeader.FBE);
                $("#txtFreightAmount_Header").val(InventoryUserHeader.Freight);
                $("#txtHandling_Header").val(InventoryUserHeader.Handling);
                $("#DivAddUserHeaderDialog").dialog('option', 'title', "Update User");
                $("#DivAddUserHeaderDialog").dialog("open");
            }
        });
    });

    $("[id^=DeleteInventoryUsersHeader_]").die("click").live("click", function () {
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace("DeleteInventoryUsersHeader_", "");
        $('#divHeaderID').html(ID);
        $("#DeleteConfirmationHeader").html("<p>Are you sure to delete?</p>");
        $("#DeleteConfirmationHeader").dialog("open");
    });

    $("#DeleteConfirmationHeader").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                debugger;
                var adialog = $(this);
                var ID = $("#divHeaderID").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteInventoryUserHeader',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'success') {
                            adialog.dialog("close");
                            $("#divHeaderID").html("0");
                            $("#fgrdInventoryUsersHeader [id^=row]").removeClass("trSelectedCheck");
                            $("#DeleteInventoryUsersHeader_" + ID).closest("tr").remove();
                            $("#fgrdInventoryUserDetails").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            adialog.dialog("close");
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
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

    $("[id^=deleteInventoryUsersDetail_]").die("click").live("click", function () {
        debugger;
        var sourceCtl = $(this);
        var ID = sourceCtl.attr('id').replace("deleteInventoryUsersDetail_", "");
        $('#divDetailID').html(ID);
        $("#DeleteConfirmationDetail").html("<p>Are you sure to delete?</p>");
        $("#DeleteConfirmationDetail").dialog("open");
    });

    $("#DeleteConfirmationDetail").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var ID = $("#divDetailID").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteInventoryUserDetail',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'success') {
                            adialog.dialog("close");
                            $("#divDetailID").html("0");
                            $("#fgrdInventoryUserDetails [id^=row]").removeClass("trSelectedCheck");
                            $("#deleteInventoryUsersDetail_" + ID).closest("tr").remove();
                        }
                        else {
                            adialog.dialog("close");
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
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

    var NextUserNumber = 0;
    function addheaderclicked() {
        $(".YellowWarningHeader").hide();
        $("#divHeaderID").html("0");
        debugger;
        var CurrentUserNumber = $("#fgrdInventoryUsersHeader tr").length;
        NextUserNumber = CurrentUserNumber + 1
        NextUserNumber = ("0" + NextUserNumber).slice(-2);

        $("#txtUserFileNo_Header").val(("0" + CheckUserNumberAlreadyExist(NextUserNumber)).slice(-2));
        $("#txtAWB_Header").val("");
        $("#txtFBE_Header").val("");
        $("#txtFreightAmount_Header").val("");
        $("#txtHandling_Header").val("");
        $("#DivAddUserHeaderDialog").dialog('option', 'title', "New User");
        $("#DivAddUserHeaderDialog").dialog("open");
    }


    function CheckUserNumberAlreadyExist(NextUserNumber) {

        debugger;
        var IsExist = false;
        $("#fgrdInventoryUsersHeader tr").each(function () {
            debugger;
            var id = $(this).attr('id').replace('row', '');
            var UserNumber = $("#lblUserFileNo_" + id).html();
            if (NextUserNumber == UserNumber) {
                NextUserNumber = parseInt(NextUserNumber) + 1
                CheckUserNumberAlreadyExist(parseInt(NextUserNumber));

            }
        });
        return NextUserNumber;
    }

    function addDetailclicked() {

        if (loadingdropdownonDetailsDialogCompleted == false) {
            $.MessageBox("Controls are loading, Please click '<b>ADD</b>' after some time");
            return false;
        }
        var Farm_ = $("#fgrdInventoryUserDetails tr td").eq(3).text()
        $("#hfInventoryUsersFarm").val(Farm_)
        LoadFarmCode(function (callback) { });
        var WH_ = $("#fgrdInventoryUserDetails tr td").eq(2).text().trim();
        if (WH_ != "") {
            $("#hfInventoryUsersWarehouse").val(WH_);
        }
        else {
            LoadDefaultWarehouse();
        }
        LoadInventoryUsersWarehouse();

        $("#trInventoryUsersQuantitySold").hide();
        $("#divDetailID").html("0");
        $("#lstInventoryUsersType").val($("#divDefaultType").html());

        $("#txtInventoryUsersFlower").val("");
        $("#txtInventoryUsersFlower").attr('placeholder', '');
        $("#hfInventoryUsersFlower").html("");
        //$("#hfInventoryUsersWarehouse").val("");
        $('#lstInventoryUsersWarehouse').val($("#hfInventoryUsersWarehouse").val());
        $("#txtInventoryUsersBoxNumber").attr("disabled", false);
        $("#txtInventoryUsersBoxNumber").val("");
        $("#txtInventoryUsersBoxNumber").attr('placeholder', '0')
        //J1_10($("#lstInventoryUsersFlower")).selectize()[0].selectize.clear();
        //J1_10($("#lstInventoryUsersFarm")).selectize()[0].selectize.clear();
        $("#hfInventoryUsersFlower").val("");
        $("#txtInventoryUsersQuantityReceived").val("");
        $("#txtInventoryUsersQuantityReceived").attr('placeholder', '1');

        $("#txtInventoryUsersUnitsPerBunch").val("");
        $("#txtInventoryUsersUnitsPerBunch").attr('placeholder', '0');

        $("#txtInventoryUsersUnitsPerBox").val("");
        $("#txtInventoryUsersUnitsPerBox").attr('placeholder', '0');

        $("#txtInventoryUsersQuantitySold").val("");
        $("#txtInventoryUsersQuantitySold").attr('placeholder', '0');

        $("#txtInventoryUsersCostPerUnit").val("");
        $("#txtInventoryUsersCostPerUnit").attr('placeholder', '0.0000');

        $("#txtInventoryUsersOrderNo").val("");
        $("#txtInventoryUsersOrderNo").attr('placeholder', '0');

        //$("#txtInventoryUsersInvoice").val("");
        $("#txtInventoryUsersInvoice").attr('placeholder', '0');

        $("#txtInventoryUsersCustNo").val("");
        $("#txtInventoryUsersCustNo").attr('placeholder', '0');

        $("#txtInventoryUsersPO").val("");
        $("#txtInventoryUsersComments").val("");
        $("#txtInventoryUsersBreakDown").val("");

        $("#txtInventoryUsersTotalUnits").val("0");
        $("#txtInventoryUsersBoxNumber").val("0");

        $("#txtInventoryUsersOtherCostPerBox").val("");
        $("#txtInventoryUsersOtherCostPerBox").attr("Placeholder", parseFloat(0).toFixed(3));
        $("#txtInventoryUsersHandling").val("");
        $("#txtInventoryUsersHandling").attr("Placeholder", parseFloat(0).toFixed(4));
        $("#txtInventoryUsersDuties").val("");
        $("#txtInventoryUsersDuties").attr("Placeholder", parseFloat(0).toFixed(4));
        $("#txtInventoryUserslandedcost").val("");
        $("#txtInventoryUserslandedcost").attr("Placeholder", parseFloat(0).toFixed(4));

        $("#DivInventoryUsersDetailAddEditDialog").dialog('option', 'title', "Add Inventory User");
        $("#DivInventoryUsersDetailAddEditDialog").dialog("open");
        $("#txtSellingPrice").attr("Placeholder", parseFloat(0).toFixed(3));
    }


    function GetLastInsertedInvoiceByHeaderID(HeaderID) {
        debugger;
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/GetLastInsertedInvoiceByHeaderID',
            data: '{"HeaderID":"' + HeaderID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#txtInventoryUsersInvoice").val(output.d);
            }
        });
    }

    $("#DivInventoryUsersDetailAddEditDialog").dialog({
        autoOpen: false,
        width: 850,
        height: 575,
        modal: true,
        resizable: false,
        buttons: {
            Save: function () {
                var Farm = $("#hfInventoryUsersFarm").val();
                var Flower = $("#hfInventoryUsersFlower").val();
                var Warehouse = $("#lstInventoryUserswarehouse").val();
               
                if (Farm.trim() == "") {
                    $(".YellowWarningDetail").html("Please choose farm");
                    $(".YellowWarningDetail").show();
                    return false;
                } else {
                    $(".YellowWarningDetail").hide();
                }
                if (Warehouse.trim() == "0" || Warehouse.trim() =="") {
                    $(".YellowWarningDetail").html("Please choose warehouse");
                    $(".YellowWarningDetail").show();
                    return false;
                } else {
                    $(".YellowWarningDetail").hide();
                }

                if (Flower.trim() == "") {
                    $(".YellowWarningDetail").html("Please choose flower");
                    $(".YellowWarningDetail").show();
                    return false;
                } else {
                    $(".YellowWarningDetail").hide();
                }

                var UOM = $("#lstInventoryUsersUOM").val()
                if (UOM == "" || UOM == "0") {
                    $(".YellowWarningDetail").html("Please choose UOM");
                    $(".YellowWarningDetail").show();
                    $("#lstInventoryUsersUOM").focus();
                    return false;
                } else {
                    $(".YellowWarningDetail").hide();
                }

                var Type = $("#lstInventoryUsersType").val();
                if (Type == "0") {
                    $(".YellowWarningDetail").html("Please enter type..");
                    $(".YellowWarningDetail").show();
                    $("#lstInventoryUsersType").focus();
                    return false;
                } else {
                    $(".YellowWarningDetail").hide();
                }

                var Type = $("#lstInventoryUsersInvenType").val();
                if (Type == "0") {
                    $(".YellowWarningDetail").html("Please enter inventype..");
                    $(".YellowWarningDetail").show();
                    $("#lstInventoryUsersInvenType").focus();
                    return false;
                } else {
                    $(".YellowWarningDetail").hide();
                }

                var ReceviedBoxes = (($("#txtInventoryUsersQuantityReceived").val() == "") ? $("#txtInventoryUsersQuantityReceived").attr('placeholder') : $("#txtInventoryUsersQuantityReceived").val());
                var UnitsPerBunch = (($("#txtInventoryUsersUnitsPerBunch").val() == "") ? $("#txtInventoryUsersUnitsPerBunch").attr('placeholder') : $("#txtInventoryUsersUnitsPerBunch").val());
                var UnitsPerBox = (($("#txtInventoryUsersUnitsPerBox").val() == "") ? $("#txtInventoryUsersUnitsPerBox").attr('placeholder') : $("#txtInventoryUsersUnitsPerBox").val());
                var SoldBoxes = (($("#txtInventoryUsersQuantitySold").val() == "") ? $("#txtInventoryUsersQuantitySold").attr('placeholder') : $("#txtInventoryUsersQuantitySold").val());
                var CostPerUnit = (($("#txtInventoryUsersCostPerUnit").val() == "") ? $("#txtInventoryUsersCostPerUnit").attr('placeholder') : $("#txtInventoryUsersCostPerUnit").val());
                //var Type = $("#txtInventoryUsersType").val();

                if (UnitsPerBox == 0) {
                    $(".YellowWarningDetail").html("Units can not be 0..");
                    $(".YellowWarningDetail").show();
                    return false;
                } else {
                    $(".YellowWarningDetail").hide();
                }

                //var Order = (($("#txtInventoryUsersInvoice").val() == "") ? $("#txtInventoryUsersInvoice").attr('placeholder') : $("#txtInventoryUsersInvoice").val());
                var Invoice = (($("#txtInventoryUsersInvoice").val() == "") ? $("#txtInventoryUsersInvoice").attr('placeholder') : $("#txtInventoryUsersInvoice").val());
                if (!Invoice || !isNumber(Invoice)) { Invoice = 0 }

                var Order = (($("#txtInventoryUsersOrderNo").val() == "") ? $("#txtInventoryUsersOrderNo").attr('placeholder') : $("#txtInventoryUsersOrderNo").val());
                if (!Order || !isNumber(Order)) { Order = 0 }

                var PO = $("#txtInventoryUsersPO").val();
                var CustNumber = (($("#txtInventoryUsersCustNo").val() == "") ? $("#txtInventoryUsersCustNo").attr('placeholder') : $("#txtInventoryUsersCustNo").val());
                var Comments = $("#txtInventoryUsersComments").val();
                var BoxNumber = (($("#txtInventoryUsersBoxNumber").val() == "") ? $("#txtInventoryUsersBoxNumber").attr('placeholder') : $("#txtInventoryUsersBoxNumber").val());
                var Type = $("#lstInventoryUsersType").val();
                var InvenType = $("#lstInventoryUsersInvenType").val();
                var BreakDown = $("#txtInventoryUsersBreakDown").val();

                //Start Anand 13Mar2022:: Added Brand and Selling Price 
                var SellingPrice = $("#txtSellingPrice").val() == "" ? "0" : $("#txtSellingPrice").val();
                var BRAND = ($('#txtBrand').val() == "" || $('#txtBrand').val() == "0") ? ("#hfInventoryUsersFarm").val() : $('#txtBrand').val();
                //End Anand 13Mar2022:: Added Brand and Selling Price 

                //Muthu Nivetha M :: 20Mar2020 :: Added :: To save values of othercost,handling,duties/andean and landedcost while adding UserInventory
                var Othercost = 0, Handling = 0, Duties = 0, LandedCost = 0;
                Othercost = $("#txtInventoryUsersOtherCostPerBox").val() == "" ? $("#txtInventoryUsersOtherCostPerBox").attr("Placeholder") : $("#txtInventoryUsersOtherCostPerBox").val();
                Handling = $("#txtInventoryUsersHandling").val() == "" ? $("#txtInventoryUsersHandling").attr("Placeholder") : $("#txtInventoryUsersHandling").val();
                Duties = $("#txtInventoryUsersDuties").val() == "" ? $("#txtInventoryUsersDuties").attr("Placeholder") : $("#txtInventoryUsersDuties").val();
                LandedCost = $("#txtInventoryUserslandedcost").val() == "" ? $("#txtInventoryUserslandedcost").attr("Placeholder") : $("#txtInventoryUserslandedcost").val();
                LandedCost = ((LandedCost == null || LandedCost == undefined || LandedCost == "NaN") ? parseFloat("0") : LandedCost);
                Othercost = ((Othercost == null || Othercost == undefined || Othercost == "NaN") ? parseFloat("0") : Othercost);
                Handling = ((Handling == null || Handling == undefined || Handling == "NaN") ? parseFloat("0") : Handling);
                Duties = ((Duties == null || Duties == undefined || Duties == "NaN") ? parseFloat("0") : Duties);
                //Start Anand 13Mar2022:: Added Brand and Selling Price
                SellingPrice = ((SellingPrice == null || SellingPrice == undefined || SellingPrice == "NaN") ? parseFloat("0") : SellingPrice);
                //End Anand 13Mar2022:: Added Brand and Selling Price 

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveInventoryUsersDetail',
                    data: '{"HeaderID":"' + $("#divSelectedHeaderID").html() + '","Farm":"' + Farm + '","Flower":"' + Flower + '","UOM":"' + UOM + '","ReceivedBoxes":"' + ReceviedBoxes + '","SoldBoxes":"' + SoldBoxes + '","UOM":"' + UOM
                        + '","UnitsPerBunch":"' + UnitsPerBunch + '","UnitsPerBox":"' + UnitsPerBox
                        + '","Cost":"' + CostPerUnit + '","InvenType":"' + InvenType + '","Order":"' + Order
                        + '","PO":"' + PO + '","CustNumber":"' + CustNumber + '","Comments":"' + Comments
                        + '","BoxNumber":"' + BoxNumber + '","DetailID":"' + $("#divDetailID").html() + '","Type":"' + Type + '","Warehouse":"' + Warehouse + '","BreakDown":"' + BreakDown + '","OtherCost":"'
                        + Othercost + '","Handling":"' + Handling + '","Duties":"' + Duties + '","LandedCost":"' + LandedCost + '","Invoice":"' + Invoice + '","SellingPrice":"' + SellingPrice + '","BRAND":"' + BRAND + '"}', //Anand 13Mar2022:: Added Brand and Selling Price
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d.indexOf("Wait") != "-1") {
                            $.MessageBox(output.d);
                        }
                        else if (output.d == "Success") {
                            //Start Anand 13Mar2022:: Added Brand and Selling Price 
                            $("#txtSellingPrice").val("").attr("Placeholder", "0.000");
                            $('#txtBrand').val("");
                            //End Anand 13Mar2022:: Added Brand and Selling Price 
                            $("#DivInventoryUsersDetailAddEditDialog").dialog("close");
                            $("#fgrdInventoryUserDetails").flexReload({ url: '/url/for/refresh' });
                        }
                        else if (output.d.indexOf("error") > 0) {
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                        else {
                            $.MessageBox(output.d);
                        }
                    }
                });

            },
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            $(".YellowWarning").hide();
            $(".YellowWarningDetail").hide();
            $(".Warning").hide();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
            $("#lstInventoryUserswarehouse").focus();

        },
        //Start Anand 13Mar2022:: Added Brand and Selling Price
        close: function (){ 
            $("#txtSellingPrice").val("").attr("Placeholder", "0.000");
            $('#txtBrand').val("");
        }
        //End Anand 13Mar2022:: Added Brand and Selling Price
    });


    //function ValidateSaveInventoryUsers(HeaderId,DetailId,Boxnumber) {
    //    var ValidateStatus="";   
    //    $.ajax({
    //        async: false,
    //        type: "POST",
    //        url: 'BloomService.asmx/ValidateSaveInventoryUserDetails',
    //        data: '{"SelectedHeaders":"' + HeaderId + '","Boxnumber":"' + Boxnumber + '"}',
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output, status) {
    //            var MessageStr = output.d.split('~');
    //            if (MessageStr[0] == "Boxnum Zero") {
    //                $("#btnTransferInventoryUserDetails").removeClass("BloomButtonProcessing");
    //                $.MessageBox(MessageStr[1]);
    //                ValidateStatus = MessageStr[0];
    //            }
    //            else if (MessageStr[0] == "Already Transfered" && HeaderId == "0") {
    //                $("#btnTransferInventoryUserDetails").removeClass("BloomButtonProcessing");
    //                $.MessageBox("Box Number <b>" + MessageStr[1] + "</b> already transfered to Inventory, please check");
    //                ValidateStatus = MessageStr[0];
    //            }
    //            else if (MessageStr[0] == "Success") {
    //                ValidateStatus = MessageStr[0];
    //            }
    //            else {
    //                ValidateStatus = "";
    //            }
    //        }
    //    });
    //    return ValidateStatus;
    //}
    function LoadInventoryUsersType() {
        var length = $('#lstInventoryUsersType > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetTypeForInventory',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstInventoryUsersType').empty();
                    var Typedata = output.d;
                    $('#lstInventoryUsersType').append('<option value="0">Select</option>');
                    for (var i in Typedata) {
                        var Type = Typedata[i];
                        $('#lstInventoryUsersType').append('<option value="' + Type.Code + '">' + Type.Code + ' - ' + Type.Name + '</option>');
                    }
                    if ($("#hfInventoryUsersType").val() != "" && $("#hfInventoryUsersType").val() != 0)
                        $('#lstInventoryUsersType').val($("#hfInventoryUsersType").val());
                    else
                        $("#lstInventoryUsersType").val("0");
                }
            });
        }
        else {
            $('#lstInventoryUsersType').val($("#hfInventoryUsersType").val());
        }
    }

    function LoadDefaultWarehouse() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseListByUser',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var warehouse = output.d;
                var wh = warehouse[0];
                $("#hfInventoryUsersWarehouse").val(wh.WH.trim());
            }
        });
    }

    function LoadInventoryUsersWarehouse() {
        debugger;
        var length = $('#lstInventoryUserswarehouse > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetWarehouseList',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    $('#lstInventoryUserswarehouse').empty();
                    var warehouse = output.d;
                    $('#lstInventoryUserswarehouse').append('<option value="0">Select</option>');
                    for (var i in warehouse) {
                        var wh = warehouse[i];
                        $('#lstInventoryUserswarehouse').append('<option value="' + wh.WH + '">' + wh.WH + ' - ' + wh.Name + '</option>');
                    }
                    $('#lstInventoryUsersWarehouse').val($("#hfInventoryUsersWarehouse").val());
                }
            });
        }
        else {
            $('#lstInventoryUserswarehouse').val($("#hfInventoryUsersWarehouse").val());
        }
    }

    function LoadInventoryUsersInvenType() {
        var length = $('#lstInventoryUsersInvenType > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetInvenTypeForInventory',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstInventoryUsersInvenType').empty();
                    var InvenTypedata = output.d;
                    $('#lstInventoryUsersInvenType').append('<option value="0">Select</option>');
                    for (var i in InvenTypedata) {
                        var InvenType = InvenTypedata[i];
                        $('#lstInventoryUsersInvenType').append('<option value="' + InvenType.Code + '">' + InvenType.Code + ' - ' + InvenType.Name + '</option>');
                    }
                    if ($("#hfInventoryUsersInvenType").val() != "" && $("#hfInventoryUsersInvenType").val() != 0)
                        $('#lstInventoryUsersInvenType').val($("#hfInventoryUsersInvenType").val());
                    else
                        $("#lstInventoryUsersInvenType").val("0");
                }
            });
        }
        else {
            $('#lstInventoryUsersInvenType').val($("#hfInventoryUsersInvenType").val());
        }
    }

    $('#txtInventoryUsersCostPerUnit').keypress(function (event) {

        if ((event.which != 46 || $(this).val().indexOf('.') != -1) &&
            ((event.which < 48 || event.which > 57) &&
                (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }

        var text = $(this).val();

        if ((text.indexOf('.') != -1) &&
            (text.substring(text.indexOf('.')).length > 4) &&
            (event.which != 0 && event.which != 8) &&
            ($(this)[0].selectionStart >= text.length - 2)) {
            event.preventDefault();
        }
    });

    var EditInvenUserDetailClickedcompleted = true;
    $("[id^=editInventoryUsersDetail_]").die("click").live("click", function (e) {

        var DetailID = $(this)[0].id.replace("editInventoryUsersDetail_", "");
        $("#divDetailID").html(DetailID);
        if (loadingdropdownonDetailsDialogCompleted == false) {
            $.MessageBox("Controls are loading, Please click '<b>ADD</b>' after some time")
            return false;
        }

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetInventoryUserDetailByID',
            data: '{"ID":"' + DetailID + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                EditInvenUserDetailClickedcompleted = false;
                var InvenDetailData = output.d;
                debugger;
                if (InvenDetailData != null) {
                    $("#trInventoryUsersQuantitySold").hide();
                    $("#hfInventoryUsersFlower").val(InvenDetailData.Flower.trim());
                    $("#hfInventoryUsersFarm").val(InvenDetailData.Farm.trim());
                    //J1_10($("#lstInventoryUsersFlower")).selectize()[0].selectize.setValue($("#hfInventoryUsersFlower").val().trim());                
                    $("#txtInventoryUsersFlower").attr("Placeholder", "[" + InvenDetailData.Flower.trim() + "] " + InvenDetailData.FlowerName.trim());
                    $("#txtInventoryUsersFlower").val("[" + InvenDetailData.Flower.trim() + "] " + InvenDetailData.FlowerName.trim());

                    J1_10($("#lstInventoryUsersFarm")).selectize()[0].selectize.setValue($("#hfInventoryUsersFarm").val().trim());
                    $("#txtInventoryUsersPO").val(InvenDetailData.PO);
                    $("#txtInventoryUsersQuantityReceived").val("");
                    $("#txtInventoryUsersQuantityReceived").attr("Placeholder", InvenDetailData.CSREC);
                    $("#txtInventoryUsersQuantitySold").val("");
                    $("#txtInventoryUsersQuantitySold").attr("Placeholder", InvenDetailData.CSSOLD);
                    $("#hfInventoryUsersUOM").val(InvenDetailData.UOM);
                    //$("#DivInventoryFlowerColorCode").html(InvenDetailData.FlowerDetails.ColorCode);
                    //LoadInventoryUOM();

                    $("#txtInventoryUsersTotalUnits").val(InvenDetailData.TotalUnits);

                    $("#txtInventoryUsersUnitsPerBunch").val("");
                    $("#txtInventoryUsersUnitsPerBunch").attr("Placeholder", InvenDetailData.UnitsBunch);
                    $("#txtInventoryUsersUnitsPerBox").val("");
                    $("#txtInventoryUsersUnitsPerBox").attr("Placeholder", InvenDetailData.Units);

                    $("#txtInventoryUsersCostPerUnit").val("");
                    $("#txtInventoryUsersCostPerUnit").attr("Placeholder", parseFloat(InvenDetailData.Cost).toFixed(4));
                    $("#txtInventoryUsersType").val("");
                    $("#txtInventoryUsersType").attr("Placeholder", InvenDetailData.InvenType);
                    $("#txtInventoryUsersComments").val(InvenDetailData.Comments);
                    $("#txtInventoryUsersCustNo").val("");
                    $("#txtInventoryUsersCustNo").attr("Placeholder", InvenDetailData.CustNum);
                    $("#txtInventoryUsersOrderNo").val("");
                    $("#txtInventoryUsersOrderNo").attr("Placeholder", InvenDetailData.OrderNumber);

                    $("#txtInventoryUsersInvoice").val("");
                    $("#txtInventoryUsersInvoice").attr("Placeholder", InvenDetailData.Invoice);

                    $("#txtInventoryUsersBoxNumber").val(InvenDetailData.BoxNumber);
                    $("#txtInventoryUsersBreakDown").val(InvenDetailData.Message1);
                    $("#txtInventoryUsersBoxNumber").attr("disabled", false);

                    //from Email :: ANITHA :: INVENTORY :: add new table for Type in SQL
                    $("#hfInventoryUsersType").val(InvenDetailData.Type);
                    LoadInventoryUsersType();
                    //from Email :: ANITHA :: INVENTORY :: add new table for InvenType in SQL
                    $("#hfInventoryUsersInvenType").val(InvenDetailData.InvenType);
                    $("#hfInventoryUsersWarehouse").val(InvenDetailData.WH);

                    $("#txtInventoryUsersOtherCostPerBox").val("");
                    $("#txtInventoryUsersOtherCostPerBox").attr("Placeholder", parseFloat(InvenDetailData.OtherCost).toFixed(3));
                    $("#txtInventoryUsersHandling").val("");
                    $("#txtInventoryUsersHandling").attr("Placeholder", parseFloat(InvenDetailData.Handling).toFixed(4));
                    $("#txtInventoryUsersDuties").val("");
                    $("#txtInventoryUsersDuties").attr("Placeholder", parseFloat(InvenDetailData.Andean).toFixed(4));
                    $("#txtInventoryUserslandedcost").val("");
                    $("#txtInventoryUserslandedcost").attr("Placeholder", parseFloat(InvenDetailData.LandedCost).toFixed(4));

                    LoadInventoryUsersInvenType();
                    LoadInventoryUsersWarehouse();

                    //$("#DivInventoryFlowerCategory").html(InvenDetailData.CAT);
                    //$("#txtInventoryUnitsPerBunch").trigger('change');
                    //$("#hfInventoryFlower").val(InvenDetailData.FlowerDetails.Flower.trim() + '~' + InvenDetailData.FlowerDetails.Name.trim() + '~' + InvenDetailData.FlowerDetails.CAT.trim() + '~' + InvenDetailData.FlowerDetails.ColorCode.trim());

                    $("#DivInventoryUsersDetailAddEditDialog").dialog("open");
                    $("#DivInventoryUsersDetailAddEditDialog").dialog('option', 'title', "Edit Detail");

                    EditInvenUserDetailClickedcompleted = true;
                    //  LoadInventoryFlowers();

                    //Start Anand 13Mar2022:: Added Brand and Selling Price 
                    $("#txtSellingPrice").val((InvenDetailData.SellingPrice == 'null' || InvenDetailData.SellingPrice == "") ? parseFloat(0).toFixed(3) : parseFloat(InvenDetailData.SellingPrice).toFixed(3));
                    $("#txtBrand").val(InvenDetailData.BRAND == "" ? InvenDetailData.Farm.trim() : InvenDetailData.BRAND);
                    //End Anand 13Mar2022:: Added Brand and Selling Price 
                }
            }
        });
    });

    var loadingdropdownonDetailsDialogCompleted = false;
    LoadControlsOnDetailDialog()

    function LoadControlsOnDetailDialog() {
        //LoadFlowers(function (callback) {
        //if (callback == true) {
        LoadFarmCode(function (callback1) {
            if (callback1 == true) {
                debugger;
                LoadInventoryUOM1(function (callback2) {
                    if (callback2 == true) {
                        debugger;
                        $(".YellowWarningDetail").hide();
                        loadingdropdownonDetailsDialogCompleted = true;
                    }
                });
            }
        });
        //}
        //});
    }


    function LoadFlowers(callback) {
        debugger;
        var length = $('#lstInventoryUsersFlower > option').length;
        if (length <= 0) {
            //$("#imgFlowerAutocompleteLoader").css("display", "block");
            $(".YellowWarningDetail").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarningDetail").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/LoadFlowers',
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    $('#lstSPORDEditFlower').empty();
                    var data = output.d;
                    for (var i in data) {
                        var flower = data[i];
                        if (flower.Flower.trim() != "") {
                            $('#lstInventoryUsersFlower').append('<option data-open-balance="123" value="' + flower.Flower.trim() + '">' + flower.Flower + '  [' + flower.Name + ']' + '</option>');
                        }
                    }
                    J1_10($("#lstInventoryUsersFlower")).selectize({
                        onChange: function () {
                            var Flower = $("#lstInventoryUsersFlower")[0].value
                            if (EditInvenUserDetailClickedcompleted == true) {

                                $("#hfInventoryUsersFlower").val(Flower);
                                try {
                                    $("#txtInventoryUsersQuantityReceived").focus();
                                }
                                catch (er) {

                                }
                            }
                            debugger;

                            if ($("#lstInventoryUsersFlower")[0].value != "" && $("#lstInventoryUsersFlower")[0].value != "0") {
                                debugger;
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/GetFlowerDetailsByCode',
                                    data: '{"Flower":"' + $("#lstInventoryUsersFlower")[0].value + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    async: false,
                                    dataType: "json",
                                    success: function (output, status) {
                                        debugger;
                                        var flowerdet = output.d;
                                        $("#hfInventoryUsersUOM").val(flowerdet[0].UOM);
                                        $("#txtInventoryUsersUnitsPerBunch").val(flowerdet[0].UnitsPerBunch);
                                        $("#txtInventoryUsersUnitsPerBox").val(flowerdet[0].UNITS);

                                        //$("#txtInventoryFlowerDesc").val(dt[0].Name);
                                        //$("#DivInventoryFlowerCategory").html(dt[0].CAT);
                                        //$("#DivInventoryFlowerColorCode").html(dt[0].ColorCode);
                                    }
                                });

                            }

                        }
                    });
                    J1_10($("#lstInventoryUsersFlower")).selectize()[0].selectize.setValue($("#hfInventoryUsersFlower").val().trim());
                    // $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarningDetail").hide();
                    callback(true)
                },
            });
        }
        else {
            J1_10($("#lstInventoryUsersFlower")).selectize()[0].selectize.setValue($("#hfInventoryUsersFlower").val().trim());
            callback(true)
        }
    }




    function LoadFarmCode(callback) {
        debugger;
        var length = $('#lstInventoryUsersFarm > option').length;
        var LoginUserID = $("#ctl00_LoggedInUserID_InvenUser").html();
        if (length <= 0) {

            $(".YellowWarningDetail").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
            $(".YellowWarningDetail").show();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUserFarmCode',
                data: "{'UserID':'" + LoginUserID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstInventoryUsersFarm').empty();
                    var data = output.d;
                    for (var i in data) {
                        var farm = data[i];
                        if (farm.Farm != "") {

                            if (farm.FOB == "Y") {
                                farm.FOB = 'F';
                            }
                            else if (farm.FOB == "N") {
                                farm.FOB = 'C';
                            }

                            $('#lstInventoryUsersFarm').append('<option data-Inventype="' + farm.FOB + '"  value="' + farm.Farm + '">[' + farm.Farm + '] ' + farm.Name + '</option>');
                        }
                    }

                    J1_10($("#lstInventoryUsersFarm")).selectize({
                        allowEmptyOption: false,
                        create: false,
                        valueField: 'id',
                        valueField: 'name',
                        onInitialize: function () {
                            var s = this;
                            this.revertSettings.$children.each(function () {
                                $.extend(s.options[this.value], $(this).data());
                            });
                        },
                        onChange: function (value) {
                            debugger;
                            if (value != "") {
                                LoadInventoryUOM1(callback);
                                var option = this.options[value]
                                //alert(option.inventype)
                                $("#lstInventoryUsersInvenType").val(option.inventype);
                                //Start Anand 13Mar2022:: Added Brand and Selling Price 
                                $("#txtBrand").val($("#lstInventoryUsersFarm").val());
                                //End Anand 13Mar2022:: Added Brand and Selling Price
                            }

                            if (EditInvenUserDetailClickedcompleted == true) {
                                var Farm = $("#lstInventoryUsersFarm")[0].value
                                $("#hfInventoryUsersFarm").val(Farm);
                                try {
                                    $("#lstInventoryUserswarehouse").focus();
                                }
                                catch (er) {

                                }
                            }
                        }
                    });
                    J1_10($("#lstInventoryUsersFarm")).selectize()[0].selectize.setValue($("#hfInventoryUsersFarm").val().trim());
                    $("#imgFlowerAutocompleteLoader").css("display", "none");
                    $(".YellowWarningDetail").hide();
                    callback(true)
                },
            });
        }
        else {
            J1_10($("#lstInventoryUsersFarm")).selectize()[0].selectize.setValue($("#hfInventoryUsersFarm").val().trim());
            callback(true)
        }
    }


    function LoadInventoryUOM1(callback) {
        debugger;
        //$(".YellowWarningDetail").html("Loading... Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
        //$(".YellowWarningDetail").show();
        var length = $('#lstInventoryUsersUOM > option').length;
        var farmcode = $("#lstInventoryUsersFarm").val();
        //alert(farmcode);
        //alert(length);
        //if (length <= 0) {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUOMForManualPOByFarm',
            data: '{"FarmCode":"' + farmcode.toUpperCase() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                $('#lstInventoryUsersUOM').empty();
                var UOMdata = output.d;
                $('#lstInventoryUsersUOM').append('<option value="0">Select</option>');
                for (var i in UOMdata) {
                    var UOM = UOMdata[i];
                    $('#lstInventoryUsersUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM + ' [' + UOM.SIZE + ']</option>');
                }

                if ($("#hfInventoryUsersUOM").val() != "" && $("#hfInventoryUsersUOM").val() != 0)
                    $('#lstInventoryUsersUOM').val($("#hfInventoryUsersUOM").val());
                else
                    $("#lstInventoryUsersUOM").val("QB");
                callback(true)

            }
        });
        //}
        //else {
        //    $('#lstInventoryUsersUOM').val($("#hfInventoryUOM").val());
        //    $(".YellowWarningDetail").hide();
        //}
    }

    function PrintInventoryUsersLabel(HeaderID, DetailID) {
        var w = window.open('GeneratingPDF.html');
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInventoryUsersLabel',
            data: "{'HeaderID':'" + HeaderID + "','DetailID':'" + DetailID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
                else {
                    path = output.d;
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
            }
        });
    }

    //    <%--$("#btnPrintProductReportInInventoryUserDetails").die("click").live("click", function () {
//        var w = window.open('GeneratingPDF.html');       
//        $.ajax({
//            type: "POST",
//            url: 'BloomService.asmx/PrintInventoryUsersProductDetailsReport',
//            data: "{'HeaderId':'" + $("#divSelectedHeaderID").html() + "'}",
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            success: function (output, status) {
//                if (output.d == "LogOut") {
//                    w.close();
//                    window.location.href = "Login.aspx"
//                }
//                else {
//                    path = output.d;
//                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
//                    w.location = ExportedPath;
//                }
//            }
//        });
//    });--%>

    $("#btnPrintProductReportInInventoryUserDetails").die("click").live("click", function () {
        var w = window.open('GeneratingPDF.html');
        debugger;
        var AWB = $("#fgrdInventoryUsersHeader").find('.trSelectedCheck').find('td')[2].innerText;
        var DateRec = $("#fgrdInventoryUsersHeader").find('.trSelectedCheck').find('td')[3].innerText;
        var UserFileNo = $("#fgrdInventoryUsersHeader").find('.trSelectedCheck').find('td')[6].innerText;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInventoryUsersProductDetailsReport',
            data: "{'AWB':'" + AWB + "','DateRec':'" + DateRec + "','UserFileNo':'" + UserFileNo + "','CoolerFlag':'0','CoolerDisplay':''}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
                else {
                    path = output.d;
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
            }
        });
    });

    $("#btnTransferInventoryUserDetails").die("click").live("click", function () {     
         var StatusMsg = "";                
        StatusMsg = ValidateInventoryUserDetails($("#divSelectedHeaderID").html());
        if (StatusMsg == "Success") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/TransferInventoryUserDetails',
                data: "{'HeaderId':'" + $("#divSelectedHeaderID").html() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    debugger;
                    if (output.d.indexOf("success") >= 0) {
                        $("#MsgBoxTransfer").html("Succesfully transferred to Cooler - Awb " + output.d.split("~")[1]);
                        $("#MsgBoxTransfer").dialog("open");
                        //if (output.d.split("~")[1].indexOf("||") >= 0) {
                        //    var s = "";
                        //    s += "<table><tr><td>Below boxnumbers already on inventory in awb number " + output.d.split("~")[1].split("||")[1].split(",")[1] + "</td></tr><tr><td></td></tr><tr><td><table id='tblTransfer'><tr><th>SNo</th><th>Box Number</th></tr>";
                        //    var data = output.d.split("~")[1].split("||");
                        //    for (var i = 0; i < data.length; i++) {
                        //        var cnt = i + 1;
                        //        if (data[i].split(",")[0] != "") {
                        //            s += "<tr><td>" + cnt + "</td><td><div class='tdRightTransfer'>" + data[i].split(",")[0] + "</div></td></tr>";
                        //        }
                        //    }
                        //    s += "</table></td></tr></table>";
                        //    $("#MsgBoxTransfer").html(s).css('width', '500px');
                        //    $("#MsgBoxTransfer").dialog("open");
                        //}
                        //else {
                        //    $("#MsgBoxTransfer").html("Succesfully transfered to Cooler - Awb " + output.d.split("~")[1]);
                        //    $("#MsgBoxTransfer").dialog("open");
                        //}

                    }
                    else if (output.d.indexOf("invalid") >= 0) {
                        $("#MsgBoxTransfer").html("Nothing transferred to Cooler");
                        $("#MsgBoxTransfer").dialog("open");
                    }
                    else if (output.d.indexOf("noemailid") >= 0) {
                        $("#MsgBoxTransfer").html("There is no email-id to send email!");
                        $("#MsgBoxTransfer").dialog("open");
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }

                    $("#fgrdInventoryUserDetails").flexReload({ url: '/url/for/refresh' });
                    $("#fgrdInventoryUsersHeader").flexReload({ url: '/url/for/refresh' });

                    if ($("#fgrdInventoryUsersHeader").find('tr').length <= 0) {
                        $("#DivInventoryUserDetails").css("display", "none");
                    }
                }
            });
        }
    });

    function ValidateInventoryUserDetails(SelectedHeaders) {
        var ValidateStatus="";   
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/ValidateInventoryUserDetailsToTransfer',
            data: '{"SelectedHeaders":"' + SelectedHeaders + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                var MessageStr = output.d.split('~');
                if (MessageStr[0] == "Boxnum Zero") {
                    $("#btnTransferInventoryUserDetails").removeClass("BloomButtonProcessing");
                    $.MessageBox(MessageStr[1]);
                    ValidateStatus = MessageStr[0];
                }
                else if (MessageStr[0] == "Already Transferred") {
                    $("#btnTransferInventoryUserDetails").removeClass("BloomButtonProcessing");
                    $.MessageBox("Box Number <b>" + MessageStr[1] + "</b> is already in cooler inventory, you can not transferred again..please check");
                    ValidateStatus = MessageStr[0];
                }                
                else if (MessageStr[0] == "Success") {
                    ValidateStatus = MessageStr[0];
                }
                else {
                    ValidateStatus = "";
                }
            }
        });
        return ValidateStatus;
    }

    $("#btnRecalculateInventoryUserDetails").die("click").live("click", function () {
        $.ajax
            ({
                type: "POST",
                url: 'BloomService.asmx/RecalculateInventoryCostUserDetails',
                data: "{'HeaderId':'" + $("#divSelectedHeaderID").html() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d == "Success") {
                        $("#MsgBoxTransfer").html("Cost recalculated Successfully..");
                        $("#MsgBoxTransfer").dialog("open");
                    }
                    $("#fgrdInventoryUserDetails").flexReload({ url: '/url/for/refresh' });
                    $("#fgrdInventoryUsersHeader").flexReload({ url: '/url/for/refresh' });
                    //                if ($("#fgrdInventoryUsersHeader").find('tr').length <= 0) 
                    //                {
                    //                    $("#DivInventoryUserDetails").css("display", "none");
                    //                }
                }
            });
    });
    $("#MsgBoxTransfer").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 355,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
        }
    });

    function isNumberEntry(evt, element) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (
            //(charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.         
            ((charCode != 8 && charCode < 48) || charCode > 57))
            return false;
        return true;
    }

    $("#txtInventoryUsersUnitsPerBox").keypress(function (event) {
        debugger;
        var key = event.which;
        if (key == 13) // the enter key code
        {
            event.preventDefault();
            var Units = $("#txtInventoryUsersUnitsPerBox").val() == "" ? $("#txtInventoryUsersUnitsPerBox").attr("Placeholder") : $("#txtInventoryUsersUnitsPerBox").val();
            if (Units == 0) {
                $(".YellowWarningDetail").html("Units can not be 0..");
                $(".YellowWarningDetail").show();
                return false;
            } else {
                $(".YellowWarningDetail").hide();
            }
             if ($("#trInventoryUsersQuantitySold").css('display') == "none") {
                $("#txtInventoryUsersCostPerUnit").focus();
            }
            else {
                $("#txtInventoryUsersQuantitySold").focus();
            }

        }
    });

    //$("#txtInventoryUsersQuantityReceived").keypress(function (event) {
    //    debugger
    //    var key = event.which;
    //    if (key == 13) // the enter key code
    //    {
    //        $("#lstInventoryUsersUOM").focus();
    //    }
    //});
    $("#txtInventoryUsersQuantityReceived").keydown(function (e) {
        debugger
        var key = e.which;
        if (key == 13) // the enter key code
        {
            event.preventDefault();
            $("#lstInventoryUsersUOM").focus();
            return false
        }
    });

    $("#txtInventoryUsersCostPerUnit").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            event.preventDefault();
            $("#txtInventoryUsersOtherCostPerBox").focus();
        }
    });

    $("#lstInventoryUsersUOM").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            event.preventDefault();
            $("#txtInventoryUsersUnitsPerBunch").focus();
            return false;
        }
    });
    $("#txtInventoryUsersUnitsPerBunch").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            event.preventDefault();
            $("#txtInventoryUsersUnitsPerBox").focus();
            return false;
        }
    });

    $("#lstInventoryUsersType").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            event.preventDefault();
            $("#lstInventoryUsersInvenType").focus();
            return false;
        }
    });

    $("#lstInventoryUsersInvenType").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            event.preventDefault();
            $("#txtInventoryUsersPO").focus();
            return false;
        }
    });
    $("#lstInventoryUsersInvenType").change(function (event) {
        event.preventDefault();
        if ($(this).val() == "D") {
            $("#txtInventoryUsersOtherCostPerBox").val(0);
            $("#txtInventoryUsersDuties").val(0);
            $("#txtInventoryUsersHandling").val(0);
            CalculateFBE();
            FreightAndHandling();
            CalculateDuty();
            calculatelandedcost();
        }
    });
    $("#lstInventoryUserswarehouse").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {
            event.preventDefault();
            $("#txtInventoryUsersFlower").focus();
            return false;
        }
    });
    $("#txtInventoryUsersOrderNo,#txtInventoryUsersPO,#txtInventoryUsersCustNo,#txtInventoryUsersCostPerUnit").keydown(function (event) {
        var key = event.which;
        if (key == 34) // the pagedown key code
        {
            event.preventDefault();
            var btnSave = $(this).closest('div').next('div').find('button')[0]
            btnSave.click(function () { });
        }
    });
    $("#txtInventoryUsersBoxNumber").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the pagedown key code
        {
            event.preventDefault();
            $("#lstInventoryUsersType").focus();
        }
    });
    $("#txtInventoryUsersComments").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the pagedown key code
        {
            event.preventDefault();
            $("#txtInventoryUsersBreakDown").focus();
        }
    });

    //Start Anand 13Mar2022:: Added Brand and Selling Price 
    $("#txtSellingPrice").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the pagedown key code
        {
            event.preventDefault();
            $("#txtBrand").focus();
        }
    });

    $("#txtBrand").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the pagedown key code
        {
            event.preventDefault();
            var btnSave = $("#DivInventoryUsersDetailAddEditDialog").next("div").children(".ui-dialog-buttonset").children("button")[0];
            btnSave.focus();
        }
    });
    //End Anand 13Mar2022:: Added Brand and Selling Price


    // Muthu Nivetha M :: 20Mar2020 :: Modified :: To calc landedcost on txtInventoryUsersCostPerUnit focusout
    $("#txtInventoryUsersCostPerUnit").change( function () {
        debugger;
        var sourceCtl = $(this);
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost();
    });

    // Muthu Nivetha M :: 20Mar2020 :: Modified :: To calc landedcost on txtInventoryUsersUnitsPerBox focusout
    $("#txtInventoryUsersUnitsPerBox").change( function () {
        debugger;
        var sourceCtl = $(this);     
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost();
    });

    // Muthu Nivetha M :: 20Mar2020 :: Modified :: To calc landedcost on txtInventoryUsersOtherCostPerBox focusout
    $("#txtInventoryUsersOtherCostPerBox").change( function () {
        debugger;
        var sourceCtl = $(this);
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost();
    });

    // Muthu Nivetha M :: 20Mar2020 :: Modified :: To calc landedcost on txtInventoryUsersDuties focusout
    $("#txtInventoryUsersDuties").change( function () {
        debugger;
        var sourceCtl = $(this);
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost();
    });

    // Muthu Nivetha M :: 20Mar2020 :: Modified :: To calc landedcost on txtInventoryUsersHandling focusout
    $("#txtInventoryUsersHandling").change( function () {
        debugger;
        var sourceCtl = $(this);
        CalculateFBE();
        FreightAndHandling();
        CalculateDuty();
        calculatelandedcost();
    });

    function calculatelandedcost() {     
        debugger;
        var tmpcost = parseFloat("0"), tmpothrcost = parseFloat("0"), tmpunits = parseInt("0"), tmphandling = parseFloat("0"), tmpduties = parseFloat("0"), tmplndcst = parseFloat("0");

        tmpcost = ((($("#txtInventoryUsersCostPerUnit").val() == "")) ? ($("#txtInventoryUsersCostPerUnit").attr('placeholder')) : $("#txtInventoryUsersCostPerUnit").val());
        tmpothrcost = ((($("#txtInventoryUsersOtherCostPerBox").val() == "")) ? ($("#txtInventoryUsersOtherCostPerBox").attr('placeholder')) : $("#txtInventoryUsersOtherCostPerBox").val());
        tmpunits = ((($("#txtInventoryUsersUnitsPerBox").val() == "")) ? ($("#txtInventoryUsersUnitsPerBox").attr('placeholder')) : $("#txtInventoryUsersUnitsPerBox").val());
        tmphandling = ((($("#txtInventoryUsersHandling").val() == "")) ? ($("#txtInventoryUsersHandling").attr('placeholder')) : $("#txtInventoryUsersHandling").val());
        tmpduties = ((($("#txtInventoryUsersDuties").val() == "")) ? ($("#txtInventoryUsersDuties").attr('placeholder')) : $("#txtInventoryUsersDuties").val());
        
        tmpcost = ((tmpcost == null || tmpcost == "undefined" || tmpcost == "NaN") ? parseFloat("0") : tmpcost);
        tmpothrcost = ((tmpothrcost == null || tmpothrcost == "undefined" || tmpothrcost == "NaN") ? parseFloat("0") : tmpothrcost);
        tmpunits = ((tmpunits == null || tmpunits == "undefined" || tmpunits == "NaN") ? parseFloat("0") : tmpunits);
        tmphandling = ((tmphandling == null || tmphandling == "undefined" || tmphandling == "NaN") ? parseFloat("0") : tmphandling);
        tmpduties = ((tmpduties == null || tmpduties == "undefined" || tmpduties == "NaN") ? parseFloat("0") : tmpduties);

        //cost+othercost/units+handling+duties
        var tmpothrcostresult = ((parseFloat(tmpothrcost)) / (parseInt(tmpunits)));
        var tmphandlingresult = ((parseFloat(tmphandling)) / (parseInt(tmpunits)));
        
        tmplndcst = ((parseFloat(tmpcost)) + (parseFloat(tmpothrcostresult)) + (parseFloat(tmphandlingresult)) + (parseFloat(tmpduties)));
        tmplndcst = ((tmplndcst == null || tmplndcst == undefined || tmplndcst == "NaN") ? parseFloat("0") : tmplndcst);
        tmplndcst = isNaN(tmplndcst) == true ? 0: tmplndcst;
        $("#txtInventoryUserslandedcost").val("");
        $("#txtInventoryUserslandedcost").attr("Placeholder", parseFloat(tmplndcst).toFixed(4));
//        callback(true);
    }

    function FreightAndHandling() {
        var Farm = "";
        var FBE = "";
        var WH = "";
        Farm = $("#hfInventoryUsersFarm").val().trim();
        FBE = $("#hfInventoryUsersFBE").val();
        WH = $("#lstInventoryUserswarehouse").val();
        var Flower = "";
        Flower = $("txtInventoryUsersFlower").val();       
        if (Farm != "" && WH != "" && Flower != "") {
            $.ajax({
                async: false,
                type: "POST",
                url: 'BloomService.asmx/GetFreightByFarmAndHandlingByWarehouse',
                data: '{"Farm":"' + Farm + '","Warehouse":"' + WH + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var result = output.d.split("~");
                    var FreightAmount = result[0];
                    var HandlingCharge = result[1];
                    var FreightAmt = 0, HandlingAmt = 0;

                    FreightAmt = (parseFloat(FreightAmount) * parseFloat(FBE));
                    FreightAmt = ((FreightAmt == null || FreightAmt == "undefined" || FreightAmt == "NaN") ? parseFloat("0") : FreightAmt);

                    HandlingAmt = (parseFloat(HandlingCharge) * parseFloat(FBE));
                    HandlingAmt = ((HandlingAmt == null || HandlingAmt == "undefined" || HandlingAmt == "NaN") ? parseFloat("0") : HandlingAmt);
                    if (FreightAmt != "NaN" && $("#txtInventoryUsersOtherCostPerBox").val() == "") {
                        FreightAmt = isNaN(FreightAmt) == true ? 0 : FreightAmt;
                        $("#txtInventoryUsersOtherCostPerBox").val(FreightAmt.toFixed(3));
                    }
                    if (HandlingAmt != "NaN" && $("#txtInventoryUsersHandling").val() == "") {
                        HandlingAmt = isNaN(HandlingAmt) == true ? 0 : HandlingAmt;
                        $("#txtInventoryUsersHandling").val(HandlingAmt.toFixed(4));
                    }
                }
            });
        }
    }

    function CalculateDuty() {
        var Flower = "";
        var Farm = "";
        var Cost = "";
        Flower = $("#hfInventoryUsersFlower").val();
        Farm = $("#hfInventoryUsersFarm").val();//J1_10($("#lstInventoryUsersFarm")).selectize()[0].selectize.setValue($("#hfInventoryUsersFarm").val().trim());
        Cost = $("#txtInventoryUsersCostPerUnit").val();
        if (Cost == "")
            Cost = $("#txtInventoryUsersCostPerUnit").attr("Placeholder");      
        if (Flower != "" && Farm != "" && Cost != "") {
            $.ajax({                
                type: "POST",
                url: 'BloomService.asmx/GetDutyPerUnitByFarm',
                data: '{"Flower":"' + Flower + '","Farm":"' + Farm + '","Cost":"' + Cost + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (output, status) {
                    debugger;
                    var result = isNaN(parseFloat(output.d)) == true ? 0 : parseFloat(output.d);
                    var Duties = $("#txtInventoryUsersDuties").val().trim();
                    if (Duties == "" || Duties == "0.0000") {
                        $("#txtInventoryUsersDuties").val(parseFloat(result).toFixed(4));
                    }
                }
            });
        }        
    }

    function CalculateFBE() {
        var Flower = "";
        var FARM = "";
        var UOM = "";
        Flower = $("#hfInventoryUsersFlower").val();
        FARM = $("#hfInventoryUsersFarm").val().trim(); //J1_10($("#lstInventoryUsersFarm")).selectize()[0].selectize.setValue($("#hfInventoryUsersFarm").val().trim());
        UOM = $("#hfInventoryUsersUOM").val();
        //alert(Flower + " " + FARM + " " +UOM)
        if (Flower != "" && FARM != "" && UOM != "") {
            $.ajax({
                async: false,
                type: "POST",
                url: 'BloomService.asmx/GetFBE',
                data: '{"Flower":"' + Flower + '","Farm":"' + FARM + '","UOM":"' + UOM + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    var result = output.d;
                    $("#hfInventoryUsersFBE").val(result);
                }
            });
        }
    }
</script>


