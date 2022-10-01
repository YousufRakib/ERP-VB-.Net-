<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PageInventory.ascx.vb" Inherits="pages_PageInventory" %>
<link rel="stylesheet" href="css/Filters.css">
<style type="text/css">
    /*.test{
        width: 40px;
    text-align: right;
    background-color: rgb(114, 201, 125);
    color: black;
    font-weight: bold;
    padding-bottom: 3px;
    font-size: 14px;
    }
    .TotalRows {
        background-color: #72C97D;
        color: black;
        font-weight: bold;
          width: 40px;
    text-align: right;
    background-color: rgb(114, 201, 125);
    color: black;
    font-weight: bold;
    padding-bottom: 3px;
    font-size: 14px;
    }*/


    /*#row0_0 {
        /*position: absolute;
        margin-top: -63px;*
        color: red;
        text-decoration: none;
    }

        #row0_0 td {
            /*background-color: #f3f3f3;*
            border: 0px;
        }

            #row0_0 td.sorted {
                /*background-color: #708090;*
                background-color: #72C97D;
                border: 0px;
            }


            /*css color and alignment for row above the grid*
            #row0_0 td:nth-child(2) div {
                color: red;
                background-color: #72C97D;
                /* height: 28px; *
                font-weight: bold;
                border-right: 1px solid #ddd;
                border-left: 1px solid #ddd;
                /* border-top: 1px solid #ffffff; *
                /* line-height: 30px; *
                padding-bottom: 3px;
                font-size: xx-large;
            }*/

    .Update {
        background: url(images/Update.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .ShowAll {
        background: url(images/ready.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .ReCalc {
        background: url(images/plus.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }

    .Release {
        background: url(images/Release.png) no-repeat 10px 0px;
        text-indent: 30px;
        display: block;
        font-size: 1.2em;
        height: 16px;
    }
    /*#row0_0 td:nth-child(3) div {
        color: red;
        background-color: #72C97D;
        /* height: 28px; *
        font-weight: bold;
        border-right: 1px solid #ddd;
        border-left: 1px solid #ddd;
        /* border-top: 1px solid #ffffff; *
        /* line-height: 30px; *
        padding-bottom: 3px;
        font-size: xx-large;
    }*/

    .trSelectedHeader {
        background-color: red;
        color: white;
    }

    #fgrdInventoryPricing {
        font-weight: bold;
    }

    #fgrdInventoryPricing input[type="text"] {
        border: 1px solid #A9A9A9;
        border-radius: 2px;
        height: 14px;
        padding-left: 2px;
        margin: -3px;
        margin-right: 3px;
        float: left;
        font-weight: bold;
    }

    .flowerDescription {
        margin-top: -5px;
        margin-left: -5px;
        padding-bottom: 3px;
        margin-right: -5px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .SmallButton {
        background-color: #4BE655;
        -moz-border-radius: 28px;
        -webkit-border-radius: 28px;
        border-radius: 28px;
        border: 1px solid #84bbf3;
        display: inline-block;
        cursor: pointer;
        color: #000;
        font-family: arial;
        font-size: 12px;
        padding: 4px 7px;
        text-decoration: none;
        font-weight: bold;
    }

        .SmallButton:hover {
            background-color: #378de5;
            color: #ffffff;
        }

    #tblInventoryAddEditInfo {
        border-spacing: 0px 2px;
        font-size: 12px;
        min-width: 380px;
    }

        #tblInventoryAddEditInfo tr td:first-child {
            height: 30px;
            background-color: darkseagreen;
            color: white;
            padding-left: 20px;
            width: 115px;
        }

        #tblInventoryAddEditInfo td:nth-child(2) {
            padding-left: 20px;
            background-color: whitesmoke;
        }

    #tblInventoryTransAddEditInfo {
        border-spacing: 0px 2px;
        font-size: 12px;
        min-width: 380px;
    }

        #tblInventoryTransAddEditInfo tr td:first-child {
            height: 30px;
            background-color: darkseagreen;
            color: white;
            padding-left: 20px;
            width: 115px;
        }

        #tblInventoryTransAddEditInfo td:nth-child(2) {
            padding-left: 20px;
            background-color: whitesmoke;
        }

    #InventSelectionDetails {
        height: 50px;
        /*float: left;*/
    }

    .button-group:after {
        content: '';
        display: block;
        clear: both;
    }

    .button-group .button {
        float: left;
        padding: 5px 5px;
        margin-left: 1px;
        margin-right: 2px;
        /*width: 135px;*/
        border-right: 1px solid gray;
        border-bottom: 1px solid gray;
        height: 28px;
        font-size: 12px;
        margin-top: 2px;
        font-weight: bold;
        margin-top: 13px;
    }

    .button {
        display: inline-block;
        padding: 3px 10px;
        background: #EEE;
        border: none;
        color: #222;
        cursor: pointer;
    }

        .button:hover,
        .button:active,
        .button.is-checked {
            background-color: #0000ff;
            color: white;
        }

        .button.is-checked {
            color: white;
        }

    #DivInventoryPODetails table td {
        padding: 6px;
    }

    #DivInventoryPODetails input[type=text] {
        background-color: rgb(214, 214, 255);
    }

    #DivInventoryPODetails select {
        background-color: rgb(214, 214, 255);
    }

    #DivInventoryPODetails input[type="text"]:focus {
        background-color: cornsilk;
    }

    #DivInventoryPODetails select:focus {
        background-color: cornsilk;
    }

    .selectize-input {
        width: 307px;
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


    .cooler {
        margin-left: 16px;
    }

        .cooler .coolergrpbtn {
            width: 83px;
            height: 24px;
            margin-top: 13px;
        }

    .coolergrpbtn:hover,
    .coolergrpbtn:active,
    .coolergrpbtn.is-checked {
        background-color: red;
        color: white;
    }

    .coolergrpbtn.is-checked {
        color: white;
    }

    #divInventoryDetailByFarm .flexigrid div.bDiv tr:hover td, #divInventoryDetailByFarm .flexigrid div.bDiv tr:hover td.sorted,
    #divInventoryDetailByFarm .flexigrid div.bDiv tr.trOver td.sorted, #divInventoryDetailByFarm .flexigrid div.bDiv tr.trOver td {
        background-color: transparent !important;
        color: black !important;
    }

        #divInventoryDetailByFarm .flexigrid div.bDiv tr:hover td a {
            color: initial;
        }


    .firstletterunderline::first-letter {
        text-decoration: underline;
    }
</style>

<script type="text/javascript">
    document.title = "Inventory";
</script>
<div style="background-color: whitesmoke; height: 50px; width: 100%;">
    <div class="slidediv" style="overflow: visible; display: block; height: 50px; width: 309px; float: left; position: relative">
        <table style="width:100%">
            <tr>
                <td style="vertical-align: top">
                    <div class="filterbutton" id="divHeaderdate" style="width: 100%">
                        <table style="width: 100%; height: 100%;" id="tbldate">
                            <tr>
                                <td style="font-size: 11px">
                                    <img id="imgInventoryDate" src="images/EmptyFilter.png" class="FilterImageStyle" />
                                    DATE PERIOD
                                </td>

                            </tr>
                            <tr id="tr2" style="height: 18px; text-align: center;">
                                <td>
                                    <label class="DivFilterLabelStyle" id="lblInventorychosendate"></label>
                                    <label class="DivFilterLabelStyle" style="display: none" id="lblInventorychosendate1"></label>
                                    <label class="DivFilterLabelStyle" style="display: none" id="lblInventorychosendate2"></label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>

                <%--<td style="vertical-align: middle; width: 100px;">
                    <div class="AWBS" style="display: block;">
                        <table>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>

                    </div>
                </td>

                <td style="vertical-align: top; width: 100px;">
                    <div id="divApply">
                        <table style="width: 100%; height: 100%;" id="Table1">
                            <tr>
                                <td style="vertical-align: top; width: 100px;">
                                    <input id="btnapply" type="button" class="Acctionbuttons" value="APPLY" style="display: none" />
                                    <input id="btnClearAll" type="button" class="Acctionbuttons" style="display: none" value="RESET" />
                                </td>
                            </tr>

                        </table>
                    </div>
                </td>--%>
            </tr>
            <tr class="rowcss" id="trFarmtitle">
                <td style="vertical-align: top" colspan="5">
                    <div id="divFarmFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 170px;">
                            <select id="lstInventoryAWBFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                            <select id="lstInventoryHistoryAWBFilter" style="width: 160px; margin-left: 5px; margin-top: 5px" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="rowcss" id="trdatetitle">
                <td style="vertical-align: top">
                <td style="vertical-align: top" colspan="5">
                    <div id="divInventorydateFilter" class="filterdiv" style="display: none; width: 300px; height: 30px; vertical-align: middle">
                        <div class="tooltip-content" style="width: 450px; height: 240px;">
                            <table>
                                <tr>
                                    <td>From
                                    </td>
                                    <td>
                                        <input type="text" id="txtInventoryFromRecDate" style="width: 80px;" />
                                    </td>
                                    <td>To
                                    </td>
                                    <td>
                                        <input type="text" id="txtInventoryToRecDate" style="width: 80px" />
                                    </td>
                                    <td>
                                        <input type="button" class="SmallButton" id="btndateok" value="Ok" />

                                    </td>
                                    <%--<td>
                                    <input type="button" class="SmallButton" id="btndateclear" value="Clear" />
                                </td>--%>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div id="divFromDate" style="max-height: 162px; vertical-align: top;"></div>
                                    </td>
                                    <td colspan="3">
                                        <div id="divToDate" style="max-height: 162px; vertical-align: top;"></div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>


    </div>
    <div class="button-group" id="DivInventoryBar" style="float: left;">
        <button class="button" type="button" value="users" id="btninventoryUsers">USERS</button>
        <button class="button" type="button" value="inven" id="btncurrentinventory">COOLER</button>
        <button class="button" type="button" value="invhist" id="btninventoryhistory">HISTORY</button>
        <button class="button" type="button" value="consolidate" id="btninventoryConsolidate">CONSOLIDATE</button>
        <button class="button" type="button" value="rack" id="btninventoryRack">RACKS</button>
        <button class="button" type="button" value="pricing" id="btnPricing">PRICING</button>
    </div>
    <div class="button-group cooler" id="DivCoolerDisplay" style="float: left; display: none;">
        <button class="coolergrpbtn button is-checked" type="button" value="arrival" id="btnarrival">Arrival</button>
        <button class="coolergrpbtn button" type="button" value="available" id="btnavailable">Available</button>
        <button class="coolergrpbtn button" type="button" value="everything" id="btneverything">Everything</button>
    </div>
    <div class="button-group consolidate" id="DivConsolidateBar" style="float: left; display: none;">
        <button class="consolidategrpbtn button" type="button" value="users" id="btnuser">USERS</button>
        <button class="consolidategrpbtn button" type="button" value="cooler" id="btncooler">COOLER</button>
        <button class="consolidategrpbtn button" type="button" value="both" id="btnboth">BOTH</button>
        <button class="consolidategrpbtn button" type="button" value="purchased" id="btnpurchased">PURCHASED</button>
    </div>
    <div id="InventSelectionDetails">
        <table id="tblInventorySelectionDetails" style="height: 50px;">
            <tr>
                <td style="width: 35px;" class="inventoryawb"><a id="lblchoosenInventoryAWBText">AWB</a></td>
                <td style="width: 160px;" class="inventoryawb"><a style="font-weight: bold; font-size: 20px" id="lblchoosenInventoryAWB">-</a></td>
                <td style="width: 35px;" class="inventoryfarm"><a id="lblchoosenInventoryFarmText">Farm</a></td>
                <td style="width: 40px;" class="inventoryfarm"><a style="font-weight: bold; font-size: 20px" id="lblchoosenInventoryFarm">-</a></td>
                <td class="lookupboxdetails">
                    <input id="btnlookupboxdetails" class="BloomButtonEnabled" type="button" style="margin-left: 0px;" value="Lookup Box#" />
                </td>
                <td id="tdTransferReprint">
                    <input id="btnTransferRePrint" class="BloomButtonEnabled" type="button" style="margin-left: 0px;" value="RePrint Transfer" />
                </td>
                <td>
                    <input id="btnCoolerRelease" class="BloomButtonEnabled" type="button" style="margin-left: 0px; display: none;" value="Release" />
                </td>
                <td>
                    <div id="tdRackslabel">
                        <input id="btnRackLabels" class="BloomButtonEnabled" type="button" style="margin-left: 0px;" value="Rack Label" />
                    </div>
                </td>
                 <td>
                    <div id="tdBoxesReceivedlabel">
                        <input id="btnBoxesReceivedLabels" class="BloomButtonEnabled" type="button" style="margin-left: 0px;" value="Handling Report" />
                    </div>
                </td>
            </tr>
        </table>


    </div>
</div>
<table id="tblcurrentinventory" style="float: left">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryHeader" style="float: left">
                <table id="fgrdInventoryHeader" style="display: block;"></table>
            </div>
        </td>
        <%-- <td style="vertical-align: top; padding: 0px; margin: 0px;">
            
        </td>--%>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="divInventoryDetailByAWB" style="float: left">
                <table id="fgrdInventoryDetailbyAWB" style="display: block;"></table>
            </div>
            <div id="divInventoryDetailByFarm" style="float: left">
                <table id="fgrdInventoryDetailbyFARM" style="display: block;"></table>
                <div id="DivSelectedrowInInventoryDetail" style="display: none;"></div>
            </div>
            <div style="margin-top: 6px; display: none; position: absolute; bottom: 45px;" id="divInventoryFilters">
                <button id="btnInventorySearch" type="button" class="BloomButtonEnabled firstletterunderline" value="Search" style="margin-left: 1px; width: 55px;">Search</button>
                <button id="btnInventoryCategory" type="button" class="BloomButtonEnabled firstletterunderline" value="Cat" style="margin-left: 1px; width: 43px;background:#77c1ff;">Cat</button>
                <button id="btnInventoryColor" type="button" class="BloomButtonEnabled" value="Color" style="margin-left: 1px; width: 50px; color: white;background:purple;">C<span style="text-decoration: underline">o</span>lor</button>
                <button id="btnInventoryVariety" type="button" class="BloomButtonEnabled firstletterunderline" value="Variety" style="margin-left: 1px; width: 60px; color: white;background:#ff00e0;">Variety</button>
                <button id="btnInventoryGrade" type="button" class="BloomButtonEnabled firstletterunderline" value="Grade" style="margin-left: 1px; width: 54px;background:teal;">Grade</button>
                <button id="btnInventoryWH" type="button" class="BloomButtonEnabled firstletterunderline" value="Whse" style="margin-left: 1px; width: 46px; color: white;background:#7cd26c;">Whse</button>
                <%--<button id="btnInventoryOther" type="button" class="BloomButtonEnabled firstletterunderline" value="Other" style="margin-left: 4px; width: 60px; color: white;">Other</button>--%>
                <button id="btnInventoryFarm" type="button" class="BloomButtonEnabled firstletterunderline" value="Farm" style="margin-left: 1px; width: 50px; color: white;background:mediumorchid;">Farm</button>
                <button id="btnInventoryGTot" type="button" class="BloomButtonEnabled" value="GTot." style="margin-left: 1px; width: 60px; display: none;background:magenta;">GTot.</button>
                <button id="btnInventoryMarket" type="button" class="BloomButtonEnabled firstletterunderline" value="Market" style="margin-left: 1px; width: 52px;background:deeppink;">Market</button>
                <button id="btnInventoryLocal" type="button" class="BloomButtonEnabled firstletterunderline" value="Local" style="margin-left: 1px; width: 50px; color: white;background:darkviolet;">Local</button>
                <button id="btnInventoryStanding" type="button" class="BloomButtonEnabled" value="Standing" style="margin-left: 1px; width: 68px; color: white;background:darkturquoise;">S<span style="text-decoration: underline">t</span>anding</button>
                <button id="btnInventoryPrebooks" type="button" class="BloomButtonEnabled firstletterunderline" value="Prebooks" style="margin-left: 1px; width: 70px; color: white;background:greenyellow;">Prebooks</button>
                <button id="btnInventoryHold" type="button" class="BloomButtonEnabled firstletterunderline" value="Hold" style="margin-left: 1px; width: 46px; color: white;background:gold;">Hold</button>
                <button id="btnInventoryArriving" type="button" class="BloomButtonEnabled firstletterunderline" value="Arriving" style="width: 62px;background:chocolate;">Arriving</button>
                <button id="btnInventoryRefresh" type="button" class="BloomButtonEnabled firstletterunderline" value="Refresh" style="width: 66px; display: none;background:#fff258;">Refresh</button>
                <button id="btnInventoryFixAWB" type="button" class="BloomButtonEnabled" value="FixAWB" style="width: 35px;background:#d1b700;">Fix</button>
                <button id="btnInventoryTrans" type="button" class="BloomButtonEnabled" value="Trans" style="width: 46px;background:orange;">Trans</button>
                <select style="height: 20px;color:black;font-weight: bold;" id="lstInventoryReports">
                    <option style="height: 20px;color:black;font-weight: bold;" value="RptCoolerInventoryListing">AWB Cooler Inventory Report</option>
                    <option style="height: 20px;color:black;font-weight: bold;" value="RptWholeCoolerInventoryListing">Cooler Inventory Report</option>
                    <option style="height: 20px;color:black;font-weight: bold;" value="RptDiscrepancyReport">Discrepancy Report</option>
                    <option style="height: 20px;color:black;font-weight: bold;" value="RptHuntList">Hunt List</option>
                    <option style="height: 20px;color:black;font-weight: bold;" value="RptPhysicalInventory">Physical Inventory Report</option>
                    <option style="height: 20px;color:black;font-weight: bold;" value="RptInventoryusersProductDetails">Transfer Report</option>
                    <option style="height: 20px;color:black;font-weight: bold;" value="RptReceiptsSummary">Receipts Summary Report</option>
                    <option style="height: 20px;color:black;font-weight: bold;" value="RptHandlingReport">Handling Report</option>
                    <option style="height: 20px;color:black;font-weight: bold;" value="RptEndOfMonthCoolerInventoryListing">End of Month Inventory Report</option>
                </select>
                <img style='cursor: pointer; height: 24px; vertical-align: bottom;' src='images/printer-icon.png' id="btnPrintInventoryReport" />
            </div>
            <div id="divInventoryFiltersDefault" style="position: absolute; bottom: 45px; right: 125px; display: none;">
            </div>
        </td>
    </tr>
</table>

<table id="tblInventoryUsers" style="float: left;">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryUsersHeaders" style="float: left">
                <table id="fgrdInventoryUsersHeaders" style="display: block;"></table>
            </div>
        </td>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryUserFarmDetails" style="float: left">
                <table id="fgrdInventoryUserFarmDetails" style="display: block;"></table>
            </div>
        </td>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryUsersDetails" style="float: left">
                <table id="fgrdInventoryUsersDetails" style="display: block;"></table>
            </div>
        </td>
    </tr>
</table>

<table id="tblInventoryUsersSQLPage" style="float: left;">
    <tr>
        <td>
            <div id="PageInventoryUsersSQL"></div>
        </td>
    </tr>
</table>

<table id="tblInventoryConsolidate" style="float: left;">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryUsersConsolidate" style="float: left">
                <table id="fgrdInventoryUsersConsolidate" style="display: block;"></table>
            </div>
            <div id="DivInventoryUsersConsolidatePurchased" style="float: left; display: none;">
                <table id="fgrdInventoryUsersConsolidatePurchased2"></table>
            </div>
        </td>
    </tr>
</table>

<table id="tblInventoryRacks" style="float: left;">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryRacks" style="float: left">
                <table id="fgrdInventoryRacks" style="display: block;"></table>
            </div>
        </td>
    </tr>
</table>

<table id="tblInventoryPricing" style="float: left;">
    <tr>
        <td style="vertical-align: top; padding: 0px; margin: 0px;">
            <div id="DivInventoryPricing" style="float: left">
                <table id="fgrdInventoryPricing" style="display: block;"></table>
            </div>
            <div style="margin-top: 6px; position: absolute; bottom: 45px; display:none;" id="divInventoryPricingFilters">
                <button id="btnInventoryPricingSearch" type="button" class="BloomButtonEnabled firstletterunderline" value="Search" style="margin-left: 1px; width: 55px;">Search</button>
                <button id="btnInventoryPricingCategory" type="button" class="BloomButtonEnabled firstletterunderline" value="Cat" style="margin-left: 1px; width: 43px;background:#77c1ff;">Cat</button>
                <button id="btnInventoryPricingColor" type="button" class="BloomButtonEnabled" value="Color" style="margin-left: 1px; width: 50px; color: white;background:purple;">C<span style="text-decoration: underline">o</span>lor</button>
                <button id="btnInventoryPricingVariety" type="button" class="BloomButtonEnabled firstletterunderline" value="Variety" style="margin-left: 1px; width: 60px; color: white;background:#ff00e0;">Variety</button>
                <button id="btnInventoryPricingGrade" type="button" class="BloomButtonEnabled firstletterunderline" value="Grade" style="margin-left: 1px; width: 54px;background:teal;">Grade</button>
                <button id="btnInventoryPricingWH" type="button" class="BloomButtonEnabled firstletterunderline" value="Whse" style="margin-left: 1px; width: 46px; color: white;background:#7cd26c;">Whse</button>
                <%--<button id="btnInventoryPricingOther" type="button" class="BloomButtonEnabled firstletterunderline" value="Other" style="margin-left: 4px; width: 60px; color: white;">Other</button>--%>
                <button id="btnInventoryPricingFarm" type="button" class="BloomButtonEnabled firstletterunderline" value="Farm" style="margin-left: 1px; width: 50px; color: white;background:mediumorchid;">Farm</button>
                <button id="btnInventoryPricingGTot" type="button" class="BloomButtonEnabled" value="GTot." style="margin-left: 1px; background: red; width: 60px; display: none;background:magenta;">GTot.</button>
                <button id="btnInventoryPricingMarket" type="button" class="BloomButtonEnabled firstletterunderline" value="Market" style="margin-left: 1px; width: 52px;background:deeppink;">Market</button>
                <button id="btnInventoryPricingLocal" type="button" class="BloomButtonEnabled firstletterunderline" value="Local" style="margin-left: 1px; width: 50px; color: white;background:darkviolet;">Local</button>
                <button id="btnInventoryPricingStanding" type="button" class="BloomButtonEnabled" value="Standing" style="margin-left: 1px; width: 68px; color: white;">S<span style="text-decoration: underline">t</span>anding</button>
                <button id="btnInventoryPricingPrebooks" type="button" class="BloomButtonEnabled firstletterunderline" value="Prebooks" style="margin-left: 1px; width: 70px; color: white;background:greenyellow;">Prebooks</button>
                <button id="btnInventoryPricingHold" type="button" class="BloomButtonEnabled firstletterunderline" value="Hold" style="margin-left: 1px; width: 46px; color: white;background:gold;">Hold</button>
                <button id="btnInventoryPricingArriving" type="button" class="BloomButtonEnabled firstletterunderline" value="Arriving" style="width: 62px;background:chocolate;">Arriving</button>
                <button id="btnInventoryPricingRefresh" type="button" class="BloomButtonEnabled firstletterunderline" value="Refresh" style="width: 66px; display: none">Refresh</button>
                
            </div>
        </td>
    </tr>
</table>

<div style="display: none" id="DivInventoryAWB"></div>
<div style="display: none" id="DivInventoryFARM"></div>
<div id="DivInevntoryAddEditInfo" style="display: none">
    <table id="tblInventoryAddEditInfo" style="width: 100%;">
        <tr>
            <td>Add User
            </td>
            <td>
                <a id="lblInvenAddedUser"></a>
            </td>
        </tr>
        <tr>
            <td>Add Date
            </td>
            <td>
                <a id="lblInvenAddedDate"></a>
            </td>
        </tr>
        <tr>
            <td>Add Time
            </td>
            <td>
                <a id="lblInvenAddedTime"></a>
            </td>
        </tr>
        <tr>
            <td>Edit User
            </td>
            <td>
                <a id="lblInvenEditedUser"></a>
            </td>
        </tr>
        <tr>
            <td>Edit Date
            </td>
            <td>
                <a id="lblInvenEditedDate"></a>
            </td>
        </tr>
        <tr>
            <td>Edit Time
            </td>
            <td>
                <a id="lblInvenEditedTime"></a>
            </td>
        </tr>
    </table>
</div>


<%--STA::26-OCT-2015::edit option for Inventroy --%>
<%--Start--%>


<div id="msgbox-select" title="Alert">
    <p id="msg"></p>
</div>
<div id="InventoryDetailID" style="display: none;">0</div>
<div id="InventoryHeaderID" style="display: none;">0</div>
<div id="InventoryUserFarmDetailID" style="display: none;">0</div>
<div id="InventorySecondHeaderID" style="display: none;">0</div>
<div id="InventoryFarm" style="display: none;">0</div>
<div id="InventoryAWB" style="display: none;">0</div>
<div id="InventoryUserTableName" style="display: none;">0</div>
<div id="DivInventoryFlowerCategory" style="display: none"></div>
<div id="DivInventoryFlowerName" style="display: none"></div>
<div id="DivInventoryFlowerColorCode" style="display: none"></div>
<div id="DivForInventoryLockRelease" style="display: none" runat="server"></div>
<div id="DivLoggedInUserType" style="display: none" runat="server"></div>


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
<div id="FlowerFilterForInventoryPricingDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Flower</td>
            <td style="padding-left: 22px">
                <input maxlength="8" class="AllUpperCaseTextBox" style="width: 88px" id="txtFlowerFilterForInventoryPricingList" />
            </td>
        </tr>
    </table>
</div>

<div id="DivHunt" style="display: none">
    <table style="margin-top: 16px;">
        <tr style="height: 55px; text-align: center;">
            <td colspan="2"><span style="color: gray;">Please enter a 0 for all Current Orders</span></td>
        </tr>
        <tr style="">
            <td>AWBNo</td>
            <td style="padding-left: 22px">
                <input class="NumbersOnly" style="width: 138px" id="txtHuntAwb" />
            </td>
        </tr>
    </table>
</div>

<div id="FarmFilterForInventoryDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Farm</td>
            <td style="padding-left: 22px">
                <input style="width: 180px" id="txtFarmFilterForInventoryList" maxlength="3" class="AllUpperCaseTextBox" />
            </td>
        </tr>
    </table>
</div>
<div id="FarmFilterForInventoryPricingDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Farm</td>
            <td style="padding-left: 22px">
                <input style="width: 180px" id="txtFarmFilterForInventoryPricingList" maxlength="3" class="AllUpperCaseTextBox" />
            </td>
        </tr>
    </table>
</div>

<div id="OtherFiltersForInventoryListDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>
                <div class="button-group consolidate" id="DivInvetoryOtherFilter" style="float: left;">
                    <button class="consolidategrpbtn button" type="button" value="AWB" id="btnAWB">AWB</button>
                    <button class="consolidategrpbtn button" type="button" value="Aged" id="btnAged">Aged</button>
                    <button class="consolidategrpbtn button" type="button" value="Country" id="btnCountry">Country</button>
                    <button class="consolidategrpbtn button" type="button" value="Type" id="btnType">Type</button>
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

<div id="CategoryFilterForInventoryDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Flower</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstCategoryFilterForInventoryList" />
            </td>
        </tr>
    </table>
</div>

<div id="CategoryFilterForInventoryPricingDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Flower</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstCategoryFilterForInventoryPricingList" />
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
<div id="VarietyFilterForInventoryPricingDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Variety</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstVarietyFilterForInventoryPricingList" />
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
<div id="GradeFilterForInventoryPricingDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Grade</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstGradeFilterForInventoryPricingList" />
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

<div id="ColorFilterForInventoryPricingDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Color</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstColorFilterForInventoryPricingList" />
            </td>
        </tr>
    </table>
</div>

<div id="WarehouseFilterForInventoryDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Warehouse</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstWarehouseFilterForInventoryList" />
            </td>
        </tr>
    </table>
</div>
<div id="WarehouseFilterForInventoryPricingDialog">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>Warehouse</td>
            <td style="padding-left: 22px">
                <select style="width: 180px" id="lstWarehouseFilterForInventoryPricingList" />
            </td>
        </tr>
    </table>
</div>

<div id="DialogFixAWB">
    <table>
        <tr>
            <td>
                <table id="tblInvOldAWBDetails" style="margin-top: 16px;">
                    <tr style="margin-top: 10px">
                        <td>Please enter wrong AWB # </td>
                        <td style="padding-left: 47px">
                            <input type="text" id="txtInvOldAWB" style="text-align: right;" class="NumbersOnly" maxlength="15" />
                        </td>
                    </tr>
                    <tr style="margin-top: 10px">
                        <td style="text-align: right;">Warehouse </td>
                        <td style="padding-left: 47px">
                            <input type="text" id="txtInvOldWarehouse" style="width: 40px;" maxlength="2" />
                        </td>
                    </tr>
                    <tr style="margin-top: 10px">
                        <td>Please enter farm to change </td>
                        <td style="padding-left: 47px">
                            <input type="text" id="txtInvOldFarm" style="width: 60px;" maxlength="3" />
                        </td>
                    </tr>
                    <tr style="margin-top: 10px">
                        <td style="text-align: right;">Product </td>
                        <td style="padding-left: 47px">
                            <input type="text" id="txtInvOldProduct" style="width: 100px;" maxlength="10" />
                        </td>
                    </tr>
                    <tr style="margin-top: 10px">
                        <td style="text-align: right;">Boxnum </td>
                        <td style="padding-left: 47px">
                            <input type="text" id="txtInvOldBoxnum" style="width: 80px; text-align: right;" class="NumbersOnly" maxlength="5" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table id="tblInvNewAWBDetails" style="margin-top: 16px; display: none;">
                    <tr style="margin-top: 10px">
                        <td>Please enter new AWB # </td>
                        <td style="padding-left: 22px">
                            <input type="text" id="txtInvNewAWB" style="text-align: right;" maxlength="15" class="NumbersOnly" />
                        </td>
                    </tr>
                    <tr style="margin-top: 10px">
                        <td>Please enter new Warehouse </td>
                        <td style="padding-left: 22px">
                            <input type="text" id="txtInvNewWarehouse" style="width: 40px;" maxlength="2" />
                        </td>
                    </tr>
                    <tr style="margin-top: 10px">
                        <td>Please enter new farm code </td>
                        <td style="padding-left: 22px">
                            <input type="text" id="txtInvNewFarm" style="width: 60px;" maxlength="3" />
                        </td>
                    </tr>
                    <tr style="margin-top: 10px">
                        <td>Please enter new receiving date </td>
                        <td style="padding-left: 22px">
                            <input type="text" id="txtInvNewRecDate" style="width: 80px;" />
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>
                <table id="tblInvNewBoxSize" style="display: none;">
                    <tr style="margin-top: 10px">
                        <td style="text-align: right; padding-left: 130px;">Cost </td>
                        <td style="padding-left: 69px">
                            <input type="text" id="txtInvNewCost" style="width: 80px;" maxlength="12" class="DecimalsOnly" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>

<div id="DivViewInventoryTransactionsDialog">

    <div id="divViewInventoryTransactions" style="float: left">
        <table id="fgrdViewInventoryTransactions" style="display: block;"></table>
    </div>
</div>

<div style="display: none" id="DivInventoryTransAWB"></div>
<div style="display: none" id="DivInventoryTransFARM"></div>
<div id="DivInevntoryTransAddEditInfo" style="display: none">
    <table id="tblInventoryTransAddEditInfo" style="width: 100%;">
        <tr>
            <td>Add User
            </td>
            <td>
                <a id="lblInvenTransAddedUser"></a>
            </td>
        </tr>
        <tr>
            <td>Add Date
            </td>
            <td>
                <a id="lblInvenTransAddedDate"></a>
            </td>
        </tr>
        <tr>
            <td>Add Time
            </td>
            <td>
                <a id="lblInvenTransAddedTime"></a>
            </td>
        </tr>
        <tr>
            <td>Edit User
            </td>
            <td>
                <a id="lblInvenTransEditedUser"></a>
            </td>
        </tr>
        <tr>
            <td>Edit Date
            </td>
            <td>
                <a id="lblInvenTransEditedDate"></a>
            </td>
        </tr>
        <tr>
            <td>Edit Time
            </td>
            <td>
                <a id="lblInvenTransEditedTime"></a>
            </td>
        </tr>
        <tr>
            <td>Delete User
            </td>
            <td>
                <a id="lblInvenTransDeletedUser"></a>
            </td>
        </tr>
        <tr>
            <td>Delete Date
            </td>
            <td>
                <a id="lblInvenTransDeletedDate"></a>
            </td>
        </tr>
        <tr>
            <td>Delte Time
            </td>
            <td>
                <a id="lblInvenTransDeletedTime"></a>
            </td>
        </tr>
    </table>
</div>
<div id="InventoryLockReleaseDialog" style="display: none"></div>
<div id="ConfirmationInventoryDeleteDialog" style="display: none">
    <div style="height: 35px;">
        Are you sure to <b>Delete</b> this Inventory Item?
    </div>
</div>

<div id="DivRackLabelDialog" style="margin-left: 52px;">
    <table style="margin-top: 16px;">
        <tr style="margin-top: 10px">
            <td>
                <input maxlength="2" class="ClsAlphabetsOnly AllUpperCaseTextBox" type="text" id="txtRackText" style="width: 46px;" /></td>
            <td>
                <input maxlength="2" class="ClsNumbersOnly" type="text" id="txtRackRange" style="width: 46px;" /></td>
        </tr>
    </table>
</div>

<div id="DivPricingReleaseDialog" style="display: none">
    <table style="width: 100%; height: 100%">
        <tr>
            <td colspan="2" style="height: 34px">
                <div class="YellowWarningHeader">
                </div>
            </td>
        </tr>
        <tr style="display: none;">
            <td>Release From #</td>
            <td>
                <select id="lstFromUsersType" style="width: 150px; height: 23px"></select>
                <input type="hidden" id="hfFromUsersType" />
            </td>
        </tr>
        <tr>
            <td>Release To #</td>
            <td>
                <select id="lstToUsersType" style="width: 150px; height: 23px"></select>
                <input type="hidden" id="hfToUsersType" />
            </td>
        </tr>
    </table>
</div>

<div id="DialogBoxesReceived" style="display: none;">
    <fieldset id="brSPDateRange" style="font-size: 18px; font-weight: bold; height: 68px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="txtbrFromDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    <label id="lblbrFromDateHidden">From </label>
                </td>
                <td>
                    <input id="txtbrFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
            <tr id="trbrToDatelbl">
                <td colspan="2" id="tdbrToDatelblhdn">
                    <input type="text" id="txtbrToDateHidden" style="width: 0; height: 0; top: -100px; position: absolute;" />
                </td>
            </tr>
            <tr style="height: 33px;" id="trbrToDatetxt">
                <td style="padding-right: 10px;" id="tdbrToDatelbl">
                    <label id="lblbrToDate">To </label>
                </td>
                <td id="tdbrToDatetxt">
                    <input id="txtbrToDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<div id="DialogEndOfMonth" style="display: none;">
    <fieldset id="fsSPDateRange" style="font-size: 18px; height: 68px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">
                <td style="padding-right: 10px;">
                    End of Month Date :
  <%--              </td>
                <td>
  --%>                  <input id="txtReportDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogReceiptsSummary" style="display: none;">
    <fieldset id="fsReceiptsSummaryDateRange" style="font-size: 18px; height: 68px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">  
                <td style="padding-right: 10px;">
                    Receipts Summary From - To
    <%--            </td>
                <td>--%>
                    <input id="txtReceiptsSummaryFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />

                    <input id="txtReceiptsSummarytoDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
                
            </tr>
        </table>
    </fieldset>
</div>

<div id="DialogHandlingReport" style="display: none;">
    <fieldset id="fsHandlingReportDateRange" style="font-size: 18px; height: 68px; border-width: 1px; margin-top: 10px; border-radius: 5px;">
        <legend style="background: white; margin-left: 2px;"></legend>
        <table>
            <tr style="height: 33px;">  
                <td style="padding-right: 10px;">
                    Handling Report From - To
    <%--            </td>
                <td>--%>
                    <input id="txtHandlingReportFromDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />

                    <input id="txtHandlingReporttoDate" class="rbARReports" type="text" style="margin-top: 8px; width: 120px;" />
                </td>
                
            </tr>
        </table>
    </fieldset>
</div>

<%--END--%>
<script type="text/javascript">
var isTransGridLoad = false;
var IsInventoryDetailsByAWBGridInitialize = false, IsInventoryDetailsByFARMGridInitialize = false, DefInventoryDetailsByAWB = "",
    DefInventoryDetailsByFARM = "", FilterQuery = "", AWBCtrl = "", CustomerUsingKomet = false;
if (('<%=ConfigurationManager.AppSettings("IsKometSales")%>').toLowerCase() != "yes") {
    CustomerUsingKomet = true;
}
else {
    CustomerUsingKomet = false;
}

//New added key for Loading-data in Inventory-Everything

var isLoadallCoolerInventory = false,
    isFromEverything = "";

var IsInventoryDetailsByAWBGridInitialize = false;
var IsInventoryDetailsByFARMGridInitialize = false;
var DefInventoryDetailsByAWB = "";
var DefInventoryDetailsByFARM = "";
var FilterQuery = "";
var AWBCtrl = "";

var CustomerUsingKomet = false;
if (('<%=ConfigurationManager.AppSettings("IsKometSales")%>').toLowerCase() != "yes") {

    CustomerUsingKomet = true;
}
else {
    CustomerUsingKomet = false;
}
if ($("#ctl00_DivLoggedInUserType").html().toLowerCase() == "warehouse") {
    $("#btninventoryUsers").hide();
    $("#btncurrentinventory").show();
    $("#btninventoryhistory").show();
    $("#btninventoryConsolidate").hide();
    $("#btninventoryRack").show();
    $("#btnPricing").hide();
}
else {
    $("#btninventoryUsers").show();
    $("#btncurrentinventory").show();
    $("#btninventoryhistory").show();
    $("#btninventoryConsolidate").show();
    $("#btninventoryRack").show();
    $("#btnPricing").show();
}
//VEN::For User tab selection
var IsInventoryUserHeaderGridInitialize = false;
var IsInventoryUserFarmDetailsGridInitialize = false;
var IsInventoryUserDetailsGridInitialize = false;
var UserFarmDetailsGridFilter = "";
var UserDetailsGridFilter = "";
var UserFarmDetailsGridTableName = "";
var UserDetailsGridTableName = "";
var IsInventoryUserConsolidateGridInitialize = false;
var IsInventoryRacksGridInitialize = false;
var IsInventoryPricingGridInitialize = false;
var IsInventoryHeaderGridInitialize = false;
var AWBFlag = "";
var ReceivedPiecesOnly = "0";
var tempscreen = '';

