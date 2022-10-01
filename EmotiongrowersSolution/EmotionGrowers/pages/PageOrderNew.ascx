<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageOrderNew.ascx.vb" Inherits="pages_PageOrderNew" %>
<script src="js/validation.js"></script>

<%-- 30-OCT-2017::Created By - ABI --%>
<style type="text/css">
    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
    }

    .firstletterunderline::first-letter {
        text-decoration: underline;
    }
</style>

<div id="DivSaveOrderFlag" style="display: none"></div>

<%--Muthu Nivetha M :: 03Mar2020 :: Modified :: Added F3 button to show 13months of sales for Selected Customer--%>
<div id="DivOrderNewDetailsDialog">
    <table id="tblOrderNewDetails" style="float: left" cellspacing="0">
        <tr id="trOrderNewCustDetails">
            <td style="vertical-align: top; padding: 0px; margin: 0px;">
                <div id="DivOrderNewCustDetailsPage" style="width: 1000px;"></div>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top; padding-top: 3px; margin: 0px;">
                <div id="DivOrderNewDetails" style="float: left">
                    <table id="fgrdOrderNewDetails" style="display: block;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="margin-top: 6px;" id="DivBtnOrderNewDetails">
                    <button id="btnOrderNewDetailsAdd" class="BloomButtonEnabled firstletterunderline" style="width: 66px; color: white;">ADD</button>
                    <button id="btnOrderNewDetailsMisc" class="BloomButtonEnabled firstletterunderline" style="margin-left: 4px; width: 66px; color: white; background: blueviolet;">K-Misc</button>
                    <button id="btnOrderNewDetailsSave" class="BloomButtonEnabled firstletterunderline" style="margin-left: 4px; width: 66px; color: white; background: burlywood;">SAVE</button>
                    <button id="btnOrderNewDetailsTerms" class="BloomButtonEnabled" value="Terms" style="width: 66px; color: white; background: darkblue;">Terms</button>
                    <button id="btnOrderNewDetailsShipto" class="BloomButtonEnabled" style="margin-left: 4px; width: 66px; color: white; background: fuchsia;">Shipto</button>
                    <button id="btnOrderNewDetailsMessage" class="BloomButtonEnabled" style="margin-left: 4px; width: 66px; color: white; background: orange;">Message</button>
                    <button id="btnOrderNewDetailsF3" class="BloomButtonEnabled" style="width: 66px; background: plum;">F3</button>
                    <button id="btnOrderNewDetailsF5" class="BloomButtonEnabled" style="width: 66px; background: teal;">F5</button>
                    <button id="btnOrderNewDetailsF6" class="BloomButtonEnabled" style="width: 66px; background: forestgreen;">F6</button>
                    <button id="btnOrderNewDetailsF7" class="BloomButtonEnabled" style="margin-left: 4px; width: 66px; background: dodgerblue;">F7</button>
                    <button id="btnOrderNewDetailsF8" class="BloomButtonEnabled" style="margin-left: 4px; width: 66px; background: gold;">F8</button>
                    <button id="btnOrderNewDetailsPrices" class="BloomButtonEnabled" style="margin-left: 4px; width: 90px; background: fuchsia;">Price List</button>
                    <button id="btnOrderNewDetailsNotes" class="BloomButtonEnabled firstletterunderline" style="margin-left: 4px; width: 66px; background: lightcoral;">Notes</button>
                    <%--<button id="btnOrderNewDetailsXFuture" class="BloomButtonEnabled firstletterunderline" style="margin-left: 4px; width: 66px; display: none; background: turquoise;">XFuture</button>--%>
                    <button id="btnOrderNewDetailsXFuture" class="BloomButtonEnabled" style="margin-left: 4px; width: 66px; display: none; background: turquoise;">XFuture</button>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="DivARINVSPage" style="display: none;"></div>
<div id="DivShortKeyFlag" style="display: none;" runat="server"></div>

<div id="LoggedInUserType" runat="server" style="display: none"></div>
<div id="LoggedInUserType_SalesPersonName" runat="server" style="display: none"></div>



<div id="DeleteNewOrderDetail" style="display: none;" title="Alert"></div>
<div id="DeleteNewOrderMiscDetail_NewOrder" style="display: none;" title="Alert"></div>
<div id="DivOrder2SQLID_OrderNew" style="display: none;"></div>

<div id="DivOrderSavePage_OrderNew" style="width: 1000px; display: none"></div>
<div id="DivpgOdrnewtbltype" style="display: none" runat="server"></div>
<div id="DivpgOdrnewInventoryAccessTypes" style="display: none" runat="server"></div>

<div id="Alertmsgbox" title="Alert">
    <p id="Alertmsg"></p>
</div>

<div id="IncompleteOrderAlertmsgbox" title="Alert">
    <p id="IncompleteOrderAlertmsg"></p>
</div>

<div id="CustAlertmsgbox" title="Alert">
    <p id="CustAlertmsg"></p>
</div>

<div id="msgbox-CreditLimitWarning" style="display: none;">
    <p id="msghtml-CreditLimitWarning" style="font-size: 14.5px; font-weight: bold;"></p>
</div>

<div id="DivOrderNewDetailConsolView" style="display: none">
    <table style="width: 100%">
        <tr>
            <td>
                <table id="fgrdOrderNewDetailConsolView" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>

<%--Muthu Nivetha M :: 03Mar2020 :: Added :: Added F3-grid to show 13months of sales for Selected Customer--%>
<div id="DivOrderNewF3Details" style="display: none">
    <table style="width: 100%">
        <tr>
            <td>
                <table id="fgrdOrderNewF3Details" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>
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
<input type="hidden" id="hdnPageOrderNewCustId" />
<div id="DivViewSPORDByPriceDialog" style="display: none;">
    <table>
        <tr>
            <td>
                <div id="divViewSPORDByPrice" style="float: left">
                    <table id="fgrdViewSPORDByPrice" style="display: block;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td id="tdSPORDPriceAdd" style="visibility: hidden">
                <button id="btnSPORDPriceAdd" class="BloomButtonEnabled firstletterunderline" value="PriceAdd" style="width: 70px; visibility: hidden">Add</button>
                <button id="btnSPORDClose" class="BloomButtonEnabled firstletterunderline" value="Close" style="width: 70px; visibility: hidden; float: right; background: red;">Close</button>
                <button id="btnSPORDBuild" class="BloomButtonEnabled firstletterunderline" value="Build" style="width: 70px; visibility: hidden; float: right;">Build</button>

            </td>
        </tr>
    </table>
</div>
<input type="hidden" id="hdnPageOrderNewSelectedFlowerId" />
<div id="AddOrderDetailFromFutureDialog_PageOrderNew">
    <table style="width: 100%;">
        <tr style="height: 25px">
            <td colspan="4">
                <div class="Warning" id="Futurewarning" align="center">
                    Not enough on inventory
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr style="height: 35px;">
            <td style="width: 20%">PRODUCT</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl1" id="txtFlower_FutureOrderDetail1"  style="width: 350px;" />
                <input type="hidden" id="hfFlower_FutureOrderDetail1" />
                <input type="hidden" id="hfFlowerName_FutureOrderDetail1" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>FARM</td>
            <td>
                <select id="lstFarm_FutureOrderDetail1" class="enterKeyPressControl1" style="width: auto;">
                </select>
                <input type="hidden" id="hfFarm_FutureOrderDetail1" />
            </td>
            <td colspan="2">&nbsp;
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>BOXES</td>
            <td>
                <input type="text" class="ClsNumbersOnly enterKeyPressControl1" id="txtQty_FutureOrderDetail1" style="width: 50px;" />
                <select id="lstUOM_FutureOrderDetail1" class="enterKeyPressControl1" style="width: 100px; height: 23px">
                </select>
                <input type="hidden" id="hfUOM_FutureOrderDetail1" />
                <label style="margin-left: 20px">UNITS/BOX</label>
                <input type="text" class="ClsNumbersOnly enterKeyPressControl1" id="txtUnitsPerBox_FutureOrderDetail1" style="width: 50px;" />
            </td>
            <td colspan="2">&nbsp;                  
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>PRICE</td>
            <td colspan="3">
                <input type="text" class="ClsDecimalsOnly enterKeyPressControl1" id="txtPrice_FutureOrderDetail1" style="width: 65px;" />
                <label style="margin-left: 20px">COST</label>
                <input type="text" class="ClsDecimalsOnly enterKeyPressControl1" id="txtCost_FutureOrderDetail1" style="width: 65px;" />
                <label style="margin-left: 20px">GPM%</label>
                <input type="text" class="ClsDecimalsOnly " id="txtGPM_FutureOrderDetail1" style="width: 65px;" disabled />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>BOX CODE</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl1" id="txtBoxCode_FutureOrderDetail1" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>UPC</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl1" id="txtUPC_FutureOrderDetail1" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>UPC PRICE</td>
            <td colspan="3">
                <input type="text" class="enterKeyPressControl1" id="txtUPCPRICE_FutureOrderDetail1" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>DATE CODE</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl1" id="txtDateCode_FutureOrderDetail1" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>NOTES</td>
            <td colspan="3">
                <textarea id="txtNotes_FutureOrderDetail1" class="enterKeyPressControl1" style="width: 360px;" rows="5" cols="40" />
            </td>
        </tr>
        <tr id="trPODetail" style="display: none; width: 100%">
            <td colspan="4">
                <table style="width: 100%;">
                    <tr style="height: 25px">
                        <td style="width: 50%;">
                            <label>Dflower PO</label>
                            <label style="color: red;" id="lblPODflower_FutureOrder"></label>
                        </td>
                        <td>
                            <label>Ship Date</label>
                            <label style="color: red;" id="lblShipdate_FutureOrder"></label>
                        </td>
                    </tr>
                    <tr style="height: 25px;">
                        <td>&nbsp;</td>
                    </tr>
                    <tr style="height: 25px; display: none;">
                        <td>
                            <label>BoxNum</label>
                            <label style="color: red;" id="lblPOBoxnum_FutureOrder"></label>
                        </td>
                        <td style="width: 50%;">
                            <label>PO Date</label>
                            <label style="color: red;" id="lblPODate_FutureOrder"></label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label style="color: red;" id="lblProductPurchaseWarningMsg">**This Product has been purchased already.. You can only change the Price</label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="msgbox-SPORDPRICEDel" style="display: none;" title="Alert">
    <p id="SPORDPRICEDel"></p>
</div>
<div id="SPORDPriceDialog" style="display: none; background-color: black;">
    <table>
        <tr>
            <td colspan="4">
                <table>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px; visibility: hidden;">Customer</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceCust" style="width: 120px; margin-bottom: 2px; visibility: hidden;" class="AllUpperCaseTextBox" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Flower</label>
                        </td>
                        <td>
                            <input type="hidden" id="hfSPORDPriceFlowerID" />
                            <input type="hidden" id="hfSPORDPriceFlower" />
                            <input type="hidden" id="hfSPORDPriceFlowerName" />
                            <input type="text" id="txtSPORDPriceFlower" style="width: 347px; margin-bottom: 2px;" class="AllUpperCaseTextBox enterKeyPressControl_SPORDPrice" >
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 5px; margin-bottom: 2px;">QTY</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceQTY" class="NumbersOnly enterKeyPressControl_SPORDPrice" style="width: 80px; text-align: right; margin-bottom: 2px;">
                            <select id="lstSPORDPriceUOM" style="width: 65px; height: 23px; margin-bottom: 2px;" class="enterKeyPressControl_SPORDPrice"></select>
                            <input type="hidden" id="hfSPORDPriceUOM" />

                            <label class="EditHeaderLabels" style="margin-left: 10px; margin-right: 10px; margin-bottom: 2px;">Units</label>
                            <input type="text" id="txtSPORDPriceUnits" class="NumbersOnly enterKeyPressControl_SPORDPrice" style="width: 80px; text-align: right; margin-bottom: 2px;">

                            <label class="EditHeaderLabels" style="margin-left: 10px; margin-right: 10px; margin-bottom: 2px;">Units/Bunch</label>
                            <input type="text" id="txtSPORDPriceUnitsBunch" class="NumbersOnly enterKeyPressControl_SPORDPrice" style="width: 80px; text-align: right; margin-bottom: 2px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">PRICE</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPrice_Price" class="DecimalsOnly enterKeyPressControl_SPORDPrice" style="width: 100px; text-align: right; margin-bottom: 2px;">
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">Soldas</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceSoldas" style="width: 21px; margin-bottom: 2px;" class="AllUpperCaseTextBox enterKeyPressControl_SPORDPrice" maxlength="2">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">UPC</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceUPC" style="width: 175px; margin-bottom: 2px;" maxlength="12" class="AllUpperCaseTextBox enterKeyPressControl_SPORDPrice">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">BOXCODE</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceBoxCode" style="width: 175px; margin-bottom: 2px;" maxlength="15" class="AllUpperCaseTextBox enterKeyPressControl_SPORDPrice">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">UPC PRICE</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceGTIN" style="width: 347px; margin-bottom: 2px;" maxlength="15" class="enterKeyPressControl_SPORDPrice">
                        </td>
                    </tr>
 <%--                   <tr>
                        <td>
                            <label class="EditHeaderLabels" style="margin-right: 10px; margin-bottom: 2px;">GTIN</label>
                        </td>
                        <td>
                            <input type="text" id="txtSPORDPriceGTIN" style="width: 347px; margin-bottom: 2px;" maxlength="25" class="AllUpperCaseTextBox enterKeyPressControl_SPORDPrice">
                        </td>
                    </tr>--%>
               </table>
            </td>
        </tr>
    </table>
