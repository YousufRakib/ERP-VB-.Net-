<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageOrderSaveProcess.ascx.vb" Inherits="pages_PageOrderSaveProcess" %>
<script src="js/validation.js" type="text/javascript"></script>
<style type="text/css">
    .trSelectedCheck {
        background: red !important;
        color: white;
    }
    .hideForEmptyWareHouse{
        display:none !important;
    }
    .consolidate {
        margin-left: 16px;
    }

        .consolidate .consolidategrpbtn {
            width: 83px;
            height: 24px;
            margin-top: 13px;
        }

    .consolidategrpbtn:hover,
    .consolidategrpbtn:active,
    .consolidategrpbtn.is-checked {
        background-color: red;
        color: white;
    }

    .consolidategrpbtn.is-checked {
        color: white;
    }


    #DivAvaliableInventoryGridList .flexigrid div.bDiv tr:hover td, #DivAvaliableInventoryGridList .flexigrid div.bDiv tr:hover td.sorted,
    #DivAvaliableInventoryGridList .flexigrid div.bDiv tr.trOver td.sorted, #DivAvaliableInventoryGridList .flexigrid div.bDiv tr.trOver td {
        background-color: transparent !important;
        color: black !important;
    }

        #DivAvaliableInventoryGridList .flexigrid div.bDiv tr:hover td a {
            color: initial;
        }

    #fgrdAvaliableInventoryGridList {
        font-size: 12px;
    }

    #DivAvaliableInventoryGridList .flexigrid div.bDiv tr:nth-child(odd) {
        background-color: #fdfdfd;
    }

    #DivAvaliableInventoryGridList .flexigrid div.bDiv tr:nth-child(even) {
        background-color: #f3f3f3;
    }

    .firstletterunderline::first-letter {
        text-decoration: underline;
    }

    .popover__title {
        font-size: 12px;
        text-decoration: none;
        color: rgb(228, 68, 68);
        text-align: center;
    }

    .popover__wrapper {
        position: relative;
        margin-left: 20px;
        display: inline-block;
    }

    .popover__content {
        opacity: 0;
        visibility: hidden;
        position: absolute;
        font-size: 12px;
        margin-top: -130px;
        margin-left: 25px;
        background-color: #bfbfbf;
        padding-left: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
        width: 200px;
    }

        .popover__content:before {
            z-index: -1;
            content: "";
            position: absolute;
            top: -130px;
            margin-left: 25px;
            border-style: solid;
            border-width: 0 10px 10px 10px;
            border-color: transparent transparent #bfbfbf transparent;
            transition-duration: 0.3s;
            transition-property: transform;
        }

        .popover__content:after {
            right: 100%;
            top: 94%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-color: rgba(136, 183, 213, 0);
            border-right-color: #bfbfbf;
            border-width: 10px;
            margin-top: -10px;
        }

    .popover__wrapper:hover .popover__content {
        z-index: 10;
        opacity: 1;
        visibility: visible;
        transition: all 0.5s cubic-bezier(0.75, -0.02, 0.2, 0.97);
    }

    .popover__message {
        text-align: left;
        font-size: 12px;
    }
</style>


<div id="DivOrderNo_OrderSave" runat="server" style="display: none"></div>
<div id="DivCustomerNo_OrderSave" runat="server" style="display: none"></div>
<div id="DivCalledFromVET_OrderSave" runat="server" style="display: none"></div>

<div id="DivOrderDetailID_OrderSave" runat="server" style="display: none"></div>
<div id="DivHeight" runat="server" style="display: none"></div>

<div id="PageCalledFrom" runat="server" style="display: none"></div>
<div id="DivNextOrderNo"></div>
<%--Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions--%>
<div id="DivIsVoidedOrder" runat="server" style="display: none"></div>

<div id="DivCustomerMessageDialog" style="display: none;">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <input type="text" maxlength="46" id="txtCustMsg1" style="width: 400px; border-radius: 0px; border-bottom: none;" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" maxlength="46" id="txtCustMsg2" style="width: 400px; border-radius: 0px; border-bottom: none; border-top: none;" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" maxlength="46" id="txtCustMsg3" style="width: 400px; border-radius: 0px; border-bottom: none; border-top: none;" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" maxlength="46" id="txtCustMsg4" style="width: 400px; border-radius: 0px; border-bottom: none; border-top: none;" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" maxlength="46" id="txtCustMsg5" style="width: 400px; border-radius: 0px; border-top: none;" />
            </td>
        </tr>
        <tr style="height: 20px">
        </tr>
        <tr>
            <td>
                <label><b>Please type any message to be printed on invoice</b></label></td>
        </tr>
        <tr style="height: 20px">
        </tr>
    </table>
</div>
/*21Mar19 :: Abinaya :: Speed optimization for Save process*/
<div id="DivOrderSavePrintProcess" style="display: none;"></div>


<div id="DivShippingMessageDialog">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <input type="text" maxlength="41" id="txtShipMsg1" style="width: 400px; border-radius: 0px; border-bottom: none;" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" maxlength="41" id="txtShipMsg2" style="width: 400px; border-radius: 0px; border-bottom: none; border-top: none;" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" maxlength="41" id="txtShipMsg3" style="width: 400px; border-radius: 0px; border-bottom: none; border-top: none;" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" maxlength="41" id="txtShipMsg4" style="width: 400px; border-radius: 0px; border-bottom: none; border-top: none;" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" maxlength="41" id="txtShipMsg5" style="width: 400px; border-radius: 0px; border-top: none;" />
            </td>
        </tr>
        <tr style="height: 20px">
        </tr>




        <tr>
            <td>
                <label><b>Please type any message to be printed on picking list</b></label></td>
        </tr>
        <tr style="height: 20px">
        </tr>
    </table>
</div>

<div id="DivOrder1InfoDialog">
    <table>
        <tr>
            <td>
                <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
                SHIPPING DATE 
            </td>
            <td>
                <input type="text" id="txtShippingDate_Or1" class="datecontrol" style="width: 74px" />
                <label id="lblShippingDay_Or1" />
            </td>
            <td></td>
        </tr>
        <tr id="CargoDateRow" style="display:none;">
            <td>
                <input type="text" style="display: block; opacity: 0; height: 0px; width: 0px" />
                CARGO DATE 
            </td>
            <td>
                <input type="text" id="txtCargoDate_Or1" class="datecontrol" style="width: 74px" />
                <label id="lblCargoDate_Or1" />
            </td>
            <td></td>
        </tr>
        <tr style="height: 30px;">

            <td>SHIPPING OUT OF
            </td>
            <td>
                <select id="SaveWareHouseDDL"></select>
                <b><input type="text" id="txtSaveWarehouse" style="width: 100px;" class="AllUpperCaseTextBox" disabled /></b> WAREHOUSE
            </td>
        </tr>
        <tr>
            <td>CARRIER
            </td>
            <td>
                <select id="lstCARRIER_Or1" style="display: none" />
                <input type="text" id="txtCarrier_Or1" style="width: 180px;" class="AllUpperCaseTextBox" />
                <input type="hidden" id="hfCarrier_Or1" />
            </td>
        </tr>
        <tr>
            <td>Cut off time
            </td>
            <td>
                <input type="text" id="txtCutOfftime_Or1" style="width: 33px;" /></td>
        </tr>
        <tr>
            <td>AWB #
            </td>
            <td>
                <input type="text" id="txtAWB_Or1" maxlength="15" class="ClsAwbAllowDash" /></td>
        </tr>
        <tr>
            <td>Cust P.O #
            </td>
            <td>
                <input type="text" id="txtCustPO_Or1" maxlength="15" class="AllUpperCaseTextBox"/>
            </td>
        </tr>
        <tr>
            <td>SalesPerson
            </td>
            <td>
                <input type="text" id="txtSalesMan_Or1" maxlength="4" class="ClsNumbersOnly" /></td>
        </tr>

    </table>

</div>

<div id="DivPrintReportsDialog" style="display: none;">
    <table>
        <tr>

            <td>Confirm Invoice?
            </td>
            <td>(Y/N)</td>
            <td>
                <input class="Singlelettertextbox AllUpperCaseTextBox" type="text" id="txtPrintInvoice" placeholder="N" style="width: 10px;" maxlength="1" />
            </td>
        </tr>
        <tr>
            <td>Print Labels?
            </td>
            <td>(Y/N)</td>
            <td>
                <input class="Singlelettertextbox AllUpperCaseTextBox" type="text" id="txtPrintLabels" placeholder="N" style="width: 10px;" maxlength="1" />
            </td>
        </tr>
        <tr>

            <td>Print Picking?
            </td>
            <td>(Y/N)</td>
            <td>
                <input class="Singlelettertextbox AllUpperCaseTextBox" type="text" id="txtPrintPicking" placeholder="N" style="width: 10px;" maxlength="1" />
            </td>
        </tr>
        <tr>

            <td>Email Invoice?
            </td>
            <td>(Y/N)</td>
            <td>
                <input class="Singlelettertextbox AllUpperCaseTextBox" type="text" id="txtEmailInvoice" style="width: 10px;" placeholder="N" maxlength="1" />
            </td>
        </tr>
        <tr>

            <td>Fax Invoice?
            </td>
            <td>(Y/N)</td>
            <td>
                <input class="Singlelettertextbox AllUpperCaseTextBox" type="text" id="txtFaxInvoice" style="width: 10px;" placeholder="N" maxlength="1" />
            </td>
        </tr>

    </table>

</div>

<div id="ContinuePrintDialog" style="display: none">
    <div style="height: 35px;">
        Are you sure to Continue?
    </div>
</div>
<div id="ReportPrintDialog" style="display: none">
</div>

<div id="DivTermsDialog_Ordersave">
    <table>
        <tr>
            <td>Terms
            </td>
            <td>
                <select id="lstTerms_Ordersave" />
            </td>
        </tr>
    </table>

</div>


<div id="DivShiptoDialog_Ordersave">
    <table>
        <tr>
            <td>Shipto
            </td>
            <td>
                <select id="lstShipto_Ordersave" style="width: 500px;" />
                <input type="hidden" id="hfShipto_Ordersave" style="display: none" />
            </td>
        </tr>
    </table>

</div>

<div id="messageOrSaveclicked_OrderSave"></div>


<div id="InventoryListForOrderEntryDialog">
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="padding-right: 25px; color: darkblue;">NAME</td>
                        <td>
                            <label id="InventoryAddCustName" style="color: black; font-weight: bold;"></label>
                        </td>
                        <td style="padding-right: 25px; padding-left: 32px; color: darkblue;">City</td>
                        <td>
                            <label id="InventoryAddCity" style="color: black; font-weight: bold;"></label>
                        </td>
                        <td style="padding-right: 25px; padding-left: 32px; color: darkblue;">Phone</td>
                        <td>
                            <label id="InventoryAddPhone" style="color: black; font-weight: bold;"></label>
                        </td>
                        <td style="padding-right: 25px; padding-left: 32px; color: darkblue;">WH:</td>
                        <td>
                            <label id="InventoryAddWH" style="color: black; font-weight: bold;"></label>
                        </td>

                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div id="DivAvaliableInventoryGridList">
                    <table id="fgrdAvaliableInventoryGridList" tabindex="-5" style="display: block;"></table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="margin-top: 6px; display: block;">
                    <button id="btnOrderInventorySearch" type="button" class="BloomButtonEnabled firstletterunderline" value="Search" style="margin-left: 2px; width: 66px;">Search</button>
                    <button id="btnOrderInventoryCategory" type="button" class="BloomButtonEnabled firstletterunderline" value="Cat" style="margin-left: 2px; width: 66px;background:#77c1ff;">Cat</button>
                    <button id="btnOrderInventoryColor" type="button" class="BloomButtonEnabled" value="Color" style="margin-left: 2px; width: 66px; color: white;background:purple;"><span style="text-decoration: underline">C</span>olor</button>
                    <button id="btnOrderInventoryVariety" type="button" class="BloomButtonEnabled firstletterunderline" value="Variety" style="margin-left: 2px; width: 66px; color: white;background:#ff00e0;">Variety</button>
                    <button id="btnOrderInventoryGrade" type="button" class="BloomButtonEnabled firstletterunderline" value="Grade" style="margin-left: 2px; width: 66px;background:teal;">Grade</button>
                    <button id="btnOrderInventoryOther" type="button" class="BloomButtonEnabled firstletterunderline" value="Other" style="margin-left: 2px; width: 66px; color: white;background:tomato;">Other</button>
                    <button id="btnOrderInventoryFarm" type="button" class="BloomButtonEnabled firstletterunderline" value="Farm" style="margin-left: 2px; width: 66px; color: white;background:mediumorchid;">Farm</button>
                    <button id="btnOrderInventoryGTot" type="button" class="BloomButtonEnabled" value="GTot." style="margin-left: 2px; background: red; width: 66px; display: none;background:magenta;">GTot.</button>
                    <button id="btnOrderInventoryMarket" type="button" class="BloomButtonEnabled firstletterunderline" value="Market" style="margin-left: 2px; width: 66px;background:deeppink;">Market</button>
                    <button id="btnOrderInventoryLocal" type="button" class="BloomButtonEnabled firstletterunderline" value="Local" style="margin-left: 2px; width: 66px; color: white;background:darkviolet;">Local</button>
                    <button id="btnOrderInventoryStanding" type="button" class="BloomButtonEnabled" value="Standing" style="margin-left: 2px; width: 68px; color: white;background:darkturquoise;">S<span style="text-decoration: underline">t</span>anding</button>
                    <button id="btnOrderInventoryPrebooks" type="button" class="BloomButtonEnabled firstletterunderline" value="Prebooks" style="margin-left: 2px; width: 66px; color: white;background:greenyellow;">Prebooks</button>
                    <button id="btnOrderInventoryHold" type="button" class="BloomButtonEnabled firstletterunderline" value="Hold" style="margin-left: 2px; width: 66px; color: white;background:gold;">Hold</button>
                    <button id="btnOrderInventoryArriving" type="button" class="BloomButtonEnabled firstletterunderline" value="Arriving" style="width: 66px;background:chocolate;">Arriving</button>
                    <button id="btnOrderInventoryFuture" type="button" class="BloomButtonEnabled firstletterunderline" value="Future" style="width: 66px;background:cadetblue;">XFuture</button>
                    <button id="btnOrderInventoryRefresh" type="button" class="BloomButtonEnabled firstletterunderline" value="Refresh" style="width: 66px;background:#fff258;">Refresh</button>
                    <select id="lstWarehouseForFilter"></select>
                    <div id="divWHForInvoice" style="display:none;"></div>
                </div>
            </td>
        </tr>
    </table>
</div>


<div id="AddOrderDetailFromInventoryDialog">
    <table style="width: 100%">
        <tr style="height: 25px">
            <td colspan="4">
                <div class="Warning" id="Inventorywarning" align="center">
                    Not enough on inventory
                </div>
                <div class="YellowWarning" align="center">
                    All fields are required fields, Please try again.
                </div>
            </td>
        </tr>
        <tr>
            <td style="display: none;">
                <label id="lblInventorySelectedRowID_AddOrderDetail"></label>
                <label id="lblInvenIDs_AddOrderDetail"></label>
                <label id="lblSQLIDs_AddOrderDetail"></label>
            </td>
        </tr>
        <tr style="height: 23px;">
            <td>Description</td>
            <td>
                <label id="lblFlowerName_AddOrderDetail" style=""></label>

            </td>
        </tr>
        <tr>
            <td>Quantity</td>
            <td>
                <div style="width: 410px">
                    <table>
                        <tr>
                            <td>
                                <input type="text" class="ClsNumbersOnly" id="txtQty_AddOrderDetail" style="width: 50px;" />
                                <label style="" id="lblUOM_AddOrderDetail"></label>
                                <label>&nbsp;X</label><label id="lblFlowerUnits_AddOrderDetail" style="padding-left: 5px"></label>
                            </td>
                        </tr>
                    </table>
                </div>
                <%--<label style="margin-left: 60px; float: right;">
                    Max :
                    <label style="margin-left: 4px;" id="lblAvailableQty_AddOrderDetail"></label>
                </label>--%>
            </td>
        </tr>
        <tr>
            <td>Price</td>
            <td>
                <div style="width: 410px">
                    <table>
                        <tr>
                            <td>
                                <input type="text" class="ClsDecimalsOnly" id="txtPrice_AddOrderDetail" style="width: 65px;" />
                            </td>
                            <td style="padding-left: 24px; padding-top: 3px">&nbsp;
                            </td>
                            <td style="padding-left: 43px; padding-top: 3px">Last Price</td>
                            <td style="padding-left: 10px;">
                                <label style="color: red;" id="lblLastPrice_AddOrderDetail"></label>
                            </td>
                            <td style="padding-left: 43px; padding-top: 3px">Last Date</td>
                            <td style="padding-left: 10px;" colspan="2">
                                <label style="color: red;" id="lblLastDate_AddOrderDetail"></label>
                            </td>
                            <td style="padding-left: 30px; padding-top: 3px">Cost</td>
                            <td style="padding-left: 10px;">
                                <label style="" id="lblCost_AddOrderDetail"></label>
                            </td>

                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr style="height: 23px;">
            <td>+Fuel</td>
            <td>
                <div style="width: 410px">
                    <table>
                        <tr>
                            <td>
                                <input type="text" class="ClsDecimalsOnly" id="txtPlusFuel_AddOrderDetail" style="width: 65px;" />
                                <label style="padding-left: 15px; visibility: hidden;" id="lblFuel_AddOrderDetail"></label>
                            </td>
                            <td style="padding-left: 5px;" class="gpmVisibility">GPM</td>
                            <td style="padding-left: 5px;" class="gpmVisibility">
                                <label style="" id="lblGPM_AddOrderDetail"></label>
                            </td>

                            <td style="padding-left: 5px; padding-top: 3px">FBE</td>
                            <td style="padding-left: 5px;">
                                <label style="color: red;" id="lblFBE_AddOrderDetail"></label>
                            </td>
                            <td style="padding-left: 5px; padding-top: 3px">DIMENTIONS</td>
                            <td style="padding-left: 5px;">
                                <label style="color: red;" id="lblDimensions_AddOrderDetail"></label>
                            </td>
                            <td style="padding-left: 5px; padding-top: 3px">CUBES</td>
                            <td style="padding-left: 5px;">
                                <label style="color: red;" id="lblCubes_AddOrderDetail"></label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr id="trNewBoxCode">
            <td>BoxCode</td>
            <td>
                <input type="text" class="AllUpperCaseTextBox" id="txtNewBoxCode_AddOrderDetail" style="width: 104px;" maxlength="15" />
            </td>
        </tr>
        <tr>
            <td>Sale type</td>
            <td>
                <input type="text" maxlength="1" class="AllUpperCaseTextBox" id="txtSaleType_AddOrderDetail" style="width: 14px;" />
                <div class="popover__wrapper">
                    <a href="#">
                        <img src="images/info.png" style="margin-bottom: -5px; cursor: pointer;" id="ViewSalesListInfoIcon" class="popover__title" />
                    </a>
                    <div class="popover__content">
                        <p class="popover__message" style="font-size: 10px;">
                            <table border="0" style="font-size: 10px; width: 200px;">
                                <span style="text-align: center"><b>View Sales List:</b></span>
                                <tr>
                                    <td>N-Market Sale</td>
                                    <td>S-Salvage Sale</td>
                                </tr>
                                <tr>
                                    <td>F-Standing Order</td>
                                    <td>B-Donation</td>
                                </tr>
                                <tr>
                                    <td>E-Double S.O</td>
                                    <td>T-Donation</td>
                                </tr>
                                <tr>
                                    <td>V-Seasonal</td>
                                    <td>P-Sample</td>
                                </tr>
                                <tr>
                                    <td>C-Consignment</td>
                                    <td>O-Pre-book</td>
                                </tr>
                                <tr>
                                    <td>D-Dump Sale</td>
                                    <td>R-Replacement</td>
                                </tr>
                                <tr>
                                    <td>L-Local Sale</td>
                                    <td>U-Fumigated</td>
                                </tr>
                            </table>
                        </p>
                        <%--  <p class="popover__message" style="font-size:10px;"><b>View Sales List:</b> <br />
                    N-Market Sale<br /> 
                    F-Standing Order <br /> 
                    E-Double S.O <br />
                    V-Seasonal <br />
                    C-Consignment <br />
                    D-Dump Sale <br />
                    L-Local Sale <br />
                    S-Salvage Sale <br />
                    B-Donation <br />
                    T-Donation <br />
                    P-Sample <br />
                    O-Pre-book <br />
                    R-Replacement <br />
                    U-Fumigated</p>--%>
                    </div>
                </div>
                <%--<select id="lstSaleType_AddOrderDetail">
                     <option value=""><View Sales List></option>
                     <option value="N">N-Market Sale</option>
                     <option value="F">F-Standing Order</option>
                     <option value="E">E-Double S.O</option>
                     <option value="V">V-Seasonal</option>
                     <option value="C">C-Consignment</option>
                     <option value="D">D-Dump Sale</option>
                     <option value="L">L-Local Sale</option>
                     <option value="S">S-Salvage Sale</option>
                     <option value="B">B-Donation</option>
                     <option value="T">T-Donation</option>
                     <option value="P">P-Sample</option>
                     <option value="O">O-Pre-book</option>
                     <option value="R">R-Replacement</option>
                     <option value="U">U-Fumigated</option>
                 </select>--%>
            </td>

        </tr>
        <tr style="height: 23px;" class="SuperMarketAccountFields">
            <td>Store #</td>
            <td colspan="4">
                <input type="text" class="ClsNumbersOnly" maxlength="4" id="txtStoreNo_AddOrderDetail" style="width: 45px;" />
            </td>
        </tr>
        <tr style="height: 23px;" class="SuperMarketAccountFields">
            <td>Box Code</td>
            <td>
                <input type="text" maxlength="15" id="txtBoxCode_AddOrderDetail" style="width: 140px;" />
            </td>
            <td id="tdFlowerName">
                <input type="text" maxlength="100" id="txtFlowerName_AddOrderDetail" style="width: 305px;" />
            </td>
        </tr>
        <tr style="height: 23px;" class="SuperMarketAccountFields">
            <td>Upc Code</td>
            <td>
                <input type="text" maxlength="15" id="txtUpcCode_AddOrderDetail" style="width: 140px;" />
            </td>
        </tr>
        <tr style="height: 23px;" class="SuperMarketAccountFields">
            <td>Upc Price</td>
            <td>
                <input type="text" maxlength="15" id="txtUpcPrice_AddOrderDetail" style="width: 140px;" />
            </td>
        </tr>
        <tr style="height: 23px;" class="SuperMarketAccountFields">
            <td>Date Code</td>
            <td>
                <input type="text" maxlength="15" id="txtDateCode_AddOrderDetail" style="width: 80px;" />
            </td>
        </tr>
        <tr id="tdmultiplefarms" style="display: none">
            <td>Farm</td>
            <td>
                <select id="lstMultipleFarms_AddOrderDetail"></select>
            </td>
        </tr>
    </table>
</div>

<div id="AddOrderDetailFromFutureDialog">
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
                <input type="text" class="AllUpperCaseTextBox" id="txtFlower_FutureOrderDetail" style="width: 350px;" />
                <input type="hidden" id="hfFlower_FutureOrderDetail" />
                <input type="hidden" id="hfFlowerName_FutureOrderDetail" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>FARM</td>
            <td>
                <select id="lstFarm_FutureOrderDetail" class="enterKeyPressControl" style="width: auto;">
                </select>
                <input type="hidden" id="hfFarm_FutureOrderDetail" />
            </td>
            <td colspan="2">&nbsp;
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>BOXES</td>
            <td>
                <input type="text" class="ClsNumbersOnly enterKeyPressControl" id="txtQty_FutureOrderDetail" style="width: 50px;" />
                <select id="lstUOM_FutureOrderDetail" class="enterKeyPressControl" style="width: 100px; height: 23px">
                </select>
                <input type="hidden" id="hfUOM_FutureOrderDetail" />
                <label style="margin-left: 20px">UNITS/BOX</label>
                <input type="text" class="ClsNumbersOnly enterKeyPressControl" id="txtUnitsPerBox_FutureOrderDetail" style="width: 50px;" />
            </td>
            <td colspan="2">&nbsp;                  
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>PRICE</td>
            <td colspan="3">
                <input type="text" class="ClsDecimalsOnly enterKeyPressControl" id="txtPrice_FutureOrderDetail" style="width: 65px;" />
                <label style="margin-left: 20px">COST</label>
                <input type="text" class="ClsDecimalsOnly enterKeyPressControl" id="txtCost_FutureOrderDetail" style="width: 65px;" />
                 <label style="margin-left: 20px">GPM%</label>
                <input type="text" class="ClsDecimalsOnly " id="txtGPM_FutureOrderDetail" style="width: 65px;" disabled />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>BOX CODE</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl" id="txtBoxCode_FutureOrderDetail" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>UPC</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl" id="txtUPC_FutureOrderDetail" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>UPC PRICE</td>
            <td colspan="3">
                <input type="text" class="enterKeyPressControl" id="txtUPCPRICE_FutureOrderDetail" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>DATE CODE</td>
            <td colspan="3">
                <input type="text" class="AllUpperCaseTextBox enterKeyPressControl" id="txtDateCode_FutureOrderDetail" style="width: 165px;" />
            </td>
        </tr>
        <tr style="height: 35px;">
            <td>NOTES</td>
            <td colspan="3">
                <textarea id="txtNotes_FutureOrderDetail" class="enterKeyPressControl" style="width: 360px;" rows="5" cols="40" />
            </td>
        </tr>
        <tr id="trPODetail" style="display:none; width:100%">            
            <td colspan="4">
                <table style="width: 100%;">
                    <tr style="height: 25px">
                        <td style="width:50%;">
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
                    <tr style="height: 25px; display:none;">
                        <td>
                            <label>BoxNum</label>
                            <label style="color: red;" id="lblPOBoxnum_FutureOrder"></label>
                        </td>
                        <td style="width:50%;">
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


<div id="FarmFilterForInventoryDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Farm</td>
            <td style="padding-left: 22px">
                <input style="width: 58px" id="txtFarmFilterForInventoryList" maxlength="3" class="AllUpperCaseTextBox" />
            </td>
        </tr>
    </table>
</div>

<div id="VarietyFilterForInventoryDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Variety</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstVarietyFilterForInventoryList" />
            </td>
        </tr>
    </table>
</div>

<div id="GradeFilterForInventoryDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Grade</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstGradeFilterForInventoryList" />
            </td>
        </tr>
    </table>
</div>

<div id="ColorFilterForInventoryDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Color</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstColorFilterForInventoryList" />
            </td>
        </tr>
    </table>
</div>


<div id="FlowerFilterForInventoryDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Flower</td>
            <td style="padding-left: 22px">
                <input maxlength="8" class="AllUpperCaseTextBox" style="width: 88px" id="txtFlowerFilterForInventoryList" />
            </td>
        </tr>
    </table>
</div>

<div id="CategoryFilterForInventoryDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Flower</td>
            <td style="padding-left: 22px">
                <select style="width: 88px" id="lstCategoryFilterForInventoryList" />
            </td>
        </tr>
    </table>
</div>
<%-- test--%>

<div id="OtherFiltersForInventoryListDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>
                <div class="button-group consolidate" id="DivInvetoryOtherFilter" style="float: left;">
                    <button class="consolidategrpbtn button" type="button" value="AWB" id="btnAWB">AWB</button>
                    <button class="consolidategrpbtn button" type="button" value="Aged" id="btnAged">Aged</button>
                    <button class="consolidategrpbtn button" type="button" value="Country" id="btnCountry">Country</button>
                    <%-- <button class="consolidategrpbtn button" type="button" value="Type" id="btnType">Type</button>--%>
                    <button class="consolidategrpbtn button" type="button" value="WH" id="btnWhse">Whse</button>
                </div>
            </td>
        </tr>
        <tr style="height: 55px;">
            <td>
                <div style="margin: 0 auto;">
                    <label style="margin-left: 15px;" id="lblOtherFilterForInventory"></label>
                    <input style="width: 150px; display: none;" id="txtOtherFilterForInventoryList" />
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="IncludeMessageConfirmDlg" title="Alert">
    <p>Do you want to include a message?</p>
</div>

<div id="LoggedInUserType_SalesPerson" runat="server" style="display: none"></div>
<div id="PrintlogMsg" style="display: none"></div>
<div id="DivForViewAllColumnsInInvnetory" style="display: none" runat="server"></div>
<div id="DivInventoryAccessTypes" style="display: none" runat="server"></div>
<div id="DivInvenAccess" style="display: none"></div>
<div id="TotalInvenQty"></div>
<div id="DivWHListCount" style="display: none" runat="server"></div>
<div id="DivpgOdrsaveActiveWHs" style="display: none" runat="server"></div>
<div id="DivpgOdrtbltype" style="display: none" runat="server"></div>

<%--Added By Belal on 01 Sept 2020--%>
<div id="DivCustomerForSelectedFlwoer" style="display: none">
    <table style="width: 100%">
        <tr>
            <td>
                <table id="fgrdSelectedFlowerCustList" style="display: none;"></table>
            </td>
        </tr>
    </table>
</div>



<%--Added by Belal on 29 April 2021--%>
<div id="QuickShipToDialog" style="display: none">
    <table style="text-align: left; border-collapse: collapse; font-size: 14px; width: 100%;">
        <tbody>
           <tr>
            <td>Shipto</td>
                <td>
                    <input type="text" id="txtQuickShipto" style="width: 45px;" maxlength="30">
                </td>
            </tr>
 
            <tr>
                <td>Name</td>
                <td>
                    <input type="text" id="txtQuickShiptoName" style="width: 350px;" maxlength="30">
                </td>
            </tr>
            <tr>
                <td>Address</td>
                <td>
                    <input type="text" id="txtQuickShiptoAddress1" style="width: 350px;" maxlength="30">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="text" id="txtQuickShiptoAddress2" style="width: 350px;" maxlength="30">
                </td>
            </tr>
            <tr>
                <td>City</td>
                <td>
                    <input type="text" id="txtQuickShiptoCity" style="width: 250px;" maxlength="20">
                </td>
            </tr>
            <tr>
                <td>State</td>
                <td>
                    <input type="text" id="txtQuickShiptoState" style="width: 30px;" maxlength="2">
                    <label>Zip code</label>
                    <input type="text" id="txtQuickShiptoZip" style="width: 100px;" maxlength="9">
                </td>
            </tr>
            <tr>
                <td>Country</td>
                <td>
                    <input type="text" id="txtQuickShiptoCountry" style="width: 250px;" maxlength="20">
                </td>
            </tr>
            <tr>
                <td>Phone</td>
                <td>
                    <input type="text" id="txtQuickShiptoPhone" style="width: 150px;" maxlength="15">
                    <label>Fax</label>
                    <input type="text" id="txtQuickShiptoFax" style="width: 150px;" maxlength="15">
                </td>
            </tr>
            <tr>
                <td>Contact</td>
                <td>
                    <input type="text" id="txtQuickShiptoContact" style="width: 350px;" maxlength="30">
                </td>
            </tr>
        </tbody>
    </table>