$(document).ready(new function () {
    LoadCreditCode()
    $(".inventoryawb").hide();
    $(".inventoryfarm").hide();
    $(".lookupboxdetails").hide();
    $("#tdTransferReprint").hide();
    //if ($("#ctl00_DivLoggedInUserType").html().toLowerCase() == "warehouse") {
    //    $("#tblInventoryRacks").show();
    //    $("#InventSelectionDetails").show();
    //    $("#tdRackslabel").show()
    //}
    //else {
    //    $("#tblInventoryRacks").show();
    //    $("#InventSelectionDetails").show();
    //    $("#tdRackslabel").hide()
    //}

    $("#lstInventoryAWBFilter").show();
    $("#lstInventoryHistoryAWBFilter").hide();
    AWBCtrl = "lstInventoryAWBFilter";
    isLoadallCoolerInventory = ('<%=ConfigurationManager.AppSettings("lLoadallCoolerInventory")%>').toString() == "0" ? false : true;
    AWBFlag = "";

<%--    if ('<%=ConfigurationManager.AppSettings("CompanyName")%>'.toLowerCase().indexOf("EspritMiami") >= 0 && $("#DivCoolerDisplay").find('button.is-checked')[0].value == "arrival") {
        AWBFlag = "1";
    }
    else {
        AWBFlag = "";
    }--%>

 <%--   if ('<%=ConfigurationManager.AppSettings("CompanyName")%>'.toLowerCase().indexOf("EspritMiami") >= 0 && $("#DivCoolerDisplay").find('button.is-checked')[0].value != "available") {
        ReceivedPiecesOnly = "1";
    }--%>

    //$("#DivInventoryBar").find('button[id=btncurrentinventory]').addClass('is-checked');
    //$("#tblInventoryUsers").hide();

    //$("#tblcurrentinventory").hide();

    $(function () {
        $("#divFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
            onSelect: function (Date) {
                $("#txtInventoryFromRecDate").val(Date);
            }
        }).datepicker("setDate", new Date());
        $("#divToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
            onSelect: function (Date) {
                $("#txtInventoryToRecDate").val(Date);
            }
        }).datepicker("setDate", new Date());
         $("#txtbrFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtbrToDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));
        $("#txtReportDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtReceiptsSummaryFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtReceiptsSummarytoDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtHandlingReportFromDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtHandlingReporttoDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'mm/dd/yy',
            showOtherMonths: true,
            selectOtherMonths: true,
        }).datepicker("setDate", new Date(new Date()));

        $("#txtInventoryFromRecDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
        $("#txtInventoryToRecDate").val($.datepicker.formatDate('mm/dd/yy', new Date()));
    });

    //$("#txtInventoryFromRecDate").datepicker({
    //    changeMonth: true,
    //    changeYear: true,
    //    dateFormat: 'mm/dd/yy',
    //    showOtherMonths: true,
    //    selectOtherMonths: true,
    //    //onSelect: function (date) {
    //    //    $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'ShippedFromDateFilter', value: $("#txtInventoryFromRecDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtInventoryToRecDate").val() }], query: "", newp: 1 }).flexReload();
    //    //}
    //}).datepicker("setDate", new Date());

    //$("#txtInventoryToRecDate").datepicker({
    //    changeMonth: true,
    //    changeYear: true,
    //    dateFormat: 'mm/dd/yy',
    //    showOtherMonths: true,
    //    selectOtherMonths: true,
    //    //onSelect: function (date) {
    //    //    $("#fgrdUserHeaders").flexOptions({ params: [{ name: 'ShippedFromDateFilter', value: $("#txtInventoryFromRecDate").val() }, { name: 'ShippedToDateFilter', value: $("#txtInventoryToRecDate").val() }], query: "", newp: 1 }).flexReload();
    //    //}
    //}).datepicker("setDate", new Date());


    //$.ajax({
    //    type: "POST",
    //    url: 'BloomService.asmx/LoadF_ProdDetails',
    //    data: "{}",
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (dateoutput, status) {

    //    }
    //});
    //LoadFgrdInventoryHeader();
});

// $('.TotalRows>td>div').die('mouseover').live('mouseover', function (e) {
//     
//     var element = $(this)[0].innerText.trim();
//     if (element.toLowerCase() != "total" && element != "") {
//         $(this).attr('title', '');
//         $(this).mouseover(
//    function () {
//        $(this).attr('title', element);
//    }
//);
//     }
// });
//var element=$(this)[0].innerText.trim();
//if (element.toLowerCase() != "total" && element != "") {
//    $(this).removeAttr('title');
//    $(this).attr('title', element);
//}        
//alert($(this)[0].innerText);
//});

    function GetAWBList() {

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetDateSession',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (dateoutput, status) {

                var date = dateoutput.d;
                if (date == null || date == "" || date[0] === "" && date[1] === "") {
                    var fdate = "Today: " + $("#txtInventoryToRecDate").val();
                    $("#lblInventorychosendate").html(fdate);
                    $("#lblInventorychosendate1").html($("txtInventoryFromRecDate").val());
                    $("#lblInventorychosendate2").html($("txtInventoryToRecDate").val());
                    $("#divFromDate").datepicker("setDate", new Date());
                    $("#divToDate").datepicker("setDate", new Date());
                    $("#imgInventoryDate").attr("src", "images/Filter.png");
                    $("#tr2").addClass('FilterDivStyle');
                }
                else {
                    var fdate = date[0] + " to " + date[1];
                    $("#txtInventoryFromRecDate").val(date[0]);
                    $("#txtInventoryToRecDate").val(date[1]);
                    $("#lblInventorychosendate").html(fdate);
                    $("#lblInventorychosendate1").html(date[0]);
                    $("#lblInventorychosendate2").html(date[1]);
                    $("#divFromDate").datepicker("setDate", Date.parse(date[0]));
                    $("#divToDate").datepicker("setDate", Date.parse(date[1]));
                    $("#imgInventoryDate").attr("src", "images/Filter.png");
                    $("#tr2").addClass('FilterDivStyle');
                }
            }
        });
    }

//function LoadFromUsersType() {
//    var length = $('#lstFromUsersType > option').length;
//    if (length <= 0) {
//        $.ajax({
//            type: "POST",
//            url: 'BloomService.asmx/GetTypeForInventory',
//            data: "{}",
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            success: function (output, status) {
//                $('#lstFromUsersType').empty();
//                var Typedata = output.d;
//                $('#lstFromUsersType').append('<option value="0">Select</option>');
//                for (var i in Typedata) {
//                    var Type = Typedata[i];
//                    $('#lstFromUsersType').append('<option value="' + Type.Code + '">' + Type.Code + ' - ' + Type.Name + '</option>');
//                }
//                if ($("#hfFromUsersType").val() != "" && $("#hfFromUsersType").val() != 0)
//                    $('#lstFromUsersType').val($("#hfFromUsersType").val());
//                else
//                    $("#lstFromUsersType").val("0");
//            }
//        });
//    }
//    else {
//        $('#lstFromUsersType').val($("#hfFromUsersType").val());
//    }
//}

function LoadToUsersType() {
    var length = $('#lstToUsersType > option').length;
    if (length <= 0) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetTypeForInventory',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstToUsersType').empty();
                var Typedata = output.d;
                $('#lstToUsersType').append('<option value="0">Select</option>');
                for (var i in Typedata) {
                    var Type = Typedata[i];
                    $('#lstToUsersType').append('<option value="' + Type.Code + '">' + Type.Code + ' - ' + Type.Name + '</option>');
                }
                if ($("#hfToUsersType").val() != "" && $("#hfToUsersType").val() != 0)
                    $('#lstToUsersType').val($("#hfToUsersType").val());
                else
                    $("#lstToUsersType").val("0");
            }
        });
    }
    else {
        $('#lstToUsersType').val($("#hfToUsersType").val());
    }
}
var IsCalledFromPricing = true;
function ReleaseClicked() {
    $(".YellowWarningHeader").hide();
    // LoadFromUsersType();
    LoadToUsersType();
    $("#DivPricingReleaseDialog").dialog('option', 'title', "Release From - To");
    IsCalledFromPricing = true;
    $("#DivPricingReleaseDialog").dialog("open");
}
$("#btnCoolerRelease").die("click").live("click", function () {
    ReleaseClickedFromCooler();
});
function ReleaseClickedFromCooler() {
    $(".YellowWarningHeader").hide();
    // LoadFromUsersType();
    LoadToUsersType();
    $("#DivPricingReleaseDialog").dialog('option', 'title', "Release From - To");
    IsCalledFromPricing = false;
    $("#DivPricingReleaseDialog").dialog("open");
}
//Added by Anubhuti October/19/2021
function InvPricingClicked() {
    $(".YellowWarningHeader").hide();
    $.ajax({
         type: "POST",
         url: 'BloomService.asmx/GetinventoryPricing',
         data: '{}',
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         success: function (output) {
             if (output.d == "LogOut") {
                 window.location.href = "Login.aspx"
             }
             else if (output.d != "error") {
                $("#fgrdInventoryPricing").flexReload({ url: '/url/for/refresh' });
             }
             else {
                 $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
             }
         }
    });
}
$("#DivPricingReleaseDialog").dialog({
    autoOpen: false,
    width: 450,
    modal: true,
    title: 'New User',
    resizable: false,
    buttons: {
        Save: function () {

            if ($("#lstToUsersType").val().trim() == "0") {
                $(".YellowWarningHeader").html("Please Select Inventory Type For Release To #");
                $(".YellowWarningHeader").show();
                $("#lstToUsersType").focus();
                return false;
            }
            $(".YellowWarningHeader").hide();
            var IDs = "";
            var ID = "";
            if (IsCalledFromPricing) {
                $('#fgrdInventoryPricing tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                            ID = this.id.replace("row","");
                            IDs = IDs + ID + ",";
                        }
                    }
                });
            }
            else {
                $('#fgrdInventoryDetailbyFARM tr').each(function () {
                    if ($(this).attr("id") != "row0") {
                        ID = this.id.replace("row","");
                        IDs = IDs + ID + ",";
                    }
                });
            }
            var ReleaseFrom = "";//$("#lstFromUsersType").val();
            var ReleaseTo = $("#lstToUsersType").val();
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/ReleaseInventory',
                data: '{"IDs":"' + IDs + '","ReleaseFrom":"' + ReleaseFrom + '","ReleaseTo":"' + ReleaseTo + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {

                    if (output.d == "LogOut") {
                        window.location.href = "Login.aspx"
                    }
                    else if (output.d == "Success") {
                        //close and refresh the dialog
                        if (IsCalledFromPricing) {
                            $("#fgrdInventoryPricing").flexReload({ url: '/url/for/refresh' });
                        }
                        else {
                            $("#fgrdInventoryDetailbyFARM").flexReload({ url: '/url/for/refresh' });
                        }
                        $("#DivPricingReleaseDialog").dialog("close");
                    }
                    else {
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                    }
                }
            });

        },
        Cancel: function () {
            $("#DivPricingReleaseDialog").dialog("close");
        }
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        $("#txtAWB_Header").focus();
    }
});