</div>
<div id="OrderNewYN" style="display: none"></div>
<script type="text/javascript">
    var SaveClickedFirstTime = false;
    var salemade = false;
    var IsCreditOverLimit = false;
    var OldAvailable = 0;
    var DeleteInvenId = 0;
    var SpordSqlID = "0";
    $(document).ready(function () {
        //$(window).click(function () {
        //    
        //    var $dialogs = $('.ui-dialog:visible');
        //    if ($dialogs.length) {
        //        $dialogs[$dialogs.length - 1].focus();
        //    }
        //});

        if ($("#ctl00_LoggedInUserType").html() == "customer") {
            $("#DivBtnOrderNewDetails").hide();
            //$("#imgCustInfo").hide();
        }


        //$.ajax({
        //    type: "POST",
        //    url: 'BloomService.asmx/GetPage',
        //    data: '{ "controlName":"pages/PageCustDetails.ascx","controlPara":"" }',
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (output, status) {
        //        
        //        $("#DivOrderNewCustDetailsPage").html("");
        //        $("#DivOrderNewCustDetailsPage").html(output.d);
        //        GetCustDetailsPage($("#CurrentCustomerNo").html(), "");

        //        if ($(".lblTermCode").html().trim() == "X") {
        //            $("#CustAlertmsgbox").dialog("close");
        //            $("#CustAlertmsg").html("Sorry,... you can not sell to this customer, look at the TERMS on top");
        //            $("#CustAlertmsgbox").dialog("open");
        //            //return false;
        //        }

        //        if ($(".lblCreditHold").html().trim() == "Y") {
        //            $("#CustAlertmsgbox").dialog("close");
        //            $("#DivOrderNewDetailsDialog").dialog("close");
        //            if ($(".lblReasonHold").html() != "") {                        
        //                $("#CustAlertmsg").html("Sorry,... this customer is on credit hold Reason: <b>" + $(".lblReasonHold").html() + "</b>");

        //            }
        //            else {
        //                $("#CustAlertmsg").html("Sorry,... this customer is on credit hold");
        //            }
        //            $("#CustAlertmsgbox").dialog("open");
        //            //return false;
        //        }

        //        var para = 'Customer=' + $("#CurrentCustomerNo").html() + '&OrderNo=0';
        //        $.ajax({
        //            type: "POST",
        //            url: 'BloomService.asmx/GetPage',
        //            data: '{ "controlName":"pages/PageOrderSaveProcess.ascx","controlPara":"' + para + '" }',
        //            contentType: "application/json; charset=utf-8",
        //            dataType: "json",
        //            success: function (output, status) {

        //                $("#DivOrderSavePage_OrderUpd").html("");
        //                $("#DivOrderSavePage_OrderNew").html("");
        //                $("#DivOrderSavePage_OrderNew").html(output.d);

        //                //$("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER');
        //                //$("#DivOrderNewDetailsDialog").dialog("open");

        //            }
        //        });

        //    }
        //});



        //var IsCustomerType = false;
        //if ($("#ctl00_LoggedUserType").html() == "warehouse" || $("#ctl00_LoggedUserType").html() == "customer") {
        //    var IsWHType = true
        //}
        //else {
        //    var IsWHType = false
        //}

        //var width = 1160;
        //var height = $(window).height() - 290;
        //var Filter = '';
        //var OrderNo = '';
<%   
    Dim strGPMYN As String = ""

    If Not Session("LoginUserDetails") Is Nothing Then
        If Convert.ToString(Session("LoginUserDetails").ORDER).Length > 80 Then
            strGPMYN = Session("LoginUserDetails").ORDER.ToString().Substring(84, 1).ToString()
        End If
    End If

%>
         var IsGPMYN = '<%=strGPMYN%>' == "Y" ? true : false;
        $("#fgrdOrderNewDetails").flexigrid({
            url: 'BloomService.asmx/GetNewOrderGridList',
            dataType: 'xml',
            colModel: [
                { display: '', name: 'Delete', width: 13, sortable: false, align: 'center' },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                { display: '', name: 'Credits', width: 13, sortable: false, align: 'center' },
                { display: 'Flower', name: 'Flower', width: 60, sortable: true, align: 'left' },
                { display: 'Description', name: 'Name', width: 180, sortable: true, align: 'left' },
                { display: 'Farm', name: 'FarmCode', width: 30, sortable: true, align: 'left' },
                { display: 'AWB', name: 'AWB', width: 40, sortable: true, align: 'left' },
                { display: 'Pieces', name: 'Boxes', width: 30, sortable: false, align: 'right' },
                { display: 'UOM', name: 'UOM', width: 30, sortable: false, align: 'left' },
                { display: 'Units', name: 'Units', width: 30, sortable: false, align: 'right' },
                { display: 'TotalUnits', name: 'TotalUnits', width: 60, sortable: false, align: 'right' },
                { display: 'FOB', name: 'FOB', width: 50, sortable: false, align: 'right' },
                { display: 'Total $', name: 'TotPerLine', width: 60, sortable: true, align: 'right' },
                { display: 'Type', name: 'Type', width: 30, sortable: true, align: 'left' },
                { display: '%GPM', name: 'gpm', width: 40, sortable: true, align: 'right', hide: (IsGPMYN == false) ? true : false },
                { display: 'BoxNum', name: 'BoxNum', width: 40, sortable: true, align: 'right' },
                { display: 'Box Code', name: 'BoxCode', width: 60, sortable: true, align: 'left' },
                { display: 'UPC', name: 'UPC', width: 70, sortable: true, align: 'left' },
                { display: 'UPC PRICE', name: 'UPCPRICE', width: 60, sortable: false, align: 'left', hide: false },
                { display: 'PODFlower', name: 'PODFlower', width: 60, sortable: true, align: 'left' },
                { display: 'InvenID', name: 'InvenID', width: 60, sortable: false, align: 'left', hide: false },
                { display: 'AWBWithID', name: 'AWBWithID', width: 40, sortable: false, align: 'left', hide: true  },
            ],
            searchitems: [
                { display: 'Flower', name: 'Flower' },
                { display: 'Description', name: 'Name' },
                { display: 'Farm', name: 'FarmCode' },
                { display: 'AWB', name: 'AWB' },
                { display: 'Pieces', name: 'Boxes' },
                { display: 'UOM', name: 'UOM' },
                { display: 'Units', name: 'Units' },
                { display: 'TotalUnits', name: 'TotalUnits' },
                { display: 'Type', name: 'Type' },
                { display: 'Box Number', name: 'BoxNum' },
                { display: 'Box Code', name: 'BoxCode' },
                { display: 'UPC', name: 'UPC' },
                { display: 'PODFlower', name: 'PODFlower' }
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
            autoload: false,
            showTableToggleBtn: false,
            width: 1275, //1193,//1080,
            height: $(window).height() - 270,
            striped: true,
            onSuccess: function () {
                $('#fgrdOrderNewDetails #row0').addClass("TotalRows");

                var InvoiceTotalGrid = $('#fgrdOrderNewDetails #row0').find("td div").eq(13).text();
                var NewInvoiceTotal = parseFloat(InvoiceTotalGrid == "" ? "0" : InvoiceTotalGrid.replace(",", "").trim()).toFixed(2);
                //28Mar19 :: Abinaya :: Check Available Amount
                OldAvailable = $("DivOrderNewDetails .lblAvailable1").html();
                OldAvailable = OldAvailable != "" && OldAvailable != "NaN" && OldAvailable != null ? parseFloat(OldAvailable.replace(",", "")).toFixed(2) : OldAvailable;
                var NewAvailable = OldAvailable - NewInvoiceTotal;
                $("DivOrderNewDetails .lblAvailable1").html(addCommas(parseFloat(NewAvailable).toFixed(2)));
                //21Mar19 :: Abinaya :: Speed optimization for Save process
                if ($("#DivOrderSavePrintProcess").html() == "1") {
                    $("#DivOrderNewDetailsDialog").dialog("close");
                }
            },
            params: [
                { name: 'Customer', value: $("#CurrentCustomerNo").html() },
                { name: 'ExportCSV', value: '' },
            ],

            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    window.location.href = "Login.aspx";
                }
            }
        });

        $("#DivOrderNewDetails .sDiv").css('float', 'left').css('width', '645px');
        $('#DivOrderNewDetails .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#DivOrderNewDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#DivOrderNewDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#DivOrderNewDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
        $("#imgUserLoader").hide();
    });
    $("#DialogEmailOrFaxtheOrder").dialog({
        autoOpen: false,
        resizable: false,
        width: 500,
        height: 350,
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
                        } else if (output.d.includes("success")) {
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
                if (output.d.includes("success")) {
                    $.growl.notice({ title: "", message: output.d });
                }
                else
                    $.growl.error({ title: "", message: output.d });

            }
        });
    }

    //'Muthu Nivetha M :: 18 Mar 19 ::  Locks up system :: Sales-Person
    function GetCustomerDetailsforNewOrder() {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            async: false,
            data: '{ "controlName":"pages/PageCustDetails.ascx","controlPara":"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $("#DivOrderNewCustDetailsPage").html("");
                $("#DivOrderNewCustDetailsPage").html(output.d);
                GetCustDetailsPage($("#CurrentCustomerNo").html(), "", "DivOrderNewCustDetailsPage");

                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/CheckIsSalesPersonSameForNewOrder",
                    data: '{ "Customer":"' + $("#CurrentCustomerNo").html() + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        var data = output.d;
                        //if (output.d[0] == "1") {
                        if ($(".lblTermCode").html().trim() == "X") {
                            $("#CustAlertmsgbox").dialog("close");
                            $("#CustAlertmsg").html("Sorry,... you can not sell to this customer, look at the TERMS on top");
                            $("#CustAlertmsgbox").dialog("open");
                            return false;
                        }

                        if ($(".lblCreditHold").html().trim() == "Y") {
                            $("#CustAlertmsgbox").dialog("close");
                            $("#DivOrderNewDetailsDialog").dialog("close");
                            if ($(".lblReasonHold").html() != "") {
                                $("#CustAlertmsg").html("Sorry,... this customer is on credit hold Reason: <b>" + $(".lblReasonHold").html() + "</b>");

                            }
                            else {
                                $("#CustAlertmsg").html("Sorry,... this customer is on credit hold");
                            }
                            $("#CustAlertmsgbox").dialog("open");
                            return false;
                        }

                        var para = 'Customer=' + $("#CurrentCustomerNo").html() + '&OrderNo=0';
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GetPage',
                            data: '{ "controlName":"pages/PageOrderSaveProcess.ascx","controlPara":"' + para + '" }',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                $("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
                                $("#DivOrderSavePage_VETDetail").html("");
                                $("#DivOrderSavePage_OrderUpd").html("");
                                $("#DivOrderSavePage_OrderNew").html("");
                                $("#DivOrderSavePage_OrderNew").html(output.d);

                                //$("#DivOrderNewDetailsDialog").dialog('option', 'title', 'NEW ORDER');
                                //$("#DivOrderNewDetailsDialog").dialog("open");
                                DialogOpenCallforNewOrder();
                                GetWarehouse(function (callback) { });

                            }
                        });
                    }
                    //Commented by Jose on 13 Aug 2020 for not need anymore
                    //else if (output.d[0] == 0) {
                    //    $("#CustAlertmsg").html("The Selected Customer being updated by other sales-person");
                    //    $("#CustAlertmsgbox").dialog("open");
                    //    return false;
                    //}
                    //else {
                    //    $("#CustAlertmsg").html("Please contact administrator");
                    //    $("#CustAlertmsgbox").dialog("open");
                    //    return false;
                    //}
                    //}
                });
            }
        });
    }

    function OrderNewindexOfMax(arr) {

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
        try {
            var focused = document.activeElement; //btnOrderNewDetailsAdd
            var zindex = [];
            var divname = [];
            for (i = 0; i < $(".ui-dialog:visible").length; i++) {
                var ss = $(".ui-dialog:visible")[i].style.zIndex
                zindex.push($(".ui-dialog:visible")[i].style.zIndex);
                divname.push($(".ui-dialog:visible")[i].lastChild.id);
            }
            var max = OrderNewindexOfMax(zindex);

            if ($(".ui-dialog:visible")[max].lastChild.id == "DivOrderNewDetailsDialog" && focused.className != "qsbox") {
                if (e.which == 13) { //Click Enter
                    $('#btnOrderNewDetailsAdd').click();
                }

                if (e.which == 65) {    //Click A - ADD
                    $("#btnOrderNewDetailsAdd").click();
                }
                if (e.which == 75) {    //Click K - K-Misc
                    $("#btnOrderNewDetailsMisc").click();
                }
                if (e.which == 83) {    //Click S - Save
                    $('#btnOrderNewDetailsSave').click();
                }
                if (e.altKey) {
                    if (e.which == 51) {    //Click Alt+5 - F5
                        $("#btnOrderNewDetailsF3").click();
                    }
                    if (e.which == 53) {    //Click Alt+5 - F5
                        $("#btnOrderNewDetailsF5").click();
                    }
                    if (e.which == 54) {    //Click Alt+6 - F6
                        $("#btnOrderNewDetailsF6").click();
                    }
                    if (e.which == 55) {    //Click Alt+7 - F7
                        $("#btnOrderNewDetailsF7").click();
                    }
                    if (e.which == 56) {    //Click Alt+8 - F8
                        $("#btnOrderNewDetailsF8").click();
                    }
                }
                if (e.which == 78) {    //Click N - Notes
                    $("#btnOrderNewDetailsNotes").click();
                }
                //Commented By Prashant on 22 June 2020 Hide X Future Button on main page because no need of that 
                //if (e.which == 88 && $("#ctl00_DivShortKeyFlag").html() == "0") {    //Click X - Future
                //    $("#btnOrderNewDetailsXFuture").click();
                //}
            }


            //if ($(".ui-dialog:visible")[max].lastChild.id == "InventoryListForOrderEntryDialog" && focused.className != "qsbox") {
            //    if (e.which == 77) { //Click M
            //        $('#btnOrderInventoryMarket').click();
            //    }
            //    if (e.which == 76) { //Click L
            //        $('#btnOrderInventoryLocal').click();
            //    }
            //    if (e.which == 72) {//Click H
            //        $('#btnOrderInventoryHold').click();
            //    }
            //    if (e.which == 65) {//Click A
            //        $('#btnOrderInventoryArriving').click();
            //    }
            //    if (e.which == 82) {//Click R
            //        $('#btnOrderInventoryRefresh').click();
            //    }
            //    if (e.which == 83) {//Click S
            //        $('#btnOrderInventoryStanding').click();
            //    }
            //    if (e.which == 80) {//Click P
            //        $('#btnOrderInventoryPrebooks').click();
            //    }


            //}
        }
        catch (ex) {

        }
    });

    //Muthu Nivetha M :: 12Mar2020 :: Modified :: fgrdOrderHeader should only refresh when there is a new transaction
    $("#DivOrderNewDetailsDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 1290, // 1225, 
        height: $(window).height() - 10,
        modal: true,
        focus: function () {
            $('#DivOrderNewDetailsDialog').focus();
        },
        open: function () {
            $("#DivSaveOrderFlag").html("0");
            GetCustomerDetailsforNewOrder();
            //if (($(".lblCreditHold").html().trim() != "Y" && $(".lblTermCode").html().trim() != "X")) {
            //$('#btnOrderNewDetailsAdd').focus();

            //SaveClickedFirstTime = false;
            //salemade = false;
            //$.ajax({
            //    type: "POST",
            //    url: 'BloomService.asmx/CheckIsUnsavedOrderFortheUser',
            //    data: "{'CurrentCustomer': " + $("#CurrentCustomerNo").html() + "}",
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (output, status) {
            //        
            //        if (output.d == "LogOut") {
            //            window.location.href = "Login.aspx"
            //        }
            //        else if (output.d == "error") {
            //            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
            //        }
            //        else if (output.d != "") {
            //            //$("#IncompleteOrderAlertmsgbox").dialog("close");
            //            $("#IncompleteOrderAlertmsg").html("Error,,, last order not completed <br /> <br /> " +
            //            "It belongs to <b>customer = " + output.d + "</b>. Please go back to that customer to recover the order");
            //            $("#IncompleteOrderAlertmsgbox").dialog("open");
            //        }
            //        else {
            //            $.ajax({
            //                type: "POST",
            //                url: 'BloomService.asmx/GetCustomerComments',
            //                data: "{'Customer': " + $("#CurrentCustomerNo").html() + "}",
            //                contentType: "application/json; charset=utf-8",
            //                dataType: "json",
            //                success: function (output, status) {

            //                    $('<div id="DivCustomerComments" style="word-wrap:break-word;height: auto;font-size: 20px; color: white; background-color: blue;font-weight: bold;">/div>').dialog({
            //                        title: 'CUSTOMER NOTES SECTION',
            //                        autoOpen: false,
            //                        resizable: false,
            //                        modal: true,
            //                        width: 700,
            //                        buttons: {
            //                            Ok: function () {
            //                                $(this).dialog("close");

            //                            }
            //                        },
            //                        close: function (event, ui) {
            //                            $(this).dialog('destroy').remove();
            //                        },
            //                        open: function () {
            //                            $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
            //                        },

            //                    });
            //                    if (output.d != "" && output.d != null && output.d != undefined) {
            //                        $("#DivCustomerComments").html('<pre>' + output.d + '</pre>').dialog("open");
            //                    }
            //                    else {
            //                        $("#DivCustomerComments").dialog('destroy').remove();;
            //                    }


            //                }
            //            });
            //        }
            //    }
            //});
            //}
        },

        beforeClose: function () {


            try {
                var focused = document.activeElement; //btnOrderNewDetailsAdd
                var zindex = [];
                var divname = [];
                for (i = 0; i < $(".ui-dialog:visible").length; i++) {
                    var ss = $(".ui-dialog:visible")[i].style.zIndex
                    zindex.push($(".ui-dialog:visible")[i].style.zIndex);
                    divname.push($(".ui-dialog:visible")[i].children[1].id);
                }
                var max = OrderNewindexOfMax(zindex);

                if ($(".ui-dialog:visible")[max].children[1].id == "DivOrderNewDetailsDialog") {
                    if ($("#fgrdOrderNewDetails tr").length > 0 && $("#DivSaveOrderFlag").html() == "0") {
                        $("#Alertmsgbox").dialog("close");
                        $("#Alertmsg").html("Please complete the order or delete items");
                        $("#Alertmsgbox").dialog("open");
                        return false;
                    }
                }
                else {
                    //28Mar19 :: Abinaya :: Don't hide current order dialog from F6
                    //$('#' + $(".ui-dialog:visible")[max].children[1].id).dialog('close')
                    return false;
                }
                //21Mar19 :: Abinaya :: Speed optimization for Save process
                //$("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
            }
            catch (e) { }

        },
        close: function () {
            SaveClickedFirstTime = false;
            $("#txtCustSearch").val("");
            $("#txtCustSearch").focus();
            $("#txtInvSearch").val("");
            var page = window.location.href;
            if (page.indexOf('Page=Sales') >= 0 && salemade == false) {
                var CALL_ID = $('#DivOrderNewDetailsDialog').data("CALL_ID");

                //$('#DivOrderNewDetailsDialog').dialog("open");
                // $("#DialogCallOptionsOnEsc").data("CALL_ID", CALL_ID).dialog("open");
                CallLogAjax(CALL_ID, "Auto log:No sale made", $("#CurrentCustomerNo").html(), 'Yes');
            }
            else if (page.indexOf('Page=Sales') >= 0 && salemade == true) {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateCallListTypeAfterSaleMade',
                    data: '{ "Customer":"' + $("#CurrentCustomerNo").html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $("#fgrdCallListDetails").flexReload({ url: '/url/for/refresh' });
                    }
                });
            }
            $(".lblCreditHold").html("");
            $(".lblTermCode").html("");
            $("#DivOrderNewDetailsDialog").dialog('destroy').remove();
            $("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
            $("#DivOrderSavePage_OrderNew").html("");
            $("#DivOrderSavePrintProcess").html("");
        }
    });

    function DialogOpenCallforNewOrder() {
        $('#btnOrderNewDetailsAdd').focus();

        SaveClickedFirstTime = false;
        salemade = false;

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/CheckIsUnsavedOrderFortheUser',
            data: "{'CurrentCustomer': " + $("#CurrentCustomerNo").html() + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx"
                }
                else if (output.d == "error") {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
                else if (output.d != "") {
                    //$("#IncompleteOrderAlertmsgbox").dialog("close");
                    $("#IncompleteOrderAlertmsg").html("Error,,, last order not completed <br /> <br /> " +
                        "It belongs to <b>customer = " + output.d + "</b>. Please go back to that customer to recover the order");
                    $("#IncompleteOrderAlertmsgbox").dialog("open");
                }
                /*Commented by Abinaya as per Soumya's request :: 02March2019*/
                else {
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/GetCustomerComments',
                        data: "{'Customer': " + $("#CurrentCustomerNo").html() + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            //2020/09/10, show notification instead of comments dialog
                            //$('<div id="DivCustomerComments" style="word-wrap:break-word;height: 200px;font-size: 20px; color: white; background-color: blue;font-weight: bold;overflow:hidden;">/div>').dialog({
                            //    title: 'CUSTOMER NOTES SECTION',
                            //    autoOpen: false,
                            //    resizable: false,
                            //    modal: true,
                            //    height:300,
                            //    width: 700,
                            //    buttons: {
                            //        Ok: function () {
                            //            $(this).dialog("close");

                            //        }
                            //    },
                            //    close: function (event, ui) {
                            //        $(this).dialog('destroy').remove();
                            //    },
                            //    open: function () {
                            //        $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
                            //    },

                            //});
                            //if (output.d != "" && output.d != null && output.d != undefined) {
                            //    $("#DivCustomerComments").html('<pre>' + output.d + '</pre>').dialog("open");
                            //}
                            //else {
                            //    $("#DivCustomerComments").dialog('destroy').remove();;
                            //}
                            if (output.d != "" && output.d != null && output.d != undefined) {
                                //$.growl.notice({ title: "You have a notes for this customer!", message: output.d });
                                $.growl.error({
                                    title: 'You have a notes for this customer!',
                                    message: output.d
                                });
                            }

                        }
                    });
                }
            }
        });
    }

    $("#btnOrderNewDetailsF5").die('click').live('click', function () {
        SaveDivOrder1InfoDialog();
        var Customer = $("#CurrentCustomerNo").html();
        $("#fgrdARINVCustomer").empty();
        $("#fgrdARINVCustomer").flexOptions({ params: [{ name: 'ExportCSV', value: '' }, { name: 'Customer', value: Customer }, { name: 'IsARINVHistory', value: "0" }], query: "", newp: 1 }).flexReload();
        //$("#DivARINVCustomerGridDialog .bDiv").css("height", "474px");
        $("#DivARINVCustomerGridDialog").dialog('option', 'title', 'ARINVS Info For Customer :: ' + Customer + '');
        $("#DivARINVCustomerGridDialog").data("Customer", Customer).dialog("open");
        GetCustDetailsPage(Customer, "", "DivARINVCustomerGridDialog");
    });

    function SaveDivOrder1InfoDialog() {
        sessionStorage.setItem("shippingdatesave", $("#txtShippingDate_Or1").val());
        sessionStorage.setItem("carriersave", $("#txtCarrier_Or1").val());
        sessionStorage.setItem("cutoffsave", $("#txtCutOfftime_Or1").val());
        sessionStorage.setItem("awbsave", $("#txtAWB_Or1").val());
        sessionStorage.setItem("posave", $("#txtCustPO_Or1").val());
        sessionStorage.setItem("smsave", $("#txtSalesMan_Or1").val());

        sessionStorage.setItem("cm1save", $("#txtCustMsg1").val());
        sessionStorage.setItem("cm2save", $("#txtCustMsg2").val());
        sessionStorage.setItem("cm3save", $("#txtCustMsg3").val());
        sessionStorage.setItem("cm5save", $("#txtCustMsg4").val());
        sessionStorage.setItem("cm5save", $("#txtCustMsg5").val());

        sessionStorage.setItem("sm1save", $("#txtShipMsg1").val());
        sessionStorage.setItem("sm2save", $("#txtShipMsg2").val());
        sessionStorage.setItem("sm3save", $("#txtShipMsg3").val());
        sessionStorage.setItem("sm4save", $("#txtShipMsg4").val());
        sessionStorage.setItem("sm5save", $("#txtShipMsg5").val());

        sessionStorage.setItem("km1save", $("#txtshipMsg1").val());
        sessionStorage.setItem("km2save", $("#txtShipMsg2").val());
        sessionStorage.setItem("km3save", $("#txtShipMsg3").val());
        sessionStorage.setItem("km4save", $("#txtShipMsg4").val());
        sessionStorage.setItem("km5save", $("#txtShipMsg5").val());

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
    }
    $("#btnOrderNewDetailsF7").die('click').live('click', function () {
        var Customer = $("#CurrentCustomerNo").html();
        var para = 'Customer=' + Customer + '&Date=' + "01/01/1900" + '&Page=CallHS';  /*default date bcoz it needs to show all data from the begin*/
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
                    title: 'Activity Log :: ' + Customer,
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

    $("#btnOrderNewDetailsF6").die('click').live("click", function (e) {
        try {
            $("#DivCurrentOrdersDialog").dialog("close");
        }
        catch (ex) { }
        var Customer = $("#CurrentCustomerNo").html();

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

                    },

                });
                $("#DivCurrentOrdersDialog").dialog('option', 'title', 'Current Order Detail for Customer ::' + Customer);
                $("#DivCurrentOrdersDialog").html(output.d).dialog("open");
            }
        });

    });

    $("#btnOrderNewDetailsF8").die('click').live('click', function () {
        var para = 'Customer=' + $("#CurrentCustomerNo").html();
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
                        //read truck days from parent dialog
                        $("#DaysTruckNewOrderDetails").html($("#DaysTruckNewOrder").html());
                    },

                });
                $("#DivSPORDDialog").dialog('option', 'title', 'SPORD Details for Customer ::' + $("#CurrentCustomerNo").html() + ' <span style="margin-left:25px;" id="DaysTruckNewOrderDetails">   </span>');
                $("#DivSPORDDialog").html(output.d).dialog("open");
            }
        });
    });

    $("#btnOrderNewDetailsMisc").die('click').live('click', function () {
        var OrderNo = 0
        var CustomerNo = $("#CurrentCustomerNo").html();
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


    $("[id^=NewOrderDetailEdit_]").die("click").live("click", function () {
        debugger;
         $("#hdnPageOrderNewSelectedFlowerId").val("")
        var Farmcode = $(this).attr('id').replace("NewOrderDetailEdit_", "").split("~")[1];

        if (Farmcode == "ZZ") {
            if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person") {
                $("#Alertmsg").html("Sorry,... You don't have rights to Edit Fuel Charges");
                $("#Alertmsgbox").dialog("open");
                return false
            }
        }
        var OrderNo = 0;
        var CustomerNo = $("#CurrentCustomerNo").html();
        var ID = $(this).attr('id').replace("NewOrderDetailEdit_", "").split("~")[0];
        //read AWB by element ID instead of reading by column index
        //var AWB = $('#fgrdOrderNewDetails #row' + ID).find("td div").eq(7).text();
        var AWB = $("#NewOrderDetailAWB_" + ID).html();
        if (AWB) { AWB = AWB.trim(); }
        // var vInvenID = $('#NewOrderDetailInvenId_' + ID).text();

        if ($("#NewOrderDetailType_" + ID).html() == "K") {
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
                            $(this).dialog('destroy').remove();
                        },
                        open: function () {
                            //$("#fgrdOrderDetails").flexOptions({ params: [{ name: 'Filter', value: "" }], query: "", newp: 1 }).flexReload();
                        }
                    });
                    $("#DivKMISCDialog").html(output.d).dialog("open");
                }
            });
        }
        else if ($("#NewOrderDetailType_" + ID).html() == "O" && (AWB === "" || AWB === "0")) {
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
                            url: 'BloomService.asmx/GetFarmListByFlower',
                            data: "{'Flower':'" + orddet.Flower + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (output, status) {
                                LoadUOM_PageOrderNew()
                                $('#lstFarm_FutureOrderDetail1').empty();
                                var Typedata = output.d;
                                $('#lstFarm_FutureOrderDetail1').append('<option value="">Select</option>');
                                $('#lstFarm_FutureOrderDetail1').append(Typedata);

                                var FlowerCodeName = "[" + orddet.Flower + "] " + orddet.NAME;
                                $("#txtFlower_FutureOrderDetail1").val(FlowerCodeName);
                                $("#txtFlower_FutureOrderDetail1").attr("placeholder", FlowerCodeName);
                                $("#txtUnitsPerBox_FutureOrderDetail1").val(orddet.Units);
                                $("#txtUnitsPerBox_FutureOrderDetail1").attr("placeholder", orddet.Units);
                                $("#txtQty_FutureOrderDetail1").val(orddet.Boxes);
                                $("#txtQty_FutureOrderDetail1").attr("placeholder", orddet.Boxes);
                                $("#hfFlower_FutureOrderDetail1").val(orddet.Flower);
                                $("#hfFlowerName_FutureOrderDetail1").val(orddet.NAME);
                                $("#txtPrice_FutureOrderDetail1").val(orddet.Price.toFixed(4));
                                $("#txtPrice_FutureOrderDetail1").attr("placeholder", orddet.Price.toFixed(4));
                                $("#txtCost_FutureOrderDetail1").val(orddet.Cost.toFixed(4));
                                $("#txtCost_FutureOrderDetail1").attr("placeholder", orddet.Cost.toFixed(4));
                                $("#txtNotes_FutureOrderDetail1").val(orddet.Notes);
                                $("#txtBoxCode_FutureOrderDetail1").val(orddet.BoxCode);
                                $("#lstFarm_FutureOrderDetail1").val(orddet.FarmCode);
                                $("#hfFarm_FutureOrderDetail1").val(orddet.FarmCode);
                                $("#lstUOM_FutureOrderDetail1").val(orddet.UOM);
                                $("#hfUOM_FutureOrderDetail1").val(orddet.UOM);
                                $("#ctl00_DivHeight").html("500");
                                $("#lblPODflower_FutureOrder").html("");
                                $("#lblPODate_FutureOrder").html("");
                                $("#lblPOBoxnum_FutureOrder").html("");
                                $("#lblShipdate_FutureOrder").html("");
                                $("#txtFlower_FutureOrderDetail1").removeAttr("disabled");
                                $("#txtUnitsPerBox_FutureOrderDetail1").removeAttr("disabled");
                                $("#txtQty_FutureOrderDetail1").removeAttr("disabled");
                                $("#lstFarm_FutureOrderDetail1").removeAttr("disabled");
                                $("#lstUOM_FutureOrderDetail1").removeAttr("disabled");
                                $("#trPODetail").css('display', 'none');
                                if (orddet.Price == 0 || orddet.Cost == 0) {
                                    $("#txtGPM_FutureOrderDetail1").val(0);
                                } else {
                                    let gpm = ((orddet.Price - orddet.Cost) / orddet.Price) * 100;
                                    $("#txtGPM_FutureOrderDetail1").val(gpm);
                                }
                                //console.log(orddet);
                                $("#txtUPC_FutureOrderDetail1").val(orddet.UPC);
                                $("#txtUPCPRICE_FutureOrderDetail1").val(orddet.UPCPRICE);
                                $("#txtDateCode_FutureOrderDetail1").val(orddet.DateCode);
                                
                                $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog("open");
                                $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog('option', 'title', 'Edit Future Order Detail');
                                $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog('option', 'height', $("#ctl00_DivHeight").html());
                            }
                        });

                    }
                }
            });
        }
        else {
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
                                if (lineFuelCustomer == "false") {
                                    $("#txtPlusFuel_AddOrderDetail").removeAttr("disabled");
                                    $("#txtPrice_AddOrderDetail").attr("disabled", "disabled");
                                }
                                else {
                                    $("#txtPlusFuel_AddOrderDetail").attr("disabled", "disabled");
                                    $("#txtPrice_AddOrderDetail").removeAttr("disabled");
                                }
                                $("#lblSQLIDs_AddOrderDetail").html(ID);
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
                                $("#lblAvailableQty_AddOrderDetail").html(orddet.AvailableBoxes);
                                $("#lstSaleType_AddOrderDetail").val(orddet.Type);
                                $("#txtSaleType_AddOrderDetail").attr('placeholder', orddet.Type);

                                $("#txtBoxCode_AddOrderDetail").val(orddet.BoxCode);
                                $("#txtNewBoxCode_AddOrderDetail").val(orddet.BoxCode);

                                $("#txtStoreNo_AddOrderDetail").val(orddet.StoreNo);
                                $("#txtUpcCode_AddOrderDetail").val(orddet.UPC);
                                $("#txtDateCode_AddOrderDetail").val(orddet.DateCode);
                                $("#txtFlowerName_AddOrderDetail").val(orddet.NAME);

                                $("#lblFBE_AddOrderDetail").html(parseFloat(orddet.FBE).toFixed(3));
                                $("#lblDimensions_AddOrderDetail").html(orddet.BoxLength + "x" + orddet.BoxWidth + "x" + orddet.BoxHeight);
                                $("#lblCubes_AddOrderDetail").html(orddet.Cubes.toFixed(4));
                                $("#lblCost_AddOrderDetail").html(orddet.Cost);

                                var OrderDetailID = $("#ctl00_DivOrderDetailID_OrderSave").html();
                                var SQLId = $("#lblSQLIDs_AddOrderDetail").html();
                                if (OrderDetailID == "") {
                                    OrderDetailID = SQLId;
                                }

                                var existingOrderDetailID = OrderDetailID == "" ? "0" : OrderDetailID;
                                $("#AddOrderDetailFromInventoryDialog").dialog("open");
                                $("#AddOrderDetailFromInventoryDialog").dialog('option', 'title', 'Update Order Detail :: ' + existingOrderDetailID);

                            }
                            //else if (data.indexOf("NoBoxes") >= 0) {
                            //    $.MessageBox("No more Boxes to Update!");
                            //}
                            else if (data != "") {
                                var tmp = data.split("_")
                                $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + " !");
                            }
                            else {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                        },
                    });
                }
            });
        }
    });

    $("[id^=NewOrderDetailDelete_]").die("click").live("click", function () {
        var ID = $(this).attr('id').replace("NewOrderDetailDelete_", "").split("~")[0];
        var FlowerCode = $('#fgrdOrderNewDetails #row' + ID).find("td div").eq(3).text();
        var AWB = $('#fgrdOrderNewDetails #row' + ID).find("td div").eq(6).text().trim();
        if (FlowerCode == "ZFUEL") {
            if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person") {
                $("#Alertmsg").html("Sorry,... You don't have rights to Delete Fuel Charges");
                $("#Alertmsgbox").dialog("open");
                return false;
            }
        }
        //var ID = sourceCtl.attr('id').replace("NewOrderDetailDelete_", "").split("~")[0];
        var FlowerName = $('#fgrdOrderNewDetails #row' + ID).find("td div").eq(4).text(); // $("#NewOrderDetailName_" + ID).html();
        var Boxes = $("#NewOrderDetailBoxes_" + ID).html();
        if (Boxes.trim() == "") {
            Boxes = "0";
        }
        var Units = $("#NewOrderDetailUnits_" + ID).html();
        var UOM = $("#NewOrderDetailUOM_" + ID).html();
        $("#DivOrder").next('div').find('.msgui').hide();
        $('#DivOrder2SQLID_OrderNew').html(ID);
        DeleteInvenId = $("#NewOrderDetailInvenId_" + ID).html();
        var Type = $("#NewOrderDetailType_" + ID).html();
        var PODflower = $("#NewOrderDetailPODflower_" + ID).html();
        if (DeleteInvenId != 0 && DeleteInvenId != "") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/InsertLock',
                data: "{ 'LockRecord': '" + DeleteInvenId + "','Page':'PageOrderNew','Functionality':'InvenLock_Delete'}",
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
                        $("#DeleteNewOrderDetail").html("<p>Are you sure to delete the <b>" + Boxes + " " + UOM + "X" + Units + " " + FlowerName + "?</b></p>");
                        $("#DeleteNewOrderDetail").dialog("open");
                    }
                    else if (data != "") {
                        var tmp = data.split("_");
                        ClearLockedInventoryOnDelete(function (callback) {
                        });
                        $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + "! ");
                        $("#DeleteNewOrderDetail").dialog("close");
                    }
                    else {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        ClearLockedInventoryOnDelete(function (callback) {
                        });
                        $("#DeleteNewOrderDetail").dialog("close");
                    }
                }
            });
        }
        else if (DeleteInvenId == "" || DeleteInvenId == 0) {
            $("#DeleteNewOrderMiscDetail_NewOrder").html("<p>Are you sure to delete the <b>" + Boxes + " " + FlowerName + "?</b></p>");
            $("#DeleteNewOrderMiscDetail_NewOrder").dialog("open");
        }
        //else if ((DeleteInvenId == "" || DeleteInvenId == 0) && Type == "K" ) {
        //    $("#DeleteNewOrderMiscDetail_NewOrder").html("<p>Are you sure to delete the <b>" + Boxes + " " + FlowerName + "?</b></p>");
        //    $("#DeleteNewOrderMiscDetail_NewOrder").dialog("open");
        //}
        //else if ((DeleteInvenId == "" || DeleteInvenId == 0) && Type == "O" && PODflower == "" && AWB == "")//Future ORder Delete Add by Prashant on 04/02/2020        
        //{
        //    $("#DeleteNewOrderMiscDetail_NewOrder").html("<p>Are you sure to delete the <b>" + Boxes + " " + FlowerName + "?</b></p>");
        //    $("#DeleteNewOrderMiscDetail_NewOrder").dialog("open");
        //}
        else {
            // adialog.dialog("close");
            $.MessageBox("Invalid Inventory!");
        }
    });

    var PageOrderSaveAlreadyLoaded = false;

    function checkhasnegativeor0boxesInOrderNewScreen() {
        var isvalid = true;
        $("[id^=NewOrderDetailBoxes_").each(function () {
            var orderdetid = $(this).attr("id").replace("NewOrderDetailBoxes_", "");
            if (orderdetid != "0" && orderdetid != 0) {
                var boxes = $(this).html();
                if (parseFloat(boxes) <= 0) {
                    isvalid = false;
                }
            }
        });
        return isvalid;
    }

    $("#btnOrderNewDetailsSave").die("click").live("click", function () {
        CheckIfHasAnyFutureOrder();
        $("#messageOrSaveclicked_OrderSave").html("save");
        //var hasnegativeor0boxes = checkhasnegativeor0boxesInOrderNewScreen()
        //var hasnegativeor0boxes = checkhasnegativeor0boxesInOrderNewScreen()
        var hasnegativeor0boxes = true;

        if (hasnegativeor0boxes == true) {

            var CreditLimit = parseFloat($("#DivOrderNewDetailsDialog .lblAvailable1").html().replace(",", ""))

            if (CreditLimit < 0) { /*Credit limit is in Negative*/
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/CheckUsersOverrideCreditLimit',
                    data: '{"Customer":"' + $("#CurrentCustomerNo").html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        var OverrideCreditLimit = output.d;
                        if (OverrideCreditLimit == "Y") {
                            IsCreditOverLimit = false;
                            OrderNewDetailsSaveBtn();
                        }
                        else if (OverrideCreditLimit == "N") {
                            IsCreditOverLimit = true;
                            $("#msgbox-CreditLimitWarning").dialog("open").data("checkFrom", "SAVE");
                            $("#msghtml-CreditLimitWarning").html("Customer over credit limit !!! <br> Please get approval from your Supervisor.");
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    },
                    onError: function (xhr, status, errorThrown) {
                        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                            window.location.href = "Login.aspx";
                        }
                    }
                });
            }
            else {
                IsCreditOverLimit = false
                OrderNewDetailsSaveBtn()
            }
        }
        else {
            $.MessageBox("Boxes cannot be 0 or less than 0. Unable to save this order!!!");
        }
    });

    function CheckIfHasAnyFutureOrder() { // added by Belal 14 Aug 2020
        $("#CargoDateRow").hide();
        var awb = "";
        var po = ""
        var showCargo = false;
        var table = $("#fgrdOrderNewDetails tbody");
        var tbodyRowCount = table.find('tr').length - 1;
        table.find('tr').each(function (i, el) {
            var $tds = $(this).find('td');
            if (i < tbodyRowCount && $tds.eq(6).text().trim() == "" && $tds.eq(13).text().trim() != "K") {
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
                var d2 = new Date(); //today
                if (output.d == "01/01/1900" || output.d == "1/1/1900") {
                    var d = new Date($("#txtShippingDate_Or1").val());
                    d.setDate(d.getDate() - 3)
                    if (d2 > d) {
                        $("#txtCargoDate_Or1").val(d2.toLocaleDateString("en-US"));
                    } else {
                        $("#txtCargoDate_Or1").val(d.toLocaleDateString("en-US"));
                    }
                } else {
                    var d3 = new Date(output.d);// exiting cargoDate
                    if (d2 > d3) {
                        $("#txtCargoDate_Or1").val(d2.toLocaleDateString("en-US"));
                    } else {
                        $("#txtCargoDate_Or1").val(d3.toLocaleDateString("en-US"));
                    }
                }
            }
        });
    }
    function OrderNewDetailsSaveBtn() {

        if ($("#fgrdOrderNewDetails tr").length > 0) {
            $("#IncludeMessageConfirmDlg").dialog("open");
            if (SaveClickedFirstTime == false) {
                $("#txtCutOfftime_Or1").val("");
                $("#txtAWB_Or1").val("");
                $("#txtCustMsg1").val("");
                $("#txtCustMsg2").val("");
                $("#txtCustMsg3").val("");
                $("#txtCustMsg4").val("");
                $("#txtCustMsg5").val("");
                $("#txtShipMsg1").val("");
                $("#txtShipMsg2").val("");
                $("#txtShipMsg3").val("");
                $("#txtShipMsg4").val("");
                $("#txtShipMsg5").val("");
                $("#txtCustPO_Or1").val("");
                SaveClickedFirstTime = true;
            }

        }
        else {
            $("#DivOrderNewDetailsDialog").dialog("close");
        }
    }

    $("#btnOrderNewDetailsMessage").die("click").live("click", function () {
        $("#messageOrSaveclicked_OrderSave").html("message");
        if (SaveClickedFirstTime == false) {
            $("#txtCutOfftime_Or1").val("");
            $("#txtAWB_Or1").val("");
            $("#txtCustMsg1").val("");
            $("#txtCustMsg2").val("");
            $("#txtCustMsg3").val("");
            $("#txtCustMsg4").val("");
            $("#txtCustMsg5").val("");
            $("#txtShipMsg1").val("");
            $("#txtShipMsg2").val("");
            $("#txtShipMsg3").val("");
            $("#txtShipMsg4").val("");
            $("#txtShipMsg5").val("");
            $("#txtCustPO_Or1").val("");
            SaveClickedFirstTime = true;
            $("#DivCustomerMessageDialog").dialog("open");
        }
        else {
            $("#DivCustomerMessageDialog").dialog("open");
        }
    });

    $("#btnOrderNewDetailsTerms").die("click").live("click", function () {
        $("#DivTermsDialog_Ordersave").dialog("open");
    });

    $("#btnOrderNewDetailsShipto").die("click").live("click", function () {
        $("#DivShiptoDialog_Ordersave").data("inData", { isFromOrderNew: true }).dialog("open");
    });

    //$("#btnOrderNewDetailsSave").die("click").live("click", function () {
    //    if ($("#fgrdOrderNewDetails tr").length > 0) {
    //        
    //        if (PageOrderSaveAlreadyLoaded == false) {
    //            var para = 'Customer=' + $("#CurrentCustomerNo").html() + '&OrderNo=0';

    //            $.ajax({
    //                type: "POST",
    //                url: 'BloomService.asmx/GetPage',
    //                data: '{ "controlName":"pages/PageOrderSaveProcess.ascx","controlPara":"' + para + '" }',
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                success: function (output, status) {

    //                    $("#DivOrderSavePage").html("");
    //                    $("#DivOrderSavePage").html(output.d);
    //                    PageOrderSaveAlreadyLoaded = true;
    //                    SaveClickedFirstTime = true;

    //                    $("#txtCutOfftime_Or1").val("");
    //                    $("#txtAWB_Or1").val("");
    //                    $("#txtCustMsg1").val("");
    //                    $("#txtCustMsg2").val("");
    //                    $("#txtCustMsg3").val("");
    //                    $("#txtCustMsg4").val("");
    //                    $("#txtCustMsg5").val("");
    //                    $("#txtShipMsg1").val("");
    //                    $("#txtShipMsg2").val("");
    //                    $("#txtShipMsg3").val("");
    //                    $("#txtShipMsg4").val("");
    //                    $("#txtShipMsg5").val("");
    //                    $("#txtCustPO_Or1").val("");
    //                    $("#DivCustomerMessageDialog").dialog("open");
    //                }
    //            });
    //        }
    //        else {
    //            if (SaveClickedFirstTime == false) {


    //                $("#txtCutOfftime_Or1").val("");
    //                $("#txtAWB_Or1").val("");
    //                $("#txtCustMsg1").val("");
    //                $("#txtCustMsg2").val("");
    //                $("#txtCustMsg3").val("");
    //                $("#txtCustMsg4").val("");
    //                $("#txtCustMsg5").val("");
    //                $("#txtShipMsg1").val("");
    //                $("#txtShipMsg2").val("");
    //                $("#txtShipMsg3").val("");
    //                $("#txtShipMsg4").val("");
    //                $("#txtShipMsg5").val("");
    //                $("#txtCustPO_Or1").val("");
    //                SaveClickedFirstTime = true;
    //            }
    //            $("#ctl00_DivCustomerNo_OrderSave").html($("#CurrentCustomerNo").html());
    //            $("#ctl00_DivOrderNo_OrderSave").html(0);
    //            $("#DivCustomerMessageDialog").dialog("open");
    //        }
    //    }
    //    else {
    //        $("#DivOrderNewDetailsDialog").dialog("close");
    //    }

    //});

    $("#DeleteNewOrderDetail").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var ID = $("#DivOrder2SQLID_OrderNew").html();
                var OrderNo = 0;
                var CustomerNo = $("#CurrentCustomerNo").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteOrderDetail',
                    data: '{"ID":"' + ID + '","OrderNo":"' + OrderNo + '","Customer":"' + CustomerNo + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'success') {
                            ClearLockedInventoryOnDelete(function (callback) {
                            });
                            adialog.dialog("close");
                            $("#DeleteNewOrderDetail .lblAvailable1").html(addCommas(parseFloat(OldAvailable).toFixed(2)));
                            $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            adialog.dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            },
            No: function () {
                ClearLockedInventoryOnDelete(function (callback) {
                });
                $(this).dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')
        },
        close: function () {
            ClearLockedInventoryOnDelete(function (callback) {
            });
        }
    });

    $("#DeleteNewOrderMiscDetail_NewOrder").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Yes: function () {
                var adialog = $(this);
                var ID = $("#DivOrder2SQLID_OrderNew").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/DeleteOrderMiscDetail',
                    data: '{"ID":"' + ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == 'Success') {
                            adialog.dialog("close");
                            $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
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

    function ClearLockedInventoryOnDelete(callback) {
        if (DeleteInvenId != 0 && DeleteInvenId != "") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteLock',
                data: "{ 'LockRecord': '" + DeleteInvenId + "','Page':'PageOrderNew','Functionality':'InvenLockRelease'}",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: "json",
                success: function (output, status) {
                    var data = output.d;
                    DeleteInvenId = 0;
                    callback(true);
                },
            });
        }
        else {
            callback(true);
        }
    }


    //$("#lstCARRIER_Or1").click(function () {
    //    $("#txtCutOfftime_Or1").focus();
    //});

    //$('#CustAlertmsgbox').live("dialogclose", function () {
    //    
    //    //code to run on dialog close
    //    if ($(".lblCreditHold").html().trim() == "Y" || $(".lblTermCode").html().trim() == "X") {
    //        $("#txtCustSearch").val("");
    //        $("#DivOrderNewDetailsDialog").dialog('close');
    //    }
    //});

    //'Muthu Nivetha M :: 18 Mar 19 ::  Locks up system :: Sales-Person
    $("#CustAlertmsgbox").dialog({
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
        },
        close: function () { //18 Mar 19 ::  Locks up system :: Sales-Person

            $("#DivOrderNewDetailsDialog").dialog("close");
        }
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

    $("#IncompleteOrderAlertmsgbox").dialog({
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
        },
        close: function () {
            $("#DivOrderNewDetailsDialog").dialog("close");
        }
    });

    /*Continue and Cancel for credit limit approval of the customer :: Abinaya :: 15Feb2019 */
    $("#msgbox-CreditLimitWarning").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 400,
        modal: true,
        buttons: {
            Continue: function () {

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/CheckApprovedForCustomer',
                    data: '{"Customer":"' + $("#CurrentCustomerNo").html() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        var Approved = output.d
                        var checkFrom = $("#msgbox-CreditLimitWarning").data("checkFrom");
                        if (Approved.toLowerCase() == "yes") {/*Customer has Approved=Y*/
                            if (checkFrom.toLowerCase() == "add") {   /* proceed for new order creation */
                                $("#InventoryListForOrderEntryDialog").dialog("open");
                            }
                            else if (checkFrom.toLowerCase() == "save") { /* proceed for new order save process */
                                OrderNewDetailsSaveBtn();
                            }
                            $("#msgbox-CreditLimitWarning").dialog("close");
                        }
                        else if (Approved.toLowerCase() == "no") {
                            /*Don't do anything... Stay on the warning box*/
                        }
                        else {
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    },
                    onError: function (xhr, status, errorThrown) {
                        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                            window.location.href = "Login.aspx";
                        }
                    }
                });
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },

        open: function () {
            $(".ui-dialog-buttonpane button:contains('Continue')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#btnOrderNewDetailsAdd").die('click').live('click', function () {
        //DialogOpenCallforNewOrder();
        $("#ctl00_DivOrderNo_OrderSave").html(0);

        /*Check credit limit and permission to create the order :: Abinaya :: 15Feb2019*/
        //var AddCreditLimitsApprovalDivID = $("#CustCurrentDivID").html();
        var CreditLimit = parseFloat($("#DivOrderNewDetailsDialog .lblAvailable1").html().replace(",", ""))
        if (CreditLimit < 0) { /*Credit limit is in Negative*/
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/CheckUsersOverrideCreditLimit',
                data: '{"Customer":"' + $("#CurrentCustomerNo").html() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    var OverrideCreditLimit = output.d;
                    if (OverrideCreditLimit == "Y") {
                        IsCreditOverLimit = false;
                        if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person" || $("#ctl00_LoggedInUserType").html() == "credit manager" || $("#ctl00_LoggedInUserType").html() == "employee") {
                            if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person" && $("#ctl00_LoggedInUserType_SalesPersonName").html() == "sari@espritmiami.com") {
                                $("#btnOrderInventoryPrebooks").show();
                            }
                            //var Filter = "";
                            //var inventoryaccess = $("#ctl00_DivpgOdrnewInventoryAccessTypes").html();
                            //inventoryaccess = ((inventoryaccess != undefined || inventoryaccess != null) ? inventoryaccess.toString().toLowerCase() : "");
                            //var defaultflag = ("'M'" + "," + "'*'");
                            //if (inventoryaccess != "") {
                            //    var defflag = "";
                            //    defflag = defaultflag.replace(/'/g, '');
                            //    var dflagarr = [];
                            //    dflagarr = defflag.split(',')
                            //    for (index = 0; index < dflagarr.length; index++) {
                            //        var temp = dflagarr[index];
                            //        if (inventoryaccess.toLowerCase().includes(temp.toLowerCase())) {
                            //            defaultflag = "";
                            //            defaultflag = ($("#ctl00_DivpgOdrnewtbltype").html() == "" ? '*' : ("'" + $("#ctl00_DivpgOdrnewtbltype").html() + "'," + "'*'"));
                            //        }
                            //    }
                            //}

                            //var Filter = "Flag in (" + defaultflag + ")";
                            //ApplyfilterForInventoryList(Filter, "Flag")
                            qtypeload = 2;
                            IsSalesPerson = true;
                        }
                        $("#InventoryListForOrderEntryDialog").dialog("open");
                    }
                    else if (OverrideCreditLimit == "N") {
                        IsCreditOverLimit = true;
                        $("#msgbox-CreditLimitWarning").dialog("open").data("checkFrom", "ADD");
                        $("#msghtml-CreditLimitWarning").html("Customer over credit limit !!! <br> Please get approval from your Supervisor.");
                    }
                    else {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                    }
                },
                onError: function (xhr, status, errorThrown) {
                    if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                        window.location.href = "Login.aspx";
                    }
                }
            });
        }
        else {
            IsCreditOverLimit = false;
            if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person" || $("#ctl00_LoggedInUserType").html() == "credit manager" || $("#ctl00_LoggedInUserType").html() == "employee") {
                if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person" && $("#ctl00_LoggedInUserType_SalesPersonName").html() == "sari@espritmiami.com") {
                    $("#btnOrderInventoryPrebooks").show();
                }
                //var inventoryaccess = $("#ctl00_DivpgOdrnewInventoryAccessTypes").html();
                //inventoryaccess = ((inventoryaccess != undefined || inventoryaccess != null) ? inventoryaccess.toString().toLowerCase() : "");
                //var defaultflag = ("'M'" + "," + "'*'");
                //if (inventoryaccess != "") {
                //    var defflag = "";
                //    defflag = defaultflag.replace(/'/g, '');
                //    var dflagarr = [];
                //    dflagarr = defflag.split(',')
                //    for (index = 0; index < dflagarr.length; index++) {
                //        var temp = dflagarr[index];
                //        if (inventoryaccess.toLowerCase().includes(temp.toLowerCase())) {
                //            defaultflag = "";
                //            defaultflag = ($("#ctl00_DivpgOdrnewtbltype").html() == "" ? '*' : ("'" + $("#ctl00_DivpgOdrnewtbltype").html() + "'," + "'*'"));
                //        }
                //    }
                //}
                //var Filter = "Flag in (" + defaultflag + ")";
                //ApplyfilterForInventoryList(Filter, "Flag")
                qtypeload = 2;
                IsSalesPerson = true;
            }
            $("#InventoryListForOrderEntryDialog").dialog("open");
        }
    });
    $("#btnOrderNewDetailsXFuture").die('click').live('click', function () {
        if ($("#ctl00_DivShortKeyFlag").html() == "0" || $("#ctl00_DivShortKeyFlag").html() == "") {
            $("#ctl00_DivShortKeyFlag").html("1");
            $("#txtFlower_FutureOrderDetail1").val("");
            $("#txtFlower_FutureOrderDetail1").attr("placeholder", "");
            $("#txtUnitsPerBox_FutureOrderDetail1").val("");
            $("#txtUnitsPerBox_FutureOrderDetail1").attr("placeholder", "0");
            $("#txtQty_FutureOrderDetail1").val("");
            $("#txtQty_FutureOrderDetail1").attr("placeholder", "0");
            $("#hfFlower_FutureOrderDetail1").val("");
            $("#hfFlowerName_FutureOrderDetail1").val("");
            $("#txtPrice_FutureOrderDetail1").val("");
            $("#txtPrice_FutureOrderDetail1").attr("placeholder", "0.000");
            $("#txtNotes_FutureOrderDetail1").val("");
            $("#txtBoxCode_FutureOrderDetail1").val("");

            $("#lblPODflower_FutureOrder").html("");
            $("#lblPODate_FutureOrder").html("");
            $("#lblPODate_FutureOrder").html("");
            $("#lblPOBoxnum_FutureOrder").html("");
            $("#lblShipdate_FutureOrder").html("");
            $("#ctl00_DivOrderDetailID_OrderSave").html("0");
            $("#ctl00_DivHeight").html("380");
            $(".YellowWarning").hide();
            $(".YellowWarning").html("");
            $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog("open");
            $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog('option', 'height', $("#ctl00_DivHeight").html());
        }
    });


    $("#btnOrderNewDetailsNotes").die('click').live('click', function () {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustomerComments',
            data: "{'Customer': " + $("#CurrentCustomerNo").html() + "}",
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
                                    data: "{'Customer': '" + $("#CurrentCustomerNo").html() + "','Comments':'" + escape($("#txtCustomerComments").val()) + "'}",
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

    //Muthu Nivetha M :: 03Mar2020 :: Added :: Added F3 functions to show 13months of sales for Selected Customer
    //Region 'F3'

    $("#btnOrderNewDetailsF3").die('click').live('click', function () {
        $("#DivOrderNewF3Details").dialog('option', 'title', 'Order Entry');
        $("#DivOrderNewF3Details").dialog("open");
        //var selectedcust = $("#CurrentCustomerNo").html();
        //$("#fgrdOrderNewF3Details").flexOptions({ params: [{ name: 'SelectedCust', value: selectedcust },  { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
    });

    $("#DivOrderNewF3Details").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 800,
        height: 580,
        modal: true,
        open: function () {
            var selectedcust = $("#CurrentCustomerNo").html();
            $("#fgrdOrderNewF3Details").flexOptions({ params: [{ name: 'SelectedCust', value: selectedcust }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
        }
    });

    $("#fgrdOrderNewF3Details").flexigrid({
        url: 'BloomService.asmx/LoadF3SalesDetailsForSelectedCust',
        dataType: 'xml',
        colModel: [
            { display: 'PRODUCT', name: 'FLOWER', width: 80, sortable: true, align: 'left' },
            { display: 'NAME', name: 'FLOWERNAME', width: 250, sortable: true, align: 'left' },
            { display: 'FARM', name: 'FARM', width: 35, sortable: true, align: 'left' },
            { display: 'DATE', name: 'DATE1', width: 50, sortable: true, align: 'left' },
            { display: 'BOXES', name: 'BOXES', width: 60, sortable: false, align: 'left' },
            { display: 'PRICE', name: 'PRICE', width: 50, sortable: false, align: 'right' },
            { display: 'COST', name: 'COST', width: 50, sortable: false, align: 'right' },
            { display: '%GPM', name: 'GPM', width: 60, sortable: true, align: 'right' },
            { display: 'INVOICE', name: 'INVOICE', width: 40, sortable: false, align: 'right', hide: true }
        ],
        searchitems: [
            { display: 'PRODUCT', name: 'FLOWER' },
            { display: 'NAME', name: 'FLOWERNAME' },
            { display: 'FARM', name: 'FARM' },
            { display: 'DATE', name: 'DATE1' },
            { display: '%GPM', name: 'GPM' }
        ],
        showTableToggleBtn: true,
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
        width: 785,
        height: 450,
        striped: true,
        params: [
            { name: 'SelectedCust', value: $("#CurrentCustomerNo").html() },
            { name: 'ExportCSV', value: '' }
        ],
        onSuccess: function () {

            var sel = jQuery("#fgrdOrderNewF3Details tbody tr");
            var len = sel.length;
            if (len > 1) {
                $("#DivOrderNewF3Details #ExportCSV").show();
            }

            // $('#fgrdOrderNewF3Details #row0').addClass("TotalRows");
            $("#DivOrderNewF3Details .sDiv").css('float', 'left').css('width', '542px');
            $('#DivOrderNewF3Details .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#DivOrderNewF3Details .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivOrderNewF3Details .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivOrderNewF3Details .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });
    //End - Region 'F3'

    $("#btnOrderNewDetailsPrices").die("click").live("click", function () {
        //reloadspord("V");
         $("#OrderNewYN").html("Y")
        var Customer = $("#CurrentCustomerNo").html();
        isPricelstExistForCust = false;
        LoadViewSPORDByPriceGrid(Customer);
    });
    function LoadViewSPORDByPriceGrid(Customer) {
        $("#hdnPageOrderNewCustId").val(Customer)
        $("#fgrdViewSPORDByPrice").flexigrid({
            url: 'BloomService.asmx/GetViewSPORDByPriceGrid',
            dataType: 'xml',
            colModel: [

                { display: '', name: 'Delete', width: 13, sortable: false, align: 'center' },
                { display: '', name: 'Edit', width: 15, sortable: false, align: 'center' },
                { display: 'Cust#', name: 'Customer', width: 30, sortable: true, align: 'left', process: PriceForF8AddClick, hide: true },
                { display: 'Product', name: 'idproduct', width: 60, sortable: true, align: 'left', process: PriceForF8AddClick, hide: true },
                { display: 'Flower', name: 'Flower', width: 85, sortable: true, align: 'left', process: PriceForF8AddClick, hide: true },
                { display: 'Product Name', name: 'Name', width: 220, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: 'Quantity', name: 'Quantity', width: 50, sortable: true, align: 'right', process: PriceForF8AddClick },
                { display: 'Uom', name: 'Uom', width: 40, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: 'Units', name: 'units', width: 40, sortable: true, align: 'right', process: PriceForF8AddClick },
                { display: 'U/B', name: 'unitsperbunch', width: 30, sortable: true, align: 'right', title: 'Units Per Bunch', process: PriceForF8AddClick },
                { display: 'Price', name: 'Price', width: 65, sortable: true, align: 'right', process: PriceForF8AddClick },
                { display: 'Soldas', name: 'soldas', width: 35, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: 'UPC', name: 'UPC', width: 95, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: 'BoxCode', name: 'BoxCode', width: 95, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: 'UPCPRICE', name: 'UpcPrice', width: 120, sortable: true, align: 'left', process: PriceForF8AddClick },
                { display: '', name: '', width: 5, sortable: true, align: 'left', process: PriceForF8AddClick, hide: true }
            ],
            searchitems: [
                { display: 'Cust#', name: 'Customer' },
                { display: 'BoxCode', name: 'BoxCode' },
            ],
            showTableToggleBtn: true,
            sortname: "ID",
            sortorder: "asc",
            usepager: true,
            title: false,
            useRp: true,
            qtype: "ID",
            nomsg: 'No records found!',
            singleSelect: true,
            showToggleBtn: false,
            resizable: false,
            autoload: true,
            showTableToggleBtn: false,
            params: [
                { name: 'Customer', value: $("#hdnPageOrderNewCustId").val() },
                { name: 'ExportCSV', value: '' }
            ],
            height: $(window).height() - 180,
            width: (isPricelstExistForCust) ? "785" : "890",
            striped: true,
            onSuccess: function () {
                $("#fgrdViewSPORDByPrice tr:first").addClass("trSelectedCheck");
                $("#DivSelectedSPORDPriceID").html($("#fgrdViewSPORDByPrice tr:first").attr('id').replace('row', ''));

                var sel = jQuery("#fgrdViewSPORDByPrice tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#divViewSPORDByPrice #ExportCSV").show();
                    $("#btnSPORDBuild").hide()
                }
                else {
                    $("#btnSPORDBuild").show()
                }
                //For to show the error
                if ($("#fgrdViewSPORDByPrice tr#row-2").length > 0) {
                    $("#fgrdViewSPORDByPrice tr#row-2").hide();
                    $.MessageBox($("#fgrdViewSPORDByPrice tr#row-2")[0].innerText);
                    return false;
                }
                $('#fgrdViewSPORDByPrice #row0').addClass("TotalRows");
                if (!isPricelstExistForCust && ($("#DivViewSPORDByPriceDialog").dialog('isOpen') == true)) {
                    changegridColByF8Price(true);
                }
                else {
                    changegridColByF8Price(false);
                }
                $("#divViewSPORDByPrice .flexigrid").css('width', isPricelstExistForCust ? '785px' : '890px');

            },
            onError: function (xhr, status, errorThrown) {
                if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                    $.MessageBox("OOPS!!! Please try after some time..");
                }
            }
        });
        if (isPricelstExistForCust) {
            $("#divViewSPORDByPrice .sDiv").css('float', 'left').css('width', '545px').hide();
        }
        else {
            $("#divViewSPORDByPrice .sDiv").css('float', 'left').css('width', '545px').show();
        } 
        if ($('#fgrdViewSPORDByPrice tr').length > 0) {
                 $("#btnSPORDBuild").hide()
            }
            else {
                 $("#btnSPORDBuild").show()
            }
         var sel = jQuery("#fgrdViewSPORDByPrice tbody tr");
                var len = sel.length;
                if (len >= 1) {
                    $("#btnSPORDBuild").hide()
                }
                else {
                     $("#btnSPORDBuild").show()
                }
        $('#divViewSPORDByPrice .pDiv').css('padding', '2px').css('border-left', '0px');
        $('#divViewSPORDByPrice .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
        $("#divViewSPORDByPrice .pDiv").find(".pDiv2").find(".btnseparator").hide();
        $("#divViewSPORDByPrice .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
        $("#DivViewSPORDByPriceDialog").dialog("open");
    }
    $("[id^=F8PriceEdit_]").die("click").live("click", function () {
        SpordPID = $(this).attr("id").replace("F8PriceEdit_", "").trim();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/GetSPORDEditPriceDetails",
            data: "{'SpordID':'" + SpordPID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (output, status) {
                isSPORDPriceeditclicked = true;
                res = output.d;
                $("#txtSPORDPriceCust").val(res[0].Customer);
                $("#txtSPORDPriceQTY").val(res[0].Quantity);
                $("#txtSPORDPriceUnits").val(res[0].units);
                $("#txtSPORDPriceUnitsBunch").val(res[0].unitsperbunch);
                $("#txtSPORDPrice_Price").val(res[0].Price);
                $("#txtSPORDPriceSoldas").val(res[0].soldas);
                $("#txtSPORDPriceUPC").val(res[0].UPC);
                $("#txtSPORDPriceBoxCode").val(res[0].BoxCode);
                $("#txtSPORDPriceGTIN").val(res[0].GTIN);
                $("#hfSPORDPriceFlower").val(res[0].FlowerDetails.Flower);
                $("#hfSPORDPriceFlowerName").val(res[0].FlowerDetails.Name);
                $("#hfSPORDPriceFlowerID").val(res[0].idproduct)
                $("#txtSPORDPriceFlower").val("[" + res[0].FlowerDetails.Flower + "]" + res[0].FlowerDetails.Name);
                $("#hfSPORDPriceUOM").val(res[0].Uom);
                LoadPriceUOM(function (callback) { });
                $("#SPORDPriceDialog").dialog('option', 'title', "SPORD Price Edit");
                $("#SPORDPriceDialog").data("SPORDEditData", { SpordID: SpordSqlID }).dialog("open");
            }
        });
    });

    $("[id^=F8PriceDelete_]").die("click").live("click", function () {
        if ($("#ctl00_LoggedInUserType").html().toLowerCase() == "JOSEDIAZ") {
            $("#msgsavehtml").html("You don't have rights to delete SPORD details.");
            $("#msgbox-save").dialog("open");
        }
        else {
            PSpordID = $(this).attr("id").replace("F8PriceDelete_", "").trim();
            $("#SPORDPRICEDel").html("Are you sure you want to delete?");
            $("#msgbox-SPORDPRICEDel").data("inData", { PSPORDID: PSpordID }).dialog("open");
        }
    });
     $("#msgbox-SPORDPRICEDel").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        height: 150,
        width: 400,
        buttons: {
            Yes: function () {
                $(this).dialog("close");
                var DELSpordID = $("#msgbox-SPORDPRICEDel").data("inData")["PSPORDID"]
                $.ajax({
                    type: "POST",
                    url: "BloomService.asmx/DeleteSPORDPRICEDetails",
                    data: "{'SpordID':'" + DELSpordID + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        res = output.d;
                        if (output.d == "success") {

                            $("#row" + DELSpordID).remove();
                            // $("#DivSelectedSPORDID").html("");
                            $("#fgrdViewSPORDByPrice").flexReload({ url: '/url/for/refresh' });
                            $("#msgbox-SPORDPRICEDel").dialog("close");
                        }
                    }
                });
            },
            No: function () {
                $(this).dialog("close");
            },
        },
        open: function (e) {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
            $(this).siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
        }
    });
     $("#SPORDPriceDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "SPORD PRICE Add",
        modal: true,
        //closeOnEscape: false,
        width: 650,
        buttons: {
            Save: function () {
                SaveUpdateSpordPrice();
            },
            Close: function () {
                $(this).dialog("close");
            },
        },
        open: function () {
            LoadPriceUOM(function (callback) { });
            //var cust = $("#ctl00_DivCurrentCustomer_SPORD").html()
            //$("#txtSPORDPriceCust").val(cust)
            $("#txtSPORDPriceFlower").focus();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });
     $("#btnSPORDPriceAdd").die("click").live("click", function () {
        clearSPORDPRICEDetails();
        isSPORDPriceeditclicked = false;
        $("#SPORDPriceDialog :input").prop("disabled", false);
        $("#SPORDPriceDialog").css("pointer-events", "visible");
        $("#SPORDPriceDialog").dialog('option', 'title', "SPORD PRICE Add");
        $("#SPORDPriceDialog").dialog("open");
    });
     function clearSPORDPRICEDetails() {
        $("#txtSPORDPriceFlower").val("");
        $("#hfSPORDPriceFlowerID").val("");
        $("#hfSPORDPriceFlower").val("");
        $("#hfSPORDPriceFlowerName").val("");
        $("#txtSPORDPriceQTY").val("");
        $("#txtSPORDPriceQTY").attr('placeholder', '');
        $("#txtSPORDPriceUnits").val("");
        $("#txtSPORDPriceUnits").attr('placeholder', '0');
        $("#txtSPORDPriceUnitsBunch").val("");
        $("#txtSPORDPriceUnitsBunch").attr('placeholder', '0');
        $("#txtSPORDPrice_Price").val("");
        $("#txtSPORDPrice_Price").attr('placeholder', '0.0000');
        $("#txtSPORDPriceSoldas").val("");
        $("#txtSPORDPriceUPC").val("");
        $("#txtSPORDPriceBoxCode").val("");
        $("#txtSPORDPriceGTIN").val("");
    }
    $("#txtSPORDPriceFlower").autocomplete({
        source: function (request, response) {
            var Farm = "";
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFlowerEasyAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    response($.map(data.d, function (flr) {
                        return {
                            label: "[" + flr.Flower.trim() + "] " + flr.Name,
                            Flower: flr.Flower,
                            Name: flr.Name,
                            ID: flr.ID,
                            CAT: flr.CAT,
                            Bunch: flr.BUNCH,
                            ColorCode: flr.ColorCode,
                            UOM: flr.UOM,
                            UNITS: flr.UNITS,
                            Soldas: flr.FType.SOLDAS
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
            $("#txtSPORDPriceFlower").attr("placeholder", "");
            $("#lstSPORDPriceUOM").val(i.item.UOM);
            $("#txtSPORDPriceUnits").val(i.item.UNITS);
            $("#txtSPORDPriceUnitsBunch").val(i.item.Bunch);
            $("#hfSPORDPriceFlowerID").val(i.item.ID);
            $("#txtSPORDPriceFlower").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
            $("#hfSPORDPriceFlower").val(i.item.Flower.trim());
            $("#hfSPORDPriceFlowerName").val(i.item.Name.trim());
            $("#txtSPORDPriceSoldas").val("")
            $("#txtSPORDPriceSoldas").attr('placeholder', i.item.Soldas);
        },
        change: function (e, i) {
            if (i.item == null || i.item == undefined) {
                $("#txtSPORDPriceFlower").val("");
                $("#hfSPORDPriceFlower").val("");
                $("#hfSPORDPriceFlowerName").val("");
                $("#txtSPORDPriceSoldas").val("")
                $("#txtSPORDPriceSoldas").attr('placeholder', '');
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });
    function LoadPriceUOM(callback) {
        var Farm = "";
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUOMForSPORD',
            data: "{'FarmCode':'" + Farm + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    $('#lstSPORDPriceUOM').empty();
                    UOMList = [];
                    UOMList = output.d;
                    var UOMdata = output.d;
                    $('#lstSPORDPriceUOM').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstSPORDPriceUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM + '</option>');
                    }

                    if ($("#hfSPORDPriceUOM").val() != "" && $("#hfSPORDPriceUOM").val() != 0)
                        $('#lstSPORDPriceUOM').val($("#hfSPORDPriceUOM").val());
                    else
                        $("#hfSPORDPriceUOM").val("QB");
                }
                callback(true);
            }
        });
    }
    function SaveUpdateSpordPrice() {
        
        if (isSPORDPriceeditclicked == true) {
            var SpordPriceID = SpordPID
        }
        else {
            var SpordPriceID = "0"
        }
        var PCustomer = $("#CurrentCustomerNo").html();
        var PFlower = $("#hfSPORDPriceFlowerID").val()
        if ($("#txtSPORDPriceFlower").val() == "") {
            $("#msgSPORDhtml").html("Please select Flower");
            $("#msgbox-SPORD").dialog("open");
            IsAddEditShortcutKeyClick = false;
            $("#txtSPORDPriceFlower").focus();
            return;
        }
        var PQTY = (($("#txtSPORDPriceQTY").val() == "") ? $("#txtSPORDPriceQTY").attr('placeholder') : $("#txtSPORDPriceQTY").val());
        if (PQTY == "") {
            $("#msgSPORDhtml").html("Please enter Qty");
            $("#msgbox-SPORD").data("inData", { LastFocusId: "txtSPORDPriceQTY" }).dialog("open");
            $("#msgbox-SPORD").siblings('.ui-dialog-buttonpane').find("button:contains('Ok')").focus();
            IsAddEditShortcutKeyClick = false;
            return;
        }
        var PUOM = $('#lstSPORDPriceUOM').val().toUpperCase();
        var PUnits = (($("#txtSPORDPriceUnits").val() == "") ? $("#txtSPORDPriceUnits").attr('placeholder') : $("#txtSPORDPriceUnits").val());
        var PBunch = (($("#txtSPORDPriceUnitsBunch").val() == "") ? $("#txtSPORDPriceUnitsBunch").attr('placeholder') : $("#txtSPORDPriceUnitsBunch").val());
        var PSoldas = $("#txtSPORDPriceSoldas").val().toUpperCase();
        var PPrice = (($("#txtSPORDPrice_Price").val() == "") ? $("#txtSPORDPrice_Price").attr('placeholder') : $("#txtSPORDPrice_Price").val());
        var PUPC = $("#txtSPORDPriceUPC").val().toUpperCase();
        var PBoxcode = $("#txtSPORDPriceBoxCode").val().toUpperCase();
        var PGTIN = $("#txtSPORDPriceGTIN").val().toUpperCase();
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/SaveSPORDPRICEDetails",
            data: "{'SpordPriceID':'" + SpordPriceID + "','PCustomer':" + PCustomer + ",'PFlower':" + PFlower + ",'PQTY':" + PQTY + ",'PUOM':'" + PUOM + "','PUnits':" + PUnits + ",'PBunch':" + PBunch + ",'PSoldas':'" + PSoldas + "','PPrice':" + PPrice + ",'PUPC':'" + PUPC + "','PBoxcode':'" + PBoxcode + "','PGTIN':'" + PGTIN + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                
                var res = output.d;
                if (output.d != "error") {
                    $("#SPORDPriceDialog").dialog("close");
                    $("#fgrdViewSPORDByPrice").flexReload({ url: '/url/for/refresh' });
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }
    function PriceForF8AddClick(celDiv, id) {
        $(celDiv).click(function () {
            
            var isSPOrdrDialogOpened = false;
            debugger;
            $("#fgrdViewSPORDByPrice [id^=row]").removeClass("trSelectedCheck");
            $("#fgrdViewSPORDByPrice #row" + id).addClass("trSelectedCheck");
            if (isPricelstExistForCust) {
                if (isPriceClicked == false) {
                    isPriceClicked = true;
                    F8PriceIds.push(id);
                    SpordSqlID = "0";
                    var customerF8 = $("#F8PriceCust_" + id).html();
                    var idproductF8 = $("#F8PriceProdId_" + id).html();
                    var FlowerF8 = $("#F8PriceProdCode_" + id).html();
                    var NameF8 = $("#F8PriceProdName_" + id).html();
                    var QuantityF8 = $("#F8PriceQty_" + id).html();
                    var UomF8 = $("#F8PriceUOM_" + id).html();
                    var unitsF8 = $("#F8PriceUnits_" + id).html();
                    var unitsperbunchF8 = $("#F8PriceUBunch_" + id).html();
                    var PriceF8 = $("#F8PricePrice_" + id).html();
                    var soldasF8 = $("#F8PriceSoldas_" + id).html();
                    var UPCF8 = $("#F8PriceUPC_" + id).html();
                    var BoxCodeF8 = $("#F8PriceBoxCode_" + id).html();
                    var GTINF8 = $("#F8PriceGTIN_" + id).html();

                    if ($("#ctl00_LoggedInUserType_PageSPORD").html().toLowerCase() == "sales person") {
                        if (SPORDCopyClicked == true) {
                            res[0].Status = "Pe" //// Email:Esprit Dev Updates :: 15May19 :: Tasks
                            $("#SPORDAddEditDialog :input").prop("disabled", false);
                            J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.enable();
                            $("#SPORDAddEditDialog").css("pointer-events", "visible");
                        }
                        else {
                            $("#SPORDAddEditDialog :input").prop("disabled", true);
                            $("#SPORDAddEditDialog").css("pointer-events", "none");
                            J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.disable();
                            $("#txtSPORDEditPO").prop('disabled', false);
                            $("#txtSPORDEditPO").css("pointer-events", "visible");
                            $("#tdCarrier").css("pointer-events", "visible");
                            $("#tdShipto").css("pointer-events", "visible");
                            $("#tdCarrier :input").prop('disabled', false);
                            $("#tdShipto :input").prop('disabled', false);
                        }
                    }

                    $("#SPORDAddEditDialog :input").prop("disabled", false);
                    J1_10($("#lstSPORDEditFarm")).selectize()[0].selectize.enable();
                    J1_10($("#lstSPORDEditStatus")).selectize()[0].selectize.enable();
                    $("#SPORDAddEditDialog").css("pointer-events", "visible");
                    IsAddSPORDclicked = true;

                    if (loadingdropdownonSPORDCompleted == false) {
                        $("#msghtml-SPORDControlsLoading").html("Controls are loading. Please wait... <img src='images/ajax-loader.gif' />");
                        $("#msgbox-SPORDControlsLoading").dialog("open");
                    }
                    else {
                        clearSPORDDetails();
                        SpordSqlID = "0";
                    }

                    $("#txtSPORDEditQty").attr('placeholder', QuantityF8);
                    $("#txtSPORDEditUnits").attr('placeholder', unitsF8);
                    $("#txtSPORDEditBunch").attr('placeholder', unitsperbunchF8);
                    $("#txtSPORDEditFOB").attr('placeholder', parseFloat(PriceF8).toFixed(4));
                    $("#txtSPORDEditBoxCode").val(BoxCodeF8);
                    //$("#txtSPORDEditFarmPO").html(FlowerF8);
                    $("#txtSPORDEditUPC").val(UPCF8);
                    $("#txtSPORDEditSoldAs").val(soldasF8);

                    $("#hfSPORDEditUOM").val(UomF8);
                    LoadUOM(function (callback) { });

                    $("#hfSPORDEditFlower").val(FlowerF8);
                    $("#hfSPORDEditFlowerName").val(NameF8);

                    $("#txtSPORDFlower").val("[" + FlowerF8 + "]" + NameF8);
                    $("#hfSPORDFlower").val(FlowerF8);

                    $("#txtSPORDEditID").text("(ID " + SpordSqlID + ")");

                    isPricelstExistForCust = false;

                    isSPOrdrDialogOpened = true;

                    $("#DivViewSPORDByPriceDialog").dialog('close');
                    $("#SPORDAddEditDialog").dialog('option', 'title', "SPORD Add");
                    $("#SPORDAddEditDialog").data("inData", ({ isFrom: "F8Price" })).dialog("open");
                }
            }

            // if (!isSPOrdrDialogOpened || !isPricelstExistForCust) {
            if ($("#SPORDAddEditDialog").length === 0 || !$("#SPORDAddEditDialog").dialog('isOpen')) {
                $("#hdnPageOrderNewSelectedFlowerId").val(id)
                $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog("open");
                $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog('option', 'title', 'Add Future Product');
            }
        })
    }
    $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog({
        autoOpen: false,
        resizable: false,
        title: 'Add Future Product',
        width: 520,
        modal: true,
        buttons: {
            SAVE: function () {
                SaveFutureOrderDetail_PageOrderNew();
                $("#ctl00_DivShortKeyFlag").html("0");
                $("#hdnPageOrderNewSelectedFlowerId").val("")
            },
            CLOSE: function () {
                debugger;
                $("#txtFlower_FutureOrderDetail1").val("");
                $("#lstFarm_FutureOrderDetail1").val("");
                $("#hfFarm_FutureOrderDetail1").val("");
                $("#txtQty_FutureOrderDetail1").val(0);
                $("#lstUOM_FutureOrderDetail1").val("");
                $("#txtUnitsPerBox_FutureOrderDetail1").val(0);
                $("#txtPrice_FutureOrderDetail1").val(0);
                $("#txtCost_FutureOrderDetail1").val(0);
                $("#txtGPM_FutureOrderDetail1").val(0);
                $("#txtBoxCode_FutureOrderDetail1").val("");
                $("#txtUPC_FutureOrderDetail1").val("");
                $("#txtUPCPRICE_FutureOrderDetail1").val("");
                $("#txtDateCode_FutureOrderDetail1").val("");
                $("#txtNotes_FutureOrderDetail1").val("");
                $("#trPODetail").css('display', 'none');
                $("#ctl00_DivShortKeyFlag").html("0");

                $("#ctl00_DivPODflower_OrderSave").html("");
                $("#lblPODflower_FutureOrder").html("");
                $("#lblPODate_FutureOrder").html("");
                $("#lblPOBoxnum_FutureOrder").html("");
                $("#lblShipdate_FutureOrder").html("");
                $("#trPODetail").css('display', 'none');
                $("#ctl00_DivHeight").html("500");
                $("#ctl00_DivOrderDetailID_OrderSave").html("0");

                $("#txtFlower_FutureOrderDetail1").removeAttr("disabled");
                $("#txtUnitsPerBox_FutureOrderDetail1").removeAttr("disabled");
                $("#txtQty_FutureOrderDetail1").removeAttr("disabled");
                $("#lstFarm_FutureOrderDetail1").removeAttr("disabled");
                $("#lstUOM_FutureOrderDetail1").removeAttr("disabled");
                $("#txtNotes_FutureOrderDetail1").removeAttr("disabled");
                 $("#hdnPageOrderNewSelectedFlowerId").val("")
                $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog("close");
            },
        },
        open: function () {
            //LoadFarmList();
            $(".ui-dialog-buttonpane button:contains('SAVE')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');

            //var customerF8 = $("#F8PriceCust_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html();
            //var idproductF8 = $("#F8PriceProdId_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html();
            if ($("#hdnPageOrderNewSelectedFlowerId").val() != "") {
                LoadUOM_PageOrderNew();
                $("#hfFlower_FutureOrderDetail1").val($("#F8PriceProdCode_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());
                GetFarmListByFlower($("#hfFlower_FutureOrderDetail1").val());
                $("#hfFlowerName_FutureOrderDetail1").val($("#F8PriceProdName_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());
                $("#txtFlower_FutureOrderDetail1").val("[" + $("#F8PriceProdCode_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html() + "] " + $("#F8PriceProdName_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());
                $("#txtQty_FutureOrderDetail1").val($("#F8PriceQty_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());
                $("#lstUOM_FutureOrderDetail1").val($("#F8PriceUOM_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());
                $("#hfUOM_FutureOrderDetail1").val($("#F8PriceUOM_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());    /*Added By Anubhuti 12/10/2021 */           
                $("#txtUnitsPerBox_FutureOrderDetail1").val($("#F8PriceUnits_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html())
                //var unitsperbunchF8 = $("#F8PriceUBunch_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html();
                $("#txtPrice_FutureOrderDetail1").val($("#F8PricePrice_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html())
                //var soldasF8 = $("#F8PriceSoldas_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html();
                $("#txtUPC_FutureOrderDetail1").val($("#F8PriceUPC_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());
                $("#txtBoxCode_FutureOrderDetail1").val($("#F8PriceBoxCode_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());
                //var GTINF8 = $("#F8PriceGTIN_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html();
                //2021/08/14, empty date code before open the dialog
                $("#txtUPCPRICE_FutureOrderDetail1").val($("#F8PriceGTIN_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());
                //$("#txtUPCPRICE_FutureOrderDetail1").val($("#F8PriceUPCPRICE_" + $("#hdnPageOrderNewSelectedFlowerId").val()).html());
                $("#txtDateCode_FutureOrderDetail1").val("");
            
            }
            

        }
    });
    function GetFarmListByFlower(flower) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmListByFlower',
            data: "{'Flower':'"+flower+"'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFarm_FutureOrderDetail1').empty();
                var Typedata = output.d;
                $('#lstFarm_FutureOrderDetail1').append('<option value="">Select</option>');
                $('#lstFarm_FutureOrderDetail1').append(Typedata);
                //LoadUOM();
            }
        });
    }
    function LoadUOM_PageOrderNew() {
        var length = $('#lstUOM_FutureOrderDetail1 > option').length;
        var farmcode = $("#lstFarm_FutureOrderDetail1")[0].value;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetUOMForSPORD',
                data: '{"FarmCode":"' + farmcode.toUpperCase() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstUOM_FutureOrderDetail1').empty();
                    var UOMdata = output.d;
                    $('#lstUOM_FutureOrderDetail1').append('<option value="0">Select</option>');
                    for (var i in UOMdata) {
                        var UOM = UOMdata[i];
                        $('#lstUOM_FutureOrderDetail1').append('<option value="' + UOM.UOM + '">' + UOM.UOM + ' [' + UOM.SIZE + ']</option>');
                    }

                    if ($("#hfUOM_FutureOrderDetail1").val() != "" && $("#hfUOM_FutureOrderDetail1").val() != 0)
                        $('#lstUOM_FutureOrderDetail1').val($("#hfUOM_FutureOrderDetail1").val());
                    else
                        $("#lstUOM_FutureOrderDetail1").val("QB");
                }
            });
        }
        else {
            $('#lstUOM_FutureOrderDetail1').val($("#hfUOM_FutureOrderDetail1").val());
        }
    }
     function SaveFutureOrderDetail_PageOrderNew() {
        var QuantityEntered = (($("#txtQty_FutureOrderDetail1").val() == "") ? $("#txtQty_FutureOrderDetail1").attr('placeholder') : $("#txtQty_FutureOrderDetail1").val());
        debugger;
                $(".YellowWarning").hide();
                var FlowerCode = $("#hfFlower_FutureOrderDetail1").val();
                var FlowerName = $("#hfFlowerName_FutureOrderDetail1").val();
                var Farm = $("#lstFarm_FutureOrderDetail1").val();
                var UOM = $("#lstUOM_FutureOrderDetail1").val().toUpperCase();
                var Dimension = $("#lstUOM_FutureOrderDetail1 option:selected").text().split('['); 
                var DimLWH = Dimension[1].replace("]", "").split('x');    
                var OrderNo = ($("#OrderNewYN").html() == "N" ? $("#ctl00_DivOrderNo_OrderSave").html() : 0);
                var CustomerNo =  $("#CurrentCustomerNo").html();
                var UnitsPerBox = $("#txtUnitsPerBox_FutureOrderDetail1").val() == "" ? $("#txtUnitsPerBox_FutureOrderDetail1").attr('placeholder') : $("#txtUnitsPerBox_FutureOrderDetail1").val();
                var Price = (($("#txtPrice_FutureOrderDetail1").val() == "") ? $("#txtPrice_FutureOrderDetail1").attr('placeholder') : $("#txtPrice_FutureOrderDetail1").val());
                var Cost = (($("#txtCost_FutureOrderDetail1").val() == "") ? 0 : $("#txtCost_FutureOrderDetail1").val());
                var Type = "O";
                var OrderDetailID = ($("#hdnPageOrderNewSelectedFlowerId").val() == ""? $("#ctl00_DivOrderDetailID_OrderSave").html() : 0);
                var Notes = $("#txtNotes_FutureOrderDetail1").val();
                var BoxCodeNew = $("#txtBoxCode_FutureOrderDetail1").val().toUpperCase();
                var UPC = $("#txtUPC_FutureOrderDetail1").val().toUpperCase(); // Added by Belal :: 29 Aug 2020
                var UPCPRICE = $("#txtUPCPRICE_FutureOrderDetail1").val();
                var DateCode = $("#txtDateCode_FutureOrderDetail1").val().toUpperCase(); // Added by Belal :: 29 Aug 2020
                $(".YellowWarning").hide();
                //OrderDetailID,Order, Customer , Flower , Farm , Quantity , UOM , Price , Type , Units , UserName , UserID , BoxCode , Notes , Desc 
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddFutureOrderDetail',
                    async: false,
                    data: "{'OrderDetailID':'" + OrderDetailID + "','Order': '" + OrderNo + "','Customer': '" + CustomerNo + "','Flower': '" + FlowerCode + "','Farm':'" + Farm + "','Quantity': '" + QuantityEntered + "','UOM': '" + UOM
                        + "', 'Price': '" + Price + "', 'Cost': '" + Cost + "', 'Type': '" + Type + "', 'Units': '" + UnitsPerBox + "', 'BoxCode':'" + BoxCodeNew + "', 'UPC':'" + UPC + "', 'UPCPRICE':'" + UPCPRICE +"', 'DateCode':'" + DateCode + "', 'Notes':'" + Notes + "','Desc':'" + FlowerName + "','L':'" + DimLWH[0] + "','W':'" + DimLWH[1] + "','H':'" + DimLWH[2] + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        debugger;
                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d == 'success') {
                            if (OrderDetailID == "" || OrderDetailID == "0" || OrderDetailID == null)
                                $.growl.notice({ title: "Added!", message: "" });
                            else
                                $.growl.notice({ title: "Updated!", message: "" });

                            $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog("close");
                            $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                            $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });                            
                            $("#ctl00_DivOrderDetailID_OrderSave").html("0");
                        }
                        else {
                            $("#AddOrderDetailFromFutureDialog_PageOrderNew").dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
    }
    $('.enterKeyPressControl1').unbind('keydown').bind('keydown', function (e) { 
            var currentInputID = $(this).attr('id');
            if (e.keyCode == 13) {
                if (currentInputID == "txtFlower_FutureOrderDetail1") {
                    $("#lstFarm_FutureOrderDetail1").focus();
                } else if (currentInputID == "lstFarm_FutureOrderDetail1") {
                    $("#txtQty_FutureOrderDetail1").focus();
                } else if (currentInputID == "txtQty_FutureOrderDetail1") {
                    $("#lstUOM_FutureOrderDetail1").focus();
                } else if (currentInputID == "lstUOM_FutureOrderDetail1") {
                    $("#txtUnitsPerBox_FutureOrderDetail1").focus();
                } else if (currentInputID == "txtUnitsPerBox_FutureOrderDetail1") {
                    $("#txtPrice_FutureOrderDetail1").focus();
                } else if (currentInputID == "txtPrice_FutureOrderDetail1") {
                    $("#txtCost_FutureOrderDetail1").focus();
                } else if (currentInputID == "txtCost_FutureOrderDetail1") {
                    $("#txtBoxCode_FutureOrderDetail1").focus();
                } else if (currentInputID == "txtBoxCode_FutureOrderDetail1") {
                    $("#txtUPC_FutureOrderDetail1").focus();
                } else if (currentInputID == "txtUPC_FutureOrderDetail1") {
                    $("#txtUPCPRICE_FutureOrderDetail1").focus();
                } else if (currentInputID == "txtUPCPRICE_FutureOrderDetail1") {
                    $("#txtDateCode_FutureOrderDetail1").focus();
                }
                else if (currentInputID == "txtDateCode_FutureOrderDetail1") {
                    $("#txtNotes_FutureOrderDetail1").focus();
                }
            }else if (e.keyCode == 34) {
                if (currentInputID == "txtBoxCode_FutureOrderDetail1" || currentInputID == "txtUPC_FutureOrderDetail1" || currentInputID == "txtUPCPRICE_FutureOrderDetail1" || currentInputID == "txtDateCode_FutureOrderDetail1" || currentInputID == "txtNotes_FutureOrderDetail1") {
                    SaveFutureOrderDetail_PageOrderNew();
                }
            }
    });

     $('.enterKeyPressControl_SPORDPrice').on('keydown',function(e) { 
            var currentInputID = $(this).attr('id');
            if (e.keyCode == 13) {
                if (currentInputID == "txtSPORDPriceFlower") {
                    $("#txtSPORDPriceQTY").focus();
                } else if (currentInputID == "txtSPORDPriceQTY") {
                    $("#lstSPORDPriceUOM").focus();
                } else if (currentInputID == "lstSPORDPriceUOM") {
                    $("#txtSPORDPriceUnits").focus();
                } else if (currentInputID == "txtSPORDPriceUnits") {
                    $("#txtSPORDPriceUnitsBunch").focus();
                } else if (currentInputID == "txtSPORDPriceUnitsBunch") {
                    $("#txtSPORDPrice_Price").focus();
                } else if (currentInputID == "txtSPORDPrice_Price") {
                    $("#txtSPORDPriceSoldas").focus();
                } else if (currentInputID == "txtSPORDPriceSoldas") {
                    $("#txtSPORDPriceUPC").focus();
                } else if (currentInputID == "txtSPORDPriceUPC") {
                    $("#txtSPORDPriceBoxCode").focus();
                } else if (currentInputID == "txtSPORDPriceBoxCode") {
                    $("#txtSPORDPriceGTIN").focus();
                } 
            }
        });
    function changegridColByF8Price(isVisible) {
        $("#btnSPORDPriceAdd").css("visibility", isVisible ? "visible" : "hidden");
        $("#btnSPORDBuild").css("visibility", isVisible ? "visible" : "hidden");
        $("#btnSPORDClose").css("visibility", isVisible ? "visible" : "hidden");
        $("#tdSPORDPriceAdd").css("visibility", isVisible ? "visible" : "hidden");
        $("#fgrdViewSPORDByPrice").flexToggleCol('0', isVisible)
        $("#fgrdViewSPORDByPrice").flexToggleCol('1', isVisible)
        $("#fgrdViewSPORDByPrice").flexToggleCol('11', isVisible)

    }
    $("#DivViewSPORDByPriceDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "View SPORD Price",
        width: 910,
        open: function (e) {
            $("#DivViewSPORDByPriceDialog").dialog('option', { 'title': 'Price List for Customer ::' + $("#CurrentCustomerNo").html(), 'width': isPricelstExistForCust ? '810px' : '910px' });
            $("#fgrdViewSPORDByPrice").flexOptions({
                params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                { name: 'ExportCSV', value: '' },
                ], query: "", newp: 1
            }).flexReload();
             var sel = jQuery("#fgrdViewSPORDByPrice tbody tr");
            var len = sel.length;
            if (len > 1) {
                 $("#btnSPORDBuild").hide()
            }
            else {
                 $("#btnSPORDBuild").show()
            }
            if (!isPricelstExistForCust && ($("#DivViewSPORDByPriceDialog").dialog('isOpen') == true)) {
                changegridColByF8Price(true);
            }
            else {
                changegridColByF8Price(false);
            }
            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdViewSPORDByPrice")[0].tabIndex = tabindex;
            $("#fgrdViewSPORDByPrice").focus();
        },
        close: function () {
            if (isPricelstExistForCust) {
                addForF8();
            }
            $("#btnSPORDPriceAdd").css("visibility", "hidden");
            $("#btnSPORDBuild").css("visibility", "hidden");
            $("#btnSPORDClose").css("visibility", "hidden");
            $("#tdSPORDPriceAdd").css("visibility", "hidden");
        }
    });
    $("#btnSPORDBuild").die("click").live("click", function () {
        $.ajax({
            type: "POST",
            url: "BloomService.asmx/LoadPricingDetailsForSelectedCust",
            data: "{'SelectedCust':" + $("#CurrentCustomerNo").html() + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#fgrdViewSPORDByPrice").flexOptions({
                    params: [{ name: 'Customer', value: $("#CurrentCustomerNo").html() },
                    { name: 'ExportCSV', value: '' },
                    ], query: "", newp: 1
                }).flexReload();
            }
        });

    });
    $("#btnSPORDClose").die("click").live("click", function () {
        $("#DivViewSPORDByPriceDialog").dialog("close");
    });
</script>