</div>

<script type="text/javascript">

    var dayNames = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
    var InventoryId = [];
    var IsInventoryClick = false;
    var Invqty = 0;
    var isvoid = false;                         //Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
    var qtypeload = 0;
    var defaultqtypeload = 0;
    var isInventoryClickedFrom = "";
    var isFromARINVS = "";
    //LoadFarmList();
    var isPriceApprovalNeeded = false;

    $(document).ready(function () {
        $('.enterKeyPressControl').unbind('keypress');  // added by belal :: 31 Aug 2020
       
        $('.enterKeyPressControl').unbind('keydown').bind('keydown', function (e) { // Added by Belal on 29 Aug 2020 :: this will focus next control on the Future Product form by pressing enter key
            debugger;
            var currentInputID = $(this).attr('id');
            if (e.keyCode == 13) {
                if (currentInputID == "txtFlower_FutureOrderDetail") {
                    $("#lstFarm_FutureOrderDetail").focus();
                } else if (currentInputID == "lstFarm_FutureOrderDetail") {
                    $("#txtQty_FutureOrderDetail").focus();
                } else if (currentInputID == "txtQty_FutureOrderDetail") {
                    $("#lstUOM_FutureOrderDetail").focus();
                } else if (currentInputID == "lstUOM_FutureOrderDetail") {
                    $("#txtUnitsPerBox_FutureOrderDetail").focus();
                } else if (currentInputID == "txtUnitsPerBox_FutureOrderDetail") {
                    $("#txtPrice_FutureOrderDetail").focus();
                } else if (currentInputID == "txtPrice_FutureOrderDetail") {
                    $("#txtCost_FutureOrderDetail").focus();
                } else if (currentInputID == "txtCost_FutureOrderDetail") {
                    $("#txtBoxCode_FutureOrderDetail").focus();
                } else if (currentInputID == "txtBoxCode_FutureOrderDetail") {
                    $("#txtUPC_FutureOrderDetail").focus();
                } else if (currentInputID == "txtUPC_FutureOrderDetail") {
                    $("#txtUPCPRICE_FutureOrderDetail").focus();
                } else if (currentInputID == "txtUPCPRICE_FutureOrderDetail") {
                    $("#txtDateCode_FutureOrderDetail").focus();
                } else if (currentInputID == "txtDateCode_FutureOrderDetail") {
                    $("#txtNotes_FutureOrderDetail").focus();
                }
            }else if (e.keyCode == 34) {
                if (currentInputID == "txtBoxCode_FutureOrderDetail" || currentInputID == "txtUPC_FutureOrderDetail" || currentInputID == "txtUPCPRICE_FutureOrderDetail" || currentInputID == "txtDateCode_FutureOrderDetail" || currentInputID == "txtNotes_FutureOrderDetail") {
                    SaveFutureOrderDetail();
                }
            }
        });

        $("#txtFlower_FutureOrderDetail").keydown(function (e) {
            if (e.keyCode == 13) {
                $("#lstFarm_FutureOrderDetail").focus();
            }
        })
        
        $("#SaveWareHouseDDL").on("change", function () {
            debugger;
            if ($(this).val() != "-1") {
                $("#txtSaveWarehouse").val($(this).val());
            } else {
                $("#txtSaveWarehouse").val("");
            }
        });
        $("#txtPrice_FutureOrderDetail").on("change", function () {
            let price = parseFloat($(this).val());
            price = isNaN(price) ? 0 : price;
            let cost = parseFloat($("#txtCost_FutureOrderDetail").val());
            cost = isNaN(cost) ? 0 : cost;

            if (price == 0 || cost == 0) {
                $("#txtGPM_FutureOrderDetail").val(0);
            } else {
                let gpm = ((price - cost) / price) * 100;
                $("#txtGPM_FutureOrderDetail").val(gpm.toFixed(2));
            }

        });
        $("#lstFarm_FutureOrderDetail").on("change", function () {
            debugger;
            if ($(this).val() != "") {

                $("#txtCost_FutureOrderDetail").val("");
                let cost = parseFloat($("#lstFarm_FutureOrderDetail option:selected").text().split('~')[1]);
                cost = isNaN(cost) ? 0 : cost;
                let price = parseFloat($("#lstFarm_FutureOrderDetail option:selected").text().split('~')[3]);
                price = isNaN(price) ? 0 : price;
                $("#txtCost_FutureOrderDetail").val(cost);
                $("#txtPrice_FutureOrderDetail").val(price);
                if (price == 0 || cost == 0) {
                    $("#txtGPM_FutureOrderDetail").val(0);
                } else {
                    let gpm = ((price - cost) / price) * 100;
                    $("#txtGPM_FutureOrderDetail").val(gpm.toFixed(2));
                }
            }
        });
        $("#txtCost_FutureOrderDetail").on("change", function () {
            let cost = parseFloat($(this).val());
            cost = isNaN(cost) ? 0 : cost;
            let price = parseFloat($("#txtPrice_FutureOrderDetail").val());
            price = isNaN(price) ? 0 : price;

            if (price == 0 || cost == 0) {
                $("#txtGPM_FutureOrderDetail").val("");
            } else {
                let gpm = ((price - cost) / price) * 100;
                $("#txtGPM_FutureOrderDetail").val(gpm.toFixed(2));
            }
        });
        //Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
        if ($("#ctl00_DivIsVoidedOrder").html() == "VOIDED") {
            isvoid = true;
        }

        //$('input').keypress(function (e) {  // Commented by Belal because this works only for input box but not for select control in the form :: on 29 Aug 2020 ::

        //    var key = e.which;
        //    if (key == 13) // the enter key code
        //    {

        //        for (var i = 0; i < $(this).closest('tr').find('input').length; i++) {
        //            var a;
        //            if ($(this).closest('tr').find('input')[i].id == $(this).attr('id')) {
        //                a = i;
        //            }



        //            if ($(this).closest('tr').find('input')[i].id != $(this).attr('id') && a < i && $(this).closest('tr').find('input')[i].disabled != true &&
        //                $(this).closest('tr').find('input')[i].type != "hidden") {
        //                $(this).closest('tr').find('input')[i].focus();
        //                return false;
        //            }



        //            else if (i == $(this).closest('tr').find('input').length - 1) {
        //                if ($(this).closest('tr').next('tr').find('input').length > 0) {
        //                    $(this).closest('tr').next('tr').find('input')[0].focus();
        //                }
        //                else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0)
        //                    $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();
        //                else if ($(this).attr('id') == "txtSalesMan_Or1" || $(this).attr('id') == "txtFarmFilterForInventoryList" || $(this).attr('id') == "txtFlowerFilterForInventoryList")
        //                    $(this).closest('div').next('div').find('button')[0].focus()
        //                return false;
        //            }
        //        }
        //    }
   
        //});

        ////Intialize date control for the text box
        $("#txtShippingDate_Or1").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
            onSelect: function (dateText) {
                ChangeCarrier(dateText);
            }
        }).datepicker("setDate", new Date());

        $("#txtShippingDate_Or1").val(new Date().toString("MM/dd/yyyy"))


        $.mask.definitions['9'] = "[0-9]";
        $("#txtCutOfftime_Or1").mask("99:99");

        var nData = new Date();
        //$("#txtShippingDate_Or1").mask("99/99/" + nData.getFullYear());
        if (nData.getFullYear().toString().endsWith("9") == true) {
            $.mask.definitions['#'] = $.mask.definitions['9'];
            $.mask.definitions['9'] = null;
            var getyear = nData.getFullYear().toString();
            var get3placesyear = getyear.slice(0, 3);
            $("#txtShippingDate_Or1").mask("##/##/" + get3placesyear + "9");
        }
        else
            $("#txtShippingDate_Or1").mask("99/99/" + nData.getFullYear());

        $("#lblShippingDay_Or1").html(dayNames[nData.getDay()]);

        if ($("#ui-dialog-title-DivOrderNewDetailsDialog").html() != null && $("#ui-dialog-title-DivOrderNewDetailsDialog").html().toString().toLowerCase() != "alert")
            $("#txtSalesMan_Or1").val($("#DivOrderNewDetailsDialog .lblSalesMan").html());
        else if ($("#ui-dialog-title-DivVETInvoiceGridDialog").html() != null && $("#ui-dialog-title-DivVETInvoiceGridDialog").html().toString().toLowerCase() != "alert")
            $("#txtSalesMan_Or1").val($("#DivVETInvoiceGridDialog .lblSalesMan").html());
        else
            $("#txtSalesMan_Or1").val($("#DivOrderDetailsDialog .lblSalesMan").html());
        //lblsalesman coming from pagecustdetailspage 

        //Show ShipTo Dialog if Cust# is same as Shipto#
        $("#hfShipto_Ordersave").val("");
        LoadShipto(function (callback) {
            if (callback == true) {
                $("#lstShipto_Ordersave").val($("#ctl00_DivCustomerNo_OrderSave").html());
                //$("#hfShipto_Ordersave").val(data.Shipto);
                //ShipToLoading($("#ctl00_DivCustomerNo_OrderSave").html());
            }
        });
    });

    //Added By Belal on 01 Sept 2020 :: For selected flower customer list
    $("#DivCustomerForSelectedFlwoer").dialog({
        autoOpen: false,
        resizable: false,
        title: "Alert",
        width: 750,
        height: 580,
        modal: true,
        open: function () {

        }
    });

    //Added By Belal on 01 Sept 2020 :: For selected flower customer list
    $("#fgrdSelectedFlowerCustList").flexigrid({
        url: 'BloomService.asmx/LoadF3SalesDetailsForSelectedFlower',
        dataType: 'xml',
        colModel: [
            { display: 'CUSTOMER', name: 'CUSTOMER', width: 80, sortable: true, align: 'left' },
            { display: 'CUSTOMERNAME', name: 'CUSTOMERNAME', width: 250, sortable: true, align: 'left' },
            { display: 'BOXES', name: 'BOXES', width: 35, sortable: true, align: 'left' },
            { display: 'UOM', name: 'UOM', width: 50, sortable: true, align: 'left' },
            { display: 'UNITS', name: 'UNITS', width: 50, sortable: true, align: 'left' },
            { display: 'FOB', name: 'FOB', width: 60, sortable: false, align: 'left' },
            { display: 'DATE', name: 'DATE1', width: 50, sortable: false, align: 'right' }
        ],
        showTableToggleBtn: true,
        sortname: "CUSTOMERNAME asc",
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
        width: 720,
        height: 450,
        striped: true,
        params: [
            { name: 'SelectedFlower', value: "" }
        ],
        onSuccess: function () {

            // $('#fgrdOrderNewF3Details #row0').addClass("TotalRows");
            $("#DivCustomerForSelectedFlwoer .sDiv").css('float', 'left').css('width', '542px');
            $('#DivCustomerForSelectedFlwoer .pDiv').css('padding', '2px').css('border-left', '0px');
            $('#DivCustomerForSelectedFlwoer .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
            $("#DivCustomerForSelectedFlwoer .pDiv").find(".pDiv2").find(".btnseparator").hide();
            $("#DivCustomerForSelectedFlwoer .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -40px').show();
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                window.location.href = "Login.aspx";
            }
        }
    });


    $("#txtShippingDate_Or1").focusout(function () {

        if ($("#txtShippingDate_Or1").val() != "") {

            //if ($("#DivVETInvoiceGridDialog").dialog('isOpen') != true) { //to edit the date in vet page
            //    var Selecteddate = $("#txtShippingDate_Or1").val().split('/');
            //    var newdatestring = new Date().toString("MM/dd/yyyy").split('/');

            //    var Selecteddateformat = new Date(Selecteddate[2], Selecteddate[0] - 1, Selecteddate[1]);
            //    var newdate = new Date(newdatestring[2], newdatestring[0] - 1, newdatestring[1]);

            //    if (Selecteddateformat < newdate) {
            //        //Orders can't create for past date
            //        $("#lblShippingDay_Or1").html("Orders can not be created for past dates");
            //        //$("#txtShippingDate_Or1").focus();
            //        return false
            //    }
            //}
            $("#lblShippingDay_Or1").html(dayNames[new Date($("#txtShippingDate_Or1").val()).getDay()]);

            if ($("#ctl00_DivOrderNo_OrderSave").html().trim() == "" || $("#ctl00_DivOrderNo_OrderSave").html().trim() == "0") {

                ChangeCarrier($("#txtShippingDate_Or1").val());

            }
        }
    });

    //2021/08/14, stop X shortcut
    ////Enable by Prashant For the Short Cut key for X on 08 Apr 2020
    //document.body.addEventListener('keydown', function (e) {
    //    if (e.which == 88) {    //Click X - Future
    //                $("#btnOrderNewDetailsXFuture").click();
    //            }
    //});
    /////////////////
    /////////////////
    //    var focused = document.activeElement;
    //    if ($(".ui-dialog:visible:last")[0].lastChild.id == "InventoryListForOrderEntryDialog" && focused.className != "qsbox") {
    //        if (e.which == 77) { //Click M
    //            $('#btnOrderInventoryMarket').click();
    //        }
    //        if (e.which == 76) { //Click L
    //            $('#btnOrderInventoryLocal').click();
    //        }
    //        if (e.which == 72) {//Click H
    //            $('#btnOrderInventoryHold').click();
    //        }
    //        if (e.which == 65) {//Click A
    //            $('#btnOrderInventoryArriving').click();
    //        }
    //        if (e.which == 82) {//Click R
    //            $('#btnOrderInventoryRefresh').click();
    //        }
    //        if (e.which == 83) {//Click S
    //            $('#btnOrderInventoryStanding').click();
    //        }
    //        if (e.which == 80) {//Click P
    //            $('#btnOrderInventoryPrebooks').click();
    //        }

    //    }
    //});
    function LoadCarrier(callback) {
        //Load Drop down for Carrier Listing from F_CARRIE

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCarriersForDropdownList',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                var data = output.d;
                $('#lstCARRIER_Or1').empty();
                $('#lstCARRIER_Or1').append('<option value=0>Select Carrier</option>');
                for (var i in data) {
                    var Carrier = data[i];
                    $('#lstCARRIER_Or1').append('<option value="' + Carrier.Carrier + '">[' + Carrier.Carrier + "] " + Carrier.Name + '</option>');
                }
                callback(true)
            }
        });
    }


    $("#txtCarrier_Or1").autocomplete({
        source: function (request, response) {
            //
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetCarriersForAutocomplete',
                data: "{'Searchtext': '" + request.term + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    response($.map(data.d, function (item) {
                        return {
                            label: "[" + item.Carrier + "] " + item.Name,
                            Name: item.Name,
                            Carrier: item.Carrier
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
            // $(".ui-menu").css("z-index", 1110);
        },
        select: function (e, i) {

            $("#txtCarrier_Or1").val(i.item.Carrier);
            $("#hfCarrier_Or1").val(i.item.Carrier);
            $("#lstCARRIER_Or1").val(i.item.Carrier);
        },
        change: function (e, i) {

            if (i.item == null || i.item == undefined) {
                //$("#txtCarrier_Or1").val("");
                //$("#txtCarrier_Or1").focus();
                //$("#hfCarrier_Or1").val("");
                $(".ui-menu").css("display", "none");
            }
        },
        minLength: 1,
        autoFocus: true
    });




    function LoadTerms(callback) {
        //Load Drop down for Terms Listing from F_TERMS
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetTermsForDropdown',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                var data = output.d;
                $('#lstTerms_Ordersave').empty();
                $('#lstTerms_Ordersave').append('<option value=0>Select Terms</option>');
                for (var i in data) {
                    var Terms = data[i];
                    $('#lstTerms_Ordersave').append('<option data-desc="' + Terms.TermsDesc.trim() + '" value="' + Terms.Code.trim() + '">[' + Terms.Code.trim() + "]" + Terms.TermsDesc + '</option>');
                }
                callback(true)
            }
        });
    }

    function LoadShipto(callback) {


        //Load Drop down for Shipto Listing from F_SHIPTO
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetShiptoForDropdownByCustomer',
            contentType: "application/json; charset=utf-8",
            data: '{"Customer":"' + $("#ctl00_DivCustomerNo_OrderSave").html() + '"}',
            dataType: "json",
            success: function (output) {
                var data = output.d;
                $('#lstShipto_Ordersave').empty();
                $('#lstShipto_Ordersave').append('<option value=0>Select Shipto</option>');
                var defaultshipto = ""
                for (var i in data) {
                    var Shipto = data[i];


                    var ShiptoName = Shipto.Name;
                    var ShiptoAddress1 = (Shipto.ADDRESS1 == "" ? "" : " - " + Shipto.ADDRESS1)
                    var ShiptoAddress2 = (Shipto.ADDRESS2 == "" ? "" : " - " + Shipto.ADDRESS2)
                    var ShiptoCity = (Shipto.CITY == "" ? "" : " - " + Shipto.CITY)
                    var ShiptoState = (Shipto.STATE == "" ? "" : " - " + Shipto.STATE)
                    //var ShiptoComment = (Shipto.Comment == "" ? "" : " - " + Shipto.Comment)

                    if (Shipto.IsDefault == "1") {
                        defaultshipto = Shipto.Shipto.trim()
                    }

                    //$('#lstShipto_Ordersave').append('<option value="' + Shipto.Shipto.trim() + '">[' + Shipto.Shipto + '] ' + ShiptoName + ShiptoAddress1 + ShiptoCity + ShiptoState + '</option>');
                    $('#lstShipto_Ordersave').append('<option value="' + Shipto.Shipto.trim() + '" data-Name="' + ShiptoName + '" data-Address1="' + Shipto.ADDRESS1 + '" data-Address2="' + Shipto.ADDRESS2 + '" data-City="' + Shipto.CITY + '" data-State="' + Shipto.STATE + '" data-Zip="' + Shipto.ZIP + '" data-Country="' + Shipto.COUNTRY + '" data-Fax="' + Shipto.Fax + '" data-Contact="' + Shipto.Contact+ '" data-Phone="' + Shipto.PHONE + '">[' + Shipto.Shipto + '] ' + ShiptoName + ShiptoAddress1 + ShiptoAddress2 + ShiptoCity + ShiptoState + '</option>');
                }
                /*debugger*/;
                var IsNewOrder = true;
                if ($("#ctl00_DivOrderNo_OrderSave").html().trim() != "" && $("#ctl00_DivOrderNo_OrderSave").html().trim() != "0") { // Called from Order Update Screen
                    IsNewOrder = false;
                }

                if (defaultshipto != "" && IsNewOrder) {
                    $('#lstShipto_Ordersave').val(defaultshipto).trigger("change");
                    $('#hfShipto_Ordersave').val(defaultshipto);
                    //ShipToLoading(defaultshipto);
                }
                callback(true)
            }
        });
    }
    function ShipToLoading(shipto) {

        var CurrentDivid = $("#CustCurrentDivID").html();

        if (CurrentDivid == "DivOrderDetailsDialog") {
            CurrentDivid = "DivOrderCustDetailsPage";
        }

        if (CurrentDivid == "DivVETInvoiceGridDialog") {
            CurrentDivid = "DivVETCustDetailsPage";
        }


        //var selected = $("#lstShipto_Ordersave").find(':selected')
        var selected = $("#lstShipto_Ordersave").find(':selected')
        if (selected.text() == "Select Shipto") {
            $("#" + CurrentDivid + " .trOrderCustDet").find('.tdfsShipToInfo').remove();
            return false
        }
        var shipToAddress1 = selected.data('address1');
        var shipToAddress2 = selected.data('address2');
        var shipToCity = selected.data('city');
        var shipToState = selected.data('state');
        var shipToZip = selected.data('zip');
        var shipToPhone = selected.data('phone');
        var shipToFax = selected.data('fax');
        var shipToContact = selected.data('contact');
        var shipToName = selected.data('name');
        var shipToCountry = selected.data('country');


        $("#" + CurrentDivid + " .trOrderCustDet").find('.tdfsShipToInfo').remove();

        var ShipToDiv = "<td class='tdfsShipToInfo'><fieldset class='fsShipToInfo' style='float: left; width: 285px; height: 96px;'><legend style='font-size: large; background: white;'>SHIP TO</legend>";
        ShipToDiv += "<div class='DivOrderCustShipToDetails' style='margin-bottom:-4px;margin-top: -6px;'><table class='tblOrderCustShipToDetails'>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>NAME</td><td colspan='3'><label id='shipToNameView' style='color: black;white-space: nowrap;'>" + shipToName + "</label></td></tr>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ADDRESS</td><td colspan='3'><label id='shipToAddress1View' style='color: black;white-space: nowrap;'>" + shipToAddress1 + "</label></td></tr>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'></td><td colspan='3'><label id='shipToAddress2View' style='color: black;white-space: nowrap;'>" + shipToAddress2 + "</label></td></tr>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>CITY</td><td style='width: 115px'><label id='shipToCityView' style='color: black;white-space: nowrap;'>" + shipToCity + "</label></td>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 13px;'>STATE</label></td><td><label id='shipToStateView' style='color: black;white-space: nowrap;'>" + shipToState + "</label></td></tr>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ZIP</td><td><label id='shipToZipView' style='color: black;white-space: nowrap;'>" + shipToZip + "</label></td>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>PHONE</label></td><td><label id='shipToPhoneView'  style='color: black;white-space: nowrap;'>" + shipToPhone + "</label></td></tr>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Fax</label></td><td><label id='shipToFaxView'  style='color: black;white-space: nowrap;'>" + shipToFax + "</label></td></tr>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Contact</label></td><td><label id='shipToContactView'  style='color: black;white-space: nowrap;'>" + shipToContact + "</label></td></tr>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Country</label></td><td><label id='shipToCountryView'  style='color: black;white-space: nowrap;'>" + shipToCountry + "</label></td></tr>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px; display:none;'>Store</label></td><td><label id='shipToView'  style='color: black;white-space: nowrap; display:none;'>" + $("#lstShipto_Ordersave").val()+"</label></td></tr>";
        ShipToDiv += "</table></div></fieldset></td>";

        if (shipToName != "") {

            $("#" + CurrentDivid + " .trOrderCustDet").append(ShipToDiv);

            $("#" + CurrentDivid + "").css('width', '1198px');
            if (CurrentDivid == "DivOrderCustDetailsPage") {
                $("#DivOrderDetailsDialog #DivOrderPersonDetails").css('margin-left', '0px');
            }
        }


    }
    $('#lstShipto_Ordersave').live("change", (function () {

        $("#hfShipto_Ordersave").val($("#lstShipto_Ordersave").val());
        var CurrentDivid = $("#CustCurrentDivID").html();
        if ($(this).find('option:selected').text() == "Select Shipto") {
            $("#" + CurrentDivid + " .trOrderCustDet").find('.tdfsShipToInfo').remove();
            if (CurrentDivid == "DivOrderDetailsDialog" || CurrentDivid == "DivOrderNewCustDetailsPage") {
                $("#" + CurrentDivid + " #DivOrderPersonDetails").css('margin-left', '-323px');
           
            }
            return false
        }

        if (CurrentDivid == "DivOrderDetailsDialog") {
            CurrentDivid = "DivOrderCustDetailsPage";
        }

        if (CurrentDivid == "DivVETInvoiceGridDialog") {
            CurrentDivid = "DivVETCustDetailsPage";
        }

        var selected = $(this).find('option:selected');
        var shipToAddress1 = selected.data('address1') == null ? "" : selected.data('address1');
        var shipToAddress2 = selected.data('address2') == null ? "" : selected.data('address2');
        var shipToCity = selected.data('city') == null ? "" : selected.data('city');
        var shipToState = selected.data('state') == null ? "" : selected.data('state');
        var shipToZip = selected.data('zip') == null ? "" : selected.data('zip');
        var shipToPhone = selected.data('phone') == null ? "" : selected.data('phone');
        var shipToFax = selected.data('fax') == null ? "" : selected.data('fax');
        var shipToContact = selected.data('contact') == null ? "" : selected.data('contact');

        var shipToName = selected.data('name') == null ? "" : selected.data('name');
        var shipToCountry = selected.data('country') == null ? "" : selected.data('country');

        $("#" + CurrentDivid + " .trOrderCustDet").find('.tdfsShipToInfo').remove();

        var ShipToDiv = "<td class='tdfsShipToInfo'><fieldset class='fsShipToInfo' style='float: left; width: 285px; height: 96px;'><legend style='font-size: large; background: white;'>SHIP TO</legend>";
        ShipToDiv += "<div class='DivOrderCustShipToDetails' style='margin-bottom:-4px;margin-top: -6px;'><table class='tblOrderCustShipToDetails'>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>NAME</td><td colspan='3'><label id='shipToNameView' style='color: black;white-space: nowrap;'>" + shipToName + "</label></td></tr>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ADDRESS</td><td colspan='3'><label id='shipToAddress1View' style='color: black;white-space: nowrap;'>" + shipToAddress1 + "</label></td></tr>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'></td><td colspan='3'><label id='shipToAddress2View' style='color: black;white-space: nowrap;'>" + shipToAddress2 + "</label></td></tr>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>CITY</td><td style='width: 115px'><label id='shipToCityView' style='color: black;white-space: nowrap;'>" + shipToCity + "</label></td>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 13px;'>STATE</label></td><td><label id='shipToStateView' style='color: black;white-space: nowrap;'>" + shipToState + "</label></td></tr>";
        ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ZIP</td><td><label id='shipToZipView' style='color: black;white-space: nowrap;'>" + shipToZip + "</label></td>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>PHONE</label></td><td><label id='shipToPhoneView'  style='color: black;white-space: nowrap;'>" + shipToPhone + "</label></td></tr>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Fax</label></td><td><label id='shipToFaxView'  style='color: black;white-space: nowrap;'>" + shipToFax + "</label></td></tr>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Contact</label></td><td><label id='shipToContactView'  style='color: black;white-space: nowrap;'>" + shipToContact + "</label></td></tr>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Country</label></td><td><label id='shipToCountryView'  style='color: black;white-space: nowrap;'>" + shipToCountry + "</label></td></tr>";
        ShipToDiv += "<td><label style='color: magenta; margin-right: 7px; display:none;'>Store</label></td><td><label id='shipToView'  style='color: black;white-space: nowrap; display:none;'>" + $("#lstShipto_Ordersave").val().toString()+"</label></td></tr>";
        ShipToDiv += "</table></div></fieldset></td>";

        if (shipToName != "") {

            $("#" + CurrentDivid + " .trOrderCustDet").append(ShipToDiv);

            $("#" + CurrentDivid + "").css('width', '1198px');
            if (CurrentDivid == "DivOrderCustDetailsPage") {
                $("#DivOrderDetailsDialog #DivOrderPersonDetails").css('margin-left', '-20px');
            }
        }
    }));

    var shipmsgdiaopened = false;
    //Pop up dialog creation for shipping message
    $("#DivShippingMessageDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "MESSAGE FOR SHIPPING",
        position: { my: 'left', at: 'center' },
        width: 425,
        modal: true,
        open: function () {
            shipmsgdiaopened = true;
        },
        close: function (e) {

            if ($("#messageOrSaveclicked_OrderSave").html() == "save" && $("#DivOrder1InfoDialog").dialog('isOpen') == false) {
                $("#DivOrder1InfoDialog").dialog("open");
            }
        },
    });

    //Pop up dialog creation for shipping message
    $("#DivCustomerMessageDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "MESSAGE FOR CUSTOMER",
        width: 425,
        position: { my: 'right', at: 'center' },
        modal: true,
        close: function () {
            //$("#DivCustomerMessageDialog").dialog("open");
            if ($("#DivShippingMessageDialog").dialog('isOpen') == false) {
                $("#DivShippingMessageDialog").dialog("open");
            }

        },
    });

    //Pop up dialog creation for print report
    $("#DivPrintReportsDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "",
        width: 257,
        position: { my: 'left', at: 'center' },
        closeOnEscape: false,
        modal: true,
        open: function () {
            $(this).parent().find(".ui-dialog-titlebar-close").hide();
            $("#txtPrintInvoice").val("N");
            $("#txtPrintLabels").val("N");
            $("#txtPrintPicking").val("N");
            $("#txtEmailInvoice").val("N");
            $("#txtFaxInvoice").val("N");
        }
    });

    //Pop up dialog creation for order info message
    $("#DivOrder1InfoDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "",
        width: 550,
        height: 300,
        modal: true,
        buttons: {
            Save: function () {
                //CreateOrUpdateOrder();       //21Mar19 :: Abinaya :: Speed optimization for Save process // commented by belal on 17 Feb 2021
                CreateOrUpdateOrder_For_ConfirmInvoiceOrPrintLablesOrPrintPickingOrEmailInvoiceOrFaxInvoice('N', 'N', 'N', 'N', 'N')
            },
            Confirm: function () {
                CreateOrUpdateOrder_For_ConfirmInvoiceOrPrintLablesOrPrintPickingOrEmailInvoiceOrFaxInvoice('Y', 'N', 'N', 'N', 'N')
            },
            Print: function () {
                CreateOrUpdateOrder_For_ConfirmInvoiceOrPrintLablesOrPrintPickingOrEmailInvoiceOrFaxInvoice('Y', 'Y', 'N', 'N', 'N')
            },
            Email: function () {
                CreateOrUpdateOrder_For_ConfirmInvoiceOrPrintLablesOrPrintPickingOrEmailInvoiceOrFaxInvoice('Y', 'N', 'N', 'Y', 'N')
            },
            Ignore: function () {
                $("#DivOrder1InfoDialog").dialog("close");
            },
        },
        open: function () {

            $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").show();
            $("#DivOrder1InfoDialog").siblings(".ui-dialog-buttonpane").find("button:contains('Confirm')").addClass('dialogbuttonstyle icon-save inv-confirm firstletterunderline order-action-btn')
            $("#DivOrder1InfoDialog").siblings(".ui-dialog-buttonpane").find("button:contains('Print')").addClass('dialogbuttonstyle icon-save inv-print firstletterunderline order-action-btn')
            $("#DivOrder1InfoDialog").siblings(".ui-dialog-buttonpane").find("button:contains('Email')").addClass('dialogbuttonstyle icon-save inv-email firstletterunderline order-action-btn')
            $("#DivOrder1InfoDialog").siblings(".ui-dialog-buttonpane").find("button:contains('Save')").addClass('dialogbuttonstyle icon-save inv-save firstletterunderline order-action-btn')
            $("#DivOrder1InfoDialog").siblings(".ui-dialog-buttonpane").find("button:contains('Ignore')").addClass('dialogbuttonstyle icon-cancel inv-cancel firstletterunderline order-action-btn')
            //LoadCarrier(function (callback) {
            //    if(callback==true) {

            //    }
            //});
            CheckAWBByOrderNo();
            setSalesPersonbyOrder();
        }
    });
    function CheckAWBByOrderNo() {        
        var order = ($("#ctl00_DivOrderNo").html() == null ? 0 : $("#ctl00_DivOrderNo").html().trim());
        var Customer = $("#ctl00_DivCustomerNo_OrderSave").html();
         $.ajax({
            type: "POST",
             url: 'BloomService.asmx/CheckAWBByOrderNo',
             data: "{ 'Order': '" + order + "','Customer': '" + Customer + "' }",
            contentType: "application/json; charset=utf-8",
            async: false,
            dataType: "json",
            success: function (output, status) {
                //debugger;                
                 var data = output.d;
                 LoadWareHouseDDLData();
                 $("#SaveWareHouseDDL").removeClass("hideForEmptyWareHouse");
                 $("#txtSaveWarehouse").addClass("hideForEmptyWareHouse");
                 if (order != "0") {
                     $.ajax({
                        async: false,
                        type: "POST",
                        url: 'BloomService.asmx/GetSaveOrderWarehouse',
                        data: '{"OrderNo":"' + order + '","Customer":"' + Customer + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                        if (output.d != null || output.d != "") {
                           var result = output.d.split('~');
                           $("#SaveWareHouseDDL").val(result[0]);
                        } 
                        }
                     });
                 }
            },

        });
    }
    function setSalesPersonbyOrder() {
        /*debugger*/;
        var OrderSaveProcessCurrentDivID = $("#CustCurrentDivID").html();
        $("#txtSalesMan_Or1").val($("#" + OrderSaveProcessCurrentDivID + " .lblSalesMan").html());

        var ResetOrderNo = $("#DivOrderDetailsDialog").data("Order");
        var divordernewdialog = $("#ui-dialog-title-DivOrderNewDetailsDialog").html();
        var divvetinvgriddialog = $("#ui-dialog-title-DivVETInvoiceGridDialog").html();

        if (divordernewdialog != null && divordernewdialog.toString().toLowerCase() != "alert") {
            var DivVETCurrentDivID = $("#CustCurrentDivID").html();
            if (DivVETCurrentDivID == "DivOrderNewCustDetailsPage" || DivVETCurrentDivID == "DivOrderNewDetailsDialog") {
                $("#txtSalesMan_Or1").val($("#DivOrderNewDetailsDialog .lblSalesMan").html());
                $("#txtShippingDate_Or1").val(new Date().toString("MM/dd/yyyy"));
                $("#lblShippingDay_Or1").html(dayNames[new Date($("#txtShippingDate_Or1").val()).getDay()]);
                //when changing the date carrier will also change by F_DELLS->DELLS information
                $("#txtCutOfftime_Or1").val("");
                ChangeCarrier($("#txtShippingDate_Or1").val());
            }
            else if (DivVETCurrentDivID == "DivVETInvoiceGridDialog") {
                IsDivVETInvoiceGridDialog();
            }
            else if (DivVETCurrentDivID == "DivOrderDetailsDialog") {
                var _OrderNo = $("#ctl00_DivOrderNo").html() != null ? ($("#ctl00_DivOrderNo").html().trim() == "" || $("#ctl00_DivOrderNo").html().trim() == undefined || $("#ctl00_DivOrderNo").html().trim() == "0" ? (ResetOrderNo != undefined ? ResetOrderNo.trim() : "") : $("#ctl00_DivOrderNo").html().trim()) : (ResetOrderNo != undefined ? ResetOrderNo.trim() : "");
                IsCurrentDivIsDivOrderDetailsDialog(ResetOrderNo);
            }
        }
        else if (divvetinvgriddialog != null && divvetinvgriddialog.toString().toLowerCase() != "alert") {
            var DivVETCurrentDivID = $("#CustCurrentDivID").html();
            if (DivVETCurrentDivID == "DivOrderDetailsDialog") { IsCurrentDivIsDivOrderDetailsDialog(ResetOrderNo); }
            else {
                IsDivVETInvoiceGridDialog();
            }
        }
        else if (DivVETCurrentDivID == "DivOrderDetailsDialog") {
            IsCurrentDivIsDivOrderDetailsDialog(ResetOrderNo);
        }
        else {
            var _OrderNo =
                $("#ctl00_DivOrderNo").html() != null ? ($("#ctl00_DivOrderNo").html().trim() == "" || $("#ctl00_DivOrderNo").html().trim() == undefined || $("#ctl00_DivOrderNo").html().trim() == "0" ? (ResetOrderNo != undefined ? ResetOrderNo.trim() : "") : $("#ctl00_DivOrderNo").html().trim()) : (ResetOrderNo != undefined ? ResetOrderNo.trim() : "");
            GetSaleManbyOrderNo(_OrderNo, false);
            $("#txtShippingDate_Or1").val("");
            var setdate = $("#DivOrderDetailsDialog .lblInvoiceDate1").html();
            $("#txtShippingDate_Or1").val(new Date(setdate).toString("MM/dd/yyyy"));
            $("#lblShippingDay_Or1").html(dayNames[new Date($("#txtShippingDate_Or1").val()).getDay()]);
            //ChangeCarrier($("#txtShippingDate_Or1").val());
            GetCarrierFromExistingOrder(_OrderNo)
        }

        
        $("#txtCarrier_Or1").focus();
    }

    function GetCarrierFromExistingOrder(Order) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCarrierFromExistingOrder',
            data: "{ 'Order': '" + Order +"' }",
            contentType: "application/json; charset=utf-8",
            async: false,
            dataType: "json",
            success: function (output, status) {
                //debugger;
                var data = output.d;
                if (data != "" && data != null) {
                    $("#txtCarrier_Or1").val(data);
                    var CarrierCode = data.split("] ")[0].replace("[","");
                    $("#hfCarrier_Or1").val(CarrierCode);
                }
                else {
                    $("#txtCarrier_Or1").val(data);
                }
            },

        });
    }

    function IsCurrentDivIsDivOrderDetailsDialog(ResetOrderNo) {
        var _OrderNo = $("#ctl00_DivOrderNo").html() != null ? ($("#ctl00_DivOrderNo").html().trim() == "" || $("#ctl00_DivOrderNo").html().trim() == undefined || $("#ctl00_DivOrderNo").html().trim() == "0" ? (ResetOrderNo != undefined ? ResetOrderNo.trim() : "") : $("#ctl00_DivOrderNo").html().trim()) : (ResetOrderNo != undefined ? ResetOrderNo.trim() : "");
        var getSlsmanfromOrdergrd = $("#fgrdOrderHeader tr#row" + _OrderNo + " td:eq(30)")[0];
        var getSlsmanfromF6Ordergrd = $("#fgrdCurrentOrderForCustomerHeader tr#row" + _OrderNo + " td:eq(22)")[0];
        if (getSlsmanfromOrdergrd == undefined) {
            if (getSlsmanfromF6Ordergrd == undefined) {
                GetSaleManbyOrderNo(_OrderNo, false);
            }
            else {
                $("#txtSalesMan_Or1").val(getSlsmanfromF6Ordergrd.innerText);
            }
        }
        else {
            //$("#txtSalesMan_Or1").val(getSlsmanfromOrdergrd.innerText);
        }
        debugger
        $("#txtShippingDate_Or1").val("");
        var setdate = $("#DivOrderDetailsDialog .lblInvoiceDate1").html();
        $("#txtShippingDate_Or1").val(new Date(setdate).toString("MM/dd/yyyy"));
        $("#lblShippingDay_Or1").html(dayNames[new Date($("#txtShippingDate_Or1").val()).getDay()]);
        //when changing the date carrier will also change by F_DELLS->DELLS information
        //ChangeCarrier($("txtShippingDate_Or1").val());
        $("#txtShippingDate_Or1").focus();
    }

    function IsDivVETInvoiceGridDialog() {
        var getSlsmanfromARgrd = $("#fgrdARINVCustomer tr#row" + $("#ctl00_DivOrderNo_OrderSave").html().trim() + " td:eq(14)")[0];
        var getSlsmanfromVETgrd = $("#fgrdVETINVCustomer tr#row" + $("#ctl00_DivOrderNo_OrderSave").html().trim() + " td:eq(21)")[0];
        //$("#txtSalesMan_Or1").val(getSlsmanfromARgrd == undefined ? (getSlsmanfromVETgrd == undefined ? $("#DivVETInvoiceGridDialog .lblSalesMan").html() : getSlsmanfromVETgrd.innerText) : getSlsmanfromARgrd.innerText)
        if (getSlsmanfromARgrd == undefined) {
            if (getSlsmanfromVETgrd == undefined) {
                GetSaleManbyOrderNo($("#ctl00_DivOrderNo_OrderSave").html().trim(), true);
            }
            else {
                if (getSlsmanfromVETgrd.innerText != "0") { $("#txtSalesMan_Or1").val(getSlsmanfromVETgrd.innerText); }
                else { GetSaleManbyOrderNo($("#ctl00_DivOrderNo_OrderSave").html().trim(), true); }
            }
        }
        else {
            if (getSlsmanfromARgrd.innerText != "0") { $("#txtSalesMan_Or1").val(getSlsmanfromARgrd.innerText); }
            else { GetSaleManbyOrderNo($("#ctl00_DivOrderNo_OrderSave").html().trim(), true); }
        }
        $("#DivVETInvoiceGridDialog .txtShippingDate_Or1").val("");
        var setdate = $("#DivVETInvoiceGridDialog .lblInvoiceDate1").html();
        $("#DivVETInvoiceGridDialog .txtShippingDate_Or1").val(new Date(setdate).toString("MM/dd/yyyy"));
        $("#DivVETInvoiceGridDialog .lblShippingDay_Or1").html(dayNames[new Date($("#DivVETInvoiceGridDialog .txtShippingDate_Or1").val()).getDay()]);
        //when changing the date carrier will also change by F_DELLS->DELLS information
        // ChangeCarrier($("#DivVETInvoiceGridDialog .txtShippingDate_Or1").val());
        $("#DivVETInvoiceGridDialog .txtShippingDate_Or1").focus();
    }

    function GetSaleManbyOrderNo(OrderNo, isFromVET) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetSaleManbyOrderNo',
            data: "{ 'Oderno': '" + OrderNo + "','isFromVET': '" + isFromVET + "' }",
            contentType: "application/json; charset=utf-8",
            async: false,
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                if (data != "" && data != null) {
                    $("#txtSalesMan_Or1").val(data)
                }
                else {
                    $("#txtSalesMan_Or1").val($("#DivOrderDetailsDialog .lblSalesMan").html());
                }
            },

        });
    }

    //21Mar19 :: Abinaya :: Speed optimization for Save process
    function CreateOrUpdateOrder() {
      
        if ($("#txtSalesMan_Or1").val().toString().trim() == "" || $("#txtSalesMan_Or1").val().toString().trim() == "0") {
            $("#lblShippingDay_Or1").html("Please enter valid Sales-Person!");
            $("#txtSalesMan_Or1").focus();
            return false
        }
        if ($("#txtSaveWarehouse").val() == "" || $("#txtSaveWarehouse").val() == "-1") {
            $.MessageBox("Please select a valid Warehouse!!!");
            return false;
        }
        if ($("#DivVETInvoiceGridDialog").dialog('isOpen') != true) { //to edit the date in vet page
            var Selecteddate = $("#txtShippingDate_Or1").val().split('/');
            var newdatestring = new Date().toString("MM/dd/yyyy").split('/');

            var Selecteddateformat = new Date(Selecteddate[2], Selecteddate[0] - 1, Selecteddate[1]);
            var newdate = new Date(newdatestring[2], newdatestring[0] - 1, newdatestring[1]);

            //if (Selecteddateformat < newdate) {
            //    $("#lblShippingDay_Or1").html("Orders can not be created for past dates");
            //   // $("#txtShippingDate_Or1").focus();
            //    return false
            //}
        }
        if ($("#hfCarrier_Or1").val().trim() != "" && $("#txtCarrier_Or1").val().trim() != "") {

            var Customer = $("#ctl00_DivCustomerNo_OrderSave").html();
            var Carrier = $("#hfCarrier_Or1").val();
            var ShippingDate = $("#txtShippingDate_Or1").val();
            var CargoDate = $("#txtCargoDate_Or1").val();
            var Cutofftime = $("#txtCutOfftime_Or1").val();
            var AWB = $("#txtAWB_Or1").val();
            var WH = $("#txtSaveWarehouse").val();
            if (AWB.trim() == "") {
                AWB = 0;
            }
            var CustMsg1 = $("#txtCustMsg1").val();
            var CustMsg2 = $("#txtCustMsg2").val();
            var CustMsg3 = $("#txtCustMsg3").val();
            var CustMsg4 = $("#txtCustMsg4").val();
            var CustMsg5 = $("#txtCustMsg5").val();

            var ShipMsg1 = $("#txtShipMsg1").val();
            var ShipMsg2 = $("#txtShipMsg2").val();
            var ShipMsg3 = $("#txtShipMsg3").val();
            var ShipMsg4 = $("#txtShipMsg4").val();
            var ShipMsg5 = $("#txtShipMsg5").val();
            var CustPO = $("#txtCustPO_Or1").val();
            var SLSMAN = $("#txtSalesMan_Or1").val();
            var Shipto = $("#shipToView").html();
            var Terms = $("#lstTerms_Ordersave").val();
            var IsNewOrder = "0"
            var OrderNo = ""

            // added by Belal on 29th April 
            var ShipToName = $("#shipToNameView").html() == null ? "" : $("#shipToNameView").html();
            var ShipToAddress1 = $("#shipToAddress1View").html() == null ? "" : $("#shipToAddress1View").html();
            var ShipToAddress2 = $("#shipToAddress2View").html() == null ? "" : $("#shipToAddress2View").html();
            var ShipToCity = $("#shipToCityView").html() == null ? "" : $("#shipToCityView").html();
            var ShipToState = $("#shipToStateView").html() == null ? "" : $("#shipToStateView").html();
            var ShipToZip = $("#shipToZipView").html() == null ? "" : $("#shipToZipView").html();
            var ShipToPhone = $("#shipToPhoneView").html() == null ? "" : $("#shipToPhoneView").html();
            var ShipToFax = $("#shipToFaxView").html() == null ? "" : $("#shipToFaxView").html();
            var ShipToContact = $("#shipToContactView").html() == null ? "" : $("#shipToContactView").html();
            var ShipToCountry = $("#shipToCountryView").html() == null ? "" : $("#shipToCountryView").html(); 

            ShipToName = (ShipToName == "null"? "": ShipToName);
            ShipToAddress1 = (ShipToAddress1 == "null"? "": ShipToAddress1);
            ShipToAddress2 = (ShipToAddress2 == "null" ? "" : ShipToAddress2);
            ShipToCity = (ShipToCity == "null" ? "" : ShipToCity);
            ShipToState = (ShipToState == "null" ? "" : ShipToState);
            ShipToZip = (ShipToZip == "null" ? "" : ShipToZip);
            ShipToPhone = (ShipToPhone == "null" ? "" : ShipToPhone);
            ShipToFax = (ShipToFax == "null" ? "" : ShipToFax);
            ShipToContact = (ShipToContact == "null" ? "" : ShipToContact);
            ShipToCountry = (ShipToCountry == "null" ? "" : ShipToCountry);

            var CalledFromVET = $("#ctl00_DivCalledFromVET_OrderSave").html()


            if ($("#ctl00_DivOrderNo_OrderSave").html().trim() != "" && $("#ctl00_DivOrderNo_OrderSave").html().trim() != "0") { // Called from Order Update Screen
                IsNewOrder = "0";

                OrderNo = $("#ctl00_DivOrderNo_OrderSave").html().trim()
            }
            else { // Called from New Order Screen
                IsNewOrder = "1";
                OrderNo = 0;
            }

            try {
                var orderDetailIDs = [];
                if ($('#DivCurrentOrdersDialog').dialog('isOpen')) {
                    if ($("#ui-dialog-title-DivCurrentOrdersDialog").html().indexOf('Drop') != -1) {
                        if (OrderNo != "" && OrderNo != "0") {

                            $('#fgrdOrderDetails tr:visible').each(function () {
                                if ($(this).attr("id") != "row0") {
                                    if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                        orderDetailIDs.push($(this).attr("id").substring(3));
                                    }
                                }
                            });
                            IsNewOrder = "1";
                            OrderNo = 0
                        }
                    }
                }
            }
            catch (ex) {

            }
            //Create or Update the Order information based on the flag
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/CreateOrUpdateOrder',
                data: '{"ISNewOrder":"' + IsNewOrder + '","OrderNo":"' + OrderNo + '","Customer":"' + Customer + '","ShippingDate":"' + ShippingDate + '","CargoDate":"' + CargoDate
                    + '","Carrier":"' + Carrier + '","Cutofftime":"' + Cutofftime + '","AWB":"' + AWB + '","WH":"' + WH + '","CustPO":"' + CustPO + '","SLSMAN":"' + SLSMAN + '","CustMsg1":"' + CustMsg1
                    + '","CustMsg2":"' + CustMsg2 + '","CustMsg3":"' + CustMsg3 + '","CustMsg4":"' + CustMsg4 + '","CustMsg5":"' + CustMsg5 + '","ShipMsg1":"' + ShipMsg1
                    + '","ShipMsg2":"' + ShipMsg2 + '","ShipMsg3":"' + ShipMsg3 + '","ShipMsg4":"' + ShipMsg4 + '","ShipMsg5":"' + ShipMsg5 + '","Shipto":"' + Shipto
                     + '","Terms":"' + Terms + '","DroporderDetailIDsToNewOrder":"' + orderDetailIDs.join(",") + '","CalledFromVET":"' + CalledFromVET + '","ShipToName":"' + ShipToName
                    + '","ShipToAddress1":"' + ShipToAddress1 + '","ShipToAddress2":"' + ShipToAddress2 + '","ShipToCity":"' + ShipToCity + '","ShipToState":"' + ShipToState
                    + '","ShipToZip":"' + ShipToZip + '","ShipToPhone":"' + ShipToPhone + '","ShipToFax":"' + ShipToFax + '","ShipToContact":"' + ShipToContact + '","ShipToCountry":"' + ShipToCountry + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    $("#hfShipto_Ordersave").val("");
                    if (output.d == "LogOut") {
                        window.location.href = "Login.aspx"
                    }
                    else if (output.d == "Unique error") {
                        $.MessageBox("Invoice# already exist!!!");
                    }
                    else if (output.d == "error") {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                    }
                    else {
                        if (CalledFromVET == "1") {
                            $("#DivVETInvoiceGridDialog").dialog('close');
                            $("#DivOrder1InfoDialog").dialog('close');
                            $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                        }
                        else {

                            if ($("#ui-dialog-title-DivCurrentOrdersDialog").html() != null) {
                                if ($("#ui-dialog-title-DivCurrentOrdersDialog").html().indexOf('Drop') != -1 && $('#DivCurrentOrdersDialog').dialog('isOpen')) {
                                    $("#DivOrder1InfoDialog").dialog("close");
                                    $("#DivOrdersForDropScreenDlg").dialog("close");
                                    $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
                                    $("#fgrdCurrentOrderForCustomerHeader").flexReload({ url: '/url/for/refresh' });
                                    $.MessageBox("New Order Created = " + output.d);
                                    $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                                    $("#DivCurrentOrdersDialog").dialog('close');
                                }
                                else {
                                    //$("#DivOrderDetailsDialog").dialog("close");
                                    //$("#DivOrder1InfoDialog").dialog("close");
                                    //28Mar19 :: Abinaya :: URGENT - FIX2 [Show print dialog only for HOLD<>'Y'] :: starts
                                    var CurrentOrderNum = $("#ctl00_DivOrderNo_OrderSave").html().trim();
                                    var CurrentOrderHeaderHold = $("#fgrdCurrentOrderForCustomerHeader #row" + CurrentOrderNum + "").find("td div").eq(21).html();
                                    if ((CurrentOrderHeaderHold.toLowerCase() == ("Y").toLocaleLowerCase())) {
                                        $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                        $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                        $("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("hide");
                                        $("#DivOrderDetailsDialog").dialog("close");
                                    }
                                    else {
                                        $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                        $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                        $("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("open");
                                    }
                                    //$.MessageBox("New Order Updated = " + output.d);
                                }
                                $("#DivOrder1InfoDialog").dialog('close');
                                //28Mar19 :: Abinaya :: URGENT - FIX2 [Show print dialog only for HOLD<>'Y'] :: ends
                            }
                            else {
                                salemade = true;
                                $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                if (IsNewOrder == "1") {
                                    $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                    $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                    $("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("open");
                                }
                                else {
                                    var OrderNum = $("#ctl00_DivOrderNo_OrderSave").html().trim();
                                    var OrderHeaderHold = $("#fgrdOrderHeader #row" + OrderNum + "").find("td div").eq(10).html();
                                    //Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
                                    //if ((OrderHeaderHold == "*Hold*" || !isvoid)) {
                                    if ((OrderHeaderHold == "*Hold*")) {
                                        $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                        $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                        $("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("hide");
                                    }
                                    else {
                                        $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                        $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                        $("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("open");
                                    }
                                }
                                $("#DivOrder1InfoDialog").dialog('close');
                            }
                        }
                    }
                }
            });
        }
        else {
            $("#txtCarrier_Or1").focus();
        }
    }

    function CreateOrUpdateOrder_For_ConfirmInvoiceOrPrintLablesOrPrintPickingOrEmailInvoiceOrFaxInvoice(PrintInvoice, PrintLabels, PrintPicking, EmailInvoice, FaxInvoice) {

        if ($("#txtSalesMan_Or1").val().toString().trim() == "" || $("#txtSalesMan_Or1").val().toString().trim() == "0") {
            $("#lblShippingDay_Or1").html("Please enter valid Sales-Person!");
            $("#txtSalesMan_Or1").focus();
            return false
        }
        if ($("#txtSaveWarehouse").val() == "" || $("#txtSaveWarehouse").val() == "-1") {
            $.MessageBox("Please select a valid Warehouse!!!");
            return false;
        }
        if ($("#DivVETInvoiceGridDialog").dialog('isOpen') != true) { //to edit the date in vet page
            var Selecteddate = $("#txtShippingDate_Or1").val().split('/');
            var newdatestring = new Date().toString("MM/dd/yyyy").split('/');

            var Selecteddateformat = new Date(Selecteddate[2], Selecteddate[0] - 1, Selecteddate[1]);
            var newdate = new Date(newdatestring[2], newdatestring[0] - 1, newdatestring[1]);

            //if (Selecteddateformat < newdate) {
            //    $("#lblShippingDay_Or1").html("Orders can not be created for past dates");
            //   // $("#txtShippingDate_Or1").focus();
            //    return false
            //}
        }
        if ($("#hfCarrier_Or1").val().trim() != "" && $("#txtCarrier_Or1").val().trim() != "") {
            
            var Customer = $("#ctl00_DivCustomerNo_OrderSave").html();
            var Carrier = $("#hfCarrier_Or1").val();
            var ShippingDate = $("#txtShippingDate_Or1").val();
            var CargoDate = $("#txtCargoDate_Or1").val();
            var Cutofftime = $("#txtCutOfftime_Or1").val();
            var AWB = $("#txtAWB_Or1").val();
            var WH = $("#txtSaveWarehouse").val();
            //if (AWB.trim() == "") {
            //    AWB = 0;
            //}
            var CustMsg1 = $("#txtCustMsg1").val();
            var CustMsg2 = $("#txtCustMsg2").val();
            var CustMsg3 = $("#txtCustMsg3").val();
            var CustMsg4 = $("#txtCustMsg4").val();
            var CustMsg5 = $("#txtCustMsg5").val();

            var ShipMsg1 = $("#txtShipMsg1").val();
            var ShipMsg2 = $("#txtShipMsg2").val();
            var ShipMsg3 = $("#txtShipMsg3").val();
            var ShipMsg4 = $("#txtShipMsg4").val();
            var ShipMsg5 = $("#txtShipMsg5").val();
            var CustPO = $("#txtCustPO_Or1").val().toUpperCase();
            var SLSMAN = $("#txtSalesMan_Or1").val();
            var Shipto = isNaN(parseInt($("#shipToView").html())) ? 0 : parseInt($("#shipToView").html());
            if (typeof Shipto == "undefined") {
                Shipto = 0;
            }
            var Terms = $("#lstTerms_Ordersave").val();
            var IsNewOrder = "0";
            var OrderNo = "";

            debugger;
            // added by Belal on 29th April 
            var ShipToName = $("#shipToNameView").html() == null ? "" : $("#shipToNameView").html();
            var ShipToAddress1 = $("#shipToAddress1View").html() == null ? "" : $("#shipToAddress1View").html();
            var ShipToAddress2 = $("#shipToAddress2View").html() == null ? "" : $("#shipToAddress2View").html();
            var ShipToCity = $("#shipToCityView").html() == null ? "" : $("#shipToCityView").html();
            var ShipToState = $("#shipToStateView").html() == null ? "" : $("#shipToStateView").html();
            var ShipToZip = $("#shipToZipView").html() == null ? "" : $("#shipToZipView").html();
            var ShipToPhone = $("#shipToPhoneView").html() == null ? "" : $("#shipToPhoneView").html();
            var ShipToFax = $("#shipToFaxView").html() == null ? "" : $("#shipToFaxView").html();
            var ShipToContact = $("#shipToContactView").html() == null ? "" : $("#shipToContactView").html();
            var ShipToCountry = $("#shipToCountryView").html() == null ? "" : $("#shipToCountryView").html(); 

            var CalledFromVET = $("#ctl00_DivCalledFromVET_OrderSave").html()


            if ($("#ctl00_DivOrderNo_OrderSave").html().trim() != "" && $("#ctl00_DivOrderNo_OrderSave").html().trim() != "0") { // Called from Order Update Screen
                IsNewOrder = "0";

                OrderNo = $("#ctl00_DivOrderNo_OrderSave").html().trim()
            }
            else { // Called from New Order Screen
                IsNewOrder = "1";
                OrderNo = 0;
            }

            try {
                var orderDetailIDs = [];
                if ($('#DivCurrentOrdersDialog').dialog('isOpen')) {
                    if ($("#ui-dialog-title-DivCurrentOrdersDialog").html().indexOf('Drop') != -1) {
                        if (OrderNo != "" && OrderNo != "0") {

                            $('#fgrdOrderDetails tr:visible').each(function () {
                                if ($(this).attr("id") != "row0") {
                                    if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                        orderDetailIDs.push($(this).attr("id").substring(3));
                                    }
                                }
                            });
                            IsNewOrder = "1";
                            OrderNo = 0
                        }
                    }
                }
            }
            catch (ex) {

            }
            //Create or Update the Order information based on the flag
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/CreateOrUpdateOrder',
                data: '{"ISNewOrder":"' + IsNewOrder + '","OrderNo":"' + OrderNo + '","Customer":"' + Customer + '","ShippingDate":"' + ShippingDate + '","CargoDate":"' + CargoDate
                    + '","Carrier":"' + Carrier + '","Cutofftime":"' + Cutofftime + '","AWB":"' + AWB + '","WH":"' + WH + '","CustPO":"' + CustPO + '","SLSMAN":"' + SLSMAN + '","CustMsg1":"' + CustMsg1
                    + '","CustMsg2":"' + CustMsg2 + '","CustMsg3":"' + CustMsg3 + '","CustMsg4":"' + CustMsg4 + '","CustMsg5":"' + CustMsg5 + '","ShipMsg1":"' + ShipMsg1
                    + '","ShipMsg2":"' + ShipMsg2 + '","ShipMsg3":"' + ShipMsg3 + '","ShipMsg4":"' + ShipMsg4 + '","ShipMsg5":"' + ShipMsg5 + '","Shipto":"' + Shipto
                    + '","Terms":"' + Terms + '","DroporderDetailIDsToNewOrder":"' + orderDetailIDs.join(",") + '","CalledFromVET":"' + CalledFromVET + '","ShipToName":"' + ShipToName
                    + '","ShipToAddress1":"' + ShipToAddress1 + '","ShipToAddress2":"' + ShipToAddress2 + '","ShipToCity":"' + ShipToCity + '","ShipToState":"' + ShipToState
                    + '","ShipToZip":"' + ShipToZip + '","ShipToPhone":"' + ShipToPhone + '","ShipToFax":"' + ShipToFax + '","ShipToContact":"' + ShipToContact + '","ShipToCountry":"' + ShipToCountry + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    
                    $("#hfShipto_Ordersave").val("");
                    if (output.d == "LogOut") {
                        window.location.href = "Login.aspx"
                    }
                    else if (output.d == "Unique error") {
                        $.MessageBox("Invoice# already exist!!!");
                    }
                    else if (output.d == "error") {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                    }
                    else {
                        if (CalledFromVET == "1") {
                            var ID = output.d;
                            debugger;
                            if ($('#DivARINVCustomerGridDialog').dialog('isOpen')) {
                                var date = $("#fgrdARINVCustomer #row" + ID).children("td")[2];
                                $(date).children().text(ShippingDate.substring(0, 8));

                                var po = $("#fgrdARINVCustomer #row" + ID).children("td")[3];
                                $(po).children().text(CustPO);

                                var shipTo = $("#fgrdARINVCustomer #row" + ID).children("td")[4];
                                $(shipTo).children().text(ShipToName);

                                var awb = $("#fgrdARINVCustomer #row" + ID).children("td")[5];
                                $(awb).children().text(AWB);

                                var carrier = $("#fgrdARINVCustomer #row" + ID).children("td")[6];
                                $(carrier).children().text(Carrier);

                                var wh = $("#fgrdARINVCustomer #row" + ID).children("td")[7];
                                $(wh).children().text(WH);

                                var vetTotal = "#fgrdVETINVCustomer .TotalRows";
                                var amountVal = $(vetTotal).children("td")[14];

                                var charge = $("#fgrdARINVCustomer #row" + ID).children("td")[8];
                                $(charge).children().text($(amountVal).children("div").text());

                                
                                //get 4 fields data
                                var chargeVal = $(amountVal).children("div").text().replace(',', '');
                                var paymentDetails = $("#fgrdARINVCustomer #row" + ID).children("td")[9];
                                var paymentVal = $(paymentDetails).children().text().replace(',', '');
                                var creditDetails = $("#fgrdARINVCustomer #row" + ID).children("td")[10];
                                var creditVal = $(creditDetails).children().text().replace(',', '');
                                var adjstmntDetails = $("#fgrdARINVCustomer #row" + ID).children("td")[11];
                                var adjustmentVal = $(adjstmntDetails).children().text().replace(',', '');
                       
                                //set balance
                                var totalPaid = parseFloat(paymentVal) + parseFloat(creditVal) + parseFloat(adjustmentVal);
                                var totalBalance = (parseFloat(chargeVal) - totalPaid);
                                var balance = $("#fgrdARINVCustomer #row" + ID).children("td")[12];
                                $(balance).children().html("<a style='font-weight: bold; color: black' href='#' id='aOrderBalance_" + ID + "'>" + totalBalance.toLocaleString() + "</a>");
                                
                            }
                            else {
                                var vetTotal = "#fgrdVETINVCustomer .TotalRows";

                                var pcsVal = $(vetTotal).children("td")[9];
                                var amountVal = $(vetTotal).children("td")[14];
                                var gpmVal = $(vetTotal).children("td")[16];
                                var dayVal = $("#lblShippingDay_Or1").text().substring(0, 3);
                                
                                var pcs = $("#fgrdOrderHeader #row" + ID).children("td")[22];
                                $(pcs).children().text($(pcsVal).children("div").text());
                                var amount = $("#fgrdOrderHeader #row" + ID).children("td")[24];
                                $(amount).children().text($(amountVal).children("div").text());
                                var gpm = $("#fgrdOrderHeader #row" + ID).children("td")[25];
                                $(gpm).children().text($(gpmVal).children("div").text());

                                var date = $("#fgrdOrderHeader #row" + ID).children("td")[5];
                                $(date).children().text(ShippingDate);

                                var day = $("#fgrdOrderHeader #row" + ID).children("td")[6];
                                $(day).children().text(dayVal);

                                var carrier = $("#fgrdOrderHeader #row" + ID).children("td")[7];
                                $(carrier).children().text(Carrier);

                                var wh = $("#fgrdOrderHeader #row" + ID).children("td")[10];
                                $(wh).children().text(WH);

                                var shipTo = $("#fgrdOrderHeader #row" + ID).children("td")[16];
                                $(shipTo).children().text(ShipToName);

                                var po = $("#fgrdOrderHeader #row" + ID).children("td")[17];
                                $(po).children().text(CustPO);
                            }

                            $("#DivVETInvoiceGridDialog").dialog('close');
                            $("#DivOrder1InfoDialog").dialog('close');

                            
                            //todo
                            //$("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                        }
                        else {

                            if ($("#ui-dialog-title-DivCurrentOrdersDialog").html() != null) {
                                if ($("#ui-dialog-title-DivCurrentOrdersDialog").html().indexOf('Drop') != -1 && $('#DivCurrentOrdersDialog').dialog('isOpen')) {
                                    $("#DivOrder1InfoDialog").dialog("close");
                                    $("#DivOrdersForDropScreenDlg").dialog("close");
                                    $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
                                    $("#fgrdCurrentOrderForCustomerHeader").flexReload({ url: '/url/for/refresh' });
                                    $.MessageBox("New Order Created = " + output.d);
                                    $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                                    $("#DivCurrentOrdersDialog").dialog('close');
                                }
                                else {
                                    //$("#DivOrderDetailsDialog").dialog("close");
                                    //$("#DivOrder1InfoDialog").dialog("close");
                                    //28Mar19 :: Abinaya :: URGENT - FIX2 [Show print dialog only for HOLD<>'Y'] :: starts
                                    var CurrentOrderNum = $("#ctl00_DivOrderNo_OrderSave").html().trim();
                                    var CurrentOrderHeaderHold = $("#fgrdCurrentOrderForCustomerHeader #row" + CurrentOrderNum + "").find("td div").eq(21).html();
                                    if ((CurrentOrderHeaderHold.toLowerCase() == ("Y").toLocaleLowerCase())) {
                                        $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                        $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                        $("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("hide");
                                        $("#DivOrderDetailsDialog").dialog("close");
                                    }
                                    else {
                                        $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                        $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                        //$("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("open");
                                        ConfirmInvoiceOrPrintLablesOrPrintPickingOrEmailInvoiceOrFaxInvoice(PrintInvoice, PrintLabels, PrintPicking, EmailInvoice, FaxInvoice, ShippingDate, Customer, output.d);
                                    }
                                    //$.MessageBox("New Order Updated = " + output.d);
                                }
                                $("#DivOrder1InfoDialog").dialog('close');
                                //28Mar19 :: Abinaya :: URGENT - FIX2 [Show print dialog only for HOLD<>'Y'] :: ends
                            }
                            else {
                                salemade = true;
                                $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                if (IsNewOrder == "1") {
                                    $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                    $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                    //$("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("open");
                                    ConfirmInvoiceOrPrintLablesOrPrintPickingOrEmailInvoiceOrFaxInvoice(PrintInvoice, PrintLabels, PrintPicking, EmailInvoice, FaxInvoice, ShippingDate, Customer, output.d);
                                }
                                else {
                                    var OrderNum = $("#ctl00_DivOrderNo_OrderSave").html().trim();
                                    var OrderHeaderHold = $("#fgrdOrderHeader #row" + OrderNum + "").find("td div").eq(10).html();
                                    //Muthu Nivetha M :: 13 Mar 19 :: For hold tickets restrictions
                                    //if ((OrderHeaderHold == "*Hold*" || !isvoid)) {
                                    if ((OrderHeaderHold == "*Hold*")) {
                                        $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                        $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                        $("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("hide");
                                    }
                                    else {
                                        $("#DivOrder1InfoDialog").parent().find(".ui-dialog-buttonpane").hide();
                                        $("#DivPrintReportsDialog").dialog('option', 'title', "Inv# " + output.d);
                                        //$("#DivPrintReportsDialog").data("InvoiceNo", output.d).dialog("open");
                                        ConfirmInvoiceOrPrintLablesOrPrintPickingOrEmailInvoiceOrFaxInvoice(PrintInvoice, PrintLabels, PrintPicking, EmailInvoice, FaxInvoice, ShippingDate, Customer, output.d);
                                    }
                                }
                                $("#DivOrder1InfoDialog").dialog('close');
                            }
                        }
                    }
                }
            });
        }
        else {
            $("#txtCarrier_Or1").focus();
        }
    }


    $("#txtEmailInvoice,#txtFaxInvoice").keydown(function (e) {
        var key = e.which;
        //78  Y
        //89  N
        //121 y
        //110 n
        //69 E
        //70 F
        //101 e
        //102 f


        //69 - E    
        //70 - F
        //78 - N
        //89 - Y




        if (key == 40 || key == 13) { //up arrow
            $(this).closest('tr').next().find('input').focus();
        }
        else if (key == 38) { //down arrow
            $(this).closest('tr').prev().find('input').focus();
        }

        if (key == 13 && $(this).attr('id') == "txtFaxInvoice") // the enter key code
        {
            $("#ContinuePrintDialog").dialog("open");
        }

        if ($(this).attr('id') == "txtEmailInvoice" && (key == 69 || key == 78 || key == 89)) {
            if (key == 69 || key == 101)
                $(this).val("E");
            else if (key == 78)
                $(this).val("N");
            else
                $(this).val("Y");

            $(this).closest('tr').next().find('input').focus();
        }
        else if ($(this).attr('id') == "txtFaxInvoice" && (key == 70 || key == 78 || key == 89)) {
            $(this).val("");
            return true;
        }
        else {
            return false;
        }
    });

    $("#txtPrintInvoice,#txtPrintLabels,#txtPrintPicking").keydown(function (e) {


        var key = e.which;
        //78  Y
        //89  N
        //121 y
        //110 n
        //69 E
        //70 F
        //101 e
        //102 f
        //38 up arrow
        //40 down arrow


        //69 - E    
        //70 - F
        //78 - N
        //89 - Y

        if (key == 40 || key == 13) { //up arrow
            $(this).closest('tr').next().find('input').focus();
        }
        else if (key == 38) { //down arrow
            $(this).closest('tr').prev().find('input').focus();
        }

        if (($(this).attr('id') == "txtPrintInvoice" || $(this).attr('id') == "txtPrintPicking") && (key == 69 || key == 78 || key == 89)) {
            if (key == 78 || key == 121) {
                $(this).val("N");
            }
            else if (key == 69) {
                $(this).val("E");
            }
            else {
                $(this).val("Y");
            }

            $(this).closest('tr').next().find('input').focus();
            //return true;
        }
        else if (key == 78 || key == 89 || key == 121 || key == 110) {
            if (key == 78 || key == 121) {
                $(this).val("N");
            }
            else {
                $(this).val("Y");
            }

            $(this).closest('tr').next().find('input').focus();
            //return true;
        }

        //if ($(this).attr('id') == "txtPrintInvoice" && (key == 78 || key == 89 || key == 121 || key == 110 || key == 69 || key == 70 || key == 101 || key == 102)) {
        //    //$(this).val("");
        //    if (key == 78 || key == 121) {
        //        $(this).val("N");
        //    }
        //    else {
        //        $(this).val("Y");
        //    }

        //    $(this).closest('tr').next().find('input').focus();
        //    //return true;
        //}
        //else if (key == 78 || key == 89 || key == 121 || key == 110) {
        //    if (key == 78 || key == 121) {
        //        $(this).val("N");
        //    }
        //    else {
        //        $(this).val("Y");
        //    }

        //    $(this).closest('tr').next().find('input').focus();
        //    //return true;
        //}
        else {
            return false;
        }

    });

    $('#txtCustMsg1').unbind('keydown').bind('keydown', function (e) {
        var key = e.which;
        debugger;
        if (key == 13 || key == 34) // the enter key code
        {
            $('#txtCustMsg2').focus();
        }
    });
    $('#txtCustMsg2').unbind('keydown').bind('keydown', function (e) {
        var key = e.which;
        if (key == 13 || key == 34) // the enter key code
        {
            $('#txtCustMsg3').focus();
        }
    });
    $('#txtCustMsg3').unbind('keydown').bind('keydown', function (e) {
        var key = e.which;
        if (key == 13 || key == 34) // the enter key code
        {
            $('#txtCustMsg4').focus();
        }
    });
    $('#txtCustMsg4').unbind('keydown').bind('keydown', function (e) {
        var key = e.which;
        if (key == 13 || key == 34) // the enter key code
        {
            $('#txtCustMsg5').focus();
        }
    });

    //when enter on the last field of customer message it will open the shipping message dialog
    $('#txtCustMsg5').unbind('keydown').bind('keydown', function (e) {
        // alert($("#DivCustomerMessageDialog").data("MessageClicked"));
        var key = e.which;
        if (key == 13 || key == 34) // the enter key code
        {
            if ($("#DivShippingMessageDialog").dialog('isOpen') == false) {
                $("#DivShippingMessageDialog").dialog("open");
            }
        }
    });

   
    $('#txtShipMsg1').unbind('keydown').bind('keydown', function (e) {
        var key = e.which;
        if (key == 13 || key == 34) // the enter key code
        {
            $('#txtShipMsg2').focus();
        }
    });
    $('#txtShipMsg2').unbind('keydown').bind('keydown', function (e) {
        var key = e.which;
        if (key == 13 || key == 34) // the enter key code
        {
            $('#txtShipMsg3').focus();
        }
    });
    $('#txtShipMsg3').unbind('keydown').bind('keydown', function (e) {
        var key = e.which;
        if (key == 13 || key == 34) // the enter key code
        {
            $('#txtShipMsg4').focus();
        }
    });
    $('#txtShipMsg4').unbind('keydown').bind('keydown', function (e) {
        var key = e.which;
        if (key == 13 || key == 34) // the enter key code
        {
            $('#txtShipMsg5').focus();
        }
    });
    //when enter or key down of the last field of customer message it will open the Order1 information dialog
    $('#txtShipMsg5').unbind('keydown').bind('keydown', function (e) {
        // alert($("#DivCustomerMessageDialog").data("MessageClicked"));

        var key = e.which;
        if (key == 13 || key == 34) // the enter key code
        {

            if ($("#DivCustomerMessageDialog").dialog('isOpen') == true) {
                $("#DivCustomerMessageDialog").dialog("close");
            }


            if ($("#DivShippingMessageDialog").dialog('isOpen') == true) {
                $("#DivShippingMessageDialog").dialog("close");
            }

        }


    });

    ////when changing the date carrier will also change by F_DELLS->DELLS information
    function ChangeCarrier(dateText) {
        debugger;
        var shippingDate = new Date($("#txtShippingDate_Or1").val());
        shippingDate.setDate(shippingDate.getDate() - 3);
        var cargoDate = new Date(shippingDate);
        var today = new Date();
        if (today > cargoDate) {
            $("#txtCargoDate_Or1").val(today.toLocaleDateString("en-US"));
        } else {
            $("#txtCargoDate_Or1").val(cargoDate.toLocaleDateString("en-US"));
        }
        var selectedDayNumber = new Date(dateText).getDay();
        var OdrSavProCurCarrierDivID = $("#CustCurrentDivID").html();
        $("#" + OdrSavProCurCarrierDivID + " .lblShippingDay_Or1").html(dayNames[new Date(dateText).getDay()]);
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetCustomerTruckDays',
            data: '{"CustomerNo":"' + $("#ctl00_DivCustomerNo_OrderSave").html() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                var TruckDays = output.d;
                $("#lblShippingDay_Or1").html(dayNames[new Date($("#txtShippingDate_Or1").val()).getDay()]);
                if (TruckDays == '') {
                    $("#" + OdrSavProCurCarrierDivID + " .lblShippingDay_Or1").val("0");
                    $("#" + OdrSavProCurCarrierDivID + " .txtCarrier_Or1").val("");
                    $("#" + OdrSavProCurCarrierDivID + " .hfCarrier_Or1").val("");
                    //$("#lstCARRIER_Or1").val("0");
                    //$("#txtCarrier_Or1").val("");
                    //$("#hfCarrier_Or1").val("");
                    return;
                }
                var CarrierDays = []
                CarrierDays[0] = TruckDays.substr(18, 3).trim(); //Sunday
                CarrierDays[1] = TruckDays.substr(0, 3).trim();//Monday
                CarrierDays[2] = TruckDays.substr(3, 3).trim();//Tuesday
                CarrierDays[3] = TruckDays.substr(6, 3).trim();//Wednesday
                CarrierDays[4] = TruckDays.substr(9, 3).trim();//Thursday
                CarrierDays[5] = TruckDays.substr(12, 3).trim();//Friday
                CarrierDays[6] = TruckDays.substr(15, 3).trim();//Saturday               
               
                $("#lstCARRIER_Or1").val(CarrierDays[selectedDayNumber]);
                if ($("#lstCARRIER_Or1").val() != "0") {
                    $("#txtCarrier_Or1").val($('#lstCARRIER_Or1 :selected').text());
                    $("#hfCarrier_Or1").val($('#lstCARRIER_Or1').val());
                }
                else {
                    $("#txtCarrier_Or1").val("");
                    $("#hfCarrier_Or1").val("");
                }
            }
        });
    }

    //when changing the date carrier will also change by F_DELLS->DELLS information
    //function ChangeCarrier(dateText) {
    //    
    //    var selectedDayNumber = new Date(dateText).getDay()
    //    $("#lblShippingDay_Or1").html(dayNames[new Date(dateText).getDay()]);
    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/GetCustomerTruckDays',
    //        data: '{"CustomerNo":"' + $("#ctl00_DivCustomerNo_OrderSave").html() + '"}',
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (output) {
    //            var TruckDays = output.d;
    //            //alert(TruckDays.length);
    //            if (TruckDays == '') {
    //                $("#lstCARRIER_Or1").val("0");
    //                $("#txtCarrier_Or1").val("");
    //                $("#hfCarrier_Or1").val("");
    //                return;
    //            }
    //            var CarrierDays = []
    //            CarrierDays[0] = TruckDays.substr(12, 2); //Sunday
    //            CarrierDays[1] = TruckDays.substr(0, 2);//Monday
    //            CarrierDays[2] = TruckDays.substr(2, 2);//Tuesday
    //            CarrierDays[3] = TruckDays.substr(4, 2);//Wednesday
    //            CarrierDays[4] = TruckDays.substr(6, 2);//Thursday
    //            CarrierDays[5] = TruckDays.substr(8, 2);//Friday
    //            CarrierDays[6] = TruckDays.substr(10, 2);//Saturday
    //            $("#lstCARRIER_Or1").val(CarrierDays[selectedDayNumber]);
    //            if ($("#lstCARRIER_Or1").val() != "0") {
    //                $("#txtCarrier_Or1").val($('#lstCARRIER_Or1 :selected').text());
    //                $("#hfCarrier_Or1").val($('#lstCARRIER_Or1').val());
    //            }
    //            else {
    //                $("#txtCarrier_Or1").val("");
    //                $("#hfCarrier_Or1").val("");
    //            }
    //            //$("#lstCARRIER_Or1").focus();
    //        }
    //    });
    //}

    //when screen opened from "Order UPDATE" get the information and fill values in the curresponding text boxes
    carrierUpdate();
    function carrierUpdate() {
        debugger;
        if ($("#ctl00_DivOrderNo_OrderSave").html().trim() != "" && $("#ctl00_DivOrderNo_OrderSave").html().trim() != "0") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetOrderHeaderByOrderNo',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: '{"OrderNo":"' + $("#ctl00_DivOrderNo_OrderSave").html() + '","CalledFromVET":"' + $("#ctl00_DivCalledFromVET_OrderSave").html() + '","Customer":"' + $("#ctl00_DivCustomerNo_OrderSave").html() + '"}',
                success: function (output) {
                    debugger
                    
                    var data = output.d;
                    LoadCarrier(function (callback) {

                        if (callback == true) {
                            $("#lstCARRIER_Or1").val(data.Carrier);

                            if ($("#lstCARRIER_Or1").val() != "0") {
                                $("#txtCarrier_Or1").val($('#lstCARRIER_Or1 :selected').text());
                                $("#hfCarrier_Or1").val($('#lstCARRIER_Or1').val());
                            }
                            else {
                                $("#txtCarrier_Or1").val("");
                                $("#hfCarrier_Or1").val("");
                            }
                        }
                    });
                    $("#txtShippingDate_Or1").val(data.ShippingDate.replace(/\-/g, "/"));
                    $("#lblShippingDay_Or1").html(dayNames[new Date(data.ShippingDate).getDay()]);
                    $("#txtCutOfftime_Or1").val(data.CutOff);
                    $("#txtAWB_Or1").val(data.AWB);
                    $("#txtCustMsg1").val(data.CustMsg1);
                    $("#txtCustMsg2").val(data.CustMsg2);
                    $("#txtCustMsg3").val(data.CustMsg3);
                    $("#txtCustMsg4").val(data.CustMsg4);
                    $("#txtCustMsg5").val(data.CustMsg5);
                    $("#txtShipMsg1").val(data.ShipMsg1);
                    $("#txtShipMsg2").val(data.ShipMsg2);
                    $("#txtShipMsg3").val(data.ShipMsg3);
                    $("#txtShipMsg4").val(data.ShipMsg4);
                    $("#txtShipMsg5").val(data.ShipMsg5);
                    $("#txtCustPO_Or1").val(data.PO);
                    $("#txtCarrier_Or1").val(data.Carrier);
                    $("#txtSalesMan_Or1").val(data.SLSMAN);
                    LoadTerms(function (callback) {
                        if (callback == true) {
                            $("#lstTerms_Ordersave").val(data.Terms);
                        }
                    });


                    var shipToAddress1 = data.ShiptoAddress1;
                    var shipToAddress2 = data.ShiptoAddress2;
                    var shipToCity = data.ShiptoCity;
                    var shipToState = data.ShiptoState;
                    var shipToZip = data.ShiptoZip;
                    var shipToPhone = data.Phone;
                    var shipToFax = data.Fax;
                    var shipToContact = data.Contact;
                    var shipToName = data.ShiptoName;
                    var shipToCountry = data.ShiptoCountry;
                    var shipTo = data.Shipto;

                    //alert(data.Shipto);
                    if (data.Shipto != 0) {
                        $("#lstShipto_Ordersave").val(data.Shipto);
                        $("#hfShipto_Ordersave").val(data.Shipto);
                    } else {
                        clearQuickShipToForm();

                        $("#txtQuickShipto").val(shipTo);
                        $("#txtQuickShiptoName").val(shipToName);
                        $("#txtQuickShiptoAddress1").val(shipToAddress1);
                        $("#txtQuickShiptoAddress2").val(shipToAddress2);
                        $("#txtQuickShiptoCity").val(shipToCity);
                        $("#txtQuickShiptoState").val(shipToState);
                        $("#txtQuickShiptoZip").val(shipToZip);
                        $("#txtQuickShiptoCountry").val(shipToCountry);
                        $("#txtQuickShiptoPhone").val(shipToPhone);
                        $("#txtQuickShiptoFax").val(shipToFax);
                        $("#txtQuickShiptoContact").val(shipToContact);
                    }

                    var CurrentDivid = $("#CustCurrentDivID").html();

                    if (CurrentDivid == "DivOrderDetailsDialog") {
                        CurrentDivid = "DivOrderCustDetailsPage";
                    }
                    if (CurrentDivid == "DivVETInvoiceGridDialog") {
                        CurrentDivid = "DivVETCustDetailsPage";
                    }
                    if (CurrentDivid == "") {
                        CurrentDivid = "DivOrderCustDetailsPage";
                    }


                    $("#DivVETCustDetailsPage .trOrderCustDet").find('.tdfsShipToInfo').remove();
                    $("#DivOrderCustDetailsPage .trOrderCustDet").find('.tdfsShipToInfo').remove();

                    var ShipToDiv = "<td class='tdfsShipToInfo'><fieldset class='fsShipToInfo' style='float: left; width: 285px; height: 96px;'><legend style='font-size: large; background: white;'>SHIP TO</legend>";
                    ShipToDiv += "<div class='DivOrderCustShipToDetails' style='margin-bottom:-4px;margin-top: -6px;'><table class='tblOrderCustShipToDetails'>";
                    ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>NAME</td><td colspan='3'><label id='shipToNameView' style='color: black;white-space: nowrap;'>" + shipToName + "</label></td></tr>";
                    ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ADDRESS</td><td colspan='3'><label id='shipToAddress1View' style='color: black;white-space: nowrap;'>" + shipToAddress1 + "</label></td></tr>";
                    ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'></td><td colspan='3'><label id='shipToAddress2View' style='color: black;white-space: nowrap;'>" + shipToAddress2 + "</label></td></tr>";
                    ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>CITY</td><td style='width: 115px'><label id='shipToCityView' style='color: black;white-space: nowrap;'>" + shipToCity + "</label></td>";
                    ShipToDiv += "<td><label style='color: magenta; margin-right: 13px;'>STATE</label></td><td><label id='shipToStateView' style='color: black;white-space: nowrap;'>" + shipToState + "</label></td></tr>";
                    ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ZIP</td><td><label id='shipToZipView' style='color: black;white-space: nowrap;'>" + shipToZip + "</label></td>";
                    ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>PHONE</label></td><td><label id='shipToPhoneView'  style='color: black;white-space: nowrap;'>" + shipToPhone + "</label></td></tr>";
                    ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Fax</label></td><td><label id='shipToFaxView'  style='color: black;white-space: nowrap;'>" + shipToFax + "</label></td></tr>";
                    ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Contact</label></td><td><label id='shipToContactView'  style='color: black;white-space: nowrap;'>" + shipToContact + "</label></td></tr>";
                    ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Country</label></td><td><label id='shipToCountryView'  style='color: black;white-space: nowrap;'>" + shipToCountry + "</label></td></tr>";
                    ShipToDiv += "<td><label style='color: magenta; margin-right: 7px; display:none;'>Store</label></td><td><label id='shipToView'  style='color: black;white-space: nowrap; display:none;'>" + data.Shipto+"</label></td></tr>";
                    ShipToDiv += "</table></div></fieldset></td>";

                    if (shipToName != "") {

                        $("#" + CurrentDivid + " .trOrderCustDet").append(ShipToDiv);

                        $("#" + CurrentDivid + "").css('width', '1198px');
                        if (CurrentDivid == "DivOrderCustDetailsPage") {
                            $("#DivOrderDetailsDialog #DivOrderPersonDetails").css('margin-left', '0px');
                        }
                    }

                }
            });
        }
        else {
            LoadCarrier(function (callback) {
                if (callback == true) {
                }
            });
            LoadTerms(function (callback) {
                if (callback == true) {
                    var CurrentDivIDForTerms = $("#CustCurrentDivID").html();
                    $("#lstTerms_Ordersave").val($("#" + CurrentDivIDForTerms + " .lblTermCode").html());
                }
            });
            //LoadShipto(function (callback) {
            //    if (callback == true) {
            //    }
            //});
        }
        LoadCalendar();
    }
    function LoadCalendar() {
        var Customer = $("#CurrentCustomerNo").html();
        debugger;
        $("#DaysTruckNewOrder").text("");

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
                $("#DaysTruckNewOrder").html(daysText);

            }

        });
    }
    //when key enter on CustPO textbox on order entry screen it will open the print dialog and its option
    //$("#txtCustPO_Or1").keypress(function (e) {
    //    var key = e.which;
    //    if (key == 13) // the enter key code
    //    {

    //    }
    //});

    $("#txtFaxInvoice").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#ContinuePrintDialog").dialog("open");
        }
    });

    $("#txtFaxInvoice").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#ContinuePrintDialog").dialog("open");
        }
    });

    var myshedule = "";
    var PrintFlag = "0";

    $("#ReportPrintDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "",
        width: 300,
        height: 110,
        modal: true,
    });

    $("#PrintlogMsg").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        open: function () {
            IsOrderModifiedAndNotSaved = false;
            PrintFlag = "0";
            //this line was commented because after using Async it is returning an object for the invoiceno
            var InvoiceNo = $("#DivPrintReportsDialog").data("InvoiceNo");
            //var InvoiceNo = $("#DivPrintReportsDialog").data("InvoiceNo")["Result"];
            var PrintInvoice = $("#txtPrintInvoice").val();
            var PrintLabels = $("#txtPrintLabels").val();
            var PrintPicking = $("#txtPrintPicking").val();
            var EmailInvoice = $("#txtEmailInvoice").val();
            var FaxInvoice = $("#txtFaxInvoice").val();
            var ShipDate = $("#txtShippingDate_Or1").val();
            var Customer = $("#ctl00_DivCustomerNo_OrderSave").html();
            $.ajax({
                type: "post",
                url: 'BloomService.asmx/InsertPrintOrderLog',
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: '{ "OrderNo":"' + InvoiceNo
                    + '","PrintInvoice":"' + PrintInvoice + '","PrintShippingReport":"' + PrintLabels + '","PrintPickingList":"'
                    + PrintPicking + '","EmailInvoice":"' + EmailInvoice + '","FaxInvoice":"' + FaxInvoice + '","Customer":"' + Customer + '","ShipDate":"' + ShipDate + '" }',
                success: function (output, status) {
                    //the format of output is:
                    // {"d":{"Result":"success","Id":4,"Exception":null,"Status":5,"IsCanceled":false,"IsCompleted":true,"CreationOptions":0,"AsyncState":null,"IsFaulted":false}}
                    //if (output.d == 'success')
                    if (output.d == 'success') {
                        $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                        $("#ReportPrintDialog").dialog("close");
                        $("#DivPrintReportsDialog").dialog("close");
                        $("#DivOrder1InfoDialog").dialog('close');
                        $("#DivOrderDetailsDialog").dialog('close');
                        $("#ContinuePrintDialog").dialog("close");
                        //$("#DivSaveOrderFlag").html("1");
                        //$("#DivOrderNewDetailsDialog").dialog("close");
                        $("#PrintlogMsg").dialog("close");
                        $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                    }
                    else if (output.d == "LogOut") {
                        window.location.href = "Login.aspx"
                    }
                    else {
                        $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                    }
                }
            });
        },
        close: function () {
            $("#DivSaveOrderFlag").html("1");
            $("#DivOrderNewDetailsDialog").dialog("close");
        }
    });

    function ConfirmInvoiceOrPrintLablesOrPrintPickingOrEmailInvoiceOrFaxInvoice(PrintInvoice, PrintLabels, PrintPicking, EmailInvoice, FaxInvoice, ShipDate, Customer, InvoiceNo) {
        IsOrderModifiedAndNotSaved = false;
        PrintFlag = "0";
        debugger;
        $.ajax({
            type: "post",
            url: 'BloomService.asmx/InsertPrintOrderLog',
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            data: '{ "OrderNo":"' + InvoiceNo
                + '","PrintInvoice":"' + PrintInvoice + '","PrintShippingReport":"' + PrintLabels + '","PrintPickingList":"'
                + PrintPicking + '","EmailInvoice":"' + EmailInvoice + '","FaxInvoice":"' + FaxInvoice + '","Customer":"' + Customer + '","ShipDate":"' + ShipDate + '" }',
            success: function (output, status) {
                if (output.d == 'success') {
                    
                    if (PrintLabels == "Y") { // printLabels mean print invoice

                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GetReportToPrintAtSaveConstant',
                            data: "",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (reportToPrintOption, status) {

                                if (reportToPrintOption.d.toString().includes("1")) {
                                    var w = window.open('GeneratingPDF.html');
                                    $.ajax({
                                        type: "POST",
                                        url: 'BloomService.asmx/PrintInvoiceReportWhileSaving',
                                        data: "{'Order':'" + InvoiceNo + "','Type':'','EmailIDs':'','Subject':'','Body':'','CustName':'','ShippingDate':'" + ShipDate + "','isPrintForEmail':" + false + "}",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (output, status) {
                                            if (output.d.indexOf("error") >= 0) {
                                                w.close()
                                                $.MessageBox("OOPS! Unable to print invoice. Please contact admin!");
                                            }
                                            else if (output.d == null) {
                                                w.close()
                                                $.MessageBox("OOPS! Unable to print invoice. Please contact admin!");
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
                                }

                                if (reportToPrintOption.d.toString().includes("2")) {
                                        var w2 = window.open('GeneratingPDF.html');
                                        $.ajax({
                                            type: "POST",
                                            url: 'BloomService.asmx/PrintPickListWhileSaving',
                                            data: "{'Order':'" + InvoiceNo + "'}",
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (pickListResult, status) {
                                                if (pickListResult.d.indexOf("error") >= 0) {
                                                    w2.close()
                                                    $.MessageBox("OOPS! Unable to print invoice. Please contact admin!");
                                                }
                                                else if (pickListResult.d == null) {
                                                    w2.close()
                                                    $.MessageBox("OOPS! Unable to print invoice. Please contact admin!");
                                                }
                                                else if (pickListResult.d == "No Data") {
                                                    $.MessageBox("No Data");
                                                }
                                                else {
                                                    //var ReportsResult = output.d;
                                                    var ExportedPath2 = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + pickListResult.d;
                                                            w2.location = ExportedPath2;//Report Path
                                                        }
                                                    }
                                        });
                                }

                                if (reportToPrintOption.d.toString().includes("3")) {
                                        var w3 = window.open('GeneratingPDF.html');
                                        $.ajax({
                                            type: "POST",
                                            url: 'BloomService.asmx/PrintShippingLabelWhileSaving',
                                            data: "{'Order':'" + InvoiceNo + "','ShipDate':'" + ShipDate + "'}",
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (labelListResult, status) {
                                                if (labelListResult.d.indexOf("error") >= 0) {
                                                    w3.close()
                                                    $.MessageBox("OOPS! Unable to print invoice. Please contact admin!");
                                                }
                                                else if (labelListResult.d == null) {
                                                    w3.close()
                                                    $.MessageBox("OOPS! Unable to print invoice. Please contact admin!");
                                                }
                                                else if (labelListResult.d == "No Data") {
                                                    $.MessageBox("No Data");
                                                }
                                                else {
                                                    //var ReportsResult = output.d;
                                                    var ExportedPath3 = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + labelListResult.d;
                                                    w3.location = ExportedPath3;//Report Path
                                                }
                                            }
                                        });
                                }

                                
                            }
                        });
                       
                    }
                    else if (EmailInvoice == "Y") {
                        debugger;
                        var Subject = '<%=ConfigurationManager.AppSettings("CompanyName").ToString()%>' + " Invoice No.";
                        var orderNo = InvoiceNo;
                        var ShippingDate = ShipDate;
                        Subject += orderNo + " For shipping date " + ShippingDate;
                        $("#hfEmailorFaxOrder").text("Email");
                        $(".EmailOrderSection").show();
                        $(".FaxOrderSection").hide();
                        var DelType = '\'E\'';  // Remove fax when emailing :: var DelType = '\'E\''+ ',' + '\'F\''; :: modified by Abinaya :: 12Jul2018
                        $.ajax({
                            type: "POST",
                            url: 'BloomService.asmx/GetCustomerDocumentsAddress',
                            data: '{"CustomerNo": "' + Customer + '","DocType":"I","DelType":"' + DelType + '"}',
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
                                $("#DialogEmailOrFaxtheOrder").data('Order', orderNo).dialog("open");
                            }
                        });
                    }

                    debugger;
                    $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                    $("#ReportPrintDialog").dialog("close");
                    $("#DivPrintReportsDialog").dialog("close");
                    $("#DivOrder1InfoDialog").dialog('close');
                    $("#DivOrderDetailsDialog").dialog('close');
                    $("#ContinuePrintDialog").dialog("close");
                    $("#PrintlogMsg").dialog("close");
                    $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                }
                else if (output.d == "LogOut") {
                    window.location.href = "Login.aspx"
                }
                else {
                    $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                }
            }
        });
    }

    //Confirmation before saving the infomation
    $("#ContinuePrintDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "",
        width: 300,
        height: 110,
        modal: true,
        buttons: {
            Yes: function () {
                // removed next to lines since there is no "Print scheduling available  09/21/2019 JAD
                //$("#PrintlogMsg").html("Please wait... Print is scheduling");

                var PrintInvoice = $("#txtPrintInvoice").val();
                var EmailInvoice = $("#txtEmailInvoice").val();
                var FaxInvoice = $("#txtFaxInvoice").val();

                if (PrintInvoice != "N" || EmailInvoice != "N" || FaxInvoice != "N") {
                    $("#PrintlogMsg").dialog("open");
                    $("#DivPrintReportsDialog").dialog("close");
                } else {
                    debugger;
                    $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                    $("#ReportPrintDialog").dialog("close");
                    $("#DivOrder1InfoDialog").dialog('close');
                    $("#DivOrderDetailsDialog").dialog('close');
                    $("#ContinuePrintDialog").dialog("close");    
                    $("#fgrdOrderHeader").flexReload({ url: '/url/for/refresh' });
                    $("#DivPrintReportsDialog").dialog("close");
                    $("#DivSaveOrderFlag").html("1");
                    $("#DivOrderNewDetailsDialog").dialog("close");
                }

                
            },
            No: function () {
                $("#txtPrintInvoice").focus();
                $("#ContinuePrintDialog").dialog("close");
                //2020/09/10, close print report dialog after close continue dialog
                $("#DivPrintReportsDialog").dialog("close");
            }
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        },
        //beforeClose: function () {            
        //    if (PrintFlag == "1") {
        //        alert('s');
        //        clearInterval(myshedule);
        //    }
        //}
    });

    //function PrintFileStatus(InvoiceNo, PrintInvoice, PrintLabels, PrintPicking, ShipDate) {
    //    
    //    PrintFlag = "1";        
    //    $.ajax({
    //        type: "POST",
    //        url: 'BloomService.asmx/GenerateReportsInOrderToPrinter',
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        data: '{ "OrderNo":"' + InvoiceNo + '","PrintInvoice":"' + PrintInvoice + '","PrintPickingList":"' + PrintLabels + '","PrintShippingReport":"' + PrintPicking + '","ShipDate":"' + ShipDate + '" }',
    //        success: function (output, status) {
    //            
    //            clearInterval(myshedule);                
    //        }           
    //    });


    //    let xmlHttp = new XMLHttpRequest();

    //    xmlHttp.open("POST", "BloomService.asmx/GenerateReportsInOrderToPrinter", true);

    //    //response time     
    //    xmlHttp.onreadystatechange = function () {         
    //        if (xmlHttp.readyState == XMLHttpRequest.DONE) {             
    //            //time stop             
    //            //let t1 = performance.now();              
    //            //responseTimes.push(t1 - t0);               
    //            console.log("Post request responsed");                
    //        }          
    //    }      
    //    //time start      
    //    //let t0 = performance.now();       
    //    //------------//            
    //    xmlHttp.send(null);


    //}

    //Terms Dialog
    $("#DivTermsDialog_Ordersave").dialog({
        autoOpen: false,
        resizable: false,
        title: "TERMS",
        width: 400,
        height: 130,
        modal: true,
        buttons: {
            OK: function () {
                $("#DivTermsDialog_Ordersave").dialog("close");
                $(".lblTerms1").html($('#lstTerms_Ordersave option:selected').text().replace('[', '').replace(']', ' '))
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('OK')").addClass('dialogbuttonstyle icon-save');
        }
    });


    //Shipto Dialog
    $("#DivShiptoDialog_Ordersave").dialog({
        autoOpen: false,
        resizable: false,
        title: "SELECT OR CREATE SHIPTO INFO",
        width: 600,
        height: 150,
        modal: true,
        buttons: {
            QuickShipTo: function () {
                $("#QuickShipToDialog").dialog("open");
            },
            CreateNewShipto: function () {

                var Customer = $("#ctl00_DivCustomerNo_OrderSave").html();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetPage',
                    data: '{ "controlName":"pages/PageShipto.ascx","controlPara":"' + Customer + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        $('<div id="DialogCustomerShipto"></div>').dialog({
                            title: 'Shipto Maintenance :: ' + Customer,
                            autoOpen: false,
                            resizable: false,
                            modal: true,
                            width: 1100,
                            close: function (event, ui) {
                                LoadShipto(function (callback) {
                                });
                                $(this).dialog('destroy').remove();
                            },
                            open: function () {
                            }
                        });
                        $("#DialogCustomerShipto").html(output.d).dialog("open");
                    }
                });
            },
            OK: function () {
                //$("#hfShipto_Ordersave").val($("#lstShipto_Ordersave").val())                
                $("#DivShiptoDialog_Ordersave").dialog("close");
            },
        },
        open: function () {
            $("#lstShipto_Ordersave").val($("#shipToView").html());
            $("#hfShipto_Ordersave").val($("#shipToView").html());
            $(".ui-dialog-buttonpane button:contains('OK')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CreateNewShipto')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('QuickShipTo')").addClass('dialogbuttonstyle icon-save');
        }
    });


    //added by belal for QuickShipTo on 29th April 2021
    $("#QuickShipToDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        width: 550,
        height: 350,
        title: 'Shipto Maintenance',
        buttons: {
            Save: function () {

                var shipTo = 0;
                var shipToName = $("#txtQuickShiptoName").val();
                var shipToAddress1 = $("#txtQuickShiptoAddress1").val();
                var shipToAddress2 = $("#txtQuickShiptoAddress2").val();
                var shipToCity = $("#txtQuickShiptoCity").val();
                var shipToState = $("#txtQuickShiptoState").val();
                var shipToZip = $("#txtQuickShiptoZip").val();
                var shipToCountry = $("#txtQuickShiptoCountry").val();
                var shipToPhone = $("#txtQuickShiptoPhone").val().replace(/[()-]/g, '');
                var shipToFax = $("#txtQuickShiptoFax").val().replace(/[()-]/g, '');
                var shipToContact = $("#txtQuickShiptoContact").val();

                var CurrentDivid = $("#CustCurrentDivID").html();

                if (CurrentDivid == "DivOrderDetailsDialog") {
                    CurrentDivid = "DivOrderCustDetailsPage";
                }

                if (CurrentDivid == "DivVETInvoiceGridDialog") {
                    CurrentDivid = "DivVETCustDetailsPage";
                }

                $("#" + CurrentDivid + " .trOrderCustDet").find('.tdfsShipToInfo').remove();

                var ShipToDiv = "<td class='tdfsShipToInfo'><fieldset class='fsShipToInfo' style='float: left; width: 285px; height: 96px;'><legend style='font-size: large; background: white;'>SHIP TO</legend>";
                ShipToDiv += "<div class='DivOrderCustShipToDetails' style='margin-bottom:-4px;margin-top: -6px;'><table class='tblOrderCustShipToDetails'>";
                ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>NAME</td><td colspan='3'><label id='shipToNameView' style='color: black;white-space: nowrap;'>" + shipToName + "</label></td></tr>";
                ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ADDRESS</td><td colspan='3'><label id='shipToAddress1View' style='color: black;white-space: nowrap;'>" + shipToAddress1 + "</label></td></tr>";
                ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'></td><td colspan='3'><label id='shipToAddress2View' style='color: black;white-space: nowrap;'>" + shipToAddress2 + "</label></td></tr>";
                ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>CITY</td><td style='width: 115px'><label id='shipToCityView' style='color: black;white-space: nowrap;'>" + shipToCity + "</label></td>";
                ShipToDiv += "<td><label style='color: magenta; margin-right: 13px;'>STATE</label></td><td><label id='shipToStateView' style='color: black;white-space: nowrap;'>" + shipToState + "</label></td></tr>";
                ShipToDiv += "<tr><td style='padding-right: 10px; color: magenta;'>ZIP</td><td><label id='shipToZipView' style='color: black;white-space: nowrap;'>" + shipToZip + "</label></td>";
                ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>PHONE</label></td><td><label id='shipToPhoneView'  style='color: black;white-space: nowrap;'>" + shipToPhone + "</label></td></tr>";
                ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Fax</label></td><td><label id='shipToFaxView'  style='color: black;white-space: nowrap;'>" + shipToFax + "</label></td></tr>";
                ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Contact</label></td><td><label id='shipToContactView'  style='color: black;white-space: nowrap;'>" + shipToContact + "</label></td></tr>";
                ShipToDiv += "<td><label style='color: magenta; margin-right: 7px;'>Country</label></td><td><label id='shipToCountryView'  style='color: black;white-space: nowrap;'>" + shipToCountry + "</label></td></tr>";
                ShipToDiv += "<td><label style='color: magenta; margin-right: 7px; display:none;'>Store</label></td><td><label id='shipToView'  style='color: black;white-space: nowrap; display:none;'>0</label></td></tr>";
                ShipToDiv += "</table></div></fieldset></td>";

                if (shipToName != "") {

                    $("#" + CurrentDivid + " .trOrderCustDet").append(ShipToDiv);

                    $("#" + CurrentDivid + "").css('width', '1198px');
                    if (CurrentDivid == "DivOrderCustDetailsPage") {
                        $("#DivOrderDetailsDialog #DivOrderPersonDetails").css('margin-left', '0px');
                    }
                }

                $(this).dialog("close");

            },
            Cancel: function () {
                clearQuickShipToForm();
                $(this).dialog("close");
            },
        },
        open: function () {
            clearQuickShipToForm();

            $(".YellowWarning").html("");
            $(".YellowWarning").hide();
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');

            var hfShipto = isNaN(parseInt($("#hfShipto_Ordersave").val())) ? 0 : parseInt($("#hfShipto_Ordersave").val());
            
            $("#txtQuickShipto").val("");
            $("#txtQuickShiptoName").val($("#DivOrderNewCustDetailsPage #shipToNameView").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToNameView").html());
            $("#txtQuickShiptoAddress1").val($("#DivOrderNewCustDetailsPage #shipToAddress1View").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToAddress1View").html());
            $("#txtQuickShiptoAddress2").val($("#DivOrderNewCustDetailsPage #shipToAddress2View").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToAddress2View").html());
            $("#txtQuickShiptoCity").val($("#DivOrderNewCustDetailsPage #shipToCityView").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToCityView").html());
            $("#txtQuickShiptoState").val($("#DivOrderNewCustDetailsPage #shipToStateView").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToStateView").html());
            $("#txtQuickShiptoZip").val($("#DivOrderNewCustDetailsPage #shipToZipView").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToZipView").html());
            $("#txtQuickShiptoCountry").val($("#DivOrderNewCustDetailsPage #shipToCountryView").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToCountryView").html());
            $("#txtQuickShiptoPhone").val($("#DivOrderNewCustDetailsPage #shipToPhoneView").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToPhoneView").html());
            $("#txtQuickShiptoFax").val($("#DivOrderNewCustDetailsPage #shipToFaxView").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToFaxView").html());
            $("#txtQuickShiptoContact").val($("#DivOrderNewCustDetailsPage #shipToContactView").html() == null ? "" : $("#DivOrderNewCustDetailsPage #shipToContactView").html());
            //if (hfShipto != 0) {
            //    $(this).dialog("close");
            //    $.MessageBox("Sorry you already have a shipto");
            //    return false;
            //}

            $("#lstShipto_Ordersave").val(0);
            $("#hfShipto_Ordersave").val(0);
        }
    });

    function clearQuickShipToForm() {
        $("#txtQuickShipto").val("");
        $("#txtQuickShiptoName").val("");
        $("#txtQuickShiptoAddress1").val("");
        $("#txtQuickShiptoAddress2").val("");
        $("#txtQuickShiptoCity").val("");
        $("#txtQuickShiptoState").val("");
        $("#txtQuickShiptoZip").val("");
        $("#txtQuickShiptoCountry").val("");
        $("#txtQuickShiptoPhone").val("");
        $("#txtQuickShiptoFax").val("");
        $("#txtQuickShiptoContact").val("");
    }




    //$("#lstCARRIER_Or1").change(function () {
    //    $("#txtCutOfftime_Or1").focus();
    //});

    ////$("#lstCARRIER_Or1").change(function () {


    ////});


    $("#lstCARRIER_Or1").keydown(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#txtCutOfftime_Or1").focus();
            return false;
        }
    });

    $("#txtShippingDate_Or1").keypress(function (e) {

        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#txtCarrier_Or1").focus();
            return false;
        }
    });

    $("#txtCarrier_Or1").keydown(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#txtCutOfftime_Or1").focus();
            return false;
        }
    });

    $("#txtCutOfftime_Or1").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#txtAWB_Or1").focus();
            return false;
        }
    });
    $("#txtAWB_Or1").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#txtCustPO_Or1").focus();
            return false;
        }
    });
    $("#txtCustPO_Or1").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#txtSalesMan_Or1").focus();
            return false;
        }
    });
    $("#txtSalesMan_Or1").keypress(function (e) {
 /*       debugger;*/
        var key = e.which;
        //console.log(key);
        if (key == 13) // the enter key code
        {
            $(".inv-save").focus();
            return false;
        } else if (key == 99) {
            $(".inv-confirm").click();
            return false;
        }else if (key == 112) {
            $(".inv-print").click();
            return false;
        } else if (key == 101) {
            $(".inv-email").click();
            return false;
        } else if (key == 115) {
            $(".inv-save").click();
            return false;
        } else if (key == 105) {
            $(".inv-cancel").click();
            return false;
        }

    });




    ///*Allow multiple time click on dropdown for post payments action ::ABI:: 07Mar18*/
    //var cc = 0;
    //$('#lstCARRIER_Or1').click(function () {
    //    cc++;
    //    if (cc == 2) {
    //        $(this).change();
    //        cc = 0;
    //    }
    //}).change(function () {
    //    $("#txtCutOfftime_Or1").focus();
    //    cc = -1;
    //});

    /*
    Muthu Nivetha M :: Modified :: 13Mar2020 :: To hide/Show Market,Local,Standing,Hold,Arrving,PreBooked order by the user permission on setting of logged user
    */
    $("#InventoryListForOrderEntryDialog").dialog({
        modal: true,
        autoOpen: false,
        resizable: false,
        title: "Sales Inventory List",
        width: 1280,
        height: $(window).height() - 10,
        focus: function () {
            //var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            //$("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
            //$("#fgrdAvaliableInventoryGridList").focus();
        },
        open: function () {            
            HideOrShowButtonsAsperUserPersmission();
            InventoryListForOrderEntryDialogOpen();
            GetActiveWarehouse(function (callback) { });
        },
        close: function () {

            var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
            if (OrderNo == "0" || OrderNo == "") {
                $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
            }
            else {
                $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
            }
            //$("#InventoryListForOrderEntryDialog").dialog('destroy').remove();
        }
    });    
    //Muthu Nivetha M :: 17Mar2020 :: Modified :: To display active WH for the logged in user on top of grid
    function InventoryListForOrderEntryDialogOpen() {
        var OrderSaveProcessCurrentDivID = $("#CustCurrentDivID").html();

        //setting id for order
        if ($("#ctl00_DivOrderNo_OrderSave").html() != "0") {
            $("#ctl00_DivOrderNo_OrderSave").html($("#ctl00_DivOrderNo_OrderSave").html() == "" ? $("#" + OrderSaveProcessCurrentDivID + " #ctl00_DivOrderNo_OrderSave").html() : $("#ctl00_DivOrderNo_OrderSave").html());
        }
        else {
            if ($("#ctl00_DivOrderNo_OrderSave").html() == "0" && OrderSaveProcessCurrentDivID == "DivOrderNewCustDetailsPage") {
                $("#ctl00_DivOrderNo_OrderSave").html(0);
            }
            else {
                $("#ctl00_DivOrderNo_OrderSave").html($("#" + OrderSaveProcessCurrentDivID + " #ctl00_DivOrderNo_OrderSave").html());
            }
        }
        //$("#ctl00_DivOrderNo_OrderSave").html(OrderSaveProcessCurrentDivID == "DivOrderNewCustDetailsPage" ? 0 : ($("#ctl00_DivOrderNo_OrderSave").html() == "" ? $("#" + OrderSaveProcessCurrentDivID + " #ctl00_DivOrderNo_OrderSave").html() : $("#ctl00_DivOrderNo_OrderSave").html()));

        $("#InventoryAddCustName").html($("#" + OrderSaveProcessCurrentDivID + " .lblCustName1").html());
        $("#InventoryAddCity").html($("#" + OrderSaveProcessCurrentDivID + " .lblCustCity1").html());
        $("#InventoryAddPhone").html($("#" + OrderSaveProcessCurrentDivID + " .lblCustPhone1").html());

        //WH
        $("#InventoryAddWH").html($("#ctl00_DivpgOdrsaveActiveWHs").html() == "" ? "No Active WH" : $("#ctl00_DivpgOdrsaveActiveWHs").html());

        var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
        $("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
        $("#fgrdAvaliableInventoryGridList").focus();
        $("#fgrdAvaliableInventoryGridList").empty();

        var Filter = "";
        var inventoryaccess = $("#ctl00_DivInventoryAccessTypes").html();       
        inventoryaccess = ((inventoryaccess != undefined || inventoryaccess != null) ? inventoryaccess.toString().toLowerCase() : "");
        var defaultflag = "";       
        
        if (inventoryaccess != "") {            
            defaultflag = "";
            var dflagarr = [];
            dflagarr = inventoryaccess.split(',')
            for (index = 0; index < dflagarr.length; index++) {
                var temp = dflagarr[index];
                if (inventoryaccess.toLowerCase().includes(temp.toLowerCase())) {                    
                    //defaultflag = ($("#ctl00_DivpgOdrnewtbltype").html() == "" ? '*' : ("'" + $("#ctl00_DivpgOdrnewtbltype").html() + "'," + "'*'"));
                    defaultflag += "'" + temp.toLowerCase() + "',";                    
                }
            }
            defaultflag += "''";
            Filter = "UPPER(Flag) not in (" + defaultflag + ")";
        }        
        if (defaultflag == "") {
            defaultflag = "''";
            Filter = "1=1";
        }
        defaultqtypeload = 0;
        qtypeload = 0;
        $('#DivAvaliableInventoryGridList [name="q"]').val("");
        isInventoryClickedFrom = "AddOrMarketOrRefresh";        
        ApplyfilterForInventoryList(Filter, "Flag")
        // qtypeload = 2;

        //if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person" || $("#ctl00_LoggedInUserType").html() == "credit manager") {
        //    isInventoryClickedFrom = "AddOrMarketOrRefresh";
        //    var Filter = "Flag in (" + defaultflag + ")";
        //    ApplyfilterForInventoryList(Filter, "Flag")
        //    qtypeload = 2;
        //    IsSalesPerson = true;
        //}
        //else {
        //    $("#fgrdAvaliableInventoryGridList").flexOptions({
        //        params: [{ name: 'Filter', value: '' },
        //        { name: 'FilterColumn', value: '' },
        //        { name: 'Customer', value: $("#ctl00_DivCustomerNo_OrderSave").html() }], query: "", newp: 1
        //    }).flexReload();
        //}
    }

    $("#FlowerFilterForInventoryDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: 'Search by Product Code',
        width: 300,
        height: 130,
        modal: true,
        buttons: {
            Next: function () {
                var Flower = $("#txtFlowerFilterForInventoryList").val();
                if (Flower.trim() != "") {
                    $('#DivAvaliableInventoryGridList [name="qtype"]').val("Flower");
                    $('#DivAvaliableInventoryGridList [name="q"]').val(Flower.toUpperCase());
                    $('#DivAvaliableInventoryGridList [value="Search"]').click();
                }
                else {
                    $("#txtFlowerFilterForInventoryList").focus();
                }
                $("#FlowerFilterForInventoryDialog").dialog("close");
            },
            Close: function () {
                $("#FlowerFilterForInventoryDialog").dialog("close");
            },
        },
        open: function () {

            $("#txtFlowerFilterForInventoryList").val("");
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });
    //$("#ui-dialog-title-FlowerFilterForInventoryDialog").closest('div').remove()

    $("#txtFlowerFilterForInventoryList").keydown(function (e) {
        var key = e.which;
        if (key == 13) {
            // Get the buttons
            var buttons = $("#FlowerFilterForInventoryDialog").dialog("option", "buttons");
            // Calls the event
            buttons["Next"]();
        }
    });

    $("#FarmFilterForInventoryDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Filter Inventory By Farm",
        width: 300,
        height: 130,
        modal: true,
        buttons: {
            Next: function () {
                var Farm = $("#txtFarmFilterForInventoryList").val();
                if (Farm.trim() != "") {
                    $("#FarmFilterForInventoryDialog").dialog("close");
                    $('#DivAvaliableInventoryGridList [name="qtype"]').val("Farm");
                    $('#DivAvaliableInventoryGridList [name="q"]').val(Farm.toUpperCase());
                    $('#DivAvaliableInventoryGridList [value="Search"]').click();
                }
                else {
                    $("#txtFarmFilterForInventoryList").focus();
                }
            },
            Close: function () {
                $("#FarmFilterForInventoryDialog").dialog("close");
            },
        },
        open: function () {
            $("#txtFarmFilterForInventoryList").val("");
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });


    $("#VarietyFilterForInventoryDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Filter Inventory By Variety",
        width: 300,
        height: 150,
        modal: true,
        buttons: {
            Next: function () {
                var Variety = $("#lstVarietyFilterForInventoryList").val();
                if (Variety.trim() != "") {
                    $("#VarietyFilterForInventoryDialog").dialog("close");
                    $('#DivAvaliableInventoryGridList [name="qtype"]').val("Variety");
                    $('#DivAvaliableInventoryGridList [name="q"]').val(Variety.toUpperCase());
                    $('#DivAvaliableInventoryGridList [value="Search"]').click();
                }
                else {
                    $("#lstVarietyFilterForInventoryList").focus();
                }
            },
            Close: function () {
                $("#VarietyFilterForInventoryDialog").dialog("close");
            },
        },
        open: function () {
            $("#lstVarietyFilterForInventoryList").val("");
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

    $("#GradeFilterForInventoryDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Filter Inventory By Grade",
        width: 300,
        height: 150,
        modal: true,
        buttons: {
            Next: function () {
                var Grade = $("#lstGradeFilterForInventoryList").val();
                if (Grade.trim() != "") {
                    $("#GradeFilterForInventoryDialog").dialog("close");
                    $('#DivAvaliableInventoryGridList [name="qtype"]').val("Grade");
                    $('#DivAvaliableInventoryGridList [name="q"]').val(Grade.toUpperCase());
                    $('#DivAvaliableInventoryGridList [value="Search"]').click();
                }
                else {
                    $("#lstGradeFilterForInventoryList").focus();
                }
            },
            Close: function () {
                $("#GradeFilterForInventoryDialog").dialog("close");
            },
        },
        open: function () {


            $("#lstGradeFilterForInventoryList").val("");
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });


    $("#CategoryFilterForInventoryDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Filter Inventory By Category",
        width: 300,
        height: 150,
        modal: true,
        buttons: {
            Next: function () {
                var Category = $("#lstCategoryFilterForInventoryList").val();
                if (Category.trim() != "") {
                    $("#CategoryFilterForInventoryDialog").dialog("close");
                    $('#DivAvaliableInventoryGridList [name="qtype"]').val("CAT");
                    $('#DivAvaliableInventoryGridList [name="q"]').val(Category.toUpperCase());
                    $('#DivAvaliableInventoryGridList [value="Search"]').click();
                }
                else {
                    $("#lstCategoryFilterForInventoryList").focus();
                }
            },
            Close: function () {
                $("#CategoryFilterForInventoryDialog").dialog("close");
            },
        },
        open: function () {
            $("#lstCategoryFilterForInventoryList").val("");
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });

    $("#ColorFilterForInventoryDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Filter Inventory By Color",
        width: 300,
        height: 150,
        modal: true,
        buttons: {
            Next: function () {
                var Color = $("#lstColorFilterForInventoryList").val();
                if (Color.trim() != "") {
                    $("#ColorFilterForInventoryDialog").dialog("close");
                    $('#DivAvaliableInventoryGridList [name="qtype"]').val("Color");
                    $('#DivAvaliableInventoryGridList [name="q"]').val(Color.toUpperCase());
                    $('#DivAvaliableInventoryGridList [value="Search"]').click();
                }
                else {
                    $("#lstColorFilterForInventoryList").focus();
                }
            },
            Close: function () {
                $("#ColorFilterForInventoryDialog").dialog("close");
            },
        },
        open: function () {
            $("#lstColorFilterForInventoryList").val("");

            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });


    $("#OtherFiltersForInventoryListDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: "Other Filters For Inventory",
        width: 497,
        height: 210,
        modal: true,
        buttons: {
            Next: function () {
                var selectedFilter = $("#DivInvetoryOtherFilter").find('button.is-checked')[0].value
                var FilterValue = $("#txtOtherFilterForInventoryList").val();
                if (FilterValue.trim() != "") {
                    if (selectedFilter == "AWB") {
                        var Filter = "RIGHT(inv.LOT, 4)='" + FilterValue + "'"
                        ApplyfilterForInventoryList(Filter, "LOT")
                    }
                    else if (selectedFilter == "Aged") {

                    }
                    else if (selectedFilter == "Country") {
                        var Filter = "Country='" + FilterValue + "'"
                        ApplyfilterForInventoryList(Filter, "Country")
                    }
                    else if (selectedFilter == "Type") {
                        var Filter = "InvenType='" + FilterValue + "'"
                        ApplyfilterForInventoryList(Filter, "InvenType");
                    }
                    else if (selectedFilter == "WH") {
                        var activeWH = $("#ctl00_DivpgOdrsaveActiveWHs").html() == "" ? "" : $("#ctl00_DivpgOdrsaveActiveWHs").html();
                        if (activeWH == "") {
                            FilterValue = ((FilterValue == "" || FilterValue == undefined || FilterValue == null) ? "" : FilterValue.toUpperCase());
                            $.MessageBox("Please activate the warehouse code <b>" + FilterValue + "</b> in settings");
                            return false;
                        }
                        if (activeWH != "") {
                            FilterValue = ((FilterValue == "" || FilterValue == undefined || FilterValue == null) ? "" : FilterValue.toUpperCase());
                            if ((activeWH.toString().toLowerCase().includes(FilterValue.toLowerCase())) == false) {
                                $.MessageBox("Please activate the warehouse code <b>" + FilterValue + "</b> in settings");
                                return false;
                            }
                        }
                        var Filter = "WH='" + FilterValue + "'"
                        ApplyfilterForInventoryList(Filter, "WH")
                    }
                    $("#OtherFiltersForInventoryListDialog").dialog("close");
                }
            },
            Close: function () {
                $("#OtherFiltersForInventoryListDialog").dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
        }
    });




    $('#DivInvetoryOtherFilter').each(function (i, buttonGroup) {
        var $buttonGroup = $(buttonGroup);
        $buttonGroup.on('click', 'button', function () {
            $("#txtOtherFilterForInventoryList").val("");
            $buttonGroup.find('.is-checked').removeClass('is-checked');
            $(this).addClass('is-checked');

            $("#txtOtherFilterForInventoryList").show();
            $("#lblOtherFilterForInventory").html($(this).val());
            $("#txtOtherFilterForInventoryList").focus();

            if ($(this).val() == "AWB") {

                $("#txtOtherFilterForInventoryList").css("width", "150px")
            }
            else if ($(this).val() == "Aged") {

            }
            else if ($(this).val() == "Country") {

                $("#txtOtherFilterForInventoryList").css("width", "30px")
            }
            else if ($(this).val() == "Type") {

                $("#txtOtherFilterForInventoryList").css("width", "30px")
            }
            else if ($(this).val() == "WH") {
                $("#txtOtherFilterForInventoryList").css("width", "30px")
            }
        });
    });


    $("#btnOrderInventorySearch").die('click').live('click', function () {
        $("#FlowerFilterForInventoryDialog").dialog("open");
    });

    $("#btnOrderInventoryOther").die('click').live('click', function () {
        $("#OtherFiltersForInventoryListDialog").dialog("open");
    });


    $("#btnOrderInventoryFarm").die('click').live('click', function () {
        $("#FarmFilterForInventoryDialog").dialog("open");
    });

    $("#btnOrderInventoryVariety").die('click').live('click', function () {

        $("#VarietyFilterForInventoryDialog").dialog("open");
    });

    $("#btnOrderInventoryCategory").die('click').live('click', function () {
        $("#CategoryFilterForInventoryDialog").dialog("open");
    });

    $("#btnOrderInventoryGrade").die('click').live('click', function () {
        $("#GradeFilterForInventoryDialog").dialog("open");
    });

    $("#btnOrderInventoryColor").die('click').live('click', function () {
        $("#ColorFilterForInventoryDialog").dialog("open");
    });

    $("#txtQty_AddOrderDetail").keydown(function (e) {
        if (e.which == 40) {
            $('#txtPrice_AddOrderDetail').focus();
            e.stopPropagation()
            return false;
        } else if (e.which == 13) {
            if ($("#txtPrice_AddOrderDetail").attr('disabled') == "disabled") {
                $("#txtPlusFuel_AddOrderDetail").focus()
                e.stopPropagation();
                return false;
            }
            else {
                $("#txtPrice_AddOrderDetail").focus()
                e.stopPropagation();
                return false;
            }
        }
    });

    $("#txtQty_AddOrderDetail").keypress(function (e) {
        if (e.which == 13) {
            if ($("#txtPrice_AddOrderDetail").attr('disabled') == "disabled") {
                $("#txtPlusFuel_AddOrderDetail").focus()
                e.stopPropagation();
                return false;
            }
            else {
                $("#txtPrice_AddOrderDetail").focus()
                e.stopPropagation();
                return false;
            }
        }
    })

    $("#txtPlusFuel_AddOrderDetail").keypress(function (e) {
        if (e.which == 13) {
             $("#txtNewBoxCode_AddOrderDetail").focus();
            //$("#txtSaleType_AddOrderDetail").focus();
            e.stopPropagation();
            return false;
        }
    });

    $("#txtPlusFuel_AddOrderDetail").keydown(function (e) {
        if (e.which == 40) {
            $("#txtNewBoxCode_AddOrderDetail").focus();
            e.stopPropagation();
            return false;
        }
    });



$("#txtPlusFuel_AddOrderDetail").focusout(function () {
        //var selectedrowid = $("#fgrdAvaliableInventoryGridList .trSelectedCheck").attr('id').replace('row', '');
        //var Fuel = $("#aOrderInventoryFuel_" + selectedrowid).html();
        //var Units = $("#aOrderInventoryUnits_" + selectedrowid).html();
        //var Price = $("#txtPrice_AddOrderDetail").val();
        var PlusFuel = (($("#txtPlusFuel_AddOrderDetail").val() == "") ? $("#txtPlusFuel_AddOrderDetail").attr('placeholder') : $("#txtPlusFuel_AddOrderDetail").val());
        //var lineFuelCustomer = $("#aOrderCustomerlinefuel_" + selectedrowid).html();
        //var plusfuel = parseFloat(parseFloat(Price) + (parseFloat(Fuel) / parseFloat(Units))).toFixed(4)
        $("#txtPrice_AddOrderDetail").val(parseFloat(parseFloat(PlusFuel) - parseFloat($("#lblFuel_AddOrderDetail").html())).toFixed(4));
        //$("#lblFuel_AddOrderDetail").html(parseFloat((parseFloat(Fuel) / parseFloat(Units))).toFixed(4));
        // calc GPM
        calcGPMAfterChangePriceInOrderDetail("fuel");

        //checkForPriceChange();
    });

    $("#txtPrice_AddOrderDetail").keydown(function (e) {
        setTimeout(function () {
            if (e.which == 40) {
                $('#txtNewBoxCode_AddOrderDetail').focus();
                e.stopPropagation();
                return false;
            } else if (e.which == 38) {
                $('#txtQty_AddOrderDetail').focus();
                e.stopPropagation();
                return false;
            } else if (e.which == 13) {
                $("#txtSaleType_AddOrderDetail").focus();
                //checkForPriceChange();
                e.stopPropagation();
                return false;
            }
        });
    });

    $("#txtPrice_AddOrderDetail").focusout(function () {
        //var selectedrowid = $("#fgrdAvaliableInventoryGridList .trSelectedCheck").attr('id').replace('row', '');
        //var Fuel = $("#aOrderInventoryFuel_" + selectedrowid).html();
        //var Units = $("#aOrderInventoryUnits_" + selectedrowid).html();
        //var Price = $("#txtPrice_AddOrderDetail").val();
        var Price = (($("#txtPrice_AddOrderDetail").val() == "") ? $("#txtPrice_AddOrderDetail").attr('placeholder') : $("#txtPrice_AddOrderDetail").val());
        ///var lineFuelCustomer = $("#aOrderCustomerlinefuel_" + selectedrowid).html();
        //var plusfuel = parseFloat(parseFloat(Price) + (parseFloat(Fuel) / parseFloat(Units))).toFixed(4)

        // $("#txtPlusFuel_AddOrderDetail").val(parseFloat(parseFloat(Price) + parseFloat($("#lblFuel_AddOrderDetail").html())).toFixed(4));
        $("#txtPlusFuel_AddOrderDetail").val("");
        $("#txtPlusFuel_AddOrderDetail").attr('placeholder', parseFloat(parseFloat(Price) + parseFloat($("#lblFuel_AddOrderDetail").html())).toFixed(4));

        //$("#lblFuel_AddOrderDetail").html(parseFloat((parseFloat(Fuel) / parseFloat(Units))).toFixed(4));

        //calc GPM
        //if (parseFloat(Price) > parseFloat(0)) {
        //    var cost = parseFloat(0);
        //    cost = $("#lblCost_AddOrderDetail").html();
        //    var gpm = (((parseFloat(Price).toFixed(2) - parseFloat(cost).toFixed(2)) / parseFloat(Price).toFixed(2)) * 100);
        //    $("#lblGPM_AddOrderDetail").html(parseFloat(gpm).toFixed(1) + "%");
        //}
        calcGPMAfterChangePriceInOrderDetail("price");

        //checkForPriceChange();
    });

    function checkForPriceChange() {
        var id = $("#lblInventorySelectedRowID_AddOrderDetail").html();
        var actualPrice = parseFloat($("#aOrderInventoryActualPrice_" + id).html());
        actualPrice = isNaN(actualPrice) ? 0 : actualPrice;
        var priceAfter10Percent = actualPrice * 0.90;
        var currentPrice = parseFloat($("#txtPrice_AddOrderDetail").val() == "" ? $("#txtPrice_AddOrderDetail").attr("placeholder") : $("#txtPrice_AddOrderDetail").val());
        currentPrice = isNaN(currentPrice) ? 0 : currentPrice;
        var cost = parseFloat($("#lblCost_AddOrderDetail").html());
        cost = isNaN(cost) ? 0 : cost;
        var boxes = parseFloat($("#txtQty_AddOrderDetail").val() == "" ? $("#txtQty_AddOrderDetail").attr("placeholder") : $("#txtQty_AddOrderDetail").val());
        boxes = isNaN(boxes) ? 0 : boxes;
        var difference = priceAfter10Percent - currentPrice;


        var inventoryId = $("#aOrderInventoryINVIDs_" + id).html();
        var customerNo = $("#ctl00_DivCustomerNo_OrderSave").html();

        if (currentPrice < priceAfter10Percent) {

            var hasPermissionToModifyPrice = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(15, 1).ToString()%>' == "Y" ? true : false;
                if (!hasPermissionToModifyPrice) {
                    $.ajax({
                        async: false,
                        type: "POST",
                        url: 'BloomService.asmx/SaveInformationForApprove',
                        data: '{"inventoryId":"' + inventoryId + '","customerNo":' + customerNo + ',"currentPrice":' + currentPrice + ',"cost":' + cost + ',"boxes":' + boxes + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (output, status) {
                            debugger;
                            isPriceApprovalNeeded = true;
                            if (isPriceApprovalNeeded) {
                                $.ajax({
                                    async: false,
                                    type: "POST",
                                    url: 'BloomService.asmx/CheckForPriceApproval',
                                    data: '{"inventoryId":"' + inventoryId + '","customerNo":' + customerNo + ',"currentPrice":' + currentPrice + ',"cost":' + cost + ',"boxes":' + boxes + '}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output, status) {
                                        debugger;
                                       var outputArray = output.d.split('@');
                                        var ApprovalStatus = outputArray[0];
                                        var RejectReason = outputArray[1];

                                        if (ApprovalStatus == "Y") {
                                            isPriceApprovalNeeded = false;
                                            $("#txtNewBoxCode_AddOrderDetail").focus();
                                        }
                                        else if (ApprovalStatus == "N") {
                                            //Added By: Subhajit On: 06-17-2022
                                            //Show denied message
                                            $.MessageBox({
                                                buttonDone: "Ok",
                                                buttonFail: undefined,
                                                message: "<h3 style='color: red;'>Your request is rejected. Please change the price details.</h5><p><b>Reason: " + RejectReason + "</b></p> <p>Price requested = " + currentPrice.toFixed(4) + "</p> <p>Price (-10%) = " + priceAfter10Percent.toFixed(4) + "</p> <p>Please put additional " + difference.toFixed(4) + "!</p>"
                                            }).done(function () {
                                                if ($("#txtPrice_AddOrderDetail").attr('disabled') == "disabled")
                                                    $("#txtPlusFuel_AddOrderDetail").focus()
                                                else
                                                    $("#txtPrice_AddOrderDetail").focus();
                                            });
                                        } else {
                                            $.MessageBox({
                                                buttonDone: "Ok",
                                                buttonFail: "Cancel",
                                                message: "<h3>You need permission to update price.</h5> <p>Price requested = " + currentPrice.toFixed(4) + "</p> <p>Price (-10%) = " + priceAfter10Percent.toFixed(4) + "</p> <p>Please put additional " + difference.toFixed(4) + " to the Price or wait for approval!</p>"
                                            }).done(function () {
                                                if ($("#txtPrice_AddOrderDetail").attr('disabled') == "disabled")
                                                    $("#txtPlusFuel_AddOrderDetail").focus()
                                                else
                                                    $("#txtPrice_AddOrderDetail").focus();

                                                checkForPriceChange();
                                            }).fail(function () {
                                                //Modified By: Subhajit On: 06-07-2022
                                                // delete approval entry
                                                $.ajax({
                                                    async: false,
                                                    type: "POST",
                                                    url: 'BloomService.asmx/DeletePriceApproval',
                                                    data: '{"inventoryId":"' + inventoryId + '","customerNo":' + customerNo + ',"currentPrice":' + currentPrice + ',"cost":' + cost + ',"boxes":' + boxes + '}',
                                                    contentType: "application/json; charset=utf-8",
                                                    dataType: "json",
                                                    success: function (output, status) {
                                                        if ($("#txtPrice_AddOrderDetail").attr('disabled') == "disabled")
                                                            $("#txtPlusFuel_AddOrderDetail").focus()
                                                        else
                                                            $("#txtPrice_AddOrderDetail").focus();
                                                    }
                                                });
                                            });
                                        }
                                    }
                                });
                            }
                        }
                    });
                }
            }
    }

    $("#txtNewBoxCode_AddOrderDetail").keypress(function (e) {
        if ($(this).val().toString().length > 9) {
            $.MessageBox("Labels design does not support more than 10 characters!!");
            $(this).val("");
            return false;
        }
        if (e.which == 13) {
            $("#txtSaleType_AddOrderDetail").focus();
        }
    });
    $("#txtBoxCode_FutureOrderDetail").keypress(function (e) {
        if ($(this).val().toString().length > 9) {
            $.MessageBox("Labels design does not support more than 10 characters!!");
            $(this).val("");
            return false;
        }
    });

    $("#txtNewBoxCode_AddOrderDetail").keydown(function (e) {
        if (e.which == 38) {
            $('#txtPrice_AddOrderDetail').focus();
            e.stopPropagation()
            return false;
        }
        if (e.which == 40) {
            $("#txtSaleType_AddOrderDetail").focus();
            e.stopPropagation()
            return false;
        }
    });

    $("#txtSaleType_AddOrderDetail").keydown(function (e) {

        if (e.which == 38) {
            $('#txtNewBoxCode_AddOrderDetail').focus();
            e.stopPropagation()
            return false;
        }
        if (e.which == 40) {

            if ($('#fgrdOrderDetails .trChecked').length > 0) {
                $('#btnInvSaveAndNext').focus()
            }
            else {
                $('#btnInvSave').focus();
            }

            e.stopPropagation()
            return false;
        }
        if (e.which == 13) {
            if ($("#tdmultiplefarms").css('display') == "none") {
                if ($('#fgrdOrderDetails .trChecked').length > 0) {
                    $("#AddOrderDetailFromInventoryDialog").next('div').find('button')[0].focus();
                }
                else {
                    $("#AddOrderDetailFromInventoryDialog").next('div').find('button')[1].focus();
                }

            }
            else {
                $("#lstMultipleFarms_AddOrderDetail").focus();
            }
            e.stopPropagation()
            return false;
        }

    });

    $("#txtQty_AddOrderDetail,#txtPrice_AddOrderDetail,#txtPlusFuel_AddOrderDetail,#txtSaleType_AddOrderDetail,#txtStoreNo_AddOrderDetail,#txtBoxCode_AddOrderDetail,#txtFlowerName_AddOrderDetail,#txtUpcCode_AddOrderDetail,#txtUpcPrice_AddOrderDetail,#txtDateCode_AddOrderDetail").keydown(function (e) {
        if (e.which == 40) {

            $(this).closest('tr').next().find('input')[0].focus();
        }
        if (e.which == 13) {
            var input = $(this).closest('tr').next().find('input');
            if (input) {
                if ($(this).closest('tr').next().find('input')[0]) {
                    if ($(this).attr('id') == "txtDateCode_AddOrderDetail") {
                        //setTimeout(function () { $(this).closest('tr').next().find('input')[0].focus(); }, 200);
                    } else {
                        $(this).closest('tr').next().find('input')[0].focus();
                    }
                } else {
                    if (!$($(this).parents('tr').next().find('input')[0]).attr('disabled')) {
                        $(this).parents('tr').next('tr').find('input').focus();
                    }
                }
            } 
        }
    });


    $("#lstMultipleFarms_AddOrderDetail").keypress(function (event) {
        var key = event.which;
        if (key == 13) // the enter key code
        {

            $("#AddOrderDetailFromInventoryDialog").next('div').find('button')[1].focus();
            return false;
            e.stopPropagation()
        }
    });


    var sAndNextCheckedCount = 0
    var sAndNextFirstEntry = false
    var isUserClickClose = true
    var SQLId = $("#lblSQLIDs_AddOrderDetail").html();
    var Title = "";
    if (SQLId != "" || SQLId != "0") {
        Title = "Edit Order details";
    }
    else {
        Title = "ADD Order details"
    }

    $("#AddOrderDetailFromInventoryDialog").dialog({
        modal: true,
        autoOpen: false,
        resizable: false,
        title:Title,
        width: 750,
        height: 420,
        open: function () {
            debugger
            sAndNextFirstEntry = $("#OrderUpdateIsCheckFirst").val() == 1 ? true : false;
            isUserClickClose = true;
            //alert($("#ctl00_DivOrderNo_OrderSave").html());             
            if ($('#fgrdOrderDetails .trChecked').length > 0) {
                $('#btnInvSAndNext').show();
                if (sAndNextFirstEntry == true) {
                    sAndNextCheckedCount = $('#fgrdOrderDetails .trChecked').length;
                    $("#OrderUpdateIsCheckFirst").val(0)

                }
            }
            else {
                $('#btnInvSAndNext').hide();
            }
            $(".YellowWarning").hide();
            $(".YellowWarning").html("");
            var IsGPMYN = '<%=Session("LoginUserDetails").ORDER.ToString().Substring(84, 1).ToString()%>' == "Y" ? true : false;
            if (IsGPMYN == true) {
                $(".gpmVisibility").show()
            }
            else {
                $(".gpmVisibility").hide()
            }
            $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
            //$(".ui-dialog-buttonpane button:contains('Save And Next')").removeClass('dialogbuttonstyle icon-save').addClass('dialogbuttonstyle icon-ok');
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel red');
            $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel red');
            $("#txtSaleType_AddOrderDetail").val("");
            setTimeout(function () {
                $("#txtQty_AddOrderDetail").focus();
            }, 500);
            if ($("#AddOrderDetailFromInventoryDialog").data("inData") == undefined) {
                InventoryId.push($("#lblInvenIDs_AddOrderDetail").html());
                isFromARINVS = $("#InventoryListForOrderEntryDialog").data("inData") == undefined ? "" : "PageARINVS";
            }
            else {
                if ($("#AddOrderDetailFromInventoryDialog").data("inData")["InventoryId"] != "" || $("#AddOrderDetailFromInventoryDialog").data("inData")["InventoryId"] != undefined) {
                    InventoryId.push($("#AddOrderDetailFromInventoryDialog").data("inData")["InventoryId"]);
                    isFromARINVS = "PageARINVS";
                }
                else {
                    InventoryId.push($("#lblInvenIDs_AddOrderDetail").html());
                    isFromARINVS = $("#InventoryListForOrderEntryDialog").data("inData") == undefined ? "" : "PageARINVS";
                }
            }
            var CustType = $("#" + $("#CustCurrentDivID").html() + " .lblCustType").html();
            if (CustType == "S") {
                $("#AddOrderDetailFromInventoryDialog").parent().css("width", 629);
                try {
                    var Farm = $("#aOrderInventoryFarm_" + $("#lblInventorySelectedRowID_AddOrderDetail").html()).html();
                    if (Farm == "***") {
                        $("#AddOrderDetailFromInventoryDialog").css("height", "300px");

                    }
                    else {
                        $("#AddOrderDetailFromInventoryDialog").css("height", "315px");
                    }
                }
                catch (ex) {
                }

                $(".SuperMarketAccountFields").show();
                $("#trNewBoxCode").hide()
                $("#tdFlowerName").hide()
            }
            else {
                $("#AddOrderDetailFromInventoryDialog").parent().css("width", 600);
                try {
                    var Farm = $("#aOrderInventoryFarm_" + $("#lblInventorySelectedRowID_AddOrderDetail").html()).html();
                    if (Farm == "***") {
                        $("#AddOrderDetailFromInventoryDialog").css("height", "275px");

                    }
                    else {
                        $("#AddOrderDetailFromInventoryDialog").css("height", "250px");
                    }
                }
                catch (ex) {
                }

                $(".SuperMarketAccountFields").hide();
                $("#trNewBoxCode").show()
                $("#tdFlowerName").hide()
            }
        },
        close: function () {
            debugger
            isPriceApprovalNeeded = false;
            ClearLockedInventory();
            debugger
            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
            $("#fgrdAvaliableInventoryGridList").focus();
            if (isUserClickClose == true && sAndNextCheckedCount > 1) {
                $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' })
            }
            var SQLId = $("#lblSQLIDs_AddOrderDetail").html();
            if (SQLId != "0" && SQLId != "") {
                $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });;
            }
            
 
			$("#lblSQLIDs_AddOrderDetail").html("");
            $("#txtBoxCode_AddOrderDetail").val("");
            $("#txtStoreNo_AddOrderDetail").val(0);
            $("#txtUpcCode_AddOrderDetail").val("");
            $("#txtUpcPrice_AddOrderDetail").val("");
            $("#txtDateCode_AddOrderDetail").val("");
            $("#txtFlowerName_AddOrderDetail").val("");
            $("#txtNewBoxCode_AddOrderDetail").val("");
            //var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
            //if (OrderNo == "0" || OrderNo ==` "") {
            //    $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
            //}
            //else {
            //    $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
            //}
        },
        buttons: {
            "SAndNext": {
                text: "Save And Next",
                id: "btnInvSAndNext",
                click: function () {
                    isUserClickClose = false;
                    SaveOrderDetail()
                    SaveAndNextOrderDetail();   
                }
            },
            "Save": {
                text: "Save",
                id: "btnInvSave",
                click: function () {
                    //21Mar19 :: Abinaya :: Speed optimization for Save process
                    checkForPriceChange()
                    isUserClickClose = false;
                    if (!isPriceApprovalNeeded) {
                        SaveOrderDetail();
                    }
                    isPriceApprovalNeeded = false;                    
                    $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' })                    
                }
            },
            "Cancel": {
                text: "Close",
                id: "btnInvCancel",
                click: function () {
                    isPriceApprovalNeeded = false;
                    isUserClickClose = false;
                    $("#divWHForInvoice").html("");
                    GetWarehouse();
                    if ($("#divWHForInvoice").html() == "") {
                        $("#lstWarehouseForFilter").removeAttr("disabled");
                    }
                    ClearLockedInventory();
                    $("#AddOrderDetailFromInventoryDialog").dialog("close");
                    if (sAndNextCheckedCount > 1 && $('#fgrdOrderDetails .trChecked').length > 1) {
                        $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' })
                    }
                }
            }
        }
    });

    function SaveAndNextOrderDetail() {

        var currentOrderRowID = $('#fgrdOrderDetails .trChecked').attr('id')
        $('#' + currentOrderRowID).attr('class', '')
        while ($('#fgrdOrderDetails .trChecked').children("td").eq(10).children("div").text() == "ZFUEL") {
            currentOrderRowID = $('#fgrdOrderDetails .trChecked').attr('id')
            $('#' + currentOrderRowID).attr('class', '')
        }
        if ($('#fgrdOrderDetails .trChecked').length > 0) {

            OrderUpdate($('#fgrdOrderDetails .trChecked').children("td").eq(2).children("div").eq(0).children("img"));
        }
        else {
            $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' })
        }
    }

    //21Mar19 :: Abinaya :: Speed optimization for Save process
    function SaveOrderDetail() {
        var QuantityEntered = (($("#txtQty_AddOrderDetail").val() == "") ? $("#txtQty_AddOrderDetail").attr('placeholder') : $("#txtQty_AddOrderDetail").val());
        isValidateOrder(function (callback1) {
            if (callback1 == true) {
                ClearLockedInventory();
                debugger
                $(".YellowWarning_KMISC").hide();
                var CurrentselectedRowID = $("#lblInventorySelectedRowID_AddOrderDetail").html();

                var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
                var CustomerNo = $("#ctl00_DivCustomerNo_OrderSave").html();

                var Units = $("#lblFlowerUnits_AddOrderDetail").html();
                //var PlusFuel = $("#txtPlusFuel_AddOrderDetail").val();
                var PlusFuel = (($("#txtPlusFuel_AddOrderDetail").val() == "") ? $("#txtPlusFuel_AddOrderDetail").attr('placeholder') : $("#txtPlusFuel_AddOrderDetail").val());

                var Price = (($("#txtPrice_AddOrderDetail").val() == "") ? $("#txtPrice_AddOrderDetail").attr('placeholder') : $("#txtPrice_AddOrderDetail").val());

                var InventoryIDs = $("#lblInvenIDs_AddOrderDetail").html();
                if ($("#aOrderInventoryFarm_" + CurrentselectedRowID).html() == "***") {
                    //If line has multiple boxes then select invnetory ids for particular inventory 
                    InventoryIDs = $("#lstMultipleFarms_AddOrderDetail option:selected").data().invenids;
                    var FarmBoxes = 0;
                    FarmBoxes = $("#lstMultipleFarms_AddOrderDetail option:selected").data().boxes;
                    if (QuantityEntered > FarmBoxes) {
                        QuantityEntered = FarmBoxes
                    }
                }
                var Type = (($("#txtSaleType_AddOrderDetail").val() == "") ? $("#txtSaleType_AddOrderDetail").attr('placeholder') : $("#txtSaleType_AddOrderDetail").val()).toUpperCase();
                var OrderDetailID = $("#ctl00_DivOrderDetailID_OrderSave").html();
                var SQLId = $("#lblSQLIDs_AddOrderDetail").html();
                if (OrderDetailID == "") {
                    OrderDetailID = SQLId;
                }
                
                if (Type.trim() == "") {
                    $("#lstSaleType_AddOrderDetail").focus();
                    return false;
                }
                var InvenQty = $("#TotalInvenQty").html();
                if (OrderDetailID == "0" || OrderDetailID == "") {
                    if (parseInt(InvenQty) < parseInt($("#txtQty_AddOrderDetail").val())) {
                        $('#txtQty_AddOrderDetail').focus();
                        $("#Inventorywarning").show();
                        return false;
                    }
                }

                if ($("#ui-dialog-title-AddOrderDetailFromInventoryDialog").html().toString().includes("Add Order Detail ::")) {
                    var existingOrderDetailID = OrderDetailID == "" ? "0" : OrderDetailID;
                    if (existingOrderDetailID != "0") {
                        $.MessageBox("Sorry.. Order2 id is not zero (" + existingOrderDetailID+")... can not save!!");
                        return false;
                    }
                }

                var CalledFromVET = $("#ctl00_DivCalledFromVET_OrderSave").html();

                var StoreNo = $("#txtStoreNo_AddOrderDetail").val();
                var BoxCode = "";
                var UpcCode = $("#txtUpcCode_AddOrderDetail").val().toUpperCase();
                var UpcPrice = $("#txtUpcPrice_AddOrderDetail").val();
                var DateCode = $("#txtDateCode_AddOrderDetail").val().toUpperCase();
                var Desc = $("#lblFlowerName_AddOrderDetail").text().toUpperCase();
                //var BoxCodeNew = $("#txtNewBoxCode_AddOrderDetail").val().toUpperCase();
                var CustType = $("#" + $("#CustCurrentDivID").html() + " .lblCustType").html();
                if (CustType == "S") {
                   BoxCode = $("#txtBoxCode_AddOrderDetail").val().toUpperCase();
                } else {
                    BoxCode = $("#txtNewBoxCode_AddOrderDetail").val().toUpperCase();
                }

                $(".YellowWarning_KMISC").hide();
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/ADDUPDATEOrderDetail',
                    async: false,
                    data: "{'OrderDetailID':'" + OrderDetailID + "','Order': '" + OrderNo + "','Customer': '" + CustomerNo + "','InventoryIDs': '" + InventoryIDs + "','Quantity': '" + QuantityEntered + "','Price': '" + Price + "','Type': '" + Type + "','Units':'" + Units
                        + "','PlusFuel':'" + PlusFuel + "','CalledFromVET':'" + CalledFromVET + "','StoreNo':'" + StoreNo + "','BoxCode':'" + BoxCode + "','UpcCode':'" + UpcCode + "','UPCPRICE':'" + UpcPrice
                        + "','DateCode':'" + DateCode + "','Desc':\"" + Desc + "\"}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx"
                        }
                        else if (output.d == "Invalid Inventory Quantity") {
                            $("#AddOrderDetailFromInventoryDialog").dialog("close");
                            $.MessageBox("Invalid Inventory Quantity. Please refresh Inventory list and Retry!");
                        }
                        else if (output.d == 'success') {
                            if (OrderDetailID == "" || OrderDetailID == "0" || OrderDetailID == null)
                                $.growl.notice({ title: "Added!", message: "" });
                            else
                                $.growl.notice({ title: "Updated!", message: "" });

                            $("#AddOrderDetailFromInventoryDialog").dialog("close");
                            GetWarehouse();
                            var ActualQty = $("#aOrderInventoryQty_" + CurrentselectedRowID).html();

                            if (parseInt(ActualQty) <= parseInt(QuantityEntered)) { //if All pieces sold for paricualar inventory line remove it and move the focus to next inventory line
                                Setfocustonextrowforinventorysalelist(CurrentselectedRowID)
                                //$("#aOrderInventoryQty_" + CurrentselectedRowID).html('<img href="#" src="images/FACE03.png" title="No Boxes" style="cursor:pointer;width: 16px;height: 16px;">');
                            }
                            else {
                                $("#aOrderInventoryQty_" + CurrentselectedRowID).html(parseInt(ActualQty) - parseInt(QuantityEntered));
                            }

                            IsOrderModifiedAndNotSaved = true;

                            //$("#InventoryListForOrderEntryDialog").dialog("close")
                            //$("#DivKMISCDialog").dialog("close");
                            //
                            
                            
                            if (CalledFromVET == "1") {
                                $("#fgrdVETINVCustomer").flexReload({ url: '/url/for/refresh' });
                            }
                            else if (OrderDetailID != "0" && OrderDetailID != "") {
                                $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });;
                            }
                            else {

                            }
                        }
                        else if (output.d.indexOf("Insufficient") >= 0) {
                            $.MessageBox(output.d);
                            Setfocustonextrowforinventorysalelist(CurrentselectedRowID)
                            $("#lblLockDetails_AddOrderDetail").html("");
                            $("#AddOrderDetailFromInventoryDialog").dialog("close");
                        }
                        else {
                            $("#AddOrderDetailFromInventoryDialog").dialog("close");
                            //$("#DivKMISCDialog").dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            }
        });
    }

    function GetWarehouse() {
        var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
        var CustomerNo = $("#ctl00_DivCustomerNo_OrderSave").html();
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/GetSaveOrderWarehouse',
            data: '{"OrderNo":"' + OrderNo + '","Customer":"' + CustomerNo + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                debugger;
                if (output.d == null || output.d == "") {
                    $("#txtSaveWarehouse").val("");
                    $("#divWHForInvoice").html("");
                    $("#txtSaveWarehouse").addClass("hideForEmptyWareHouse");
                    $("#SaveWareHouseDDL").removeClass("hideForEmptyWareHouse");
                    LoadWareHouseDDLData();
                } else {
                    //alert();
                    if (output.d == "~EMPTY") {
                        $("#txtSaveWarehouse").hide();
                        LoadWareHouseDDLData(); 
                        $("#SaveWareHouseDDL").removeClass("hideForEmptyWareHouse");
                    }
                    else {
                        var result = output.d.split('~');
                        //put warehouse code instead of the warehouse name because when click on save it considers this element as code  
                        //$("#txtSaveWarehouse").val(result[1]);
                        $("#txtSaveWarehouse").val(result[0]);
                        $("#divWHForInvoice").html(result[0]);

                        $("#SaveWareHouseDDL").addClass("hideForEmptyWareHouse");
                        $("#txtSaveWarehouse").removeClass("hideForEmptyWareHouse");
                    }
                    
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
                var hasDefault = 0;
                var FirstItemCode = "";
                var DefaultItemCode = "";
                $.each(output.d, function (i, item) {
                    if (i == 0) {
                        FirstItemCode = item.Code;
                    }
                    if (item.IsDefault == "1") {
                        hasDefault = 1;
                        DefaultItemCode = item.Code;
                    } 
                });
                if (hasDefault == 1) {
                    $('#SaveWareHouseDDL').val(DefaultItemCode).trigger("change");
                } else {
                    $('#SaveWareHouseDDL').val(FirstItemCode).trigger("change");
                }
            }
        });
    }

    function isValidateOrder(callback) {

        var boxqty = $("#txtQty_AddOrderDetail").val() == "" ? $("#txtQty_AddOrderDetail").attr("placeholder") : $("#txtQty_AddOrderDetail").val();
        if (boxqty <= 0) {
            $(".YellowWarning").html("Quantity cannot be 0!");
            $(".YellowWarning").show();
            $("#txtQty_AddOrderDetail").focus();
            callback(false);
        }
        else {
            callback(true);
        }
    }

    //if item got sold out for the particluar line remove it and set focus to next line
    function Setfocustonextrowforinventorysalelist(CurrentselectedRowID) {
        var CurrentSelectedrow = $("#fgrdAvaliableInventoryGridList .trSelectedCheck")
        nextrow = $("#fgrdAvaliableInventoryGridList .trSelectedCheck").nextAll('tr:visible:first');
        if (nextrow.length != 0) {
            CurrentSelectedrow.removeClass("trSelectedCheck");
            nextrow.addClass("trSelectedCheck");
        }
        var nextrowid = nextrow.attr("id").replace("row", "");
        if (nextrowid == 0) {
            $("#fgrdAvaliableInventoryGridList #row" + nextrowid).remove();
        }
        $("#fgrdAvaliableInventoryGridList #row" + CurrentselectedRowID).remove();
    }



    $(window).on('beforeunload', function () {


        ClearLockedInventory();
    });
    $("#txtQty_AddOrderDetail").focusout(function (event) {
        var InvenQty = $("#TotalInvenQty").html();
        if ($("#ctl00_DivOrderDetailID_OrderSave").html() == "0" || $("#ctl00_DivOrderDetailID_OrderSave").html() == "") {
            if (parseInt(InvenQty) < parseInt($("#txtQty_AddOrderDetail").val())) {
                $("#Inventorywarning").show();
                $('#txtQty_AddOrderDetail').focus();
            }
            else {
                $("#Inventorywarning").hide();
            }
        }
    });

    //Muthu Nivetha M :: 19Feb2020 :: Modified :: To add FBE,Dimentions,Cubes and GPM while loading inventory for sales
    function InventoryForOrderEntryClick(celDiv, id) {
        $(celDiv).click(function () {
            $("#fgrdAvaliableInventoryGridList [id^=row]").removeClass("trSelectedCheck");
            $("#fgrdAvaliableInventoryGridList #row" + id).addClass("trSelectedCheck");
            if ($("#aOrderInventoryQty_" + id).html().indexOf("img") == "-1") {
                if (IsInventoryClick == false) {
                    var WHInvoiced = $("#aOrderCustomerWH_" + id).html();                    
                    GetWarehouse(function (callback) { });                    
                    if ($("#divWHForInvoice").html() != WHInvoiced && $("#divWHForInvoice").html() != "") {
                        $.MessageBox("You can only add items from warehouse : " + $("#divWHForInvoice").html())
                        $("#lstWarehouseForFilter").attr("disabled", "disabled");
                        return false;
                    }
                    else {
                        $("#divWHForInvoice").html(WHInvoiced);
                        $("#lstWarehouseForFilter").attr("disabled", "disabled");
                    }

                    IsInventoryClick = true;
                    InventoryId.push($("#aOrderInventoryINVIDs_" + id).html());
                    isFromARINVS = $("#InventoryListForOrderEntryDialog").data("inData") == undefined ? "" : "PageARINVS";
                    var setpage = isFromARINVS == "" ? "PageOrderSaveProcess" : isFromARINVS;
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/InsertLock',
                        data: "{ 'LockRecord': '" + $("#aOrderInventoryINVIDs_" + id).html() + "','Page':'" + setpage + "','Functionality':'InvenLock'}",
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
                            else if (data.indexOf("NotExist") >= 0) {


                                var tmp = data.split("_")
                                $("#aOrderInventoryQty_" + id).html(tmp[1]);
                                    var FlowerCode = $("#aOrderInventoryFlower_" + id).html(),
                                    FlowerName = $("#aOrderInventoryFlowerName_" + id).html(),
                                    Units = $("#aOrderInventoryUnits_" + id).html(),
                                    UOM = $("#aOrderInventoryUOM_" + id).html(),
                                    Qty = $("#aOrderInventoryQty_" + id).html(),
                                    Invqty = Qty,
                                    Price = $("#aOrderInventoryActualPrice_" + id).html(),
                                    SaleType = $("#aOrderInventorySaleType_" + id).html(),
                                    InvenIDs = $("#aOrderInventoryINVIDs_" + id).html(),
                                    Fuel = $("#aOrderInventoryFuel_" + id).html(),
                                    PlusFuel = $("#aOrderCustomerPlusFuel_" + id).html(),
                                    lineFuelCustomer = $("#aOrderCustomerlinefuel_" + id).html(),
                                    fbe = $("#aOrderCustomerFBE_" + id).html(),
                                    Dimensions = $("#aOrderCustomerDimensions_" + id).html(),
                                    Cubes = $("#aOrderCustomerCubes_" + id).html(),
                                    GPM = $("#aOrderCustomerGPM_" + id).html(),
                                    LandedCostnew = $("#aOrderCustomerLandedCost_" + id).html(),
                                    Flower = $("#aOrderInventoryFlower_" + id).html(),
                                    Boxnum = $("#aOrderCustomerBOXNUM_" + id).html();
                                $("#TotalInvenQty").html(Qty);
                                var LastPrice = $("#aOrderCustomerLastPrice_" + id).html();
                                var LastDate = $("#aOrderCustomerLastDate_" + id).html();

                                var Farm = $("#aOrderInventoryFarm_" + id).html();
                                var CAT = $("#aOrderInventoryCategory_" + id).html();

                                if (SaleType == "P") {
                                    SaleType = "O"
                                }
                                else if (SaleType == "S") {
                                    SaleType = "F"
                                }
                                else {
                                    SaleType = "N"
                                }

                                $("#lblInventorySelectedRowID_AddOrderDetail").html(id);
                                $("#lblInvenIDs_AddOrderDetail").html(InvenIDs);
                                $("#lblFlowerName_AddOrderDetail").html(FlowerName);
                                $("#lblFlowerUnits_AddOrderDetail").html(Units);
                                $("#lblAvailableQty_AddOrderDetail").html(Qty);
                                $("#txtQty_AddOrderDetail").attr('placeholder', 1);
                                $("#txtQty_AddOrderDetail").val("");
                                $("#lblUOM_AddOrderDetail").html(UOM);
                                $("#lblLastPrice_AddOrderDetail").html(LastPrice);
                                $("#lblLastDate_AddOrderDetail").html(LastDate);
                                //lblLastPrice_AddOrderDetail
                                $("#txtPlusFuel_AddOrderDetail").val("");
                                //$("#txtPlusFuel_AddOrderDetail").val(parseFloat(parseFloat(PlusFuel)).toFixed(4));
                                $("#txtPlusFuel_AddOrderDetail").attr('placeholder', parseFloat(parseFloat(PlusFuel)).toFixed(4));

                                var fuelperunit = parseFloat((parseFloat(Fuel) / parseFloat(Units)));
                                $("#lblFuel_AddOrderDetail").html(fuelperunit.toFixed(4));
                                $("#txtPrice_AddOrderDetail").val("");
                                //if (lineFuelCustomer == "False") {
                                // $("#txtPrice_AddOrderDetail").attr('placeholder', parseFloat(Price - fuelperunit).toFixed(4));
                                //}
                                //else{
                                $("#txtPrice_AddOrderDetail").attr('placeholder', parseFloat(Price).toFixed(4));
                                
                                //}

                                if (lineFuelCustomer.toLowerCase() == "false") {
                                    $("#txtPlusFuel_AddOrderDetail").removeAttr("disabled");
                                    $("#txtPrice_AddOrderDetail").attr("disabled", "disabled");
                                }
                                else {
                                    $("#txtPlusFuel_AddOrderDetail").attr("disabled", "disabled");
                                    $("#txtPrice_AddOrderDetail").removeAttr("disabled");
                                }

                                //LoadSaleType(function (callback) {
                                //    
                                //    if (callback == true) {
                                //        $("#lstSaleType_AddOrderDetail").val(SaleType);
                                //        $("#txtSaleType_AddOrderDetail").attr('placeholder', SaleType);
                                //    }
                                //});

                                $("#lstSaleType_AddOrderDetail").val("N");
                                $("#txtSaleType_AddOrderDetail").attr('placeholder', "N");
                                $("#ctl00_DivOrderDetailID_OrderSave").html("");

                                //$("#lblFBE_AddOrderDetail").html(parseFloat(fbe).toFixed(4));
                                $("#lblDimensions_AddOrderDetail").html(Dimensions);
                                $("#lblCost_AddOrderDetail").html(parseFloat(LandedCostnew).toFixed(4));
                                //var tmpcubes = parseFloat(Cubes).toFixed(4);
                                //var currentqty = $("#txtQty_AddOrderDetail").attr('placeholder')
                                //var getcubes = ((parseFloat(tmpcubes) / 1728) * (parseInt(currentqty)));
                                //$("#lblCubes_AddOrderDetail").html(parseFloat(getcubes).toFixed(4));
                                $("#lblGPM_AddOrderDetail").html(GPM);
                                $("#lblInvenId_AddOrderDetail").html(InvenIDs);
                               
                                $("#Inventorywarning").hide();
                                GetProductFBEDetails(CAT, Farm, UOM);
                                $.ajax({
                                    type: "POST",
                                    url: 'BloomService.asmx/GetUpcFromPricesByFlower',
                                    data: "{ 'FlowerCode': '" + FlowerCode + "', 'Customer': '" + $("#ctl00_DivCustomerNo_OrderSave").html() + "' }",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (output) {
                                        if (output.d != null) {
                                            var SalesDet = output.d;
                                            $("#txtUpcCode_AddOrderDetail").val(SalesDet.UPC);
                                            $("#txtUpcPrice_AddOrderDetail").val(SalesDet.UPCPRICE);
                                            $("#txtBoxCode_AddOrderDetail").val(SalesDet.BoxCode);
                                        }
                                    }
                                });
                                var Farm = $("#aOrderInventoryFarm_" + id).html();
                                if (Farm == "***") {
                                    $("#AddOrderDetailFromInventoryDialog").css("height", "280px");
                                    $("#tdmultiplefarms").show();
                                    //if line has a multiple farm then load the farms dropdown and load it
                                    $.ajax({
                                        type: "POST",
                                        url: 'BloomService.asmx/LoadMultipleFarmsDropdownWhenSelling',
                                        data: "{ 'InvenIDs': '" + InvenIDs + "' }",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (output, status) {
                                            $('#lstMultipleFarms_AddOrderDetail').empty();
                                            $('#lstMultipleFarms_AddOrderDetail').append('<option data-invenids="' + InvenIDs + '"  data-boxes="' + Qty + '" value="***">*** - ' + Qty + '</option>');
                                            var data = output.d;

                                            for (var i in data) {
                                                var Farm = data[i];
                                                $('#lstMultipleFarms_AddOrderDetail').append('<option data-invenids="' + Farm.IDs + '" data-boxes="' + Farm.Qty + '" value="' + Farm.Farm + '">' + Farm.Farm + ' - ' + Farm.Qty + '</option>');
                                            }
                                        }
                                    });
                                }
                                else {
                                    $("#AddOrderDetailFromInventoryDialog").css("height", "245px");
                                    $("#tdmultiplefarms").hide();
                                }
                                var existingOrderDetailID = $("#ctl00_DivOrderDetailID_OrderSave").html() == "" ? 0 : $("#ctl00_DivOrderDetailID_OrderSave").html();
                                $("#AddOrderDetailFromInventoryDialog").dialog("open");
                                $("#AddOrderDetailFromInventoryDialog").dialog('option', 'title', 'Add Order Detail :: ' + existingOrderDetailID);
                                IsInventoryClick = false;
                            }
                            else if (data.indexOf("NoBoxes") >= 0) {
                                IsInventoryClick = false;
                                //$("#aOrderInventoryQty_" + id).html('<img href="#" src="images/sadface.png" title="No Boxes" style="cursor:pointer;width: 16px;height: 16px;">');
                                //$.MessageBox("Sorry... Item is sold out")
                                Setfocustonextrowforinventorysalelist(id);
                            }
                            else if (data != "") {
                                var tmp = data.split("_")
                                $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + " !");
                                IsInventoryClick = false;
                            }
                            else {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                                IsInventoryClick = false;
                            }
                        },
                        complete: function () {
                            $("#txtPrice_AddOrderDetail").trigger('focusout');
                        }

                    });
                }
            }
            else {
                IsInventoryClick = false;
                $.MessageBox("Sorry... Item is sold out");
            }
        });
    }
    function GetProductFBEDetails(Category, FARM, UOM) {

        if (Category != "" && FARM != "" && UOM != "") {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetProductFBEDetails',
                data: '{"Category":"' + Category + '","Farm":"' + FARM + '","UOM":"' + UOM + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    if (output.d != null) {
                        var result = output.d.split('~');
                        $("#lblDimensions_AddOrderDetail").html(result[0]);
                        $("#lblFBE_AddOrderDetail").html(parseFloat(result[2]).toFixed(3));

                        var tmpcubes = parseFloat(result[1]).toFixed(4);
                        var currentqty = $("#txtQty_AddOrderDetail").attr('placeholder')
                        var getcubes = ((parseFloat(tmpcubes) / 1728) * (parseInt(currentqty)));
                        $("#lblCubes_AddOrderDetail").html(parseFloat(getcubes).toFixed(3));
                    }
                }
            })
        }
    }



    function calcGPMAfterChangePriceInOrderDetail(mode) {
        var Price = 0;
        if (mode === "price") {
            Price = (($("#txtPrice_AddOrderDetail").val() == "") ? $("#txtPrice_AddOrderDetail").attr('placeholder') : $("#txtPrice_AddOrderDetail").val());
        } else {
            //Fuel
            Price = (($("#txtPlusFuel_AddOrderDetail").val() == "") ? $("#txtPlusFuel_AddOrderDetail").attr('placeholder') : $("#txtPlusFuel_AddOrderDetail").val());
        }
        //calc GPM
        if (parseFloat(Price) > parseFloat(0)) {
            var cost = parseFloat(0);
            cost = $("#lblCost_AddOrderDetail").html();
            // (FOB - LANDEDCOST) / FOB * 100)
            var gpm = (((parseFloat(Price).toFixed(2) - parseFloat(cost).toFixed(2)) / parseFloat(Price).toFixed(2)) * 100);
            $("#lblGPM_AddOrderDetail").html(parseFloat(gpm).toFixed(1) + "%");
        } else {
            $("#lblGPM_AddOrderDetail").html(parseFloat(0).toFixed(1) + "%");
        }
    }

    $("#txtPrice_AddOrderDetail").change(function () {
        //checkForPriceChange();
    });

     //function ClearLockedInventory() {
    //    if (InventoryId.length > 0) {
    //        $.ajax({
    //            type: "POST",
    //            url: 'BloomService.asmx/DeleteInventoryLock',
    //            data: "{ 'InventoryId': '" + InventoryId.join(",") + "' }",
    //            contentType: "application/json; charset=utf-8",
    //            async: false,
    //            dataType: "json",
    //            success: function (output, status) {
    //                var data = output.d;
    //                InventoryId = [];
    //            },

    //        });
    //    }
    //}

    //Release Locked Inventory
    function ClearLockedInventory() {
        var setpage = isFromARINVS == "" ? "PageOrderSaveProcess" : isFromARINVS;
        if (InventoryId.length > 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteLock',
                data: "{ 'LockRecord': '" + InventoryId.join(",") + "','Page':'" + setpage + "','Functionality':'InvenLockRelease'}",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: "json",
                success: function (output, status) {
                    var data = output.d;
                    InventoryId = [];
                },

            });
        }
    }

    $("#txtPrice_AddOrderDetail").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            //$("#txtNewBoxCode_AddOrderDetail").focus();
            //$("#lstSaleType_AddOrderDetail").focus();
        }
    });
    $("#txtSaleType_AddOrderDetail").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            $("#btnInvSave").focus();
            //$("#lstSaleType_AddOrderDetail").focus();
        }
    });

    $("#txtDateCode_AddOrderDetail").keydown(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            setTimeout(function () { $("#btnInvSave").focus(); }, 200);
            //$("#lstSaleType_AddOrderDetail").focus();
        }
    });


    var HideVCG = false;
    //if ('<%=ConfigurationManager.AppSettings("lHideVCG")%>' == "1") {
    //    HideVCG = true;
    //}
    //else {
    //    HideVCG = false;
    //}
    var IsSalesPerson = false;

    //
    if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person") {
        IsSalesPerson = true;
    }

    var AllowToViewAllColumnsInInvnetory = false;
    //Setting View of all-columns on Inven-List under user settings
    //
    var sentence = $("#ctl00_DivForViewAllColumnsInInvnetory").html();
    var index = 97;
    //Get Current User Permission on "View all columns in invnetory" setup
    var hasPermissionToViewAllColumnsInInvnetory = sentence.charAt(index);
    if (hasPermissionToViewAllColumnsInInvnetory.toUpperCase() == "Y" || $("#ctl00_LoggedInUserType_SalesPerson").html().toLowerCase() == "admin")
        AllowToViewAllColumnsInInvnetory = false;
    else
        AllowToViewAllColumnsInInvnetory = true;

    //Grid to show available inventory list
    $("#fgrdAvaliableInventoryGridList").flexigrid({
        url: 'BloomService.asmx/GetInventoryForAddingOrderDetailFgrd',
        dataType: 'xml',
        colModel: [
            { display: 'ID', name: 'ID', width: 60, sortable: true, align: 'left', hide: true, process: InventoryForOrderEntryClick },
            { display: 'WH', name: 'WH', width: 40, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Farm', name: 'Farm', width: 40, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'CO', name: 'Country', width: 20, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Type', name: 'Type', width: 13, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Cat', name: 'Cat', width: 25, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Flower', name: 'Flower', width: 70, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Description', name: 'Description', width: 250, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Qty', name: 'Qty', width: 50, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'UOM', name: 'UOM', width: 30, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Pack', name: 'Units', width: 30, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'U/B', name: 'UnitsBunch', width: 20, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'ActualPrice', name: 'ActualPrice', width: 35, sortable: true, align: 'right', hide: true },
            { display: 'Price', name: 'Price', width: 55, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'Fuel', name: 'Fuel', width: 55, sortable: true, align: 'right', hide: true, process: InventoryForOrderEntryClick },
            { display: '***Comments/Breakdown***', name: 'Comments', width: 180, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'DAYS', name: 'DAYS', width: 30, sortable: true, align: 'right' },            
            { display: 'linefuel', name: 'linefuel', width: 195, sortable: true, align: 'left', hide: true },
            { display: 'Plusfuel', name: 'Plusfuel', width: 195, sortable: true, align: 'left', hide: true },
            { display: 'LandedCost', name: 'COST', width: 35, sortable: true, align: 'right', process: InventoryForOrderEntryClick, hide: AllowToViewAllColumnsInInvnetory },
            { display: 'CUST#', name: 'CUST', width: 35, sortable: true, align: 'right', process: InventoryForOrderEntryClick },
            { display: 'ORDER', name: 'ORDER', width: 48, sortable: true, align: 'right', hide: true, process: InventoryForOrderEntryClick, hide: AllowToViewAllColumnsInInvnetory },
            { display: 'BOXNUM', name: 'BOXNUM', width: 40, sortable: true, align: 'right' },
            { display: 'AWB', name: 'AWB', width: 30, sortable: true, align: 'right', process: LoadF3SalesDetailsForSelectedFlower },
            { display: 'Variety', name: 'Variety', width: 80, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Color', name: 'Color', width: 65, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'Grade', name: 'Grade', width: 60, sortable: true, align: 'left', process: InventoryForOrderEntryClick },
            { display: 'FBE', name: 'FBE', width: 30, sortable: true, align: 'right', hide: true },
            { display: 'Dimensions', name: 'Dimensions', width: 30, sortable: true, align: 'left', hide: true },
            { display: 'Cubes', name: 'Cubes', width: 30, sortable: true, align: 'left', hide: true },
            { display: 'GPM', name: 'GPM', width: 30, sortable: true, align: 'right', hide: true },
            { display: 'Cost', name: 'Cost1', width: 30, sortable: true, align: 'right', hide: true },
            { display: 'LastPrice', name: 'LastPrice', width: 30, sortable: true, align: 'right', hide: true },
            { display: 'LastPurchaseDate', name: 'LastPurchaseDate', width: 30, sortable: true, align: 'right', hide: true }
        ],
        showTableToggleBtn: true,
        sortname: "Flower asc",
        sortorder: "",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "ReportName",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        colresize: false,
        autoload: false,
        showTableToggleBtn: false,
        width: 1250,
        height: $(window).height() - 180,
        striped: true,
        params: [
            { name: 'Filter', value: '' },
            { name: 'FilterColumn', value: '' },
            { name: 'Customer', value: $("#ctl00_DivCustomerNo_OrderSave").html() },
        ],
        searchitems: [
            { display: 'Flower', name: 'Flower' },
            { display: 'Farm', name: 'Farm' },
            { display: 'CO', name: 'Country' },
            { display: 'Type', name: 'Type' },
            { display: 'Cat', name: 'CAT' },
            { display: 'Variety', name: 'Variety' },
            { display: 'Color', name: 'Color' },
            { display: 'Grade', name: 'Grade' },
            { display: 'Description', name: 'NAME' },
            { display: 'Units', name: 'Units' },
            { display: 'Qty', name: 'Qty' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Price', name: 'Price' },
            { display: 'Awb', name: 'Awb' },
            { display: 'Box#', name: 'BoxNum' },
            { display: 'Comments', name: 'Comments' },
            { display: 'Warehouse', name: 'WH' },
        ],
        onSuccess: function () {
            $("#fgrdAvaliableInventoryGridList tr:first").addClass("trSelectedCheck");
            $('#fgrdAvaliableInventoryGridList #row0').addClass("TotalRows")

            if ($('#lstVarietyFilterForInventoryList option').length <= 0) {
                $('#lstVarietyFilterForInventoryList').empty();
                $('#lstVarietyFilterForInventoryList').append('<option value="">Select Variety</option>');
                var VarietyList = []
                $("#fgrdAvaliableInventoryGridList tr").each(function () {
                    var currentrowid = $(this).attr("id").replace("row", "");
                    if (currentrowid != 0) {

                        var Variety = $("#aOrderInventoryVariety_" + currentrowid).html();
                        Variety = (Variety == null ? "" : Variety);
                        if (VarietyList.indexOf(Variety) == -1 && Variety.trim() != "") {
                            $('#lstVarietyFilterForInventoryList').append('<option value="' + Variety.trim() + '">' + Variety + '</option>');
                            VarietyList.push(Variety)
                        }
                    }
                });
            }
            if ($('#lstColorFilterForInventoryList option').length <= 0) {
                $('#lstColorFilterForInventoryList').empty();
                $('#lstColorFilterForInventoryList').append('<option value="">Select Color</option>');
                var ColorList = []
                $("#fgrdAvaliableInventoryGridList tr").each(function () {
                    var currentrowid = $(this).attr("id").replace("row", "");
                    if (currentrowid != 0) {
                        var Color = $("#aOrderInventoryColor_" + currentrowid).html();
                        Color = (Color == null ? "" : Color);
                        if (ColorList.indexOf(Color) == -1 && Color.trim() != "") {
                            $('#lstColorFilterForInventoryList').append('<option value="' + Color.trim() + '">' + Color + '</option>');
                            ColorList.push(Color)
                        }
                    }
                });
            }
            if ($('#lstGradeFilterForInventoryList option').length <= 0) {
                $('#lstGradeFilterForInventoryList').empty();
                $('#lstGradeFilterForInventoryList').append('<option value="">Select Grade</option>');
                var GradeList = []
                $("#fgrdAvaliableInventoryGridList tr").each(function () {
                    var currentrowid = $(this).attr("id").replace("row", "");
                    if (currentrowid != 0) {
                        var Grade = $("#aOrderInventoryGrade_" + currentrowid).html();
                        Grade = (Grade == null ? "" : Grade);
                        if (GradeList.indexOf(Grade) == -1 && Grade.trim() != "") {
                            $('#lstGradeFilterForInventoryList').append('<option value="' + Grade.trim() + '">' + Grade + '</option>');
                            GradeList.push(Grade)
                        }
                    }
                });
            }
            if ($('#lstCategoryFilterForInventoryList option').length <= 0) {
                $('#lstCategoryFilterForInventoryList').empty();
                $('#lstCategoryFilterForInventoryList').append('<option value="">Select Category</option>');
                var CategoryList = []
                $("#fgrdAvaliableInventoryGridList tr").each(function () {
                    var currentrowid = $(this).attr("id").replace("row", "");
                    if (currentrowid != 0) {
                        var Category = $("#aOrderInventoryCategory_" + currentrowid).html();
                        Category = (Category == null ? "" : Category);
                        if (CategoryList.indexOf(Category) == -1 && Category.trim() != "") {
                            $('#lstCategoryFilterForInventoryList').append('<option value="' + Category.trim() + '">' + Category + '</option>');
                            CategoryList.push(Category)
                        }
                    }
                });
            }
            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
            $("#fgrdAvaliableInventoryGridList").focus();
        }
    });

    function LoadF3SalesDetailsForSelectedFlower(celDiv,id) {
        $(celDiv).click(function () {
            var SelectedFlower = $("#aOrderInventoryFlower_" + id).html();
            $("#fgrdSelectedFlowerCustList").flexOptions({ params: [{ name: 'SelectedFlower', value: SelectedFlower }], query: "", newp: 1 }).flexReload();

            $("#DivCustomerForSelectedFlwoer").dialog('option', 'title', 'Customer List');
            $("#DivCustomerForSelectedFlwoer").dialog("open");
        })
    }
    // $("#DivAvaliableInventoryGridList .sDiv").css('float', 'left').css('width', '575px');
    $("#DivAvaliableInventoryGridList .sDiv").css('float', 'left').css('width', '575px').hide();
    $('#DivAvaliableInventoryGridList .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivAvaliableInventoryGridList .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivAvaliableInventoryGridList .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivAvaliableInventoryGridList .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show

    function LoadSaleType(callback) {
        var length = $('#lstSaleType_AddOrderDetail > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetTypeForInventory',
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstInventoryType').empty();
                    var Typedata = output.d;
                    $('#lstSaleType_AddOrderDetail').append('<option value="0">Select</option>');
                    for (var i in Typedata) {
                        var Type = Typedata[i];
                        $('#lstSaleType_AddOrderDetail').append('<option value="' + Type.Code + '">' + Type.Code + ' - ' + Type.Name + '</option>');
                    }
                    callback(true);
                }
            });

        }
        else {
            callback(true);
        }
    }

    //$("#lstCARRIER_Or1").change(function () {

    //});


    var cc = 0;
    $('#lstSaleType_AddOrderDetail').change(function () {
        $("#txtSaleType_AddOrderDetail").focus()
        $("#txtSaleType_AddOrderDetail").val($("#lstSaleType_AddOrderDetail").val());
    });

    function ApplyfilterForInventoryList(Filter, FilterColumn) {        
        var activewh = $("#ctl00_DivpgOdrsaveActiveWHs").html() == "" ? "" : $("#ctl00_DivpgOdrsaveActiveWHs").html();
        var WHFilter = "";
        WHFilter = " AND  WH IN (" + (activewh == "" ? "''" : activewh) + ") ";
        //FilterColumn = (FilterColumn.includes("WH") ? FilterColumn : FilterColumn + " AND WH ")
        Filter = (Filter + WHFilter), "WH and Flower";
        var isWHExist = $("#ctl00_DivWHListCount").html() == "0" ? false : true;
        if (isWHExist) {
            $("#fgrdAvaliableInventoryGridList").flexOptions({
                params: [{ name: 'Filter', value: Filter },
                { name: 'FilterColumn', value: FilterColumn }, { name: 'Customer', value: $("#ctl00_DivCustomerNo_OrderSave").html() }], query: "", newp: 1
            }).flexReload();
        }
    }

    function ApplydefaultFlag() {

    }

    $('#btnOrderInventoryArriving').click(function () {
        qtypeload = 5;
        //var Filter = "Flag='A'"
        //ApplyfilterForInventoryList(Filter, "Flag")
        if (defaultqtypeload != 0 || IsSalesPerson == true) {
            isInventoryClickedFrom = "Arriving"
            var Filter = "Upper(Flag)='A'"
            ApplyfilterForInventoryList(Filter, "Flag")
        }
        else {
            $('#DivAvaliableInventoryGridList [name="qtype"]').val("Type");
            $('#DivAvaliableInventoryGridList [name="q"]').val("A");
            $('#DivAvaliableInventoryGridList [value="Search"]').click();
        }
    });

    $('#btnOrderInventoryHold').click(function () {
        qtypeload = 4;
        //var Filter = "Flag='H'"
        //ApplyfilterForInventoryList(Filter, "Flag")
        if (defaultqtypeload != 0 || IsSalesPerson == true) {
            isInventoryClickedFrom = "Hold";
            var Filter = "Upper(flag)='H'"
            ApplyfilterForInventoryList(Filter, "Flag")
        }
        else {
            $('#DivAvaliableInventoryGridList [name="qtype"]').val("Type");
            $('#DivAvaliableInventoryGridList [name="q"]').val("H");
            $('#DivAvaliableInventoryGridList [value="Search"]').click();
        }
    });

    $('#btnOrderInventoryStanding').click(function () {
        //var Filter = "Flag='S'"
        //ApplyfilterForInventoryList(Filter, "Flag")
        qtypeload = 6;
        if (defaultqtypeload != 0 || IsSalesPerson == true) {
            isInventoryClickedFrom = "Standing";
            var Filter = "Upper(flag)='S'"
            ApplyfilterForInventoryList(Filter, "Flag")
        }
        else {
            $('#DivAvaliableInventoryGridList [name="qtype"]').val("Type");
            $('#DivAvaliableInventoryGridList [name="q"]').val("S");
            $('#DivAvaliableInventoryGridList [value="Search"]').click();
        }
    });

    $('#btnOrderInventoryPrebooks').click(function () {
        qtypeload = 3;
        //var Filter = "Upper(flag)='P'"
        //ApplyfilterForInventoryList(Filter, "Flag")
        if (defaultqtypeload != 0 || IsSalesPerson == true) {
            isInventoryClickedFrom = "Prebooks";
            var Filter = "Upper(flag)='P'"
            ApplyfilterForInventoryList(Filter, "Flag")
        }
        else {
            $('#DivAvaliableInventoryGridList [name="qtype"]').val("Type");
            $('#DivAvaliableInventoryGridList [name="q"]').val("P");
            $('#DivAvaliableInventoryGridList [value="Search"]').click();
        }
    });


    $('#btnOrderInventoryLocal').click(function () {

        //var Filter = "Flag='L'"
        //ApplyfilterForInventoryList(Filter, "Flag")
        qtypeload = 1;
        if (defaultqtypeload != 0 || IsSalesPerson == true) {
            isInventoryClickedFrom = "Local";
            var Filter = "Upper(flag)='L'"
            ApplyfilterForInventoryList(Filter, "Flag")
        }
        else {
            $('#DivAvaliableInventoryGridList [name="qtype"]').val("Type");
            $('#DivAvaliableInventoryGridList [name="q"]').val("L");
            $('#DivAvaliableInventoryGridList [value="Search"]').click();
        }
    });


    $('#btnOrderInventoryRefresh').click(function () {        
        defaultqtypeload = 0;
        qtypeload = 0;
        $('#DivAvaliableInventoryGridList [name="q"]').val("");
        isInventoryClickedFrom = "AddOrMarketOrRefresh";
        var Filter = "Upper(flag) in ('M')";
        //var activewh = $("#ctl00_DivpgOdrsaveActiveWHs").html() == "" ? "" : $("#ctl00_DivpgOdrsaveActiveWHs").html();
        //var WHFilter = "";
        //WHFilter = (activewh == "" ? "" : " AND  WH IN (" + activewh + ") ");
        //ApplyfilterForInventoryList(Filter + WHFilter, (WHFilter == "" ? "Flag" : "WH and Flower"));
        ApplyfilterForInventoryList(Filter, "Flag");
        //if ($("#ctl00_LoggedInUserType_SalesPerson").html() == "sales person") {
        //    isInventoryClickedFrom = "AddOrMarketOrRefresh";
        //    var Filter = "Flag in ('M','*')"
        //    ApplyfilterForInventoryList(Filter, "Flag")
        //    IsSalesPerson = true;
        //}
        //else {
        //    $("#fgrdAvaliableInventoryGridList").flexOptions({
        //        params: [{ name: 'Filter', value: '' },
        //        { name: 'FilterColumn', value: '' },
        //        { name: 'Customer', value: $("#ctl00_DivCustomerNo_OrderSave").html() }], query: "", newp: 1
        //    }).flexReload();
        //}
    });


    $('#btnOrderInventoryMarket').click(function () {

        qtypeload = 2;
        //var Filter = "Upper(flag) not in ('P','H','A','S')"
        //ApplyfilterForInventoryList(Filter, "Upper(flag)")
        defaultqtypeload = 1;
        isInventoryClickedFrom = "AddOrMarketOrRefresh";
        var Filter = "Upper(Flag) not in ('P','H','A','S','L')"
        ApplyfilterForInventoryList(Filter, "flag")
        // to display the type m and * for market records
        //$('#DivAvaliableInventoryGridList [value="Clear"]').click();
        //$("#fgrdAvaliableInventoryGridList tr").each(function () {
        //    debugger
        //    $('#DivAvaliableInventoryGridList [name="q"]').val("M");
        //    var currentrowid = $(this).attr("id").replace("row", "")
        //    var Type = $("#aOrderInventorySaleType_" + currentrowid).html();
        //    //if (Type == "P" || Type == "S" || Type == "A" || Type == "H" || Type == "L") {
        //    if (Type.toLowerCase() == "m" || Type == "*" ) {
        //        $(this).hide();
        //    }
        //});
    });

    $('#InventoryListForOrderEntryDialog').on('mouseenter', function () {

        var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
        $("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
        $("#fgrdAvaliableInventoryGridList").focus();
    })


    function indexOfMax(arr) {

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

    function TriggerAddOrderDetailSave(e) {

        if ($("#AddOrderDetailFromInventoryDialog").dialog('isOpen') == true) {

            $("#AddOrderDetailFromInventoryDialog").next('div').find('button')[1].focus();
            var buttons = $("#AddOrderDetailFromInventoryDialog").dialog("option", "buttons")
            buttons["Save"].click();


            e.stopPropagation();
            e.preventDefault();

        }

    }


    document.body.addEventListener('keydown', function (e) {
        try {
            var focused = document.activeElement;

            if (focused.className.indexOf('dialogbuttonstyle') != "-1") {
                if (e.which == 37) { //left arrow
                    //focused.prev().focus()
                    $(".ui-state-focus").prev().focus()
                }
                else if (e.which == 39) {//right arrow
                    //focused.next().focus()
                    $(".ui-state-focus").next().focus()
                }
            }

            //if ($(this).hasClass("dialogbuttonstyle")) {
            //    alert("hi");
            //}

            var zindex = [];
            var divname = [];
            for (i = 0; i < $(".ui-dialog:visible").length; i++) {
                var ss = $(".ui-dialog:visible")[i].style.zIndex
                zindex.push($(".ui-dialog:visible")[i].style.zIndex);
                divname.push($(".ui-dialog:visible")[i].lastChild.id);
            }
            var max = indexOfMax(zindex);

            try {
                var lastchildid = $(".ui-dialog:visible")[max].lastChild.id
            }
            catch (ex) {
                return false;
            }


            if (e.which == 34) { // when pressing pagedown from addorderdetails dialog trigger save
                TriggerAddOrderDetailSave(e);
            }


            if (($(".ui-dialog:visible")[max].lastChild.id == "InventoryListForOrderEntryDialog" && focused.className != "qsbox") || ((e.metaKey || e.altKey) && (e.which == 90))) //to check if focus on search textbox and clear shortcut key
            {
                if (e.which == 77) { //Click M
                    ButtonClickAsperUserPersmission(e.which);

                }
                if (e.which == 76) { //Click L
                    ButtonClickAsperUserPersmission(e.which);
                }
                if (e.which == 72) {//Click H
                    if ($("#ctl00_LoggedInUserType_SalesPerson").html() != "sales person") {
                        ButtonClickAsperUserPersmission(e.which);
                    }
                }


                if (e.which == 65) {//Click A
                    if ($("#ctl00_LoggedInUserType_SalesPerson").html() != "sales person") {
                        ButtonClickAsperUserPersmission(e.which);
                    }
                }
                if (e.which == 82) {//Click R
                    $('#btnOrderInventoryRefresh').click();
                }
                if (e.which == 83) {//Click S
                    $('#btnOrderInventorySearch').click();
                }
                if (e.which == 80) {//Click P
                    if ($("#ctl00_LoggedInUserType_SalesPerson").html() != "sales person") {
                        ButtonClickAsperUserPersmission(e.which);
                    }
                }

                if (e.which == 84) {//Click T
                    if ($("#ctl00_LoggedInUserType_SalesPerson").html() != "sales person") {
                        ButtonClickAsperUserPersmission(e.which);
                    }
                }


                if ((e.metaKey || e.ctrlKey) && (String.fromCharCode(e.which).toLowerCase() === 'c')) { //Ctrl+C
                    $('#btnOrderInventoryColor').click();
                }
                else if ((e.metaKey || e.altKey) && (e.which == 90)) // the AlT+z key code
                {

                    $('#DivAvaliableInventoryGridList [value="Clear"]').click();
                }
                else if (e.which == 67) {//Click C

                    $('#btnOrderInventoryCategory').click();
                }

                if (e.which == 86) {//Click V
                    $('#btnOrderInventoryVariety').click();
                }
                if (e.which == 79) {//Click O
                    $('#btnOrderInventoryOther').click();
                }
                if (e.which == 70) {//Click F
                    $('#btnOrderInventoryFarm').click();
                }
                if (e.which == 71) {//Click G
                    $('#btnOrderInventoryGrade').click();
                }
                if (e.which == 56) {//Click *
                    $('#DivAvaliableInventoryGridList [name="qtype"]').val("Type");
                    $('#DivAvaliableInventoryGridList [name="q"]').val("*");
                    $('#DivAvaliableInventoryGridList [value="Search"]').click();
                }
                //2021/08/14, stop X shortcut
                //if (e.which == 88) {    //Click N - Notes
                //    $("#btnOrderInventoryFuture").click();
                //}

            }
        }
        catch (ex) {

        }
    });

    $('#InventoryListForOrderEntryDialog').on('keydown', function (e) {




        var focused = document.activeElement;
        if (e.which == 13 && focused.className != "qsbox") { //key enter

            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
            $("#fgrdAvaliableInventoryGridList").focus();

            e.preventDefault();
            var CurrentSelectedrow = $("#fgrdAvaliableInventoryGridList .trSelectedCheck")
            var id = CurrentSelectedrow.attr('id').replace('row', '');
            $("#aOrderInventoryVariety_" + id).click()

            e.stopPropagation();
        }
        if (e.which == 38) { //up arrow

            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
            $("#fgrdAvaliableInventoryGridList").focus();

            e.preventDefault();
            var CurrentSelectedrow = $("#fgrdAvaliableInventoryGridList .trSelectedCheck")
            Prevrow = $("#fgrdAvaliableInventoryGridList .trSelectedCheck").prevAll('tr:visible:first');

            if (Prevrow.length != 0) {
                CurrentSelectedrow.removeClass("trSelectedCheck");
                Prevrow.addClass("trSelectedCheck");


                var newRow = $(Prevrow)
                var rowTop = newRow.position().top;
                var rowBottom = rowTop + newRow.height();
                var $table = $('#DivAvaliableInventoryGridList .bDiv'); // store instead of calling twice
                var tableHeight = $table.height();
                var currentScroll = $table.scrollTop();

                if (rowTop < 0) {
                    // scroll up
                    $('#DivAvaliableInventoryGridList .bDiv').scrollTop(currentScroll + rowTop);
                }
                else if (rowBottom > tableHeight) {
                    // scroll down
                    var scrollAmount = rowBottom - tableHeight;
                    $('#DivAvaliableInventoryGridList .bDiv').scrollTop(currentScroll + scrollAmount);
                }

                return false; e.stopPropagation();
            }
            return false; e.stopPropagation();

        }
        else if (e.which == 40) { //down arrow

            var tabindex = '-' + parseInt($('.ui-dialog:visible').length + 1);
            $("#fgrdAvaliableInventoryGridList")[0].tabIndex = tabindex;
            $("#fgrdAvaliableInventoryGridList").focus();

            e.preventDefault();
            var CurrentSelectedrow = $("#fgrdAvaliableInventoryGridList .trSelectedCheck")
            nextrow = $("#fgrdAvaliableInventoryGridList .trSelectedCheck").nextAll('tr:visible:first');
            if (nextrow.length != 0) {
                CurrentSelectedrow.removeClass("trSelectedCheck");
                nextrow.addClass("trSelectedCheck");

                var newRow = $(nextrow)
                var rowTop = newRow.position().top;
                var rowBottom = rowTop + newRow.height();
                var $table = $('#DivAvaliableInventoryGridList .bDiv'); // store instead of calling twice
                var tableHeight = $table.height();
                var currentScroll = $table.scrollTop();

                if (rowTop < 0) {
                    // scroll up
                    $('#DivAvaliableInventoryGridList .bDiv').scrollTop(currentScroll + rowTop);
                }
                else if (rowBottom > tableHeight) {
                    // scroll down
                    var scrollAmount = rowBottom - tableHeight;
                    $('#DivAvaliableInventoryGridList .bDiv').scrollTop(currentScroll + scrollAmount);
                }

                return false;
            }
            return false;
            e.stopPropagation();
        }

        //$("#fgrdAvaliableInventoryGridList").focus();

    });


    //Include message for Save dialog
    $("#IncludeMessageConfirmDlg").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        buttons: {
            Yes: function () {
                //carrierUpdate();
                //IncludeMessageConfirmDlgcall();
                //removed  by Jose on 3/20/2022
                $("#IncludeMessageConfirmDlg").dialog("close");
                $("#DivCustomerMessageDialog").dialog("open");
            },
            No: function () {
                //carrierUpdate();
                $("#IncludeMessageConfirmDlg").dialog("close");
                $("#DivOrder1InfoDialog").dialog("open");
            },
        },
        open: function () {


            $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel')

            var buttons = $("#IncludeMessageConfirmDlg").dialog("option", "buttons");
            $(".ui-state-focus").next().focus();
        }
    });

    function IncludeMessageConfirmDlgcall() {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetMessagesfromMsgINV',
            contentType: "application/json; charset=utf-8",
            data: '{}',
            dataType: "json",
            success: function (output) {

                //var data = output.d;
                //$("#txtCustMsg1").val(data.Text1)
                //$("#txtCustMsg2").val(data.Text2)
                //$("#txtCustMsg3").val(data.Text3)
                //$("#txtCustMsg4").val(data.Text4)
                //$("#txtCustMsg5").val(data.Text5)
            }
        });
    }

    $("#lstCategoryFilterForInventoryList").change(function () {
        // Get the buttons
        var buttons = $("#CategoryFilterForInventoryDialog").dialog("option", "buttons");
        // Calls the event
        buttons["Next"]();
    });

    $("#lstColorFilterForInventoryList").change(function () {
        // Get the buttons
        var buttons = $("#ColorFilterForInventoryDialog").dialog("option", "buttons");
        // Calls the event
        buttons["Next"]();
    });

    $("#lstVarietyFilterForInventoryList").change(function () {
        // Get the buttons
        var buttons = $("#VarietyFilterForInventoryDialog").dialog("option", "buttons");
        // Calls the event
        buttons["Next"]();
    });

    $("#lstGradeFilterForInventoryList").change(function () {
        // Get the buttons
        var buttons = $("#GradeFilterForInventoryDialog ").dialog("option", "buttons");
        // Calls the event
        buttons["Next"]();
    });


    $("#txtOtherFilterForInventoryList").keypress(function (e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {

            $("#OtherFiltersForInventoryListDialog").next('div').find('button')[0].focus();
        }
    });
    $("#txtQty_AddOrderDetail").change(function () {
        debugger
        var Qty_ = $("#txtQty_AddOrderDetail").val() == "" ? $("#txtQty_AddOrderDetail").attr('placeholder') : $("#txtQty_AddOrderDetail").val();
        if (Qty_ <= Invqty) {
            var tmpcubes = parseFloat(Cubes).toFixed(4);
            var currentqty = Qty_
            var getcubes = ((parseFloat(tmpcubes) / 1728) * (parseInt(currentqty)));
            $("#lblCubes_AddOrderDetail").html(parseFloat(getcubes).toFixed(4));
        }
    });
    $('#lstWarehouseForFilter').change(function () {        
        var Filter = "";
        var inventoryaccess = $("#ctl00_DivInventoryAccessTypes").html();       
        inventoryaccess = ((inventoryaccess != undefined || inventoryaccess != null) ? inventoryaccess.toString().toLowerCase() : "");
        var defaultflag = "";      
        
        if (inventoryaccess != "") {            
            defaultflag = "";
            var dflagarr = [];
            dflagarr = inventoryaccess.split(',')
            for (index = 0; index < dflagarr.length; index++) {
                var temp = dflagarr[index];
                if (inventoryaccess.toLowerCase().includes(temp.toLowerCase())) {                    
                    //defaultflag = ($("#ctl00_DivpgOdrnewtbltype").html() == "" ? '*' : ("'" + $("#ctl00_DivpgOdrnewtbltype").html() + "'," + "'*'"));
                    defaultflag += "'" + temp.toLowerCase() + "',";                    
                }
            }
            defaultflag += "''";
            Filter = "Flag not in (" + defaultflag + ")";
        }        
        if (defaultflag == "") {
            defaultflag = "''";
            Filter = "1=1";
        }        
        var Warehouse = $('#lstWarehouseForFilter').val();        
        if (Warehouse != "0") {
            Filter += " AND WH='" + Warehouse + "'"                        
        }
        ApplyfilterForInventoryList(Filter, "WH");
    });

    function GetActiveWarehouse(callback) {        
        $.ajax({
            async: false,
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseListByUser',            
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                if (output.d != null) {
                    debugger;
                    $('#lstWarehouseForFilter').empty();
                    var warehouse = output.d;
                    $('#lstWarehouseForFilter').append('<option value="0">Select Warehouse</option>');
                    for (var i in warehouse) {
                        var wh = warehouse[i];
                        $('#lstWarehouseForFilter').append('<option value="' + wh.WH + '">' + wh.WH + ' - ' + wh.Name + '</option>');
                    }
                    //$('#lstWarehouseForFilter').val($("#hfInventoryUsersWarehouse").val());
                }
            }
        });
        callback(true);
    }
    //$('#DivAvaliableInventoryGridList [value="Search"]').click(function(){
    //    alert("hi");
    //});


    //$('#DivAvaliableInventoryGridList [class="qsbox"]').keypress(function (e) {
    //    
    //    if (e.which == "13") {
    //        alert("hi");
    //    }
    //});

    /*
    Muthu Nivetha M :: Added :: 13Mar2020 :: To hide/Show Market,Local,Standing,Hold,Arrving,PreBooked buttons to load order by the user permission on setting of logged user
    */
    function HideOrShowButtonsAsperUserPersmission() {

        var index = 0;

        //Can Access Market
        index = 41;
        ButtonHideShow("btnOrderInventoryMarket", index, "M", true);

        //Can Access Local
        index = 42;
        ButtonHideShow("btnOrderInventoryLocal", index, "L", true);

        //Can Access standing
        index = 43;
        ButtonHideShow("btnOrderInventoryStanding", index, "S", true);

        //Can Access Hold
        index = 44;
        ButtonHideShow("btnOrderInventoryHold", index, "H", true);

        //Can Access Arriving
        index = 45;
        ButtonHideShow("btnOrderInventoryArriving", index, "A", true);

        //Can Access Pre Booked
        index = 46;
        ButtonHideShow("btnOrderInventoryPrebooks", index, "P", true);
    }

    /*
    Muthu Nivetha M :: Added :: 13Mar2020 :: To enable/disable short-cut button click event for buttons Market,Local,Standing,Hold,Arrving,PreBooked order by the user permission on setting of logged user
    */
    function ButtonClickAsperUserPersmission(key) {

        var index = 0;
        switch (key) {
            case 77:
                //Can Access Market
                index = 41;
                ButtonHideShow("btnOrderInventoryMarket", index, "M", false);
                break;
            case 76:
                //Can Access Local
                index = 42;
                ButtonHideShow("btnOrderInventoryLocal", index, "L", false);
                break;
            case 72:
                //Can Access Hold
                index = 44;
                ButtonHideShow("btnOrderInventoryHold", index, "H", false);
                break;
            case 84:
                //Can Access standing
                index = 43;
                ButtonHideShow("btnOrderInventoryStanding", index, "S", false);
                break;
            case 80:
                //Can Access Pre Booked
                index = 46;
                ButtonHideShow("btnOrderInventoryPrebooks", index, "P", false);
                break;
            case 65:
                //Can Access Arriving
                index = 45;
                ButtonHideShow("btnOrderInventoryArriving", index, "A", false);
                break;
        }
    }

    function ButtonHideShow(btnname, index, invtype, ishideshow) {
        var userpermision = $("#ctl00_DivForViewAllColumnsInInvnetory").html();
        var hasPermissionToAccess = "";
        hasPermissionToAccess = userpermision.charAt(index);
        var setshow = ((hasPermissionToAccess.toUpperCase() == "Y") || ($("#ctl00_LoggedInUserType_SalesPerson").html().toLowerCase() == "admin")) ? true : false;        
        if (setshow == true) {
            if (ishideshow)
                $('#' + btnname + '').show();
            else
                $('#' + btnname + '').click();
        }
        else {
            if (ishideshow)
                $('#' + btnname + '').hide();
        }
    }

    //Code For Future Option Added by Prashant On 04/02/2020
    $("#btnOrderInventoryFuture").die('click').live('click', function () {
        LoadFutureOrderForAdd();
        $(".YellowWarning").hide();
        $(".YellowWarning").html("");
        $("#ctl00_DivOrderDetailID_OrderSave").html("0");

        $("#AddOrderDetailFromFutureDialog").dialog("open");
        $("#AddOrderDetailFromFutureDialog").dialog('option', 'title', 'Add Future Product :: ' + ($("#ctl00_DivOrderNo").html() == null ? $("#ctl00_DivOrderNo_OrderSave").html() : $("#ctl00_DivOrderNo").html()));
    });                                                                                              
    $("#AddOrderDetailFromFutureDialog").dialog({
        autoOpen: false,
        resizable: false,
        title: 'Add Future Product',
        width: 520,        
        modal: true,
        buttons: {
            SAVE: function () {
                SaveFutureOrderDetail();
                $("#ctl00_DivShortKeyFlag").html("0");
            },
            CLOSE: function () {
                $("#txtFlower_FutureOrderDetail").val("");
                $("#lstFarm_FutureOrderDetail").val("");
                $("#hfFarm_FutureOrderDetail").val("");
                $("#txtQty_FutureOrderDetail").val(0);
                $("#lstUOM_FutureOrderDetail").val("");
                $("#txtUnitsPerBox_FutureOrderDetail").val(0);
                $("#txtPrice_FutureOrderDetail").val(0);
                $("#txtCost_FutureOrderDetail").val(0);
                $("#txtGPM_FutureOrderDetail").val(0);
                $("#txtBoxCode_FutureOrderDetail").val("");
                $("#txtUPC_FutureOrderDetail").val("");
                $("#txtUPCPRICE_FutureOrderDetail").val("");
                $("#txtDateCode_FutureOrderDetail").val("");
                $("#txtNotes_FutureOrderDetail").val("");
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

                $("#txtFlower_FutureOrderDetail").removeAttr("disabled");
                $("#txtUnitsPerBox_FutureOrderDetail").removeAttr("disabled");
                $("#txtQty_FutureOrderDetail").removeAttr("disabled");
                $("#lstFarm_FutureOrderDetail").removeAttr("disabled");
                $("#lstUOM_FutureOrderDetail").removeAttr("disabled");
                $("#txtNotes_FutureOrderDetail").removeAttr("disabled");

                $("#AddOrderDetailFromFutureDialog").dialog("close");
            },
        },
        open: function () {
            debugger;
            LoadFarmList();
            $(".ui-dialog-buttonpane button:contains('SAVE')").addClass('dialogbuttonstyle icon-save');
            $(".ui-dialog-buttonpane button:contains('CLOSE')").addClass('dialogbuttonstyle icon-cancel');
            var OrderDetailID = parseInt($("#ctl00_DivOrderDetailID_OrderSave").html());
            if (OrderDetailID > 0) {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetPoqAwbByOrderDetailId',
                    data: '{"OrderDetailId":"' + OrderDetailID.toString() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {
                        if (output.d != "") {
                            $("#txtQty_FutureOrderDetail").attr("disabled", "disabled");
                            $("#txtUnitsPerBox_FutureOrderDetail").attr("disabled", "disabled");
                            $("#lblProductPurchaseWarningMsg").html("***The product has been already shipped. You can only change price.***");
                        } else {
                            $("#txtQty_FutureOrderDetail").removeAttr("disabled");
                            $("#txtUnitsPerBox_FutureOrderDetail").removeAttr("disabled");
                            $("#lblProductPurchaseWarningMsg").html("***The product has been purchased.***");
                        }
                    }
                });
            }
            
        }
    });

    function LoadFarmList() {
        var length = $('#lstFarm_FutureOrderDetail > option').length;
        if (length <= 0) {
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/GetFarmListFromMainCitySelection',
                data: "{'MainCity':'All'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                    $('#lstFarm_FutureOrderDetail').empty();
                    var Typedata = output.d;
                    $('#lstFarm_FutureOrderDetail').append('<option value="">Select</option>');
                    $('#lstFarm_FutureOrderDetail').append(Typedata);
                    LoadUOM();
                }
            });
        }
    }
   function GetFarmListByFlower(flower) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetFarmListByFlower',
            data: "{'Flower':'"+flower+"'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstFarm_FutureOrderDetail').empty();
                var Typedata = output.d;
                $('#lstFarm_FutureOrderDetail').append('<option value="">Select</option>');
                $('#lstFarm_FutureOrderDetail').append(Typedata);
                LoadUOM();
            }
        });
    }
    function LoadUOM() {
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

    $(function () {
        $("#txtFlower_FutureOrderDetail").autocomplete({
            source: function (request, response) {
                //Commented by Due to Select all product for the all farm    Done by Prashant 07 Apr 2020
                var Farm = '';// $("#lstFarm_FutureOrderDetail").val() != "" ? ($("#lstFarm_FutureOrderDetail").val().trim() != "" ? $("#lstFarm_FutureOrderDetail").val() : "") : "";            
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/GetFlowerEasyAutocomplete',
                    data: "{'Searchtext': '" + request.term + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        debugger;
                        response($.map(data.d, function (flr) {
                            return {
                                label: "[" + flr.Flower.trim() + "] " + flr.Name,
                                Flower: flr.Flower,
                                Name: flr.Name,
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
                $("#txtFlower_FutureOrderDetail").attr("placeholder", "");
                $("#txtUnitsPerBox_FutureOrderDetail").val("");
                $("#txtQty_FutureOrderDetail").val("");
                $("#txtQty_FutureOrderDetail").attr("placeholder", "0");
                $("#txtPrice_FutureOrderDetail").val("");
                $("#txtPrice_FutureOrderDetail").attr("placeholder", "0.000");
                $("#txtCost_FutureOrderDetail").val("");
                $("#txtCost_FutureOrderDetail").attr("placeholder", "0.000");
                $("#txtBoxCode_FutureOrderDetail").val("");
                $("#txtUnitsPerBox_FutureOrderDetail").attr("placeholder", i.item.UNITS);
                $("#txtFlower_FutureOrderDetail").val("[" + i.item.Flower.trim() + "] " + i.item.Name);
                $("#hfFlower_FutureOrderDetail").val(i.item.Flower.trim());
                $("#hfFlowerName_FutureOrderDetail").val(i.item.Name.trim());
                GetFarmListByFlower(i.item.Flower.trim());
            },
            change: function (e, i) {
                if (i.item == null || i.item == undefined) {
                    $("#txtFlower_FutureOrderDetail").val("");
                    $("#hfFlower_FutureOrderDetail").val("");
                    $("#hfFlowerName_FutureOrderDetail").val("");
                    $("#txtUnitsPerBox_FutureOrderDetail").val("0");
                    $(".ui-menu").css("display", "none");
                }
            },
            minLength: 1,
            autoFocus: true
        });
    })
    function LoadFutureOrderForAdd() {
        $("#txtFlower_FutureOrderDetail").val("");
        $("#txtFlower_FutureOrderDetail").removeAttr("disabled");
        $("#txtFlower_FutureOrderDetail").attr("placeholder", "");
        $("#txtUnitsPerBox_FutureOrderDetail").val("");
        $("#txtUnitsPerBox_FutureOrderDetail").attr("placeholder", "0");
        $("#txtQty_FutureOrderDetail").val("");
        $("#txtQty_FutureOrderDetail").attr("placeholder", "0");
        $("#hfFlower_FutureOrderDetail").val("");
        $("#hfFlowerName_FutureOrderDetail").val("");
        $("#txtPrice_FutureOrderDetail").val("");
        $("#txtPrice_FutureOrderDetail").attr("placeholder", "0.000");
        $("#txtNotes_FutureOrderDetail").val("");
        $("#txtBoxCode_FutureOrderDetail").val("");
        $("#txtUPC_FutureOrderDetail").val("");
        $("#txtUPCPRICE_FutureOrderDetail").val("");
        $("#txtDateCode_FutureOrderDetail").val("");

        $("#lblPODflower_FutureOrder").html("");
        $("#lblPODate_FutureOrder").html("");
        $("#lblPOBoxnum_FutureOrder").html("");
        $("#lblShipdate_FutureOrder").html(""); 
        $("#lstFarm_FutureOrderDetail").removeAttr("disabled");
        $("#lstUOM_FutureOrderDetail").removeAttr("disabled");
        $("#txtCost_FutureOrderDetail").removeAttr("disabled");
        $("#txtCost_FutureOrderDetail").val(0);
        $("#txtGPM_FutureOrderDetail").val(0);
        $("#lblProductPurchaseWarningMsg").html("");
    }

    function SaveFutureOrderDetail() {
        var QuantityEntered = (($("#txtQty_FutureOrderDetail").val() == "") ? $("#txtQty_FutureOrderDetail").attr('placeholder') : $("#txtQty_FutureOrderDetail").val());
        isValidateFutureOrder(function (callback1) {
            if (callback1 == true) {
                debugger;
                $(".YellowWarning").hide();
                var FlowerCode = $("#hfFlower_FutureOrderDetail").val();
                var FlowerName = $("#hfFlowerName_FutureOrderDetail").val();
                var Farm = $("#lstFarm_FutureOrderDetail").val();
                var UOM = $("#lstUOM_FutureOrderDetail").val();
                var Dimension = $("#lstUOM_FutureOrderDetail option:selected").text().split('['); 
                var DimLWH = Dimension[1].replace("]", "").split('x');                
                var OrderNo = $("#ctl00_DivOrderNo_OrderSave").html();
                var CustomerNo = $("#ctl00_DivCustomerNo_OrderSave").html();
                var UnitsPerBox = $("#txtUnitsPerBox_FutureOrderDetail").val() == "" ? $("#txtUnitsPerBox_FutureOrderDetail").attr('placeholder') : $("#txtUnitsPerBox_FutureOrderDetail").val();
                var Price = (($("#txtPrice_FutureOrderDetail").val() == "") ? $("#txtPrice_FutureOrderDetail").attr('placeholder') : $("#txtPrice_FutureOrderDetail").val());
                var Cost = (($("#txtCost_FutureOrderDetail").val() == "") ? $("#txtCost_FutureOrderDetail").attr('placeholder') : $("#txtCost_FutureOrderDetail").val());
                var Type = "O";
                var OrderDetailID = $("#ctl00_DivOrderDetailID_OrderSave").html();
                var Notes = $("#txtNotes_FutureOrderDetail").val();
                var BoxCodeNew = $("#txtBoxCode_FutureOrderDetail").val();
                var UPC = $("#txtUPC_FutureOrderDetail").val().toUpperCase(); // Added by Belal :: 29 Aug 2020
                var UPCPRICE = $("#txtUPCPRICE_FutureOrderDetail").val().toUpperCase();
                var DateCode = $("#txtDateCode_FutureOrderDetail").val().toUpperCase(); // Added by Belal :: 29 Aug 2020
                $(".YellowWarning").hide();
                //OrderDetailID,Order, Customer , Flower , Farm , Quantity , UOM , Price , Type , Units , UserName , UserID , BoxCode , Notes , Desc 
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/AddFutureOrderDetail',
                    async: false,
                    data: "{'OrderDetailID':'" + OrderDetailID + "','Order': '" + OrderNo + "','Customer': '" + CustomerNo + "','Flower': '" + FlowerCode + "','Farm':'" + Farm + "','Quantity': '" + QuantityEntered + "','UOM': '" + UOM
                        + "', 'Price': '" + Price + "', 'Cost': '" + Cost + "', 'Type': '" + Type + "', 'Units': '" + UnitsPerBox + "', 'BoxCode':'" + BoxCodeNew + "', 'UPC':'" + UPC + "', 'UPCPRICE':'" + UPCPRICE + "', 'DateCode':'" + DateCode + "', 'Notes':'" + Notes + "','Desc':'" + FlowerName + "','L':'" + DimLWH[0] + "','W':'" + DimLWH[1] + "','H':'" + DimLWH[2] + "'}",
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

                            $("#AddOrderDetailFromFutureDialog").dialog("close");
                            $("#fgrdOrderNewDetails").flexReload({ url: '/url/for/refresh' });
                            $("#fgrdOrderDetails").flexReload({ url: '/url/for/refresh' });
                            $("#ctl00_DivOrderDetailID_OrderSave").html("0");
                        }
                        else {
                            $("#AddOrderDetailFromFutureDialog").dialog("close");
                            $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                        }
                    }
                });
            }
        });
    }

    function isValidateFutureOrder(callback) {
        var FlowerCode = $("#txtFlower_FutureOrderDetail").val();
        var boxqty = $("#txtQty_FutureOrderDetail").val() == "" ? $("#txtQty_FutureOrderDetail").attr("placeholder") : $("#txtQty_FutureOrderDetail").val();        
        if (FlowerCode == "") {
            $(".YellowWarning").html("Please Select Flower");
            $(".YellowWarning").show();
            $("#txtFlower_FutureOrderDetail").focus();
            callback(false);
            return false;
        }
        if (boxqty <= 0) {
            $(".YellowWarning").html("Quantity cannot be 0!");
            $(".YellowWarning").show();
            $("#txtQty_FutureOrderDetail").focus();
            callback(false);
            return false;
        }
        else {
            callback(true);
            return true;
        }
    }
</script>