function LoadFgrdInventoryHeader() {

    var h = "";
    var awb = "";
    if ($("#DivInventoryBar").find('button.is-checked')[0].value == "inven" && ('<%=ConfigurationManager.AppSettings("CompanyName")%>'.toLowerCase().indexOf("EspritMiami") < 0)) {
        h = '<img style="Cursor:pointer;" id="chkOnHand" title="Change to pieces received" src="images/check-off.png"/>';
        awb = '<img style="Cursor:pointer;" id="chkInvenAWB" title="Change to AWB for flag is A" src="images/check-off.png"/>';
    }
    else {
        h = 'Pieces';
        awb = 'AWB';
    }
    $("#btnCoolerRelease").css("display", "none");
    $("#fgrdInventoryHeader").flexigrid({
        url: 'BloomService.asmx/GetInventoryHeaderList',
        dataType: 'xml',
        colModel: [
            { display: awb, name: 'AWB', width: 100, sortable: true, align: 'left', process: InvenHeaderRowClickByAWB },
            { display: 'Received', name: 'DateRec', width: 55, sortable: true, align: 'left', process: InvenHeaderRowClickByAWB },
            { display: h, name: 'CSREC', width: 35, sortable: false, align: 'right', process: InvenHeaderRowClickByAWB },
            { display: 'FBE', name: 'FBE', width: 35, sortable: false, align: 'right', process: InvenHeaderRowClickByAWB },
            { display: 'Flag', name: 'Flag', width: 35, sortable: false, hide: true, align: 'right' },
            //{ display: 'UOM', name: 'UOM', width: 50, sortable: true, align: 'right', hide: true, process: InvenHeaderRowClickByAWB },
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
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
        qtype: "DateRec",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        height: $(window).height() - 280,
        width: 300,
        striped: true,
        onSuccess: function () {

            //For to show the error
            if ($("#fgrdInventoryHeader tr#row-2").length > 0) {
                $("#fgrdInventoryHeader tr#row-2").hide();
                $.MessageBox($("#fgrdInventoryHeader tr#row-2")[0].innerText);
                return false;
            }


            $("#DivInventoryHeader #ExportCSV").show();
            //$("#DivInventoryHeader .pcontrol input").css("width", "40px")
            //$("#DivInventoryHeader .btnseparator:eq(0)").hide();
            //$("#DivInventoryHeader .pSearch").hide();
            //$("#DivInventoryHeader .sDiv2").css("width", "290px");
            //$("#DivInventoryHeader .pDiv2").css("width", "300px");
            //$('#fgrdInventoryHeader #row0_0 td:nth-child(1) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            //$('#fgrdInventoryHeader #row0_0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '12px' });
            //$('#fgrdInventoryHeader #row0_0 td:nth-child(3) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            //$('#fgrdInventoryHeader #row0_0 td:nth-child(4) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            //$('#fgrdInventoryHeader #row0_0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '12px' });
            //$('#fgrdInventoryDetailbyAWB #row0_0').removeClass("erow")
            $('#fgrdInventoryHeader #row0_0').addClass("TotalRows");
            //$('.TotalRows>td>div').addClass("test");


            //var ReceivedPiecesOnly = "0";
            //try {
            //    if ($("#DivCoolerDisplay").find('button.is-checked')[0].value == "everything") {
            //        ReceivedPiecesOnly = "1";
            //    }
            //}
            //catch (er) {
            //    ReceivedPiecesOnly = "0";
            //}


            if ($("#DivCoolerDisplay").find('button.is-checked')[0].value != "arrival" || '<%=ConfigurationManager.AppSettings("CompanyName")%>'.toLowerCase().indexOf("EspritMiami") < 0) {
                if ($("#divInventoryDetailByFarm").css('display') == "none") {
                    if ($("#divInventoryDetailByAWB").css('display') == "none" && $("#DivInventoryBar").find('button.is-checked')[0].value == "inven") {
                        $("#divInventoryDetailByFarm div.flexigrid").css("width", $(window).width() - 310);
                        $("#divInventoryDetailByFarm div.flexigrid .bDiv").css("height", $(window).height() - 250);
                        $("#divInventoryDetailByFarm").show();

                        if (IsInventoryDetailsByFARMGridInitialize == false) {

                            InitializeInventoryDetailByFARMGrid();
                            IsInventoryDetailsByFARMGridInitialize = true;
                        }
                        else {
                            // $("#divInventoryFilters").hide();
                            $("#fgrdInventoryDetailbyFARM").empty();
                            $("#fgrdInventoryDetailbyFARM").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
                        }
                    }
                    else {
                        //$("#divInventoryDetailByFarm div.flexigrid").css("width", "876px");
                        $("#divInventoryDetailByFarm div.flexigrid").css("width", $(window).width() - 500);
                        $("#divInventoryDetailByFarm div.flexigrid .bDiv").css("height", $(window).height() - 227);
                    }
                }
            }

            if ($("#DivInventoryAWB").html() != "0" && $("#InventoryHeaderID").html() != "0" && $("#InventoryHeaderID").html() != "" && $("#fgrdInventoryHeader #row" + $("#DivInventoryAWB").html() + "_" + $("#InventoryHeaderID").html()).css('display') == "table-row") {
                var id = $("#InventoryHeaderID").html();
                $("#fgrdInventoryHeader [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdInventoryHeader td.unsorted").addClass("sorted");
                $("#fgrdInventoryHeader td.sorted").removeClass("unsorted");
                $("#fgrdInventoryHeader #row" + $("#DivInventoryAWB").html() + "_" + id).addClass("trSelectedHeader");
                $("#fgrdInventoryHeader #row" + $("#DivInventoryAWB").html() + "_" + id).removeClass("trSelected");
                $("#fgrdInventoryHeader #row" + $("#DivInventoryAWB").html() + "_" + id + " td.sorted").addClass("unsorted");
                $("#fgrdInventoryHeader #row" + $("#DivInventoryAWB").html() + "_" + id + " td.unsorted").removeClass("sorted");

                if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {
                    var InventoryDetailsByAWB = "Lot=" + $("#DivInventoryAWB").html() + " and DateRec =ctod('" + $("#fgrdInventoryHeader #row" + $("#DivInventoryAWB").html() + "_" + id + " td:nth-child(2) div").html() + "') "
                }
                else {
                    var InventoryDetailsByAWB = "Lot=" + $("#DivInventoryAWB").html() + " and DateRec ='" + $("#fgrdInventoryHeader #row" + $("#DivInventoryAWB").html() + "_" + id + " td:nth-child(2) div").html() + "' "
                }

                DefInventoryDetailsByAWB = InventoryDetailsByAWB;
                if (IsInventoryDetailsByAWBGridInitialize == false) {
                    InitializeInventoryDetailByAWBGrid();
                    IsInventoryDetailsByAWBGridInitialize = true;
                }
                else {
                    $("#fgrdInventoryDetailbyAWB").empty();
                    $("#fgrdInventoryDetailbyAWB").flexOptions({ params: [{ name: 'Filter', value: DefInventoryDetailsByAWB }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
                }


            }


        },
        params: [
            { name: 'Filter', value: FilterQuery },
            //{ name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value },
            { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value },
            { name: 'ExportCSV', value: '' },
            { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly },
            { name: 'AWBFlag', value: AWBFlag }
        ],
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS!!! Please try after some time..");
            }
        }
    });

    $("#DivInventoryHeader .pcontrol input").css("width", "40px")
    $("#DivInventoryHeader .btnseparator:eq(0)").hide();
    $("#DivInventoryHeader .pSearch").hide();
    $("#DivInventoryHeader .sDiv2").css("width", "290px");
    $("#DivInventoryHeader .pDiv2").css("width", "300px").css("margin-top", "3px");
    //$("#DivInventoryHeader .pDiv2 .pPageStat").css('top', '9px');
    //$("#DivInventoryHeader .pDiv2 .pReload").css('margin-top', '5px');
    //$("#DivInventoryHeader .pDiv2 .btnseparator:nth-child(12)").css('margin-top', '6px')
    //$("#DivManualPOHeader .sDiv").css('float', 'left').css('width', '470px');
    //$('#DivManualPOHeader .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivInventoryHeader .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    $("#DivInventoryHeader .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //$("#DivInventoryHeader .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    $("#DivInventoryHeader .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
}


$("#chkOnHand").die("click").live("click", function () {

    ReceivedPiecesOnly = "0";
    AWBFlag = "";
    $("#divInventoryDetailByAWB").hide();
    $("#divInventoryFilters").hide();
    $("#divInventoryDetailByFarm").hide();
    var sourceCtl = $(this);
    var img = sourceCtl.attr("src").toLowerCase();
    var Selected = "0";
    if (img.indexOf("off") > 0) {
        Selected = "1";
    }

    if ($("#chkInvenAWB").attr("src").toLowerCase().indexOf("off") > 0) {
        AWBFlag = "";
    }
    else {
        AWBFlag = "1";
    }

    //0-off-OnHand && 1-on-Received
    $(".ui-tooltip").hide();
    if (Selected == "1") {
        sourceCtl.prop("src", "images/check-on.png");
        sourceCtl.attr("title", "Change to pieces on hand");
        //$("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: '1' }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
        ReceivedPiecesOnly = "1";
    }
    else {
        sourceCtl.attr("title", "Change to pieces received");
        sourceCtl.prop("src", "images/check-off.png");
        //$("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: '0' }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
    }

    $("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
});

//chkInvenAWB
$("#chkInvenAWB").die("click").live("click", function () {

    ReceivedPiecesOnly = "0";
    AWBFlag = "";

    // $("#divInventoryDetailByAWB").hide();
    // $("#divInventoryDetailByFarm").hide();
    var sourceCtl = $(this);
    var img = sourceCtl.attr("src").toLowerCase();
    var Selected = "0";
    if (img.indexOf("off") > 0) {
        Selected = "1";
    }

    //0-off-OnHand && 1-on-Received
    $(".ui-tooltip").hide();
    if (Selected == "1") {
        AWBFlag = "1";
        sourceCtl.prop("src", "images/check-on.png");
        sourceCtl.attr("title", "Show All AWB with flag A");

        $("#fgrdInventoryHeader").parent('.bDiv').siblings('.nDiv').find('#chkOnHand').remove()
        $("#fgrdInventoryHeader").parent(".bDiv").siblings(".nDiv").html('<img style="Cursor:pointer;" title="Change to pieces on hand" id="chkOnHand" src="images/check-on.png"/>');

        $("#fgrdInventoryHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(3)").find("div").find('img').remove();
        $("#fgrdInventoryHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(3)").find("div").html('<img style="Cursor:pointer;" title="Change to pieces on hand" id="chkOnHand" src="images/check-on.png"/>');
        //$("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: '0' }, { name: 'AWBFlag', value: AWBFlag1 }], query: "", newp: 1 }).flexReload();
    }
    else {
        sourceCtl.attr("title", "Show All AWB");
        sourceCtl.prop("src", "images/check-off.png");
        //$("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: '0' }, { name: 'AWBFlag', value: '' }], query: "", newp: 1 }).flexReload();
    }

    if ($("#chkOnHand").attr("src").toLowerCase().indexOf("off") > 0) {
        ReceivedPiecesOnly = "0";
    }
    else {
        ReceivedPiecesOnly = "1";
    }
    $("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();

});

//

function InvenHeaderRowClickByAWB(celDiv, id) {

    $(celDiv).click(function () {
        $("#divInventoryFilters").hide();

        if (id != "0_0") {
            //var ReceivedPiecesOnly = "0";
            //if ($("#DivInventoryBar").find('button.is-checked')[0].value == "inven") {                    
            //    if ($("#DivCoolerDisplay").find('button.is-checked')[0].value == "everything") {
            //        ReceivedPiecesOnly = "1";
            //    }
            //}
            //if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {

            var Status = $("#fgrdInventoryHeader #row" + id).find("td div").eq(5).text();

            if (Status == "A") {
                $("#btnCoolerRelease").css("display", "block");
            }
            else {
                $("#btnCoolerRelease").css("display", "none");
            }
            var InventoryAndOrderReadFromSQL = ("<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>").toString()
            if (InventoryAndOrderReadFromSQL == "0") {
                var InventoryDetailsByAWB = "Lot=" + id.split('_')[0].toString() + " and DateRec =ctod('" + $("#fgrdInventoryHeader #row" + id + " td:nth-child(2) div").html() + "')"
            }
            else {
                var InventoryDetailsByAWB = "Lot=" + id.split('_')[0].toString() + " and DateRec ='" + $("#fgrdInventoryHeader #row" + id + " td:nth-child(2) div").html() + "'"
            }


            if (FilterQuery == "")
                DefInventoryDetailsByAWB = InventoryDetailsByAWB;
            else
                DefInventoryDetailsByAWB = FilterQuery + " AND " + InventoryDetailsByAWB;

            DefInventoryDetailsByFARM = DefInventoryDetailsByAWB;
            if (IsInventoryDetailsByAWBGridInitialize == false) {
                InitializeInventoryDetailByAWBGrid();
                IsInventoryDetailsByAWBGridInitialize = true;
                //$("#divInventoryDetailByFarm").hide();                    
            }
            else {
                $("#fgrdInventoryDetailbyAWB").empty();
                $("#fgrdInventoryDetailbyAWB").flexOptions({ params: [{ name: 'Filter', value: DefInventoryDetailsByAWB }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
                //var FilterString = "Lot=0 and Farm='Empty'";
                // $("#fgrdInventoryDetailbyFARM").flexOptions({ params: [{ name: 'Filter', value: FilterString }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }], query: "", newp: 1 }).flexReload();
                //$("#divInventoryDetailByFarm").hide();
            }
            InitializeInventoryDetailByFARMGrid()
            $("#divInventoryDetailByFarm").show();
            $("#fgrdInventoryDetailbyFARM").flexOptions({ params: [{ name: 'Filter', value: DefInventoryDetailsByFARM }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
            // $("#fgrdInventoryDetailbyAWB").flexOptions({ params: [{ name: 'Filter', value: InventoryDetailsByAWB }, { name: 'IsEdit', value: false }] }).flexReload();
            $("#fgrdInventoryHeader [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdInventoryHeader td.unsorted").addClass("sorted");
            $("#fgrdInventoryHeader td.sorted").removeClass("unsorted");
            $("#fgrdInventoryHeader #row" + id).addClass("trSelectedHeader");
            $("#fgrdInventoryHeader #row" + id).removeClass("trSelected");
            $("#fgrdInventoryHeader #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdInventoryHeader #row" + id + " td.unsorted").removeClass("sorted");
            $("#DivInventoryAWB").html(id.split('_')[0].toString());
            $("#InventoryHeaderID").html(id.split('_')[1].toString());
            $("#lblchoosenInventoryAWB").html("");
            $("#lblchoosenInventoryAWB").html(formatInventoryMAWBNumber(id.split('_')[0].toString()));
            $("#lblchoosenInventoryFarm").html("-");
            $("#divInventoryDetailByAWB").show();
            //$("#divInventoryFilters").show();
            $("#divInventoryDetailByFarm").hide();
            $(".inventoryawb").show();
            $(".inventoryfarm").hide();
            $("#tdTransferReprint").show();
            $("#InventorySecondHeaderID").html("");
        }
    });
}

//VEN::07-OCT-2015::To Load inventory details by awb
function InitializeInventoryDetailByAWBGrid() {

    $("#fgrdInventoryDetailbyAWB").flexigrid({
        url: 'BloomService.asmx/GetInventoryDetailsList',
        dataType: 'xml',
        colModel: [
            { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left', process: InvenDetailRowClickByFARM },
            { display: 'DateRec', name: 'DateRec', width: 65, sortable: true, align: 'left', hide: true, process: InvenDetailRowClickByFARM },
            { display: 'Pieces', name: 'CSREC', width: 30, sortable: true, align: 'right', process: InvenDetailRowClickByFARM },
            { display: 'FBE', name: 'FBE', width: 30, sortable: false, align: 'right', process: InvenDetailRowClickByFARM },
            //{ display: 'UOM', name: 'UOM', width: 50, sortable: true, align: 'right', hide: true, process: InvenDetailRowClickByFARM },
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
        ],
        searchitems: [
            { display: 'Farm', name: 'Farm' },
        ],
        showTableToggleBtn: true,
        sortname: "Farm",
        sortorder: "asc",
        usepager: true,
        title: false,
        useRp: false,
        //rp: parseInt(($(window).height() - 290) / 25),
        qtype: "Farm",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        params: [
            { name: 'Filter', value: DefInventoryDetailsByAWB },
            { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value },
            { name: 'ExportCSV', value: '' },
            { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly },
            { name: 'AWBFlag', value: AWBFlag }
        ],
        //height: $(window).height() - 305,
        height: $(window).height() - 335,
        width: 180,
        striped: true,
        onSuccess: function () {


            //For to show the error
            if ($("#fgrdInventoryDetailbyAWB tr#row-2").length > 0) {
                $("#fgrdInventoryDetailbyAWB tr#row-2").hide();
                $.MessageBox($("#fgrdInventoryDetailbyAWB tr#row-2")[0].innerText);
                return false;
            }

            $("#divInventoryDetailByAWB #ExportCSV").show();
            //$("#divInventoryFilters").show();

            //$("#divInventoryDetailByAWB .pcontrol input").css("width", "40px")
            //$("#divInventoryDetailByAWB .btnseparator:eq(0)").hide();
            //$("#divInventoryDetailByAWB .pSearch").hide();
            //$("#divInventoryDetailByAWB .sDiv2").css("width", "290px");
            //$("#divInventoryDetailByAWB .pDiv2").css("width", "300px");
            //$("#divInventoryDetailByAWB .sDiv2 input[type=text]").css("width", "207px");

            //$('#fgrdInventoryDetailbyAWB #row0_0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '13px' });
            //$('#fgrdInventoryDetailbyAWB #row0_0 td:nth-child(3) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '13px' });
            //$('#fgrdInventoryDetailbyAWB #row0_0 td:nth-child(4) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '13px' });
            //$('#fgrdInventoryDetailbyAWB #row0_0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '13px' });
            $('#fgrdInventoryDetailbyAWB #row0_0').addClass("TotalRows")
            //$('.TotalRows>td>div').addClass("test")
            FilterQuery = "";
            if ($("#DivInventoryFARM").html() != "0" && $("#InventorySecondHeaderID").html() != "0" && $("#InventorySecondHeaderID").html() != "" && $("#fgrdInventoryDetailbyAWB #row" + $("#DivInventoryFARM").html() + "_" + $("#InventorySecondHeaderID").html()).css('display') == "table-row") {
                var id = $("#InventorySecondHeaderID").html();
                var InventoryDetailsByFARM = " and FARM='" + $("#DivInventoryFARM").html() + "'";
                DefInventoryDetailsByFARM = "";
                if (FilterQuery == "")
                    DefInventoryDetailsByFARM = DefInventoryDetailsByAWB + InventoryDetailsByFARM;
                else
                    DefInventoryDetailsByFARM = FilterQuery + " AND " + DefInventoryDetailsByFARM;

                $("#fgrdInventoryDetailbyAWB [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdInventoryDetailbyAWB td.unsorted").addClass("sorted");
                $("#fgrdInventoryDetailbyAWB td.sorted").removeClass("unsorted");
                $("#fgrdInventoryDetailbyAWB #row" + $("#DivInventoryFARM").html() + "_" + id).addClass("trSelectedHeader");
                $("#fgrdInventoryDetailbyAWB #row" + $("#DivInventoryFARM").html() + "_" + id).removeClass("trSelected");
                $("#fgrdInventoryDetailbyAWB #row" + $("#DivInventoryFARM").html() + "_" + id + " td.sorted").addClass("unsorted");
                $("#fgrdInventoryDetailbyAWB #row" + $("#DivInventoryFARM").html() + "_" + id + " td.unsorted").removeClass("sorted");

                if (IsInventoryDetailsByFARMGridInitialize == false) {
                    InitializeInventoryDetailByFARMGrid();
                    IsInventoryDetailsByFARMGridInitialize = true;
                }
                else {
                    $("#fgrdInventoryDetailbyFARM").empty();
                    $("#fgrdInventoryDetailbyFARM").flexOptions({ params: [{ name: 'Filter', value: DefInventoryDetailsByFARM }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
                }
            }
            $("#divInventoryDetailByFarm").show();
            //$("#divInventoryFilters").show();
        }
    });

    $("#divInventoryDetailByAWB .pcontrol input").css("width", "40px")
    $("#divInventoryDetailByAWB .btnseparator:eq(0)").hide();
    $("#divInventoryDetailByAWB .pSearch").hide();
    $("#divInventoryDetailByAWB .sDiv2").css("width", "173px");
    $("#divInventoryDetailByAWB .sDiv2 input.qsbox").css('width', '94px');
    $("#divInventoryDetailByAWB .pDiv2").css('margin-left', '-39px');
    //$("#DivManualPOHeader .sDiv").css('float', 'left').css('width', '470px');
    //$('#DivManualPOHeader .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#divInventoryDetailByAWB .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    $("#divInventoryDetailByAWB .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //$("#divInventoryDetailByAWB .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    $("#divInventoryDetailByAWB .pDiv").find(".pDiv2").find(".pReload").show();

}

function InvenDetailRowClickByFARM(celDiv, id) {

    $(celDiv).click(function () {

        if (id != "0_0") {
            //var ReceivedPiecesOnly = "0";               
            //if ($("#DivInventoryBar").find('button.is-checked')[0].value == "inven") {                   
            //    if ($("#DivCoolerDisplay").find('button.is-checked')[0].value == "everything") {
            //        ReceivedPiecesOnly = "1";
            //    }
            //}
            var InventoryDetailsByFARM = " and FARM='" + id.split('_')[0].toString() + "'";
            DefInventoryDetailsByFARM = DefInventoryDetailsByAWB + InventoryDetailsByFARM;
            if (IsInventoryDetailsByFARMGridInitialize == false) {

                InitializeInventoryDetailByFARMGrid();
                IsInventoryDetailsByFARMGridInitialize = true;
            }
            else {
                $("#fgrdInventoryDetailbyFARM").empty();
                $("#fgrdInventoryDetailbyFARM").flexOptions({ params: [{ name: 'Filter', value: DefInventoryDetailsByFARM }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
            }

            // $("#fgrdInventoryDetailbyAWB").flexOptions({ params: [{ name: 'Filter', value: InventoryDetailsByAWB }, { name: 'IsEdit', value: false }] }).flexReload();
            $("#fgrdInventoryDetailbyAWB [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdInventoryDetailbyAWB td.unsorted").addClass("sorted");
            $("#fgrdInventoryDetailbyAWB td.sorted").removeClass("unsorted");
            $("#fgrdInventoryDetailbyAWB #row" + id).addClass("trSelectedHeader");
            $("#fgrdInventoryDetailbyAWB #row" + id).removeClass("trSelected");
            $("#fgrdInventoryDetailbyAWB #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdInventoryDetailbyAWB #row" + id + " td.unsorted").removeClass("sorted");
            $("#DivInventoryFARM").html(id.split('_')[0].toString());
            $("#InventorySecondHeaderID").html(id.split('_')[1].toString());
            $("#lblchoosenInventoryFarm").html("");
            $("#lblchoosenInventoryFarm").html(id.split('_')[0].toString());
            $("#divInventoryDetailByFarm").show();
            //$("#divInventoryFilters").show();
            $(".inventoryfarm").show();
        }
    });
}



//VEN::08-OCT-2015::To Load inventory details by awb and farm
//Muthu Nivetha M :: 06Mar2020 :: Modified :: Implemented to deactivate the delete icon and  hide the cost column for warehouse user
function InitializeInventoryDetailByFARMGrid() {
    var IfWHuser = false;
    if ($("#ctl00_DivLoggedInUserType").html().toLowerCase() == "warehouse") {
        IfWHuser = true;
    }
    $("#fgrdInventoryDetailbyFARM").flexigrid({
        url: 'BloomService.asmx/GetInventoryDetailsListByFarm',
        dataType: 'xml',
        colModel: [
            { display: '', name: 'Delete', width: 15, sortable: false, align: 'left' },
            { display: '', name: 'Edit', width: 15, sortable: false, align: 'left' },
            { display: 'Wh', name: 'Wh', width: 20, sortable: true, align: 'left' },
            { display: 'AWB', name: 'AWB', width: 30, sortable: true, align: 'left' },
            { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left' },
            { display: 'Product', name: 'ProductCode', width: 60, sortable: true, align: 'left' },
            { display: 'Description', name: 'ProductName', width: 180, sortable: true, align: 'left' },
            { display: 'Pieces', name: 'CSREC', width: 40, sortable: true, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 20, sortable: true, align: 'left' },
            { display: 'U/B', name: 'UnitsBunch', width: 15, sortable: true, align: 'right', title: 'Units Per Bunch' },
            { display: 'Pack', name: 'Units', width: 30, sortable: true, align: 'right', title: 'Units Per Box' },
            { display: 'Total Units', name: 'TotalUnits', width: 60, sortable: false, align: 'right' },
            { display: 'FBE', name: 'FBE', width: 60, sortable: false, align: 'right', title: 'Full Box Equivalence' },
            { display: 'Cost', name: 'Cost', width: 37, sortable: false, align: 'right', hide: IfWHuser },
            { display: '$Total', name: '', width: 50, sortable: false, align: 'right', hide: true },
            { display: 'Type', name: 'InvenType', width: 10, sortable: true, align: 'right' ,hide: true},
            { display: 'Flag', name: 'Type', width: 13, sortable: true, align: 'right' },
            { display: 'Cust#', name: 'cust', width: 30, sortable: true, align: 'right' },
            { display: 'Comments', name: 'comments', width: 60, sortable: true, align: 'left' },
            { display: 'Box#', name: 'boxnum', width: 30, sortable: true, align: 'right', process: ReloadTransactionGrid },
            { display: 'PO#', name: 'po', width: 80, sortable: true, align: 'left', title: 'Purchase Order#' },
            { display: 'Invoice#', name: 'invoice', width: 45, sortable: true, align: 'right', title: 'Vendor Invoice' },
            { display: 'Days', name: 'Days', width: 18, sortable: true, align: 'right' },
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
            { display: '', name: '', width: 13, sortable: true, align: 'left' },
            { display: 'Category', name: 'Category', width: 20, sortable: true, align: 'left', hide: false },
            { display: 'Color', name: 'Color', width: 15, sortable: true, align: 'left', hide: true },
            { display: 'Variety', name: 'Variety', width: 15, sortable: true, align: 'left', hide: true },
            { display: 'Grade', name: 'Grade', width: 15, sortable: true, align: 'left', hide: true },
            { display: 'Wh', name: 'Wh', width: 15, sortable: true, align: 'left',hide:true },
            { display: 'AWB', name: 'AWB', hide: true, width: 60, sortable: true, align: 'left', hide: true  },
            { display: '', name: '', width: 13, sortable: false, align: 'left' },
        ],
        searchitems: [
            { display: 'AWB', name: 'AWB' },
            { display: 'Farm', name: 'Farm' },
            { display: 'Product', name: 'Product' },
            { display: 'Description', name: 'Description' },
            { display: 'Pieces', name: 'CSREC' },
            { display: 'UOM', name: 'UOM' },
            { display: 'Type', name: 'InvenType' },
            { display: 'Box#', name: 'BoxNum' },
            { display: 'Cust#', name: 'Cust' },
            { display: 'Invoice#', name: 'Invoice' },
            { display: 'PO#', name: 'PO' },
        ],
        showTableToggleBtn: true,
        sortname: "Flower",
        sortorder: "asc",
        usepager: true,
        title: false,
        useRp: true,
        //rp: parseInt(($(window).height() - 290) / 25),
        qtype: "Flower",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        params: [
            { name: 'Filter', value: DefInventoryDetailsByFARM },
            { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value },
            { name: 'ExportCSV', value: '' },
            { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly },
            { name: 'AWBFlag', value: AWBFlag }
        ],
        height: $(window).height() - 250,
        width: "1059",
        striped: true,
        onSuccess: function () {

            var DisableIfWHuser = false;
            if ($("#ctl00_DivLoggedInUserType").html().toLowerCase() == "warehouse") {
                DisableIfWHuser = true;
            }

            $("[id^=deleteInventoryPOdetail_]").prop("disabled", DisableIfWHuser);

            //MANI::10/July/2018::when clicking on the inventory detail row, the selected row will be highlighted
            $("#fgrdInventoryDetailbyFARM tr").click(function () {



                    var id = $(this).attr('id').replace('row', '');
                    if (id != "0") {//id 0 is the total row on the grid
                        $("#DivSelectedrowInInventoryDetail").html(id);
                        $("#fgrdInventoryDetailbyFARM [id^=row]").removeClass("trSelectedHeader");
                        $("#fgrdInventoryDetailbyFARM #row" + id).addClass("trSelectedHeader");
                        $("#fgrdInventoryDetailbyFARM #row" + id).removeClass("trSelected");
                    }




            })

            var selectedDetailID = $("#DivSelectedrowInInventoryDetail").html();
            if ($("#DivSelectedrowInInventoryDetail").html() != "" && $("#DivSelectedrowInInventoryDetail").html() != "0") {
                $("#fgrdInventoryDetailbyFARM [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdInventoryDetailbyFARM #row" + selectedDetailID).addClass("trSelectedHeader");
                $("#fgrdInventoryDetailbyFARM #row" + selectedDetailID).removeClass("trSelected");
            }
            else {
                $("#fgrdInventoryDetailbyFARM tr:first").removeClass("trSelectedHeader");
                $("#fgrdInventoryDetailbyFARM tr:first").addClass("trSelectedHeader");
            }

            $("#divInventoryDetailByFarm #ExportCSV").show();
            $("#divInventoryFilters").show();


            if ($("#DivInventoryBar").find('button.is-checked')[0].value == "invhist") {
                $("#divInventoryFilters").hide();
            }

            //For to show the error
            if ($("#fgrdInventoryDetailbyFARM tr#row-2").length > 0) {
                $("#fgrdInventoryDetailbyFARM tr#row-2").hide();
                $.MessageBox($("#fgrdInventoryDetailbyFARM tr#row-2")[0].innerText);
                return false;
            }

            if ($("#divInventoryDetailByAWB").css('display') == "none") {
                $("#divInventoryDetailByFarm div.flexigrid").css("width", $(window).width() - 310);
                $("#divInventoryDetailByFarm").show();
                //$("#divInventoryFilters").show();
                $("#divInventoryDetailByFarm div.flexigrid .bdiv").css("height", $(window).height() - 250);

                if ($('#lstVarietyFilterForInventoryList option').length <= 0) {
                    $('#lstVarietyFilterForInventoryList').empty();
                    $('#lstVarietyFilterForInventoryList').append('<option value="">Select Variety</option>');
                    var VarietyList = []
                    $("#fgrdInventoryDetailbyFARM tr").each(function () {
                        var currentrowid =  this.id.replace("row","") /* $(this).attr("id");.replace("row", "");*/
                        var Variety = $("#invenVariety_" + currentrowid).html() == null ? "" : $("#invenVariety_" + currentrowid).html();
                        if (VarietyList.indexOf(Variety) == -1 && Variety.trim() != "") {
                            VarietyList.push(Variety)
                        }
                    });

                    VarietyList.sort((a, b) =>a.localeCompare(b));
                    $.each(VarietyList, function (i, item) {
                        $('#lstVarietyFilterForInventoryList').append('<option value="' + item + '">' + item + '</option>');
                    })
                }

                if ($('#lstColorFilterForInventoryList option').length <= 0) {
                    $('#lstColorFilterForInventoryList').empty();
                    $('#lstColorFilterForInventoryList').append('<option value="">Select Color</option>');
                    var ColorList = []
                    $("#fgrdInventoryDetailbyFARM tr").each(function () {
                        var currentrowid = this.id.replace("row", ""); /* this.id.replace("row","");*/
                        var Color = $("#invenColor_" + currentrowid).html() == null ? "" : $("#invenColor_" + currentrowid).html();
                        if (ColorList.indexOf(Color) == -1 && Color.trim() != "") {
                            ColorList.push(Color)
                        }
                    });
                    ColorList.sort((a, b) =>a.localeCompare(b));
                    $.each(ColorList, function (i, item) {
                        $('#lstColorFilterForInventoryList').append('<option value="' + item + '">' + item + '</option>');
                    })
                }

                if ($('#lstGradeFilterForInventoryList option').length <= 0) {
                    $('#lstGradeFilterForInventoryList').empty();
                    $('#lstGradeFilterForInventoryList').append('<option value="">Select Grade</option>');
                    var GradeList = []
                    $("#fgrdInventoryDetailbyFARM tr").each(function () {
                        var currentrowid = this.id.replace("row","");
                        var Grade = $("#invenGrade_" + currentrowid).html() == null ? "" : $("#invenGrade_" + currentrowid).html();
                        if (GradeList.indexOf(Grade) == -1 && Grade.trim() != "") {
                            GradeList.push(Grade)
                        }
                    });
                    GradeList.sort((a, b) =>a.localeCompare(b));
                    $.each(GradeList, function (i, item) {
                        $('#lstGradeFilterForInventoryList').append('<option value="' + item + '">' + item + '</option>');
                    })
                }

                if ($('#lstCategoryFilterForInventoryList option').length <= 0) {
                    $('#lstCategoryFilterForInventoryList').empty();
                    $('#lstCategoryFilterForInventoryList').append('<option value="">Select Category</option>');
                    var CategoryList = []
                    $("#fgrdInventoryDetailbyFARM tr").each(function () {
                        var currentrowid = this.id.replace("row","");
                        var Category = $("#invenCAT_" + currentrowid).html() == null ? "" : $("#invenCAT_" + currentrowid).html();
                        if (CategoryList.indexOf(Category) == -1 && Category.trim() != "") {
                            CategoryList.push(Category)
                        }
                    });
                    CategoryList.sort((a, b) =>a.localeCompare(b));
                    $.each(CategoryList, function (i, item) {
                        $('#lstCategoryFilterForInventoryList').append('<option value="' + item + '">' + item + '</option>');
                    })
                }
                if ($('#lstWarehouseFilterForInventoryList option').length <= 0) {

                    $('#lstWarehouseFilterForInventoryList').empty();
                    $('#lstWarehouseFilterForInventoryList').append('<option value="0">Select warehouse</option>');
                    var WHList = []
                    $("#fgrdInventoryDetailbyFARM tr").each(function () {
                        var currentrowid = this.id.replace("row","");
                        var WH = $("#invenWH_" + currentrowid).html() == null ? "" : $("#invenWH_" + currentrowid).html();
                        if (WHList.indexOf(WH) == -1) {
                            WHList.push(WH)
                        }
                    });
                    WHList.sort((a, b) =>a.localeCompare(b));
                    $.each(WHList, function (i, item) {
                        $('#lstWarehouseFilterForInventoryList').append('<option value="' + item + '">' + item + '</option>');
                    })
                }

            }
            else {
                //$("#divInventoryFilters").hide();
                //$("#divInventoryDetailByFarm div.flexigrid").css("width", "876px");
                $("#divInventoryDetailByFarm div.flexigrid").css("width", $(window).width() - 500);
                $("#divInventoryDetailByFarm div.flexigrid .bdiv").css("height", $(window).height() - 227);
            }

            //$('#fgrdInventoryDetailbyFARM #row0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryDetailbyFARM #row0 td:nth-child(6) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryDetailbyFARM #row0 td:nth-child(10) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryDetailbyFARM #row0 td:nth-child(11) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryDetailbyFARM #row0 td:nth-child(13) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            $('#fgrdInventoryDetailbyFARM #row0').addClass("TotalRows")
            //$('.TotalRows>td>div').addClass("test")

            $('#divInventoryDetailByFarm #row0 td:nth-child(24) div').text("");
            $('#divInventoryDetailByFarm #row0 td:nth-child(25) div').text("");
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS!!! Please try after some time..");
            }
        }
    });

    $("#divInventoryDetailByFarm .sDiv").css('float', 'left').css('width', '545px');
    $('#divInventoryDetailByFarm .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#divInventoryDetailByFarm .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    $("#divInventoryDetailByFarm .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //$("#divInventoryDetailByFarm .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    $("#divInventoryDetailByFarm .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

}

//STA::07-OCT-2015::To Generate the Inventory label by AWB, Farm and Flower
function PrintInventoryLabelByFlower(AWB, Farm, Flower, DateRec, Boxnumber, TableName, ReceivedPiecesOnly) {
    var w = window.open('GeneratingPDF.html');
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintInventoryLabel',
        data: "{'AWB':'" + AWB + "','Farm':'" + Farm + "','Flower':'" + Flower + "','DateRec':'" + DateRec
            + "','BoxNum':'" + Boxnumber + "','TableName':'" + TableName + "','ReceivedPiecesOnly':'" + ReceivedPiecesOnly + "','AWBFlag':'" + AWBFlag + "'}",
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

//VEN::13-10-2015::TO ADD DATE FILTER HEADER CLICK EVENTS
$('#divHeaderdate').click(function (event) {
    $(".rowcss").hide();
    $("#trdatetitle").show();
    if ($('#divInventorydateFilter').css('display') == 'none') {

        $(".filterdiv").hide();
        $("#divInventorydateFilter").slideToggle();
    }
    else {
        $("#divInventorydateFilter").slideToggle();
    }

});

//VEN::13-10-2015::TO ADD FARM FILTER HEADER CLICK EVENTS
$('#divInventoryHeaderAWB').click(function (event) {
    $(".rowcss").show();
    if ($('#divFarmFilter').css('display') == 'none') {
        $(".filterdiv").hide();
        $("#divFarmFilter").slideToggle();
    }
    else {
        $("#divFarmFilter").slideToggle();
    }
    $("#txtNameFilter").val("");
    $("#txtNameFilter").focus();

});

$("[id^=btndateok]").live("click", function () {

    if ($("#txtInventoryFromRecDate").val() != "" && $("#txtInventoryToRecDate").val() == "") {
        $("#msg").html("Please choose ToDate!");
        $("#msgbox-select").dialog("open");

        return false;
    }
    else if ($("#txtInventoryFromRecDate").val() == "" && $("#txtInventoryToRecDate").val() != "") {
        $("#msg").html("Please choose From Date!");
        $("#msgbox-select").dialog("open");
        return false;
    }
    else if ($("#txtInventoryFromRecDate").val() == "" && $("#txtInventoryToRecDate").val() == "") {
        $("#msg").html("Please choose From Date and ToDate!");
        $("#msgbox-select").dialog("open");
        return false;
    }

    $.ajax({ //save date to the session 
        url: 'BloomService.asmx/SaveDateSession',
        type: 'POST',
        data: "{'FromDate':'" + $("#txtInventoryFromRecDate").val() + "','ToDate':'" + $("#txtInventoryToRecDate").val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            //var fdate = $("#txtInventoryFromRecDate").val() + " to " + $("#txtInventoryToRecDate").val();
            //$("#lblInventorychosendate").html(fdate);
            //$("#lblInventorychosendate").show();
            //$("#tr2").addClass('FilterDivStyle');
            //$("#lblInventorychosendate1").html($("#txtInventoryFromRecDate").val());
            //$("#lblInventorychosendate2").html($("#txtInventoryToRecDate").val());
            //$("#imgInventoryDate").attr("src", "images/Filter.png");
            //$("#divInventorydateFilter").slideToggle();
        }
    });

    var fdate = $("#txtInventoryFromRecDate").val() + " to " + $("#txtInventoryToRecDate").val();

    $("#lblInventorychosendate").html(fdate);

    $("#tr2").addClass('FilterDivStyle');
    $("#lblInventorychosendate1").html($("#txtInventoryFromRecDate").val());
    $("#lblInventorychosendate2").html($("#txtInventoryToRecDate").val());

    $("#divFromDate").datepicker("setDate", Date.parse($("#txtInventoryFromRecDate").val()));
    $("#divToDate").datepicker("setDate", Date.parse($("#txtInventoryToRecDate").val()));

    $("#imgInventoryDate").attr("src", "images/Filter.png");
    $("#divInventorydateFilter").slideToggle();

    if ($("#DivInventoryBar").find('button.is-checked')[0].value != "inven") {
        FramingInventoryFilter();
    }
    $(".inventoryawb").hide();
    $(".inventoryfarm").hide();
    $("#tdTransferReprint").hide();
    $("#divInventoryDetailByAWB").hide();
    $("#divInventoryFilters").hide();
    $("#divInventoryDetailByFarm").hide();
    $("#DivInventoryUserFarmDetails").hide();
    $("#DivInventoryUsersDetails").hide();
    $("#InventoryHeaderID").html("");
    $("#InventoryUserFarmDetailID").html("");

});

$("[id^=imgInventoryAWB]").live("click", function (e) {
    $("#lstInventoryAWBFilter").val("All");
    $("#lstInventoryHistoryAWBFilter").val("All");

    var bg = $(this).attr('src');
    if (bg == "images/Filter.png") {
        $("#imgInventoryAWB").attr("src", "images/EmptyFilter.png");
        $("#txtFarmFilter").val("");
        $("#lblInventoryAWBFilter").html("");
        $("#tr1").removeClass();
        // $("#btnapply").click();
        $("#divFarmFilter").hide();
        FramingInventoryFilter();
        $("#divInventoryDetailByAWB").hide();
        $("#divInventoryFilters").hide();
        $("#divInventoryDetailByFarm").hide();

        $("#lblchoosenInventoryAWB").html("-");
        $("#lblchoosenInventoryFarm").html("-");

        $(".inventoryawb").hide();
        $("#tdTransferReprint").hide();
        $(".inventoryfarm").hide();

        e.stopPropagation();

    }
});

$("[id^=imgInventoryDate]").live("click", function (e) {
    var bg = $(this).attr('src');
    if (bg == "images/Filter.png") {
        var today = Date.today().toString("MM/dd/yyyy");
        $("#txtInventoryFromRecDate").val(today);
        $("#txtInventoryToRecDate").val(today);
        var fdate = "Today: " + today;
        $("#lblInventorychosendate").html(fdate);
        $("#lblInventorychosendate1").html(today);
        $("#lblInventorychosendate2").html(today);

        $("#divFromDate").datepicker("setDate", Date.parse(today));
        $("#divToDate").datepicker("setDate", Date.parse(today));

        $("#imgInventoryDate").attr("src", "images/Filter.png");
        $("#tr2").addClass('FilterDivStyle');
        $("#divInventorydateFilter").hide();

        $.ajax({ //save date to the session 
            url: 'BloomService.asmx/SaveDateSession',
            type: 'POST',
            data: "{'FromDate':'" + today + "','ToDate':'" + today + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
            }
        });

        //FramingInventoryFilter();

        if ($("#DivInventoryBar").find('button.is-checked')[0].value != "inven") {
            FramingInventoryFilter();
        }

        //if ($("#DivInventoryBar").find('button.is-checked')[0].value != "inven") {
        //    $("#lblInventorychosendate").show();
        //    $("#imgInventoryDate").attr("src", "images/Filter.png");
        //    $("#tr2").addClass('FilterDivStyle');
        //}
        $("#divInventoryDetailByAWB").hide();
        $("#divInventoryFilters").hide();
        $("#divInventoryDetailByFarm").hide();
        $("#DivInventoryUserFarmDetails").hide();
        $("#DivInventoryUsersDetails").hide();
        $("#lblchoosenInventoryAWB").html("-");
        $("#lblchoosenInventoryFarm").html("-");
        $(".inventoryawb").hide();
        $(".inventoryfarm").hide();
        $("#InventoryHeaderID").html("");
        $("#InventoryUserFarmDetailID").html("");
        e.stopPropagation();
    }
});

$('#lstInventoryAWBFilter').change(function () {
    $("#lblInventoryAWBFilter").html($('#lstInventoryAWBFilter').val());
    $("#tr1").addClass('FilterDivStyle');
    $("#imgInventoryAWB").attr("src", "images/Filter.png");
    $("#divFarmFilter").slideToggle();
    $("#divInventoryDetailByAWB").hide();
    $("#divInventoryFilters").hide();
    $("#divInventoryDetailByFarm").hide();
    $("#lblchoosenInventoryAWB").html("-");
    $("#lblchoosenInventoryFarm").html("-");
    FramingInventoryFilter();
});

$('#lstInventoryHistoryAWBFilter').change(function () {
    $("#lblInventoryAWBFilter").html($('#lstInventoryHistoryAWBFilter').val());
    $("#tr1").addClass('FilterDivStyle');
    $("#imgInventoryAWB").attr("src", "images/Filter.png");
    $("#divFarmFilter").slideToggle();
    $("#divInventoryDetailByAWB").hide();
    $("#divInventoryFilters").hide();
    $("#divInventoryDetailByFarm").hide();
    $("#lblchoosenInventoryAWB").html("-");
    $("#lblchoosenInventoryFarm").html("-");
    FramingInventoryFilter();
});

$("#DivInevntoryAddEditInfo").dialog({
    autoOpen: false,
    resizable: false,
    title: "Add/Edit Info",
    width: 400,
    height: 300,
    modal: true,
    buttons: {
        Ok: function () {
            $("#DivInevntoryAddEditInfo").dialog("close");
        }
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
    }
});

//STA::14-OCT-2015::to show the add and edit informations
//$("[id^=imgaddeditDetails_]").die("click").live("click", function () {

//    var AddEditCtrlId = $(this)[0].id.replace("imgaddeditDetails_", "");

//    //To get the add/Edit user and datetime details
//    $.ajax({
//        url: 'BloomService.asmx/GetInventoryAddEditInfo',
//        type: 'POST',
//        data: "{'ID':'" + AddEditCtrlId + "','TableName':'" + $("#DivInventoryBar").find('button.is-checked')[0].value + "'}",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (output, status) {

//            if (output.d != null) {
//                $("#lblInvenAddedUser").html(output.d.AddUser);
//                $("#lblInvenAddedDate").html(output.d.AddDate);
//                $("#lblInvenAddedTime").html(output.d.AddTime);
//                $("#lblInvenEditedUser").html(output.d.UpdateUser);
//                $("#lblInvenEditedDate").html(output.d.UpdateDate);
//                $("#lblInvenEditedTime").html(output.d.UpdateTime);
//                var DetDialogTitle = $("#DivInventoryAWB").html() + "-" + $("#DivInventoryFARM").html() + "-" + $("#fgrdInventoryDetailbyFARM tr#row" + AddEditCtrlId + " td:eq(0)")[0].textContent;
//                $("#DivInevntoryAddEditInfo").dialog('option', 'title', DetDialogTitle);
//                $("#DivInevntoryAddEditInfo").dialog("open");
//            }
//        }
//    });
//});


function formatInventoryMAWBNumber(MAWBNumber) {

    var mawb = ""
    if (MAWBNumber.trim() != "") {
        if (MAWBNumber.length == "10") {
            mawb = MAWBNumber.substring(0, 2) + "-" + MAWBNumber.substring(2, 6) + "-" + MAWBNumber.substring(6, 10)
        }
        else if (MAWBNumber.length == "11") {
            mawb = MAWBNumber.substring(0, 3) + "-" + MAWBNumber.substring(3, 7) + "-" + MAWBNumber.substring(7, 11)
        }
        else if (MAWBNumber.length == "12") {
            mawb = MAWBNumber.substring(0, 4) + "-" + MAWBNumber.substring(4, 8) + "-" + MAWBNumber.substring(8, 12)
        }
        else {
            mawb = MAWBNumber
        }
    }
    else {
        mawb = ""
    }
    return mawb;

}

var IsPageInventoryUserSQLAlreadyGet = false;

$('#DivInventoryBar').each(function (i, buttonGroup) {

    var $buttonGroup = $(buttonGroup);
    $buttonGroup.on('click', 'button', function () {
        $("#divInventoryFilters").hide();

        //$("#msg").html("<div>Please Wait....<img src='images/ajax-loader.gif' /></div>");
        //$("#msgbox-select").dialog("open");

        $buttonGroup.find('.is-checked').removeClass('is-checked');
        $(this).addClass('is-checked');
        $("#InventoryDetailID").html("");
        $("#DivInventoryAWB").html("");
        $("#DivInventoryFARM").html("");
        $("#InventoryHeaderID").html("");
        $("#InventorySecondHeaderID").html("");
        $("#InventoryFarm").html("");
        $("#InventoryAWB").html("");
        $("#InventoryUserTableName").html("");
        $("#DivInventoryFlowerCategory").html("");
        $(".inventoryawb").hide();
        $("#tdTransferReprint").hide();
        $(".inventoryfarm").hide();
        $("#DivConsolidateBar").hide();


        $("#tblInventorySelectionDetails").show();
        $(".lookupboxdetails").show();
        $("#divInventoryFiltersDefault").hide();

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetDateSession',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (dateoutput, status) {

                var date = dateoutput.d;
                if (date == null || date == "" || date[0] === "" && date[1] === "") {
                    var fdate = "Today: " + $("#txtInventoryToRecDate").val();
                    $("#lblInventorychosendate").html(fdate);
                    $("#lblInventorychosendate1").html("");
                    $("#lblInventorychosendate2").html("");
                    $("#divFromDate").datepicker("setDate", new Date());
                    $("#divToDate").datepicker("setDate", new Date());
                    $("#imgInventoryDate").attr("src", "images/Filter.png");
                    $("#tr2").addClass('FilterDivStyle');
                }
                else {
                    var fdate = date[0] + " to " + date[1];
                    $("#txtInventoryFromRecDate").val(date[0]);
                    $("#txtInventoryToRecDate").val(date[1]);
                    $("#lblInventorychosendate").html(fdate);
                    $("#lblInventorychosendate1").html(date[0]);
                    $("#lblInventorychosendate2").html(date[1]);
                    $("#divFromDate").datepicker("setDate", Date.parse(date[0]));
                    $("#divToDate").datepicker("setDate", Date.parse(date[1]));
                    $("#imgInventoryDate").attr("src", "images/Filter.png");
                    $("#tr2").addClass('FilterDivStyle');
                }

                if ($("#DivInventoryBar").find('button.is-checked')[0].value == "users") {

                    $("#tblcurrentinventory").hide();
                    $("#tblInventoryConsolidate").hide();
                    $("#tblInventoryRacks").hide();

                    $("#tblInventoryPricing").hide();
                    $("#DivInventoryPricing").hide();
                    $("#DivInventoryUserFarmDetails").hide();
                    $("#DivInventoryUsersDetails").hide();


                    if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {

                        $("#tblInventoryUsers").show();
                        $("#tblInventoryUsersSQLPage").hide();

                        if (IsInventoryUserHeaderGridInitialize == false) {
                            InitializeInventoryUserHeaderGrid();
                            IsInventoryUserHeaderGridInitialize = true;
                        }
                        else {
                            $("#fgrdInventoryUsersHeaders").empty();
                            $("#fgrdInventoryUsersHeaders").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                        }
                    }
                    else {

                        $("#tblInventoryUsers").hide();


                        if (IsPageInventoryUserSQLAlreadyGet == false) {
                            $.ajax({
                                type: "POST",
                                url: 'BloomService.asmx/GetPage',
                                data: '{ "controlName":"pages/PageInventoryUsersSQL.ascx","controlPara":"" }',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (output, status) {
                                    $("#PageInventoryUsersSQL").html(output.d);
                                    $("#tblInventoryUsersSQLPage").show();
                                }
                            });
                            IsPageInventoryUserSQLAlreadyGet = true;
                        }
                        else {
                            $("#tblInventoryUsersSQLPage").show();

                        }

                    }

                    //$("#lblInventorychosendate").show();
                    //$("#imgInventoryDate").attr("src", "images/Filter.png");
                    //$("#tr2").addClass('FilterDivStyle');

                    $("#lblInventorychosendate").hide();
                    $("#imgInventoryDate").attr("src", "images/EmptyFilter.png");
                    $("#tr2").removeClass('FilterDivStyle');

                    FramingInventoryFilter();
                }
                else if ($("#DivInventoryBar").find('button.is-checked')[0].value == "consolidate") {
                    $(".lookupboxdetails").hide();
                    $("#tblcurrentinventory").hide();
                    $("#tblInventoryUsers").hide();
                    $("#tblInventoryUsersSQLPage").hide();
                    $("#tblInventoryRacks").hide();
                    $("#tblInventoryConsolidate").show();
                    $("#DivConsolidateBar").show();
                    $("#tblInventoryPricing").hide();
                    $("#DivInventoryPricing").hide();
                    $("#tblInventorySelectionDetails").hide();
                    $("#lblInventorychosendate").hide();
                    $("#imgInventoryDate").attr("src", "images/EmptyFilter.png");
                    $("#tr2").removeClass('FilterDivStyle');
                    FramingInventoryFilter();
                }
                else if ($("#DivInventoryBar").find('button.is-checked')[0].value == "rack") {

                    $("#tblcurrentinventory").hide();
                    $("#tblInventoryUsers").hide();
                    $("#tblInventoryUsersSQLPage").hide();
                    $("#tblInventoryConsolidate").hide();
                    $("#tblInventoryRacks").show();
                    $("#DivInventoryRacks").show();
                    $("#tdRackslabel").show();                    
                    

                    $("#tblInventoryPricing").hide();
                    $("#DivInventoryPricing").hide();

                    $("#tblInventorySelectionDetails").show();
                    $("#lblInventorychosendate").hide();
                    $("#imgInventoryDate").attr("src", "images/EmptyFilter.png");
                    $("#tr2").removeClass('FilterDivStyle');
                    FramingInventoryFilter();
                    if (IsInventoryRacksGridInitialize == false) {
                        InitializeInventoryRackDetailsGrid();
                        IsInventoryRacksGridInitialize = true;
                    }
                    else {
                        $("#fgrdInventoryRacks").empty();
                        $("#fgrdInventoryRacks").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                    }
                }
                else if ($("#DivInventoryBar").find('button.is-checked')[0].value == "pricing") {

                    $("#tblcurrentinventory").hide();
                    $("#tblInventoryUsers").hide();
                    $("#tblInventoryUsersSQLPage").hide();
                    $("#tblInventoryConsolidate").hide();
                    $("#tblInventoryRacks").hide();
                    $("#DivInventoryRacks").hide();

                    $("#tblInventoryPricing").show();
                    $("#DivInventoryPricing").show();

                    $("#tblInventorySelectionDetails").hide();
                    $("#lblInventorychosendate").hide();
                    $("#imgInventoryDate").attr("src", "images/EmptyFilter.png");
                    $("#tr2").removeClass('FilterDivStyle');
                    FramingInventoryFilter();
                    if (IsInventoryPricingGridInitialize == false) {
                        InitializeInventoryPricingGrid();
                        IsInventoryPricingGridInitialize = true;
                    }
                    else {
                        $("#fgrdInventoryPricing").empty();
                        $("#fgrdInventoryPricing").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                    }
                }
                else {

                    $("#chkInvenAWB").prop("src", "images/check-off.png");
                    //$.ajax({ //save date to the session 
                    //    url: 'BloomService.asmx/SaveDateSession',
                    //    type: 'POST',
                    //    data: "{'FromDate':'" + $("#txtInventoryFromRecDate").val() + "','ToDate':'" + $("#txtInventoryToRecDate").val() + "'}",
                    //    contentType: "application/json; charset=utf-8",
                    //    dataType: "json",
                    //    success: function (output, status) {
                    //        //var fdate = $("#txtInventoryFromRecDate").val() + " to " + $("#txtInventoryToRecDate").val();
                    //        //$("#lblInventorychosendate").html(fdate);
                    //        //$("#lblInventorychosendate").show();
                    //        //$("#imgInventoryDate").attr("src", "images/Filter.png");
                    //        //$("#tr2").addClass('FilterDivStyle');

                    //        FramingInventoryFilter();
                    //        $("#divInventoryDetailByAWB").hide();
                    //        $("#divInventoryDetailByFarm").hide();
                    //        $("#lstInventoryAWBFilter").hide();
                    //        $("#lstInventoryHistoryAWBFilter").show();
                    //        $("#lblInventorychosendate").show();
                    //    }
                    //});



                    if ($("#DivInventoryBar").find('button.is-checked')[0].value == "invhist") {
                        $("#lblInventorychosendate").show();
                        $("#imgInventoryDate").attr("src", "images/Filter.png");
                        $("#tr2").addClass('FilterDivStyle');
                    }
                    else if ($("#DivInventoryBar").find('button.is-checked')[0].value == "inven") {

                        $("#DivCoolerDisplay").find('.is-checked').removeClass('is-checked');
                        $("#DivCoolerDisplay #btnarrival").addClass('is-checked');
                        $("#btnCoolerRelease").hide();
                        $("#lstInventoryAWBFilter").show();
                        $("#lstInventoryHistoryAWBFilter").hide();
                        $("#divInventoryFiltersDefault").show();

                        //$("#lblInventorychosendate").show();
                        //$("#imgInventoryDate").attr("src", "images/Filter.png");
                        //$("#tr2").addClass('FilterDivStyle');

                        $("#lblInventorychosendate").hide();
                        $("#imgInventoryDate").attr("src", "images/EmptyFilter.png");
                        $("#tr2").removeClass('FilterDivStyle');
                        //$("#fgrdInventoryHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(3)").find("img").attr("src", "images/check-off.png");
                    }

                    if (IsInventoryHeaderGridInitialize == false) {
                        LoadFgrdInventoryHeader();
                        GetAWBList();
                        IsInventoryHeaderGridInitialize = true;
                    }
                    else {

                        if ($("#DivInventoryBar").find('button.is-checked')[0].value == "inven") {
                            $("#fgrdInventoryHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(3)").find("div").find('img').remove();
                            $("#fgrdInventoryHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(3)").find("div").html('<img style="Cursor:pointer;" title="Change to pieces received" id="chkOnHand" src="images/check-off.png"/>');
                            $("#fgrdInventoryHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1)").find("div").html('<img style="Cursor:pointer;" title="Change to pieces received" id="chkInvenAWB" src="images/check-off.png"/>');
                        }
                        else {
                            $("#fgrdInventoryHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(3)").find("div").html("Pieces");//find("img").attr("src", "images/check-off.png");
                            $("#fgrdInventoryHeader").parent(".bDiv").siblings(".hDiv").find("table tr th:nth-child(1)").find("div").html('<img style="Cursor:pointer;" title="Change to pieces received" id="chkInvenAWB" src="images/check-off.png"/>');
                        }
                        $("#fgrdInventoryHeader").empty();
                        $("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: '0' }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
                    }

                    $("#tblcurrentinventory").show();
                    $("#tblInventoryUsers").hide();
                    $("#tblInventoryUsersSQLPage").hide();
                    $("#tblInventoryConsolidate").hide();
                    $("#tblInventoryRacks").hide();

                    $("#tblInventoryPricing").hide();
                    $("#DivInventoryPricing").hide();

                    if ($("#ctl00_DivLoggedInUserType").html().toLowerCase() == "warehouse") {
                        // $("#tblcurrentinventory").show(); removed on 03/10/2010
                        $("#tblInventoryUsers").hide();
                        $("#tblInventoryUsersSQLPage").hide();
                        $("#tblInventoryConsolidate").hide();
                        $("#tblInventorySelectionDetails").show();
                        $("#tblInventoryRacks").show();
                        $("#DivInventoryRacks").show();
                        $("#tdRackslabel").show();
                        

                        $("#tblInventoryPricing").hide();
                        $("#DivInventoryPricing").hide();


                        $("#lblInventorychosendate").hide();
                        $("#imgInventoryDate").attr("src", "images/EmptyFilter.png");
                        $("#tr2").removeClass('FilterDivStyle');
                    }

                    if ('<%=ConfigurationManager.AppSettings("CompanyName")%>'.toLowerCase().indexOf("EspritMiami") >= 0)
                        $("#DivCoolerDisplay").show();
                    else
                        $("#DivCoolerDisplay").hide();

                    //FramingInventoryFilter();
                    $("#divInventoryDetailByAWB").hide();
                    $("#divInventoryFilters").hide();
                    $("#divInventoryDetailByFarm").hide();
                    $(".inventoryawb").hide();
                    $(".inventoryfarm").hide();
                    $("#tdTransferReprint").hide();
                    FramingInventoryFilter();

                    //$('.TotalRows').each(function (i) {
                    //    $('.TotalRows')[i]
                    //})
                }
            }
        });

    });
});

$('#DivCoolerDisplay').each(function (i, buttonGroup) {

    var $buttonGroup = $(buttonGroup);
    $buttonGroup.on('click', 'button', function () {

        $buttonGroup.find('.is-checked').removeClass('is-checked');
        $(this).addClass('is-checked');


        $("#divInventoryDetailByAWB").hide();
        $("#divInventoryFilters").hide();
        $("#divInventoryDetailByFarm").hide();
        $("#InventoryHeaderID").html("");
        //$("#InventSelectionDetails").hide();
        $(".inventoryfarm").hide();
        $(".inventoryawb").hide();
        $("#tdTransferReprint").hide();
        $("#DivSelectedrowInInventoryDetail").html("");
        $("#divInventoryFilters").hide();
        ReceivedPiecesOnly = "0";
        AWBFlag = "";
        if ($("#DivCoolerDisplay").find('button.is-checked')[0].value == "arrival") {
            AWBFlag = "1";
            ReceivedPiecesOnly = "1";
            $("#fgrdInventoryHeader").empty();
            $("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
        }
        else if ($("#DivCoolerDisplay").find('button.is-checked')[0].value == "available") {
            $("#fgrdInventoryHeader").empty();
            $("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
        }
        else if ($("#DivCoolerDisplay").find('button.is-checked')[0].value == "everything") {
            ReceivedPiecesOnly = "1";
            $("#fgrdInventoryHeader").empty();
            $("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
        }

    });
});

function LoadInventoryFlowers() {

    var length = $('#lstInventoryFlower > option').length;
    if (length <= 0) {
        $("#imgFlowerAutocompleteLoader").css("display", "block");
        $(".YellowWarning").html("Loading Flowers Please Wait <img style=display: none' src='images/ajax-loader.gif' />");
        $(".YellowWarning").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadFlowers',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('#lstInventoryFlower').empty();
                var data = output.d;

                //$('#lstInventoryFlower').append('<option value="0">Choose Flower...</option>');
                for (var i in data) {
                    var flower = data[i];
                    if (flower.Flower.trim() != "") {
                        //$('#lstInventoryFlower').append('<option value="' + flower.Flower.trim() + '~' + flower.Name.trim() + '~' + flower.CAT.trim() + '~' + flower.ColorCode.trim() + '">' + flower.Flower + '  [' + flower.Name + ']' + '</option>');
                        $('#lstInventoryFlower').append('<option value="' + flower.Flower.trim() + '">' + flower.Flower + '  [' + flower.Name + ']' + '</option>');
                    }
                }

                J1_10($("#lstInventoryFlower")).selectize({

                    onChange: function () {

                        var Flower = $("#lstInventoryFlower")[0].value;
                        var dt = new Array();
                        if (Flower != "0" && Flower != "") {
                            dt = GetFlowerDetailsByCode(Flower);
                            //$("#txtInventoryFlowerDesc").val(dt[0].Name);
                            $("#DivInventoryFlowerCategory").html(dt[0].Cat);
                            $("#DivInventoryFlowerColorCode").html(dt[0].ColorCode);
                            //  $("#txtUnitsPerBunch").val(flowerssplit[3]);
                            $("#txtQuantityReceived").focus();
                        }
                        else {
                            //$("#txtInventoryFlowerDesc").val("");
                            $("#DivInventoryFlowerCategory").html("");
                            $("#DivInventoryFlowerColorCode").html(0);
                            $("#txtInventoryUnitsPerBunch").val(0);
                        }

                    }
                });
                J1_10($("#lstInventoryFlower")).selectize()[0].selectize.setValue($("#hfInventoryFlower").val());
                $("#imgFlowerAutocompleteLoader").css("display", "none");
                $(".YellowWarning").hide();
            },
        });
    }
    else {
        J1_10($("#lstInventoryFlower")).selectize()[0].selectize.setValue($("#hfInventoryFlower").val());
    }

}

function GetFlowerDetailsByCode(Flower) {
    var res = ""
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetFlowerDetailsByCode',
        data: '{"Flower":"' + Flower + '"}',
        contentType: "application/json; charset=utf-8",
        async: false,
        dataType: "json",
        success: function (output, status) {

            res = output.d;
            //$("#txtInventoryFlowerDesc").val(dt[0].Name);
            //$("#DivInventoryFlowerCategory").html(dt[0].CAT);
            //$("#DivInventoryFlowerColorCode").html(dt[0].ColorCode);
        }
    });
    return res;
}

//STA::26-OCT-2015::Inventory Edit Dialog
$("#DivInventoryPODetails").dialog({
    autoOpen: false,
    width: 850,
    height: 420,
    modal: true,
    resizable: false,
    buttons: {
        Save: function () {

            var Id = $("#InventoryDetailID").html();
            var tableName = $("#DivInventoryBar").find('button.is-checked')[0].value;
            //var flowerssplit = $("#lstInventoryFlower")[0].value.split('~');
            var Flower = $("#hfInventoryFlower").val();

            if (Flower == "" || Flower == "0") {
                $('.YellowWarning').html("Please choose flower..");
                $('.YellowWarning').show();
                $("#txtInventoryFlower").focus();
                return false;
            }
            //var Flower = flowerssplit[0];
            //var FlowerCat = flowerssplit[2];
            //var FlowerDet = new Array();
            //FlowerDet = GetFlowerDetailsByCode(Flower);
            //var FlowerCat = FlowerDet[0].CAT;
            //var FlowerName = FlowerDet[0].Name;

            var FlowerCat = $("#DivInventoryFlowerCategory").html();
            var FlowerName = $("#DivInventoryFlowerName").html();

            //var FlowerName = $("#txtInventoryFlowerDesc").val();
            //if (FlowerName == "") {
            //    $(".YellowWarning").html("Please enter flower desc..");
            //    $(".YellowWarning").show();
            //    $("#txtFlowerDesc").focus();
            //    return false;
            //}

            var Invoice = $("#txtInventoryInvoice").val();
            if (Invoice == "")
                Invoice = $("#txtInventoryInvoice").attr("Placeholder")

            var PONumber = $("#txtInventoryPO").val();
            if (PONumber == "")
                PONumber = $("#txtInventoryPO").attr("Placeholder")




            var QtyRec = $("#txtQuantityReceived").val();
            if (QtyRec == "")
                QtyRec = $("#txtQuantityReceived").attr("Placeholder")
            if (QtyRec == "") {
                $(".YellowWarning").html("Please enter Quantity Received..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtQuantityReceived"));
                return false;
            }

            var QtySold = $("#txtQuantitySold").val();
            if (QtySold == "")
                QtySold = $("#txtQuantitySold").attr("Placeholder")
            if (QtySold == "") {
                $(".YellowWarning").html("Please enter Quantity Sold..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtQuantitySold"));
                return false;
            }

            var UOM = $("#lstInventoryUOM").val();
            if (UOM == 0) {
                $(".YellowWarning").html("Please Choose UOM..");
                $(".YellowWarning").show();
                ctrlFocus($("#lstUOM"));
                return false;
            }
            var Units = $("#txtInventoryUnitsPerBox").val();
            if (Units == "")
                Units = $("#txtInventoryUnitsPerBox").attr("Placeholder")
            if (Units == "") {
                $(".YellowWarning").html("Please enter Units..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtUnits"));
                return false;
            }

            var UnitsPerBunch = $("#txtInventoryUnitsPerBunch").val() == "" ? "0" : $("#txtInventoryUnitsPerBunch").val();
            if ($("#txtInventoryUnitsPerBunch").val() == "")
                UnitsPerBunch = $("#txtInventoryUnitsPerBunch").attr("Placeholder");


            var UnitsPerBox = $("#txtInventoryUnitsPerBox").val();
            if (UnitsPerBox == "")
                UnitsPerBox = $("#txtInventoryUnitsPerBox").attr("Placeholder")
            if (UnitsPerBox == "") {
                $(".YellowWarning").html("Please enter Units Per Box..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtUnitsPerBox"));
                return false;
            }

            var CostPerUnits = $("#txtInventoryCostPerUnit").val();
            if (CostPerUnits == "")
                CostPerUnits = $("#txtInventoryCostPerUnit").attr("Placeholder")
            if (CostPerUnits == "") {
                $(".YellowWarning").html("Please enter Cost Per Units..");
                $(".YellowWarning").show();
                ctrlFocus($("#txtCostPerUnit"));
                return false;
            }
            //var Type = $("#txtInventoryType").val();
            //if (Type == "")
            //    Type = $("#txtInventoryType").attr("Placeholder")
            //if (Type == 0) {
            //    $(".YellowWarning").html("Please enter type..");
            //    $(".YellowWarning").show();
            //    ctrlFocus($("#txtType"));
            //    return false;
            //}

            var Type = $("#lstInventoryType").val();
            if (Type == "0") {
                $(".YellowWarning").html("Please enter type..");
                $(".YellowWarning").show();
                ctrlFocus($("#lstInventoryType"));
                return false;
            }

            var InvenType = $("#lstInventoryInvenType").val();
            if (InvenType == "0") {
                $(".YellowWarning").html("Please enter inventype..");
                $(".YellowWarning").show();
                ctrlFocus($("#lstInventoryInvenType"));
                return false;
            }

            var Comments = $("#txtInventoryComments").val();

            var CustNumber = $("#txtInventoryCustNo").val() == "" ? $("#txtInventoryCustNo").attr("Placeholder") : $("#txtInventoryCustNo").val();
            if (CustNumber == "") {
                CustNumber = 0
            }


            var OrderNumber = $("#txtInventoryOrderNo").val() == "" ? $("#txtInventoryOrderNo").attr("Placeholder") : $("#txtInventoryOrderNo").val();
            if (OrderNumber == "") {
                OrderNumber = 0;
            }
            var boxnumber = $("#txtInventoryBoxNumber").val() == "" ? $("#txtInventoryBoxNumber").attr("Placeholder") : $("#txtInventoryBoxNumber").val();

            var ColorCode = $("#DivInventoryFlowerColorCode").html();
            var warehouse = $("#lstWarehouse").val()

            //Muthu Nivetha M :: 06Mar2020 :: Modified :: To save values of othercost,handling,duties/andean and landedcost for Edit Inventory email requirements
            var Othercost = 0, Handling = 0, Duties = 0, LandedCost = 0;
            Othercost = $("#txtInventoryOtherCostPerBox").val() == "" ? $("#txtInventoryOtherCostPerBox").attr("Placeholder") : $("#txtInventoryOtherCostPerBox").val();
            Handling = $("#txtInventoryHandling").val() == "" ? $("#txtInventoryHandling").attr("Placeholder") : $("#txtInventoryHandling").val();
            Duties = $("#txtInventoryDuties").val() == "" ? $("#txtInventoryDuties").attr("Placeholder") : $("#txtInventoryDuties").val();
            LandedCost = $("#txtInventorylandedcost").val() == "" ? $("#txtInventorylandedcost").attr("Placeholder") : $("#txtInventorylandedcost").val();

            //
            if (tableName == "inven" || tableName == "invhist") {
                //STA::27-OCT-2015::to update the inventory(inven or invhist) details
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/SaveInventoryDetails',
                    data: '{"ID":"' + Id + '","TableName":"' + tableName + '","Flower":"' + Flower + '","FlowerName":"' + FlowerName + '","FlowerCategory":"' + FlowerCat
                        + '","QtyRec":"' + QtyRec + '","QtySold":"' + QtySold + '","UOM":"' + UOM + '","UnitsPerBunch":"' + UnitsPerBunch + '","Units":"' + Units
                        + '","Cost":"' + CostPerUnits + '","InvenType":"' + InvenType + '","BoxNum":"' + boxnumber + '","OrderNum":"' + OrderNumber
                        + '","PO":"' + PONumber + '","Invoice":"' + Invoice + '","Cust":"' + CustNumber + '","Comments":"' + Comments + '","ColorCode":"' + ColorCode + '","Type":"' + Type + '","warehouse":"' + warehouse + '","OtherCost":"'
                        + Othercost + '","Handling":"' + Handling + '","Duties":"' + Duties + '","LandedCost":"' + LandedCost + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {

                        if (output.d == "logout") {
                            window.location.href = "Login.aspx";
                        }
                        else if (output.d == "success") {

                            $("#fgrdInventoryHeader").flexReload({ url: '/url/for/refresh' });
                            $("#fgrdInventoryDetailbyFARM").empty();
                            $("#fgrdInventoryDetailbyFARM").flexOptions({ params: [{ name: 'Filter', value: DefInventoryDetailsByFARM }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
                            $("#DivInventoryPODetails").dialog("close");
                            $("#DivInventoryFlowerCategory").html("");
                        }
                        else {
                            $(".Warning").show();
                        }
                    }
                });
            }
            else {
                //STA::27-OCT-2015::to update the Inventory user details
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/UpdateInventoryUserDetails',
                    data: '{"AWB":"' + $("#InventoryAWB").html() + '","TableName":"' + $("#InventoryUserTableName").html() + '","Flower":"' + Flower + '","FlowerName":"' + FlowerName + '","FlowerCategory":"' + FlowerCat
                        + '","QtyRec":"' + QtyRec + '","QtySold":"' + QtySold + '","UOM":"' + UOM + '","UnitsPerBunch":"' + UnitsPerBunch + '","Units":"' + Units
                        + '","Cost":"' + CostPerUnits + '","InvenType":"' + InvenType + '","BoxNum":"' + boxnumber + '","OrderNum":"' + OrderNumber
                        + '","PO":"' + PONumber + '","Invoice":"' + Invoice + '","Cust":"' + CustNumber + '","Comments":"' + Comments
                        + '","Farm":"' + $("#InventoryFarm").html() + '","ColorCode":"' + ColorCode + '","Type":"' + Type + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        if (output.d == "success") {
                            $("#InventoryFarm").html("");

                            $("#fgrdInventoryUsersHeaders").flexReload({ url: '/url/for/refresh' });

                            $("#DivInventoryPODetails").dialog("close");
                            $("#DivInventoryFlowerCategory").html("");
                            $("#InventoryUserTableName").html("");
                            $("#InventoryAWB").html("");
                        }
                        else {
                            $(".Warning").show();
                        }
                    }
                });
            }
        },
        Cancel: function () {
            $(this).dialog("close");
            $("#InventoryFarm").html("");
            $("#DivInventoryFlowerCategory").html("");
            $("#InventoryUserTableName").html("");
            $("#InventoryAWB").html("");
        },
    },
    open: function () {

        $(".YellowWarning").hide();
        $(".Warning").hide();
        $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save')
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')

        if ($("#ctl00_DivLoggedInUserType").html().toLowerCase() == "warehouse") {
            $("#btninventsave").prop('disabled', true);
        }
        else {
            $("#btninventsave").prop('disabled', false);
        }

    },
    close: function () {

        ClearLockedInventoryOnEdit(function (callback) {
        });
    }
});

var LockedInventoryOnEdit = []
var PageEditLoaded = false;

//STA::26-OCT-2015::to edit the Inventory details
$("[id^=editInventoryPOdetail_]").die("click").live("click", function (e) {

    var EdtInvId = $(this)[0].id.replace("editInventoryPOdetail_", "");
    var farm = $(this).attr("data-farm");
    var product = $(this).attr("data-productcode");

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/InsertLock',
        data: "{ 'LockRecord': '" + EdtInvId + "','Page':'PageInventory','Functionality':'InvenLock'}",
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
                openEditInventory(EdtInvId, farm, product);
            }
            else if (data != "") {

                var tmp = data.split("_");
                var index = 16;
                var sentence = $("#ctl00_DivForInventoryLockRelease").html();
                //Get Sales Permission has rights to modify the printed order
                var hasPermissionToReleaseLockedInventory = sentence.charAt(index);

                if (hasPermissionToReleaseLockedInventory.toUpperCase() == "Y" || $("#ctl00_DivLoggedInUserType").html().toLowerCase() == "admin") {
                    $("#InventoryLockReleaseDialog").html("<p>This item has been locked by " + tmp[0].toString().toUpperCase() + "!  <b>Are you sure to Release this item?</b></p>");
                    $("#InventoryLockReleaseDialog").data("inData", { ReleaseInventory: EdtInvId, ReleaseInvenFarm: farm, ReleaseInvenProduct: product }).dialog("open");
                }
                else {
                    $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + "! ");
                }
            }
            else {
                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
            }
        }
    });
});

//Region "Release Lock"
$("#InventoryLockReleaseDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "Release Lock",
    width: 350,
    modal: true,
    buttons: {
        Yes: function () {

            var InventoryId = $("#InventoryLockReleaseDialog").data("inData")["ReleaseInventory"];
            var farm = $("#InventoryLockReleaseDialog").data("inData")["ReleaseInvenFarm"];
            var product = $("#InventoryLockReleaseDialog").data("inData")["ReleaseInvenProduct"];
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteLock',
                data: "{ 'LockRecord': '" + InventoryId + "','Page':'PageInventory','Functionality':'InvenLockRelease_Release'}",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: "json",
                success: function (output, status) {
                    var data = output.d;
                    $("#InventoryLockReleaseDialog").dialog("close");
                    $.ajax({
                        type: "POST",
                        url: 'BloomService.asmx/InsertLock',
                        data: "{ 'LockRecord': '" + InventoryId + "','Page':'PageInventory','Functionality':'InvenLock'}",
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
                                openEditInventory(InventoryId, farm, product);
                            }
                            else if (data != "") {

                                var tmp = data.split("_");
                                $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + "! ");
                            }
                            else {
                                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                            }
                        }
                    });
                },
            });
        },
        No: function () {
            $("#InventoryLockReleaseDialog").dialog("close");
        }
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
    },
});

$('<div id="EditInventoryPODetails">/div>').dialog({
    autoOpen: false,
    width: 'auto',
    height: 'auto',
    modal: true,
    resizable: false,
    //closeOnEscape:false,
    close: function () {

        ClearLockedInventoryOnEdit(function (callback) {
        });
    },
    open: function () {
        if ($("#ctl00_DivLoggedInUserType").html().toLowerCase() == "warehouse") {
            $("#btninventsave").prop('disabled', true);
        }
        else {
            $("#btninventsave").prop('disabled', false);
        }

    }
});




function openEditInventory(InvenId, _Farm, _Product) {

    LockedInventoryOnEdit.push(InvenId);
    if (PageEditLoaded == false) {
        var tableName = $("#DivInventoryBar").find('button.is-checked')[0].value;
        $("#InventoryDetailID").html(InvenId);
        var para = "InvenID=" + InvenId + "&" + "tableName=" + tableName;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetPage',
            data: '{ "controlName":"pages/PageInventoryEdit.ascx","controlPara":"' + para + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#EditInventoryPODetails").dialog('option', 'title', 'Inventory Detail :: ' + _Farm + "-" + _Product)
                $("#EditInventoryPODetails").html(output.d).dialog("open");
                PageEditLoaded = false;
            }
        });
    }
    else {
        var tableName = $("#DivInventoryBar").find('button.is-checked')[0].value;
        $("#InventoryDetailID").html(InvenId);
        $("#ctl00_divinventid").html(InvenId);
        $("#ctl00_divtablename").html(tableName);
        //var para = "InvenID=" + InvenId + "&" + "tableName=" + tableName;
        $("#EditInventoryPODetails").dialog('option', 'title', 'Inventory Detail :: ' + _Farm + "-" + _Product)
        inventedit(InvenId, tableName)
        $("#EditInventoryPODetails").dialog("open");
    }

}

//End Region "Release Lock"

$(window).on('beforeunload', function () {

    ClearLockedInventoryOnEdit(function (callback) {
    });
});

//function inventedit(para) {

//$.ajax({
//    type: "POST",
//    url: 'BloomService.asmx/GetPage',
//    data: '{ "controlName":"pages/PageInventoryPODetails.ascx","controlPara":"' + para + '" }',
//    contentType: "application/json; charset=utf-8",
//    dataType: "json",
//    success: function (output, status) {
//        
//        $('<div id="EditInventoryPODetails">/div>').dialog({
//            title: 'Edit Detail :: ' ,
//            autoOpen: false,
//            width: 800,
//            height: 420,
//            modal: true,
//            resizable: false,
//            //closeOnEscape:false,
//            close: function () {
//                ClearLockedInventoryOnEdit(function (callback) {
//                });
//            }

//        });
//        $("#EditInventoryPODetails").html(output.d).dialog("open");

//    }
//});
//}

function ClearLockedInventoryOnEdit(callback) {

    if (LockedInventoryOnEdit.length > 0) { // this global variable  declared in dashboarduser page 
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/DeleteLock',
            data: "{ 'LockRecord': '" + LockedInventoryOnEdit.join(",") + "','Page':'PageInventory','Functionality':'InvenLockRelease'}",
            contentType: "application/json; charset=utf-8",
            async: false,
            dataType: "json",
            success: function (output, status) {
                var data = output.d;
                LockedInventoryOnEdit = [];  // this global variable  declared in dashboarduser page 
                callback(true);
            },

        });
    }
    else {
        callback(true);
    }
}

//STA::27-OCT-2015::to delete the invoice details
$("[id^=deleteInventoryPOdetail_]").die("click").live("click", function () {

    var DelInvId = $(this)[0].id.replace("deleteInventoryPOdetail_", "");
    var tableName = $("#DivInventoryBar").find('button.is-checked')[0].value;
    var boxnum = $("#fgrdInventoryDetailbyFARM #row" + DelInvId).find("td div").eq(18) == undefined ? "0" : $("#fgrdInventoryDetailbyFARM #row" + DelInvId).find("td div").eq(18).text();
    var farm = $("#fgrdInventoryDetailbyFARM #row" + DelInvId).find("td div").eq(2) == undefined ? "" : $("#fgrdInventoryDetailbyFARM #row" + DelInvId).find("td div").eq(2).text();

    LockedInventoryOnEdit.push(DelInvId);
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/InsertLock',
        data: "{ 'LockRecord': '" + DelInvId + "','Page':'PageInventory','Functionality':'InvenLock_Delete'}",
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

                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/CheckInvenIDIsExistinVETOrOrder',
                    data: '{"InventoryId":"' + DelInvId + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output) {
                        var data = output.d.toLowerCase();
                        if (data == "notexist") {
                            $("#ConfirmationInventoryDeleteDialog").data("inData", { DeleteInventoryId: DelInvId, Table_Name: tableName }).dialog("open");
                        }
                        else if (data == "isexist in vet") {
                            ClearLockedInventoryOnEdit(function (callback) {
                            });
                            $.MessageBox("This item has <b> sales in Closed Orders</b>, Unable to Delete!");
                        }
                        else if (data == "isexist in order") {
                            ClearLockedInventoryOnEdit(function (callback) {
                            });
                            $.MessageBox("This item has <b> sales in Current Orders</b>, Unable to Delete!");
                        }
                        else {
                            ClearLockedInventoryOnEdit(function (callback) {
                            });
                            $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        }
                    }
                });
            }
            else if (data != "") {

                var tmp = data.split("_");
                $.MessageBox("This item has been locked by " + tmp[0].toString().toUpperCase() + "! ");
                //ClearLockedInventoryOnEdit(function (callback) {
                //});
                // $("#ConfirmationInventoryDeleteDialog").dialog("close");
            }
            else {
                $.MessageBox("OOPS! Unable to process your request. Please contact admin!");
                //ClearLockedInventoryOnEdit(function (callback) {
                //});
                // $("#ConfirmationInventoryDeleteDialog").dialog("close");
            }
        }
    });
});

$("#ConfirmationInventoryDeleteDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "",
    width: 350,
    height: 125,
    modal: true,
    buttons: {
        Yes: function () {

            var DelInvId = $("#ConfirmationInventoryDeleteDialog").data("inData")["DeleteInventoryId"];
            var tableName = $("#ConfirmationInventoryDeleteDialog").data("inData")["Table_Name"];

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/DeleteInventoryDetails',
                data: '{"ID":"' + DelInvId + '","TableName":"' + tableName + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output) {
                    if (output.d == "success") {
                        ClearLockedInventoryOnEdit(function (callback) {
                        });
                        $("#row" + DelInvId).remove();
                        // $("#fgrdInventoryHeader").flexReload({ url: '/url/for/refresh' });
                        //$("#fgrdInventoryDetailbyFARM").flexReload({ url: '/url/for/refresh' });
                        $("#DivInventoryPODetails").dialog("close");
                        $("#DivInventoryFlowerCategory").html("");
                        $("#DivSelectedrowInInventoryDetail").html("");
                        $("#ConfirmationInventoryDeleteDialog").dialog("close");
                    }
                    else {
                        //$(".Warning").show();
                        $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
                        $("#ConfirmationInventoryDeleteDialog").dialog("close");
                    }
                }
            });

        },
        No: function () {

            ClearLockedInventoryOnEdit(function (callback) {
            });
            $("#ConfirmationInventoryDeleteDialog").dialog("close");
        }
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
    },
    close: function () {

        ClearLockedInventoryOnEdit(function (callback) {
        });
        // $("#ConfirmationInventoryDeleteDialog").dialog("close");
    }
});


function LoadInventoryType() {

    var length = $('#lstInventoryType > option').length;
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
                $('#lstInventoryType').append('<option value="0">Select</option>');
                for (var i in Typedata) {
                    var Type = Typedata[i];
                    $('#lstInventoryType').append('<option value="' + Type.Code + '">' + Type.Code + ' - ' + Type.Name + '</option>');
                }
                if ($("#hfInventoryType").val() != "" && $("#hfInventoryType").val() != 0)
                    $('#lstInventoryType').val($("#hfInventoryType").val());
                else
                    $("#lstInventoryType").val("0");
            }
        });
    }
    else {
        $('#lstInventoryType').val($("#hfInventoryType").val());
    }
}

function LoadInventoryInvenType() {
    var length = $('#lstInventoryInvenType > option').length;
    if (length <= 0) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetInvenTypeForInventory',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstInventoryInvenType').empty();
                var InvenTypedata = output.d;
                $('#lstInventoryInvenType').append('<option value="0">Select</option>');
                for (var i in InvenTypedata) {
                    var InvenType = InvenTypedata[i];
                    $('#lstInventoryInvenType').append('<option value="' + InvenType.Code + '">' + InvenType.Code + ' - ' + InvenType.Name + '</option>');
                }
                if ($("#hfInventoryInvenType").val() != "" && $("#hfInventoryInvenType").val() != 0)
                    $('#lstInventoryInvenType').val($("#hfInventoryInvenType").val());
                else
                    $("#lstInventoryInvenType").val("0");
            }
        });
    }
    else {
        $('#lstInventoryInvenType').val($("#hfInventoryInvenType").val());
    }
}


function LoadWarehouse() {
    var length = $('#lstWarehouse > option').length;
    if (length <= 0) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetWarehouseList',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('#lstWarehouse').empty();
                var warehouse = output.d;
                $('#lstWarehouse').append('<option value="0">Select</option>');
                for (var i in warehouse) {
                    var wh = warehouse[i];
                    $('#lstWarehouse').append('<option value="' + wh.WH + '">' + wh.WH + ' - ' + wh.Name + '</option>');
                }

                $('#lstWarehouse').val($("#hfInventoryWarehouse").val());

            }
        });
    }
    else {
        $('#lstWarehouse').val($("#hfInventoryWarehouse").val());
    }
}



function LoadInventoryUOM() {
    var length = $('#lstInventoryUOM > option').length;
    if (length <= 0) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetUOMForManualPO',
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $('#lstInventoryUOM').empty();
                var UOMdata = output.d;
                $('#lstInventoryUOM').append('<option value="0">Select</option>');
                for (var i in UOMdata) {
                    var UOM = UOMdata[i];
                    $('#lstInventoryUOM').append('<option value="' + UOM.UOM + '">' + UOM.UOM + '</option>');
                }
                if ($("#hfInventoryUOM").val() != "" && $("#hfInventoryUOM").val() != 0)
                    $('#lstInventoryUOM').val($("#hfInventoryUOM").val());
                else
                    $("#lstInventoryUOM").val("QB");
            }
        });
    }
    else {
        $('#lstInventoryUOM').val($("#hfInventoryUOM").val());
    }
}

$(".NumbersOnly").keypress(function (event) {
    return isNumberEntryByLength(event, this)
});
// THE SCRIPT THAT CHECKS IF THE KEY PRESSED IS A NUMERIC OR DECIMAL VALUE.
function isNumberEntry(evt, element) {
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

$("#txtQuantityReceived").change(function (event) {

    var QuantityVal = $("#txtQuantityReceived").val() == "" ? $("#txtQuantityReceived").attr("Placeholder") : $("#txtQuantityReceived").val();
    var CostVal = $("#txtInventoryUnitsPerBox").val() == "" ? $("#txtInventoryUnitsPerBox").attr("Placeholder") : $("#txtInventoryUnitsPerBox").val();
    if (QuantityVal != "" && CostVal != "")
        $("#txtInventoryUnits").val(QuantityVal * CostVal);

});

$("#txtInventoryUnitsPerBox").change(function (event) {

    var QuantityVal = $("#txtQuantityReceived").val() == "" ? $("#txtQuantityReceived").attr("Placeholder") : $("#txtQuantityReceived").val();
    var CostVal = $("#txtInventoryUnitsPerBox").val() == "" ? $("#txtInventoryUnitsPerBox").attr("Placeholder") : $("#txtInventoryUnitsPerBox").val();
    if (QuantityVal != "" && CostVal != "")
        $("#txtInventoryUnits").val(QuantityVal * CostVal);

});

$('#txtInventoryCostPerUnit').keypress(function (event) {

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


//Inventory Users START

//VEN::26-OCT-2015::To Load inventory User Header Grid
function InitializeInventoryUserHeaderGrid() {
    $("#fgrdInventoryUsersHeaders").flexigrid({
        url: 'BloomService.asmx/GetInventoryUserHeaderList',
        dataType: 'xml',
        colModel: [
            { display: 'AWB', name: 'Lot', width: 75, sortable: true, align: 'left', process: InventoryUserHeaderRowClick },
            { display: 'Received', name: 'DateRec', width: 55, sortable: true, align: 'left', process: InventoryUserHeaderRowClick },
            { display: 'Pieces', name: 'TotalBoxes', width: 35, sortable: true, align: 'right', process: InventoryUserHeaderRowClick },
            { display: 'FBE', name: '', width: 35, sortable: false, align: 'right', process: InventoryUserHeaderRowClick },
            { display: 'Farm', name: 'Farm', width: 35, sortable: true, align: 'left', process: InventoryUserHeaderRowClick, hide: true },
            { display: '', name: '', width: 35, sortable: true, align: 'right', hide: true },
            { display: 'User', name: '', width: 20, sortable: false, align: 'center', process: InventoryUserHeaderRowClick },
            { display: '', name: '', width: 15, sortable: false, align: 'center' },
        ],
        searchitems: [
            { display: 'AWB', name: 'Lot' },
            { display: 'Pieces', name: 'TotalBoxes' },
            //{ display: 'Farm', name: 'Farm' },
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

            if ($("#fgrdInventoryUsersHeaders tr").length == 0) {
                $("#msg").html("Users not found!");
                $("#msgbox-select").dialog("open");
            }
            else {
                //For to show the error
                if ($("#fgrdInventoryUsersHeaders tr#row-2").length > 0) {
                    $("#fgrdInventoryUsersHeaders tr#row-2").hide();
                    $.MessageBox($("#fgrdInventoryUsersHeaders tr#row-2")[0].innerText);
                    return false;
                }

                $("#DivInventoryUsersHeaders #ExportCSV").show();

                //$('#DivInventoryUsersHeaders #row0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
                //$('#DivInventoryUsersHeaders #row0 td:nth-child(3) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
                //$('#DivInventoryUsersHeaders #row0 td:nth-child(4) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
                $('#DivInventoryUsersHeaders #row0').addClass("TotalRows")
                //$('.TotalRows>td>div').addClass("test")
                //$("#DivInventoryUsersHeaders .pcontrol input").css("width", "40px")
                //$("#DivInventoryUsersHeaders .btnseparator:eq(0)").hide();
                //$("#DivInventoryUsersHeaders .pSearch").hide();
                //$("#DivInventoryUsersHeaders .sDiv2").css("width", "290px");
                //$("#DivInventoryUsersHeaders .pDiv2").css("width", "300px");
                if ($("#InventoryHeaderID").html() != "0" && $("#InventoryHeaderID").html() != "" && $("#fgrdInventoryUsersHeaders #row" + $("#InventoryHeaderID").html()).css('display') == "table-row") {
                    var id = $("#InventoryHeaderID").html();
                    var AWBNumber = $('#fgrdInventoryUsersHeaders #row' + id + ' td:nth-child(1) div').html().replace(/-/g, '');
                    //var Farm = $('#fgrdInventoryUsersHeaders #row' + id + ' td:nth-child(5) div').html();
                    var FileName = $('#fgrdInventoryUsersHeaders #row' + id + ' td:nth-child(7) div').html();
                    var DateRec = $('#fgrdInventoryUsersHeaders #row' + id + ' td:nth-child(2) div').html();
                    $("#lblchoosenInventoryAWB").html(formatInventoryMAWBNumber(AWBNumber));

                    $(".inventoryawb").show();
                    $("#tdTransferReprint").show();

                    $("#fgrdInventoryUsersHeaders [id^=row]").removeClass("trSelectedHeader");
                    $("#fgrdInventoryUsersHeaders td.unsorted").addClass("sorted");
                    $("#fgrdInventoryUsersHeaders td.sorted").removeClass("unsorted");
                    $("#fgrdInventoryUsersHeaders #row" + id).addClass("trSelectedHeader");
                    $("#fgrdInventoryUsersHeaders #row" + id).removeClass("trSelected");
                    $("#fgrdInventoryUsersHeaders #row" + id + " td.sorted").addClass("unsorted");
                    $("#fgrdInventoryUsersHeaders #row" + id + " td.unsorted").removeClass("sorted");
                    if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {
                    UserFarmDetailsGridFilter = "Lot =" + AWBNumber + " and Daterec=ctod('" + DateRec + "')";
                }
                else {
                    UserFarmDetailsGridFilter = "Lot =" + AWBNumber + " and Daterec='" + DateRec + "'";
                }

                UserFarmDetailsGridTableName = FileName;
                if (IsInventoryUserFarmDetailsGridInitialize == false) {
                    InitializeInventoryUserFarmDetailsGrid();
                    IsInventoryUserFarmDetailsGridInitialize = true;
                }
                else {
                    $("#fgrdInventoryUserFarmDetails").empty();
                    $("#fgrdInventoryUserFarmDetails").flexOptions({ params: [{ name: 'Filter', value: UserFarmDetailsGridFilter }, { name: 'TableName', value: UserDetailsGridTableName }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                }
            }
        }
    },
    params: [
        { name: 'Filter', value: '' },
        { name: 'ExportCSV', value: '' }
    ],
    onError: function (xhr, status, errorThrown) {
        if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
            //window.location.href = "Login.aspx";
            $.MessageBox("OOPS!!! Please try after some time..");
        }
    }
});

    $("#DivInventoryUsersHeaders .pcontrol input").css("width", "40px")
    $("#DivInventoryUsersHeaders .btnseparator:eq(0)").hide();
    $("#DivInventoryUsersHeaders .pSearch").hide();
    $("#DivInventoryUsersHeaders .sDiv2").css("width", "290px");
    $("#DivInventoryUsersHeaders .pDiv2").css("width", "300px").css("margin-top", "3px");
    //$("#DivManualPOHeader .sDiv").css('float', 'left').css('width', '470px');
    //$('#DivManualPOHeader .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivInventoryUsersHeaders .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    $("#DivInventoryUsersHeaders .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //$("#DivInventoryUsersHeaders .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    $("#DivInventoryUsersHeaders .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    //if($("#fgrdInventoryUsersHeaders tr")
    //alert($("#fgrdInventoryUsersHeaders tr").length);
}

function InventoryUserHeaderRowClick(celDiv, id) {

    $(celDiv).click(function () {
        if (id != 0) {
            $("#InventoryHeaderID").html("");
            $("#InventoryHeaderID").html(id);
            $("#InventoryUserFarmDetailID").html("");
            var AWBNumber = $('#fgrdInventoryUsersHeaders #row' + id + ' td:nth-child(1) div').html().replace(/-/g, '');
            var Farm = $('#fgrdInventoryUsersHeaders #row' + id + ' td:nth-child(5) div').html();
            var FileName = $('#fgrdInventoryUsersHeaders #row' + id + ' td:nth-child(7) div').html();
            var DateRec = $('#fgrdInventoryUsersHeaders #row' + id + ' td:nth-child(2) div').html();
            $("#lblchoosenInventoryAWB").html(formatInventoryMAWBNumber(AWBNumber));
            $(".inventoryawb").show();
            $("#tdTransferReprint").show();
            $(".inventoryfarm").hide();
            $("#fgrdInventoryUsersHeaders [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdInventoryUsersHeaders td.unsorted").addClass("sorted");
            $("#fgrdInventoryUsersHeaders td.sorted").removeClass("unsorted");
            $("#fgrdInventoryUsersHeaders #row" + id).addClass("trSelectedHeader");
            $("#fgrdInventoryUsersHeaders #row" + id).removeClass("trSelected");
            $("#fgrdInventoryUsersHeaders #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdInventoryUsersHeaders #row" + id + " td.unsorted").removeClass("sorted");
            $("#DivInventoryUserFarmDetails").show();
            $("#DivInventoryUsersDetails").hide();
            if ('<%=ConfigurationManager.AppSettings("InventoryAndOrderReadFromSQL")%>' == "0") {
            UserFarmDetailsGridFilter = "Lot =" + AWBNumber + " and Daterec=ctod('" + DateRec + "')";
        }
        else {
            UserFarmDetailsGridFilter = "Lot =" + AWBNumber + " and Daterec='" + DateRec + "'";
        }

        UserFarmDetailsGridTableName = FileName;
        if (IsInventoryUserFarmDetailsGridInitialize == false) {
            InitializeInventoryUserFarmDetailsGrid();
            IsInventoryUserFarmDetailsGridInitialize = true;
        }
        else {
            $("#fgrdInventoryUserFarmDetails").empty();
            $("#fgrdInventoryUserFarmDetails").flexOptions({ params: [{ name: 'Filter', value: UserFarmDetailsGridFilter }, { name: 'TableName', value: UserFarmDetailsGridTableName }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
        }
    }
});
}

//VEN::30-Oct-2015::To Load User Farm Details Grid
function InitializeInventoryUserFarmDetailsGrid() {
    $("#fgrdInventoryUserFarmDetails").flexigrid({
        url: 'BloomService.asmx/GetInventoryUserFarmDetailsList',
        dataType: 'xml',
        colModel: [
            { display: 'Farm', name: 'Farm', width: 35, sortable: true, align: 'left', process: InventoryUserFarmDetailRowClick },
            { display: 'Pieces', name: 'TotalBoxes', width: 35, sortable: true, align: 'right', process: InventoryUserFarmDetailRowClick },
            { display: 'FBE', name: '', width: 35, sortable: false, align: 'right', process: InventoryUserFarmDetailRowClick },
            { display: 'AWB', name: 'LOT', width: 35, sortable: false, align: 'right', process: InventoryUserFarmDetailRowClick, hide: true },
            { display: 'Date', name: 'Date', width: 35, sortable: true, align: 'left', process: InventoryUserFarmDetailRowClick, hide: true },
            { display: 'FileName', name: '', width: 35, sortable: true, align: 'right', process: InventoryUserFarmDetailRowClick, hide: true },
            { display: '', name: '', width: 15, sortable: false, align: 'center' },
        ],
        searchitems: [
            { display: 'Farm', name: 'Farm' },
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
        height: $(window).height() - 305,
        width: 190,
        striped: true,
        onSuccess: function () {

            //For to show the error
            if ($("#fgrdInventoryUserFarmDetails tr#row-2").length > 0) {
                $("#fgrdInventoryUserFarmDetails tr#row-2").hide();
                $.MessageBox($("#fgrdInventoryUserFarmDetails tr#row-2")[0].innerText);
                return false;
            }
            $("#DivInventoryUserFarmDetails #ExportCSV").show();

            //$('#fgrdInventoryUserFarmDetails #row0 td:nth-child(1) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryUserFarmDetails #row0 td:nth-child(2) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryUserFarmDetails #row0 td:nth-child(3) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            $('#fgrdInventoryUserFarmDetails #row0').addClass("TotalRows")
            //$('.TotalRows>td>div').addClass("test")
            $("#fgrdInventoryUserFarmDetails .pcontrol input").css("width", "40px")
            $("#fgrdInventoryUserFarmDetails .btnseparator:eq(0)").hide();
            $("#fgrdInventoryUserFarmDetails .pSearch").hide();
            $("#fgrdInventoryUserFarmDetails .sDiv2").css("width", "290px");
            $("#fgrdInventoryUserFarmDetails .pDiv2").css("width", "300px");
            if ($("#InventoryUserFarmDetailID").html() != "0" && $("#InventoryUserFarmDetailID").html() != "" && $("#fgrdInventoryUserFarmDetails #row" + $("#InventoryUserFarmDetailID").html()).css('display') == "table-row") {
                var id = $("#InventoryUserFarmDetailID").html();
                var AWBNumber = $('#fgrdInventoryUserFarmDetails #row' + id + ' td:nth-child(5) div').html().replace(/-/g, '');
                var Farm = $('#fgrdInventoryUserFarmDetails #row' + id + ' td:nth-child(1) div').html();
                var FileName = $('#fgrdInventoryUserFarmDetails #row' + id + ' td:nth-child(6) div').html();
                $("#lblchoosenInventoryAWB").html(formatInventoryMAWBNumber(AWBNumber));
                $("#lblchoosenInventoryFarm").html(Farm);
                $(".inventoryawb").show();
                $("#tdTransferReprint").show();
                $(".inventoryfarm").show();
                $("#fgrdInventoryUserFarmDetails [id^=row]").removeClass("trSelectedHeader");
                $("#fgrdInventoryUserFarmDetails td.unsorted").addClass("sorted");
                $("#fgrdInventoryUserFarmDetails td.sorted").removeClass("unsorted");
                $("#fgrdInventoryUserFarmDetails #row" + id).addClass("trSelectedHeader");
                $("#fgrdInventoryUserFarmDetails #row" + id).removeClass("trSelected");
                $("#fgrdInventoryUserFarmDetails #row" + id + " td.sorted").addClass("unsorted");
                $("#fgrdInventoryUserFarmDetails #row" + id + " td.unsorted").removeClass("sorted");
                UserDetailsGridFilter = "Lot =" + AWBNumber + " and Farm='" + Farm + "'";
                UserDetailsGridTableName = FileName;
                if (IsInventoryUserDetailsGridInitialize == false) {
                    InitializeInventoryUserDetailsGrid();
                    IsInventoryUserDetailsGridInitialize = true;
                }
                else {
                    $("#fgrdInventoryUsersDetails").empty();
                    $("#fgrdInventoryUsersDetails").flexOptions({ params: [{ name: 'Filter', value: UserDetailsGridFilter }, { name: 'TableName', value: UserDetailsGridTableName }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
                }
            }
        },
        params: [
            { name: 'Filter', value: UserFarmDetailsGridFilter },
            { name: 'TableName', value: UserFarmDetailsGridTableName },
            { name: 'ExportCSV', value: '' }
        ],
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS!!! Please try after some time..");
            }
        }
    });

    $("#DivInventoryUserFarmDetails .pcontrol input").css("width", "40px")
    $("#DivInventoryUserFarmDetails .btnseparator:eq(0)").hide();
    $("#DivInventoryUserFarmDetails .pSearch").hide();
    $("#DivInventoryUserFarmDetails .sDiv2").css("width", "173px");
    $("#DivInventoryUserFarmDetails .sDiv2 input.qsbox").css('width', '94px');
    $("#DivInventoryUserFarmDetails .pDiv2").css('margin-left', '-39px');
    //$("#DivManualPOHeader .sDiv").css('float', 'left').css('width', '470px');
    //$('#DivManualPOHeader .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivInventoryUserFarmDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    $("#DivInventoryUserFarmDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //$("#DivInventoryUserFarmDetails .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    $("#DivInventoryUserFarmDetails .pDiv").find(".pDiv2").find(".pReload").show();
}

function InventoryUserFarmDetailRowClick(celDiv, id) {

    $(celDiv).click(function () {

        if (id != 0) {

            $("#InventoryUserFarmDetailID").html("");
            $("#InventoryUserFarmDetailID").html(id);

            var AWBNumber = $('#fgrdInventoryUserFarmDetails #row' + id + ' td:nth-child(5) div').html().replace(/-/g, '');
            var Farm = $('#fgrdInventoryUserFarmDetails #row' + id + ' td:nth-child(1) div').html();
            var FileName = $('#fgrdInventoryUserFarmDetails #row' + id + ' td:nth-child(6) div').html();

            $("#lblchoosenInventoryAWB").html(formatInventoryMAWBNumber(AWBNumber));
            $("#lblchoosenInventoryFarm").html(Farm);
            $(".inventoryawb").show();
            $(".inventoryfarm").show();
            $("#tdTransferReprint").show();
            $("#fgrdInventoryUserFarmDetails [id^=row]").removeClass("trSelectedHeader");
            $("#fgrdInventoryUserFarmDetails td.unsorted").addClass("sorted");
            $("#fgrdInventoryUserFarmDetails td.sorted").removeClass("unsorted");
            $("#fgrdInventoryUserFarmDetails #row" + id).addClass("trSelectedHeader");
            $("#fgrdInventoryUserFarmDetails #row" + id).removeClass("trSelected");
            $("#fgrdInventoryUserFarmDetails #row" + id + " td.sorted").addClass("unsorted");
            $("#fgrdInventoryUserFarmDetails #row" + id + " td.unsorted").removeClass("sorted");
            UserDetailsGridFilter = "Lot =" + AWBNumber + " and Farm='" + Farm + "'";
            UserDetailsGridTableName = FileName;
            $("#DivInventoryUsersDetails").show();
            if (IsInventoryUserDetailsGridInitialize == false) {
                InitializeInventoryUserDetailsGrid();
                IsInventoryUserDetailsGridInitialize = true;
            }
            else {
                $("#fgrdInventoryUsersDetails").empty();
                $("#fgrdInventoryUsersDetails").flexOptions({ params: [{ name: 'Filter', value: UserDetailsGridFilter }, { name: 'TableName', value: UserDetailsGridTableName }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
            }
        }
    });
}

//VEN::26-OCT-2015::To Load inventory User Header Grid
function InitializeInventoryUserDetailsGrid() {
    $("#fgrdInventoryUsersDetails").flexigrid({
        url: 'BloomService.asmx/GetInventoryUserDetailsList',
        dataType: 'xml',
        colModel: [
            { display: 'Delete', name: '', width: 25, sortable: true, align: 'left' },
            { display: 'Edit', name: '', width: 25, sortable: true, align: 'left' },
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
            { display: 'Type', name: 'InvenType', width: 15, sortable: true, align: 'left' },
            { display: 'Cust#', name: 'Cust', width: 25, sortable: true, align: 'left' },
            { display: 'Comments', name: 'Comments', width: 60, sortable: true, align: 'left' },
            { display: 'BoxNum', name: 'BoxNum', width: 35, sortable: true, align: 'left' },
            { display: 'PO#', name: 'PO', width: 80, sortable: true, align: 'left' },
            { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'left' },
            { display: 'AWB', name: 'Lot', width: 40, sortable: true, align: 'left', hide: true },
            { display: 'Date', name: 'DateRec', width: 40, sortable: true, align: 'left', hide: true },
            { display: 'Filename', name: 'Filename', width: 40, sortable: false, align: 'left', hide: true },
            { display: '', name: '', width: 15, sortable: false, align: 'center' },
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
        autoload: true,
        showTableToggleBtn: false,
        height: $(window).height() - 227,
        width: $(window).width() - 530,
        striped: true,
        onSuccess: function () {

            //For to show the error
            if ($("#fgrdInventoryUsersDetails tr#row-2").length > 0) {
                $("#fgrdInventoryUsersDetails tr#row-2").hide();
                $.MessageBox($("#fgrdInventoryUsersDetails tr#row-2")[0].innerText);
                return false;
            }

            $("#DivInventoryUsersDetails #ExportCSV").show();

            //$('#fgrdInventoryUsersDetails #row0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryUsersDetails #row0 td:nth-child(6) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryUsersDetails #row0 td:nth-child(8) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryUsersDetails #row0 td:nth-child(11) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdInventoryUsersDetails #row0 td:nth-child(13) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            $('#fgrdInventoryUsersDetails #row0').addClass("TotalRows")
            //$('.TotalRows>td>div').addClass("test")
        },
        params: [
            { name: 'Filter', value: UserDetailsGridFilter },
            { name: 'TableName', value: UserDetailsGridTableName },
            { name: 'ExportCSV', value: '' }
        ],
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS!!! Please try after some time..");
            }
        }
    });

    $("#DivInventoryUsersDetails .sDiv").css('float', 'left').css('width', '545px');
    $('#DivInventoryUsersDetails .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#DivInventoryUsersDetails .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    $("#DivInventoryUsersDetails .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //$("#DivInventoryUsersDetails .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    $("#DivInventoryUsersDetails .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

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
                $(this).closest('tr').find('input')[i].type != "hidden" && $(this).attr('id') != "txtQuantityReceived") {
                $(this).closest('tr').find('input')[i].focus();
                return false;
            }
            else if ($(this).attr('id') == "txtQuantityReceived") {
                $("#lstInventoryUOM").focus()
                return false;
            }
            else if ($(this).attr('id') == "lstInventoryUOM") {
                $("#txtInventoryUnitsPerBunch").focus()
                return false;
            }


            /*Enter key navigation for FixAWB process :: Created by Abinaya :: 10Jul2018*/
            else if ($(this).attr('id') == "txtInvOldAWB") {
                $("#txtInvOldWarehouse").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtInvOldWarehouse") {
                $("#txtInvOldFarm").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtInvOldFarm") {
                $("#txtInvOldProduct").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtInvOldProduct") {
                $("#txtInvOldBoxnum").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtInvOldBoxnum") {
                $("#txtInvNewAWB").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtInvNewAWB") {
                $("#txtInvNewWarehouse").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtInvNewWarehouse") {
                $("#txtInvNewFarm").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtInvNewFarm") {
                $("#txtInvNewRecDate").focus();
                return false;
            }
            else if ($(this).attr('id') == "txtInvNewRecDate") {
                if ($("#tblInvNewBoxSize").css('display') != "none") {
                    $("#txtInvNewCost").focus();
                    return false;
                }
                else {
                    $("#DialogFixAWB").siblings('.ui-dialog-buttonpane').find("button:contains('Change')").focus();
                    return false;
                }
            }

            else if (i == $(this).closest('tr').find('input').length - 1 && $(this).attr('id') != 'btndateok') {
                if ($(this).closest('tr').next('tr').find('input').length > 0) {

                    if ($(this).closest('tr').next('tr').find('input')[0].id != "txtInventoryBoxNumber")
                        $(this).closest('tr').next('tr').find('input')[0].focus();
                    else if ($(this).closest('tr').next('tr').find('input')[0].id == "txtInventoryBoxNumber") {
                        $("#txtInventoryOrderNo").focus()
                        return false;
                    }
                }
                else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0)
                    $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();
                else if ($(this).attr('id') == "txtBreakdown" || $(this).attr('id') == "txtInventoryComments" || $(this).attr('id') == "txtagency" || $(this).attr('id') == "txtInvNewCost")
                    $(this).closest('div').next('div').find('button')[0].focus()

                return false;
            }


        }

    }
});

function FramingInventoryFilter() {

    if ($("#DivInventoryBar").find('button.is-checked')[0].value == "inven") {

        if ($("#ctl00_DivLoggedInUserType").html().toLowerCase() == "warehouse") {
            $("#tdRackslabel").css("padding-top", "15 px")
            $("#tdRackslabel").show()
        }
        else {
            $("#tdRackslabel").css("padding-top", "0 px")
            $("#tdRackslabel").hide()
        }
        $("#tdTransferReprint").hide();
        AWBCtrl = "lstInventoryAWBFilter";
        FilterQuery = "";
        var InventoryAWBFilter = "";
        if ($('#' + AWBCtrl).val() != "All" && $('#' + AWBCtrl).val() != null)
            InventoryAWBFilter = "LOT =" + $('#' + AWBCtrl).val();

        //var InventoryDateFilter = "";
        //if ($("#lblInventorychosendate1").html() != "" && $("#lblInventorychosendate2").html() != "")
        //    InventoryDateFilter = "DATEREC >= ctod('" + $("#lblInventorychosendate1").html() + "')" + " And " + " DATEREC <= ctod('" + $("#lblInventorychosendate2").html() + "')";

        //if (InventoryAWBFilter != "" && InventoryDateFilter != "")
        //    FilterQuery = InventoryAWBFilter + " and " + InventoryDateFilter;
        //else if (InventoryAWBFilter != "" && InventoryDateFilter == "")
        //    FilterQuery = InventoryAWBFilter;
        //else if (InventoryAWBFilter == "" && InventoryDateFilter != "")
        //    FilterQuery = InventoryDateFilter;

        if (InventoryAWBFilter != "")
            FilterQuery = InventoryAWBFilter
        //   $("#fgrdInventoryHeader").empty();

        $("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: ReceivedPiecesOnly }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
    }
    else if ($("#DivInventoryBar").find('button.is-checked')[0].value == "invhist") {
        //if ($("#DivInventoryBar").find('button.is-checked')[0].value == "inven")
        //    AWBCtrl = "lstInventoryAWBFilter";
        //else if ($("#DivInventoryBar").find('button.is-checked')[0].value == "invhist")
        AWBCtrl = "lstInventoryHistoryAWBFilter";
        //$("#tdTransferReprint").show();
        FilterQuery = "";
        var InventoryAWBFilter = "";
        if ($('#' + AWBCtrl).val() != "All" && $('#' + AWBCtrl).val() != null)
            InventoryAWBFilter = "LOT =" + $('#' + AWBCtrl).val();

        var InventoryDateFilter = "";
        //if ($("#lblInventorychosendate1").html() != "" && $("#lblInventorychosendate2").html() != "")
        //    InventoryDateFilter = "DATEREC >= ctod('" + $("#lblInventorychosendate1").html() + "')" + " And " + " DATEREC <= ctod('" + $("#lblInventorychosendate2").html() + "')";

        if (InventoryAWBFilter != "" && InventoryDateFilter != "")
            FilterQuery = InventoryAWBFilter + " and " + InventoryDateFilter;
        else if (InventoryAWBFilter != "" && InventoryDateFilter == "")
            FilterQuery = InventoryAWBFilter;
        else if (InventoryAWBFilter == "" && InventoryDateFilter != "")
            FilterQuery = InventoryDateFilter;
        //   $("#fgrdInventoryHeader").empty();

        $("#fgrdInventoryHeader").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: '0' }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
    }
    //else if ($("#DivInventoryBar").find('button.is-checked')[0].value == "users") {
    //    FilterQuery = "";

    //    var InventoryDateFilter = "";
    //    if ($("#lblInventorychosendate1").html() != "" && $("#lblInventorychosendate2").html() != "")
    //        InventoryDateFilter = "DATEREC >= ctod('" + $("#lblInventorychosendate1").html() + "')" + " And " + " DATEREC <= ctod('" + $("#lblInventorychosendate2").html() + "')";
    //    if (InventoryDateFilter != "")
    //        FilterQuery = InventoryDateFilter;
    //    $("#fgrdInventoryUsersHeaders").empty();
    //    $("#fgrdInventoryUsersHeaders").flexOptions({ params: [{ name: 'Filter', value: FilterQuery }, { name: 'ExportCSV', value: "" }], query: "", newp: 1 }).flexReload();
    //}
}
//END

//Inventory Users Consolidate Start

//VEN::28-OCT-2015::To Load inventory User Consolidate Grid
function InitializeInventoryUserConsolidateGrid() {
    $("#fgrdInventoryUsersConsolidate").flexigrid({
        url: 'BloomService.asmx/GetInventoryUserConsolidateList',
        dataType: 'xml',
        colModel: [
            { display: 'Cat', name: 'Cat', width: 30, sortable: true, align: 'left' },
            { display: 'Flower', name: 'Flower', width: 70, sortable: true, align: 'left' },
            { display: 'Description', name: 'Name', width: 180, sortable: true, align: 'left' },
            { display: 'UOM', name: 'UOM', width: 90, sortable: true, align: 'left' },
            { display: 'Type', name: 'Type', width: 20, sortable: true, align: 'left' },
            { display: 'WH', name: 'WH', width: 20, sortable: true, align: 'left' },
            { display: 'Cust#', name: 'Cust', width: 30, sortable: true, align: 'left' },
            { display: 'AWB#', name: 'Lot', width: 80, sortable: true, align: 'left' },
            { display: 'Farm', name: 'Farm', width: 25, sortable: true, align: 'left' },
            { display: 'Comments', name: 'Comments', width: 50, sortable: true, align: 'left' },
            { display: 'User', name: '', width: 15, sortable: false, align: 'right' },
            { display: '+3', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+2', name: '', width: 15, sortable: true, align: 'right' },
            { display: '+1', name: '', width: 15, sortable: true, align: 'right' },
            { display: '0', name: '', width: 15, sortable: true, align: 'right' },
            { display: '1', name: '', width: 15, sortable: true, align: 'right' },
            { display: '2', name: '', width: 15, sortable: true, align: 'right' },
            { display: '3', name: '', width: 15, sortable: true, align: 'right' },
            { display: '4', name: '', width: 15, sortable: true, align: 'right' },
            { display: '5', name: '', width: 15, sortable: true, align: 'right' },
            { display: '6', name: '', width: 15, sortable: true, align: 'right' },
            { display: '7', name: '', width: 15, sortable: true, align: 'right' },
            { display: '8', name: '', width: 15, sortable: true, align: 'right' },
            { display: '9', name: '', width: 15, sortable: true, align: 'right' },
            { display: '10', name: '', width: 15, sortable: true, align: 'right' },
            { display: '11', name: '', width: 15, sortable: true, align: 'right' },
            { display: '12', name: '', width: 15, sortable: true, align: 'right' },
            { display: '13', name: '', width: 15, sortable: true, align: 'right' },
            { display: '14', name: '', width: 15, sortable: true, align: 'right' },
            { display: '15', name: '', width: 15, sortable: true, align: 'right' },
            { display: '16', name: '', width: 15, sortable: true, align: 'right' },
            { display: '17', name: '', width: 15, sortable: true, align: 'right' },
            { display: '18', name: '', width: 15, sortable: true, align: 'right' },
            { display: '19', name: '', width: 15, sortable: true, align: 'right' },
            { display: '20', name: '', width: 15, sortable: true, align: 'right' },
            { display: '21', name: '', width: 15, sortable: true, align: 'right' },
            { display: '22', name: '', width: 15, sortable: true, align: 'right' },
            { display: '23', name: '', width: 15, sortable: true, align: 'right' },
            { display: '24', name: '', width: 15, sortable: true, align: 'right' },
            { display: '25+', name: '', width: 15, sortable: true, align: 'right' },
        ],
        searchitems: [
            { display: 'Cat', name: 'Cat' },
            { display: 'Flower', name: 'Flower' },
            { display: 'Description', name: 'Name' },
            { display: 'Farm', name: 'Farm' },
            { display: 'Cust#', name: 'Cust' },
            { display: 'UOM', name: 'UOM' },
            { display: 'WH', name: 'WH' },
            { display: 'AWB#', name: 'Lot' },
            { display: 'Type', name: 'InvenType' },
            { display: 'User', name: 'USERFileNo' }
        ],
        showTableToggleBtn: true,
        sortname: "Cat",
        sortorder: "asc",
        usepager: true,
        title: false,
        useRp: true,
        qtype: "",
        //rp: 5000,
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        height: $(window).height() - 270,
        //height: $(window).height() - 260,
        width: $(window).width() - 10,
        striped: true,
        params: [
            { name: 'Filter', value: '' },
            { name: 'ConsolidateType', value: $("#DivConsolidateBar").find('button.is-checked')[0].value },
            { name: 'ExportCSV', value: '' }
        ],
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS!!! Please try after some time..");
            }
        },
        onSuccess: function () {
            $("#DivInventoryUsersConsolidate .flexigrid").css("min-width", "1356px");
            //For to show the error
            if ($("#fgrdInventoryUsersConsolidate tr#row-2").length > 0) {
                $("#fgrdInventoryUsersConsolidate tr#row-2").hide();
                $.MessageBox($("#fgrdInventoryUsersConsolidate tr#row-2")[0].innerText);
                return false;
            }

            $('#fgrdInventoryUsersConsolidate td:nth-child(14)').addClass('sorted');
            $("#DivInventoryUsersConsolidate #ExportCSV").show();


        }
    });

    //$("#DivInventoryUsersConsolidate .sDiv").css('float', 'left').css('width', '545px');
    //$('#DivInventoryUsersConsolidate .pDiv').css('padding', '2px').css('border-left', '0px');
    //$('#DivInventoryUsersConsolidate .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    ////$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    //$("#DivInventoryUsersConsolidate .pDiv").find(".pDiv2").find(".btnseparator").hide();
    ////$("#DivInventoryUsersConsolidate .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    //$("#DivInventoryUsersConsolidate .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
}
//END

//VEN::28-OCT-2015::To Load inventory Racks Grid
function InitializeInventoryRackDetailsGrid() {
    $("#fgrdInventoryRacks").flexigrid({
        url: 'BloomService.asmx/GetRackDetails',
        dataType: 'xml',
        colModel: [
            { display: 'Rack', name: 'Rack', width: 30, sortable: true, align: 'left' },
            { display: 'Farm', name: 'FarmCode', width: 25, sortable: true, align: 'left' },
            { display: 'BoxNum', name: 'BoxNum', width: 30, sortable: true, align: 'left' },
            { display: 'BarCode', name: 'BarCode', width: 70, sortable: true, align: 'left' },
            { display: 'Invoice', name: 'Invoice', width: 40, sortable: true, align: 'left' },
            { display: 'AWB#', name: 'Lot', width: 70, sortable: true, align: 'left' },
            { display: 'Order2Rec', name: 'Order2Rec', width: 50, sortable: true, align: 'left' },
            { display: 'ID', name: 'ID', width: 50, sortable: true, align: 'left' },
            { display: 'Carrier', name: 'Carrier', width: 30, sortable: true, align: 'left' },
            { display: 'ARBoxNo', name: 'ARBOXNO', width: 60, sortable: true, align: 'left' },
            { display: 'Consignee', name: 'CONSIGNEE', width: 50, sortable: true, align: 'left' },
            { display: 'BoxSize', name: 'BOXSIZE', width: 50, sortable: true, align: 'left' },
            { display: 'L', name: 'LENGHT', width: 20, sortable: true, align: 'left' },
            { display: 'W', name: 'WIDTH', width: 20, sortable: true, align: 'left' },
            { display: 'H', name: 'HEIGHT', width: 20, sortable: true, align: 'left' },
            { display: 'Product', name: 'PRODUCT', width: 100, sortable: true, align: 'left' },
            { display: 'CustPO', name: 'CUSTPO', width: 50, sortable: true, align: 'left' },
            { display: 'Name', name: 'InvProductName', width: 185, sortable: true, align: 'left' },
            { display: 'Gun', name: 'Gun', width: 30, sortable: true, align: 'left' },
            { display: 'OldRack', name: 'OldRack', width: 30, sortable: true, align: 'left' },
            { display: 'AddUser', name: 'AddUser', width: 40, sortable: true, align: 'left' },
            { display: 'AddDate', name: 'AddDate', width: 60, sortable: true, align: 'left' },
            { display: 'AddTime', name: 'AddTime', width: 45, sortable: true, align: 'left' },
            { display: 'AddApp', name: 'AddApp', width: 40, sortable: true, align: 'left' },
        ],
        searchitems: [
            { display: 'Rack', name: 'Rack' },
            { display: 'Farm', name: 'FarmCode' },
            { display: 'BoxNum', name: 'BoxNum' },
            { display: 'Invoice', name: 'Invoice' },
            { display: 'AWB#', name: 'Lot' },
            { display: 'BarCode', name: 'BarCode' },
            { display: 'Name', name: 'InvProductName' },
        ],
        showTableToggleBtn: true,
        sortname: "Rack",
        sortorder: "asc",
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
        height: $(window).height() - 260,
        width: $(window).width() - 10,
        striped: true,
        params: [
            { name: 'Filter', value: '' },
            { name: 'ExportCSV', value: '' }
        ],
        //buttons: [
        //    { name: 'Export', bclass: 'import', onpress: exportclicked },
        //],
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS!!! Please try after some time..");
            }
        },
        onSuccess: function () {
            //For to show the error
            if ($("#fgrdInventoryRacks tr#row-2").length > 0) {
                $("#fgrdInventoryRacks tr#row-2").hide();
                $.MessageBox($("#fgrdInventoryRacks tr#row-2")[0].innerText);
                return false;
            }
            $("#DivInventoryRacks #ExportCSV").show();
        }
    });


    //$("#DivInventoryRacks .sDiv").css('float', 'left').css('width', '545px');
    //$('#DivInventoryRacks .pDiv').css('padding', '2px').css('border-left', '0px');
    //$('#DivInventoryRacks .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    ////$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    //$("#DivInventoryRacks .pDiv").find(".pDiv2").find(".btnseparator").hide();
    ////$("#DivInventoryRacks .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    //$("#DivInventoryRacks .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();

    function exportclicked(com, grid) {

        $("#msg").html("Please wait, Preparing Report ... <img src='images/ajax-loader.gif' />");
        $("#msgbox-select").dialog("open");
        //var w = window.open('GeneratingPDF.html');
        var Query = $("#fgrdInventoryRacks").flexOptions()[0].p.query;
        var QueryType = $("#fgrdInventoryRacks").flexOptions()[0].p.qtype;
        var RP = $("#fgrdInventoryRacks").flexOptions()[0].p.rp;
        var Page = $("#fgrdInventoryRacks").flexOptions()[0].p.page;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/ExportRackDetailstoExcel',
            data: '{"qtype":"' + QueryType + '","query":"' + Query + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {

                if (output.d != "error") {
                    //$("#msgbox-select").dialog("close");
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                $("#msg").html("Your file is ready for download... <br/><br/><a style='padding-left:30px;' id='btnopenpdf' target='_blank' href='" + path + "'>Click Here</a> to download.");
                //w.location = path;
                //w.close();
            }
            else {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        }
    });
    }
}


/*
Muthu Nivetha M :: 19Mar2020 :: Modified :: To display the quick search to show the totalrows loaded on Pricing inventory
*/
function InitializeInventoryPricingGrid() {
    $("#fgrdInventoryPricing").flexigrid({
        url: 'BloomService.asmx/GetPricingDetail',
        dataType: 'xml',
        colModel: [
            { display: '<img style="Cursor:pointer; " id="selectall" src="images/check-off.png"/>', name: 'Selected', width: 20, sortable: false, align: 'center' },
            { display: 'WH', name: 'WH', width: 35, sortable: true, align: 'left', process: procMe },
            { display: 'AWB', name: 'AWB', width: 35, sortable: true, align: 'left', process: procMe },
            { display: 'FARM', name: 'FARM', width: 35, sortable: true, align: 'left', process: procMe },
            //{ display: 'Product', name: 'Product', width: 180, sortable: true, align: 'left' },
            { display: 'Cat', name: 'ProductCategory', width: 35, sortable: true, align: 'left', process: procMe },
            { display: 'Color', name: 'Color', width: 100, sortable: true, align: 'left', hide: true },
            { display: 'Variety', name: 'Variety', width: 130, sortable: true, align: 'left', hide: true },
            { display: 'DESCRIPTION', name: 'Productname', width: 180, sortable: true, align: 'left' },
            { display: 'QTY', name: 'QTY', width: 25, sortable: false, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 25, sortable: false, align: 'left' },
            { display: 'UNITS', name: 'UNITS', width: 30, sortable: false, align: 'right' },
            { display: 'A', name: 'A', width: 35, sortable: false, align: 'right' },
            { display: 'B', name: 'B', width: 35, sortable: false, align: 'right' },
            { display: 'C', name: 'C', width: 35, sortable: false, align: 'right' },
            { display: 'COST', name: 'COST', width: 25, sortable: false, align: 'right' },   //10Apr19 :: Abinaya :: George, Don't want to show cost column
            { display: 'FREIGHT', name: 'OTHERCOST', width: 40, sortable: false, align: 'right' },
            { display: 'HANDLING', name: 'HANDLING', width: 40, sortable: false, align: 'right' },
            { display: 'DUTY', name: 'ANDEAN', width: 40, sortable: false, align: 'right' },
            { display: 'LANDED', name: 'LANDED', width: 40, sortable: false, align: 'right' },
            { display: 'GPM%', name: 'GPM', width: 30, sortable: false, align: 'right' },
            { display: 'CUST', name: 'CUST', width: 30, sortable: false, align: 'right' },
            { display: 'HOLD', name: 'HOLD', width: 25, sortable: false, align: 'right' },
            { display: 'FLAG', name: 'FLAG', width: 25, sortable: true, align: 'left' },
            { display: 'BOXNUM', name: 'BOXNUM', width: 50, sortable: false, align: 'right' },
            { display: 'DAYS', name: 'Days', width: 25, sortable: false, align: 'right' },
            { display: 'SQLID', name: 'SqlID', width: 35, sortable: true, align: 'right', hide: CustomerUsingKomet },
            { display: 'SQLQTY', name: 'SQLQty', width: 40, sortable: true, align: 'right', hide: CustomerUsingKomet },
            { display: 'nPer0', name: 'nPer0', width: 40, sortable: true, align: 'right', hide: true },
            { display: 'nPer1', name: 'nPer1', width: 40, sortable: true, align: 'right', hide: true },
            { display: 'nPer2', name: 'nPer2', width: 40, sortable: true, align: 'right', hide: true },
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
            { display: '', name: '', width: 15, sortable: true, align: 'left' },
                { display: 'GRADE', name: 'GRADE', width: 40, sortable: true, align: 'right', hide: true },
        ],
        searchitems: [
            { display: 'Description', name: 'Productname' },
            { display: 'AWB', name: 'LOT' },
            { display: 'FARM', name: 'FARM' },
            { display: 'Product', name: 'FLOWER' },
            { display: 'Qty', name: 'Qty' },
            { display: 'Cat', name: 'ProductCategory' },
            //{ display: 'Color', name: 'Color' },
            //{ display: 'Variety', name: 'Variety' },
            { display: 'UOM', name: 'UOM' },
            { display: 'UNITS', name: 'UNITS' },
            { display: 'CUST', name: 'CUST' },
            { display: 'FLAG', name: 'FLAG' },
            { display: 'DAYS', name: 'DAYS' },
            { display: 'Warehouse', name: 'WH' },
            { display: 'BOXNUM', name: 'BOXNUM' },

        ],
        buttons: [
            { name: 'Update', bclass: 'Update', onpress: UpdatePrice },
            { name: 'ShowAll', bclass: 'ShowAll', onpress: ShowAll },
            { name: 'ReCalculate', bclass: 'ReCalc', onpress: CostRecalculate },
            { name: 'Release', bclass: 'Release', onpress: ReleaseClicked },
            { name: 'Auto Price', bclass: 'Release', onpress: InvPricingClicked }
        ],
        showTableToggleBtn: false,
        sortname: "ProductName",
        sortorder: "asc",
        usepager: true,
        title: false,
        useRp: true,
        rp: 15000,
        qtype: "",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        height: $(window).height() - 290,
        striped: true,
        onSuccess: function () {
            debugger;
            $("#divInventoryPricingFilters").show();
            //For to show the error
            if ($("#fgrdInventoryPricing tr#row-2").length > 0) {
                $("#fgrdInventoryPricing tr#row-2").hide();
                $.MessageBox($("#fgrdInventoryPricing tr#row-2")[0].innerText);
                return false;
            }
            gridFormat();
            GetInvenFlagsFromtbltype();

            $("#fgrdInventoryPricing tr").each(function () {
                var currentrowid = this.id.replace("row", "");

                var txtPriceA = $("#txtPriceA_" + currentrowid);
                highlightPriceForZeroValue(txtPriceA);
                var txtPriceB = $("#txtPriceB_" + currentrowid);
                highlightPriceForZeroValue(txtPriceB);
                var txtPriceC = $("#txtPriceC_" + currentrowid);
                highlightPriceForZeroValue(txtPriceC);
            });

            if ($('#lstCategoryFilterForInventoryPricingList option').length <= 0) {
                $('#lstCategoryFilterForInventoryPricingList').empty();
                $('#lstCategoryFilterForInventoryPricingList').append('<option value="">Select Category</option>');
                var CategoryList = []
                $("#fgrdInventoryPricing tr").each(function () {
                    var currentrowid = this.id.replace("row","");
                    var Category = $("#invenCAT_" + currentrowid).html() == null ? "" : $("#invenCAT_" + currentrowid).html();
                    if (CategoryList.indexOf(Category) == -1 && Category.trim() != "") {
                        CategoryList.push(Category)
                    }
                });

                CategoryList.sort((a, b) =>a.localeCompare(b));
                $.each(CategoryList, function (i, item) {
                    $('#lstCategoryFilterForInventoryPricingList').append('<option value="' + item + '">' + item + '</option>');
                })
            }
            if ($('#lstColorFilterForInventoryPricingList option').length <= 0) {
                $('#lstColorFilterForInventoryPricingList').empty();
                $('#lstColorFilterForInventoryPricingList').append('<option value="">Select Color</option>');
                var ColorList = []
                $("#fgrdInventoryPricing tr").each(function () {
                    var currentrowid = this.id.replace("row","");
                    var Color = $("#invenColor_" + currentrowid).html() == null ? "" : $("#invenColor_" + currentrowid).html();
                    if (ColorList.indexOf(Color) == -1 && Color.trim() != "") {
                        ColorList.push(Color)
                    }
                });

                ColorList.sort((a, b) =>a.localeCompare(b));
                $.each(ColorList, function (i, item) {
                    $('#lstColorFilterForInventoryPricingList').append('<option value="' + item + '">' + item + '</option>');
                })
            }
            if ($('#lstVarietyFilterForInventoryPricingList option').length <= 0) {
                $('#lstVarietyFilterForInventoryPricingList').empty();
                $('#lstVarietyFilterForInventoryPricingList').append('<option value="">Select Variety</option>');
                var VarietyList = []
                $("#fgrdInventoryPricing tr").each(function () {
                    var currentrowid = this.id.replace("row","");
                    var Variety = $("#invenVariety_" + currentrowid).html() == null ? "" : $("#invenVariety_" + currentrowid).html();
                    if (VarietyList.indexOf(Variety) == -1 && Variety.trim() != "") {
                        
                        VarietyList.push(Variety)
                    }
                });
                VarietyList.sort((a, b) =>a.localeCompare(b));
                $.each(VarietyList, function (i, item) {
                    $('#lstVarietyFilterForInventoryPricingList').append('<option value="' + item + '">' + item + '</option>');
                })

            }
            if ($('#lstGradeFilterForInventoryPricingList option').length <= 0) {
                $('#lstGradeFilterForInventoryPricingList').empty();
                $('#lstGradeFilterForInventoryPricingList').append('<option value="">Select Grade</option>');
                var GradeList = []
                $("#fgrdInventoryPricing tr").each(function () {
                    var currentrowid = this.id.replace("row","");
                    var Grade = $("#invenGrade_" + currentrowid).html() == null ? "" : $("#invenGrade_" + currentrowid).html();
                    if (GradeList.indexOf(Grade) == -1 && Grade.trim() != "") {
                        GradeList.push(Grade)
                    }
                });

                GradeList.sort((a, b) =>a.localeCompare(b));
                $.each(GradeList, function (i, item) {
                    $('#lstGradeFilterForInventoryPricingList').append('<option value="' + item + '">' + item + '</option>');
                })
            }
            if ($('#lstWarehouseFilterForInventoryPricingList option').length <= 0) {

                $('#lstWarehouseFilterForInventoryPricingList').empty();
                $('#lstWarehouseFilterForInventoryPricingList').append('<option value="0">Select warehouse</option>');
                var WHList = []
                $("#fgrdInventoryPricing tr").each(function () {

                    var currentrowid = this.id.replace("row","");
                    var WH = $("#invenWH_" + currentrowid).html() == null ? "" : $("#invenWH_" + currentrowid).html();
                    if (WHList.indexOf(WH) == -1) {
                        WHList.push(WH)
                    }
                });

                WHList.sort((a, b) =>a.localeCompare(b));
                $.each(WHList, function (i, item) {
                    $('#lstWarehouseFilterForInventoryPricingList').append('<option value="' + item + '">' + item + '</option>');
                })
            }



        },
        params: [
            { name: 'Filter', value: '' },
            { name: 'ExportCSV', value: '' }
        ],
    });
    $("#DivInventoryPricing #ExportCSV").show();
    $("#DivInventoryPricing .sDiv").css('float', 'left').css('width', '545px');
    $('#DivInventoryPricing .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    $("#DivInventoryPricing .pDiv").find(".pDiv2").find(".btnseparator").hide();
    $("#DivInventoryPricing .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    //$('#DivInventoryPricing .pDiv').find('.pDiv2').find('.pGroup').children(1).not('.pReload').hide();

    }

function highlightPriceForZeroValue(txtPrice) {
    if (txtPrice) {
        if ((txtPrice.text() == '0' || txtPrice.text() == '0.0' || txtPrice.text() == '0.00')) {
            txtPrice.parent().parent().css("background-color", "red");
            txtPrice.parent().parent().css("color", "white");
        } else {
            txtPrice.parent().parent().css("background-color", "");
            txtPrice.parent().parent().css("color", "");
        }
    }
}
//END


// Muthu Nivetha M :: 28Feb2020 :: Modified :: To set PriceA, Calculate GPM,PriceB&C on PriceA focusout
$("[id^=editPriceA_").focusout().live('focusout', function () {

    var sourceCtl = $(this);
    EditCtrlofPrices(sourceCtl, 'PriceA');
});

//Muthu Nivetha M :: 28Feb2020 :: Changed calc as per jose's requirement priceb should be landedcost*priceb% same with pricec
function CalculatePriceBandPriceCByPriceA(PriceA, SelectedId, isForPriceB, isForPriceC) {
    debugger;
    var priceA = PriceA;
    var GPM = 0, LandedCost = 0, nPer0 = 0, nPer1 = 0, nPer2 = 0, actualPriceA = 0;
    LandedCost = $("#fgrdInventoryPricing tr#row" + SelectedId + " td:eq(18)")[0].innerText;
    nPer0 = $("#fgrdInventoryPricing tr#row" + SelectedId + " td:eq(27)")[0].innerText;
    nPer1 = $("#fgrdInventoryPricing tr#row" + SelectedId + " td:eq(28)")[0].innerText;
    nPer2 = $("#fgrdInventoryPricing tr#row" + SelectedId + " td:eq(29)")[0].innerText;
    
    if (priceA == "0.00" || priceA == "NaN") {
        actualPriceA = LandedCost * nPer0;
        priceA = actualPriceA;
        setValuestoTextboxonGrid(SelectedId, parseInt(11), actualPriceA, 2, 'input[type=text]'); //priceA
        setValuestoTextboxonGrid(SelectedId, parseInt(12), 0, 2, 'input[type=text]'); //priceB
        setValuestoTextboxonGrid(SelectedId, parseInt(13), 0, 2, 'input[type=text]'); //priceC
    } else {
        actualPriceA = priceA;
    }
    //console.log("nPer0: " + nPer0)
    //console.log("LandedCost: " + LandedCost)
    //console.log("actualPriceA: " + actualPriceA)
    //console.log("Calculated GPM: " + (((parseFloat(actualPriceA).toFixed(3) - parseFloat(LandedCost).toFixed(3)) / parseFloat(actualPriceA).toFixed(3)) * 100))

    //Calculating GPM & PriceB by PriceA
    if (isForPriceB) {
        //GPM
        var isvaliddivident = false;
        if (parseFloat(priceA).toFixed(2) == parseFloat(actualPriceA).toFixed(2)) {
            isvaliddivident = notZero(parseFloat(actualPriceA).toFixed(3));
            if (isvaliddivident) {
                GPM = (((parseFloat(actualPriceA).toFixed(3) - parseFloat(LandedCost).toFixed(3)) / parseFloat(actualPriceA).toFixed(3)) * 100)
            }
            else { GPM = 0; }
        }
        else {
            isvaliddivident = notZero(parseFloat(priceA).toFixed(3));
            if (isvaliddivident) {
                GPM = (((parseFloat(priceA).toFixed(3) - parseFloat(LandedCost).toFixed(3)) / parseFloat(priceA).toFixed(3)) * 100)
            }
            else { GPM = 0; }
        }
        if (isNaN(GPM)) {
            GPM = 0;
        }
        setValuestoTextboxonGrid(SelectedId, parseInt(19), GPM, 1, 'a');

        //PriceB
        if (priceA == "0.00" || priceA == "NaN") {
            setValuestoTextboxonGrid(SelectedId, parseInt(12), 0, 2, 'input[type=text]');
        }
        else {

            var priceB = 0;
            priceB = $("#editPriceB_" + SelectedId + "").val() == "" ? $("#editPriceB_" + SelectedId + "").attr('placeholder') : $("#editPriceB_" + SelectedId + "").val();
            if (priceB == "0.00") {
                priceB = (LandedCost) * (nPer1);
            }
            setValuestoTextboxonGrid(SelectedId, parseInt(12), priceB, 2, 'input[type=text]');
        }
    }

    //Calculating PriceC by PriceA
    if (isForPriceC) {
        if (priceA == "0.00") {
            setValuestoTextboxonGrid(SelectedId, parseInt(13), 0, 2, 'input[type=text]');
        }
        else {
            var priceC = 0;
            priceC = $("#editPriceC_" + SelectedId + "").val() == "" ? $("#editPriceC_" + SelectedId + "").attr('placeholder') : $("#editPriceC_" + SelectedId + "").val();
            if (priceC == "0.00") {
                priceC = (LandedCost) * (nPer2);
            }
            setValuestoTextboxonGrid(SelectedId, parseInt(13), priceC, 2, 'input[type=text]');
        }
    }
}

function procMe(celDiv, id) {
    $(celDiv).click(function () {
        //alert(id);
    });
}
function ShowAll(com, grid) {
    $("#fgrdInventoryPricing").flexOptions({ params: [{ name: 'Filter', value: "ALL" }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
}
var nextRow = "";
function gridFormat() {
    //For to show the error
    //if ($("#fgrdInventoryPricing tr#row-2").length > 0) {
    //    $("#fgrdInventoryPricing tr#row-2").hide();
    //    $.MessageBox($("#fgrdInventoryPricing tr#row-2")[0].innerText);
    //    return false;
    //}

    //For to focus the next Textbox on enter key press
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
                    //$(this).closest('tr').find('input')[i].value = "";
                    $(this).closest('tr').find('input')[i].focus();
                    return false;
                }
                else if (i == $(this).closest('tr').find('input').length - 1) {

                    if ($(this).closest('tr').next('tr').find('input').length > 0 && $(this).closest('tr').next('tr').find('input')[0].style.display != 'none') {
                        //$(this).closest('tr').next('tr').find('input')[0].value = "";
                        $(this).closest('tr').next('tr').find('input')[0].focus();
                    }
                    else if ($(this).closest('tr').next('tr').next('tr').find('input').length > 0 && $(this).closest('tr').next('tr').next('tr').find('input')[0].style.display != 'none') {
                        //$(this).closest('tr').next('tr').next('tr').find('input')[0].value = "";
                        $(this).closest('tr').next('tr').next('tr').find('input')[0].focus();
                    }
                    else if ($(this).closest('tr').closest('table').parents('tr').next(tr).find('input').length > 0) {
                        //$(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].value = "";
                        $(this).closest('tr').closest('table').parents('tr').next(tr).find('input')[0].focus();
                    }
                    else if (i == $(this).closest('tr').find('input').length - 1) {
                        /*Update Pricing details while enter last input field :: 19Jan2018*/
                        // UpdatePrice('Update', $(this));
                    }
                    return false;
                }
            }
        }
    });
}
function ResetFields() {
    $("[id ^= ]").attr("src", "images/check-off.png");
}

$("[id^=teselect_]").die('click').live("click", function (e) {

    var sourceCtl = $(this);
    var ID = sourceCtl.attr('id');
    var img = sourceCtl.attr("src").toLowerCase();

    var getIdOnly = sourceCtl.attr('id').split('_')[1];
    var priceA = $("#fgrdInventoryPricing tr#row" + getIdOnly + " td:eq(11)")[0].innerText;
    if (parseFloat(priceA).toFixed(2) == "0.00" || priceA == "NaN") {
        CalculatePriceBandPriceCByPriceA(parseFloat(priceA).toFixed(2), getIdOnly, false, false);
    }

    var headers = ID.split('_');
    var Selected = "0";
    if (img.indexOf("off") > 0) {
        Selected = "1";
    }
    if (Selected == "1") {
        sourceCtl.prop("src", "images/check-on.png");
        sourceCtl.closest('tr').addClass("trChecked");
        $('#fgrdInventoryPricing tr#row0').removeClass("trChecked");
        $("#txtPriceA_" + headers[1]).hide();
        $("#editPriceA_" + headers[1]).show();

        $("#txtPriceB_" + headers[1]).hide();
        $("#editPriceB_" + headers[1]).show();
        $("#txtPriceC_" + headers[1]).hide();
        $("#editPriceC_" + headers[1]).show();

        $("#txtCustNum_" + headers[1]).hide();
        $("#editCustNum_" + headers[1]).show();
        $("#txtCsHold_" + headers[1]).hide();
        $("#editCsHold_" + headers[1]).show();
        $("#txtFlag_" + headers[1]).hide();
        $("#editFlag_" + headers[1]).show();

        $("#txtPriceB_" + headers[1]).hide();
        $("#editPriceB_" + headers[1]).show();
        $("#txtPriceC_" + headers[1]).hide();
        $("#editPriceC_" + headers[1]).show();

        $("#editPriceA_" + headers[1]).focus();
    }
    else {
        sourceCtl.prop("src", "images/check-off.png");
        $("[id ^= selectall]").attr("src", "images/check-off.png");
        sourceCtl.closest('tr').removeClass("trChecked");
        $("#txtPriceA_" + headers[1]).show();
        $("#editPriceA_" + headers[1]).hide();
        $("#txtPriceB_" + headers[1]).show();
        $("#editPriceB_" + headers[1]).hide();
        $("#txtPriceC_" + headers[1]).show();
        $("#editPriceC_" + headers[1]).hide();

        $("#txtCustNum_" + headers[1]).show();
        $("[#editCustNum_" + headers[1]).hide();

        $("#txtCsHold_" + headers[1]).show();
        $("#editCsHold_" + headers[1]).hide();

        $("#txtFlag_" + headers[1]).show();
        $("#editFlag_" + headers[1]).hide();
    }
    var count = 0;
    var PoKey = "";
    var Ord = "";
    var ID = "";
    $("[id^=teselect_]:visible").each(function () {
        if ($(this)[0].src.indexOf("images/check-on.png") >= 0) {
            ID = $(this)[0].id;
            count = count + 1;
            PoKey = $(this)[0].id.split("_")[1].toString();
            //Ord = $(this)[0].id.split("_")[2].toString();
        }
    });
});

$("#selectall").die('click').live("click", function (e) {
    var sourceCtl = $(this);
    var img = sourceCtl.attr("src").toLowerCase();
    var Selected = "0";
    if (img.indexOf("off") > 0) {
        Selected = "1";
    }
    //$("#ResetID").html("0");

    $("#msgbox-select").dialog("close");
    if (Selected == "1") {
        sourceCtl.prop("src", "images/check-on.png");
        $('#fgrdInventoryPricing tr:visible').addClass("trChecked");
        $('#fgrdInventoryPricing tr#row0').removeClass("trChecked");
        $("[id^=teselect_]:visible").prop("src", "images/check-on.png");
        $("[id^=txtPriceA_]").hide();
        $("[id^=txtPriceA_0_]").show();
        $("[id^=editPriceA_]").show();
        $("[id^=txtPriceB_]").hide();
        $("[id^=editPriceB_]").show();
        $("[id^=txtPriceC_]").hide();
        $("[id^=editPriceC_]").show();

        $("[id^=txtCustNum_]").hide();
        $("[id^=editCustNum_]").show();

        $("[id^=txtCsHold_]").hide();
        $("[id^=editCsHold_]").show();

        $("[id^=txtFlag_]").hide();
        $("[id^=editFlag_]").show();

        $("[id^=editPriceA_]")[0].focus();
    }
    else {
        sourceCtl.prop("src", "images/check-off.png");
        $('#fgrdInventoryPricing tr').removeClass("trChecked");

        $("[id^=teselect_]").prop("src", "images/check-off.png");
        $("[id^=txtPriceA_]").show();
        $("[id^=editPriceA_]").hide();
        $("[id^=editPriceA_0_]").hide();
        $("[id^=txtPriceB_]").show();
        $("[id^=editPriceB_]").hide();

        $("[id^=txtPriceC_]").show();
        $("[id^=editPriceC_]").hide();

        $("[id^=txtCustNum_]").show();
        $("[id^=editCustNum_]").hide();

        $("[id^=txtCsHold_]").show();
        $("[id^=editCsHold_]").hide();

        $("[id^=txtFlag_]").show();
        $("[id^=editFlag_]").hide();
    }
});

function CostRecalculate() {
    $("#ImgProcessing").show();
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/RecalculateInventoryPricing',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            $("#ImgProcessing").hide();
            if (output.d == "Success") {
                //$.MessageBox("Cost Recalculated Successfully");
                $("#fgrdInventoryPricing").flexReload({ url: '/url/for/refresh' });
            }
            else {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        }
    });
}

function UpdatePrice(com, grid) {
    var PricingDetails = "";
    var UpdateBreak = false;
    PricingDetails = "<PDetails>"
    $('#fgrdInventoryPricing tr').each(function () {
        if ($(this).attr("id") != "row0") {
            if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                var ID = this.id.replace("row","");
                if ($("#editPriceA_" + ID).val() == "")
                    $("#editPriceA_" + ID).val($("#editPriceA_" + ID).attr("placeholder"));
                if ($("#editPriceB_" + ID).val() == "")
                    $("#editPriceB_" + ID).val($("#editPriceB_" + ID).attr("placeholder"));
                if ($("#editPriceC_" + ID).val() == "")
                    $("#editPriceC_" + ID).val($("#editPriceC_" + ID).attr("placeholder"));

                //if ($("#PriceB_" + ID).html() == "")
                //    $("#PriceB_" + ID).html($("#PriceB_" + ID).attr("placeholder"));
                //if ($("#PriceC_" + ID).html() == "")
                //    $("#PriceC_" + ID).html($("#PriceC_" + ID).attr("placeholder"));

                if ($("#editCustNum_" + ID).val() == "")
                    $("#editCustNum_" + ID).val($("#editCustNum_" + ID).attr("placeholder"));
                if ($("#editCsHold_" + ID).val() == "")
                    $("#editCsHold_" + ID).val($("#editCsHold_" + ID).attr("placeholder"));

                if ($("#editFlag_" + ID).val() == "") {
                    var curentflag = $("#editFlag_" + ID).attr("placeholder");
                    curentflag = (curentflag != undefined || curentflag != "" ? curentflag.trim().toString().toLowerCase() : "");
                    $("#editFlag_" + ID).val(curentflag.toUpperCase());
                }

                PricingDetails += "<PDetail>" +
                    "<ID>" + ID + "</ID>" +
                    "<PriceA>" + $("#editPriceA_" + ID).val() + "</PriceA>" +
                    "<PriceB>" + $("#editPriceB_" + ID).val() + "</PriceB>" +
                    "<PriceC>" + $("#editPriceC_" + ID).val() + "</PriceC>" +
                    "<CustNo>" + $("#editCustNum_" + ID).val() + "</CustNo>" +
                    "<Hold>" + $("#editCsHold_" + ID).val() + "</Hold>" +
                    "<Flag>" + $("#editFlag_" + ID).val().toUpperCase() + "</Flag>" +
                    "</PDetail>";
            }
        }
    });
    PricingDetails += "</PDetails>"
    if (PricingDetails != "<PDetails></PDetails>" && UpdateBreak == false) {
        $("#ImgProcessing").show();
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/UpdateInventoryPricing',
            data: "{'Details':'" + PricingDetails + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {
                $("#ImgProcessing").hide();
                if (output.d == "success") {
                    $('#fgrdInventoryPricing tr').each(function () {
                        if ($(this).attr("id") != "row0") {
                            if ($(this).find("td div").eq(0)[0].childNodes[0].src.indexOf("images/check-on.png") >= 0) {
                                var ID = this.id.replace("row","");
                                $("#txtPriceA_" + ID).html($("#editPriceA_" + ID).val())
                                $("#txtPriceB_" + ID).html($("#editPriceB_" + ID).val());
                                $("#txtPriceC_" + ID).html($("#editPriceC_" + ID).val());
                                $("#txtCustNum_" + ID).html($("#editCustNum_" + ID).val());
                                $("#txtCsHold_" + ID).html($("#editCsHold_" + ID).val());
                                $("#txtFlag_" + ID).html($("#editFlag_" + ID).val().toUpperCase());
                                $("#editPriceA_" + ID).attr("placeholder", $("#editPriceA_" + ID).val());
                                $("#editPriceB_" + ID).attr("placeholder", $("#editPriceB_" + ID).val());
                                $("#editPriceC_" + ID).attr("placeholder", $("#editPriceC_" + ID).val());
                                $("#editCustNum_" + ID).attr("placeholder", $("#editCustNum_" + ID).val());
                                $("#editCsHold_" + ID).attr("placeholder", $("#editCsHold_" + ID).val());
                                $("#editFlag_" + ID).attr("placeholder", $("#editFlag_" + ID).val().toUpperCase());
                                //$("#PriceB_" + ID).attr("placeholder", $("#PriceB_" + ID).html());
                                //$("#PriceC_" + ID).attr("placeholder", $("#PriceC_" + ID).html());
                                $("#editPriceA_" + ID).val("");
                                $("#editPriceB_" + ID).val("");
                                $("#editPriceC_" + ID).val("");
                                //$("#PriceB_" + ID).html("");
                                //$("#PriceC_" + ID).html("");
                                $("#editCustNum_" + ID).val("");
                                $("#editCsHold_" + ID).val("");
                                $("#editFlag_" + ID).val("");
                                if ($("#fgrdInventoryPricing .trChecked:last").next("tr").attr("id") == undefined) {
                                    nextRow = $("#fgrdInventoryPricing tr")[0].id.replace('row', '');
                                }
                                else {
                                    nextRow = $("#fgrdInventoryPricing .trChecked:last").next("tr").attr("id").replace("row", "");
                                }

                                var txtPriceA = $("#txtPriceA_" + ID);
                                highlightPriceForZeroValue(txtPriceA);
                                var txtPriceB = $("#txtPriceB_" + ID);
                                highlightPriceForZeroValue(txtPriceB);
                                var txtPriceC = $("#txtPriceC_" + ID);
                                highlightPriceForZeroValue(txtPriceC);
                            }
                        }
                    });
                    $("img#selectall").prop("src", "images/check-off.png");
                    $("[id ^= teselect_]").attr("src", "images/check-off.png");
                    $('#fgrdInventoryPricing tr').removeClass("trChecked");
                    $("[id^=teselect_]").prop("src", "images/check-off.png");
                    $("[id^=txtPriceA_]").show();
                    $("[id^=editPriceA_]").hide();
                    $("[id^=txtPriceB_]").show();
                    $("[id^=editPriceB_]").hide();
                    $("[id^=txtPriceC_]").show();
                    $("[id^=editPriceC_]").hide();
                    $("[id^=txtCustNum_]").show();
                    $("[id^=editCustNum_]").hide();
                    $("[id^=txtCsHold_]").show();
                    $("[id^=editCsHold_]").hide();
                    $("[id^=txtFlag_]").show();
                    $("[id^=editFlag_]").hide();
                    $("[id^=editPriceA_0_]").hide();
                    $("[id ^= teselect_]").attr("src", "images/check-off.png");
                    $("#fgrdInventoryPricing row" + nextRow).addClass("trChecked");
                    $("#teselect_" + nextRow).trigger("click");
                }
                else
                    $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
    }
    else if (PricingDetails == "<PDetails></PDetails>" && UpdateBreak == false) {
        $.MessageBox("Please choose details to update!!!");
    }
    else if (PricingDetails != "<PDetails></PDetails>" && UpdateBreak == true) {
        $.MessageBox("Invalid Conf!!");
    }
}

//STA::28-OCT-2015::to edit the Inventory User Details
$("[id^=editInventoryUserdetail_]").die("click").live("click", function (e) {

    var EdtInvId = $(this)[0].id.replace("editInventoryUserdetail_", "");
    var tableName = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(21)")[0].textContent;
    var Awb = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(20)")[0].textContent;
    var farm = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(2)")[0].textContent;
    var flower = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(3)")[0].textContent;
    var boxnumber = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(16)")[0].textContent;

    $("#InventoryFarm").html("");
    $("#InventoryAWB").html("");
    $("#InventoryAWB").html(Awb);
    $("#InventoryFarm").html(farm);
    $("#InventoryDetailID").html(EdtInvId);
    $("#InventoryUserTableName").html("");
    $("#InventoryUserTableName").html(tableName);
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetInventoryUserDetailForEdit',
        data: '{"Lot":"' + Awb + '","Farm":"' + farm + '","Flower":"' + flower + '","BoxNumber":"' + boxnumber + '","tableName":"' + tableName + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {

            var InvenDetailData = output.d;
            var InvenFlowerCode = InvenDetailData.FlowerDetails.Flower;
            var InvenFarmCode = InvenDetailData.Farm;
            //$("#txtInventoryFlowerDesc").val(InvenDetailData.FlowerDetails.Name);
            $("#txtInventoryInvoice").val("");
            $("#txtInventoryInvoice").attr("Placeholder", InvenDetailData.Invoice);
            $("#txtInventoryPO").val("");
            $("#txtInventoryPO").attr("Placeholder", InvenDetailData.PO);
            $("#txtQuantityReceived").val("");
            $("#txtQuantityReceived").attr("Placeholder", InvenDetailData.CSREC);
            $("#txtQuantitySold").val("");
            $("#txtQuantitySold").attr("Placeholder", InvenDetailData.CSSOLD);
            $("#hfInventoryUOM").val("");
            $("#DivInventoryFlowerColorCode").html(InvenDetailData.FlowerDetails.ColorCode);
            LoadInventoryUOM();


            $("#txtInventoryUnits").val("");
            $("#txtInventoryUnits").attr("Placeholder", InvenDetailData.TotalUnits);
            $("#txtInventoryUnitsPerBunch").val("");
            $("#txtInventoryUnitsPerBunch").attr("Placeholder", InvenDetailData.UnitsBunch);
            $("#txtInventoryUnitsPerBox").val("");
            $("#txtInventoryUnitsPerBox").attr("Placeholder", InvenDetailData.Units);

            $("#txtInventoryCostPerUnit").val("");
            $("#txtInventoryCostPerUnit").attr("Placeholder", InvenDetailData.Cost);
            $("#txtInventoryType").val("");
            $("#txtInventoryType").attr("Placeholder", InvenDetailData.InvenType);
            $("#txtInventoryComments").val(InvenDetailData.Comments);
            $("#txtInventoryCustNo").val("");
            $("#txtInventoryCustNo").attr("Placeholder", InvenDetailData.CustNum);
            $("#txtInventoryOrderNo").val("");
            $("#txtInventoryOrderNo").attr("Placeholder", InvenDetailData.OrderNumber);
            $("#txtInventoryBoxNumber").attr("disabled", true);
            $("#txtInventoryBoxNumber").val("");
            $("#txtInventoryBoxNumber").attr("Placeholder", InvenDetailData.BoxNumber);

            $("#DivInventoryFlowerCategory").html(InvenDetailData.FlowerDetails.CAT);
            $("#txtInventoryUnitsPerBunch").trigger('change');
            //$("#hfInventoryFlower").val(InvenDetailData.FlowerDetails.Flower.trim() + '~' + InvenDetailData.FlowerDetails.Name.trim() + '~' + InvenDetailData.FlowerDetails.CAT.trim() + '~' + InvenDetailData.FlowerDetails.ColorCode.trim());
            $("#hfInventoryFlower").val(InvenDetailData.FlowerDetails.Flower.trim());

            //from Email :: ANITHA :: INVENTORY :: add new table for Type in SQL
            $("#hfInventoryType").val(InvenDetailData.Type);
            LoadInventoryType();
            //from Email :: ANITHA :: INVENTORY :: add new table for InvenType in SQL
            $("#hfInventoryInvenType").val(InvenDetailData.InvenType);
            $("#hfInventoryWarehouse").val(InvenDetailData.WH);
            LoadInventoryInvenType();
            LoadWarehouse()
            $("#DivInventoryPODetails").dialog("open");
            $("#DivInventoryPODetails").dialog('option', 'title', "Edit Detail :: " + ($("#lblchoosenInventoryAWB").html().replace(/-/g, '') + "-" + InvenFarmCode + "-" + InvenFlowerCode));

            // LoadInventoryFlowers();
        }
    });
});

//STA::28-OCT-2015::to delete the Inventory User Details
$("[id^=deleteInventoryUserdetail_]").die("click").live("click", function (e) {

    var EdtInvId = $(this)[0].id.replace("deleteInventoryUserdetail_", "");
    var tableName = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(21)")[0].textContent;
    var Awb = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(20)")[0].textContent;
    var farm = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(2)")[0].textContent;
    var flower = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(3)")[0].textContent;
    var boxnumber = $("#fgrdInventoryUsersDetails tr#row" + EdtInvId + " td:eq(16)")[0].textContent;

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/DeleteInventoryUserDetails',
        data: '{"TableName":"' + tableName + '","Farm":"' + farm + '","BoxNumber":"' + boxnumber + '","AWB":"' + Awb + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {
            if (output.d == "success") {
                $("#fgrdInventoryUsersHeaders").flexReload({ url: '/url/for/refresh' });
                $("#DivInventoryPODetails").dialog("close");
            }
            else {
                //$(".Warning").show();
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        }
    });
});


//VEN::29-OCT-2015::For Consolidate Type Selection
$('#DivConsolidateBar').each(function (i, buttonGroup) {

    var $buttonGroup = $(buttonGroup);
    $buttonGroup.on('click', 'button', function () {

        $buttonGroup.find('.is-checked').removeClass('is-checked');
        $(this).addClass('is-checked');

        if (IsInventoryUserConsolidateGridInitialize == false) {
            if ($("#DivConsolidateBar").find('button.is-checked')[0].value == "purchased") {
                $("#DivInventoryUsersConsolidatePurchased").show();
                InitializeInventoryUserConsolidateGridPurchased();
                //loadAWBPurchaselist();
                IsInventoryUserConsolidateGridInitializepurchased = true;
            }
            else {
                InitializeInventoryUserConsolidateGrid();
                loadInventoryAWBlist();
                IsInventoryUserConsolidateGridInitialize = true;
            }
        }
        else {
            if ($("#DivConsolidateBar").find('button.is-checked')[0].value == "purchased") {
                $('#DivInventoryUsersConsolidate').hide();
                $('#DivInventoryUsersConsolidatePurchased').show();
                //loadAWBPurchaselist();
                InitializeInventoryUserConsolidateGridPurchased();
                var fromDate = $("#txtInventoryFromRecDate").val();
                $("#fgrdInventoryUsersConsolidatePurchased2").empty();
                //$("#fgrdInventoryUsersConsolidatePurchased2").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'ConsolidateType', value: $("#DivConsolidateBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
                $("#fgrdInventoryUsersConsolidatePurchased2").flexOptions({ params: [{ name: 'FromDate', value: fromDate }]}).flexReload();

            }
            else {
                $('#DivInventoryUsersConsolidate').show();
                loadInventoryAWBlist();
                $("#fgrdInventoryUsersConsolidate").empty();
                $("#fgrdInventoryUsersConsolidate").flexOptions({ params: [{ name: 'Filter', value: '' }, { name: 'ConsolidateType', value: $("#DivConsolidateBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: '' }], query: "", newp: 1 }).flexReload();
            }
        }

    });
});

$("#msgbox-select").dialog({
    autoOpen: false,
    resizable: false,
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

function loadAWBPurchaselist() {
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetInventoryPurchaseAWBList',
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {

            $('#lstInventoryAWBFilter').empty();
            var AWBPurchasedata = output.d;
            $('#lstInventoryAWBFilter').append('<option value="0">Select</option>');
            $('#lstInventoryAWBFilter').append(AWBPurchasedata);

        }
    });
}

function loadInventoryAWBlist() {
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetInventoryAWBList',
        data: "{'TableName':'inven'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            $('#lstInventoryAWBFilter').empty();
            $('#lstInventoryAWBFilter').append('<option value="All">All</option>');
            var data = output.d;
            if (data != null) {
                //for (var i in data) {
                //    var DefAWB = data[i];                        
                //    $('#lstInventoryAWBFilter').append('<option value="' + DefAWB.AWB + '">' + DefAWB.AWB + '</option>');
                //}
                $('#lstInventoryAWBFilter').append(data);
            }
        }
    });
}

    function InitializeInventoryUserConsolidateGridPurchased() {
        var fromDate = $("#txtInventoryFromRecDate").val();
        $("#fgrdInventoryUsersConsolidatePurchased2").flexigrid({
        url: 'BloomService.asmx/GetConsolidatePurchaseGridlist',
        dataType: 'xml',
        colModel: [
            { display: 'CAT', name: 'CAT', width: 30, sortable: true, align: 'left' },
            { display: 'Flower', name: 'PRODCODQ', width: 100, sortable: true, align: 'left' },
            { display: 'Description', name: 'PRODNAMQ', width: 180, sortable: true, align: 'left' },
            { display: 'UOM', name: 'UOM', width: 80, sortable: true, align: 'left' },
            { display: 'TYPE', name: 'MARKET', width: 30, sortable: true, align: 'left' },
            { display: 'WH', name: 'WH', width: 30, sortable: true, align: 'left' },
            { display: 'Cust#', name: 'CUSTOMER', width: 30, sortable: true, align: 'right' },
            { display: 'AWB#', name: 'AWB', width: 80, sortable: true, align: 'left' },
            { display: 'Farm', name: 'FARM', width: 25, sortable: true, align: 'left' },
            { display: 'Comments', name: 'COMMENTS', width: 120, sortable: true, align: 'left' },
            { display: '0', name: '0', width: 20, sortable: true, align: 'right' },
            { display: '+1', name: '1', width: 20, sortable: true, align: 'right' },
            { display: '+2', name: '2', width: 20, sortable: true, align: 'right' },
            { display: '+3', name: '3', width: 20, sortable: true, align: 'right' },
            { display: '+4', name: '4', width: 20, sortable: true, align: 'right' },
            { display: '+5', name: '5', width: 20, sortable: true, align: 'right' },
            { display: '+6', name: '6', width: 20, sortable: true, align: 'right' },
            { display: '+7', name: '7', width: 20, sortable: true, align: 'right' },
            { display: '+8', name: '8', width: 20, sortable: true, align: 'right' },
            { display: '+9', name: '9', width: 20, sortable: true, align: 'right' },
            { display: '+10', name: '10', width: 20, sortable: true, align: 'right' },
            { display: '+11', name: '11', width: 20, sortable: true, align: 'right' },
            { display: '+12', name: '12', width: 20, sortable: true, align: 'right' },
            { display: '+13', name: '13', width: 20, sortable: true, align: 'right' },
            { display: '+14', name: '14', width: 20, sortable: true, align: 'right' },
        ],
        //searchitems: [
        //    { display: 'Flower', name: 'PRODCODQ' },
        //    { display: 'Description', name: 'PRODNAMQ' },
        //    { display: 'Farm', name: 'Farm' },
        //    { display: 'Cust#', name: 'CUSTOMER' },
        //    { display: 'UOM', name: 'UOM' },
        //    { display: 'AWB#', name: 'AWB' }
        //],
        showTableToggleBtn: true,
        sortname: "PRODCODQ",
        sortorder: "asc",
        usepager: true,
        title: false,
        useRp: true,
        //qtype: "",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        height: $(window).height() - 280,
        width: $(window).width() - 10,
        striped: true,
        params: [
            { name: 'FromDate', value: fromDate }
        ],
        onError: function (xhr, status, errorThrown) {
            //if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
            //    //window.location.href = "Login.aspx";
            //    $.MessageBox("OOPS!!! Please try after some time..");
            //}
        },
        onSuccess: function () {
            //For to show the error
            //if ($("#fgrdInventoryUsersConsolidatePurchased2 tr#row-2").length > 0) {
            //    $("#fgrdInventoryUsersConsolidatePurchased2 tr#row-2").hide();
            //    $.MessageBox($("#fgrdInventoryUsersConsolidatePurchased2 tr#row-2")[0].innerText);
            //    return false;
            //}

        }
    });


    //$("#DivInventoryUsersConsolidatePurchased .sDiv").css('float', 'left').css('width', '545px');
    //$('#DivInventoryUsersConsolidatePurchased .pDiv').css('padding', '2px').css('border-left', '0px');
    //$('#DivInventoryUsersConsolidatePurchased .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    ////$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    //$("#DivInventoryUsersConsolidatePurchased .pDiv").find(".pDiv2").find(".btnseparator").hide();
    ////$("#DivInventoryUsersConsolidatePurchased .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    ////$("#DivInventoryUsersConsolidatePurchased .pDiv").find(".pDiv2").find(".pGroup span:last").show();
    //$("#DivInventoryUsersConsolidatePurchased .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
}

$("#txtQuantityReceived").keypress(function (event) {
    var key = event.which;
    if (key == 13) // the enter key code
    {
        $("#lstInventoryUOM").focus();
    }
});

$("#txtInventoryCostPerUnit").keypress(function (event) {
    var key = event.which;
    if (key == 13) // the enter key code
    {
        $("#lstInventoryType").focus();
    }
});

$("#lstInventoryUOM").keypress(function (event) {
    var key = event.which;
    if (key == 13) // the enter key code
    {
        $("#txtInventoryUnitsPerBunch").focus();
        return false;
    }
});

$("#lstInventoryType").keypress(function (event) {
    var key = event.which;
    if (key == 13) // the enter key code
    {
        $("#lstInventoryInvenType").focus();
        return false;
    }
});

$("#lstInventoryInvenType").keypress(function (event) {
    var key = event.which;
    if (key == 13) // the enter key code
    {
        $("#lstWarehouse").focus();
        return false;
    }
});

$("#lstWarehouse").keypress(function (event) {
    var key = event.which;
    if (key == 13) // the enter key code
    {
        $("#txtInventoryOrderNo").focus();
        return false;
    }
});

function ApplyfilterForInventoryList(Filter) {
    $("#fgrdInventoryDetailbyFARM").flexOptions({ params: [{ name: 'Filter', value: Filter }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: 0 }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
}
function ApplyfilterForInventoryPricingList(Filter) {
    $("#fgrdInventoryPricing").flexOptions({ params: [{ name: 'Filter', value: Filter }, { name: 'TableName', value: $("#DivInventoryBar").find('button.is-checked')[0].value }, { name: 'ExportCSV', value: "" }, { name: 'ReceivedPiecesOnly', value: 0 }, { name: 'AWBFlag', value: AWBFlag }], query: "", newp: 1 }).flexReload();
}

$('#btnInventoryArriving').die('click').live('click', function () {
    var Filter = "Flag='A'"
    ApplyfilterForInventoryList(Filter)
});
$('#btnInventoryPricingArriving').die('click').live('click', function () {
    var Filter = "Flag='A'"
    ApplyfilterForInventoryPricingList(Filter)
});

$('#btnInventoryRefresh').die('click').live('click', function () {
    var Filter = "Flag='A'"
    ApplyfilterForInventoryList("")

});

$('#btnInventoryHold').die('click').live('click', function () {
    var Filter = "Flag='H'"
    ApplyfilterForInventoryList(Filter)
});
$('#btnInventoryPricingHold').die('click').live('click', function () {
    var Filter = "Flag='H'"
    ApplyfilterForInventoryPricingList(Filter)
});

$('#btnInventoryStanding').die('click').live('click', function () {
    var Filter = "Flag='S'"
    ApplyfilterForInventoryList(Filter)
});
$('#btnInventoryPricingStanding').die('click').live('click', function () {
    var Filter = "Flag='S'"
    ApplyfilterForInventoryPricingList(Filter)
});

$('#btnInventoryPrebooks').die('click').live('click', function () {
    var Filter = "Flag='P'"
    ApplyfilterForInventoryList(Filter)

});
$('#btnInventoryPricingPrebooks').die('click').live('click', function () {
    var Filter = "Flag='P'"
    ApplyfilterForInventoryPricingList(Filter)

});


$('#btnInventoryLocal').die('click').live('click', function () {
    var Filter = "Flag='L'"
    ApplyfilterForInventoryList(Filter)
});
$('#btnInventoryPricingLocal').die('click').live('click', function () {
    var Filter = "Flag='L'"
    ApplyfilterForInventoryPricingList(Filter)
});

$('#btnInventoryMarket').die('click').live('click', function () {

    var Filter = "Flag not in ('P','H','A','S','L')";
    ApplyfilterForInventoryList(Filter);
});
$('#btnInventoryPricingMarket').die('click').live('click', function () {

    var Filter = "Flag not in ('P','H','A','S')"
    ApplyfilterForInventoryPricingList(Filter);
});

$("#btnInventorySearch").die('click').live('click', function () {
    $("#FlowerFilterForInventoryDialog").dialog("open");
});
$("#btnInventoryPricingSearch").die('click').live('click', function () {
    $("#FlowerFilterForInventoryPricingDialog").dialog("open");
});

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
                $('#divInventoryDetailByFarm [name="qtype"]').val("Product");
                $('#divInventoryDetailByFarm [name="q"]').val(Flower.toUpperCase());
                $('#divInventoryDetailByFarm [value="Search"]').click();
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
$("#FlowerFilterForInventoryPricingDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: 'Search by Product Code',
    width: 300,
    height: 130,
    modal: true,
    buttons: {
        Next: function () {
            var Flower = $("#txtFlowerFilterForInventoryPricingList").val();
            if (Flower.trim() != "") {
                $('#DivInventoryPricing [name="qtype"]').val("FLOWER");
                $('#DivInventoryPricing [name="q"]').val(Flower.toUpperCase());
                $('#DivInventoryPricing [value="Search"]').click();
            }
            else {
                $("#txtFlowerFilterForInventoryPricingList").focus();
            }
            $("#FlowerFilterForInventoryPricingDialog").dialog("close");
        },
        Close: function () {
            $("#FlowerFilterForInventoryPricingDialog").dialog("close");
        },
    },
    open: function () {

        $("#txtFlowerFilterForInventoryPricingList").val("");
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
$("#txtFlowerFilterForInventoryPricingList").keydown(function (e) {
    var key = e.which;
    if (key == 13) {
        // Get the buttons
        var buttons = $("#FlowerFilterForInventoryPricingDialog").dialog("option", "buttons");
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
                var Filter = "Farm='" + Farm.trim() + "'"
                ApplyfilterForInventoryList(Filter);
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
$("#FarmFilterForInventoryPricingDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "Filter Inventory By Farm",
    width: 300,
    height: 130,
    modal: true,
    buttons: {
        Next: function () {
            var Farm = $("#txtFarmFilterForInventoryPricingList").val();
            if (Farm.trim() != "") {
                $("#FarmFilterForInventoryPricingDialog").dialog("close");
                var Filter = "Farm='" + Farm.trim() + "'"
                ApplyfilterForInventoryPricingList(Filter);
            }
            else {
                $("#txtFarmFilterForInventoryPricingList").focus();
            }
        },
        Close: function () {
            $("#FarmFilterForInventoryPricingDialog").dialog("close");
        },
    },
    open: function () {
        $("#txtFarmFilterForInventoryPricingList").val("");
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    }
});

$("#btnInventoryFarm").die('click').live('click', function () {
    $("#FarmFilterForInventoryDialog").dialog("open");
});
$("#btnInventoryPricingFarm").die('click').live('click', function () {
    $("#FarmFilterForInventoryPricingDialog").dialog("open");
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

                    var Filter = "LOT='" + FilterValue + "'"
                    ApplyfilterForInventoryList(Filter)
                }
                else if (selectedFilter == "Aged") {

                }
                else if (selectedFilter == "Country") {

                    var Filter = "Country='" + FilterValue + "'"
                    ApplyfilterForInventoryList(Filter)
                }
                else if (selectedFilter == "Type") {

                    var Filter = "InvenType='" + FilterValue + "'"
                    ApplyfilterForInventoryList(Filter)
                }
                else if (selectedFilter == "WH") {
                    var Filter = "WH='" + FilterValue + "'"
                    ApplyfilterForInventoryList(Filter)
                }
            }
            $("#OtherFiltersForInventoryListDialog").dialog("close");
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

$("#btnInventoryOther").die('click').live('click', function () {
    $("#OtherFiltersForInventoryListDialog").dialog("open");
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
                var Filter = "Variety1  like '%" + Variety.trim() + "%'"
                ApplyfilterForInventoryList(Filter, "Variety")
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
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    }
});

$("#VarietyFilterForInventoryPricingDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "Filter Inventory By Variety",
    width: 300,
    height: 150,
    modal: true,
    buttons: {
        Next: function () {
            var Variety = $("#lstVarietyFilterForInventoryPricingList").val();
            if (Variety.trim() != "") {
                $("#VarietyFilterForInventoryPricingDialog").dialog("close");
                var Filter = "Variety  like '%" + Variety.trim() + "%'"
                ApplyfilterForInventoryPricingList(Filter, "Variety")
            }
            else {
                $("#lstVarietyFilterForInventoryPricingList").focus();
            }
        },
        Close: function () {
            $("#VarietyFilterForInventoryPricingDialog").dialog("close");
        },
    },
    open: function () {
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
                var Filter = "Grade1  like '%" + Grade.trim() + "%'"
                ApplyfilterForInventoryList(Filter, "Grade")
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
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    }
});

$("#GradeFilterForInventoryPricingDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "Filter Inventory By Grade",
    width: 300,
    height: 150,
    modal: true,
    buttons: {
        Next: function () {
            var Grade = $("#lstGradeFilterForInventoryPricingList").val();
            if (Grade.trim() != "") {
                $("#GradeFilterForInventoryPricingDialog").dialog("close");
                var Filter = "Grade  like '%" + Grade.trim() + "%'"
                ApplyfilterForInventoryPricingList(Filter, "Grade")
            }
            else {
                $("#lstGradeFilterForInventoryPricingList").focus();
            }
        },
        Close: function () {
            $("#GradeFilterForInventoryPricingDialog").dialog("close");
        },
    },
    open: function () {
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
                var Filter = "Cat1  like '%" + Category.trim() + "%'"
                ApplyfilterForInventoryList(Filter, "Category")
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
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    }
});

$("#CategoryFilterForInventoryPricingDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "Filter Inventory By Category",
    width: 300,
    height: 150,
    modal: true,
    buttons: {
        Next: function () {
            var Category = $("#lstCategoryFilterForInventoryPricingList").val();
            if (Category.trim() != "") {
                $("#CategoryFilterForInventoryPricingDialog").dialog("close");
                var Filter = "ProductCategory  like '%" + Category.trim() + "%'"
                ApplyfilterForInventoryPricingList(Filter, "Category")
            }
            else {
                $("#lstCategoryFilterForInventoryPricingList").focus();
            }
        },
        Close: function () {
            $("#CategoryFilterForInventoryPricingDialog").dialog("close");
        },
    },
    open: function () {
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
                var Filter = "Color1 like '%" + Color.trim() + "%'"
                ApplyfilterForInventoryList(Filter, "Color")
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
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    }
});
$("#ColorFilterForInventoryPricingDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "Filter Inventory By Color",
    width: 300,
    height: 150,
    modal: true,
    buttons: {
        Next: function () {
            var Color = $("#lstColorFilterForInventoryPricingList").val();
            if (Color.trim() != "") {
                $("#ColorFilterForInventoryPricingDialog").dialog("close");
                var Filter = "Color like '%" + Color.trim() + "%'"
                ApplyfilterForInventoryPricingList(Filter, "Color")
            }
            else {
                $("#lstColorFilterForInventoryPricingList").focus();
            }
        },
        Close: function () {
            $("#ColorFilterForInventoryPricingDialog").dialog("close");
        },
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    }
});

$("#WarehouseFilterForInventoryDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "Filter Inventory By Warehouse",
    width: 300,
    height: 150,
    modal: true,
    buttons: {
        Next: function () {
            var WH = $("#lstWarehouseFilterForInventoryList").val();
            if (WH.trim() != "0") {
                $("#WarehouseFilterForInventoryDialog").dialog("close");
                var Filter = "WH ='" + WH.trim() + "'"
                ApplyfilterForInventoryList(Filter, "WH")
            }
            else {
                $("#lstWarehouseFilterForInventoryList").focus();
            }
        },
        Close: function () {
            $("#WarehouseFilterForInventoryDialog").dialog("close");
        },
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    }
});
$("#WarehouseFilterForInventoryPricingDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "Filter Inventory By Warehouse",
    width: 300,
    height: 150,
    modal: true,
    buttons: {
        Next: function () {
            var WH = $("#lstWarehouseFilterForInventoryPricingList").val();
            if (WH.trim() != "0") {
                $("#WarehouseFilterForInventoryPricingDialog").dialog("close");
                var Filter = "WH ='" + WH.trim() + "'"
                ApplyfilterForInventoryPricingList(Filter, "WH")
            }
            else {
                $("#lstWarehouseFilterForInventoryPricingList").focus();
            }
        },
        Close: function () {
            $("#WarehouseFilterForInventoryPricingDialog").dialog("close");
        },
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Next')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Close')").addClass('dialogbuttonstyle icon-cancel');
    }
});

$("#btnInventoryVariety").die('click').live('click', function () {
    $("#VarietyFilterForInventoryDialog").dialog("open");
});
$("#btnInventoryPricingVariety").die('click').live('click', function () {
    $("#VarietyFilterForInventoryPricingDialog").dialog("open");
});

$("#btnInventoryCategory").die('click').live('click', function () {
    $("#CategoryFilterForInventoryDialog").dialog("open");
});

$("#btnInventoryPricingCategory").die('click').live('click', function () {

    $("#CategoryFilterForInventoryPricingDialog").dialog("open");
});

$("#btnInventoryGrade").die('click').live('click', function () {
    $("#GradeFilterForInventoryDialog").dialog("open");
});
$("#btnInventoryPricingGrade").die('click').live('click', function () {
    $("#GradeFilterForInventoryPricingDialog").dialog("open");
});

$("#btnInventoryColor").die('click').live('click', function () {
    $("#ColorFilterForInventoryDialog").dialog("open");
});
$("#btnInventoryPricingColor").die('click').live('click', function () {
    $("#ColorFilterForInventoryPricingDialog").dialog("open");
});

$("#btnInventoryWH").die('click').live('click', function () {
    $("#WarehouseFilterForInventoryDialog").dialog("open");
});

$("#btnInventoryPricingWH").die('click').live('click', function () {
    $("#WarehouseFilterForInventoryPricingDialog").dialog("open");
});


//MANI::07/July/2018::To print cooler inventory Report
$("#btnPrintInventoryReport").die('click').live('click', function () {
    if ($("#lstInventoryReports").val() == "RptCoolerInventoryListing") {
        PrintCoolerInventoryListingReport();
    }
    else if ($("#lstInventoryReports").val() == "RptWholeCoolerInventoryListing") {
        PrintWholeCoolerInventoryListingReport();
    }
    else if ($("#lstInventoryReports").val() == "RptDiscrepancyReport") {
        printDiscrepancyReport();
    }
    else if ($("#lstInventoryReports").val() == "RptHuntList") {
        $("#txtHuntAwb").val("");
        $("#DivHunt").dialog("open");
    }
    else if ($("#lstInventoryReports").val() == "RptPhysicalInventory") {
        printPhysicalInventoryReport();
    }
    else if ($("#lstInventoryReports").val() == "RptInventoryusersProductDetails") {
        printTransferInventoryReport();
    }
    else if ($("#lstInventoryReports").val() == "RptReceiptsSummary") {
        //printReceiptsSummaryReport();
        $("#DialogReceiptsSummary").dialog("open")
    }
    else if ($("#lstInventoryReports").val() == "RptHandlingReport") {
            //printHandlingReport();
            $("#DialogHandlingReport").dialog("open")
    }
    else if ($("#lstInventoryReports").val() == "RptEndOfMonthCoolerInventoryListing") {
        //PrintEndofMonthCoolerInventoryListingReport();
        $("#DialogEndOfMonth").dialog("open")
    }

});

/*Trans :: created by Anitha :: 26Jul2018*/
$("#btnInventoryTrans").die("click").live("click", function () {
    var Filter = "";
    if (isTransGridLoad) {
        $("#fgrdViewInventoryTransactions").flexOptions({ params: [{ name: 'Filter', value: Filter }, { name: 'ExportCSV', value: '' }] }).flexReload();
        $("#DivViewInventoryTransactionsDialog").dialog("open");
    }
    else {
        LoadViewInventoryTransactionsGrid(Filter);
        isTransGridLoad = true;
    }
});

//ANITHA::21-JUL-2018::To Load inventory transaction details
function LoadViewInventoryTransactionsGrid(Filter) {


    $("#fgrdViewInventoryTransactions").flexigrid({
        url: 'BloomService.asmx/GetViewInventoryTransactionsGrid',
        dataType: 'xml',
        colModel: [
            { display: 'TransType', name: 'TransType', width: 60, sortable: true, align: 'left' },
            { display: 'Farm', name: 'Farm', width: 30, sortable: true, align: 'left' },
            { display: 'Product', name: 'ProductCode', width: 60, sortable: true, align: 'left', hide: true },
            { display: 'Description', name: 'ProductName', width: 240, sortable: true, align: 'left' },
            { display: 'WH', name: 'WH', width: 25, sortable: true, align: 'left' },
            { display: 'AWB#', name: 'Lot', width: 80, sortable: true, align: 'right' },
            { display: 'DateRec', name: 'daterec', width: 45, sortable: true, align: 'left' },
            { display: 'FLAG', name: 'FLAG', width: 30, sortable: true, align: 'center' },
            { display: 'CSREC', name: 'CSREC', width: 40, sortable: true, align: 'right' },
            { display: 'CSSOLD', name: 'CSSOLD', width: 40, sortable: true, align: 'right' },
            { display: 'UOM', name: 'UOM', width: 20, sortable: true, align: 'right' },
            { display: 'U/B', name: 'UnitsBunch', width: 30, sortable: true, align: 'right', title: 'Units Per Bunch' },
            { display: 'Pack', name: 'Units', width: 30, sortable: true, align: 'right', title: 'Units Per Box' },
            { display: 'Cost', name: 'Cost', width: 40, sortable: false, align: 'right' },
            { display: 'Type', name: 'InvenType', width: 30, sortable: true, align: 'right' },
            { display: 'Cust#', name: 'cust', width: 30, sortable: true, align: 'right' },
            { display: 'Comments', name: 'comments', width: 60, sortable: true, align: 'left' },
            { display: 'Box#', name: 'boxnum', width: 30, sortable: true, align: 'right' },
            { display: 'PO#', name: 'po', width: 50, sortable: true, align: 'left', title: 'Purchase Order#' },
            { display: 'Invoice#', name: 'invoice', width: 45, sortable: true, align: 'right', title: 'Vendor Invoice' },
            { display: 'TransDte', name: 'adddate', width: 90, sortable: true, align: 'right', title: 'Transaction Date' },
            { display: 'Person', name: 'adduser', width: 65, sortable: true, align: 'right', title: 'Transaction Time' }
        ],
        searchitems: [
            { display: 'TransactionType', name: 'TransType' },
            { display: 'Farm', name: 'Farm' },
            { display: 'AWB#', name: 'Lot' },
            { display: 'Box#', name: 'BoxNum' },
            { display: 'Invoice#', name: 'Invoice' },
            { display: 'Receiving Date', name: 'DateRec' },
            { display: 'Transaction Date', name: 'Adddate' }
        ],
        showTableToggleBtn: true,
        sortname: "adddate",
        sortorder: "desc",
        usepager: true,
        title: false,
        useRp: true,
        //rp: parseInt(($(window).height() - 290) / 25),
        qtype: "Flower",
        nomsg: 'No records found!',
        singleSelect: true,
        showToggleBtn: false,
        resizable: false,
        autoload: true,
        showTableToggleBtn: false,
        params: [
            { name: 'Filter', value: Filter },
            { name: 'ExportCSV', value: '' }
        ],
        height: $(window).height() - 180,
        width: "1287",
        striped: true,
        onSuccess: function () {

            $("#divViewInventoryTransactions #ExportCSV").show();
            //For to show the error
            if ($("#fgrdViewInventoryTransactions tr#row-2").length > 0) {
                $("#fgrdViewInventoryTransactions tr#row-2").hide();
                $.MessageBox($("#fgrdViewInventoryTransactions tr#row-2")[0].innerText);
                return false;
            }

            //$('#fgrdViewInventoryTransactions #row0 td:nth-child(5) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'center', 'padding-bottom': '3px', 'font-size': '14px' });
            //$('#fgrdViewInventoryTransactions #row0 td:nth-child(8) div').css({ "background-color": '#72C97D', "color": 'black', 'font-weight': 'bold', 'text-align': 'right', 'padding-bottom': '3px', 'font-size': '14px' });
            $('#fgrdViewInventoryTransactions #row0').addClass("TotalRows");
            //$('.TotalRows>td>div').addClass("test")
        },
        onError: function (xhr, status, errorThrown) {
            if (xhr.responseText.indexOf("Object reference not set to an instance of an object.") >= 0) {
                //window.location.href = "Login.aspx";
                $.MessageBox("OOPS!!! Please try after some time..");
            }
        }
    });

    $("#divViewInventoryTransactions .sDiv").css('float', 'left').css('width', '545px');
    $('#divViewInventoryTransactions .pDiv').css('padding', '2px').css('border-left', '0px');
    $('#divViewInventoryTransactions .pDiv').find('.pDiv2').find('.pGroup').children(0).not('.pPageStat').hide();
    //$(".pDiv").find(".pDiv2").find(".pGroup").hide()
    $("#divViewInventoryTransactions .pDiv").find(".pDiv2").find(".btnseparator").hide();
    //$("#divInventoryDetailByFarm .pDiv").find(".pDiv2").find(".pGroup span:last").attr('style', 'margin-left: -28px').show();
    $("#divViewInventoryTransactions .pDiv").find(".pDiv2").find(".pReload").attr('style', 'margin-left: -49px').show();
    $("#DivViewInventoryTransactionsDialog").dialog("open");
}

function ReloadTransactionGrid(celDiv, id) {
    $(celDiv).click(function (callback) {
        var Filter = "";
        Filter = " inv.ID ='" + id + "'";
        if (isTransGridLoad) {
            $("#fgrdViewInventoryTransactions").flexOptions({ params: [{ name: 'Filter', value: Filter }, { name: 'ExportCSV', value: '' }] }).flexReload();
            $("#DivViewInventoryTransactionsDialog").dialog("open");
        }
        else {
            LoadViewInventoryTransactionsGrid(Filter);
            isTransGridLoad = true;
        }

    });
}

$("#DivViewInventoryTransactionsDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "View Inventory Transactions",
    width: 1290,
    open: function (e) {
        $('#fgrdViewInventoryTransactions').flexReload();
    }
});

$("#DivInevntoryTransAddEditInfo").dialog({
    autoOpen: false,
    resizable: false,
    title: "Add/Edit Info",
    width: 410,
    height: 380,
    modal: true,
    buttons: {
        Ok: function () {
            $("#DivInevntoryTransAddEditInfo").dialog("close");
        }
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save')
    }
});



//ANITHA::21-JUL-2018::to show the add and edit informations
//Commented by Abinaya ::17Sep2018 :: Show tooltip using common method on code behind
//$("[id^=imgViewInvTransDetails_]").die("click").live("click", function () {
//    
//    var AddEditCtrlId = $(this)[0].id.replace("imgViewInvTransDetails_", "");

//    //To get the add/Edit user and datetime details
//    $.ajax({
//        url: 'BloomService.asmx/GetInventoryTransInfo',
//        type: 'POST',
//        data: "{'ID':'" + AddEditCtrlId + "'}",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (output, status) {
//            
//            if (output.d != null) {
//                $("#lblInvenTransAddedUser").html(output.d.AddUser);
//                $("#lblInvenTransAddedDate").html(output.d.AddDate);
//                $("#lblInvenTransAddedTime").html(output.d.AddTime);
//                $("#lblInvenTransEditedUser").html(output.d.UpdateUser);
//                $("#lblInvenTransEditedDate").html(output.d.UpdateDate);
//                $("#lblInvenTransEditedTime").html(output.d.UpdateTime);
//                $("#lblInvenTransDeletedUser").html(output.d.DeleteUser);
//                $("#lblInvenTransDeletedDate").html(output.d.DeleteDate);
//                $("#lblInvenTransDeletedTime").html(output.d.DeleteTime);
//                var DetDialogTitle = $("#DivInventoryTransAWB").html() + "-" + $("#DivInventoryTransFARM").html() + "-";
//                $("#DivInevntoryTransAddEditInfo").dialog('option', 'title', DetDialogTitle);
//                $("#DivInevntoryTransAddEditInfo").dialog("open");
//            }
//        }
//    });
//});
    $("#DialogEndOfMonth").dialog({
        autoOpen: false,
        resizable: false,
        title: '',
        width: 375,
        height: 190,
        modal: true,
        buttons: {
            Print: function () {
                PrintEndofMonthCoolerInventoryListingReport();
            },
            Cancel: function () {
                $("#DialogEndOfMonth").dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#DialogReceiptsSummary").dialog({
        autoOpen: false,
        resizable: false,
        title: '',
        width: 375,
        height: 190,
        modal: true,
        buttons: {
            Print: function () {
                PrintReceiptsSummaryReport();
            },
            Cancel: function () {
                $("#DialogReceiptsSummary").dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });

    $("#DialogHandlingReport").dialog({
        autoOpen: false,
        resizable: false,
        title: '',
        width: 375,
        height: 190,
        modal: true,
        buttons: {
            Print: function () {
                PrintHandlingReport();
            },
            Cancel: function () {
                $("#DialogHandlingReport").dialog("close");
            },
        },
        open: function () {
            $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save')
            $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel')
        }
    });
$("#DivHunt").dialog({
    autoOpen: false,
    resizable: false,
    title: "Hunt List",
    width: 300,
    height: 140,
    modal: true,
    buttons: {
        Excel: function () {
            var huntawbno = $("#txtHuntAwb").val().replace(/-/g, '');
            if (huntawbno == "") {
                $.MessageBox("Enter valid AWBNo");
                return false;
            }
            else {
                $.ajax({
                    type: "POST",
                    url: 'BloomService.asmx/PrintHuntList',
                    data: '{"huntawbno":"' + huntawbno + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (output, status) {

                        if (output.d == "LogOut") {
                            window.location.href = "Login.aspx";
                        }
                        else if (output.d.indexOf("error") >= 0) {
                            $("#msgbox-select").dialog("close");
                            $.MessageBox(output.d.substring(5, output.d.length));
                        }
                        else if (output.d == "No Data") {
                            $.MessageBox("No data selected!");
                            w.close();
                        }
                        else {

                            path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                        window.open(path);
                    }
                    $("#DivHunt").dialog("close");
                    $("#txtHuntAwb").focus();
                }
            });
        }
    }
},
open: function () {

    $("#txtHuntAwb").val($("#lblchoosenInventoryAWB").html());
    $(".ui-dialog-buttonpane button:contains('Excel')").addClass('dialogbuttonstyle icon-save')
}
});
    function PrintCoolerInventoryListingReport() {

        var AWB = "";
        if ($("#fgrdInventoryHeader").find('.trSelectedHeader').length > 0) {
            AWB = $("#fgrdInventoryHeader").find('.trSelectedHeader').attr('id').replace('row', '').split('_')[0];
        }
        else {
            AWB = "";
            //$("#msg").html("No AWB selected");
            //$("#msgbox-select").dialog("open");
            //return false
        }
        var w = window.open('GeneratingPDF.html');
        var whereclause = "";
        if ($("#divInventoryDetailByFarm .sDiv2 input.qsbox").length > 0) {
            var searchbox = $("#divInventoryDetailByFarm .sDiv2 input.qsbox").val().replace(/-/g, '');
            if (searchbox == "") { whereclause = ""; }
            else {
                var qtype = $("#divInventoryDetailByFarm .sDiv2 select[name=qtype]").val()
                if (qtype == "Product") {
                    whereclause = "Flower" + " like " + "'%" + searchbox + "%'" + " and "
                }
                else {
                    whereclause = qtype + " like " + "'%" + searchbox + "%'" + " and "
                }
            }
        }

        if (AWBFlag == "1") {
            whereclause = whereclause == "" ? " Flag='A' and" : whereclause + " Flag='A' and ";
        }
        if (AWB != "All") {
            whereclause = whereclause == "" ? " AWB='" + AWB + "' and " : whereclause + "  AWB='" + AWB + "' and";
        }
        else {
            whereclause = whereclause == "" ? " 1=1 and" : whereclause + " 1=1 and ";
        }

        var CoolerDisplay = $("#DivCoolerDisplay").find('button.is-checked')[0].value;

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintCoolerInventoryListingReport',
            data: '{"whereclause":"' + whereclause + '","ReceivedPiecesOnly":"' + ReceivedPiecesOnly + '","CoolerDisplay":"' + CoolerDisplay + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d != "LogOut") {
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
                else if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
            }
        });
    }

    function PrintWholeCoolerInventoryListingReport() {
        var w = window.open('GeneratingPDF.html');
        var whereclause = "";        
        whereclause = whereclause == "" ? " 1=1 and" : whereclause + " 1=1 and ";
        var CoolerDisplay = $("#DivCoolerDisplay").find('button.is-checked')[0].value;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintCoolerInventoryListingReport',
            data: '{"whereclause":"' + whereclause + '","ReceivedPiecesOnly":"' + ReceivedPiecesOnly + '","CoolerDisplay":"' + CoolerDisplay + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d != "LogOut") {
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
                else if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
            }
        });
    }

    function PrintEndofMonthCoolerInventoryListingReport() {
        var w = window.open('GeneratingPDF.html');
        var whereclause = "";
        whereclause = whereclause == "" ? " 1=1 and" : whereclause + " 1=1 and ";
        var CoolerDisplay = $("#DivCoolerDisplay").find('button.is-checked')[0].value;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintEndOfMonthCoolerInventoryListingReport',
            data: '{"whereclause":"' + whereclause + '","ReportDt":"' + $("#txtReportDate").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d != "LogOut") {
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
                else if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
            }
        });
    }

    function PrintReceiptsSummaryReport() {
        var w = window.open('GeneratingPDF.html');
        var whereclause = "";
        whereclause = whereclause == "" ? " 1=1 and" : whereclause + " 1=1 and ";
        var CoolerDisplay = $("#DivCoolerDisplay").find('button.is-checked')[0].value;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintReceiptsSummaryReport',
            data: '{"whereclause":"' + whereclause + '","FromDate":"' + $("#txtReceiptsSummaryFromDate").val() + '","ToDate":"' + $("#txtReceiptsSummarytoDate").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d != "LogOut") {
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
                else if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
            }
        });
    }

    function PrintHandlingReport() {
        var w = window.open('GeneratingPDF.html');
        var whereclause = "";
        whereclause = whereclause == "" ? " 1=1 and" : whereclause + " 1=1 and ";
        var CoolerDisplay = $("#DivCoolerDisplay").find('button.is-checked')[0].value;
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintHandlingReport',
            data: '{"whereclause":"' + whereclause + '","FromDate":"' + $("#txtHandlingReportFromDate").val() + '","ToDate":"' + $("#txtHandlingReporttoDate").val() + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d != "LogOut") {
                    var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    w.location = ExportedPath;
                }
                else if (output.d == "LogOut") {
                    w.close();
                    window.location.href = "Login.aspx"
                }
            }
        });
    }

$("#txtHuntAwb").keydown(function (e) {

    if (e.which == 13) {
        $("#DivHunt").next('div').find('button')[0].focus();
        return false
    }
})
$("#lstCategoryFilterForInventoryList").change(function () {
    // Get the buttons
    var buttons = $("#CategoryFilterForInventoryDialog").dialog("option", "buttons");
    // Calls the event
    buttons["Next"]();
});
$("#lstCategoryFilterForInventoryPricingList").change(function () {
    // Get the buttons
    var buttons = $("#CategoryFilterForInventoryPricingDialog").dialog("option", "buttons");
    // Calls the event
    buttons["Next"]();
});

$("#lstColorFilterForInventoryList").change(function () {
    // Get the buttons
    var buttons = $("#ColorFilterForInventoryDialog").dialog("option", "buttons");
    // Calls the event
    buttons["Next"]();
});
$("#lstColorFilterForInventoryPricingList").change(function () {
    // Get the buttons
    var buttons = $("#ColorFilterForInventoryPricingDialog").dialog("option", "buttons");
    // Calls the event
    buttons["Next"]();
});

$("#lstVarietyFilterForInventoryList").change(function () {
    // Get the buttons
    var buttons = $("#VarietyFilterForInventoryDialog").dialog("option", "buttons");
    // Calls the event
    buttons["Next"]();
});

$("#lstVarietyFilterForInventoryPricingList").change(function () {
    // Get the buttons
    var buttons = $("#VarietyFilterForInventoryPricingDialog").dialog("option", "buttons");
    // Calls the event
    buttons["Next"]();
});

$("#lstGradeFilterForInventoryList").change(function () {
    // Get the buttons
    var buttons = $("#GradeFilterForInventoryDialog ").dialog("option", "buttons");
    // Calls the event
    buttons["Next"]();
});
$("#lstGradeFilterForInventoryPricingList").change(function () {
    // Get the buttons
    var buttons = $("#GradeFilterForInventoryPricingDialog ").dialog("option", "buttons");
    // Calls the event
    buttons["Next"]();
});

$("#lstWarehouseFilterForInventoryList").change(function () {
    // Get the buttons
    var buttons = $("#WarehouseFilterForInventoryDialog").dialog("option", "buttons");
    // Calls the event
    buttons["Next"]();
});
$("#lstWarehouseFilterForInventoryPricingList").change(function () {
    // Get the buttons
    var buttons = $("#WarehouseFilterForInventoryPricingDialog").dialog("option", "buttons");
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


document.body.addEventListener('keydown', function (e) {
    //
    try {
        //e.preventDefault();
        var focused = document.activeElement;


        if (focused.className != "qsbox" && $("#divInventoryFilters").css('display') != 'none' && $(".ui-dialog:visible").length <= 0) {
            if (e.which == 77) { //Click M
                $('#btnInventoryMarket').click();
            }
            if (e.which == 87) { //Click W
                $('#btnInventoryWH').click();
            }
            if (e.which == 76) { //Click L
                $('#btnInventoryLocal').click();
            }
            if (e.which == 72) {//Click H
                $('#btnInventoryHold').click();
            }
            if (e.which == 65) {//Click A
                $('#btnInventoryArriving').click();
            }
            if (e.which == 82) {//Click R
                $('#btnInventoryRefresh').click();
            }
            if (e.which == 83) {//Click S
                $('#btnInventorySearch').click();
            }
            if (e.which == 80) {//Click P
                $('#btnInventoryPrebooks').click();
            }
            if (e.which == 84) {//Click T
                $('#btnInventoryStanding').click();
            }
            if (e.which == 79) {//Click O
                $('#btnInventoryColor').click();
            }
            if (e.which == 67) {//Click C

                $('#btnInventoryCategory').click();
            }

            if (e.which == 86) {//Click V
                $('#btnInventoryVariety').click();
            }
            if (e.which == 79) {//Click O
                $('#btnInventoryOther').click();
            }
            if (e.which == 70) {//Click F
                $('#btnInventoryFarm').click();
            }
            if (e.which == 71) {//Click G
                $('#btnInventoryGrade').click();
            }
            e.preventDefault();
            e.stopPropagation();
            return false;

        }
        //  e.stopPropagation();

    }
    catch (ex) {

    }
});

/*Fix an AWB :: created by Abinaya :: 10Jul2018*/
$("#btnInventoryFixAWB").die("click").live("click", function () {
    $("#DialogFixAWB").dialog("open");
});


$("#txtInvOldAWB").focusout(function (e) {
    if ($("#txtInvOldAWB").val() != "") {
        $("#tblInvNewAWBDetails").show();
        //if (e.keyCode == 13) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/GetDateRecDetailsByAWB',
            data: '{"AWB":"' + $("#txtInvOldAWB").val().replace(/-/g, '') + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d == "Not Exist") {
                    $.MessageBox("AWB not on file...");
                    $("#txtInvNewRecDate").val("");
                }
                else if (output.d.indexOf("error") >= 0) {
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else
                    $("#txtInvNewRecDate").datepicker('setDate', Date.parse(output.d));
            },
            error: function () {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        });
        //}
    }
});

$("#txtInvOldAWB").on('keyup keypress blur change', function (event) {

    $("#txtInvNewAWB").val($("#txtInvOldAWB").val());
});

$("#txtInvOldWarehouse").on('keyup keypress blur change focusout', function (event) {

    $("#txtInvNewWarehouse").val($("#txtInvOldWarehouse").val());
});

$("#txtInvOldFarm").on('keyup keypress blur change focusout', function (event) {

    $("#txtInvNewFarm").val($("#txtInvOldFarm").val());
});

//focust from Boxnumber control
$("#txtInvOldBoxnum").focusout(function () {

    if ($("#txtInvOldBoxnum").val() == "" || $("#txtInvOldBoxnum").val() == "0") {
        $("#tblInvNewBoxSize").hide();
    }
    else {
        $("#tblInvNewBoxSize").show();
    }
});

$("#txtInvNewRecDate").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'mm/dd/yy',
    showOtherMonths: true,
    selectOtherMonths: true,
}).datepicker("setDate", new Date());

/*Get inputs from FixAWB screen and Update the AWB details by using Change :: Created by Abinaya :: 10Jul2018*/
$("#DialogFixAWB").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Fix An AWB",
    width: 480,
    buttons: {
        Change: function () {

            var OldAWB = $("#txtInvOldAWB").val().replace(/-/g, '');
            if (OldAWB == "") {
                $.MessageBox("Please enter AWB#...");
                $("#txtInvOldAWB").focus();
                return false;
            }
            var OldWarehouse = $("#txtInvOldWarehouse").val();
            var OldFarm = $("#txtInvOldFarm").val();
            var OldProduct = $("#txtInvOldProduct").val();
            var OldBoxnum = $("#txtInvOldBoxnum").val();
            var NewAWB = $("#txtInvNewAWB").val().replace(/-/g, '');
            var NewWarehouse = $("#txtInvNewWarehouse").val();
            var NewFarm = $("#txtInvNewFarm").val();
            var NewRecDate = $("#txtInvNewRecDate").val();
            var NewCost = $("#txtInvNewCost").val();

            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/UpdateNewAWBDetails',
                data: "{'OldAWB':'" + OldAWB + "','OldWarehouse':'" + OldWarehouse + "','OldFarm':'" + OldFarm + "','OldProduct':'" + OldProduct + "','OldBoxnum':'" + OldBoxnum + "','NewAWB':'" + NewAWB + "','NewWarehouse':'" + NewWarehouse + "','NewFarm':'" + NewFarm + "','NewFarm':'" + NewFarm + "','NewRecDate':'" + NewRecDate + "','NewCost':'" + NewCost + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {

                    var res = output.d;
                    if (res == "success") {
                        $("#DialogFixAWB").dialog("close");
                        $.MessageBox("AWB details updated...")
                    }
                    else if (output.d.indexOf("error") >= 0) {
                        $("#msgbox-select").dialog("close");
                        $.MessageBox(output.d.substring(5, output.d.length));
                    }
                }
            });

        },
        Cancel: function () {
            $(this).dialog("close");
        },
    },
    open: function (e) {
        ResetFixAWBDialogControls();
        //2021/08/28
        if ($(".inventoryawb") && $(".inventoryawb").css("display") !== "none" && $("#lblchoosenInventoryAWB")) {
            $("#txtInvOldAWB").val($("#lblchoosenInventoryAWB").html().replaceAll("-", ""));
        }

        $(".ui-dialog-buttonpane button:contains('Change')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        //$(this).siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
    }
});

function ResetFixAWBDialogControls() {
    $("#tblInvNewAWBDetails").hide();
    $("#txtInvOldAWB").val("");
    $("#txtInvOldAWB").focus();
    $("#txtInvOldWarehouse").val("");
    $("#txtInvOldFarm").val("");
    $("#txtInvOldProduct").val("");
    $("#txtInvOldBoxnum").val("");
    $("#txtInvNewAWB").val("");
    $("#txtInvNewWarehouse").val("");
    $("#txtInvNewFarm").val("");
    $("#txtInvNewRecDate").datepicker('setDate', new Date());
    $("#txtInvNewCost").val("");
    $("#tblInvNewBoxSize").hide();
}

/*Inventory Reports :: Discrepancy report integration :: by Abinaya :: 19Jul2018*/

function printDiscrepancyReport() {

    var w = window.open('GeneratingPDF.html');
    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintDiscrepancyReport',
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {
            if (output.d != "LogOut") {
                var ExportedPath = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
            w.location = ExportedPath;
        }
        else if (output.d == "LogOut") {
            w.close();
            window.location.href = "Login.aspx"
        }
    }
});
}


/*Inventory Reports :: Physical Inventory report integration :: by Anitha :: 12Nov2018*/

function printPhysicalInventoryReport() {

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/PrintPhysicalInventoryReport',
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {

            if (output.d == "LogOut") {
                window.location.href = "Login.aspx";
            }
            else if (output.d.indexOf("error") >= 0) {
                $("#msgbox-select").dialog("close");
                $.MessageBox(output.d.substring(5, output.d.length));
            }
            else if (output.d == "No Data") {
                $.MessageBox("No data selected!");
                w.close();
            }
            else {

                path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
            window.open(path);
        }
    }
});
}

/*Inventory Reports :: Transfer inventory report integration :: by Anitha :: 27Nov2018*/

    function printTransferInventoryReport() {


        var AWB = "";
        //$("#fgrdInventoryHeader").find('tr').attr('id').replace('row', '').split('_')[0];
        AWB = ($("#fgrdInventoryHeader").find('.trSelectedHeader').attr('id')) == undefined ? ($("#fgrdInventoryHeader").find('tr').attr('id') == undefined ? 0 : $("#fgrdInventoryHeader").find('tr').attr('id').replace('row', '').split('_')[0]) : $("#fgrdInventoryHeader").find('.trSelectedHeader').attr('id').replace('row', '').split('_')[0];
        //var HeaderId = $("#fgrdInventoryHeader").find('.trSelectedHeader').attr('id').replace('row', '').split('_')[1];
        //var AWB = $("#fgrdInventoryHeader").find('.trSelectedHeader').find('td')[0].innerText;   
        var CoolerDisplay = $("#DivCoolerDisplay").find('button.is-checked')[0].value;
        //Commented By Prashant On 08 Jul 2020 For Calling Wrong report RDL
        <%--$.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInventoryUsersProductDetailsReport',
            data: "{'AWB':'" + AWB + "','DateRec':'','UserFileNo':'','CoolerFlag':'1','CoolerDisplay':'" + CoolerDisplay + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {

                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                        window.open(path);
                    }
            }
        });--%>

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInvenTransferReport',
            data: "{'AWB':'" + AWB + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {

                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    window.open(path);
                }
            }
        });
    }

    $("#btnTransferRePrint").die('click').live('click', function () {
        printTransferInvHistReport();
    });

    function printTransferInvHistReport() {
        var AWB = "";
        var Farm = "";
        AWB = ($("#fgrdInventoryHeader").find('.trSelectedHeader').attr('id')) == undefined ? ($("#fgrdInventoryHeader").find('tr').attr('id') == undefined ? 0 : $("#fgrdInventoryHeader").find('tr').attr('id').replace('row', '').split('_')[0]) : $("#fgrdInventoryHeader").find('.trSelectedHeader').attr('id').replace('row', '').split('_')[0];
        if ($(".inventoryfarm") && $(".inventoryfarm").css("display") != "none")
            Farm = $("#DivInventoryFARM").html() ? $("#DivInventoryFARM").html() : "" ;

        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintInvenTransferReport',
            data: "{'AWB':'" + AWB + "', 'Farm':'" + Farm + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {

                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    window.open(path);
                }
            }
        });
    }
    function printReceiptsSummary() {


 
        var CoolerDisplay = $("#DivCoolerDisplay").find('button.is-checked')[0].value;
  
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintReceiptsSummary',
            data: "{'AWB':'" + AWB + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {

                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + output.d;
                    window.open(path);
                }
            }
        });
    }


$("[id^=btnlookupboxdetails]").live("click", function () {

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/GetPage',
        data: '{ "controlName":"pages/PageLookupBox.ascx","controlPara":"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {

            $('<div id="DivBoxDetails">/div>').dialog({
                title: 'Get box Details',
                autoOpen: false,
                width: 900,
                height: 500,
                modal: true,
                resizable: false,
                close: function () {
                    $('.YellowWarning').hide();
                }
            });
            $("#DivBoxDetails").html(output.d).dialog("open");
        }
    });
});


var Salesman = "";
var CreditFilenames = [];  /* Get uploaded filename from aspx in folder */
var CreditVETID = "";
var CREREQID = "";
var SelectizeFlag = "0";
/* Check credit request already applied or not for the selected VET ID & Invoice */
$("[id^=farmcredit_]").die("click").live("click", function () {


    var InvSplit = $(this)[0].id.replace("farmcredit_", "").split("~");
    if (InvSplit[1] == "0")
        GetCreditRequestDetails(InvSplit[0], "");
    else
        GetCreditRequestDetails(InvSplit[0], InvSplit[1]);
    //$.ajax({
    //    type: "POST",
    //    url: 'BloomService.asmx/CheckFarmCreditAppliedStatus',
    //    data: "{'ID': '" + InvSplit[0] + "'}",
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (output) {
    //        
    //        var res = output.d;
    //        if (res.length > 0) {
    //            if (res[0].ErrorMessage == "Success") {
    //                $("#msgCreditReqhtml").html("Already a credit request issued on this product.  Do you want to contine?");
    //                //$("#msgCreditReqhtml").html("Already Credit applied. Reason :: " + res[0].REASON + ". Credit Amount:: " + res[0].Price.toFixed(2) + ". Do you want to add another credit?");
    //                $("#msgbox-CreditReq").data("inData", { Id: InvSplit[0], AlreadyApproved: res[0].ID }).dialog("open");
    //            }
    //        }
    //        else {
    //            GetCreditRequestDetails(InvSplit[0], "");
    //        }
    //    }
    //});
});

$("#DivCreditGridDialog").dialog({
    autoOpen: false,
    resizable: false,
    title: "Alert",
    width: 750,
    modal: true,
    position: [300, 30],
    buttons: {
        Save: function () {

            //if ($("#txtCreditReason1").val().trim() == "") {
            //    $("#DivCreditGridDialog").next('div').find(".msgui").html("Credit code is required");
            //    $("#DivCreditGridDialog").next('div').find('.msgui').show();
            //    $("#lstCreditCode")[0].selectize.focus();
            //    return false;
            //}

            //Commented by mani as soumya request to remove the restriction
            //if (CreditFilenames.length == 0) {
            //    $("#DivCreditGridDialog").next('div').find(".msgui").html("Pictures required");
            //    $("#DivCreditGridDialog").next('div').find('.msgui').show();
            //    return false;
            //}

            //if (CheckUnitsByTotUnits()) {
            //$("#SalesControlNum").html($("#txtCreditControl").val());
            $("#SalesControlNum").html("0");
            $("#msgDivCreditGridDialoghtml").html("Credit amount is $" + delimitNumbers($("#txtCreditTotal").val()));
            $("#msgbox-DivCreditGridDialog").dialog("open");
            //}



            //
            //if ($("#txtCreditControl").val().trim() == "") {
            //    GetControlNum($("#txtCreditControl").val());
            //}
            //else {                    
            //    $("#msgDivCreditGridDialoghtml").html("Credit amount is $" + delimitNumbers($("#txtCreditTotal").val()));
            //    $("#msgbox-DivCreditGridDialog").dialog("open");
            //}

        },
        Cancel: function () {
            $(this).dialog("close");
        },
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        $("#DivCreditGridDialog").find(".selectize-control").css({ "width": '555px', "position": 'absolute' });
        $("#DivCreditGridDialog").find(".selectize-dropdown-content").css({ "width": '35%' });
        $("#DivCreditGridDialog").dialog({ position: 'center' });
        $("#txtCreditUnits").focus();
    },
    close: function () {

        var api = $.fileuploader.getInstance(input);
        api.reset();
    }
});

function delimitNumbers(str) {
    return (str + "").replace(/\b(\d+)((\.\d+)*)\b/g, function (a, b, c) {
        return (b.charAt(0) > 0 && !(c || ".").lastIndexOf(".") ? b.replace(/(\d)(?=(\d{3})+$)/g, "$1,") : b) + c;
    });
}
var ajaxfunction = "GetCreditDetailsForFarm"
function GetCreditRequestDetails(Id, AlreadyApproved) {

    $("#msgbox-CreditReq").dialog("close");
    if (AlreadyApproved == "")
        ajaxfunction = "GetCreditDetailsForFarm"
    else {
        ajaxfunction = "GetFarmCreditsFromCredit"
        Id = AlreadyApproved
    }
    tempscreen = ((ajaxfunction == "GetCreditDetailsForFarm") ? 'INVEN' : '');
    var button = $("#DivInventoryBar").find('button.is-checked')[0].value 
    
    tempscreen = button == "invhist" ? "INVENHIST" : tempscreen;

    $.ajax({
        type: "POST",
        url: 'BloomService.asmx/' + ajaxfunction + '',
        data: "{'ID': '" + Id + "','Screen':'" + tempscreen + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output) {

            var res = output.d;

            $("#lblCreditFlowerCode").text(res[0].Flower);
            $("#lblCreditFlowerName").text(res[0].FlowerName);
            $("#lblCreditFarmCode").text(res[0].Farm);
            $("#lblCreditFarmName").text(res[0].FarmName);
            $("#lblCreditAwb").text(res[0].AWB);
            $("#lblCreditRecdate").text(res[0].DateRec);
            $("#lblCreditDaysFresh").text(res[0].DaysFresh);
            $("#lblCreditPO").text(res[0].PO)
            $("#lblCreditInvoice").text(res[0].FarmInv);

            $("#lblSoldTotalBoxes").text(res[0].Boxes);
            $("#lblSoldUOM").text(res[0].UOM);
            $("#lblSoldUnitsPerBox").text(res[0].Units);
            $("#txtSoldTotalUnits").val(res[0].TotalUnits);
            $("#txtSoldPricePerUnit").val(res[0].FOB.toFixed(4));

            $("#txtCreditUnits").val("");
            $("#txtCreditUnits").attr('placeholder', res[0].TotalUnits);
            $("#txtCreditPrice").val("");
            $("#txtCreditPrice").attr('placeholder', res[0].FOB.toFixed(4));
            $("#txtCreditFreight").val("");
            $("#txtCreditFreight").attr('placeholder', res[0].Freight.toFixed(2));

            $("#txtCreditFuel").val("");
            $("#txtCreditFuel").attr('placeholder', res[0].Fuel.toFixed(2));
            $("#txtCreditTaxes").val("");
            $("#txtCreditTaxes").attr('placeholder', res[0].Tax1.toFixed(2));

            var amt = parseFloat(res[0].TotalUnits * res[0].FOB.toFixed(4)).toFixed(2)
            var total = parseFloat(amt) + parseFloat(res[0].Freight.toFixed(2)) + parseFloat(res[0].Fuel.toFixed(2)) + parseFloat(res[0].Tax1.toFixed(2));

            $("#txtCreditTotal").val(total.toFixed(2));
            $('#lstCreditCode').empty();
            SelectizeFlag = "1";

            $("#txtCreditControl").val("0");
            $("#txtCreditReason2").val("");
            Salesman = "0";
            CreditVETID = 0
            CreditFilenames = [];
            if (AlreadyApproved == "") {
                LoadCreditCode()
                CREREQID = 0;
            }
            else {
                CREREQID = res[0].ID;
                $("#hfCreditCode").val(res[0].CODE + '~' + res[0].CreditDesc);
                J1_10($("#lstCreditCode")).selectize()[0].selectize.setValue($("#hfCreditCode").val());

                if (res[0].REASON == "") {
                    $("#txtCreditReason2").val(res[0].CreditDesc);
                }
                else {
                    $("#txtCreditReason2").val(res[0].REASON);
                }
            }
            if (AlreadyApproved != "") {
                CreditFileNames = res[0].ImageName;
                if (CreditFileNames != "") {
                    var imgNameSplit = CreditFileNames.split(",");
                    for (var i = 0; i < imgNameSplit.length; i++) {
                        var ext = imgNameSplit[i].split(".")[1];
                        var str1 = { name: imgNameSplit[i], type: 'image/' + ext, size: '', file: 'CreditRequestImages/CREREQ/' + res[0].ID + '/' + imgNameSplit[i] }
                        var api = $.fileuploader.getInstance(input);
                        api.append(str1);
                    }
                }
            }


            $("#DivCreditGridDialog").next('div').find('.msgui').remove();
            $("#DivCreditGridDialog").next('div').append("<div class='msgui' style='margin-left: 10px;height: 17px;'></div>").css('height', '35px');
            $("#DivCreditGridDialog").next('div').find(".msgui").css("width", '525px');
            $("#DivCreditGridDialog").next('div').find('.msgui').hide();
            $("#DivCreditGridDialog").dialog('option', 'title', 'Farm Credit');
            $("#DivCreditGridDialog").data('InvID', Id).dialog("open");
        }
    });
}

function LoadCreditCode() {

    var length = $('#lstCreditCode > option').length;
    if (length <= 0) {
        $.ajax({
            type: "POST",
            url: 'BloomService.asmx/LoadCreditCode',
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output, status) {

                $('#lstCreditCode').empty();
                var data = output.d;

                for (var i in data) {
                    var res = data[i];
                    if (res.CODE != "") {
                        $('#lstCreditCode').append('<option value="' + res.CODE + '~' + res.REASON + '">' + res.CODE + '  [' + res.REASON + ']' + '</option>');
                    }
                }
                $("#hfCreditCode").val(data[0].CODE + '~' + data[0].REASON);
                //$("#hfCreditCode").val(data[0].CODE);
                $("#txtCreditReason2").val(data[0].REASON);
                J1_10($("#lstCreditCode")).selectize({
                    onChange: function () {

                        if (SelectizeFlag == "1") {
                            $("#txtCreditUnits").focus();
                            SelectizeFlag = "0";
                        }
                        else {
                            var codesplit = $("#lstCreditCode")[0].value.split('~');
                            $("#txtCreditReason2").val(codesplit[1] + "\n");
                            //if (codesplit[0] != "0" && codesplit[0] != "") {
                            //    $("#txtCreditReason2").val(codesplit[1] + "\n");
                            //    //$("#txtCreditReason2").focus();                                    
                            //}
                            //else {
                            //    $("#txtCreditReason2").val(codesplit[1]);
                            //    //$('#txtCreditReason2').select().val('').val($("#txtCreditReason2").val() + "\n");

                            //}
                            moveCursorToEnd($('#txtCreditReason2'));
                            // $("#txtCreditReason2").focus();
                        }
                    }
                    //onEnter: function () {
                    //    alert('onenter');
                    //    $("#txtCreditReason2").focus();
                    //}
                });
                J1_10($("#lstCreditCode")).selectize()[0].selectize.setValue($("#hfCreditCode").val());
            },
        });
    }
    else {
        J1_10($("#lstCreditCode")).selectize()[0].selectize.setValue($("#hfCreditCode").val());
    }
}

function moveCursorToEnd(input) {
    var originalValue = input.val();
    input.val('');
    input.blur().focus().val(originalValue);
}

/* FileUploader control */
var input = $('#fileuploader3').fileuploader({
    extensions: ['jpg', 'jpeg', 'png', 'gif', 'bmp'],
    changeInput: ' ',
    theme: 'thumbnail',
    enableApi: true,
    addMore: true,
    limit: 10,
    thumbnails: {
        box: '<div class="fileuploader-items">\
                    <div class="fileuploader-items-list">\
                    <div class="fileuploader-thumbnails-input" style="border: 1px #a5a5a5 solid;height: 60px;width: 670px;background: #eee;"><div class="fileuploader-thumbnails-input-inner" style="margin-top:12px">\
                    <div class="fileuploader-input-button">\
                    <span>Upload Pictures</span></div></div></div>\
                    </div>\
                    </div>',
        item: '<div class="fileuploader-item" style="display:table-cell;vertical-align:middle;">\
                    <div class="fileuploader-item-inner"><a id="${name.split(".")[0]}" onclick=ShowPreview("${name.split(".")[0]}")>\
                    <div class="thumbnail-holder" id="divThumbPreview" title="${name}" style="cursor:pointer;"">${image}</div></a>\
                    <div class="actions-holder">\
                    <a class="fileuploader-action fileuploader-action-remove" title="Remove"><i class="remove"></i></a>\
                    </div>\
                    </div>\
                    </div>',
        startImageRenderer: false,
        canvasImage: false,
        _selectors: {
            list: '.fileuploader-items-list',
            item: '.fileuploader-item',
            start: '.fileuploader-action-start',
            retry: '.fileuploader-action-retry',
            remove: '.fileuploader-action-remove'
        },
        onItemShow: function (item, listEl) {

            var plusInput = listEl.find('.fileuploader-thumbnails-input');

            plusInput.insertAfter(item.html);

            if (item.format == 'image') {
                item.html.find('.fileuploader-item-icon').hide();
                //CreditFilenames.push(item.name);
                CreditFilenames.push(item.name = item.name.replace(/ /g, ''));
                //if (CreditFileNames.indexOf(item.name) != -1)
                //    CreditFilenames.push(item.name);
            }
        }
    },
    onItemRemove: function (html) {

        html.children().animate({ 'opacity': 0 }, 200, function () {
            setTimeout(function () {
                html.slideUp(200, function () {
                    html.remove();
                });
            }, 100);
        });
    },
    afterRender: function (listEl, parentEl, newInputEl, inputEl) {

        var plusInput = listEl.find('.fileuploader-thumbnails-input'),
            api = $.fileuploader.getInstance(inputEl.get(0));

        plusInput.on('click', function () {
            api.open();
        });
    },
    onRemove: function (item, listEl, parentEl, newInputEl, inputEl) {
        var CreditID, CreditFrom;
        CreditFilenames.splice(CreditFilenames.indexOf(item.name), 1)
        if (CREREQID != "0" || CREREQID != "") {
            CreditID = CREREQID;
            CreditFrom = "CREREQ";
        }
        else {
            CreditID = CreditVETID;
            CreditFrom = "VET";
        }
        $.ajax({
            url: "DeleteCreditReq.aspx",
            type: 'post',
            data: { ID: CreditID, FileName: item.name, IDFrom: CreditFrom },
            success: function (response) {
            }
        });
        /*Remove image from table*/
        if (CREREQID != "0" || CREREQID != "") {
            $.ajax({
                type: 'POST',
                url: 'BloomService.asmx/RemoveCreditRequestPic',
                data: "{'ID':" + CREREQID + ",'VETID':" + CreditVETID + ",'FileName':'" + item.name + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (output, status) {
                }
            });
        }
        return true;
    },
    upload: {
        url: "UploadCreditReq.aspx",
        data: {},
        type: 'POST',
        enctype: "multipart/form-data",
        start: true,
        synchron: true,
        beforeSend: function (item, listEl, parentEl, newInputEl, inputEl) {
            if (CREREQID != "0" || CREREQID != "") {
                item.upload.data.ID = CREREQID;
                item.upload.data.IDFrom = "CREREQ"
            }
            else {
                item.upload.data.ID = CreditVETID;
                item.upload.data.IDFrom = "VET"
            }
            return true;
        },
        onSuccess: function (data, item) {

            $("#DivCreditGridDialog").next('div').find('.msgui').hide();
            setTimeout(function () {

                if (data == "Nil") {
                    item.remove();
                }
                else {
                    item.html.find('.progress-holder').hide();
                    item.renderImage();
                }

            }, 400);

        },
        onError: function (item) {
            item.html.find('.progress-holder').hide();
            item.html.find('.fileuploader-item-icon i').text('Failed!');

            setTimeout(function () {
                item.remove();
            }, 1500);
        },
        onProgress: function (data, item) {
            var progressBar = item.html.find('.progress-holder');

            if (progressBar.length > 0) {
                progressBar.show();
                progressBar.find('.fileuploader-progressbar .bar').width(data.percentage + "%");
            }
        },
        onComplete: function (listEl, parentEl, newInputEl, inputEl, jqXHR, textStatus) {
        }
    },
    dragDrop: {
        container: '.fileuploader-thumbnails-input'
    },
});

$("#txtCreditFuel,#txtCreditFreight,#txtCreditTaxes,#txtCreditPrice,#txtCreditUnits").change(function (event) {
    var TotalUnits = $("#txtCreditUnits").val() == "" ? $("#txtCreditUnits").attr("Placeholder") : $("#txtCreditUnits").val();
    var Price = $("#txtCreditPrice").val() == "" ? $("#txtCreditPrice").attr("Placeholder") : $("#txtCreditPrice").val();
    var Freight = $("#txtCreditFreight").val() == "" ? $("#txtCreditFreight").attr("Placeholder") : $("#txtCreditFreight").val();
    var Fuel = $("#txtCreditFuel").val() == "" ? $("#txtCreditFuel").attr("Placeholder") : $("#txtCreditFuel").val();
    var Taxes = $("#txtCreditTaxes").val() == "" ? $("#txtCreditTaxes").attr("Placeholder") : $("#txtCreditTaxes").val();
    if (TotalUnits != "" && Price != "" && Freight != "" && Fuel != "" && Taxes != "") {
        var amt = parseFloat(TotalUnits * Price).toFixed(2)
        var total = parseFloat(parseFloat(amt) + parseFloat(Freight) + parseFloat(Fuel) + parseFloat(Taxes)).toFixed(2);
        $("#txtCreditTotal").val(total);
    }
});


$("#msgbox-DivCreditGridDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    height: 150,
    width: 400,
    buttons: {
        Save: function (e) {

            //if ($("#txtCreditControl").val().trim() == "") {
            //    //GetControlNum($("#txtCreditControl").val());
            //}
            //else {
            SaveCreditDetails();
            //}
        },
        Cancel: function () {
            $(this).dialog("close");
        },
    },
    open: function (e) {
        $("#btnDivCreditGridDialog").addClass('dialogbuttonstyle icon-save');
        // $(".ui-dialog-buttonpane button:contains('Save')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        //$(this).siblings('.ui-dialog-buttonpane').find("button:contains('No')").focus();
    }
});

function SaveCreditDetails() {

    $("#DivCreditGridDialog").next('div').find('.msgui').hide();
    $("#DivCreditGridDialog").next('div').find(".msgui").css("width", '525px');
    var ControlNum = $("#SalesControlNum").html();
    var Id = $("#DivCreditGridDialog").data("InvID");
    var TotalUnits = ($("#txtCreditUnits").val() == "") ? $("#txtCreditUnits").attr('placeholder') : $("#txtCreditUnits").val();
    var Price = ($("#txtCreditPrice").val() == "") ? $("#txtCreditPrice").attr('placeholder') : $("#txtCreditPrice").val();
    var Freight = ($("#txtCreditFreight").val() == "") ? $("#txtCreditFreight").attr('placeholder') : $("#txtCreditFreight").val();
    var Fuel = ($("#txtCreditFuel").val() == "") ? $("#txtCreditFuel").attr('placeholder') : $("#txtCreditFuel").val();
    var Taxes = ($("#txtCreditTaxes").val() == "") ? $("#txtCreditTaxes").attr('placeholder') : $("#txtCreditTaxes").val();
    var CreditCode = $("#lstCreditCode")[0].value.split('~')[0].toString();
    var Reason = $("#txtCreditReason2").val();
    $("#msgbox-DivCreditGridDialog .ui-dialog-buttonpane div.dialogProgress").show();
    //$("#msgbox-DivCreditGridDialog .ui-dialog-buttonpane button:contains('Save')").attr("disabled", true).addClass("ui-state-disabled");
    $("#btnDivCreditGridDialog").attr("disabled", true).addClass("ui-state-disabled");

    $.ajax({
        type: 'POST',
        url: 'BloomService.asmx/SaveFarmCreditRequestDetails',
        data: "{'ID':'" + Id + "','TotalUnits':" + TotalUnits + ",'Price':" + Price + ",'Freight':" + Freight + ",'CreditCode':'" + CreditCode + "','Reason':'" + Reason + "','Control':" + ControlNum + ",'CreditFileNames':'" + CreditFilenames + "','CREREQID':'" + CREREQID + "','Fuel':'" + Fuel + "','Taxes':'" + Taxes + "','Screen':'" + tempscreen + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (output, status) {

            var res = output.d;
            if (parseInt(output.d) >= 0) {
                if (CREREQID == "0") {
                    $("#msg-CrePrev").dialog("close");
                    $("#msgbox-DivCreditGridDialog").dialog("close");
                    $("#DivCreditGridDialog").dialog("close");
                }
                else {
                    $("#msg-CrePrev").dialog("close");
                    $("#msgbox-DivCreditGridDialog").dialog("close");
                    $("#DivCreditGridDialog").dialog("close");
                }
                $(".ui-dialog-buttonpane div.dialogProgress").hide();
                $("#fgrdInventoryDetailbyFARM").flexReload({ url: '/url/for/refresh' });

            }
            else {
                $.MessageBox("OOPS! Something went wrong, please try again, we will research the issue.");
            }
        }
    });
}

$("#msg-CrePrev").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    buttons: {
        Ok: function () {
            $(this).dialog("close");
            if ($('#DivCreditGridDialog').dialog('isOpen') == true) {
                //$("#msgDivCreditGridDialoghtml").html("Credit amount is $" + delimitNumbers($("#txtCreditTotal").val()));
                //$("#msgbox-DivCreditGridDialog").dialog("open");
                SaveCreditDetails();
            }
        }
    },
    open: function () {
        $(".ui-dialog-buttonpane button:contains('Ok')").addClass('dialogbuttonstyle icon-save');
    }
});

$("#msgbox-CreditReq").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    height: 150,
    width: 400,
    buttons: {
        Yes: function () {

            var Id = $("#msgbox-CreditReq").data("inData")["Id"]
            var CredreqId = $("#msgbox-CreditReq").data("inData")["AlreadyApproved"]
            GetCreditRequestDetails(Id, CredreqId);
        },
        No: function () {
            //alert('c');
            $(this).dialog("close");
        }
    },
    open: function (e) {
        $(".ui-dialog-buttonpane button:contains('Yes')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('No')").addClass('dialogbuttonstyle icon-cancel');
        //$(this).siblings('.ui-dialog-buttonpane').find("button:contains('No')").focus();
    }
});
function ShowPreview(imgName) {

    //alert('hi');
    //$("#msgPrev").html("<img src=CreditRequestImages\'" + $("#divThumbPreview").find("img").attr("title") + "'/>");
    //$("#msg-CrePrev").dialog("open");
    window.open($("#" + imgName + "").find("img").attr("src"), '_blank');
}


$("#txtRackRange").mask("99-99");

$("#DivRackLabelDialog").dialog({
    autoOpen: false,
    title: "Rack Label",
    width: 230,
    height: 150,
    modal: true,
    resizable: false,
    buttons: {
        Print: function () {

            var Racktext = $("#txtRackText").val();
            var RackRange = $("#txtRackRange").val();
            if (Racktext.length < 1) {
                $("#txtRackText").focus();
                return false;
            }
            if (RackRange.length < 4) {
                $("#txtRackRange").focus();
                return false;
            }


            var w = window.open('GeneratingPDF.html');
            $.ajax({
                type: "POST",
                url: 'BloomService.asmx/PrintRackLabel',
                data: "{'RackText':'" + Racktext.toUpperCase() + "','RackRange':'" + RackRange.toUpperCase() + "'}",
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

                        //if (parseInt(Racktext2) + parseInt(3) > 99) {
                        //    Racktext2 = 01;
                        //}
                        //$("#txtRackLabel2").val(('0' + (parseInt(Racktext2) + parseInt(3))).slice(-2));
                        //$("#DivRackLabelDialog").dialog("close");
                    }
                }
            });
        },
        Cancel: function () {
            $(this).dialog("close");
        },
    },
    open: function (e) {
        $("#txtRackRange").val("01-03");
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
        //$(this).siblings('.ui-dialog-buttonpane').find("button:contains('Yes')").focus();
    }

});

$("#DialogBoxesReceived").dialog({
    autoOpen: false,
    title: "Boxes Received",
    width: 350,
    height: 200,
    modal: true,
    resizable: false,
    buttons: {
        Print: function () {
            $.ajax({
            type: "POST",
            url: 'BloomService.asmx/PrintBoxedReceivedToExcel',
            data: "{'FromDate':'" + $("#txtbrFromDate").val() + "','ToDate': '" + $("#txtbrToDate").val()+ "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (output) {
                if (output.d == "LogOut") {
                    window.location.href = "Login.aspx";
                }
                else if (output.d.indexOf("error") >= 0) {
                    $("#msgbox-select").dialog("close");
                    $.MessageBox(output.d.substring(5, output.d.length));
                }
                else if (output.d == "No Data") {
                    $.MessageBox("No data selected!");
                    w.close();
                }
                else {
                    debugger;
                    path = '<%=ConfigurationManager.AppSettings("XmlPath")%>' + '<%=ConfigurationManager.AppSettings("ExportFolder")%>' + '/' + output.d;
                    window.open(path);
                }

            }
            });
            $(this).dialog("close");
        },
        Cancel: function () {
            $(this).dialog("close");
        },
    },
    open: function (e) {
        $("#txtRackRange").val("01-03");
        $(".ui-dialog-buttonpane button:contains('Print')").addClass('dialogbuttonstyle icon-save');
        $(".ui-dialog-buttonpane button:contains('Cancel')").addClass('dialogbuttonstyle icon-cancel');
    }

});

$("#btnRackLabels").die("click").live("click", function () {
    $("#DivRackLabelDialog").dialog("open");
});

$("#btnBoxesReceivedLabels").die("click").live("click", function () {
    $("#DialogBoxesReceived").dialog("open");
});
$("#txtRackRange").keydown(function (e) {
    if (e.which == 13) {
        $("#DivRackLabelDialog").siblings('.ui-dialog-buttonpane').find("button:contains('Print')").focus();
        e.stopPropagation()
    }
});


$("#txtRackText").keypress(function (e) {
    if ($("#txtRackText").val().length == "1") {
        $("#txtRackRange").focus()
    }
});


/* 
-- Pricing :: 26Feb2020 :: Added focusout for PriceB&C
-- Pricing :: 26Feb2020 :: Added function for valid denomination
-- Pricing :: 28Feb2020 :: Added function for allowing only 2 decimal places on all PriceA,B &C
*/

function notZero(n) {
    n = +n;  // Coerce to number.
    if (!n) {  // Matches +0, -0, NaN
        return false;
    }
    return true;
}

$("[id^=editPriceB_").focusout().live('focusout', function () {

    var sourceCtl = $(this);
    var ID = sourceCtl.attr('id').split('_')[1];
    EditCtrlofPrices(sourceCtl, 'PriceB');
});

$("[id^=editPriceC_").focusout().live('focusout', function () {

    var sourceCtl = $(this);
    EditCtrlofPrices(sourceCtl, 'PriceC');
});

function isTwoDecimal(evt, element) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (
        (charCode != 45 || $(element).val().indexOf('-') != -1) && // “-” CHECK MINUS, AND ONLY ONE.
        (charCode != 46 || $(element).val().indexOf('.') != -1) && // “.” CHECK DOT, AND ONLY ONE.       
        ((charCode != 8 && charCode < 48) || charCode > 57))
        return false;
    try {
        var number = element.value.split('.');
        //just one dot 
        if (number[1].length >= 2) {
            return false;
        }
    }
    catch (e) {
    }
    return true;
}

// THE SCRIPT THAT CHECKS IF THE KEY PRESSED IS A NUMERIC OR DECIMAL VALUE.
function isNumberEntryByLength(evt, element, txtlength) {

    if (txtlength > 4)
        return false;
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (((charCode != 8 && charCode < 48) || charCode > 57))
        return false;
    return true;
}


//function isValidFlag(evt, element, txtlength) {
//    ////debugger;
//    if (txtlength > 0)
//        return false;
//    //// A=65, F=10, H=72, M=77, P=80, Q=81, S=83
//    //var flagarr = [];
//    //flagarr.push(65, 70, 72, 77, 80, 81, 83, 97, 102, 104, 109, 112, 113, 115);
//    //var charCode = (evt.which) ? evt.which : event.keyCode;
//    //if (flagarr.includes(charCode) == false)
//    //    return false;
//    //return true;
//    var currentkey = evt.key;
//    var invenflags = $("#divInvenFlagsFromtbltype").html();
//    invenflags = (((invenflags == undefined) || (invenflags == null)) ? "" : invenflags);
//    if (invenflags.toString().toLowerCase().includes(currentkey.toLowerCase()) == false) {
//        return false;
//    }
//    return true;
//}

$("[id^=editPriceA_").keypress().live('keypress', function () {

    return isTwoDecimal(event, this)
});

$("[id^=editPriceB_").keypress().live('keypress', function () {

    return isTwoDecimal(event, this)
});

$("[id^=editPriceC_").keypress().live('keypress', function () {

    return isTwoDecimal(event, this)
});

$("[id^=editCustNum_").keypress().live('keypress', function (event) {

    var EdtCustId = $(this)[0].id.replace("editCustNum_", "");
    var EdtCustVal = $("#editCustNum_" + EdtCustId + "").val();
    return isNumberEntryByLength(event, this, EdtCustVal.length);
});

function setValuestoTextboxonGrid(Id, columnno, txtval, txtvalfixed, inputtype) {
    txtvalfixed = (txtvalfixed == "" || txtvalfixed == undefined || txtvalfixed == 0) ? parseInt(1) : parseInt(txtvalfixed);
    inputtype = (inputtype == "" || inputtype == undefined || (inputtype.toLowerCase() != 'a'.toLowerCase() && inputtype.toLowerCase() != 'input[type=text]'.toLowerCase())) ? 'input[type=text]' : inputtype;
    if (inputtype.toLowerCase() == 'a'.toLowerCase()) {
        $("#fgrdInventoryPricing tr#row" + Id + "  td:eq(" + columnno + ")").find("div a")[0].innerText = parseFloat(txtval).toFixed(txtvalfixed);
    }
    else {
        $("#fgrdInventoryPricing tr#row" + Id + "  td:eq(" + columnno + ")").find("div input[type=text]")[0].placeholder = parseFloat(txtval).toFixed(txtvalfixed);
    }
    $("#fgrdInventoryPricing tr#row" + Id + " td:eq(" + columnno + ")").find('div')[0].style.textAlign = 'right';
}

$("[id^=editFlag_").keypress().live('keypress', function () {

    var EdtFlagId = $(this)[0].id.replace("editFlag_", "");
    var EdtFlagVal = $("#editFlag_" + EdtFlagId + "").val();
    $("#editFlag_" + EdtFlagId + "").val(EdtFlagVal.toUpperCase());
});

// Muthu Nivetha M :: 28Feb2020 :: Added :: To set PriceA, Calculate GPM,PriceB&C on both PriceA focusout and keydown
function EditCtrlofPrices(sourceCtl, isFrom, charCode) {

    var ID = '';
    ID = sourceCtl.attr('id').split('_')[1];
    if (isFrom != undefined && isFrom != '') {
        if (charCode != undefined && charCode != "" && charCode == 38) {
            if (ID != null && ID != '' && ID != undefined) {
                setFocusToPrevCtrl(isFrom, ID);
            }
        }
        else {
            switch (isFrom.toLowerCase()) {
                case 'pricea':
                    var priceA = sourceCtl.val() == "" ? sourceCtl.attr('placeholder') : sourceCtl.val();
                    CalculatePriceBandPriceCByPriceA(parseFloat(priceA).toFixed(2), ID, true, false)
                    priceA = parseFloat(sourceCtl.val() == "" || sourceCtl.val() == undefined ? sourceCtl.attr('placeholder') : sourceCtl.val()).toFixed(2);
                    sourceCtl.val(priceA);
                    break;
                case 'priceb':
                    var priceB = sourceCtl.val() == "" ? sourceCtl.attr('placeholder') : sourceCtl.val(), priceC = parseFloat(0).toFixed(2), priceA = parseFloat(0).toFixed(2);
                    priceA = $("#editPriceA_" + ID + "").val() == "" ? $("#editPriceA_" + ID + "").attr('placeholder') : $("#editPriceA_" + ID + "").val();
                    if (priceA == parseFloat(0).toFixed(2)) {
                        setValuestoTextboxonGrid(ID, parseInt(12), 0, 2, 'input[type=text]');
                    }
                    else {
                        priceC = $("#editPriceC_" + ID + "").val() == "" ? $("#editPriceC_" + ID + "").attr('placeholder') : $("#editPriceC_" + ID + "").val();
                        if (priceB == "" || priceB == "0.00" || priceB == "NaN") {
                            CalculatePriceBandPriceCByPriceA(parseFloat(priceA).toFixed(2), ID, true, false)
                        }
                        if (priceC == "" || priceC == "0.00" || priceC == "NaN") {
                            CalculatePriceBandPriceCByPriceA(parseFloat(priceA).toFixed(2), ID, false, true)
                        }
                        priceB = parseFloat(sourceCtl.val() == "" || sourceCtl.val() == undefined ? sourceCtl.attr('placeholder') : sourceCtl.val()).toFixed(2);
                        if (priceB == "NaN") {
                            priceB = 0
                        }
                        sourceCtl.val(priceB);
                    }
                    break;
                case 'pricec':
                    var priceC = sourceCtl.val() == "" ? sourceCtl.attr('placeholder') : sourceCtl.val(), priceA = parseFloat(0).toFixed(2);
                    priceA = $("#editPriceA_" + ID + "").val() == "" ? $("#editPriceA_" + ID + "").attr('placeholder') : $("#editPriceA_" + ID + "").val();
                    if (priceA == parseFloat(0).toFixed(2)) {
                        setValuestoTextboxonGrid(ID, parseInt(13), 0, 2, 'input[type=text]');
                    }
                    else {
                        if (priceC == "" || priceC == "0.00" || priceC == "NaN") {
                            CalculatePriceBandPriceCByPriceA(parseFloat(priceA).toFixed(2), ID, false, false, true)
                        }
                        priceC = parseFloat(sourceCtl.val() == "" || sourceCtl.val() == undefined ? sourceCtl.attr('placeholder') : sourceCtl.val()).toFixed(2);
                        if (priceC == "NaN") {
                            priceC = 0
                        }
                        sourceCtl.val(priceC);
                    }
                    break;
                case 'pflag':
                    UpdatePrice('Update', $(this));
                    break;
            }
            if (charCode != undefined && charCode != "" && charCode == 40) {
                if (ID != null && ID != '' && ID != undefined) {
                    setFocusToNextCtrl(isFrom, ID);
                }
            }
        }
    }
}

function setFocusToNextCtrl(isFrom, ID) {
    if (isFrom != undefined && isFrom != '') {
        switch (isFrom.toLowerCase()) {
            case 'pricea':
                $("#editPriceB_" + ID + "").focus();
                break;
            case 'priceb':
                $("#editPriceC_" + ID + "").focus();
                break;
            case 'pricec':
                $("#editCustNum_" + ID + "").focus();
                break;
            case 'cust#':
                $("#editCsHold_" + ID + "").focus();
                break;
            case 'cshold':
                $("#editFlag_" + ID + "").focus();
                break;
        }
    }
    else {
        $("#editPriceA_" + ID + "").focus();
    }
}

function setFocusToPrevCtrl(isFrom, ID) {
    if (isFrom != undefined && isFrom != '') {
        switch (isFrom.toLowerCase()) {
            case 'priceb':
                $("#editPriceA_" + ID + "").focus();
                break;
            case 'pricec':
                $("#editPriceB_" + ID + "").focus();
                break;
            case 'cust#':
                $("#editPriceC_" + ID + "").focus();
                break;
            case 'cshold':
                $("#editCustNum_" + ID + "").focus();
                break;
            case 'pflag':
                $("#editCsHold_" + ID + "").focus();
                break;
        }
    }
    else {
        $("#editPriceA_" + ID + "").focus();
    }
}

// Muthu Nivetha M :: 28Feb2020 :: Added :: To set PriceA, Calculate GPM,PriceB&C on PriceA keydown
$("[id^=editPriceA_").keydown().live('keydown', function () {

    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode == 40 || charCode == 13 || charCode == 38) {
        var sourceCtl = $(this);
        EditCtrlofPrices(sourceCtl, 'PriceA'.toLowerCase(), charCode);
    }
});

// Muthu Nivetha M :: 28Feb2020 :: Added :: To set PriceB on PriceB keydown and Enter
$("[id^=editPriceB_").keydown().live('keydown', function () {

    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode == 40 || charCode == 13 || charCode == 38) {
        var sourceCtl = $(this);
        EditCtrlofPrices(sourceCtl, 'PriceB'.toLowerCase(), charCode);
    }
});

// Muthu Nivetha M :: 28Feb2020 :: Added :: To set PriceC on PriceC keydown and Enter
$("[id^=editPriceC_").keydown().live('keydown', function () {

    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode == 40 || charCode == 13 || charCode == 38) {
        var sourceCtl = $(this);
        EditCtrlofPrices(sourceCtl, 'PriceC'.toLowerCase(), charCode);
    }
});

// Muthu Nivetha M :: 28Feb2020 :: Added :: To move Hold textbox on Hold keydown
$("[id^=editCustNum_").keydown().live('keydown', function () {

    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode == 40 || charCode == 13 || charCode == 38) {
        var sourceCtl = $(this);
        EditCtrlofPrices(sourceCtl, 'Cust#'.toLowerCase(), charCode);
    }
});

$("[id^=editCsHold_").keypress().live('keypress', function (event) {

    var EdtCsHoldId = $(this)[0].id.replace("editCsHold_", "");
    var EdtCsHoldVal = $("#editCsHold_" + EdtCsHoldId + "").val();
    return isNumberEntryByLength(event, this, EdtCsHoldVal.length);
});

// Muthu Nivetha M :: 28Feb2020 :: Added :: To move flag textbox on Hold keydown
$("[id^=editCsHold_").keydown().live('keydown', function () {

    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode == 40 || charCode == 13 || charCode == 38) {
        var sourceCtl = $(this);
        EditCtrlofPrices(sourceCtl, 'CsHold'.toLowerCase(), charCode);
    }
});

// Muthu Nivetha M :: 28Feb2020 :: Added :: To update pricedetails on Cust# keydown
$("[id^=editFlag_").keydown().live('keydown', function () {

    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode == 40 || charCode == 13 || charCode == 38) {
        var sourceCtl = $(this);
        EditCtrlofPrices(sourceCtl, 'PFlag'.toLowerCase(), charCode);
    }
});

function GetInvenFlagsFromtbltype() {
    //$.ajax({ //save date to the session 
    //    url: 'BloomService.asmx/GetInvenFlagsFromtbltype',
    //    type: 'POST',
    //    data: '',
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (output) {
    //        $("#divInvenFlagsFromtbltype").html(output.d);
    //    }
    //});
}

/* -- End Pricing */

</script>

<div id="SalesControlNum" style="display: none;"></div>
<div id="msgbox-DivCreditGridDialog" style="display: none;" title="Alert">
    <p id="msgDivCreditGridDialoghtml"></p>
</div>

<div id="msgbox-CreditReq" style="display: none;" title="Alert">
    <p id="msgCreditReqhtml"></p>
</div>
<div id="DivCreditGridDialog" style="display: none; max-height: 520px">
    <table style="width: 100%">
        <tr style="height: 20px">
            <td>Flower</td>
            <td colspan="5">
                <label id="lblCreditFlowerCode"></label>
                &nbsp;&nbsp;&nbsp;&nbsp; 
                <label id="lblCreditFlowerName"></label>
            </td>
        </tr>
        <tr style="height: 20px">
            <td>Farm</td>
            <td colspan="5">
                <label id="lblCreditFarmCode"></label>
                &nbsp;&nbsp;&nbsp;&nbsp; 
                <label id="lblCreditFarmName"></label>
            </td>
        </tr>
        <tr style="height: 20px" id="trCreditLot">
            <td>Lot#</td>
            <td style="width: 250px;">
                <label id="lblCreditAwb"></label>
            </td>
            <td style="width: 100px">Farm Invoice</td>
            <td style="width: 50px">
                <label id="lblCreditInvoice"></label>
            </td>
            <td style="width: 50px;">PO#</td>
            <td>
                <label id="lblCreditPO"></label>
            </td>
        </tr>
        <tr style="height: 20px" id="trCreditDaterec">
            <td>Date Received</td>
            <td>
                <label id="lblCreditRecdate"></label>
            </td>
            <td>Days fresh</td>
            <td>
                <label id="lblCreditDaysFresh"></label>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr id="trCreditSold" style="height: 115px;">
            <td colspan="2" style="vertical-align: top;">
                <fieldset id="fsSold" style="width: 280px;">
                    <legend id="lgSold" style="font-size: large; background: white;">Sold</legend>

                    <div id="DivSoldDetails" style="float: left">
                        <table id="tblSoldDetails">
                            <tr style="height: 20px;">
                                <td style="padding-right: 25px; color: magenta;">Total Boxes</td>
                                <td style="text-align: right; width: 5px">
                                    <label id="lblSoldTotalBoxes" style="text-align: right"></label>
                                </td>
                                <td style="width: 5px;">
                                    <label id="lblSoldUOM"></label>
                                </td>
                                <td style="width: 5px;">&nbsp;X&nbsp;</td>
                                <td>
                                    <label id="lblSoldUnitsPerBox" style="text-align: right"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Total Units</td>
                                <td colspan="4">
                                    <input type="text" id="txtSoldTotalUnits" style="text-align: right" disabled />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Price/Unit</td>
                                <td colspan="4">
                                    <input type="text" id="txtSoldPricePerUnit" style="text-align: right" disabled />
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </td>
            <td colspan="4">
                <fieldset id="fsCredit" style="float: left; width: 280px;">
                    <legend id="lgCredit" style="font-size: large; background: white;">To Credit</legend>

                    <div id="DivCreditDetails" style="float: left">
                        <table id="tblCreditDetails">
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Units</td>
                                <td>
                                    <input type="text" id="txtCreditUnits" style="text-align: right" class="NegativeNumbers" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Price</td>
                                <td>
                                    <input type="text" id="txtCreditPrice" style="text-align: right" class="DecimalsOnly" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Freight</td>
                                <td>
                                    <input type="text" id="txtCreditFreight" style="text-align: right" class="NegativDecimals" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Fumigation</td>
                                <td>
                                    <input type="text" id="txtCreditFuel" style="text-align: right" class="NegativDecimals" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 25px; color: magenta;">Duties</td>
                                <td>
                                    <input type="text" id="txtCreditTaxes" style="text-align: right" class="NegativDecimals" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 25px">
            <td>Control #</td>
            <td>
                <input type="text" id="txtCreditControl" style="margin-top: 1px;" class="NumbersOnly" /></td>
            <td colspan="4">
                <label style="margin-left: 13px;">Total</label>
                <input type="text" id="txtCreditTotal" style="margin-top: 1px; margin-left: 35px; text-align: right" disabled>
            </td>
        </tr>
        <tr style="height: 35px">
            <td>Credit Code</td>
            <td style="vertical-align: top;" id="tdCreditCode">
                <%--<select id="lstCreditCode" style="width: 200px;"></select>--%>
                <select id="lstCreditCode" style="width: auto;" class="searchplaceholder" />
                <input type="hidden" id="hfCreditCode" />
            </td>
            <td colspan="4"></td>
        </tr>
        <tr style="height: 25px">
            <td style="width: 130px">Reason</td>
            <td colspan="5">
                <%--<input type="text" id="txtCreditReason1" style="width: 330px; margin-top: 3px;" readonly="readonly" />--%>
                <textarea id="txtCreditReason2" style="margin-top: 3px; height: 90px; width: 330px;" cols="60" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <input type="file" id="fileuploader3" name="files">
            </td>
        </tr>
    </table>
</div>

<%-- VEN::04-Nov-2015:: To change date session for based on tab selection --%>
<div id="divInvenFlagsFromtbltype" style="display: none"></div>
